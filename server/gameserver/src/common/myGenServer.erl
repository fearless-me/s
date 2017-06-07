%%%对gen_server的一个封装，带异常处理

-module(myGenServer).

-author(zhongyuanwei).

-behaviour(gen_server).

-include("logger.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([start_link/3,
	start_link/4,
	default_handle_excetion/3]).

-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

-callback init(Args :: term()) ->
	{ok, State :: term()} | {ok, State :: term(), timeout() | hibernate} |
	{stop, Reason :: term()} | ignore.
-callback handle_call(Request :: term(), From :: {pid(), Tag :: term()},
	State :: term()) ->
	{reply, Reply :: term(), NewState :: term()} |
	{reply, Reply :: term(), NewState :: term(), timeout() | hibernate} |
	{noreply, NewState :: term()} |
	{noreply, NewState :: term(), timeout() | hibernate} |
	{stop, Reason :: term(), Reply :: term(), NewState :: term()} |
	{stop, Reason :: term(), NewState :: term()}.
-callback handle_cast(Request :: term(), State :: term()) ->
	{noreply, NewState :: term()} |
	{noreply, NewState :: term(), timeout() | hibernate} |
	{stop, Reason :: term(), NewState :: term()}.
-callback handle_info(Info :: timeout | term(), State :: term()) ->
	{noreply, NewState :: term()} |
	{noreply, NewState :: term(), timeout() | hibernate} |
	{stop, Reason :: term(), NewState :: term()}.
-callback terminate(Reason :: (normal | shutdown | {shutdown, term()} |
term()),
	State :: term()) ->
	term().
-callback code_change(OldVsn :: (term() | {down, term()}), State :: term(),
	Extra :: term()) ->
	{ok, NewState :: term()} | {error, Reason :: term()}.

%处理gen_server中相应回调函数的异常，异常出现后，用户根据情况返回一个异常时的返回值
-callback handle_exception(Type :: call | cast | info | terminate | code_change,
	Reason :: term,
	State :: term()) ->
	term().

start_link(Module,Args,Options) ->
	gen_server:start_link(?MODULE, [Module,Args], Options).

start_link(Name, Module, Args, Options) ->
	gen_server:start_link(Name, ?MODULE, [Module,Args], Options).

-spec init(Args :: term()) ->
	{ok, State :: term()} | {ok, State :: term(), timeout() | hibernate} |
	{stop, Reason :: term()} | ignore.
init(Args) ->
	try
		[Module,Arg] = Args,
		put(myModule, Module),
		random:seed(os:timestamp()),
		?LOG_OUT("Module:~p PID:~p init start...", [Module, self()]),
		Ret = Module:init(Arg),
		?LOG_OUT("Module:~p PID:~p init success!!", [Module, self()]),
		Ret
	catch
		_:_Why ->
			Stack = erlang:get_stacktrace(),
			showException(get(myModule),_Why,Stack),
			{stop,_Why}
	end.


-spec handle_call(Request :: term(), From :: {pid(), Tag :: term()},
	State :: term()) ->
	{reply, Reply :: term(), NewState :: term()} |
	{reply, Reply :: term(), NewState :: term(), timeout() | hibernate} |
	{noreply, NewState :: term()} |
	{noreply, NewState :: term(), timeout() | hibernate} |
	{stop, Reason :: term(), Reply :: term(), NewState :: term()} |
	{stop, Reason :: term(), NewState :: term()}.
handle_call(Request, From, State) ->
	Module = get(myModule),
	try
		dealCall(Request, From, State,Module)
	catch
		_:Why->
			Stack = erlang:get_stacktrace(),
			showException(Module,Why,Stack),
			Module:handle_exception(call,Why,State)
	end.

-spec handle_cast(Request :: term(), State :: term()) ->
	{noreply, NewState :: term()} |
	{noreply, NewState :: term(), timeout() | hibernate} |
	{stop, Reason :: term(), NewState :: term()}.
handle_cast(Msg, State) ->
	Module = get(myModule),
	try
		dealCast(Msg,State,Module)
	catch
		_:Why->
			Stack = erlang:get_stacktrace(),
			showException(Module,Why,Stack),
			Module:handle_exception(cast,Why,State)
	end.

-spec handle_info(Info :: timeout | term(), State :: term()) ->
	{noreply, NewState :: term()} |
	{noreply, NewState :: term(), timeout() | hibernate} |
	{stop, Reason :: term(), NewState :: term()}.
-ifdef(GAME_SERVER).
handle_info({registerAck,_Pid,Name},State) when erlang:is_atom(Name)->
	erlang:register(Name, self()),
	{noreply,State};
handle_info({registerAck,_Pid,Num},State) when erlang:is_number(Num)->
	Module = get(myModule),
	L = erlang:atom_to_list(Module) ++ erlang:integer_to_list(Num),
	RegName = erlang:list_to_atom(L),
	erlang:register(RegName, self()),
	{noreply,State};
handle_info(Info, State)->
	Module = get(myModule),
	try
		dealInfo(Info,State,Module)
	catch
		_:Why->
			Stack = erlang:get_stacktrace(),
			showException(Module,Why,Stack),
			Module:handle_exception(info,Why,State)
	end.
-else.
handle_info(Info, State)->
	Module = get(myModule),
	try
		dealInfo(Info,State,Module)
	catch
		_:Why->
			Stack = erlang:get_stacktrace(),
			showException(Module,Why,Stack),
			Module:handle_exception(info,Why,State)
	end.
-endif.

%logOutTerminate(Module,Reason) ->
%	PDList = erlang:get(),
%	KeyList = [Key || {Key,_} <- PDList],
%	RegName = erlang:process_info(self(),registered_name),
%	case Reason of
%		normal ->
%			?LOG_OUT( "~p ~p ~p terminate Reason[~p] PD Key:~p", [Module, self(), RegName, Reason, KeyList] );
%		_ ->
%			?ERROR_OUT( "~p ~p ~p terminate Reason[~p] PD Key:~p", [Module, self(), RegName, Reason, KeyList] )
%	end.

logTerminate(Module,Reason) ->
	case Reason of
		normal ->
			?LOG_OUT( "~p ~p terminate Reason[~p]", [Module, self(), Reason] );
		_ ->
			?ERROR_OUT( "~p ~p terminate Reason[~p]", [Module, self(), Reason] )
	end.

-spec terminate(Reason :: (normal | shutdown | {shutdown, term()} |
term()),
	State :: term()) ->
	term().
terminate(Reason, State) ->
	Module = get(myModule),
	try
		Module:terminate(Reason,State),
		logTerminate(Module,Reason)
	catch
		_:Why->
			Stack = erlang:get_stacktrace(),
			showException(Module,Why,Stack),
			Module:handle_exception(terminate,Why,State)
	end.

-spec code_change(OldVsn :: (term() | {down, term()}), State :: term(),
	Extra :: term()) ->
	{ok, NewState :: term()} | {error, Reason :: term()}.
code_change(OldVsn, State, Extra) ->
	Module = get(myModule),
	try
		?LOG_OUT( "~p ~p code_change OldVsn[~p] Extra[~p]", [Module, self(), OldVsn, Extra] ),
		Module:code_change(OldVsn, State, Extra)
	catch
		_:Why->
			Stack = erlang:get_stacktrace(),
			showException(Module,Why,Stack),
			Module:handle_exception(code_change,Why,State)
	end.

%默认的异常处理
-spec default_handle_excetion(Type :: call | cast | info | terminate | code_change,
	Reason :: term,
	State :: term()) ->
	term().
default_handle_excetion(Type,Why,State) ->
	case Type of
		call ->
			{noreply,State};
		cast ->
			{noreply,State};
		info ->
			{noreply,State};
		terminate ->
			ok;
		code_change ->
			{error,Why};
		_ ->
			throw("Error Type")
	end.

%% ====================================================================
%% Internal functions
%% ====================================================================
-ifndef(RELEASE).
dealCall(Request, From, State,Module)->
	Ret = Module:handle_call(Request, From,State),
	case Ret of
		{reply,_,_} ->
			Ret;
		{noreply,_,_} ->
			Ret;
		{stop,_,_} ->
			Ret;
		{stop,_,_,_} ->
			Ret;
		Why ->
			throw({Why,"Error Return Type"})
	end.
-else.
dealCall(Request, From, State,Module)->
	Module:handle_call(Request, From,State).
-endif.

-ifndef(RELEASE).
dealCast(Msg,State,Module)->
	Ret = Module:handle_cast(Msg,State),
	case Ret of
		{noreply,_} ->
			Ret;
		{noreply,_,_} ->
			Ret;
		{stop,_,_} ->
			Ret;
		Why ->
			throw({Why,"Error Return Type"})
	end.
-else.
dealCast(Msg,State,Module)->
	Module:handle_cast(Msg,State).
-endif.

-ifndef(RELEASE).
dealInfo(Info,State,Module)->
	Ret = Module:handle_info(Info,State),
	case Ret of
		{noreply,_} ->
			Ret;
		{noreply,_,_} ->
			Ret;
		{stop,_,_} ->
			Ret;
		Why ->
			throw({Why,"Error Return Type"})
	end.
-else.
dealInfo(Info,State,Module)->
	Module:handle_info(Info,State).
-endif.

showException(Modlue,Why,Stack) ->
	%如果是List，首先尝试字符串输出，
	%如果尝试字符串输出失败，再进行普通输出
	case erlang:is_list(Why) of
		true ->
			try
				%尝试字符串输出
				?ERROR_OUT( "Modlue[~p] Pid[~p],Exception Why[~s]~n stack[~p]",
					[Modlue, self(), Why, Stack] )
			catch
				_:_ ->
					%失败，普通输出
					?ERROR_OUT( "Modlue[~p] Pid[~p],Exception Why[~p]~n stack[~p]",
						[Modlue, self(), Why, Stack] )
			end;
		_ ->
			%不是列表，直接普通输出
			?ERROR_OUT( "Modlue[~p] Pid[~p],Exception Why[~p]~n stack[~p]",
				[Modlue, self(), Why, Stack] )
	end.
