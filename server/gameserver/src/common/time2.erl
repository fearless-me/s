%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 时间相关处理函数
%%% @end
%%% Created : 03. 一月 2017 14:06
%%%-------------------------------------------------------------------
-module(time2).
-author("tiancheng").

-include("type.hrl").
-include("common.hrl").

%% 获取时间戳
-export([getTimestampSec/0, getTimestampMS/0, getTimestampMicroSeconds/0 ]).

%% 获取本地时间
-export([getLocalDateTimeSec/0, getLocalDateTime/0, getLocalDateTimeStr/0 ]).

%% 获取UTC时间
-export([getUTCDateTimeSec/0, getUTCDateTime/0, getUTCDateTimeStr/0 ]).

%% 获取当前时区（秒）
-export([getTimezoneSec/0 ]).

%% 时间转换
-export([convertDateTimeToSec/1, convertDateTimeToTimeStr/1, convertSecToDateTime/1, convertSecToTimeStr/1]).

%% emysql特殊处理时间转换
-export([mysqlDateTimeToSec/1, secToMysqlTimeStr/1]).


%% 获取时间戳（秒） FIXME 注意，本处时间戳都为UTC的时间戳
-spec getTimestampSec() -> uint().
getTimestampSec() ->
	os:system_time(seconds).
%% 获取时间戳（毫秒）
-spec getTimestampMS() -> uint64().
getTimestampMS() ->
	os:system_time(milli_seconds).
%% 获取时间戳（微秒）
-spec getTimestampMicroSeconds() -> uint64().
getTimestampMicroSeconds() ->
	os:system_time().

%% 获取本地时间
-spec getLocalDateTime() -> calendar:datetime().
getLocalDateTime() ->
	calendar:now_to_local_time(os:timestamp()).
%% 获取本地时间（秒）
-spec getLocalDateTimeSec() -> uint64().
getLocalDateTimeSec() ->
	convertDateTimeToSec(getLocalDateTime()).
%% 获取本地时间（字符串）
-spec getLocalDateTimeStr() -> string().
getLocalDateTimeStr() ->
	convertDateTimeToTimeStr(getLocalDateTime()).

%% 获取UTC时间 FIXME:如果底层的操作系统不支持，则返回与getLocalDateTime()一致
-spec getUTCDateTime() -> calendar:datetime().
getUTCDateTime() ->
	calendar:now_to_universal_time(os:timestamp()).
%% 获取UTC时间（秒）
-spec getUTCDateTimeSec() -> uint64().
getUTCDateTimeSec() ->
	convertDateTimeToSec(getUTCDateTime()).
%% 获取UTC时间（字符串）
-spec getUTCDateTimeStr() -> string().
getUTCDateTimeStr() ->
	convertDateTimeToTimeStr(getUTCDateTime()).

%% 获取当前时区（秒）
-spec getTimezoneSec() -> uint().
getTimezoneSec() ->
	Now = os:timestamp(),
	convertDateTimeToSec(calendar:now_to_local_time(Now)) - convertDateTimeToSec(calendar:now_to_universal_time(Now)).

%% 转换时间结构到秒
-spec convertDateTimeToSec(DateTime::calendar:datetime()) -> uint64().
convertDateTimeToSec({{_Year,_Month,_Day}, {_Hour,_Minute,_Second}} = DateTime) ->
	calendar:datetime_to_gregorian_seconds(DateTime).
%% 转换时间结构到时间字符串
-spec convertDateTimeToTimeStr(DateTime::calendar:datetime()) -> string().
convertDateTimeToTimeStr({{Year,Month,Day}, {Hour,Minute,Second}} = _DateTime) ->
	io_lib:format("~.4w-~.2.0w-~.2.0w ~.2.0w:~.2.0w:~.2.0w", [Year,Month,Day,Hour,Minute,Second]).
%% 转换秒到时间结构
-spec convertSecToDateTime(Second::uint64()) -> calendar:datetime().
convertSecToDateTime(Second) ->
	calendar:gregorian_seconds_to_datetime(Second).
%% 转换秒到时间字符串
-spec convertSecToTimeStr(Second::uint64()) -> string().
convertSecToTimeStr(Second) ->
	convertDateTimeToTimeStr(convertSecToDateTime(Second)).

%% 这是两个特殊函数，主要用与emysql存取数据库当中的时间字段的转换
-spec mysqlDateTimeToSec(DateTime::uint64() | {datetime, calendar:datetime()}) -> uint64().
mysqlDateTimeToSec(DateTime) ->
	case erlang:is_integer(DateTime) of
		true ->
			DateTime;
		false ->
			case DateTime of
				{datetime, {{1970, 1, 1}, {0, 0, 0}}} ->
					0;
				{datetime, DT} ->
					convertDateTimeToSec(DT)
			end
	end.
-spec secToMysqlTimeStr(Second::uint64()) -> string().
secToMysqlTimeStr(Second) when erlang:is_integer(Second) ->
	case Second > 0 of
		true ->
			convertSecToTimeStr(Second);
		_ ->
			"1970-01-01 00:00:00"
	end.

%%% 7表示星期天，1表示星期一
%-spec getWeek() -> uint().
%getWeek() ->
%	%% 判断是不是整周
%	{{Year, Month, Day}, {_Hour, _Minute, _Second}} = getLocalDateTime(),
%	calendar:day_of_the_week(Year, Month, Day).