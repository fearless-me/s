%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <雨墨>
%%% @doc
%%% 玩家数据管理进程，管理玩家数据进程
%%% @end
%%% Created : 22. 九月 2016 14:23
%%%-------------------------------------------------------------------
-module(publicDataMgrOtp).
-author("tiancheng").

-behaviour(myGenServer).

%% API
-export([start_link/0]).

%% gen_server callbacks
-export([init/1,
    handle_call/3,
    handle_cast/2,
    handle_info/2,
    terminate/2,
    code_change/3,
    handle_exception/3]).

-define(SERVER, ?MODULE).

-include("gsInc.hrl").

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
    myGenServer:start_link({local, ?PublicDataMgr}, ?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

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
    ?LOG_OUT("~p start", [?MODULE]),

    %% 内部ETS主要用来处理roleKeyInfo数据，提交效率
    Ets = ets:new(temp_RoleKeyInfo, [protected, {keypos, 1}, {write_concurrency, true}, {read_concurrency, true}]),
    publicDataMgrState:setRoleKeyInfoTempEts(Ets),

    publicDataMgrLogic:init(),
    ?LOG_OUT("~p end", [?MODULE]),
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
%%dbs连接成功
handle_info({alreadyConnectDBServer, _Pid, _}, State)->
    publicDataMgrLogic:alreadyConnectDBServer(),
    {noreply, State};

handle_info({loadOtherData, Pid, _}, State)->
	publicDataMgrLoad:loadOtherData(Pid),
    {noreply, State};

handle_info({loadModuleDataAck, Pid, Data}, State)->
	publicDataMgrLoad:loadModuleDataAck(Pid, Data),
    {noreply, State};

handle_info({loadRoleKeyInfoAck, _Pid, Data}, State)->
    publicDataMgrLoad:loadRoleKeyInfoAck(Data),
    {noreply, State};

handle_info({loadPlayerRankInfoAck, _Pid, Data}, State) ->
    publicDataMgrLoad:loadPlayerRankInfoAck(Data),
    {noreply, State};

handle_info({loadLadder1v1InfoAck, _Pid, Data}, State) ->
    publicDataMgrLoad:loadLadder1v1InfoAck(Data),
    {noreply, State};

handle_info({returnRole, _Pid, {RoleID, AccountID}}, State)->
    case core:queryRoleKeyInfoByRoleID(RoleID) of
        {} ->
            gsSendMsg:sendMsg2DBServer(loadRoleKeyInfo, AccountID, RoleID);
        _ ->
            skip
    end,
    {noreply, State};

handle_info({savePublicData, _Pid, Data}, State)->
    publicDataMgrLogic:savePublicData(Data),
    {noreply, State};

handle_info({saveladder1v1data, _Pid, Data}, State)->
    publicDataMgrLadder1v1:saveladder1v1data(Data),
    {noreply, State};

handle_info(Info, State) ->
    ?ERROR_OUT("recv unknow info:~p", [Info]),
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
