%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 23. 四月 2015 10:20
%%%-------------------------------------------------------------------
-module(dbMemCacheInit).
-author("tiancheng").

-include("dbsInc.hrl").

%% API
-export([
	init/0,
	initTradeItemData/1,
	initMailItemData/1
]).

%% 数据初始化
-spec init() -> ok.
init() ->
	?LOG_OUT("dbMemCacheInit..."),
	dbMemCacheCommon:getGuardMirror(),
	dbMemCacheCommon:getGuardMirrorRank(),
	?LOG_OUT("dbMemCacheInit OK"),
	ok.


%% 交易行中道具数据初始化
-spec initTradeItemData([] | #trade{} | [#trade{},...]) -> ok.
initTradeItemData([]) ->
	ok;
initTradeItemData(#trade{itemUID = ItemUID}) ->
	dbMemCacheCommon:getItemByItemUID(ItemUID),
	ok;
initTradeItemData([#trade{} = Trade|TradeList]) ->
	initTradeItemData(Trade),
	initTradeItemData(TradeList).

%% 邮件附件中的道具数据初始化(这里暂不考虑过期邮件的附件)
initMailItemData([]) ->
	ok;
initMailItemData(#recMailAttachMent{mtype = MType, mvalue = MValue}) ->
	case MType =:= 0 of
		true -> dbMemCacheCommon:getItemByItemUID(MValue);
		_ -> skip
	end,
	ok;
initMailItemData([#recMailAttachMent{} = Attach | List]) ->
	initMailItemData(Attach),
	initMailItemData(List).

