%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%% 日志记录缓存处理
%%% @end
%%% Created : 07. 四月 2016 16:17
%%%-------------------------------------------------------------------
-module(logDBCache).
-author("tiancheng").

-include("dbsInc.hrl").
-include("logDBPrivate.hrl").

%% API
-export([
	setCacheEts/1,
	saveLog_cache/2,
	saveLog_Tick/0
]).

saveLog_cache(MsgID, Msg) ->
	case lists:member(MsgID, ?CacheLogTypeList) of
		true ->
			Ets = getCacheEts(),

			ets:insert(Ets, {MsgID, Msg}),

			Number = addLogNumber(MsgID),

			case Number < ?LogWriteNumber of
				true -> skip;
				_ -> saveLog_cache(MsgID)
			end;
		_ ->
			%% 直接存储
			libLogDB:saveLog_Real(MsgID, Msg)
	end,
	ok.

saveLog_Tick() ->
	lists:foreach(fun(MsgID) -> saveLog_cache(MsgID) end, ?CacheLogTypeList),
	ok.

saveLog_cache(MsgID) ->
	Ets = getCacheEts(),

	case ets:lookup(Ets, MsgID) of
		[] ->
			skip;
		List ->
			ets:delete(Ets, MsgID),

			NewList = lists:map(fun({_, Msg}) -> Msg end, List),

			%% 判断是否要开启子进程
			case erlang:length(NewList) > ?LogWriteSpawn of
				true -> erlang:spawn(fun() -> spawnSaveLog(MsgID, NewList) end);
				_ -> libLogDB:saveLog_Real(MsgID, NewList)
			end,
			ok
	end,

	putLogNumber(MsgID, 0),
	ok.

spawnSaveLog(MsgID, List) ->
	libLogDB:saveLog_Real(MsgID, List).

%% 日志数量记录
addLogNumber(Type) ->
	Number = getLogNumber(Type),
	NewNumber = Number + 1,
	putLogNumber(Type, NewNumber),
	NewNumber.

putLogNumber(Type, Number) ->
	put({'LogNumber', Type}, Number).

getLogNumber(Type) ->
	case get({'LogNumber', Type}) of
		undefined -> 0;
		V -> V
	end.

%% 缓存ETS
getCacheEts() ->
	get('CacheEts').

setCacheEts(Ets) ->
	put('CacheEts', Ets).