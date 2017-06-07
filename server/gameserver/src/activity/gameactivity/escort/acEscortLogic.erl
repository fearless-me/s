%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, 好玩一二三
%%% @doc
%%% 护送活动模块
%%% @end
%%% Created : 06. 二月 2015 14:32
%%%-------------------------------------------------------------------
-module(acEscortLogic).
-author("tiancheng").

-include("../../activityPrivate.hrl").
-include("../activityPhaseDefine.hrl").
-include("acEscortPrivate.hrl").

%% API
-export([
	activityChangeCallBack/1,
	activityMapMsg/2
]).

-export([
	requestEscort/1,
	requestEscortRob/1,
	escortTick/0,
	createHDBattleMapAck/1,
	acceptTriggerEvent/1,
	resetEscortMap/1,
	requestEscortTeamList/1,
	leaveEscortMap/1,
	gm_escortcd/1
]).

%% 主活动模块进程回调
-spec activityChangeCallBack(Phase::uint()) -> ok.
activityChangeCallBack(?ActivityPhase_EscortGoods_1) ->
	%% 整点时间到，什么也不做处理
	ok;
activityChangeCallBack(?ActivityPhase_EscortGoods_2) ->
	%% 活动进入开始阶段
	acEscortState:setEscortStart(true),
	
	Content = stringCfg:getString(escortActivity_Start),
	activityCommon:sendBroadcastNotice(Content),

	%% 清零队列
	acEscortState:clearEscortSequenceNumber(),

	%% 清零数据
	%% 当前所有在进行中的护送，统统失败，清理所有数据
	ML = acEscortState:getEscortMapList(),
	[clearEscortPlayer(R) || R <- ML],

	%% 清理其它残余数据
	acEscortState:setEscortMapList([]),
	acEscortState:setEscortJoinPlayerList([]),

	erlang:send_after(?EscortTick, self(), escortTick),
	ok;
activityChangeCallBack(?ActivityPhase_Close) ->
	%% 结束
	acEscortState:setEscortStart(false),
	acEscortState:clearEscortSequenceNumber(),

	%% 当前所有在进行中的护送，统统失败，清理所有数据
	ML = acEscortState:getEscortMapList(),
	[escortFailed(R, ?EscortEndReason_TimeEnd) || R <- ML],

	%% 清理其它残余数据
	acEscortState:setEscortMapList([]),
	acEscortState:setEscortJoinPlayerList([]),
	acEscortState:setEscortEarningsList([]),
	ok;
activityChangeCallBack(Phase) ->
	?ERROR_OUT("~p ~p activityChangeCallBack:~p", [?MODULE, self(), Phase]),
	ok.

%% 活动地图的消息
-spec activityMapMsg(MsgType::uint(), Data::term()) -> ok.
activityMapMsg(?ACMapMsg_PlayerEnter, {RoleID, _MapPID, #recMapObject{pid = Pid}}) ->
	onEnterEscortMap(Pid, RoleID),
	ok;
activityMapMsg(?ACMapMsg_HurtMonster, Data) ->
	gharryBeDamage(Data),
	ok;
activityMapMsg(?ACMapMsg_KillMonster, {_MapID, _MapPID, _AttackRoleID, MonsterCode, _MonsterID} = _Data) ->
	ML = acEscortState:getEscortMapList(),
	case lists:keyfind(MonsterCode, #recEscortMap.gharryCode, ML) of
		#recEscortMap{} = R ->
			escortFailed(R, ?EscortEndReason_GharryDead);
		_ ->
			skip
	end,
	ok;
activityMapMsg(?ACMapMsg_DestoryMap, MapPID) ->
	ML = acEscortState:getEscortMapList(),
	case lists:keyfind(MapPID, #recEscortMap.mapPID, ML) of
		#recEscortMap{} = R ->
			?LOG_OUT("~p activityMapMsg:~p,~p", [?MODULE,MapPID, R]),
			clearEscortPlayer(R);
		_ ->
			skip
	end,
	ok;
activityMapMsg(?ACMapMsg_CreateMap, {_CreateRoleID,_MapID,MapPid,PlayerEts,MonsterEts,_CollectEts,_NpcEts}) ->
	ML = acEscortState:getEscortMapList(),
	case lists:keyfind(MapPid, #recEscortMap.mapPID, ML) of
		#recEscortMap{} = R ->
			NML = lists:keystore(MapPid, #recEscortMap.mapPID, ML, R#recEscortMap{playerEts = PlayerEts, monsterEts = MonsterEts}),
			acEscortState:setEscortMapList(NML),
			ok;
		_ ->
			acEscortState:setEscortMapList_Ets({MapPid,PlayerEts,MonsterEts})
	end,
	ok;
activityMapMsg(_MsgType, _Data) ->
	ok.

%% 创建了护送活动地图
createHDBattleMapAck([MapPID]) ->
	case acEscortState:getEscortStart() of
		true ->
			L = acEscortState:getEscortJoinPlayerList(),
			FunF =
				fun(#recEscortJoin{isCreater = ISC, mapPID = MPID, escortType = EscortType}) ->
					ISC andalso MPID =:= undefined andalso EscortType =/= ?EscortType_Rob
				end,
			L1 = lists:filter(FunF, L),
			case lists:keysort(#recEscortJoin.sequenceNumber, L1) of
				[#recEscortJoin{sequenceNumber = SeqNumber, escortType = EscortType, roleID = RoleID, roleLevel = RoleLevel}|_] ->
					%% 添加到地图列表
					{PlayerEts, MonsterEts} =
						case acEscortState:getEscortMapList_Ets(MapPID) of
							{PE, ME} ->
								acEscortState:delEscortMapList_Ets(MapPID),
								{PE, ME};
							_ -> {undefined, undefined}
						end,
					{MList, PList} =
						case EscortType of
							?EscortType_Solo ->
								#globalsetupCfg{setpara = ML1} = getCfg:getCfgPStack(cfg_globalsetup, escort_singleplayer_monster),
								#globalsetupCfg{setpara = PL1} = getCfg:getCfgPStack(cfg_globalsetup, escort_singleplayer_event),
								{ML1, PL1};
							?EscortType_Team ->
								#globalsetupCfg{setpara = PL2} = getCfg:getCfgPStack(cfg_globalsetup, escort_multiplayer_event),
								{[], PL2}
						end,
					MR = #recEscortMap{
						sequenceNumber = SeqNumber,
						escortType = EscortType,
						createRoleID = RoleID,
						createRoleLevel = RoleLevel,
						mapPID = MapPID,
						monsterEts = MonsterEts,
						playerEts = PlayerEts,
						nextMEventID = MList,
						nextPEventID = PList,
						gharryCode = 0
					},
					ML = acEscortState:getEscortMapList(),
					acEscortState:setEscortMapList([MR | ML]),

					%% 更新玩家列表数据
					SeqList = querySequencePlayer(L, SeqNumber),
					Fun =
						fun(#recEscortJoin{roleID = RID, escortType = Type, isCreater = IsCreater} = R, AccList) ->
							noticePlayerEnterEscort(Type, RID, IsCreater, MapPID),

							NR = R#recEscortJoin{mapPID = MapPID},
							lists:keystore(RID, #recEscortJoin.roleID, AccList, NR)
						end,
					NL = lists:foldl(Fun, L, SeqList),
					acEscortState:setEscortJoinPlayerList(NL);
				Error ->
					?ERROR_OUT("createHDBattleMapAck: there is no player:~p,Error=~p", [L,Error]),
					skip
			end;
		_ ->
			%% 活动已经结束，直接重置地图
			resetEscortMap(MapPID),
			skip
	end,
	ok.

%% 马车受到伤害
gharryBeDamage({_MapID, _MapPID, AttackRoleID, MonsterCode, _MonsterID, Damage}) when Damage > 0 ->
	L = acEscortState:getEscortJoinPlayerList(),
	case lists:keyfind(AttackRoleID, #recEscortJoin.roleID, L) of
		#recEscortJoin{roleName = RoleName, escortType = ?EscortType_Team, isEscort = false, sequenceNumber = SeqNumber} = R ->
			ML = acEscortState:getEscortMapList(),
			case lists:keyfind(SeqNumber, #recEscortMap.sequenceNumber, ML) of
				#recEscortMap{escortType = EscortType, gharryCode = MonsterCode, playerEts = PlayerEts} ->
					%% 是劫掠者，且对马车造成伤害
					EarningsList = acEscortState:getEscortEarningsList(),
					case lists:filter(fun(#recEscortEarnings{sequenceNumber = Number, gharryMxpHp = GharryMxpHp}) -> 
										Number =:= SeqNumber andalso GharryMxpHp > 0 end, EarningsList) of
						[#recEscortEarnings{gharryMxpHp = MaxHP}|_] ->
							%% 奖励的钱
							RewardKey = case EscortType of
								            ?EscortType_Solo -> escort_singleplayer_reward;
								            ?EscortType_Team -> escort_multiplayer_reward
							            end,
							#globalsetupCfg{setpara = RewardList} = getCfg:getCfgPStack(cfg_globalsetup, RewardKey),
							FunMapReward =
								fun({MoneyType,Value}) ->
									%% 最大奖励/马车最大血量*伤害
									NValue = (Value / MaxHP) * Damage,
									{MoneyType,erlang:round(NValue),0}
								end,
							RewardList2 = lists:map(FunMapReward, RewardList),
							[{_, Val, _}|_] = RewardList2,
							NewEnList = 
							case lists:filter(fun(#recEscortEarnings{sequenceNumber = Number, targeID = TargeID}) -> 
													  Number =:= SeqNumber andalso TargeID =:= AttackRoleID end, EarningsList) of
								[#recEscortEarnings{roleEarnings = OldEarnings} = En|_]	->
									lists:keystore(AttackRoleID,#recEscortEarnings.targeID,EarningsList,
												   En#recEscortEarnings{roleEarnings = OldEarnings + Val,gharryMxpHp = MaxHP});
                           		[] ->
									lists:keystore(AttackRoleID,#recEscortEarnings.targeID,EarningsList,
												   #recEscortEarnings{sequenceNumber = SeqNumber, targeID = AttackRoleID,
																		targeName = RoleName, roleEarnings = Val, gharryMxpHp = MaxHP})
							end,
							acEscortState:setEscortEarningsList(NewEnList),
							sendEscortMsgToPlayer(R, PlayerEts, {reward_rob, RewardList2}),
							ok;
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
gharryBeDamage(_Data) ->
	ok.

onEnterEscortMap(RolePID, RoleID) ->
	?DEBUG_OUT("onEnterEscortMap:~p,~p", [RoleID, RolePID]),
	L = acEscortState:getEscortJoinPlayerList(),
	case lists:keyfind(RoleID, #recEscortJoin.roleID, L) of
		#recEscortJoin{escortType = Type, sequenceNumber = Number, isEscort = IsEscort} ->
			%% 创建马车
			createGharry(Type, Number),

			psMgr:sendMsg2PS(RolePID, onEnterEscortMapAck, {Type, IsEscort});
		_ ->
			?ERROR_OUT("onEnterEscortMap, not in list:~p", [RoleID])
	end,
	ok.

%% 创建马车
createGharry(?EscortType_Rob, _SeqNumber) ->
	ok;
createGharry(EscortType, SeqNumber) ->
	ML = acEscortState:getEscortMapList(),
	case lists:keyfind(SeqNumber, #recEscortMap.sequenceNumber, ML) of
		#recEscortMap{gharryCode = 0, mapPID = MapPID, escortType = EscortType, createRoleID = RoleID, createRoleLevel = Level} = R ->
			NML = lists:keystore(SeqNumber, #recEscortMap.sequenceNumber, ML, R#recEscortMap{gharryCode = -1}),
			acEscortState:setEscortMapList(NML),

			GharryID = getGharryID(EscortType),

			?DEBUG_OUT("createGharry:type=~p,seq=~p,gharryid=~p", [EscortType, SeqNumber, GharryID]),

			%% 取路点起点
			[#recMapWayPt{x = X, y = Y}|_] = core:getMapWayPt(?EscortMapID),

			%% 取马车血量系数
			HDRatio = case EscortType of
						  ?EscortType_Solo ->
							  #indexGrowthCfg{index35=Index35} = getCfg:getCfgPStack(cfg_indexGrowth, Level),
							  Index35;
				          ?EscortType_Team ->
					          #indexGrowthCfg{index36=Index36} = getCfg:getCfgPStack(cfg_indexGrowth, Level),
					          Index36
			          end,
			#monsterCfg{level = MonsterLevel} = getCfg:getCfgPStack(cfg_monster, GharryID),
			psMgr:sendMsg2PS(MapPID, addMonsterToMap_EscortGharry, {0, 1, [{GharryID, 1, X, Y}], {RoleID, Level, HDRatio, MonsterLevel}}),
			ok;
		_ ->
			skip
	end,
	ok.

noticePlayerEnterEscort(?EscortType_Solo = Type, RoleID, _IsCreater, MapPID) ->
	case queryRolePID(RoleID) of
		false ->
			skip;
		PID ->
			psMgr:sendMsg2PS(PID, canEnterEscortMap, {Type, MapPID})
	end,
	ok;
noticePlayerEnterEscort(?EscortType_Team = Type, RoleID, true, MapPID) ->
	case queryRolePID(RoleID) of
		false ->
			skip;
		PID ->
			psMgr:sendMsg2PS(PID, canEnterEscortMap, {Type, MapPID})
	end,
	ok;
noticePlayerEnterEscort(_EscortType, _RoleID, _IsCreater, _MapPID) ->
	ok.

escortTick() ->
	escortTick2(),
	case acEscortState:getEscortStart() of
		true ->
			erlang:send_after(?EscortTick, self(), escortTick);
		_ ->
			skip
	end,
	ok.

escortTick2() ->
	L1 = acEscortState:getEscortMapList(),
	L2 = updateGharryID(L1, []),
	acEscortState:setEscortMapList(L2),
	dealGharryState(L2),
%% 	acEscortState:setEscortMapList(L3),
	ok.

dealGharryState(#recEscortMap{gharryCode = Code}) when Code =< 0 ->
	%% 还没发现马车
	ok;
dealGharryState(#recEscortMap{gharryCode = Code, monsterEts = MEts} = R) ->
	case myEts:lookUpEts(MEts, Code) of
		[#recMapObject{x = SX, y = SY, hp = HP} = Gharry] ->
			WayPtList = core:getMapWayPt(?EscortMapID),
			#recMapWayPt{x = TX, y = TY} = lists:last(WayPtList),
			case erlang:round(SX) =:= erlang:round(TX) andalso erlang:round(SY) =:= erlang:round(TY) of
				true ->
					%% 成功
					escortSuccess(R, Gharry);
				_ ->
					case HP =< 0 of
						true ->
							%% 失败
							escortFailed(R, ?EscortEndReason_GharryDead);
						_ ->
							%% 判断是否触发事件
							NR = #recEscortMap{sequenceNumber = SeqNumber} = triggerEvent(R, WayPtList, Gharry),
							ML = acEscortState:getEscortMapList(),
							NML = lists:keystore(SeqNumber, #recEscortMap.sequenceNumber, ML, NR),
							acEscortState:setEscortMapList(NML)
					end
			end;
		Error ->
			%% 马车不见了，直接失败
			?DEBUG_OUT("dealGharryState:~p,~p", [R, Error]),
			escortFailed(R, ?EscortEndReason_GharryDead),
			skip
	end,
	ok;
dealGharryState([]) -> ok;
dealGharryState([#recEscortMap{} = Map|ML]) ->
	dealGharryState(Map),
	dealGharryState(ML).

%% 成功，当前在活动地图才发奖
escortSuccess(
	#recEscortMap{escortType = EscortType, sequenceNumber = SeqNum, playerEts = PlayerEts, eventIDList = EventIDList} = R,
	#recMapObject{hp = HP, maxHp = MaxHP}) ->

	?DEBUG_OUT("escortSuccess:~p", [R]),
	RewardKey = case EscortType of
		            ?EscortType_Solo -> escort_singleplayer_reward;
		            ?EscortType_Team -> escort_multiplayer_reward
	            end,
	#globalsetupCfg{setpara = RewardList} = getCfg:getCfgPStack(cfg_globalsetup, RewardKey),

	L = acEscortState:getEscortJoinPlayerList(),
	L2 = querySequencePlayer(L, SeqNum),
	Len = erlang:length(lists:filter(fun(#recEscortJoin{isEscort = IsEscort}) -> IsEscort end, L2)),

	%% 是否因触发事件获得额外奖励
	FunPer =
        fun(#recEscortEvent{eventID = EventID, getNumber = Number}, AccPer) ->
            #escort_eventCfg{event = [EventType|Param]} = getCfg:getCfgPStack(cfg_escort_event, EventID),
            case EventType of
                ?EscortPlayerEvent_AddReward ->
                    [Per] = Param,
                    Per * Number + AccPer;
                _ -> AccPer
            end
        end,
    AddPer = lists:foldl(FunPer, 0, EventIDList),

	FunMapReward =
		fun({MoneyType,Value}) ->
%% 			单人护送公式为：玩家奖励=护送奖励金钱/马车血量*马车剩余血量,金钱向上取整
%% 			多人护送公式为：玩家奖励=（护送奖励金钱/马车血量*马车剩余血量）/护送玩家人数,金钱向上取整
			NValue = (((Value / MaxHP) * HP) / Len) * (1 + AddPer),
			PValue = (((Value / MaxHP) * HP) / Len) * AddPer,
			{MoneyType,erlang:round(NValue), erlang:round(PValue)}
		end,
	RewardList2 = lists:map(FunMapReward, RewardList),
    %% 单人护送怪物攻击收益
    case EscortType =:= ?EscortType_Solo of
        true ->
            [{_, Value}|_] = RewardList,
            [{_, MoneyValue,_}|_] = RewardList2,
			EarningsList = acEscortState:getEscortEarningsList(),
			MonsterName = stringCfg:getString(escortMonsterName),
			case lists:keyfind(SeqNum, #recEscortEarnings.sequenceNumber, EarningsList) of
			false ->
				Earns = #recEscortEarnings{sequenceNumber = SeqNum, targeName = MonsterName, roleEarnings = erlang:round(Value - MoneyValue)},
				NewRarn = lists:keystore(SeqNum,#recEscortEarnings.sequenceNumber,EarningsList,Earns),
				acEscortState:setEscortEarningsList(NewRarn);
			Earn ->
				NewRarn = lists:keystore(SeqNum,#recEscortEarnings.sequenceNumber,EarningsList,Earn#recEscortEarnings{roleEarnings = erlang:round(Value - MoneyValue)}),
           		acEscortState:setEscortEarningsList(NewRarn)
			end;
			
        _ ->
            skip
    end,

    Earnnings = getScortDamageEarnings(SeqNum),
	sendEscortMsgToPlayer(L2, PlayerEts, {reward, {true, ?EscortEndReason_GharryEnd, RewardList2,Earnnings}}),

	clearGharry(R),

	%% 清理数据
	clearEscortPlayer(R),
	ok.

%% 失败
escortFailed(#recEscortMap{sequenceNumber = SeqNum, playerEts = PlayerEts, escortType = EscortType} = R, EndReason) ->
%% 	?DEBUG_OUT("escortFailed:~p", [R]),
	L = acEscortState:getEscortJoinPlayerList(),
	L2 = querySequencePlayer(L, SeqNum),
    %% 单人护送怪物攻击收益
    case EscortType =:= ?EscortType_Solo of
        true ->
			#globalsetupCfg{setpara = RewardList} = getCfg:getCfgPStack(cfg_globalsetup, escort_singleplayer_reward),
            [{_, Value}|_] = RewardList,
			EarningsList = acEscortState:getEscortEarningsList(),
			MonsterName = stringCfg:getString(escortMonsterName),
			case lists:keyfind(SeqNum, #recEscortEarnings.sequenceNumber, EarningsList) of
				false ->
					Earn = #recEscortEarnings{sequenceNumber = SeqNum, targeName = MonsterName, roleEarnings = erlang:round(Value)},
					NewRarn = lists:keystore(SeqNum,#recEscortEarnings.sequenceNumber,EarningsList,Earn),
					acEscortState:setEscortEarningsList(NewRarn);
				#recEscortEarnings{} = Earns ->
					NewRarn = lists:keystore(SeqNum,#recEscortEarnings.sequenceNumber,EarningsList,Earns#recEscortEarnings{roleEarnings = erlang:round(Value)}),
					acEscortState:setEscortEarningsList(NewRarn)
			end;
        _ ->
            skip
    end,
	EarnningL = getScortDamageEarnings(SeqNum),
	sendEscortMsgToPlayer(L2, PlayerEts, {reward, {false, EndReason, [],EarnningL}}),

	clearGharry(R),

	clearEscortPlayer(R),
	ok.

%% 删除马车
clearGharry(#recEscortMap{mapPID = MapPID, gharryCode = Code}) ->
	case erlang:is_pid(MapPID) andalso erlang:is_integer(Code) andalso Code > 0 of
		true ->
			psMgr:sendMsg2PS(MapPID, clearSpawn, [Code]),
			ok;
		_ ->
			skip
	end,
	ok.

clearEscortPlayer(#recEscortMap{mapPID = MapPID, sequenceNumber = SeqNumber}) ->
%% 	?DEBUG_OUT("clearEscortPlayer:~p", [R]),
	%% 清除玩家列表
	L = acEscortState:getEscortJoinPlayerList(),
	LD = lists:filter(fun(#recEscortJoin{sequenceNumber = Seq}) -> Seq =:= SeqNumber end,L),
	acEscortState:setEscortJoinPlayerList(L--LD),

	%% 清除地图数据
	LM = acEscortState:getEscortMapList(),
	LMD = lists:filter(fun(#recEscortMap{sequenceNumber = Seq}) -> Seq =:= SeqNumber end,LM),
	acEscortState:setEscortMapList(LM--LMD),

	case erlang:is_pid(MapPID) of
		true ->
			acEscortState:delEscortMapList_Ets(MapPID),

			%% 延时
			erlang:send_after(?ResetEscortMapTick, self(), {resetEscortMapTick, MapPID});
		_ ->
			skip
	end,
	ok.

resetEscortMap(MapPID) ->
	psMgr:sendMsg2PS(MapPID, resetCopyMap, {}),
	ok.

%% 触发事件
-spec triggerEvent(#recEscortMap{}, WayPtList::[#recMapWayPt{},...], Gharry::#recMapObject{}) -> #recEscortMap{} | false.
triggerEvent(
	#recEscortMap{
		nextMEventID = ME,
		nextPEventID = PE,
		eventIDList = OEList,
		mapPID = PID,
		playerEts = Ets,
		sequenceNumber =
		SeqNumber,
		createRoleID = RoleID,
		createRoleLevel = Lvl} = Rec,
	WayPtList,
	#recMapObject{x = Sx, y = Sy}) ->
	%% 先处理怪物事件
	NME =
		case isTrigger(ME, WayPtList, Sx, Sy) of
			false -> ME;
			error ->
				[_|OME1] = ME,
				OME1;
			true ->
				[{_Node, MonsterIndex, Radius}|OME2] = ME,
				addMonsterToMap(PID, RoleID, Lvl, MonsterIndex, Radius, Sx, Sy),
				OME2
		end,

	%% 再处理玩家事件
	NPE =
		case isTrigger(PE, WayPtList, Sx, Sy) of
			false -> PE;
			error ->
				[_|OPE1] = PE,
				OPE1;
			true ->
				[{_Node2, EventS, EventE}|OPE2] = PE,
				case getEventID(EventS, EventE, OEList) of
					0 -> skip;
					EventID ->
						%% 随机一个目标，通知事件
						getRandEscortPlayer(EventID, Ets, SeqNumber)
				end,
				OPE2
		end,
	Rec#recEscortMap{nextMEventID = NME, nextPEventID = NPE}.

%% 玩家手动触发一个彩蛋
gm_escortcd({RoleID, EventID}) ->
	LP = acEscortState:getEscortJoinPlayerList(),
	case lists:keyfind(RoleID, #recEscortJoin.roleID, LP) of
		#recEscortJoin{sequenceNumber = Seq} ->
			LM = acEscortState:getEscortMapList(),
			case lists:keyfind(Seq, #recEscortMap.sequenceNumber, LM) of
				#recEscortMap{eventIDList = OEList, playerEts = Ets} ->
					Fun =
						fun(#recEscortEvent{eventID = EID, getNumber = Num}, AccList) ->
							case canAddEventID(EID, Num) of
								true -> AccList;
								_ -> [EID | AccList]
							end
						end,
					DecList = lists:foldl(Fun, [], OEList),
					AllList = getCfg:get1KeyList(cfg_escort_event),
					List = AllList -- DecList,
					case lists:member(EventID, List) of
						true ->
							getRandEscortPlayer(EventID, Ets, Seq);
						_ ->
							skip
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

getRandEscortPlayer(EventID, PlayerEts, SeqNumber) ->
	PlayerList = ets:tab2list(PlayerEts),
	Len = erlang:length(PlayerList),
	case Len > 0 of
		true ->
			Index = misc:rand(1, Len),
			#recMapObject{id = RoleID, netPid = NetPid} = lists:nth(Index, PlayerList),

			List = acEscortState:getEscortJoinPlayerList(),
			case lists:keyfind(RoleID, #recEscortJoin.roleID, List) of
				#recEscortJoin{sequenceNumber = SeqNumber} = Rec ->
					NowTime = time:getSyncTime1970FromDBS(),
					NList = lists:keystore(RoleID, #recEscortJoin.roleID, List, Rec#recEscortJoin{eventTime = NowTime, eventID = EventID}),
					acEscortState:setEscortJoinPlayerList(NList),

					%% 通知玩家触发事件
					gsSendMsg:sendNetMsg(NetPid, #pk_GS2U_TriggerEvent{}),
					ok;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

-spec leaveEscortMap(RoleID::uint64()) -> ok.
leaveEscortMap(RoleID) ->
	List = acEscortState:getEscortJoinPlayerList(),
	case lists:keyfind(RoleID, #recEscortJoin.roleID, List) of
		#recEscortJoin{isEscort = false} ->
			NList = lists:keydelete(RoleID, #recEscortJoin.roleID, List),
			acEscortState:setEscortJoinPlayerList(NList),
			ok;
		_ ->
			skip
	end,
	ok.

requestEscortTeamList(RoleNetPid) ->
	MList = acEscortState:getEscortMapList(),
	PList = acEscortState:getEscortJoinPlayerList(),
	#globalsetupCfg{setpara = [Max]} = getCfg:getCfgPStack(cfg_globalsetup, robbery_player_num),
	Fun =
		fun(#recEscortMap{sequenceNumber = SeqNumber, escortType = EscortType, createRoleID = RID}, AccList) ->
			case EscortType of
				?EscortType_Team ->
					%% 只显示多人护送
					L = querySequencePlayer(PList, SeqNumber, false),
					Name = playerNameUID:getPlayerNameByUID(RID),
					R = #pk_EscortTeam{
						roleID = RID,
						roleName = Name,
						sequenceNumber = SeqNumber,
						cur_RobNumber = erlang:length(L),
						max_RobNumber = Max
					},
					[R | AccList];
				_ ->
					AccList
			end
		end,
	List = lists:foldl(Fun, [], MList),
	Msg = #pk_GS2U_ReturnEscortList{etlist = List},
	gsSendMsg:sendNetMsg(RoleNetPid, Msg),
	ok.

%% 玩家接受了事件
-spec acceptTriggerEvent(RoleID::uint64()) -> ok.
acceptTriggerEvent(RoleID) ->
	List = acEscortState:getEscortJoinPlayerList(),
	case lists:keyfind(RoleID, #recEscortJoin.roleID, List) of
		#recEscortJoin{sequenceNumber = SeqNumber, eventTime = Time, eventID = EventID} = Rec when EventID > 0 ->
			%% 先把玩家的事件置0
			NList = lists:keystore(RoleID, #recEscortJoin.roleID, List, Rec#recEscortJoin{eventTime = 0, eventID = 0}),
			acEscortState:setEscortJoinPlayerList(NList),

			NowTime = time:getSyncTime1970FromDBS(),
			case NowTime =< (Time + ?PlayerEventAcceptCDTime) of
				true ->
					%% 再响应事件结果
					MapList = acEscortState:getEscortMapList(),
					case lists:keyfind(SeqNumber, #recEscortMap.sequenceNumber, MapList) of
						#recEscortMap{eventIDList = OEList} = RecMap ->
							OldNumber = case lists:keyfind(EventID, #recEscortEvent.eventID, OEList) of
											#recEscortEvent{getNumber = N} -> N;
											_ -> 0
							            end,
							case canAddEventID(EventID, OldNumber) of
								true ->
									?DEBUG_OUT("acceptTriggerEvent:~p,~p", [RoleID, EventID]),

									NEList = lists:keystore(EventID, #recEscortEvent.eventID, OEList, #recEscortEvent{eventID = EventID, getNumber = OldNumber + 1}),
									NMapList = lists:keystore(SeqNumber, #recEscortMap.sequenceNumber, MapList, RecMap#recEscortMap{eventIDList = NEList}),
									acEscortState:setEscortMapList(NMapList),

									%% 处理事件
									dealEventResult(EventID, RecMap),
									ok;
								_ ->
									skip
							end;
						_ ->
							skip
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

dealEventResult(EventID,
	#recEscortMap{
		gharryCode = Code,
		playerEts = PlayerEts,
		monsterEts = MonsterEts,
		mapPID = MapPID,
		createRoleID = RoleID,
		createRoleLevel = RoleLevel,
		sequenceNumber = SeqNum}) ->
	%% EscortPlayerEvent_AddReward 奖励增益事件，结算的时候才处理
	#escort_eventCfg{event = [EventType|Param]} = getCfg:getCfgPStack(cfg_escort_event, EventID),
	L = acEscortState:getEscortJoinPlayerList(),

	%% 通知当前地图所有人，获得什么事件
	LAll = querySequencePlayer(L, SeqNum),
	sendEscortMsgToPlayer(LAll, PlayerEts, {eventResult, EventID}),

	%% 详细处理事件
	case EventType of
		?EscortPlayerEvent_AddReward -> skip;
		?EscortPlayerEvent_GharryBuff ->
			[BuffID] = Param,
			%% 马车buff
			case myEts:lookUpEts(MonsterEts, Code) of
				[#recMapObject{id = ID}] ->
					#monsterCfg{level = Level} = getCfg:getCfgPStack(cfg_monster, ID),
					psMgr:sendMsg2PS(MapPID, addBuff, {Code, BuffID, Level}),
					ok;
				_ ->
					skip
			end,
			ok;
		?EscortPlayerEvent_PBuff ->
			[BuffID] = Param,
			%% 护送玩家buff
			L2 = querySequencePlayer(L, SeqNum, true),
			sendEscortMsgToPlayer(L2, PlayerEts, {addbuff, {BuffID, EventID}}),
			ok;
		?EscortPlayerEvent_RobBuff ->
			[BuffID] = Param,
			%% 劫掠玩家BUFF
			L2 = querySequencePlayer(L, SeqNum, false),
			sendEscortMsgToPlayer(L2, PlayerEts, {addbuff, {BuffID, EventID}}),
			ok;
		?EscortPlayerEvent_AddMonster ->
			%% 额外增加怪物
			[MonsterIndex, Radius] = Param,
			case myEts:lookUpEts(MonsterEts, Code) of
				[#recMapObject{x = Sx, y = Sy}] ->
					addMonsterToMap(MapPID, RoleID, RoleLevel, MonsterIndex, Radius, Sx, Sy),
					ok;
				_ ->
					skip
			end,
			ok
	end,
	ok.

sendEscortMsgToPlayer(#recEscortJoin{roleID = RoleID,sequenceNumber = SeqNum, escortType = EType, isEscort = Escort}, PlayerEts, Data) ->
	MS = ets:fun2ms(fun(P) when P#recMapObject.id =:= RoleID -> P end),
	case myEts:selectEts(PlayerEts, MS) of
		[#recMapObject{pid = Pid}] ->
			NewData = 
			case Data of   
				{reward, {_,_,_,_} = Datas} ->
					Damages = getScortSelfDamageEarnings(RoleID, SeqNum),
					NDate = erlang:append_element(Datas, Damages),
					{reward, NDate};
				_ ->
					Data
			end,
			?LOG_OUT("sendEscortMsgToPlayer:~p", [NewData]),
			psMgr:sendMsg2PS(Pid, sendEscortMsgToPlayer, {EType, Escort, NewData}),
			ok;
		_ ->
			skip
	end,
	ok;
sendEscortMsgToPlayer([#recEscortJoin{}=Join|List], PlayerEts, Data) ->
	sendEscortMsgToPlayer(Join, PlayerEts, Data),
	sendEscortMsgToPlayer(List, PlayerEts, Data);
sendEscortMsgToPlayer([], _PlayerEts, _Data) ->
	ok.

canAddEventID(EventID, CurNumber) ->
	#escort_eventCfg{event_num = Number} = getCfg:getCfgPStack(cfg_escort_event, EventID),
	if
		Number < 0 ->
			%% 无限制
			true;
		Number > CurNumber ->
			%% 还有机会
			true;
		true ->
			%% 其它情况均不能再获得了
			false
	end.

getEventID(EventS, EventE, OEList) ->
	%% 先去除不能再获得的事件
	Fun =
		fun(#recEscortEvent{eventID = EID, getNumber = Num}, AccList) ->
			case canAddEventID(EID, Num) of
				true -> AccList;
				_ -> [EID | AccList]
			end
		end,
	DecList = lists:foldl(Fun, [], OEList),
	AllList = getCfg:get1KeyList(cfg_escort_event),
	List = AllList -- DecList,
	EventID =
		case EventS =:= EventE of
			true -> EventS;
			_ -> misc:rand(EventS, EventE)
		end,
	case lists:member(EventID, List) of
		true ->
			EventID;
		_ ->
			0
	end.

addMonsterToMap(MapPID, RoleID, Level, MonsterIndex, Radius, Sx, Sy) ->
	MonsterIndex2 =
		case MonsterIndex > 0 of
			true -> MonsterIndex;
			_ ->
				%% 随机取一组
				L = getCfg:get1KeyList(cfg_escort_monster),
				lists:nth(misc:rand(1, erlang:length(L)), L)
		end,
	#escort_monsterCfg{monster = MonsterList} = getCfg:getCfgPStack(cfg_escort_monster, MonsterIndex2),
	MonsterList2 = lists:map(fun({MonsterID, Number}) -> {MonsterID, Number, Sx, Sy} end, MonsterList),
	%% 通知地图刷怪
	psMgr:sendMsg2PS(MapPID, addMonsterToMap_EscortPower, {0, Radius, MonsterList2, {RoleID, Level}}),
	ok.

isTrigger([], _WayPtList, _Sx, _Sy) ->
	false;
isTrigger([{Node,_,_}|_] = N, WayPtList, Sx, Sy) ->
	NodeS = Node,
	NodeE = Node + 1,
	case lists:keyfind(NodeS, #recMapWayPt.id, WayPtList) of
		#recMapWayPt{x = Xs, y = Ys} ->
			case lists:keyfind(NodeE, #recMapWayPt.id, WayPtList) of
				#recMapWayPt{x = Xe, y = Ye} ->
					%% 计算当前点是否在触发范围
					if
						Xs =< Sx andalso Sx =< Xe andalso ((Ys =< Sy andalso Sy =< Ye) orelse (Ye =< Sy andalso Sy =< Ys)) -> true;
						Xe =< Sx andalso Sx =< Xs andalso ((Ys =< Sy andalso Sy =< Ye) orelse (Ye =< Sy andalso Sy =< Ys)) -> true;
						true -> false
					end;
				_ ->
					?ERROR_OUT("isTrigger:~p,~p", [NodeE, N]),
					error
			end;
		_ ->
			?ERROR_OUT("isTrigger:~p,~p", [NodeS, N]),
			error
	end.

updateGharryID(#recEscortMap{sequenceNumber = SequenceNumber, gharryCode = Code, escortType = EscortType, monsterEts = MEts} = R, NewL) ->
	Rec =
		case Code of
			-1 ->
				%% 已经请求刷马车，找出code
				GharryID = getGharryID(EscortType),

				MS = ets:fun2ms(fun(P) when P#recMapObject.id =:= GharryID -> P end),
				case myEts:selectEts(MEts, MS) of
					[#recMapObject{code = Code2, maxHp = MaxHp} = Object] ->
						?DEBUG_OUT("updateGharryID:~p,~p,~p", [Code2, R, Object]),
						case EscortType =:= ?EscortType_Team of
							true ->
								EarningsList = acEscortState:getEscortEarningsList(),
								case lists:keyfind(SequenceNumber, #recEscortEarnings.sequenceNumber, EarningsList) of
									false ->
										Earn = #recEscortEarnings{sequenceNumber = SequenceNumber, gharryMxpHp = MaxHp},
										NewRarn = lists:keystore(SequenceNumber,#recEscortEarnings.sequenceNumber,EarningsList,Earn),
						           		acEscortState:setEscortEarningsList(NewRarn);
									Earn ->
										NewRarn = lists:keystore(SequenceNumber,#recEscortEarnings.sequenceNumber,EarningsList,Earn#recEscortEarnings{gharryMxpHp = MaxHp}),
						           		acEscortState:setEscortEarningsList(NewRarn)
								end;
										
							_ -> skip
						end,
						R#recEscortMap{gharryCode = Code2};
					[] -> R;
					Other ->
						?ERROR_OUT("updateGharryID:~p,~p", [R,Other]),
						R
				end;
			_ -> R
		end,
	[Rec | NewL];
updateGharryID([], NewL) -> NewL;
updateGharryID([#recEscortMap{} = Map|ML], NewL) ->
	L = updateGharryID(Map, NewL),
	updateGharryID(ML, L).

%% call 请求劫掠
-spec requestEscortRob(Data::tuple()) -> {false, uint()} | more | false | nostart | {true, pid()} | error.
requestEscortRob({SequenceNumber, RoleID, RoleLevel, RoleName,IsHaveItem}) ->
	case acEscortState:getEscortStart() of
		true ->
			MList = acEscortState:getEscortMapList(),
			case lists:keyfind(SequenceNumber, #recEscortMap.sequenceNumber, MList) of
				#recEscortMap{} ->
					PList = acEscortState:getEscortJoinPlayerList(),

					%% 先查询是否有这个人的信息，如果有，直接进入
					case lists:keyfind(RoleID, #recEscortJoin.roleID, PList) of
						#recEscortJoin{escortType = EscortType} ->
							%% 有这个人的信息，出错
							{false, EscortType};
						false ->
							%% 没找到这个人的信息，首先要判断是否满足进入条件了
							case IsHaveItem of
								true ->
									%% 判断人数是否已经足够
									[#recEscortJoin{escortType = EscortType, mapPID = PID}|_] = L = querySequencePlayer(PList, SequenceNumber),
									L2 = lists:filter(fun(#recEscortJoin{isEscort = IsEscort}) -> not IsEscort end, L),
									#globalsetupCfg{setpara = [NeedPlayerNumber]} = getCfg:getCfgPStack(cfg_globalsetup, robbery_player_num),
									case erlang:length(L2) < NeedPlayerNumber of
										true ->
											%% 满足基本进入条件
											R = #recEscortJoin{
												roleID = RoleID,
												roleLevel = RoleLevel,
												roleName = RoleName,
												sequenceNumber = SequenceNumber,
												mapPID = PID,
												isEscort = false,
												isCreater = false,
												escortType = EscortType
											},
											acEscortState:setEscortJoinPlayerList([R | PList]),
											{true, PID};
										_ ->
											more
									end;
								_ ->
									false
							end
					end;
				_ ->
					error
			end;
		_ ->
			nostart
	end.

%% call请求护送
-spec requestEscort(Data::tuple()) -> nostart | ok | boolean() | error | more | pid() | {false, uint()} | {true, pid() | undefined} | waitleader.
requestEscort({EscortType, RoleID, RoleLevel, TeamLeaderID, IsHaveItem, IsHaveDail, NeedPlayerNumber}) ->
	case acEscortState:getEscortStart() of
		true ->
			L = acEscortState:getEscortJoinPlayerList(),

			%% 先查询是否有这个人的信息，如果有，直接进入
			case lists:keyfind(RoleID, #recEscortJoin.roleID, L) of
				#recEscortJoin{mapPID = MapPID, escortType = EscortType} ->
					%% 有这个人的信息
					case erlang:is_pid(MapPID) of
						true ->
							%% 之前有分配地图，可以直接进入了
							MapPID;
						_ ->
							%% 有报名参加，但是还没有分配地图，不能进入，等待分配地图
							ok
					end;
				#recEscortJoin{escortType = EType} ->
					%% 当前已经在护送中，与本次请求的类型不一致
					{false, EType};
				false ->
					%% 没找到这个人的信息，首先要判断是否满足进入条件了
					case EscortType of
						?EscortType_Solo ->
							case IsHaveItem andalso IsHaveDail of
								true ->
									%% 满足基本进入条件
									requestEscort_Sole(RoleID, RoleLevel);
								_ ->
									false
							end;
						?EscortType_Team ->
							%% 组队，如果是队长，则要判断是否有足够的凭证，如果是队员，则不扣凭证
							case RoleID =:= TeamLeaderID of
								true ->
									case IsHaveItem andalso IsHaveDail of
										true ->
											%% 满足基本进入条件
											requestEscort_Team(RoleID, RoleLevel, TeamLeaderID, NeedPlayerNumber);
										_ ->
											false
									end;
								_ ->
									case IsHaveDail of
										true ->
											%% 满足基本进入条件
											requestEscort_Team(RoleID, RoleLevel, TeamLeaderID, NeedPlayerNumber);
										_ ->
											false
									end
							end;
						?EscortType_Rob ->
							error
					end
			end;
		_ ->
			nostart
	end.

%% 进入单人护送
requestEscort_Sole(RoleID, RoleLevel) ->
	R = #recEscortJoin{
		roleID = RoleID,
		roleLevel = RoleLevel,
		sequenceNumber = acEscortState:getEscortSequenceNumber(),
		escortType = ?EscortType_Solo
	},
	L = acEscortState:getEscortJoinPlayerList(),
	acEscortState:setEscortJoinPlayerList([R | L]),

	core:sendMsgToMapMgr(?EscortMapID, createActivityMap, {?EscortMapID, 1, 0}),
	true.

%% 进入多人护送
requestEscort_Team(RoleID, RoleLevel,TeamLeaderID, _NeedPlayerNumber) when RoleID =:= TeamLeaderID ->
	%% 是队长，创建一个多人护送
	R = #recEscortJoin{
		roleID = RoleID,
		roleLevel = RoleLevel,
		sequenceNumber = acEscortState:getEscortSequenceNumber(),
		escortType = ?EscortType_Team
	},
	L = acEscortState:getEscortJoinPlayerList(),
	acEscortState:setEscortJoinPlayerList([R | L]),

	core:sendMsgToMapMgr(?EscortMapID, createActivityMap, {?EscortMapID, 1, 0}),

	%% 全世界广播
	RoleName = playerNameUID:getPlayerNameByUID(RoleID),
	Content = stringCfg:getString(escort_Team_Start, [RoleName]),
	activityCommon:sendBroadcastNotice(Content),
	{true, undefined};
requestEscort_Team(RoleID, RoleLevel, TeamLeaderID, NeedPlayerNumber) ->
	L = acEscortState:getEscortJoinPlayerList(),
	case lists:keyfind(TeamLeaderID, #recEscortJoin.roleID, L) of
		#recEscortJoin{escortType = ?EscortType_Team, sequenceNumber = SeqNumber, mapPID = MapPID} ->
			%% 队长还在，则判断是否已经有足够人数
			L2 = querySequencePlayer(L, SeqNumber, true),

			case erlang:length(L2) < NeedPlayerNumber of
				true ->
					DR = #recEscortJoin{
						roleID = RoleID,
						roleLevel = RoleLevel,
						sequenceNumber = SeqNumber,
						mapPID = MapPID,
						escortType = ?EscortType_Team,
						eventTime = 0,
						eventID = 0,
						isCreater = false,
						isEscort = true
					},
					acEscortState:setEscortJoinPlayerList(L ++ [DR]),
					case erlang:is_pid(MapPID) of
						true -> {true, MapPID};
						_ -> {true, undefined}
					end;
				_ ->
					%% 人数已经满了
					more
			end;
		_ ->
			%% 队长不存在，进入失败
			waitleader
	end.

querySequencePlayer(List, SeqNumber) ->
	querySequencePlayer(List, SeqNumber, 0).

querySequencePlayer(List, SeqNumber, IsEscort) when erlang:is_boolean(IsEscort) ->
	lists:filter(fun(#recEscortJoin{sequenceNumber = Number, isEscort = Escort}) -> Number =:= SeqNumber andalso Escort =:= IsEscort end, List);
querySequencePlayer(List, SeqNumber, _) ->
	lists:filter(fun(#recEscortJoin{sequenceNumber = Number}) -> Number =:= SeqNumber end, List).

queryRolePID(RoleID) ->
    case core:queryPlayerPidByRoleID(RoleID) of
        offline -> false;
        Pid -> Pid
    end.

%queryRoleNetPID(RoleID) ->
%    case core:queryNetPidByRoleID(RoleID) of
%        offline -> false;
%        Pid -> Pid
%    end.

getGharryID(EscortType) ->
	case EscortType of
		?EscortType_Solo -> ?GharryID_Solo;
		?EscortType_Team -> ?GharryID_Team
	end.

getScortDamageEarnings(SeqNum) ->
	EarningsList = acEscortState:getEscortEarningsList(),
	Fun = fun(#recEscortEarnings{
						sequenceNumber = SequenceNumber,
						targeName = RoleName,
						roleEarnings = Eanrings}, Acc) ->
				case Eanrings > 0 andalso SeqNum =:= SequenceNumber of
					true ->
						[{RoleName, Eanrings}| Acc];
					_ ->
						Acc
				end	  
		end,
	lists:foldr(Fun, [], EarningsList).


getScortSelfDamageEarnings(RoleID, SeqNum) ->
		EarningsList = acEscortState:getEscortEarningsList(),
		Fun = fun(#recEscortEarnings{
							sequenceNumber = SequenceNumber,
							targeID = TargeID,
							roleEarnings = Eanrings}, Acc) ->
					case Eanrings > 0 andalso SeqNum =:= SequenceNumber andalso TargeID =:= RoleID of
						true ->
							Eanrings + Acc;
						_ ->
							Acc
					end	  
			end,
		lists:foldr(Fun, 0, EarningsList).