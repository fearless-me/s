%% Feel free to use, reuse and abuse the code in this file.

%% @doc POST echo handler.
-module(ums_pay_call_back_handler).

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

-include("gsInc.hrl").

init(_Transport, Req, []) ->
	{ok, Req, undefined}.

handle(Req, State) ->
	{ok, KeyVList, Req2} = cowboy_req:body_qs(Req),
	try
		{_, OrderID} = lists:keyfind(<<"order">>, 1, KeyVList),
		{_, PurchaseToken} = lists:keyfind(<<"purchase_token">>, 1, KeyVList),
		case http_pay_call_back_logic:send_payment_info_to_user(OrderID, PurchaseToken) of
			{ok, Data} ->
				?LOG_OUT("get paymentInfo success,orderID:~p, Reason=~p~n", [OrderID, Data]),
				response_data(<<"success">>, Req2);
			{error, ErrorCode} ->
				?ERROR_OUT("get paymentInfo error bill had pay to user,Reason=~p~n", [ErrorCode]),
				ErrorCodeBin = integer_to_binary(ErrorCode),
				response_data(<<<<"fail,error_code=">>/binary, ErrorCodeBin/binary>>, Req2)
		end
	catch
		ExceptionType:ExceptionReason ->
			?ERROR_OUT("run recharge pay_call_back error,ErrorType:~p,ErrorInfo:~p,stack:~p~n", [ExceptionType, ExceptionReason, erlang:get_stacktrace()])
	end,
	{ok, Req, State}.

response_data(Data, Req) ->
	cowboy_req:reply(200, [
		{<<"content-type">>, <<"text/plain; charset=utf-8">>}
	], Data, Req).

terminate(_Reason, _Req, _State) ->
	ok.
