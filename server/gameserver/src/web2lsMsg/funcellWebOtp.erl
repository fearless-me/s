%% @author zzc
%% @doc @todo 接收平台socket过来的各种操作消息.


-module(funcellWebOtp).
-behaviour(socketHandler).
-include("lsInc.hrl").
-include("gsDef.hrl").

-record(state,{
			   socket
			  }).


%% ====================================================================
%% API functions
%% ====================================================================
-export([code_change/3,handle_exception/3,handle_cast/2,handle_info/2,start_link/1,terminate/2,init/1,handle_call/3]).

-export([handle_socket_close/1,
		 handle_net_msg/3
		 ]).

start_link(Arg) ->
	?LOG_OUT("start_link pid=~p  start",[self()]),
    socketHandler:start_link(?MODULE, Arg).

init([Socket]) ->
	?LOG_OUT("~p init",[?MODULE]),
	{Ip,_Port} = misc:getRemoteIP_Port(Socket),
    ?LOG_OUT("funcellWebOtp[~p ~p ~p] init",[Ip,self(), Socket]),
    State = #state{socket=Socket},
	?LOG_OUT("~p init ok",[?MODULE]),
	
	erlang:send_after(500,self(),{handleMsgAckTimeout,undefine,{} }),
    {ok,State}.

%% 进程消息（接收DBS返回）
handle_info({handleDBSAck, _FromPid,{CmdSerial,Data} }=Info,#state{socket =S} = State)->
	?DEBUG_OUT("-------------Info-----handleDBSAck:~p",[Info]),
	NewState = web2lsNetDispatcher:doDbAck( CmdSerial, Data, S, State ),
	{noreply,NewState};

%% 进程消息（接收返回）
handle_info({handleMsgAck, _FromPid,{CmdSerial,Data} },#state{socket =S} = State)->
	NewState = web2lsNetDispatcher:doTcpMsgAck( CmdSerial, Data, S, State ),
	{noreply,NewState};

%% 进程消息（接收返回 检查是否有超时的）
handle_info({handleMsgAckTimeout, _FromPid,{} },#state{socket =S} = State)->
	web2lsNetDispatcher:loopCheckMsgAck( S, State ),
	erlang:send_after(500,self(),{handleMsgAckTimeout,undefine,{} }),
	{noreply,State};

handle_info(Info,State) ->
	?ERROR_OUT("unhandle info:[~p] in [~p] ~p",[Info,?MODULE,self()]),
	{noreply,State}.

handle_cast(Msg, State)->
    ?LOG_OUT("cast========[~p]--------[~p]",[Msg, State]),
    {noreply, State}.

handle_call(_Request, _From, State) ->
	{noreply, ok, State}.

terminate(_Reason, State) ->
	?LOG_OUT("terminate========[~p]--------[~p]",[_Reason, State]),
    ok.

code_change(_OldVsn, State, _Extra) ->
	?LOG_OUT("code_change========[~p]--------[~p]",[_OldVsn, State]),
    {ok, State}.

handle_exception(Type,Why,State) ->
	?ERROR_OUT("handle_exception ~p ~p ~p",[Type,Why,State]),
	misc:closeMyTcp(State#clientState.clientSocket, "clientOtphandle_exception"),
	%%onUserOffline( Reason ),
    myGenServer:default_handle_excetion(Type, Why, State),
	{stop,"socketPidErr"}.

handle_socket_close(_Reason) ->
	ok.

handle_net_msg(Cmd,Pk,State) ->
	web2lsNetDispatcher:doTcpMsg( Cmd, Pk, State ).

