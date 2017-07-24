%%%-------------------------------------------------------------------
%% @doc gameserver top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(gameserver_sup).

-behaviour(supervisor).

-include("gsInc.hrl").

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
	supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
init([]) ->
	try
		%% 这里无法判断是不是跨服，直接设置名字
		Name = io_lib:format("GameServer~p", [time2:getTimestampSec()]),
		hdlt_logger:initEnv(Name),
		crypto:start(),
		application:start(localLog),
		application:start(emysql),

		ConfigOtp = {
			configOtp,                                            % Id       = internal id
			{configOtp, start_link, []},                          % StartFun = {M, F, A}
			permanent,                                            % Restart  = permanent | transient | temporary
			2000,                                                 % Shutdown = brutal_kill | int() >= 0 | infinity
			worker,                                               % Type     = worker | supervisor
			[configOtp]                                           % Modules  = [Module] | dynamic
		},

		OperationsOtp = {
			operationsOtp,                                        % Id       = internal id
			{operationsOtp, start_link, []},                      % StartFun = {M, F, A}
			permanent,                                            % Restart  = permanent | transient | temporary
			2000,                                                 % Shutdown = brutal_kill | int() >= 0 | infinity
			worker,                                               % Type     = worker | supervisor
			[operationsOtp]                                       % Modules  = [Module] | dynamic
		},

		{ok, {{one_for_one, 0, 3600}, [
			ConfigOtp,
			OperationsOtp
		]}}
	catch
		_:Why ->
			?ERROR_OUT("Exception Module:[~p] Why[~p] stack[~p]", [?MODULE, Why, erlang:get_stacktrace()]),
			{stop, [Why, erlang:get_stacktrace()]}
	end.

%%====================================================================
%% Internal functions
%%====================================================================
