%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%%
%%% @end
%%% Created : 08. 六月 2017 19:42
%%%-------------------------------------------------------------------
-module(acDanceLogic).
-author(tiancheng).

-include("../../activityPrivate.hrl").
-include("../activityPhaseDefine.hrl").
-include("acDancePrivate.hrl").

%% API
-export([
	activityChangeCallBack/1,
	activityMapMsg/2
]).

-export([
	dance_tick/0
]).

-export([
	applyDance/1,
	inDanceArea/1,
	selectDanceID/1,
	breakDance/1,
	leaveDanceMap/1
]).

%% 主活动模块进程回调
-spec activityChangeCallBack(Phase::uint()) -> ok.
activityChangeCallBack(?ActivityPhase_Close) ->
	%% 结束
	case acDanceState:getTimerRef() of
		undefined ->
			skip;
		TimerRef ->
			erlang:cancel_timer(TimerRef)
	end,

	acDanceState:setTimerRef(undefined),

	acDanceState:setDancePhase(?DancePhase_End),

	%% 清理数据
	acDanceState:delDanceApply(),
	acDanceState:delDanceIng(),

	%% 结束
	acDanceState:setCanApply(false),
	acDanceState:setRandListAndTargetID([], 0),
	ok;
activityChangeCallBack(?ActivityType_Dance_1) ->
	ok;
activityChangeCallBack(?ActivityType_Dance_2) ->
	Content = stringCfg:getString(square_dancing_string_1),
	activityCommon:sendBroadcastNotice(Content),

	acDanceState:setCanApply(true),
	ok;
activityChangeCallBack(?ActivityType_Dance_3) ->
	Content = stringCfg:getString(square_dancing_string_2),
	activityCommon:sendBroadcastNotice(Content),

	acDanceState:setCanApply(true),
	ok;
activityChangeCallBack(?ActivityType_Dance_4) ->
	Content = stringCfg:getString(square_dancing_string_3),
	activityCommon:sendBroadcastNotice(Content),

	acDanceState:setCanApply(true),
	ok;
activityChangeCallBack(?ActivityType_Dance_5) ->
	Content = stringCfg:getString(square_dancing_string_4),
	activityCommon:sendBroadcastNotice(Content),

	acDanceState:setCanApply(true),

	%% 准备
	prepare(),

	case acDanceState:getTimerRef() of
		undefined ->
			acDanceState:setTimerRef(erlang:send_after(?Dance_Tick, self(), dance_tick));
		_ ->
			skip
	end,
	ok;
activityChangeCallBack(Phase) ->
	?ERROR_OUT("~p ~p activityChangeCallBack:~p", [?MODULE, self(), Phase]),
	ok.

%% 活动地图的消息
-spec activityMapMsg(MsgType::uint(), Data::term()) -> ok.
activityMapMsg(_MsgType, _Data) ->
	ok.

dance_tick() ->
	acDanceState:setTimerRef(erlang:send_after(?Dance_Tick, self(), dance_tick)),

	Now = time2:getTimestampSec(),
	Set = acDanceState:getChangePhaseTime(),
	case Now >= Set of
		true ->
			case acDanceState:getDancePhase() of
				?DancePhase_Prepare ->
					start();
				?DancePhase_Start ->
					prepare()
			end;
		_ ->
			skip
	end,

	%% 每秒给经验
	case acDanceState:getRandListAndTargetID() of
		{List, TargetID} when erlang:length(List) > 0 andalso TargetID > 0 ->
			Fun =
				fun(_Key, #dance_ing{roleID = RoleID, pid = Pid, correct = Correct}, _) ->
					psMgr:sendMsg2PS(Pid, dance_tick_addExp, {RoleID, Correct})
				end,
			dict:fold(Fun, ok, acDanceState:getDanceIng()),
			ok;
		_ ->
			skip
	end,
	ok.

start() ->
	%% 设置阶段
	setPhase(?DancePhase_Start),

	%% 通知在区域中的玩家，开始选择跳舞
	{DanceListID, CorrectID} = acDanceState:getRandListAndTargetID(),
	Msg = #pk_GS2U_ActionList{correctID = CorrectID, danceIDs = DanceListID},
	Fun =
		fun(_Key, #dance_ing{netPid = NetPid, roleID = RoleID}, _) ->
			?DEBUG_OUT("start:~p", [RoleID]),
			gsSendMsg:sendNetMsg(NetPid, Msg)
		end,
	dict:fold(Fun, ok, acDanceState:getDanceIng()),

	?DEBUG_OUT("dance start..."),
	ok.

prepare() ->
	%% 随机ID
	getAndSetDanceIDList(),

	setPhase(?DancePhase_Prepare),

	%% 通知在区域中的玩家，清除加乘，并开始倒计时准备
	List = dict:to_list(acDanceState:getDanceIng()),
	Msg = #pk_GS2U_SwitchDance{second = ?DancePrepareTime},
	F =
		fun({_Key, #dance_ing{netPid = NetPid, roleID = RoleID} = Ing}) ->
			?DEBUG_OUT("prepare:~p,~p", [RoleID, ?DancePrepareTime]),
			acDanceState:putDanceIngObject(Ing#dance_ing{correct = false}),
			gsSendMsg:sendNetMsg(NetPid, Msg)
		end,
	lists:foreach(F, List),

%%	{DanceListID, CorrectID} = acDanceState:getRandListAndTargetID(),
%%	Msg2 = #pk_GS2U_ActionList{correctID = CorrectID, danceIDs = DanceListID},
%%	Fun =
%%		fun(_Key, #dance_ing{netPid = NetPid}, _) ->
%%			gsSendMsg:sendNetMsg(NetPid, Msg2)
%%		end,
%%	dict:fold(Fun, ok, acDanceState:getDanceIng()),

	?DEBUG_OUT("dance prepare..."),
	ok.

applyDance({RoleID, Pid, NetPid, IsIn}) ->
	ECode =
		case acDanceState:getCanApply() of
			true ->
				{NewApply, ErrorCode} =
					case acDanceState:getDanceApplyObject(RoleID) of
						false ->
							{#dance_apply{roleID = RoleID, pid = Pid, netPid = NetPid}, ?ErrorCode_ApplyDanceSuccess};
						#dance_apply{} = Apply ->
							{Apply#dance_apply{pid = Pid, netPid = NetPid}, ?ErrorCode_AlreadyApplyDance}
					end,
				acDanceState:putDanceApplyObject(NewApply),

				%% 报名后进入区域
				case IsIn of
					true ->
						inDanceArea({RoleID, Pid, NetPid, IsIn});
					_ ->
						skip
				end,

				?DEBUG_OUT("applyDance:~p", [RoleID]),

				ErrorCode;
			_ ->
				?ErrorCode_DanceActivityNotStart
		end,
	Msg = playerMsg:getErrorCodeMsg(ECode),
	gsSendMsg:sendNetMsg(NetPid, Msg),
	ok.

inDanceArea({RoleID, Pid, NetPid, true}) ->
	ErrorCode =
		case acDanceState:getCanApply() of
			true ->
				case acDanceState:getDanceApplyObject(RoleID) of
					#dance_apply{} = Apply ->
						{NewIn, ECode1} =
							case acDanceState:getDanceIngObject(RoleID) of
								false ->
									{#dance_ing{roleID = RoleID, pid = Pid, netPid = NetPid, correct = false}, ?ErrorCode_InDanceArea};
								#dance_ing{} = Ing ->
									{Ing#dance_ing{pid = Pid, netPid = NetPid}, false}
							end,
						acDanceState:putDanceIngObject(NewIn),
						acDanceState:putDanceApplyObject(Apply#dance_apply{pid = Pid, netPid = NetPid}),

						?DEBUG_OUT("inDanceArea:~p", [RoleID]),

						%% 进入区域
						enterDanceArea(RoleID, Pid, NetPid),
						ECode1;
					_ ->
						?ErrorCode_NotApplyDanceInArea
				end;
			_ ->
				?ErrorCode_DanceActivityNotStart
		end,
	case ErrorCode of
		false -> skip;
		_ ->
			Msg = playerMsg:getErrorCodeMsg(ErrorCode),
			gsSendMsg:sendNetMsg(NetPid, Msg)
	end,
	ok;
inDanceArea({RoleID, _Pid, NetPid, false}) ->
	case acDanceState:getDanceIngObject(RoleID) of
		#dance_ing{} ->
			?DEBUG_OUT("leave area:~p", [RoleID]),

			acDanceState:delDanceIng(RoleID),
			Msg = playerMsg:getErrorCodeMsg(?ErrorCode_OutDanceArea),
			gsSendMsg:sendNetMsg(NetPid, Msg);
		_ ->
			skip
	end,
	ok.

enterDanceArea(RoleID, _Pid, NetPid) ->
	case acDanceState:getDancePhase() of
		?DancePhase_Prepare ->
			%% 当前在准备阶段，告诉剩下几秒倒计时
			Now = time2:getTimestampSec(),
			Set = acDanceState:getChangePhaseTime(),

			Msg = #pk_GS2U_SwitchDance{second = Set - Now},
			gsSendMsg:sendNetMsg(NetPid, Msg),

			?DEBUG_OUT("enterDanceArea:~p, ~p", [RoleID, Set - Now]),

%%			{DanceListID, CorrectID} = acDanceState:getRandListAndTargetID(),
%%			Msg2 = #pk_GS2U_ActionList{correctID = CorrectID, danceIDs = DanceListID},
%%			gsSendMsg:sendNetMsg(NetPid, Msg2),
			ok;
		?DancePhase_Start ->
			%% 当前在跳舞阶段，告诉跳的舞蹈是什么
			{DanceListID, CorrectID} = acDanceState:getRandListAndTargetID(),
			Msg = #pk_GS2U_ActionList{correctID = CorrectID, danceIDs = DanceListID},

			?DEBUG_OUT("enterDanceArea start:~p", [RoleID]),

			gsSendMsg:sendNetMsg(NetPid, Msg),
			ok;
		_ ->
			skip
	end,
	ok.

selectDanceID({RoleID, Pid, NetPid, DanceID}) ->
	ErrorCode =
		case acDanceState:getCanApply() of
			true ->
				case acDanceState:getDancePhase() of
					?DancePhase_Start ->
						case acDanceState:getDanceIngObject(RoleID) of
							#dance_ing{} = Ing ->
								Correct =
									case acDanceState:getRandListAndTargetID() of
										{_List, DanceID} ->
											true;
										_ ->
											false
									end,
								acDanceState:putDanceIngObject(Ing#dance_ing{pid = Pid, netPid = NetPid, correct = Correct}),
								Msg = #pk_GS2U_SelectDanceID{danceID = DanceID, correct = Correct},
								gsSendMsg:sendNetMsg(NetPid, Msg),

								?DEBUG_OUT("selectDanceID:~p,~p,~p", [RoleID, DanceID, Correct]),

								%% 结果
								psMgr:sendMsg2PS(Pid, selectDanceIDAck, {RoleID, Correct}),
								false;
							_ ->
								?ErrorCode_NotInDanceArea
						end;
					_ ->
						?ErrorCode_NotInDancePhase
				end;
			_ ->
				?ErrorCode_DanceActivityNotStart
		end,
	case ErrorCode of
		false -> skip;
		_ ->
			ErrorMsg = playerMsg:getErrorCodeMsg(ErrorCode),
			gsSendMsg:sendNetMsg(NetPid, ErrorMsg)
	end,
	ok.

breakDance({RoleID, Pid}) ->
	case acDanceState:getDanceIngObject(RoleID) of
		#dance_ing{} = Ing ->
			?DEBUG_OUT("breakDance:~p", [RoleID]),
			acDanceState:putDanceIngObject(Ing#dance_ing{correct = false}),
			psMgr:sendMsg2PS(Pid, breakDanceAck, RoleID),
			ok;
		_ ->
			skip
	end,
	ok.

leaveDanceMap(RoleID) ->
	acDanceState:delDanceIng(RoleID),
	acDanceState:delDanceApply(RoleID),
	ok.

setPhase(?DancePhase_End) ->
	%% 设置阶段
	acDanceState:setDancePhase(?DancePhase_Prepare),
	%% 下一次切换阶段时间
	acDanceState:setChangePhaseTime(time2:getTimestampSec() + ?DancePrepareTime),
	ok;
setPhase(?DancePhase_Prepare) ->
	%% 设置阶段
	acDanceState:setDancePhase(?DancePhase_Prepare),
	%% 下一次切换阶段时间
	acDanceState:setChangePhaseTime(time2:getTimestampSec() + ?DancePrepareTime),
	ok;
setPhase(?DancePhase_Start) ->
	%% 设置阶段
	acDanceState:setDancePhase(?DancePhase_Start),
	%% 下一次切换阶段时间
	acDanceState:setChangePhaseTime(time2:getTimestampSec() + ?DanceStartTime),
	ok.

getAndSetDanceIDList() ->
	L = getDanceIDList(),
	[TargetID] = misc:randUniqueFromList(1, L),
	acDanceState:setRandListAndTargetID(L, TargetID),
	ok.

getDanceIDList() ->
	L1 = getCfg:get1KeyList(cfg_bubbleExpression),
	F =
		fun(ID) ->
			case getCfg:getCfgByKey(cfg_bubbleExpression, ID) of
				#bubbleExpressionCfg{action_dance = 1} ->
					true;
				_ ->
					false
			end
		end,
	L2 = lists:filter(F, L1),
	case erlang:length(L2) > ?RandDanceIDNumber of
		true ->
			misc:randUniqueFromList(?RandDanceIDNumber, L2);
		_ ->
			L2
	end.