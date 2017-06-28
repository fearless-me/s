%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%%
%%% @end
%%% Created : 12. 十一月 2014 15:26
%%%-------------------------------------------------------------------
-module(serverSup).
-author("ZhongYuanWei").

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([
	init/1,
	stop/0
]).

-define(SERVER, 		?MODULE).
-define(MAX_RESTART,    1000). %% usually 4, now set not restart
-define(MAX_TIME,      	3600).

%%%===================================================================
%%% API functions
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the supervisor
%%
%% @end
%%--------------------------------------------------------------------
-spec start_link() ->
	{ok, Pid :: pid()} | ignore | {error, Reason :: term()}.
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
	%%后台GC进程
	BAG = {
		backgroundGCOtp,
		{backgroundGCOtp,start_link,[]},
		permanent,                               				% Restart  = permanent | transient | temporary
		2000,                                    				% Shutdown = brutal_kill | int() >= 0 | infinity
		worker,                                  				% Type     = worker | supervisor
		[backgroundGCOtp]                           				% Modules  = [Module] | dynamic
	},

	%%Erlang虚拟机监控进程
	MonitorVM = {
		monitorVMOtp,
		{monitorVMOtp,start_link,[]},
		permanent,                               				% Restart  = permanent | transient | temporary
		2000,                                    				% Shutdown = brutal_kill | int() >= 0 | infinity
		worker,                                  				% Type     = worker | supervisor
		[monitorVMOtp]                           			    % Modules  = [Module] | dynamic
	},

	{ok,
		{
			{one_for_one, ?MAX_RESTART, ?MAX_TIME},
			[
				BAG,
				MonitorVM
			]
		}
	}.

stop() ->
	ok.

%%%===================================================================
%%% Internal functions
%%%===================================================================

