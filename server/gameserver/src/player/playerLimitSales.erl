%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. 一月 2016 上午 10:32
%%%-------------------------------------------------------------------
-module(playerLimitSales).
-author("Administrator").
-include("playerPrivate.hrl").
-include("setupLang.hrl").
%% API
-export([onRequestPushInfo/0,
    onRequestBuyItem/1]).

%向ls请求，配置的推送商品折扣信息
onRequestPushInfo()->
    PushItems = case edb:readAllRecord(rec_limit_sales) of
        []-> [];
        ItemList ->
            lists:map(fun(Items)->
                Limit = Items#rec_limit_sales.limitSales - playerDaily:getDailyCounter(?DailyType_LimitSalesBuy,Items#rec_limit_sales.sku),
                #pk_pushItem{ sku = Items#rec_limit_sales.sku,
                    itemID = Items#rec_limit_sales.itemID,
                    num = Items#rec_limit_sales.num,
                    isBinded = Items#rec_limit_sales.isBinded,
                    price = Items#rec_limit_sales.price,
                    rebate = Items#rec_limit_sales.rebate,
                    coinType = ?CoinTypeDiamond,
                    limited = Limit
                }
                                  end,ItemList)
    end,
    Msg = #pk_GS2U_PushInfo{
        items = PushItems,
        startTime = time:getUTCNowSec(),
        endTime = time:getUTCNowSec()+86399
    },
    playerMsg:sendNetMsg(Msg),
    ok.

%%默认砖石购买
useDiamondToBuy(Sku)->
    case edb:readRecord(rec_limit_sales,Sku) of
        [#rec_limit_sales{itemID = ItemID,num = Number,isBinded = IsBinded,
            coinType = CoinType,price = Price,rebate = Rebate }]->

            RealPrice = erlang:trunc(Price * Rebate/100),

            _Coin = playerState:getCoin(CoinType),
            ?DEBUG_OUT("player coin ~p,",[_Coin]),
            case playerMoney:canUseCoin(?CoinUseTypeDiamond,RealPrice) of
                true->
                    Plog = #recPLogTSItem{
                        old = 0,
                        new = Number,
                        change = Number,
                        target = ?PLogTS_PlayerSelf,
                        source = ?PLogTS_LimitSales,
                        gold = 0,
                        goldtype = 0,
                        changReason = ?ItemSourceLimitSales,
                        reasonParam = 0
                    },
                    ItemUID = case playerPackage:addGoodsAndMail(ItemID, Number, isItemBinded(IsBinded), 0, Plog) of
                                  []-> ItemID;
                                  [AddItem | _]->
                                      case AddItem of
                                          #rec_item{itemUID=ItemUID2} ->
                                              ItemUID2;
                                          #recSaveEquip{itemUID=ItemUID2} ->
                                              ItemUID2
                                      end
                              end,
                    case ItemUID =/= ItemID of
                        true->
                            playerMoney:useCoin(?CoinUseTypeDiamond, RealPrice,
                                #recPLogTSMoney{reason=?CoinUseShop,
                                    param = ItemUID,target=?PLogTS_Shop,source=?PLogTS_PlayerSelf}),

                            playerDaily:incDailyCounter(?DailyType_LimitSalesBuy,Sku),
                            playerMsg:sendErrorCodeMsg(?ErrorCode_BuyItemErrorNone),
                            playerMsg:sendNetMsg(#pk_GS2U_BuyLimitedResult{ result = 0});
                        _ -> skip
                    end,
                    ok;
                _ ->
                    playerMsg:sendNetMsg(#pk_GS2U_BuyLimitedResult{ result = 1}),
                    playerMsg:sendErrorCodeMsg(?ErrorCode_BuyItemErrorNoWealth)
            end;
        _ ->
            skip
    end,
    ok.
%充值现金购买
useCashTobuy(_Sku)->

    ok.

onRequestBuyItem(Sku)->
    case canbuyItem(Sku) of
        true->
            case ?Cur_Lang of
                ?Lang_KOR->useCashTobuy(Sku);
                _ -> useDiamondToBuy(Sku)
            end,
            ok;
        _ -> skip
    end,
    ok.

isItemBinded(IsBinded)->
    IsBinded =:= 0.

canbuyItem(Sku)->
    case playerDaily:getDailyCounter(?DailyType_LimitSalesBuy,Sku) > 0 of
        true->
            playerMsg:sendNetMsg(#pk_GS2U_BuyLimitedResult{ result = 3}),
            false;
        _ ->
            case getOperateActiveCfg(Sku) of
                []->false;
                _ -> true
            end
    end.

getOperateActiveCfg(Sku)->
    case edb:readRecord(rec_limit_sales,Sku) of
        [#rec_limit_sales{} = Record]->
            Record;
        _ -> []
    end.

%%handle_info({getLimitSalesConfAck, _FromPid, {Result}}, State) ->
%%    Items = [#pk_pushItem{ sku = 1,itemID = 1831,num = 2,isBinded = 1,price = 400,
%%        rebate = 10,coinType = ?CoinTypeDiamond, limited = 1},
%%        #pk_pushItem{ sku = 2, itemID = 3025,num = 1, isBinded = 1,price = 200,
%%            rebate = 10,coinType = ?CoinTypeDiamond,limited = 1}],
%%    Msg = #pk_GS2U_PushInfo{
%%        items = Items,
%%        startTime = time:getLocalNowSec1970(),
%%        endTime = time:getLocalNowSec1970()+86399
%%    },
%%    playerMsg:sendNetMsg(Msg),
%%    {noreply, State};