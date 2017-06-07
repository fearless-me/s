%% @author zhongyunawei
%% @doc @todo Add description to reload.


-module(reload).
-author(zhongyuanwei).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	reload/1,
	update/1
]).

%%调用update模块热更新
reload(Param)->
	[Node|Other] = Param,
	io:format("Reload Node: ~p~n~n",[Node]),
	case erlang:length(Other) > 0 of
		true ->
			Ret = rpc:call(Node, update, u, [Other]),
			case Ret of
				{badrpc,Reason} ->
					io:format("want to update modules:~p failed by:~p~n~n",[Other,Reason]),
					io:format("try to use another way to hotupdate..."),
					update(Param);
				_ ->
					io:format("want to update modules:~p ok~n~n",[Other])
			end;
		_ ->
			rpc:call(Node, update, u, [])
	end,
    erlang:halt().

%%调用reloadMod模块热更新
update(Param) ->
	[Node|Other] = Param,
	io:format("Reload Node: ~p~n~n",[Node]),
	case erlang:length(Other) > 0 of
		true ->
			io:format("want to reload modules:~p~n~n",[Other]),
			Ret = rpc:call(Node, reloadMod, reload, [Other]),
			case Ret of
				{badrpc,Reason} ->
					io:format("want to reload modules:~p failed by:~p~n~n",[Other,Reason]);
				_ ->
					io:format("want to reload modules:~p ok~n~n",[Other])
			end;
		_ ->
			rpc:call(Node, update, u, [])
	end,
	erlang:halt().

%% ====================================================================
%% Internal functions
%% ====================================================================


