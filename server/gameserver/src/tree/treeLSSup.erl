%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%%
%%% @end
%%% Created : 07. 二月 2017 19:13
%%%-------------------------------------------------------------------
-module(treeLSSup).
-author("tiancheng").

-behaviour(supervisor).

-include("gsInc.hrl").

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

-define(SYSlEVEL, 		sysLevel).
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
	%%跨服窗口进程
	GSCrossServer = {
		gsCrosOtp,
		{gsCrosOtp, start_link, []},
		permanent,
		2000,
		worker,
		[gsCrosOtp]
	},

	%%跨服窗口进程
	CrossGSServer = {
		crossGsOtp,
		{crossGsOtp, start_link, []},
		permanent,
		2000,
		worker,
		[crossGsOtp]
	},

	%% main进程
	Main = {lsMainOtp,                         			% Id       = internal id
		{lsMainOtp, start_link, []},				% StartFun = {M, F, A}
		permanent,                               	% Restart  = permanent | transient | temporary
		2000,                                    	% Shutdown = brutal_kill | int() >= 0 | infinity
		worker,                                  	% Type     = worker | supervisor
		[lsMainOtp]                           		% Modules  = [Module] | dynamic
	},

	LoginQueue = {
		loginQueueOtp,
		{loginQueueOtp, start_link, []},
		permanent,
		infinity,
		worker,
		[loginQueueOtp]
	},

	LSSubSup = {
		lsSubSup,
		{lsSubSup, start_link, []},
		permanent,
		infinity,
		supervisor,
		[lsSubSup]
	},

	List = case core:isCross() of
			   false ->
				   [
					   GSCrossServer,
					   Main,
					   LoginQueue,
					   LSSubSup
				   ];
			   _ ->
				   [
					   CrossGSServer,
					   Main,
					   LoginQueue,
					   LSSubSup
				   ]
		   end,

	{ok,
		{
			{one_for_one, ?MAX_RESTART, ?MAX_TIME}, List
		}
	}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
