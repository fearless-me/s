%% @author zhongyunawei
%% @doc @todo Add description to reload.


-module(connect).
-author(zhongyuanwei).

%% ====================================================================
%% API functions
%% ====================================================================
-export([connect/1]).

connect(Param)->
	[Node|_] = Param,
	io:format("Node: ~p",[Node]),
	case net_adm:ping(Node) of
		pong ->
			toolbar:start(),
			ok;
		_ ->
			io:format("connect failed")
	end,
    %%erlang:halt().
	ok.

%% ====================================================================
%% Internal functions
%% ====================================================================


