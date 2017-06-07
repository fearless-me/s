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
-export([start_link/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3,handle_exception/3]).


start_link() ->
	myGenServer:start_link(?MODULE,[],[{timeout,?Start_Link_TimeOut_ms}]).

init([]) ->
	?LOG_OUT("~p init",[?MODULE]),

	%% 建立缓存ETS
	Ets = ets:new(?LogWriteCache, [private, duplicate_bag]),
	logDBCache:setCacheEts(Ets),

	libLogDB:initLogSavePrepare(),
	?LOG_OUT("~p init ok",[?MODULE]),
	{ok, {}}.

handle_call(_Request, _From, State) ->
    {noreply, State}.

handle_cast(_Msg, State) ->
    {noreply, State}.

handle_info({tick_saveCacheLog,_Msg}, State)->
	logDBCache:saveLog_Tick(),
	{noreply, State};

handle_info({MsgID,Msg}, State)->
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