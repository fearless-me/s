%%
%% @doc @todo 玩家任务模块模块.

%% 新增任务类型
%% 1.task.hrl 增加定义
%% 2.initTask_type
%% 3.initTask_subtype_common / initTask_subtype_**
%% 4.updateTask
%% 5.addPlusNumber
-module(playerTask).

-include("playerPrivate.hrl").


%%: 接任务时给的buff；完成或者放弃时自动删除
%%: 如果有buff，填写buffID
%%: 【buff给予时机，buff id】
%%: 任务阶段
%%: 1.任务开始
%%: 2.到达任务目标（采集、npc...等）
%%: 3.任务完成
%%: [{任务阶段，对话groupID}}
%%: buff id-buff表的id
-define(BuffEventAny, 0).
-define(BuffEventOnAccept, 1).
-define(BuffEventOnDoing, 2).
-define(BuffEventOnSubmit, 3).
-define(BuffEventOnCancel, 4).
-define(BuffEventOnReset, 5).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
%%	onLogin/1,
	triggerTaskBuff/1,
	acceptTask/2,
	cancelTask/1,
	submitTask/3,
	sendAllCompleteTaskMsg/0,
	sendAllAcceptedTaskMsg/0,
	requestTalkToNpc/1,
	isAcceptedTaskByID/1,
	isSubmittedTaskByID/1,
	getCollectObjectIDByCode/1,
	canSubmitTask/2,
	resetTask/1,
	giveTaskAwardForLoopTask/1    % for playerLoopTask
]).

-export([
	gmSubmitTask/1,
	gmAddCompleteTask/1
]).


-export([
	updateTask/2,
	updateTask/3,
	taskTriggerEventOnEnterMap/1
]).

triggerTaskBuff(TaskID)->
	 case getTaskFromAcceptedListByID(TaskID) of
		 #rec_task{}->
			 dealTaskBuff(?BuffEventOnDoing, getTaskCfgByID(TaskID)),
			 ok;
		 _ ->
			 skip
	 end,
	ok.

gmAddCompleteTask(TaskID) ->
	addSubmittedTask(TaskID),
	ok.

-spec gmSubmitTask(TaskID) -> ok
	when TaskID :: uint().
gmSubmitTask(TaskID) when erlang:is_integer(TaskID) andalso TaskID > 0 ->
	Task = getTaskFromAcceptedListByID(TaskID),
	case Task of
		#rec_task{} ->
			completeTask(Task, 0);    %% GM命令目前仅能提交单人任务
		_ ->
			skip
	end,
	TaskID.
%% ====================================================================
%%同步已经完成的所有任务到客户端
-spec sendAllCompleteTaskMsg() -> ok.
sendAllCompleteTaskMsg() ->
	L = playerState:getSubmittedTask(),
	Fun = fun({Slot, V}, AccIn) ->
		[#pk_SubmittedTaskInfo{slot = Slot, value = V} | AccIn]
	      end,
	List = lists:foldl(Fun, [], L),
	playerMsg:sendNetMsg(#pk_GS2U_CompleteTaskList{list = List}),
	ok.
%% ====================================================================
%%同步已经接取的所有任务到客户端
-spec sendAllAcceptedTaskMsg() -> ok.
sendAllAcceptedTaskMsg() ->
	AllAcceptedTask = playerState:getAcceptedTask(),
	InfoList = [makeMsgInfoFromRec(Task) || Task <- AllAcceptedTask],
	playerMsg:sendNetMsg(#pk_GS2U_TaskList{list = InfoList}),
	ok.
%% ====================================================================
%%处理对话任务
-spec requestTalkToNpc(Code) -> ok when Code :: uint().
requestTalkToNpc(Code) ->
	playerMsg:sendNetMsg(#pk_GS2U_TalkToNpcResult{
		result = ?TaskLogAccept,
		code = Code
	}),

	case playerState:getNpcByCode(Code) of
		#recMapObject{id = NpcID} ->
			updateTask(?TaskSubType_Talk, NpcID);
		_ ->
			skip
	end,
	ok.

%% ====================================================================
taskTriggerEventOnEnterMap(MapID)->
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeNormal} ->
			ok;
		#mapsettingCfg{} ->
			triggerEventOnEnterMap(MapID);
		_ ->
			ok
	end,
	ok.
%% ====================================================================
triggerEventOnEnterMap(MapID)->
	L = filterAcceptTask(?TaskSubType_Convoy, MapID),
	doTriggerEventOnEnterMap(L),
	ok.

doTriggerEventOnEnterMap([])->
	ok;
doTriggerEventOnEnterMap([#rec_task{taskSubType = ?TaskSubType_Convoy, taskID = TaskID} | L])->
	case getTaskCfgByID(TaskID) of
		#taskCfg{target_conf =[_CopyMapID, _MonsterID,_StartWID,_EndWID]} = Cfg->
			triggerEvent(Cfg);
		_ ->
			ok
	end,
	doTriggerEventOnEnterMap(L).
%% ====================================================================
updateTask(Type, Key, Target) ->
	updateTask0(Type, Key, Target).

updateTask(?TaskSubType_UseItem, Code) ->
	case playerState:getUseItemByCode(Code) of
		#recMapObject{id = UseObjID} ->
			updateTask0(?TaskSubType_UseItem, UseObjID, 0);
		_ ->
			skip
	end;
updateTask(Type, Target) ->
	updateTask0(Type, Target, Target).

updateTask0(Type, Key, Target) ->
	L = filterAcceptTask(Type, Key, Target),
	updateTask1(L).

updateTask1([]) ->
	ok;
updateTask1([#rec_task{} = Task | L]) ->
	updateTask2(Task),
	updateTask1(L).

updateTask2(
	#rec_task{
		taskID = TaskID,
		taskSubType = SubType,
		taskTargetCur = Cur,
		taskTargetMax = Max
	} = Task
) ->
	%%
	case canAddPlus(TaskID) of
		true ->
			NewCur = curNumber(0, SubType, TaskID, Cur, Max),
			NewTask = Task#rec_task{taskTargetCur = NewCur},
			%%
			L1 = playerState:getAcceptedTask(),
			L2 = lists:keystore(TaskID, #rec_task.taskID, L1, NewTask),
			playerState:setAcceptedTask(L2),
			%%
			playerMsg:sendNetMsg(#pk_GS2U_UpdateTask{info = makeMsgInfoFromRec(NewTask)}),
			ok;
		_ ->
			0
	end.


filterAcceptTask(Type, FilterKey) ->
	L1 = playerState:getAcceptedTask(),
	lists:filter(
		fun(R) ->
			#rec_task{
				taskSubType = SubType,
				taskKey = TaskKey,
				taskTargetCur = Cur,
				taskTargetMax = Max
			} = R,
			SubType =:= Type andalso
				TaskKey =:= FilterKey andalso
				Cur < Max

		end, L1).

filterAcceptTask(Type, FilterKey, FilterTarget) ->
	L1 = playerState:getAcceptedTask(),
	lists:filter(
		fun(R) ->
			#rec_task{
				taskTarget = TaskTarget,
				taskSubType = SubType,
				taskKey = TaskKey,
				taskTargetCur = Cur,
				taskTargetMax = Max
			} = R,
			SubType =:= Type andalso
				TaskKey =:= FilterKey andalso
				Cur < Max andalso
				(TaskTarget =:= 0 orelse TaskTarget =:= FilterTarget)

		end, L1).

canAddPlus(TaskID) ->
	PlayerLevel = playerState:getLevel(),
	case getTaskCfgByID(TaskID) of
		#taskCfg{level_limit = LevelLimit} ->
			PlayerLevel >= LevelLimit;
		_ ->
			false
	end.

curNumber(TC, _Type, _TID, _Cur, _Max) when TC > 0 ->
	TC;
curNumber(_TC, ?TaskSubType_CollectItem, TaskID, Cur, Max) ->
	case getTaskCfgByID(TaskID) of
		#taskCfg{target_conf = Params} ->
			case Params of
				[_MonsterID, _ItemID, CMin, CMax] ->
					RX = misc:rand(CMin, CMax),
					Cur + misc:clamp(RX, 1, Max - Cur);
				_ ->
					Cur + 1
			end;
		_ ->
			Cur
	end;
curNumber(_TC, ?TaskSubType_Drop, TaskID, Cur, Max) ->
	case getTaskCfgByID(TaskID) of
		#taskCfg{target_conf = Params} ->
			case Params of
				[_] ->
					Cur + misc:clamp(1, 1, Max - Cur);
				_ ->
					Cur + 1
			end;
		_ ->
			Cur
	end;
curNumber(_TC, _Type, _TID, Cur, _Max) ->
	Cur + 1.


%% ====================================================================
%%放弃任务
-spec cancelTask(TaskID) -> ok when TaskID :: uint().
cancelTask(TaskID) ->
	case canCancelTask(TaskID) of
		{true, _} ->
			%% 1取消任务,2通知client ,3保存log
			deleteTask(TaskID, ?TaskLogCancel);
		{false, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok.

canCancelTask(TaskID) ->
	case isAcceptedTaskByID(TaskID) of
		true ->
			#taskCfg{type = TaskType} = getTaskCfgByID(TaskID),
			{canCancelTask1(TaskType), -2};
		_ ->
			{false, ?ErrorCode_TaskFailed_IsNotExit}
	end.

canCancelTask1(?TaskMainType_Main) ->
	false;
canCancelTask1(_) ->
	true.

%%
resetTask(TaskID) ->
	case isAcceptedTaskByID(TaskID) of
		true ->
			doResetTask(TaskID);
		_ ->
			{false, ?ErrorCode_TaskFailed_IsNotExit}
	end.

doResetTask(TaskID) ->
	L1 = playerState:getAcceptedTask(),
	Task = lists:keyfind(TaskID, #rec_task.taskID, L1),
	NewTask = Task#rec_task{taskTargetCur = 0},
	L2 = lists:keystore(TaskID, #rec_task.taskID, L1, NewTask),
	playerState:setAcceptedTask(L2),
	%%
	playerMsg:sendNetMsg(#pk_GS2U_UpdateTask{info = makeMsgInfoFromRec(NewTask)}),
	dealTaskBuff(?BuffEventOnReset, getTaskCfgByID(TaskID)),
	taskTriggerEventImmediately(getTaskCfgByID(TaskID)).

%% ====================================================================
%%接收任务
-spec acceptTask(TaskID, NPCCode) -> boolean()
	when TaskID :: uint(), NPCCode :: uint().
acceptTask(0, _) ->
	?ERROR_OUT("Player:~p Error AcceptTaskID:0", [playerState:getRoleID()]),
	false;
acceptTask(TaskID, _NPCCode) -> doAcceptTask(TaskID).

doAcceptTask(TaskID) ->
	case canAcceptTask(TaskID) of
		{true, Task} ->
			addNewTask(Task, true),
			true;
		{false, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode),
			false
	end.

canAcceptTask(TaskID) ->
	case getTaskCfgByID(TaskID) of
		#taskCfg{type = Type} ->
			%% 主线任务可以直接接
			%% 支线任务个数单独判断，不能超过?TaskAcceptedSideMax
			%% 总任务个数不能超过?TaskAcceptedMax
			{CurSideAccepted, CurAccepted} = getAcceptedTaskCurCount(),
			CanAccept =
				case Type of
					?TaskMainType_Side ->
						CurSideAccepted < ?TaskAcceptedSideMax;
					_ ->
						true
				end,
			case Type =:= ?TaskMainType_Main
				orelse (CanAccept andalso CurAccepted < ?TaskAcceptedMax) of
				true ->
					IsAccepted = isAcceptedTaskByID(TaskID),
					IsCompleted =
						case Type of
							?TaskMainType_Main ->
								isSubmittedTaskByID(TaskID);
							_ ->
								false
						end,
					case IsAccepted =:= false andalso IsCompleted =:= false of
						true ->
							Task = initTask(TaskID),
							case Task of
								#rec_task{} ->
									{true, Task};
								_ ->
									{false, ?ErrorCode_TaskFailed_AcceptFail}
							end;
						_ ->
							{false, ?ErrorCode_TaskFailed_IsExit}
					end;
				_ ->
					{false, ?ErrorCode_TaskFailed_IsMax}
			end;
		_ ->
			{false, ?ErrorCode_TaskFailed_IsNotExit}
	end.
%% ====================================================================

%%提交完成任务
-spec submitTask(TaskID, Code, PartnerRoleID) -> ok
	when TaskID :: uint(), Code :: uint(), PartnerRoleID :: uint64().
submitTask(TaskID, Code, PartnerRoleID) ->
	case canSubmitTask(TaskID, Code) of
		{true, Task} ->
			%%远程提交任务
			completeTask(Task, PartnerRoleID);
		{false, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok.

%% 是否能完成指定任务
-spec canSubmitTask(TaskID :: uint(), Code :: uint()) -> {boolean(), uint()}.
canSubmitTask(TaskID, Code) ->
	#taskCfg{submit_task_npc = NpcID1, type = TaskType} = getTaskCfgByID(TaskID),
	%% LUN-4475 【协议测试】【家族任务】在角色未加入家族情况下，可以使用协议直接发送请求接收家族任务和完成家族任务
	case TaskType of
		?TaskMainType_EveryDay ->
			case playerState:getGuildID() of
				0 ->
					{false, ?ErrorCode_GuildNotJoin};
				_ ->
					canSubmitTask(TaskID, Code, NpcID1, TaskType)
			end;
		_ ->
			canSubmitTask(TaskID, Code, NpcID1, TaskType)
	end.

-spec canSubmitTask(TaskID :: uint(), Code :: uint(), NpcID1 :: uint(), TaskType :: uint()) -> {boolean(), uint()}.
canSubmitTask(TaskID, Code, NpcID1, TaskType) ->
	case isAcceptedTaskByID(TaskID) of
		true ->
			%%近程提交
			NpcID =
				case TaskType of
					?TaskMainType_Marriage ->
						0;  %%情缘任务忽略距离
					_->
						NpcID1
				end,
			case checkNpcDist(NpcID, Code) of
				{true, _} ->
					Task = getTaskFromAcceptedListByID(TaskID),
					case isCanSubmit(Task) of
						true ->
							{true, Task};
						_ ->
							{false, ?ErrorCode_TaskFailed_NotCondition}
					end;
				{false, ErrorCode} ->
					%%此处不能提交任务,返回错误码
					{false, ErrorCode}
			end;
		false ->
			{false, ?ErrorCode_TaskFailed_NotAccept}
	end.

%%判断任务个数是否达到提交个数
-spec isCanSubmit(Task) -> boolean() when Task :: term().
isCanSubmit(Task) ->
	case Task of
		#rec_task{taskTargetCur = Cur, taskTargetMax = Max} ->
			Cur >= Max;
		_ ->
			false
	end.
%% ====================================================================

%%创建任务数据
-spec initTask(TaskID) -> undefined | #rec_task{}
	when TaskID :: uint().
initTask(TaskID) when TaskID > 0 ->
	Cfg = getTaskCfgByID(TaskID),
	case Cfg of
		#taskCfg{} ->
			TaskRec = #rec_task{
				roleID = playerState:getRoleID(),
				taskID = Cfg#taskCfg.id,
				taskType = Cfg#taskCfg.type,
				taskSubType = Cfg#taskCfg.sub_type
			},
			initTask_type(Cfg#taskCfg.type, TaskRec, Cfg);
		_E ->
			undefined
	end;
initTask(TaskID) ->
	?ERROR_OUT("makeTask taskId:~p", [TaskID]),
	undefined.

%%%-------------------------------------------------------------------
initTask_type(?TaskMainType_Main, TaskRec, Cfg) ->
	initTask_subtype_common(TaskRec, Cfg);
initTask_type(?TaskMainType_EveryDay, TaskRec, Cfg) ->
	initTask_subtype_common(TaskRec, Cfg);
initTask_type(?TaskMainType_Marriage, TaskRec, Cfg) ->
	initTask_subtype_common(TaskRec, Cfg);
initTask_type(?TaskMainType_Link, TaskRec, Cfg) ->
	initTask_subtype_link(TaskRec, Cfg);
initTask_type(_Type, TaskRec, Cfg) ->
	initTask_subtype_common(TaskRec, Cfg).

%%
initTask_subtype_link(TaskRec, _Cfg) ->
	TaskRec#rec_task{taskKey = 0, taskTarget = 0, taskTargetMax = 0}.

%%
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_Monster, target_conf = [MonsterID, MonsterNum]}
) ->
	TaskRec#rec_task{taskKey = MonsterID, taskTarget = MonsterID, taskTargetMax = MonsterNum};
%%
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_Talk, target_conf_params = [0, _]}
) ->
	TaskRec#rec_task{taskKey = 0, taskTarget = 0, taskTargetMax = 0};

initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_Talk, target_conf_params = [NpcDataID, _]}
) ->
	TaskRec#rec_task{taskKey = NpcDataID, taskTarget = NpcDataID, taskTargetMax = 1};
%%
initTask_subtype_common(
	TaskRec,
	#taskCfg{
		sub_type = ?TaskSubType_CollectItem,
		target_conf = [_ItemID, Num, _RandMin, _RandMax],
		target_conf_params = [CollectionID, _]}
) ->
	TaskRec#rec_task{taskKey = CollectionID, taskTarget = 0, taskTargetMax = Num};
%%
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_Drop, target_conf = [MonsterID, _ItemID, Num, _Rate]}
) ->
	TaskRec#rec_task{taskKey = MonsterID, taskTarget = 0, taskTargetMax = Num};
%%
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_UseItem, target_conf = [ItemID, Num]}
) ->
	TaskRec#rec_task{taskKey = ItemID, taskTarget = ItemID, taskTargetMax = Num};
%%
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_CopyMap, target_conf = [CopyMapID]}
) ->
	TaskRec#rec_task{taskKey = CopyMapID, taskTarget = CopyMapID, taskTargetMax = 1};
%%
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_MiniCopy, target_conf = [MiniMapID]}
) ->
	TaskRec#rec_task{taskKey = MiniMapID, taskTarget = MiniMapID, taskTargetMax = 1};
%%
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_Operation, target_conf = [ItemID | _]}
) ->
	TaskRec#rec_task{taskKey = ItemID, taskTarget = ItemID, taskTargetMax = 0};
%%
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_CareerChang, target_conf = [ChangeState]}
) ->
	TaskRec#rec_task{taskKey = ChangeState, taskTarget = ChangeState, taskTargetMax = 1};
%%
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_Active, target_conf = [ActiveID, Num]}
) ->
	TaskRec#rec_task{taskKey = ActiveID, taskTarget = ActiveID, taskTargetMax = Num};
%%
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_System, target_conf = [?TaskSubType_System_Sub_Tinker, Quality]}
) ->
	TaskRec#rec_task{taskKey = ?TaskSubType_System_Sub_Tinker, taskTarget = Quality, taskTargetMax = 1};
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_System, target_conf = [EventID], target_conf_params = [Num]}
) ->
	TaskRec#rec_task{taskKey = EventID, taskTarget = EventID, taskTargetMax = Num};
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_Convoy,  target_conf = [0,MonsterID,0,0]} = Cfg
) ->
	TaskRec#rec_task{taskKey = MonsterID, taskTarget = MonsterID, taskTargetMax = convoyTaskTargetNumber(Cfg)};
initTask_subtype_common(
	TaskRec,
	#taskCfg{sub_type = ?TaskSubType_Convoy, target_conf = [CopyMapID, MonsterID,_SW,_EW]} = Cfg
) ->
	TaskRec#rec_task{taskKey = CopyMapID, taskTarget = MonsterID, taskTargetMax = convoyTaskTargetNumber(Cfg)};
%%
initTask_subtype_common(TaskRec, TaskCfg) ->
	?ERROR_OUT("TaskRec:~p,TaskCfg:~p", [TaskRec, TaskCfg]),
	undefined.


convoyTaskTargetNumber(#taskCfg{target_conf = [CopyMapID, _MonsterID,_SW,_EW]}) when CopyMapID > 0 ->
	1;
convoyTaskTargetNumber(_)->
	0.
%% ====================================================================

%%保存新接取的任务
-spec addNewTask(TaskAccepted, Notify) -> ok
	when TaskAccepted :: #rec_task{}, Notify :: boolean().
addNewTask(#rec_task{} = Task, Notify) ->
	%% 1添加任务
	?DEBUG_OUT("addNewTask(~p,~p)", [playerState:getRoleID(), Task#rec_task.taskID]),
	NewList = lists:keystore(Task#rec_task.taskID,
		#rec_task.taskID,
		playerState:getAcceptedTask(),
		Task),
	playerState:setAcceptedTask(NewList),

	%%2通知client
	case Notify of
		true ->
			playerMsg:sendNetMsg(#pk_GS2U_AcceptTask{
				info = makeMsgInfoFromRec(Task)});
		false ->
			skip
	end,

	%%3保存log
	dbLog:sendSaveLogTask(
		playerState:getRoleID(),
		Task#rec_task.taskID,
		playerState:getLevel(),
		?TaskLogAccept),

	onAddNewTask(Task#rec_task.taskID),
	addOrDeletePet(Task#rec_task.taskID),
	ok.

addOrDeletePet(TaskID) ->
	case getCfg:getCfgPStack(cfg_globalsetup, temporary_pet_taskid) of
		#globalsetupCfg{setpara = TaskPetList} ->
			case lists:keyfind(TaskID, 1, TaskPetList) of
				{TaskID, OP, PetID} ->
					case OP of
						1 ->
							%% 获得骑宠并出战上马
							case playerPet:checkPetIsExist(PetID) of
								false ->
									case playerPet:petMake(PetID) of
										false ->
											?ERROR_OUT("addOrDeletePet:~p,~p", [playerState:getRoleID(), TaskID]),
											ok;
										_ ->
											playerPet:petOnMount(),
											ok
									end;
								_ -> skip
							end;
						2 ->
							%% 删除骑宠
							playerPet:delPetByID(PetID);
						3 ->
							%% 上马
							playerPet:petSwitch(PetID);
						4 ->
							%% 下马
							playerPet:petOffMount(false);
						_ -> skip
					end;
				_ -> skip
			end;
		[] -> skip
	end,
	ok.

%% ====================================================================
dealTaskBuff(?BuffEventOnAccept,#taskCfg{give_buff = AddBuffList, del_buff = DelBuffList})->
	addBuffWithFilter(true, ?BuffEventOnAccept, AddBuffList),
	addBuffWithFilter(false, ?BuffEventOnAccept, DelBuffList),
	ok;

dealTaskBuff(?BuffEventOnSubmit,#taskCfg{give_buff = AddBuffList, del_buff = DelBuffList})->
	addBuffWithFilter(true, ?BuffEventOnSubmit, AddBuffList),
	addBuffWithFilter(false, ?BuffEventOnSubmit, DelBuffList),
	ok;
dealTaskBuff(?BuffEventOnDoing,#taskCfg{give_buff = AddBuffList, del_buff = DelBuffList})->
	addBuffWithFilter(true, ?BuffEventOnDoing, AddBuffList),
	addBuffWithFilter(false, ?BuffEventOnDoing, DelBuffList),
	ok;
%% 下面两种是特殊情况
dealTaskBuff(?BuffEventOnCancel,#taskCfg{give_buff = AddBuffList})->
	addBuffWithFilter(false, ?BuffEventAny, AddBuffList),
	ok;
dealTaskBuff(?BuffEventOnReset,#taskCfg{give_buff = AddBuffList})->
	addBuffWithFilter(false, ?BuffEventAny, AddBuffList),
	ok;
dealTaskBuff(_Op,#taskCfg{})->
	ok.

addBuffWithFilter(true, EventID, BuffList) when is_list(BuffList)->
	Level = playerState:getLevel(),
	[playerBuff:addBuff(BuffID, Level) ||
		{Event, BuffID} <- BuffList
		, Event =:= EventID orelse EventID =:= ?BuffEventAny],
	ok;
addBuffWithFilter(false, EventID, BuffList) when is_list(BuffList)->
	[playerBuff:delBuff(BuffID) ||
		{Event, BuffID} <- BuffList
		, Event =:= EventID orelse EventID =:= ?BuffEventAny],
	ok;
addBuffWithFilter(_IsAdd, _EventID, _BuffList)->
	ok.



%% ====================================================================
onAddNewTask(TaskID)->
	#taskCfg{type = TaskType} = Cfg = getTaskCfgByID(TaskID),
	case TaskType of
		?TaskMainType_Marriage ->
			playerDaily:incDailyCounter(?DailyType_MarriageTask, 0);
		_ ->
			skip
	end,
	dealTaskBuff(?TaskLogAccept, Cfg),
	taskTriggerEventImmediately(Cfg),
	IsSubmitted = isSubmittedTaskByID(TaskID),
	playerMainMenu:onFuncIsOpenByMainMenu(?MainMenuType_TaskIDA, TaskID, IsSubmitted),
	ok.
%% ====================================================================
taskTriggerEventImmediately(#taskCfg{sub_type = ?TaskSubType_Convoy, target_conf = [0, _MonsterID, 0, 0]} = Cfg)->
	triggerEvent(Cfg),
	ok;
taskTriggerEventImmediately(_Cfg)->
	ok.


%% ====================================================================
triggerEvent(#taskCfg{
	id = TaskID,
	sub_type = ?TaskSubType_Convoy,
	target_conf = [0,MonsterID,0,0]
})->
	playerConvoy:init(MonsterID, {task, TaskID});
triggerEvent(#taskCfg{
	sub_type = ?TaskSubType_Convoy,
	target_conf = [_CopyMapID, MonsterID,StartWID,EndWID]
})->
	playerConvoy:init(MonsterID, {waypoint, StartWID, EndWID});
triggerEvent(_)->
	skip.

%% ====================================================================

%%NPC检查
checkNpcDist(0, _NpcCode) ->
	{true, 0};
checkNpcDist(NpcDataID, NpcCode) ->
	{X, Y} = playerState:getPos(),
	Npc = playerState:getNpcByCode(NpcCode),
	case Npc of
		notFound ->
			{false, ?ErrorCode_TaskFailed_TooFarFromNpc};
		#recMapObject{id = NpcDataID} ->

			DistSQ = misc:calcDistSquare(X, Y, Npc#recMapObject.x, Npc#recMapObject.y),
			case DistSQ > ?TalkToNpc_Distance * ?TalkToNpc_Distance of
				true ->
					{false, ?ErrorCode_TaskFailed_TooFarFromNpc};
				false ->
					{true, 0}
			end;
		_ ->
			{false, ?ErrorCode_TaskFailed_TooFarFromNpc}
	end.
%% ====================================================================

%%保存新完成的任务
-spec completeTask(TaskAccepted, PartnerRoleID) -> ok
	when TaskAccepted :: #rec_task{}, PartnerRoleID :: uint64().
completeTask(#rec_task{taskID = TaskID, taskType = TaskType}, PartnerRoleID) ->
	?DEBUG_OUT("completeTask(~p,~p)", [playerState:getRoleID(), TaskID]),
	try
		addSubmittedTask(TaskID),
		deleteTask(TaskID, ?TaskLogSubmit),
		giveTaskAward(TaskID, PartnerRoleID),
%%		playerGoddess:autoActiveCard(TaskID),
		playerAchieve:achieveEvent(?Achieve_Task, [1]),
		%%如果是日常任务，则自动接取下一个任务
		playerLoopTask:onTaskComplete(TaskType, TaskID),
		playerSideTask:onTaskComplete(TaskType, TaskID),
%%		playerWing:needInitWingLevel(playerState:getLevel()),
		onCompleteTask(getTaskCfgByID(TaskID)),
		ok
	catch
		_ : Error ->
			?ERROR_OUT("~p", [Error])
	end,
	%%添加任务完成log
	addNextTask(TaskID),
	ok.

addNextTask(TaskID) ->
	case getTaskCfgByID(TaskID) of
		#taskCfg{auto_next = L} ->
			[doAcceptTask(NextTask) || NextTask <- L, NextTask > 0];
		_ ->
			skip
	end.

onCompleteTask(#taskCfg{sub_type = ?TaskSubType_Convoy})->
	playerConvoy:convoySuccess( ),
	ok;
onCompleteTask(_)->
	skip.

%% ====================================================================
%%添加提交任务
-spec addSubmittedTask(TaskID) -> ok when TaskID :: uint16().
addSubmittedTask(TaskID) ->
	IsSubmitted = isSubmittedTaskByID(TaskID),
	Slot = TaskID div 64,
	Mod = TaskID rem 64,
	L = playerState:getSubmittedTask(),
	V = case lists:keyfind(Slot, 1, L) of
		    {Slot, Value} ->
			    Value;
		    _ ->
			    0
	    end,
	V1 = V bor (1 bsl Mod),
	L1 = lists:keystore(Slot, 1, L, {Slot, V1}),
	playerState:setSubmittedTask(L1),
	playerMsg:sendNetMsg(#pk_GS2U_AddNewCompleteTask{taskID = TaskID, result = 1}),
	playerMainMenu:onFuncIsOpenByMainMenu(?MainMenuType_TaskIDS, TaskID, IsSubmitted),
	ok.

%% ====================================================================
deleteTask(TaskID, Reason) ->
	L = lists:keydelete(TaskID, #rec_task.taskID, playerState:getAcceptedTask()),
	playerState:setAcceptedTask(L),
	playerMsg:sendNetMsg(#pk_GS2U_DeleteAcceptTask{
		taskID = TaskID, result = Reason}),
	%%添加任务完成log
	dealTaskBuff(Reason, getTaskCfgByID(TaskID)),
	dbLog:sendSaveLogTask(playerState:getRoleID(), TaskID, playerState:getLevel(), Reason).

%% ====================================================================
%%任务奖励
-spec giveTaskAward(TaskID, PartnerRoleID) -> ok
	when TaskID :: uint(), PartnerRoleID :: uint64()|0.
giveTaskAward(TaskID, PartnerRoleID) ->
	case getTaskCfgByID(TaskID) of
		#taskCfg{
			reward_exp = Exp,
			reward_coins = CoinList,
			reward_item = RewardItemList,
			reward_equips = RewardEquipList,
			reward_spcials = SpecialList
		} ->
			%%奖励经验(策划可能会不填，不填则表示不奖励)
			case erlang:is_integer(Exp) andalso Exp > 0 of
				true ->
					playerBase:addExp(Exp, ?ExpSourceTask, TaskID);
				_ ->
					skip
			end,
			rewardCoin(TaskID, CoinList),
			rewardItem(TaskID, RewardItemList),
			rewardEquip(TaskID, RewardEquipList),
			rewardSpecial(TaskID, SpecialList, PartnerRoleID),
			ok;
		_ ->
			skip
	end,
	ok.

%% ====================================================================
%%任务奖励（环任务专用）
-spec giveTaskAwardForLoopTask(TaskID) -> ok
	when TaskID :: uint().
giveTaskAwardForLoopTask(TaskID) ->
	case getTaskCfgByID(TaskID) of
		#taskCfg{type = ?TaskMainType_EveryDay} ->
			giveTaskAward(TaskID, 0);    %% 环任务始终为单人任务，伙伴ID为0
		_ ->
			?ERROR_OUT("giveTaskAwardForLoopTask TaskID:~p is not loopTask", [TaskID])
	end.

rewardCoin(TaskID, CoinList) when is_list(CoinList) ->
	Fun =
		fun({CoinType, CoinNumber}) ->
			case CoinType of
				?CoinTypeDiamond ->
					?ERROR_OUT("taskID:~p, reward unbind diamond", [TaskID]);
				_ ->
					playerMoney:addCoin(abs(CoinType), CoinNumber,
						#recPLogTSMoney{
							reason = ?CoinSourceTask,
							param = TaskID,
							target = ?PLogTS_PlayerSelf,
							source = ?PLogTS_Task
						}
					)
			end
		end,
	lists:foreach(Fun, CoinList);
rewardCoin(_, _) -> skip.

rewardItem(TaskID, RewardItemList) when is_list(RewardItemList) ->

	Fun = fun({ItemID, ItemNum}) ->
		case erlang:is_integer(ItemID) andalso ItemNum > 0 of
			true ->
				PLog = #recPLogTSItem{
					old = 0,
					new = ItemNum,
					change = ItemNum,
					target = ?PLogTS_PlayerSelf,
					source = ?PLogTS_Task,
					gold = 0,
					goldtype = 0,
					changReason = ?ItemSourceTask,
					reasonParam = TaskID
				},
				playerPackage:addGoodsAndMail(ItemID, ItemNum, true, 0, PLog);
			_ ->
				skip
		end
	      end,
	lists:foreach(Fun, RewardItemList);
rewardItem(_, _) -> skip.
%%装备奖励处理函数
rewardEquip(TaskID, RewardList) when is_list(RewardList) ->
	PlayerCareer = playerState:getCareer(),
	Fun = fun({EquipCareer, EquipID, Quality}) ->
		case PlayerCareer =:= EquipCareer orelse EquipCareer =:= 0 of
			true ->
				playerPackage:addGoodsAndMail(EquipID, 1, true, Quality,
					#recPLogTSItem{
						old = 0,
						new = 1,
						change = 1,
						target = ?PLogTS_PlayerSelf,
						source = ?PLogTS_Task,
						gold = 0,
						goldtype = 0,
						changReason = ?ItemSourceTask,
						reasonParam = TaskID
					});
			false ->
				skip
		end
	      end,
	lists:foreach(Fun, RewardList),
	ok;
rewardEquip(_, _) -> skip.

rewardSpecial(_TaskID, SpecialList, PartnerRoleID) when is_list(SpecialList) ->
	lists:foreach(
		fun(Params) ->
			rewardSpecial1(Params, PartnerRoleID)
		end, SpecialList);
rewardSpecial(_, _, _) -> skip.

rewardSpecial1({?TaskReward_SPT_Buff, _P1, _P2}, _PartnerRoleID) ->
	ok;
rewardSpecial1({?TaskReward_SPT_Liveness, _P1, Value}, _PartnerRoleID) ->
	playerliveness:addTotalLivenessValue(Value);
rewardSpecial1({?TaskReward_SPT_MarriageCloseness, _P1, _Value}, 0) ->
	?ERROR_OUT("?TaskReward_SPT_MarriageCloseness PartnerRoleID is 0");
rewardSpecial1({?TaskReward_SPT_MarriageCloseness, _P1, Value}, PartnerRoleID) ->
	%% LUN-4100 【情缘任务】完成一个情缘任务后，玩家实际亲密度增加值是配置表中的2倍
	%% 排查原因：情缘任务的实现方式为，伴侣双方各领取、完成同样的任务，但增加亲密度时，必须是双方一起增加
	%% 解决方法：仅在队长提交任务时处理增加亲密度
	RoleID = playerState:getRoleID(),
	case teamInterface:isTeamLeader(RoleID) of
		true ->
			?DEBUG_OUT("[DebugForMarriage] RoleID:~w Task Reward Value:~w with PartnerRoleID:~w", [RoleID, Value, PartnerRoleID]),
			playerMarriage:closenessAdd({RoleID, PartnerRoleID, Value, ?ClosenessSource_MarriageTask});
		_ ->
			skip
	end;
rewardSpecial1({?TaskReward_SPT_GuildResource, _P1, Value}, _PartnerRoleID) ->
	%% LUNA-2897 [服务器][每日任务（公会的委托）]每日任务移动到家族中改为家族任务
	%% 新增家族资金奖励，仅在有家族时有效
	case playerState:getGuildID() of
		0 ->
			skip;
		GuildID ->
			playerGuild:addguildresource(GuildID, Value)
	end;
rewardSpecial1({?TaskReward_SPT_GuildLiveness, _P1, Value}, _PartnerRoleID) ->
	%% LUNA-3155 【服务器】【家族任务（原每日任务）】增加单次任务与十环奖励家族活跃配置
	%% 新增家族活跃奖励，仅在有家族时有效
	case playerState:getGuildID() of
		0 ->
			skip;
		GuildID ->
			playerGuild:addguildliveness(GuildID, Value)
	end;
rewardSpecial1({_P0, _P1, _P2}, _PartnerRoleID) ->
	ok.

%-----------------------------------------------------------------------------
makeMsgInfoFromRec(#rec_task{
	taskID = ID,
	taskTarget = Target,
	taskTargetCur = Cur,
	taskTargetMax = Max
}) ->
	#pk_taskInfo{taskID = ID, target = Target, curNumber = Cur, maxNumber = Max}.

%-----------------------------------------------------------------------------

%%根据任务ID获取任务配置
-spec getTaskCfgByID(TaskID) -> undefined | #taskCfg{}
	when TaskID :: uint().
getTaskCfgByID(TaskID) ->
	case getCfg:getCfgPStack(cfg_task, TaskID) of
		#taskCfg{} = TaskCfg ->
			TaskCfg;
		_ ->
			undefined
	end.

%%当前已接取任务数量
-spec getAcceptedTaskCurCount() -> {non_neg_integer(), non_neg_integer()}.
getAcceptedTaskCurCount() ->
	FunFind =
		fun(#rec_task{taskID = TaskID}, {SideCount, Count} = Result) ->
			case getTaskCfgByID(TaskID) of
				#taskCfg{type = ?TaskMainType_Side} ->
					{SideCount + 1, Count + 1};
				#taskCfg{} ->
					{SideCount, Count + 1};
				_ ->
					Result
			end
		end,
	lists:foldl(FunFind, {0, 0}, playerState:getAcceptedTask()).

%%是否已接取某个任务
-spec isAcceptedTaskByID(TaskID) -> boolean()
	when TaskID :: non_neg_integer().
isAcceptedTaskByID(TaskID) ->
	AcceptedTask = playerState:getAcceptedTask(),
	case lists:keyfind(TaskID, #rec_task.taskID, AcceptedTask) of
		#rec_task{} ->
			true;
		_ ->
			false
	end.

%%是否已完成某个任务
-spec isSubmittedTaskByID(TaskID) -> boolean()
	when TaskID :: non_neg_integer().
isSubmittedTaskByID(TaskID) ->
	CompletedTask = playerState:getSubmittedTask(),
	Slot = TaskID div 64,
	case lists:keyfind(Slot, 1, CompletedTask) of
		{Slot, V} ->
			Mod = TaskID rem 64,
			(V band (1 bsl Mod)) > 0;
		_ ->
			false
	end.

%%从接取列表中取出指定的任务
-spec getTaskFromAcceptedListByID(TaskID) -> #rec_task{} | undefined
	when TaskID :: non_neg_integer().
getTaskFromAcceptedListByID(TaskID) ->
	AcceptedTask = playerState:getAcceptedTask(),
	case lists:keyfind(TaskID, #rec_task.taskID, AcceptedTask) of
		#rec_task{} = V ->
			V;
		_ ->
			undefined
	end.

getCollectObjectIDByCode(Code) ->
	CollectItemEts = playerState:getMapCollectEts(),
	case myEts:lookUpEts(CollectItemEts, Code) of
		[#recMapObject{id = ObjectID} | _] ->
			ObjectID;
		_ ->
			0
	end.