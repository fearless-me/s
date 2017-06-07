%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2015, <公司>
%%% @doc
%%%
%%% @end
%%% Created : 17. 六月 2015 14:42
%%%-------------------------------------------------------------------

-module(playerOperateExchange).
-author("ZhongYuanWei").

-include("playerPrivate.hrl").

%% API
-export([
	exchange/1
]).

exchange(ExchangeID) ->
	Ret = case edb:readRecord(rec_operate_exchange,ExchangeID) of
		      [#rec_operate_exchange{
			      exchangeType = ExchangeType,
			      exchangeTarget = ExchangeArg,
			      exchangeNum = ExchangeNum,
			      limitCount = MaxCount,
			      require = RequireList,
			      startTime = ST,
			      endTime = ET
		      }] ->
			      RoleID = playerState:getRoleID(),
			      Count = case edb:readRecord(rec_operate_exchange_data,{RoleID,ExchangeID}) of
				              [#rec_operate_exchange_data{exchangeCount = C}] ->
					              C;
				              _ ->
					              0
			              end,
			      Ret1 = checkCount(Count,MaxCount),
			      Ret2 = checkIsInActivityTime(Ret1,ST,ET),
			      Ret3 = checkBagSpace(Ret2,ExchangeType,ExchangeArg,ExchangeNum),
			      Ret4 = checkRequire(Ret3,RequireList),
			      Ret5 = delExchangeGoods(Ret4,RequireList),
			      case doExchange(Ret5,ExchangeType,ExchangeArg,ExchangeNum) of
					  ok ->
						  Msg = #pk_GS2U_OperateExchangeAck{exchangeID = ExchangeID},
						  playerMsg:sendNetMsg(Msg),
						  addExchangeCount(RoleID,ExchangeID,Count),
						  ok;
					  Ret6 ->
						  Ret6
			      end;
		      _ ->
			      ?ErrorCode_ActExchange_No_Cfg
	      end,
	case Ret of
		ok ->
			?LOG_OUT("role:~p ~ts OperateExchange:~p ok",[playerState:getRoleID(),playerState:getName(),ExchangeID]),
			skip;
		_ ->
			?LOG_OUT("role:~p ~ts OperateExchange:~p failed:~p",[playerState:getRoleID(),playerState:getName(),ExchangeID,Ret]),
			playerMsg:sendErrorCodeMsg(Ret)
	end,
	ok.

checkCount(Count,MaxCount) when Count < MaxCount ->
	ok;
checkCount(_,_) ->
	?ErrorCode_ActExchange_OutOfCount.

checkIsInActivityTime(ok,ST,ET) ->
	NowTime = time:getSyncUTCTime1970FromDBS() - ?SECS_FROM_0_TO_1970,
	case NowTime >= ST andalso NowTime < ET of
		true ->
			ok;
		_ ->
			?ErrorCode_ActExchange_OutOfTime
	end;
checkIsInActivityTime(Ret,_,_) ->
	Ret.

checkBagSpace(ok,?OperateActExchangeType_Item,ItemID,ItemNum) ->
	{BagType,MaxPileNum} = case goods:getGoodsCfg(ItemID) of
		                       #itemCfg{itemType = ItemType,maxAmount = MPN} ->
			                       case ItemType of
				                       ?ItemTypeGem ->
					                       %%需要的是宝石
					                       {?Item_Location_Gem_Bag,MPN};
				                       _ ->
					                       %%需要的是普通道具
					                       {?Item_Location_Bag,MPN}
			                       end;
		                       #equipmentCfg{} ->
			                       {?Item_Location_Equip_Bag,1}
	                       end,
	SlotNum = playerPackage:getBagIdleSlotNum(BagType),
	Num = misc:ceil(ItemNum / MaxPileNum),
	case SlotNum >= Num of
		true ->
			ok;
		_ ->
			%%背包空间不足
			?ErrorCode_BuyItemErrorNoEmptyBag
	end;
checkBagSpace(ok,_,_,_) ->
	ok;
checkBagSpace(Ret,_,_,_) ->
	Ret.

checkRequire(Ret,[]) ->
	Ret;
checkRequire(Ret,[{ItemID,ItemNum} | T]) ->
	case goods:getGoodsCfg(ItemID) of
		#itemCfg{itemType = ItemType} ->
			BagType = case ItemType of
				          ?ItemTypeGem ->
					          %%需要的是宝石
					          ?Item_Location_Gem_Bag;
				          _ ->
					          %%需要的是普通道具
					          ?Item_Location_Bag
			          end,
			Num = playerPackage:getGoodsNumByID(BagType,ItemID),
			case Num < ItemNum of
				true ->
					?ErrorCode_ActExchange_ItemNotEnough;
				_ ->
					checkRequire(Ret,T)
			end;
		#equipmentCfg{} ->
			%%需要的是装备
			Num = playerPackage:getGoodsNumByID(?Item_Location_Equip_Bag,ItemID),
			case Num < ItemNum of
				true ->
					?ErrorCode_ActExchange_ItemNotEnough;
				_ ->
					checkRequire(Ret,T)
			end;
		_ ->
			%%未知道具
			?ErrorCode_ActExchange_ItemNotEnough
	end.

delExchangeGoods(ok,[]) ->
	ok;
delExchangeGoods(ok,[{ItemID,ItemNum} | T]) ->
	PLog = #recPLogTSItem{
		old = 0,
		new = 0,
		change = 0,
		target = ?PLogTS_OperateExchange,
		source = ?PLogTS_PlayerSelf,
		changReason = ?ItemDeleteReasonOperateExchange,
		reasonParam = ItemID,
		gold = 0,
		goldtype = 0
	},
	case goods:getGoodsCfg(ItemID) of
		#itemCfg{itemType = ItemType} ->
			BagType = case ItemType of
				          ?ItemTypeGem ->
					          %%需要的是宝石
					          ?Item_Location_Gem_Bag;
				          _ ->
					          %%需要的是普通道具
					          ?Item_Location_Bag
			          end,
			playerPackage:delGoodsByID(BagType,ItemID,ItemNum,PLog),
			delExchangeGoods(ok,T);
		#equipmentCfg{} ->
			%%需要的是装备
			playerPackage:delGoodsByID(?Item_Location_Equip_Bag,ItemID,ItemNum,PLog),
			delExchangeGoods(ok,T)
	end;
delExchangeGoods(Ret,_) ->
	Ret.

doExchange(ok,?OperateActExchangeType_Item,ItemID,ItemNum) ->
	%%兑换成道具
	PLog = #recPLogTSItem{
		old = 0,
		new = ItemNum,
		change = ItemNum,
		target = ?PLogTS_PlayerSelf,
		source = ?PLogTS_OperateExchange,
		changReason = ?ItemSourceOperateExchange,
		reasonParam = 0,
		gold = 0,
		goldtype = 0
	},
	playerPackage:addGoods(ItemID,ItemNum,false,0,PLog),
	ok;
doExchange(ok,?OperateActExchangeType_Coin,CoinType,CoinNum) ->
	PLog = #recPLogTSMoney{
		target = ?PLogTS_PlayerSelf,
		source = ?PLogTS_OperateExchange,
		reason = ?CoinSourceOperateExchange,
		param = CoinNum
	},
	playerMoney:addCoin(CoinType,CoinNum,PLog),
	ok;
doExchange(ok,?OperateActExchangeType_Custom,_,_) ->
	ok;
doExchange(Ret,_,_,_) ->
	Ret.

addExchangeCount(RoleID,ExchangeID,ExchangeCount) ->
	Key = {RoleID,ExchangeID},
	V = #rec_operate_exchange_data{roleID = Key,exchangeID = ExchangeID,exchangeCount = ExchangeCount + 1},
	edb:checkAndSave(rec_operate_exchange_data, Key, V, new_rec_operate_exchange_data, update_rec_operate_exchange_data).

