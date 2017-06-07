%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%%
%%% @end
%%% Created : 07. 二月 2017 19:13
%%%-------------------------------------------------------------------
-module(treeGSSup).
-author("tiancheng").

-behaviour(supervisor).

-define(MAX_RESTART,    0). %% usually 4, now set not restart
-define(MAX_TIME,      	3600).

-include("gsInc.hrl").

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
		%%数据库服务器
		DBServer = {
			gsDBSOtp,
			{gsDBSOtp, start_link, []},
			permanent,
			2000,
			worker,
			[gsDBSOtp]
		},

		%% mainPID进程
		Main = {
			gsMainOtp,                         					% Id       = internal id
			{gsMainOtp, start_link, []},						% StartFun = {M, F, A}
			permanent,                               			% Restart  = permanent | transient | temporary
			2000,                                    			% Shutdown = brutal_kill | int() >= 0 | infinity
			worker,                                  			% Type     = worker | supervisor
			[gsMainOtp]                           				% Modules  = [Module] | dynamic
		},

		%%跨服窗口进程
		CrosServer = {
			gsCrosOtp,
			{gsCrosOtp, start_link, []},
			permanent,
			2000,
			worker,
			[gsCrosOtp]
		},

		%%玩家数据进程
		PlayerDataOtp = {
			playerDataOtp,
			{playerDataOtp, start_link, []},
			permanent,
			2000,
			worker,
			[playerDataOtp]
		},

		%%玩家数据管理进程
		PlayerDataMgrOtp = {
			playerDataMgrOtp,
			{playerDataMgrOtp, start_link, []},
			permanent,
			2000,
			worker,
			[playerDataMgrOtp]
		},

		%%公共数据进程
		PublicDataOtp = {
			publicDataOtp,
			{publicDataOtp, start_link, []},
			permanent,
			2000,
			worker,
			[publicDataOtp]
		},

		%%公共数据管理进程
		PublicDataMgrOtp = {
			publicDataMgrOtp,
			{publicDataMgrOtp, start_link, []},
			permanent,
			2000,
			worker,
			[publicDataMgrOtp]
		},
		HttpServerOtp = {
			httpServerOtp,
			{httpServerOtp, start_link, []},
			permanent,
			2000,
			worker,
			[httpServerOtp]
		},

		ProcessList =
			case core:isCross() of
				true ->
					[
						Main,
						PlayerDataOtp,
						PlayerDataMgrOtp,
						PublicDataOtp,
						PublicDataMgrOtp,
						DBServer
					];
				_ ->
					[
						Main,
						PlayerDataOtp,
						PlayerDataMgrOtp,
						PublicDataOtp,
						PublicDataMgrOtp,
						DBServer,
						CrosServer,
						HttpServerOtp
					]
			end,

		{ok,
			{
				{one_for_one, ?MAX_RESTART, ?MAX_TIME},
				ProcessList
			}
		}
	catch
		_:Why ->
			?ERROR_OUT( "Exception Module:[~p] Why[~p] stack[~p]",
				[?MODULE,Why, erlang:get_stacktrace()] ),
			{stop,[Why,erlang:get_stacktrace()]}
	end.

%%%===================================================================
%%% Internal functions
%%%===================================================================
