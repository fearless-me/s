%% @author zzc
%% @doc @todo Add description to clientMsgHandler.


-module(clientOtp).

-behaviour(socketHandler).
-include("logger.hrl").
-include("netmsgRecords.hrl").
-include("userDefine.hrl").
-include("commonDef.hrl").


%% ====================================================================
%% API functions
%% ====================================================================
-export([code_change/3,handle_exception/3,handle_cast/2,handle_info/2,start_link/1,terminate/2,init/1,handle_call/3]).

-export([
	handle_socket_close/1,
	handle_net_msg/3
]).


start_link(Arg) ->
	socketHandler:start_link(?MODULE, Arg).

init([Socket]) ->
	?LOG_OUT("~p init",[?MODULE]),
	clientLogic:checkHeartPack(),%%心跳包检查 
	{Ip,_Port} = misc:getRemoteIP_Port(Socket),
	clientLogic:setUserIP( Ip ),
	clientLogic:setClientStatus(?UserState_UnCheckPass),
	?LOG_OUT("clientMsgHandler[~p ~p ~p] init",[Ip,self(), Socket]),
	?LOG_OUT("~p init ok",[?MODULE]),
	{ok, #clientState{clientSocket = Socket}}.

%%自检测心跳包
handle_info({checkHeartPack,_pid,_Msg},State)->
	clientLogic:checkHeartPack(),
	{noreply, State};

%%登录队列系统告诉玩家可以处理数据库ack后的流程
handle_info({canLogin,_pid},State)->
	clientLogic:onLoginQueCanLogin(State),
	{noreply, State};

%%登录队列系统告诉玩家可以处理数据库ack后的流程
handle_info({noGSList,_pid},State)->
	?LOG_OUT("noGSList[~w]",[self()]),
	clientLogic:sendLoginResult(?LoginResultServerMaintain,0,"",stringCfg:getString(noGSList_Text),State),
	{noreply, State};

%%登录队列系统定时公告玩家自己在排队的名次
handle_info({playerSequenceNumber,_pid,{Num}},State)->
	Msg = #pk_LS2U_LoginQue{currentNumber =Num},
	socketHandler:sendNetMsg(netmsgWrite:packNetMsg(Msg)),
	{noreply, State};

%%接收数据库返回的帐号信息
handle_info({getAccountAck,_pid,Msg},State)->
	clientLogic:onMsgGetAccountAck(clientLogic:getClientStatus(),Msg,State).

handle_cast(stop, State) ->
	{stop, normal, State};

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

handle_socket_close(Reason) ->
	onUserOffline(Reason).

handle_net_msg(Cmd,Pk,State) ->
	clientNetworkMsg:doTcpMsg(clientLogic:getClientStatus(), Cmd, Pk, State).

%% ====================================================================
%% Internal functions
%% ====================================================================
onUserOffline( Reason ) ->
	?LOG_OUT("onUserOffLine pid:~p reason:~p",[self(),Reason]),
	%%clientLogic:doUserOffline(),
	ok.
