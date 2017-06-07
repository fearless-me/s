%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%% 采取渐进式清理数据
%%%     对于长时间未登陆的玩家，删除角色，而不清理数据
%%%     对于已经删除的角色数据，直接清理
%%% @end
%%% Created : 09. 十月 2016 17:30
%%%-------------------------------------------------------------------
-module(rubbishCleanerLogic).
-author("mwh").

-include("rubbishCleanerPrivate.hrl").

%% API
-compile(export_all).


init()->
	tickMsg(),
	ok.

tick()->
	%%
	doResetWorkStep(),
	%%
	{V, _} = getWorkStep(),
	?WARN_OUT("doing ~p",[V]),
	doWork(V),
	{V0, _} = getWorkStep(),
	?WARN_OUT("done ~p -> ~p",[V,V0]),
	%%
	rubbishCleanerLogic:tickMsg(),
	ok.

%%%=================================================
doResetWorkStep()->
	{V, _} = getWorkStep(),
	case V of
		0 ->
			skip;
		_ ->
			{H, _} = nowHour(),
			case H =:= 12 orelse H =:= 18 of
				true ->
					resetWorkStep();
				_ ->
					skip
			end
	end.

%%%=================================================
doWork(0)->
	workInit();
doWork(1)->
	loadRoleListFromDBReq();
doWork(2)->
	waitLoadRoleListFromDB();
doWork(3)->
	working();
doWork(4)->
	setTickTime(?RubbishCleanerTickTime * 10),
	resetWorkStep().

%%%=================================================

workInit()->
	case checkWorkTime() of
		true ->
			setTickTime(?RubbishCleanerTickTime),
			addWorkStep();
		_ ->
			setTickTime(?RubbishCleanerTickTime * 10)
	end.

loadRoleListFromDBReq()->
	addWorkStep(),
	?WARN_OUT("request rubbishRoleList..."),
	getRubbishRoleListFromDB().


waitLoadRoleListFromDB()->
	case getIsLoadedRoleList() of
		true ->
			onRoleListLoaded();
		_ ->
			skip
	end.

working()->
	L = getRubbishRoleList(),
	L1 = rubbishGoWay(L,?RubbishCleanerTickWorkLoopMax),
	setRubbishRoleList(L1),
	case L1 of
		[] ->
			addWorkStep();
		_ ->
			skip
	end.


%%%=================================================

onRoleListLoaded()->
	setIsLoadedRoleList(false),
	case getRubbishRoleList() of
		[] ->
			?WARN_OUT("no rubbish data, long time to wait!!"),
			setTickTime(?RubbishCleanerTickTime * 10),
			resetWorkStep();
		V ->
			addProcess(length(V)),
			addWorkStep()
	end.

%%%=================================================
rubbishGoWay([], _)->
	[];
rubbishGoWay(L, Num) when Num =< 0 ->
	L;
rubbishGoWay([R | L], Num)->
	doRubbishGoWay(R),
	rubbishGoWay(L, Num - 1).

doRubbishGoWay(#recRubbishRoleInfo{accountID = AccountID, roleID = RoleID} = R)->
	case rubbishRoleCheck(AccountID, RoleID) of
		true ->
			playerSave:deleteRoleCache(AccountID, RoleID),
			addProcessDoing(1),
			addRubbishRoleDoingList(R),
			gsSendMsg:sendMsg2DBServer(cleanRubbishRoleData, AccountID, R),
			?WARN_OUT("auto clean role (~w)...",[R]);
		V ->
			addProcessDone(1),
			?WARN_OUT("auto clean role (~w)... failed(~p)",[R,V])
	end;
doRubbishGoWay(_)->
	ok.

rubbishRoleCheck(AccountID,RoleID)->
	case playerMgrOtp:getOnlineAccountID(AccountID) of
		#rec_OnlineAccount{} ->
			'account_online';
		_ ->
			case playerMgrOtp:getOnlinePlayerInfoByID(RoleID) of
				#rec_OnlinePlayer{} ->
					'role_online';
				_ ->
					true
			end
	end.


%%%=================================================
%% 清除已经删除的角色数据
onCleanRoleAck({ok,#recRubbishRoleInfo{ } = R})->
	addProcessDone(1),
	remRubbishRoleDoingList(R),
	?WARN_OUT("auto clean role (~w) ok",[R]),
	ok;
%% 对于长时间未登陆的角色我们先自动删除，但不清理数据
onCleanRoleAck({
	#recDeleteRoleAck{isOK = IsOK} = R0,
	#recRubbishRoleInfo{accountID = AccountID} = R1
})->
	addProcessDone(1),
	remRubbishRoleDoingList(R1),
	onDeleteRoleDone(IsOK, AccountID, R0),
	?WARN_OUT("auto clean role (~w,~w) ok",[R1, R0]),
	ok;
onCleanRoleAck(R)->
	?ERROR_OUT("auto clean role(~p)",[R]).

%%%=================================================
onDeleteRoleDone(true, AccountID, #recDeleteRoleAck{roleID = RoleID} = R)->
	playerLogin:onDeleteRoleDone(AccountID, R),
	onDeleteRoleSuccessKickAccount(AccountID, RoleID),
	ok;
onDeleteRoleDone(_Ok, _AccountID, _R)->
	ok.

%%%=================================================
onDeleteRoleSuccessKickAccount(AccountID,RoleID)->
	case playerMgrOtp:getOnlinePlayerInfoByAccountID(AccountID) of
		#rec_OnlinePlayer{pid = PlayerPid} ->
			?WARN_OUT("auto clean role(~p) ok,kick account(~p)",[RoleID, AccountID]),
			psMgr:sendMsg2PS(PlayerPid, kickOutAccount, {undefined, gmKickOut, undefined});
		_ ->
			skip
	end,
	ok.

%%%=================================================
getRubbishRoleListFromDB()->
	Setting = #recRubbishCleanerSetting{},
	gsSendMsg:sendMsg2DBServer(loadRubbishRoleList, 0, Setting).

initRubbishRoleListFromDB([])->
	?WARN_OUT("rubbishRoleList db ack,no rubbish role!!"),
	setIsLoadedRoleList(true);
initRubbishRoleListFromDB(L)->
	?WARN_OUT("rubbishRoleList db ack,rubbish role list len(~p)!!",[length(L)]),
	setIsLoadedRoleList(true),
	setRubbishRoleList(L).

%%%=================================================

nowHour()->
	Time = time:getSyncTime1970FromDBS(),
	{{_, _, _}, {H, M, _}} = time:convertSec2DateTime(Time),
	{H,M}.

checkWorkTime()->
	{H, _} = nowHour(),
	H < ?ResetTimeHour andalso H >= 0.


%%%=================================================
resetWorkStep()->
	Utc = time:getSyncUTCTimeFromDBS(),
	?WARN_OUT("resetWorkStep"),
	put('WorkStep', {0, Utc}).

addWorkStep()->
	Utc = time:getSyncUTCTimeFromDBS(),
	{V, _} = getWorkStep() ,
	put('WorkStep', {V+1, Utc}).

getWorkStep()->
	case get('WorkStep') of
		undefined ->
			{0,0};
		V ->
			V
	end.



setRubbishRoleList(L)->
	put('RubbishRoleList', L).

getRubbishRoleList()->
	case get('RubbishRoleList') of
		undefined ->
			[];
		L ->
			L
	end.

addRubbishRoleDoingList(#recRubbishRoleInfo{} = R)->
	L0 = getRubbishRoleDoingList(),
	L1 = lists:append([R], L0),
	setRubbishRoleDoingList(L1).

remRubbishRoleDoingList(#recRubbishRoleInfo{} = R)->
	L0 = getRubbishRoleDoingList(),
	L1 = lists:keydelete(R#recRubbishRoleInfo.roleID, 1, L0),
	setRubbishRoleDoingList(L1).

setRubbishRoleDoingList(L)->
	put('RubbishRoleDoingList', L).

getRubbishRoleDoingList()->
	case get('RubbishRoleDoingList') of
		undefined ->
			[];
		L ->
			L
	end.

setIsLoadedRoleList(V)->
	put('LoadRubbishRoleList', V).

getIsLoadedRoleList()->
	case get('LoadRubbishRoleList') of
		undefined ->
			false;
		V ->
			V
	end.

setProcessRecord(R)->
	put('RubbishCleaningProcess',R).

getProcessRecord()->
	case get('RubbishCleaningProcess') of
		#recRubbishCleaningProcess{} = R ->
			R;
		_ ->
			#recRubbishCleaningProcess{}
	end.

addProcess(Total)->
	R0 = getProcessRecord(),
	N0 = R0#recRubbishCleaningProcess.totalNum,
	R1 = R0#recRubbishCleaningProcess{ totalNum =  N0 + Total},
	setProcessRecord(R1).

addProcessDoing(V)->
	R0 = getProcessRecord(),
	R1 = R0#recRubbishCleaningProcess{ doing = R0#recRubbishCleaningProcess.doing + V },
	setProcessRecord(R1).

addProcessDone(V)->
	R0 = getProcessRecord(),
	R1 = R0#recRubbishCleaningProcess{ done = R0#recRubbishCleaningProcess.done + V },
	setProcessRecord(R1).


%%%=================================================
setTickTime(MS)->
	put('TickTime', MS).

getTickTime()->
	case get('TickTime') of
		undefined ->
			?RubbishCleanerTickTime;
		V ->
			V
	end.

tickMsg()->
	{V, _} = getWorkStep(),
	TickTime = case V of
				   0 ->
					   getTickTime();
				   _ ->
					   ?RubbishCleanerTickTime
	           end,
	erlang:send_after(TickTime, self(), tick).
