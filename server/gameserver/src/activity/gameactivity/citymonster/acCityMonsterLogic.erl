%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, 好玩一二三
%%% @doc
%%% 主城刷怪活动逻辑模块
%%% @end
%%% Created : 06. 二月 2015 14:32
%%%-------------------------------------------------------------------
-module(acCityMonsterLogic).
-author("tiancheng").

-include("../../activityPrivate.hrl").
-include("acCityMonsterPrivate.hrl").
-include("../activityPhaseDefine.hrl").

%% 刷新的阶段
-define(FreshPhase_Monster, 7).
-define(FreshPhase_Boss, 8).
-define(FreshPhase_Collect, 9).

%% API
-export([
	activityChangeCallBack/1,
	activityMapMsg/2
]).

-export([
	addACMapPIDList/1,
	delACMapPIDList/1,
	createMonsterToMap/0,
	createBossToMap/0,
	clearBoss/0,
	clearCollect/0
]).

%% 主活动模块进程回调
-spec activityChangeCallBack(Phase::uint()) -> ok.
activityChangeCallBack(?ActivityPhase_CityMonster_1) ->
	%% 活动进入开始阶段，什么也不处理
	?LOG_OUT("~p ~p wait start", [?MODULE, self()]),
	setACState(1),
	ok;
activityChangeCallBack(?ActivityPhase_CityMonster_2) ->
	%% 跑马灯第一次公告
	?LOG_OUT("~p ~p first notice", [?MODULE, self()]),
	setACState(2),

	sendPMDToAllPlayer(cityMonsterAcWaitStart),
	ok;
activityChangeCallBack(?ActivityPhase_CityMonster_3) ->
	%% 跑马灯第二次公告
	?LOG_OUT("~p ~p second notice", [?MODULE, self()]),
	setACState(3),

	sendPMDToAllPlayer(cityMonsterAcWaitStart),
	ok;
activityChangeCallBack(?ActivityPhase_CityMonster_4) ->
	%% 正式开始
	?LOG_OUT("~p ~p start", [?MODULE, self()]),

	sendPMDToAllPlayer(cityMonsterAcStart),

	%% 设置活动为刷小怪阶段
	setACState(?FreshPhase_Monster),

	%% 刷怪
	setNowMonsterChaosIndex(0),
	createMonsterToMap(),
	ok;
activityChangeCallBack(?ActivityPhase_Close) ->
	%% 结束
	?LOG_OUT("~p ~p end", [?MODULE, self()]),
	setACState(?ActivityPhase_Close),

	%% 提示
	sendPMDToAllPlayer(cityMonsterAcEnd),

	%% 清理数据
	case getNowMonsterChaos() of
		{Index, ChaosList} when Index > 0 ->
			ChaosID = lists:nth(Index, ChaosList),
			#chaosCfg{
				type = ?ConfChaos_CityMonster,
				monsterIdList = IDList} = getCfg:getCfgPStack(cfg_chaos, ChaosID),
			clearAllMonster(IDList);
		_ ->
			skip
	end,
	clearBoss(),
	clearCollect(),
	ok;
activityChangeCallBack(Phase) ->
	?ERROR_OUT("~p ~p activityChangeCallBack:~p", [?MODULE, self(), Phase]),
	ok.

%% 活动地图的消息
-spec activityMapMsg(MsgType::uint(), Data::term()) -> ok.
activityMapMsg(?ACMapMsg_CreateMap, {_CreateRoleID,_MapID,Pid,PlayerEts,MonsterEts,CollectEts,_NpcEts}) ->
	addACMapPIDList({Pid,PlayerEts,MonsterEts,CollectEts}),
	State = getACState(),
	case State of
		?FreshPhase_Monster ->
			NowKillNumber = getNowKillMonsterNumber(),
			MaxKillNumber = activityCommon:getValue(?KillMonsterNum),
			case (MaxKillNumber - NowKillNumber) > 0 of
				true ->
					%% 小怪还没有杀完
					case getNowMonsterChaos() of
						{Index, ChaosList} when Index > 0 ->
							ChaosID = lists:nth(Index, ChaosList),
							#chaosCfg{
								type = ?ConfChaos_CityMonster,
								monsterIdList = IDList,
								posList = PosList} = getCfg:getCfgPStack(cfg_chaos, ChaosID),
							MonsterList = activityCommon:getAllocList(IDList, PosList),
							psMgr:sendMsg2PS(Pid, addMonsterToMap, {0, MonsterList});
						_ ->
							skip
					end;
				_ ->
					?LOG_OUT("~p ~p FreshPhase_Monster:~p,~p", [?MODULE, self(), MaxKillNumber, NowKillNumber]),
					skip
			end;
		?FreshPhase_Boss ->
			ChaosID = activityCommon:getValue(?BossChaosID),
			#chaosCfg{
				type = ?ConfChaos_CityMonster,
				monsterType = ?HDBattle_Type_Boss,
				monsterIdList = IDList,
				posList = PosList} = getCfg:getCfgPStack(cfg_chaos, ChaosID),
			MonsterList = activityCommon:getAllocList(IDList, PosList),
			psMgr:sendMsg2PS(Pid, addMonsterToMap, {0, MonsterList});
		?FreshPhase_Collect ->
			ChaosID = activityCommon:getValue(?CollectChaosID),
			#chaosCfg{
				type = ?ConfChaos_CityMonster,
				monsterType = ?HDBattle_Type_Collect,
				monsterIdList = IDList,
				posList = PosList} = getCfg:getCfgPStack(cfg_chaos, ChaosID),
			MonsterList = activityCommon:getAllocList(IDList, PosList),
			psMgr:sendMsg2PS(Pid, addCollectToMap, {0, MonsterList});
		_ ->
			skip
	end,
	ok;
activityMapMsg(?ACMapMsg_DestoryMap, MapPID) ->
	delACMapPIDList(MapPID),
	ok;
activityMapMsg(?ACMapMsg_PlayerEnter, {_RoleID, _MapPID, #recMapObject{netPid = NetPid}}) ->
	case getACState() =:= ?FreshPhase_Monster of
		true ->
			case getNowMonsterChaos() of
				{Index, ChaosList} when Index > 0 ->
					ChaosID = lists:nth(Index, ChaosList),
					#chaosCfg{
						type = ?ConfChaos_CityMonster,
						time = AllTime} = getCfg:getCfgPStack(cfg_chaos, ChaosID),
					FreshTime = getNowfreshMonsterTime(),
					case AllTime > 0 andalso erlang:is_integer(FreshTime) andalso FreshTime > 0 of
						true ->
							NowTime = time:getUTCNowMS(),
							Time = (NowTime - FreshTime) div 1000,
							TT = erlang:max(0, AllTime - Time),
							gsSendMsg:sendNetMsg(NetPid, #pk_GS2U_ACCityMonsterSurplusTime{surplusTime = TT});
						_ ->
							skip
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok;
activityMapMsg(?ACMapMsg_KillMonster, {_MapID, _MapPID, _AttackRoleID, _MonsterCode, MonsterID}) ->
	State = getACState(),
	case State =:= ?FreshPhase_Monster orelse State =:= ?FreshPhase_Boss of
		true ->
			monsterDead(MonsterID);
		_ ->
			skip
	end,
	ok;
activityMapMsg(_MsgType, _Data) ->
	ok.

%% 有一只怪物死亡
monsterDead(MonsterID) ->
	State = getACState(),
	case State of
		?FreshPhase_Monster ->
			?LOG_OUT("~p ~p monsterDead:~p", [?MODULE, self(), MonsterID]),

			%% 是刷小怪阶段
			case getNowMonsterChaos() of
				{Index, ChaosList} when Index > 0 ->
					ChaosID = lists:nth(Index, ChaosList),
					#chaosCfg{
						type = ?ConfChaos_CityMonster,
						monsterIdList = IDList,
						time = Time} = getCfg:getCfgPStack(cfg_chaos, ChaosID),
					case lists:member(MonsterID, IDList) of
						true ->
							NowKillNumber = getNowKillMonsterNumber() + 1,
							setNowKillMonsterNumber(NowKillNumber),
							MaxKillNumber = activityCommon:getValue(?KillMonsterNum),
							Diff = MaxKillNumber - NowKillNumber,
							case Diff > 0 of
								true ->
									%% 是否要给出击杀的系统提示
									Rand = misc:rand(1, Diff),
									case Rand > (Diff / 2) of
										true ->
											sendTipsToAllCityPlayer(?ErrorCode_ActivityCityMonsterKillMonsterNumber,
																	[Index, NowKillNumber, MaxKillNumber]);
										_ ->
											skip
									end;
								_ ->
									%% 已经击杀完成，先清理其余的小怪
									clearAllMonster(IDList),

									%% 判断是否继续下一波刷怪
									NextIndex = Index + 1,
									case NextIndex =< erlang:length(ChaosList) of
										true ->
											case Time > 0 of
												true ->
													sendSysChatToAllCityPlayer(cityMonster_NextMonster, [Time]),
													sendMsgToActivityClient(#pk_GS2U_ACCityMonsterSurplusTime{surplusTime = Time}),
													setNowfreshMonsterTime(time:getUTCNowMS()),
													erlang:send_after(Time * 1000, self(), freshNextMonsterTick);
												_ ->
													createMonsterToMap()
											end;
										_ ->
											%% 没得下一波怪了
											CID = activityCommon:getValue(?BossChaosID),
											#chaosCfg{
												type = ?ConfChaos_CityMonster,
												monsterType = ?HDBattle_Type_Boss,
												time = BossTime} = getCfg:getCfgPStack(cfg_chaos, CID),
											case BossTime > 0 of
												true ->
													sendMsgToActivityClient(#pk_GS2U_ACCityMonsterSurplusTime{surplusTime = Time}),
													setNowfreshMonsterTime(time:getUTCNowMS()),
													erlang:send_after(Time * 1000, self(), freshNextbossTick);
												_ ->
													createBossToMap()
											end
									end
							end;
						_ ->
							skip
					end;
				_ ->
					skip
			end;
		?FreshPhase_Boss ->
			ChaosID = activityCommon:getValue(?BossChaosID),
			#chaosCfg{
				type = ?ConfChaos_CityMonster,
				monsterType = ?HDBattle_Type_Boss,
				monsterIdList = IDList} = getCfg:getCfgPStack(cfg_chaos, ChaosID),
			case lists:member(MonsterID, IDList) of
				true ->
					%% 是boss被击杀了，跑马灯，摸宝
					%%CXTime = activityCommon:getValue(?CollectChaosID_Time),
					Content = stringCfg:getString(cityMonsterAcEndItem),
					sendPMDToAllCityPlayer(Content),

					%% 刷宝箱
					createCollectToMap();
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%% 往地图中刷小怪
createMonsterToMap() ->
	case getACState() >= 4 of
		true ->
			setNowfreshMonsterTime(0),
			setNowKillMonsterNumber(0),
			case getNowMonsterChaos() of
				{Index, ChaosList} ->
					NextIndex = Index + 1,
					case NextIndex =< erlang:length(ChaosList) of
						true ->
							ChaosID = lists:nth(NextIndex, ChaosList),
							#chaosCfg{
								type = ?ConfChaos_CityMonster,
								monsterIdList = IDList,
								posList = PosList} = getCfg:getCfgPStack(cfg_chaos, ChaosID),
							MonsterList = activityCommon:getAllocList(IDList, PosList),

							?WARN_OUT("createMonsterToMap:~p,~p,~p", [Index, ChaosID, ChaosList]),

							%% 往地图中刷怪
							sendMsgToActivityMap(addMonsterToMap, {0, MonsterList}),

							%% 记录下本次刷怪的index
							setNowMonsterChaosIndex(NextIndex),
							ok;
						_ ->
							%% 小怪已经刷完
							?ERROR_OUT("createMonsterToMap:~p:~p,~p", [self(),Index,ChaosList]),
							skip
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%% 往地图中刷boss
createBossToMap() ->
	case getACState() =:= ?FreshPhase_Monster of
		true ->
			setACState(?FreshPhase_Boss),
			setNowfreshMonsterTime(0),
			ChaosID = activityCommon:getValue(?BossChaosID),
			#chaosCfg{
				type = ?ConfChaos_CityMonster,
				monsterType = ?HDBattle_Type_Boss,
				monsterIdList = IDList,
				posList = PosList} = getCfg:getCfgPStack(cfg_chaos, ChaosID),
			MonsterList = activityCommon:getAllocList(IDList, PosList),
			?LOG_OUT("~p ~p createBossToMap:~p", [?MODULE, self(), MonsterList]),
			sendSysChatToAllCityPlayer(cityMonster_NetBoss, []),

			%% 往地图中刷怪
			sendMsgToActivityMap(addMonsterToMap, {0, MonsterList});
		_ ->
			skip
	end,
	ok.

%% 往地图中刷采集物
createCollectToMap() ->
	case getACState() =:= ?FreshPhase_Boss of
		true ->
			setACState(?FreshPhase_Collect),

			%% 清理掉所有的boss
			clearBoss(),

			ChaosID = activityCommon:getValue(?CollectChaosID),
			#chaosCfg{
				type = ?ConfChaos_CityMonster,
				monsterType = ?HDBattle_Type_Collect,
				monsterIdList = IDList,
				posList = PosList} = getCfg:getCfgPStack(cfg_chaos, ChaosID),
			MonsterList = activityCommon:getAllocList(IDList, PosList),
			?LOG_OUT("~p ~p createCollectToMap:~p", [?MODULE, self(), MonsterList]),
			%% 往地图中刷采集物
			sendMsgToActivityMap(addCollectToMap, {0, MonsterList}),
			ok;
		_ ->
			skip
	end,
	ok.

%% 删除所有地图中的怪物
clearAllMonster(FreshMonsterList) ->
	L = getACMapPIDList(),
	FunEts = fun(#recMapObject{id = ID, code = Code}, CodeList) ->
		case lists:member(ID, FreshMonsterList) of
			true ->
				[Code | CodeList];
			_ ->
				CodeList
		end
	end,
	Fun = fun({MapPID, _, MonsterEts, _}) ->
		CList = ets:foldl(FunEts, [], MonsterEts),
		psMgr:sendMsg2PS(MapPID, clearSpawn, CList)
	end,
	lists:foreach(Fun, L),
	ok.

%% 清除所有boss
clearBoss() ->
	ChaosID = activityCommon:getValue(?BossChaosID),
	#chaosCfg{
		type = ?ConfChaos_CityMonster,
		monsterType = ?HDBattle_Type_Boss,
		monsterIdList = IDList} = getCfg:getCfgPStack(cfg_chaos, ChaosID),
	clearAllMonster(IDList).

%% 清除所有采集物
clearCollect() ->
	ChaosID = activityCommon:getValue(?CollectChaosID),
	#chaosCfg{
		type = ?ConfChaos_CityMonster,
		monsterType = ?HDBattle_Type_Collect,
		monsterIdList = IDList} = getCfg:getCfgPStack(cfg_chaos, ChaosID),
	L = getACMapPIDList(),
	FunEts = fun(#recMapObject{id = ID, code = Code}, CodeList) ->
		case lists:member(ID, IDList) of
			true ->
				[Code | CodeList];
			_ ->
				CodeList
		end
	end,
	Fun = fun({MapPID, _, _, CollectEts}) ->
		CList = ets:foldl(FunEts, [], CollectEts),
		psMgr:sendMsg2PS(MapPID, clearCollect, CList)
	end,
	lists:foreach(Fun, L),
	ok.

sendMsgToActivityMap(MsgID, Msg) ->
	L = getACMapPIDList(),
	Fun = fun({Pid, _, _, _}) ->
		psMgr:sendMsg2PS(Pid, MsgID, Msg)
	end,
	lists:foreach(Fun, L),
	ok.

getNowMonsterChaos() ->
	#globalsetupCfg{setpara = L} = getCfg:getCfgPStack(cfg_globalsetup, ?MonsterChaosID),
	case getNowMonsterChaosIndex() of
		undefined ->
			case erlang:length(L) > 0 of
				true ->
					{0, L};
				_ ->
					?ERROR_OUT("getNowMonsterChaos:~p,~p", [?MonsterChaosID,L]),
					false
			end;
		V ->
			{V, L}
	end.

%% 全服跑马灯
-spec sendPMDToAllPlayer(StrID::atom()) -> ok.
sendPMDToAllPlayer(StrID) ->
	Content = stringCfg:getString(StrID),
	activityCommon:sendBroadcastNotice(Content),
	ok.

%% 碧空城跑马灯
sendPMDToAllCityPlayer(Content) ->
	L = getACMapPIDList(),

	%% 跑马灯
	NoticeInfo = #pk_NoticeInfo{
		id = 9999999999,
		type = 0,
		pos = 0, %%走马灯
		content = Content,
		color = 16#FFFFFF,
		afterSecondStart = 0,
		duration = 120,
		interval = 30
	},
	PMDMsg = #pk_GS2U_NoticeAdd{notice =[NoticeInfo]},

	FunEts = fun(#recMapObject{netPid = Pid}, _) ->
		gsSendMsg:sendNetMsg(Pid, PMDMsg)
	end,
	Fun = fun({_, PlayerEts, _, _}) ->
		ets:foldl(FunEts, 0, PlayerEts)
	end,
	lists:foreach(Fun, L),
	ok.

%% 给所有的碧空城玩家tips提示
sendTipsToAllCityPlayer(ErrorCode, Param) ->
	Msg = playerMsg:getErrorCodeMsg(ErrorCode, Param),
	sendMsgToActivityClient(Msg).

%% 给所有的碧空城玩家聊天频道系统提示
sendSysChatToAllCityPlayer(ID, Param) ->
	Content = stringCfg:getString(ID, Param),
	ChatInfo = playerChat:getSystemChatInfo(Content),
	sendMsgToActivityClient(ChatInfo).

sendMsgToActivityClient(Msg) ->
	L = getACMapPIDList(),
	FunEts = fun(#recMapObject{netPid = NetPid}, _) ->
		gsSendMsg:sendNetMsg(NetPid, Msg)
	end,
	Fun = fun({_, PlayerEts, _, _}) ->
		ets:foldl(FunEts, 0, PlayerEts)
	end,
	lists:foreach(Fun, L),
	ok.

%% ====================================================================
%% state functions
%% ====================================================================
%% 守卫碧空城活动阶段
setACState(State) ->
	put('ACState', State).

getACState() ->
	case get('ACState') of
		undefined ->
			0;
		V ->
			V
	end.

%% 获取活动地图的PID列表
getACMapPIDList() ->
	case get('ACMapPIDList') of
		undefined ->
			[];
		V ->
			V
	end.

setACMapPIDList(List) ->
	put('ACMapPIDList', List).

addACMapPIDList({PID, _PETS, _METS, _CEts} = V) ->
	L = getACMapPIDList(),
	NL = case lists:keymember(PID, 1, L) of
			 true ->
				 lists:keyreplace(PID, 1, L, V);
			 _ ->
				 lists:keystore(PID, 1, L, V)
		 end,
	setACMapPIDList(NL).

delACMapPIDList(PID) ->
	L = getACMapPIDList(),
	NL = lists:keydelete(PID, 1, L),
	setACMapPIDList(NL).

%% 获取当前击杀的小怪数量
getNowKillMonsterNumber() ->
	case get('KillMonsterNumber') of
		undefined ->
			0;
		V ->
			V
	end.

setNowKillMonsterNumber(Number) ->
	put('KillMonsterNumber', Number).

getNowfreshMonsterTime() ->
	case get('nowfreshMonsterTime') of
		undefined ->
			0;
		V ->
			V
	end.

setNowfreshMonsterTime(Time) ->
	put('nowfreshMonsterTime', Time).

getNowMonsterChaosIndex() ->
	get('NowMonsterChaos').

setNowMonsterChaosIndex(Index) ->
	put('NowMonsterChaos', Index).