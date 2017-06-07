%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <雨墨>
%%% @doc
%%% 专门用一个模块来处理roleKeyInfo数据
%%% @end
%%% Created : 27. 九月 2016 11:59
%%%-------------------------------------------------------------------
-module(publicDataMgrRKILogic).
-author("tiancheng").

-include("gsInc.hrl").
-include("playerPropSyncDefine.hrl").

%% API
-export([
    dealRoleKeyInfoData/1
]).

dealRoleKeyInfoData([]) ->
    ok;
dealRoleKeyInfoData({RoleInfoList, RoleCoinInfoList, PropInfoList, PetInfoList, PraiseInfoList, PetManorInfoList, WarriorList}) ->
    %% 临时数据插入ETS
	%% 这个不能放在其它进程中处理，不然会有并发的问题
    insert_RoleKeyInfoToETS(RoleCoinInfoList, PropInfoList, PetInfoList, PraiseInfoList, PetManorInfoList, WarriorList),

    %% 关键数据插入内存数据库
    Len = erlang:length(RoleInfoList),
    ?LOG_OUT("roleKeyInfofastDeal insert main key:Len=~p", [Len]),

	Ets = publicDataMgrState:getRoleKeyInfoTempEts(),

	Fun =
		fun(Key, {AccLen, AccList}) ->
			#recRoleKeyInfo{roleID = RoleID, roleName = RoleName} = Key,
			Name = case erlang:is_binary(RoleName) of
					   true -> erlang:binary_to_list(RoleName);
					   false -> RoleName
				   end,
			%% 添加到ETS
			RRole = #?RoleKeyRec{
				roleID          = RoleID,
				roleName        = Name,
				accountID       = Key#recRoleKeyInfo.accountID,
				career          = Key#recRoleKeyInfo.career,
				head            = Key#recRoleKeyInfo.head,
				sex             = Key#recRoleKeyInfo.sex,
				race            = Key#recRoleKeyInfo.race,
				level 			= Key#recRoleKeyInfo.level,
				exp    			= Key#recRoleKeyInfo.exp,
				reputation      = Key#recRoleKeyInfo.reputation,
				achieve         = Key#recRoleKeyInfo.achieve,
				lastUpdateTime  = time:getSyncTime1970FromDBS()
			},
			ets:insert(ets_rolekeyinfo, RRole),

			case AccList of
				[] ->
					{AccLen - 1, [RRole]};
				_ ->
					case AccLen rem 2000 of
						0 ->
							?LOG_OUT("[pid=~p] write RoleKeyInfo residual:~p/~p",[self(), AccLen, Len]),
							%% 分配一个处理其它信息的进程
							spawnRoleKeyInfofastDeal(Ets, AccList),
							{AccLen - 1, [RRole]};
						_ ->
							{AccLen - 1, [RRole | AccList]}
					end
			end
		end,
%%	erlang:spawn(
%%		fun() ->
%%			{_, SXRoleList} = lists:foldl(Fun, {Len, []}, RoleInfoList),
%%			spawnRoleKeyInfofastDeal(Ets, SXRoleList)
%%		end
%%	),
	%% 这个必须要放在主进程中处理，因为后续的加载，需要等待rolekeyinfo中的数据
	{_, SXRoleList} = lists:foldl(Fun, {Len, []}, RoleInfoList),
	spawnRoleKeyInfofastDeal(Ets, SXRoleList),
    ok.

spawnRoleKeyInfofastDeal(_Ets, []) ->
    ok;
spawnRoleKeyInfofastDeal(Ets, RoleKeyList) ->
    roleKeyInfofastDeal2(RoleKeyList, Ets),
    ok.

roleKeyInfofastDeal2(RoleKeyList, Ets) ->
    Len = erlang:length(RoleKeyList),
    ?LOG_OUT("[pid=~p] write roleKeyInfofastDeal2:~p start...",[self(), Len]),
    Fun =
        fun(#?RoleKeyRec{roleID = RoleID} = Rec) ->
            Key1 = {temp_RoleKeyInfo_Prop,RoleID,?PriProp_PlayerForce},
            PlayerForce =
                case ets:lookup(Ets, Key1) of
                    [{_, #rec_player_prop{propValue = PF}}] ->
                        ets:delete(Ets, Key1),
                        erlang:binary_to_integer(PF);
                    _ -> 0
                end,
            Key2 = {temp_RoleKeyInfo_Prop,RoleID,?PriProp_PlayerKpNum},
            KillValue =
                case ets:lookup(Ets, Key2) of
                    [{_, #rec_player_prop{propValue = PlayerKillValue}}] ->
                        ets:delete(Ets, Key2),
                        erlang:binary_to_integer(PlayerKillValue);
                    _ -> 0
                end,
            Key3 = {temp_RoleKeyInfo_PetInfo, RoleID},
            {PetID, PetForce} =
                case ets:lookup(Ets, Key3) of
                    [{_,#rec_pet_info{force = F, petID = I}}] ->
                        ets:delete(Ets, Key3),
                        {I, F};
                    _ -> {0, 0}
                end,
            Key4 = {temp_RoleKeyInfo_Praise,RoleID},
            Praise =
                case ets:lookup(Ets, Key4) of
                    [{_,#recRolePraise{praiseNum = PraiseNum}}] ->
                        ets:delete(Ets, Key4),
                        PraiseNum;
                    _ -> 0
                end,
            Key5 = {temp_RoleKeyInfo_Coin, RoleID,?CoinTypeGold},
            Gold =
                case ets:lookup(Ets, Key5) of
                    [{_,#rec_player_coin{coinNumber = CoinNumber}}] ->
                        ets:delete(Ets, Key5),
                        CoinNumber;
                    _ -> 0
                end,
            Key6 = {temp_RoleKeyInfo_PetManor,RoleID},
            PvpIntegral =
                case ets:lookup(Ets, Key6) of
                    [{_,#rec_pet_manor_battle{save_time = SaveTime, pet_integral = Integral}}] ->
                        ets:delete(Ets, Key6),
                        {SaveTime, Integral};
                    _ ->
                        {0, 0}
                end,
            Key7 = {temp_RoleKeyInfo_Warrior,RoleID},
            {WTPhase, WTPhaseTime} =
                case ets:lookup(Ets, Key7) of
                    [#rec_warrior_trial{tswkTrialSchedule = T1, tswkTrialTime = T2}] ->
                        ets:delete(Ets, Key7),
                        {T1, T2};
                    _ -> {0, 0}
                end,
            Key8 = {temp_RoleKeyInfo_Prop,RoleID,?SerProp_PlayerHistoryForce},
            PlayerMaxForce =
                case ets:lookup(Ets, Key8) of
                    [{_, #rec_player_prop{propValue = PFFF}}] ->
                        ets:delete(Ets, Key8),
                        erlang:binary_to_integer(PFFF);
                    _ -> 0
                end,

            %% 添加到内存数据库
            RRole = Rec#?RoleKeyRec{
                gold 			= Gold,
                kpNum			= KillValue,
                playerForce     = PlayerForce,
                petForce        = PetForce,
                maxForce        = PlayerMaxForce,
                petID           = PetID,
                pvpIntegral     = PvpIntegral,
                praise          = Praise,
                wtPhase         = WTPhase,
                wtPhaseTime     = WTPhaseTime
            },

            %% 插入内存数据库
            ets:insert(ets_rolekeyinfo, RRole)
        end,
    lists:foreach(Fun, RoleKeyList),
    ?LOG_OUT("[pid=~p] write roleKeyInfofastDeal2 end!",[self()]),
    ok.

insert_RoleKeyInfoToETS(RoleCoinInfoList, PropList, PetList, PraiseInfoList, PetManorInfoList, WarriorList) ->
    ?LOG_OUT("insert_RoleKeyInfoToETS start... ~p",
        [{length(RoleCoinInfoList), length(PropList), length(PetList), length(PraiseInfoList), length(PetManorInfoList), length(WarriorList)}]),
    Ets = publicDataMgrState:getRoleKeyInfoTempEts(),

    F1 =
        fun(#rec_player_coin{roleID = RID, coinType = CoinType} = V) ->
            ets:insert(Ets, {{temp_RoleKeyInfo_Coin,RID,CoinType}, V})
        end,
    lists:foreach(F1, RoleCoinInfoList),

    F2 =
        fun(#rec_player_prop{roleID = RID,propIndex = Index} = V) ->
            ets:insert(Ets, {{temp_RoleKeyInfo_Prop,RID,Index}, V})
        end,
    lists:foreach(F2,PropList),

    F3 =
        fun(#rec_pet_info{roleID = RID} = V) ->
            ets:insert(Ets, {{temp_RoleKeyInfo_PetInfo, RID}, V})
        end,
    lists:foreach(F3,PetList),

    F4 =
        fun(#recRolePraise{roleID = RID} = V) ->
            ets:insert(Ets, {{temp_RoleKeyInfo_Praise,RID}, V})
        end,
    lists:foreach(F4,PraiseInfoList),

    F5 =
        fun(#rec_pet_manor_battle{roleID = RID} = V) ->
            ets:insert(Ets, {{temp_RoleKeyInfo_PetManor,RID}, V})
        end,
    lists:foreach(F5,PetManorInfoList),

    F6 =
        fun(#rec_warrior_trial{roleID = RID} = V) ->
            ets:insert(Ets, {{temp_RoleKeyInfo_Warrior,RID}, V})
        end,
    lists:foreach(F6,WarriorList),
    ?LOG_OUT("insert_RoleKeyInfoToETS end..."),
    ok.