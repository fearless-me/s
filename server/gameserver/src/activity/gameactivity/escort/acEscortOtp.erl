%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, 好玩一二三
%%% @doc
%%% 护送活动模块
%%% @end
%%% Created : 06. 二月 2015 14:31
%%%-------------------------------------------------------------------
-module(acEscortOtp).
-author("tiancheng").

-include("../../activityPrivate.hrl").
-include("acEscortPrivate.hrl").

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

%% 请求进入护送
handle_call({requestEscort, Data}, _From, State) ->
	Ret = acEscortLogic:requestEscort(Data),
	?DEBUG_OUT("requestEscort:data=~p,ret=~p", [Data,Ret]),
	{reply, Ret, State};

%% 请求进入劫掠
handle_call({requestEscortRob, Data}, _From, State) ->
	Ret = acEscortLogic:requestEscortRob(Data),
	{reply, Ret, State};

%% 请求复活
handle_call({requestRevive, RoleID}, _From, State) ->
	L = acEscortState:getEscortJoinPlayerList(),
	Ret =
		case lists:keyfind(RoleID, #recEscortJoin.roleID, L) of
			#recEscortJoin{escortType = EscortType, isEscort = IsEscort} ->
				{EscortType, IsEscort};
			_ ->
				false
		end,
	{reply, Ret, State};

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
handle_info({activityChangeCallBack, _Pid, {?ActivityType_EscortGoods, Phase}}, State) ->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_EscortGoods) of
		true ->
			acEscortLogic:activityChangeCallBack(Phase);
		_ ->
			?LOG_OUT("ActivityType_EscortGoods close..."),
			skip
	end,
	{noreply,State};

%% 活动地图的消息接口
handle_info({activityMapMsg, _Pid, {MsgType, Data}}, State) ->
%% 	?DEBUG_OUT("activityMapMsg:~p ~p", [self(), MsgType]),
	acEscortLogic:activityMapMsg(MsgType, Data),
	{noreply,State};

%% 地图工作者进程创建战场成功
handle_info({createActivityMapAck, _Pid, {_MapID, MapPIDList, _Data}}, State) ->
	acEscortLogic:createHDBattleMapAck(MapPIDList),
	{noreply,State};

handle_info({acceptTriggerEvent, _Pid, RoleID}, State) ->
	acEscortLogic:acceptTriggerEvent(RoleID),
	{noreply,State};

handle_info({requestEscortTeamList, _Pid, NetPid}, State) ->
	acEscortLogic:requestEscortTeamList(NetPid),
	{noreply,State};

handle_info({leaveEscortMap, _Pid, RoleID}, State) ->
	acEscortLogic:leaveEscortMap(RoleID),
	{noreply,State};

handle_info({gm_escortcd, _Pid, RoleID}, State) ->
	acEscortLogic:gm_escortcd(RoleID),
	{noreply,State};

handle_info(escortTick, State) ->
	acEscortLogic:escortTick(),
	{noreply,State};

handle_info({resetEscortMapTick, MapPID}, State) ->
	acEscortLogic:resetEscortMap(MapPID),
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
