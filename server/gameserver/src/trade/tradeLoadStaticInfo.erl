%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% 交易行加载静态数据模块
%%% @end
%%% Created : 10. 七月 2014 17:51
%%%-------------------------------------------------------------------
-module(tradeLoadStaticInfo).
-author("tiancheng").

-include("tradeDefine.hrl").

%% API
-export([
	saveTradeItemList/3
]).

%% 得到道具列表
saveTradeItemList(OrderID, ItemUID, ItemID) ->
	%% 获取静态数据
	StaticRec = case goods:getItemStaticMsg(ItemID) of
		            skip ->
			            ?ERROR_OUT("[~p] [~p,~p,~p] not found", [?MODULE, OrderID, ItemUID, ItemID]),
			            skip;
		            Rec ->
			            Rec#tradeItemStaticRec{orderID = OrderID, itemUID = ItemUID}
	            end,
	StaticRec.