%%%数据库日志操作进程

-module(logDBWorkerOtp).
-author(tiancheng).

-behaviour(myGenServer).

-include("mysql.hrl").
-include("setup.hrl").
-include("logger.hrl").
-include("logDBPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([start_link/1]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3, handle_exception/3]).


start_link(Index) ->
	RealName = "logDBWorkerOtp_Child_" ++ erlang:integer_to_list(Index),
	Atom = list_to_atom(RealName),
	myGenServer:start_link({local, Atom}, ?MODULE, [Atom], [{timeout,?Start_Link_TimeOut_ms}]).

init([Atom]) ->
	?LOG_OUT("~p ~p init",[?MODULE, Atom]),

	%% 建立缓存ETS
	%%　duplicate_bag　table中每一个key可以对应多个Value，并且允许Value重复
	%%　bag table中的每一个Value都是唯一，但是一个key可以对应多个Value
	Ets = ets:new(?LogWriteCache, [private, duplicate_bag]),
	logDBCache:setCacheEts(Ets),

	libLogDB:initLogSavePrepare(),
	?LOG_OUT("~p ~p init ok",[?MODULE, Atom]),
	{ok, {}}.

handle_call(_Request, _From, State) ->
    {noreply, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info({tick_saveCacheLog, _, _Msg}, State)->
	logDBCache:saveLog_Tick(),
	{noreply, State};

handle_info({MsgID, _Pid, Msg}, State)->
	dealLogMsg(MsgID,Msg),
	{noreply, State};

handle_info(Info, State)->
	?ERROR_OUT("unhandle info:[~p] in [~p] [~p,~p]",[Info,node(),?MODULE,self()]),
	{noreply,State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).

%% ====================================================================
%% Internal functions
%% ====================================================================
%%写log
dealLogMsg(MsgID,Msg)->
%%	?WARN_OUT("dealLogMsg:~p,~p", [MsgID, self()]),
	libLogDB:saveLog_main(MsgID, Msg),
	ok.