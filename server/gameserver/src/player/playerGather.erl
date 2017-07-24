%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 真正的采集模块（采集后获得掉落物品）
%%% @end
%%% Created : 24. 一月 2015 10:29
%%%-------------------------------------------------------------------
-module(playerGather).
-author("tiancheng").

-include("playerPrivate.hrl").

%% API
-export([
	requestGatherItem/2,
	requestGatherItemAck/1,
	gatherSuccess/1
]).

%% 采集物品
-spec requestGatherItem(Code::uint(), NpcID::uint()) -> ok.
requestGatherItem(Code, GatherID) ->
	case canGatherItem(Code, GatherID) of
		true ->
			%% 可以采集
			MapPID = playerState:getMapPid(),
			psMgr:sendMsg2PS(MapPID, requestGatherItem, {Code, GatherID});
		{false,none}-> skip;
		{false,ErrorCode} ->
			%% 采集对象不存在
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok.
%%判断当前道具是否可以被采集
%%@return true|{false,none}|{false,ErrorCode}
canGatherItem(Code, GatherID) ->
	GroupID = playerState:getGroupID(),
	case myEts:lookUpEts(playerState:getMapCollectEts(), Code) of
		[#recMapObject{id = GatherID, groupID = GroupID, hp = HP, maxHp = MaxHP, x = TX, y = TY}] when HP > 0 orelse MaxHP =:= 0 ->
			%% 如果是守卫碧空城，是否能采集
			Ret1 = canCityMonsterGather(GatherID),
			RetDistance = checkDistance(playerState:getPos(),{TX, TY}),
			{SX,SY} =   playerState:getPos(),
			?DEBUG_OUT("gatheritem----> ~n~n id = ~p, code = ~p, pos=~p,me=~p,disSqure=~p",
				[GatherID, Code, {TX,TY}, playerState:getPos(), misc:calcDistSquare(SX,SY, TX, TY)]),
			ActionStatus = playerState:getActionStatus(),
			if
				ActionStatus =:= ?CreatureActionStatusDead ->
					{false,?ErrorCode_SystemGatherStateError};
				RetDistance =:= false ->
					{false,?ErrorCode_SystemGatherTooFar};
				true ->
					Ret1
			end;
		_ ->
			{false,?ErrorCode_SystemGatherFailed}
	end.

checkDistance({SX, SY}, {TX, TY})
	when is_number(SX) andalso is_number(SY) andalso is_number(TX) andalso is_number(TY)->
	DistSquare = misc:calcDistSquare(SX,SY, TX, TY),
	DistSquare =< ?TalkToNpc_Distance * ?TalkToNpc_Distance;
checkDistance(_, _) ->
	false.


%% 请求采集结果
-spec requestGatherItemAck({false | uint(), {uint(), uint()}}) -> ok.
requestGatherItemAck({false, {_Code, GatherID}}) ->
	playerGuildBattle:gatherFailed(GatherID),
	ok;
requestGatherItemAck({GatherID, {_Code, _}}) ->
	%% 守卫碧空城采集成功
	cityMonsterGatherSuccess(GatherID),

	%% 混沌战场采集成功
	hdBattleGroundGatherSuccess(GatherID),
	
	%%跨服混沌战场
	crosHdBattleGatherSuccess(GatherID),
	
	%%跨服竞技场
	crosArenaBattleMap2GatherSuccess(GatherID),
	
	%%跨服竞技场
	crosArenaBattleMap3GatherSuccess(GatherID),

	%% 沙盘PVP采集
	playerGuildExpedition:gatherSuccess(GatherID),

	%% 跨服骑宠竞速：采集成功
	playerRace:gatherSuccess(GatherID),

    %% 军团战采集
    playerGuildBattle:gatherSuccess(GatherID),

	playerTask:updateTask(?TaskSubType_CollectItem, GatherID),

	%% 家族系统-堆雪人活动-采集成功
	playerGuildSnowman:gatherSuccess(GatherID),

	%% 副本地表BUFF采集物
	playerCopyMap:gatherSuccessCopyBuff(GatherID),

	%% 采集掉落
	case getCfg:getCfgPStack(cfg_object, GatherID) of
		#objectCfg{dropid = 0} ->
			skip;
		#objectCfg{dropid = DropID} ->
			?DEBUG_OUT("~p.~w requestGatherItemAck ~p", [?MODULE, ?LINE, DropID]),
			playerDrop:goodsDrop(DropID, GatherID, ?ItemSourceNormalCollect);
		_ ->
			skip
	end,
	
	%%采集成就
	if
		GatherID =:= ?AcUseItemID9 ->
			playerAchieve:achieveEvent(?Achieve_Act_Event15, [1]);
		true ->
			skip
	end,
	ok.

%% 采集掉落成功
-spec gatherSuccess(Goods::[#rec_item{},...] | [#recSaveEquip{},...]) -> ok.
gatherSuccess(Goods) ->
	?DEBUG_OUT("gatherSuccess:~p,~p", [playerState:getRoleID(),Goods]),
	ok.

%% 混沌战场采集成功
hdBattleGroundGatherSuccess(GatherID) ->
	case playerState:getMapID() =:= ?HDBattleMapID of
		true ->
			core:sendMsgToActivity(?ActivityType_HDBattle, hdbattleGatherSuccess, {playerState:getRoleID(), GatherID}),
			ok;
		_ ->
			skip
	end,
	ok.


%%跨服混沌战场采集成功
crosHdBattleGatherSuccess(GatherID) ->
	case playerState:getMapID() =:= ?CrosHdBattleMapID of
		true ->
			RoleID = playerState:getRoleID(),
			MapPid = playerState:getMapPid(),
			[RedGatherID, BlueGatherID] = globalCfg:getBattleWarObject(),
			case playerState:getCamp() of
				?CampRedBattle ->
					case GatherID =:= RedGatherID of
						true ->
							psMgr:sendMsg2PS(?PsNameCrosHd, collectBox, {MapPid, RoleID});
						_ ->
							skip
					end;
				?CampBlueBattle ->
					case GatherID =:= BlueGatherID of
						true ->
							psMgr:sendMsg2PS(?PsNameCrosHd, collectBox, {MapPid, RoleID});
						_ ->
							skip
					end;					
				_ ->
					skip
			end;
		_ ->
			skip
	end.

%%跨服竞技场宝箱采集
crosArenaBattleMap2GatherSuccess(GatherID) ->
	MapID = playerState:getMapID(),
	Level = playerState:getLevel(),
	case MapID =:= ?CrosArenaMapID2 of
		true ->
			case getCfg:getCfgPStack(cfg_object, GatherID) of
				#objectCfg{param1 = BuffID} ->
					#buffCfg{buffName = Name} = getCfg:getCfgPStack(cfg_buff, BuffID),
					playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaGatherBuff, [Name]),
					playerBuff:addBuff(BuffID, Level);
				_ ->
					skip
			end;
		_ ->
			skip
	end.

%%跨服竞技场大炮
crosArenaBattleMap3GatherSuccess(GatherID) ->
	MapID = playerState:getMapID(),
	case MapID =:= ?CrosArenaMapID3 of
		true ->
			case getCfg:getCfgPStack(cfg_object, GatherID) of
				#objectCfg{param1 = PcHurt} ->
					Camp = playerState:getCamp(),
					NetPid = playerState:getNetPid(),
					MapPid = playerState:getMapPid(),
					RoleID = playerState:getRoleID(),
					psMgr:sendMsg2PS(?PsNameCrosArena, gatherHurt, {Camp, PcHurt, MapPid, RoleID, NetPid});
				_ ->
					skip
			end;
		_ ->
			skip
	end.

%% 守卫碧空城采集成功
cityMonsterGatherSuccess(GatherID) ->
	L = getCityMonsterCollectID(),
	case lists:member(GatherID, L) of
		true ->
			%% 完成一次守卫碧空城的采集
			playerAchieve:achieveEvent(?Achieve_BlueSkyCity, [1]),
			playerDaily:incDailyCounter(?DailyType_CollectItemTimes, GatherID);
		_ ->
			skip
	end,
	ok.

%% 判断是否是守卫碧空城的活动宝箱

canCityMonsterGather(NpcID) ->
	L = getCityMonsterCollectID(),
	case lists:member(NpcID, L) of
		true ->
			%% 是活动采集，需要判断采集次数
			case playerDaily:getDailyCounter(?DailyType_CollectItemTimes, NpcID) > 0 of
				true ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_ActivityCityMonsterAlreadyCollect),
					{false,none};
				_ ->
					%% 判断等级是否满足
					case getCfg:getCfgPStack(cfg_globalsetup, defendcity_level) of
						#globalsetupCfg{setpara = [Lvl]} ->
							case playerState:getLevel() >= Lvl of
								true ->
									true;
								_ ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_ActivityCityMonsterCollectLevelLower, [Lvl]),
									{false,none}
							end;
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_ActivityCityMonsterAlreadyCollect),
							{false,none}
					end
			end;
		_ ->
			true
	end.

%%% 判断是否是婚礼现场的糖果
%-spec canWeddingSiteGather(RetIn::boolean()) -> RetOut::boolean().
%canWeddingSiteGather(RetIn) ->
%	case RetIn of
%		true ->
%			case getCfg:getCfgPStack(cfg_mapsetting, playerState:getMapID()) of
%				#mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeWeddingSite} ->
%					case playerPackage:getBagIdleSlotNum(?Item_Location_Bag) > 0 of
%						true ->
%							true;
%						_ ->
%							playerMsg:sendErrorCodeMsg(?ErrorCode_Marriage_WS_CannotGetCandy),
%							false
%					end;
%				_ ->
%					RetIn
%			end;
%		_ ->
%			RetIn
%	end.

%% 获取守卫碧空城的活动采集对象列表
getCityMonsterCollectID() ->
	#activityCfg{mapidlist = MapIDList} = getCfg:getCfgPStack(cfg_activity, ?ActivityType_CityMonster),
	MapID = playerState:getMapID(),
	case lists:member(MapID, MapIDList) of
		true ->
			case getCfg:getCfgPStack(cfg_globalsetup, defendcity_chest) of
				#globalsetupCfg{setpara = [ChaosID]} ->
					case getCfg:getCfgPStack(cfg_chaos, ChaosID) of
						#chaosCfg{monsterIdList = CollectIDList} ->
							CollectIDList;
						_ ->
							[]
					end;
				_ ->
					[]
			end;
		_ ->
			[]
	end.