%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2017, raink
%%% @doc
%%% 跨服骑宠竞速_进程模块
%%% @end
%%% Created : 20170906
%%%-------------------------------------------------------------------
-module(cacRaceOtp).
-author("meitianyang").

-include("cacRacePrivate.hrl").

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
-spec(start_link(Name :: term()) ->
	{ok, Pid :: pid()} | ignore | {error, Reason :: term()}).
start_link(Name) ->
	myGenServer:start_link({local, Name}, ?MODULE, [], [{timeout, ?Start_Link_TimeOut_ms}]).

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
	?LOG_OUT("~p ~p init OK",[?MODULE, self()]),
	cacRaceLogic:init(),
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

%% 系统回调接口
%%--------------------------------------------------------------------

%% 进程初始化消息
handle_info({activityDataLoadAckCallBack, _Pid, _}, State) ->
	{noreply,State};

%% 主活动模块给出的回调
handle_info({activityChangeCallBack, _Pid, {?ActivityType_CrossRace, Phase}}, State) ->
	cacRaceLogic:activityChangeCallBack(Phase),
	{noreply,State};

%% 活动地图的消息接口
handle_info({activityMapMsg, _Pid, Msg}, State) ->
	cacRaceLogic:activityMapMsg(Msg),
	{noreply,State};

%% 地图工作者进程创建成功
handle_info({createActivityMapAck, _Pid, Msg}, State) ->
	cacRaceLogic:createActivityMapAck(Msg),
	{noreply,State};

%% 计时器接口
%% -----------------------------------------------------------------------------------

handle_info(tick, State) ->
	cacRaceLogic:tick(),
	{noreply,State};

%% 其它业务逻辑接口
%% -----------------------------------------------------------------------------------

%% 采集
handle_info({race_gather, _FromPid, Msg}, State) ->
	cacRaceLogic:gather(Msg),
	{noreply, State};

%% 使用道具
handle_info({race_item, _FromPid, Msg}, State) ->
	cacRaceLogic:item(Msg),
	{noreply, State};

%% 弃赛
handle_info({race_giveUp, _FromPid, Msg}, State) ->
	cacRaceLogic:giveUp(Msg),
	{noreply, State};

%% 询问下一场活动的模式
handle_info({race_mod, FromPid, _Msg}, State) ->
	{Mod, _} = cacRaceState:getMod(),
	psMgr:sendMsg2PS(FromPid, race_mod, Mod),
	{noreply, State};

handle_info(Info, State) ->
	?ERROR_OUT("~p ~p recv undefined msg:~p", [?MODULE, self(), Info]),
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
	State :: #state{}) ->
	term()).
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

