%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20170220
%%%-------------------------------------------------------------------
-module(acSnowmanOtp).
-author("meitianyang").

-include("acSnowmanPrivate.hrl").

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
	myGenServer:start_link({local,Name}, ?PsNameSnowman, [], [{timeout,?Start_Link_TimeOut_ms}]).

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
	acSnowmanLogic:init(),
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
handle_info({activityChangeCallBack, _Pid, {?ActivityType_Snowman, Phase}}, State) ->
	?DEBUG_OUT("[DebugForSnowman] activityChangeCallBack ~p", [Phase]),
	%% 回调
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_Snowman) of
		true ->
			acSnowmanLogic:activityChangeCallBack(Phase);
		_ ->
			skip
	end,
	{noreply,State};

%% 活动地图的消息接口
handle_info({activityMapMsg, _Pid, {MsgType, Data}}, State) ->
	?DEBUG_OUT("[DebugForSnowman] activityMapMsg ~p", [{MsgType, Data}]),
	acSnowmanLogic:activityMapMsg(MsgType, Data),
	{noreply,State};

%% 地图工作者进程创建成功
handle_info({createActivityMapAck, _Pid, Msg}, State) ->
	?DEBUG_OUT("[DebugForSnowman] createActivityMapAck ~p", [Msg]),
	acSnowmanLogic:createActivityMapAck(Msg),
	{noreply,State};

%% 计时器接口
%% -----------------------------------------------------------------------------------

%% 其它业务逻辑接口（创建并进入地图）
%% -----------------------------------------------------------------------------------

%% 请求进入
handle_info({snowman_enterTry, _Pid, Msg}, State) ->
	acSnowmanLogic:enterTry(Msg),
	{noreply,State};

%% 请求雪人状态
handle_info({snowman_checkSnowman, _Pid, Msg}, State) ->
	acSnowmanLogic:checkSnowman(Msg),
	{noreply,State};

%% 采集成功
handle_info({snowman_gatherSuccess, _Pid, Msg}, State) ->
	acSnowmanLogic:gatherSuccess(Msg),
	{noreply,State};

%% 捐献
handle_info({snowman_donate, Pid, Msg}, State) ->
	acSnowmanLogic:donate(Pid, Msg),
	{noreply,State};

%% 异常处理：解散军团（解散家族）
handle_info({snowman_deleteGuild, _Pid, Msg}, State) ->
	acSnowmanLogic:deleteGuild(Msg),
	{noreply,State};

%% 异常处理：退出军团（退出家族）
handle_info({snowman_leaveGuild, _Pid, Msg}, State) ->
	acSnowmanLogic:leaveGuild(Msg),
	{noreply,State};

%% 异常处理：删除角色
handle_info({snowman_deleteRole, _Pid, Msg}, State) ->
	acSnowmanLogic:deleteRole(Msg),
	{noreply,State};

%% 忽略调用playerGuild:addguildresource/2的反馈消息
handle_info({addguildresourceAck, _Pid, _Msg}, State) ->
	{noreply,State};

%% GM命令进入下一阶段
handle_info({snowman_gmNext, _Pid, Msg}, State) ->
	acSnowmanLogic:gmNext(Msg),
	{noreply,State};

%% GM获得携带材料
handle_info({snowman_gmGetRes, _Pid, Msg}, State) ->
	acSnowmanLogic:gmGetRes(Msg),
	{noreply,State};

%% GM查询怪物信息
handle_info({snowman_gmCheckMonster, _Pid, Msg}, State) ->
	acSnowmanLogic:gmCheckMonster(Msg),
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

%%%===================================================================
%%% Internal functions
%%%===================================================================
