-module(reloadMod).

-export([reload/1]).

reload([])->
	ok;
reload([Module | T]) ->
	reload(Module),
	reload(T);
reload(Module) when erlang:is_atom(Module) ->
    io:format("reload Module: ~p~n",[Module]),
	code:purge(Module),
	case code:get_object_code(Module) of
		{Module, Binary, Filename} ->
			case code:load_binary(Module, Filename, Binary) of
            	{module, Module} ->
					io:format("reload ~p ok~n",[Module]);
				{error, What} ->
					io:format("reload ~p fail,reason:~p ~n",[Module,What])
			end;		
		error ->
			io:format("get_object_code ~p fail ~n",[Module])
	end.


