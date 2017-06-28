%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2015, <公司>
%%% @doc
%%%
%%% @end
%%% Created : 25. 八月 2015 17:09
%%%-------------------------------------------------------------------

-module(lsSubSup).
-author("ZhongYuanWei").

-behaviour(supervisor).

-include("lsInc.hrl").

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%%===================================================================
%%% API functions
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the supervisor
%%
%% @end
%%--------------------------------------------------------------------
-spec(start_link() ->
	{ok, Pid :: pid()} | ignore | {error, Reason :: term()}).
start_link() ->
	supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%%===================================================================
%%% Supervisor callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Whenever a supervisor is started using supervisor:start_link/[2,3],
%% this function is called by the new process to find out about
%% restart strategy, maximum restart frequency and child
%% specifications.
%%
%% @end
%%--------------------------------------------------------------------
-spec(init(Args :: term()) ->
	{ok, {SupFlags :: {RestartStrategy :: supervisor:strategy(),
		MaxR :: non_neg_integer(), MaxT :: non_neg_integer()},
		[ChildSpec :: supervisor:child_spec()]
	}} |
	ignore |
	{error, Reason :: term()}).
init([]) ->
	try
		timer:sleep(1000),
		ClientPort = config:getInt("ClientPort", 54801),
		?LOG_OUT("clientOtp port:~p", [ClientPort]),
		ClientOtpOption = #listenTcpOptions{port = ClientPort, packetLen = 4, listenDelay = 0},
		NetServerSup = {clientOtp1,
			{socketSup, start_link, [clientOtp, ClientOtpOption]},
			permanent,
			infinity,
			supervisor,
			[clientOtp]
		},

		%% 这个必须放在最后
		Web2LsPort = config:getInt("Web2LsPort", 9000),
		WebOtpOption = #listenTcpOptions{port = Web2LsPort, isSendSessionKey = false, listenDelay = 0},
		?LOG_OUT("funcellWebOtp port:~p", [Web2LsPort]),
		FuncellWebOtp = {
			funcellWebOtp1,                          % Id       = internal id
			{socketSup, start_link, [funcellWebOtp, WebOtpOption]},          % StartFun = {M, F, A}
			permanent,                                                         % Restart  = permanent | transient | temporary (不会重启)
			infinity,                                                          % Shutdown = brutal_kill | int() >= 0 | infinity
			supervisor,                                                        % Type     = worker | supervisor
			[funcellWebOtp]                                                    % Modules  = [Module] | dynamic
		},
		RestartStrategy = one_for_one,
		MaxRestarts = 1000,
		MaxSecondsBetweenRestarts = 3600,
		SupFlags = {RestartStrategy, MaxRestarts, MaxSecondsBetweenRestarts},
		{ok,
			{SupFlags,
				[
					NetServerSup,
					FuncellWebOtp
				]}
		}
	catch
		_:Why ->
			?ERROR_OUT("Exception Module:[~p] Why[~p] stack[~p]",
				[?MODULE, Why, erlang:get_stacktrace()]),
			{stop, [Why, erlang:get_stacktrace()]}
	end.

%%%===================================================================
%%% Internal functions
%%%===================================================================
