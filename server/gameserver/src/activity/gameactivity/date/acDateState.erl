%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%% 活动模块字典
%%% 约会地下城（活动）
%%% @end
%%% Created : 20161202
%%%-------------------------------------------------------------------
-module(acDateState).
-author("meitianyang").

-include("acDatePrivate.hrl").

%% 任意进程可调用的工具类接口
-export([
	checkActiveOpenTime/1,
	checkLevelAndDailyCounter/3,
	getDailyTypeWithActiveID/1,
	getMapIDWithActiveID/1
]).

%% 本进程调用的常规接口
-export([
	getInit/0,
	init/0,
	queryMapInfoHelper/2,
	queryMapInfoHelperAll/1,
	queryMapInfo/1,
	traverseMapInfo/1,
	replaceMapInfo/1,
	deleteMapInfo/1
]).

%%% ====================================================================
%%% Tools functions
%%% ====================================================================

%% 检查活动对应玩法是否处于开放时间
-spec checkActiveOpenTime(DateActiveID::type_daid()) -> boolean().
checkActiveOpenTime(DateActiveID) ->
	case getCfg:getCfgByKey(cfg_appointment, DateActiveID) of
		#appointmentCfg{type = Type, param = List} = Cfg ->
			case Type of
				1 ->
					%% 每日任意时间
					true;
				2 ->
					%% 每周指定几天（从凌晨4点开始算一个天的开始）
					TimeNow_LocalFrom0 = time:getSyncTime1970FromDBS(),
					DateTimeNow = time:convertSec2DateTime(TimeNow_LocalFrom0),
					TimeWeekStart_LocalFrom0 = time:getWeekBeginSecondsByDay(DateTimeNow) + ?ResetTimeHour * 3600,
					TimeDelta = TimeNow_LocalFrom0 - TimeWeekStart_LocalFrom0 + 1,
					DayOfWeek = erlang:trunc(TimeDelta / (24 * 3600)) + 1,
					%%DayOfWeek_ =          %% 记周日为0
					%%	case DayOfWeek of
					%%		7 ->
					%%			0;
					%%		_ ->
					%%			DayOfWeek
					%%	end,
					%?DEBUG_OUT("[DebugForDate] ~p", [{TimeNow_LocalFrom0, TimeWeekStart_LocalFrom0, DateTimeNow, DayOfWeek, List}]),
					FunFind =
						fun(Day, {Mark, _}) ->
							case Day of
								DayOfWeek ->
									{true, 0};
								_ ->
									{Mark, 0}
							end
						end,
					case misc:foldlEx(FunFind, {false, 0}, List) of
						{true, _} ->
							true;
						_ ->
							false
					end;
				_ ->
					?ERROR_OUT("checkActiveOpenTime cfg_appointment.type is invalid~n~p", [Cfg]),
					false
			end;
		_ ->
			?ERROR_OUT("checkActiveOpenTime can not find DateActiveID(~p) from cfg_appointment", [DateActiveID]),
			false
	end.

%% 检查角色等级与进入次数限制
-spec checkLevelAndDailyCounter(DateActiveID::type_daid(), Level::uint(), DailyCount::uint()) -> ok | uint().
checkLevelAndDailyCounter(DateActiveID, Level, DailyCount) ->
	case getCfg:getCfgByKey(cfg_appointment, DateActiveID) of
		#appointmentCfg{level = LevelMin, daily_count = DailyCountMax} ->
			case Level < LevelMin of
				true ->
					?ErrorCode_Date_Level_Limit;
				_ ->
					case DailyCount >= DailyCountMax of
						true ->
							?ErrorCode_Date_DailyCount_Limit;
						_ ->
							ok
					end
			end;
		_ ->
			?ERROR_OUT("checkLevelAndDailyCounter can not find DateActiveID(~p) from cfg_appointment", [DateActiveID]),
			?ErrorCode_Date_Level_Limit
	end.

%% 根据玩法ID获得每日计数类型ID
-spec getDailyTypeWithActiveID(DateActiveID::type_daid()) -> dailyType().
getDailyTypeWithActiveID(?DateActiveID_Link) -> ?DailyType_Date_Link;
getDailyTypeWithActiveID(?DateActiveID_PushBox) -> ?DailyType_Date_PushBox.

%% 根据玩法ID获得地图ID
-spec getMapIDWithActiveID(DateActiveID::type_daid()) -> uint().
getMapIDWithActiveID(DateActiveID) ->
	case getCfg:getCfgByKey(cfg_appointment, DateActiveID) of
		#appointmentCfg{mapid = MapID} ->
			MapID;
		_ ->
			?ERROR_OUT("getMapIDWithActiveID can not find DateActiveID(~p) from cfg_appointment", [DateActiveID]),
			0
	end.

%%% ====================================================================
%%% API functions
%%% ====================================================================

%% 获取初始化标记
-spec getInit() -> boolean().
getInit() ->
	case get('Init') of
		undefined ->
			false;
		_ ->
			true
	end.

%% 初始化
-spec init() -> ok.
init() ->
	ets:new(?EtsMapInfo, [protected, named_table, set, {keypos, #recMapInfo.mapPID}, {write_concurrency, true}, {read_concurrency, true}]),
	ets:new(?EtsMapInfoHelper, [protected, named_table, set, {keypos, #recMapInfoHelper.roleID}, {write_concurrency, true}, {read_concurrency, true}]),
	put('Init', true),  %% 标记已初始化
	ok.

%% 查找地图信息辅助者
-spec queryMapInfoHelper(RoleID::uint64(), DateActiveID::type_daid()) -> #recKeyInfo{} | undefined.
queryMapInfoHelper(RoleID, DateActiveID) ->
	%% 先从辅助表找出另一个角色ID
	case ets:lookup(?EtsMapInfoHelper, RoleID) of
		[#recMapInfoHelper{value = ListKeyInfo}] ->
			FunFind =
				fun(#recKeyInfo{activeID = DateActiveID_} = Rec, {Mark, Result}) ->
					case DateActiveID_ of
						DateActiveID ->
							{true, Rec};
						_ ->
							{Mark, Result}
					end
				end,
			{_, Result} = misc:foldlEx(FunFind, {false, undefined}, ListKeyInfo),
			Result;
		_ ->
			undefined
	end.

%% 查找指定角色的所有辅助者
-spec queryMapInfoHelperAll(RoleID::uint64()) -> [#recKeyInfo{}, ...].
queryMapInfoHelperAll(RoleID) ->
	case ets:lookup(?EtsMapInfoHelper, RoleID) of
		[#recMapInfoHelper{value = ListKeyInfo}] ->
			ListKeyInfo;
		_ ->
			[]
	end.

%% 查找地图信息
-spec queryMapInfo(MapPid::pid()) -> #recMapInfo{} | undefined.
queryMapInfo(MapPid) ->
	case ets:lookup(?EtsMapInfo, MapPid) of
		[#recMapInfo{} = Rec] ->
			Rec;
		_ ->
			undefined
	end.

%% 心跳需要遍历地图数据
-spec traverseMapInfo(Fun::fun()) -> list().
traverseMapInfo(Fun) when erlang:is_function(Fun, 2) ->
	ets:foldl(Fun, [], ?EtsMapInfo).

%% 覆写地图信息
-spec replaceMapInfo(MapInfo::#recMapInfo{}) -> ok.
replaceMapInfo(#recMapInfo{roleID_A = RoleID_A, roleID_B = RoleID_B, mapID = MapID, mapPID = MapPid, activeID = ActiveID} = Rec) ->
	IsAlreadyExists =
		case ets:lookup(?EtsMapInfo, MapPid) of
			[#recMapInfo{mapPID = _MapPid}] ->
				true;
			_ ->
				false
		end,
	ets:insert(?EtsMapInfo, Rec),
	case IsAlreadyExists of
		true ->
			skip;
		_ ->
			%% 新插入时需要更新辅助者信息
			insertMapInfoHelper(
				RoleID_A,
				#recKeyInfo{
					anotherRoleID   = RoleID_B,
					activeID        = ActiveID,
					mapID           = MapID,
					mapPID          = MapPid
				}
			),
			insertMapInfoHelper(
				RoleID_B,
				#recKeyInfo{
					anotherRoleID   = RoleID_A,
					activeID        = ActiveID,
					mapID           = MapID,
					mapPID          = MapPid
				}
			)
	end.

%% 删除地图信息
-spec deleteMapInfo(MapPid::pid()|#recMapInfo{}) -> ok.
deleteMapInfo(#recMapInfo{roleID_A = RoleID_A, roleID_B = RoleID_B, activeID = ActiveID, mapPID = MapPid}) ->
	deleteMapInfoHelper(RoleID_A, RoleID_B, ActiveID),
	deleteMapInfoHelper(RoleID_B, RoleID_A, ActiveID),
	ets:delete(?EtsMapInfo, MapPid),
	ok;
deleteMapInfo(MapPid) ->
	case ets:lookup(?EtsMapInfo, MapPid) of
		[#recMapInfo{roleID_A = RoleID_A, roleID_B = RoleID_B, activeID = ActiveID}] ->
			deleteMapInfoHelper(RoleID_A, RoleID_B, ActiveID),
			deleteMapInfoHelper(RoleID_B, RoleID_A, ActiveID),
			ets:delete(?EtsMapInfo, MapPid);
		_ ->
			skip
	end,
	ok.

%%% ====================================================================
%%% Internal functions
%%% ====================================================================

%% 插入辅助者信息
-spec insertMapInfoHelper(RoleID::uint64(), KeyInfo::#recKeyInfo{}) -> ok.
insertMapInfoHelper(RoleID, KeyInfo) ->
	case ets:lookup(?EtsMapInfoHelper, RoleID) of
		[#recMapInfoHelper{value = ListKeyInfo}] ->
			ets:update_element(?EtsMapInfoHelper, RoleID, {#recMapInfoHelper.value, [KeyInfo | ListKeyInfo]});
		_ ->
			ets:insert(?EtsMapInfoHelper, #recMapInfoHelper{roleID = RoleID, value = [KeyInfo]})
	end,
	ok.

%% 删除辅助者信息
-spec deleteMapInfoHelper(RoleID::uint64(), AnotherRoleID::uint64(), DateActiveID::type_daid()) -> ok.
deleteMapInfoHelper(RoleID, AnotherRoleID, DateActiveID) ->
	case ets:lookup(?EtsMapInfoHelper, RoleID) of
		[#recMapInfoHelper{value = ListKeyInfo}] ->
			FunDelete =
				fun(#recKeyInfo{anotherRoleID = AnotherRoleID_, activeID = ActiveID_} = Rec, Result) ->
					case AnotherRoleID_ =:= AnotherRoleID andalso ActiveID_ =:= DateActiveID of
						true ->
							Result;
						_ ->
							[Rec | Result]
					end
				end,
			ListKeyInfoNew = lists:foldl(FunDelete, [], ListKeyInfo),
			case ListKeyInfoNew of
				[] ->
					ets:delete(?EtsMapInfoHelper, RoleID);
				_ ->
					ets:update_element(?EtsMapInfoHelper, RoleID, {#recMapInfoHelper.value, ListKeyInfoNew})
			end;
		_ ->
			skip
	end,
	ok.
