%%
%% @doc @todo 玩家任务模块模块.

%% 新增任务类型
%% 1.task.hrl 增加定义
%% 2.initTask1
%% 2.updateTask
-module(playerTask).

-include("playerPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
%%	onLogin/1,
	acceptTask/2,
	cancelTask/1,
	submitTask/2,
	gmSubmitTask/1,
	sendAllCompleteTaskMsg/0,
	sendAllAcceptedTaskMsg/0,
	requestTalkToNpc/1,
	isAcceptedTaskByID/1,
	isSubmittedTaskByID/1,
	getCollectObjectIDByCode/1,
	canSubmitTask/2,
	resetTask/1,
	giveTaskAwardForLoopTask/1	% for playerLoopTask
]).


-export([
	updateTask/2
]).

%%onLogin(Level) when Level  < 2 ->
%%	case canAcceptTask(?FirstTaskID) of
%%		{true, Task} ->
%%			addNewTask(Task, false);
%%		_ ->
%%			skip
%%	end;
%%onLogin(_)-> skip.

-spec gmSubmitTask(TaskID) -> ok
	when TaskID::uint().
gmSubmitTask(TaskID) when erlang:is_integer(TaskID) andalso TaskID > 0 ->
	Task = getTaskFromAcceptedListByID(TaskID),
	case Task of
		#rec_task{} ->
			completeTask(Task);
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
		#recMapObject{id = NpcID}->
			updateTask(?TaskType_Talk, NpcID);
		_ ->
			skip
	end,
	ok.

%% ====================================================================
updateTask(?TaskType_UseItem, Code) ->
	case playerState:getUseItemByCode(Code) of
		#recMapObject{id = UseObjID} ->
			updateTask0(?TaskType_UseItem, UseObjID);
		_ ->
			skip
	end;
%%updateTask(?TaskType_CollectItem, Code) ->
%%	#recMapObject{id = CollectObjID} = playerState:getCollectByCode(Code),
%%	updateTask0(?TaskType_CollectItem, CollectObjID),
%%	refreshCollect(Code, CollectObjID);
updateTask(Type, Target) -> updateTask0(Type, Target).

updateTask0(Type, Target)->
	L = filterAcceptTask(Type, Target),
	updateTask1(L).

updateTask1([]) ->
	ok;
updateTask1([#rec_task{} = Task | L]) ->
	updateTask2(Task),
	updateTask1(L).

updateTask2(#rec_task{taskID = TaskID, taskSubType = SubType,
	taskTargetCur = Cur, taskTargetMax = Max} = Task
) ->
	%%
	case canAddPlus(TaskID) of
		true ->
			AddPlus = addPlusNumber(SubType, TaskID, Cur, Max),
			NewTask = Task#rec_task{taskTargetCur = Cur + AddPlus},
			%%
			L1 = playerState:getAcceptedTask(),
			L2 = lists:keystore(TaskID, #rec_task.taskID, L1, NewTask),
			playerState:setAcceptedTask(L2),
			%%
			playerMsg:sendNetMsg(#pk_GS2U_UpdateTask{info = makeMsgInfoFromRec(NewTask)});
		_ ->
			0
	end.

filterAcceptTask(Type, Param) ->
	L1 = playerState:getAcceptedTask(),
	lists:filter(
		fun(R) ->
			#rec_task{
				taskSubType = SubType,
				taskKey = Key,
				taskTargetCur = Cur,
				taskTargetMax = Max
			} = R,
			SubType =:= Type andalso Param =:= Key andalso Cur < Max
		end, L1).

canAddPlus(TaskID)->
	PlayerLevel = playerState:getLevel(),
	case getTaskCfgByID(TaskID) of
		#taskCfg{level_limit = LevelLimit} ->
			PlayerLevel >= LevelLimit;
		_ ->
			false
	end.

addPlusNumber(?TaskType_CollectItem, TaskID, Cur, Max) ->
	case getTaskCfgByID(TaskID) of
		#taskCfg{target_conf = Params} ->
			case Params of
				[_MonsterID,_ItemID, CMin, CMax] ->
					RX = misc:rand(CMin, CMax),
					misc:clamp(RX, 1, Max - Cur);
				_ ->
					1
			end;
		_ ->
			0
	end;
addPlusNumber(?TaskType_Drop, TaskID, Cur, Max) ->
	case getTaskCfgByID(TaskID) of
		#taskCfg{target_conf = Params} ->
			case Params of
				[_] ->
					misc:clamp(1, 1, Max - Cur);
				_ ->
					1
			end;
		_ ->
			0
	end;
addPlusNumber(_, _, _, _) -> 1.


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
resetTask(TaskID)->
	case isAcceptedTaskByID(TaskID) of
		true ->
			doResetTask(TaskID);
		_ ->
			{false, ?ErrorCode_TaskFailed_IsNotExit}
	end.

doResetTask(TaskID)->
	L1 = playerState:getAcceptedTask(),
	Task = lists:keyfind(TaskID, #rec_task.taskID, L1),
	NewTask = Task#rec_task{taskTargetCur = 0},
	L2 = lists:keystore(TaskID, #rec_task.taskID, L1, NewTask),
	playerState:setAcceptedTask(L2),
	%%
	playerMsg:sendNetMsg(#pk_GS2U_UpdateTask{info = makeMsgInfoFromRec(NewTask)}).

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
	CurAccepted = getAcceptedTaskCurCount(),
	case CurAccepted >= ?TaskAcceptedMax of
		false ->
			IsAccepted = isAcceptedTaskByID(TaskID),
			IsCompleted =
				case getTaskCfgByID(TaskID) of
					#taskCfg{type = ?TaskMainType_Main} ->
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
						_E ->
							{false, ?ErrorCode_TaskFailed_AcceptFail}
					end;
				_ ->
					{false, ?ErrorCode_TaskFailed_IsExit}
			end;
		true ->
			{false, ?ErrorCode_TaskFailed_IsMax}
	end.
%% ====================================================================

%%提交完成任务
-spec submitTask(TaskID, Code) -> ok
	when TaskID :: uint(), Code :: uint().
submitTask(TaskID, Code) ->
	case canSubmitTask(TaskID, Code) of
		{true, _} ->
			%%远程提交任务
			doSubmitTask(TaskID);
		{false, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok.

%% 是否能完成指定任务
-spec canSubmitTask(TaskID::uint(), Code::uint()) -> {boolean(), uint()}.
canSubmitTask(TaskID, Code) ->
	case isAcceptedTaskByID(TaskID) of
		true ->
			#taskCfg{submit_task_npc = NpcID} = getTaskCfgByID(TaskID),
			%%近程提交
			case checkNpcDist(NpcID, Code) of
				{true,_} ->
					{true, 0};
				{false, ErrorCode} ->
					%%此处不能提交任务,返回错误码
					{false, ErrorCode}
			end;
		false ->
			{false,?ErrorCode_TaskFailed_NotAccept}
	end.




%% 该函数的内容注意与gmSubmitTask同步
-spec doSubmitTask(TaskID :: uint16()) -> boolean().
doSubmitTask(TaskID) ->
	Task = getTaskFromAcceptedListByID(TaskID),
	case isCanSubmit(Task) of
		true ->
			completeTask(Task),
			true;
		false ->
			?DEBUG_OUT("player:[~p] SubmitTask:~p,but not completed!", [playerState:getRoleID(), Task]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_TaskFailed_NotCondition),
			false
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
			initTask1(Cfg#taskCfg.sub_type, TaskRec, Cfg);
		_E ->
			undefined
	end;
initTask(TaskID) ->
	?ERROR_OUT("makeTask taskId:~p", [TaskID]),
	undefined.

%%
initTask1(?TaskType_Monster, TaskRec, #taskCfg{target_conf = [MonsterID, MonsterNum]}) ->
	TaskRec#rec_task{taskKey = MonsterID, taskTarget = MonsterID, taskTargetMax = MonsterNum};
%%
initTask1(?TaskType_Talk, TaskRec, #taskCfg{target_conf_params = [0,_]}) ->
	TaskRec#rec_task{taskKey = 0, taskTarget = 0, taskTargetMax = 0};
initTask1(?TaskType_Talk, TaskRec, #taskCfg{target_conf_params = [NpcDataID,_]}) ->
	TaskRec#rec_task{taskKey = NpcDataID, taskTarget = NpcDataID, taskTargetMax = 1};
%%
initTask1(?TaskType_CollectItem, TaskRec, #taskCfg{target_conf = [ItemID, Num, _RandMin, _RandMax], target_conf_params = [CollectionID, _]}) ->
	TaskRec#rec_task{taskKey = CollectionID, taskTarget = ItemID, taskTargetMax = Num};
%%
initTask1(?TaskType_Drop, TaskRec, #taskCfg{target_conf = [MonsterID, ItemID, Num,_Rate]}) ->
	TaskRec#rec_task{taskKey = MonsterID, taskTarget = ItemID, taskTargetMax = Num};
%%
initTask1(?TaskType_UseItem, TaskRec, #taskCfg{target_conf = [ItemID, Num]}) ->
	TaskRec#rec_task{taskKey = ItemID, taskTarget = ItemID, taskTargetMax = Num};
%%
initTask1(?TaskType_CopyMap, TaskRec, #taskCfg{target_conf = [CopyMapID]}) ->
	TaskRec#rec_task{taskKey = CopyMapID, taskTarget = CopyMapID, taskTargetMax = 1};
%%
initTask1(?TaskType_MiniCopy, TaskRec, #taskCfg{target_conf = [MiniMapID]}) ->
	TaskRec#rec_task{taskKey = MiniMapID, taskTarget = MiniMapID, taskTargetMax = 1};
%%
initTask1(?TaskType_Operation, TaskRec, #taskCfg{target_conf = [ItemID,_]}) ->
	TaskRec#rec_task{taskKey = ItemID, taskTarget = ItemID, taskTargetMax = 0};
%%
initTask1(?TaskType_Active, TaskRec, #taskCfg{target_conf = [ActiveID]}) ->
	TaskRec#rec_task{taskKey = ActiveID, taskTarget = ActiveID, taskTargetMax = 1};
%%
initTask1(?TaskType_CareerChang, TaskRec, #taskCfg{target_conf = [ChangeState]}) ->
	TaskRec#rec_task{taskKey = ChangeState, taskTarget = ChangeState, taskTargetMax = 1};
%%
initTask1(?TaskType_Link, TaskRec, #taskCfg{target_conf = []}) ->
	TaskRec#rec_task{taskKey = 0, taskTarget = 0, taskTargetMax = 0};

%%
initTask1(TaskType, TaskRec, TaskCfg) ->
	?ERROR_OUT("TaskType:~p~nTaskRec:~p~nTaskCfg:~p", [TaskType, TaskRec, TaskCfg]),
	undefined.
%% ====================================================================

%%保存新接取的任务
-spec addNewTask(TaskAccepted, Notify) -> ok
	when TaskAccepted :: #rec_task{}, Notify::boolean().
addNewTask(#rec_task{} = Task,Notify) ->
	%% 1添加任务
	?DEBUG_OUT("addNewTask(~p,~p)",[playerState:getRoleID(), Task#rec_task.taskID]),
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
	?DEBUG_OUT("completeTask444444444444444444444444444444444(~p)",[Task#rec_task.taskID]),
	ok.

onAddNewTask(TaskID) ->
	case getTaskCfgByID(TaskID) of
		#taskCfg{give_buff = BuffID} when BuffID > 0 ->
			playerBuff:addBuff(BuffID, 1);
		_ ->
			skip
	end.
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
-spec completeTask(TaskAccepted) -> ok
	when TaskAccepted :: #rec_task{}.
completeTask(#rec_task{taskID = TaskID,taskType = TaskType}) ->
	?DEBUG_OUT("completeTask(~p,~p)",[playerState:getRoleID(), TaskID]),
	try
		addSubmittedTask(TaskID),
		deleteTask(TaskID, ?TaskLogSubmit),
		giveTaskAward(TaskID),
		playerGoddess:autoActiveCard(TaskID),
		playerAchieve:achieveEvent(?Achieve_Task, [1]),
		%%如果是日常任务，则自动接取下一个任务
		playerLoopTask:onTaskComplete(TaskType, TaskID)
	catch
		_ : Error ->
			?ERROR_OUT("~p",[Error])
	end,
	%%添加任务完成log
	addNextTask(TaskID),
	ok.

addNextTask(TaskID) ->
	case getTaskCfgByID(TaskID) of
		#taskCfg{auto_next = NextTask} when NextTask > 0 ->
			doAcceptTask(NextTask);
		_ ->
			skip
	end.

%% ====================================================================
%%添加提交任务
-spec addSubmittedTask(TaskID) -> ok when TaskID::uint16().
addSubmittedTask(TaskID) ->
	Slot = TaskID div 64,
	Mod = TaskID rem 64,
	L = playerState:getSubmittedTask(),
	V = case lists:keyfind(Slot,1,L) of
			{Slot,Value} ->
				Value;
			_ ->
				0
		end,
	V1 = V bor (1 bsl Mod),
	L1 = lists:keystore(Slot,1,L,{Slot,V1}),
	playerState:setSubmittedTask(L1),
	playerMsg:sendNetMsg(#pk_GS2U_AddNewCompleteTask{taskID = TaskID, result = 1}),
	ok.

%% ====================================================================
deleteTask(TaskID, Reason) ->
	L = lists:keydelete(TaskID, #rec_task.taskID, playerState:getAcceptedTask()),
	playerState:setAcceptedTask(L),
	playerMsg:sendNetMsg(#pk_GS2U_DeleteAcceptTask{
		taskID = TaskID, result = Reason}),
	%%添加任务完成log
	dbLog:sendSaveLogTask(playerState:getRoleID(), TaskID, playerState:getLevel(), Reason).

%% ====================================================================
%%任务奖励
-spec giveTaskAward(TaskID) -> ok
	when TaskID :: uint().
giveTaskAward(TaskID) ->
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
			rewardSpecial(TaskID, SpecialList),
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
			giveTaskAward(TaskID);
		_ ->
			?ERROR_OUT("giveTaskAwardForLoopTask TaskID:~p is not loopTask", [TaskID])
	end.

rewardCoin(TaskID, CoinList) when is_list(CoinList) ->
	Fun = fun({CoinType, CoinNumber}) ->
		playerMoney:addCoin(abs(CoinType), CoinNumber,
			#recPLogTSMoney{
				reason = ?CoinSourceTask,
				param = TaskID,
				target = ?PLogTS_PlayerSelf,
				source = ?PLogTS_Task
			}
		)
		  end,
	lists:foreach(Fun, CoinList);
rewardCoin(_,_)-> skip.

rewardItem(TaskID, RewardItemList) when is_list(RewardItemList) ->

	Fun = fun({ItemID, ItemNum}) ->
		case erlang:is_integer(ItemID) andalso ItemNum > 0 of
			true ->
				Plog = #recPLogTSItem{
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
				playerPackage:addGoodsAndMail(ItemID, ItemNum, true, 0, Plog);
			_ ->
				skip
		end
		  end,
	lists:foreach(Fun, RewardItemList);
rewardItem(_, _)-> skip.
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
rewardEquip(_, _)-> skip.

rewardSpecial(_TaskID, SpecialList) when is_list(SpecialList) ->
	lists:foreach(
		fun(Params) ->
			rewardSpecial1(Params)
		end, SpecialList);
rewardSpecial(_, _) -> skip.

rewardSpecial1({?TaskReward_SPT_Buff, _P1, _P2}) ->
	ok;
rewardSpecial1({?TaskReward_SPT_Livenes, _P1, Value}) ->
	playerliveness:addTotalLivenessValue(Value);
rewardSpecial1({_P0, _P1, _P2}) ->
	ok.

%%
%refreshCollect(Code, ObjectID)->
%	%% 然后再更新采集物的显示，与通知地图完成了一次采集
%	GroupID = case myEts:lookUpEts(playerState:getMapCollectEts(), Code) of
%		          [#recMapObject{groupID = GID}] ->
%			          GID;
%		          _ ->
%			          0
%	          end,
%
%	%% 告诉地图进程，玩家采集了一个东西（注：原来的代码逻辑其实有问题，如果有多个相同的采集任务，就会出问题！）
%	psMgr:sendMsg2PS(playerState:getMapPid(), collectItem, {Code, ObjectID, GroupID, 1}),
%	ok.

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
-spec getAcceptedTaskCurCount() -> non_neg_integer().
getAcceptedTaskCurCount() ->
	erlang:length(playerState:getAcceptedTask()).

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
		[#recMapObject{id = ObjectID}|_] ->
			ObjectID;
		_ ->
			0
	end.