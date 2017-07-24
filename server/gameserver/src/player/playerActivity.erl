%%%-------------------------------------------------------------------
%%% @author liuyan
%%% @copyright (C) 2017, <COMPANY>
%%% @doc 玩家活动副本
%%%
%%% @end
%%% Created : 26. 四月 2017 10:16
%%%-------------------------------------------------------------------
-module(playerActivity).
-author("liuyan").
-include("playerPrivate.hrl").

%% API
-export([
	init/0,
	buyActionCount/1,
	inspire/1
]).

%%%-------------------------------------------------------------------
% 上线初始化
-spec init() -> no_return().
init() ->
	%% 向跨服查询自己的报名情况
	core:sendMsgToActivityMgrCross(cac_query, playerState:getRoleID()).

%%购买进入副本次数(普通副本和活动副本)
buyActionCount(CopyMapID) ->
    #mapsettingCfg{type = Type, subtype = Subtype, daily_entercount_group = Daily_entercount_group, buytime = Buytime, buycost = Buycost, daily_entercount=Daily_entercount} = getCfg:getCfgPStack(cfg_mapsetting, CopyMapID),
    Result =
        case checkType(Type, Subtype, Daily_entercount) of %%检查类型是否正确
            true ->
                %% 已经购买的副本次数
                BuyNum = case Daily_entercount_group of
                             0 ->
                                 playerDaily:getDailyCounter(?DailyType_BuyCopyMap_Number, CopyMapID);
                             V ->
                                 playerDaily:getDailyCounter(?DailyType_BuyCopyMapGroup_Number, V)
                         end,
                %%检查次数是否超上限
                case checkBuyNumber(BuyNum, Buytime) of
                    true ->
                        Value = misc:getListValue(BuyNum + 1, lists:reverse(Buycost)),
                        case canUseCoin(Value,?CoinUseTypeDiamond) of
                            true ->
                                %%扣除钻石并增加购买次数
                                case playerMoney:useCoin(?CoinUseTypeDiamond, Value, #recPLogTSMoney{reason = ?CoinBuyActionCount, param = 0, target = ?PLogTS_BuyActionCount, source = ?PLogTS_PlayerSelf}) of
                                    true ->
                                        case Daily_entercount_group of
                                            0 ->
                                                skip;
                                            GroupId ->
                                                playerDaily:incDailyCounter(?DailyType_BuyCopyMapGroup_Number, GroupId)
                                        end,
                                        playerDaily:incDailyCounter(?DailyType_BuyCopyMap_Number, CopyMapID),
                                        ok;
                                    _Err1 ->
                                        ?ErrorCode_TradeDiamond
                                end;
                            Err2 ->
                                Err2
                        end;
                    Err3 ->
                        Err3
                end;
            Err4 ->
                Err4
        end,
    case Result of
        ok ->
            ok;
        Err ->
            playerMsg:sendErrorCodeMsg(Err)
    end.

%%首领入侵 鼓舞
inspire(UseCoinType) ->
    %%判断该类型鼓舞次数是否用完
    TypeList = activityCommon:getCompleteValue(worldboss_buyattack),
    Result =
        case lists:keyfind(UseCoinType,1,TypeList) of
            {UseCoinType,Cost,Nums} ->
                InspireNum = playerDaily:getDailyCounter(?DailyType_WorldBossInSpire, UseCoinType),
                case InspireNum < Nums of
                    true->
                        %%判断货币是否足够
                        case canUseCoin(Cost,UseCoinType) of
                            true ->
                                %%扣钱，增加鼓舞次数，增加BUFF
                                case playerMoney:useCoin(UseCoinType, Cost, #recPLogTSMoney{reason = ?CoinUseWorldBossInspire, param = 0, target = ?PLogTS_Activity_Boss, source = ?PLogTS_PlayerSelf}) of
                                    true ->
                                        playerDaily:incDailyCounter(?DailyType_WorldBossInSpire, UseCoinType),
                                        playerBuff:addBuff(?WoldBossInspire, playerState:getLevel()),
                                        ok;
                                    _Err1 ->
                                        ?ErrorCode_Activety_Coin_Not_Enough
                                end;
                            _ ->
                                ?ErrorCode_Activety_Coin_Not_Enough
                        end;
                    _ ->
                        ?ErrorCode_World_Boss_Inspire_Type_Max
                end;
            _ ->
                ?ERROR_OUT("worldboss inspire UseCoinType not :~p,~p", [UseCoinType, TypeList]),
                ok
        end,
    case Result of
        ok ->
            ok;
        Err ->
            playerMsg:sendErrorCodeMsg(Err)
    end.

%% 判断副本类型，是否为可购买次数的副本类型
checkType(Type, _SubType, Daily_entercount) ->
    if Daily_entercount=:=9999 ->
        ?ErrorCode_CopyMap_Can_Not_Buy_Count;
        true ->
            case Type of
                ?MapTypeCopyMap ->
                    true;
                ?MapTypeActivity ->
                    true;
                true ->
                    ?ErrorCode_CopyMap_Can_Not_Buy_Count
            end
    end.

%% 判断购买次数是否超上限
checkBuyNumber(BuyNum, Buytime) ->
    if BuyNum < Buytime ->
        true;
        true ->
            ?ErrorCode_CopyMap_Buy_Max
    end.

%% 判断货币是否足够
canUseCoin(Value,UseCoinType) ->
    if Value > 0 ->
        case playerMoney:canUseCoin(UseCoinType, Value) of
            true ->
                true;
            _ ->
                ?ErrorCode_Activety_Coin_Not_Enough
        end;
        true ->
            ?ErrorCode_CopyMap_Cfg_Error
    end.