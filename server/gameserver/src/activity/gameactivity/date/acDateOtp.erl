%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%% 活动模块进程
%%% 约会地下城（活动）
%%% @end
%%% Created : 20161202
%%%-------------------------------------------------------------------
-module(acDateOtp).
-author("meitianyang").

-include("acDatePrivate.hrl").

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
	myGenServer:start_link({local,Name}, ?PsNameDate, [], [{timeout,?Start_Link_TimeOut_ms}]).

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
	%% 一次性初始化
	case acDateState:getInit() of
		false ->
			acDateLogic:init();
		_ ->
			skip
	end,
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
handle_info({activityDataLoadAckCallBack, _Pid, []}, State) ->
	{noreply,State};

%% 主活动模块给出的回调
handle_info({activityChangeCallBack, _Pid, {?ActivityType_Date, Phase}}, State) ->
	%?DEBUG_OUT("[DebugForDate] activityChangeCallBack ~p", [Phase]),
	%% 回调响应
	acDateLogic:activityChangeCallBack(Phase),
	{noreply,State};

%% 活动地图的消息接口
handle_info({activityMapMsg, _Pid, {MsgType, Data}}, State) ->
	%?DEBUG_OUT("[DebugForDate] activityMapMsg ~p", [{MsgType, Data}]),
	acDateLogic:activityMapMsg(MsgType, Data),
	{noreply,State};

%% 地图工作者进程创建成功
handle_info({createActivityMapAck, _Pid, Msg}, State) ->
	%?DEBUG_OUT("[DebugForDate] createActivityMapAck ~p", [Msg]),
	acDateLogic:createActivityMapAck(Msg),
	{noreply,State};

%% 创建对象反馈消息
handle_info({?MsgTypeSpawnAck, Pid, Msg}, State) ->
	%?DEBUG_OUT("[DebugForDate] ?MsgTypeSpawnAck ~p", [Msg]),
	acDateLogic:spawnObjectAck(Pid, Msg),
	{noreply,State};

%% 解除好友关系处理
handle_info({date_breakFriend, _Pid, Msg}, State) ->
	%?DEBUG_OUT("[DebugForDate] date_breakFriend ~p", [Msg]),
	acDateLogic:breakRole(Msg),
	{noreply,State};

%% 删除角色处理
handle_info({date_deleteRole, _Pid, Msg}, State) ->
	%?DEBUG_OUT("[DebugForDate] date_deleteRole ~p", [Msg]),
	acDateLogic:deleteRole(Msg),
	{noreply,State};


%%% 怪物被攻击
%handle_info({fastrack_MonsterBeAttacked, _Pid, Msg}, State) ->
%	{noreply,State};
%
%%% 对象被创建被攻击
%handle_info({fastrack_spwan_success, _Pid, Msg}, State) ->
%	{noreply,State};

%% 定时器接口
%% -----------------------------------------------------------------------------------

%% 主计时器响应
handle_info({?MsgTypeTimerMain, MapPid, ExParam}, State) ->
	%?DEBUG_OUT("[DebugForDate] ?MsgTypeTimerMain ~p", [ExParam]),
	acDateLogic:onTimerMain(MapPid, ExParam),
	{noreply,State};

%% 秒级心跳响应
handle_info(?MsgTypeTimerTick, State) ->
	%?DEBUG_OUT("[DebugForDate] ?MsgTypeTimerMain ~p", [ExParam]),
	acDateLogic:onTimerTick(),
	{noreply,State};

%% 数据库反馈接口
%% -----------------------------------------------------------------------------------

%% 其它业务逻辑接口（创建并进入地图）
%% -----------------------------------------------------------------------------------

%% 尝试进入活动地图
handle_info({date_enterTry, Pid, Msg}, State) ->
	%?DEBUG_OUT("[DebugForDate] date_enterTry Msg(~p)", [Msg]),
	acDateLogic:enterTry(Pid, Msg),
	{noreply,State};

%% 尝试创建活动地图
handle_info({date_enterCreate, _Pid, Msg}, State) ->
	%?DEBUG_OUT("[DebugForDate] date_enterCreate Msg(~p)", [Msg]),
	acDateLogic:enterCreate(Msg),
	{noreply,State};

%% 其它业务逻辑接口（消除玩法）
%% -----------------------------------------------------------------------------------

%% 连接的选中与取消
handle_info({date_link_link, Pid, Msg}, State) ->
	%?DEBUG_OUT("[DebugForDate] date_link_link Msg(~p)", [Msg]),
	acDateLogic:active(Pid, date_link_link, Msg),
	{noreply,State};

%% 手动重置宝石阵
handle_info({date_link_reshuffle, Pid, Msg}, State) ->
	%?DEBUG_OUT("[DebugForDate] date_link_reshuffle Msg(~p)", [Msg]),
	acDateLogic:active(Pid, date_link_reshuffle, Msg),
	{noreply,State};

%% 仅提供给GM命令的玩法结束指令
handle_info({date_link_end, Pid, Msg}, State) ->
	%?DEBUG_OUT("[DebugForDate] date_link_end Msg(~p)", [Msg]),
	acDateLogic:active(Pid, date_link_end, Msg),
	{noreply,State};

%% 仅提供给GM命令的直接增加正面状态
handle_info({date_link_buff, Pid, Msg}, State) ->
	%?DEBUG_OUT("[DebugForDate] date_link_buff Msg(~p)", [Msg]),
	acDateLogic:active(Pid, date_link_buff, Msg),
	{noreply,State};


%% 仅提供给GM命令的直接增加正面状态
handle_info({date_touch_box, Pid, Msg}, State) ->
	%?DEBUG_OUT("[DebugForDate] date_link_buff Msg(~p)", [Msg]),
	acDateLogic:active(Pid, date_touch_box, Msg),
	{noreply,State};



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
