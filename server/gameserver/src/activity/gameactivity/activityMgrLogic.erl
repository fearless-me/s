%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% 活动模块逻辑处理
%%% @end
%%% Created : 29. 十二月 2014 17:43
%%%-------------------------------------------------------------------
-module(activityMgrLogic).
-author("tiancheng").

-include("../activityPrivate.hrl").

%% API
-export([
	createActivityChildProcess/0,
	getAllActivityDataAck/1,
	getActivityChildProcessName/1,
	restartChildPID/1,
	activityDataLoadAckCallBack/0
]).

%% 根据活动的配置创建相应的进程
-spec createActivityChildProcess() -> ok.
createActivityChildProcess() ->
	%% 开启混沌战场活动进程
	addActivityChildPID(?ActivityType_HDBattle, acHDBattlegroundOtp),

	%% 开启主城刷活动进程
	addActivityChildPID(?ActivityType_CityMonster, acCityMonsterOtp),

	%% 开启军团领地争夺活动进程
	addActivityChildPID(?ActivityType_GuildBattle, acGuildBattleOtp),

	%% 开启 王者战天下 活动进程
	addActivityChildPID(?ActivityType_KingBattleAll, acKingBattleAllOtp),

	%% 开启答题玩法
	addActivityChildPID(?ActivityType_AnswerPlay, acAnswerPlayOtp),

	%% 护送活动
	addActivityChildPID(?ActivityType_EscortGoods, acEscortOtp),

	%% 黑暗之地
	addActivityChildPID(?ActivityType_Darkness, acDarknessOtp),

%%	%% 骑宠争夺战 废弃
%%	addActivityChildPID(?ActivityType_PetBattle, acPetBattleOtp),

	%% 军团争霸
	addActivityChildPID(?ActivityType_GuildWar, acGuildwarOtp),

	%% 军团沙盘
	addActivityChildPID(?ActivityType_GuildExpedition, acGuildExpeditionOtp),

	%% 约会地下城
	addActivityChildPID(?ActivityType_Date, ?PsNameDate),

%%	%% 乱世为王活动
%%	addActivityChildPID(?ActivityType_LSBattleField, acLSBattlefieldOtp),

	%% 跨服骑宠竞速
	case core:isCross() of
		true ->
			addActivityChildPID(?ActivityType_CrossRace, cacRaceOtp);
		_ ->
			skip
	end,

	%% 港口竞速
	addActivityChildPID(?ActivityType_Material, acMaterialOtp),

	%% 金币副本
	addActivityChildPID(?ActivityType_MoneyDungeon, ?PsNameMoneyDungeon),

	%% 家族系统-堆雪人活动
	addActivityChildPID(?ActivityType_Snowman, ?PsNameSnowman),

	%% 家族系统-堆雪人活动
	addActivityChildPID(?ActivityType_SpiritArea, ?PsNameSpiritArea),

	%% 新版骑宠领地
	addActivityChildPID(?ActivityType_PetTerritory, ?PsNamePetTerritory),

	%% 首领入侵
	addActivityChildPID(?ActivityType_GiveIPad, ?PsNameWorldBOss),

	%% 广场舞
	addActivityChildPID(?ActivityType_Dance, acDanceOtp),

	ok.

%% 获取某类型活动的子进程名
-spec getActivityChildProcessName(ActivityIndex::activityType()) -> atom().
getActivityChildProcessName(ActivityIndex) when
	ActivityIndex >= ?ActivityType_Start andalso ActivityIndex =< ?ActivityType_End ->
	RealName = ?ActivityChildProcessPrefix ++ erlang:integer_to_list(ActivityIndex),
	list_to_atom(RealName);
getActivityChildProcessName(ActivityIndex) ->
	?ERROR_OUT("getActivityChildProcessName.error:~p", [ActivityIndex]),
	error.

%% 活动状态改变回调
-spec activityChangeCallBack(ID::activityType(), Phase::uint()) -> ok.
activityChangeCallBack(Type, Phase) ->
	?LOG_OUT("activityChangeCallBack type:~p,phase:~p]", [Type,Phase]),
	sendMsgToAcModule(Type, activityChangeCallBack, {Type, Phase}),
	ok.

updateActivity(#rec_activity{id = ID, phase = Phase} = Activity) ->
	case myEts:lookUpEts(?AcMgrEts, ID) of
		[#rec_activity{phase = OldPhase}] ->
			myEts:updateEts(?AcMgrEts, ID,
							   [
								   {#rec_activity.starttime, Activity#rec_activity.starttime},
								   {#rec_activity.phasetime, Activity#rec_activity.phasetime},
								   {#rec_activity.phase, Phase}
							   ]),
			case OldPhase /= Phase of
				true ->
					activityChangeCallBack(ID, Phase);
				_ ->
					skip
			end;
		_ ->
			%% 插入
			ets:insert(?AcMgrEts, Activity),
			activityChangeCallBack(ID, Phase)
	end,
	ok.

%% 从CS发送过来的活动数据
getAllActivityDataAck([]) ->
	ok;
getAllActivityDataAck(#rec_activity{} = Activity) ->
	updateActivity(Activity);
getAllActivityDataAck([#rec_activity{} = Activity|List]) ->
	getAllActivityDataAck(Activity),
	getAllActivityDataAck(List).

%% 发消息给活动逻辑模块
sendMsgToAcModule(?ActivityType_CrossHDBattle, MsgID, Msg) ->  %% 跨服活动，仅在跨服中开启
	case core:isCross() of
		false ->
			skip;
		_ ->
			case getActivityPIDByType(?ActivityType_CrossHDBattle) of
				Pid when erlang:is_pid(Pid) ->
					psMgr:sendMsg2PS(Pid, MsgID, Msg);
				_ ->
					?ERROR_OUT("sendMsgToAcModule target activity not found: {~p,~p,~p}", [?ActivityType_CrossHDBattle, MsgID, Msg])
			end
	end,
	ok;
sendMsgToAcModule(?ActivityType_CrossArenaBattle, MsgID, Msg) ->  %% 跨服活动，仅在跨服中开启
	case core:isCross() of
		false ->
			skip;
		_ ->
			case getActivityPIDByType(?ActivityType_CrossArenaBattle) of
				Pid when erlang:is_pid(Pid) ->
					psMgr:sendMsg2PS(Pid, MsgID, Msg);
				_ ->
					?ERROR_OUT("sendMsgToAcModule target activity not found: {~p,~p,~p}", [?ActivityType_CrossArenaBattle, MsgID, Msg])
			end
	end,
	ok;
sendMsgToAcModule(?ActivityType_CrossRace, MsgID, Msg) ->  %% 跨服活动，仅在跨服中开启
	case core:isCross() of
		false ->
			skip;
		_ ->
			case getActivityPIDByType(?ActivityType_CrossRace) of
				Pid when erlang:is_pid(Pid) ->
					psMgr:sendMsg2PS(Pid, MsgID, Msg);
				_ ->
					?ERROR_OUT("sendMsgToAcModule target activity not found: {~p,~p,~p}", [?ActivityType_CrossRace, MsgID, Msg])
			end
	end,
	ok;
sendMsgToAcModule(?ActivityType_PetBattle, _MsgID, _Msg) ->  %% fixme 9号活动骑宠争夺战 ?ActivityType_PetBattle 已废弃
	ok;
sendMsgToAcModule(?ActivityType_LSBattleField, _MsgID, _Msg) ->  %% fixme 15号活动乱世为王 ?ActivityType_LSBattleField 进程已关闭
	ok;
sendMsgToAcModule(Type, MsgID, Msg) ->
	case getActivityPIDByType(Type) of
		Pid when erlang:is_pid(Pid) ->
			psMgr:sendMsg2PS(Pid, MsgID, Msg);
		_ ->
			?ERROR_OUT("sendMsgToAcModule target activity not found: {~p,~p,~p}", [Type, MsgID, Msg])
	end,
	ok.

addActivityChildPID(ActivityType, Module) ->
	{ok, Pid} = Module:start_link(getActivityChildProcessName(ActivityType)),
	addActivityPIDList({ActivityType, Pid, Module}),

	%% 监控子进程
	_MonitorRef = erlang:monitor(process, Pid),
	ok.

%% 活动模块对应的进程
setActivityPIDList(List) ->
	put('ActivityPIDList', List).

getActivityPIDList() ->
	case get('ActivityPIDList') of
		undefined -> [];
		List -> List
	end.

addActivityPIDList({Type, PID, Module}) ->
	L = getActivityPIDList(),
	NL = lists:keystore(Type, 1, L, {Type, PID, Module}),
	setActivityPIDList(NL).

getActivityPIDByType(Type) ->
	L = getActivityPIDList(),
	case lists:keyfind(Type, 1, L) of
		{Type, PID, _Module} -> PID;
		_ -> undefined
	end.

getActivityInfoByPID(PID) ->
	L = getActivityPIDList(),
	case lists:keyfind(PID, 2, L) of
		{_,_,_} = V -> V;
		_ -> undefined
	end.

restartChildPID(PID) ->
	case getActivityInfoByPID(PID) of
		{Type, PID, Module} ->
			?LOG_OUT("restartChildPID:oldpid=~p,type=~p,module=~p", [PID, Type, Module]),
			addActivityChildPID(Type, Module);
		undefined -> skip
	end,
	ok.
%%活动数据加载完成回调
activityDataLoadAckCallBack() ->
	AcList = getCfg:get1KeyList(cfg_activity),
	Fun =
		fun(Key) ->
			sendMsgToAcModule(Key, activityDataLoadAckCallBack, [])
		end,
	lists:foreach(Fun, AcList).