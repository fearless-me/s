%%%-------------------------------------------------------------------
%%% @author ly
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%% 首领入侵
%%% @end
%%% Created : 31. 五月 2017 17:06
%%%-------------------------------------------------------------------
-module(acWorldBossOtp).
-include("acWorldBossPrivate.hrl").
-author("ly").

-behaviour(myGenServer).

-include("gsInc.hrl").

%% API
-export([
    start_link/1,
    send2me/3
]).

%% gen_server callbacks
-export([init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3,
    handle_exception/3]).

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
    myGenServer:start_link({local, Name}, ?PsNameWorldBOss, [], [{timeout, ?Start_Link_TimeOut_ms}]).


-spec send2me(MsgID, FromPID, Msg) -> term() when
    MsgID :: term(), FromPID :: pid(), Msg :: tuple().
send2me(MsgID, FromPID, Msg) ->
    psMgr:sendMsg2PS(?PsNameWorldBOss, MsgID, FromPID, Msg).

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
    acWorldBossLogic:init(),
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

handle_call(Request, _From, State) ->
    ?LOG_OUT("~p ~p handle_call:~p", [?MODULE, self(), Request]),
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
handle_info({activityChangeCallBack, _Pid, {?ActivityType_GiveIPad, Phase}}, State) ->
	%% 先判断是否初始化
	case acWorldBossLogic:isOpen() of
		true ->
			acWorldBossLogic:activityChangeCallBack(Phase);
		_ ->
			skip
	end,
	{noreply,State};
%% 活动地图的消息接口
handle_info({activityMapMsg, _Pid, {MsgType, Data}}, State) ->
    ?DEBUG_OUT("activityMapMsg MsgType = ~p ", [MsgType]),
	case acWorldBossLogic:isOpen() of
		true ->
			acWorldBossLogic:activityMapMsg(MsgType, Data);
		_ ->
			skip
	end,
    {noreply,State};
%% -----------------------------------------------------------------------------------
handle_info(tick, State) ->
	acWorldBossLogic:tick(),
	{noreply, State};
handle_info(nextPhaseGo, State) ->
	acWorldBossLogic:nextPhaseGo(),
	{noreply, State};
handle_info(resetall, State) ->
	acWorldBossLogic:kickAll(),
	{noreply, State};
%% 其它业务逻辑接口（创建并进入地图）
%% -----------------------------------------------------------------------------------
handle_info({activityDataLoadAckCallBack, _Pid, _Data}, State) ->
	{noreply, State};
handle_info(Info, State) ->
    ?ERROR_OUT("unhandle info:[~p] in [~p] [~p,~p]",[Info,node(),?MODULE,self()]),
    {noreply,State}.

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


