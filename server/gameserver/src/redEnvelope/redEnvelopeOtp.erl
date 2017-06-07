%%%-------------------------------------------------------------------
%%%红包功能
%%%-------------------------------------------------------------------
-module(redEnvelopeOtp).

-behaviour(myGenServer).

-include("setup.hrl").
-include("gsInc.hrl").
-include("redEnvelope.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([start_link/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3,handle_exception/3]).

start_link() ->
	myGenServer:start_link({local, ?PsNameRedEnvelope}, ?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).


init(_) ->
	ets:new(ets_redEnvelope1v1, [protected, named_table,{keypos, #rec_redEnvelopeSim.redUID},{read_concurrency,true}]),
	ets:new(ets_redEnvelope1vN, [protected, named_table,{keypos, #rec_redEnvelopeSim.redUID},{read_concurrency,true}]),
	ets:new(ets_redEnvelope, [protected, named_table, {keypos, #rec_redenvelope.redUID},{read_concurrency,true}]),
	ets:new(ets_redEnvelopeHistory, [protected, named_table, {keypos, #rec_redEnvelopeHistory.redUID},{read_concurrency,true}]),
	?LOG_OUT("[~p]init ok",[self()]),
	{ok,{}}.

handle_call(_Request, _From, State) ->
	{noreply, State}.

handle_cast(_Msg, State) ->
	{noreply, State}.

terminate(_Reason, _State) ->
	ok.

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).

%% 发一个红包
handle_info({'SendRedEnvelope', Pid, Data}, State) ->
	redEnvelopeLogic:newRedEnvelope(Pid, Data),
	{noreply, State};

%%抢红包
handle_info({'RobRedEnvelope', RobPlayerPid, Data}, State) ->
	redEnvelopeLogic:robRedEnvelope(RobPlayerPid,Data),
	{noreply, State};

%% 连上db了
handle_info({alreadyConnectDBServer, _Pid, _Msg}, State) ->
	gsSendMsg:sendMsg2DBServer(getRedEnvelopeData, 0, 0),
	{noreply, State};

%% 加载红包数据
handle_info({getRedEnvelopeDataAck, _Pid, Data}, State) ->
	redEnvelopeLogic:initRedEnvelopeData(Data),

	%% 返回加载成功
	gsSendMsg:sendMsg2PublicDataMgr(loadModuleDataAck, 0),

	%% 开启检查红包过期心跳
	erlang:send_after(?RED_TimeOut_Tick, self(), 'CheckRedEnvelopeTimeout'),
	{noreply, State};

handle_info('CheckRedEnvelopeTimeout', State) ->
	erlang:send_after(?RED_TimeOut_Tick, self(), 'CheckRedEnvelopeTimeout'),
	redEnvelopeLogic:checkRedEnvelope(),
	{noreply, State};

handle_info(Info, State) ->
	?ERROR_OUT("unhandle info:[~p] state[~p] in [~p] [~p,~p]",[Info,State,node(),?MODULE,self()]),
	{noreply,State}.