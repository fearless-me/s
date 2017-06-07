%% @author wangjie
%% @doc @todo Add description to mapcfgs.


-module(mapcfgs).

%% ====================================================================
%% API functions
%% ====================================================================
-export([main/1]).


main(_) ->
	Res = updateMsg(),
	Res.


%% ====================================================================
%% Internal functions
%% ====================================================================

updateMsg() ->
	{ok,ROOT} = file:get_cwd(),
	Path = lists:concat(
			 [ROOT,"\\src\\mapcfgs*"]
					   ),
	CommitStr = io_lib:format("TortoiseProc.exe /command:commit  /path:\"~ts\" /logmsg:\"=====mapCfg auto commit======\"", [Path]),
	
	Ret = os:cmd(CommitStr),
	io:format("~ts~n", [Ret]),
	
	ok.

