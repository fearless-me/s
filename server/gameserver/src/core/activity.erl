%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, 好玩一二三
%%% @doc
%%% 活动模块
%%% @end
%%% Created : 23. 三月 2015 14:13
%%%-------------------------------------------------------------------
-module(activity).
-author("tiancheng").

-include("gsInc.hrl").
-include("activityDef.hrl").
-include("config.hrl").

%% API
-export([
	queryActivitySwitch/1,		%% 查询活动是否开启或者关闭
	setActivitySwitch/2,		%% 设置活动开启或者关闭
	isActivityValid/1			%% 活动是否有效，包括配置有效与开关开启
]).

-export([
	yunyingControlActivitySwitch/2	%% 运营控制活动进程
]).

%%运营活动类的配置与玩家参与数据
-export([
	getOperateActCfgByType/1,
	getOperateActData/2,
	castOperateActEvent/2,
	operateActEvent/2
]).

%% 查询活动开关，true开启，false关闭
-spec queryActivitySwitch(ActivityID::activityType()) -> boolean().
queryActivitySwitch(ActivityID) when ActivityID >= ?ActivityType_Start andalso ActivityID =< ?ActivityType_End ->
	case queryActivitySwitchMsg(?ActivitySwitchList, ActivityID) of
		{ActivityID, SwitchNumber, BitNumber} ->
			SwitchValue = variant:getGlobalVariant(SwitchNumber),
			Value = (SwitchValue bsr (BitNumber - 1)) band 2#1,
			%% 等于1，表示设置为关闭，为0表示开启
			Value =:= 0;
		_ ->
			%% 没有设置全局开关，表示开启
			true
	end;
queryActivitySwitch(_) ->
	false.

%% 设置活动开启或者关闭
-spec setActivitySwitch(ActivityID::activityType(), Open::boolean()) -> boolean().
setActivitySwitch(ActivityID, true) when ActivityID >= ?ActivityType_Start andalso ActivityID =< ?ActivityType_End ->
	%% 设置开启，对应位置0
	case queryActivitySwitchMsg(?ActivitySwitchList, ActivityID) of
		{ActivityID, SwitchNumber, BitNumber} ->
			SwitchValue = variant:getGlobalVariant(SwitchNumber),
			Value = ((1 bsl (BitNumber - 1)) bxor 16#FFFFFFFF) band SwitchValue,
			core:setGlobalVariant(SwitchNumber, Value),
			true;
		_ ->
			false
	end;
setActivitySwitch(ActivityID, false) when ActivityID >= ?ActivityType_Start andalso ActivityID =< ?ActivityType_End ->
	%% 设置关闭，对应位置1
	case queryActivitySwitchMsg(?ActivitySwitchList, ActivityID) of
		{ActivityID, SwitchNumber, BitNumber} ->
			SwitchValue = variant:getGlobalVariant(SwitchNumber),
			Value = SwitchValue bor (1 bsl (BitNumber - 1)),
			core:setGlobalVariant(SwitchNumber, Value),
			true;
		_ ->
			false
	end;
setActivitySwitch(_,_) ->
	false.

%% 活动是否有效
-spec isActivityValid(ActivityID::activityType()) -> boolean().
isActivityValid(ActivityID) when ActivityID >= ?ActivityType_Start andalso ActivityID =< ?ActivityType_End ->
	IsConfigValid =
	case getCfg:getCfgByArgs(cfg_activity, ActivityID) of
		#activityCfg{cycletype = ACType} ->
			if
				?ActivityCycle_Close =:= ACType ->
					%% 活动关闭
					false;
				?ActivityCycle_Forever =:= ACType ->
					true;
				true ->
					true
			end;
		_ ->
			false
	end,
	case IsConfigValid of
		true ->
			%% 配置有效，查询开关是否开启
			queryActivitySwitch(ActivityID);
		_ ->
			false
	end;
isActivityValid(_) ->
	false.

-spec queryActivitySwitchMsg([{Switch::integer(), [{Number::integer(),ACID::integer()},...]},...], ActivityID::integer()) ->
	{ActivityID::integer(), SwitchNumber::integer(), BitNumber::integer()} | false.
queryActivitySwitchMsg([], _) ->
	false;
queryActivitySwitchMsg([{Switch, [{_Number, _ACID}|_] = List}|T], ActivityID) ->
	case ActivityID >= ?ActivityType_Start andalso ActivityID =< ?ActivityType_End of
		true ->
			case lists:keyfind(ActivityID, 2, List) of
				{Num, ACID} ->
					{ACID, Switch, Num};
				_ ->
					queryActivitySwitchMsg(T, ActivityID)
			end;
		_ ->
			false
	end.

%% 运营控制活动进程接口
-spec yunyingControlActivitySwitch(ActivityID::activityType(), Open::boolean()) -> boolean().
yunyingControlActivitySwitch(ActivityID, Open) when ActivityID >= ?ActivityType_Start andalso ActivityID =< ?ActivityType_End ->
	?LOG_OUT("yunyingControlActivitySwitch:~p,~p", [ActivityID, Open]),
	setActivitySwitch(ActivityID, Open).

%%获取指定运营活动类型的运营活动配置
-spec getOperateActCfgByType(Type) -> [] | [#rec_operate_activity{},...] when Type::?OperateActType_Min .. ?OperateActType_Max.
getOperateActCfgByType(Type) ->
	operateActivityLogic:getAc(Type).

%%获取指定角色ID在指定运营活动中的参与数据
-spec getOperateActData(RoleID,ActID) -> [] | #rec_operate_data{} when RoleID::uint(),ActID::uint().
getOperateActData(RoleID,ActID) ->
	operateActivityLogic:getAcData(RoleID,ActID).

%%执行活动
-spec operateActEvent(list(), #recOperateActivityArg{}) -> ok.
operateActEvent(AcList, AcArg) ->
	operateActivityLogic:execute(AcList, AcArg).

%%向运营活动进程发送事件
-spec castOperateActEvent(AcList::list(), #recOperateActivityArg{}) -> ok.
castOperateActEvent([], _) ->
	ok;
castOperateActEvent(AcList, #recOperateActivityArg{} = ActArg) ->
	operateActivityOtp:castOperateActEvent(AcList, ActArg),
	ok.



