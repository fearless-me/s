%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 玩家时钟模块
%%% @end
%%% Created : 04. 二月 2015 15:01
%%%-------------------------------------------------------------------
-module(playerClock).
-author("tiancheng").

-include("playerPrivate.hrl").

%% API
-export([
	loadClock/1,		% 加载时钟数据
	saveClock/0,		% 定时保存时钟
	startClock/4,		% 开启一个时钟
	getClock/2,			% 获取一个时钟的剩余时间
	getClock/1,			% 获取指定时钟所有子类型以及剩余时间
	delClock/2			% 删除时钟
]).

%% 开始计时，返回剩余时间
-spec startClock(ClockType::clockType(), ClockSubType::uint(), OffTime::?ClockOffTime | ?ClockNotOffTime, LengthTime::uint()) -> uint().
startClock(ClockType, ClockSubType, OffTime, LengthTime)
	when ClockType >= ?ClockType_Min andalso ClockType < ?ClockType_Max
		 andalso (OffTime =:= ?ClockOffTime orelse OffTime =:= ?ClockNotOffTime)
		 andalso erlang:is_integer(LengthTime) andalso LengthTime > 0 ->
	RoleID = playerState:getRoleID(),
	NowTime = time:getSyncTime1970FromDBS(),
	Key = getClockKey(ClockType, ClockSubType),
	Rec = #rec_player_clock{
		roleID = {RoleID, Key},
		clockType = Key,
		offTime = OffTime,
		startTime = NowTime,
		lastTime = NowTime,
		lengthTime = LengthTime,
		passTime  = 0
	},

	%% 计算之后再返回
	case calcClock(Rec, false, true) of
		#rec_player_clock{passTime = PTime, lengthTime = LTime} = NRec ->
			?LOG_OUT("startClock:~p", [NRec]),
			LTime - PTime;
		_ ->
			?ERROR_OUT("startClock failed:~p", [Rec]),
			0
	end.

%% 获取时钟剩余时间，返回0表示失效
-spec getClock(ClockType::clockType(), ClockSubType::uint()) -> uint().
getClock(ClockType, ClockSubType) when ClockType >= ?ClockType_Min; ClockType < ?ClockType_Max ->
	Key = getClockKey(ClockType, ClockSubType),
	case getClockRec(Key) of
		#rec_player_clock{} = Clock ->
			case calcClock(Clock, false, false) of
				#rec_player_clock{passTime = PTime, lengthTime = LTime} ->
					LTime - PTime;
				_ ->
					0
			end;
		_ ->
			0
	end.

%% 获取指定ClockType下的所有ClockSubType
-spec getClock(ClockType::clockType()) -> [{SubType::uint(), SYTime::uint()},...] | [].
getClock(ClockType) when ClockType >= ?ClockType_Min; ClockType < ?ClockType_Max ->
	List = playerPropSync:getProp(?SerProp_PlayerClockCache),
	Fun = fun(#rec_player_clock{clockType = Key} = Clock, AccList) ->
		{Type, SubType} = getClockType(Key),
		case Type =:= ClockType of
			true ->
				SYTime = case calcClock(Clock, false, false) of
							#rec_player_clock{passTime = PTime, lengthTime = LTime} ->
								LTime - PTime;
							_ ->
								0
						end,
				%% 只返回有效的时钟
				case SYTime > 0 of
					true ->
						[{SubType, SYTime} | AccList];
					_ ->
						AccList
				end;
			_ ->
				AccList
		end
	end,
	lists:foldl(Fun, [], List).

%% 删除计时器
-spec delClock(ClockType::clockType(), ClockSubType::uint()) -> boolean().
delClock(ClockType, ClockSubType) when ClockType >= ?ClockType_Min; ClockType < ?ClockType_Max ->
	Key = getClockKey(ClockType, ClockSubType),
	case getClockRec(Key) of
		#rec_player_clock{} = Clock ->
			%% 从内存中删除
			L = playerPropSync:getProp(?SerProp_PlayerClockCache),
			NL = lists:keydelete(Key, #rec_player_clock.clockType, L),
			playerPropSync:setString(?SerProp_PlayerClockCache, NL),

			%% 从数据库中删除
			deleteClock(Clock),
			true;
		_ ->
			false
	end.

%% 加载时钟
-spec loadClock([#rec_player_clock{},...] | #rec_player_clock{} | []) -> ok.
loadClock([]) ->
	ok;
loadClock(#rec_player_clock{startTime = STime, lastTime = LTime} = Clock) ->
%% 	?DEBUG_OUT("loadClock:~p", [Clock]),
	StartTime = case erlang:is_list(STime) of
					true ->
						%% 是从缓存中加载的
						Sec1 = getDateTimeByStr(STime),
						time:convertDateTime1970ToSec(Sec1);
					_ ->
						time:dateTimeToInt64(STime)
				end,
	LastTime = case erlang:is_list(LTime) of
				   true ->
					   Sec2 = getDateTimeByStr(LTime),
					   time:convertDateTime1970ToSec(Sec2);
				   _ ->
					   time:dateTimeToInt64(LTime)
			   end,

	NClock = Clock#rec_player_clock{startTime = StartTime, lastTime = LastTime},
	calcClock(NClock, true, true),
	ok;
loadClock([#rec_player_clock{} = Clock|RightList] = List) when erlang:is_list(List) ->
	loadClock(Clock),
	loadClock(RightList).

getDateTimeByStr(TimeStr) ->
	case TimeStr of
		[Year,_,Month,_,Day,_,Hour,_,Minute,_,Second] ->
			{{erlang:list_to_integer(Year),erlang:list_to_integer(Month),erlang:list_to_integer(Day)},
			 {erlang:list_to_integer(Hour),erlang:list_to_integer(Minute),erlang:list_to_integer(Second)}};
		_ ->
			?ERROR_OUT("getDateTimeByStr:~p,~p", [playerState:getRoleID(),TimeStr]),
			TimeStr
	end.

%% 定时保存时钟
-spec saveClock() -> ok.
saveClock() ->
	L = playerPropSync:getProp(?SerProp_PlayerClockCache),
	[calcClock(Clock, false, true) || Clock <- L],
	ok.

%% 立即计算一下时钟(注意是中途计算还是角色上线加载)
-spec calcClock(#rec_player_clock{}, IsPlayerLoad::boolean(), IsSaveDB::boolean()) -> #rec_player_clock{} | boolean().
calcClock(#rec_player_clock{clockType = Type, offTime = OffTime, lastTime = LastTime, passTime = PassTime} = Clock, IsPlayerLoad, IsSaveDB) ->
	NowTime = time:getSyncTime1970FromDBS(),
	NClock = case OffTime of
				 ?ClockOffTime ->
					 %% 下线同样计时，计算已经过去的时间
					 NPassTime = PassTime + (NowTime - LastTime),
					 Clock#rec_player_clock{lastTime = NowTime, passTime = NPassTime};
				 ?ClockNotOffTime ->
					 NPTime = case IsPlayerLoad of
								  true ->
									  PassTime;
								  _ ->
									  PassTime + (NowTime - LastTime)
							  end,
					 %% 下线不计时，要去掉下线的时间差，且已过去的时间不增加
					 Clock#rec_player_clock{lastTime = NowTime, passTime = NPTime}
			 end,
	L = playerPropSync:getProp(?SerProp_PlayerClockCache),
	{NL, Ret} = case isValid(NClock) of
					true ->
						case IsSaveDB of
							true ->
								%% 保存数据库
								saveClock(NClock);
							_ ->
								skip
						end,

						%% 还有时间，保存到内存
						{lists:keystore(Type, #rec_player_clock.clockType, L, NClock), NClock};
					_ ->
						%% 失效了
						deleteClock(NClock),

						%% 从内存中删除
						{lists:keydelete(Type, #rec_player_clock.clockType, L), false}
				end,
	%% 保存缓存
	playerPropSync:setString(?SerProp_PlayerClockCache, NL),
	Ret.

%% 保存时钟计数
saveClock(#rec_player_clock{startTime = STime, lastTime = LTime} = Clock) ->
	StartTime = convertClockTime(STime),
	LastTime = convertClockTime(LTime),
	playerSave:savePlayerClock(Clock#rec_player_clock{startTime = StartTime, lastTime = LastTime}),
	ok.

convertClockTime(TimeSec) when erlang:is_integer(TimeSec) andalso TimeSec > 0 ->
	{datetime,time:convertSec2DateTime(TimeSec)};
convertClockTime(_) ->
	{datetime,{{1970,1,1},{0,0,0}}}.

%% 删除时钟
deleteClock(#rec_player_clock{} = SC) ->
	playerSave:savePlayerClock(SC#rec_player_clock{clockType = 0}),
	ok.

getClockRec(ClockType) ->
	L = playerPropSync:getProp(?SerProp_PlayerClockCache),
	lists:keyfind(ClockType, #rec_player_clock.clockType, L).

isValid(#rec_player_clock{passTime = PTime, lengthTime = LTime}) ->
	PTime < LTime.

%% 获取计数器key值
getClockKey(Type, SubType) ->
	<<Key:64>> = <<Type:10, SubType:54>>,
	Key.

%% 获取计时器的type,subtype
getClockType(Key) ->
	<<Type:10, SubType:54>> = <<Key:64>>,
	{Type, SubType}.