%%%-------------------------------------------------------------------
%%% @author luowei
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 运营活动
%%% @end
%%% Created : 29. 五月 2015 11:36
%%%-------------------------------------------------------------------
-module(operateActivityOtp).
-author("luowei").

-include("operateActivityPrivate.hrl").

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

-export([
	castOperateActEvent/2
]).

-define(SERVER, ?MODULE).

-record(state, {}).

castOperateActEvent(AcList, #recOperateActivityArg{} = ActArg) ->
	psMgr:sendMsg2PS(?PsNameOperateActivity, eventActivity, {AcList, ActArg}),
	ok.

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
	myGenServer:start_link({local, ?PsNameOperateActivity}, ?MODULE, [], []).

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
	operateActivityLogic:init(),
	?LOG_OUT("~p ~p init", [?MODULE, self()]),
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
handle_info(?OperateActivityModuleTickMsg, State) ->
	erlang:send_after(?OperateActivityModuleTick, self(), ?OperateActivityModuleTickMsg),
	operateActivityLogic:tick(),
	{noreply, State};

%%监听活动
handle_info({eventActivity, _Pid, {AcList, AcArg}}, State) ->
	operateActivityLogic:execute(AcList, AcArg),
	{noreply, State};

%%更新活动
handle_info({updateActivity, _, {CmdSerial, CallbackPid, Ac}}, State) ->
	?LOG_OUT("update activity ~p,~p,~p",[Ac, CmdSerial, CallbackPid]),
	operateActivityLogic:update(CallbackPid, CmdSerial, Ac),
	{noreply, State};

handle_info({createNewMap,_,{MapID,MapPid}},State) ->
	operateActivityCollectItemLogic:onCreateNewMap(MapID,MapPid),
	operateActivityFeastBossLogic:createMap(MapID, MapPid),
	{noreply, State};

handle_info({destoryMap,_,{MapID,MapPid}},State) ->
	operateActivityFeastBossLogic:destoryMap(MapID,MapPid),
	{noreply, State};

handle_info({spawnCollectAck,MapPid,{ActID,MapID,CollectObjList}},State) ->
	operateActivityCollectItemLogic:spawnCollectAck(ActID,MapPid,MapID,CollectObjList),
	{noreply, State};
handle_info({activityDataLoadAckCallBack, _Pid, _Data}, State) ->
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
