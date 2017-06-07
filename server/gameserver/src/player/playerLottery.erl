%%%-------------------------------------------------------------------
%%% @author tiancheng，
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 占卜，抽奖
%%% 新版本与刀塔传奇的抽奖类似
%%%     金币抽取      钻石抽取
%%%       /\          /\
%%%      /  \        /  \
%%%    免费  金币   免费  钻石
%%%         /\          /\
%%%        /  \        /  \
%%%      一次  十次   一次  十次
%%% @end
%%% Created : 24. 七月 2015 15:21
%%% modified ： mwh 2016/02/29
%%% todo 1.合并prop
%%%-------------------------------------------------------------------
-module(playerLottery).
-author("tiancheng").

-include("playerPrivate.hrl").

-record(lotteryEveDay , {
    nextResetTime = 0 ,
    allCount = 0 ,
    destinyStar = [] ,
    itemTimes = []
}).

-record(destinyStar , {
    roleID = 0 ,
    onlyID = 0 ,
    itemID = 0 ,
    itemNumber = 0 ,
    isBind = 1
}).

%% 奖池金额最大值
-define(PondMoneyMaxValue , 9223372036854775807).

%% 命运主星个数
-define(DestinyStarNumber , 10).

%% 奖池定义
%% 金币单抽、金币十连前9次
-define(ItemPondNumber_1 , 1).
%% 金币十连最后一次
-define(ItemPondNumber_2 , 2).
%% 钻石单抽
-define(ItemPondNumber_3 , 3).
%% 钻石单抽累计第10次、钻石十连前9次
-define(ItemPondNumber_4 , 4).
%% 钻石十连最后一次
-define(ItemPondNumber_5 , 5).

%% 公共数据存储key Sundries_ID_Lottery
%% 金币奖池 uint64
-define(SundriesLotteryKey_GoldPond , 1).
%% 钻石奖池 uint64
-define(SundriesLotteryKey_DiamondPond , 2).
%% 每日幸运星 {nextResetTime, allcount, [#destinyStar{},...], [{OnlyID, Number}]}
%% 每日幸运星 #lotteryEveDay{}
-define(SundriesLotteryKey_DestinyStar , 3).

%% 当日抽奖总次数
-define(DailySubType_Lottery_AllNumber , 1).
%% 当日9号牌累积次数
-define(DailySubType_Lottery_MainProcess , 2).

%% 当日已经使用金币免费抽取次数
-define(DailySubType_Lottery_GoldFreeNumber , 3).
%% 当日钻石抽取次数
-define(DailySubType_Lottery_DiamondFreeNumber , 4).
%% 当日金币抽取总次数
-define(DailySubType_Lottery_GoldTotalNumber , 5).
%% 当日钻石抽取总次数
-define(DailySubType_Lottery_DiamondTotalNumber , 6).

%% 每日免费次数
-define(Default_EveryDayFreeNumber , 25).

%% 异常消耗常数
-define(Exception_Diamond_Cost , 999999999).

-define(MaxRandN , 10).
%% note最大次数
-define(PlayerNoteMaxNumber , 30).

%% API
-export([
    openLotteryForm/0 ,
    requestLottery/3 ,
    deleteRole/1 ,
    gmRstCD/0 ,
    gmRstDailyCount/0 ,
    sendResetTime/0
]).

%% 删除角色
-spec deleteRole(RoleID :: uint64()) -> ok.
deleteRole(RoleID) ->
    FunDel =
    fun(#rec_lottery_result{} = Note) ->
        mnesia:delete_object(Note) ,
        mnesia:delete_object(new_rec_lottery_result , Note , write) ,
        mnesia:write(update_rec_lottery_result , Note , write)
    end ,

    F =
    fun() ->
        case mnesia:read(rec_lottery_result , RoleID , write) of
            [#rec_lottery_result{} | _] = List ->
                lists:foreach(FunDel , List);
            _ ->
                skip
        end
    end ,
    case mnesia:transaction(F) of
        {atomic , _Val} ->
            true;
        _Error ->
            skip
    end ,
    ok.

%% 打开彩票界面
-spec openLotteryForm() -> ok.
openLotteryForm() ->
    case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Lottery) of
        true -> openLotteryForm2();
        _ -> skip
    end ,
    ok.

openLotteryForm2() ->
    NowTime = time:getSyncTime1970FromDBS() ,
    %%  重置
    case memDBCache:getSundriesValue(?Sundries_ID_Lottery , ?SundriesLotteryKey_DestinyStar) of
        #lotteryEveDay{nextResetTime = NextResetTime} when NowTime >= NextResetTime ->
            resetDestinyStar(NowTime);
        #lotteryEveDay{nextResetTime = NextResetTime} when NowTime < NextResetTime ->
            ok;
        _ ->
            resetDestinyStar(NowTime)
    end ,

    freshClientData() ,
    ok.


resetDestinyStar(NowTime) ->
    ?DEBUG_OUT("resetDestinyStar:~p,~p" , [playerState:getRoleID() , NowTime]) ,
    %% 获取下次刷新时间
    {{Year , Month , Day} , {_Hour , _Minute , _Second}} = time:convertSec2DateTime(NowTime) ,
    Mid = time:convertDateTime1970ToSec({{Year , Month , Day} , {?ResetTimeHour , 0 , 0}}) ,
    ResetTime = case NowTime < Mid of
                    true -> Mid;
                    _ -> Mid + 86400
                end ,

    %% 获取新的命运主星
    Key = memDBCache:getSundriesKey(?Sundries_ID_Lottery , ?SundriesLotteryKey_DestinyStar) ,
    Rec = memDBCache:getSundriesRec(
        ?Sundries_ID_Lottery ,
        ?SundriesLotteryKey_DestinyStar ,
        #lotteryEveDay{nextResetTime = ResetTime , allCount = 0 , destinyStar = [] , itemTimes = []}) ,

    F =
    fun() ->
        case mnesia:read(rec_sundries , Key , write) of
            [#rec_sundries{value = #lotteryEveDay{nextResetTime = Time}}] when Time =< ResetTime ->
                mnesia:write(rec_sundries , Rec , write) ,
                case mnesia:read(new_rec_sundries , Key , write) of
                    [#rec_sundries{}] ->
                        %% 更新插入表
                        mnesia:write(new_rec_sundries , Rec , write);
                    [] ->
                        %% 添加到更新表
                        mnesia:write(update_rec_sundries , Rec , write)
                end;
            [] ->
                mnesia:write(rec_sundries , Rec , write) ,
                mnesia:write(new_rec_sundries , Rec , write);
            _ ->
                skip
        end
    end ,
    case mnesia:transaction(F) of
        {atomic , _Val} ->
            true;
        Error ->
            ?ERROR_OUT("resetDestinyStar roleID=~p, error=~p" , [playerState:getRoleID() , Error])
    end ,
    ok.

-spec freshClientData() -> ok.
freshClientData() ->
    %% 1.先发奖池奖金
    PondGold = getPondMoney(?SundriesLotteryKey_GoldPond) ,
    PondDiamond = getPondMoney(?SundriesLotteryKey_DiamondPond) ,
    MoneyMsg = #pk_GS2U_LotteryMoney{pondGold = PondGold , pondDiamond = PondDiamond} ,
    playerMsg:sendNetMsg(MoneyMsg) ,

    %% 2.
%%  sendResetTime(),

    %% 3.再发抽奖结果信息 rec_lottery_result
    #globalsetupCfg{setpara = [Number]} = getCfg:getCfgPStack(cfg_globalsetup , divine_winernumbers) ,
    Self = getSelfLottery(erlang:min(Number , ?PlayerNoteMaxNumber)) ,
    Server = getServerLottery(erlang:min(Number , ?PlayerNoteMaxNumber)) ,
    playerMsg:sendNetMsg(#pk_GS2U_LotteryNote{notes = (Self ++ Server)}) ,
    ok.

sendResetTime() ->
    _RstGold = getRstTimeDiff(true) ,
    _RstDiamond = getRstTimeDiff(false) ,
    MoneyMsg = #pk_GS2U_LotteryResetTime{goldFreeRstTime = _RstGold , diamondFreeRstTime = _RstDiamond} ,
    playerMsg:sendNetMsg(MoneyMsg).

%% 抽奖
-spec requestLottery(IsGold :: boolean() , IsFree :: boolean() , N :: integer()) -> ok.
requestLottery(IsGold , IsFree , N) ->
    case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Lottery) of
        true ->
            requestLottery2(IsGold , IsFree , N);
        _ -> skip
    end ,
    ok.

requestLottery2(IsGold , IsFree , N) ->
%%  货币检查
    {MoneyType , Money} = getNeedMoney(IsGold , IsFree , N) ,
    {CanUse , ErrorCode} =
    case IsFree of
        true -> {true , 0};
        _ -> conditionMoney(MoneyType , Money)
    end ,

%%  次数检查
    {CanCount , ConditionCode} =
    case CanUse of
        false -> {false , ErrorCode};
        _ -> conditioNumber(IsGold , IsFree)
    end ,

    case CanCount of
        true ->
            {Ret , IsDiamond} = decMoney(MoneyType , Money) ,
            case Ret of
                true ->
                    %% 部分钱加入奖池
                    if
                        IsFree =:= true ->
                            skip;
                        true ->
                            case IsDiamond of
                                true ->
                                    #globalsetupCfg{setpara = [_ , Per2]} = getCfg:getCfgPStack(cfg_globalsetup , divine_pool_diamond) ,
                                    addDiamondPond(trunc(Money * Per2));
                                _ ->
                                    #globalsetupCfg{setpara = [_ , Per1]} = getCfg:getCfgPStack(cfg_globalsetup , divine_pool_gold) ,
                                    addGoldPond(trunc(Money * Per1))
                            end
                    end ,
                    case doLottery(IsGold , IsFree , N) of
                        {error , Code} -> playerMsg:sendErrorCodeMsg(Code);
                        {ok , ItemList} -> doLotterySuccess(ItemList)
                    end;
                _ -> skip
            end ,
            ok;
        _ ->
            playerMsg:sendErrorCodeMsg(ConditionCode)
    end ,
    ok.

%% 次数检查 isgold, isfree,
conditioNumber(true , false) ->
    Number = playerDaily:getDailyCounter(?DailyType_Lottery , ?DailySubType_Lottery_GoldTotalNumber) ,
    #globalsetupCfg{setpara = [MaxNumber]} = getCfg:getCfgPStack(cfg_globalsetup , divine_goldlimit) ,
    case Number < MaxNumber andalso Number >= 0 of
        true -> {true , 0};
        false -> {false , ?ErrorCode_LotteryGoldLimitCount}
    end;
conditioNumber(true , true) ->
    {Rst , Code} = conditioNumber(true , false) ,
    case Rst of
        true ->
            Number = playerDaily:getDailyCounter(?DailyType_Lottery , ?DailySubType_Lottery_GoldFreeNumber) ,
            RstDiff = getRstTimeDiff(true) ,
            case RstDiff =< 0 of
                true ->
                    FreeLimit = getFreeLimitEverDay(true) ,
                    case Number < FreeLimit andalso Number >= 0 of
                        true -> {true , 0};
                        _ -> {false , ?ErrorCode_LotteryGoldFreeLimitCount}
                    end;
                _ -> {false , ?ErrorCode_LotteryGoldFreeRstTime}
            end;
        false -> {Rst , Code}
    end;
conditioNumber(false , false) ->
    Number = playerDaily:getDailyCounter(?DailyType_Lottery , ?DailySubType_Lottery_DiamondTotalNumber) ,
    #globalsetupCfg{setpara = [MaxNumber]} = getCfg:getCfgPStack(cfg_globalsetup , divine_diamondlimit) ,
    case Number < MaxNumber andalso Number >= 0 of
        true -> {true , 0};
        false -> {false , ?ErrorCode_LotteryDiamondLimitCount}
    end;
conditioNumber(false , true) ->
    {Rst , Code} = conditioNumber(false , false) ,
    case Rst of
        true ->
            Number = playerDaily:getDailyCounter(?DailyType_Lottery , ?DailySubType_Lottery_DiamondFreeNumber) ,
            RstDiff = getRstTimeDiff(false) ,
            case RstDiff =< 0 of
                true ->
                    FreeLimit = getFreeLimitEverDay(false) ,
                    case Number < FreeLimit andalso Number >= 0 of
                        true -> {true , 0};
                        _ -> {false , ?ErrorCode_LotteryDiamondFreeLimitCount}
                    end;
                _ -> {false , ?ErrorCode_LotteryDiamondFreeRstTime}
            end;
        false -> {Rst , Code}
    end;
conditioNumber(IsGold , IsFree) ->
    ?ERROR_OUT("conditioNumber roleID=~p, parm=(~p,~p)" , [playerState:getRoleID() , IsGold , IsFree]) ,
    {false , ?ErrorCode_LotteryDiamondFreeLimitCount}.

%% 货币检查
conditionMoney(MoneyType , Money) ->
    case MoneyType of
        ?CoinTypeGold -> {playerState:getCoin(MoneyType) >= Money , ?ErrorCode_TradeGold};
        ?CoinTypeDiamond -> {playerState:getCoin(MoneyType) >= Money , ?ErrorCode_TradeDiamond};
        ?CoinTypeBindDiamond -> {playerMoney:canUseCoin(?CoinUseTypeDiamond , Money) , ?ErrorCode_TradeDiamond};
        _ -> {false , ?ErrorCode_TradeGold}
    end.

%% 扣钱
decMoney(MoneyType , Money) ->
    case Money > 0 of
        true ->
            PLog = #recPLogTSMoney{reason = ?CoinUseLottery , param = 0 , target = ?PLogTS_Lottery , source = ?PLogTS_PlayerSelf} ,
            case MoneyType of
                ?CoinTypeGold -> {playerMoney:decCoin(MoneyType , Money , PLog) , false};
                ?CoinTypeDiamond -> {playerMoney:decCoin(MoneyType , Money , PLog) , true};
                ?CoinTypeBindDiamond -> {playerMoney:useCoin(?CoinUseTypeDiamond , Money , PLog) , true};
                _ -> {false , false}
            end;
        _ -> {true , false}
    end.

%% 计算所需货币 //isGold, isFree, N
getNeedMoney(true , true , _) ->
    {?CoinTypeGold , 0};
getNeedMoney(true , false , N) when N >= 1 andalso N =< ?MaxRandN ->
    {MoneyType , One , Ten} = getNeedMoneyCfg(true) ,
    case N of
        1 -> {MoneyType , One};
        _ -> {MoneyType , Ten}
    end;
getNeedMoney(false , true , _) ->
    {?CoinTypeDiamond , 0};
getNeedMoney(false , false , N) when N >= 1 andalso N =< ?MaxRandN ->
    {MoneyType , One , Ten} = getNeedMoneyCfg(false) ,
    case N of
        1 -> {MoneyType , One};
        _ -> {MoneyType , Ten}
    end;
getNeedMoney(_ , _ , _) ->
    {?CoinTypeDiamond , ?Exception_Diamond_Cost}.

getNeedMoneyCfg(IsGold) ->
    Fitler =
    fun({MoneyType , _ , _}) ->
        case MoneyType =:= ?CoinTypeGold of
            true -> IsGold;
            _ -> IsGold =:= false
        end
    end ,
    #globalsetupCfg{setpara = CostList} = getCfg:getCfgPStack(cfg_globalsetup , divine_cost) ,
    case lists:filter(Fitler , CostList) of
        [] -> {?CoinTypeDiamond , ?Exception_Diamond_Cost , ?Exception_Diamond_Cost};
        [H | _] -> H
    end.

%% 获取免费抽奖重置时间
getRstTimeDiff(IsGold) ->
    NowTime = time:getUTCNowSec() ,
    RstTimeEnd = getRstTime(IsGold) ,
    case RstTimeEnd > NowTime of
        true ->
            erlang:trunc(RstTimeEnd - NowTime);
        false ->
            0
    end.

-spec getRstTime(IsGold :: boolean()) -> integer().
getRstTime(IsGold) ->
    T = playerPropSync:getProp(?SerProp_PlayerLottery) ,
    RstTime = case T of
                  {_ , GoldRstTime , DiamondRstTime} ->
                      if
                          IsGold =:= true ->
                              GoldRstTime;
                          true ->
                              DiamondRstTime
                      end;
                  _ -> 0
              end ,

    case RstTime of
        undefined -> 0;
        _ -> RstTime
    end.

setRstTime(IsGold , Time) ->
    T = playerPropSync:getProp(?SerProp_PlayerLottery) ,
    T1 =
    case T of
        {DSingle , GoldRstTime , DiamondRstTime} ->
            if
                IsGold =:= true ->
                    {DSingle , Time , DiamondRstTime};
                true ->
                    {DSingle , GoldRstTime , Time}
            end;
        _ ->
            if
                IsGold =:= true ->
                    {0 , Time , 0};
                true ->
                    {0 , 0 , Time}
            end
    end ,
    playerPropSync:setAny(?SerProp_PlayerLottery , T1).


%% 增加抽奖次数// isGold , isFree
addLotteryCount(IsGold , IsFree , N) ->
    %% 个人抽奖总次数
    addLotteryDaily(IsGold , IsFree , N) ,
    %% 全服抽奖总次数
    Key = memDBCache:getSundriesKey(?Sundries_ID_Lottery , ?SundriesLotteryKey_DestinyStar) ,
    F =
    fun() ->
        case mnesia:read(rec_sundries , Key , write) of
            [#rec_sundries{value = #lotteryEveDay{allCount = Count} = R}] ->
                Rec = memDBCache:getSundriesRec(
                    ?Sundries_ID_Lottery ,
                    ?SundriesLotteryKey_DestinyStar ,
                    R#lotteryEveDay{allCount = Count + 1}) ,
                mnesia:write(rec_sundries , Rec , write) ,
                case mnesia:read(new_rec_sundries , Key , write) of
                    [#rec_sundries{}] ->
                        %% 更新插入表
                        mnesia:write(new_rec_sundries , Rec , write);
                    [] ->
                        %% 添加到更新表
                        mnesia:write(update_rec_sundries , Rec , write)
                end;
            _ ->
                skip
        end
    end ,
    case mnesia:transaction(F) of
        {atomic , _Val} ->
            true;
        Error ->
            ?ERROR_OUT("addLotteryCount roleID=~p, error=~p" , [playerState:getRoleID() , Error])
    end ,
    ok.

%% isGold, isFree
addLotteryDaily(true , false , _N) ->
    playerDaily:incDailyCounter(?DailyType_Lottery , ?DailySubType_Lottery_AllNumber) ,
    playerDaily:incDailyCounter(?DailyType_Lottery , ?DailySubType_Lottery_GoldTotalNumber);

addLotteryDaily(true , true , N) ->
    %% 算出时间差
    NowTime = time:getUTCNowSec() ,
    #globalsetupCfg{setpara = [GoldCD]} = getCfg:getCfgPStack(cfg_globalsetup , divine_goldcd) ,
    %% 设置时间
    NewRstTime = NowTime + GoldCD ,
%%  playerPropSync:setInt64(?SerProp_PlayerLotteryGoldRstTime, NewRstTime),
    setRstTime(true , NewRstTime) ,
    addLotteryDaily(true , false , N) ,
    playerDaily:incDailyCounter(?DailyType_Lottery , ?DailySubType_Lottery_GoldFreeNumber);

addLotteryDaily(false , false , N) ->
    incPropDiamonSingle(N) ,
    playerDaily:incDailyCounter(?DailyType_Lottery , ?DailySubType_Lottery_AllNumber) ,
    playerDaily:incDailyCounter(?DailyType_Lottery , ?DailySubType_Lottery_DiamondTotalNumber);

addLotteryDaily(false , true , N) ->
    %% 算出时间差
    NowTime = time:getUTCNowSec() ,
    #globalsetupCfg{setpara = [DiamondCD]} = getCfg:getCfgPStack(cfg_globalsetup , divine_diamondcd) ,
    %% 设置时间
    NewRstTime = NowTime + DiamondCD ,
%%  playerPropSync:setInt64(?SerProp_PlayerLotteryDiamondRstTime, NewRstTime),
    setRstTime(false , NewRstTime) ,
    addLotteryDaily(false , false , N) ,
    playerDaily:incDailyCounter(?DailyType_Lottery , ?DailySubType_Lottery_DiamondFreeNumber);

addLotteryDaily(IsGold , IsFree , N) ->
    ?ERROR_OUT("addLotteryDaily roleID=~p, parm=(~p,~p,~p)" , [playerState:getRoleID() , IsGold , IsFree , N]) ,
    ok.

incPropDiamonSingle(N) when N =:= 1 ->
    incDiamonSingle();
incPropDiamonSingle(_N) ->
    ok.

incDiamonSingle() ->
    T = playerPropSync:getProp(?SerProp_PlayerLottery) ,
    T1 =
    case T of
        {DSingle , GoldRstTime , DiamondRstTime} ->
            {DSingle + 1 , GoldRstTime , DiamondRstTime};
        _ ->
            {1 , 0 , 0}
    end ,
    playerPropSync:setAny(?SerProp_PlayerLottery , T1).

setDiamonSingle(N) ->
    T = playerPropSync:getProp(?SerProp_PlayerLottery) ,
    T1 =
    case T of
        {_ , GoldRstTime , DiamondRstTime} ->
            {N , GoldRstTime , DiamondRstTime};
        _ ->
            {N , 0 , 0}
    end ,
    playerPropSync:setAny(?SerProp_PlayerLottery , T1).

getDiamonSingle() ->
    T = playerPropSync:getProp(?SerProp_PlayerLottery) ,
    case T of
        {DSingle , _ , _} ->
            DSingle;
        _ -> 0
    end.
%%isGold, isLast, N
getItemPond(Param1 , Param2 , N) ->
    case get('GM_Appoint_Lottery_ItemOnlyID') of
        undefined ->
            getItemPond2(Param1 , Param2 , N);
        {PondID , OnlyID} ->
            ?LOG_OUT("getItemPond, roleID=~p,~p,~p,param:~p,~p" , [playerState:getRoleID() , PondID , OnlyID , Param1 , Param2]) ,
            PondID
    end.
%% 金币单抽
getItemPond2(true , _ , N) when N =:= 1 ->
    ?ItemPondNumber_1;
getItemPond2(true , IsLast , N) when N > 1 ->
    case IsLast of
        true -> ?ItemPondNumber_2;
        _ -> ?ItemPondNumber_1
    end;
%%钻石单抽
getItemPond2(false , _ , N) when N =:= 1 ->
    Number = getDiamonSingle() ,
    case Number rem 10 =:= 0 andalso Number > 0 of
        true -> ?ItemPondNumber_4;
        _ -> ?ItemPondNumber_3
    end;
getItemPond2(false , IsLast , N) when N > 1 ->
    case IsLast of
        true -> ?ItemPondNumber_5;
        _ -> ?ItemPondNumber_3
    end.

%% isGold,isFree, N:最大次数
doLottery(true , true , _N) ->
    doLotteryPart([] , true , true , true , 1 , 1);
doLottery(true , false , N) when N =:= 1 ->
    doLotteryPart([] , true , false , true , 1 , 1);
doLottery(true , false , N) when N > 1 ->
    case doLotteryPart([] , true , false , false , N - 1 , N) of
        {ok , ItemList} -> doLotteryPart(ItemList , true , false , true , 1 , N);
        {error , Code} -> {error , Code}
    end;
doLottery(false , true , _N) ->
    doLotteryPart([] , false , true , true , 1 , 1);
doLottery(false , false , N) when N =:= 1 ->
    doLotteryPart([] , false , false , true , 1 , 1);
doLottery(false , false , N) when N > 1 ->
    case doLotteryPart([] , false , false , false , N - 1 , N) of
        {ok , ItemList} -> doLotteryPart(ItemList , false , false , true , 1 , N);
        {error , Code} -> {error , Code}
    end;
doLottery(IsGold , IsFree , N) ->
    ?ERROR_OUT("doLottery roleID=~p, parm=(~p,~p,~p)" , [playerState:getRoleID() , IsGold , IsFree , N]) ,
    {error , ?ErrorCode_LotterySuccessButNoItem}.

%% 生成Item列表 // NLimit-> 随机多少个, N -> 上限
doLotteryPart(_ItemList , IsGold , IsFree , IsLast , NLimit , N) when NLimit < 0 orelse NLimit > ?MaxRandN ->
    ?ERROR_OUT("doLottery roleID=~p, parm=(~p,~p,~p,~p,~p)" , [playerState:getRoleID() , IsGold , IsFree , IsLast , NLimit , N]) ,
    {error , ?ErrorCode_LotterySuccessButNoItem};
doLotteryPart(ItemList , _IsGold , _IsFree , _IsLast , 0 , _N) ->
    {ok , ItemList};
doLotteryPart(ItemList , IsGold , IsFree , IsLast , NLimit , N) ->
    %% 累积次数
    addLotteryCount(IsGold , IsFree , N) ,
    %% 取得奖品列表
    PondNumber = getItemPond(IsGold , IsLast , N) ,
    %% 钻石单抽，重置
    case IsGold =:= false andalso N =:= 1 andalso PondNumber =:= ?ItemPondNumber_4 of
        true -> setDiamonSingle(0); %%
        _ -> skip
    end ,

    case requestLottery3(PondNumber) of
        {error , Code} ->
            {error , Code};
        {ok , Item} ->
            doLotteryPart([Item] ++ ItemList , IsGold , IsFree , IsLast , NLimit - 1 , N)
    end.

%% param:PondNumber 奖池编号
requestLottery3(PondNumber) ->
    %% 限制奖池金额，个人抽奖次数，全服抽奖次数
    Key2List = getCfg:get2KeyList(cfg_divine , PondNumber) ,

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    SelfCount = playerDaily:getDailyCounter(?DailyType_Lottery , ?DailySubType_Lottery_AllNumber) ,
    RoleID = playerState:getRoleID() ,
    Key1 = memDBCache:getSundriesKey(?Sundries_ID_Lottery , ?SundriesLotteryKey_GoldPond) ,
    Key2 = memDBCache:getSundriesKey(?Sundries_ID_Lottery , ?SundriesLotteryKey_DiamondPond) ,
    Key3 = memDBCache:getSundriesKey(?Sundries_ID_Lottery , ?SundriesLotteryKey_DestinyStar) ,
    F =
    fun() ->
        %% 金币奖池
        PondGold =
        case mnesia:read(rec_sundries , Key1 , write) of
            [#rec_sundries{value = V1}] when erlang:is_integer(V1) andalso V1 > 0 -> V1;
            _ -> 0
        end ,
        %% 钻石奖池
        PondDiamond =
        case mnesia:read(rec_sundries , Key2 , write) of
            [#rec_sundries{value = V2}] when erlang:is_integer(V2) andalso V2 > 0 -> V2;
            _ -> 0
        end ,
        %% 道具
        [#rec_sundries{value = Eve}] = mnesia:read(rec_sundries , Key3 , write) ,
        Condition = {PondGold , PondDiamond , SelfCount , Eve} ,
        %% 先过滤掉不满足条件的项
        L1 = filterLotteryItem(PondNumber , Key2List , Condition , []) ,
        case erlang:length(L1) > 0 of
            true ->
                %% 再根据权重筛选唯一一个奖品
                %% todo 看看情况能不能一次性全部随机出来
                case getRandList(false , L1 , []) of
                    {_L2 , [#divineCfg{} = Item]} ->
                        Item;
                    Error ->
                        ?ERROR_OUT("requestLottery3:roleID=~p,pond=~p,keylist=~p,cond=~p,error=~p" ,
                                   [RoleID , PondNumber , Key2List , Condition , Error]) ,
                        false
                end;
            _ ->
                ?ERROR_OUT("requestLottery3 is null:roleID=~p,pond=~p,keylist=~p,cond=~p" ,
                           [RoleID , PondNumber , Key2List , Condition]) ,
                false
        end
    end ,
    case mnesia:transaction(F) of
        {atomic , false} ->
            {error , ?ErrorCode_LotterySuccessButNoItem};
        {atomic , Item} ->
            {ok , Item};
        Error ->
            ?ERROR_OUT("addPondMoney roleID=~p, PondNumber=~p, error=~p" , [playerState:getRoleID() , PondNumber , Error]) ,
            {error , ?ErrorCode_LotterySuccessButNoItem}
    end.

%% 抽奖结果处理
doLotterySuccess(ItemList) ->
    RoleID = playerState:getRoleID() ,
    RoleName = playerState:getName() ,

    ?DEBUG_OUT("doLotterySuccess roleID=~p,result=~p" , [RoleID , ItemList]) ,
    FLog =
    fun(Item) ->
        lotterySuccess(RoleID , RoleName , Item)
    end ,
    lists:foreach(FLog , ItemList) ,

    %%
    sendResetTime(),
    %%
    Mapf =
    fun(#divineCfg{item_id = ItemID , is_binded = IsBind , item_number = ItemNumber} = Item) ->
        #pk_LotteryItem{
            roleID     = RoleID ,
            roleName   = RoleName ,
            pondID     = Item#divineCfg.pool_id ,
            onlyID     = Item#divineCfg.id ,
            itemId     = ItemID ,
            itemNumber = ItemNumber ,
            isBind     = IsBind}
    end ,
    ResList = lists:map(Mapf , ItemList) ,
    playerMsg:sendNetMsg(#pk_GS2U_LotteryResult{item = ResList}) ,

    %% 重新刷一遍客户端
    freshClientData(),
    ok.

%% 抽奖成功
lotterySuccess(RoleID , RoleName , #divineCfg{id = OnlyID , item_id = ItemID , is_binded = IsBind , item_number = ItemNumber} = Item) ->
    %% 判断是不是金钱道具
    case getCfg:getCfgPStack(cfg_item , ItemID) of
        #itemCfg{itemType = ?ItemTypeLotteryMoney , useParam1 = PondType , useParam2 = Percent} ->
            %% 全服抽奖总次数
            {SubKey , MoneyType} =
            case PondType of
                ?SundriesLotteryKey_DiamondPond -> {?SundriesLotteryKey_DiamondPond , ?CoinTypeBindDiamond};
                _ -> {?SundriesLotteryKey_GoldPond , ?CoinTypeGold}
            end ,
            Key = memDBCache:getSundriesKey(?Sundries_ID_Lottery , SubKey) ,
            Per = misc:clamp(Percent , 0 , 1) ,
            F =
            fun() ->
                case mnesia:read(rec_sundries , Key , write) of
                    [#rec_sundries{value = Money}] ->
                        Lottery = trunc(Money * Per) ,
                        NewMoney = Money - Lottery ,
                        case NewMoney /= Money of
                            true ->
                                Rec = memDBCache:getSundriesRec(?Sundries_ID_Lottery , SubKey , NewMoney) ,
                                mnesia:write(rec_sundries , Rec , write) ,
                                case mnesia:read(new_rec_sundries , Key , write) of
                                    [#rec_sundries{}] ->
                                        %% 更新插入表
                                        mnesia:write(new_rec_sundries , Rec , write);
                                    [] ->
                                        %% 添加到更新表
                                        mnesia:write(update_rec_sundries , Rec , write)
                                end;
                            _ ->
                                skip
                        end ,
                        Lottery;
                    _ ->
                        0
                end
            end ,
            case mnesia:transaction(F) of
                {atomic , 0} ->
                    ?ERROR_OUT("lotterySuccess roleID=~p, item=~p, [~p,~p]" , [RoleID , Item , PondType , Percent]);
                {atomic , Val} when Val > 0 ->
                    PLog = #recPLogTSMoney{reason = ?CoinSourceLottery , param = ItemID , target = ?PLogTS_PlayerSelf , source = ?PLogTS_Lottery} ,
                    playerMoney:addCoin(MoneyType , Val , PLog) ,
                    case MoneyType of
                        ?CoinTypeGold -> playerMsg:sendErrorCodeMsg(?ErrorCode_LotteryGetGold , [Val]);
                        ?CoinTypeBindDiamond -> playerMsg:sendErrorCodeMsg(?ErrorCode_LotteryGetDiamond , [Val])
                    end ,
                    true;
                Error ->
                    ?ERROR_OUT("lotterySuccess roleID=~p, item=~p, error=~p" , [RoleID , Item , Error])
            end ,

            addToLotteryNotes(RoleID , RoleName , Item);
        #itemCfg{} ->
            Plog = #recPLogTSItem{
                old         = 0 ,
                new         = ItemNumber ,
                change      = ItemNumber ,
                target      = ?PLogTS_PlayerSelf ,
                source      = ?PLogTS_Lottery ,
                gold        = 0 ,
                goldtype    = 0 ,
                changReason = ?ItemSourceLottery ,
                reasonParam = OnlyID
            } ,
            BoolIsBind = misc:convertBoolFromInt(IsBind) ,
            playerPackage:addGoodsAndMail(ItemID , ItemNumber , BoolIsBind , 0 , Plog) ,
            playerLogAdd:addLogParticipatorInfo(?LogParticipator_PlayerUseLotteryEveDay) ,
            addToLotteryNotes(RoleID , RoleName , Item);
        _ ->
            ?ERROR_OUT("error item config:~p, ~p" , [RoleID , Item]) ,
            playerMsg:sendErrorCodeMsg(?ErrorCode_LotterySuccessButNoItem)
    end ,
    ok.

addToLotteryNotes(RoleID , RoleName , #divineCfg{item_id = ItemID , is_binded = IsBind , is_record = ServerNote , item_number = ItemNumber , need_brodcast = Brodcast} = Item) ->
    %% note
    NowTime = time:getSyncTime1970FromDBS() ,
    Rec = #rec_lottery_result{
        roleID       = RoleID ,
        itemID       = ItemID ,
        itemNumber   = ItemNumber ,
        isBind       = IsBind ,
        isServerNote = ServerNote ,
        zbTime       = NowTime
    } ,
    F =
    fun() ->
        case mnesia:read(rec_lottery_result , RoleID , write) of
            [#rec_lottery_result{} | _] = List ->
                case erlang:length(List) >= ?PlayerNoteMaxNumber of
                    true ->
                        %% 先删掉一个
                        [Note | _] = lists:keysort(#rec_lottery_result.zbTime , List) ,
                        mnesia:delete_object(Note) ,
                        mnesia:delete_object(new_rec_lottery_result , Note , write) ,
                        mnesia:write(update_rec_lottery_result , Note , write);
                    _ ->
                        skip
                end ,

                %% 新增
                mnesia:write(rec_lottery_result , Rec , write) ,
                mnesia:write(new_rec_lottery_result , Rec , write);
            _ ->
                mnesia:write(rec_lottery_result , Rec , write) ,
                mnesia:write(new_rec_lottery_result , Rec , write)
        end
    end ,
    case mnesia:transaction(F) of
        {atomic , _Val} ->
            true;
        Error ->
            ?ERROR_OUT("addToLotteryNotes roleID=~p, item=~p, error=~p" , [RoleID , Item , Error])
    end ,

    #itemCfg{name = ItemName} = getCfg:getCfgPStack(cfg_item , ItemID) ,
    playerMsg:sendErrorCodeMsg(?ErrorCode_LotterySuccessGetItem , [ItemName]) ,

    %% 广播
    case Brodcast of
        1 ->
            Text = stringCfg:getString(lotterysuccessitembrocast , [RoleName , ItemName , ItemNumber]) ,
            core:sendBroadcastNotice(Text) ,
            ok;
        _ ->
            skip
    end.


filterLotteryItem(_PondNum , [] , _Condition , ResultList) ->
    ResultList;
filterLotteryItem(PondNum , [Key2 | Left] , Condition , ResultList) ->
    New_ResultList = filterLotteryItem(PondNum , Key2 , Condition , ResultList) ,
    filterLotteryItem(PondNum , Left , Condition , New_ResultList);
filterLotteryItem(
    PondNum ,
    Key2 ,
    {PondGold , PondDiamond , SelfCount , #lotteryEveDay{allCount = ServerCount , destinyStar = DSList , itemTimes = ITimesList}} ,
    ResultList) ->
    R =                         #divineCfg{
        id                = ID ,
        need_onboard      = Star ,
        pool_times_perday = PT ,
        gold_open         = GO ,
        own_counts_open   = OO ,
        sever_counts_open = SO} = getCfg:getCfgByArgs(cfg_divine , PondNum , Key2) ,
    Condition1 = isSelfLotteryEnough(SelfCount , OO) ,
    Condition2 = isServerLotteryEnough(Condition1 , ServerCount , SO) ,
    Condition3 = isItemTimes(Condition2 , ID , ITimesList , PT) ,
    Condition4 = isCurDayStar(Condition3 , ID , Star , DSList) ,
    Condition5 = isPondMoneyEnough(Condition4 , GO , PondGold , PondDiamond) ,
    getFilterList(Condition5 , R , ResultList).

getFilterList(Condition , Rec , List) ->
    case get('GM_Appoint_Lottery_ItemOnlyID') of
        undefined ->
            case Condition of
                true -> [Rec | List];
                _ -> List
            end;
        {PondID , OnlyID} ->
            ?LOG_OUT("getFilterList, roleID=~p,~p,~p,Condition:~p,~p" , [playerState:getRoleID() , PondID , OnlyID , Condition , Rec]) ,
            [Rec | List]
    end.

%% 个人次数是否足够
isSelfLotteryEnough(SelfCount , NeedCount) -> SelfCount >= NeedCount.
%% 全服次数是否足够
isServerLotteryEnough(false , _ServerCount , _NeedCount) -> false;
isServerLotteryEnough(true , ServerCount , NeedCount)    -> ServerCount >= NeedCount.
%% 道具是否被抽完
isItemTimes(false , _ID , _Items , _PTime)              -> false;
isItemTimes(true , _ID , _Items , 0)                    -> false;
isItemTimes(true , _ID , _Items , PTime) when PTime < 0 -> true;
isItemTimes(true , ID , Items , PTime) ->
    case lists:keyfind(ID , 1 , Items) of
        {_ , Num} -> Num < PTime;
        _ -> true
    end.
%% 是否不是当天的命运主星
isCurDayStar(false , _ID , _Star , _StarList) -> false;
isCurDayStar(true , ID , 1 , StarList)        -> lists:keymember(ID , #destinyStar.onlyID , StarList);
isCurDayStar(true , _ID , _ , _StarList)      -> true.
%% 奖池是否达到额定标准
isPondMoneyEnough(false , _MoneyCondition , _PondCold , _PondDiamond) -> false;
isPondMoneyEnough(true , MoneyCondition , PondGold , PondDiamond) ->
    NeedGold = case lists:keyfind(?SundriesLotteryKey_GoldPond , 1 , MoneyCondition) of
                   {_ , V1} -> V1;
                   _ -> 0
               end ,
    NeedDiamond = case lists:keyfind(?SundriesLotteryKey_DiamondPond , 1 , MoneyCondition) of
                      {_ , V2} -> V2;
                      _ -> 0
                  end ,
    PondGold >= NeedGold andalso PondDiamond >= NeedDiamond.

getPondMoney(SubKey) ->
    case memDBCache:getSundriesValue(?Sundries_ID_Lottery , SubKey) of
        Value when erlang:is_integer(Value) andalso Value > 0 -> Value;
        _ -> 0
    end.

addGoldPond(Value) ->
    addPondMoney(Value , ?SundriesLotteryKey_GoldPond).

addDiamondPond(Value) ->
    addPondMoney(Value , ?SundriesLotteryKey_DiamondPond).

addPondMoney(Value , SubKey) ->
    Key = memDBCache:getSundriesKey(?Sundries_ID_Lottery , SubKey) ,
    F =
    fun() ->
        case mnesia:read(rec_sundries , Key , write) of
            [#rec_sundries{value = OldMoney}] ->
                New = addMoney(OldMoney , Value) ,
                Rec = memDBCache:getSundriesRec(?Sundries_ID_Lottery , SubKey , New) ,
                mnesia:write(rec_sundries , Rec , write) ,
                case mnesia:read(new_rec_sundries , Key , write) of
                    [#rec_sundries{}] ->
                        %% 更新插入表
                        mnesia:write(new_rec_sundries , Rec , write);
                    [] ->
                        %% 添加到更新表
                        mnesia:write(update_rec_sundries , Rec , write)
                end;
            [] ->
                New = addMoney(0 , Value) ,
                Rec = memDBCache:getSundriesRec(?Sundries_ID_Lottery , SubKey , New) ,
                mnesia:write(rec_sundries , Rec , write) ,
                mnesia:write(new_rec_sundries , Rec , write)
        end
    end ,
    case mnesia:transaction(F) of
        {atomic , _Val} ->
            true;
        Error ->
            ?ERROR_OUT("addPondMoney roleID=~p, value=~p, subkey=~p, error=~p" , [playerState:getRoleID() , Value , SubKey , Error])
    end ,
    ok.

addMoney(OldValue , AddValue) when erlang:is_integer(AddValue) andalso AddValue /= 0 ->
    %% 2的63次方-1 = ?PondMoneyMaxValue
    New = OldValue + AddValue ,
    if
        New =< 0 -> 0;
        New =< ?PondMoneyMaxValue -> New;
        true ->
            ?LOG_OUT("lottery money out:~p" , [New - ?PondMoneyMaxValue]) ,
            ?PondMoneyMaxValue
    end;
addMoney(OldValue , AddValue) ->
    ?ERROR_OUT("addMoney:~p,~p" , [OldValue , AddValue]) ,
    OldValue.

%% Param1:总列表
%% Param2:根据权重筛选出来的列表
%% Return1:减去筛选的后，剩余的列表
%% Return2:根据权重筛选出来的列表
getRandList(IsPond , List , ItemList) ->
    case get('GM_Appoint_Lottery_ItemOnlyID') of
        undefined ->
            getRandList2(IsPond , List , ItemList);
        {PondID , OnlyID} ->
            ?WARN_OUT("getRandList get gm onlyid:~p,IsPond=~p,PondID=~p,OnlyID=~p" , [playerState:getRoleID() , IsPond , PondID , OnlyID]) ,
            Ret =
            case IsPond of
                true ->
                    Key1List = getCfg:get1KeyList(cfg_divine) ,
                    case lists:member(PondID , Key1List) of
                        true ->
                            [Key2 | _] = getCfg:get2KeyList(cfg_divine , PondID) ,
                            Rec = getCfg:getCfgPStack(cfg_divine , PondID , Key2) ,
                            {lists:delete(Rec , List) , [Rec | ItemList]};
                        _ ->
                            ?ERROR_OUT("getRandList set gm onlyid,but not this id:~p,PondID=~p" , [playerState:getRoleID() , PondID]) ,
                            getRandList2(IsPond , List , ItemList)
                    end;
                _ ->
                    case lists:keyfind(OnlyID , #divineCfg.id , List) of
                        #divineCfg{} = Rec ->
                            {lists:delete(Rec , List) , [Rec | ItemList]};
                        _ ->
                            ?ERROR_OUT("getRandList set gm onlyid,but not this id:~p,OnlyID=~p" , [playerState:getRoleID() , OnlyID]) ,
                            getRandList2(IsPond , List , ItemList)
                    end
            end ,
            %% 移除指定
            erlang:erase('GM_Appoint_Lottery_ItemOnlyID') ,
            Ret
    end.

getRandList2(_IsPond , [] , ItemList) ->
    {[] , ItemList};
getRandList2(IsPond , [#divineCfg{} | _] = List , ItemList) ->
    %% 求总权重值
    QZ = getWeigthNumber(IsPond , List) ,
    %% 根据权重取一个范围
    Fun =
    fun(#divineCfg{id = ID , pool_weight = PW , item_weight = IW} , {All , AccList}) ->
        W =
        case IsPond of
            true -> PW;
            _ -> IW
        end ,
        case All =:= 0 of
            true ->
                {W , [{ID , 1 , W}]};
            _ ->
                F = All + 1 ,
                N = All + W ,
                {N , [{ID , F , N} | AccList]}
        end
    end ,
    {_ , LL} = lists:foldl(Fun , {0 , []} , List) ,
    %% 选出满足的范围
    Rand = misc:rand(1 , QZ) ,
    FunS =
    fun({_ID , F , N}) ->
        Rand >= F andalso Rand =< N
    end ,
    case lists:filter(FunS , LL) of
        [{ID , _ , _}] ->
            Rec = lists:keyfind(ID , #divineCfg.id , List) ,
            {lists:delete(Rec , List) , [Rec | ItemList]};
        _ ->
            ?ERROR_OUT("getRandList2:allQZ=~p,Rand=~p,List=~p" , [QZ , Rand , LL]) ,
            {List , ItemList}
    end.

getWeigthNumber(IsPond , List) ->
    Fun =
    fun(#divineCfg{pool_weight = PW , item_weight = IW} , Acc) ->
        W =
        case IsPond of
            true -> PW;
            _ -> IW
        end ,
        Acc + W
    end ,
    lists:foldl(Fun , 0 , List).

getSelfLottery(Number) ->
    RoleID = playerState:getRoleID() ,
    Sql = qlc:q([
                    #pk_LotteryNote{
                        roleID = RID,
                        roleName = playerNameUID:getPlayerNameByUID(RID),
                        itemID = IID,
                        itemNumber = INum,
                        isBind = ISB,
                        isServerNote = 0,
                        zbTime = ZBT
                    } ||
                    #rec_lottery_result{roleID = RID, itemID = IID, itemNumber = INum, isBind = ISB, zbTime = ZBT} <- mnesia:table(rec_lottery_result),
                    RID =:= RoleID]),
    L1 = edb:selectRecord(Sql) ,
    L2 = lists:keysort(#pk_LotteryNote.zbTime , L1) ,
    L3 = lists:reverse(L2) ,
    case erlang:length(L3) > Number of
        true ->
            lists:sublist(L3 , Number);
        _ ->
            L3
    end.

getServerLottery(Number) ->
    Sql = qlc:q([
                      #pk_LotteryNote{
                        roleID       = RID ,
                        roleName = playerNameUID:getPlayerNameByUID(RID) ,
                        itemID   = IID ,
                        itemNumber = INum ,
                        isBind     = ISB ,
                        isServerNote = 1 ,
                        zbTime       = ZBT
                    } ||
                    #rec_lottery_result{roleID = RID , itemID = IID , itemNumber = INum , isBind = ISB , isServerNote = IsServer , zbTime = ZBT} <- mnesia:table(rec_lottery_result) ,
                      IsServer =:= 1]) ,
    L1 = edb:selectRecord(Sql) ,
    L2 = lists:keysort(#pk_LotteryNote.zbTime , L1) ,
    L3 = lists:reverse(L2) ,
    case erlang:length(L3) > Number of
        true ->
            lists:sublist(L3 , Number);
        _ ->
            L3
    end.

%% 每日免费次数限制
getFreeLimitEverDay(IsGold) ->
    Value =
    case IsGold of
        true ->
            getCfg:getCfgPStack(cfg_globalsetup , divine_freegoldlimit);
        _ ->
            getCfg:getCfgPStack(cfg_globalsetup , divine_freediamondlimit)
    end ,
    case Value of
        #globalsetupCfg{setpara = [Number]} ->
            Number;
        _ ->
            ?Default_EveryDayFreeNumber
    end.


%%-----------------------------
gmRstCD() ->
    setRstTime(true , 0) ,
    setRstTime(false , 0).

gmRstDailyCount() ->
    playerDaily:zeroDailyCount(?DailyType_Lottery , ?DailySubType_Lottery_AllNumber) ,
    playerDaily:zeroDailyCount(?DailyType_Lottery , ?DailySubType_Lottery_GoldFreeNumber) ,
    playerDaily:zeroDailyCount(?DailyType_Lottery , ?DailySubType_Lottery_DiamondFreeNumber) ,
    playerDaily:zeroDailyCount(?DailyType_Lottery , ?DailySubType_Lottery_GoldTotalNumber) ,
    playerDaily:zeroDailyCount(?DailyType_Lottery , ?DailySubType_Lottery_DiamondTotalNumber).