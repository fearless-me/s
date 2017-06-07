%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20170227
%%%-------------------------------------------------------------------
-module(acSpiritAreaState).
-author("meitianyang").

-include("acSpiritAreaPrivate.hrl").

%% API
-compile(export_all).

%%% ====================================================================
%%% 活动地图管理
%%% ====================================================================

%%% --------------------------------------------------------------------
%% 初始化地图ETS
-spec initMapInfoEts() -> ok.
initMapInfoEts() ->
	ets:new(?EtsMapInfo, [private, named_table, set, {keypos, #recMapInfo.ownerID}, {write_concurrency, true}, {read_concurrency, true}]),
	ets:new(?EtsMapPid2MapInfo, [private, named_table, set, {keypos, #recMapPid2MapInfo.mapPid}, {write_concurrency, true}, {read_concurrency, true}]),
	ok.

%%% --------------------------------------------------------------------
%% 覆写地图数据
-spec replaceMapInfo(MapInfo::#recMapInfo{}) -> ok.
replaceMapInfo(#recMapInfo{mapPid = undefined} = MapInfo) ->
	ets:insert(?EtsMapInfo, MapInfo),
	ok;
replaceMapInfo(#recMapInfo{mapPid = MapPid, ownerID = OwnerID} = MapInfo) ->
	ets:insert(?EtsMapInfo, MapInfo),
	ets:insert(?EtsMapPid2MapInfo, #recMapPid2MapInfo{mapPid = MapPid, ownerID = OwnerID}),
	ok.

%%% --------------------------------------------------------------------
%% 删除地图数据
-spec deleteMapInfo(#recMapInfo{} | pid() | type_Owner()) -> ok.
deleteMapInfo(#recMapInfo{mapPid = MapPid, ownerID = OwnerID}) ->
	ets:delete(?EtsMapInfo, OwnerID),
	ets:delete(?EtsMapPid2MapInfo, MapPid),
	ok;
deleteMapInfo(MapPid) when erlang:is_pid(MapPid) ->
	case getMapInfoByMapPid(MapPid) of
		#recMapInfo{ownerID = OwnerID} ->
			ets:delete(?EtsMapInfo, OwnerID),
			ets:delete(?EtsMapPid2MapInfo, MapPid);
		_ ->
			skip
	end,
	ok;
deleteMapInfo(OwnerID) ->
	case getMapInfoByOwnerID(OwnerID) of
		#recMapInfo{mapPid = MapPid} ->
			ets:delete(?EtsMapInfo, OwnerID),
			ets:delete(?EtsMapPid2MapInfo, MapPid);
		_ ->
			skip
	end,
	ok.

%%% --------------------------------------------------------------------
%% 使用所有者ID查找地图数据
-spec getMapInfoByOwnerID(OwnerID::type_Owner()) -> #recMapInfo{} | undefined.
getMapInfoByOwnerID(0) ->
	undefined;
getMapInfoByOwnerID({0, 0}) ->
	undefined;
getMapInfoByOwnerID(OwnerID) ->
	case ets:lookup(?EtsMapInfo, OwnerID) of
		[#recMapInfo{} = Rec] ->
			Rec;
		_ ->
			undefined
	end.

%%% --------------------------------------------------------------------
%% 使用MapPid查找地图数据
-spec getMapInfoByMapPid(MapPid::pid()) -> #recMapInfo{} | undefined.
getMapInfoByMapPid(MapPid) ->
	case ets:lookup(?EtsMapPid2MapInfo, MapPid) of
		[#recMapPid2MapInfo{ownerID = OwnerID}] ->
			getMapInfoByOwnerID(OwnerID);
		_ ->
			undefined
	end.

%%% --------------------------------------------------------------------
%% 辅助：使用角色ID查找队伍ID
%%-spec getTeamIDByRoleID(RoleID::uint64()) -> uint64().
%%getTeamIDByRoleID(RoleID) -> teamInterface:get
%%	case teamLogic2:getTeamMemberInfo(RoleID) of
%%		[#recTeamMemberInfo{teamID = TeamID}] ->
%%			TeamID;
%%		_ ->
%%			0
%%	end.

%%% --------------------------------------------------------------------
%% 使用角色ID查找地图数据
-spec getMapInfoByRoleID(RoleID::uint64()) -> #recMapInfo{} | undefined.
getMapInfoByRoleID(RoleID) ->
	case teamInterface:getTeamID(RoleID) of
		0 ->
			getMapInfoByOwnerID({0, RoleID});
		TeamID ->
			getMapInfoByOwnerID(TeamID)
	end.

%%% --------------------------------------------------------------------
%% 获得所有地图信息列表
-spec getMapInfoList() -> [#recMapInfo{}, ...].
getMapInfoList() ->
	FunGet =
		fun(#recMapInfo{} = Rec, R) ->
			[Rec | R]
		end,
	ets:foldl(FunGet, [], ?EtsMapInfo).

%%% ====================================================================
%%% 各种配置
%%% ====================================================================

%%% --------------------------------------------------------------------
%% 活动总时长
configTimeAll() ->
	#globalsetupCfg{setpara = [Sec]} =
		getCfg:getCfgPStack(cfg_globalsetup, spiritArea_TimeAll),
	Sec.

%%% --------------------------------------------------------------------
%% 首次进入的等待时间
configTimeReady() ->
	#globalsetupCfg{setpara = [Sec]} =
		getCfg:getCfgPStack(cfg_globalsetup, spiritArea_TimeReady),
	Sec.

%%% --------------------------------------------------------------------
%% 波次间隔等待时间
configTimeWait() ->
	#globalsetupCfg{setpara = [Sec]} =
		getCfg:getCfgPStack(cfg_globalsetup, spiritArea_TimeWait),
	Sec.

%%% --------------------------------------------------------------------
%% 根据指定等级查找最为匹配的配置键值1
configKey1ByLevel(RoleLevel) ->
	ListKey1 = getCfg:get1KeyList(cfg_spiritArea),
	FunFind =
		fun(Key1, {_, Key1Last}) ->
			case RoleLevel >= Key1 of
				true ->
					{false, Key1};
				_ ->
					{true, Key1Last}
			end
		end,
	{_, Key1} = misc:foldlEx(FunFind, {false, 0}, ListKey1),
	Key1.

%%% --------------------------------------------------------------------
%% 根据指定等级段、指定波次，获取需要创建的怪物对象数据
configMonster(Level, Wave, MapPid) ->
	case getCfg:getCfgByKey(cfg_spiritArea, Level, Wave) of
		#spiritAreaCfg{monster1 = LM1, monster2 = LM2, monster3 = LM3} ->
			FunRand =
				fun
					({_, _, Rate, _, _} = Data, {_, {RateAcc, Rand, Result}}) ->
						RateAccNew = Rate + RateAcc,
						case Rand < RateAccNew of
							true ->
								{true, {RateAccNew, Rand, Data}};
							_ ->
								{false, {RateAccNew, Rand, Result}}
						end;
					(_, _) ->
						%% 配置空或配置错误
						{true, {0, 0, 0}}
				end,
			{_, {_, _, M1}} = misc:foldlEx(FunRand, {false, {0, misc:rand(0, 9999)/10000, 0}}, LM1),
			{_, {_, _, M2}} = misc:foldlEx(FunRand, {false, {0, misc:rand(0, 9999)/10000, 0}}, LM2),
			{_, {_, _, M3}} = misc:foldlEx(FunRand, {false, {0, misc:rand(0, 9999)/10000, 0}}, LM3),
			FunCreate =
				fun
					(0, R) ->
						R;
					({MonsterID, Count, _, X, Y}, R) ->
						lists:foldl(
							fun(_, R_) ->
								Arg =
									#recSpawnMonster{
										id      = MonsterID,
										mapID   = ?SpiritAreaMapID,
										mapPid  = MapPid,
										x       = erlang:float(X),
										y       = erlang:float(Y),
										groupID = 0
									},
								[{Arg, 0, 0, 0} | R_]
							end,
							R,
							lists:seq(1, Count)
						)
				end,
			lists:foldl(FunCreate, [], [M1, M2, M3]);
		_ ->
			[]
	end.
