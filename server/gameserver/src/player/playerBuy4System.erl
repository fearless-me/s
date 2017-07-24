%% @author zhengzhichun
%% @doc  playerBuy4System模块主要用来处理系统内程序本身用到的购买流程，这种流程与商城、npc商店相似，但又不能整合到这两个中，所以独立出了第三种程序内的系统购买
-module(playerBuy4System).
-include("playerPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([
	buy4System/2,
	buy/5
]).

%%系统内部购买
-spec buy4System(CostID::uint32(), Number::uint32()) ->ok.
buy4System(_CostID, _Number) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_SystemNotOpen),
	ok;
buy4System(CostID, Number) ->
	?DEBUG_OUT("buy4System  CostID~p  ,Number~p",[CostID,Number]),
	case getCfg:getCfgByArgs(cfg_cost,CostID) of
		#costCfg{itemid=ItemID,diamond=Gold,bind_diamond=BindGold,coinUseCode=CoinUseCode,itemSourceCode=ItemSourceCode} when Gold>0 andalso BindGold<0->
			CoinNum = erlang:round(Gold*Number),
			preShipments(?CoinTypeDiamond,CoinNum,ItemID,Number,ItemSourceCode,CoinUseCode);
		#costCfg{itemid=ItemID,diamond=Gold,bind_diamond=BindGold,coinUseCode=CoinUseCode,itemSourceCode=ItemSourceCode} when Gold<0 andalso BindGold>0->
			CoinNum = erlang:round(BindGold*Number),
			preShipments(?CoinTypeBindDiamond,CoinNum,ItemID,Number,ItemSourceCode,CoinUseCode);
		#costCfg{itemid=ItemID,diamond=Gold,bind_diamond=BindGold,coinUseCode=CoinUseCode,itemSourceCode=ItemSourceCode} when Gold>0 andalso BindGold==0->
			%%使用钻石币，优先使用绑定钻石币，绑定钻石币不足再使用非绑定钻石币
			CoinNum = erlang:round(Gold*Number),
			preShipments2(?CoinUseTypeDiamond,CoinNum,ItemID,Number,ItemSourceCode,CoinUseCode);
		_ ->
			?ERROR_OUT("buy4System coin conf err"),
			skip
	end,
	ok.


-spec preShipments(UseCoinType::uint32(),CoinNum::uint32(),ItemID::uint32(),NumberOrQuality::uint32(),GoodsSource::uint32(),CoinUseCode::uint32()) ->ok.
preShipments(UseCoinType,CoinNum,ItemID,NumberOrQuality,GoodsSource,CoinUseCode) ->
	{RealNumber,RealEquip} =
		case ItemID >= ?Item_Differentiate of
			true ->
				{1,NumberOrQuality};
			_ ->
				{NumberOrQuality,0}
		end,
	SF =
		fun() ->
			Plog = #recPLogTSItem{
				old = 0,
				new = RealNumber,
				change = RealNumber,
				target = ?PLogTS_PlayerSelf,
				source = ?PLogTS_Buy4System,
				gold = CoinNum,
				goldtype = UseCoinType,
				changReason = GoodsSource,
				reasonParam = CoinUseCode
			},
			case playerPackage:addGoodsAndMail(ItemID, RealNumber, true, RealEquip, Plog) of
				[] ->
					?ERROR_OUT("Shipments fail on addGoodsAndMail itemid[~w]roleid[~w]",[ItemID,playerState:getRoleID()]),
					false;
				_ ->
					true
			end
		end,

	case buy(UseCoinType,CoinNum,CoinUseCode,GoodsSource,SF) of
		true ->
			playerMsg:sendTipsErrorCodeMsg(?ErrorCode_BuyItemErrorNone);
		skip ->
			playerMsg:sendTipsErrorCodeMsg(?ErrorCode_BuyItemErrorNoWealth);
		_ ->
			skip
	end,
	ok.

%%扣钱并发货
%%ShipmentsFun()->boolean()为发货函数,发货成功返回true,失败false
%%DealState可为skip,false,true  分别表示扣款失败而未发货；发货失败；扣款成功，发货成功
-spec buy(UseCoinType,CoinNum,Reason,LogParam,ShipmentsFun) ->DealState::boolean()|skip when
	UseCoinType::uint32(),CoinNum::uint32(),Reason::uint32(),LogParam::integer()|string(),ShipmentsFun::fun().
buy(UseCoinType,CoinNum,Reason,LogParam,ShipmentsFun) when erlang:is_function(ShipmentsFun, 0) ->
	case playerState:getCoin(UseCoinType) >= CoinNum of
		true ->
			case playerMoney:decCoin(UseCoinType, CoinNum,
				#recPLogTSMoney{reason = Reason, param = LogParam, target = ?PLogTS_Buy4System, source = ?PLogTS_PlayerSelf}) of
				true ->
					case ShipmentsFun() of
						true ->
							true;
						_ ->
							%%发货失败，仅作日志
							?ERROR_OUT("ShipmentsFun failed on Buy, roleID[~w],decCoin[~p]",[playerState:getRoleID(),CoinNum]),
							false
					end;
				_ ->
					%%扣币失败
					?ERROR_OUT("use coin fail on buy"),
					skip
			end;
		false ->
			%%钱币不足
			?ERROR_OUT("coin not Enough"),
			skip
	end.


-spec preShipments2(UseCoinType::uint32(),CoinNum::uint32(),ItemID::uint32(),NumberOrQuality::uint32(),GoodsSource::uint32(),CoinUseCode::uint32()) ->ok.
preShipments2(UseCoinType,CoinNum,ItemID,NumberOrQuality,GoodsSource,CoinUseCode) ->
	{RealNumber,RealEquip} =
		case ItemID >= ?Item_Differentiate of
			true ->
				{1,NumberOrQuality};
			_ ->
				{NumberOrQuality,0}
		end,
	SF =
		fun() ->
			Plog = #recPLogTSItem{
				old = 0,
				new = RealNumber,
				change = RealNumber,
				target = ?PLogTS_PlayerSelf,
				source = ?PLogTS_Buy4System,
				gold = CoinNum,
				goldtype = UseCoinType,
				changReason = GoodsSource,
				reasonParam = CoinUseCode
			},
			case playerPackage:addGoodsAndMail(ItemID, RealNumber, true, RealEquip, Plog) of
				[] ->
					?ERROR_OUT("Shipments fail on addGoodsAndMail itemid[~w]roleid[~w]",[ItemID,playerState:getRoleID()]),
					false;
				_ ->
					true
			end
		end,

	case buy2(UseCoinType,CoinNum,CoinUseCode,GoodsSource,SF) of
		true ->
			playerMsg:sendTipsErrorCodeMsg(?ErrorCode_BuyItemErrorNone);
		skip ->
			playerMsg:sendTipsErrorCodeMsg(?ErrorCode_BuyItemErrorNoWealth);
		_ ->
			skip
	end,
	ok.

%%扣钱并发货
%%ShipmentsFun()->boolean()为发货函数,发货成功返回true,失败false
%%DealState可为skip,false,true  分别表示扣款失败而未发货；发货失败；扣款成功，发货成功
-spec buy2(UseCoinType,CoinNum,Reason,LogParam,ShipmentsFun) ->DealState::boolean()|skip when
	UseCoinType::uint32(),CoinNum::uint32(),Reason::uint32(),LogParam::integer()|string(),ShipmentsFun::fun().
buy2(UseCoinType,CoinNum,Reason,LogParam,ShipmentsFun) when erlang:is_function(ShipmentsFun, 0) ->
	case playerState:getCoin(?CoinTypeDiamond) >= CoinNum orelse playerState:getCoin(?CoinTypeBindDiamond) >= CoinNum of
		true ->
			case playerMoney:useCoin(UseCoinType, CoinNum,
				#recPLogTSMoney{reason = Reason, param = LogParam, target = ?PLogTS_Buy4System, source = ?PLogTS_PlayerSelf}) of
				true ->
					case ShipmentsFun() of
						true ->
							true;
						_ ->
							%%发货失败，仅作日志
							?ERROR_OUT("ShipmentsFun failed on Buy, roleID[~w],decCoin[~p]",[playerState:getRoleID(),CoinNum]),
							false
					end;
				_ ->
					%%扣币失败
					?ERROR_OUT("use coin fail on buy"),
					skip
			end;
		false ->
			%%钱币不足
			?ERROR_OUT("coin not Enough"),
			skip
	end.