%%%处理与DBServer的消息通信

-module(dbsMsgHandler).

-include("dbsPrivate.hrl").
-include("netmsgRecords.hrl").
-include("logger.hrl").
-include("db.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([parseRecv/2]).
-import(netmsg, [binary_read_int64/1,
	binary_read_int64/1,
	binary_read_int16/1,
	binary_read_int16/1,
	binary_read_int/1,
	binary_read_int8/1,
	binary_read_string/1,
	binary_read_array_head16/2]).

parseRecv(_State,<<>>) ->
	ok;

parseRecv(#recdbsState{} = State, Data) ->
	{_Len,Data1} = binary_read_int16(Data),
	{CmdGet, Data2} = binary_read_int16(Data1),

	Cmd = ( CmdGet band 16#7FF ),
	LeftBin = dealMsg(State, Cmd, Data2),
	if erlang:byte_size(LeftBin) > 0 ->
		parseRecv(State,LeftBin);
	true ->
		ok
	end.

%% ====================================================================
%% Internal functions
%% ====================================================================

dealMsg(State,Cmd,Bin) ->
	{Pk,LeftBin} = netmsgRead:readNetMsg(Cmd, Bin),
	onMsg(Cmd,Pk,State),
	LeftBin.

onMsg(_,_,_) ->
	?LOG_OUT( "dbserver msg is not matching" ).


