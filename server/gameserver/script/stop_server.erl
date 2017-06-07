-module(stop_server).

-export([stop/1]).


stop(Param)->
	[Node | T] = Param,
	[Module | _] = T,
	io:format("Param: ~p ~n", [Param]),
	io:format("Will RPC Call ~p:stop() @ Node: ~p ~n", [Module,Node]),

	case net_kernel:connect(Node) of
		true ->
			MainPID = rpc:call(Node,Module,stop,[]),

			%% 开启一个监控进程
			PID = spawn(fun() -> loop(30000, MainPID, Node, Module) end),
			io:format("stop monitoring:~p op_stop~n", [PID]),
			ok;
		Why ->
			io:format("connect node[~p] failed[~p] ~n", [Node,Why]),
			skip
	end,
	ok.

loop(Time, MainPID, Node, Module) ->
	io:format("stop server loop please wait!!~n"),
	Param = 0,
	%% 请求停服阶段
	MainPID ! {stop_DBServer_getStep, self(), Param},

	receive
		{stop_DBServer_getStep_Ack,3, Param} ->
			waitATime(5000),

			%% 可以停服
			Ret = rpc:call(Node, Module, stop_real, []),

			io:format("stop server success!!!!!!!![~p]~n", [Ret]),
			exit();
		{stop_DBServer_getStep_Ack, Step, Param} ->
			%% 等待一段时间
			waitATime(Time),

			%% 继续等待
			io:format("stop server ret --> [~p]~n", [Step]),
			loop(Time, MainPID, Node, Module);
		op_stop ->
			exit()
	after Time ->
		%% 继续等待
		io:format("stop server ret after time:[~p]~n", [Time]),
		loop(Time, MainPID, Node, Module)
	end.

waitATime(Time) ->
	receive
		tttttttttttttttcccccccccccccccc ->
			ok
	after Time ->
		ok
	end.

exit() ->
	io:format("---------stop server exit!---------~n"),
	erlang:halt().