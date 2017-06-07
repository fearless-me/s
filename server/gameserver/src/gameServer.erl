%%%为方便启动用的模块

-module(gameServer).
-include("gsInc.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([
	start/0,
	stop/0,
	kickplayer/0,
	stop_real/0
]).

%% 启动应用
start() ->
	try
	    case application:start(gameserver) of
	        ok ->
	            ok;
	        Msg ->
	            io:format( "appliction gameserver start failed Why[~p]~n stack[~p]",
						[Msg, erlang:get_stacktrace()] )
	    end
	catch
		_:Why ->
			io:format( "Exception Why[~p]~n stack[~p]",
						[Why, erlang:get_stacktrace()] )
	end.

stop() ->
	io:format("game server  recv stop!~n"),

	%% 进入关服流程
	psMgr:sendMsg2PS(dbMainPID, stop_server_Msg_Import, 0),

	whereis(dbMainPID).

%% 关闭应用
stop_real() ->
	case application:stop(gameserver) of
		ok ->
			io:format("game server stop ok~n"),
			ok;
		Msg ->
			io:format("Stop: ~p~n",[{failure, Msg}])
	end,
	erlang:halt(0,[{flush,false}]).

%% 踢人
kickplayer() ->
	%% 打印日志
	io:format("game server recv kick player msg~n"),

	%% 发送踢人消息
%%	erlang:send(?PsNameLS, stopWill),
	psMgr:sendMsg2PS(?PsNamePlayerMgr, gs2MinuteStop, {120}),
	ok.