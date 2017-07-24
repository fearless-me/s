%%%-------------------------------------------------------------------
%%% @author luowei
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 跨服混沌战场模块（跨服战场）
%%% @end
%%% Created : 16. 十一月 2015 17:36
%%%-------------------------------------------------------------------

-module(hdBattleLogic).
-include("hdBattlePrivate.hrl").
-include("gsInc.hrl").
%% API
-export([
	init/0,
	startAc/2,
	closeAc/1,
	tickPhase/0,
	allocMapLine/1,
	collectBox/2,
	killedHorse/2,
	killedGuard/2,
	killedPlayer/2,
	killedCryStal/5,
	horseToTarget/5,
	assKilledPlayer/2,
	enterPhaseOne/1,
	broadCastPhase/2,
	updatePlayerInfo/1,
	updateMapLineInfo/1,
	setNodeList/1,
	getNodeList/0,
	setAcAllocLine/1,
	horseHp/2,
	getAcCd/1,
	getAcSwitch/0,
	getRankData/0,
	getAcData/0,
	getMapLine/1,
	getExploits/2,
	getAcAllocLine/0,
	setStatPlayerNum/1,
	getStatPlayerNum/0,
	setMapLineInfoList/1,
	getMapLineInfoList/0,
	getMapLinePlayerByRoleID/1,
	dump_rank/0
	]).

-spec init() -> ok.
init() ->
	#activityCfg{starttime = [{_, Starttime} | _], lenghtime = Sec} = getAcData(),
	{{_Year,_Month,_Day}, {Hour,Minute,Second}} = time:getLocalNowDateTime1970(),
	OpenTime = Starttime * ?OneHourAcSec,
	EndTime = Starttime * ?OneHourAcSec + Sec,
	NowTime = Hour * ?OneHourAcSec + Minute * ?OneMinAcSec + Second,
	?DEBUG_OUT("ac time ~p,~p,~p",[NowTime, OpenTime, EndTime]),
	if
		NowTime < OpenTime ->
			%%即将开始(100毫秒防止进程还未启动成功)
			erlang:send_after((OpenTime - NowTime) * 1000 + 100, self(), startHdAc);
		NowTime >= OpenTime andalso NowTime =< EndTime ->
			%%活动中,
			erlang:send_after(1000, self(), startHdAc);
		true ->
			%%活动结束
			erlang:send_after((?OneDayAcSec - NowTime + OpenTime) * 1000, self(), startHdAc)
	end,
	ok.

%%tick阶段
-spec tickPhase() -> ok.
tickPhase() ->
	L1 = getPhaseOneCD(),
	L3 = getPhaseThreeCD(),
	tickPhase1(L1),
	tickPhase3(L3).

tickPhase1([]) ->
	ok;
tickPhase1([{{MapPid, _} = Key, {X, Y, ID, Cd}} | L]) ->
	Now = time:getLocalNowSec1970(),
	case Now >= Cd of
		true ->
			setPhaseOneCD(lists:keydelete(Key, 1, getPhaseOneCD())),
			psMgr:sendMsg2PS(MapPid, addMonsterToMap, {0, [{ID, 1, X, Y}]});
		_ ->
			ok
	end,	
	tickPhase1(L).

tickPhase3([]) ->
	ok;
tickPhase3([{MapPid, Cd} | L]) ->
	Now = time:getLocalNowSec1970(),
	case Now >= Cd of
		true ->
			cdEnd(MapPid);
		_ ->
			ok
	end,
	tickPhase3(L).

-spec startAc(Flag::boolean(), EndTime::uint()) -> ok.
startAc(false, EndTime) ->
	?LOG_OUT("gm cross hd battle ac will start !, cd time [~p]", [EndTime]),
	clear(),
	setPhaseOneCD([]),
	setPhaseThreeCD([]),
	setAcSwitch(true),
	setAcEndTime(time:getLocalNowSec1970() + EndTime),
	%%通知各节点服务器
	skip;
startAc(true, EndTime) ->
	Day = getWeekDay(),
	#activityCfg{starttime = L} = getAcData(),
	case lists:keyfind(Day, 1, L) of
		{Day, _} ->
			?LOG_OUT("cross hd battle ac will start !, cd time [~p]", [EndTime]),
			clear(),
			clearRank(Day),
			setPhaseOneCD([]),
			setAcSwitch(true),
			setPhaseThreeCD([]),
			setStatPlayerNum(0),
			setAcEndTime(time:getLocalNowSec1970() + EndTime),
			%%通知各节点服务器
			skip;
		_ ->
			?LOG_OUT("cross hd battle ac today not open [~p]", [Day]),
			skip
	end.

-spec closeAc(Flag::boolean()) -> ok.
closeAc(false) ->
	?LOG_OUT("gm cross hd battle ac will close !"),
	setAcSwitch(false),
	setStatPlayerNum(0),
	%%清理阶段
	setPhaseOneCD([]),
	setPhaseThreeCD([]),
	%%保存玩家数据和发送奖励
	%%1.保存玩家数据
	%%2.发送奖励
	%%3.通知玩家结算面板
	L1 = saveRankData(),	
	
	%%4.踢出所有玩家
	L2 = getMapLineInfoList(),
	erlang:send_after(getCrosMapDestoryTime(), self(), {noticeDestoryCrosMap, L2}),
	
	%%5.发送奖励
	NodeList = getNodeList(),
	Fun1 = fun({DBID, Pid}) ->
				   case lists:keyfind(DBID, 1, L1) of
					   false ->
						   ?LOG_OUT("send hd battle reward, cur db id [~p], pid [~p]", [DBID, global:whereis_name(Pid)]),
						   psMgr:sendMsg2PS(Pid, dealReward, [[], getRankData()]),
						   skip;
					   {DBID, PlayerList}->
						   ?LOG_OUT("send hd battle reward, cur db id [~p], player list [~p], pid [~p], player num [~p]", [DBID, PlayerList, global:whereis_name(Pid), length(PlayerList)]),
						   psMgr:sendMsg2PS(Pid, dealReward, [PlayerList, getRankData()]),
						   skip
				   end
		   end,
	lists:foreach(Fun1, NodeList),
	
	%%6.保存数据
	ets:tab2file(?Ets_Tab_Rank, ?Ets_Tab_Rank_Txt),
	
	%%清理字典
	clear();
closeAc(true) ->
	Day = getWeekDay(),
	#activityCfg{starttime = L} = getAcData(),
	case lists:keyfind(Day, 1, L) of
		{Day, _} ->
			?LOG_OUT("cross hd battle ac will close !"),
			setAcSwitch(false),
			%%清理阶段
			setPhaseOneCD([]),
			setPhaseThreeCD([]),
			%%保存玩家数据和发送奖励
			%%1.保存玩家数据
			%%2.发送奖励
			%%3.通知玩家结算面板
			L1 = saveRankData(),	
			
			%%4.踢出所有玩家
			L2 = getMapLineInfoList(),
			erlang:send_after(getCrosMapDestoryTime(), self(), {noticeDestoryCrosMap, L2}),
			
			%%5.发送奖励
			NodeList = getNodeList(),
			Fun1 = fun({DBID, Pid}) ->
						   case lists:keyfind(DBID, 1, L1) of
							   false ->
								   skip;
							   {DBID, PlayerList}->
								   ?LOG_OUT("send hd battle reward, cur db id [~p], player list [~p]", [DBID, PlayerList]),
								   psMgr:sendMsg2PS(Pid, dealReward, [PlayerList, getRankData()]),
								   skip
						   end
				   end,
			lists:foreach(Fun1, NodeList),
			
			%%6.保存数据
			ets:tab2file(?Ets_Tab_Rank, ?Ets_Tab_Rank_Txt),
			
			%%清理字典
			clear();
		_ ->
			?LOG_OUT("cross hd battle ac today not close [~p]", [Day]),
			skip
	end.

%%分配线路规则
-spec allocMapLine(Msg::tuple()) -> {maxLine, uint()} | {newLine, uint()} | #battleMapInfo{}.
allocMapLine({_RoleID, _RoleName, _RolePID, _RoleNetPID, _Carrer, _DBID, _AreaName, _Force, HistoryForce, _Level} = Msg) ->
	MinForce = globalCfg:getBattleWarMinMapForce(),
	MidForce = globalCfg:getBattleWarMidMapForce(),
	case getBc(HistoryForce, MinForce, MidForce) of
		?MapHighClass ->
			?DEBUG_OUT("alloc line ~p", [?MapHighClass]),
			allocMapLine1(?MapHighClass, ?MapMidClass, ?MapLowClass, Msg);
		?MapMidClass ->
			?DEBUG_OUT("alloc line ~p", [?MapMidClass]),
			allocMapLine1(?MapMidClass, ?MapLowClass, ?MapHighClass, Msg);
		?MapLowClass ->
			?DEBUG_OUT("alloc line ~p", [?MapLowClass]),
			allocMapLine1(?MapLowClass, ?MapMidClass, ?MapHighClass, Msg)
	end.

-spec allocMapLine1(A::uint(), B::uint(), C::uint(), Msg::tuple()) -> {maxLine, uint()} | {newLine, uint()} | #battleMapInfo{}.
allocMapLine1(A, B, C, Msg) ->
	case allocMapLine2(A, Msg) of
		maxLine ->
			case allocMapLine2(B, Msg) of
				maxLine ->
					case allocMapLine2(C, Msg) of
						maxLine ->
							{maxLine, ?ErrorCode_CrosBattle_CurMaxMapLine};
						newLine ->
%% 							#activityCfg{mapidlist = [MapID | _]} = getAcData(),
%% 							core:sendMsgToMapMgr(MapID, createActivityMap, {MapID, 1, {C, Msg}}),
							{newLine, C};
						#battleMapInfo{} = B2 ->
							B2
					end;
				newLine ->
%% 					#activityCfg{mapidlist = [MapID | _]} = getAcData(),
%% 					core:sendMsgToMapMgr(MapID, createActivityMap, {MapID, 1, {B, Msg}}),
					{newLine, B};
				#battleMapInfo{} = B1 ->
					B1
			end;
		newLine ->
%% 			#activityCfg{mapidlist = [MapID | _]} = getAcData(),
%% 			core:sendMsgToMapMgr(MapID, createActivityMap, {MapID, 1, {A, Msg}}),
			{newLine, A};
		#battleMapInfo{} = B0 ->
			B0
	end.

-spec allocMapLine2(Class::?MapHighClass | ?MapMidClass | ?MapLowClass, Msg::tuple()) -> maxLine | newLine | #battleMapInfo{}.	
allocMapLine2(Class, {_RoleID, _RoleName, _RolePID, _RoleNetPID, _Carrer, _DBID, _AreaName, _Force, _HistoryForce, Level}) ->
	LimitLv = globalCfg:getBattleWarLowMapAegis(),
	if
		Class =:= ?MapLowClass andalso Level >= LimitLv ->
			maxLine;
		true ->
			BML = getMapList(Class),
			LowLine = globalCfg:getBattleWarLowMapLine(),
			MidLine = globalCfg:getBattleWarMidMapLine(),
			HighLine = globalCfg:getBattleWarHighMapLine(),
			MaxPlayer = globalCfg:getBattleWarMaxLinePlayer(),
			case BML of
				[] ->
					newLine;
				L ->
					case getMaxNumMap(L, MaxPlayer) of
						[] ->
							case length(BML) >= getLineNum(Class, LowLine, MidLine, HighLine) of
								true ->
									maxLine;
								_ ->
									newLine
							end;
						B ->
							B
					end
			end
	end.

%%阶段进阶(-)
enterPhaseOne(MapPid) ->
	?LOG_OUT("mappid [~p] enter phase one",[MapPid]),
	%%清理地图所有水晶
	psMgr:sendMsg2PS(MapPid, clearMonsterAndCollectObject, 0),
	
	%%刷水晶
	
	%%获取大水晶
	MaxOreList = globalCfg:getBattleWarOreMax(),
	
	%%获取小水晶
	OreList = globalCfg:getBattleWarOre(),
	
	%%获取基地守护怪物
	MList = globalCfg:getBattleBoss(),
	
	L = OreList ++ MaxOreList,
	
	L1 = [{ID, 1, X, Y} || {X, Y, ID, _CD} <- L],
	
	L2 = [{ID, 1, X, Y} || {ID, X, Y} <- MList],
	
	psMgr:sendMsg2PS(MapPid, addMonsterToMap, {0, L1 ++ L2}),
	
	ok.

%%阶段进阶(二)
-spec enterPhaseTwo(MapPid::pid(), Camp::uint()) -> ok.
enterPhaseTwo(MapPid, Camp) ->
	?LOG_OUT("mappid [~p] enter phase two",[MapPid]),
	%%清理地图所有水晶
	CdList = getPhaseOneCD(),
	Fun = fun({{Pid, _} = Key, _}, Acc) ->
		case Pid =:= MapPid of
			true ->
				lists:keydelete(Key, 1, Acc);
			_ ->
				Acc
		end
	end,
	setPhaseOneCD(lists:foldl(Fun, CdList, CdList)),
	
	psMgr:sendMsg2PS(MapPid, clearMonsterAndCollectObject, 0),
	
	%% 取路点起点
	#recMapWayPt{x = X, y = Y} = getMapWayPtList(),
	
	PosList = globalCfg:getBattleWarGuardCoordinate(),
	[RedGuardID, BlueGuardID] = globalCfg:getBattleWarGuard(),
	[RedHourseID, BlueHourseID] = globalCfg:getBattleWarCarriage(),
	
	%%刷马车和守卫
	case Camp of
		?CampRedBattle ->
			L = [{RedGuardID, 1, X1, Y1} || {X1, Y1} <- PosList] ++ [{RedHourseID, 1, X, Y}];
		_ ->
			L = [{BlueGuardID, 1, X1, Y1} || {X1, Y1} <- PosList] ++ [{BlueHourseID, 1, X, Y}]
	end,
	%%获取基地守护怪物
	MList = globalCfg:getBattleBoss(),
	L1 = [{ID, 1, XXX, YYY} || {ID, XXX, YYY} <- MList],
	
	psMgr:sendMsg2PS(MapPid, addMonsterToMap, {0, L ++ L1}),
	
	ok.

%%阶段进阶(三)
-spec enterPhaseThree(MapPid::pid(), Cd::uint()) -> ok.
enterPhaseThree(MapPid, Cd) ->
	?LOG_OUT("mappid [~p] enter phase three",[MapPid]),
	L = getPhaseThreeCD(),
	setPhaseThreeCD([{MapPid, Cd} | L]),
	ok.

%%cd结束
-spec cdEnd(MapPid::pid()) -> ok.
cdEnd(MapPid) ->
	L = getPhaseThreeCD(),
	L1 = lists:keydelete(MapPid, 1, L),
	setPhaseThreeCD(L1),
	L2 = getMapLinePlayer(MapPid),
	B = #battleMapInfo{} = getMapLine(MapPid),
	B1 = B#battleMapInfo{mapA = 0, mapB = 0, mapT = 0, mapP = ?OnePhase},
	%%进入下一阶段
	enterPhaseOne(MapPid),

	%%更新
	updateMapLineInfo(B1),
	
	%%广播
	broadCastPhase(L2, B1),	
	ok.

%%击杀水晶增加功勋
-spec killedCryStal(RoleID::uint(), MapPid::pid(), ID::uint(), Code::uint(), Camp::uint()) -> ok.
killedCryStal(RoleID, MapPid, ID, Code, Camp) ->
	B = getMapLine(MapPid),
	L = getMapLinePlayer(MapPid),
	
	Now = time:getLocalNowSec1970(),
	OreList = globalCfg:getBattleWarOre(),
	MaxOreList = globalCfg:getBattleWarOreMax(),
	case lists:keyfind(ID, 3, OreList) of
		{X, Y, ID, Cd}->
			%%小水晶
			Ore = {X, Y, ID, Now + Cd},
			Exploit = globalCfg:getBattleWarCrystalExploit(),
			Record = globalCfg:getBattleWarCrystalIntegral(),
			ExploitEx = globalCfg:getBattleWarCrystalExploitSubsidy();
		_ ->
			%%大水晶
			{X1, Y1, ID1, Cd1} = lists:keyfind(ID, 3, MaxOreList),
			Ore = {X1, Y1, ID1, Now + Cd1},
			Exploit = globalCfg:getBattleWarCrystalMaxExploit(),
			Record = globalCfg:getBattleWarCrystalIntegralMax(),
			ExploitEx = globalCfg:getBattleWarCrystalMaxExploitSubsidy()
	end,
	
	%%增加水晶CD
	OreCDList = getPhaseOneCD(),
	setPhaseOneCD([{{MapPid, Code}, Ore} | OreCDList]),
	
	%%增加击杀分数最多队玩家战功
	addPlayerRecord(L, Camp, Exploit),
	
	%%增加个人战功
	case getMapLinePlayerByRoleID(RoleID, MapPid) of
		[] ->
			ok;
		#battlePlayerInfo{netPid = NetPid, record = R} = P ->
			P1 = P#battlePlayerInfo{
				record = R + ExploitEx
			},
			playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_CrosBattle_AddRecord, [ExploitEx]),
			updatePlayerInfo(P1)
	end,
	
	%%增加线路积分
	addMapLineRecord(B, Camp, L, Record),
	ok.

%%击杀马车
-spec killedHorse(MapPid::pid(), Camp::uint()) -> ok.
killedHorse(MapPid, Camp) ->
	L = getMapLinePlayer(MapPid),
	Now = time:getLocalNowSec1970(),
	B = #battleMapInfo{} = getMapLine(MapPid),
	RefreshTime = globalCfg:getBattleWarRefreshTime(),
	B1 = B#battleMapInfo{mapT = RefreshTime, mapP = ?ThreePhase},
	
	Exploit = globalCfg:getBattleWarCarriageOverExploit(),
	%%更新玩家采集
%% 	Fun = fun(#battlePlayerInfo{} = Info) ->
%% 		NewInfo = Info#battlePlayerInfo{isCol = ?HasNoCol},
%% 		updatePlayerInfo(NewInfo)
%% 	end,
%% 	lists:foreach(Fun, L),
	case Camp of
		?CampRedBattle ->
			addPlayerRecord(L, ?CampBlueBattle, Exploit);
		_ ->
			addPlayerRecord(L, ?CampRedBattle, Exploit)
	end,
	
	%%进入下一阶段
	enterPhaseThree(MapPid, Now + RefreshTime),
	
	%%更新
	updateMapLineInfo(B1),
	
	%%广播
	broadCastPhase(L, B1),
	ok.

%%马车到达目的地
-spec horseToTarget(MapPid::pid(), X::number(), Y::number(), Pc::uint(), Camp::uint()) -> ok.
horseToTarget(MapPid, X, Y, Pc, Camp) ->
	L = getMapLinePlayer(MapPid),
	Now = time:getLocalNowSec1970(),
	B = #battleMapInfo{} = getMapLine(MapPid),
	RefreshTime = globalCfg:getBattleWarRefreshTime(),
	B1 = B#battleMapInfo{mapT = RefreshTime, mapP = ?ThreePhase, mapExt = calcExtExploit(Pc)},
	
	%%清除马车
	psMgr:sendMsg2PS(MapPid, clearMonsterAndCollectObject, 0),
	
	%%更新玩家采集
	Fun = fun(#battlePlayerInfo{} = Info) ->
		NewInfo = Info#battlePlayerInfo{isCol = ?HasNoCol},
		updatePlayerInfo(NewInfo)
	end,
	lists:foreach(Fun, L),
	
	%%刷宝箱
	[RedGatherID, BlueGatherID] = globalCfg:getBattleWarObject(),
	
	case Camp of
		?CampRedBattle ->
			psMgr:sendMsg2PS(MapPid, addCollectToMap, {0, [{RedGatherID, 1, X, Y}]});
		_ ->
			psMgr:sendMsg2PS(MapPid, addCollectToMap, {0, [{BlueGatherID, 1, X, Y}]})
	end,
	
	%%刷守护怪
	MList = globalCfg:getBattleBoss(),
	L1 = [{ID, 1, XXX, YYY} || {ID, XXX, YYY} <- MList],
	
	psMgr:sendMsg2PS(MapPid, addMonsterToMap, {0, L1}),
	
	%%进入下一阶段
	enterPhaseThree(MapPid, Now + RefreshTime),
	
	%%更新
	updateMapLineInfo(B1),
	
	%%广播
	broadCastPhase(L, B1),
	ok.

%%同步马车血量
-spec horseHp(MapPid::pid(), Hp::uint()) -> ok.
horseHp(MapPid, Hp) ->
	%%L = getMapLinePlayer(MapPid),
	B = #battleMapInfo{} = getMapLine(MapPid),
	B1 = B#battleMapInfo{mapH = Hp},
	
	%%更新
	updateMapLineInfo(B1).
	
	%%广播
	%%broadCastPhase(L, B1).

%%计算马车血量加成
calcExtExploit(Pc) ->
	L = globalCfg:getBattleWarObjectExploitSubsidy(),
	Length = length(L),
	calcExtExploit(0, Length, L, Pc).

calcExtExploit(Length, Length, _L, _Pc) ->
	0;
calcExtExploit(Num, Length, L, Pc) ->
	{Per, Value} = lists:nth(Num + 1, L),
	case Pc >= Per * 100 of
		true ->
			Value;
		_ ->
			calcExtExploit(Num + 1, Length, L, Pc)
	end.

%%采集宝箱
-spec collectBox(MapPid::uint(), RoleID::uint()) -> ok.
collectBox(MapPid, RoleID) ->
	Now = time:getLocalNowSec1970(),
	#battleMapInfo{mapExt = Ext} = getMapLine(MapPid),
	Exploit = globalCfg:getBattleWarObjectExploit(),
	case getMapLinePlayerByRoleID(RoleID, MapPid) of
		[] ->
			?ERROR_OUT("collectBox player not exist hd battle [~p]", [RoleID]),
			ok;
		#battlePlayerInfo{netPid = NetPid, isCol = ?HasCol}->
			playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_CrosBattle_AlreadyCollect);
		#battlePlayerInfo{record = Record, netPid = NetPid, cd = CD} = P ->
			case Now - CD >= 7 * 60 of
				true ->
					P1 = P#battlePlayerInfo{
						record = Record + Exploit + Ext,
						isCol = ?HasCol,
						cd = Now
					},
					playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_CrosBattle_AddRecord, [Exploit + Ext]),
					updatePlayerInfo(P1);
				_ ->
					playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_CrosBattle_AlreadyCollect)
			end
	end,
	ok.

%%击杀玩家
-spec killedPlayer(RoleID::uint(), MapPid::pid()) -> ok.
killedPlayer(RoleID, MapPid) ->
	KillExploit = globalCfg:getBattleWarKillExploit(),
	case getMapLinePlayerByRoleID(RoleID, MapPid) of
		[] ->
			?ERROR_OUT("killedPlayer player not exist hd battle [~p]", [RoleID]),
			ok;
		#battlePlayerInfo{name = Name, kill = Kill, record = Record, netPid = NetPid} = P ->
			P1 = P#battlePlayerInfo{
				kill = Kill + 1, 
				record = Record + KillExploit
			},
			
			playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_CrosBattle_AddRecord, [KillExploit]),
			updatePlayerInfo(P1),
			
			%%广播消息
			Num = globalCfg:getBattleWarKillMessage(),
			case ((Kill + 1) rem Num) =:= 0 of
				true ->
					L = getMapLinePlayer(MapPid),
					N = stringCfg:getString(battle_war_KillMessage,[Name,Kill + 1]),
					Fun = fun(#battlePlayerInfo{netPid = NetPID}) ->
						core:sendBroadcastNotice(N, NetPID)
					end,
					lists:foreach(Fun, L);
				_ ->
					skip
			end
	end.

%%助攻击杀
-spec assKilledPlayer(RoleIDList::list(), MapPid::pid()) -> ok.
assKilledPlayer([], _) ->
	ok;
assKilledPlayer([RoleID | List], MapPid) ->
	AssKillExploit = globalCfg:getBattleWarAssKillExploit(),
	case getMapLinePlayerByRoleID(RoleID, MapPid) of
		[] ->
			?ERROR_OUT("assKilledPlayer player not exist hd battle [~p]", [RoleID]),
			ok;
		#battlePlayerInfo{netPid = NetPid, asKill = AsKill, record = Record} = P ->
			P1 = P#battlePlayerInfo{
				asKill = AsKill + 1, 
				record = Record + AssKillExploit
			},
			playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_CrosBattle_AddRecord, [AssKillExploit]),
			updatePlayerInfo(P1)
	end,
	assKilledPlayer(List, MapPid).

%%击杀守卫
-spec killedGuard(MapPid::pid(), Camp::uint()) -> ok.
killedGuard(MapPid, Camp) ->
	GuardExploit = globalCfg:getBattleWarGuardExploit(),
	B = #battleMapInfo{mapG = G} = getMapLine(MapPid),
	L = getMapLinePlayer(MapPid),
	%%增加玩家积分
	case Camp of
		?CampRedBattle ->
			addPlayerRecord(L, ?CampBlueBattle, GuardExploit);
		_ ->
			addPlayerRecord(L, ?CampRedBattle, GuardExploit)
	end,
		
	%%更新
	B1 = B#battleMapInfo{mapG = G - 1},
	updateMapLineInfo(B1),
	
	%%广播
	broadCastPhase(L, B1),
	ok.

%%增加线路积分
-spec addMapLineRecord(#battleMapInfo{}, Camp::uint(), L::list(), Record::uint()) -> ok.
addMapLineRecord(#battleMapInfo{mapPid = Pid, mapA = MapA, mapB = MapB} = B, Camp, L, Record) ->
	GuardNum = globalCfg:getBattleWarGuardNum(),
	MaxInte = globalCfg:getBattleWarCrystalMaxIntegral(),
	case Camp of
		?CampRedBattle ->
			case MapA + Record >= MaxInte of
				true -> %%进阶
					enterPhaseTwo(Pid, ?CampRedBattle),
					B1 = B#battleMapInfo{mapH = 100, mapA = 0, mapB = 0, mapC = ?CampRedBattle, mapG = GuardNum, mapP = ?TwoPhase};
				_ ->
					B1 = B#battleMapInfo{mapA = MapA + Record}
			end;
		?CampBlueBattle ->
			case MapB + Record >= MaxInte of
				true -> %%进阶
					enterPhaseTwo(Pid, ?CampBlueBattle),
					B1 = B#battleMapInfo{mapH = 100, mapA = 0, mapB = 0, mapC = ?CampBlueBattle, mapG = GuardNum, mapP = ?TwoPhase};
				_ ->
					B1 = B#battleMapInfo{mapB = MapB + Record}
			end
	end,
	
	%%更新
	updateMapLineInfo(B1),
	
	%%广播
	broadCastPhase(L, B1),
	ok.

%%增加玩家积分
-spec addPlayerRecord(L::list(), Camp::uint(), Inte::uint()) -> ok.
addPlayerRecord([], _Camp, _Inte) ->
	ok;
addPlayerRecord([#battlePlayerInfo{record = Record, netPid = NetPid, camp = C} = B | L], Camp, Inte) when Camp =:= C ->
	B1 = B#battlePlayerInfo{record = Record + Inte},
	playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_CrosBattle_AddRecord, [Inte]),
	updatePlayerInfo(B1),
	addPlayerRecord(L, Camp, Inte);
addPlayerRecord([_ | L], Camp, Inte) ->
	addPlayerRecord(L, Camp, Inte).

%%更新线路
-spec updateMapLineInfo(#battleMapInfo{}) -> ok.
updateMapLineInfo(#battleMapInfo{mapPid = Pid} = B) ->
	L = getMapLineInfoList(),
	L1 = lists:keystore(Pid, #battleMapInfo.mapPid, L, B),
	setMapLineInfoList(L1).

%%更新玩家信息
-spec updatePlayerInfo(#battlePlayerInfo{}) -> ok.
updatePlayerInfo(#battlePlayerInfo{roleID = RoleID} = P) ->
	L = getLinePlayerInfoList(),
	L1 = lists:keystore(RoleID, #battlePlayerInfo.roleID, L, P),
	setLinePlayerInfoList(L1).

%%广播阶段
-spec broadCastPhase(L::list(), #battleMapInfo{}) -> ok.
broadCastPhase(L, #battleMapInfo{mapT = T, mapP = P, mapA = A, mapB = B, mapG = G, mapC = C, mapH = H}) ->
	case P of
		?OnePhase ->
			Msg = #pk_GS2U_HDBattlePhase{
				phase = P,
				param1 = A,
				param2 = B
			};
		?TwoPhase ->
			case C of
				?CampRedBattle ->
					Msg = #pk_GS2U_HDBattlePhase{
						phase = ?TwoPhase,
						param1 = G,
						param2 = H
					};
				_ ->
					Msg = #pk_GS2U_HDBattlePhase{
						phase = ?ThreePhase,
						param1 = G,
						param2 = H
					}
			end;
		?ThreePhase ->
			Msg = #pk_GS2U_HDBattlePhase{
				phase = ?FourPhase,
				param1 = T,
				param2 = 0
			}
	end,
	broadCastPhase1(L, Msg).

broadCastPhase1([], _) ->
	ok;
broadCastPhase1([#battlePlayerInfo{netPid = NetPid} | L], Msg) ->
	playerMsg:sendNetMsg(NetPid, Msg),
	broadCastPhase1(L, Msg).

%%获取战场类型
-spec getBc(Force::uint(), MinForce::uint(), MidForce::uint()) -> uint().
getBc(Force, MinForce, _MidForce) when Force < MinForce ->
	?MapLowClass;
getBc(Force, MinForce, MidForce) when Force >= MinForce andalso Force =< MidForce ->
	?MapMidClass;
getBc(_, _, _) ->
	?MapHighClass.

-spec getLineNum(Class::uint(), LowLine::uint(), MidLine::uint(), HighLine::uint()) -> uint().
getLineNum(?MapLowClass, LowLine, _MidLine, _HighLine) ->
	LowLine;
getLineNum(?MapMidClass, _LowLine, MidLine, _HighLine) ->
	MidLine;
getLineNum(?MapHighClass, _LowLine, _MidLine, HighLine) ->
	HighLine.

%%根据战场类型获取战场列表
-spec getMapList(Class::uint()) -> list().
getMapList(Class) ->
	L = getMapLineInfoList(),
	getMapList(Class, L, []).

getMapList(_, [], L) ->
	L;
getMapList(Class, [#battleMapInfo{mapType = Type} = H | L1], L) when Class =:= Type ->
	getMapList(Class, L1, [H | L]);
getMapList(Class, [_ | L1], L) ->
	getMapList(Class, L1, L).

%%获取人数最多战场(但没有满的线路)
-spec getMaxNumMap(L::list(), MaxPlayer::uint()) -> [] | #battleMapInfo{}.
getMaxNumMap([], _) ->
	[];
getMaxNumMap([#battleMapInfo{mapNum = MapNum} = H | L], MaxPlayer) when MapNum < MaxPlayer ->
	getMaxNumMap(L, H, MaxPlayer);
getMaxNumMap([_ | L], MaxPlayer) ->
	getMaxNumMap(L, MaxPlayer).

getMaxNumMap([], B, _MaxPlayer) ->
	B;
getMaxNumMap([#battleMapInfo{mapNum = Num} = H | L], #battleMapInfo{mapNum = CurNum}, MaxPlayer) when Num > CurNum andalso Num < MaxPlayer->
	getMaxNumMap(L, H, MaxPlayer);
getMaxNumMap([_ | L], H, MaxPlayer) ->
	getMaxNumMap(L, H, MaxPlayer).

%%获取指定玩家
-spec  getMapLinePlayerByRoleID(RoleID::uint(), MapPid::pid()) -> #battlePlayerInfo{} | [].
getMapLinePlayerByRoleID(RoleID, MapPid) ->
	L = getLinePlayerInfoList(),
	case lists:keyfind(RoleID, #battlePlayerInfo.roleID, L) of
		#battlePlayerInfo{inAc = ?OnLine, mapPid = MapPid} = P ->
			P;
		_ ->
			[]
	end.

-spec getMapLinePlayerByRoleID(RoleID::uint()) -> #battlePlayerInfo{} | [].
getMapLinePlayerByRoleID(RoleID) ->
	L = getLinePlayerInfoList(),
	case lists:keyfind(RoleID, #battlePlayerInfo.roleID, L) of
		#battlePlayerInfo{} = P ->
			P;
		_ ->
			[]
	end.		
		   
%%获取当前线路玩家
-spec getMapLinePlayer(MapPid::pid()) -> list().
getMapLinePlayer(MapPid) ->
	L = getLinePlayerInfoList(),
	getMapLinePlayer(MapPid, L, []).
getMapLinePlayer(_MapPid, [], L) ->
	L;
getMapLinePlayer(MapPid, [#battlePlayerInfo{mapPid = Pid, inAc = ?OnLine} = H | L1], L) when Pid =:= MapPid ->
	getMapLinePlayer(MapPid, L1, [H | L]);
getMapLinePlayer(MapPid, [_ | L1], L) ->
	getMapLinePlayer(MapPid, L1, L).
	
%%获取当前线路
-spec getMapLine(MapPid::pid()) -> #battleMapInfo{} | false.
getMapLine(MapPid) ->
	L = getMapLineInfoList(),
	case lists:keyfind(MapPid, #battleMapInfo.mapPid, L) of
		#battleMapInfo{} = B ->
			B;
		_ ->
			?ERROR_OUT("~p.~w getMapLine can not find mappid ~p", [?MODULE, ?LINE, MapPid]),
			false
	end.

%%获取混沌跨服配置数据
-spec getAcData() -> #activityCfg{}.
getAcData() ->
	#activityCfg{} = Ac = 
	getCfg:getCfgPStack(cfg_activity, ?CfgID),
	Ac.

%%获取服务器活动倒计时
-spec getAcCd(NetPid::pid()) -> ok.
getAcCd(NetPid) ->
	case getAcSwitch() of
		false ->
			playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_CrosBattle_AcHasNotOpen);
		true ->
			EndTime = getAcEndTime(),
			Now = time:getLocalNowSec1970(),
			Msg = #pk_GS2U_HDBattleCD{
				time = EndTime - Now
			},
			playerMsg:sendNetMsg(NetPid, Msg)
	end,
	ok.
%%获取战功列表
-spec getExploits(MapPid::pid(), NetPid::pid()) -> ok.
getExploits(MapPid, NetPid) ->
	case getAcSwitch() of
		false ->
			playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_CrosBattle_AcHasNotOpen);
		true ->
			L = getMapLinePlayer(MapPid),
			Msg = #pk_GS2U_HDBattleExploits{type = 1, exploits = getExploits1(L)},
			?DEBUG_OUT("NetPid getExploits Lists ~p ~p ~p",[NetPid,MapPid,Msg]),
			playerMsg:sendNetMsg(NetPid, Msg)
	end,
	ok.

getExploits1([]) ->
	[];
getExploits1(L) ->
	getExploits1(L, []).
getExploits1([], L) ->
	L1 = lists:reverse(lists:keysort(#pk_HDBattleExploit.exploit, L)),
	Fun = fun(#pk_HDBattleExploit{} = H, {Num, Acc}) ->
				H1 = H#pk_HDBattleExploit{rankID = Num + 1},
				{Num + 1, [H1 | Acc]}
		  end,
	{_, L2} = lists:foldl(Fun, {0, []}, L1),
	lists:reverse(L2);
getExploits1([#battlePlayerInfo{} = B | L1], L) ->
	Msg = #pk_HDBattleExploit{
		servername = B#battlePlayerInfo.sname,
		camp = B#battlePlayerInfo.camp,
		exploit = B#battlePlayerInfo.record,
		name = B#battlePlayerInfo.name,
		roleID = B#battlePlayerInfo.roleID,
		killNum = B#battlePlayerInfo.kill,
		asKillNum = B#battlePlayerInfo.asKill
	},
	getExploits1(L1, [Msg | L]).

%%设置活动开关
-spec setAcSwitch(State::boolean()) -> ok.
setAcSwitch(State) ->
	put(hdAcSwitch, State).

%%获取活动开关
-spec getAcSwitch() -> boolean().
getAcSwitch() ->
	case get(hdAcSwitch) of
		undefined ->
			false;
		State ->
			State
	end.

%%设置地图线路信息
-spec setMapLineInfoList(L::list()) -> ok.
setMapLineInfoList(L) ->
	put(mapLineInfoList, L),
	ok.

%%获取地图线路信息
-spec getMapLineInfoList() -> list().
getMapLineInfoList() -> 
	case get(mapLineInfoList) of
		undefined ->
			[];
		L ->
			L
	end.

%%设置某条线路玩家所有信息
-spec setLinePlayerInfoList(L::list()) -> ok.
setLinePlayerInfoList(L) ->
	put(linePlayerInfoList, L).

%%获取某条线路玩家所有信息
-spec getLinePlayerInfoList() -> list().
getLinePlayerInfoList() ->
	case get(linePlayerInfoList) of
		undefined ->
			[];
		L ->
			L
	end.

%%设置三阶段倒计时信息
-spec setPhaseThreeCD(L::list()) -> ok.
setPhaseThreeCD(L) ->
	put(phaseThreecd,	L).

%%获取三阶段倒计时信息
-spec getPhaseThreeCD() -> list().
getPhaseThreeCD() ->
	case get(phaseThreecd) of
		undefined ->
			[];
		L ->
			L
	end.

%%设置一阶段倒计时信息
-spec setPhaseOneCD(L::list()) -> ok.
setPhaseOneCD(L) ->
	put(phaseOnecd,	L).

%%获取一阶段倒计时信息
-spec getPhaseOneCD() -> list().
getPhaseOneCD() ->
	case get(phaseOnecd) of
		undefined ->
			[];
		L ->
			L
	end.

%%设置活动倒计时
-spec setAcEndTime(Time::uint()) -> ok.
setAcEndTime(Time) ->
	put(acEndTime, Time).

%%获取活动倒计时
-spec getAcEndTime() -> uint().
getAcEndTime() ->
	case get(acEndTime) of
		undefined ->
			0;
		Time ->
			Time
	end.

%%活动实时统计人数
-spec setStatPlayerNum(Num::uint()) -> ok.
setStatPlayerNum(Num) ->
	put(statPlayerNum, Num).

%%获取活动实时统计人数
-spec getStatPlayerNum() -> ok.
getStatPlayerNum() ->
	case get(statPlayerNum) of
		undefined ->
			0;
		Time ->
			Time
	end.


-spec getMapWayPtList() -> list().
getMapWayPtList() ->
	#activityCfg{mapidlist = [MapID | _]} = getAcData(),
	Pt = core:getMapWayPt(MapID),
	Length = misc:ceil(length(Pt) / 2),
	lists:nth(Length, Pt).

%%设置活动分配线路列表
-spec setAcAllocLine(L::list()) -> ok.
setAcAllocLine(L) ->
	put(acAllocLine, L),
	ok.

%%获取活动分配线路列表
-spec getAcAllocLine() -> list().
getAcAllocLine() ->
	case get(acAllocLine) of
		undefined ->
			[];
		L ->
			L
	end.

%%保存各节点信息
-spec setNodeList(L::uint()) -> ok.
setNodeList(L) ->
	put(gsNodeList, L),
	ok.

%%获取各节点信息
-spec getNodeList() -> ok.
getNodeList() ->
	case get(gsNodeList) of
		undefined ->
			[];
		L ->
			L
	end.

%%获取位面销毁时间
-spec getCrosMapDestoryTime() -> uint().
getCrosMapDestoryTime() ->
	case getCfg:getCfgPStack(cfg_mapsetting, ?CrosHdBattleMapID) of
		#mapsettingCfg{finish_time = Time} ->
			Time * 1000;
		_ ->
			0
	end.

-spec getRankData() -> ok.
getRankData() ->
	L = ets:tab2list(?Ets_Tab_Rank),
	L1 = lists:reverse(lists:keysort(#?Ets_Tab_Rank.record, L)),
	case length(L1) =< ?RankNum of
		true ->
			L1;
		_ ->
			lists:sublist(L1, ?RankNum)
	end.

-spec getWeekDay() -> uint().
getWeekDay() ->
	{{Year,Month,Day}, {_,_,_}} = time:getLocalNowDateTime1970(),
	calendar:day_of_the_week(Year,Month,Day).

%%保存排行数据
-spec saveRankData() -> ok.
 saveRankData() ->
	MapList = getMapLineInfoList(),
	MapFun = fun(#battleMapInfo{mapPid = MapPid}, Acc) ->
		L0 = getMapLinePlayer(MapPid),
		Msg = #pk_GS2U_HDBattleExploits{type = ?BoxClass2, exploits = getExploits1(L0)},
		[{MapPid, Msg} | Acc]
	end,
	MsgList = lists:foldl(MapFun, [], MapList),
	
	L = getLinePlayerInfoList(),
	Fun = fun(#battlePlayerInfo{
		roleID = RoleID,
		dbID = DbID,
		name = Name,
		sname = Sname,
		force = Force,
		carrer = Carrer,
		record = Record,
		inAc = InAc,
		mapPid = Pid,
		netPid = NetPid
		}, Acc) ->
		%%保存数据
		case myEts:lookUpEts(?Ets_Tab_Rank, RoleID) of
			[#?Ets_Tab_Rank{record = R} = B] ->
				B1 = B#?Ets_Tab_Rank{
					sname = Sname,
					dbID = DbID,
					force = Force,
					name = Name,
					record = R + Record
				};
			_ ->
				B1 = #?Ets_Tab_Rank{
					sname = Sname,
					roleID = RoleID,
					carrer = Carrer,
					dbID = DbID,
					force = Force,
					name = Name,
					record = Record
				}
		end,
		ets:insert(?Ets_Tab_Rank, B1),
		
		%%发送结算
		case InAc of
			?OnLine ->
				case lists:keyfind(Pid, 1, MsgList) of
					{_, Msg} ->
						playerMsg:sendNetMsg(NetPid, Msg);
					_ ->
						skip
				end;
			_ ->
				skip
		end,
		
		%%发奖励
		case lists:keyfind(DbID, 1, Acc) of
			{DbID, RoleIDList} ->
				lists:keyreplace(DbID, 1, Acc, {DbID, [{RoleID, Record} | RoleIDList]});
			false ->
				[{DbID, [{RoleID, Record}]} | Acc]
		end
	end,
	lists:foldl(Fun, [], L).

%%清理排行榜
-spec clearRank(Day::uint()) -> ok.
clearRank(Day) when Day =:= ?WeekOne orelse Day =:= ?WeekFive ->
	ets:delete_all_objects(?Ets_Tab_Rank),
	ets:tab2file(?Ets_Tab_Rank, ?Ets_Tab_Rank_Txt),	
	ok;
clearRank(_) ->
	ok.

%%清理进程字典
-spec clear() -> ok.
clear() ->
	setAcEndTime(0),
	setAcAllocLine([]),
	setMapLineInfoList([]),
	setLinePlayerInfoList([]).


%%%===================================================================
%%% Internal functions跨服战场
%%%===================================================================
dump_rank()->
	case file:read_file_info(?Ets_Tab_Rank_Txt) of
		{ok,_Info} ->
					%%有缓存文件，强制加载成功，否则报错
					{ok,_} = ets:file2tab(?Ets_Tab_Rank_Txt),
					?LOG_OUT("ets arena rank[~ts],load cache ok",[?Ets_Tab_Rank_Txt])
	end,
	RankList = ets:match(	?Ets_Tab_Rank, '$1'),
	lists:foreach(fun([#battleRank{roleID = RoleId,sname=Servername,record=Record}])->
					?LOG_OUT("~ts,~w,~w",[Servername,RoleId,Record])
				  end,RankList)
.