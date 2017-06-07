%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20161111
%%%-------------------------------------------------------------------
-module(identityOtp).
-author("tiancheng").

-include("identityPrivate.hrl").

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
    myGenServer:start_link({local, ?PsNameIdentity}, ?MODULE, [], [{timeout, ?Start_Link_TimeOut_ms}]).

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

%% 编辑身份证信息
%% 注1：包括标签，标签的特殊部分已由玩家进程处理
%% 注2：相册除外，使用其它方式进行管理
%% 注3：需要对编辑头像引起的照片数据引用计数变化而进行处理
handle_info({identity_edit, Pid, Msg}, State) ->
    %?DEBUG_OUT("[DebugForIdentity] identity_edit Msg(~p)", [Msg]),
    identityLogic:editIdentity(Pid, Msg),
    {noreply, State};

%% 编辑身份证信息_相册
%% 注：该消息是作为对identity_edit不足的补充，仅处理相册的编辑请求
handle_info({identity_edit_pic, Pid, Msg}, State) ->
    %?DEBUG_OUT("[DebugForIdentity] identity_edit_pic Msg(~p)", [Msg]),
    identityLogic:editIdentity_pic(Pid, Msg),
    {noreply, State};

%% 上传照片数据完成
%% 注：该消息是作为对identity_edit_pic不足的补充，仅处理相册编辑时新增未上传照片的处理
handle_info({identity_picUp, Pid, Msg}, State) ->
    %?DEBUG_OUT("[DebugForIdentity] identity_picUp"),
    identityLogic:identity_picUp(Pid, Msg),
    {noreply, State};

%% 下载照片请求
handle_info({identity_picDown, _Pid, Msg}, State) ->
    %?DEBUG_OUT("[DebugForIdentity] identity_picDown Msg(~p)", [Msg]),
    identityLogic:identity_picDown(Msg),
    {noreply, State};

%% 从数据库反馈的下载照片请求
handle_info({identity_picDownAck, _Pid, Msg}, State) ->
    %?DEBUG_OUT("[DebugForIdentity] identity_picDownAck Msg(~p)", [Msg]),
    identityLogic:identity_picDownAck(Msg),
    {noreply, State};

%% 由于玩家进程下载照片不一定要向公共进程请求，所以单独有希望下载的消息通知，以更新最近下载时间
handle_info({identity_picWantDown, _Pid, Msg}, State) ->
    %?DEBUG_OUT("[DebugForIdentity] identity_picWantDown"),
    identityLogic:identity_picWantDown(Msg),
    {noreply, State};

%% 从数据库反馈的下载照片请求
handle_info({identity_picUnactive, _Pid, _Msg}, State) ->
    %?DEBUG_OUT("[DebugForIdentity] identity_picUnactive"),
    identityLogic:identity_picUnactive(),
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

