%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2014, 好玩一二三科技
%%% @doc
%%%
%%% @end
%%% Created : 27. 六月 2014 11:22
%%%-------------------------------------------------------------------
-module(logSup).
-author("ZhongYuanWei").

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, localLog).

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
	RestartStrategy = one_for_one,
	MaxRestarts = 1000,
	MaxSecondsBetweenRestarts = 3600,

	SupFlags = {RestartStrategy, MaxRestarts, MaxSecondsBetweenRestarts},

	Title = case application:get_env(serverType) of
		        {ok,Str} ->
			        Str;
		        _ ->
			        ""
	        end,

	%% 日志进程
	HdltLogger = {
		hdlt_logger,                         				% Id       = internal id
		{hdlt_logger, start_link, [Title]},		            % StartFun = {M, F, A}
		permanent,                               			% Restart  = permanent | transient | temporary
		2000,                                    			% Shutdown = brutal_kill | int() >= 0 | infinity
		worker,                                  			% Type     = worker | supervisor
		[hdlt_logger]                           			% Modules  = [Module] | dynamic
	},

	{ok,
	 {SupFlags,
	  [HdltLogger]
	 }
	}.

%%%===================================================================
%%% Internal functions
%%%===================================================================
