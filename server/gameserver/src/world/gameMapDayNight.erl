%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 昼夜
%%% @end
%%% Created : 14. 二月 2017 15:44
%%%-------------------------------------------------------------------
-module(gameMapDayNight).
-author("tiancheng").

-include("mapPrivate.hrl").

-export([
	tick/1
]).

-export([
	init/1,
	setMapDay/1,
	getMapDay/0
]).

%% API
-export([
	changeDayNight/1
]).

tick(NowTimeMS) ->
	DNTime = mapState:getLastTickDayNightTime(),
	case NowTimeMS - DNTime > ?DayNightUpdateInternal of
		true ->
			mapState:setLastTickDayNightTime(NowTimeMS),
			Day = gameMapDayNight:getMapDay(),
			NowDay = core:isDay(),
			case Day =/= NowDay of
				true ->
					gameMapDayNight:setMapDay(NowDay),
					gameMapDayNight:changeDayNight(NowDay);
				_ -> skip
			end;
		_ -> skip
	end,
	ok.

%% 地图初始化
-spec init(MapID::uint()) -> ok.
init(MapID) ->
	Day = core:isDay(),

	setMapDay(Day),

	case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
		#mapsettingCfg{day = Days, night = Nights} ->
			case Day of
				true -> fresh(Days);
				false -> fresh(Nights)
			end;
		_ -> skip
	end,
	ok.

%% 设置当前地图昼夜
setMapDay(Day) ->
	mapState:setMapDay(Day).

%% 获取当前地图昼夜
-spec getMapDay() -> boolean().
getMapDay() ->
	mapState:getMapDay().

%% 昼夜改变
-spec changeDayNight(NowDay::boolean()) -> ok.
%% Night --> Day
changeDayNight(true) ->
	MapID = mapState:getMapId(),
	case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
		#mapsettingCfg{day = Days, night = Nights} ->
			recycle(Nights),
			fresh(Days),
			ok;
		_ -> skip
	end,
	ok;
%% Day --> Night
changeDayNight(false) ->
	MapID = mapState:getMapId(),
	case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
		#mapsettingCfg{day = Days, night = Nights} ->
			recycle(Days),
			fresh(Nights),
			ok;
		_ -> skip
	end,
	ok.

%% 回收对象
recycle(undefined) -> ok;
recycle(0) -> ok;
recycle([MonsterIDChaos, NpcIDChaos, CollectIDChaos]) ->
	case MonsterIDChaos > 0 of
		true ->
			{MonsterIDList, _PosList1} = activityCommon:getMonsterOrCollectList(MonsterIDChaos, ?HDBattle_Type_Normal),
			recycleMonsterIDs(MonsterIDList);
		_ -> skip
	end,

	case NpcIDChaos > 0 of
		true ->
			{NpcIDList, _PosList2} = activityCommon:getMonsterOrCollectList(NpcIDChaos, ?HDBattle_Type_Normal),
			recycleNpcIDs(NpcIDList);
		_ -> skip
	end,

	case CollectIDChaos > 0 of
		true ->
			{CollectIDList, _PosList3} = activityCommon:getMonsterOrCollectList(CollectIDChaos, ?HDBattle_Type_Normal),
			recycleCollectIDs(CollectIDList);
		_ -> skip
	end,
	ok.

%% 刷新对象
fresh(undefined) -> ok;
fresh(0) -> ok;
fresh([MonsterIDChaos, NpcIDChaos, CollectIDChaos]) ->
	case MonsterIDChaos > 0 of
		true ->
			{MonsterIDList, PosList1} = activityCommon:getMonsterOrCollectList(MonsterIDChaos, ?HDBattle_Type_Normal),
			freshMonsterIDs(MonsterIDList, PosList1);
		_ -> skip
	end,

	case NpcIDChaos > 0 of
		true ->
			{NpcIDList, PosList2} = activityCommon:getMonsterOrCollectList(NpcIDChaos, ?HDBattle_Type_Normal),
			freshNpcIDs(NpcIDList, PosList2);
		_ -> skip
	end,

	case CollectIDChaos > 0 of
		true ->
			{CollectIDList, PosList3} = activityCommon:getMonsterOrCollectList(CollectIDChaos, ?HDBattle_Type_Normal),
			freshCollectIDs(CollectIDList, PosList3);
		_ -> skip
	end,
	ok.

%% 回收的怪物列表
recycleMonsterIDs([]) -> ok;
recycleMonsterIDs(0) -> ok;
recycleMonsterIDs(MonsterIDList) ->
	MonEts = mapState:getMapMonsterEts(),
	MapPid = self(),
	F =
		fun(#recMapObject{id = MonsterID, pid = Pid, code = Code}, AccL) ->
			case erlang:is_pid(Pid) andalso MapPid =:= Pid andalso lists:member(MonsterID, MonsterIDList) of
				true ->
					[{Code, Pid} | AccL];
				_ ->
					AccL
			end
		end,
	case ets:foldl(F, [], MonEts) of
		[] ->
			skip;
		List ->
			[gameMapLogic:destroyMonster(Code1, Pid1) || {Code1, Pid1} <- List]
	end,
	ok.

%% 回收的NPC列表
recycleNpcIDs([]) -> ok;
recycleNpcIDs(0) -> ok;
recycleNpcIDs(NpcIDList) ->
	NpcEts = mapState:getMapNpcEts(),
	MapPid = self(),
	F =
		fun(#recMapObject{id = NpcID, pid = Pid, code = Code}, AccL) ->
			case erlang:is_pid(Pid) andalso MapPid =:= Pid andalso lists:member(NpcID, NpcIDList) of
				true ->
					[Code | AccL];
				_ ->
					AccL
			end
		end,
	case ets:foldl(F, [], NpcEts) of
		[] ->
			skip;
		List ->
			[gameMapLogic:destroyNpc(Code1, 0) || Code1 <- List]
	end,
	ok.

%% 回收的采集物列表
recycleCollectIDs([]) -> ok;
recycleCollectIDs(0) -> ok;
recycleCollectIDs(CollectIDs) ->
	CollectEts = mapState:getMapCollectEts(),
	MapPid = self(),
	F =
		fun(#recMapObject{id = CollectID, pid = Pid, code = Code}, AccL) ->
			case erlang:is_pid(Pid) andalso MapPid =:= Pid andalso lists:member(CollectID, CollectIDs) of
				true ->
					[Code | AccL];
				_ ->
					AccL
			end
		end,
	case ets:foldl(F, [], CollectEts) of
		[] ->
			skip;
		List ->
			[gameMapLogic:destroyCollect(Code1, 0) || Code1 <- List]
	end,
	ok.

%% 刷新的怪物列表
freshMonsterIDs([], _PosList) -> ok;
freshMonsterIDs(0, _PosList) -> ok;
freshMonsterIDs(MonsterIDList, PosList) ->
	case activityCommon:getAllocList(MonsterIDList, PosList) of
		[] ->
			skip;
		MonsterList ->
			copyMapScheduleInit:addMonsterToMap(0, MonsterList, ?AddMonsterRange)
	end,
	ok.

%% 刷新的Npc列表
freshNpcIDs([], _PosList) -> ok;
freshNpcIDs(0, _PosList) -> ok;
freshNpcIDs(NpcIDList, PosList) ->
	case activityCommon:getAllocList(NpcIDList, PosList) of
		[] ->
			skip;
		NpcList ->
			copyMapScheduleInit:addNpcToMap(0, NpcList, ?AddMonsterRange)
	end,
	ok.

%% 刷新的采集物列表
freshCollectIDs([], _PosList) -> ok;
freshCollectIDs(0, _PosList) -> ok;
freshCollectIDs(CollectIDList, PosList) ->
	case activityCommon:getAllocList(CollectIDList, PosList) of
		[] ->
			skip;
		CollectList ->
			copyMapScheduleInit:addCollectToMap(0, CollectList, ?AddMonsterRange)
	end,
	ok.