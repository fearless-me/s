%% Feel free to use, reuse and abuse the code in this file.

%% @private
-module(http_server_app).
-behaviour(application).
-include("gsInc.hrl").
%% API.
-export([start/2,start/0]).
-export([stop/1]).

%% API.
start() ->
	ok = application:start(ranch),
%%	ok = application:start(crypto),
	ok = application:start(cowlib),
	ok = application:start(cowboy),
	ok = application:start(http_server_app).

%% BI付款通知的回调地址：http://192.168.18.51:9009/pay/ums_pay_call_back
start(_Type, _Args) ->
	HttpPort = config:rpc_try_get_int("HttpServerPort", 9009),
	Dispatch = cowboy_router:compile([
		{'_', [
			{"/pay/ums_pay_call_back/", ums_pay_call_back_handler, []}
		]}
	]),
	{ok, _} = cowboy:start_http(http, 50, [{port, HttpPort}], [
		{env, [{dispatch, Dispatch}]}
	]),
	http_server_sup:start_link().

stop(_State) ->
	ok.
