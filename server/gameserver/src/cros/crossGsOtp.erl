%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 跨服与普通服连接进程
%%% @end
%%% Created : 04. 七月 2017 13:47
%%%-------------------------------------------------------------------
-module(crossGsOtp).
-author(tiancheng).

-behaviour(myGenServer).

-include("gsInc.hrl").
-include("crossGsPrivate.hrl").

%% API
-export([start_link/0]).

%% myGenServer callbacks
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
	myGenServer:start_link({local, ?PsNameCrossNormal}, ?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

%%%===================================================================
%%% myGenServer callbacks
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
	crossGsLogic:init(),
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

handle_info({connectCrossSuccess, FromPid, {ServerID, ServerName} = Data}, State) ->
	Node = erlang:node(FromPid),

	%% 监控节点
	erlang:monitor_node(Node, true),

	?WARN_OUT("connectCrossSuccess node=~p, serverid=~p, servername=~ts, pid=~p",
		[Node, ServerID, ServerName, FromPid]),

	R = #normalInfo{
		serverID = ServerID,
		serverName = ServerName,
		node = Node,
		pid = FromPid
	},

	%% 打印出错的日志
	case ets:lookup(?ETSNormalServers, ServerID) of
		[#normalInfo{} = Info] ->
			?ERROR_OUT("have Info:~p, ~p", [Info, Data]);
		_ ->
			skip
	end,

	ets:insert(?ETSNormalServers, R),
	{noreply, State};

handle_info({nodedown, NodeName}, State) ->
	?ERROR_OUT("NormalServer Node[~p] is down", [NodeName]),
	MatchSpec = ets:fun2ms(
		fun(Row) when Row#normalInfo.node =:= NodeName ->
			Row
		end
	),
	case ets:select(?ETSNormalServers, MatchSpec) of
		[#normalInfo{serverID = ServerID} = Info] ->
			?WARN_OUT("normalserver down serverid=~p, servername=~ts, pid=~p",
				[ServerID, Info#normalInfo.serverName, Info#normalInfo.pid]),
			ets:delete(?ETSNormalServers, ServerID),
			ok;
		_ ->
			skip
	end,
	{noreply, State};

handle_info({sendMsg2AllSource, FromPid, {OtpName, MsgID, Msg}}, State) ->
	F =
		fun(#normalInfo{pid = Pid}, _) ->
			psMgr:sendMsg2PS(Pid, sendDataToSourceServer, FromPid, {OtpName, MsgID, Msg})
		end,
	ets:foldl(F, 0, ?ETSNormalServers),
	{noreply, State};

handle_info({sendMsg2OneSource, FromPid, {TargetServerID, OtpName, MsgID, Msg} = Data}, State) ->
	case ets:lookup(?ETSNormalServers, TargetServerID) of
		[#normalInfo{pid = Pid}] ->
			psMgr:sendMsg2PS(Pid, sendDataToSourceServer, FromPid, {OtpName, MsgID, Msg});
		_ ->
			?ERROR_OUT("not find normalserver:~p", [Data])
	end,
	{noreply, State};

handle_info({sendMsg2NormalServer, FromPid, {SelfServerID, OtpName, MsgID, Msg}}, State) ->
	F =
		fun(#normalInfo{serverID = ServerID, pid = Pid}, _) ->
			case ServerID /= SelfServerID of
				true ->
					psMgr:sendMsg2PS(Pid, sendDataToSourceServer, FromPid, {OtpName, MsgID, Msg});
				_ ->
					skip
			end
		end,
	ets:foldl(F, 0, ?ETSNormalServers),
	{noreply, State};

handle_info({sendMsg2OneNormalServer, FromPid, {TargetServerID, OtpName, MsgID, Msg} = Data}, State) ->
	case ets:lookup(?ETSNormalServers, TargetServerID) of
		[#normalInfo{pid = Pid}] ->
			psMgr:sendMsg2PS(Pid, sendDataToSourceServer, FromPid, {OtpName, MsgID, Msg});
		_ ->
			?ERROR_OUT("not find normalserver:~p", [Data])
	end,
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

handle_exception(Type,Why,State) ->
	myGenServer:default_handle_excetion(Type, Why, State).

%%%===================================================================
%%% Internal functions
%%%===================================================================
