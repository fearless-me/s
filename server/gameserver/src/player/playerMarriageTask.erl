%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%% 从playerMarriage提取出来的，只是整理部分代码
%%% @end
%%% Created : 23. 五月 2017 10:38
%%%-------------------------------------------------------------------
-module(playerMarriageTask).
-author("Administrator").

%% API
-export([
	resetTask/1,
	acceptTask/0,
	leaderSubmitTask/1,
	submitTask/1,
	canSubmitTask/1,
	acceptLink/0,
	onAcceptTask/1
]).

-include("playerPrivate.hrl").
-include("../marriage/marriagePrivate.hrl").

-define(MarriageTask_ID, 3001).
-define(MarriageTask_ActivityID, 32).

onAcceptTask(TaskID)->
	case playerTask:isAcceptedTaskByID(TaskID) of
		false ->
			 playerTask:acceptTask(TaskID, 0),
			case playerPropSync:getProp(?SerProp_MarriageTaskInfo) of
				{0, _} ->
					playerPropSync:setAny(?SerProp_MarriageTaskInfo, {TaskID, time:getSyncTime1970FromDBS()});
				_ ->
					ok
			end;
		_ ->
			skip
	end,
	cancelLink(),
	ok.

%%% --------------------------------------------------------------------
%% 重置情缘任务
-spec resetTask(NextDay :: boolean()) -> ok.
resetTask(NextDay) ->
	FunCancel =
		fun(#rec_task{taskID = ID}) ->
			case getCfg:getCfgByKey(cfg_task, ID) of
				#taskCfg{type = ?TaskMainType_Marriage} ->
					playerTask:cancelTask(ID);
				_ ->
					skip
			end
		end,
	lists:foreach(FunCancel, playerState:getAcceptedTask()),
	case NextDay of
		true ->
			playerPropSync:setAny(?SerProp_MarriageTaskInfo, {0, 0});
		_ ->
			skip
	end,
	ok.

%%% --------------------------------------------------------------------
%% 接受情缘任务
-spec acceptTask() -> ok.

queryCoupleID() ->
	RoleID = playerState:getRoleID(),
	SweetheartID =
		case marriageState:queryRelation(RoleID) of
			#rec_marriage{targetRoleID = TargetRoleID1} ->
				TargetRoleID1;
			_ ->
				0
		end,

	SweetheartIDPid = case core:queryPlayerPidByRoleID(SweetheartID) of
		                  offline ->
			                  undefined;
		                  Pid ->
			                  Pid
	                  end,
	{SweetheartID, SweetheartIDPid}.

checkMarriageTaskShip() ->
	RoleID = playerState:getRoleID(),
	PlayerEts = playerState:getMapPlayerEts(),
	{SweetheartID, SweetheartIDPid} = queryCoupleID(),

	SameMapRoleList = teamInterface:getTeamMemberRoleIDListInSameMapWithRoleID(
		RoleID
		, PlayerEts
		, true),

	MemberLen = length(SameMapRoleList),
	TeamMemberCount = teamInterface:getTeamMemberCountWithRoleID(RoleID),
	IsInSameTeam = teamInterface:isInSameTeam(RoleID, SweetheartID),
	IsTeamLeader = teamInterface:isTeamLeader(RoleID),

	if
		SweetheartID =:= 0 ->
			{false, ?ErrorCode_Marriage_AcceptTask};
		not IsTeamLeader ->
			{false, ?ErrorCode_Marriage_AcceptTaskLeader};
		TeamMemberCount =/= 2 ->
			{false, ?ErrorCode_Marriage_AcceptTask};
		MemberLen =/= 2 ->
			{false, ?ErrorCode_Marriage_AcceptTask};
		not IsInSameTeam ->
			{false, ?ErrorCode_Marriage_AcceptTask};
		SweetheartIDPid =:= undefined ->
			{false, ?ErrorCode_Marriage_AcceptTask};
		true ->
			{true, SweetheartID, SweetheartIDPid}
	end.

checkHasMarriageTaskState() ->
	case playerPropSync:getProp(?SerProp_MarriageTaskInfo) of
		{TaskIDCache, _} when TaskIDCache > 0 ->
			FunIsAccept =
				fun(#rec_task{taskID = ID}, {_, _}) ->
					case getCfg:getCfgByKey(cfg_task, ID) of
						#taskCfg{type = ?TaskMainType_Marriage} ->
							{true, 0};
						_ ->
							{false, 0}
					end
				end,
			case misc:foldlEx(FunIsAccept, {false, 0}, playerState:getAcceptedTask()) of
				{true, _} ->
					{false, ?ErrorCode_Marriage_AlreadyAcceptTask};
				_ ->
					{false, ?ErrorCode_Marriage_AcceptTaskDaily}
			end;
		_ ->
			{true, 0}
	end.

acceptTask() ->
	case checkMarriageTaskShip() of
		{true, _SweetheartID, SweetheartPid} ->
			case checkHasMarriageTaskState() of
				{true, _} ->
					psMgr:sendMsg2PS(SweetheartPid, marriage_acceptTaskAsk, 0);
				{_, ErrorCode1} ->
					playerMsg:sendErrorCodeMsg(ErrorCode1)
			end;
		{_, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok.

%%% --------------------------------------------------------------------
%% 提交情缘任务
-spec leaderSubmitTask(Code :: uint()) -> ok.
leaderSubmitTask(Code) ->
	case checkMarriageTaskShip() of
		{true, _SweetheartID, SweetheartPid} ->
			%% 检查双方是否完成任务
			case canSubmitTask(Code) of
				{true, TaskID} ->
					psMgr:sendMsg2PS(SweetheartPid, marriage_askTask, {TaskID, Code});
				_E ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_Marriage_NotComplete) %% 未完成不能提交
			end;
		{_, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end.

-spec submitTask({Pid :: pid(), TaskID :: uint(), Code:: uint()}) -> ok.
submitTask({Pid, TaskID, Code}) ->
	case canSubmitTask(Code) of
		{true, TaskID} ->
			psMgr:sendMsg2PS(Pid, marriage_submitTask, TaskID),
			#rec_marriage{targetRoleID = PartnerRoleID} = marriageState:queryRelation(playerState:getRoleID()),
			playerTask:submitTask(TaskID, 0, PartnerRoleID),
			case getCfg:getCfgByKey(cfg_task, TaskID) of
				#taskCfg{auto_next = [TaskIDNext | _]} when erlang:is_integer(TaskIDNext), TaskIDNext > 0 ->
					onAcceptTask(TaskIDNext),
					psMgr:sendMsg2PS(Pid, marriage_acceptTask, TaskIDNext);
				_ ->
					psMgr:sendMsg2PS(Pid, marriage_completeTask, TaskID),
					onRoundTaskFinish()  %% 完成本轮情缘任务！
			end;
		_E ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_Marriage_NotComplete) %% 未完成不能提交
	end,
	ok.

%% 完成一轮
onRoundTaskFinish()->
	%% 完成本轮情缘任务！
	playerMsg:sendErrorCodeMsg(?ErrorCode_Marriage_CompleteTask),
	incTaskRound(),
	acceptLink(),
	ok.

%%% --------------------------------------------------------------------
%% 是否能提交情缘任务
-spec canSubmitTask( Code ::uint() ) -> {boolean(), uint()}.
canSubmitTask(Code) ->
	FunCheck =
		fun(#rec_task{taskID = ID}, {_, {_, _}}) ->
			case getCfg:getCfgByKey(cfg_task, ID) of
				#taskCfg{type = ?TaskMainType_Marriage} ->
					case playerTask:canSubmitTask(ID, Code) of
						{true,_}->
							{true,{true, ID}};
						_ ->
							{true,{false, ID}}
					end;
				_ ->
					{false, {false, 0}}
			end
		end,
	case misc:foldlEx(FunCheck, {false, {false, 0}}, playerState:getAcceptedTask()) of
		{true, {true, ID}} ->
			{true, ID};
		{_, {_, ID2}} ->
			{false, ID2}
	end.

cancelLink()->
	case  playerTask:isAcceptedTaskByID(?MarriageTask_ID) of
		true ->
			playerTask:cancelTask(?MarriageTask_ID);
		_->
			skip
	end.

acceptLink() ->
	case getMaxRoundCfg() > getTaskRound() of
		true->
			case getLinkMinLevel() =< playerState:getLevel() andalso isAccepted() =:= false of
				true ->
					case  playerTask:isAcceptedTaskByID(?MarriageTask_ID) of
						false ->
							playerPropSync:setAny(?SerProp_MarriageTaskInfo, {0, 0}),
							playerTask:acceptTask(?MarriageTask_ID, 0);
						_ ->
							skip
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

getMaxRoundCfg()->
	case getCfg:getCfgByKey(cfg_globalsetup, marriage_task_number) of
		#globalsetupCfg{setpara = [V]}->
			V;
		_ ->
			1
	end.

getTaskRound()->
	playerDaily:getDailyCounter(?DailyType_MarriageTask, 1).

incTaskRound()->
	playerDaily:incDailyCounter(?DailyType_MarriageTask, 1).


-spec isAccepted() -> true|false.
isAccepted() ->
	lists:foldl(
		fun(#rec_task{taskID = TaskID}, Acc) ->
			case getCfg:getCfgByKey(cfg_task, TaskID) of
				#taskCfg{type = ?TaskMainType_Marriage} ->
					true;
				_ ->
					Acc
			end

		end, false, playerState:getAcceptedTask()).

getLinkMinLevel()->
	case getCfg:getCfgByKey(cfg_dailyInterface,?MarriageTask_ActivityID) of
		#dailyInterfaceCfg{parameter = Level} ->
			Level;
		_ ->
			99999
	end.
