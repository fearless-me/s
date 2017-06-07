%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. 三月 2016 16:46
%%%-------------------------------------------------------------------
-module(playerSevenDays).
-author("mwh").

-include("playerPrivate.hrl").

%% API
-export([
    queryInvestment/0, angelInvestmentBuy/1, angelInvestmentGet/1,
    querySevenMissionData/0,sevenMissionCompletion/1,onMissionEvent/3
]).

-define(CreateDays_Limit, 7).
-define(AngelInvestment_Per_Max, 7).
-define(AngelInvestment_Days_Max, 7).
%% 凌晨四点为一天的开始时间
%%-define(ResetTimeHour, 4).


%% record
-record(angelInvestment,{
    id = 0,
    itemid = 0,
    left = 0,%%还可以领几次
    perNum = 1,
    updatekey = 0 %% 第几天领取过
}).

%%: 1=装备精炼 playerEquip:equipRefine
%%: 2=骑宠远征战斗 playerPetPvE:petPveBattle
%%: 3=每日必做活跃度 playerliveness:addLivenessValue
%%: 4=竞技场战斗 playerOtp:handle_info({ladder1v1_battle_result
%%: 5=副本通关 playerCopyMapReward:onPassCopyMap_Normal
%%: 6=宝石合成 playerPackage:gemComposition
%%: 7=商城钻石消费 playerMall:mallBuy1
%%: 8=骑宠领地掠夺 playerPetPvP:petPvpBattle
%%: 9=骑宠技能洗练 playerPet:petSkillCast
%%: 10=装备冲星 playerEquip:equipStar
%%: 11=装备重铸 playerEquip:equipRecast
%%: 12=每日环任务完成 playerLoopTask:getLoopTaskReward
%%: 13=提升海神之戟 playerGodWeapon:levelupWeapon
%%: 14=军团技能学习 playerGuildSkillAndBuff:studyGuildSkill
%%: 15=勇者试炼 playerWarriorTrial:completeSchedule
%%: 16=通关军团单人副本 playerCopyMap:onPassCopyMap
-record(sevenDayMission,{
    keys = 0,
    missionID = 0,
    events = 0,%% 触发事件
    max = 0, %% 最大条件
    cur = 0,  %% 当前
    param = 0,
    isfinish = 0::integer() %% 0未完,1结束
}).

-define(MISSION_PROCESS, 0).
-define(MISSION_FINISH, 1).

%% API
getCreateDays() ->
    CreateTime = playerPropSync:getProp(?PriProp_RoleCreateTime),
    {{Y, M, D}, {_H, _Min, _S}} = time:getChinaNowDateTime1970(),
    UtcSec = time:diffSecFrom1970({{Y, M, D}, {23, 59, 59}}),
    DiffDays = (UtcSec - CreateTime) / ?One_Day_Second,
    misc:ceil(DiffDays).
%%    Days = trunc(DiffDays),
%%    case DiffDays > Days of
%%        true -> Days + 1;
%%        _ -> Days
%%    end.

%% {isAfterResetHour, nextRefreshTime}
countRefreshTime() ->
    %%计算下次刷新时间，如果玩家在线才好刷新
    Time = time:getSyncTime1970FromDBS(),
    {{Y, M, D}, {_H, _Min, _S}} = time:convertSec2DateTime(Time),
    RefreshTime = time:convertDateTime1970ToSec({{Y, M, D}, {?ResetTimeHour, 0, 0}}),
    if
        RefreshTime < Time ->
            {true, RefreshTime + ?One_Day_Second - Time};
        true ->
            {false, RefreshTime - Time + 1}
    end.

%%
queryInvestment() ->
    investmentList2Client().

%%
investmentList2Client() ->
    List = getItemList(),
    CurDays = getCreateDays(),
    {IsAfterResetHour, _} = countRefreshTime(),
    Mapf =
        fun(#angelInvestment{id = ID, left = Left, updatekey = UpdateKey} = _R) ->
            Canget = if
                         Left > 0 andalso CurDays > UpdateKey ->
                             if
                                 UpdateKey =/= 0 ->
                                     IsAfterResetHour;
                                 true ->
                                     true
                             end;
                         true ->
                             false
                     end,
            #pk_AngelInvestmentData{isCanGet = Canget,leftNumber = Left, id = ID}
        end,
    ItemList = lists:map(Mapf, List),
    playerMsg:sendNetMsg(#pk_GS2U_AngelInvestmentList{lists = ItemList}),
    ok.

%% 购买
angelInvestmentBuy(ID)->
    {Ret, Code} = canItemBuy(ID),
    if
        Ret =:= false ->
            playerMsg:sendErrorCodeMsg(Code);
        true ->
            {MoneyType, Money} = getItemCost(ID),
            decMoney(MoneyType, Money, ?AngelInvestment, ?PLogTS_SevenDays),
            addItemBuy(ID),
            playerMsg:sendErrorCodeMsg(?ErrorCode_BuyItemErrorNone),
            investmentList2Client()
    end,
    ok.


%% 获取
angelInvestmentGet(0) ->
    F =
    fun(#angelInvestment{id = ID} = _R ) ->
        angelInvestmentGetOne(ID, false)
    end,
    ItemList = getItemList(),
    lists:foreach(F, ItemList),
    investmentList2Client();
angelInvestmentGet(ID) ->
    angelInvestmentGetOne(ID, true),
    investmentList2Client().

angelInvestmentGetOne(ID, IsTips)->
    {Ret, Code} = canItemGet(ID),
    if
        Ret =:= false  ->
            case IsTips of
                true ->
                    playerMsg:sendErrorCodeMsg(Code);
                _ ->
                    skip
            end;
        true ->
            CurDays = getCreateDays(),
            {Ret, RR} = getItemBuy(ID),
            case RR of
                #angelInvestment{} ->
%%                    N = CurDays - RR#angelInvestment.updatekey,
%%                    M = ?AngelInvestment_Days_Max,
                    N = 1,
                    L = RR#angelInvestment.left,

                    I = erlang:min(N, L),

                    case I > 0 of
                        true ->
                            Per = RR#angelInvestment.perNum,
                            %% todo 一次性给I * Per个
                            ItemNumber = trunc(I*Per),
                            ItemID = RR#angelInvestment.itemid,
                            sendMailToPlayer(ItemID, ItemNumber, 1,?PLogTS_SevenDays, ?ItemSourceAngelInvestment, 0),
                            %% update
                            U = if
                                    I >= L ->
                                        0;
                                    true ->
                                        L - I
                                end,
                            NewRec = RR#angelInvestment{ updatekey = CurDays, left = U},
                            updateItem(ID, NewRec);
                        _ -> skip
                    end;
                _ ->
                    skip
            end
    end,
    ok.

%%
canItemBuy(ID) ->
    %CurDays = getCreateDays(),
    Ret = isItemExist(ID),
    {MoneyType, Money} = getItemCost(ID),
    if
%%        CurDays > ?CreateDays_Limit ->
%%            {false, ?ErrorCode_AngelInvestmentBuy_OutOfTime};
        Ret ->
            {false, ?ErrorCode_AngelInvestmentBuy_Exist};
        true ->
           conditionMoney(MoneyType, Money)
    end.

%% 能否灵境
canItemGet(ID) ->
    CurDays = getCreateDays(),
    {Ret, RR} = getItemBuy(ID),
    if
        Ret =:= false ->
            {false, ?ErrorCode_AngelInvestmentGet_NotExist};
        RR#angelInvestment.left =< 0 ->
            {false, ?ErrorCode_AngelInvestmentGet_OutOfNumber};
        RR#angelInvestment.updatekey >= CurDays ->
            {false, ?ErrorCode_AngelInvestmentGet_NextDay};
        true ->
            {true, 0}
    end.

%% 更新数据
updateItem(ID, NewRec) when ID > 0 ->
    List = getItemList(),
    NewList = lists:keyreplace(ID, #angelInvestment.id, List, NewRec),
    setItemList(NewList),
    ok;
updateItem(ID, NewRec) ->
    ?ERROR_OUT("error sevenday updateItem:~p, ~p, ~p" , [playerState:getRoleID() , ID, NewRec]) ,
    error.

getCanBuyKeyList() ->
    ItemList = getItemList(),
    BuyKeList = [R#angelInvestment.id || R <- ItemList ],
    %% 物品列表
    FullKeyList = getCfg:get1KeyList(cfg_angel_investment),
    %% 差
    LeftList = lists:subtract(FullKeyList, BuyKeList),%%FullKeyList -- BuyKeList,
    LeftList.

%%
%% 购买消耗
getItemCost(0) ->
    %% 差
    LeftList = getCanBuyKeyList(),
    %%算总价
    F =
    fun(ID, Acc) ->
        case getCfg:getCfgByKey(cfg_angel_investment, ID) of
            #angel_investmentCfg{sale = Sale} ->
                Acc + Sale;
            _ ->
                Acc
        end
    end,
    TotalCost = lists:foldl(F, 0, LeftList),

    %% 调整
    RealCost =
    if
        TotalCost =< 0 ->
            999999999;
        true ->
            TotalCost
    end,
    {?CoinTypeDiamond, RealCost};
getItemCost(ID) when ID > 0 ->
    Rec = getCfg:getCfgByKey(cfg_angel_investment, ID),
    case Rec of
        #angel_investmentCfg{buy = Buy, sale = _Sale} ->
            {?CoinTypeDiamond, Buy};
        _ ->
            {?CoinTypeDiamond, 999999999}
    end;
getItemCost(_ID) ->
    {?CoinTypeDiamond, 999999999}.

%%是否已经购买
isItemExist(0) ->
    List = getCanBuyKeyList(),
    length(List) =< 0;
isItemExist(ID) when ID > 0 ->
    {Ret, _} = getItemBuy(ID),
    Ret;
isItemExist(ID)->
    ?ERROR_OUT("error sevenday isItemExist:~p,~p" , [playerState:getRoleID() , ID]) ,
    true.

%%新增购买
addItemBuy(0) ->
    KeyList = getCanBuyKeyList(),
    F =
    fun(ID, Acc) ->
        case getCfg:getCfgByKey(cfg_angel_investment, ID) of
            #angel_investmentCfg{item = ItemID, num1 = Num} ->
                Rec = #angelInvestment{id = ID,
                                       itemid = ItemID,
                                       left = ?AngelInvestment_Per_Max,
                                       perNum = Num,
                                       updatekey = 0},
                [Rec | Acc];
            _ ->
                Acc
        end
    end,
    List = getItemList(),
    NewBuyList = lists:foldl(F, [], KeyList),
    NewList = List ++ NewBuyList,
    setItemList(NewList),
    ok;
addItemBuy(ID) when ID > 0 ->
    Rec = getCfg:getCfgByKey(cfg_angel_investment, ID),
    case Rec of
        #angel_investmentCfg{item = ItemID, num1 = Num} ->
            AngelRec = #angelInvestment{id = ID,
                                   itemid = ItemID,
                                   left = ?AngelInvestment_Per_Max,
                                   perNum = Num,
                                   updatekey = 0},
            List = getItemList(),
            NewList = [AngelRec] ++ List,
            setItemList(NewList);
        _ ->
            ?ERROR_OUT("error sevenday addItemBuy:~p,~p" , [playerState:getRoleID() , ID])
    end;
addItemBuy(ID) ->
    ?ERROR_OUT("error sevenday addItemBuy:~p,~p" , [playerState:getRoleID() , ID]) ,
    error.

%% 已经购买的数据
getItemBuy(0)  ->
    {false, 0};
getItemBuy(ID) when ID > 0 ->
    List = getItemList(),
    R = lists:keyfind(ID, #angelInvestment.id, List),
    case R of
        #angelInvestment{} ->
            {true, R};
        _ ->
            {false, 0}
    end;
getItemBuy(ID)  ->
    ?ERROR_OUT("error sevenday getItemBuy:~p,~p" , [playerState:getRoleID() , ID]) ,
    {false, 0}.

%%
getItemList() ->
    List = playerPropSync:getProp(?SerProp_PlayerInvestment),
    if
        is_list(List) ->
            List;
        true ->
            []
    end.

setItemList(List) ->
    playerPropSync:setAny(?SerProp_PlayerInvestment, List).

%% ------------------------------------------------------------------------------------------------------------------------------------
%% ------------------------------------------------------------------------------------------------------------------------------------
querySevenMissionData()->
    refreshMission(),
    sendMissionList2Client(),
    ok.

sevenMissionCompletion(MissionID) ->
    {Ret, RR} = getMissionInfo(MissionID),
    if
        Ret =:= false ->
            playerMsg:sendErrorCodeMsg(?ErrorCode_SevenDayMission_NotCompletion);
        true ->
            {Done, Code} = checkMissionDone(RR),
            case Done of
                true ->
                    doMissionDone(RR),
%%                    sendMissionList2Client(),
                    ok;
                _ ->
                    playerMsg:sendErrorCodeMsg(Code)
            end
    end.

onMissionEvent( ?SevenDayMission_Event_7, AddCount, Param)  ->
    if
        Param =:= ?CoinTypeDiamond orelse Param =:= ?CoinTypeBindDiamond ->
            doMissionEvent(?SevenDayMission_Event_7, AddCount, 0);
        true ->
            skip
    end,
    ok;
onMissionEvent(CurEvents, AddCount, Param)->
    doMissionEvent(CurEvents, AddCount,Param).

doMissionEvent(CurEvents, AddCount, CurParam) ->
    %%    TODO 实现
    List = getMissionList(),

    Mapf =
    fun(#sevenDayMission{cur=Cur, max = MaxVal, events = Events, isfinish = IsFinish, param = Param} = R) ->
        case IsFinish =:= ?MISSION_PROCESS andalso Events =:= CurEvents andalso CurParam =:= Param of
            true ->
                NewVal = Cur + AddCount,
                NewCur = case NewVal > MaxVal of
                             true ->
                                 MaxVal;
                             _ ->
                                 NewVal
                         end,
                RR = R#sevenDayMission{ cur = NewCur},
                sendMission2Client(RR),
                RR;
            _ ->
                R
        end
    end,
    NewList = lists:map(Mapf, List),
    setMissionList(NewList),
    ok.

%%
sendMission2Client(#sevenDayMission{} = R) ->
    playerMsg:sendNetMsg(#pk_GS2U_SevenMissionDataUpdate{isFinish = misc:convertBoolFromInt(R#sevenDayMission.isfinish),
                                                         number = R#sevenDayMission.cur,
                                                         max = R#sevenDayMission.max,
                                                         missionid = R#sevenDayMission.missionID}).
%%
sendMissionList2Client() ->
    List = getMissionList(),
    %%0.
    {_, NextRefreshTime} = countRefreshTime(),

    %% 1.
    Mapf =
    fun(#sevenDayMission{missionID = MissionID, max=Max, cur=Cur, isfinish = IsFinish} = _R) ->
        #pk_SevenDayMissionData{isFinish =  misc:convertBoolFromInt(IsFinish), number = Cur, max = Max, missionid = MissionID}
    end,
    MissionList = lists:map(Mapf, List),

    %%2.
    Days = case length(List) > 0 of
               true ->
                   [H | _] = List,
                   H#sevenDayMission.keys;
               _ ->
                   CurDays = getCreateDays(),
                   CurDays
           end,

    %%3.
    playerMsg:sendNetMsg(#pk_GS2U_SevenMissionDataList{days = Days,
                                                       timeoutSeconds = NextRefreshTime,
                                                       lists = MissionList}),
    ok.

%%
refreshMission() ->
    List = getMissionList(),
    CurDays = getCreateDays(),
    NeedRefresh = if
                      length(List) =:= 0 ->
                          true;
                      true ->
                          [H | _] = List,
                          OldKeys = H#sevenDayMission.keys,
                          {IsAfterResetHour, _} = countRefreshTime(),
                          case IsAfterResetHour andalso CurDays > OldKeys of
                              true ->
                                  true;
                              _ -> false
                          end
                  end,

    case NeedRefresh of
        true ->
            doRefreshMission(CurDays);
        _  ->
            skip
    end,
    ok.

getMissionInfo(MissionID) ->
    List = getMissionList(),
    R = lists:keyfind(MissionID, #sevenDayMission.missionID, List),
    case R of
        #sevenDayMission{} ->
            {true, R};
        _ ->
            {false, 0}
    end.

%%
getMissionList() ->
    List = playerPropSync:getProp(?SerProp_PlayerSevenMission),
    if
        is_list(List) ->
            List;
        true ->
            []
    end.
%%
checkMissionDone(#sevenDayMission{cur = Cur, max = Max, isfinish = IsFinish} = _R) ->
    IsConditionOk = Cur >= Max,
    if
        IsConditionOk =:= false->
            {false, ?ErrorCode_SevenDayMission_NotCompletion};
        IsFinish =:= ?MISSION_FINISH ->
            {false, ?ErrorCode_SevenDayMission_IsFinish};
        true ->
            {true, 0}
    end.

%%
doMissionDone(#sevenDayMission{missionID = MissionID} = R) ->
%%1. 给奖励

    Rec = getCfg:getCfgPStack(cfg_severday_task, MissionID),
    case Rec of
        #severday_taskCfg{item1 = ItemID1, num1 = Num1, item2 = ItemID2, num2 = Num2} ->
            sendMailToPlayer(ItemID1, Num1, 1,?PLogTS_SevenDays, ?ItemSourceSevenDayMission, 0),
            sendMailToPlayer(ItemID2, Num2, 1,?PLogTS_SevenDays, ?ItemSourceSevenDayMission, 0),
            ok;
        _ ->
            ?ERROR_OUT("sevenday mission done error,player:~p, mission:~p", [playerState:getRoleID(), R])
    end,

    %%2. 改数据
    List = getMissionList(),
    NewRec = R#sevenDayMission{ isfinish = ?MISSION_FINISH, param = -1},
    NewList = lists:keyreplace(MissionID, #sevenDayMission.missionID, List, NewRec),
    setMissionList(NewList),

    %%3.
    sendMission2Client(NewRec),

    ok.

%%
setMissionList(List) ->
    playerPropSync:setAny(?SerProp_PlayerSevenMission, List).

%%
doRefreshMission(CurDays) ->
    %%1. 检查任务列表主动完成
    %%    TODO 实现

    %%2. 刷新
    if
        CurDays > ?CreateDays_Limit ->
            setMissionList([]);
        true ->
            KeyList = getCfg:get1KeyList(cfg_severday_task),
            F =
            fun(ID, Acc) ->
                case getCfg:getCfgByKey(cfg_severday_task, ID) of
                    #severday_taskCfg{type = Type,events = Events, id=ID, task_num = Max} ->

                        case Type =:= CurDays of
                            true ->
                                [EventKey, Param] = Events,
                                Rec = #sevenDayMission{keys = CurDays,
                                                       missionID = ID,
                                                       events = EventKey,
                                                       max  = Max,
                                                       cur = 0,
                                                       param = Param,
                                                       isfinish = 0},
                                [Rec | Acc];
                            _ ->
                                Acc
                        end;
                    _ ->
                        Acc
                end
            end,
            NewList = lists:foldl(F, [], KeyList),
            setMissionList(NewList)
    end,
    ok.


%%-----------------------------------------------------------------------------------------
%% 货币检查
conditionMoney(MoneyType , Money) ->
    case MoneyType of
        ?CoinTypeGold -> {playerState:getCoin(MoneyType) >= Money , ?ErrorCode_TradeGold};
        ?CoinTypeDiamond -> {playerState:getCoin(MoneyType) >= Money , ?ErrorCode_TradeDiamond};
        ?CoinTypeBindDiamond -> {playerMoney:canUseCoin(?CoinUseTypeDiamond , Money) , ?ErrorCode_TradeDiamond};
        _ -> {false , ?ErrorCode_TradeGold}
    end.

%% 扣钱
decMoney(MoneyType , Money, Reason, Target) ->
    case Money > 0 of
        true ->
            PLog = #recPLogTSMoney{reason = Reason , param = 0 , target = Target , source = ?PLogTS_PlayerSelf} ,
            case MoneyType of
                ?CoinTypeGold -> {playerMoney:decCoin(MoneyType , Money , PLog) , false};
                ?CoinTypeDiamond -> {playerMoney:decCoin(MoneyType , Money , PLog) , true};
                ?CoinTypeBindDiamond -> {playerMoney:useCoin(?CoinUseTypeDiamond , Money , PLog) , true};
                _ -> {false , false}
            end;
        _ -> {true , false}
    end.

%%
%% (-,_,_,?PLogTS_SevenDays,?ItemSourceSevenDayMission/?ItemSourceAngelInvestment, 0)
sendMailToPlayer(ItemID, ItemNumber, IsBind, Source, Reason, Param ) ->
    ?LOG_OUT("seven days send mail,player:~p,item:~p,~p,src:~p,y:~p" , [playerState:getRoleID() , ItemID,ItemNumber, Source, Reason]),
    case getCfg:getCfgPStack(cfg_item , ItemID) of
        #itemCfg{} ->
            Plog = #recPLogTSItem{
                old         = 0 ,
                new         = ItemNumber ,
                change      = ItemNumber ,
                target      = ?PLogTS_PlayerSelf ,
                source      = Source ,
                gold        = 0 ,
                goldtype    = 0 ,
                changReason = Reason ,
                reasonParam = Param
            } ,
            BoolIsBind = misc:convertBoolFromInt(IsBind) ,
            playerPackage:addGoodsAndMail(ItemID , ItemNumber , BoolIsBind , 0 , Plog);
        _ ->
            ?ERROR_OUT("seven days error item config:~p,~p,~p" , [playerState:getRoleID() , ItemID,ItemNumber])
%%            playerMsg:sendErrorCodeMsg(?ErrorCode_LotterySuccessButNoItem)
    end.
