%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%%
%%% @end
%%% Created : 12. 十一月 2014 14:20
%%%-------------------------------------------------------------------
-module(socketSup).
-author("ZhongYuanWei").

-include("logger.hrl").
-include("commonDef.hrl").

-define(SERVER, ?MODULE).
-define(MAX_RESTART,   1000).
-define(MAX_TIME,      3600).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
		 start_link/2,
		 start_child/3,
		 init/1,
		 concatToAtom/2
		]).

%% 组装端口监听模块的进程名原子
concatToAtom(Module, Port) when erlang:is_integer( Port )->
	erlang:list_to_atom(lists:concat([atom_to_list(Module),integer_to_list(Port)])).

%% 启动netListener进程，并设置socket连接处理模块
start_link(HandleMoudle,#listenTcpOptions{port = Port} = Option) when erlang:is_integer(Port), erlang:is_atom(HandleMoudle) ->
	Name = concatToAtom(?MODULE,Port),
	supervisor:start_link({local,Name}, ?MODULE, [HandleMoudle,Option]).

%% 启动socket连接处理进程
start_child(Module,Socket,#listenTcpOptions{} = Option) ->
	Arg = [Socket,Option],
	supervisor:start_child(Module, [Arg]).

%% one_for_one包括了一个监听进程ClientAccepter，还包含了一个NetClientSupervisor进程树(simple_one_for_one策略)
init([Module,#listenTcpOptions{port = Port} = Option]) ->
	?LOG_OUT("~p init,Listen Port[~p]", [?MODULE,Port]),
	ClientAccepter = {
		socketAccepter,                         		        % Id       = internal id
		{socketAccepter, start_link, [Module,Option]},			% StartFun = {M, F, A}
		permanent,                               				% Restart  = permanent | transient | temporary
		2000,                                    				% Shutdown = brutal_kill | int() >= 0 | infinity
		worker,                                  				% Type     = worker | supervisor
		[socketAccepter]                           				% Modules  = [Module] | dynamic
	},

	NetClientSupervisor = {
		socketHandler,
		{supervisor, start_link, [{local,Module},?MODULE, [Module]]},
		permanent,
		infinity,
		supervisor,
		[socketHandler]
	},
	{ok,
		{
			{one_for_one, ?MAX_RESTART, ?MAX_TIME},
			[
				ClientAccepter,
				NetClientSupervisor
			]
		}
	};

%%注意，这个函数必须要有，是监督进程启动工作者进程时调用的回调函数
init([Module]) ->
	?LOG_OUT("Module[~p] init",[?MODULE]),
	{ok,
		{_SupFlags = {simple_one_for_one, ?MAX_RESTART, ?MAX_TIME},
			[
				{
					undefined,                               % Id       = internal id
					{Module, start_link, []},				 % StartFun = {M, F, A}
					temporary,                               % Restart  = permanent | transient | temporary (不会重启)
					2000,                                    % Shutdown = brutal_kill | int() >= 0 | infinity
					worker,                                  % Type     = worker | supervisor
					[]                                       % Modules  = [Module] | dynamic
				}
			]
		}
	}.
%% ====================================================================
%% Internal functions
%% ====================================================================
