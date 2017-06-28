%%%-------------------------------------------------------------------
%%% @author 温少飞
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. 十月 2016 15:43
%%%-------------------------------------------------------------------
-module(http_pay_call_back_logic).
-author("wenshaofei").
-include("gsInc.hrl").
%% -behaviour(httpd).
%% API
%% -export([do/1,load/2,store/2,remove/1,t/3]).
-export([
	send_payment_info_to_user/2,
	give_lost_recharge_to_user/3
]).

%%触发补单逻辑
give_lost_recharge_to_user(OrderID,PurchaseToken,RoleID)->
	GameID = config:getString("GameID", "165"),
	HttpPort = config:getString("HttpServerPort", "9009"),
	?LOG_OUT("recharge system give_lost_recharge_to_user begin===GameID:~p,OrderID:~p,PurchaseToken:~p~n",[GameID,OrderID,PurchaseToken]),
%%  PaymentVarifyUrl = config:rpc_get_string("PaymentVerifyUrl", "http://192.168.18.54:9009/pay/http_payment_handle:pay_call_back"),
	PaymentVarifyUrl = "http://127.0.0.1:"++HttpPort++"/pay/ums_pay_call_back",
	SendData = "game=" ++ GameID ++ "&order=" ++ binary_to_list( OrderID) ++ "&purchase_token=" ++binary_to_list(PurchaseToken) ++"&character_id="++erlang:integer_to_list(RoleID),
	R= misc:httpPost(PaymentVarifyUrl, SendData, 3),
	?LOG_OUT("recharge system  give_lost_recharge_to_user end===R:~p~n",[R]).

%%支付系统运行的超时时间
-define(RECHARGE_SYSTEM_RUN_TIME_OUT, 5000).

-define(UMS_STATE_SEND_ITEM_TO_USER, 4).    %%UMS状态标示，标示已经将货物发给了玩家

%%将支付订单完成的信息发给通知给用户
%%send_payment_info_to_user( OrderID, PurchaseToken) when is_binary(OrderID) ->
send_payment_info_to_user( OrderID, PurchaseToken) ->
	case req_payment_info(OrderID, PurchaseToken) of
		{ok, #rec_http_msg_recharge_info{status = ?UMS_STATE_SEND_ITEM_TO_USER}} ->
			{error,?RECHAEGE_ERROR_CODE_UMS_HTTP_MSG_ERROR_STATUS};
		{ok, ParseData} ->
			?PsNameRecharge!{<<"new_recharge_msg_coming">>, ParseData, self()},
			receive
				{ok, Info} ->
					?LOG_OUT("recharge pass,OrderID:~p,Info=~w", [OrderID, Info]),
					{ok, Info} ;
				{error, ?RECHAEGE_ERROR_CODE_HAD_PAY} ->
					?LOG_OUT("recharge fail,FailReason=~p", [{error,  ?RECHAEGE_ERROR_CODE_HAD_PAY}]),
					%%已支付给用户的订单一律返回success，让ums和游戏服务器内的状态保证一致
					{ok, <<"success">>};
				{error, ErrorCode} ->
					?LOG_OUT("recharge fail,FailReason=~p", [{error, ErrorCode}]),
					{error, ErrorCode};
				R ->
					?ERROR_OUT("recharge fail,uknow msg ========================~p", [R])
			after ?RECHARGE_SYSTEM_RUN_TIME_OUT ->
				?ERROR_OUT("recharge system time out,Info:~p", [ParseData]),
				{error,?RECHAEGE_ERROR_CODE_CALL_RECHARGE_TIME_OUT}
			end;
		ErrorInfo ->
			?ERROR_OUT("req_payment_info error ====ErrorInfo:~p~n", [ErrorInfo]),
			ErrorInfo
	end.

%%请求订单信息
req_payment_info( OrderID, PurchaseToken) ->
	PaymentVarifyUrl = config:getString("PaymentVerifyUrl", "http://mainaland.payment.raink.com.cn") ++ "/confirm/ordercheck",
	GameID = config:getString("GameID", "165"),
	SendData = "game=" ++ GameID ++ "&order=" ++ binary_to_list(OrderID) ++ "&purchase_token=" ++ binary_to_list(PurchaseToken),
	case misc:httpPost(PaymentVarifyUrl, SendData, 3) of
		{ok, Data} ->
			case rfc4627:decode(Data) of
				{ok, {obj, _KVlist} = ParseData, _} ->
					{ok, parse_ums_msg(ParseData,PurchaseToken)};
				FailReason ->
					?ERROR_OUT("recharge system decode http msg error FailReason:~p,Data:~p~n", [FailReason,Data]),
					{error, ?RECHAEGE_ERROR_CODE_DECODE_HTTP_MSG_ERROR}
			end;
		FailReason ->
			?ERROR_OUT("recharge system  http post fail when get bill info FailReason:~p", [FailReason]),
			{error, ?RECHAEGE_ERROR_CODE_HTTP_POST_EROOR_GET_ORDER_INFOR_FAIL}
	end.


%%解析ums发过来的消息
parse_ums_msg(RfcData,PurchaseToken)->
	{ok, Orderid} = rfc4627:get_field(RfcData, "orderid"),
	{ok,Amount} = rfc4627:get_field(RfcData, "amount"),
	{ok, Status} = rfc4627:get_field(RfcData, "status"),
	%OSBinStr = rfc4627:get_field(RfcData, "comments", <<"">>),
	Currency = rfc4627:get_field(RfcData, "currency", <<"">>),
	Category = rfc4627:get_field(RfcData, "category", <<"">>),
	ExecessAmount = rfc4627:get_field(RfcData, "excess_amount", 0),
	{ok, Price} = rfc4627:get_field(RfcData, "price"),
	{ok, Discount_price} = rfc4627:get_field(RfcData, "discount_price"),
	{ok, Currency_amount} = rfc4627:get_field(RfcData, "currency_amount"),
%%  赠送表达式，空字符串或字符串0时无赠送，
%%  数字字符串代表直接赠送游戏币的数量
%%  需赠送复杂内容时请咨询平台

	{ok,GiftBin} = rfc4627:get_field(RfcData, "gift"),
%%	{ok,ItemAmount} = rfc4627:get_field(RfcData, "item_amount"),
	{ok,Category} = rfc4627:get_field(RfcData, "category"),
	{ok,Server_id} = rfc4627:get_field(RfcData, "server_id"),
	{ok,Character_id} = rfc4627:get_field(RfcData, "character_id"),
	{ok,Item_id} = rfc4627:get_field(RfcData, "item_id"),
	ItemCodeBin= rfc4627:get_field(RfcData, "item_code", <<"">>),
	{ok,Comments} = rfc4627:get_field(RfcData, "comments"),
	{ok,Fgi} = rfc4627:get_field(RfcData, "fgi"),
	{ok,Provider_orderid} = rfc4627:get_field(RfcData, "provider_orderid"),
	{ok,Excess_money} = rfc4627:get_field(RfcData, "excess_money"),
	{ok,Sandbox} = rfc4627:get_field(RfcData, "sandbox"),
	{ok,Createtime} = rfc4627:get_field(RfcData, "createtime"),

	%%ums发送过来的支付消息
	#rec_http_msg_recharge_info{
		game= config:getString("GameID", "165"),%%游戏ID
		price=binary_to_float(Price),%%商品原价
		discount_price=binary_to_float(Discount_price),%%商品折后价
		currency_amount= erlang:binary_to_float(Currency_amount),%%实际付款总金额
		currency=Currency,%%实付币种 RMB,KER,USD,TWD,VND,…
		amount=erlang:float(Amount),%%商品应发游戏币数量
		gift=GiftBin,%%赠送表达式，空字符串或字符串0时无赠送，
%%		item_amount=ItemAmount,%%购买商品的数量，通常为1
		item_amount=1,%%购买商品的数量，通常为1
		category=Category,%%商品类型：cash元宝/props道具/packs礼包/…
		server_id=Server_id,%%区服编号
		character_id=erlang:binary_to_integer(Character_id),%%角色编号
%%    character_id=144293574173786121,%%角色编号
		status=Status,%%订单状态： 1已支付/4已发货
		orderid=Orderid,%%平台订单号(相同订单号不可重复发货)
%%		item_id=erlang:binary_to_integer(Item_id),%%	游戏CP约定商品ID
		item_id=Item_id,%%	游戏CP约定商品ID
		item_code= ItemCodeBin,%%商品自定义参数表达式
		comments=Comments,%%透传参数，SDK发起订单时填写
		fgi=Fgi,%%渠道ID（同一个渠道出多个包时会不同）
		provider_orderid=Provider_orderid,%%第三方渠道订单号
		excess_money=erlang:binary_to_float(Excess_money),%%实际付款总金额当中的超出商品折后价的溢缴金额
		excess_amount=ExecessAmount,%%溢缴款按默认兑换比例换算成的游戏币
		sandbox=Sandbox,%%是否沙箱测试订单：0非沙箱/1沙箱
		createtime=Createtime,%%订单创建时间
		purchasetoken=PurchaseToken %%向ums获取订单信息的token
	}.
