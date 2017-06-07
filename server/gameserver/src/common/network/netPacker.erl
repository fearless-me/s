%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%%
%%% @end
%%% Created : 08. 十一月 2014 14:52
%%%-------------------------------------------------------------------
-module(netPacker).
-author("ZhongYuanWei").

-include("type.hrl").
-include("logger.hrl").
-include("netmsgRecords.hrl").
-include("commonDef.hrl").

%% API
-export([
	sendSessionKey/2,
	onSessionKeyAck/1,
	sendNetMsg/3,
	decodeNetMsg/1,
	getWriteNetMsgSize/0,
	getReadNetMsgSize/0,
	setReadNetMsgSize/1
]).

%%每10分钟更新一次Key
-define(UpdateSessionKeyTime,600000).

-define(SessionKey,[
	"qxnjiKNVKQIE2014",
	"iwermnJHPiqijnK2",
	"KJI&*6%2lk;jHGM?",
	"njoipfq#%^&!kl;a",
	"NKOqmsdksdfiHYYU",
	"kndfvm()nhfsdsda",
	"f;hjkadfgau8re*^",
	"k*9r0KLlkdflkjka"
]).

%%==========================================================================
%% API函数
%%==========================================================================

-ifdef(RELEASE).
%%Release版发送消息保持原样
%%发送网络消息
-spec sendNetMsg(Socket,#listenTcpOptions{},MsgDataList) -> ok | {error,Reason} when
	Socket::port(),MsgDataList::list(),Reason::closed | inet:posix().
sendNetMsg(Socket,#listenTcpOptions{packetLen = HeaderLen},MsgDataList) when erlang:is_list(MsgDataList)->
	case getWriteSessionKey() of
		[] ->
			{Len,List} = addNetHeader(HeaderLen,MsgDataList),
			%%记录发送的字节数
			setWriteNetMsgSize(getWriteNetMsgSize() + Len),
			netmsg:sendPackage(Socket,List);
		Key ->
			[H|T] = MsgDataList,
			{_,Ret} = encode(T,Key,Key,[]),
			{Len,List} = addNetHeader(HeaderLen,[H|Ret]),
			%%记录发送的字节数
			setWriteNetMsgSize(getWriteNetMsgSize() + Len),
			netmsg:sendPackage(Socket,List)
	end.
-else.
%%debug版发送消息给客户端添加checksum
-spec sendNetMsg(Socket,#listenTcpOptions{},MsgDataList) -> ok | {error,Reason} when
	Socket::port(),MsgDataList::list(),Reason::closed | inet:posix().
sendNetMsg(Socket,#listenTcpOptions{packetLen = HeaderLen}, MsgDataList) when erlang:is_list(MsgDataList)->
	Sum = sumMsgDataList(MsgDataList),
	case getWriteSessionKey() of
		[] ->
			{Len,List} = addNetHeader(HeaderLen,MsgDataList),

			%% 统计消息
			Cmd = socketHandler:parseMsgID(MsgDataList),
			socketStatistics:sendMsgToClient(Cmd, Len),

			%%记录发送的字节数
			setWriteNetMsgSize(getWriteNetMsgSize() + Len),
			NewList = changeDataListForSum(HeaderLen, Sum, List),
			netmsg:sendPackage(Socket,NewList);
		Key ->
			[H|T] = MsgDataList,
			{_,Ret} = encode(T,Key,Key,[]),
			{Len,List} = addNetHeader(HeaderLen,[H|Ret]),

			%% 统计消息
			Cmd = socketHandler:parseMsgID(MsgDataList),
			socketStatistics:sendMsgToClient(Cmd, Len),

			%%记录发送的字节数
			setWriteNetMsgSize(getWriteNetMsgSize() + Len),
			NewList = changeDataListForSum(HeaderLen, Sum, List),
			netmsg:sendPackage(Socket,NewList)
	end.

%% 求和（包含CMD）
sumMsgDataList(DataList) ->
	[<<H:8,L:8>>|DataList2] = DataList,
	DataSum =
		case DataList2 of
			[] -> 0;
			_ ->
				DataList3 = lists:flatten(DataList2),
				DataList4 = erlang:list_to_binary(DataList3),
				DataList5 = erlang:binary_to_list(DataList4),
				lists:sum(DataList5)
		end,
	Sum = H + L + DataSum,
	Sum.

changeDataListForSum(2, _Sum, [<<_Len:?U16>> | _RightList] = List) ->
	List;
changeDataListForSum(4, Sum, [<<Len:?U32>> | RightList]) ->
	%% 取低八位
	Sum2 = Sum band 16#FF,

	%% 替换高第三位到第十位（共八位）
	Sum3 = Sum2 bsl 22,
	Len2 = Len band 16#C03FFFFF,
	Len3 = Sum3 + Len2,

	%% 判断是否打印日志
	case Len =:= 0 orelse Sum2 =:= 0 orelse Len3 =:= 0 of
		true ->
			[<<_CMD:16/little>>|_RL] = RightList,
%%			?WARN_OUT("NetPid:~p, CMD:~p,OldLen=~w,Sum=~w,Sum2=~w,NewLen=~w,OldData:~w",
%%				[self(), CMD, Len, Sum, Sum2, Len3, List]),
			ok;
		_ ->
			skip
	end,
	[<<Len3:?U32>> | RightList].
-endif.

%%发送SessionKey
-spec sendSessionKey(Socket,#listenTcpOptions{}) -> ok when Socket::port().
sendSessionKey(Socket,#listenTcpOptions{} = Option) ->
	List = ?SessionKey,
	Len = erlang:length(List),
	N = misc:rand(1, Len),
	Key = lists:nth(N, List),
	sendNetMsg(Socket,Option,netmsgWrite:packNetMsg(#pk_GS2U_SessionKey{key = Key})),
	setWriteSessionKey(Key),
	erlang:send_after(?UpdateSessionKeyTime, self(), updateSessionKey),
	ok.

%%处理收到客户端回复过来的SessionKey
-spec onSessionKeyAck(#pk_U2GS_SessionKeyAck{}) -> ok.
onSessionKeyAck(#pk_U2GS_SessionKeyAck{oldKey = OldKey,newKey = Key}) ->
	case getLastWriteSessionKey() of
		OldKey ->
			%%如果客户端回复过来的上次的SessionKey与服务器记录的一致，
			%%则表示这个客户端一直正常处理服务器所有SessionKey
			setReadSessionKey(Key);
		LastKey ->
			%%如果客户端回复过来的上次的SessionKey与服务器记录的不一致，
			%%则表示这个客户端中途可能有中断处理服务器发送的更新SessionKey的消息，比如客户端切到后台执行不接收服务器的消息
			%%但它在本次更新中新SessionKey返回正确，还是让它设置成功；否则，让断线吧
			case getWriteSessionKey() of
				LastKey ->
					setReadSessionKey(Key);
				_ ->
					?ERROR_OUT("Error Client Ack SessionKey[~p] OldKey[~p] require Key[~p]",[Key,OldKey,LastKey]),
					throw("Error Client Ack SessionKey")
			end
	end,
	ok.

%%解密网络消息
-spec decodeNetMsg(Msg) -> NewMsg when
	Msg::binary(),NewMsg::binary().
decodeNetMsg(Msg) ->
	case getReadSessionKey() of
		[] ->
			Msg;
		Key ->
			decode(Msg,Key,Key,[])
	end.

%%==========================================================================
%% 内部函数
%%==========================================================================

%%网络消息发送前，添加包头
-spec addNetHeader(2 | 4,List) -> {Len,list()} when Len::uint(),List::list().
addNetHeader(2,List) ->
	Len = erlang:iolist_size(List) + 2,
	checkNetMsgLen(Len,List),
	{Len,[<<Len:?U16>> | List]};
addNetHeader(4,List) ->
	Len = erlang:iolist_size(List) + 4,
	checkNetMsgLen(Len,List),
	{Len,[<<Len:?U32>> | List]}.

encode(<<>>,Key,_,AccIn) ->
	{Key,lists:reverse(AccIn)};
encode(<<Msg/binary>>,[],Key,AccIn) ->
	encode(Msg,Key,Key,AccIn);
encode(<<H:?BYTE,T/binary>>,[HK|TK],Key,AccIn) ->
	HR = H bxor HK,
	encode(T,TK,Key,[HR | AccIn]);
encode([],Key,_,AccIn) ->
	{Key,lists:reverse(AccIn)};
encode([_H|_] = Data,[],Key,AccIn) ->
	encode(Data,Key,Key,AccIn);
encode([H|T],CurKey,Key,AccIn) ->
	{OutKey,AccOut} = encode(H,CurKey,Key,[]),
	encode(T,OutKey,Key,[AccOut | AccIn]).

decode(<<>>,_,_,AccIn) ->
	erlang:list_to_binary(lists:reverse(AccIn));
decode(<<Msg/binary>>,[],Key,AccIn) ->
	decode(Msg,Key,Key,AccIn);
decode(<<H:?BYTE,T/binary>>,[HK|TK],Key,AccIn) ->
	HR = H bxor HK,
	decode(T,TK,Key,[HR | AccIn]).

%%获取本次的读SessionKey
-spec getReadSessionKey() -> string().
getReadSessionKey() ->
	case get(readSessionKey) of
		undefined ->
			[];
		String ->
			String
	end.

%%设置本次的读SessionKey
-spec setReadSessionKey(String) -> ok when
	String::string().
setReadSessionKey(String) ->
	put(readSessionKey,String),
	ok.

%%获取本次的写SessionKey
-spec getWriteSessionKey() -> string().
getWriteSessionKey() ->
	case get(writeSessionKey) of
		undefined ->
			[];
		String ->
			String
	end.

%%设置本次的写SessionKey，同时记录上次的写SessionKey
-spec setWriteSessionKey(String) -> ok when
	String::string().
setWriteSessionKey(String) ->
	put(lastWriteSessionKey,getWriteSessionKey()),
	put(writeSessionKey,String),
	ok.

%%获取上次的写SessionKey
-spec getLastWriteSessionKey() -> string().
getLastWriteSessionKey() ->
	case get(lastWriteSessionKey) of
		undefined ->
			[];
		String ->
			String
	end.

getWriteNetMsgSize() ->
	case get(writeNetMsgSize) of
		undefined ->
			0;
		N ->
			N
	end.

setWriteNetMsgSize(N) when erlang:is_integer(N),N >= 0->
	put(writeNetMsgSize,N),
	ok.

getReadNetMsgSize() ->
	case get(readNetMsgSize) of
		undefined ->
			0;
		N ->
			N
	end.

setReadNetMsgSize(N) when erlang:is_integer(N),N >= 0->
	put(readNetMsgSize,N),
	ok.

%%由于客户端接收网络消息的Buffer大小只有204800，超过此大小则不会被处理，会导致掉线
%%为了让Buffer有一定的剩余余地，所以服务器不能发送超过204800字节大小的包
checkNetMsgLen(Len,List) ->
	case Len >= 204800 of
		true ->
			Cmd = socketHandler:parseMsgID(List),
			?ERROR_OUT("NetPid:~p Send NetMsg[~ts] Size:~p Out of BufferSize:204800",[self(),Cmd,Len]);
		_ ->
			skip
	end,
	ok.
