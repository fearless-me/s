%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <雨墨>
%%% @doc
%%% 玩家数据管理进程，管理玩家数据进程
%%% @end
%%% Created : 22. 九月 2016 14:23
%%%-------------------------------------------------------------------
-module(playerDataMgrOtp).
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
    myGenServer:start_link({local, ?PlayerDataMgr}, ?MODULE, [], [{timeout,?Start_Link_TimeOut_ms}]).

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
    playerDataMgrLogic:init(),
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
    playerDataMgrLogic:alreadyConnectDBServer(),
    {noreply, State};

handle_info({loadRoleDataFromDBAck, _Pid, Data}, State)->
    playerDataMgrLoad:loadRoleDataFromDBAck(Data),
    {noreply, State};

handle_info({loadPlayerDataAck, _Pid, DataList}, State)->
    playerDataMgrLoad:loadPlayerDataAck(DataList),
    {noreply, State};

handle_info({loadRoleNameAck, _Pid, DataList}, State)->
    playerDataMgrLoad:loadRoleNameAck(DataList),
    {noreply, State};

handle_info({loadIdentityAck, _Pid, Data}, State)->
    playerDataMgrLoad:loadIdentityAck(Data),
    {noreply, State};

handle_info({loadFriend2Ack, _Pid, Data}, State)->
    playerDataMgrLoad:loadFriend2Ack(Data),
    {noreply, State};

handle_info({loadDaily2Ack, _Pid, Data}, State)->
    playerDataMgrLoad:loadDaily2Ack(Data),
    {noreply, State};

handle_info({loadMarriageAck, _Pid, Data}, State)->
    playerDataMgrLoad:loadMarriageAck(Data),
    {noreply, State};

handle_info({loadPetTerritoryAck, _Pid, Data}, State)->
    playerDataMgrLoad:loadPetTerritoryAck(Data),
    {noreply, State};

handle_info({loadUserAccountAck, _Pid, DataList}, State)->
    playerDataMgrLoad:loadUserAccountAck(DataList),
    {noreply, State};

handle_info({loadBaseRoleAck, _Pid, DataList}, State)->
    playerDataMgrLoad:loadBaseRoleAck(DataList),
    {noreply, State};

handle_info({tickSavePlayerData, _Pid, Data}, State)->
    playerDataMgrLogic:tickSavePlayerData(Data),
    {noreply, State};

handle_info({offlineSavePlayerData, _Pid, Data}, State)->
    playerDataMgrLogic:offlineSavePlayerData(Data),
    {noreply, State};

handle_info({saveOtherPlayerData, _Pid, Data}, State)->
    playerDataMgrLogic:saveOtherPlayerData(Data),
    {noreply, State};

handle_info({changeRoleOwner, _PidFrom, {CmdSerial, _DAccountID, _SAccountID, _SRoleID,GMSocketPid} = Data}, State)->
    Ret = playerDataMgrLogic:changeRoleOwner(Data),
    psMgr:sendMsg2PS(GMSocketPid, handleDBSAck, {CmdSerial,Ret}),
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
