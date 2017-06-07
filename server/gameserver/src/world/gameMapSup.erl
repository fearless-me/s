%%
%%%地图监督进程，每张地图会有一个进程。

-module(gameMapSup).
-author(zhongyuanwei).

-behaviour(supervisor).

-include("logger.hrl").

-define(MAX_RESTART,   1000).
-define(MAX_TIME,      3600).

%% ====================================================================
%% API functions
%% ====================================================================
-export([start_child/1, start_link/0, init/1]).

%% 启动map sup 进程
start_link() ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, []).

%% 启动map进程 start_child(CreateMapArg) -> {ok,pid()} | {error, _}
start_child(CreateMapArg) ->
    supervisor:start_child(?MODULE, [CreateMapArg]).

init([]) ->
	try
		?LOG_OUT("~p init",[?MODULE]),
	    {ok,
	        { {simple_one_for_one, ?MAX_RESTART, ?MAX_TIME},
	            [
	              % map process
	              {   undefined,                               	% Id       = internal id
	                  {gameMapOtp, start_link, []},             % StartFun = {M, F, A}
	                  temporary,                               	% Restart  = permanent | transient | temporary (不会重启)
	                  2000,                                    	% Shutdown = brutal_kill | int() >= 0 | infinity
	                  worker,                                  	% Type     = worker | supervisor
	                  []                                       	% Modules  = [Module] | dynamic
	              }
	            ]
	        }
	    }
	catch
		_:Why ->
			?ERROR_OUT( "Exception Module:[~p] Why[~p] stack[~p]",
						[?MODULE,Why, erlang:get_stacktrace()] ),
			{stop,[Why,erlang:get_stacktrace()]}
	end.

%% ====================================================================
%% Internal functions
%% ====================================================================


