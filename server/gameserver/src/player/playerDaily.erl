%%
%% @author zhongyunawei
%% @doc @todo 玩家每日计数器.


-module(playerDaily).
-author(zhongyuanwei).

-include("playerPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	initDailyCounter/1,
	incDailyCounter/2,
	addDailyCounter/3,
	getDailyCounter/2,
	reduceDailyCounter/3,
	zeroDailyCount/2,
	incCounter/3,
	resetDailyCount/0
]).

-export([sendToClient/0]).

%%初始化每日计数器
-spec initDailyCounter([#rec_daily_counter0{},...]) -> ok.
initDailyCounter(List) ->
	playerState:setDailyCounterList(List),

	%% 立即重置一次
	resetDailyCount(List),
	ok.

-spec sendToClient() -> ok.
sendToClient() ->
	List = playerState:getDailyCounterList(),
	case List of
		[] ->
			skip;
		_ ->
			init2Client(List)
	end,
	ok.

%%增加每日计数
-spec incDailyCounter(Type, ID) -> ok when Type::dailyType(), ID::uint().
incDailyCounter(Type, ID) when Type >= ?DailyType_Min andalso Type =< ?DailyType_Max ->
	addDailyCounter(Type, ID, 1).

%%增加多个每日计数
-spec addDailyCounter(Type, ID, Count) -> ok when Type::dailyType(), ID::uint(), Count::uint().
addDailyCounter(Type, ID, Count) when Type >= ?DailyType_Min andalso Type =< ?DailyType_Max ->
	addDailyCounter2(Type, ID, Count).

%%获取计数器
-spec getDailyCounter(Type, ID) -> uint() when Type::dailyType(),ID::uint().
getDailyCounter(Type, ID) when Type >= ?DailyType_Min andalso Type =< ?DailyType_Max ->
	getCounter(Type, ID).

%%减少每日计数
-spec reduceDailyCounter(Type, ID, Count) -> ok when Type::dailyType(), ID::uint(), Count::uint().
reduceDailyCounter(Type, ID, Count) ->
    reduceDailyCounter2(Type, ID, Count).

%% 清零某项dailycounter
-spec zeroDailyCount(Type::dailyType(), ID::uint()) -> ok.
zeroDailyCount(Type, ID) ->
	case playerState:getDailyCounterList() of
		[] ->
			skip;
		List ->
			DailyType = getDailyType(Type, ID),
			case lists:keyfind(DailyType, #rec_daily_counter0.dailyType, List) of
				#rec_daily_counter0{} ->
					%% 原来有，清零
					NewDaily = #rec_daily_counter0{
						roleID = {playerState:getRoleID(),DailyType},
						dailyType = DailyType,
						lastUpdateTime = time:getSyncTime1970FromDBS(),
						counter = 0
					},
					NList = lists:keystore(DailyType, #rec_daily_counter0.dailyType, List, NewDaily),
					playerState:setDailyCounterList(NList),

					%% 通知客户端
					NewValue = getCounter(Type, ID),
					change2Client(Type, ID, NewValue),

					ok;
				_ ->
					skip
			end
	end,
	ok.

%% 重置计数
-spec resetDailyCount() -> ok.
resetDailyCount() ->
	?DEBUG_OUT("resetDailyCount:~p",[playerState:getRoleID()]),
	case playerState:getDailyCounterList() of
		List when erlang:is_list(List) ->
			resetDailyCount(List);
		_ ->
			skip
	end,

	%% 重置其它数据

	%% 重置“环任务”状态
	%% 该流程本身已经重置了每日计数，因此即将执行的这个函数不再重置每日计数
	playerLoopTask:onReset(resetDailyCount, {false, false, false}),

	ok.

%% ====================================================================
%% Internal functions
%% ====================================================================
-spec resetDailyCount([#rec_daily_counter0{},...]) -> ok.
resetDailyCount([]) ->
	ok;
resetDailyCount([#rec_daily_counter0{dailyType = DailyType}|List]) ->
	<<Type:10,ID:54>> = <<DailyType:64>>,
	resetDailyCount(Type, ID),

	case playerState:isFirstEnterMap() of
		false ->
			NewValue = getCounter(Type, ID),
			change2Client(Type, ID, NewValue);
		_ ->
			skip
	end,

	resetDailyCount(List).

%%判断计数器是否需要重置，如果需要，则重置，否则什么都不做
-spec resetDailyCount(Type::dailyType(), ID::uint()) -> #rec_daily_counter0{} | 0.
resetDailyCount(Type, ID) ->
	DailyType = getDailyType(Type, ID),
	List = playerState:getDailyCounterList(),
	case lists:keyfind(DailyType, #rec_daily_counter0.dailyType, List) of
		#rec_daily_counter0{lastUpdateTime = LastUpdateTime, counter = C} = Daily ->
			NowTime = time:getSyncTime1970FromDBS(),
			{NewDaily, IsReset} =
				case core:timeIsOnDay(LastUpdateTime, NowTime) of
					true ->
						%% 不需要重置
						{Daily, false};
					_ ->
						%% 需要重置
						NDaily = Daily#rec_daily_counter0{counter = 0, lastUpdateTime = NowTime},
						NL = lists:keystore(DailyType, #rec_daily_counter0.dailyType, List, NDaily),
						playerState:setDailyCounterList(NL),
						{NDaily, true}
				end,

			%% 这个坑爹功能要处理，资源找回
			playerFindRes:dailyReset(Type, ID, IsReset, C, NowTime),
			NewDaily;
		_ ->
			0
	end.

%%增加多个每日计数实现fun
-spec addDailyCounter2(Type::dailyType(), ID::uint(), uint()) -> ok.
addDailyCounter2(0, _ID, _Count) ->
	ok;
addDailyCounter2(_Type, _ID, 0) ->
	ok;
addDailyCounter2(Type, ID, Count) when Count > 0 ->
	incCounter(Type, ID),
	addDailyCounter2(Type, ID, Count - 1).

%%减少多个每日计数实现
-spec reduceDailyCounter2(Type::dailyType(), ID::uint(), uint()) -> ok.
reduceDailyCounter2(0, _ID, _Count) ->
    ok;
reduceDailyCounter2(_Type, _ID, 0) ->
    ok;
reduceDailyCounter2(Type, ID, Count) when Count > 0 ->
	reduceCounter(Type, ID),
    reduceDailyCounter2(Type, ID, Count - 1).

%%减少计数器
-spec reduceCounter(Type,ID) -> ok when Type::uint(), ID::uint().
reduceCounter(Type, ID) ->
	resetDailyCount(Type, ID),
    DailyType = getDailyType(Type, ID),
    NowTime = time:getSyncTime1970FromDBS(),
    NL = case playerState:getDailyCounterList() of
             [] ->
                 [#rec_daily_counter0{roleID = {playerState:getRoleID(),DailyType}, dailyType = DailyType, lastUpdateTime = NowTime, counter = 0}];
             List ->
                 NewDaily =
                     case lists:keyfind(DailyType, #rec_daily_counter0.dailyType, List) of
                         #rec_daily_counter0{counter = Count} = Daily ->
                             Daily#rec_daily_counter0{counter = Count - 1, lastUpdateTime = NowTime};
                         _ ->
                             #rec_daily_counter0{roleID = {playerState:getRoleID(),DailyType}, dailyType = DailyType, lastUpdateTime = NowTime, counter = 0}
                    end,
                 lists:keystore(DailyType, #rec_daily_counter0.dailyType, List, NewDaily)
         end,
    playerState:setDailyCounterList(NL),
    NewValue = getCounter(Type, ID),
    change2Client(Type, ID, NewValue),
    ok.


%%增加计数器
-spec incCounter(Type,ID) -> ok when Type::uint(),ID::uint().
incCounter(Type,ID) ->
	incCounter(Type,ID,undefined).

incCounter(Type,ID,CountVal) ->
	resetDailyCount(Type, ID),
	DailyType = getDailyType(Type, ID),
	NowTime = time:getSyncTime1970FromDBS(),
	NL = case playerState:getDailyCounterList() of
		     [] ->
			     [#rec_daily_counter0{roleID = {playerState:getRoleID(),DailyType}, dailyType = DailyType, lastUpdateTime = NowTime, counter = 1}];
		     List ->
			     NewDaily = 
					 case CountVal of
						 undefined ->
							 case lists:keyfind(DailyType, #rec_daily_counter0.dailyType, List) of
								 #rec_daily_counter0{counter = Count} = Daily ->
									 Daily#rec_daily_counter0{counter = Count + 1, lastUpdateTime = NowTime};
								 _ ->
									 #rec_daily_counter0{roleID = {playerState:getRoleID(),DailyType}, dailyType = DailyType, lastUpdateTime = NowTime, counter = 1}
							 end;
						 _ ->
							 #rec_daily_counter0{roleID = {playerState:getRoleID(),DailyType}, dailyType = DailyType, lastUpdateTime = NowTime, counter = CountVal}
					 end,
			     lists:keystore(DailyType, #rec_daily_counter0.dailyType, List, NewDaily)
	     end,
	playerState:setDailyCounterList(NL),
	
	NewValue = getCounter(Type, ID),
	change2Client(Type, ID, NewValue),
	ok.

%%获取计数器
-spec getCounter(Type,ID) -> uint() when Type::uint(),ID::uint().
getCounter(0, _ID) -> 0;
getCounter(Type, ID) ->
	%% 优化一下计数器，如果没有取到，则不重置，也不需要保存
	case playerState:getDailyCounterList() of
		[] -> 0;
		List ->
			DailyType = getDailyType(Type, ID),
			case lists:keyfind(DailyType, #rec_daily_counter0.dailyType, List) of
				#rec_daily_counter0{} ->
					%% 先重置
					case resetDailyCount(Type, ID) of
						#rec_daily_counter0{counter = Count} -> Count;
						_ -> 0
					end;
				_ -> 0
			end
	end.

%% 获取每日限制类型
-spec getDailyType(Type::dailyType(), ID::uint()) -> uint64().
getDailyType(Type, ID) ->
	<<DailyType:64>> = <<Type:10,ID:54>>,
	%% 18014398509481984 =:= 2的54次方 =:= 16#40000000000000
	case erlang:is_integer(ID) andalso ID >= 0 andalso ID < 16#40000000000000 of
		true ->
			skip;
		_ ->
			?ERROR_OUT("getDailyType error roleID=~p,Type=~p,ID=~p", [playerState:getRoleID(), Type, ID])
	end,
	DailyType.

%% 初始化通知
-spec init2Client(List) ->ok when 
  List::[] | [#rec_daily_counter0{},...].
init2Client([]) ->
	send2Client([]);
init2Client([#rec_daily_counter0{}|_] = List) ->
	PlayerDailyCountList = lists:foldl(fun
										  (#rec_daily_counter0{dailyType=TypeAndID },Acc) ->
											   <<Type:10,ID:54>> = << TypeAndID:64 >>,
											   Value = getCounter(Type,ID),
											   
											   [#pk_PlayerDailyCount{
																	 dailyType = Type, 
																	 dailyID = ID, 
																	 dailyValue =Value
																	} | Acc]
									   end, [], List),
	send2Client(PlayerDailyCountList).

%% 计算改变后，通知client
-spec change2Client(Type::integer(),ID::integer(),Value::integer()) ->ok.
change2Client(Type,ID,Value) ->
	PlayerDailyCount = #pk_PlayerDailyCount{
							   dailyType = Type, 
							   dailyID = ID, 
							   dailyValue =Value
							  },
	send2Client([PlayerDailyCount]).

%% 把需要客户端知道的每日计算值通知给client
-spec send2Client(PlayerDailyCountList) ->ok
when PlayerDailyCountList::[#pk_PlayerDailyCount{},...]|[].
send2Client([PlayerDailyCountHD |_] = PlayerDailyCountList) when PlayerDailyCountList==[] orelse erlang:is_record(PlayerDailyCountHD, pk_PlayerDailyCount)->
	Msg = #pk_GS2U_SendPlayerDailyCountList{playerDailyCountList = PlayerDailyCountList},
	playerMsg:sendNetMsg(Msg),
	ok;
send2Client(_PlayerDailyCountList) ->
	ok.
