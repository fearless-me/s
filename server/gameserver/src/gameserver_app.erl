%%%-------------------------------------------------------------------
%% @doc gameserver public API
%% @end
%%%-------------------------------------------------------------------

-module(gameserver_app).

-include("gsInc.hrl").

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
	try
		case gameserver_sup:start_link() of
			{ok,Pid1}->
				{ok,Pid1};
			Other->
				io:format("------------error ~p ~n",[Other]),
				{error,Other}
		end
	catch
		_:Why ->
			?ERROR_OUT( "Exception Why[~p]~n stack[~p]", [Why, erlang:get_stacktrace()] ),
			{error,Why}
	end.

%%--------------------------------------------------------------------
stop(State) ->
	?LOG_OUT("==============Game Server Stop!!! State:~p==============",[State]),
	case core:isCross() of
		true ->
			io:format("Stop CrossServer!!"),
			skip;
		_ ->
			?LOG_OUT("==============Game Server Stop!!! State:~p==============",[State]),
			io:format("application begin stop, state[~p]",[State]),
			psMgr:sendMsg2PS(?PsNameMain, stop_application, {}),
			io:format("application stop ok")
	end,
	ok.

%%====================================================================
%% Internal functions
%%====================================================================
