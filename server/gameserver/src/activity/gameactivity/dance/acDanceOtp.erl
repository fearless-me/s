%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%%
%%% @end
%%% Created : 08. 六月 2017 19:42
%%%-------------------------------------------------------------------
-module(acDanceOtp).
-author(tiancheng).

-include("../../activityPrivate.hrl").
-include("acDancePrivate.hrl").

-behaviour(myGenServer).

%% API
-export([start_link/1]).

%% gen_server callbacks
-export([
	init/1,
	handle_call/3,
	handle_cast/2,
	handle_info/2,
	terminate/2,
	code_change/3,
	handle_exception/3
]).

-define(SERVER, ?MODULE).

-record(state, {}).

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the server
%%
%% @end
%%--------------------------------------------------------------------
start_link(Name) ->
	myGenServer:start_link({local,Name}, ?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Initializes the server
%%
%% @spec init(Args) -> {ok, State} |
%%                     {ok, State, Timeout} |
%%                     ignore |
%%                     {stop, Reason}
%% @end
%%--------------------------------------------------------------------
-spec(init(Args :: term()) ->
	{ok, State :: #state{}} | {ok, State :: #state{}, timeout() | hibernate} |
	{stop, Reason :: term()} | ignore).
init([]) ->
	{ok, #state{}}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling call messages
%%
%% @end
%%--------------------------------------------------------------------
-spec(handle_call(Request :: term(), From :: {pid(), Tag :: term()},
	State :: #state{}) ->
	{reply, Reply :: term(), NewState :: #state{}} |
	{reply, Reply :: term(), NewState :: #state{}, timeout() | hibernate} |
	{noreply, NewState :: #state{}} |
	{noreply, NewState :: #state{}, timeout() | hibernate} |
	{stop, Reason :: term(), Reply :: term(), NewState :: #state{}} |
	{stop, Reason :: term(), NewState :: #state{}}).
handle_call(_Request, _From, State) ->
	{reply, ok, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling cast messages
%%
%% @end
%%--------------------------------------------------------------------
-spec(handle_cast(Request :: term(), State :: #state{}) ->
	{noreply, NewState :: #state{}} |
	{noreply, NewState :: #state{}, timeout() | hibernate} |
	{stop, Reason :: term(), NewState :: #state{}}).
handle_cast(_Request, State) ->
	{noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling all non call/cast messages
%%
%% @spec handle_info(Info, State) -> {noreply, State} |
%%                                   {noreply, State, Timeout} |
%%                                   {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
-spec(handle_info(Info :: timeout() | term(), State :: #state{}) ->
	{noreply, NewState :: #state{}} |
	{noreply, NewState :: #state{}, timeout() | hibernate} |
	{stop, Reason :: term(), NewState :: #state{}}).
%% 主活动模块给出的回调
handle_info({activityChangeCallBack, _Pid, {?ActivityType_Dance, Phase}}, State) ->
	acDanceLogic:activityChangeCallBack(Phase),
	{noreply,State};

%% 活动地图的消息接口
handle_info({activityMapMsg, _Pid, {MsgType, Data}}, State) ->
	acDanceLogic:activityMapMsg(MsgType, Data),
	{noreply,State};

handle_info({activityDataLoadAckCallBack, _Pid, _Data}, State) ->
	{noreply, State};

handle_info(dance_tick, State) ->
	acDanceLogic:dance_tick(),
	{noreply, State};

handle_info({applyDance, _Pid, Data}, State) ->
	acDanceLogic:applyDance(Data),
	{noreply, State};
handle_info({inDanceArea, _Pid, Data}, State) ->
	acDanceLogic:inDanceArea(Data),
	{noreply, State};
handle_info({selectDanceID, _Pid, Data}, State) ->
	acDanceLogic:selectDanceID(Data),
	{noreply, State};
handle_info({breakDance, _Pid, Data}, State) ->
	acDanceLogic:breakDance(Data),
	{noreply, State};
handle_info({leaveDanceMap, _Pid, Data}, State) ->
	acDanceLogic:leaveDanceMap(Data),
	{noreply, State};

handle_info(_Info, State) ->
	{noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
%%
%% @spec terminate(Reason, State) -> void()
%% @end
%%--------------------------------------------------------------------
-spec(terminate(Reason :: (normal | shutdown | {shutdown, term()} | term()),
	State :: #state{}) -> term()).
terminate(_Reason, _State) ->
	ok.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Convert process state when code is changed
%%
%% @spec code_change(OldVsn, State, Extra) -> {ok, NewState}
%% @end
%%--------------------------------------------------------------------
-spec(code_change(OldVsn :: term() | {down, term()}, State :: #state{},
	Extra :: term()) ->
	{ok, NewState :: #state{}} | {error, Reason :: term()}).
code_change(_OldVsn, State, _Extra) ->
	{ok, State}.

handle_exception(Type, Why, State) ->
	myGenServer:default_handle_excetion(Type, Why, State).
%%%===================================================================
%%% Internal functions
%%%===================================================================
