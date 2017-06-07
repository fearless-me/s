%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 22. 五月 2017 14:32
%%%-------------------------------------------------------------------
-module(userSup).
-author("Administrator").

-behaviour(supervisor).
-include("logger.hrl").
%% API
-export([start_link/0, start_child/1]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).
-define(MAX_RESTART, 1000).
-define(MAX_TIME, 3600).

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

start_child(Args) ->
	supervisor:start_child(?MODULE, [Args]).

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
	{ok,
		{
			{simple_one_for_one, ?MAX_RESTART, ?MAX_TIME},
			[
				{undefined,                                % Id       = internal id
					{userOtp, start_link, []},             % StartFun = {M, F, A}
					temporary,                             % Restart  = permanent | transient | temporary (不会重启)
					2000,                                  % Shutdown = brutal_kill | int() >= 0 | infinity
					worker,                                % Type     = worker | supervisor
					[]                                     % Modules  = [Module] | dynamic
				}
			]
		}
	}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
