%%%数据库操作进程

-module(dbOtp).
-author(zhongyuanwei).

-behaviour(myGenServer).

-include("dbPrivate.hrl").


%% ====================================================================
%% API functions
%% ====================================================================
-export([
		start_link/0
		]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3,handle_exception/3]).


start_link() ->
	myGenServer:start_link(?MODULE,[],[{timeout,?Start_Link_TimeOut_ms}]).

init([]) ->
	?LOG_OUT("~p init",[?MODULE]),
	libDB:initPrepare(),
	?LOG_OUT("~p init ok",[?MODULE]),
	{ok, {}}.

handle_call(Info, _From, State) ->
	?ERROR_OUT("~p,~p,~p call ret ok", [?MODULE, self(), Info]),
	{reply, ok, State}.
%%    {noreply, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info(Info, State)->
	dbMsg:handle_msg(Info,State).

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).

%% ====================================================================
%% Internal functions
%% ====================================================================





