%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%        支线任务
%%% @end
%%% Created : 21. 六月 2017 16:50
%%%-------------------------------------------------------------------
-module(playerSideTask).
-author("Administrator").

-include("../activity/activityPrivate.hrl").
-include("playerPrivate.hrl").

-define(SideTaskEventType_Activity, 1).
-define(SideTaskEventType_LevelUp, 2).

-define(SideTaskCheckSecond, 20).
-define(SideTaskTickAtom,'sideTaskTickCheck').
%% API
-export([
	tickSideTask/0,
	onLevelUp/1,
	joinCompleteTask/1,
	onTaskComplete/2
]).


joinCompleteTask(MapID)->
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		%%魔神地宫成就统计
		#mapsettingCfg{type = ?MapTypeCopyMap, subtype = ?MapSubTypeDemonBattle} ->
			playerTask:updateTask(?TaskSubType_Active, ?TaskSubType_Active_Sub_ShouHuNvShen);
		#mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeDarkness} ->
			playerTask:updateTask(?TaskSubType_Active, ?TaskSubType_Active_Sub_ShenHong);
		#mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeWorldBoss} ->
			playerTask:updateTask(?TaskSubType_Active, ?TaskSubType_Active_Sub_ShouLingRuQing);
		#mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeSnowman} ->
			playerTask:updateTask(?TaskSubType_Active, ?TaskSubType_Active_Sub_XueRen);
		#mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeDate} ->
			playerTask:updateTask(?TaskSubType_Active, ?TaskSubType_Active_Sub_YueHui);
		#mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeDatebox} ->
			playerTask:updateTask(?TaskSubType_Active, ?TaskSubType_Active_Sub_YueHui);
		#mapsettingCfg{type = ?MapTypeCopyMap, subtype = ?MapSubTypeSpiritArea} ->
			playerTask:updateTask(?TaskSubType_Active, ?TaskSubType_Active_Sub_HunDun);
		_ ->
			skip
	end,
	ok.

tickSideTask()->
	case canCheckNow() of
		true ->
			doCheckSideTask();
		_ ->
			skip
	end.


canCheckNow()->
	case get(?SideTaskTickAtom) of
		undefined ->
			put(?SideTaskTickAtom, 1),
			true;
		V ->
			put(?SideTaskTickAtom, V + 1),
			V rem ?SideTaskCheckSecond =:= 0
	end.


doCheckSideTask()->

	ActivityList = getCfg:get2KeyList(cfg_task_other, 1),


	lists:foreach(
		fun(ActivityID) ->
			Phase = activityMgrOtp:getActivityPhase(ActivityID),
			addActivityTask(ActivityID, Phase)
		end, ActivityList),
	ok.

onLevelUp(NewLevel)->
	{L,_} =  getCfgTaskList(?SideTaskEventType_LevelUp, NewLevel),
	[addTask(TaskID) || TaskID <- L],
	ok.


getCfgTaskList(Type, ID)->
	Level = playerState:getLevel(),
	case getCfg:getCfgByKey(cfg_task_other, Type, ID) of
		#task_otherCfg{taskid = L, level = LimitLevel, loop = Loop} when Level>= LimitLevel ->
			{L, Loop};
		_ ->
			{[], 0}
	end.


addActivityTask(_ActivityID, ?ActivityPhase_Close)->
	skip;
addActivityTask(ActivityID, _Phase)->
	{L, Loop} = getCfgTaskList(?SideTaskEventType_Activity, ActivityID),
	#activityCfg{} = getCfg:getCfgByKey(cfg_activity, ActivityID),
	[addTask(TaskID) || TaskID <- L, isCanAccept(TaskID, Loop)],
%%	?DEBUG_OUT("Activity[~p][~p],addtask[~w]",[ActivityID, Phase, L]),
	ok.

addTask(TaskID)->
	case playerTask:isAcceptedTaskByID(TaskID) of
		false ->
			playerTask:acceptTask(TaskID, 0);
		_ ->
			skip
	end.

onTaskComplete(?TaskMainType_Side, TaskID)->
	addCompleteTask(TaskID);
onTaskComplete(_TaskType, _TaskID)->
	skip.

isCanAccept(TaskID, Loop)->
	L = getCompleteTask(),
	lists:member(TaskID, L) =:= false andalso
		(Loop =:= 1 orelse playerTask:isSubmittedTaskByID(TaskID) =:= false).

addCompleteTask(TaskID)->
	L = getCompleteTask(),
	case L of
		[] ->
			playerDaily:incDailyCounter(?DailyType_SideTaskFlag, 0),
			playerPropSync:setAny(?SerProp_SideTaskCompleteList, [TaskID]);
		_ ->
			case lists:member(TaskID, L) of
				true ->
					skip;
				_ ->
					playerDaily:incDailyCounter(?DailyType_SideTaskFlag, 0),
					playerPropSync:setAny(?SerProp_SideTaskCompleteList, [TaskID | L])
			end
	end,
	ok.

getCompleteTask()->
	V = playerDaily:getDailyCounter(?DailyType_SideTaskFlag, 0),
	case V > 0 of
		true ->
			playerPropSync:getProp(?SerProp_SideTaskCompleteList);
		_ ->
			[]
	end.