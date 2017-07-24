%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%%
%%% @end
%%% Created : 12. 十一月 2014 14:18
%%%-------------------------------------------------------------------
-module(socketHandler).
-author("tiancheng").

-include("socketPrivate.hrl").

-record(state,{
			   module,
			   subState,
			   option
			   }).
%% ====================================================================
%% API functions
%% ====================================================================
-export([start_link/2]).
-export([init/1,
		 handle_call/3,
		 handle_cast/2,
		 handle_info/2,
		 terminate/2,
		 code_change/3,
		 handle_exception/3]).

-export([sendNetMsg/1]).

-export([parseMsgID/1]).

-export([
	getUserIpAndPort/0
]).

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

-callback handle_socket_close({tcp_error,Reason :: term()} | tcp_closed) -> term().

-callback handle_net_msg(Cmd,Pk,State) -> term() when Cmd::uint(),Pk::tuple(),State::term().

%处理gen_server中相应回调函数的异常，异常出现后，用户根据情况返回一个异常时的返回值
-callback handle_exception(Type :: call | cast | info | terminate | code_change,
	Reason :: term,
	State :: term()) ->
	term().

start_link(Module,[Socket,#listenTcpOptions{} = Option]) ->
	myGenServer:start_link(?MODULE, [Module,Socket,Option], [{timeout,?Start_Link_TimeOut_ms}]).

init([Module,Socket,#listenTcpOptions{isSendSessionKey = IsSendSessionKey} = Option]) ->
	setUserIpAndPort(undefined, undefined),
	try
		case misc:getRemoteIP_Port(Socket) of
			{IP,Port} ->
				setUserIpAndPort(IP, Port);
			_ ->
				?ERROR_OUT("Error CliSocket[~p] cannot get RemoteIP",[Socket])
		end
	catch
		_:Why1 ->
			?ERROR_OUT("getRemoteIP_Port exception:~p",[Why1])
	end,

	?LOG_OUT("socketHandler[~p ~p][~p] init",[self(), Socket, getUserIpAndPort()]),
	setUserSocket(Socket),
	setListenOption(Option),
	setHalfMsg(<<>>),

	socketStatistics:startTcpPackageNumberStatistics(),
	socketStatistics:startMsgStatistics(),

	case IsSendSessionKey of
		true ->
			netPacker:sendSessionKey(Socket,Option);
		_ ->
			skip
	end,

	case Module:init([Socket]) of
		{ok,S} ->
			{ok, #state{module = Module,subState = S,option = Option}};
		Error ->
			Error
	end.

handle_call(Request, From, #state{module = Module,subState = S} = State) ->
	case Module:handle_call(Request,From,S) of
		{reply, Reply, NewState} ->
			{reply,Reply,State#state{subState = NewState}};
		{noreply, NewState} ->
			{noreply,State#state{subState = NewState}};
		{stop,Reason,Reply,NewState} ->
			{stop,Reason,Reply,State#state{subState = NewState}};
		{stop,Reason,NewState} ->
			{stop,Reason,State#state{subState = NewState}}
	end.

handle_cast(Request, #state{module = Module,subState = S} = State) ->
	case Module:handle_cast(Request,S) of
		{noreply, NewState} ->
			{noreply, State#state{subState = NewState}};
		{stop, Reason,NewState} ->
			{stop, Reason,State#state{subState = NewState} }
	end.

terminate(Reason, #state{module = Module,subState = S}) ->
	?LOG_OUT("netOtp terminate Socket:~p NetPid:~p SendBytes:~p RecvBytes:~p",[getUserSocket(),self(),netPacker:getWriteNetMsgSize(),netPacker:getReadNetMsgSize()]),
	Module:terminate(Reason,S),
	ok.

code_change(OldVsn, #state{module = Module,subState = S} = State, Extra) ->
	case Module:code_change(OldVsn,S,Extra) of
		{ok, NewState} ->
			{ok,State#state{subState = NewState}};
		Error ->
			Error
	end.

handle_exception(Type,Why,#state{module = Module,subState = S} = State) ->
	?ERROR_OUT("NetPS Socket:~p Pid:~p exception exit by:~p ~p",[getUserSocket(),self(),Type,Why]),
	Module:handle_exception(Type,Why,S),
	
	%%调用基类处理
	myGenServer:default_handle_excetion(Type, Why, S),

	%%这里要接管，返回stop，以结束socket进程
	{stop, normal, State}.

handle_info(recvClientPackageInterval, State) ->
	socketStatistics:recvClientPackageInterval(),
	erlang:send_after(?RecvClientPackageIntervalTime, self(), recvClientPackageInterval),
	{noreply, State};

handle_info(printMsgStatisticsInterval, State) ->
	socketStatistics:printCS(30),
	socketStatistics:printSC(30),
	erlang:send_after(?PrintMsgStatisticsInterval, self(), printMsgStatisticsInterval),
	{noreply, State};

handle_info({tcp,UserSocket,Data},#state{module = Module,subState = S,option = Option} = State) ->
	case inet:setopts(UserSocket, [{active,once}]) of
		ok ->
			ok;
		{error, Reason} ->
			?ERROR_OUT("~p ~p inet:setopts UserSocket ~p fail,reason:~p ~n", [?MODULE, self(), UserSocket, Reason])
	end,
	case UserSocket =:= getUserSocket() of
		true ->
			NewState = parseMsg(Module,S,Option,Data),
			case socketStatistics:isOverpressure() of
				false ->
					{noreply, State#state{subState = NewState}};
				_ ->
					tcpClose(Module, UserSocket, tcp_packagemore),
					{stop, normal, State#state{subState = NewState}}
			end;
		false ->
			?ERROR_OUT("~p ~p handle_info tcp UserSocket[~p] =/= getUserSocket[~p] to stop !!!!", [?MODULE, self(), UserSocket, userState:getUserSocket()] ),
			%%这里不应该直接退出，要通过throw，做正常清理
			%%{stop, normal, State}
			throw( "handle_info tcp error socket" )
	end;

handle_info({tcp_error, Socket, Reason},#state{module = Module} = State) ->
	tcpClose(Module, Socket, {tcp_error,Reason}),
	{stop, normal, State};

handle_info({tcp_closed,Socket},#state{module = Module} = State) ->
	tcpClose(Module, Socket, tcp_closed),
	{stop, normal, State};

handle_info({sendPackage,_Pid,List},#state{module = Module} = State) ->
	%%parseMsg(List),
	case sendNetMsg(List) of
		ok ->
			{noreply,State};
		{error,Reason} ->
			%%如果在上面的回调函数中没有关闭Socket，这里再强制关闭一次
			Socket = getUserSocket(),
			tcpClose(Module, Socket, {sendError,Reason}),
			?ERROR_OUT("socketHandler Pid[~p],Socket:~p sendNetMsg Error:~p",[self(),Socket,Reason]),
			{stop, normal, State}
	end;

handle_info(updateSessionKey,#state{option = Option} = State) ->
	Socket = getUserSocket(),
	netPacker:sendSessionKey(Socket,Option),
	{noreply,State};

handle_info(Info,#state{module = Module,subState = S} = State) ->
	case Module:handle_info(Info,S) of
		{noreply,NewState} ->
			{noreply,State#state{subState = NewState}};
		{stop, Reason, NewState} ->
			{stop, Reason, State#state{subState = NewState} }
	end.

%% 网络断开
tcpClose(Module, Socket, Reason) ->
	Module:handle_socket_close(Reason),
	case erlang:is_port(Socket) of
		true ->
			gen_tcp:close(Socket);
		_ ->
			skip
	end.

%% 用于调试，监测服务器下发了哪些消息
%% parseMsg(Data) ->
%% 	BinData = erlang:list_to_binary(Data),
%% 	{Cmd,Bin} = parseOneMsg(false,BinData),
%% 	{Pk, <<>>} = netmsgRead:readNetMsg(Cmd, Bin),
%% 	case Cmd =:= ?CMD_Any_ChangeMap of
%% 		true ->
%% 			Msg = netmsgCmdStr:getNetMsgCmdStr(Cmd),
%% 			?DEBUG_OUT("parseMsg:~s,~p", [Msg, Pk]);
%% 		_ ->
%% 			skip
%% 	end,
%% 	ok.

parseMsgID(Data) ->
	BinData = erlang:list_to_binary(Data),
	{Cmd,_Bin} = parseOneMsg(false,BinData),
	netmsgCmdStr:getNetMsgCmdStr(Cmd).

%%发送网络消息，消息内容是一个列表
-spec sendNetMsg(List) -> ok |  {error,Reason} when List::list(),Reason::closed | inet:posix().
sendNetMsg(List) when erlang:is_list(List) ->
	Socket = getUserSocket(),
	Option = getListenOption(),
	netPacker:sendNetMsg(Socket, Option, List).

%% ====================================================================
%% Internal functions
%% ====================================================================

%%解析网络消息
-spec parseMsg(Module,State,#listenTcpOptions{},Bin) -> State when
	Module::atom(),State::term(),Bin::binary().
parseMsg(_Module,State,#listenTcpOptions{},<<>>) ->
	State;
parseMsg(Module,State,#listenTcpOptions{} = Option,Bin) ->
	Ret = dealHalfMsg(Option,Bin),
	case Ret of
		{ok,Cmd,NewBin,RemainBin} ->
			socketStatistics:sendMsgToServer(Cmd, NewBin),
			{Pk, <<>>} = netmsgRead:readNetMsg(Cmd, NewBin),
			NewState = handleMsg(Cmd,Pk,Module,State),
			setHalfMsg(<<>>),
			parseMsg(Module,NewState,Option,RemainBin);
		{halfMsg,HalfMsg} ->
			setHalfMsg(HalfMsg),
			State;
		{error,DataSize,Why} ->
			Socket = getUserSocket(),
			{IP,Port} = misc:getRemoteIP_Port(Socket),
			?ERROR_OUT("recv socket[~p] IP:~ts Port:~p, DataSize[~p] error[~s]",[Socket,IP,Port,DataSize,Why]),
			%%收到异常消息，断开连接
			%%直接close，由throw后，exception去处理
			throw(Ret)
	end.

%处理半包
-spec dealHalfMsg(#listenTcpOptions{},Msg) ->
		  {ok, Cmd, Bin, RemainBin} | {halfMsg,HalfMsg} | {error,DataSize,Why} when
		  Msg :: binary(),
		  Cmd :: integer(), Bin :: binary(), RemainBin::binary(),
		  HalfMsg :: binary(),
		  DataSize :: integer(),
		  Why :: string().
dealHalfMsg(#listenTcpOptions{packetLen = PacketLen,cmdLen = CmdLen,maxPacketSize = MaxPacketSize},Msg) when erlang:is_binary(Msg) ->
	%%Msg为本次从网络实际接收到的真实数据，不对其总大小的上限进行判定
	MsgSize = erlang:byte_size(Msg),
	case MsgSize > 0 of
		true ->
			%%记录接收到的字节数
			netPacker:setReadNetMsgSize(netPacker:getReadNetMsgSize() + MsgSize),
			{NewMsg,NewMsgSize} = concatHalfMsg(Msg,MsgSize),
			%%一个逻辑包的最小长度
			MinNetMsgSize = PacketLen + CmdLen,
			case NewMsgSize >= MinNetMsgSize of
				true ->
					%%读取头上PacketLen字节表示整包大小
					{IsEncode,Len,RemainBin} = parseNetMsgSize(PacketLen,NewMsg),
					case (Len >= MinNetMsgSize) andalso (Len =< MaxPacketSize) of
						true ->
							if
								Len =:= NewMsgSize -> %正常的单个包
									{Cmd,Bin} = parseAndCheckMsg(IsEncode,RemainBin),
									{ok, Cmd, Bin, <<>>};
								Len > NewMsgSize -> %半包
									{halfMsg, NewMsg};
								true -> %%多于一个包
									{Normal,Remain} = erlang:split_binary(RemainBin, Len - PacketLen),
									{Cmd,Bin} = parseAndCheckMsg(IsEncode,Normal),
									{ok,Cmd,Bin,Remain}
							end;
						false -> %错误
							try
								case IsEncode of
									false ->
										%%尝试着解析一下包的协议号
										{Cmd,_} = parseOneMsg(IsEncode,RemainBin),
										ErrorMsg = io_lib:format("Error Msg[~p][~ts] Len:~p",[Cmd,netmsgCmdStr:getNetMsgCmdStr(Cmd),Len]),
										{error,MsgSize,ErrorMsg};
									_ ->
										ErrorMsg = io_lib:format("Error Msg Len:~p",[Len]),
										{error,MsgSize,ErrorMsg}
								end
							catch
								_:_ ->
									ErrorMsg1 = io_lib:format("Error Msg Len:~p",[Len]),
									{error,MsgSize,ErrorMsg1}
							end
					end;
				false -> %包头大小不满足，半包
					{halfMsg,NewMsg}
			end;
		false ->
			ErrMsg = io_lib:format("Error Recv MsgSize:~p",[MsgSize]),
			{error,MsgSize,ErrMsg}
	end.

%%解析和检查消息包
-spec parseAndCheckMsg(IsEncode,BinMsg) -> {Cmd,Bin} when
	IsEncode::boolean(),BinMsg::binary(),Cmd::uint(),Bin::binary().
parseAndCheckMsg(IsEncode,Normal) ->
	{Cmd,Bin} = parseOneMsg(IsEncode,Normal),
	%%如果客户端成功回复SessionKey，则需要强制检查除心跳包外的所有消息，都应该是使用SessionKey加过密的
	case IsEncode =:= false andalso Cmd =/= ?CMD_U2GS_HeartBeat andalso isSentSessionKey() =:= true of
		true ->
			?ERROR_OUT("Client cheat? sent SessionKey, but not use"),
			throw("Client cheat? sent SessionKey, but not use");
		_ ->
			{Cmd,Bin}
	end.

%%拼接之前收到的半包
-spec concatHalfMsg(Msg,MsgSize) -> {NewMsg,NewMsgSize} when
	Msg::binary(),MsgSize::uint(),NewMsg::binary(),NewMsgSize::uint().
concatHalfMsg(Msg,MsgSize) ->
	HalfMsg = getHalfMsg(),
	HalfMsgSize = erlang:byte_size(HalfMsg),
	case HalfMsgSize > 0 of
		true ->
			%%有半包未处理，拼接起来，size加上
			{<<HalfMsg/binary,Msg/binary>>,HalfMsgSize + MsgSize};
		false ->
			%%没有半包
			{Msg,MsgSize}
	end.

%%解析网络包的长度
-spec parseNetMsgSize(PacketLen,NewMsg) -> {IsEncode,Len,RemainBin} when
	PacketLen::uint(),NewMsg::binary(),IsEncode::boolean(),Len::uint(),RemainBin::binary().
parseNetMsgSize(PacketLen,NewMsg) ->
	{OldLen,RemainBin} = case PacketLen of
						   2 ->
							   netmsg:binary_read_uint16(NewMsg);
						   4 ->
							   netmsg:binary_read_uint32(NewMsg)
					   end,
	{IsEncode,Len} = case OldLen > 16#80000000 of
						 true ->
							 %%表示加过密
							 {true,OldLen - 16#80000000};
						 _ ->
							 {false,OldLen}
					 end,
	{IsEncode,Len,RemainBin}.

%%解析一个网络包
-spec parseOneMsg(IsEncode,BinMsg) -> {Cmd,RemainBin} when
	IsEncode::boolean(),BinMsg::binary(),Cmd::uint(),RemainBin::binary().
parseOneMsg(true,BinMsg) ->
	DecodeBin = netPacker:decodeNetMsg(BinMsg),
	netmsg:binary_read_uint16(DecodeBin);
parseOneMsg(_,BinMsg) ->
	netmsg:binary_read_uint16(BinMsg).

getHalfMsg() ->
	get(halfMsg).

setHalfMsg(HalfMsg) ->
	put(halfMsg,HalfMsg).

getUserSocket() ->
	get(userSocket).

setUserSocket(Sock) ->
	put(userSocket,Sock).

setUserIpAndPort(IP, Port) ->
	put(userIpAndPort, {IP, Port}).

getUserIpAndPort() ->
	get(userIpAndPort).

setListenOption(#listenTcpOptions{} = Option) ->
	put(listenOption,Option),
	ok.

getListenOption() ->
	get(listenOption).

handleMsg(?CMD_U2GS_SessionKeyAck,Pk,_Module,State) ->
	%%客户端回复已经成功设置SessionKey了，以后收到的消息都需要处理
	setSentSessionKey(),
	netPacker:onSessionKeyAck(Pk),
	State;
handleMsg(Cmd,Pk,Module,State) ->
	Module:handle_net_msg(Cmd,Pk,State).

setSentSessionKey() ->
	put(sentSessionKey,true),
	ok.

isSentSessionKey() ->
	get(sentSessionKey).

