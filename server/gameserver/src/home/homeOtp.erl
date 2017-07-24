%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 家园模块
%%% @end
%%% Created : 17. 八月 2017 21:14
%%%-------------------------------------------------------------------
-module(homeOtp).
-author(tiancheng).

-behaviour(myGenServer).

-include("gsInc.hrl").

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
	myGenServer:start_link({local, ?HomeOtp}, ?MODULE, [], [{timeout, ?Start_Link_TimeOut_ms}]).

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
	ets:new(?HomeEts, [public, named_table, set, {keypos, #rec_home.homeID}, {write_concurrency, true}, {read_concurrency, true}]),
	ets:new(?HomeAreaEts, [public, named_table, set, {keypos, #rec_home_area.homeID}, {write_concurrency, true}, {read_concurrency, true}]),
	ets:new(?HomeMapEts, [public, named_table, set, {keypos, #rec_home_map.homeID}, {write_concurrency, true}, {read_concurrency, true}]),
	ets:new(?EtsHomePlant, [public, named_table, set, {keypos, #recHomePlant.key}, {write_concurrency, false}, {read_concurrency, true}]),
	ets:new(?HomeVisitEts, [public, named_table, duplicate_bag, {keypos, #rec_home_visit.homeID}, {write_concurrency, true}, {read_concurrency, true}]),
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
%% 加载数据
handle_info({alreadyConnectDBServer, _Pid, _Msg}, State)->
	?DEBUG_OUT("~p ~p alreadyConnectDBServer", [?MODULE, self()]),

	%% 加载家园数据
	gsSendMsg:sendMsg2DBServer(loadHomeData, 0, 0),
	{noreply, State};

handle_info({loadHomeDataAck, _Pid, Data}, State)->
	homeLogic:loadHomeDataAck(Data),
	gsSendMsg:sendMsg2PublicDataMgr(loadModuleDataAck, 0),
	{noreply, State};

handle_info({createHome, Pid, Data}, State)->
	Ret = homeLogic:createHome(Data),
	psMgr:sendMsg2PS(Pid, createHomeAck, Ret),
	{noreply, State};

handle_info({enterHome, Pid, Data}, State)->
	homeLogic:enterHome(Pid, Data),
	{noreply, State};

handle_info({createActivityMapAck, _Pid, Msg}, State) ->
	homeLogic:createActivityMapAck(Msg),
	{noreply,State};

handle_info({addStylish, _Pid, Msg}, State) ->
	homeLogic:addStylish(Msg),
	{noreply,State};

handle_info({addComfort, _Pid, Msg}, State) ->
	homeLogic:addComfort(Msg),
	{noreply,State};

handle_info({addPopularity, _Pid, Msg}, State) ->
	homeLogic:addPopularity(Msg),
	{noreply,State};

handle_info({upgradeHomeArea, _Pid, Msg}, State) ->
	homeLogic:upgradeHomeArea(Msg),
	{noreply,State};

handle_info({changeHomeName, _Pid, Msg}, State) ->
	homeLogic:changeHomeName(Msg),
	{noreply,State};

handle_info({plant, _Pid, Msg}, State) ->
	homePlantLogic:plant(Msg),
	{noreply,State};

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
%%%===================================================================
%%% Internal functions
%%%===================================================================
