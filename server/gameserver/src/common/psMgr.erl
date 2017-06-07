%%%注册进程相关管理

-module(psMgr).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	registerPS/2,
	unregisterPS/1,
	sendMsg2PS/2,
	sendMsg2PS/3,
	sendMsg2PS/4,
	sendMsgAfter2PS/3,
	sendMsgAfter2PS/4,
	sendMsgAfter2PS/5,
	call/3,
	call/4,
	cast/3,
	cast/4,
	try_call/4
]).

where(Name)->
	case erlang:whereis(Name) of
		undefined ->
			case global:whereis_name(Name) of
				undefined ->
					undefined;
				Pid ->
					Pid
			end;
		Pid ->
			Pid
	end.

-type serverRef() :: Name | {Name, Node :: atom()} | {global, GlobalName :: term()} | {via, Module :: atom(), ViaName :: term()} | pid().

-spec registerPS(Name, Pid) -> ok when
	Name :: atom(), Pid :: pid() | port().
registerPS(Name, Pid) ->
	erlang:register(Name, Pid),
	ok.

-spec unregisterPS(Name) -> ok when
	Name :: atom().
unregisterPS(Name) ->
	erlang:unregister(Name),
	ok.

-spec sendMsgAfter2PS(Name, MsgID, Msg, After) -> ok when
	Name :: pid() | atom() | {atom(), node()},
	MsgID :: atom() | integer(),
	Msg :: term(),
	After :: integer().
sendMsgAfter2PS(0, _, _, _) ->
	ok;
sendMsgAfter2PS(Name, MsgID, Msg, After)
	when erlang:is_pid(Name)
	andalso (erlang:is_atom(MsgID) orelse erlang:is_integer(MsgID))  ->
	erlang:send_after(After, Name, {MsgID, self(), Msg});
sendMsgAfter2PS(Name, MsgID, Msg, After) ->
	case where(Name) of
		undefined ->
			skip;
		Pid ->
			erlang:send_after(After, Pid, {MsgID, self(), Msg})
	end.

-spec sendMsgAfter2PS(Name, MsgID, After) -> ok when
	Name :: pid() | atom() | {atom(), node()},
	MsgID :: atom() | integer(),
	After :: integer().

sendMsgAfter2PS(0, _,  _) ->
	ok;
sendMsgAfter2PS(Name, MsgID, After)
	when erlang:is_pid(Name)
	andalso (erlang:is_atom(MsgID) orelse erlang:is_integer(MsgID))  ->
	erlang:send_after(After, Name, {MsgID, self()});
sendMsgAfter2PS(Name, MsgID, After) ->
	case where(Name) of
		undefined ->
			skip;
		Pid ->
			erlang:send_after(After, Pid, {MsgID, self()})
	end.


%% 给进程发消息，设置来源为传入的PID
-spec sendMsgAfter2PS(Name, MsgID, FromPID, Msg, After) -> ok when
	Name :: pid() | atom() | {atom(), node()},
	MsgID :: atom() | integer(),
	FromPID :: pid(),
	Msg :: term(),
	After :: integer().

sendMsgAfter2PS(Name, MsgID, FromPID, Msg, After)
	when erlang:is_pid(Name)    %% 进程
	andalso (erlang:is_atom(MsgID) orelse erlang:is_integer(MsgID))                %% 消息号
	andalso erlang:is_pid(FromPID) -> %% 设置消息来源进程PID
	erlang:send_after(After, Name, {MsgID, FromPID, Msg}),
	ok;
sendMsgAfter2PS(Name, MsgID, FromPID, Msg, After) ->
	case where(Name) of
		undefined ->
			skip;
		Pid ->
			erlang:send_after(After, Pid, {MsgID, FromPID, Msg})
	end,
	ok.



%% 支持节点进程间消息发送
-spec sendMsg2PS(Name, MsgID, Msg) -> ok when
	Name :: pid() | atom() | {atom(), node()},
	MsgID :: atom() | integer(),
	Msg :: term().
sendMsg2PS(0, _, _) ->
	ok;
sendMsg2PS(Name, MsgID, Msg) when (erlang:is_pid(Name) orelse erlang:is_tuple(Name)) andalso (erlang:is_atom(MsgID) orelse erlang:is_integer(MsgID)) ->
	Name ! {MsgID, self(), Msg};
sendMsg2PS(Name, MsgID, Msg) ->
	case where(Name) of
		undefined ->
			skip;
		Pid ->
			Pid ! {MsgID, self(), Msg}
	end,
	ok.

-spec sendMsg2PS(Name, MsgID) -> ok when
	Name :: pid() | atom() | {atom(), node()},
	MsgID :: atom() | integer().
sendMsg2PS(0, _) ->
	ok;
sendMsg2PS(Name, MsgID) when (erlang:is_pid(Name) orelse erlang:is_tuple(Name)) andalso (erlang:is_atom(MsgID) orelse erlang:is_integer(MsgID)) ->
	Name ! {MsgID, self()};
sendMsg2PS(Name, MsgID) ->
	case where(Name) of
		undefined ->
			skip;
		Pid ->
			Pid ! {MsgID, self()}
	end,
	ok.

%% 给进程发消息，设置来源为传入的PID
-spec sendMsg2PS(Name, MsgID, FromPID, Msg) -> ok when
	Name :: pid() | atom() | {atom(), node()}, MsgID :: atom() | integer(), FromPID :: pid(), Msg :: term().
sendMsg2PS(Name, MsgID, FromPID, Msg)
	when (erlang:is_pid(Name) orelse erlang:is_tuple(Name))    %% 进程
	andalso (erlang:is_atom(MsgID) orelse erlang:is_integer(MsgID))                %% 消息号
	andalso erlang:is_pid(FromPID) -> %% 设置消息来源进程PID
	Name ! {MsgID, FromPID, Msg},
	ok;
sendMsg2PS(Name, MsgID, FromPID, Msg) ->
	case where(Name) of
		undefined ->
			skip;
		Pid ->
			Pid ! {MsgID, FromPID, Msg}
	end,
	ok.

-spec call(ServerRef, MsgID, Msg) -> Reply when
	ServerRef :: serverRef(),
	MsgID :: atom(), Msg :: term(), Reply :: term().
call(ServerRef, MsgID, Msg) ->
	gen_server:call(ServerRef, {MsgID, Msg}).

-spec call(Name, MsgID, Msg, TimeOut) -> term() when
	Name :: pid() | atom()|tuple(), MsgID :: atom(), Msg :: term(), TimeOut :: non_neg_integer().
call(Name, MsgID, Msg, TimeOut) when erlang:is_integer(TimeOut) ->
	gen_server:call(Name, {MsgID, Msg}, TimeOut);
call(Node, Module, Func, Args) when erlang:is_list(Args) ->
	rpc:call(Node, Module, Func, Args).

-spec try_call(Name, MsgID, Msg, TimeOut) -> Res | {badrpc, Reason} when
	Name :: pid() | atom(), MsgID :: atom() | integer(), Msg :: term(), TimeOut :: non_neg_integer(), Res :: term(), Reason :: term().
try_call(Name, MsgID, Msg, TimeOut) when erlang:is_integer(TimeOut) ->
	try
		gen_server:call(Name, {MsgID, Msg}, TimeOut)
	catch
		A:Why ->
			ErrorString = io_lib:format("try_cal ~p A:Why ~p", [{Name, MsgID, Msg, TimeOut}, {A, Why}]),
			throw(ErrorString)
	end.

-spec cast(Name, MsgID, Msg) -> term() when
	Name :: pid() | atom(), MsgID :: atom(), Msg :: term().
cast(Name, MsgID, Msg) ->
	gen_server:cast(Name, {MsgID, self(), Msg}).

cast(Node, Module, Func, Args) ->
	rpc:cast(Node, Module, Func, Args).
%% ====================================================================
%% Internal functions
%% ====================================================================


