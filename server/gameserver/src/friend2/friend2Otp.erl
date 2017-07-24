%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20161115
%%%-------------------------------------------------------------------
-module(friend2Otp).
-author("meitianyang").

-include("friend2Private.hrl").

-behaviour(myGenServer).

%% API
-export([start_link/0]).

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
-spec(start_link() ->
    {ok, Pid :: pid()} | ignore | {error, Reason :: term()}).
start_link() ->
    myGenServer:start_link({local, ?PsNameFriend2}, ?MODULE, [], [{timeout, ?Start_Link_TimeOut_ms}]).

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

%% 一波初始化
%%--------------------------------------------------------------------

%% DBS初始化完毕
handle_info({alreadyConnectDBServer, _Pid, _}, State) ->
    %?DEBUG_OUT("[DebugForFriend2] alreadyConnectDBServer"),
	erlang:send_after(?Friend2HeartBeat, self(), tick),
    {noreply, State};

%% 心跳
%%--------------------------------------------------------------------

%% 心跳
handle_info(tick, State) ->
    %?DEBUG_OUT("[DebugForFriend2] tick"),
	erlang:send_after(?Friend2HeartBeat, self(), tick),
    friend2Logic:tick(),
	friend2Cross:cross_tick(),
    {noreply, State};

%% 本地好友管理
%%--------------------------------------------------------------------

%% 关系改变
handle_info({friend2_relation, Pid, Msg}, State) ->
    %?DEBUG_OUT("[DebugForFriend2] friend2_relation"),
    friend2Logic:relation(Pid, Msg),
    {noreply, State};

%% 关系改变双重改变
handle_info({friend2_relation2, Pid, Msg}, State) ->
    ?DEBUG_OUT("[DebugForFriend2] friend2_relation2"),
    friend2Logic:relation2(Pid, Msg),
    {noreply, State};

%% 一键处理申请请求
handle_info({friend2_applyOneKey, Pid, Msg}, State) ->
    %?DEBUG_OUT("[DebugForFriend2] friend2_recommend"),
    friend2Logic:applyOneKey(Pid, Msg),
    {noreply, State};

%% 缓存离线消息
handle_info({friend2_offlineMsg, _Pid, Msg}, State) ->
    %?DEBUG_OUT("[DebugForFriend2] friend2_offlinemsg"),
    friend2Logic:offlineMsg(Msg),
    {noreply, State};

%% 已发送缓存离线消息
handle_info({friend2_offlineMsgSend, _Pid, Msg}, State) ->
    %?DEBUG_OUT("[DebugForFriend2] friend2_offlineMsgSend"),
    friend2Logic:offlineMsgSend(Msg),
    {noreply, State};

%% 扩展功能
handle_info({friend2_formalOP, _Pid, Msg}, State) ->
    %?DEBUG_OUT("[DebugForFriend2] friend2_formalOP"),
    friend2Logic:formalOP(Msg),
    {noreply, State};

%% 亲密度改变
handle_info({friend2_closenessAdd, _Pid, Msg}, State) ->
    %?DEBUG_OUT("[DebugForFriend2] friend2_closenessAdd"),
    friend2Logic:closenessAdd(Msg),
    {noreply, State};

%% 删除角色
handle_info({friend2_deleteRole, _Pid, Msg}, State) ->
    %?DEBUG_OUT("[DebugForFriend2] friend2_deleteRole"),
    friend2Logic:deleteRole(Msg),
    {noreply, State};

%% 离婚导致的友好度下降
handle_info({marriage_break, _Pid, Msg}, State) ->
    %?DEBUG_OUT("[DebugForFriend2] marriage_break"),
    friend2Logic:marriage_break(Msg),
    {noreply, State};

%% 平台gm 取消黑名单
handle_info({clearBan, _Pid, Msg}, State) ->
    friend2Logic:clearBan(Msg),
    {noreply, State};

%% 跨服好友管理
%%--------------------------------------------------------------------

%% 跨服：添加好友
handle_info({friend2Cross_1_add, _Pid, Msg}, State) ->
    friend2Cross:cross_add(Msg),
    {noreply, State};

%% 跨服：同意或拒绝申请者
handle_info({friend2Cross_1_add2, _Pid, Msg}, State) ->
    friend2Cross:cross_add2(Msg),
    {noreply, State};

%% 跨服：删除好友
handle_info({friend2Cross_1_del, _Pid, Msg}, State) ->
    friend2Cross:cross_del(Msg),
    {noreply, State};

%% 跨服：收到同意添加好友的请求的反馈
handle_info({friend2Cross_add2Reply, _Pid, Msg}, State) ->
    friend2Cross:cross_add2Reply(Msg),
    {noreply, State};

%% 跨服/普通服：收到添加好友的请求
handle_info({friend2Cross_3_addAsk, _Pid, Msg}, State) ->
    friend2Cross:current_addAsk(Msg),
    {noreply, State};

%% 跨服/普通服：收到同意添加好友的请求
handle_info({friend2Cross_3_add2Ask, _Pid, Msg}, State) ->
    friend2Cross:current_add2Ask(Msg),
    {noreply, State};

%% 跨服/普通服：实时同步数据
handle_info({friend2Cross_syncR, _Pid, Msg}, State) ->
	friend2Cross:current_syncR(core:isCross(), Msg),
	{noreply, State};

%% 跨服/普通服：延时同步数据
handle_info({friend2Cross_syncD, _Pid, Msg}, State) ->
	friend2Cross:current_syncD(core:isCross(), Msg),
	{noreply, State};

%% 跨服/普通服：向角色进程转发消息
handle_info({transit, _Pid, Msg}, State) ->
	friend2Cross:transit(Msg),
	{noreply, State};

%% 跨服：向角色进程转发消息
handle_info({transitC, _Pid, {MsgID, TarRoleID, Msg}}, State) ->
	friend2Cross:sendMsg2Role(MsgID, Msg, TarRoleID),
	{noreply, State};

% 直接转发消息给角色进程
%%% 跨服/普通服：chat
%handle_info({friend2Cross_chat, _Pid, Msg}, State) ->
%	friend2Cross:current_chat(Msg),
%	{noreply, State};


%% 未知消息捕获
%%--------------------------------------------------------------------

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

