%%%数据库操作进程

-module(dbOtp).
-author(zhongyuanwei).

-behaviour(myGenServer).

-include("dbPrivate.hrl").


%% ====================================================================
%% API functions
%% ====================================================================
-export([start_link/2]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3,handle_exception/3]).


start_link(PoolType, Index) ->
%%	RealName = io_lib:format("dbOtp_Child_~p_~p", [PoolType, Index]),
	RealName = "dbOtp_Child_" ++ atom_to_list(PoolType) ++ "_" ++ integer_to_list(Index),
	Atom = list_to_atom(RealName),
	myGenServer:start_link({local, Atom}, ?MODULE, [Atom], [{timeout,?Start_Link_TimeOut_ms}]).

init([Atom]) ->
	?LOG_OUT("~p ~p init", [?MODULE, Atom]),
	libDB:initPrepare(),
	?LOG_OUT("~p ~p init ok", [?MODULE, Atom]),
	{ok, {}}.

handle_call(Info, _From, State) ->
	?ERROR_OUT("~p,~p,~p call ret ok", [?MODULE, self(), Info]),
	{reply, ok, State}.

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





