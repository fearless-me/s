%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%%
%%% @end
%%% Created : 19. 六月 2017 16:37
%%%-------------------------------------------------------------------
-module(server_sup).
-author(tiancheng).

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
		SrvSup = {
				serverSup,                                                % Id       = internal id
				{serverSup, start_link, []},    					% StartFun = {M, F, A}
				permanent,                                            % Restart  = permanent | transient | temporary
				2000,                                                    % Shutdown = brutal_kill | int() >= 0 | infinity
				supervisor,                                            % Type     = worker | supervisor
				[serverSup]                                            % Modules  = [Module] | dynamic
			},

		Main = {
			dbMainOtp,                                                % Id       = internal id
			{dbMainOtp, start_link, []},                            % StartFun = {M, F, A}
			permanent,                                            % Restart  = permanent | transient | temporary
			2000,                                                    % Shutdown = brutal_kill | int() >= 0 | infinity
			worker,                                                % Type     = worker | supervisor
			[dbMainOtp]                                            % Modules  = [Module] | dynamic
		},

		%% DB进程
		DBMgr = {dbMgrOtp,                                            % Id       = internal id
			{dbMgrOtp, start_link, []},                                % StartFun = {M, F, A}
			permanent,                                            % Restart  = permanent | transient | temporary
			2000,                                                    % Shutdown = brutal_kill | int() >= 0 | infinity
			worker,                                                % Type     = worker | supervisor
			[dbMgrOtp]                                            % Modules  = [Module] | dynamic
		},

		%% LogDB进程
		LogDB = {logDBOtp,                                            % Id       = internal id
			{logDBOtp, start_link, []},                                % StartFun = {M, F, A}
			permanent,                                            % Restart  = permanent | transient | temporary
			2000,                                                    % Shutdown = brutal_kill | int() >= 0 | infinity
			worker,                                                % Type     = worker | supervisor
			[logDBOtp]                                            % Modules  = [Module] | dynamic
		},

		%支付服务器进程
		DBRechargePoolServerSup = {db_recharge_otp_pool,                                    % Id       = internal id
			{db_recharge_otp_pool, start_link, []},                                % StartFun = {M, F, A}
			permanent,                                            % Restart  = permanent | transient | temporary
			2000,                                                    % Shutdown = brutal_kill | int() >= 0 | infinity
			worker,                                                % Type     = worker | supervisor
			[db_recharge_otp_pool]                                            % Modules  = [Module] | dynamic
		},

		%% GS进程树
		TreeGS = {treeGSOtp,                                            % Id       = internal id
			{treeGSOtp, start_link, []},                                % StartFun = {M, F, A}
			permanent,                                            % Restart  = permanent | transient | temporary
			2000,                                                    % Shutdown = brutal_kill | int() >= 0 | infinity
			worker,                                                % Type     = worker | supervisor
			[treeGSOtp]                                            % Modules  = [Module] | dynamic
		},

		%% LS进程树
		TreeLS = {treeLSOtp,                                            % Id       = internal id
			{treeLSOtp, start_link, []},                                % StartFun = {M, F, A}
			permanent,                                            % Restart  = permanent | transient | temporary
			2000,                                                    % Shutdown = brutal_kill | int() >= 0 | infinity
			worker,                                                % Type     = worker | supervisor
			[treeLSOtp]                                            % Modules  = [Module] | dynamic
		},

		{ok, {{one_for_one, 0, 3600}, [
			SrvSup,
			TreeGS,
			TreeLS,
			Main,
			DBMgr,
			LogDB,
			DBRechargePoolServerSup
		]}}
	catch
		_:Why ->
			?ERROR_OUT("Exception Module:[~p] Why[~p] stack[~p]",
				[?MODULE, Why, erlang:get_stacktrace()]),
			{stop, [Why, erlang:get_stacktrace()]}
	end.

%%====================================================================
%% Internal functions
%%====================================================================
