%%%-------------------------------------------------------------------
%%% @author mwh
%%% 帮会沙盘
%%%-------------------------------------------------------------------
-module(acGuildExpeditionLogic).

-include("../../activityPrivate.hrl").
-include("../activityPhaseDefine.hrl").
-include("acGuildExpeditionPrivate.hrl").

%% API
-export([
	activityChangeCallBack/1,
    createActivityMapAck/1,
	activityMapMsg/2,
    requestEnterMap/2,
    playerEnterMap/2,
    playerLeaveMap/2,
    playerGatherSucess/2,
    playerOffline/2,
    playerDelete/2,
    playerDead/1,
    requestTotalInfo/2,
    requestGlobalInfo/2,
    requestMapInfo/2,
    requestGetExpeditionEverydayReward/2,
    pointIndx2Str/1
]).

-export([
    initialize/0,
    tickLogic/0,
    tickLogic30/0,
    tickSpawn/0,
    tryEnterMap/0,
    getNowVersion/0,
    getGatherBuffList/0
]).

%%
requestTotalInfo(_Pid, {NetPid, RoleID, GuildID, RL} = _Param) ->
%%    case acGuildExpeditionState:getACIsStart() of
%%        true ->
            case acGuildExpeditionState:getMapTopCachList() of
                [] ->
                    refreshAllMapTopCacheList();
                _ ->
                    skip
            end,
%%        _ ->
%%            ok
%%    end,

    %%
    sendMapTotalInfo2User(NetPid, RoleID, GuildID, RL),
    ok.

%%
requestGlobalInfo(_Pid, {NetPid, _RoleID, _GuildID} = _Param) ->
    case acGuildExpeditionState:getACIsStart() of
        true ->
            case acGuildExpeditionState:getMapTopCachList() of
                [] ->
                    refreshAllMapTopCacheList(),
                    acGuildExpeditionState:getMapTopCachList();
                _ ->
                    skip
            end;
        _ ->
            ok
    end,

    %%
    sendMapGloalInfo2User(NetPid),
    ok.

%%
requestMapInfo(_Pid, {NetPid, MapID, RoleID, GuildID}) ->
    case acGuildExpeditionState:getACIsStart() of
        true ->
            GuildCache =
                case acGuildExpeditionState:getMapTopCachList(MapID) of
                    #topGuildCache{} = R ->
                        R;
                    _ ->
                        refreshAllMapTopCacheList(),
                        case acGuildExpeditionState:getMapTopCachList(MapID) of
                            #topGuildCache{} = R1 ->
                                R1;
                            _ ->
                                #topGuildCache{mapID = MapID}
                        end
                end,
            sendMapCache2User(NetPid, RoleID, GuildID, GuildCache),
            ok;
        _ ->
            skip
    end,
    ok.

%%
requestGetExpeditionEverydayReward(Pid, {RoleID, Level, GuildID, GuildSelfLevel, MapID} = _Param) ->
    Ret =
        case acGuildExpeditionState:getACIsStart() of
            true ->
                false;
            _ ->
                givePlayerEveryDayReward(RoleID, Level, GuildID, GuildSelfLevel, MapID)
        end,
    psMgr:sendMsg2PS(Pid, requestGetExpeditionEverydayRewardAck, {MapID, Ret}),
    ok.

%% 主活动模块进程回调
-spec activityChangeCallBack(Phase::uint()) -> ok.
activityChangeCallBack(?ActivityPhase_Close) ->
	%% 结束
    ?LOG_OUT("~p activityChangeCallBack close", [?MODULE]),


    %% 置空数据
    L = acGuildExpeditionState:getMapList(),
    F = fun(#guildExpeditionMap{key = Key, mapPID = MapPID} = Map, Acc) ->
        case erlang:is_pid(MapPID) of
            true ->
                %% 刷新玩家的PK模式
                freshPlayerPKCamp(Map#guildExpeditionMap.playerEts),

                %% 清理怪物和采集物
                psMgr:sendMsg2PS(MapPID, resetCopyMap, {}),
                ok;
            _ ->
                skip
        end,

        %% 置空数据
        NMap = getInitMap(Map),
        lists:keystore(Key, #guildExpeditionMap.key, Acc, NMap)
        end,
    NL = lists:foldl(F, L, L),
    acGuildExpeditionState:setMapList(NL),

    ok;
activityChangeCallBack(?ActivityType_GuildExpedition_1) ->
	%%
    ?LOG_OUT("~p activityChangeCallBack 1", [?MODULE]),

    %%
    prepare(),

    %% 正式开始
    acGuildExpeditionState:setACIsStart(true),

    NoticeMsg = stringCfg:getString(guildGrabbegintips),
    core:sendBroadcastNotice(NoticeMsg),
	ok;
activityChangeCallBack(?ActivityType_GuildExpedition_2) ->
    %% 结算
    ?LOG_OUT("~p activityChangeCallBack 2", [?MODULE]),
    case acGuildExpeditionState:getACIsStart() of
        true ->
            %% 设置结束
            acGuildExpeditionState:setACIsStart(false),

            doActivityClose();
        _ ->
            skip
    end;



activityChangeCallBack(Phase) ->
	?ERROR_OUT("~p ~p activityChangeCallBack:~p", [?MODULE, self(), Phase]),
	ok.

%% 活动地图的消息 | 地图进程init返回
-spec activityMapMsg(MsgType::uint(), Data::term()) -> ok.
activityMapMsg(?ACMapMsg_CreateMap, {_CreateRoleID,_MapID,MapPid,PlayerEts,MonsterEts,_CollectEts,_NpcEts} = Data) ->
    L = acGuildExpeditionState:getMapList(),
    case lists:keyfind(MapPid, #guildExpeditionMap.mapPID, L) of
        #guildExpeditionMap{} = Map ->
            NMap = Map#guildExpeditionMap{playerEts = PlayerEts, monsterEts = MonsterEts},
            NL = lists:keystore(MapPid, #guildExpeditionMap.mapPID, L, NMap),
            acGuildExpeditionState:setMapList(NL);
        _ ->
            acGuildExpeditionState:addMapEtsCache(Data)
    end,

    ok;
activityMapMsg(?ACMapMsg_DestoryMap, MapPid) ->
    L = acGuildExpeditionState:getMapList(),
    case lists:keyfind(MapPid, #guildExpeditionMap.mapPID, L) of
        #guildExpeditionMap{} = Map ->
            NMap = Map#guildExpeditionMap{mapPID = undefined, playerEts = undefined},
            NL = lists:keystore(MapPid, #guildExpeditionMap.mapPID, L, NMap),
            acGuildExpeditionState:setMapList(NL);
        _ ->
            skip
    end,
    ok;
activityMapMsg(?ACMapMsg_KillMonster, {_MapID, _MapPid, _AttackRoleID, _MonsterCode, _MonsterID}) ->
    ok;
activityMapMsg(?ACMapMsg_PlayerEnter, {RoleID, MapPID, #recMapObject{netPid = NetPID}}) ->
    ML = acGuildExpeditionState:getMapList(),
    case lists:keyfind(MapPID, #guildExpeditionMap.mapPID, ML) of
        #guildExpeditionMap{waitEnterPlayer = Wait, key = Key} = Map ->
            Wait2 = lists:keydelete(RoleID, #waitingEnterPlayer.roleID, Wait),
            ML2 = lists:keystore(Key, #guildExpeditionMap.key, ML, Map#guildExpeditionMap{waitEnterPlayer = Wait2}),
            acGuildExpeditionState:setMapList(ML2),
            case is_pid(NetPID) of
                true ->
                    sendMapGloalInfo2User(NetPID);
                _ ->
                    skip
            end,
            ok;
        _ ->
            skip
    end,
    ok;
activityMapMsg(_MsgType, _Data) ->
    ok.

%%
initMapMonster(MapPid, MapID)->
    case acGuildExpeditionState:getACIsStart() of
        true ->
            case getCfg:getCfgByKey(cfg_sixwar_monster, MapID) of
                #sixwar_monsterCfg{addmonster = MonsterList, radius = Radius} ->
                    psMgr:sendMsg2PS(MapPid, addMonsterToMap, {0, Radius,  MonsterList});
                _ ->
                    skip
            end,
            ok;
        _ ->
            skip
    end,
    ok.


%% 初始化
initialize() ->
	?LOG_OUT("~p start guild expedition", [?MODULE]),
	initialize1(),
    resetEverdayRewardList(),
	%% 开启心跳
    BannerTickTime = getBannerTickTime(),
    SpawnTick = getMonsterSpawnTick(),
	erlang:send_after(?GuildExpeditionTickTime, self(), tickLogicTime),
    erlang:send_after(BannerTickTime, self(), tickLogicTime30),
    erlang:send_after(SpawnTick, self(), tickSpwanMonster),
	ok.
%% 初始化
initialize1() ->
	#activityCfg{mapidlist = MapIDList} = getCfg:getCfgPStack(cfg_activity, ?ActivityType_GuildExpedition),
	F =
		fun(MapID, AccList) ->
			R = #guildExpeditionMap{
				mapID = MapID,
                key = MapID
			},
			[R | AccList]
		end,
	List = lists:foldl(F, [], MapIDList),
	L = acGuildExpeditionState:getMapList(),
	acGuildExpeditionState:setMapList( lists:append(List, L)),
    acGuildExpeditionState:setACIsStart(false),
	ok.

%%
prepare()->
    %% 检查版本号
    checkVersion(),

    %%    %% 再清空积分数据
    Dict = acGuildExpeditionState:getPlayerDict(),
    List = dict:to_list(Dict),
    F =
        fun({RoleID, #expeditionPlayer{} = Player}, AccDict) ->
            dict:store(RoleID, Player#expeditionPlayer{totalScore = 0, beKill = 0}, AccDict)
        end,
    NDict = lists:foldl(F, Dict, List),
    acGuildExpeditionState:setPlayerDict(NDict),

    %1.
    L = acGuildExpeditionState:getMapList(),
    F1 =
        fun(#guildExpeditionMap{ mapID = MapID} = Map, Acc) ->
            %% 置空数据
            NMap = getInitMap(Map),
            lists:keystore(MapID, #guildExpeditionMap.mapID, Acc, NMap)
        end,
    NL = lists:foldl(F1, L, L),
    acGuildExpeditionState:setMapList(NL),

    %% 2.
    NowTime = getNowTime(),
    setFinalData([]),
    acGuildExpeditionState:setMapTopCachList([]),
    acGuildExpeditionState:setACStartTime(NowTime),
    acGuildExpeditionState:setScoreRate(1),
%%    acGuildExpeditionState:setApplyList([]),
%%    acGuildExpeditionState:delApplyNumber(),
%%    acGuildExpeditionState:delMapEtsCacheList(),
%%    acGuildExpeditionState:delPlayerDict(),

    ok.


%% 心跳
-spec tickLogic() -> ok.
tickLogic() ->
    erlang:send_after(?GuildExpeditionTickTime, self(), tickLogicTime),

    %%
    checkResetEveryRewardList(),

    %% 积分倍率
    refreshScoreRate(),

    %% 取地图数据
    ML = acGuildExpeditionState:getMapList(),

    %% 先去掉超时玩家
    ML1 = enterPlayerFilter(ML, []),
    acGuildExpeditionState:setMapList(ML1),

    %% 批量回收活动地图
    ML2 = recycleMap(ML1, []),
    acGuildExpeditionState:setMapList(ML2),

    %% 批量创建活动地图
    ML3 = createMap(ML2, []),
    acGuildExpeditionState:setMapList(ML3),

    %% 分配玩家进入下一层
    ML4 = allocPlayerEnter(ML3),
    acGuildExpeditionState:setMapList(ML4),

    %% 给正在排队的玩家一个系统提示
    noticeQueuePlayer(),
    ok.

%% 30秒心跳
-spec tickLogic30() -> ok.
tickLogic30() ->
    BannerTickTime = getBannerTickTime(),
    erlang:send_after(BannerTickTime, self(), tickLogicTime30),
    case acGuildExpeditionState:getACIsStart() of
        true ->
            %% todo 1.增加旗帜加分 2.缓存每个地图的前三名帮会
            ML = acGuildExpeditionState:getMapList(),
            doLogicTick30(ML);
        _ ->
            skip
    end,
    ok.

doLogicTick30([]) ->
    skip;
doLogicTick30([#guildExpeditionMap{} = Map| MLL]) ->
    doLogicTick30(Map),
    doLogicTick30(MLL);
doLogicTick30(#guildExpeditionMap{pointOwner = PointOwner} = Map)->
    %% 占领据点得分
    FP =
        fun(#pointOwner{roleID = RoleID, guildID = GuildID, pointIndex = Index}) ->
            if
                RoleID > 0 orelse GuildID > 0 ->
                    doAddScore(RoleID, Index, GuildID, ?GuildExpedtion_Events_BannerTick, Map);
                true ->
                    skip
            end
        end,
    lists:foreach(FP, PointOwner),
    ok;
doLogicTick30(_None)->
    ok.


%%
tickSpawn() ->
    SpawnTick = getMonsterSpawnTick(),
    erlang:send_after(SpawnTick, self(), tickSpwanMonster),
    L = acGuildExpeditionState:getMapList(),

    F2 =
        fun(#guildExpeditionMap{ } = Map) ->
            refreshMapTopNList(Map),
            case acGuildExpeditionState:getACIsStart() of
                true ->
                    skip;
                _ ->
                    doSpawn(Map)
            end
        end,
    lists:foreach(F2, L),

    sycnGlobalInfo2AllMap(),
    ok.

doSpawn(#guildExpeditionMap{mapPID = undefined})->
    skip;
doSpawn(#guildExpeditionMap{monsterEts = undefined})->
    skip;
doSpawn(#guildExpeditionMap{ mapID = MapID, mapPID = MapPid, monsterEts = MonsterEts})->

    MatchSpec = ets:fun2ms(
        fun(Monster) when Monster#recMapObject.type  =:= ?ObjTypeMonster ->
            Monster#recMapObject.id
        end),
    ExistMonsterIDList =
        case is_pid(MapPid) andalso misc:is_process_alive(MapPid) of
            true ->
                myEts:selectEts(MonsterEts, MatchSpec);
            _ ->
                []
        end,

    L = lists:foldl(fun(ID, AccL) ->
                        case lists:keyfind(ID, 1, AccL) of
                            false ->
                                [{ID, 1} | AccL];
                            {_, Num} ->
                                lists:keystore(ID, 1, AccL, {ID, Num+1})
                        end
                    end, [], ExistMonsterIDList),

    case getCfg:getCfgByKey(cfg_sixwar_monster, MapID) of
        #sixwar_monsterCfg{addmonster = MonsterList, radius = Radius} ->
            LL = lists:foldl( fun({MonsterID, MonsterNum, _X, _Y} = Rec, Acc) ->
                                    case lists:keyfind(MonsterID, 1, L) of
                                        false ->
                                            [Rec | Acc];
                                        {_, ExistNum} when ExistNum < MonsterNum ->
                                            Acc;
%%                                         相同ID的怪物，被多次配置，这样做有问题。简单处理成有有就不刷
%%                                            [{MonsterID, MonsterNum-ExistNum, X, Y} | Acc];
                                        _ ->
                                            Acc
                                    end
                              end, [], MonsterList),
            case LL of
                [] ->
                    skip;
                _ ->
                    psMgr:sendMsg2PS(MapPid, addMonsterToMap, {0, Radius,  LL}),
                    ?DEBUG_OUT("~p doSpawn1,map=~p,~p, monster=~p", [?MODULE, MapID, MapPid, LL])
            end,
            ok;
        _ ->
            skip
    end,
    ok.

%%
sycnGlobalInfo2AllMap() ->
    InfoList = makeMapGlobalInfoList(),
    LeftSeconds = getActivityLeftTime(),
    Msg = #pk_GS2U_ExpeditionGlobalMapInfoList{mapInfoList = InfoList, leftSeconds = LeftSeconds},

    D = acGuildExpeditionState:getPlayerDict(),
    L = dict:to_list(D),
    F =
        fun({_, #expeditionPlayer{netPid = NetPID, mapID = MapID}}) ->
            case is_pid(NetPID) andalso MapID > 0 of
                true ->
                    playerMsg:sendNetMsg(NetPID, Msg),
%%                    ?DEBUG_OUT("send msg netpid=~p, msg=~p",[NetPID, Msg]),
                    ok;
                _ ->
                    ok
            end
        end,
    lists:foreach(F, L),
    ok.

%%
getNewVersion() ->
    NowTime = getNowTime(),
    Date = time:convertSec2DateTime(NowTime),
    NewVersion = time:getDayBeginSeconds(Date) + ?ResetTimeHour * 3600, %% 凌晨四点
    NewVersion.

getNowVersion() ->
    case memDBCache:getSundriesValue(?Sundries_ID_GuildExpedition, ?GuildExpedition_Sundries_SubID_Version) of
        Value when erlang:is_integer(Value) andalso Value > 0 -> Value;
        _ -> 0
    end.


checkVersion() ->
    Reset =
        case acGuildExpeditionState:getACIsStart() of
            true ->
                NewVersion = getNewVersion(),
                OldVersion = getNowVersion(),

                if
                    NewVersion =:= OldVersion ->
                        false;
                    NewVersion > OldVersion ->
                        NewVersion;
                    true ->
                        false
                end;
            _ ->
                false
        end,
    clearPoint(Reset),
    ok.

clearPoint(false) ->
    skip;
clearPoint(NewVersion) ->
    %% 先设置新版本号
    memDBCache:saveSundries(?Sundries_ID_GuildExpedition, ?GuildExpedition_Sundries_SubID_Version, NewVersion),

    ?LOG_OUT("~p clearPoint:~p", [?MODULE, NewVersion]),
    ok.

%% 去重进入玩家
enterPlayerFilter([], NML) ->
    NML;
enterPlayerFilter(#guildExpeditionMap{playerEts = undefined} = Map, NML) ->
    [Map | NML];
enterPlayerFilter(#guildExpeditionMap{mapPID = undefined} = Map, NML) ->
    [Map | NML];
enterPlayerFilter(#guildExpeditionMap{playerEts = PlayerEts, waitEnterPlayer = Waiting} = Map, NML) ->
    %% 先去掉超时的玩家
    NowTime = getNowTime(),
    F1 = fun(#waitingEnterPlayer{time = Time}) -> NowTime - Time < ?GuildExpeditionWaitEnterPlayerMaxTime end,
    case lists:filter(F1, Waiting) of
        [] ->
            [Map#guildExpeditionMap{waitEnterPlayer = []} | NML];
        Waiting2 ->
            %% 再去掉已经进去的玩家
            F2 = fun(#recMapObject{id = RID}, Acc) -> lists:keydelete(RID, #waitingEnterPlayer.roleID, Acc) end,
            Waiting3 = ets:foldl(F2, Waiting2, PlayerEts),
            [Map#guildExpeditionMap{waitEnterPlayer = Waiting3} | NML]
    end;
enterPlayerFilter([#guildExpeditionMap{} = Map | List], NML) ->
    NML2 = enterPlayerFilter(Map, NML),
    enterPlayerFilter(List, NML2).


%% 批量回收活动地图
recycleMap([], NML) ->
    NML;
recycleMap(#guildExpeditionMap{mapPID = undefined} = Map, NML) ->
    [Map | NML];
recycleMap(#guildExpeditionMap{mapPID = MapPID, createMapTime = CTime, playerEnterTime = ETime} = Map, NML) ->
    NowTime = getNowTime(),
    HaveNumber = getHaveNumber(Map),
    NMap =
        case CTime > 0
            andalso ETime > 0
            andalso NowTime - CTime >= ?GuildExpeditionExistMaxTime
            andalso NowTime - ETime >= ?GuildExpeditionPlayerEnterMaxTime
            andalso HaveNumber =< 0 of
            true ->
                ?WARN_OUT("recycleMap:~p", [Map]),
                psMgr:sendMsg2PS(MapPID, resetCopyMap, {}),

                %% 直接置空
                Map#guildExpeditionMap{mapPID = undefined, playerEts = undefined};
            _ ->
                Map
        end,
    [NMap | NML];
recycleMap([#guildExpeditionMap{} = Map | List], NML) ->
    NML2 = recycleMap(Map, NML),
    recycleMap(List, NML2).



%% 批量创建活动地图
createMap([], NML) ->
    NML;
createMap(#guildExpeditionMap{mapPID = PID} = Map, NML) when erlang:is_pid(PID) ->
    [Map | NML];
createMap(#guildExpeditionMap{mapPID = undefined, isMapCreating = true} = Map, NML) ->
    [Map | NML];
createMap(#guildExpeditionMap{mapID = MapID, mapPID = undefined, isMapCreating = false, waitEnterPlayer = Waits} = Map, NML) ->
    %% 这个地图不存在，判断是否有等待进入的玩家，如果没有，则不分配地图资源
    ApplyList = acGuildExpeditionState:getApplyList(),
    CanCreateMap =
        case lists:filter(fun(#applyPlayer{ mapID = M}) -> M =:= MapID end, ApplyList) of
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
            NMap = Map#guildExpeditionMap{isMapCreating = true, createMapTime = NowTime},
            core:sendMsgToMapMgr(MapID, createActivityMap, {MapID, 1, {NMap}}),
            [NMap | NML];
        _ ->
            [Map | NML]
    end;
createMap([#guildExpeditionMap{} = Map | List], NML) ->
    NML2 = createMap(Map, NML),
    createMap(List, NML2).


%% 尝试直接进入
tryEnterMap() ->
    ML = acGuildExpeditionState:getMapList(),
    ML2 = allocPlayerEnter(ML),
    acGuildExpeditionState:setMapList(ML2),
    ok.


tryCreateMap(RoleID) ->
    L = acGuildExpeditionState:getApplyList(),
    case lists:keyfind(RoleID, #applyPlayer.roleID, L) of
        #applyPlayer{mapID = MapID} ->
            %% 取地图数据
            ML = acGuildExpeditionState:getMapList(),
            MLL = lists:filter(fun(#guildExpeditionMap{mapID = M}) -> M =:= MapID end, ML),
            NewML = createMap(MLL, lists:subtract(ML,MLL)),
            acGuildExpeditionState:setMapList(NewML),
            ok;
        _ ->
            skip
    end,
    ok.

%% 按线路分配玩家进入
allocPlayerEnter(ML) ->
    case acGuildExpeditionState:getApplyList() of
        [] -> ML;
        LP ->
            %% 把地图线，按人多的排序，并且把高层排在前面
            ML2 = lists:filter(fun(#guildExpeditionMap{mapPID = MapPID, playerEts = PETS}) -> erlang:is_pid(MapPID) andalso PETS /= undefined end, ML),
            Fun =
                fun(#guildExpeditionMap{mapID = _MapID1} = M1, #guildExpeditionMap{mapID = _MapID2} = M2) ->
                    P1 = getHaveNumber(M1),
                    P2 = getHaveNumber(M2),
                    if
                        P1 > P2 -> true;
                        true -> false
                    end
                end,
            ML3 = lists:sort(Fun, ML2),
            ML4 = lists:subtract(ML, ML3), %ML -- ML3,

            {NLP, NML} = allocPlayerEnter(LP, ML3, []),
            %% 保存新的申请列表
            acGuildExpeditionState:setApplyList(NLP),
            %% 保存新的地图列表
            lists:append(ML4, NML)
    end.

%% 分配报名
allocPlayerEnter([], LM, NLM) -> {[], NLM ++ LM};
allocPlayerEnter(LP, [], NLM) -> {LP, NLM};
allocPlayerEnter(LP, #guildExpeditionMap{mapPID = undefined} = Map, NLM) ->
    {LP, [Map | NLM]};
allocPlayerEnter(LP, #guildExpeditionMap{playerEts = undefined} = Map, NLM) ->
    {LP, [Map | NLM]};
allocPlayerEnter(LP, #guildExpeditionMap{mapID = MapID, mapPID = MapPID, waitEnterPlayer = Waiting1} = Map, NLM) ->
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
    case lists:filter(fun(#applyPlayer{mapID = M}) -> MapID =:= M end, LP) of
        [] ->
            {LP, [Map | NLM]};
        LP1 ->
            LP2 = lists:keysort(#applyPlayer.index, LP1),

            %% 通知这些人进入地图
            LP3 = lists:sublist(LP2, AllowNumber),
            NowTime = getNowTime(),
            %% 加入待进列表
            F1 =
                fun(#applyPlayer{roleID = RID}, Acc) ->
                    R = #waitingEnterPlayer{roleID = RID, time = NowTime},
                    lists:keystore(RID, #waitingEnterPlayer.roleID, Acc, R)
                end,
            Waiting2 = lists:foldl(F1, Waiting1, LP3),
            NMap = Map#guildExpeditionMap{playerEnterTime = NowTime, waitEnterPlayer = Waiting2},
            ?LOG_OUT("allocPlayerEnter invite player enter:AllowNumber=~p,NMap=~p", [AllowNumber,NMap]),
            delRoleFromApply(LP3),
            [psMgr:sendMsg2PS(PID, requestEnterGuildExpeditionMap, {MapID, MapPID, Pos}) || #applyPlayer{pid = PID, tarPos = Pos} <- LP3],
            {lists:subtract(LP, LP3), [NMap | NLM]}
    end;
allocPlayerEnter(LP, [Map|List], NLM) ->
    {NLP, NLM2} = allocPlayerEnter(LP, Map, NLM),
    allocPlayerEnter(NLP, List, NLM2).

%%
delRoleFromApply([]) ->
    ok;
delRoleFromApply([#applyPlayer{}|_] = List) ->
    F =
        fun(#applyPlayer{netPid = NetPID}) ->
            noticeClientQuenenState(NetPID, 0)
        end,
    lists:foreach(F, List),
    ok;
delRoleFromApply(RoleID) when erlang:is_integer(RoleID) ->
    L = acGuildExpeditionState:getApplyList(),
    case lists:keyfind(RoleID, #applyPlayer.roleID, L) of
        #applyPlayer{netPid = NetPID} = Apply ->
            NL = lists:delete(Apply, L),
            acGuildExpeditionState:setApplyList(NL),

            %% 取消排队
            noticeClientQuenenState(NetPID, 0),
            ok;
        _ ->
            skip
    end,
    ok.

%% 地图管理进程创建地图进程成功后返回
createActivityMapAck({MapID, [MapPID], {#guildExpeditionMap{key = Key}} = Data}) ->
    ?LOG_OUT("createActivityMapAck ~p,started=~p, mpid:~p,mid=~p,msg=~p",
        [?MODULE, acGuildExpeditionState:getACIsStart(), MapPID,MapID, Data]),


    L = acGuildExpeditionState:getMapList(),
    Map = #guildExpeditionMap{mapPID = undefined} = lists:keyfind(Key, #guildExpeditionMap.key, L),
    NMap =
        case acGuildExpeditionState:getMapEtsCache(MapPID) of
            {_, PE, ME, _CE, _NE} ->
                acGuildExpeditionState:delMapEtsCache(MapPID),
                Map#guildExpeditionMap{playerEts = PE, monsterEts = ME};
            _ ->
                Map
        end,

    initMapMonster(MapPID, MapID),
    refreshOccguildPlayerNpc(MapID, MapPID),

    NowTime = getNowTime(),
    NL = lists:keystore(Key, #guildExpeditionMap.key, L,
        NMap#guildExpeditionMap{mapPID = MapPID, isMapCreating = false, createMapTime = NowTime}),
    acGuildExpeditionState:setMapList(NL),

    %% 尝试让玩家进入
    erlang:send_after(5000, self(), tryEnterMapTick),
    ok.

%%
refreshOccguildPlayerNpc()->
    ML = acGuildExpeditionState:getMapList(),
    lists:foreach(
        fun(#guildExpeditionMap{mapID = MapID, mapPID = MapPID}) ->
            if
                MapID > 0 andalso is_pid(MapPID) ->
                    refreshOccguildPlayerNpc(MapID, MapPID);
                true ->
                    skip
            end
        end, ML),
    ok.

refreshOccguildPlayerNpc(MapID, MapPID) ->
    L = getFinalData(MapID),
    L1 = [ RoleID || #finalPlayer{roleID = RoleID} <- L],
    psMgr:sendMsg2PS(MapPID, createExpeditionOccGuildStatue, {L1}),
    ok.

%%
noticeClientQuenenState(NetPID, MapID) ->
    Msg = #pk_GS2U_ExpeditionQuenenState{mapid = MapID},
    gsSendMsg:sendNetMsg(NetPID, Msg),
    ok.

%%
noticeQueuePlayer() ->
    #activityCfg{mapidlist = MapIDList} = getCfg:getCfgPStack(cfg_activity, ?ActivityType_GuildExpedition),
    [noticeQueuePlayer(MapID) || MapID <- MapIDList],
    ok.
noticeQueuePlayer(MapID) ->
    case acGuildExpeditionState:getApplyList() of
        [] ->
            skip;
        L ->
            case lists:filter(fun(#applyPlayer{mapID = M}) -> M =:= MapID end, L) of
                [] ->
                    skip;
                L1 ->
                    L2 = lists:keysort(#applyPlayer.index, L1),
                    F =
                        fun(#applyPlayer{netPid = NetPid}, Position) ->
                            sendErrorCode(NetPid, ?ErrorCode_GuilExpedition_Quenen_Sort_MC, [getMapName(MapID), Position]),
                            Position + 1
                        end,
                    lists:foldl(F, 1, L2)
            end
    end,
    ok.


%% 提示当前是第几位
noticePlayerPosition(RoleID) ->
    case acGuildExpeditionState:getApplyList() of
        [] ->
            skip;
        L ->
            case lists:keyfind(RoleID, #applyPlayer.roleID, L) of
                #applyPlayer{mapID = MapID, netPid = NetPid} = Apply ->
                    L1 = lists:filter(fun(#applyPlayer{mapID = M}) -> M =:= MapID end, L),
                    L2 = lists:keysort(#applyPlayer.index, L1),
                    Position = misc:getListPos(Apply, L2),
                    sendErrorCode(NetPid, ?ErrorCode_GuilExpedition_Quenen_Sort_MC, [getMapName(MapID), Position]),
                    ok;
                _ ->
                    skip
            end
    end,
    ok.

%%
freshPlayerPKCamp(undefined) ->
    ok;
freshPlayerPKCamp(PlayerEts) ->
    try
        List = ets:tab2list(PlayerEts),
        F =
            fun(#recMapObject{pid = Pid}) ->
                psMgr:sendMsg2PS(Pid, syncPlayerCampPubProp, 0),
                psMgr:sendMsg2PS(Pid, playerEnterGuildExpeditionRealAck, {1, ?PlayerMutiKillStatus})
            end,
        lists:foreach(F, List)
    catch
        _:_Why ->
            skip
    end,
    ok.

%% 积分倍率
refreshScoreRate() ->
    case acGuildExpeditionState:getACIsStart() of
        true ->
            NowTime = getNowTime(),
            AcStartTime = acGuildExpeditionState:getACStartTime(),
            DiffSecond = NowTime - AcStartTime,
            RateList = getScoreRatList(),
            OldRate = acGuildExpeditionState:getScoreRate(),

            NewScoreRate = lists:foldl(
                fun({Minutes, CurRate}, Acc) ->
                    case DiffSecond >= Minutes * 60 of
                        true ->
                            CurRate;
                        _ ->
                            Acc
                    end
                end, 1, RateList),

            case NewScoreRate /= OldRate of
                true ->
                    sendRate2AllOnlinePlayer(NewScoreRate),
                    acGuildExpeditionState:setScoreRate(NewScoreRate),
                    ?LOG_OUT("~p refreshScoreRate, acstartTime=~p, DiffSecond=~p, newrate=~p",
                        [?MODULE, AcStartTime, DiffSecond, NewScoreRate]);
                _ ->
                    skip
            end,
            ok;
        _ ->
            skip
    end,
    ok.

sendRate2AllOnlinePlayer(Rate) ->
    D = acGuildExpeditionState:getPlayerDict(),
    L = dict:to_list(D),
    PL = [float(Rate)],
    F =
        fun({_, #expeditionPlayer{netPid = NetPID, mapID = MapID}}) ->
            case is_pid(NetPID) andalso MapID > 0 of
                true ->
                    sendErrorCode(NetPID, ?ErrorCode_GuilExpedition_Score_Rate, PL);
                _ ->
                    ok
            end
        end,
    lists:foreach(F, L).

%%
requestEnterMap(PlayerPID, Data) ->
    {RoleID, NetPid} =
        case Data of
            {RID, NetPID, _Entrance, _Floor} -> {RID, NetPID};
            {RID, NetPID, _NowMapID, _NowMapPID, _TargetMapID, _WayPoint} -> {RID, NetPID}
        end,

    %% 判断是否是阵营活动，如果是，则让玩家选择阵营
    CanIn = canEnterMap(RoleID),

    case CanIn of
        true ->
            Result = requestEnterMap2(PlayerPID, Data),
            Msg1 =
                case Result of
                    {ErrorCode, Param} ->
                        playerMsg:getErrorCodeMsg(ErrorCode, Param);
                    _ ->
                        playerMsg:getErrorCodeMsg(Result, [])
                end,
            gsSendMsg:sendNetMsg(NetPid, Msg1),

            %% 尝试直接进入
            tryEnterMap(),

            %% 提示当前是第几位
            noticePlayerPosition(RoleID),

            %% 尝试创建活动地图
            tryCreateMap(RoleID),
            ok;
        _ ->
            skip
    end,
    ok.

canEnterMap(_RoleID) ->
    true.

%% 进入
requestEnterMap2(PlayerPID, {RoleID, NetPID,MapID}) ->
    requestEnterMap2(PlayerPID, {RoleID, NetPID,MapID, ""});
requestEnterMap2(PlayerPID, {RoleID, NetPID,MapID, WayPoint}) ->
    L = acGuildExpeditionState:getApplyList(),
    case lists:keyfind(RoleID, #applyPlayer.roleID, L) of
        #applyPlayer{} = Apply ->
            NL = lists:keystore(RoleID, #applyPlayer.roleID, L, Apply#applyPlayer{mapID = MapID, netPid = NetPID}),
            acGuildExpeditionState:setApplyList(NL),
            noticeClientQuenenState(NetPID, MapID),
            {?ErrorCode_GuilExpedition_WaitAllocInQuenen, []};
        _ ->
            R = #applyPlayer{
                roleID = RoleID,
                netPid = NetPID,
                pid = PlayerPID,
                tarPos = getMapWayPointPos(MapID, WayPoint),
                index = acGuildExpeditionState:getApplyNumber(),
                mapID =MapID
            },
            acGuildExpeditionState:setApplyList([R | L]),
            noticeClientQuenenState(NetPID, MapID),

            %% 判断下一层人数是否已满，如果已满，提示不一样
            LM = acGuildExpeditionState:getMapList(),
            case lists:filter(fun(#guildExpeditionMap{mapID = M}) -> M =:= MapID end, LM) of
                [#guildExpeditionMap{}|_] = LM2 ->
                    F =
                        fun(#guildExpeditionMap{} = Map, Count) ->
                            getHaveNumber(Map) + Count
                        end,
                    AllCount = lists:foldl(F, 0, LM2),
                    NeedNumber = getNeedNumber(),
                    case AllCount >= NeedNumber * erlang:length(LM2) of
                        false -> {?ErrorCode_GuilExpedition_JoinSuccess, [getMapName(MapID)]};
                        true -> {?ErrorCode_GuilExpedition_NextPlayerMore_Wait, [getMapName(MapID)]}
                    end;
                _ ->
                    ?ERROR_OUT("requestEnterMap2,RoleID=~p, mapID=~p, LM=~p, ~p, ~p",
                        [RoleID, MapID, LM, R, L]),
                    ?ErrorCode_System_Error_Unknow
            end
    end;
%% 从当前地图进入目标地图
requestEnterMap2(PlayerPID, {RoleID, NetPID, _NowMapID, _NowMapPID, TargetMapID,WayPoint}) ->
    #activityCfg{mapidlist = MapIDList} = getCfg:getCfgPStack(cfg_activity, ?ActivityType_GuildExpedition),

    case lists:member(TargetMapID, MapIDList) of
        true ->
            requestEnterMap2(PlayerPID, {RoleID, NetPID, TargetMapID, WayPoint});
        _ ->
            ?ErrorCode_System_Error_Unknow
    end.


%% 玩家进入
playerEnterMap(PlayerPID, {RoleID, NetPID, MapID, MapPID,GuildID}) ->
    ?DEBUG_OUT("~p playerEnterMap,roleid=~p, mapid=~p,guild=~p",[?MODULE, RoleID, MapID,GuildID]),
    delRoleFromApply(RoleID),

    %% 更新
    NewPlayer =
        case acGuildExpeditionState:getPlayerObject(RoleID) of
            #expeditionPlayer{} = Player ->
                %% 有才更新
                Player#expeditionPlayer{roleID = RoleID, guildID = GuildID, netPid = NetPID, pid = PlayerPID, mapID = MapID, mapPID = MapPID};
            _ ->
                #expeditionPlayer{roleID = RoleID, guildID = GuildID, netPid = NetPID, pid = PlayerPID, mapID = MapID, mapPID = MapPID}
        end,
    acGuildExpeditionState:putPlayerObject(NewPlayer),
    ok.


%% 玩家离开
playerLeaveMap(PlayerPID, {RoleID, NetPID, MapID, _MapPID}) ->
    delRoleFromApply(RoleID),
    ?DEBUG_OUT("~p playerLeaveMap,roleid=~p, mapid=~p",[?MODULE, RoleID, MapID]),
    case acGuildExpeditionState:getPlayerObject(RoleID) of
        #expeditionPlayer{} = Player ->
            %% 有才更新
            NewPlayer = Player#expeditionPlayer{netPid = NetPID, pid = PlayerPID, mapID = 0, mapPID = undefined},
            acGuildExpeditionState:putPlayerObject(NewPlayer);
        _ ->
            skip
    end,
    ok.

%% 玩家下线
playerOffline(_PlayerPID, RoleID)->
    delRoleFromApply(RoleID),

    case acGuildExpeditionState:getPlayerObject(RoleID) of
        #expeditionPlayer{} = Player ->
            %% 有才更新
            NewPlayer = Player#expeditionPlayer{netPid = undefined, pid = undefined, mapID = 0, mapPID = undefined},
            acGuildExpeditionState:putPlayerObject(NewPlayer);
        _ ->
            skip
    end,
    ok.

%% 删除角色
playerDelete(_PlayerPID,RoleID) ->
    %% 从报名表中删除
    delRoleFromApply(RoleID),

    %% 从进程字典中删除
    acGuildExpeditionState:delPlayerDict(RoleID),
    ok.

%%
playerDead({MapPID, DeadRoleID, AttackRoleID, HateRoleList} = _Data) ->
    case acGuildExpeditionState:getACIsStart() of
        true ->
            BeKilledNumber = addBeKilled(DeadRoleID),
            case canAddScore(AttackRoleID, DeadRoleID, BeKilledNumber) of
                {true, _} ->
                    L = acGuildExpeditionState:getMapList(),
                    case lists:keyfind(MapPID, #guildExpeditionMap.mapPID, L) of
                        #guildExpeditionMap{ } = Map ->
                            %% 自己和帮会
                            doAddScore(AttackRoleID, DeadRoleID, 0, ?GuildExpedtion_Events_KillPlayer, Map),
                            %% 助攻
                            F =
                                fun(AssistRoleID) ->
                                    doAddScore(AssistRoleID, DeadRoleID, 0, ?GuildExpedtion_Events_Assist, Map)
                                end,

                            lists:foreach(F, HateRoleList),
                            ok;
                        _ ->
                            skip
                    end;
                {false, Error} ->
                    ?LOG_OUT("can't add score,dead=~p,attacker=~p, y=~p",[DeadRoleID, AttackRoleID, Error])
            end;
        _ ->
            skip
    end,
    ok.

addBeKilled(DeadRoleID) ->
    case acGuildExpeditionState:getPlayerObject(DeadRoleID) of
        #expeditionPlayer{beKill = BeKilled} = PL ->
            BeKilledNumber = BeKilled + 1,
            acGuildExpeditionState:putPlayerObject(PL#expeditionPlayer{ beKill = BeKilledNumber}),
            BeKilledNumber;
        _ ->
            887799
    end.

%%
canAddScore(AttackRoleID, DeadRoleID,BeKilledNumber) ->
    MaxBeKilledNum = getMaxKilledNumber(),
    if
        AttackRoleID =:= DeadRoleID ->
            {false, {AttackRoleID, DeadRoleID}};
        BeKilledNumber <  MaxBeKilledNum ->
            {true, 0};
        true ->
            {false, BeKilledNumber}
    end.
%%    case acGuildExpeditionState:getPlayerObject(RoleID) of
%%        #expeditionPlayer{beKill = BeKilled} ->
%%            {BeKilled < ?GuildExpedition_BeKilled_Limit, -1};
%%        _ ->
%%            {false, -999}
%%    end.

%%

getMaxKilledNumber() ->
    case getCfg:getCfgByKey(cfg_globalsetup, sixwar_maxkillnum) of
        #globalsetupCfg{setpara = [Num]} ->
            Num;
        _ ->
            ?GuildExpedition_BeKilled_Limit
    end.

pointIndx2Str(1)->
    stringCfg:getString(guildGrabAname);
pointIndx2Str(2)->
    stringCfg:getString(guildGrabBname);
pointIndx2Str(3)->
    stringCfg:getString(guildGrabCname);
pointIndx2Str(_U)->
    "Unknown".

makeAddScoreMsg(?GuildExpedtion_Events_BannerTick, Score, DeadRoleID)->
    {?ErrorCode_GuilExpedition_Point_Score, [pointIndx2Str(DeadRoleID), Score]};
makeAddScoreMsg(?GuildExpedtion_Events_KillPlayer, Score, DeadRoleID)->
    {?ErrorCode_GuilExpedition_Kill_Score, [playerGuildImpeach:queryRoleName(DeadRoleID), Score]};
makeAddScoreMsg(?GuildExpedtion_Events_Assist, Score, DeadRoleID)->
    {?ErrorCode_GuilExpedition_Assist_Kill_Score, [playerGuildImpeach:queryRoleName(DeadRoleID), Score]};
makeAddScoreMsg(_, _, _)->
    {0,[]}.

sendAddScoreMsg(NetPid, Events, Score, DeadRole)->
    {ErrorCode, ParmList} = makeAddScoreMsg(Events, Score, DeadRole),
    case ErrorCode /= 0 of
        true ->
            sendErrorCode(NetPid, ErrorCode, ParmList);
        _ ->
            skip
    end.

%%
doAddScore( RoleID, DeadRole, GuildID, ?GuildExpedtion_Events_BannerTick, #guildExpeditionMap{mapID = MapID, mapPID= MapPid, playerEts = PlayerEts})->

    Events = ?GuildExpedtion_Events_BannerTick,
    {SelfScore,GuildScore} = getScore(Events),
    %%
    ScoreRate = acGuildExpeditionState:getScoreRate(),

    FinalSelfScore = trunc(SelfScore * ScoreRate),
    FinalGuildScore = trunc(GuildScore * ScoreRate),

    if
        GuildID > 0 ->
            %%
            addGuildScore(GuildID,FinalGuildScore, MapID),

            %%
            case PlayerEts  of
                undefined ->
                    skip;
                _ ->
                    MS = ets:fun2ms(fun(#recMapObject{id = ObjID } = P) when P#recMapObject.guild =:= GuildID-> ObjID end),
                    PlayerList = case is_pid(MapPid) andalso misc:is_process_alive(MapPid) of
                                     true ->
                                         myEts:selectEts(PlayerEts, MS);
                                     _ ->
                                         []
                                 end,

                    lists:foreach(fun(Rid) ->
                                    addPlayerScore(Rid, DeadRole, MapID, FinalSelfScore,Events)
                                  end, PlayerList)
            end,

            ?LOG_OUT("acGuildExpedition doAddScore ok, player=~p, dead=~p, score=~p, guild=~p, score=~p,events=~p,point=~p, rate=~p",
                [RoleID,DeadRole,FinalSelfScore, GuildID, FinalGuildScore, Events, DeadRole, ScoreRate]),
            ok;
        RoleID > 0 ->
            addPlayerScore(RoleID, DeadRole, MapID, FinalSelfScore,Events);
        true ->
            skip
    end,
    ok;
doAddScore( RoleID, DeadRole, GuildID, Events, #guildExpeditionMap{mapID = MapID, playerEts = PlayerEts})->
    NewGuildID = if
                     GuildID > 0 ->
                         GuildID;
                     true ->
                         getRoleGuildID(RoleID, PlayerEts)
                 end,
    {SelfScore,GuildScore} = getScore(Events),

    %%
    ScoreRate = acGuildExpeditionState:getScoreRate(),

    FinalSelfScore = trunc(SelfScore * ScoreRate),
    FinalGuildScore = trunc(GuildScore * ScoreRate),

    addPlayerScore(RoleID, DeadRole, MapID, FinalSelfScore,Events),
    addGuildScore(NewGuildID,FinalGuildScore, MapID),

    ?LOG_OUT("acGuildExpedition doAddScore ok, player=~p, dead=~p, score=~p, guild=~p, score=~p,events=~p, rate=~p",
        [RoleID,DeadRole,FinalSelfScore, NewGuildID, FinalGuildScore, Events, ScoreRate]),
    ok;
doAddScore( RoleID, DeadRole, GuildID, Events, MapID)->
    ?ERROR_OUT("acGuildExpedition doAddScore error, player=~p, dead=~p, GuildID=~p, events=~p, mapID=~p",
        [RoleID,DeadRole,GuildID, Events, MapID]),
    ok.

%%
addPlayerScore(RoleID, DeadRole, MapID, Score, Events) when RoleID > 0 andalso Score >0 ->
    case acGuildExpeditionState:getPlayerObject(RoleID) of
        #expeditionPlayer{totalScore = OldScore, netPid = NetPid, mapID = RMapID} = Player ->
            %% 有才更新
            case RMapID =:= MapID andalso MapID > 0 of
                true ->
%%                    NewList =
%%                        case lists:keyfind(MapID, #playerScore.mapID, List) of
%%                            #playerScore{ score =  OldScore} = S ->
%%                                ?DEBUG_OUT("player score: roleid=~p, add=~p, total=~p",[RoleID, Score, OldScore + Score]),
%%                                lists:keyreplace(MapID, #playerScore.mapID, List, S#playerScore{score =  OldScore + Score});
%%                            _ ->
%%                                ?DEBUG_OUT("player score: RoleID=~p, add=~p, total=~p",[RoleID, Score, Score]),
%%                                New = #playerScore{mapID = MapID, score = Score},
%%                                [New | List]
%%
%%                        end,

                    NewTotalScore = OldScore + Score,
                    ?DEBUG_OUT("player score: roleid=~p, events=~p,add=~p, total=~p",[RoleID, Events, Score, NewTotalScore]),
                    sendAddScoreMsg(NetPid, Events, Score, DeadRole),

                    %% 通知玩家进程存储
                    CurVersion = getNowVersion(),
                    sendMsg2PlayerProc(RoleID, addGuildExpeditionScore, {MapID,Events, CurVersion, Score}),
                    %%
                    NewPlayer = Player#expeditionPlayer{totalScore = NewTotalScore},
                    acGuildExpeditionState:putPlayerObject(NewPlayer),
                    ok;
                _ ->
                    skip
            end;
        _ ->
            ?ERROR_OUT("expedition addPlayerScore error(not in dict), player=~p, mapid=~p, score=~p", [RoleID,MapID,Score])
    end;
addPlayerScore(_RoleID, _DeadRole, _MapID, _Score, _Events) ->
%%    ?ERROR_OUT("expedition addPlayerScore error, player=~p, mapid=~p, score=~p", [RoleID,MapID, Score]),
    ok.



%%
addGuildScore(GuildID, Score, MapID) when GuildID > 0 andalso Score > 0 ->
    ML = acGuildExpeditionState:getMapList(),
    case lists:keyfind(MapID, #guildExpeditionMap.key, ML) of
        #guildExpeditionMap{key = Key, guildDict = GDict} = Map->
            NewScoreInfoRec =
                case dict:find(GuildID, GDict) of
                    {ok, #guildScoreInfo{guildScore = GuildScore} = Info}->
                        ?DEBUG_OUT("guild score 1: g=~p, add=~p, total=~p",[GuildID, Score, GuildScore + Score]),
                        Info#guildScoreInfo{guildScore = GuildScore + Score};
                    _ ->
                        ?DEBUG_OUT("guild score 2: g=~p, add=~p, total=~p",[GuildID, Score, Score]),
                        #guildScoreInfo{guildID = GuildID, guildScore = Score}
                end,
            NewDict = dict:store(GuildID, NewScoreInfoRec, GDict),
            NL = lists:keystore(Key, #guildExpeditionMap.key, ML, Map#guildExpeditionMap{guildDict = NewDict}),
            acGuildExpeditionState:setMapList(NL);
        _ ->
            skip
    end,
    ok;
addGuildScore(_GuildID, _Score, _Map) ->
%%    ?ERROR_OUT("expedition addGuildScore error, GuildID=~p, score=~p, map=~p", [GuildID, Score, Map]),
    ok.


%% 采集物
playerGatherSucess(Pid, {MapID, RoleID, GuildID, GatherID} = _Param) ->
    case acGuildExpeditionState:getACIsStart() of
        true ->
            L = acGuildExpeditionState:getMapList(),
            case lists:keyfind(MapID, #guildExpeditionMap.mapID, L) of
                #guildExpeditionMap{ } = Map ->
                    GatherType = getGatherType(GatherID),
                    doGatherSuccess(Pid, RoleID, GuildID, GatherID, GatherType, Map),
                    ok;
                _ ->
                    skip
            end;
        _ ->
            ?DEBUG_OUT("guildexpedtion gather on activity closed",[]),
            skip
    end,
    ok.


doGatherSuccess(_Pid, RoleID, GuildID, GatherID, ?GuildExpedition_GatherType_Banner,
    #guildExpeditionMap{key = Key, pointOwner = PointOwnerList, mapID = MapID, mapPID = MapPID} = Map)->
    %%1.占领点
    PointIndex = getGatherPointIndex(GatherID),
    case PointIndex > 0 of
        true ->
            GuildName = getGuildName(GuildID),
            NewList =
                case lists:keyfind(PointIndex, #pointOwner.pointIndex, PointOwnerList) of
                    #pointOwner{ } = PT ->
                        lists:keystore(PointIndex, #pointOwner.pointIndex,
                            PointOwnerList, PT#pointOwner{roleID = RoleID, guildID = GuildID, guildName = GuildName});
                    _->
                        NewPt = #pointOwner{roleID = RoleID, pointIndex =PointIndex, guildID = GuildID,guildName = GuildName},
                        [NewPt | PointOwnerList]
                end,

            ?DEBUG_OUT("gather banner,role=~p, guild=~p, gname=~p, pl=~p",
                [RoleID, GuildID, GuildName, NewList]),
            %%1.
            ML = acGuildExpeditionState:getMapList(),
            NL = lists:keystore(Key, #guildExpeditionMap.key, ML, Map#guildExpeditionMap{pointOwner =  NewList}),
            acGuildExpeditionState:setMapList(NL),

            %%2.todo 旗帜改名 | 参考战天下
            psMgr:sendMsg2PS(MapPID, createExpeditionPointOwnerGuildBannerNpc, {GuildID, GuildName, GatherID, PointIndex}),
            onGatherSuccess(MapID, ?GuildExpedition_GatherType_Banner, PointIndex, RoleID, GuildID, GuildName),
            %%3.存储
%%            doAddScore(RoleID, 0, GuildID, ?GuildExpedtion_Events_BannerPlannet, Map);
            ok;
        _ ->
            skip
    end;
doGatherSuccess(Pid, RoleID, GuildID, _GatherID, ?GuildExpedition_GatherType_Buff, #guildExpeditionMap{mapID = MapID})->

    BuffID = randGetGatherBuffID(),
    case BuffID > 0  of
       true ->
           psMgr:sendMsg2PS(Pid, addGuildExpeditionBuff, {BuffID} ),
           onGatherSuccess(MapID, ?GuildExpedition_GatherType_Buff, 0, RoleID, GuildID, "");
       _ ->
           skip
    end,
    ?DEBUG_OUT("gather buff,role=~p, guild=~p, buff=~p",
        [RoleID, GuildID, BuffID]),
    ok;
doGatherSuccess(_Pid, _RoleID, _GuildID, _GatherID, _Type, _Map)->
    ok.

onGatherSuccess(MapID, ?GuildExpedition_GatherType_Banner, PointIndex, RoleID, GuildID,GuildName)->
    {Code, ParamList} =
        case GuildID > 0 of
            true ->
                {?ErrorCode_GuilExpedition_GuildPlayerOwnPoint,
                    [GuildName, playerGuildImpeach:queryRoleName(RoleID),pointIndx2Str(PointIndex)]};
            _ ->
                {?ErrorCode_GuilExpedition_PlayerOwnPoint,
                    [playerGuildImpeach:queryRoleName(RoleID),pointIndx2Str(PointIndex)]}
        end,
    broadcastToMapPlayer(MapID, Code, ParamList),
    ok;
onGatherSuccess(_MapID, ?GuildExpedition_GatherType_Buff, _Param, RoleID, _GuildID,_GuildName)->
    RoleName = playerGuildImpeach:queryRoleName(RoleID),
    NoticeMsg = stringCfg:getString(guildGrabboomgettips, [RoleName]),
    core:sendBroadcastNotice(NoticeMsg),
    ok;
onGatherSuccess(_MapID, _Type, _Param, _RoleID, _GuildID,_GuildName)->
    skip.

%%
doActivityClose() ->
    %% 0
    NoticeMsg = stringCfg:getString(guildGrabendtips),
    core:sendBroadcastNotice(NoticeMsg),

    %%1.计算占领军团,获取最高三人

    PlayerDict = acGuildExpeditionState:getPlayerDict(),
    PlayerDictList = dict:to_list(PlayerDict),

    TL = sortTop(PlayerDictList),
    setFinalData(TL),
    ?LOG_OUT("activity is over finaldata=~p", [TL]),

    %%
    sendFinalInfoMsg(PlayerDictList),

    %%2.发奖
    doFinalScoreReward(PlayerDictList),

    %%3.后续处理
    refreshOccguildPlayerNpc(),
    ok.

%% 计算占领军团,获取最高三人
sortTop(PlayerDictList) ->
    ML = acGuildExpeditionState:getMapList(),
    ?LOG_OUT("sortTop full data=~p", [ML]),

    F =
        fun(#guildExpeditionMap{} = Map, Acc)->
            MapFinal = topGuild(Map, PlayerDictList),
            [MapFinal | Acc]
        end,

    lists:foldl(F, [], ML).

topGuild(#guildExpeditionMap{mapID = MapID} = Map, PlayerList) ->
    %%1. 地图帮会排序
    SortedGL = refreshMapTopNList(Map),
    %%2. 取得占领帮会
    OccuGuild =
        case lists:sublist(SortedGL, 1, 1) of
            [ {_,M} | _] ->
                M;
            _ ->
                #guildScoreInfo{}
        end,

    %%3.占领地图的帮会，参与活动的成员列表
    %%  过滤得分0的成员
    OccuGuildID = OccuGuild#guildScoreInfo.guildID,
    PLFunc =
        fun({RoleID,#expeditionPlayer{guildID = GuildID, totalScore = TotalScore}}, AccList) ->
            case GuildID > 0 andalso GuildID =:= OccuGuildID andalso TotalScore > 0 of
                true ->
                    NewFinalPlayer = #finalPlayer{ roleID = RoleID, score = TotalScore },
                    [ NewFinalPlayer | AccList];
                _ ->
                    AccList
            end
        end,

    FPL = lists:foldl(PLFunc, [], PlayerList),

    %% 通知
    case OccuGuildID > 0 of
        true ->
            NoticeMsg = stringCfg:getString(guildGrabdescribe, [getGuildName(OccuGuildID), getMapName(MapID)]),
            core:sendBroadcastNotice(NoticeMsg);
        _ ->
            skip
    end,
    %%4. 对成员排序
    PLSF =
        fun(#finalPlayer{score = P1Score}, #finalPlayer{score = P2Score})->
            P1Score > P2Score
        end,
    PLSortedList = lists:sort(PLSF, FPL),

    %% 最终列表
    MNPList = lists:sublist(PLSortedList, 1, ?GuildExpeditio_TopN),
    #mapFinalInfo{mapID = MapID, occuGuildID = OccuGuildID, playerList = MNPList}.

%%
sendFinalInfoMsg(PlayerDictList) ->
    FinalInfoList = makeFinalInfoListMsg(),
    ?DEBUG_OUT("send final msg=~p",[FinalInfoList]),
    F =
        fun({ToRoleID, #expeditionPlayer{netPid = NetPid, mapID = MapID}}) ->
            case MapID > 0 andalso is_pid(NetPid) of
                true ->
                    Score = getSelfTotalScore(ToRoleID),
                    playerMsg:sendNetMsg(NetPid,
                        #pk_GS2U_ExpeditionFinalInfo{selfTotalScore = Score, finalInfoList = FinalInfoList });
                _ ->
                    skip
            end
        end,
    lists:foreach(F, PlayerDictList),
    ok.

makeFinalInfoListMsg()->
    L = acGuildExpeditionState:getMapTopCachList(),
    F = fun(#topGuildCache{mapID = MapID, topList = TopList})->
            TopGuildList =
                [ #pk_ExpeditionGuildBattleInfo{guildID = R#topGuildCacheInfo.guildID,
                    guildName = R#topGuildCacheInfo.guildName, guildScore = R#topGuildCacheInfo.guildScore}|| R <- TopList],
            #pk_ExpeditionFinalInfo{mapid = MapID, topGuildInfoList = TopGuildList}
        end,
    lists:map(F, L).

%% todo 发奖
doFinalScoreReward(PlayerDictList) ->
%%
    {ItemID, ItemNumber} = getScoreReward(),
    {JoinItemID, JoinItemNumber} = getScoreJoinReward(),

%%
    MinScore = getRewardSelfScoreMin(),
    ?LOG_OUT("~p doFinalScoreReward, cfg(item=~p, num=~p, jitem=~p,jnum=~p, minscore=~p)",
        [?MODULE, ItemID, ItemNumber, JoinItemID, JoinItemNumber, MinScore]),


%%
    Title = stringCfg:getString(sixWarMailTitle),


%%
    F = fun({ToRoleID, #expeditionPlayer{guildID =  GuildID}}) ->
            Score = getSelfTotalScore(ToRoleID),
            if
                Score >= MinScore ->
                    Content = stringCfg:getString(sixWarMailContentgift, [Score, MinScore]),
                    expeditionRewardSendMail(ToRoleID, Title, Content, ItemID, ItemNumber, ?ItemSourceGuildExpeditionScore),
                    ?LOG_OUT("~p finalScoreReward, role=~p, guildid=~p, Score=~p", [?MODULE, ToRoleID, GuildID, Score]);
                Score > 0 ->
                    JoinContent = stringCfg:getString(sixWarMailContentbase, [Score, MinScore]),
                    expeditionRewardSendMail(ToRoleID, Title, JoinContent, JoinItemID, JoinItemNumber, ?ItemSourceGuildExpeditionScore),
                    ?LOG_OUT("~p finalScoreReward, role=~p, guildid=~p, Score=~p", [?MODULE, ToRoleID, GuildID, Score]);
                true ->
                    skip
            end
        end,
    lists:foreach(F, PlayerDictList),
    ok.


%%
givePlayerEveryDayReward(ToRoleID, Level, GuildID, GuildSelfLevel, MapID) ->


    MaxNumber = getGuildLevelMaxNumber(GuildID, GuildSelfLevel),
    CurNumber = acGuildExpeditionState:getGuildEveryDayRewardNumber(MapID, GuildID, GuildSelfLevel),


    OccGuildID = getOccGuildID(MapID),

    L = getEveryDayRewardList(GuildSelfLevel),
    L1 = lists:filter(
        fun({Lv, _, _}) ->
            Level >= Lv
        end, L),

    L2 = lists:sort(
        fun({Lv1,_, _}, {Lv2,_,_} ) ->
            Lv1 > Lv2
        end, L1),

    LastFinishTime = getLastFinishTime(),
    JoinGuildTime =getGuildMemberJoinTime(GuildID, ToRoleID),

    {Ret,EvReward} =
        if
            CurNumber >= MaxNumber ->
                {false, {-4,-4,-4}};
            LastFinishTime < JoinGuildTime ->
                {false, {-3,-3,-3}};
            OccGuildID > 0 andalso OccGuildID =:= GuildID ->
                case L2 of
                    [] ->
                        {false,{-2,-2,-2}};
                    [{_, ItemID, ItemNumber} = Reward | _] ->
                        acGuildExpeditionState:incGuildEveryDayRewardNumber(MapID, GuildID, GuildSelfLevel),
                        Title = stringCfg:getString(sixWarMailTitle),
                        Content = stringCfg:getString(sixWarMailContenteveryday,[getMapName(MapID)]),
                        expeditionRewardSendMail(ToRoleID, Title, Content, ItemID, ItemNumber, ?ItemSourceGuildExpeditionEveryDay),
                        {true, Reward}
                end;
            true ->
                {false, {-1,-1,-1}}
        end,

    ?LOG_OUT("givePlayerEveryDayReward, player=~p,lv=~p,map=~p,guild=~p,gslv=~p,occguild=~p,curNum=~p,maxNum=~p, reward=~p",
        [ToRoleID,Level,MapID,GuildID,GuildSelfLevel,OccGuildID, CurNumber, MaxNumber, EvReward]),

    Ret.


expeditionRewardSendMail(ToRoleID, Title, Content, ItemID, ItemNumber, Reason) ->
    case playerMail:createMailGoods(ItemID, ItemNumber, true, 0, ToRoleID, Reason) of
        [#recMailItem{}|_] = MailItemList ->
            mail:sendSystemMail(ToRoleID, Title, Content, MailItemList, []);
        _ ->
            ?ERROR_OUT("~p finalScoreReward, role=~p, item=~p,num=~p, reason=~p",
                [?MODULE, ToRoleID,  ItemID, ItemNumber,Reason]),
            skip
    end,
    ok.

%%return -> {selfScore, guildScore}
getScore(?GuildExpedtion_Events_BannerTick)->
    BannerTickScore = getBannerTickScore(),
    {BannerTickScore,BannerTickScore};
getScore(?GuildExpedtion_Events_BannerPlannet)->
    {0,0};
getScore(?GuildExpedtion_Events_KillPlayer)->
    KillScore = getKillPlayerScore(),
    {KillScore,KillScore};

getScore(?GuildExpedtion_Events_Assist)->
    AssistScore = getAssistKillPlayerScore(),
    {AssistScore,AssistScore};
getScore(_Events)->
    {0,0}.

%%
getRoleGuildID(_RoleID, undefined)->
    0;
getRoleGuildID(RoleID, PlayerEts)->
    MS = ets:fun2ms(fun(#recMapObject{id = ObjID, guild = GuildID} = P) when ObjID =:= RoleID-> GuildID end),
    List = myEts:selectEts(PlayerEts, MS),
    case List of
        [] ->
            0;
        [H | _] ->
            H
    end.

%%
getFinalData() ->
    case memDBCache:getSundriesValue(?Sundries_ID_GuildExpedition, ?GuildExpedition_Sundries_SubID_FinalData) of
        Value when is_list(Value) -> Value;
        _ -> []
    end.

getFinalData(MapID) ->
    L = getFinalData(),
    case lists:keyfind(MapID, #mapFinalInfo.mapID, L) of
        #mapFinalInfo{playerList = PL} ->
            PL;
        _ ->
            []
    end.

getLastFinishTime()->
    case memDBCache:getSundriesValue(?Sundries_ID_GuildExpedition, ?GuildExpedition_Sundries_SubID_FinishTime) of
        Value when is_integer(Value) -> Value;
        _ -> 0
    end.

setFinalData(List) ->
    NowTime = getNowTime(),
    memDBCache:saveSundries(?Sundries_ID_GuildExpedition, ?GuildExpedition_Sundries_SubID_FinishTime, NowTime),
    memDBCache:saveSundries(?Sundries_ID_GuildExpedition, ?GuildExpedition_Sundries_SubID_FinalData, List),
    ok.

getOccGuildID(MapID) ->
    FinalDataList = getFinalData(),
    case lists:filter( fun(#mapFinalInfo{mapID = M}) ->  M =:= MapID end, FinalDataList ) of
        [] ->
            0;
        [#mapFinalInfo{occuGuildID = GuildID}| _] ->
            GuildID
    end.
%%
getNowTime() ->
    time:getSyncTime1970FromDBS().

%%
refreshAllMapTopCacheList() ->
    ML = acGuildExpeditionState:getMapList(),
    F = fun(#guildExpeditionMap{} = Map) -> refreshMapTopNList(Map) end,
    lists:foreach(F, ML).

refreshMapTopNList(#guildExpeditionMap{mapID = MapID, guildDict = GuildDict} = Map) ->
    %%1. 帮会排序
    GuildList = dict:to_list(GuildDict),
    FS =
        fun({_, #guildScoreInfo{guildScore = Score1}}, {_,#guildScoreInfo{ guildScore = Score2}}) ->
            if
                Score1 > Score2 ->
                    true;
                true ->
                    false
            end
        end,
    NGList = lists:sort(FS, GuildList),
    NewTopList = lists:sublist(NGList, 1, ?GuildExpeditio_TopN),
%%    ?DEBUG_OUT("refreshMapTopNList mapID=~p, toplist=~p", [MapID, NewTopList]),
    %% 进入人数
    OnlineNumber = getHaveNumber(Map),

    %% 排队人数
    ApplyList = acGuildExpeditionState:getApplyList(),
    APLL = lists:filter(fun(#applyPlayer{ mapID = M}) -> M =:= MapID end, ApplyList),
    QueueNumber = length(APLL),


    %% 设置名字
    NewTopList1 = [ #topGuildCacheInfo{
        guildID =R#guildScoreInfo.guildID,
        guildScore = R#guildScoreInfo.guildScore,
        guildName = getGuildName(R#guildScoreInfo.guildID)
    } || {_,R} <- NewTopList],


    %%ggg
    NewRec = #topGuildCache{mapID = MapID,
        onlineNumber = OnlineNumber, queueNumber = QueueNumber, topList = NewTopList1},

    %%保存
    TopNL = acGuildExpeditionState:getMapTopCachList(),
    NewTopNL =
        case lists:keyfind(MapID, #topGuildCache.mapID, TopNL) of
            #topGuildCache{} ->
                lists:keyreplace(MapID, #topGuildCache.mapID, TopNL, NewRec );
            _ ->
                [NewRec | TopNL]
        end,

    acGuildExpeditionState:setMapTopCachList(NewTopNL),
    NewTopList.

%%
sendErrorCode(NetPid, Code, Param) ->
    case erlang:is_pid(NetPid) andalso erlang:is_process_alive(NetPid) of
        true ->
            Msg = playerMsg:getErrorCodeMsg(Code, Param),
            gsSendMsg:sendNetMsg(NetPid, Msg);
        _ ->
            skip
    end.

%% 所有地图简要信息 | 大地图上看到的信息
canGiveEveryDayReward(_RoleID,0,_Oc, _M, _RL) ->
    false;
canGiveEveryDayReward(_RoleID,_GuildID,0, _M, _RL) ->
    false;
canGiveEveryDayReward(_RoleID, GuildID,OccGuildID,MapID, RL)->
    case acGuildExpeditionState:getACIsStart() of
        true ->
            false;
        _ ->
            case lists:keyfind(MapID, 1, RL) of
                {_, Val} ->
                    case Val of
                        0 ->
                            GuildID =:= OccGuildID;
                        _ ->
                            false
                    end;
                _ ->
                    false
            end
    end.

makeMapTotalInfoList(RoleID, GuildID, RL) ->
    ML = acGuildExpeditionState:getMapList(),
    LastFinishTime = getLastFinishTime(),
    JoinGuildTime = getGuildMemberJoinTime(GuildID, RoleID),
    IsTimeOk = LastFinishTime > JoinGuildTime,

    Fe =
        fun(#guildExpeditionMap{mapID =  MapID}) ->
            OccGuildID = getOccGuildID(MapID),
            GuildName = getGuildName(OccGuildID),
            {Online, QueueNumber}=
                case acGuildExpeditionState:getMapTopCachList(MapID) of
                    #topGuildCache{queueNumber = QN, onlineNumber = OL}->
                        {OL, QN};
                    _ ->
                        {0,0}
                end,

            IsGet =case IsTimeOk of
                       true ->
                           canGiveEveryDayReward(RoleID, GuildID,OccGuildID, MapID, RL);
                       _ ->
                           IsTimeOk
                   end,

            #pk_ExpeditionMapInfo{mapid = MapID, guildID = OccGuildID,
                guildName = GuildName, onlineNumber = Online, queueNumber = QueueNumber,
                isGetReward = misc:convertBool2Int(IsGet)}
        end,


    InfoList = [ Fe(R) || R <- ML],
    InfoList.

sendMapTotalInfo2User(NetPid, RoleID, GuildID, RL)->
    InfoList = makeMapTotalInfoList(RoleID, GuildID, RL),
    Msg = #pk_GS2U_ExpeditionMapInfoList{mapInfoList = InfoList},
    ?DEBUG_OUT("send totalinfo netPid=~p, msg=~p",[NetPid, Msg]),
    playerMsg:sendNetMsg(NetPid, Msg).

%% 全局信息 | 进入地图右边的信息
makeMapGlobalInfoList( ) ->
    ML = acGuildExpeditionState:getMapList(),
    F =
        fun(#guildExpeditionMap{mapID =  MapID}) ->
            {Online, QueueNumber}=
                case acGuildExpeditionState:getMapTopCachList(MapID) of
                    #topGuildCache{queueNumber = QN, onlineNumber = OL}->
                        {OL, QN};
                    _ ->
                        {0,0}
                end,
            #pk_ExpeditionGlobalMapInfo{mapid = MapID, onlineNumber = Online, queueNumber = QueueNumber}
        end,

    InfoList = [ F(R) || R <- ML],
    InfoList.

sendMapGloalInfo2User(NetPid)->
    InfoList = makeMapGlobalInfoList(),
    LeftSeconds = getActivityLeftTime(),
    Msg = #pk_GS2U_ExpeditionGlobalMapInfoList{mapInfoList = InfoList, leftSeconds = LeftSeconds},
    playerMsg:sendNetMsg(NetPid, Msg),
%%    ?DEBUG_OUT("send global info, netpid=~p, msg=~p",[NetPid, Msg]),
    ok.


%%地图详细战斗信息
sendMapCache2User(NetPid, RoleID, GuildID, #topGuildCache{mapID = MapID, topList = TopList}) ->
    L = acGuildExpeditionState:getMapList(),
    PIList =
        case lists:keyfind(MapID, #guildExpeditionMap.mapID, L) of
            #guildExpeditionMap{} = Map ->
                Map#guildExpeditionMap.pointOwner;
            _ ->
                []
        end,

    SelfGuildScore = case lists:keyfind(MapID,  #guildExpeditionMap.mapID, L) of
                    #guildExpeditionMap{ guildDict = Dict} ->
                        case dict:find(GuildID, Dict) of
                            {ok, #guildScoreInfo{guildScore = Score}} ->
                                Score;
                            _->
                                0
                        end;
                    _ ->
                        0
                end,

    SelfGuildBattleInfo = #pk_ExpeditionGuildBattleInfo{guildID = GuildID,
        guildScore = SelfGuildScore, guildName = getGuildName(GuildID)},

    %% switch
    PointInfoList = [#pk_ExpeditionPointInfo{pointIndex = R#pointOwner.pointIndex,
        guildID = R#pointOwner.guildID, guildName = R#pointOwner.guildName} || R <- PIList],

    TopLList = [#pk_ExpeditionGuildBattleInfo{guildID = TR#topGuildCacheInfo.guildID,
        guildName = TR#topGuildCacheInfo.guildName, guildScore = TR#topGuildCacheInfo.guildScore} || TR <- TopList],

    %% send
    Msg = #pk_GS2U_ExpeditionMapBattleInfoList{
        mapid = MapID,
        selfScore = getSelfTotalScore(RoleID),%getPlayerMapScore(MapID, RoleID),
        selfGuildBattleInfo =  SelfGuildBattleInfo,
        pointInfoList = PointInfoList,
        topGuildInfoList = TopLList},
    playerMsg:sendNetMsg(NetPid, Msg),
%%    ?DEBUG_OUT("send MapBattleInfo netPid=~p, msg=~p",[NetPid, Msg]),
    ok.

%% 给玩家进程发消息
sendMsg2PlayerProc(RoleID, Msg, Param) ->
    PDict = acGuildExpeditionState:getPlayerDict(),
    case dict:find(RoleID, PDict) of
        {ok, #expeditionPlayer{pid = Pid}} ->
            psMgr:sendMsg2PS(Pid, Msg, Param);
        _ ->
            skip
    end,
    ok.

%%
getNeedNumber() ->
    case getCfg:getCfgPStack(cfg_globalsetup, sixwar_mapmax) of
        #globalsetupCfg{setpara = [NeedNumber]} ->
            erlang:max(NeedNumber - ?GuildExpeditionEnterNumberDec, NeedNumber);
        _ ->
            0
    end.

%%
getInitMap(#guildExpeditionMap{} = Map) ->
    Map#guildExpeditionMap{pointOwner = [],guildDict = dict:new()}.

%%
getHaveNumber(#guildExpeditionMap{mapPID = undefined}) ->
    0;
getHaveNumber(#guildExpeditionMap{playerEts = undefined}) ->
    0;
getHaveNumber(#guildExpeditionMap{playerEts = PlayerEts, waitEnterPlayer = WaitEnterList}) ->
    HaveNumber1 = ets:info(PlayerEts, size),
    HaveNumber2 = erlang:length(WaitEnterList),
    HaveNumber1 + HaveNumber2.


%% 当前地图得分
%%getPlayerMapScore(MapID, #expeditionPlayer{scoreList =  ScoreList}) ->
%%    case lists:keyfind(MapID, #playerScore.mapID, ScoreList) of
%%        #playerScore{ score = Score } ->
%%            Score;
%%        _ ->
%%            0
%%    end;
%%
%%getPlayerMapScore(MapID, RoleID) ->
%%    PDict = acGuildExpeditionState:getPlayerDict(),
%%    case dict:find(RoleID, PDict) of
%%        {ok, #expeditionPlayer{} = Player } ->
%%            getPlayerMapScore(MapID, Player);
%%        _ ->
%%            0
%%    end.

%% 本次活动总分
getSelfTotalScore(RoleID) ->
    PDict = acGuildExpeditionState:getPlayerDict(),
    case dict:find(RoleID, PDict) of
        { ok, #expeditionPlayer{ totalScore = TotalScore} } ->
           TotalScore;
        _->
            0
    end.

%%
getGuildName( GuildID ) when GuildID > 0 ->
    case ets:lookup(rec_guild, GuildID) of
        [#rec_guild{guildName = GuildName}] ->
            GuildName;
        _ ->
            ""
    end;
getGuildName(_GuildID) ->
    "".

getGuildMemberJoinTime(GuildID, RoleID)->
    case  ets:lookup(rec_guild_member , RoleID) of
        [#rec_guild_member{guildID = GuildID, joinTime = JoinTime}] ->
            JoinTime;
        _ ->
            0
    end.
%%
getMapName(MapID) ->
    case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
        #mapsettingCfg{show_name = Name} ->
            Name;
        _ ->
            ""
    end.

%%
randGetGatherBuffID()->
    L = getGatherBuffList(),
    case L of
        [] ->
            0;
        _ ->
            lists:nth(misc:rand(1, length(L)), L)
    end.


%%
%%getBannerPlanetScore() ->
%%    case getCfg:getCfgPStack(cfg_globalsetup, sixwar_holdpoint) of
%%        #globalsetupCfg{setpara = [Score]} ->
%%            Score;
%%        _ ->
%%            ?GuildExpedition_Banner_Plannet_Guild_Score
%%
%%    end.

%%
getMonsterSpawnTick() ->
    case getCfg:getCfgPStack(cfg_globalsetup, sixwar_monster_cd) of
        #globalsetupCfg{setpara = [Time]} ->
            Time;
        _ ->
            ?GuildExpedtion_Spawn_Tick

    end.

getBannerTickScore() ->
    case getCfg:getCfgPStack(cfg_globalsetup, sixwar_holdpoint) of
        #globalsetupCfg{setpara = [Score]} ->
            Score;
        _ ->
            ?GuildExpedition_Banner_Tick_Guild_Score

    end.

%%
getBannerTickTime() ->
    case getCfg:getCfgPStack(cfg_globalsetup, sixwar_holdtime) of
        #globalsetupCfg{setpara = [Time]} ->
            Time;
        _ ->
            ?GuildExpedition_Banner_Tick

    end.

getKillPlayerScore() ->
    case getCfg:getCfgPStack(cfg_globalsetup, sixwar_killpoint) of
        #globalsetupCfg{setpara = [Score]} ->
            Score;
        _ ->
            ?GuildExpedition_Kill_Guil_Score

    end.

getScoreRatList() ->
    case getCfg:getCfgPStack(cfg_globalsetup, sixwar_ratetime) of
        #globalsetupCfg{setpara = List} ->
            List;
        _ ->
            [{0,1},{?GuildExpedition_ScoreRate_15_Second,1.5},{?GuildExpedition_ScoreRate_20_Second,2}]
    end.

getAssistKillPlayerScore() ->
    case getCfg:getCfgPStack(cfg_globalsetup, sixwar_assistspoint) of
        #globalsetupCfg{setpara = [Score]} ->
            Score;
        _ ->
            ?GuildExpedition_Kill_Assist_Guil_Score

    end.

getRewardSelfScoreMin() ->
    case getCfg:getCfgPStack(cfg_globalsetup, sixwar_reward_base) of
        #globalsetupCfg{setpara = [Score]} ->
            Score;
        _ ->
            ?GuildExpedition_Reward_Self_ScoreMin

    end.

getGatherBuffList() ->
    case getCfg:getCfgPStack(cfg_globalsetup, sixwar_buffid) of
        #globalsetupCfg{setpara = List} ->
            List;
        _ ->
            []

    end.

%%
getPointObjList() ->
    case getCfg:getCfgPStack(cfg_globalsetup, sixwar_banner) of
        #globalsetupCfg{setpara = List} ->
            List;
        _ ->
            []
    end.

getBuffObjID() ->
    case getCfg:getCfgPStack(cfg_globalsetup, sixwar_buffob) of
        #globalsetupCfg{setpara = [ObjID]} ->
            ObjID;
        _ ->
            0
    end.

%%
getScoreReward() ->
    case getCfg:getCfgPStack(cfg_globalsetup, sixwar_reward_basegift) of
        #globalsetupCfg{setpara = [{ItemID, ItemNumber}]} ->
            {ItemID, ItemNumber};
        _ ->
            {0,0}
    end.

getScoreJoinReward() ->
    case getCfg:getCfgPStack(cfg_globalsetup, sixwar_reward_item) of
        #globalsetupCfg{setpara = [{ItemID, ItemNumber}]} ->
            {ItemID, ItemNumber};
        _ ->
            {0,0}
    end.

%%
getEveryDayRewardList(?GuildMemLevel_Leader) ->
    case getCfg:getCfgPStack(cfg_globalsetup, sixwar_reward_head) of
        #globalsetupCfg{setpara = List} ->
            List;
        _ ->
            []
    end;
getEveryDayRewardList(?GuildMemLevel_ViceLeader) ->
    case getCfg:getCfgPStack(cfg_globalsetup, sixwar_reward_head) of
        #globalsetupCfg{setpara = List} ->
            List;
        _ ->
            []
    end;
getEveryDayRewardList(?GuildMemLevel_Admin) ->
    case getCfg:getCfgPStack(cfg_globalsetup, sixwar_reward_elite) of
        #globalsetupCfg{setpara = List} ->
            List;
        _ ->
            []
    end;
getEveryDayRewardList(?GuildMemLevel_Normal) ->
    case getCfg:getCfgPStack(cfg_globalsetup, sixwar_reward_crowd) of
        #globalsetupCfg{setpara = List} ->
            List;
        _ ->
            []
    end;
getEveryDayRewardList(_) ->
    [].


%%
getActivityLeftTime() ->
    case acGuildExpeditionState:getACIsStart() of
        true ->
            case getCfg:getCfgPStack(cfg_activity, ?ActivityType_GuildExpedition) of
                #activityCfg{lenghtime = CTime} ->
                    NowTime = getNowTime(),
                    StartTime = acGuildExpeditionState:getACStartTime(),
                    DiffTime = NowTime - StartTime,
                    if
                        DiffTime >= 0 andalso DiffTime < CTime ->
                            CTime - DiffTime;
                        true ->
                            0
                    end;
                _ ->
                    0
            end;
        _ ->
            0
    end.


%% 采集类型
getGatherType(GatherID)->
    gatherType(GatherID).

gatherType(0) ->
    ?GuildExpedition_GatherType_None;
gatherType(GatherID) ->
    BuffObjID = getBuffObjID(),
    if
        BuffObjID =:= GatherID ->
            ?GuildExpedition_GatherType_Buff;
        true ->
            List = getPointObjList(),
            case lists:member(GatherID, List) of
                true ->
                    ?GuildExpedition_GatherType_Banner;
                _ ->
                    ?GuildExpedition_GatherType_None
            end
    end.


%% 采集物点位
getGatherPointIndex(GatherID)->
    List = getPointObjList(),
    case lists:member(GatherID, List) of
        true ->
            misc:getListPos(GatherID, List);
        _ ->
            -1
    end.



-spec getMapWayPointPos(MapID::uint(), WayPointName::string()) -> tuple() | undefined.
getMapWayPointPos(MapID, WayPointName) ->
    case core:getMapWayPt(MapID) of
        WayPtList when erlang:is_list(WayPtList) ->
            Key = string:to_lower(WayPointName),
            Ret = lists:keyfind(Key, #recMapWayPt.name, WayPtList),
            case Ret of
                #recMapWayPt{x = InitX,y = InitY} ->
                    {InitX, InitY};
                _ ->
                    undefined
            end;
        _ ->
            undefined
    end.

-spec getGuildLevelMaxNumber(GuildID::uint(), Lvl::uint()) -> uint().
getGuildLevelMaxNumber(GuildID, Lvl) ->
    [#rec_guild{guildLevel = GuildLvl}] = ets:lookup(rec_guild, GuildID),
    #guildCfg{leader_1 = L1, leader_2 = L2} = getCfg:getCfgPStack(cfg_guild, GuildLvl),
    if
        Lvl =:= ?GuildMemLevel_Admin ->
            L2;
        Lvl =:= ?GuildMemLevel_ViceLeader ->
            L1;
        Lvl =:= ?GuildMemLevel_Leader ->
            1;
        true ->
            %% 无限个
            9999999999999999
    end.


checkResetEveryRewardList()->
    LastSetTime = acGuildExpeditionState:getEverdayRewardListSetTime(),
    Time = getNowTime(),
    {{Y, M, D}, {_H, _Min, _S}} = time:convertSec2DateTime(Time),
    RefreshTime = time:convertDateTime1970ToSec({{Y, M, D}, {?ResetTimeHour, 0, 0}}),
    case RefreshTime > LastSetTime andalso Time >= RefreshTime of
        true ->
            ?LOG_OUT("checkResetEveryRewardList reset ok"),
            acGuildExpeditionState:setEveryDayRewardList([]),
            acGuildExpeditionState:setEverdayRewardListSetTime(RefreshTime);
        _ ->
            skip
    end.

resetEverdayRewardList()->
    ?LOG_OUT("resetEverdayRewardList ok"),
    NowTime = getNowTime(),
    acGuildExpeditionState:setEveryDayRewardList([]),
    acGuildExpeditionState:setEverdayRewardListSetTime(NowTime).


broadcastToMapPlayer(MapID, ErrorCode, ParamList) ->
    L = acGuildExpeditionState:getMapList(),
    {PlayerEts, MapPid} = case lists:keyfind(MapID, #guildExpeditionMap.mapID, L) of
                    #guildExpeditionMap{playerEts = Ets,mapPID = MPid} ->
                        {Ets, MPid};
                    _ ->
                        {undefined, undefined}
                end,
    dobroadcastToMapPlayer(PlayerEts, MapPid, ErrorCode, ParamList),
    ok.

dobroadcastToMapPlayer(undefined, _, _, _) ->
    skip;
dobroadcastToMapPlayer( _, undefined, _, _) ->
    skip;
dobroadcastToMapPlayer(PlayerEts, MapPid, ErrorCode, ParamList) ->
    case is_pid(MapPid) andalso misc:is_process_alive(MapPid) of
        true ->
            MatchSpec = ets:fun2ms(fun(Object) ->  Object#recMapObject.netPid end),
            MapPlayerNetPidList = myEts:selectEts(PlayerEts, MatchSpec),

            Fun =
                fun(NetPid) ->
                    sendErrorCode(NetPid,ErrorCode, ParamList)
                end,
            lists:foreach(Fun, MapPlayerNetPidList);
        _ ->
            skip
    end.

