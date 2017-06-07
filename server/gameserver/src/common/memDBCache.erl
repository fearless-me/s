%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2015, <公司>
%%% @doc
%%%
%%% @end
%%% Created : 19. 六月 2015 15:59
%%%-------------------------------------------------------------------

-module(memDBCache).
-author("ZhongYuanWei").

-include("db.hrl").

%% API
-export([
	getSundriesKey/2,
	getSundriesRec/3,
	saveSundries/3,
	getSundries/2,
	getSundriesValue/2,
	dirtySaveSundries/3
]).

%% 获取Key
-spec getSundriesKey(ID::sundries_id(), Key::term()) -> {ID::sundries_id(), Key::term()}.
getSundriesKey(ID, Key) ->
	{ID,Key}.

%% 获取杂项表结构
-spec getSundriesRec(ID::sundries_id(), Key::term(), Value::term()) -> #rec_sundries{}.
getSundriesRec(ID, Key, Value) ->
	MyKey = getSundriesKey(ID, Key),
	#rec_sundries{id = MyKey, key = Key, value = Value}.

%% 保存杂项数据
-spec saveSundries(ID::sundries_id(), Key::term(), Value::term()) -> boolean() | ok | error.
saveSundries(ID, Key, Value) when ID >= ?Sundries_ID_Start andalso ID =< ?Sundries_ID_End ->
	MyKey = getSundriesKey(ID, Key),
	edb:checkAndSave(rec_sundries,MyKey,#rec_sundries{id = MyKey,key = Key,value = Value},new_rec_sundries,update_rec_sundries).
%% 保存杂项数据（脏写）
-spec dirtySaveSundries(ID::sundries_id(), Key::term(), Value::term()) -> boolean() | ok | error.
dirtySaveSundries(ID, Key, Value) when ID >= ?Sundries_ID_Start andalso ID =< ?Sundries_ID_End ->
	MyKey = getSundriesKey(ID, Key),
	edb:dirtySave(rec_sundries,MyKey,#rec_sundries{id = MyKey,key = Key,value = Value},new_rec_sundries,update_rec_sundries).
%% 获取杂项数据
-spec getSundries(ID::sundries_id(), Key::term()) -> [#rec_sundries{},...] | [].
getSundries(ID, Key) ->
	MyKey = getSundriesKey(ID, Key),
	edb:readRecord(rec_sundries, MyKey).

%% 获取杂项数据Value
-spec getSundriesValue(ID::sundries_id(), Key::term()) -> term().
getSundriesValue(ID, Key) ->
	MyKey = getSundriesKey(ID, Key),
	case edb:dirtyReadRecord(rec_sundries, MyKey) of
		[#rec_sundries{value = Value}] -> Value;
		_ -> undefined
	end.
