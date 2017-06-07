%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2015, <公司>
%%% @doc
%%%
%%% @end
%%% Created : 20. 八月 2015 9:59
%%%-------------------------------------------------------------------

-module(backgroundGCOtp).
-author("ZhongYuanWei").

-behaviour(gen_server).

-include("logger.hrl").

%% API
-export([start_link/0]).
-export([
	run/0,
	gc/0
]).

%% gen_server callbacks
-export([init/1,
	handle_call/3,
	handle_cast/2,
	handle_info/2,
	terminate/2,
	code_change/3]).

-define(SERVER, ?MODULE).

-define(MAX_RATIO, 0.01).

%%每30分钟GC一次
-define(IDEAL_INTERVAL, 30 * 60 * 1000).

-record(state, {last_interval}).


%%%===================================================================
%%% API
%%%===================================================================

run() ->
	gen_server:cast(?MODULE, run).

%%--------------------------------------------------------------------
%% @doc
%% Starts the server
%%
%% @end
%%--------------------------------------------------------------------
-spec(start_link() ->
	{ok, Pid :: pid()} | ignore | {error, Reason :: term()}).
start_link() ->
	gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

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
	{ok, interval_gc(#state{ last_interval = ?IDEAL_INTERVAL }) }.

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
handle_cast(run, State) ->
	gc(),
	{noreply, State};
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
handle_info(interval_run, State) ->
	{noreply, interval_gc(State)};
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

%%%===================================================================
%%% Internal functions
%%%===================================================================

interval_gc(State = #state{last_interval = LastInterval}) ->
	{ok, Micros,Interval} = interval_operation(
		{?MODULE, gc, []},
		?MAX_RATIO, ?IDEAL_INTERVAL, LastInterval),
	?LOG_OUT("backgroundGC,UseTime:~p ms",[Micros]),
	erlang:send_after(Interval, self(), interval_run),
	State#state{last_interval = Interval}.

gc() ->
	[garbage_collect(P) || P <- processes(),
		{status, waiting} == process_info(P, status)],
	garbage_collect(), %% since we will never be waiting...
	ok.

%% Ideally, you'd want Fun to run every IdealInterval. but you don't
%% want it to take more than MaxRatio of IdealInterval. So if it takes
%% more then you want to run it less often. So we time how long it
%% takes to run, and then suggest how long you should wait before
%% running it again. Times are in millis.
interval_operation({M, F, A}, MaxRatio, IdealInterval, LastInterval) ->
	{Micros, Res} = timer:tc(M, F, A),
	{
		Res,
		Micros,
		case {Micros > 1000 * (MaxRatio * IdealInterval),
			Micros > 1000 * (MaxRatio * LastInterval)} of
			{true,  true}  -> round(LastInterval * 1.5);
			{true,  false} -> LastInterval;
			{false, false} -> lists:max([IdealInterval,
				round(LastInterval / 1.5)])
		end
	}.
