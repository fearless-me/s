%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, 好玩一二三
%%% @doc
%%% 活动逻辑模块
%%% @end
%%% Created : 06. 二月 2015 14:32
%%%-------------------------------------------------------------------
-module(acDarknessLogic).
-author("tiancheng").

-include("../../activityPrivate.hrl").
-include("../activityPhaseDefine.hrl").
-include("acDarknessPrivate.hrl").

%% API
-export([
	activityChangeCallBack/1,
	activityMapMsg/2,
	createActivityMapAck/1,

	darknessTickTime/0,
	updatePlayerDarkness/2,
	requestEnterDarkness/2,
	requestEnterDarkness_prepare/2,
	syncRoundToMe/1,
	objectDeadInDarkness/1,
	updatePlayerPebble/1,
	syncClientToMe/1,
	tryToOnlineEnterMap_darkness/1,
	useDarknessItemTransfer/1
]).

-export([
	startDarkness/0,
	getNowTime/0,
	canEnterMap/1,
	tryEnterDarknessMap/0,
	judgeSpecialBossFreshTimeIsIn/0
]).

%% 主活动模块进程回调
-spec activityChangeCallBack(Phase::uint()) -> ok.
activityChangeCallBack(?ActivityPhase_Close) ->
	?LOG_OUT("~p activityChangeCallBack close", [?MODULE]),

	%% 结算积分，发奖
	acDarknessActivity:reward(),

	%% 设置结束
	IsStart = acDarknessState:getACIsStart(),
	acDarknessState:setACIsStart(false),

	case IsStart of
		true ->
			%% 置空特殊BOSS
			acDarknessState:delSpecialBossInfo(),

			%% 踢怪，置空数据
			L = acDarknessState:getDarknessMapList(),
			F = fun(#darknessMap{key = Key, mapPID = MapPID} = Map, Acc) ->
				case erlang:is_pid(MapPID) of
					true ->
						%% 刷新玩家的PK模式
						freshPlayerPKCamp(Map#darknessMap.playerEts),

						%% 清理怪物和采集物
						psMgr:sendMsg2PS(MapPID, resetCopyMap, {}),
%%						psMgr:sendMsg2PS(MapPID, clearMonsterAndCollectObject, 0),
						ok;
					_ ->
						skip
				end,

				%% 置空数据
				NMap = getInitMap(Map),
				lists:keystore(Key, #darknessMap.key, Acc, NMap)
			    end,
			NL = lists:foldl(F, L, L),
			acDarknessState:setDarknessMapList(NL),

			Str = stringCfg:getString(darkness_endmonster),
			activityCommon:sendBroadcastNotice(Str),
			ok;
		_ ->
			skip
	end,
	ok;
activityChangeCallBack(?ActivityPhase_Darkness_1) ->
	?LOG_OUT("~p activityChangeCallBack 1", [?MODULE]),
	%% 先清理一遍数据，不踢人
	L = acDarknessState:getDarknessMapList(),
	F =
		fun(#darknessMap{key = Key} = Map, Acc) ->
			NMap = getInitMap(Map),
			lists:keystore(Key, #darknessMap.key, Acc, NMap)
		end,
	NL = lists:foldl(F, L, L),
	acDarknessState:setDarknessMapList(NL),

	%% 置空特殊BOSS
	acDarknessState:delSpecialBossInfo(),

	%% 正式开始刷怪
	acDarknessState:setACIsStart(true),
	ok;
activityChangeCallBack(Phase) ->
	?ERROR_OUT("~p ~p activityChangeCallBack:~p", [?MODULE, self(), Phase]),
	ok.

%% 活动地图的消息
-spec activityMapMsg(MsgType::uint(), Data::term()) -> ok.
activityMapMsg(?ACMapMsg_CreateMap, {_CreateRoleID,_MapID,MapPid,PlayerEts,MonsterEts,CollectEts,NpcEts} = _Data) ->
	L = acDarknessState:getDarknessMapList(),
	case lists:keyfind(MapPid, #darknessMap.mapPID, L) of
		#darknessMap{} = Map ->
			NMap = Map#darknessMap{playerEts = PlayerEts, monsterEts = MonsterEts, npcEts = NpcEts},
			NL = lists:keystore(MapPid, #darknessMap.mapPID, L, NMap),
			acDarknessState:setDarknessMapList(NL);
		_ ->
			acDarknessState:addMapEtsCache({MapPid,PlayerEts,MonsterEts,CollectEts,NpcEts})
	end,
	ok;
activityMapMsg(?ACMapMsg_DestoryMap, MapPid) ->
	L = acDarknessState:getDarknessMapList(),
	case lists:keyfind(MapPid, #darknessMap.mapPID, L) of
		#darknessMap{} = Map ->
			NMap = Map#darknessMap{mapPID = undefined, playerEts = undefined, monsterEts = undefined, npcEts = undefined},
			NL = lists:keystore(MapPid, #darknessMap.mapPID, L, NMap),
			acDarknessState:setDarknessMapList(NL);
		_ ->
			skip
	end,
	ok;
activityMapMsg(?ACMapMsg_KillMonster, {_MapID, MapPID, AttackRoleID, _MonsterCode, MonsterID}) ->
	case acDarknessState:getACIsStart() of
		true ->
			monsterDead(MapPID, AttackRoleID, MonsterID);
		_ ->
			skip
	end,
	ok;
activityMapMsg(?ACMapMsg_PlayerEnter, {RoleID, MapPID, #recMapObject{}}) ->
	ML = acDarknessState:getDarknessMapList(),
	case lists:keyfind(MapPID, #darknessMap.mapPID, ML) of
		#darknessMap{waitEnterPlayer = Wait, key = Key} = Map ->
			Wait2 = lists:keydelete(RoleID, #waitEnterPlayer.roleID, Wait),
			ML2 = lists:keystore(Key, #darknessMap.key, ML, Map#darknessMap{waitEnterPlayer = Wait2}),
			acDarknessState:setDarknessMapList(ML2),
			ok;
		_ ->
			skip
	end,
	ok;
activityMapMsg(_MsgType, _Data) ->
	ok.

%% 初始化黑暗之地
startDarkness() ->
	?LOG_OUT("~p startDarkness", [?MODULE]),
	%% 分配地图层
	L = lists:seq(1, ?DarknessEntranceNumber),
	[startDarkness(I) || I <- L],
	%% 开启心跳
	erlang:send_after(?DarknessTickTime, self(), darknessTickTime),
	ok.
%% 初始化黑暗之地
startDarkness(Entrance) ->
	#activityCfg{mapidlist = MapIDList} = getCfg:getCfgPStack(cfg_activity, ?ActivityType_Darkness),
	F =
		fun(MapID, {I, AccList}) ->
			R = #darknessMap{
				mapID = MapID,
				floor = I,
				entrance = Entrance,
				key = acDarknessState:getApplyNumber()
			},
			{I + 1, [R | AccList]}
		end,
	{_, List} = lists:foldl(F, {1, []}, MapIDList),
	L = acDarknessState:getDarknessMapList(),
	acDarknessState:setDarknessMapList(List ++ L),
	ok.

%% 心跳
-spec darknessTickTime() -> ok.
darknessTickTime() ->
	erlang:send_after(?DarknessTickTime, self(), darknessTickTime),

	%% 检查版本号
	acDarknessActivity:checkVersion(),

	%% 准备特殊BOSS到内存
	rankSpecialBoss(),

	%% 取地图数据
	ML = acDarknessState:getDarknessMapList(),

	%% 在特殊活动时间点，如果没有选择阵营，踢踢踢
	kickNothingPlayer(ML),

	%% 先去掉超时玩家
	ML1 = passRepeatEnterPlayer(ML, []),
	acDarknessState:setDarknessMapList(ML1),

	%% 批量回收活动地图
	ML2 = recycleDarknessMap(ML1, []),
	acDarknessState:setDarknessMapList(ML2),

	%% 批量创建活动地图
	ML3 = createDarknessMap(ML2, []),
	acDarknessState:setDarknessMapList(ML3),

	%% 刷怪
	ML4 = reviveEliteMonster(ML3, []),
	acDarknessState:setDarknessMapList(ML4),

	%% 分配玩家进入下一层
	ML5 = allocPlayerEnter(ML4),
	acDarknessState:setDarknessMapList(ML5),

	%% 排行榜积分刷新
	acDarknessActivity:freshRank(),

	%% 给正在排队的玩家一个系统提示
	noticeQueuePlayer(),
	ok.

tryCreateDarknessMap(RoleID) ->
	L = acDarknessState:getDarknessApplyList(),
	case lists:keyfind(RoleID, #darknessApply.roleID, L) of
		#darknessApply{floor = Floor} ->
			%% 取地图数据
			ML = acDarknessState:getDarknessMapList(),
			MLFloor = lists:filter(fun(#darknessMap{floor = F}) -> F =:= Floor end, ML),
			NewML = createDarknessMap(MLFloor, ML -- MLFloor),
			acDarknessState:setDarknessMapList(NewML),
			ok;
		_ ->
			skip
	end,
	ok.

rankSpecialBoss() ->
	case acDarknessState:getACIsStart() of
		true ->
			case acDarknessState:getSpecialBossInfo() of
				#darknessSpecialBoss{bossID = 0} ->
					%% 需要刷下一个特殊BOSS了
					#globalsetupCfg{setpara = PosList} = getCfg:getCfgPStack(cfg_globalsetup, darkness_bosspoint),
					{NewMapID, NX, NY} = getRandObjFromList(PosList),

					#activityCfg{mapidlist = MapIDList} = getCfg:getCfgPStack(cfg_activity, ?ActivityType_Darkness),
					case misc:getListPos(NewMapID, MapIDList) of
						0 ->
							?ERROR_OUT("rankSpecialBoss config error:~p,~p", [PosList, NewMapID]),
							skip;
						Floor ->
							#globalsetupCfg{setpara = IDList} = getCfg:getCfgPStack(cfg_globalsetup, darkness_bossid),
							#globalsetupCfg{setpara = CDList} = getCfg:getCfgPStack(cfg_globalsetup, darkness_bosscd),
							NewBossID = getRandObjFromList(IDList),
							NewCD = getRandObjFromList(CDList),
							NowTime = getNowTime(),
							Entrance = misc:rand(1, ?DarknessEntranceNumber),

							{BossName, MaxHP, DropStr} =
								case getCfg:getCfgPStack(cfg_monster, NewBossID) of
									#monsterCfg{showName = SN, maxHP = MHP, dropList = ItemDropID, equipDropList = EquipDropList} ->
%%										?DEBUG_OUT("special boss drop:~p,~p", [NewBossID, ItemDropID, EquipDropList]),
										{SN, MHP, getSpecialBossDropStr(ItemDropID, EquipDropList)};
									_ -> {"", 0, ""}
								end,

							NewRec = #darknessSpecialBoss{
								freshTime = NowTime + NewCD,
								bossID = NewBossID,
								entrance = Entrance,
								floor = Floor,
								mapID = NewMapID,
								x = NX,
								y = NY,
								isJoinMap = false,  % 还没在心跳中加入地图
								noticeNumber = 0,
								bossName = BossName,
								bossMaxHP = MaxHP,
								bossDrop = DropStr
							},
							%% 保存
							acDarknessState:setSpecialBossInfo(NewRec),

							?LOG_OUT("rankSpecialBoss:~p,~p", [NowTime,NewRec]),
							ok
					end;
				_ ->
					skip
			end,

			Info = acDarknessState:getSpecialBossInfo(),
			Info2 = noticeSpecialBoss(Info),
			Info3 = noticeSpecialBoss(Info2),
			acDarknessState:setSpecialBossInfo(Info3),
			ok;
		_ ->
			skip
	end,
	ok.

kickNoCampPlayer([]) -> ok;
kickNoCampPlayer(#darknessMap{mapPID = undefined}) -> ok;
kickNoCampPlayer(#darknessMap{playerEts = PlayerEts}) ->
	List = ets:tab2list(PlayerEts),
	F =
		fun(#recMapObject{id = RoleID, pid = Pid, actionStatus = AStatus}) ->
			case AStatus of
				?CreatureActionStatusChangeMap ->
					skip;
				_ ->
					case edb:dirtyReadRecord(rec_darkness_ac_rank, RoleID) of
						[#rec_darkness_ac_rank{}] ->
							ok;
						_ ->
							%% 踢人
							psMgr:sendMsg2PS(Pid, darkness_kickCopyMapPlayer, {}),
							skip
					end
			end
		end,
	lists:foreach(F, List),
	ok;
kickNoCampPlayer([#darknessMap{} = Map | Right]) ->
	kickNoCampPlayer(Map),
	kickNoCampPlayer(Right).

%% 尝试直接进入，包括分配其它层
tryEnterDarknessMap() ->
	%% 分配玩家进入下一层
	ML = acDarknessState:getDarknessMapList(),
	ML2 = allocPlayerEnter(ML),
	acDarknessState:setDarknessMapList(ML2),
	ok.

%% 按线路分配玩家进入黑暗之地
allocPlayerEnter(ML) ->
	case acDarknessState:getDarknessApplyList() of
		[] -> ML;
		LP ->
			%% 把地图线，按人多的排序，并且把高层排在前面
			ML2 = lists:filter(fun(#darknessMap{mapPID = MapPID, playerEts = PETS}) -> erlang:is_pid(MapPID) andalso PETS /= undefined end, ML),
			Fun =
				fun(#darknessMap{floor = F1, entrance = E1} = M1, #darknessMap{floor = F2, entrance = E2} = M2) ->
					P1 = getHaveNumber(M1),
					P2 = getHaveNumber(M2),
					if
						E1 > E2 -> true;
						E1 =:= E2 andalso F1 > F2 -> true;
						E1 =:= E2 andalso F1 =:= F2 andalso P1 > P2 -> true;
						true -> false
					end
				end,
			ML3 = lists:sort(Fun, ML2),
			ML4 = ML -- ML3,

			{NLP, NML} = allocPlayerEnter(LP, ML3, []),
			%% 保存新的申请列表
			acDarknessState:setDarknessApplyList(NLP),
			%% 保存新的地图列表
			ML4 ++ NML
	end.

%% 分配报名的人进入黑暗之地
allocPlayerEnter([], LM, NLM) -> {[], NLM ++ LM};
allocPlayerEnter(LP, [], NLM) -> {LP, NLM};
allocPlayerEnter(LP, #darknessMap{mapPID = undefined} = Map, NLM) ->
	{LP, [Map | NLM]};
allocPlayerEnter(LP, #darknessMap{playerEts = undefined} = Map, NLM) ->
	{LP, [Map | NLM]};
allocPlayerEnter(LP, #darknessMap{mapID = MapID, mapPID = MapPID, floor = F, waitEnterPlayer = Waiting1} = Map, NLM) ->
	NowTime = getNowTime(),

	%% 让玩家陆续进入，可能刚进入，地图就强制回收了
	NeedNumber = getNeedNumber(),
	HaveNumber = getHaveNumber(Map),
	Diff = NeedNumber - HaveNumber,
	AllowNumber =
		case Diff >= 2 of
			true -> Diff div 2;
			_ -> Diff
		end,
	case lists:filter(fun(#darknessApply{floor = FA}) -> F=:=FA end, LP) of
		[] ->
			{LP, [Map | NLM]};
		LP1 ->
			LP2 = lists:keysort(#darknessApply.index, LP1),

			%% 通知这些人进入地图
			LP3 = lists:sublist(LP2, AllowNumber),
			NowTime = getNowTime(),
			%% 加入待进列表
			F1 =
				fun(#darknessApply{roleID = RID}, Acc) ->
					R = #waitEnterPlayer{roleID = RID, time = NowTime},
					lists:keystore(RID, #waitEnterPlayer.roleID, Acc, R)
				end,
			Waiting2 = lists:foldl(F1, Waiting1, LP3),
			NMap = Map#darknessMap{playerEnterTime = NowTime, waitEnterPlayer = Waiting2},
			?LOG_OUT("allocPlayerEnter invite player enter:AllowNumber=~p,NMap=~p", [AllowNumber,NMap]),
			delRoleFromApply(LP3),
			[psMgr:sendMsg2PS(PID, noticePlayerEnterMap, {MapID, MapPID}) || #darknessApply{pid = PID} <- LP3],
			{LP -- LP3, [NMap | NLM]}
	end;
allocPlayerEnter(LP, [Map|List], NLM) ->
	{NLP, NLM2} = allocPlayerEnter(LP, Map, NLM),
	allocPlayerEnter(NLP, List, NLM2).

%% 去重进入玩家
passRepeatEnterPlayer([], NML) ->
	NML;
passRepeatEnterPlayer(#darknessMap{playerEts = undefined} = Map, NML) ->
	[Map | NML];
passRepeatEnterPlayer(#darknessMap{mapPID = undefined} = Map, NML) ->
	[Map | NML];
passRepeatEnterPlayer(#darknessMap{playerEts = PlayerEts, waitEnterPlayer = Waiting} = Map, NML) ->
	%% 先去掉超时的玩家
	NowTime = getNowTime(),
	F1 = fun(#waitEnterPlayer{time = Time}) -> NowTime - Time < ?WaitEnterPlayerMaxTime end,
	case lists:filter(F1, Waiting) of
		[] ->
			[Map#darknessMap{waitEnterPlayer = []} | NML];
		Waiting2 ->
			%% 再去掉已经进去的玩家
			F2 = fun(#recMapObject{id = RID}, Acc) -> lists:keydelete(RID, #waitEnterPlayer.roleID, Acc) end,
			Waiting3 = ets:foldl(F2, Waiting2, PlayerEts),
			[Map#darknessMap{waitEnterPlayer = Waiting3} | NML]
	end;
passRepeatEnterPlayer([#darknessMap{} = Map | List], NML) ->
	NML2 = passRepeatEnterPlayer(Map, NML),
	passRepeatEnterPlayer(List, NML2).

%% 批量创建活动地图
createDarknessMap([], NML) ->
	NML;
createDarknessMap(#darknessMap{mapPID = PID} = Map, NML) when erlang:is_pid(PID) ->
	[Map | NML];
createDarknessMap(#darknessMap{mapPID = undefined, isWaitAlloc = true} = Map, NML) ->
	[Map | NML];
createDarknessMap(#darknessMap{mapID = MapID, mapPID = undefined, isWaitAlloc = false, floor = Floor, waitEnterPlayer = Waits} = Map, NML) ->
	%% 这个地图不存在，判断是否有等待进入的玩家，如果没有，则不分配地图资源
	ApplyList = acDarknessState:getDarknessApplyList(),
	CanCreateMap =
		case lists:filter(fun(#darknessApply{floor = F}) -> F =:= Floor end, ApplyList) of
			[] ->
				erlang:length(Waits) > 0;
			_ ->
				%% 有想要进入这层的玩家，分配地图
				true
		end,

	case CanCreateMap of
		true ->
			%% 有想要进入这层的玩家，分配地图
			?LOG_OUT("allocPlayerEnter alloc map real:~p", [Map]),
			NowTime = getNowTime(),
			NMap = Map#darknessMap{isWaitAlloc = true, createMapTime = NowTime},
			core:sendMsgToMapMgr(MapID, createActivityMap, {MapID, 1, {NMap}}),
			[NMap | NML];
		_ ->
			[Map | NML]
	end;
createDarknessMap([#darknessMap{} = Map | List], NML) ->
	NML2 = createDarknessMap(Map, NML),
	createDarknessMap(List, NML2).

%% 批量回收活动地图
recycleDarknessMap([], NML) ->
	NML;
recycleDarknessMap(#darknessMap{mapPID = undefined} = Map, NML) ->
	[Map | NML];
recycleDarknessMap(#darknessMap{mapPID = MapPID, createMapTime = CTime, playerEnterTime = ETime} = Map, NML) ->
	NowTime = getNowTime(),
	HaveNumber = getHaveNumber(Map),
%%	?DEBUG_OUT("recycleDarknessMap:{~p,~p,~p,~p,~p} ~p",
%%		[CTime > 0, ETime > 0, NowTime - CTime >= 600, NowTime - ETime >= 60, HaveNumber =< 0, Map]),
	NMap =
		case CTime > 0
			andalso ETime > 0
			andalso NowTime - CTime >= ?DarknessExistMaxTime
			andalso NowTime - ETime >= ?DarknessPlayerEnterMaxTime
			andalso HaveNumber =< 0 of
		true ->
			?WARN_OUT("recycleDarknessMap:~p", [Map]),
			psMgr:sendMsg2PS(MapPID, resetCopyMap, {}),

			%% 直接置空
			Map#darknessMap{mapPID = undefined, playerEts = undefined, monsterEts = undefined, npcEts = undefined};
		_ ->
			Map
	end,
	[NMap | NML];
recycleDarknessMap([#darknessMap{} = Map | List], NML) ->
	NML2 = recycleDarknessMap(Map, NML),
	recycleDarknessMap(List, NML2).

reviveEliteMonster([], NLM) ->
	NLM;
reviveEliteMonster(#darknessMap{mapPID = undefined} = Map, NLM) ->
	[Map | NLM];
reviveEliteMonster(#darknessMap{mapID = MapID, mapPID = MapPID, floor = Floor, entrance = Entrance} = Map, NLM) ->
	case acDarknessState:getACIsStart() of
		true ->
			%% 活动要开始了才刷怪
			NowTime = getNowTime(),
			#darknessCfg{
				boss_id = [BossID, _, _],
				boss_coordinate = BOSSPosList,
				bossfreshtime = BossFreshTimeList
			} = getCfg:getCfgPStack(cfg_darkness, Floor),

			{{_Year, _Month, _Day}, {_Hour, Minute, _Second}} = time:convertSec2DateTime(NowTime),
%%			?DEBUG_OUT("MapID=~p, Floor=~p, freshmonsterTime=~p, deadList=~p",
%%				[MapID, Floor, NowTime - Map#darknessMap.monsterNextFreshTime, Map#darknessMap.deadMonsterIDList]),
			NMap2 =
				case (Minute =:= 0 orelse Minute =:= 1 orelse Minute =:= 15 orelse Minute =:= 16 orelse
					Minute =:= 30 orelse Minute =:= 31 orelse Minute =:= 45 orelse Minute =:= 46)
					andalso (NowTime - Map#darknessMap.monsterlastFreshTime) > 120 of
					true ->
						%% 复活精英怪
						NMap = reviveElite(Map),
						NMap#darknessMap{monsterlastFreshTime = NowTime, deadMonsterIDList = []};
					_ ->
						Map
				end,

			NMap3 =
				case NowTime >= Map#darknessMap.bossNextFreshTime of
					true ->
						%% 检查BOSS是否死亡
						case Map#darknessMap.isBossDead of
							true ->
								%% BOSS已经死了，添加BOSS到地图
								{X, Y} = getRandObjFromList(BOSSPosList),
								psMgr:sendMsg2PS(MapPID, addMonsterToMap, {0, [{BossID, 1, X, Y}]}),
								?LOG_OUT("darkness boss join:~p,~p,~p,~p,~p", [MapID, Floor, BossID, X, Y]),
								NextFreshCD = getRandObjFromList(BossFreshTimeList),
								NMap2#darknessMap{bossNextFreshTime = NowTime + NextFreshCD, isBossDead = false};
							_ ->
								NMap2
						end;
					_ ->
						NMap2
				end,

			%% 添加特殊BOSS到地图
			case acDarknessState:getSpecialBossInfo() of
				#darknessSpecialBoss{isJoinMap = false, mapID = MapID, entrance = Entrance, floor = Floor,
					freshTime = FTime, bossID = SBossID, x = SX, y = SY} = Info when NowTime >= FTime andalso SBossID > 0 ->
					psMgr:sendMsg2PS(MapPID, addMonsterToMap, {0, [{SBossID, 1, SX, SY}]}),
					?LOG_OUT("darkness special boss join:~p,~p,~p,~p,~p", [MapID, Floor, SBossID, SX, SY]),
					acDarknessState:setSpecialBossInfo(Info#darknessSpecialBoss{isJoinMap = true}),
					ok;
				_ ->
					skip
			end,

			[NMap3 | NLM];
		_ ->
			[Map | NLM]
	end;
reviveEliteMonster([#darknessMap{} = Map|List], NLM) ->
	NLM2 = reviveEliteMonster(Map, NLM),
	reviveEliteMonster(List, NLM2).

reviveElite(#darknessMap{mapPID = MapPID, floor = Floor, monsterEts = MonsterEts} = Map) ->
	#darknessCfg{drop = MonsterIDList, elite_coordinate = MonsterPosList} = getCfg:getCfgPStack(cfg_darkness, Floor),

	%% 统计死了多少怪
	MonsterIDList2 = [MonsterID || {MonsterID, _, _} <- MonsterIDList],

	MatchSpec = ets:fun2ms(
		fun(Monster) when Monster#recMapObject.type  =:= ?ObjTypeMonster ->
			Monster#recMapObject.id
		end),
	ExistMonsterIDList = myEts:selectEts(MonsterEts, MatchSpec),
	MonsterIDList3 = lists:foldl(fun(ID, Acc) -> lists:delete(ID, Acc) end, MonsterIDList2, ExistMonsterIDList),

	%% 复活已经死去的怪
	case activityCommon:getAllocList(MonsterIDList3, MonsterPosList) of
		[] ->
			skip;
		ML ->
			?LOG_OUT("darkness elite join:~p,~p,~p", [Floor, ML, Map]),
			psMgr:sendMsg2PS(MapPID, addMonsterToMap, {0, ML})
	end,

	%% 广而告之
	freshMonsterAdvertisement(),

	Map.

createActivityMapAck({MapID, [MapPID], {#darknessMap{key = Key, floor = Floor}} = Data}) ->
	?LOG_OUT("createActivityMapAck ~p,~p,~p", [?MODULE, MapPID, Data]),
	%% 第一层
	L = acDarknessState:getDarknessMapList(),
	Map = #darknessMap{mapPID = undefined, deadMonsterIDList = DeadList} = lists:keyfind(Key, #darknessMap.key, L),
	NMap =
		case acDarknessState:getMapEtsCache(MapPID) of
			{_, PE, ME, _CE, NE} ->
				acDarknessState:delMapEtsCache(MapPID),
				Map#darknessMap{playerEts = PE, monsterEts = ME, npcEts = NE};
			_ ->
				Map
		end,

	NowTime = getNowTime(),
	NL = lists:keystore(Key, #darknessMap.key, L,
		NMap#darknessMap{mapPID = MapPID, isWaitAlloc = false, createMapTime = NowTime}),
	acDarknessState:setDarknessMapList(NL),

	case acDarknessState:getACIsStart() of
		true ->
			%% 刷怪与BOSS
			#darknessCfg{
				boss_id = [BossID, _, _],
				boss_coordinate = BOSSPosList,
				drop = MonsterIDList,
				elite_coordinate = MonsterPosList
			} = getCfg:getCfgPStack(cfg_darkness, Floor),

			%% 统计死了多少怪
			MonsterIDList2 = [MonsterID || {MonsterID, _, _} <- MonsterIDList],
			MonsterIDList3 = MonsterIDList2 -- DeadList,

			%% 复活已经死去的怪
			case activityCommon:getAllocList(MonsterIDList3, MonsterPosList) of
				[] ->
					skip;
				ML ->
					ML2 =
						case Map#darknessMap.isBossDead of
							true ->
								ML;
							_ ->
								%% BOSS还没死
								{X, Y} = getRandObjFromList(BOSSPosList),
								[{BossID, 1, X, Y} | ML]
						end,

					%% 特殊BOSS是否死亡
					ML3 =
						case acDarknessState:getSpecialBossInfo() of
							#darknessSpecialBoss{bossID = BID, mapID = BMapID, entrance = BEntrance,
								floor = BFloor, x = BX, y = BY, freshTime = FTime} = Info
								when BID > 0 andalso NowTime >= FTime ->
								%% 特殊BOSS还没死，且就在这个地图
								case MapID =:= BMapID andalso Map#darknessMap.entrance =:= BEntrance andalso Floor =:= BFloor of
									true ->
										acDarknessState:setSpecialBossInfo(Info#darknessSpecialBoss{isJoinMap = true}),
										[{BID, 1, BX, BY} | ML2];
									_ ->
										ML2
								end;
							_ ->
								ML2
						end,

					?LOG_OUT("darkness createmapack:~p,~p,~p,~p", [MapID, Floor, ML3, NMap]),
					psMgr:sendMsg2PS(MapPID, addMonsterToMap, {0, ML3})
			end;
		_ ->
			skip
	end,

	%% 尝试让玩家进入黑暗之地
	erlang:send_after(5000, self(), tryEnterDarknessMapTick),
	ok.

%% 给正在排队的玩家一个系统提示
noticeQueuePlayer() ->
	#activityCfg{mapidlist = MapIDList} = getCfg:getCfgPStack(cfg_activity, ?ActivityType_Darkness),
	L = lists:seq(1, erlang:length(MapIDList)),
	[noticeQueuePlayer(Floor) || Floor <- L],
	ok.
noticeQueuePlayer(Floor) ->
	case acDarknessState:getDarknessApplyList() of
		[] ->
			skip;
		L ->
			case lists:filter(fun(#darknessApply{floor = F}) -> F =:= Floor end, L) of
				[] ->
					skip;
				L1 ->
					L2 = lists:keysort(#darknessApply.index, L1),
					F =
						fun(#darknessApply{netPid = NetPid}, Index) ->
							sendErrorCode(NetPid, ?ErrorCode_Darkness_Quenen_Sort_MC, [Floor, Index]),
							Index + 1
						end,
					lists:foldl(F, 1, L2)
			end
	end,
	ok.

useDarknessItemTransfer({RoleID, _RolePID, _RoleNetPID, MapPID, NowFloor, TargetFloor} = Data) ->
	%% 判断当前层的BOSS是死死亡
	L = acDarknessState:getDarknessApplyList(),
	case NowFloor > 0 of
		true ->
			case lists:keyfind(RoleID, #darknessApply.roleID, L) of
				#darknessApply{floor = TargetFloor} ->
					?ErrorCode_Darkness_Not_UseItem_SameFloor;
				_ ->
					ML = acDarknessState:getDarknessMapList(),
					case lists:keyfind(MapPID, #darknessMap.mapPID, ML) of
						#darknessMap{} ->
							useDarknessItemTransfer2(Data);
						Error ->
							?ERROR_OUT("useDarknessItemTransfer:~p,~p", [Data, Error]),
							?ErrorCode_System_Error_Unknow
					end
			end;
		_ ->
			case lists:keyfind(RoleID, #darknessApply.roleID, L) of
				#darknessApply{floor = TargetFloor} ->
					?ErrorCode_Darkness_Not_UseItem_SameFloor;
				_ ->
					useDarknessItemTransfer2(Data)
			end
	end.
useDarknessItemTransfer2({RoleID, RolePID, RoleNetPID, _MapPID, _NowFloor, TargetFloor}) ->
	%% 降层，不判断BOSS死亡，直接把排名列表加入指定层
	useDarknessItemTransfer3(RoleID, RolePID, RoleNetPID, TargetFloor),
	true;
useDarknessItemTransfer2(_Data) ->
	?ErrorCode_System_Error_Unknow.
useDarknessItemTransfer3(RoleID, RolePID, RoleNetPID, TargetFloor) ->
	L = acDarknessState:getDarknessApplyList(),
	case lists:keyfind(RoleID, #darknessApply.roleID, L) of
		#darknessApply{entrance = E} = Apply ->
			NL = lists:keystore(RoleID, #darknessApply.roleID, L, Apply#darknessApply{floor = TargetFloor}),
			acDarknessState:setDarknessApplyList(NL),
			noticeClientQuenenState(RoleNetPID, E, TargetFloor),
			noticePlayerFloor(RoleID);
		_ ->
			requestEnterDarkness(RolePID, {RoleID, RoleNetPID, misc:rand(1, ?DarknessEntranceNumber), TargetFloor})
	end.

%% 玩家进入黑暗之地
updatePlayerDarkness(PlayerPID, {RoleID, NetPID, MapID, MapPID, Pebble}) ->
	delRoleFromApply(RoleID),

	%% 更新
	NewPlayer =
		case acDarknessState:getDarknessPlayerObject(RoleID) of
			#darknessPlayer{} = Player ->
				%% 有才更新
				Player#darknessPlayer{roleID = RoleID, pebble = Pebble, netPid = NetPID, pid = PlayerPID, mapID = MapID, mapPID = MapPID};
			_ ->
				#darknessPlayer{roleID = RoleID, pebble = Pebble, netPid = NetPID, pid = PlayerPID, mapID = MapID, mapPID = MapPID}
		end,
	acDarknessState:putDarknessPlayerObject(NewPlayer),

	%% 告诉玩家刷新阵营
	Camp =
		case acDarknessActivity:isInActivity() of
			true ->
				case edb:dirtyReadRecord(rec_darkness_ac_rank, RoleID) of
					[#rec_darkness_ac_rank{camp = C}] -> C;
					_ -> 0
				end;
			_ -> 0
		end,
	psMgr:sendMsg2PS(PlayerPID, syncPlayerCampPubProp, Camp),
	ok;
%% 玩家离开黑暗之地
updatePlayerDarkness(PlayerPID, {RoleID, NetPID, _MapID, _MapPID}) ->
	delRoleFromApply(RoleID),

	case acDarknessState:getDarknessPlayerObject(RoleID) of
		#darknessPlayer{} = Player ->
			%% 有才更新
			NewPlayer = Player#darknessPlayer{netPid = NetPID, pid = PlayerPID, mapID = 0, mapPID = undefined},
			acDarknessState:putDarknessPlayerObject(NewPlayer);
		_ ->
			skip
	end,
	ok;
%% 删除角色
updatePlayerDarkness(_PlayerPID, {0, RoleID}) when erlang:is_integer(RoleID) ->
	%% 从报名表中删除
	delRoleFromApply(RoleID),

	%% 从进程字典中删除
	acDarknessState:delDarknessPlayerDict(RoleID),

	%% 从积分表中删除
	case edb:dirtyReadRecord(rec_darkness_ac_rank, RoleID) of
		[#rec_darkness_ac_rank{} = Obj] ->
			edb:deleteRecord(rec_darkness_ac_rank, RoleID),
			edb:writeRecord(update_rec_darkness_ac_rank, Obj#rec_darkness_ac_rank{camp = 0}),
			ok;
		_ ->
			skip
	end,
	ok;
%% 玩家下线
updatePlayerDarkness(_PlayerPID, RoleID) when erlang:is_integer(RoleID) ->
	delRoleFromApply(RoleID),

	case acDarknessState:getDarknessPlayerObject(RoleID) of
		#darknessPlayer{} = Player ->
			%% 有才更新
			NewPlayer = Player#darknessPlayer{netPid = undefined, pid = undefined, mapID = 0, mapPID = undefined},
			acDarknessState:putDarknessPlayerObject(NewPlayer);
		_ ->
			skip
	end,
	ok.

%% 同步对方的水晶信息给我
-spec syncClientToMe({RoleID::uint64(), NetPid::pid(), TargetRoleID::uint64(), TargetCode::uint()}) -> ok.
syncClientToMe({RoleID, NetPid, TargetRoleID, TargetCode}) ->
	case acDarknessState:getDarknessPlayerObject(TargetRoleID) of
		#darknessPlayer{pebble = Peb} ->
			R = #pk_MoneyChanges{
				code = TargetCode,
				moneys = [#pk_MoneyInit{moneyType = ?CoinTypePebble, value = Peb}]
			},
			gsSendMsg:sendNetMsg(NetPid, #pk_GS2U_MoneyChanges{changes = [R]}),
			ok;
		_ ->
			?ERROR_OUT("syncClientToMe ~p -> ~p", [TargetRoleID, RoleID])
	end,
	ok.

%% 同步周围给我
syncRoundToMe({PlayerCode, RoleID, NetPID, MapPID, PlayerEts}) ->
	[#recMapObject{x = X, y = Y, groupID = GroupID}] = ets:lookup(PlayerEts, PlayerCode),
	NearPlayerList = mapView:getMutualObject(MapPID, PlayerEts, ?ObjTypePlayer, {X, Y}, GroupID),
	Fun =
		fun(#recMapObject{id = ID, code = Code}, AccList) ->
			case acDarknessState:getDarknessPlayerObject(ID) of
				#darknessPlayer{pebble = Peb} ->
					R = #pk_MoneyChanges{
						code = Code,
						moneys = [#pk_MoneyInit{moneyType = ?CoinTypePebble, value = Peb}]
					},
					[R | AccList];
				_ ->
					?ERROR_OUT("syncRoundToMe ~p -> ~p", [ID, RoleID]),
					AccList
			end
		end,
	L = lists:foldl(Fun, [], NearPlayerList),
	gsSendMsg:sendNetMsg(NetPID, #pk_GS2U_MoneyChanges{changes = L}),
	ok.

%% 上线就在黑暗之地中
tryToOnlineEnterMap_darkness(Param) -> tryToOnlineEnterMap2(Param).
tryToOnlineEnterMap2({_RoleID, NowMapID}) ->
	ML = acDarknessState:getDarknessMapList(),
	case lists:filter(fun(#darknessMap{mapID = MapID, mapPID = Pid}) -> MapID =:= NowMapID andalso erlang:is_pid(Pid) end, ML) of
		[#darknessMap{mapPID = MapPID}] ->
			%% 只有一个地图，直接进入地图
			MapPID;
		[#darknessMap{}|_] = List ->
			%% 有多个地图，取一个人数最多，且没达到上限的地图
			NeedNumber = getNeedNumber(),
			F1 =
				fun(#darknessMap{mapPID = MPID} = Map, Acc) ->
					HaveNumber = getHaveNumber(Map),
					case HaveNumber < NeedNumber of
						true ->
							[{MPID, HaveNumber} | Acc];
						_ ->
							Acc
					end
				end,
			case lists:foldl(F1, [], List) of
				[] -> false;
				L ->
					[{MapPID, _}|_] = lists:reverse(lists:keysort(2, L)),
					MapPID
			end;
		_ ->
			false
	end.

requestEnterDarkness_prepare(PlayerPID, {RoleID, NetPID, TargetMapID}) ->
	%% 判断是否是阵营活动，如果是，则让玩家选择阵营
	CanIn = canEnterMap(RoleID),
	case CanIn of
		true ->
			%% 可以进入准备间
			psMgr:sendMsg2PS(PlayerPID, requestEnterDarkness_prepareAck, TargetMapID),
			ok;
		_ ->

			sendErrorCode(NetPID, ?ErrorCode_Darkness_SelectCamp, [])
	end,
	ok.

requestEnterDarkness(PlayerPID, Data) ->
	{RoleID, NetPid} =
		case Data of
			{RID, NetPID, _Entrance, _Floor} -> {RID, NetPID};
			{RID, NetPID, _NowMapID, _NowMapPID, _TargetMapID} -> {RID, NetPID}
		end,

	%% 判断是否是阵营活动，如果是，则让玩家选择阵营
	CanIn = canEnterMap(RoleID),

	case CanIn of
		true ->
			Result = requestEnterDarkness2(PlayerPID, Data),
			Msg1 =
				case Result of
					{ErrorCode, Param} -> playerMsg:getErrorCodeMsg(ErrorCode, Param);
					_ -> playerMsg:getErrorCodeMsg(Result, [])
				end,
			gsSendMsg:sendNetMsg(NetPid, Msg1),

			%% 尝试直接进入
			tryEnterDarknessMap(),

			%% 提示当前是第几位
			noticePlayerFloor(RoleID),

			%% 尝试创建活动地图
			tryCreateDarknessMap(RoleID),
			ok;
		_ ->
			sendErrorCode(NetPid, ?ErrorCode_Darkness_SelectCamp, [])
	end,
	ok.

%% 进入某入口的第几层
requestEnterDarkness2(PlayerPID, {RoleID, NetPID, Entrance, NextFloor}) ->
	L = acDarknessState:getDarknessApplyList(),
	case lists:keyfind(RoleID, #darknessApply.roleID, L) of
		#darknessApply{} = Apply ->
			NL = lists:keystore(RoleID, #darknessApply.roleID, L, Apply#darknessApply{entrance = Entrance, floor = NextFloor, netPid = NetPID}),
			acDarknessState:setDarknessApplyList(NL),
			noticeClientQuenenState(NetPID, Entrance, NextFloor),
			?ErrorCode_Darkness_WaitAllocInQuenen;
		_ ->
			R = #darknessApply{
				roleID = RoleID,
				netPid = NetPID,
				pid = PlayerPID,
				index = acDarknessState:getApplyNumber(),
				entrance = Entrance,
				floor = NextFloor
			},
			acDarknessState:setDarknessApplyList([R | L]),
			noticeClientQuenenState(NetPID, Entrance, NextFloor),

			%% 判断下一层人数是否已满，如果已满，提示不一样
			LM = acDarknessState:getDarknessMapList(),
			case lists:filter(fun(#darknessMap{floor = Flo}) -> Flo =:= NextFloor end, LM) of
				[#darknessMap{}|_] = LM2 ->
					F =
						fun(#darknessMap{} = Map, Count) ->
							getHaveNumber(Map) + Count
						end,
					AllCount = lists:foldl(F, 0, LM2),
					NeedNumber = getNeedNumber(),
					case AllCount >= NeedNumber * erlang:length(LM2) of
						false -> {?ErrorCode_Darkness_JoinSuccess, [NextFloor]};
						true -> ?ErrorCode_Darkness_NextPlayerMore_Wait
					end;
				_ ->
					?ERROR_OUT("requestEnterDarkness2,RoleID=~p, Entrance=~p, NextFloor=~p, LM=~p, ~p, ~p",
						[RoleID, Entrance, NextFloor, LM, R, L]),
					?ErrorCode_System_Error_Unknow
			end
	end;
%% 从当前地图进入目标地图
requestEnterDarkness2(PlayerPID, {RoleID, NetPID, NowMapID, NowMapPID, TargetMapID}) ->
	#activityCfg{mapidlist = MapIDList} = getCfg:getCfgPStack(cfg_activity, ?ActivityType_Darkness),
	Pos = misc:getListPos(NowMapID, MapIDList),
	if
		Pos =:= 1 ->
			%% 这是进入下一层
			requestEnterDarkness_Next(Pos, MapIDList, TargetMapID, PlayerPID, RoleID, NetPID, NowMapPID);
		Pos > 1 ->
			%% 判断是进入前一层，还是后一层
			FronPos = Pos - 1,
			case TargetMapID =:= lists:nth(FronPos, MapIDList) of
				true ->
					%% 进入后一层
					ML = acDarknessState:getDarknessMapList(),
					case lists:keyfind(NowMapPID, #darknessMap.mapPID, ML) of
						#darknessMap{entrance = Entrance, floor = Pos} ->
							requestEnterDarkness2(PlayerPID, {RoleID, NetPID, Entrance, FronPos});
						_ ->
							?ErrorCode_System_Error_Unknow
					end;
				_ ->
					%% 进入前一层
					requestEnterDarkness_Next(Pos, MapIDList, TargetMapID, PlayerPID, RoleID, NetPID, NowMapPID)
			end;
		true ->
			%% 随机一条线让你进
			requestEnterDarkness2(PlayerPID, {RoleID, NetPID, misc:rand(1, ?DarknessEntranceNumber), 1})
	end.

%% 进入下一层
requestEnterDarkness_Next(Pos, MapIDList, TargetMapID, PlayerPID, RoleID, NetPID, NowMapPID) ->
	NextPos = Pos + 1,
	case NextPos =< erlang:length(MapIDList) of
		true ->
			case TargetMapID =:= lists:nth(NextPos, MapIDList) of
				true ->
					ML = acDarknessState:getDarknessMapList(),
					case lists:keyfind(NowMapPID, #darknessMap.mapPID, ML) of
						#darknessMap{entrance = Entrance, floor = Pos} ->
							requestEnterDarkness2(PlayerPID, {RoleID, NetPID, Entrance, NextPos});
						_ ->
							?ErrorCode_System_Error_Unknow
					end;
				_ ->
					{?ErrorCode_Darkness_TargetMapError, [NextPos]}
			end;
		_ ->
			?ErrorCode_Darkness_MaxFloor
	end.

%% 更新魔能水晶
-spec updatePlayerPebble({RoleID::uint64(), Pebble::uint()}) -> ok.
updatePlayerPebble({RoleID, Pebble}) ->
	case acDarknessState:getDarknessPlayerObject(RoleID) of
		#darknessPlayer{pebble = Peb} = Player ->
			case Peb =:= Pebble of
				true ->
					skip;
				false ->
					acDarknessState:putDarknessPlayerObject(Player#darknessPlayer{pebble = Pebble})
			end;
		_ ->
			skip
	end,
	ok.

%% 杀死目标(攻击者一定是玩家，死者1：玩家，2：BOSS，3：精英怪)
-spec objectDeadInDarkness({DeadRoleID::uint64(), AttackRoleID::uint64(), DeadDecPebble::uint(), AddPoint::uint(), DeadRoleType::uint()}) -> ok.
objectDeadInDarkness({DeadRoleID, AttackRoleID, DeadDecPebble, AddPoint, DeadRoleType} = Data)
	when erlang:is_integer(DeadDecPebble) ->
	case acDarknessState:getACIsStart() of
		true ->
			case acDarknessState:getDarknessPlayerObject(AttackRoleID) of
				#darknessPlayer{pebble = Pebble, pid = PlayerPID, netPid = NetPid, integral = Integral, killMonsterNumber = Number} = Player ->
					#globalsetupCfg{setpara = [MaxKill]} = getCfg:getCfgPStack(cfg_globalsetup, darkness_killnumber),
					{AddPebble, NewNumber} =
						case DeadRoleType of
							?DeadType_Elite ->
								{_ErrorCode, _Param, Ret1} =
									case Number < MaxKill of
										true ->
											{?ErrorCode_Darkness_KillMonsterNow, [Number + 1, MaxKill], {DeadDecPebble, Number + 1}};
										_ ->
											?DEBUG_OUT("objectDeadInDarkness roleID=~p, (~p,~p) kill elite monster max:~p",
												[AttackRoleID, Number + 1, MaxKill, Data]),
											{?ErrorCode_Darkness_KillMonsterMax, [], {0, Number + 1}}
									end,
								%% 策划说不提示
%%								sendErrorCode(NetPid, ErrorCode, Param),
								Ret1;
							_ ->
								{DeadDecPebble, Number}
						end,

					{RealAddPebble, RealAddPoint} =
						case acDarknessActivity:isInActivity() of
							true ->
								%% 还要判断这个娃是否选择阵营
								case edb:dirtyReadRecord(rec_darkness_ac_rank, AttackRoleID) of
									[#rec_darkness_ac_rank{camp = Camp}] ->
										%% 判断阵营人数加成
										Per = getRealPer(Camp),
										#globalsetupCfg{setpara = [RandValue]} = getCfg:getCfgPStack(cfg_globalsetup, darkness_monstervalue),
										Rand = misc:rand(0, RandValue),
										RealAdd = erlang:trunc(AddPoint * Per),
										Value = erlang:trunc(RealAdd + Rand),

										%% 提示
										sendErrorCode(NetPid, ?ErrorCode_Darkness_PointReward, [RealAdd, Rand]),

										%% 取队友，给队友增加积分
										psMgr:sendMsg2PS(PlayerPID, addDarknessPointToTeam, AddPoint),

										{erlang:trunc(AddPebble * Per), Value};
									_ ->
										{AddPebble, 0}
								end;
							_ ->
								{AddPebble, 0}
						end,

					%% 这里先不在活动进程增加，通知玩家增加成功了，再同步更新到活动进程
					%% 这样就会导致一个问题，AB两个玩家，A玩家刚杀死一个怪，获得黑暗硬币还未增加到身上，A被B杀死了，B要掠夺A的水晶，这时就会变少
					NewPlayer = Player#darknessPlayer{pebble = Pebble, integral = Integral + RealAddPoint, killMonsterNumber = NewNumber},
					acDarknessState:putDarknessPlayerObject(NewPlayer),

%%			?DEBUG_OUT("objectDeadInDarkness:~p,~p,~p", [Player, NewPlayer, Data]),

					case RealAddPebble > 0 of
						true ->
							psMgr:sendMsg2PS(PlayerPID, addDarknessPebble, {AttackRoleID, Pebble, RealAddPebble, DeadRoleID});
						_ ->
							skip
					end,
					ok;
				_ ->
					?ERROR_OUT("objectDeadInDarkness: attack=~p, dead=~p, deadType=~p, addvalue=~p, addpoint=~p",
						[AttackRoleID, DeadRoleID, DeadRoleType, DeadDecPebble, AddPoint])
			end;
		_ ->
			skip
	end,
	ok;
objectDeadInDarkness({AddPoint, RoleIDList}) ->
	case acDarknessState:getACIsStart() andalso acDarknessActivity:isInActivity() of
		true ->
			F =
				fun(RoleID) ->
					case acDarknessState:getDarknessPlayerObject(RoleID) of
						#darknessPlayer{netPid = NetPid, integral = Integral} = Player ->
							case edb:dirtyReadRecord(rec_darkness_ac_rank, RoleID) of
								[#rec_darkness_ac_rank{camp = Camp}] ->
									%% 判断阵营人数加成
									Per = getRealPer(Camp),
									#globalsetupCfg{setpara = [RandValue]} = getCfg:getCfgPStack(cfg_globalsetup, darkness_monstervalue),
									Rand = misc:rand(0, RandValue),
									RealAdd = erlang:trunc(AddPoint * Per),
									Value = erlang:trunc(RealAdd + Rand),

									%% 提示
									sendErrorCode(NetPid, ?ErrorCode_Darkness_PointReward, [RealAdd, Rand]),

									NewPlayer = Player#darknessPlayer{integral = Integral + Value},
									acDarknessState:putDarknessPlayerObject(NewPlayer),
									ok;
								_ ->
									skip
							end;
						_ ->
							skip
					end
				end,
			lists:foreach(F, RoleIDList);
		_ ->
			skip
	end,
	ok;
objectDeadInDarkness(Data) ->
	?ERROR_OUT("objectDeadInDarkness:~p", [Data]),
	ok.

monsterDead(MapPID, AttackRoleID, MonsterID) ->
%%	?DEBUG_OUT("~p monsterDead MapPID=~p, AttackRoleID=~p, MonsterID=~p", [?MODULE, MapPID, AttackRoleID, MonsterID]),
	L = acDarknessState:getDarknessMapList(),
	case lists:keyfind(MapPID, #darknessMap.mapPID, L) of
		#darknessMap{floor = Floor, deadMonsterIDList = DeadList} = Map when Floor > 0 ->
			case getCfg:getCfgPStack(cfg_darkness, Floor) of
				#darknessCfg{boss_id = [BossID,BossDropMoney,BossDropPoint], drop = DropMonsterList} = _Conf ->
					AddReward =
						case BossID =:= MonsterID of
							true ->
								%% BOSS死亡
								NL = lists:keystore(MapPID, #darknessMap.mapPID, L, Map#darknessMap{isBossDead = true}),
								acDarknessState:setDarknessMapList(NL),
								{BossID,BossDropMoney,BossDropPoint, ?DeadType_BOSS};
							_ ->
								case lists:keyfind(MonsterID, 1, DropMonsterList) of
									{_, DropMoney, DropPoint} ->
										%% 精英怪死亡
										NL = lists:keystore(MapPID, #darknessMap.mapPID, L, Map#darknessMap{deadMonsterIDList = [MonsterID | DeadList]}),
										acDarknessState:setDarknessMapList(NL),
										{MonsterID, DropMoney, DropPoint, ?DeadType_Elite};
									_ ->
										false
								end
						end,

					case AddReward of
						{MID, M, P, T} ->
							objectDeadInDarkness({MID, AttackRoleID, M, P, T});
						_ ->
							skip
					end;
				_ ->
					skip
			end,

			%% 判断是否是特殊BOSS
			case acDarknessState:getSpecialBossInfo() of
				#darknessSpecialBoss{bossID = MonsterID} = Info ->
					%% 特殊BOSS死亡,广播
					%% darkness_endtips,~ts已经打跑了~ts,获得奖励~ts
					PlayerName = playerNameUID:getPlayerNameByUID(AttackRoleID),
					Str = stringCfg:getString(darkness_endtips, [PlayerName,Info#darknessSpecialBoss.bossName,Info#darknessSpecialBoss.bossDrop]),
					activityCommon:sendBroadcastNotice(Str),
					
					acDarknessState:delSpecialBossInfo();
				_ ->
					skip
			end,
			ok;
		_ ->
			skip
	end,
	ok.

getNeedNumber() ->
	case getCfg:getCfgPStack(cfg_globalsetup, dark_population) of
		#globalsetupCfg{setpara = [NeedNumber]} ->
			erlang:max(NeedNumber - ?DarknessEnterNumberDec, NeedNumber);
		_ ->
			0
	end.

%% 提示当前是第几位
noticePlayerFloor(RoleID) ->
	case acDarknessState:getDarknessApplyList() of
		[] ->
			skip;
		L ->
			case lists:keyfind(RoleID, #darknessApply.roleID, L) of
				#darknessApply{floor = Floor, netPid = NetPid} = Apply ->
					L1 = lists:filter(fun(#darknessApply{floor = F}) -> F =:= Floor end, L),
					L2 = lists:keysort(#darknessApply.index, L1),
					Pos = misc:getListPos(Apply, L2),
					sendErrorCode(NetPid, ?ErrorCode_Darkness_Quenen_Sort_MC, [Floor, Pos]),
					ok;
				_ ->
					skip
			end
	end,
	ok.

delRoleFromApply([]) ->
	ok;
delRoleFromApply([#darknessApply{}|_] = List) ->
	F =
		fun(#darknessApply{netPid = NetPID, entrance = Entrance}) ->
			noticeClientQuenenState(NetPID, Entrance, 0)
		end,
	lists:foreach(F, List),
	ok;
delRoleFromApply(RoleID) when erlang:is_integer(RoleID) ->
	L = acDarknessState:getDarknessApplyList(),
	case lists:keyfind(RoleID, #darknessApply.roleID, L) of
		#darknessApply{netPid = NetPID, entrance = E} = Apply ->
			NL = lists:delete(Apply, L),
			acDarknessState:setDarknessApplyList(NL),

			%% 取消排队
			noticeClientQuenenState(NetPID, E, 0),
			ok;
		_ ->
			skip
	end,
	ok.

noticeClientQuenenState(NetPID, Entrance, Floor) ->
	Msg = #pk_GS2U_DarknessQuenenState{entrance = Entrance, floor = Floor},
	gsSendMsg:sendNetMsg(NetPID, Msg),
	ok.

getNowTime() ->
	time:getSyncTime1970FromDBS().

getHaveNumber(#darknessMap{mapPID = undefined}) ->
	0;
getHaveNumber(#darknessMap{playerEts = undefined}) ->
	0;
getHaveNumber(#darknessMap{playerEts = PlayerEts, waitEnterPlayer = WaitEnterList}) ->
	HaveNumber1 = ets:info(PlayerEts, size),
	HaveNumber2 = erlang:length(WaitEnterList),
	HaveNumber1 + HaveNumber2.

getInitMap(#darknessMap{} = Map) ->
	Map#darknessMap{
		monsterlastFreshTime = 0,
		bossNextFreshTime = 0,
		deadMonsterIDList = [],
		isBossDead = true
	}.

getRandObjFromList([_Obj|_] = List) ->
	Len = erlang:length(List),
	Rand = misc:rand(1, Len),
	lists:nth(Rand, List);
getRandObjFromList(List) ->
	?ERROR_OUT("getRandObjFromList:~p,~p", [List, misc:getStackTrace()]),
	0.

getSpecialBossDropStr(ItemDropID, EquipDropList) ->
	DropItemStr =
		case ItemDropID =/= 0 of
			true->
				case getCfg:getKey(cfg_drop,ItemDropID) of
					[_I|_] = IndexList ->
						Fun1 =
							fun(RowNum, Acc) ->
								case getCfg:getCfgPStack(cfg_drop, RowNum) of
									#dropCfg{dropId = ItemDropID, dataId = ItemID, dropType = ?Drop_Type_Goods, probability = 10000} ->
										case getCfg:getCfgPStack(cfg_item, ItemID) of
											#itemCfg{name = ItemName} ->
												case Acc of
													"" ->
														getFYName(ItemName);
													_ ->
														Acc ++ "," ++ getFYName(ItemName)
												end;
											_ ->
												Acc
										end;
									_ ->
										Acc
								end
							end,
						lists:foldl(Fun1, "", IndexList);
					_ ->
						""
				end;
			false->
				""
		end,
	case erlang:is_list(EquipDropList) andalso EquipDropList =/= [] of
		true->
			Fun2 =
				fun(EquipDropID, Acc) ->
					IDList = getCfg:getKey(cfg_equipdrop,EquipDropID),
					Fun3 =
						fun(Key, ResultCfgs) ->
							case getCfg:getCfgPStack(cfg_equipdrop, Key) of
								#equipdropCfg{dropType = 2, equipID = EquipID} ->
									[EquipID | ResultCfgs];
								_ ->
									ResultCfgs
							end
						end,
					lists:foldl(Fun3, [], IDList) ++ Acc
				end,
			EquipIDList = lists:foldl(Fun2, [], EquipDropList),

			Fun4 =
				fun(EquipID, Acc) ->
					case getCfg:getCfgPStack(cfg_equipment, EquipID) of
						#equipmentCfg{name = EquipName} ->
							case Acc of
								"" -> getFYName(EquipName);
								_ ->
									Acc ++ "," ++ getFYName(EquipName)
							end;
						_ ->
							Acc
					end
				end,
			lists:foldl(Fun4, DropItemStr, EquipIDList);
		false ->
			DropItemStr
	end.

getFYName(Name) ->
	"\d" ++ Name ++ "\v".

noticeSpecialBoss(#darknessSpecialBoss{bossID = BossID} = Info) when BossID =:= 0 ->
	Info;
noticeSpecialBoss(#darknessSpecialBoss{freshTime = FTime, noticeNumber = Number, bossName = BossName} = Info) when Number =:= 0 ->
	%% 准备
	NowTime = getNowTime(),
	case FTime - NowTime =< 600 of
		true ->
			case judgeSpecialBossFreshTimeIsIn() of
				true ->
					%% 十分钟后,~ts携带~ts将出现在黑暗之地悔过,~ts不会攻击玩家,受到伤害1点血,满血~p
					Str = stringCfg:getString(darkness_bosstips, [BossName, Info#darknessSpecialBoss.bossDrop, BossName, Info#darknessSpecialBoss.bossMaxHP]),
					activityCommon:sendBroadcastNotice(Str);
				_ ->
					?LOG_OUT("noticeSpecialBoss 111:~p", [Info]),
					skip
			end,

			Info#darknessSpecialBoss{noticeNumber = Number + 1};
		_ ->
			Info
	end;
noticeSpecialBoss(#darknessSpecialBoss{freshTime = FTime, noticeNumber = Number} = Info) when Number =:= 1 ->
	%% 正式开始
	NowTime = getNowTime(),
	case NowTime >= FTime of
		true ->
			case judgeSpecialBossFreshTimeIsIn() of
				true ->
					Str = stringCfg:getString(darkness_begintips, [Info#darknessSpecialBoss.bossName]),
					activityCommon:sendBroadcastNotice(Str);
				_ ->
					?LOG_OUT("noticeSpecialBoss 222:~p", [Info]),
					skip
			end,

			Info#darknessSpecialBoss{noticeNumber = Number + 1};
		_ ->
			Info
	end;
noticeSpecialBoss(#darknessSpecialBoss{} = Info) ->
	Info.

getRealPer(KillCamp) ->
	EDBList = edb:readAllRecord(rec_darkness_ac_rank),
	EDBList_1 = [Rec1 || Rec1 = #rec_darkness_ac_rank{camp = Camp1} <- EDBList, Camp1 =:= ?DarknessCamp_TS],
	EDBList_2 = [Rec2 || Rec2 = #rec_darkness_ac_rank{camp = Camp2} <- EDBList, Camp2 =:= ?DarknessCamp_XE],
	{WinLen, LoseLen} =
		case KillCamp of
			?DarknessCamp_TS -> {erlang:length(EDBList_1), erlang:length(EDBList_2)};
			?DarknessCamp_XE -> {erlang:length(EDBList_2), erlang:length(EDBList_1)}
		end,
	Diff = LoseLen - WinLen,
	case Diff > 0 of
		true ->
			#globalsetupCfg{setpara = JCList} = getCfg:getCfgPStack(cfg_globalsetup, darkness_buff),
			case lists:filter(fun({S, E, _}) -> Diff >= S andalso Diff < E end, JCList) of
				[{_, _, Bei}] -> Bei;
				_ -> 1
			end;
		_ -> 1
	end.

canEnterMap(RoleID) ->
	case acDarknessActivity:isInActivity() of
		true ->
			case edb:dirtyReadRecord(rec_darkness_ac_rank, RoleID) of
				[#rec_darkness_ac_rank{}] -> true;
				_ -> false
			end;
		_ -> true
	end.

kickNothingPlayer(ML) ->
	NowTime = acDarknessLogic:getNowTime(),
	%% 判断是不是整周
	{{_Year, _Month, _Day}, {Hour, _Minute, _Second}} = time:convertSec2DateTime(NowTime),
	case Hour =:= ?ResetTimeHour andalso acDarknessActivity:isInActivity() of
		true ->
			kickNoCampPlayer(ML);
		_ ->
			skip
	end,
	ok.

freshPlayerPKCamp(undefined) ->
	ok;
freshPlayerPKCamp(PlayerEts) ->
	try
		List = ets:tab2list(PlayerEts),
		F =
			fun(#recMapObject{pid = Pid}) ->
				psMgr:sendMsg2PS(Pid, syncPlayerCampPubProp, 0),
				psMgr:sendMsg2PS(Pid, playerEnterDarknessRealAck, {1, ?PlayerMutiKillStatus})
			end,
		lists:foreach(F, List)
	catch
		_:_Why ->
			skip
	end,
	ok.

sendErrorCode(NetPid, Code, Param) ->
	case erlang:is_pid(NetPid) andalso erlang:is_process_alive(NetPid) of
		true ->
			Msg = playerMsg:getErrorCodeMsg(Code, Param),
			gsSendMsg:sendNetMsg(NetPid, Msg);
		_ ->
			skip
	end.

freshMonsterAdvertisement() ->
	NowTime = getNowTime(),
	LastTime = acDarknessState:getLastAdvertisementTime(),
	case NowTime - LastTime > 60 of
		true ->
			acDarknessState:setLastAdvertisementTime(NowTime),

			Str = stringCfg:getString(darkness_bemonster),
			activityCommon:sendBroadcastNotice(Str),
			ok;
		_ ->
			skip
	end,
	ok.

judgeSpecialBossFreshTimeIsIn() ->
	NowTime = acDarknessLogic:getNowTime(),
	case acDarknessState:getSpecialBossInfo() of
		#darknessSpecialBoss{bossID = ID, freshTime = FTime} when ID > 0 andalso NowTime =< FTime ->
			#activityCfg{starttime = [{0, Hour}], lenghtime = LTime} = getCfg:getCfgPStack(cfg_activity, ?ActivityType_Darkness),
			%getDayBeginSeconds {{Year, Month, Day}, {Hour, _Minute, _Second}}
			{{_Year, _Month, _Day}, {NowHour, _Minute, _Second}} = TimeData = time:convertSec2DateTime(NowTime),
			BeginTime = case NowHour >= Hour of
							true ->
								time:getDayBeginSeconds(TimeData);
							_ ->
								TimeData2 = time:convertSec2DateTime(NowTime - 86400),
								time:getDayBeginSeconds(TimeData2)
			            end,
			%% 这里减去了五分钟的误差5*60
			EndTime = BeginTime + Hour * 3600 + LTime - 300,
			FTime =< EndTime;
		_ ->
			false
	end.