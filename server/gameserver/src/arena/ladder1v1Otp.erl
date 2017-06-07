%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 天梯1v1竞技场模块
%%% @end
%%% Created : 29. 五月 2015 11:36
%%%-------------------------------------------------------------------
-module(ladder1v1Otp).
-author("tiancheng").

-include("ladder1v1Private.hrl").

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
	myGenServer:start_link({local, ?PsNameLadder1v1}, ?MODULE, [], []).

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
	?LOG_OUT("~p ~p init", [?MODULE, self()]),
	erlang:send_after(?Ladder1v1_Tick, self(), ladder1v1_Tick),
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
handle_call({challengeTarget, {Rank, RoleID, TargetRank, TargetRoleID}}, _From, State) ->
    Ret =
        case ets:lookup(ets_recLadderMatchState, Rank) of
            [] ->
                case ets:lookup(ets_recLadderMatchState, TargetRank) of
                    [] ->
                        ServerID = gsMainLogic:getDBID4GS(),
                        NowTime = time:getSyncTime1970FromDBS(),
                        A = #recLadderMatchState{rank = Rank, roleID = RoleID, serverID = ServerID, time = NowTime},
                        B = #recLadderMatchState{rank = TargetRank, roleID = TargetRoleID, serverID = ServerID, time = NowTime},
                        ets:insert(ets_recLadderMatchState, A),
                        ets:insert(ets_recLadderMatchState, B),
                        true;
                    _ ->
                        2
                end;
            _ ->
                1
        end,
    {reply, {challengeTargetAck, Ret}, State};

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

handle_info(ladder1v1_Tick, State) ->
	erlang:send_after(?Ladder1v1_Tick, self(), ladder1v1_Tick),
	ladder1v1Logic:ladder1v1_Tick(),
	{noreply, State};

handle_info({createLadder1v1Match, PidFromPlayer, Data}, State) ->
	ladder1v1Logic:createLadder1v1Match(PidFromPlayer, Data),
	{noreply, State};

handle_info({giveUpChallenge, PidFromPlayer, Data}, State) ->
	ladder1v1Logic:giveUpChallenge(PidFromPlayer, Data),
	{noreply, State};

handle_info({ladder1v1_monster_dead, PidFrom, Data}, State) ->
	ladder1v1Logic:ladder1v1_monster_dead(PidFrom, Data),
	{noreply, State};

handle_info({killedTarget, PidFrom, Data}, State) ->
	ladder1v1Logic:killedTarget(PidFrom, Data),
	{noreply, State};

handle_info({enterLadder1v1Map, PidFromPlayer, Data}, State) ->
	ladder1v1Logic:enterLadder1v1Map(PidFromPlayer, Data),
	{noreply, State};

handle_info({robenterLadder1v1Map, PidFromPlayer, Data}, State) ->
	ladder1v1Logic:robenterLadder1v1Map(PidFromPlayer, Data),
	{noreply, State};

handle_info({playerOffline, _PidFrom, Data}, State) ->
	ladder1v1Logic:playerOffline(Data),
	{noreply, State};

handle_info({deleteRole, _PidFrom, Data}, State) ->
	ladder1v1Logic:deleteRole(Data),
	{noreply, State};

handle_info({setExploitValue, _PidFrom, Data}, State) ->
	ladder1v1Logic:setExploitValue(Data),
	{noreply, State};

handle_info({worshipTarget, _PidFrom, Data}, State) ->
	ladder1v1Logic:worshipTarget(Data),
	{noreply, State};

handle_info({insertSelfToLadderList, _PidFrom, Data}, State) ->
	ladder1v1Logic:insertSelfToLadderList(Data),
	{noreply, State};

handle_info({clearLadderMatchState, _PidFrom, Data}, State) ->
	ladder1v1Logic:clearLadderMatchState(Data),
	{noreply, State};

handle_info({playerleaveLadder1v1Map, _PidFrom, Data}, State) ->
	ladder1v1Logic:playerleaveLadder1v1Map(Data),
	{noreply, State};

%% 地图工作者进程创建战场成功
handle_info({createActivityMapAck, _Pid, {_MapID, MapPIDList, _Data}}, State) ->
	ladder1v1Logic:createActivityMapAck(MapPIDList),
	{noreply,State};

handle_info(Info, State) ->
	?ERROR_OUT("recv unknow modeule=~p, msg=~p", [?MODULE,Info]),
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
