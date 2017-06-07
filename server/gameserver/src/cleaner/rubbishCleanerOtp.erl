%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. 十月 2016 17:13
%%%-------------------------------------------------------------------
-module(rubbishCleanerOtp).
-author("mwh").

-behaviour(myGenServer).

-include("rubbishCleanerPrivate.hrl").
%% ====================================================================
%% API functions
%% ====================================================================
-export([start_link/0]).

%% ====================================================================
%% callback functions
%% ====================================================================
-export([
	init/1,
	handle_call/3,
	handle_cast/2,
	handle_info/2,
	terminate/2,
	code_change/3,
	handle_exception/3
]).


%%%=================================================================================
start_link() ->
	myGenServer:start_link({local,?PsRubbishCleaner},?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

%%%=================================================================================
%%% callbacks
%%%=================================================================================

init([]) ->
	?LOG_OUT("init..."),

	?LOG_OUT("init ok"),
	{ok, #rcState{}}.

handle_call(Request, _From, State) ->
	?ERROR_OUT("Unhandle Request[~p]",[Request]),
	{noreply, State}.

handle_cast(_Msg, State) ->
	{noreply, State}.
handle_info({alreadyConnectDBServer, _Pid, _}, State)->
	rubbishCleanerLogic:init(),
	{noreply,State};
handle_info(tick,State) ->
	rubbishCleanerLogic:tick(),
	{noreply,State};
handle_info({loadRubbishRoleListAck, _Pid, DataList},State) ->
	rubbishCleanerLogic:initRubbishRoleListFromDB(DataList),
	{noreply,State};
handle_info({cleanRubbishRoleDataAck, _Pid, Data},State) ->
	rubbishCleanerLogic:onCleanRoleAck(Data),
	{noreply,State};
handle_info(Info,State) ->
	?ERROR_OUT("unhandle info:[~p] in [~p] [~p]",[Info,node(),self()]),
	{noreply,State}.

terminate(Reason, State) ->
	?LOG_OUT("terminate by[~p],State[~p]",[Reason,State]),
	ok.

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).




