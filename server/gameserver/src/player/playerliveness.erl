%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% liveness 以前叫活跃度，后来被策划改成了好感度；
%%% 然后过了很久，策划又增加了一个活跃度的东西，现在叫 activevalue
%%% 所以概念比较混乱，请君多多留意，反正我是想吐了
%%% @end
%%% Created : 18. 十一月 2015 下午 3:53
%%%-------------------------------------------------------------------
-module(playerliveness).
-author("Administrator").
-include("playerPrivate.hrl").
%%玩家活跃度

%% API
-export([
    onPlayerCreateInit/0,
    onPlayerOnlineInit/1,
    onPlayerDrewLivenessGift/1
]).

-export([
    onFinishLiveness/2,
    livenessFinished/3,
    livenessJoinEvent/1,
    cleanPlayerLivenessInfo/0
]).

-export([
    getDailyLivenessValue/0,
    addDailyLivenessValue/1,
    getTotalLivenessValue/0,
    addTotalLivenessValue/1,
    decTotalLivenessValue/1
]).

%活跃度改为完成就可以领奖活跃度
-define(OpenLevel,1).

%%角色创建时候，角色活跃度初始化
onPlayerCreateInit()->
    Live = #rec_player_liveness{ playerID = playerState:getRoleID(),
        livenessValue = 0,
        livenessList = [],
        livenessGiftDrew = [],
        lastUpdateTime = time:getSyncTime1970FromDBS() },
    playerState:setLiveness(Live),
    ok.

-spec onPlayerOnlineInit(List :: list()) -> ok.
onPlayerOnlineInit(List)->
    Live = case List of
        [] -> #rec_player_liveness{ playerID = playerState:getRoleID(),
                livenessValue = 0,
                livenessList = [],
                livenessGiftDrew = [],
                lastUpdateTime = time:getSyncTime1970FromDBS() };
        [H|_]->
            NowTime = time:getSyncTime1970FromDBS(),
            case core:timeIsOnDay(H#rec_player_liveness.lastUpdateTime, NowTime) of
                true ->
                    %% 不需要重置
                    H;
                _ ->
                %% 需要重置
                    #rec_player_liveness{ playerID = playerState:getRoleID(),
                        livenessValue = 0,
                        livenessList = [],
                        livenessGiftDrew = [],
                        lastUpdateTime = NowTime }
            end
    end,
    playerState:setLiveness(Live),
    ?DEBUG_OUT("liveness:onPlayerOnlineInit ~p",[Live]),
    updateToMemCache(rec_player_liveness,playerState:getRoleID(),Live,new_rec_player_liveness,update_rec_player_liveness),
    %pk_GS2U_InitDailyActiveInfo
    Msg = #pk_GS2U_InitDailyActiveInfo{ dailyActiveInfoList = Live#rec_player_liveness.livenessList,
            receivedAwardList = Live#rec_player_liveness.livenessGiftDrew },
    playerMsg:sendNetMsg(Msg),
    ok.

onPlayerDrewLivenessGift(LivenessValue) when is_integer(LivenessValue)->
    ?DEBUG_OUT("liveness onPlayerDrewLivenessGift ~p",[LivenessValue]),
    case getCfg:getCfgByKey(cfg_globalsetup,activereward) of
        #globalsetupCfg{} = AwardCfg->
            AwardInfo = getLivenessDrawAwardInfo(),
            case lists:member(LivenessValue,AwardInfo) of
                true->%已经领取过奖励
                    playerMsg:sendErrorCodeMsg(?ErrorCode_LuckyCoin_Award_Gain_Already);
                false->
                    CurLiveValue = getDailyActiveValue(),
                    case CurLiveValue >= LivenessValue of
                        true->
                            case lists:keyfind(LivenessValue,1,AwardCfg#globalsetupCfg.setpara) of
                                false->
                                    playerMsg:sendNetMsg(#pk_GS2U_ReceiveDailyActiveAwardResult{ dailyActivityValue = -2});
                                {_ ,AwardItemID}->
                                    PLog = #recPLogTSItem{
                                        old = 0,
                                        new = 1,
                                        change = 1,
                                        target = ?PLogTS_PlayerSelf,
                                        source = ?PLogTS_Liveness,
                                        gold = 0,
                                        goldtype = 0,
                                        changReason = ?ItemSourceLiveness,
                                        reasonParam = LivenessValue
                                    },
                                    playerPackage:addGoodsAndMail(AwardItemID, 1, true, 0, PLog),
                                    NewAwardList = [LivenessValue | AwardInfo],
                                    setAwardList(NewAwardList),
                                    updateToMemCache(rec_player_liveness,playerState:getRoleID(),
                                            playerState:getLiveness(),new_rec_player_liveness,update_rec_player_liveness),
                                    ?LOG_OUT("player [~p],Drew liveness gift [~p]",[playerState:getRoleID(),LivenessValue]),
                                    playerMsg:sendNetMsg(#pk_GS2U_ReceiveDailyActiveAwardResult{ dailyActivityValue = LivenessValue })
                            end;
                        false ->
                            %活跃度不够，不能领取奖励
                            playerMsg:sendErrorCodeMsg(?ErrorCode_LuckyCoin_Award_Gain_Already)
                    end
            end,
            ok;
        _ ->
            ok
    end,
    ok;
onPlayerDrewLivenessGift(_)->
    ok.

getPlayerLivenessList(LiveInfo)->
    case LiveInfo of
        #rec_player_liveness{livenessList = Liveness} -> Liveness;
        _ -> []
    end.

setPlayerLivenessList(List)->
    case playerState:getLiveness() of
        #rec_player_liveness{} = OldLive ->
            playerState:setLiveness(OldLive#rec_player_liveness{ livenessList = List});
        _ ->
            skip
    end,
    ok.
%%-----------------------------------------------------------------------------
addDailyLivenessValue(Value)->
    case playerState:getLiveness() of
        #rec_player_liveness{ livenessValue = Old} = OldLive ->
            addTotalLivenessValue(Value),
            playerSevenDays:onMissionEvent(?SevenDayMission_Event_3, Value, 0),
            playerState:setLiveness(OldLive#rec_player_liveness{ livenessValue = Old + Value});
        _ ->
            skip
    end,
    ok.

getDailyLivenessValue()->
    case playerState:getLiveness() of
        #rec_player_liveness{ livenessValue = Old} ->
            Old;
        _ -> 0
    end.

%%-----------------------------------------------------------------------------
getTotalLivenessValue()-> playerPropSync:getProp(?PriProp_Liveness) .
addTotalLivenessValue(Value)->
    Old = getTotalLivenessValue(),
    playerPropSync:setInt64(?PriProp_Liveness, Old + Value).

decTotalLivenessValue(Value) when Value > 0 ->
    case getTotalLivenessValue() of
        V when V >= Value ->
            playerPropSync:setInt64(?PriProp_Liveness, V - Value),
            true;
        _ ->
            false
    end;
decTotalLivenessValue(_)->
    false.
%%-----------------------------------------------------------------------------

-spec getLivenessDrawAwardInfo() -> list().
getLivenessDrawAwardInfo()->
    case playerState:getLiveness() of
        #rec_player_liveness{ livenessGiftDrew = GiftInfo} when is_list(GiftInfo)->
            GiftInfo;
        _ -> []
    end.

setAwardList(L)->
    case playerState:getLiveness() of
        #rec_player_liveness{} = GiftInfo->
            playerState:setLiveness(GiftInfo#rec_player_liveness{ livenessGiftDrew = L});
        _ ->ok
    end,
    ok.
%%-define(LivenessNormalCopy,1).-
%%-define(LivenessHeroCopy,2).-
%%-define(LivenessChallageCopy,3).-
%%-define(LivenessLoopTask,4).
%%-define(LivenessBraveTrain,5).-
%%-define(LivenessProtectLamb,6).-
%%-define(LivenessMint,7).-
%%-define(LivenessLeaderInvade,8).-
%%-define(LivenessArena,9). %%竞技场-
%%-define(LivenessFationCopy,10). %%阵营战场
%%-define(LivenessConvoy,11).-
%%-define(LivenessHijack,12).-
%%-define(LivenessFightAll,13).%%战天下-
%%-define(LivenessArmyCopy,14).%%军团副本-

livenessJoinEvent(MapID)->
    case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
        %%魔神地宫成就统计
        #mapsettingCfg{type = ?MapTypeCopyMap, subtype = ?MapSubTypeDemonBattle} ->
            onFinishLiveness(?LivenessProtectLamb,1);
        #mapsettingCfg{type = ?MapTypeCopyMap, subtype = ?MapSubTypeWarrior} ->
            onFinishLiveness(?LivenessBraveTrain,1);
        _ ->
            skip
    end,
    ok.
%%活跃度完成，此处是进入活动场景的时候增加活跃度
livenessFinished(Type,SubType,CompleteCondition)->
    ?DEBUG_OUT("livenessFinished [~p,~p,~p]",[Type,SubType,CompleteCondition]),
    %{Type,SubType} 在DailyActive配置表配置
    LiveID =case {Type,SubType} of
                {1,0}->?LivenessNormalCopy;
                {1,6}->?LivenessHeroCopy;
                {1,9}->?LivenessChallageCopy;
                {2,1}->?LivenessProtectLamb;%小羊
                {2,2}->?LivenessLeaderInvade;%入侵
                {2,4}->?LivenessMoneyDungeon;
                %{2,8}->?LivenessFationCopy;%阵营
                {2,13}->?LivenessBraveTrain;%试练
%%                {2,14}->?LivenessFightAll;%战天下
                {2,15}->?LivenessLoopTask;%huan
                {2,16}->?LivenessArena;%竞技场
%%                {2,17}->?LivenessConvoy;%护送
%%                {2,20}->?LivenessHijack;%劫车
                {2,29}->?LivenessSpeedUp;%港口竞速
                {2,31}->?LivenessMaterial;%港口竞速
%%                {2,101}->?LivenessArmyCopy;%军团单人
%%                {2,30}->?LivenessExpCopyMap;%%经验副本
                _ ->0
            end,
    case LiveID > 0 of
        true->
            case getCfg:getCfgPStack(cfg_dailyActive,LiveID) of
                #dailyActiveCfg{ iD = LiveID, completeCondition = Condition}->
                    case CompleteCondition =:= Condition of
                        true-> onFinishLiveness(LiveID,1);
                        _ -> skip
                    end;
                _ ->skip
            end;
        _ -> skip
    end,
    ok.
%%手动调用增加活跃度，此处用于在完成活动时或其它时候增加活跃度
onFinishLiveness(LiveID,FinishNum)->
    Level = playerState:getLevel(),
    case Level >= ?OpenLevel of
        true->
            case getCfg:getCfgPStack(cfg_dailyActive,LiveID) of
                #dailyActiveCfg{}=LiveCfg->
                    CurLivenessInfo = playerState:getLiveness(),
                    LiveList = getPlayerLivenessList(CurLivenessInfo),%pk_DailyActiveInfo
                    case lists:keyfind(LiveID,#pk_DailyActiveInfo.dailyID,LiveList) of
                        false->
                            Num = case FinishNum >= LiveCfg#dailyActiveCfg.limit of
                                      true->
                                          LiveCfg#dailyActiveCfg.limit;
                                      false->
                                          FinishNum
                                  end,
                            Data = #pk_DailyActiveInfo{ dailyID = LiveID,curTimes = Num},
                            NewList = [Data | LiveList],
                            setPlayerLivenessList(NewList),
                            addDailyLivenessValue(LiveCfg#dailyActiveCfg.activeReward),
                            addDailyActiveValue(LiveCfg#dailyActiveCfg.activeDegree),
                            Msg = #pk_GS2U_UpdateDailyActiveInfo{ dailyActiveInfo = Data },
                            playerMsg:sendNetMsg(Msg),
                            case playerState:getIsPlayer() of
                                true ->
                                    updateToMemCache(rec_player_liveness,playerState:getRoleID(),
                                        playerState:getLiveness(),new_rec_player_liveness,update_rec_player_liveness);
                                _ -> skip
                            end,
                            ok;
                        TempActive->
                            case TempActive#pk_DailyActiveInfo.curTimes >= LiveCfg#dailyActiveCfg.limit of
                                true->ok;%已经完成任务
                                false->
                                    NewTimes = TempActive#pk_DailyActiveInfo.curTimes + FinishNum,
                                    Msg = case  NewTimes >= LiveCfg#dailyActiveCfg.limit of
                                              true->
                                                  Data = #pk_DailyActiveInfo{ dailyID = LiveID,curTimes =LiveCfg#dailyActiveCfg.limit },
                                                  NewLiveList = lists:keyreplace(LiveID,#pk_DailyActiveInfo.dailyID,LiveList,Data),
                                                  setPlayerLivenessList(NewLiveList),
                                                  addDailyLivenessValue(LiveCfg#dailyActiveCfg.activeReward),
                                                  addDailyActiveValue(LiveCfg#dailyActiveCfg.activeDegree),
                                                  Data;
                                              false ->
                                                  Data = #pk_DailyActiveInfo{ dailyID = LiveID,curTimes = NewTimes },
                                                  NewLiveList = lists:keyreplace(LiveID,#pk_DailyActiveInfo.dailyID,LiveList,Data),
                                                  setPlayerLivenessList(NewLiveList),
                                                  addDailyLivenessValue(LiveCfg#dailyActiveCfg.activeReward),
                                                  addDailyActiveValue(LiveCfg#dailyActiveCfg.activeDegree),
                                                  Data

                                          end,
                                    case playerState:getIsPlayer() of
                                        true ->
                                            updateToMemCache(rec_player_liveness,playerState:getRoleID(),
                                            playerState:getLiveness(),new_rec_player_liveness,update_rec_player_liveness);
                                        _ -> skip
                                    end,
                                    playerMsg:sendNetMsg(#pk_GS2U_UpdateDailyActiveInfo{ dailyActiveInfo = Msg} )
                            end
                    end,
                    ?LOG_OUT("player [~p] finished liveness id=[~p]",[playerState:getRoleID(),LiveID]),
                    ok;
                _ ->
                    ok
            end;
        _ -> skip
    end,
    ok.

%清理在线玩家活跃信息
cleanPlayerLivenessInfo() ->
    case playerState:getIsPlayer() of
        true ->
            LivenessInfo = #rec_player_liveness{playerID = playerState:getRoleID(),
                livenessValue = 0,
                livenessList = [],
                livenessGiftDrew = [],
                lastUpdateTime = time:getSyncTime1970FromDBS()},
            playerState:setLiveness(LivenessInfo),
            updateToMemCache(rec_player_liveness, playerState:getRoleID(),
                playerState:getLiveness(), new_rec_player_liveness, update_rec_player_liveness),
            ok;
        _ -> skip
    end.


-spec updateToMemCache(TableName,Key,Record,NewTableName,UpdateTableName) -> boolean() | ok | error when
    TableName::atom(),Key::term(),Record::tuple(),NewTableName::atom(),UpdateTableName::atom().
updateToMemCache(TableName,Key,Record,NewTableName,UpdateTableName) when is_record(Record,rec_player_liveness)andalso Key > 0 ->
    F = fun() ->
        case mnesia:read(TableName,Key,write) of
            [] ->
                %%需要新插入
                mnesia:write(NewTableName,Record,write),
                %%最后写入缓存数据库
                mnesia:write(Record),
                true;
            _ ->
                case mnesia:read(NewTableName,Key,write) of
                    [_H|_T] ->
                        %%还没有插入到数据库，可以直接更新此数据
                        mnesia:write(NewTableName,Record,write);
                    [] ->
                        %%需要更新
                        mnesia:write(UpdateTableName,Record,write)
                end,
                %%最后写入缓存数据库
                mnesia:write(Record),
                %%由于缓存中已经存在，所以这里返回false表示是更新
                false
        end
        end,
    case mnesia:transaction(F) of
        {atomic, Val} ->
            Val;
        Error ->
            ?ERROR_OUT("Param:Record= [~p].Error:~p,stack=~p",[Record,Error,misc:getStackTrace()]),
            error
    end;
updateToMemCache(_TableName,_Key,_Record,_NewTableName,_UpdateTableName)->
    ?ERROR_OUT("playerlive:updateToMemCache,Param:Record= [~p],stack= ~p.",[_Record,misc:getStackTrace()]),
    ok.

addDailyActiveValue(Val)->
	OldVal = getDailyActiveValue(),
    playerDaily:incCounter(?DailyType_ActiveValue, 0, OldVal + Val).

getDailyActiveValue()->
    playerDaily:getDailyCounter(?DailyType_ActiveValue, 0).