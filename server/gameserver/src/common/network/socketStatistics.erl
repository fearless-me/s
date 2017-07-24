%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 协议统计
%%% @end
%%% Created : 12. 一月 2017 14:27
%%%-------------------------------------------------------------------
-module(socketStatistics).
-author("tiancheng").

-include("socketPrivate.hrl").

%% API
-export([
	startTcpPackageNumberStatistics/0,
	recvClientPackageInterval/0,
	recvTcpPackage/0,
	isOverpressure/0
]).

-export([
	startMsgStatistics/0,
	sendMsgToClient/2,
	sendMsgToServer/2
]).

-export([
	printCS/1,
	printSC/1
]).

printCS(0) ->
	printCS(10000);
printCS(Number) ->
	L = edb:readAllRecord(rec_msg_c_2_s),
	FSN =
		fun(#rec_msg_c_2_s{number = N1}, #rec_msg_c_2_s{number = N2}) ->
			N1 > N2
		end,
	LN1 = lists:sort(FSN, L),
	LN2 = lists:sublist(LN1, Number),

	FSL =
		fun(#rec_msg_c_2_s{len = L1}, #rec_msg_c_2_s{len = L2}) ->
			L1 > L2
		end,
	LS1 = lists:sort(FSL, L),
	LS2 = lists:sublist(LS1, Number),

	F =
		fun(#rec_msg_c_2_s{msgID = MsgID, number = Num, len = Len}) ->
			?LOG_OUT("MsgID:~-60tsNumber:~-13wDataLen:~ts", [MsgID, Num, mem2str(Len)])
		end,
	?LOG_OUT("[CS]sort by number:~p", [Number]),
	lists:foreach(F, LN2),
	?LOG_OUT("[CS]sort by datalen:~p", [Number]),
	lists:foreach(F, LS2),
	ok.

printSC(0) ->
	printSC(10000);
printSC(Number) ->
	L = edb:readAllRecord(rec_msg_s_2_c),
	FSN =
		fun(#rec_msg_s_2_c{number = N1}, #rec_msg_s_2_c{number = N2}) ->
			N1 > N2
		end,
	LN1 = lists:sort(FSN, L),
	LN2 = lists:sublist(LN1, Number),

	FSL =
		fun(#rec_msg_s_2_c{len = L1}, #rec_msg_s_2_c{len = L2}) ->
			L1 > L2
		end,
	LS1 = lists:sort(FSL, L),
	LS2 = lists:sublist(LS1, Number),

	F =
		fun(#rec_msg_s_2_c{msgID = MsgID, number = Num, len = Len}) ->
			?LOG_OUT("MsgID:~-60tsNumber:~-13wDataLen:~ts", [MsgID, Num, mem2str(Len)])
		end,
	?LOG_OUT("[SC]sort by number:~p", [Number]),
	lists:foreach(F, LN2),
	?LOG_OUT("[SC]sort by datalen:~p", [Number]),
	lists:foreach(F, LS2),
	ok.


-ifdef(RELEASE).
sendMsgToClient(Cmd, Len) -> ok.
-else.
sendMsgToClient(Cmd, Len) ->
	Type = ?Server_2_Client,
	Ets = getMsgStatisticsEts(Type),
	case ets:lookup(Ets, Cmd) of
		[#rec_msg_s_2_c{number = N, len = L}] ->
			ets:update_element(Ets, Cmd, [{#rec_msg_s_2_c.number, N+1}, {#rec_msg_s_2_c.len, L+Len}]);
		_ ->
			ets:insert(Ets, #rec_msg_s_2_c{msgID = Cmd, number = 1, len = Len})
	end,

	%% 达到缓存时间，写入总数据库并清理数据
	NowTime = time2:getTimestampSec(),
	LastTime = getLastSaveTime(Type),
	case NowTime - LastTime >= ?MsgStatisticsInterval of
		true ->
			setLastSaveTime(Type, NowTime),

			%% 同步到主库
			List = ets:tab2list(Ets),

			%% 清理数据
			ets:delete_all_objects(Ets),
			syncSCMsg(List),
			ok;
		_ ->
			skip
	end,
	ok.
-endif.

-ifdef(RELEASE).
sendMsgToServer(Cmd, Bin) -> ok.
-else.
sendMsgToServer(Cmd2, Bin) ->
	Cmd = netmsgCmdStr:getNetMsgCmdStr(Cmd2),
	Type = ?Client_2_Server,
	Ets = getMsgStatisticsEts(Type),
	Len = erlang:byte_size(Bin),
	case ets:lookup(Ets, Cmd) of
		[#rec_msg_c_2_s{number = N, len = L}] ->
			ets:update_element(Ets, Cmd, [{#rec_msg_c_2_s.number, N+1}, {#rec_msg_c_2_s.len, L+Len}]);
		_ ->
			ets:insert(Ets, #rec_msg_c_2_s{msgID = Cmd, number = 1, len = Len})
	end,

	%% 达到缓存时间，写入总数据库并清理数据
	NowTime = time2:getTimestampSec(),
	LastTime = getLastSaveTime(Type),
	case NowTime - LastTime >= ?MsgStatisticsInterval of
		true ->
			setLastSaveTime(Type, NowTime),

			%% 同步到主库
			List = ets:tab2list(Ets),

			%% 清理数据
			ets:delete_all_objects(Ets),
			syncCSMsg(List),
			ok;
		_ ->
			skip
	end,
	ok.
-endif.

syncCSMsg(List) ->
	F =
		fun() ->
			FSync =
				fun(#rec_msg_c_2_s{msgID = ID, number = Number, len = Len} = Data) ->
					case mnesia:read(rec_msg_c_2_s, ID, write) of
						[#rec_msg_c_2_s{number = N, len = L}] ->
							NewData = #rec_msg_c_2_s{
								msgID = ID, number = Number + N, len = Len + L
							},
							mnesia:write(NewData);
						_ ->
							mnesia:write(Data)
					end
				end,
			lists:foreach(FSync, List)
		end,
	case mnesia:transaction(F) of
		{atomic, _Val} ->
			true;
		Error ->
			?ERROR_OUT("syncCSMsg error=~p", [Error])
	end,
	ok.

syncSCMsg(List) ->
	F =
		fun() ->
			FSync =
				fun(#rec_msg_s_2_c{msgID = ID, number = Number, len = Len} = Data) ->
					case mnesia:read(rec_msg_s_2_c, ID, write) of
						[#rec_msg_s_2_c{number = N, len = L}] ->
							NewData = #rec_msg_s_2_c{
								msgID = ID, number = Number + N, len = Len + L
							},
							mnesia:write(NewData);
						_ ->
							mnesia:write(Data)
					end
				end,
			lists:foreach(FSync, List)
		end,
	case mnesia:transaction(F) of
		{atomic, _Val} ->
			true;
		Error ->
			?ERROR_OUT("syncSCMsg error=~p", [Error])
	end,
	ok.

-ifdef(RELEASE).
startMsgStatistics() -> ok.
-else.
startMsgStatistics() ->
	?DEBUG_OUT("startMsgStatistics"),
	Ets1 = ets:new(rec_msg_c_2_s, [protected, {keypos, #rec_msg_c_2_s.msgID}]),
	setMsgStatisticsEts(?Client_2_Server, Ets1),

	Ets2 = ets:new(rec_msg_s_2_c, [protected, {keypos, #rec_msg_s_2_c.msgID}]),
	setMsgStatisticsEts(?Server_2_Client, Ets2),

	erlang:send_after(?PrintMsgStatisticsInterval, self(), printMsgStatisticsInterval),
	ok.
-endif.

setLastSaveTime(Type, Time) ->
	put({'LastSaveTime', Type}, Time).
getLastSaveTime(Type) ->
	case get({'LastSaveTime', Type}) of
		undefined -> 0;
		Time -> Time
	end.

setMsgStatisticsEts(Type, Ets) ->
	put({'MsgStatisticsEts', Type}, Ets).
getMsgStatisticsEts(Type) ->
	get({'MsgStatisticsEts', Type}).

%% 开启间隔时间内协议个数统计
-spec startTcpPackageNumberStatistics() -> ok.
startTcpPackageNumberStatistics() ->
	?DEBUG_OUT("startSocketNumberStatistics"),
	put(?RecvPackageAtom, 0),
	erlang:send_after(?RecvClientPackageIntervalTime, self(), recvClientPackageInterval),
	ok.

%% 统计心跳
-spec recvClientPackageInterval() -> ok.
-ifdef(RELEASE).
recvClientPackageInterval() ->
	put(?RecvPackageAtom, 0),
	ok.
-else.
recvClientPackageInterval() ->
	Number = get(?RecvPackageAtom),
	?DEBUG_OUT("RECV Pid:~p IP:~p IntervalTime:~p,Number:~p/~p,Average:~p",
		[
			self(),
			socketHandler:getUserIpAndPort(),
			?RecvClientPackageIntervalTime,
			Number,
			?RecvClientPackageIntervalTime,
			round(Number / ?RecvClientPackageIntervalTime * 1000)
		]),
	put(?RecvPackageAtom, 0),
	ok.
-endif.

%% 接收到一个TCP包
-spec recvTcpPackage() -> uint32().
recvTcpPackage() ->
	Number = get(?RecvPackageAtom) + 1,
	put(?RecvPackageAtom, Number),
	Number.

%% 是否超过压力
-spec isOverpressure() -> boolean().
isOverpressure() ->
	recvTcpPackage() >= ?RecvClientPackageNumber.

mem2str(Mem) ->
	if Mem > ?GIB -> io_lib:format("~.3fG",[Mem/?GIB]);
		Mem > ?MIB -> io_lib:format("~.3fM",[Mem/?MIB]);
		Mem > ?KIB -> io_lib:format("~.3fK",[Mem/?KIB]);
		Mem >= 0 -> io_lib:format("~.1fB",[Mem/1.0])
	end.