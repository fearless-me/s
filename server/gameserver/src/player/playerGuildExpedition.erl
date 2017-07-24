%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. 四月 2016 10:29
%%%-------------------------------------------------------------------
-module(playerGuildExpedition).
-author("mwh").

-include("playerPrivate.hrl").

-define(EveryDay_Zero, 0).
-define(EveryDay_Requested, 1).
-define(EveryDay_Finished, 2).

%% 点击请求加入CD
-define(RequestEnterCD, 6).
-define(MaxReward_EveryDay, 1).
%% API
-export([
    requestTotalInfo/0,
    requestGlobalInfo/0,
    requestMapInfo/1,
    requestFinalInfo/0,
    leaderBroadcastPos/1,
    requestGetExpeditionEverydayReward/1,
    requestGetExpeditionEverydayRewardAck/1,

    playerOnLogin/0,
    requestEnterMap/2,
    playerEnterMap/1,
    playerEnterMapReal/0,
    playerEnterMapRealAck/1,
    playerLeaveMap/1,
    playerDead/2,
    playerAddGuildExpeditionScore/1,
    onOffline/0,
    deleteRole/1,
    addGuildExpeditionGatherBuff/1,
    gatherSuccess/1,
    getRevivePt/1,
    getLeaveGuildExpeditionMap/0,
    isInExpedition/1
]).

%%-compile(export_all).

makeDailyCounterList()->
    ML = getExpeditionMapList(),
    lists:map(
        fun(MapID) ->
            {MapID,playerDaily:getDailyCounter(?DailyType_GuildExpeditionEveryDayReward, MapID)}
        end, ML).

requestTotalInfo()->
%%    case isInExpedition( ) of
%%        true ->
            RL = makeDailyCounterList(),
            core:sendMsgToActivity(
                ?ActivityType_GuildExpedition,
                requestTotalInfo, {playerState:getNetPid(),playerState:getRoleID(), playerState:getGuildID(), RL}),
%%        _ ->
%%            skip
%%    end,
    ok.
%%
requestGlobalInfo()->
    case isInExpedition( ) of
        true ->
            core:sendMsgToActivity(
                ?ActivityType_GuildExpedition,
                requestGlobalInfo, {playerState:getNetPid(),playerState:getRoleID(), playerState:getGuildID()});
        _ ->
            skip
    end,
    ok.

%%
requestMapInfo(MapID)->
    case isInExpedition( ) of
        true ->
            core:sendMsgToActivity(
                ?ActivityType_GuildExpedition,
                requestMapInfo, {playerState:getNetPid(),MapID, playerState:getRoleID(), playerState:getGuildID()});
        _ ->
            skip
    end,
    ok.

%%
leaderBroadcastPos(Type)->
    case isInExpedition( ) of
        true ->
            case playerGuild:getGuildSelfLevel() of
                ?GuildMemLevel_Leader ->
                    doBroadcast(Type);
                ?GuildMemLevel_ViceLeader ->
                    doBroadcast(Type);
                _ ->
                    skip
            end;
        _ ->
            skip
    end,
    ok.

doBroadcast(Type) ->
    case playerState:getMapPlayerEts() of
        undefined ->
            skip;
        PlayerEts ->
            %% 给RP玩家同步

            PlayerCode = playerState:getPlayerCode(),
            {X, Y} =
                case ets:lookup(PlayerEts, PlayerCode) of
                    [#recMapObject{x = X1, y = Y1}] ->
                        {X1, Y1};
                    _ ->
                        {0,0}
                end,
            Msg = #pk_GS2U_ExpeditionBroadcastPos{type = Type, x = X, y = Y,broadcasterName = playerState:getName()},
            sendMsg2MapGuildMember(PlayerEts, Msg),
            sendNotify2Self(Type)
    end,
    ok.

sendMsg2MapGuildMember(PlayerEts, Msg)->
    SelfNetPid = playerState:getNetPid(),
    GuildID = playerState:getGuildID(),
%%
    MatchSpec = ets:fun2ms(
        fun(Object) when Object#recMapObject.guild =:= GuildID ->
            Object
        end
    ),
    GuildPlayerList = myEts:selectEts(PlayerEts, MatchSpec),


    Fun =
        fun(#recMapObject{netPid = NearPid}) ->
            case SelfNetPid =/= NearPid of
                true ->
                    %% 直接向远程玩家的网络进程发送消息，不再通过远程玩家进程转发
                    mapView:sendNetMsgToNetPid(NearPid, Msg);
                _ ->
                    skip
            end
        end,
    lists:foreach(Fun, GuildPlayerList).

sendNotify2Self(0)->
    SelfNetPid = playerState:getNetPid(),
    Msg1 = playerMsg:getErrorCodeMsg(?ErrorCode_GuilExpedition_FllowMe, []),
    gsSendMsg:sendNetMsg(SelfNetPid, Msg1),
    ok;
sendNotify2Self(Type) when Type > 0 andalso Type < 4 ->
    PosStr = acGuildExpeditionLogic:pointIndx2Str(Type),
    SelfNetPid = playerState:getNetPid(),
    Msg1 = playerMsg:getErrorCodeMsg(?ErrorCode_GuilExpedition_GotoPoint, [PosStr]),
    gsSendMsg:sendNetMsg(SelfNetPid, Msg1),
    ok;
sendNotify2Self(_Type) ->
    skip.





%%
requestFinalInfo()->
    case isInExpedition( ) of
        true ->
            core:sendMsgToActivity(
                ?ActivityType_GuildExpedition,
                requestMapInfo, {playerState:getNetPid(),playerState:getMapID(), playerState:getRoleID(), playerState:getGuildID()});
        _ ->
            skip
    end,
    ok.

%%
requestGetExpeditionEverydayReward(MapID)->
%%    case isInExpedition( ) of
%%        true ->
            GetNum = playerDaily:getDailyCounter(?DailyType_GuildExpeditionEveryDayReward, MapID),
            case GetNum /=  ?EveryDay_Zero of
                true ->
                    playerMsg:sendErrorCodeMsg(?ErrorCode_GuildReward_GetRepeat);
                _ ->
                    %% to领奖
                    ?LOG_OUT("requestGetExpeditionEverydayReward, player=~p,map=~p", [playerState:getRoleID(), MapID]),
                    playerDaily:incDailyCounter(?DailyType_GuildExpeditionEveryDayReward, MapID),
                    core:sendMsgToActivity(?ActivityType_GuildExpedition,
                        requestGetExpeditionEverydayReward,
                        {playerState:getRoleID(), playerState:getLevel(), playerState:getGuildID(), playerGuild:getGuildSelfLevel(),MapID})
            end,
%%        _ ->
%%            skip
%%    end,
    ok.
requestGetExpeditionEverydayRewardAck({MapID,Ret})->
    ?LOG_OUT("requestGetExpeditionEverydayRewardAck, player=~p,map=~p, ret=~p", [playerState:getRoleID(), MapID, Ret]),
    case Ret of
        true ->
            playerMsg:sendErrorCodeMsg(?ErrorCode_GuildReward_Success),
            playerDaily:incDailyCounter(?DailyType_GuildExpeditionEveryDayReward, MapID);
        _->
            playerMsg:sendErrorCodeMsg(?ErrorCode_GuildReward_Failed),
            playerDaily:zeroDailyCount(?DailyType_GuildExpeditionEveryDayReward, MapID)
    end,
    ok.

%%
playerOnLogin() ->
    case checkVersion() of
        false ->
            NowVerion = acGuildExpeditionLogic:getNowVersion(),
            setGuildExpeditionScore(0,NowVerion);
        _ ->
            skip
    end,
    ok.

setGuildExpeditionScore(Score, Version) ->
    playerPropSync:setAny(?SerProp_GuildExpeditinScore, {Version, Score}),
    ok.

getGuildExpeditionScore() ->
    Prop = playerPropSync:getProp(?SerProp_GuildExpeditinScore),
    Prop.

%% 进入
-spec requestEnterMap(MapID::uint(), WayPoint::string()) -> ok.
requestEnterMap(TargetMapID, WayPoint) ->

%%    todo:前置条件检查
%%    todo:加个请求CD
    case isInExpedition(TargetMapID) of
        true ->
            core:sendMsgToActivity(
                ?ActivityType_GuildExpedition,
                requestEnterMap,
                {playerState:getRoleID(), playerState:getNetPid(), playerState:getMapID(), playerState:getMapPid(), TargetMapID, WayPoint});
        _ ->
            skip
    end,
    ok.


%% 玩家进入地图
-spec playerEnterMap(MapID::uint()) -> ok.
playerEnterMap(MapID) ->
    case isInExpedition(MapID) of
        true ->
            core:sendMsgToActivity(
                ?ActivityType_GuildExpedition,
                playerEnterMap,
                {playerState:getRoleID(), playerState:getNetPid(), playerState:getMapID(), playerState:getMapPid(), playerState:getGuildID()}),
            ok;
        _ ->
            skip
    end,
    ok.


%% 玩家在客户端表现进入地图
-spec playerEnterMapReal() -> ok.
playerEnterMapReal() ->
    case isInExpedition() of
        true ->
            %% 发消息同步周围的给我
            core:sendMsgToActivity(
                ?ActivityType_GuildExpedition,
                playerEnterMapReal,
                {playerState:getPlayerCode(), playerState:getRoleID(), playerState:getNetPid(), playerState:getMapPid(), playerState:getMapPlayerEts()}),
            ok;
        _ ->
            skip
    end,
    ok.

%%
playerEnterMapRealAck( {_, Camp})->

    playerState:setCamp(?CampPlayer, true),

    %% 杀戮模式
    playerPk:tranState(Camp),
    ok.


%% 玩家离开地图
-spec playerLeaveMap(MapID::uint()) -> ok.
playerLeaveMap({MapID}) ->
    case isInExpedition(MapID) of
        true ->
%%            据策划说可以配置成切地图自动消失
            removeGuildExpeditionBuff(),
            core:sendMsgToActivity(
                ?ActivityType_GuildExpedition,
                playerLeaveMap,
                {playerState:getRoleID(), playerState:getNetPid(), playerState:getMapID(), playerState:getMapPid()});
        _ ->
            skip
    end,
    ok.

%%
onOffline() ->
    core:sendMsgToActivity(?ActivityType_GuildExpedition,
        playerOffline, playerState:getRoleID()),
    ok.

%%
deleteRole(RoleID) ->
    core:sendMsgToActivity(?ActivityType_GuildExpedition, playerdeleteRole, RoleID),
    ok.



%% 玩家死亡
-spec playerDead(AttackerCode::uint(), AttackRoleID::uint64()) -> ok.
playerDead(_AttackerCode, 0) ->
    ok;
playerDead(_AttackerCode, AttackRoleID) ->
    case isInExpedition() of
        true ->
            case uidMgr:checkUID(?UID_TYPE_Role, AttackRoleID) of
                true ->
                    List = playerState:getHateList(),
                    F =
                        fun(#recHate{hateCode = HateCode}, Acc) ->
                            case codeMgr:getObjectTypeByCode(HateCode) of
                                ?ObjTypePlayer ->
                                    PlayerEts = playerState:getMapPlayerEts(),
                                    case myEts:lookUpEts(PlayerEts, HateCode) of
                                        [#recMapObject{id = ID}] ->
                                            [ID | Acc];
                                        _ ->
                                            Acc
                                    end;
                                _ ->
                                    Acc
                            end
                        end,
                    HateRoleList = lists:foldl(F, [], List),

                    %% 排除击杀者
                    core:sendMsgToActivity(?ActivityType_GuildExpedition, playerDead,
                        {playerState:getMapPid(), playerState:getRoleID(), AttackRoleID, lists:delete(AttackRoleID, HateRoleList)});
                _ ->
                    ok
            end;
        _ ->
            skip
    end,
    ok.

%%beKilled(_AttackRoleID) ->
%%    ok.
%%
%%killPlayer(_TargetCode)->
%%%%    toto 增加积分
%%%%    core:sendMsgToActivity(?ActivityType_GuildExpedition,
%%%%        ikillsomeone, {playerState:getRoleID(), playerState:getGuildID()}),
%%    ok.


%%
playerAddGuildExpeditionScore({_MapID, _Events, CurVersion, Score}) ->
    case checkVersion() of
        false ->
            setGuildExpeditionScore(Score,CurVersion);
        _ ->
            {_, OldScore} = getGuildExpeditionScore(),
            setGuildExpeditionScore( OldScore + Score, CurVersion)
    end,
    ok.

%%
addGuildExpeditionGatherBuff({BuffID}) ->
    case isInExpedition() of
        true ->
            Level = playerState:getLevel(),
            playerBuff:addBuff(BuffID, Level);
        _ ->
            skip
    end,
    ok.

%%
removeGuildExpeditionBuff()->
    BuffList = acGuildExpeditionLogic:getGatherBuffList(),
    lists:foreach( fun(BuffID) -> playerBuff:delBuff(BuffID) end, BuffList),
    ok.
%%
getExpeditionMapList() ->
    case getCfg:getCfgPStack(cfg_globalsetup, sixwar_mapid) of
        #globalsetupCfg{setpara = List} ->
            List;
        _ ->
            []
    end.
%%
isInExpedition() ->
    isInExpedition(playerState:getMapID()).

isInExpedition(MapID) when erlang:is_integer(MapID) andalso MapID > 0 ->
    ML = getExpeditionMapList(),
    lists:member(MapID, ML);
isInExpedition(_MapID) -> false.


checkVersion() ->
    NowVerion = acGuildExpeditionLogic:getNowVersion(),
    {OldVersion, _} = getGuildExpeditionScore(),
    NowVerion =:= OldVersion.


%%
gatherSuccess(GatherID) ->
    case isInExpedition() of
        true ->
            core:sendMsgToActivity(?ActivityType_GuildExpedition,
               playerGatherSuccess, {playerState:getMapID(),playerState:getRoleID(), playerState:getGuildID(), GatherID}),
            ok;
        _ ->
            skip
    end,
    ok.


%% 复活点坐标
getRevivePt(MapID)->
    L0 = getRevivePosList(),
    L1 = lists:filter( fun({ML,_}) -> lists:member(MapID, ML) end, L0),
    case L1 of
        [] ->
            {float(0),float(0)};
        [{_, PL} | _] ->
            {X,Y,_} = lists:nth(misc:rand(1, erlang:length(PL)), PL),
            {float(X), float(Y)}
    end.

%% 复活点坐标列表
getRevivePosList() ->
    case getCfg:getCfgPStack(cfg_globalsetup, sixwar_relive) of
        #globalsetupCfg{setpara = List} ->
            List;
        _ ->
            []
    end.


%%
getLeaveGuildExpeditionMap()->
    case core:getMapWayPt(20) of
        WayPtList when erlang:is_list(WayPtList) ->
            Key = string:to_lower("waypoint4") ,
            Ret = lists:keyfind(Key , #recMapWayPt.name , WayPtList) ,
            case Ret of
                #recMapWayPt{x = InitX , y = InitY} ->
                    {20, InitX , InitY};
                _ ->
                    undefined
            end;
        _ ->
            undefined
    end.
