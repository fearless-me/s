%% @author zhongyunawei
%% @doc @todo 时间相关函数.
%%

-module(time).
-author(zhongyuanwei).

-include("type.hrl").
-include("common.hrl").

-define(SECONDS_PER_DAY, 86400).
-define(DAYS_FROM_0_TO_1970, 719528).

%%没有加1970年的相对秒
-type dateTimeSec() :: uint().
%%没有加1970年的相对日期时间
-type datetime() :: calendar:datetime().

%%加上1970年的绝对秒
-type dateTimeSec1970() :: uint().
%%加上1970年的绝对日期时间
-type datetime1970() :: calendar:datetime1970().

%%没有加1970年的相对毫秒
-type dateTimeMS() :: uint().


%% ====================================================================
%% API functions
%% ====================================================================

%%以下为获取绝对日期时间的函数
-export([
	getChinaNowDateTime1970/0,

	getLocalNowDateTime1970/0,
	getLocalNowSec1970/0,

	getUTCNowDateTime1970/0,
	getUTCNowSec1970/0,
	getTimeZoonSec/0
]).

%%以下为获取相对日期时间的函数
-export([
	getUTCNowSec/0,
	getUTCNowMS/0
]).

%%以下为转换函数
-export([
	convertDateTime1970ToSec/1,

	convertSec2DateTime/1,
	convertSec2DateTimeStr/1,

	convertTimeStamp2DateTime/1,
	convertTimeStamp2DateTimeStr/1,

	dateTimeToInt64/1,
	int64ToTimeString/1,
    convert2MysqlDateTimeStr/1
]).

-export([
	getUTCNowMSDiff2010/0,
	getDayBeginSeconds/1,
	getWeekBeginSecondsByDay/1,
	diffSecFrom1970/1
]).

-export([
	getSyncTime1970FromDBS/0,
	getSyncUTCTime1970FromDBS/0,
	getLocalTimeAdjustHour/0,
	getSyncTimeFromDBS/0,
	getSyncUTCTimeFromDBS/0
]).

-export([
	getLogTimeSec/0,
    now_microseconds/0
]).

now_microseconds() ->
    time2:getTimestampMicroSeconds().

%% ====================================================================
%% 以下为获取函数
%% ====================================================================
%获取当前中国时间，精确到秒，主要用于日志记录使用
%返回{{Year,Month,Day}, {Hour,Minute,Second}}
-spec getChinaNowDateTime1970() -> datetime1970().
getChinaNowDateTime1970() ->
	time2:getLocalDateTime().

%获取本地时间，精确到秒，主要用于除日志外的其它使用
%返回{{Year,Month,Day}, {Hour,Minute,Second}}
-spec getLocalNowDateTime1970() -> datetime1970().
getLocalNowDateTime1970() ->
	time2:getLocalDateTime().

%获取本地时间秒数
-spec getLocalNowSec1970() -> dateTimeSec1970().
getLocalNowSec1970() ->
	time2:getLocalDateTimeSec().

%%获取UTC时间，精确到秒
-spec getUTCNowDateTime1970() -> datetime1970().
getUTCNowDateTime1970() ->
	time2:getUTCDateTime().

%%获取当前UTC的绝对日期时间的秒数
-spec getUTCNowSec1970() -> dateTimeSec1970().
getUTCNowSec1970() ->
	time2:getUTCDateTimeSec().

%获取当前相对于1970-1-1 0:0:0的UTC时间差，精确到秒，相当于Unix时间
-spec getUTCNowSec() -> dateTimeSec().
getUTCNowSec() ->
	time2:getTimestampSec().

%获取当前相对于1970-1-1 0:0:0的UTC时间差，精确到毫秒，相当于Unix时间
-spec getUTCNowMS() -> dateTimeMS().
getUTCNowMS() ->
	time2:getTimestampMS().

%%获取从2010年到现在的时间差，单位：毫秒
-spec getUTCNowMSDiff2010() -> uint().
getUTCNowMSDiff2010() ->
	NowMS = getUTCNowMS(),
	Sec = diffSecFrom1970({{2010,1,1},{0,0,0}}),
	NowMS - Sec * 1000.

%%获取本地时间的调整时区，由DBS同步过来的
-spec getLocalTimeAdjustHour() -> int().
getLocalTimeAdjustHour() ->
	time2:getTimezoneSec() div 3600.

%%获取从DBS同步过来的本地绝对时间秒
-spec getSyncTime1970FromDBS() -> uint().
getSyncTime1970FromDBS() ->
	time2:getLocalDateTimeSec().

%%获取从DBS同步过来的绝对UTC时间秒
-spec getSyncUTCTime1970FromDBS() -> uint().
getSyncUTCTime1970FromDBS() ->
	time2:getUTCDateTimeSec().

%%获取从DBS同步过来的本地相对时间，单位秒
getSyncTimeFromDBS() ->
	time2:getTimestampSec() + time2:getTimezoneSec().

%%获取从DBS同步过来的相对UTC时间秒
-spec getSyncUTCTimeFromDBS() -> uint().
getSyncUTCTimeFromDBS() ->
	time2:getTimestampSec().

%%==========================================================================
%%以下为转换函数
%%==========================================================================

%%根据date,time，返回的时间是中性的，本地时间 unix时间都可以用
-spec diffSecFrom1970(DateTime) -> int() when DateTime::datetime1970().
diffSecFrom1970(DateTime) ->
    Seconds1 = calendar:datetime_to_gregorian_seconds(DateTime),
    Seconds2 = calendar:datetime_to_gregorian_seconds({{1970,1,1}, {0,0,0}}),
    Seconds1 - Seconds2.

%%返回本地时间今天开始那1s，是本地时间
-spec getDayBeginSeconds(DateTime) -> uint() when DateTime::datetime1970() | datetime().
getDayBeginSeconds({{Year,Month,Day},{_Hour,_Min,_Sec}}) ->
	time2:convertDateTimeToSec({{Year,Month,Day},{0,0,0}}).

%%返回本周一开始的秒数,是本地时间
-spec getWeekBeginSecondsByDay(DateTime)-> uint() when DateTime::datetime1970() | datetime().
getWeekBeginSecondsByDay({{Year,Month,Day},{_Hour,_Min,_Sec}})->
	DayOfWeek = calendar:day_of_the_week(Year, Month, Day),
	TodayBegin = calendar:datetime_to_gregorian_seconds( {{Year,Month,Day},{0,0,0}} ),
	(TodayBegin - (DayOfWeek - 1) * 86400).

%%转换一个日期时间为秒
-spec convertDateTime1970ToSec(CreateTime) -> uint() when CreateTime ::datetime1970() | datetime().
convertDateTime1970ToSec({{Year,Month,Day}, {Hour,Minute,Second}}) ->
	calendar:datetime_to_gregorian_seconds({{Year,Month,Day}, {Hour,Minute,Second}}).

%%转换一个相对或者绝对秒为日期时间，不作1970年的校正
-spec convertSec2DateTime(Sec) -> datetime() | datetime1970() when Sec::dateTimeSec1970() | dateTimeSec().
convertSec2DateTime(Sec) ->
	calendar:gregorian_seconds_to_datetime(Sec).

%%转换一个相对或者绝对秒为日期时间的字符串，不作1970年的校正
-spec convertSec2DateTimeStr(Sec) -> string() when Sec::dateTimeSec1970() | dateTimeSec().
convertSec2DateTimeStr(Sec) ->
	time2:convertSecToTimeStr(Sec).

%%将一个由os:timestamp()换算的相对1970年的秒转换为绝对日期时间
-spec convertTimeStamp2DateTime(Sec) -> datetime1970() when Sec::dateTimeSec().
convertTimeStamp2DateTime(Sec) ->
	calendar:gregorian_seconds_to_datetime(Sec + ?SECS_FROM_0_TO_1970).

%%将一个由os:timestamp()换算的相对1970年的秒转换为绝对日期时间字符串
-spec convertTimeStamp2DateTimeStr(Sec) -> string() when Sec::dateTimeSec().
convertTimeStamp2DateTimeStr(Sec) ->
	time2:convertSecToTimeStr(Sec + ?SECS_FROM_0_TO_1970).

dateTimeToInt64(DateTime) ->
	time2:mysqlDateTimeToSec(DateTime).

int64ToTimeString(Time) when erlang:is_integer(Time) ->
	time2:secToMysqlTimeStr(Time).

convert2MysqlDateTimeStr(0) ->
	"1970-01-01 00:00:00";
convert2MysqlDateTimeStr({datetime,{{Y,M,D},{H,Min,S}}}) ->
	io_lib:format("~p/~p/~p ~p:~p:~p",[Y,M,D,H,Min,S]).

%%获取日志记录所需要的本地时间（相对于1970年的时间）秒
-spec getLogTimeSec() -> uint().
getLogTimeSec() ->
	time2:getTimestampSec().

%%获取时区偏移时间秒
getTimeZoonSec()->
	time2:getTimezoneSec().