%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%%
%%% @end
%%% Created : 19. 六月 2017 17:02
%%%-------------------------------------------------------------------
-module(operationsOtp).
-author(tiancheng).

-behaviour(myGenServer).

-include("gameaccount.hrl").
-include("logger.hrl").
-include("mysql.hrl").
-include("commonDef.hrl").

%% 运维连接数据库
-define(OPERATION_CONNECT_POOL, operationDBConnectPool).

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
	myGenServer:start_link({local, ?SERVER}, ?MODULE, [], []).

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
	case modifyGameServerConfig() of
		true ->
			erlang:send_after(1000, self(), delay_start_server_app);
		_ ->
			?ERROR_OUT("ERROR ERROR ERROR modifyGameServerConfig FAILED!")
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
handle_info(delay_start_server_app, State) ->
	?LOG_OUT("delay_start_server_app"),
	case server_sup:start_link() of
		{ok, Pid} ->
			?LOG_OUT("delay_start_server_app success, pid=~p",[Pid]);
		Other ->
			?ERROR_OUT("delay_start_server_app ~p",[Other])
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

-ifdef(RELEASE).
modifyGameServerConfig() ->
	case application:get_env(isRemoteConfig) of
		{ok, true} ->
			case connectPool() of
				true ->
					%% 连接成功，查询配置
					?LOG_OUT("connect operations success!"),
					ServerName = config:getOperationsString("ServerName", ""),
					Return =
						case ServerName /= "" of
							true ->
								SQL = io_lib:format("SELECT * FROM configdb c WHERE c.servername = '~ts';", [ServerName]),
								Ret = emysql:execute(?OPERATION_CONNECT_POOL, SQL),
								{Result, _LeftResult} = mysql:nextResult(Ret),
								case emysql_util:as_record(Result, rec_configdb, record_info(fields, rec_configdb)) of
									[#rec_configdb{regionid = RegionID, serverid = ServerID} = Server] ->
										OperationEts = config:getOperationsEts(),
										?LOG_OUT("operations adid=~p, dbid=~p", [RegionID, ServerID]),
										updateGameServerConfig(OperationEts, "ADBID", RegionID),
										updateGameServerConfig(OperationEts, "DBID", ServerID),

										Ets = config:getGameServerEts(),

										%% 逻辑库
										updateGameServerConfig(Ets, "DBIP", Server#rec_configdb.data_ip),
										updateGameServerConfig(Ets, "DBUserName", Server#rec_configdb.data_username),
										updateGameServerConfig(Ets, "DBPassword", Server#rec_configdb.data_password),
										updateGameServerConfig(Ets, "DBPort", Server#rec_configdb.data_port),
										updateGameServerConfig(Ets, "DBName", Server#rec_configdb.data_dbname),

										%% 日志库
										updateGameServerConfig(Ets, "LogDBIP", Server#rec_configdb.log_ip),
										updateGameServerConfig(Ets, "LogDBUserName", Server#rec_configdb.log_username),
										updateGameServerConfig(Ets, "LogDBPassword", Server#rec_configdb.log_password),
										updateGameServerConfig(Ets, "LogDBPort", Server#rec_configdb.log_port),
										updateGameServerConfig(Ets, "LogDBName", Server#rec_configdb.log_dbname),

										%% 账号库
										updateGameServerConfig(Ets, "LOGINDBIP", Server#rec_configdb.global_account_ip),
										updateGameServerConfig(Ets, "LOGINDBUserName", Server#rec_configdb.global_account_username),
										updateGameServerConfig(Ets, "LOGINDBPassword", Server#rec_configdb.global_account_password),
										updateGameServerConfig(Ets, "LOGINDBPort", Server#rec_configdb.global_account_port),
										updateGameServerConfig(Ets, "LOGINDBName", Server#rec_configdb.global_account_dbname),

										%% 激活码库
										updateGameServerConfig(Ets, "ActiveCodeDBIP", Server#rec_configdb.global_activecode_ip),
										updateGameServerConfig(Ets, "ActiveCodeDBUserName", Server#rec_configdb.global_activecode_username),
										updateGameServerConfig(Ets, "ActiveCodeDBPassword", Server#rec_configdb.global_activecode_password),
										updateGameServerConfig(Ets, "ActiveCodeDBPort", Server#rec_configdb.global_activecode_port),
										updateGameServerConfig(Ets, "ActiveCodeDBName", Server#rec_configdb.global_activecode_dbname),

										%% 端口
										updateGameServerConfig(Ets, "ClientPort", Server#rec_configdb.gameport1),
										updateGameServerConfig(Ets, "ListenToUserPort", Server#rec_configdb.gameport2),
										updateGameServerConfig(Ets, "Web2LsPort", Server#rec_configdb.gameport_gm),
										updateGameServerConfig(Ets, "HttpServerPort", Server#rec_configdb.gameport_recharge),

										%% 跨服
										case ets:lookup(Ets, "CrosNode") of
											[#recConfigValue{}] ->
												updateGameServerConfig(Ets, "CrosNode", binary_to_list(Server#rec_configdb.cross_node));
											_ ->
												skip
										end,

										%% 备份保存运行配置
										config:saveConfig(),

										%% 最后再检测一下服务器类型
										case core:isCross() of
											false ->
												Server#rec_configdb.serverType =:= ?ServerType_Normal;
											true ->
												true
										end;
									Error ->
										?ERROR_OUT("error operations config:~p", [Error]),
										false
								end;
							_ ->
								?ERROR_OUT("error operations config ServerName=~ts", [ServerName]),
								false
						end,

					%% 关闭连接
					closePool(),

					Return;
				_ ->
					?ERROR_OUT("connect operations failed!"),
					false
			end;
		IsRemoteConfig ->
			?LOG_OUT("release but not modifyGameServerConfig:~p", [IsRemoteConfig]),
			true
	end.
-else.
modifyGameServerConfig() ->
	?LOG_OUT("debug not modifyGameServerConfig"),
	true.
-endif.

updateGameServerConfig(Ets, Key, NewValue) when erlang:is_binary(NewValue) ->
	updateGameServerConfig(Ets, Key, binary_to_list(NewValue));
updateGameServerConfig(Ets, Key, NewValue) ->
	case ets:lookup(Ets, Key) of
		[#recConfigValue{value = NewValue}] ->
			skip;
		[#recConfigValue{}] ->
			?LOG_OUT("modify ~p config:~ts", [Ets, Key]),
			ets:update_element(Ets, Key, {#recConfigValue.value, NewValue});
		[] ->
			?LOG_OUT("new ~p config:~ts", [Ets, Key]),
			ets:insert(Ets, #recConfigValue{key = Key, value = NewValue, index = getEtsIndex(Ets) + 1})
	end,
	ok.

getEtsIndex(Ets) ->
	F =
		fun(#recConfigValue{index = Index}, Acc) ->
			erlang:max(Index, Acc)
		end,
	ets:foldl(F, 0, Ets).

%添加游戏数据库连接到连接池
-spec connectPool() -> boolean().
connectPool() ->
	DBIP = config:getOperationsString("DBIP", "localhost"),
	DBUserName = config:getOperationsString("DBUserName", "root"),
	DBPassword = config:getOperationsString("DBPassword", "123"),
	DBPort = config:getOperationsInt("DBPort", 3306),
	DBName = config:getOperationsString("DBName", "test"),
	?LOG_OUT("Connect Operations DB[~p:~p ~p]", [DBIP, DBPort, DBName]),
	ok =:= emysql:add_pool(?OPERATION_CONNECT_POOL, 1,
		DBUserName,
		DBPassword,
		DBIP,
		DBPort,
		DBName,
		utf8).

%% 关闭连接
-spec closePool() -> true.
closePool() ->
	emysql:remove_pool(?OPERATION_CONNECT_POOL),
	true.