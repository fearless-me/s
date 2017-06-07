%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2014, <公司>
%%% @doc
%%%
%%% @end
%%% Created : 24. 十二月 2014 10:39
%%%-------------------------------------------------------------------
-module(timeTest).
-author("ZhongYuanWei").

%% API
-export([test/0]).


test() ->
	%%必须先执行这条语句
	serverSup:start_link("GameServer","GameServer.txt"),
	test_get_time(),
	test_erlang_date_time(),
	test_date_time(),
	
	ok.

%%====================================================================
%%内部函数
%%====================================================================

test_get_time() ->
	ChinaDT = time:getChinaNowDateTime1970(),
	io:format("getChinaNowDateTime1970:~p~n", [ChinaDT]),
	UTCDT = time:getUTCNowDateTime1970(),
	io:format("getUTCNowDateTime1970:~p~n", [UTCDT]),
	LocalDT = time:getLocalNowDateTime1970(),
	io:format("getLocalNow1970:~p~n", [LocalDT]),
	MS = time:getUTCNowMS(),
	_Sec = time:getUTCNowSec(),
	_SecMS = MS div 1000,
	_SecMS.
	

%%测试以erlang的now或者timestamp函数得到的日期时间之间的相互转换
test_erlang_date_time() ->
	%%将一个erlang时间转换成毫秒数，转换后得到：1419391494065
	ErlNowMS = time2:getTimestampMS(),
	%%将毫秒换算成秒：1419391494
	ErlNowSec = ErlNowMS div 1000,
	%%将erlang的秒时间转为绝对日期时间，{{2014, 12, 24}, {3, 24, 54}}
	_Now = time:convertTimeStamp2DateTime(ErlNowSec),
	%%转换一个erlang秒数为一个绝对时间的字符串，["2014", 45, "12", 45, "24", 32, "3", 58, "24", 58, "54"]
	_Str = time:convertTimeStamp2DateTimeStr(ErlNowSec),
	ok.

%%测试绝对日期时间之间的相互转换
test_date_time() ->
	%%获取一个绝对时间的秒数，63586611702
	UTCSec = time:getUTCNowSec1970(),
	%%转换一个绝对秒数为一个绝对时间，{{2014, 12, 24}, {3, 41, 42}}
	UTCDateTime = time:convertSec2DateTime(UTCSec),
	%%转换一个绝对秒数为一个绝对时间的字符串，["2014", 45, "12", 45, "24", 32, "3", 58, "41", 58, "42"]
	_Str1 = time:convertSec2DateTimeStr(UTCSec),
	%%转换一个绝对时间为一个绝对秒数，63586611702
	UTCSec = time:convertDateTime1970ToSec(UTCDateTime),
	ok.

