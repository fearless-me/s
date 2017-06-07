%%%-------------------------------------------------------------------
%%% @author mwh
%%% 帮会沙盘
%%%-------------------------------------------------------------------
-module(acGuildExpeditionOtp).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% @todo 1.活动管理 done!!!
%% @todo 2.地图分线管理 done!!!
%% @todo 3.活动逻辑处理 half done!!!
%% @todo 4.结束处理 half done!!!
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

-include("../../activityPrivate.hrl").
-include("acGuildExpeditionPrivate.hrl").

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

%% 主活动模块给出的回调
handle_info({activityChangeCallBack, _Pid, {?ActivityType_GuildExpedition, _Phase}}, State) ->
	%% 先判断是否初始化
	{noreply,State};

%% 活动地图的消息接口
handle_info({activityMapMsg, _Pid, {_MsgType, _Data}}, State) ->
	%acGuildExpeditionLogic:activityMapMsg(MsgType, Data),
	{noreply,State};

handle_info(tickLogicTime, State) ->
    %acGuildExpeditionLogic:tickLogic(),
    {noreply,State};

handle_info(tickLogicTime30, State) ->
    %acGuildExpeditionLogic:tickLogic30(),
    {noreply,State};

handle_info(tickSpwanMonster, State) ->
	%acGuildExpeditionLogic:tickSpawn(),
	{noreply,State};
%% 地图工作者进程创成功
handle_info({createActivityMapAck, _Pid, Msg}, State) ->
    acGuildExpeditionLogic:createActivityMapAck(Msg),
    {noreply,State};

handle_info(tryEnterMapTick, State) ->
    acGuildExpeditionLogic:tryEnterMap(),
    {noreply,State};


%% 请求进入
handle_info({requestEnterMap, Pid, Param}, State) ->
	acGuildExpeditionLogic:requestEnterMap(Pid, Param),
	{noreply,State};

%% 玩家进入
handle_info({playerEnterMap, Pid, Param}, State) ->
    acGuildExpeditionLogic:playerEnterMap(Pid, Param),
	{noreply,State};

%% 玩家真正进入
handle_info({playerEnterMapReal, Pid, {_PlayerCode, _RoleID, _NetPID, _MapPID, _PlayerEts} = _Param}, State) ->

    %% 返回Ack，设置杀戮模式
    Ret = {1, ?PlayerMutiKillStatus},
    psMgr:sendMsg2PS(Pid, playerEnterGuildExpeditionRealAck, Ret),
	{noreply,State};

%% 玩家离开
handle_info({playerLeaveMap, Pid, Param}, State) ->
    acGuildExpeditionLogic:playerLeaveMap(Pid, Param),
	{noreply,State};

%% 玩家下线
handle_info({playerOffline, Pid, Param}, State) ->
    acGuildExpeditionLogic:playerOffline(Pid, Param),
    {noreply,State};

%% 角色删除
handle_info({playerdeleteRole, Pid, Param}, State) ->
    acGuildExpeditionLogic:playerDelete(Pid, Param),
	{noreply,State};

%% 角色死亡
handle_info({playerDead, _Pid, Param}, State) ->
    acGuildExpeditionLogic:playerDead(Param),
    {noreply,State};

%% 角色杀人
handle_info({ikillsomeone, _Pid, _Param}, State) ->
    {noreply,State};

handle_info({playerGatherSuccess, Pid, Param}, State) ->
	acGuildExpeditionLogic:playerGatherSucess(Pid, Param),
	{noreply,State};

handle_info({requestTotalInfo, Pid, Param}, State) ->
	acGuildExpeditionLogic:requestTotalInfo(Pid, Param),
	{noreply,State};

handle_info({requestGlobalInfo, Pid, Param}, State) ->
    acGuildExpeditionLogic:requestGlobalInfo(Pid, Param),
    {noreply,State};

handle_info({requestMapInfo, Pid, Param}, State) ->
    acGuildExpeditionLogic:requestMapInfo(Pid, Param),
    {noreply,State};

handle_info({requestGetExpeditionEverydayReward, Pid, Param}, State) ->
	acGuildExpeditionLogic:requestGetExpeditionEverydayReward(Pid, Param),
	{noreply,State};
handle_info({activityDataLoadAckCallBack, _Pid, _Data}, State) ->
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

%%%===================================================================
%%% Internal functions
%%%===================================================================
