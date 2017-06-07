%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%% 副本或者位面进度完成
%%% @end
%%% Created : 04. 九月 2014 10:54
%%%-------------------------------------------------------------------
-module(copyMapScheduleComplete).
-author("tiancheng").

-include("copyMapScheduleDefine.hrl").

%% API
-export([
	killedMonsterInCopyMap/3,
	collectItemInCopyMap/3,
	getCopyMapProcessRec/1,
	checkCompleteCopyMap/2,
	getCopyMapScheduleConf/2,
	animationOver/2,
	characterOver/2
]).

%%玩家在副本中杀死了一个怪物
-spec killedMonsterInCopyMap(GroupID, MonsterCode, MonsterID) -> ok when
	GroupID::uint(), MonsterCode::uint(),MonsterID::uint().
killedMonsterInCopyMap(GroupID, MonsterCode, MonsterID) ->
	%%勇士试炼副本特殊处理
	case mapState:getMapSubType() of
		?MapSubTypeWarrior ->
			%%获取bossid列表
			Fun = fun(MissionID, AccList) ->
				#warriortrialCfg{bossid = BossID} = getCfg:getCfgPStack(cfg_warriortrial, MissionID),
				[BossID|AccList]
				  end,
			BossIDList = lists:foldl(Fun, [], getCfg:get1KeyList(cfg_warriortrial)),
			case lists:member(MonsterID, BossIDList) of
				true ->
					Ets = mapState:getMapPlayerEts(),
					MatchSpec = ets:fun2ms(
						fun(Mapobject) when
							Mapobject#recMapObject.mapPid =:= self() andalso Mapobject#recMapObject.groupID =:= GroupID ->
							Mapobject#recMapObject.pid
						end),
					[PlayerPid| _] = myEts:selectEts(Ets, MatchSpec),
					psMgr:sendMsg2PS(PlayerPid, warriorTrialKillBoss, {});
				_ ->
					skip
			end;
		_ ->
			%% 优先检测是否副本结束
			case checkAndUpdateCopyProcess(GroupID, MonsterID) of
				true ->
					%% 副本提前强制结束
					completeCopyMapFailed(GroupID);
				_ ->
					case getHasCompleteCopyMapCondition(GroupID, ?CopyMapEndCond_KillMonster, MonsterID) of
						true ->
							%% 计数
							incKilledMonsterNum(GroupID, MonsterID),

							sendProcessToPlayer(GroupID),

							%% 判断副本是否完成
							case checkCompleteCopyMap(GroupID, MonsterCode) of
								true ->
									completeCopyMap(GroupID);
								_ ->
									skip
							end;
						false ->
							skip
					end,

					%% 刷新子进度
					completeParallelScheduleConf(GroupID, ?CopyMapEndCond_KillMonster, MonsterID, 1)
			end
	end,

	ok.

%% 玩家在副本中完成了一次采集
-spec collectItemInCopyMap(GroupID::uint(), ItemID::uint(), Number::uint()) -> ok.
collectItemInCopyMap(GroupID, ItemID, Number) ->
	case getHasCompleteCopyMapCondition(GroupID, ?CopyMapEndCond_CollectItem, ItemID) of
		true ->
			%% 计数
			incCollectItemNum(GroupID, ItemID, Number),

			%% 在位面或者副本中完成的采集提示
			noticeCollectItem(GroupID),

			sendProcessToPlayer(GroupID),

			%% 判断副本是否完成
			case checkCompleteCopyMap(GroupID, 0) of
				true ->
					completeCopyMap(GroupID);
				_ ->
					skip
			end;
		_ ->
			skip
	end,

	%% 刷新子进度
	completeParallelScheduleConf(GroupID, ?CopyMapEndCond_CollectItem, ItemID, Number),
	ok.

-spec animationOver(GroupID::uint(), AN::uint()) -> ok.
animationOver(GroupID, AN) ->
	?DEBUG_OUT("map:~p,an:~p",[mapState:getMapId(), AN]),
	case copyMapScheduleState:getMapScheduleAnimationID(GroupID) of
		AN when is_number(AN) ->
			copyMapScheduleState:delMapScheduleAnimationID(GroupID),
			case getHasCompleteCopyMapCondition(GroupID, ?CopyMapEndCond_PlayAnimation, 0) of
				true ->
					sendProcessToPlayer(GroupID),
					%% 判断副本是否完成
					case checkCompleteCopyMap(GroupID, 0) of
						true ->
							completeCopyMap(GroupID);
						_ ->
							skip
					end;
				_ ->
					skip
			end;
			%% 刷新子进度
			%%	completeParallelScheduleConf(GroupID, ?CopyMapEndCond_CollectItem, ItemID, Number),
		_->
		   skip
	end,
	ok.

-spec characterOver(GroupID::uint(), Schedule::uint()) -> ok.
characterOver(GroupID, Schedule) ->
	?DEBUG_OUT("map:~p,~p, schedule:~p",[mapState:getMapId(), self(), Schedule]),
	case copyMapScheduleState:getMapScheduleCharacterID(GroupID) of
		Schedule when is_number(Schedule) ->
			copyMapScheduleState:delMapScheduleCharacterID(GroupID),
			case getHasCompleteCopyMapCondition(GroupID, ?CopyMapEndCond_PlayCharacter, 0) of
				true ->
					sendProcessToPlayer(GroupID),
					%% 判断副本是否完成
					case checkCompleteCopyMap(GroupID, 0) of
						true ->
							completeCopyMap(GroupID);
						_ ->
							skip
					end;
				_ ->
					skip
			end;
		_->
		   skip
	end,
	ok.

%% 完成并行进度中的一个
-spec completeParallelScheduleConf(GroupID::uint(), Type::copyMapEndCond(), ID::uint(), Number::uint()) -> ok.
completeParallelScheduleConf(GroupID, Type, ID, Number) ->
	%% 获取需求
	NeedList = case copyMapScheduleState:getParallelScheduleConfList(GroupID) of
				   undefined ->
					   [];
				   L ->
					   L
			   end,
	{_GID, _Type, _ID, _Number, NList} = lists:foldl(fun updateCompleteParallel/2, {GroupID, Type, ID, Number, []}, NeedList),
	copyMapScheduleState:setParallelScheduleConfList(GroupID, NList),
	ok.

%% 更新并行进度
-spec updateCompleteParallel(#recPSConf{}, Tuple) ->
	Tuple when Tuple::{GroupID::uint(), Type::copyMapEndCond(), ID::uint(), Number::uint(), AccList::list()}.
updateCompleteParallel(#recPSConf{isComplete = true}, {GroupID, Type, ID, Number, AccList}) ->
	%% 完成了就从并行进度中移除
	{GroupID, Type, ID, Number, AccList};
updateCompleteParallel(#recPSConf{} = PS, {GroupID, Type, ID, Number, AccList}) ->
	{NPS, NPSIsComplete} =
		case Type of
			?CopyMapEndCond_KillMonster ->
				KList = PS#recPSConf.killMonster,
				{_, _, IsComplete, NKList} = lists:foldl(fun addTargetSchedule/2, {ID, Number, true, []}, KList),
				{PS#recPSConf{killMonster = lists:reverse(NKList)}, IsComplete};
			?CopyMapEndCond_CollectItem ->
				CList = PS#recPSConf.collectItem,
				{_, _, IsComplete, NCList} = lists:foldl(fun addTargetSchedule/2, {ID, Number, true, []}, CList),
				{PS#recPSConf{collectItem = lists:reverse(NCList)}, IsComplete}
		end,

	case NPSIsComplete of
		true ->
			%% 又完成一个并行进度，初始化
			?DEBUG_OUT("updateCompleteParallel.initParallelScheduleConf:~p,~p,~p",[self(), mapState:getMapId(GroupID), NPS]),
			copyMapScheduleInit:initParallelScheduleConf(GroupID, NPS#recPSConf.completeDo),
			{GroupID, Type, ID, Number, AccList};
		_ ->
			%% 还没完成，继续放入下一轮并行进度
			{GroupID, Type, ID, Number, [NPS | AccList]}
	end.

%% 更新并行进度中的列表
-spec addTargetSchedule(#recKCcalc{}, {ID::copyMapEndCond(), Number::uint(), IsComplete::boolean(), AccList::list()}) ->
	{copyMapEndCond(), uint(), boolean(), list()}.
addTargetSchedule(#recKCcalc{id = NeedID, needNumber = NeedNumber, curNumber = CurNumber} = KC, {ID, Number, IsComplete, AccList}) ->
	NKC = case NeedID =:= ID of
			  true ->
				  KC#recKCcalc{curNumber = CurNumber + Number};
			  _ ->
				  KC
		  end,
	case IsComplete andalso NKC#recKCcalc.curNumber < NeedNumber of
		true ->
			{ID, Number, false, [NKC | AccList]};
		_ ->
			{ID, Number, IsComplete, [NKC | AccList]}
	end.

%% 检查并更新副本进度，返回true副本提前强制结束
-spec checkAndUpdateCopyProcess(GroupID::uint64(), MonsterID::uint32()) -> boolean().
checkAndUpdateCopyProcess(GroupID, MonsterID) ->
	MapID = gameMapLogic:getMapID(GroupID),
	MapPlan = copyMapScheduleState:getMapSchedule(GroupID),

	case getCopyMapScheduleConf(MapID, MapPlan) of
		{_InitConf, SettleConf} when SettleConf > 0 ->
			case getCfg:getCfgPStack(cfg_copymapScheduleSettle, SettleConf) of
				#copymapScheduleSettleCfg{defeatmonster = Defeats} when ?IsListValid(Defeats) ->
					%% 是击杀所有怪物，则只要是杀怪，都满足
					case isKeyInList(Defeats, MonsterID) of
						true ->
							case incKilledFriendMonsterNum(GroupID, MonsterID) of
								Defeats -> true;
								_ ->
									checkKillFriendMonsterIsEnough(GroupID, Defeats)
							end;
						_ ->
							false
					end;
				_ ->
					false
			end;
		_ ->
			false
	end.

%% 获取目标是否在副本完成条件范围内
-spec getHasCompleteCopyMapCondition(GroupID, Type, Param) -> boolean() when
	GroupID::uint(), Type::copyMapEndCond(),Param::term().
getHasCompleteCopyMapCondition(GroupID, Type, Param) ->
	MapID = gameMapLogic:getMapID(GroupID),
	MapPlan = copyMapScheduleState:getMapSchedule(GroupID),

	case getCopyMapScheduleConf(MapID, MapPlan) of
		{_InitConf, SettleConf} when SettleConf > 0 ->
			case getCfg:getCfgPStack(cfg_copymapScheduleSettle, SettleConf) of
				#copymapScheduleSettleCfg{iskillall = IsKillAll} when IsKillAll > 0 ->
					%% 是击杀所有怪物，则只要是杀怪，都满足
					true;
				#copymapScheduleSettleCfg{killmonster = K, collect = C, countdown = _CD, task = T} ->
					case Type of
						?CopyMapEndCond_KillMonster ->
							isKeyInList(K, Param);
						?CopyMapEndCond_CollectItem ->
							isKeyInList(C, Param);
						?CopyMapEndCond_Time ->
							false;
						?CopyMapEndCond_CompleteTask ->
							isKeyInList(T, Param);
						?CopyMapEndCond_PlayAnimation ->
							true;
						?CopyMapEndCond_PlayCharacter ->
							true
					end;
				_ ->
					false
			end;
		{_, 0} ->
			false;
		ErrorConf ->
			?ERROR_OUT("have error map schedule conf ~p ~p", [MapID, ErrorConf]),
			false
	end.

%% key是否在list中
-spec isKeyInList(List, Key) -> boolean() when
	List::list(),Key::term().
isKeyInList(List, Key) ->
	case List of
		[{_,_}|_] ->
			lists:keymember(Key, 1, List);
		[_|_] ->
			lists:member(Key, List);
		_ ->
			false
	end.

%% 检查是否达到完成副本的条件
-spec checkCompleteCopyMap(GroupID::uint(), MonsterCode::uint()) -> boolean().
checkCompleteCopyMap(GroupID, MonsterCode) ->
	MapID = gameMapLogic:getMapID(GroupID),
	MapPlan = copyMapScheduleState:getMapSchedule(GroupID),

	case getCopyMapScheduleConf(MapID, MapPlan) of
		{_InitConf, SettleConf} when SettleConf > 0 ->
			case getCfg:getCfgPStack(cfg_copymapScheduleSettle, SettleConf) of
				#copymapScheduleSettleCfg{iskillall = IsKillAll, killmonster = K,
					collect = C, countdown = _CD, task = _T, defeatmonster = DefeatMonsters} ->
					case IsKillAll > 0 of
						true ->
							checkIsKillAllMonster(GroupID, MonsterCode, DefeatMonsters) andalso checkAnimationOver(GroupID);
						_ ->
							checkKillMonsterIsEnough(GroupID, K) andalso checkCollectItemIsEnough(GroupID, C) andalso checkAnimationOver(GroupID)
					end;
				_ ->
					false
			end;
		_ ->
			true
	end.

%%检查动画播放完了没
checkAnimationOver(GroupID)->
	copyMapScheduleState:getMapScheduleAnimationID(GroupID) =:= undefined andalso
		copyMapScheduleState:getMapScheduleCharacterID(GroupID) =:= undefined.

%% 检查是否击杀所有的怪物
checkIsKillAllMonster(GroupID, MonsterCode, DefeatMonsters) ->
	MonEts = mapState:getMapMonsterEts(),
	MapPid = self(),
	MatchSpec = ets:fun2ms(
		fun(Object) when
			erlang:is_pid(Object#recMapObject.pid) andalso
				Object#recMapObject.mapPid =:= MapPid andalso
				Object#recMapObject.groupID =:= GroupID andalso
				Object#recMapObject.type =:= ?ObjTypeMonster andalso
				Object#recMapObject.code /= MonsterCode ->
			Object#recMapObject.id
		end),
	case myEts:selectEts(MonEts, MatchSpec) of
		[] ->
			true;
		List ->
			%% 过滤掉守护怪
			F =
				fun(ID) ->
					case isKeyInList(DefeatMonsters, ID) of
						true -> false;
						false ->
							case getCfg:getCfgByKey(cfg_monster, ID) of
								#monsterCfg{monsterType = 5} -> false;
								_ -> true
							end
					end
				end,
			[] =:= lists:filter(F, List)
	end.

%% 判断友方怪物死亡是否已经达到最大个数
-spec checkKillFriendMonsterIsEnough(GroupID, Need) -> boolean() when
	GroupID::uint(), Need::list().
checkKillFriendMonsterIsEnough(GroupID, Need) when ?IsListValid(Need) ->
	Fun =
		fun
			({MonsterID, NeedNumber}) ->
				getFriendMonsterNum(GroupID, MonsterID) >= NeedNumber;
			([MonsterID, NeedNumber]) ->
				getFriendMonsterNum(GroupID, MonsterID) >= NeedNumber;
			(_Error) ->
				false
		end,
	erlang:length(lists:filter(Fun, Need)) =:= erlang:length(Need);
checkKillFriendMonsterIsEnough(_,_) ->
	false.

%% 判断击杀怪物是否足够
-spec checkKillMonsterIsEnough(GroupID, Need) -> boolean() when
	GroupID::uint(), Need::list().
checkKillMonsterIsEnough(GroupID, Need) when ?IsListValid(Need) ->
	Fun =
		fun
			({MonsterID, NeedNumber}) ->
				getKilledMonsterNum(GroupID, MonsterID) < NeedNumber;
			([MonsterID, NeedNumber]) ->
				getKilledMonsterNum(GroupID, MonsterID) < NeedNumber;
			(_Error) ->
				true
		end,
	lists:filter(Fun, Need) =:= [];
checkKillMonsterIsEnough(_,_) ->
	true.

%% 判断采集物品个数是否足够
checkCollectItemIsEnough(GroupID, Need) when ?IsListValid(Need) ->
	Fun =
		fun
			({ItemID, NeedNumber}) ->
				getCollectItemNum(GroupID, ItemID) < NeedNumber;
			([ItemID, NeedNumber]) ->
				getCollectItemNum(GroupID, ItemID) < NeedNumber;
			(_Error) ->
				true
		end,
	lists:filter(Fun, Need) =:= [];
checkCollectItemIsEnough(_,_) ->
	true.

%% 通知完成了一次采集
-spec noticeCollectItem(GroupID::uint()) -> ok.
noticeCollectItem(GroupID) ->
	MapID = gameMapLogic:getMapID(GroupID),
	MapPlan = copyMapScheduleState:getMapSchedule(GroupID),
	{_InitConf, SettleConf} = getCopyMapScheduleConf(MapID, MapPlan),
	#copymapScheduleSettleCfg{collect = C} = getCfg:getCfgPStack(cfg_copymapScheduleSettle, SettleConf),
	Fun = fun({ItemID, NNumber}, {Number, CNumber}) ->
		NN = Number + NNumber,
		CC = getCollectItemNum(GroupID, ItemID) + CNumber,
		{NN, CC}
		  end,
	{NeedNumber, CollectNumber} = lists:foldl(Fun, {0, 0}, C),
	case playerCopyMapRift:isRiftMap(MapID) of
		true ->
			Msg = playerMsg:getErrorCodeMsg(?ErrorCode_RiftCollectTips, [NeedNumber, CollectNumber]),
			List = mapView:getGroupObject(mapState:getMapPlayerEts(), GroupID),
			[mapView:sendNetMsgToNetPid(NetPid, Msg) || #recMapObject{netPid = NetPid} <- List];
		_ ->
			skip
	end,
	ok.

%% 获取副本关卡配置
getCopyMapScheduleConf(MapID, Schedule) ->
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{scheduleConf = Conf} when ?IsListValid(Conf) ->
			case length(Conf) >= Schedule andalso Schedule > 0 of
				true ->
					lists:nth(Schedule, Conf);
				_ ->
					{0,0}
			end;
		_ ->
			{0,0}
	end.

-spec getFriendMonsterNum(GroupID, MonsterID) -> uint() when
	GroupID::uint(), MonsterID::monsterId().
getFriendMonsterNum(GroupID, MonsterID) ->
	case copyMapScheduleState:getScheduleFriendMonsterIDList(GroupID) of
		List when erlang:is_list(List) ->
			case lists:keyfind(MonsterID, 1, List) of
				{MonsterID,Num} ->
					Num;
				_ ->
					0
			end;
		_ ->
			0
	end.

-spec getKilledMonsterNum(GroupID, MonsterID) -> uint() when
	GroupID::uint(), MonsterID::monsterId().
getKilledMonsterNum(GroupID, MonsterID) ->
	case copyMapScheduleState:getKilledMonsterList(GroupID) of
		List when erlang:is_list(List) ->
			case lists:keyfind(MonsterID, 1, List) of
				{MonsterID,Num} ->
					Num;
				_ ->
					0
			end;
		_ ->
			0
	end.

-spec getCollectItemNum(GroupID::uint(), ItemID::uint()) -> uint().
getCollectItemNum(GroupID, ItemID) ->
	case copyMapScheduleState:getCollectItemList(GroupID) of
		List when erlang:is_list(List) ->
			case lists:keyfind(ItemID, 1, List) of
				{ItemID, Num} ->
					Num;
				_ ->
					0
			end;
		_ ->
			0
	end.

%% 计数死亡的友方怪物
-spec incKilledFriendMonsterNum(GroupID, MonsterID) -> list() when GroupID::uint(), MonsterID::monsterId().
incKilledFriendMonsterNum(GroupID, MonsterID) ->
	L = case copyMapScheduleState:getScheduleFriendMonsterIDList(GroupID) of
			List when erlang:is_list(List) ->
				case lists:keyfind(MonsterID, 1, List) of
					{MonsterID,Num} ->
						lists:keystore(MonsterID, 1, List, {MonsterID,Num + 1});
					_ ->
						lists:keystore(MonsterID, 1, List, {MonsterID,1})
				end;
			_ ->
				[{MonsterID,1}]
		end,
	copyMapScheduleState:setScheduleFriendMonsterIDList(GroupID, L),
	L.

-spec incKilledMonsterNum(GroupID, MonsterID) -> ok when
	GroupID::uint(), MonsterID::monsterId().
incKilledMonsterNum(GroupID, MonsterID) ->
	L = case copyMapScheduleState:getKilledMonsterList(GroupID) of
			List when erlang:is_list(List) ->
				case lists:keyfind(MonsterID, 1, List) of
					{MonsterID,Num} ->
						lists:keystore(MonsterID, 1, List, {MonsterID,Num + 1});
					_ ->
						lists:keystore(MonsterID, 1, List, {MonsterID,1})
				end;
			_ ->
				[{MonsterID,1}]
		end,
	copyMapScheduleState:setKilledMonsterList(GroupID, L),
	ok.


-spec incCollectItemNum(GroupID::uint(), ItemID::uint(), Number::uint()) -> ok.
incCollectItemNum(GroupID, ItemID, Number) ->
	L = case copyMapScheduleState:getCollectItemList(GroupID) of
			List when erlang:is_list(List) ->
				case lists:keyfind(ItemID, 1, List) of
					{ItemID,Num} ->
						lists:keystore(ItemID, 1, List, {ItemID, Num + Number});
					_ ->
						lists:keystore(ItemID, 1, List, {ItemID, Number})
				end;
			_ ->
				[{ItemID,1}]
		end,
	copyMapScheduleState:setCollectItemList(GroupID, L),
	ok.

%% 获取副本进度完成情况
-spec getCopyMapProcessList(GroupID::uint()) -> list().
getCopyMapProcessList(GroupID) ->
	CurPlan = copyMapScheduleState:getMapSchedule(GroupID),
	MaxPlan = copyMapScheduleState:getMapScheduleMax(GroupID),
	Plan = erlang:min(CurPlan, MaxPlan),
	case getCopyMapScheduleConf(gameMapLogic:getMapID(GroupID), Plan) of
		{_InitConf, SettleConf} when SettleConf > 0 ->
			case getCfg:getCfgPStack(cfg_copymapScheduleSettle, SettleConf) of
				#copymapScheduleSettleCfg{killmonster = K, collect = C, countdown = _CD, task = _T} ->
					%% 取当前杀的怪物个数
					NList = case ?IsListValid(K) of
								true ->
									Fun = fun({MonsterID, NeedNumber}, List) ->
										CurNumber = getKilledMonsterNum(GroupID, MonsterID),
										R = #pk_CopyObj{targetID = MonsterID,targetType = ?CopyMapMonster,curNumber = CurNumber,allNumber = NeedNumber},
										[R|List]
										  end,
									lists:foldl(Fun, [], K);
								_ ->
									[]
							end,

					%% 取当前采集的物品个数
					case ?IsListValid(C) of
						true ->
							FunCollect = fun({ItemID, NeedNumber}, List) ->
								CurNumber = getCollectItemNum(GroupID, ItemID),
								R = #pk_CopyObj{targetID = ItemID,targetType = ?CopyMapCollect,curNumber = CurNumber,allNumber = NeedNumber},
								[R|List]
										 end,
							lists:foldl(FunCollect, NList, C);
						_ ->
							NList
					end;
				_ ->
					[]
			end;
		_ ->
			[]
	end.

%% 获取副本进度，发送给客户端的
-spec getCopyMapProcessRec(GroupID::uint()) -> #pk_GS2U_CopyMapProcess{} | skip.
getCopyMapProcessRec(GroupID) ->
	Cur = copyMapScheduleState:getMapSchedule(GroupID),
	Max = copyMapScheduleState:getMapScheduleMax(GroupID),
	case erlang:is_integer(Cur)
		andalso erlang:is_integer(Max)
		andalso Cur >= 0 andalso Cur =< 256
		andalso Max >= 0 andalso Cur =< 256 of
		true ->
			#pk_GS2U_CopyMapProcess{
				curSchedule = Cur,
				allSchedule = Max,
				scheduleList = getCopyMapProcessList(GroupID)};
		_ ->
			?ERROR_OUT("getCopyMapProcessRec.error:mapID=~p,GroupID=~p,cur=~p,max=~p", [mapState:getMapId(),GroupID,Cur,Max]),
			skip

	end.

%% 发送进度给玩家进程，再发给客户端
-spec sendProcessToPlayer(GroupID::uint()) -> ok.
sendProcessToPlayer(GroupID) ->
	case getCopyMapProcessRec(GroupID) of
		#pk_GS2U_CopyMapProcess{} = R ->
			MapPid = self(),
			Ets = mapState:getMapPlayerEts(),
			MatchSpec = ets:fun2ms(fun(Mapobject) when
				Mapobject#recMapObject.mapPid =:= MapPid andalso Mapobject#recMapObject.groupID =:= GroupID ->
				Mapobject#recMapObject.pid
								   end),
			List = myEts:selectEts(Ets, MatchSpec),
			Fun =
				fun(PID) ->
					case misc:is_process_alive(PID) of
						true ->
							psMgr:sendMsg2PS(PID, copymapProcess, {R});
						_ ->
							skip
					end,
					ok
				end,
			lists:foreach(Fun, List);
		_ ->
			skip
	end,
	ok.

%% 副本失败
-spec completeCopyMapFailed(GroupID::uint64()) -> ok.
completeCopyMapFailed(GroupID) ->
	?LOG_OUT("completeCopyMapFailed:~p,~p,~p", [mapState:getMapId(), self(), GroupID]),

	%% 提醒失败
	Msg = playerMsg:getErrorCodeMsg(?ErrorCode_WarriorTrialPlayerDead, []),
	List = mapView:getGroupObject(mapState:getMapPlayerEts(), GroupID),
	[mapView:sendNetMsgToNetPid(NetPid, Msg) || #recMapObject{netPid = NetPid} <- List],

	%% 重置副本
	psMgr:sendMsg2PS(self(), resetCopyMap, {}),
	ok.

%% 完成副本
-spec completeCopyMap(GroupID::uint()) -> ok.
completeCopyMap(GroupID) ->
	%% 当前进度+1
	CurPlan = copyMapScheduleState:getMapSchedule(GroupID),	%% +1前保存已完成的进度索引，用于触发正确的触发事件
	Plan = copyMapScheduleState:getMapSchedule(GroupID) + 1,
	copyMapScheduleState:setMapSchedule(GroupID, Plan),

	%% LUNA-897
	%% LUNA-1699
	%% 尝试触发事件
	?DEBUG_OUT("[DebugForCopyMap] completeCopyMap GroupID:~p CurPlan:~p", [GroupID, CurPlan]),
	MaxPlan = copyMapScheduleState:getMapScheduleMax(GroupID),
	CompletePlan = erlang:min(CurPlan, MaxPlan),
	case getCopyMapScheduleConf(gameMapLogic:getMapID(GroupID), CompletePlan) of
		{_InitConf, SettleConf} when SettleConf > 0 ->
			case getCfg:getCfgPStack(cfg_copymapScheduleSettle, SettleConf) of
				#copymapScheduleSettleCfg{condition = Condition, event = Event} ->
					copyMapScheduleInit:tryDoEvent(Condition, Event, {false, CompletePlan}, mapState:getMapPlayerEts(), GroupID);
				_ ->
					skip
			end;
		_ ->
			skip
	end,

	%% 注意，这样取mapid，会优先取分组指定的mapid
	MapID = gameMapLogic:getMapID(GroupID),
	#mapsettingCfg{type = MapType, subtype = SubType, finish_time = FT, kill_thelastofus = KillAll, scheduleConf = ScheduleConf} = getCfg:getCfgPStack(cfg_mapsetting, MapID),
	%% 如果是军团副本，根据进度发奖品
	case MapType =:= ?MapTypeCopyMap andalso SubType =:= ?MapSubTypeGuild of
		true ->
			GuildID = mapState:getGuildID(),
			{InitConf, _} = lists:nth(Plan-1, ScheduleConf),
			#copymapScheduleInitCfg{addmonster = Addmonster}= getCfg:getCfgPStack(cfg_copymapScheduleInit, InitConf),
			[Monster, _, _, _] = lists:nth(1,Addmonster),
			#monsterCfg{showName = BossName} = getCfg:getCfgPStack(cfg_monster, Monster),
			%%发奖品
			psMgr:sendMsg2PS(?PsNameGuild, queryCopyMapAwardMemberList, {GuildID, Plan-1, BossName}),
			%%通知在线玩家
			Content = stringCfg:getString(cnTextGuildCopyBossDefeat, [BossName]),
			PidList = playerGuild:getOnlinePidList(GuildID),
			[psMgr:sendMsg2PS(Pid ,sendSystemChatMsg, {Content}) || Pid <- PidList],
			%%副本结束
			case Plan - 1 >= MaxPlan of
				true ->
					%% 解散系统队伍
%%					psMgr:sendMsg2PS(?PsNamePlayerMgr, disbandSysTeam, mapState:getTeamID()),
					%% 发系统通告
					Content2 = stringCfg:getString(cnTextGuildCopyEnd),
					[psMgr:sendMsg2PS(Pid ,sendSystemChatMsg, {Content2}) || Pid <- PidList];
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	case Plan > MaxPlan of
		true ->
			%% 是否全部销毁怪物
			case KillAll =:= 1 of
				true ->
					gameMapLogic:destroyAllMonster(GroupID);
				_ ->
					skip
			end,

			if
				MapType =:= ?MapTypeCopyMap ->
					%% 发奖
					calCopyMapReward(GroupID),

					%% 等待这么久强制销毁
					gameMapLogic:prepareDestroy(FT * 1000, true);
				MapType =:= ?MapTypeBitplane ->
					%% 分组发奖(注意，请先发奖，再设置完成一次位面)
					calCopyMapReward(GroupID),

					case FT > 0 of
						true ->
							erlang:send_after(FT * 1000, self(), {clearBitMapPlayer, self(), GroupID});
						_ ->
							%% 通知这个分组里所有人，离开位面
							gameMapLogic:kickAllPlayer(GroupID)
					end;
				true ->
					skip
			end,
			?LOG_OUT("completeCopyMap: ~p, ~p", [self(),MapID]),
			ok;
		_ ->
			%% 本副本还有进度，继续下一进度
			copyMapScheduleInit:initCopyMapSchedule(GroupID, Plan),
			ok
	end,

	sendProcessToPlayer(GroupID),
	ok.

%% 计算副本
-spec calCopyMapReward(GroupID::uint()) -> ok.
calCopyMapReward(GroupID) ->
	%% 计算副本评分 以及 随机生成给玩家的宝箱
	EndTime = time:getUTCNowMS(),				%% 完成时间
	StartTime = mapState:getMapStartTime(GroupID),		%% 开始时间

	%% 时间差
	DiffTime = (EndTime - StartTime) / 1000,

	%% 死亡次数
	DeadTimes = mapState:getAllPlayersDeadTimes(GroupID),

	Score = DiffTime + DeadTimes * ?DeadAddScore,

	onCopyMapAward(GroupID, erlang:trunc(Score)),
	ok.

%% %% 给通关副本的玩家发放奖励
-spec onCopyMapAward(GroupID::uint(), Score :: uint()) -> ok.
onCopyMapAward(GroupID, Score) when erlang:is_integer(Score) ->
	%% 通关玩家（本副本所在的所有玩家）
	PlayerEts = mapState:getMapPlayerEts(),
	MapID = gameMapLogic:getMapID(GroupID),
	MapPid = self(),
	RewardFun = fun(#recMapObject{pid = PlayerPid, mapPid = MPid, groupID = GID}) when erlang:is_pid(PlayerPid) ->
		case MPid =:= MapPid andalso GID =:= GroupID andalso misc:is_process_alive(PlayerPid) of
			true ->
				psMgr:sendMsg2PS(PlayerPid, copyMapReward, {Score, MapID});
			false ->
				skip
		end;
		(_NotPid) ->
			skip
				end,
	myEts:etsFor(PlayerEts, RewardFun),
	%% 新版好友系统需求，每日第一次好友组队完成副本可增加亲密度 begin
	%% 队友两两调用该函数，内部已做判断处理，所有进程可调用
	FunMakePair1 =
		fun(#recMapObject{id = IDA}, ListRA) ->
			FunIsSame =
				fun(C, {Mark, {A, B}}) ->
					case C of
						{A, B} ->
							{true, {A, B}};
						{B, A} ->
							{true, {A, B}};
						_ ->
							{Mark, {A, B}}
					end
				end,
			FunMakePair2 =
				fun(#recMapObject{id = IDB}, ListRB) ->
					case IDA =:= IDB of
						true ->
							ListRB;
						_ ->
							case misc:foldlEx(FunIsSame, {false, {IDA, IDB}}, ListRB) of
								{true, _} ->
									ListRB;
								_ ->
									[{IDA, IDB} | ListRB]
							end
					end
				end,
			ets:foldl(FunMakePair2, ListRA, PlayerEts)
		end,
	ListForClosenessAdd = ets:foldl(FunMakePair1, [], PlayerEts),
	FunClosenessAdd =
		fun({A, B}) ->
			playerFriend2:closenessAdd(?ClosenessAddType_TeamCopyMap, A, B, 1)
		end,
	lists:foreach(FunClosenessAdd, ListForClosenessAdd),
	%% 新版好友系统需求，每日第一次好友组队完成副本可增加亲密度 end
	ok.