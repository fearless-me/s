%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 混沌战场逻辑处理
%%% @end
%%% Created : 13. 一月 2015 19:50
%%%-------------------------------------------------------------------
-module(acHDBattlegroundLogic).
-author("tiancheng").

-include("../../activityPrivate.hrl").
-include("acHDBattlegroundPrivate.hrl").
-include("../activityPhaseDefine.hrl").

%% API
-export([
	init/0,
	activityChangeCallBack/1,
	requestJoinHDBattle/1,
	requestHDKillRank/1,
	updateInfo/1,
	delApplyPlayer/1,
	hDPlayerWaitJoinBattle/0,
	hDBattleFreshMonster/0,
	createHDBattleMapAck/1,
	sendTipsToAllPlayer/1,
	playerDead/1,
	killedTarget/1,
	hdbattleGatherSuccess/1,
	addHonor/3,
	monsterDamageAdd/1,
	monsterDead/1,
	delHDBattleHeart/1,
	getHDBattleHeart/0,
	setHDBattleHeart/1,
	playerEntermap/1,
	setHDPlayerEts/2,
	getWaitJoinBattlePlayer/0,
	getSelfApplyRec/1,
	getHDBattlePhase/0,
	setHDBattlePhase/1,
	tickPrepare/0
]).

%% 初始化
-spec init() -> ok.
init() ->
	getHDActivityRankID(),
	ok.

%% 主活动模块进程回调
-spec activityChangeCallBack(Phase::uint()) -> ok.
activityChangeCallBack(?ActivityPhase_Close) ->
	%% 活动关闭
	setHDBattlePhase(?HDPhase_End),

	%% 清空报名表
	clearApplyRec(),

	acHDBattlegroundLogic:sendTipsToAllPlayer(?ErrorCode_ActivityHDAlreadyEnd),

	%% 移除所有心跳
	{H1, H2, H3} = getHDBattleHeart(),
	delHDBattleHeart(H1),
	delHDBattleHeart(H2),
%% 	delHDBattleHeart(H3),
	setHDBattleHeart({undefined, undefined, H3}),

	%% 开启一个25分钟后，清除刷怪的心跳
	erlang:send_after(25*60*1000, self(), clearFreshMonsterTick),
	ok;
activityChangeCallBack(?ActivityPhase_HDBattle_1) ->
	?LOG_OUT("~p ~p wait start", [?MODULE, self()]),
	{H1, H2, H3} = getHDBattleHeart(),
	case H1 of
		undefined ->
			%% 活动准备开启，开启世界喊话，让大家准备
			Name = activityMgrLogic:getActivityChildProcessName(?ActivityType_HDBattle),
			TimerRef = erlang:send_after(?HDPlayerReadStartBattle, Name, hDPlayerReadStartBattle),
			setHDBattleHeart({TimerRef, H2, H3});
		_ ->
			skip
	end,

	%% 马上喊话一次
	acHDBattlegroundLogic:sendTipsToAllPlayer(?ErrorCode_ActivityHDWillStart),
	ok;
activityChangeCallBack(?ActivityPhase_HDBattle_2) ->
	?LOG_OUT("~p ~p start", [?MODULE, self()]),
	%% 移除准备的喊话心跳
	{H1, H2, H3} = getHDBattleHeart(),
	H11 = case H1 of
			  undefined ->
				  H1;
			  _ ->
				  delHDBattleHeart(H1),
				  undefined
		  end,
	%% 添加正式开始的心跳
	H22 = case H2 of
			  undefined ->
				  %% 开启心跳
				  Name = activityMgrLogic:getActivityChildProcessName(?ActivityType_HDBattle),
				  TimerRef = erlang:send_after(?HDPlayerWaitJoinBattle, Name, hDPlayerWaitJoinBattle),
				  TimerRef;
			  _ ->
				  skip
		  end,
	%% 添加刷怪心跳
	H33 = case H3 of
			  undefined ->
				  %% 开启心跳
				  Name2 = activityMgrLogic:getActivityChildProcessName(?ActivityType_HDBattle),
				  TimerRef2 = erlang:send_after(?HDBattleFreshMonster, Name2, hDBattleFreshMonster),
				  TimerRef2;
			  _ ->
				  H3
		  end,
	%% 缓存心跳
	setHDBattleHeart({H11, H22, H33}),

	%% 全服公告，活动开始
	acHDBattlegroundLogic:sendTipsToAllPlayer(?ErrorCode_ActivityHDAlreadyStart),

	%% 活动开启
	setHDBattlePhase(?HDPhase_Start),

	%% 开始战场的准备心跳
	erlang:send_after(1000, self(), tickPrepare),

	%% 清零数据
	clearData(),
	ok;

activityChangeCallBack(Phase) ->
	?ERROR_OUT("~p ~p activityChangeCallBack:~p", [?MODULE, self(), Phase]),
	ok.

tickPrepare() ->
	L = getBattlePrepareList(),
	NL = tickPrepare2(L, []),
	setBattlePrepareList(NL),

	%% 是否继续心跳
	case getHDBattlePhase() /= ?HDPhase_Close of
		true ->
			erlang:send_after(1000, self(), tickPrepare);
		_ ->
			skip
	end.

tickPrepare2([], L) ->
	L;
tickPrepare2(#recHDBattlePrepare{battlePID = PID, startTime = STime} = Rec, L) ->
	Time = time:getUTCNowSec(),
	PrepareTime = activityCommon:getValue(battle_time),
	case (Time - STime) > PrepareTime of
		true ->
			%% 添加开始
			addBattleList(PID),

			%% 通知这个地图的所有玩家，开门
			%% 通知这个地图的所有玩家，改变阵营
			case getHDPlayerEts(PID) of
				undefined -> skip;
				Ets ->
					Dict = getApplyDict(),
					Fun =
						fun(#recMapObject{id = RoleID, netPid = NetPid, pid = RolePID}, _) ->
							gsSendMsg:sendNetMsg(NetPid, ?BlockIDMsg),
							case dict:find(RoleID, Dict) of
								{ok, #recHDApply{camp = Camp}} -> psMgr:sendMsg2PS(RolePID, changePlayerCamp, Camp);
								_ -> skip
							end
						end,
					ets:foldl(Fun, 0, Ets)
			end,

			%% 这个已经处理，跳过
			L;
		_ ->
			[Rec | L]
	end;
tickPrepare2([#recHDBattlePrepare{} = Prepare|Right], L) ->
	R = tickPrepare2(Prepare, L),
	tickPrepare2(Right, R).

%% 请求加入混沌战场
-spec requestJoinHDBattle({RoleID::uint(), RoleName::list(), RoleLevel::uint(), RolePID::pid(), RoleNetPID::pid(), Force::uint()}) -> uint() | {uint(), pid()}.
requestJoinHDBattle({RoleID, _RoleName, _RoleLevel, RolePID, RoleNetPID, _Force} = Msg) ->
	Dict = getApplyDict(),
	case dict:find(RoleID, Dict) of
		{ok, #recHDApply{battlePID = PID, enterPos = EnterPos}} when erlang:is_pid(PID) ->
			updateInfo({RoleID, RolePID, RoleNetPID}),

			%% 可以进入战场
			{?HDBattleMapID, PID, EnterPos};
		_ ->
			apply(Msg)
	end.

%% 请求混沌战场击杀排行榜
-spec requestHDKillRank({RoleID::uint(), NetPID::pid()}) -> ok.
requestHDKillRank({RoleID, NetPID}) ->
	Dict = getApplyDict(),
	case dict:find(RoleID, Dict) of
		{ok, #recHDApply{battlePID = PID}} when erlang:is_pid(PID) ->
			{_, RankList} = getKillPlayerRank(PID, RoleID),
			Fun = fun(#recHDApply{killPlayerAll = KA, roleName = Name}, {Sort, AccList}) ->
				R = #pk_KillRank{
					sortNumber = Sort,
					killNumber = KA,
					playerName = Name
				},
				{Sort + 1, [R | AccList]}
			end,
			{_, L} = lists:foldl(Fun, {1, []}, RankList),
			LL = lists:reverse(L),
			Msg = #pk_GS2U_KillRank{rank = LL},
			gsSendMsg:sendNetMsg(NetPID, Msg);
		_ ->
			skip
	end,
	ok.

%% 报名
-spec apply({RoleID::uint(), RoleName::list(), RoleLevel::uint(), RolePID::pid(), RoleNetPID::pid()}) -> uint().
apply({RoleID, RoleName, RoleLevel, RolePID, RoleNetPID, Force}) ->
	case getHDBattlePhase() =:= ?HDPhase_Start of
		true ->
			case RoleLevel >= activityCommon:getValue(?HDJoinLevel) of
				true ->
					Dict = getApplyDict(),
					case dict:find(RoleID, Dict) of
						{ok, #recHDApply{}} ->
							updateInfo({RoleID, RolePID, RoleNetPID}),

							%% 已经报名
							?ErrorCode_ActivityHDApplyAlready;
						_ ->
							R = #recHDApply{
								roleID = RoleID,
								roleName = RoleName,
								rolePID = RolePID,
								roleNetPID = RoleNetPID,
								playerForce = Force,
								applyNumber = getHDBattleApplyNumber()
							},
							NDict = dict:store(RoleID, R, Dict),
							setApplyDict(NDict),
							%% 报名成功
							?ErrorCode_ActivityHDApplySuccess
					end;
				_ ->
					%% 等级不够
					?ErrorCode_ActivityHDLevelNotEnough
			end;
		_ ->
			%% 活动未开启
			?ErrorCode_ActivityHDNotStart
	end.

%% 更新进程ID
-spec updateInfo({RoleID::uint(), RolePID::pid(), RoleNetPID::pid()}) -> ok.
updateInfo({RoleID, RolePID, RoleNetPID}) ->
	Dict = getApplyDict(),
	case dict:find(RoleID, Dict) of
		{ok, #recHDApply{} = Value} ->
			R = Value#recHDApply{
				rolePID = RolePID,
				roleNetPID = RoleNetPID
			},
			NDict = dict:store(RoleID, R, Dict),
			setApplyDict(NDict);
		_ ->
			skip
	end,
	ok.

%% 增加荣誉值
-spec addHonor(RoleID::uint(), PID::pid() | undefined, atom() | integer()) -> ok.
addHonor(RoleID, undefined, HonorValue) when erlang:is_integer(HonorValue) ->
	case dict:find(RoleID, getApplyDict()) of
		{ok, #recHDApply{rolePID = PID, battlePID = BPID}} when erlang:is_pid(BPID) andalso erlang:is_pid(PID) ->
			addHonor(RoleID, PID, HonorValue);
		_ ->
			ok
	end;
addHonor(RoleID, PID, HonorValue) when erlang:is_integer(HonorValue) andalso erlang:is_pid(PID) ->
	psMgr:sendMsg2PS(PID, hdaddHonorValue, {RoleID, HonorValue}),
	ok;
addHonor(RoleID, undefined, HonorKey) when erlang:is_atom(HonorKey) ->
	HonorValue = activityCommon:getValue(HonorKey),
	addHonor(RoleID, undefined, HonorValue);
addHonor(RoleID, PID, HonorKey) when erlang:is_atom(HonorKey) andalso erlang:is_pid(PID) ->
	HonorValue = activityCommon:getValue(HonorKey),
	addHonor(RoleID, PID, HonorValue).

%% 增加道具
-spec addItem(RoleID::uint(), PID::pid() | undefined, ItemKey::atom()) -> ok.
addItem(RoleID, undefined, ItemKey) ->
	case dict:find(RoleID, getApplyDict()) of
		{ok, #recHDApply{rolePID = PID, battlePID = BPID}} when erlang:is_pid(BPID) andalso erlang:is_pid(PID) ->
			addItem(RoleID, PID, ItemKey);
		_ ->
			ok
	end;
addItem(RoleID, PID, ItemKey) when erlang:is_atom(ItemKey) andalso erlang:is_pid(PID) ->
	ItemValue = activityCommon:getValue(ItemKey),
	psMgr:sendMsg2PS(PID, hdKillBossReward, {RoleID, ItemValue}),
	ok.

%% 改变杀戮状态
-spec changeKillStatus(RoleID::uint(), Status::uint()) -> ok.
changeKillStatus(RoleID, Status) ->
	case dict:find(RoleID, getApplyDict()) of
		{ok, #recHDApply{rolePID = PID, battlePID = BPID}} when erlang:is_pid(BPID) ->
			psMgr:sendMsg2PS(PID, changeHDKillStatus, {RoleID, Status});
		_ ->
			skip
	end,
	ok.

%% 删除报名
-spec delApplyPlayer(RoleID::uint()) -> boolean().
delApplyPlayer(RoleID) ->
	Dict = getApplyDict(),
	case dict:find(RoleID, Dict) of
		{ok, #recHDApply{battlePID = PID}} ->
			case erlang:is_pid(PID) of
				true ->
					%% 战场已经开启，不能删除了
					false;
				_ ->
					NDict = dict:erase(RoleID, Dict),
					setApplyDict(NDict),
					true
			end;
		_ ->
			false
	end.

%% 玩家进入混沌战场活动地图
-spec playerEntermap(RoleID::uint()) -> ok.
playerEntermap(RoleID) ->
	Dict = getApplyDict(),
	case dict:find(RoleID, Dict) of
		{ok, #recHDApply{} = R} ->
			sendPrepareTimeOrBlock(R),

			sendPlayerProcess(R),
			ok;
		_ ->
			skip
	end,
	ok.

%% 把报名玩家拿去打架的心跳
-spec hDPlayerWaitJoinBattle() -> ok.
hDPlayerWaitJoinBattle() ->
	L = getWaitJoinBattlePlayer(),
	Len = length(L),
	T = getWaitStartTimes(),
	JoinNumber = activityCommon:getValue(?HDJoinNumber),
	?DEBUG_OUT("hDPlayerWaitJoinBattle:~p,~p,~p", [Len,JoinNumber,T]),
	CreateProcessNumber =
	if
		Len > 0 andalso Len >= JoinNumber ->
			Len div JoinNumber;
		Len > 0 andalso T >= ?HDBattleMapNpBodayWait ->
			?LOG_OUT("~p hDPlayerWaitJoinBattle:~p,all,~p", [?MODULE, Len, T]),
			1;
		true ->
			%% 增加空次数
			addWaitStartTimes(),
			0
	end,
	case CreateProcessNumber > 0 of
		true ->
			%% 发消息给地图管理进程，创建战场副本
			core:sendMsgToMapMgr(?HDBattleMapID, createActivityMap, {?HDBattleMapID, CreateProcessNumber, T}),

			setWaitStartTimes(0);
		_ ->
			skip
	end,
	ok.

%% 给所有的碧空城玩家聊天频道系统提示
sendSysChatToPlayer(ID, Param, NetPID) ->
	Content = stringCfg:getString(ID, Param),
	ChatInfo = playerChat:getSystemChatInfo(Content),
	gsSendMsg:sendNetMsg(NetPID, ChatInfo).

%% 全服tips
-spec sendTipsToAllPlayer(ErrorCode::uint()) -> ok.
sendTipsToAllPlayer(ErrorCode) ->
	Msg = playerMsg:getErrorCodeMsg(ErrorCode, []),
	playerMgrOtp:sendMsgToAllPlayer([Msg]),
	ok.

%% 场景消息(战场中的)
-spec sendMsgToScenePlayer(BattlePID::pid(), Msg::term()) -> ok.
sendMsgToScenePlayer(BattlePID, Msg) ->
	case getHDPlayerEts(BattlePID) of
		undefined ->
			skip;
		Ets ->
			Fun =
				fun(#recMapObject{netPid = NetPid},_) ->
					gsSendMsg:sendNetMsg(NetPid, Msg)
				end,
			ets:foldl(Fun, 0, Ets)
	end,
	ok.

%% 场景tips(战场中的)
-spec sendTipsToScenePlayer(BattlePID::pid(), ErrorCode::uint(), Param::list()) -> ok.
sendTipsToScenePlayer(BattlePID, ErrorCode, Param) ->
	Msg = playerMsg:getErrorCodeMsg(ErrorCode, Param),
	case getHDPlayerEts(BattlePID) of
		undefined ->
			skip;
		Ets ->
			Fun =
				fun(#recMapObject{netPid = NetPid},_) ->
					gsSendMsg:sendNetMsg(NetPid, Msg)
				end,
			ets:foldl(Fun, 0, Ets)
	end,
	ok.

%% 刷怪心跳
-spec hDBattleFreshMonster() -> ok.
hDBattleFreshMonster() ->
	NowTime = time:getUTCNowMS(),
	L = getBattleList(),
	Fun = fun(#recHDBattle{battlePID = PID, startTime = _STime} = Battle) ->
		case hDBattleFresh_End(PID, NowTime, Battle#recHDBattle.endTime) of
			false ->
				%% 广播玩家的进度
				sendPlayerProcess_broadcast(PID),

%% 				?DEBUG_OUT("AAA:~p,~p", [NowTime, Battle#recHDBattle.endTime]),
				case hDBattleFresh_Settle(PID, NowTime, Battle#recHDBattle.settleRaward) of
					false ->
						hDBattleFresh_Monster(PID, NowTime, Battle#recHDBattle.nextFreshMonsterTime),
						hDBattleFresh_Boss(PID, NowTime, Battle#recHDBattle.nextFreshBossTime),
						hDBattleFresh_Collect(PID, NowTime, Battle#recHDBattle.nextFreshCollectTime);
					_ ->
						%% 已经结束，不再刷怪等
						skip
				end;
			_ ->
				%% 已经结束，不再刷怪等
				skip
		end
	end,
	lists:foreach(Fun, L),
	ok.

hDBattleFresh_End(BattlePID, _NowTime, 0) ->
	clearBattleData(BattlePID),
	true;
hDBattleFresh_End(BattlePID, NowTime, Time) ->
	case isMarginRange((NowTime - Time) div 1000) of
		false ->
			false;
		true ->
			%% 需要结束
			clearBattleData(BattlePID),

			%% 重置活动地图
			psMgr:sendMsg2PS(BattlePID, resetCopyMap, {}),
			true
	end.

hDBattleFresh_Settle(_BattlePID, _NowTime, 0) ->
	true;
hDBattleFresh_Settle(BattlePID, NowTime, Time) ->
	case isMarginRange((NowTime - Time) div 1000) of
		false ->
			false;
		true ->
			%% 记录击杀玩家的排行榜日志
			NowLocalTime = time:getSyncTime1970FromDBS(),
			NowTimeStr = time:int64ToTimeString(NowLocalTime),
			GSID = gsMainLogic:getServerID(),
			RankID = getHDActivityRankID(),

			%% 结算奖励
			{_, RankList} = getKillPlayerRank(BattlePID, 0),
			Fun = fun(#recHDApply{roleID = RoleID, killPlayerAll = KA, roleName = Name, rolePID = PID}, {Sort, AccList}) ->
				R = #pk_KillRank{
					sortNumber = Sort,
					killNumber = KA,
					playerName = Name
				},

				%% 按排行榜发奖
				{Honor, Item} = if
							Sort =:= 1 ->
								{?HDAddHonorRank1, ?HDAddHonorItem1};
							Sort =:= 2 ->
								{?HDAddHonorRank2, ?HDAddHonorItem2};
							Sort >= 3 andalso Sort =< 10 ->
								{?HDAddHonorRank3T10, ?HDAddHonorItem3T10};
							true ->
								{?HDAddHonorRank11, ?HDAddHonorItem11}
						end,
				addHonor(RoleID, PID, Honor),
				addItem(RoleID, PID, Item),

				%% 改变杀戮状态为和平模式
				changeKillStatus(RoleID, ?PlayerPeaceStatus),

				%% 记录日志
				RLog = #recLogActivityHDKill{
					produceTime = NowTimeStr,
					gsID = GSID,
					rankID = RankID,
					roleID = RoleID,
					rankSort = Sort,
					rankValue = KA
				},
				dbLog:sendSaveLogActivityHDKill(RLog),

				{Sort + 1, [R | AccList]}
			end,
			{_, LL} = lists:foldl(Fun, {1, []}, RankList),
			LLL = lists:reverse(LL),
			Msg = #pk_GS2U_KillRank{rank = LLL},
			sendMsgToScenePlayer(BattlePID, Msg),

			%% 设置不在刷怪了
			L = getBattleList(),
			case lists:keyfind(BattlePID, #recHDBattle.battlePID, L) of
				#recHDBattle{} = V ->
					NL = lists:keystore(BattlePID, #recHDBattle.battlePID,
										L, V#recHDBattle{settleRaward = 0}),
					setBattleList(NL)
			end,

			%% 场景提示
			sendTipsToScenePlayer(BattlePID, ?ErrorCode_ActivityHDBattleEnd, []),
			true
	end.

hDBattleFresh_Monster(_BattlePID, _NowTime, 0) ->
	ok;
hDBattleFresh_Monster(BattlePID, NowTime, Time) ->
	case isMarginRange((NowTime - Time) div 1000) of
		false ->
			ok;
		true ->
			%% 需要刷怪
			{IDList, PosList} = activityCommon:getMonsterOrCollectList(?ConfChaos_HDBattle, ?HDBattle_Type_Monster),
			case activityCommon:getAllocList(IDList, PosList) of
				[] ->
					skip;
				MonsterList ->
					psMgr:sendMsg2PS(BattlePID, addMonsterToMap, {0, MonsterList})
			end,

			%% 更新下次刷怪时间
			L = getBattleList(),
			case lists:keyfind(BattlePID, #recHDBattle.battlePID, L) of
				#recHDBattle{} = V ->
					FreshTime = activityCommon:getFreshIntervalTime(?ConfChaos_HDBattle, ?HDBattle_Type_Monster) * 1000,
					NL = lists:keystore(BattlePID, #recHDBattle.battlePID,
										L, V#recHDBattle{nextFreshMonsterTime = NowTime + FreshTime}),
					setBattleList(NL)
			end,
			ok
	end.

hDBattleFresh_Boss(_BattlePID, _NowTime, 0) ->
	ok;
hDBattleFresh_Boss(BattlePID, NowTime, Time) ->
	case isMarginRange((NowTime - Time) div 1000) of
		false ->
			ok;
		true ->
			%% 需要刷boss
			{IDList, PosList} = activityCommon:getMonsterOrCollectList(?ConfChaos_HDBattle, ?HDBattle_Type_Boss),
			case activityCommon:getAllocList(IDList, PosList) of
				[] ->
					skip;
				MonsterList ->
					psMgr:sendMsg2PS(BattlePID, addMonsterToMap, {0, MonsterList})
			end,

			%% 更新下次刷怪时间
			L = getBattleList(),
			case lists:keyfind(BattlePID, #recHDBattle.battlePID, L) of
				#recHDBattle{} = V ->
					NL = lists:keystore(BattlePID, #recHDBattle.battlePID,
										L, V#recHDBattle{nextFreshBossTime = 0}),
					setBattleList(NL)
			end,
			ok
	end.

hDBattleFresh_Collect(_BattlePID, _NowTime, 0) ->
	ok;
hDBattleFresh_Collect(BattlePID, NowTime, Time) ->
	case isMarginRange((NowTime - Time) div 1000) of
		false ->
			ok;
		true ->
			%% 需要刷宝箱
			{IDList, PosList} = activityCommon:getMonsterOrCollectList(?ConfChaos_HDBattle, ?HDBattle_Type_Collect),
			case activityCommon:getAllocList(IDList, PosList) of
				[] ->
					skip;
				MonsterList ->
					psMgr:sendMsg2PS(BattlePID, addCollectToMap, {0, MonsterList})
			end,

			%% 更新下次刷采集物时间
			L = getBattleList(),
			case lists:keyfind(BattlePID, #recHDBattle.battlePID, L) of
				#recHDBattle{} = V ->
					FreshTime = activityCommon:getFreshIntervalTime(?ConfChaos_HDBattle, ?HDBattle_Type_Collect) * 1000,
					NL = lists:keystore(BattlePID, #recHDBattle.battlePID,
										L, V#recHDBattle{nextFreshCollectTime = NowTime + FreshTime}),
					setBattleList(NL)
			end,
			ok
	end.

isMarginRange(Time) ->
	Time > 0 andalso Time =< 5.

%% 有怪物受到伤害
-spec monsterDamageAdd({RoleID::uint(), MonsterCode::uint(), MonsterID::uint(), DamageValue::uint()}) -> ok.
monsterDamageAdd({_MapID, _MapPID, RoleID, _MonsterCode, MonsterID, DamageValue}) ->
	{IDList, _PosList} = activityCommon:getMonsterOrCollectList(?ConfChaos_HDBattle, ?HDBattle_Type_Boss),
	case lists:member(MonsterID, IDList) of
		true ->
			Dict = getApplyDict(),
			case dict:find(RoleID, Dict) of
				{ok, #recHDApply{battlePID = PID, giveBossHurt = Hurt} = Value} when erlang:is_pid(PID) ->
					AllHurt = Hurt + DamageValue,
					NDict = dict:store(RoleID, Value#recHDApply{giveBossHurt = AllHurt}, Dict),
					setApplyDict(NDict);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%% 怪物死亡
-spec monsterDead({RoleID::uint(), MonsterCode::uint(), MonsterID::uint()}) -> ok.
monsterDead({_MapID, _MapPID, RoleID, _MonsterCode, MonsterID}) ->
	{IDList, _PosList} = activityCommon:getMonsterOrCollectList(?ConfChaos_HDBattle, ?HDBattle_Type_Boss),
	case lists:member(MonsterID, IDList) of
		true ->
			Dict = getApplyDict(),
			case dict:find(RoleID, Dict) of
				{ok, #recHDApply{battlePID = PID}}
					when erlang:is_pid(PID) ->
					%% 找出伤害最高的人
					L = getBattlePlayerApplyList(PID),

					Fun = fun(#recHDApply{giveBossHurt = G1, roleID = R1},
							  #recHDApply{giveBossHurt = G2, roleID = R2}) ->
						if
							G1 > G2 ->
								true;
							G1 =:= G2 andalso R1 < R2 ->
								true;
							true ->
								false
						end
					end,
					NL = [#recHDApply{roleID = MaxRoleID, rolePID = MaxRolePID, roleName = MaxRoleName}|_] = lists:sort(Fun, L),

					%% 记录给boss造成伤害的排行榜日志
					NowTime = time:getSyncTime1970FromDBS(),
					NowTimeStr = time:int64ToTimeString(NowTime),
					GSID = gsMainLogic:getServerID(),
					RankID = getHDActivityRankID(),
					FunLog = fun(#recHDApply{roleID = RID, giveBossHurt = Hurt}, RankSort) ->
						R = #recLogActivityHDHurt{
							produceTime = NowTimeStr,
							gsID = GSID,
							rankID = RankID,
							roleID = RID,
							rankSort = RankSort,
							rankValue = Hurt
						},
						dbLog:sendSaveLogActivityHDHurt(R),
						RankSort + 1
					end,
					lists:foldl(FunLog, 1, NL),

					addItem(MaxRoleID, MaxRolePID, ?HDKillBOSSRewardID),
					sendTipsToScenePlayer(PID, ?ErrorCode_ActivityHDKillBossRewardID, [MaxRoleName]);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%% 清空所有数据
-spec clearData() -> ok.
clearData() ->
	%% 清空原来的报名表
	clearApplyRec(),

	%% 清空战场字典里的玩家
	BattleList = getBattleList(),
	FunDB = fun(#recHDBattle{battlePID = BattlePID}) ->
		delBattlePlayerList(BattlePID)
	end,
	lists:foreach(FunDB, BattleList),

	%% 删除战场列表
	delBattleList(),

	%% 清零等待次数
	setWaitStartTimes(0),
	ok.

%% 清空报名表
-spec clearApplyRec() -> ok.
clearApplyRec() ->
	%% 清零报名顺序
	clearHDBattleApplyNumber(),

	Dict = getApplyDict(),
	L = dict:to_list(Dict),
	Fun = fun({_, #recHDApply{roleID = RoleID}}, DD) ->
		dict:erase(RoleID, DD)
	end,
	NDict = lists:foldl(Fun, Dict, L),
	setApplyDict(NDict),
	ok.

%% 清空某个战场数据
clearBattleData(BattlePID) ->
	RoleIDList = getBattlePlayerList(BattlePID),

	%% 删除玩家
	Fun = fun(RoleID) ->
		Dict = getApplyDict(),
		NDict = dict:erase(RoleID, Dict),
		setApplyDict(NDict)
	end,
	lists:foreach(Fun, RoleIDList),

	%% 从战场列表里删除一个
	delOneBattleList(BattlePID),

	%% 删除战场
	delBattlePlayerList(BattlePID),

	%% 删除保留的这个战场的PlayerEs
	delHDPlayerEts(BattlePID),
	ok.

%% 创建战场成功
-spec createHDBattleMapAck({MapID::uint(), List::[pid()|_], Data::uint()}) -> ok.
createHDBattleMapAck({_MapID, List, Data}) ->
	?LOG_OUT("createHDBattleMapAck:~p", [List]),
	WaitList = getWaitJoinBattlePlayer(),
	Fun = fun(BattlePID, L) ->
		%% 添加一个准备战场
		addBattlePrepareList(BattlePID),
%% 		addBattleList(BattlePID),

		Len = length(L),

		%% 得到这个战场选中的人
		JoinNumber = activityCommon:getValue(?HDJoinNumber),
		PL = if
				 Len >= JoinNumber ->
					 lists:sublist(L, JoinNumber);
				 Len > 0 andalso Data >= ?HDBattleMapNpBodayWait ->
					 %% 把当前全部人拿进去
					 ?LOG_OUT("~p createHDBattleMapAck:~p,all,~p", [?MODULE, Len, Data]),
					 L;
				 true ->
					 L
			 end,

		%% 分配玩家队伍
		{L1, L2} = allocTroops(PL),
		Pos1 = activityCommon:getValue(battle_point1),
		Pos2 = activityCommon:getValue(battle_point2),

		FunUpdate =
			fun(#recHDApply{roleID = RoleID, roleNetPID = NetPID}, Param) ->
				%% 通知这个人，可以加入战场
				gsSendMsg:sendNetMsg(NetPID, #pk_GS2U_JoinHDBattle{}),

				updatePlayerJoined(BattlePID, RoleID, Param),
				addBattlePlayerList(BattlePID, RoleID),
				Param
			end,
		lists:foldl(FunUpdate, {Pos1, ?CampRedBattle}, L1),
		lists:foldl(FunUpdate, {Pos2, ?CampBlueBattle}, L2),

		%% 这些人已经处理，减掉
		lists:subtract(L, PL)
	end,
	lists:foldl(Fun, WaitList, List),
	ok.

allocTroops(PlayerList) ->
	PlayerList2 = lists:map(fun({_RID, #recHDApply{} = Apply}) -> Apply end, PlayerList),
	PlayerList3 = lists:keysort(#recHDApply.playerForce, PlayerList2),
	PlayerList4 = lists:reverse(PlayerList3),
	allocTroops2(PlayerList4, [], []).

allocTroops2([], L1, L2) ->
	{L1, L2};
allocTroops2(List, L1, L2) ->
	Len = erlang:length(List),
	if
		Len >= 4 ->
			L = [A1, A2, A3, A4] = lists:sublist(List, 4),
			allocTroops2(List -- L, [A1,A4]++L1, [A2,A3]++L2);
		Len >= 2 ->
			L = [A1,A2] = lists:sublist(List, 2),
			allocTroops2(List -- L, [A1|L1], [A2|L2]);
		true ->
			allocTroops2([], List ++ L1, L2)
	end.

%% 设置这个人已经加入了战场
updatePlayerJoined(BattlePID, RoleID, {Pos, Camp}) ->
	Dict = getApplyDict(),
	case dict:find(RoleID, Dict) of
		{ok, #recHDApply{} = Value} ->
			NDict = dict:store(RoleID, Value#recHDApply{battlePID = BattlePID, enterPos = Pos, camp = Camp}, Dict),
			setApplyDict(NDict),
			true;
		_ ->
			false
	end.

%% 有人死亡
-spec playerDead(RoleID::uint()) -> ok.
playerDead(RoleID) ->
	Dict = getApplyDict(),
	case dict:find(RoleID, Dict) of
		{ok, #recHDApply{} = Value} ->
			%% 连杀清零
			NDict = dict:store(RoleID, Value#recHDApply{lxKillPlayer = 0}, Dict),
			setApplyDict(NDict);
		_ ->
			skip
	end,
	ok.

%% 在混沌战场中完成了一次采集
-spec hdbattleGatherSuccess({RoleID::uint64(), GatherID::uint()}) -> ok.
hdbattleGatherSuccess({RoleID, _GatherID}) ->
	Dict = getApplyDict(),
	case dict:find(RoleID, Dict) of
		{ok, #recHDApply{gatherNumber = GatherNumber1, rolePID = RolePID, roleNetPID = NetPID} = Value} ->
			GatherNumber2 = GatherNumber1 + 1,
			NValue = Value#recHDApply{gatherNumber = GatherNumber2},
			NDict = dict:store(RoleID, NValue, Dict),
			setApplyDict(NDict),

			NeedGather = activityCommon:getValue(?NeedGatherSuccessNumber),
			if
				GatherNumber2 =:= NeedGather ->
					JL = activityCommon:getValue(?GatherSuccess_Reward),
					sendSysChatToPlayer(hDBattle_GatherItem, [JL], NetPID),
					%% 给奖励
					%% 增加荣誉
					addHonor(RoleID, RolePID, JL);
				true ->
					skip
			end,

			%% 通知玩家
			sendPlayerProcess(NValue),

			%% 通知玩家完成了一次采集
%% 			GatherMsg = #pk_GS2U_HDGatherSuccess{gatherID = GatherID},
%% 			gsSendMsg:sendNetMsg(NetPID, GatherMsg),
			ok;
		_ ->
			skip
	end,
	ok.

%% 杀人了
-spec killedTarget(RoleID::uint()) -> ok.
killedTarget(RoleID) ->
	Dict = getApplyDict(),
	case dict:find(RoleID, Dict) of
		{ok, #recHDApply{lxKillPlayer = LXK, lXKillPlayerMax = LXKM, killPlayerAll = KA, rolePID = RolePID, roleNetPID = NetPID} = Value} ->
			NLXK = LXK + 1,
			NKA = KA + 1,
			Max = erlang:max(NLXK, LXKM),
			NValue = Value#recHDApply{lxKillPlayer = NLXK, lXKillPlayerMax = Max, killPlayerAll = NKA},
			NDict = dict:store(RoleID, NValue, Dict),
			setApplyDict(NDict),

			#recHDApply{roleName = Name, battlePID = PID} = Value,
			%% 计算增幅奖励并场景提示
			ZV = if
					 NLXK > 50 ->
						 sendTipsToScenePlayer(PID, ?ErrorCode_ActivityHDLXKillPlayer3, [Name,NLXK]),
						 (NLXK - 50) * activityCommon:getValue(?HDAddHonorZ50);
					 NLXK > 30 ->
						 sendTipsToScenePlayer(PID, ?ErrorCode_ActivityHDLXKillPlayer2, [Name,NLXK]),
						 (NLXK - 30) * activityCommon:getValue(?HDAddHonorZ30);
					 NLXK > 10 ->
						 sendTipsToScenePlayer(PID, ?ErrorCode_ActivityHDLXKillPlayer1, [Name,NLXK]),
						 (NLXK - 10) * activityCommon:getValue(?HDAddHonorZ10);
					 true ->
						 0
				 end,

			NeedKill = activityCommon:getValue(?NeedKillPlayerNumber),
			ZV2 = if
				      NKA =:= NeedKill ->
					      %% 给奖励
					      JL = activityCommon:getValue(?KillPlayer_Reward),
					      %% 给个系统提示
					      sendSysChatToPlayer(hDBattle_KillPlayer, [JL], NetPID),
					      JL;
				      true ->
					      0
			      end,

			%% 增加荣誉
			addHonor(RoleID, RolePID, ZV + activityCommon:getValue(?HDAddHonorKP) + ZV2),

			%% 告诉客户端自己的杀人数量
			sendPlayerProcess(NValue),
			ok;
		_ ->
			skip
	end,
	ok.

%% 获取杀人数量排行榜与自己的排行榜
-spec getKillPlayerRank(BattlePID::pid(), RoleID::uint()) -> {uint(), list()}.
getKillPlayerRank(BattlePID, RoleID) ->
	L = getBattlePlayerApplyList(BattlePID),
	Fun = fun(#recHDApply{killPlayerAll = K1, roleID = R1}, #recHDApply{killPlayerAll = K2, roleID = R2}) ->
		if
			K1 > K2 ->
				true;
			K1 =:= K2 andalso R1 < R2 ->
				true;
			true ->
				false
		end
	end,
	LL = lists:sort(Fun, L),
	Pos = case RoleID > 0 of
			  true ->
				  VV = lists:keyfind(RoleID, #recHDApply.roleID, LL),
				  misc:getListPos(VV, LL);
			  _ ->
				  0
		  end,
	{Pos, LL}.

%% 获取等待参加战场的人数
-spec getWaitJoinBattlePlayer() -> [{Key::uint(), Value::#recHDApply{}},...].
getWaitJoinBattlePlayer() ->
	Fun = fun(_K, #recHDApply{battlePID = BPID}) ->
		BPID =:= undefined
	end,
	Dict = getApplyDict(),
	NDict = dict:filter(Fun, Dict),
	List = dict:to_list(NDict),

	FunSort =
		fun({_,#recHDApply{applyNumber = A1}},{_,#recHDApply{applyNumber = A2}}) ->
			A1 < A2
		end,
	%% 按照报名先后顺序排序
	lists:sort(FunSort, List).

-spec getSelfApplyRec(RoleID::uint64()) -> {ok, #recHDApply{}} | error.
getSelfApplyRec(RoleID) ->
	Dict = getApplyDict(),
	dict:find(RoleID, Dict).

sendPrepareTimeOrBlock(#recHDApply{battlePID = BattlePID, rolePID = RolePID, roleNetPID = NetPID, camp = Camp}) ->
	case erlang:is_pid(BattlePID) of
		true ->
			L = getBattlePrepareList(),
			NTime = time:getUTCNowSec(),
			Msg =
				case lists:keyfind(BattlePID, #recHDBattlePrepare.battlePID, L) of
					#recHDBattlePrepare{startTime = STime} ->
						%Time = time:getUTCNowSec(),
						PrepareTime = activityCommon:getValue(battle_time),
						Diff = NTime - STime,
						case Diff > PrepareTime of
							true ->
								?BlockIDMsg;
							_ ->
%% 								?DEBUG_OUT("sendPrepareTimeOrBlock:~ts,~p,~p",
%% 									[Apply#recHDApply.roleName,Apply#recHDApply.roleID,Diff]),
								#pk_GS2U_HDBattleOpenSurplusTime{surplusTime = PrepareTime - Diff}
						end;
					_ ->
						?BlockIDMsg
				end,
			gsSendMsg:sendNetMsg(NetPID, Msg),
			case Msg =:= ?BlockIDMsg of
				true ->
					%% 设置PK模式
%% 					?DEBUG_OUT("sendPrepareTimeOrBlock222:~ts,~p,~p",
%% 						[Apply#recHDApply.roleName,Apply#recHDApply.roleID,Camp]),
					psMgr:sendMsg2PS(RolePID, changePlayerCamp, Camp);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%% 广播个人进度
sendPlayerProcess_broadcast(BattlePID) ->
	case getHDPlayerEts(BattlePID) of
		undefined ->
			skip;
		Ets ->
			ApplyList = getBattlePlayerApplyList(BattlePID),
			[sendPlayerProcess(Ets, R) || R <- ApplyList],
			ok
	end,
	ok.

sendPlayerProcess(PlayerEts, #recHDApply{roleID = RoleID} = Apply) ->
	Q = ets:fun2ms(fun(Object) when Object#recMapObject.id =:= RoleID -> Object end),
	case myEts:selectEts(PlayerEts, Q) of
		[] ->
			skip;
		_ ->
			sendPlayerProcess(Apply)
	end,
	ok.

%% 混沌战场个人进度，通知客户端
sendPlayerProcess(#recHDApply{battlePID = BattlePID, roleID = RoleID, roleNetPID = NetPID} = R) ->
	case erlang:is_pid(BattlePID) of
		true ->
			NowTime = time:getUTCNowMS(),
			BattleList = getBattleList(),
			EndTime = case lists:keyfind(BattlePID, #recHDBattle.battlePID, BattleList) of
				          #recHDBattle{endTime = ET} -> ET;
				          _ -> NowTime
			          end,
			RemainTime = erlang:max(0, (EndTime - NowTime) div 1000),

			{Pos, _} = getKillPlayerRank(BattlePID, RoleID),
			Msg = #pk_GS2U_KillPlayerNumber{
				sortNumber = Pos,
				killNumber = R#recHDApply.killPlayerAll,
				lxKillNumber = R#recHDApply.lxKillPlayer,
				gatherNumber = R#recHDApply.gatherNumber,
				needKill = activityCommon:getValue(?NeedKillPlayerNumber),
				needGatherNumber = activityCommon:getValue(?NeedGatherSuccessNumber),
				remainSecond = RemainTime
			},
			gsSendMsg:sendNetMsg(NetPID, Msg);
		_ ->
			skip
	end,
	ok.

%% ====================================================================
%% state functions
%% ====================================================================
%% 获取某个战场的成员RoleID列表
getBattlePlayerList(BattlePID) ->
	case get({'BattlePlayerList', BattlePID}) of
		undefined ->
			[];
		L ->
			L
	end.

getBattlePlayerApplyList(BattlePID) ->
	L = getBattlePlayerList(BattlePID),
	Dict = getApplyDict(),
	Fun = fun(RoleID, AccList) ->
		case dict:find(RoleID, Dict) of
			{ok, Value} ->
				[Value | AccList];
			_ ->
				AccList
		end
	end,
	lists:foldl(Fun, [], L).

addBattlePlayerList(BattlePID, RoleID) ->
	L = getBattlePlayerList(BattlePID),
	setBattlePlayerList(BattlePID, [RoleID | L]).

setBattlePlayerList(BattlePID, List) ->
	put({'BattlePlayerList', BattlePID}, List),
	List.

delBattlePlayerList(BattlePID) ->
	erlang:erase({'BattlePlayerList', BattlePID}).

%% 进入准备的战场列表[#recHDBattlePrepare{},...]
setBattlePrepareList(List) ->
	put('BattlePrepareList', List).

addBattlePrepareList(BattlePID) ->
	R = #recHDBattlePrepare{
		battlePID = BattlePID,
		startTime = time:getUTCNowSec() % 这里用秒
	},
	L = getBattlePrepareList(),
	setBattlePrepareList([R | L]).

getBattlePrepareList() ->
	case get('BattlePrepareList') of
		undefined ->
			[];
		L ->
			L
	end.

%delBattlePrepareList() ->
%	erlang:erase('BattlePrepareList').

%% 已经开启的战场[#recHDBattle{},...]
setBattleList(List) ->
	put('BattleList', List).

addBattleList(BattlePID) ->
	NowTime = time:getUTCNowMS(),
	R = #recHDBattle{
		battlePID = BattlePID,
		startTime = NowTime,
		nextFreshMonsterTime = NowTime,
		nextFreshCollectTime = NowTime,
		nextFreshBossTime = NowTime + ?FreshBossTime,
		settleRaward = NowTime + ?FreshSettleTime,
		endTime = NowTime + ?FreshEndTime
	},
	L = getBattleList(),
	setBattleList([R | L]).

getBattleList() ->
	case get('BattleList') of
		undefined ->
			[];
		L ->
			L
	end.

delBattleList() ->
	erlang:erase('BattleList').

delOneBattleList(BattlePID) ->
	L = getBattleList(),
	case lists:keyfind(BattlePID, #recHDBattle.battlePID, L) of
		#recHDBattle{} = V ->
			NL = lists:delete(V, L),
			setBattleList(NL);
		_ ->
			skip
	end.

%% 战场开启的心跳
setHDBattleHeart(Heart) ->
	put('HDBattleHeart', Heart).

getHDBattleHeart() ->
	case get('HDBattleHeart') of
		undefined ->
			{undefined, undefined, undefined};
		V ->
			V
	end.

delHDBattleHeart(undefined) ->
	ok;
delHDBattleHeart(H) ->
	erlang:cancel_timer(H).

%% 等待开启一个战场的次数（分钟数）
setWaitStartTimes(Times) ->
	put('WaitStartTimes', Times).

addWaitStartTimes() ->
	T = getWaitStartTimes(),
	setWaitStartTimes(T + 1).

getWaitStartTimes() ->
	case get('WaitStartTimes') of
		undefined ->
			0;
		V ->
			V
	end.

%% 混沌战场活动是否开启
setHDBattlePhase(Phase) ->
	put('HDBattlePhase', Phase).

getHDBattlePhase() ->
	case get('HDBattlePhase') of
		undefined ->
			?HDPhase_Close;
		V ->
			V
	end.

%% 战场报名dict
getApplyDict() ->
	case get('hdApplyDict') of
		undefined ->
			dict:new();
		D ->
			D
	end.

setApplyDict(Dict) ->
	put('hdApplyDict', Dict).

%% 排行榜ID，用于日志记录
getHDActivityRankID() ->
	ID = case get('HDActivityRankID') of
			 undefined ->
				 1;
			 V ->
				 V + 1
		 end,
	put('HDActivityRankID', ID),
	ID.

%% 玩家ets
setHDPlayerEts(Pid, Ets) ->
	put({'HDPlayerEts', Pid}, Ets).

getHDPlayerEts(Pid) ->
	get({'HDPlayerEts', Pid}).

delHDPlayerEts(Pid) ->
	erlang:erase({'HDPlayerEts', Pid}).

%% 混沌战场报名序号，用于分配战场时按顺序分配使用
clearHDBattleApplyNumber() ->
	put('HDBattleApplyNumber', 0).

getHDBattleApplyNumber() ->
	Value =
		case get('HDBattleApplyNumber') of
			undefined -> 1;
			V -> V + 1
		end,
	put('HDBattleApplyNumber', Value),
	Value.