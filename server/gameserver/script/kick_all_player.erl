%% @author luowei
%% @doc @todo Add description to kick.


-module(kick_all_player).
-author(luowei).

%% ====================================================================
%% API functions
%% ====================================================================
-export([kick/1]).

kick(Param)->
	[Node|_] = Param,
	io:format("Reload Node: ~p~n",[Node]),
	rpc:call(Node, playerMgrOtp, kickOutAllPlayer, []),
	io:format("Kick All Player Ok: ~n"),
        erlang:halt().

%% ====================================================================
%% Internal functions
%% ====================================================================


