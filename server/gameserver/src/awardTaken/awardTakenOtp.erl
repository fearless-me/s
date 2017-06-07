%% @author zhengzhichun
%% @doc @todo 全局性检查玩家是否以领活动ID，未领则发邮件物品  awardTakenOtp.


-module(awardTakenOtp).

-include("gsInc.hrl").

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
-define(PlayerAwardTakens,playerAwardTakens).%玩家已经领过的活动ID
-record(state, {initOk=false}).

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
	myGenServer:start_link({local, ?PSNameAwardTaken}, ?MODULE, [], []).

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
	?LOG_OUT("init...", []),

	ets:new(?PlayerAwardTakens, [named_table, public, {keypos,#awardTakenEts.roleID}]),
	gsSendMsg:sendMsg2DBServer(loadAwardTakens, 0, {}),
	?LOG_OUT("init ok", []),
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


handle_call(Request, From, State) ->
	?ERROR_OUT("handle_call:[~p] in [~p],form:~p",[Request,?MODULE,From]),
	{noreply, State}.

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

%% DBS返回的已经领取活动ID
handle_info({requestDBSAck, _Pid, {AwardTakenEtsRecList} }, State)->
	?DEBUG_OUT("requestDBSAck, len:~p", [length(AwardTakenEtsRecList)]),
	ets:insert(?PlayerAwardTakens, AwardTakenEtsRecList),
	{noreply, State};

%% 通知初始化完成
handle_info({canStart, _Pid, {} }, State)->
	?LOG_OUT("Award canStart==="),
	NewState = State#state{initOk=true},
	{noreply, NewState};
%% 发送物品
handle_info({isTaken, FromPidPlayer, {RoleID,AwardID,ItemIDList,Title,Content} = Data}, State)->
	?DEBUG_OUT("isTaken handle_info ~p ~p",[RoleID,AwardID]),

	{CanGave, OldTakens} =
		case core:queryRoleKeyInfoByRoleID(RoleID) of
			#?RoleKeyRec{accountID = AccountID} ->
				if
					State#state.initOk =:= true ->
						case ets:lookup(?PlayerAwardTakens, RoleID) of
							[#awardTakenEts{takenList =TakenList}] ->
								IsTaken = lists:member(AwardID, TakenList),
								?DEBUG_OUT("isTaken ~p ~p takens:~p",[RoleID, AwardID,TakenList]),
								if
									not IsTaken ->
										NewTakenList = [ AwardID| TakenList],
										gsSendMsg:sendMsg2DBServer(saveAwardTakens,AccountID, {RoleID, AwardID}),
										ets:insert(?PlayerAwardTakens, #awardTakenEts{roleID=RoleID, takenList=NewTakenList }),
										{true,NewTakenList};
									true ->
										{false,TakenList}
								end;
							_ ->
								NewTakenList = [ AwardID ],
								gsSendMsg:sendMsg2DBServer(saveAwardTakens,AccountID, {RoleID, AwardID}),
								ets:insert(?PlayerAwardTakens, #awardTakenEts{roleID=RoleID, takenList=NewTakenList }),
								{true,NewTakenList}
						end;
					true ->
						{false,[]}
				end;
			_ ->
				?ERROR_OUT("isTaken role is delete:~p", [Data]),
				{false,[]}
		end,
	psMgr:sendMsg2PS(FromPidPlayer, isTakenAck, {CanGave,RoleID, ItemIDList, Title, Content,OldTakens}),
	{noreply, State};

handle_info(Info, State) ->
	?ERROR_OUT("unhandle info:[~p] in [~p] [~p,~p]",[Info,node(),?MODULE,self()]),
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

