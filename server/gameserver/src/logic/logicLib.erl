%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc条件触发器,指定条件完成之后会执行条件触发器
%%%
%%% @end
%%% Created : 05. 九月 2016 20:00
%%%-------------------------------------------------------------------
-module(logicLib).
-author("wenshaofei").
-include("gsInc.hrl").
%% API
-export([createLogicArgu/2, getLogicArgu/2, runLogicGroup/2, addLogicArgu/3, getLogicArguValue/2, replaceLogicArgu/3, replaceLogicArgu/2]).

%%{ok,#logic_return{}}|{fail,#logic_return{}}
runLogicGroup(GroupID, ProgromArgu) when is_integer(GroupID) ->
	try
		#logic_groupCfg{logicIdList = LogicIDList} = getCfg:getCfgByArgs(cfg_logic_group, GroupID),
		runLogicList(LogicIDList, ProgromArgu, [], [], GroupID)
	catch
		ErrorInfo:Reason ->
			?ERROR_OUT(" run logic GroupID:~w, ErrorInfo:~p,Reason:~p,stack:~p~n", [GroupID, ErrorInfo, Reason, erlang:get_stacktrace()])
	end.
runLogicList([LogicID | T], ProgromArgu, SuccessReturnList, ErrorReturnList, GroupID) when is_integer(LogicID) ->
	case runLogic(LogicID, ProgromArgu) of
		{ok, LogicReturn} ->
			%%策划要求购买体力值这个功能，第一个条件不满足，就不判断后面的条件了
			case GroupID of
				18 when LogicReturn =/=[] ->
					{ok, [LogicReturn|SuccessReturnList], ErrorReturnList};
				_->
					runLogicList(T, ProgromArgu, [LogicReturn | SuccessReturnList], ErrorReturnList, GroupID)
			end;
		{fail, LogicReturn} ->
			runLogicList(T, ProgromArgu, SuccessReturnList, [LogicReturn | ErrorReturnList], GroupID)
	end;
runLogicList([], _Argus, SuccessReturnList, ErrorReturnList, _GroupID) ->
	if
		length(SuccessReturnList) > 1 ->
%%            ?ERROR_OUT("to many logic success,SuccessReturnList:~w~n",[SuccessReturnList]),
			{ok, SuccessReturnList, ErrorReturnList};
		length(SuccessReturnList) =:= 0 ->
%%            ?ERROR_OUT("all logic Fail,ErrorReturnList:~w~n",[ErrorReturnList]),
			{fail, SuccessReturnList, ErrorReturnList};
		true ->
			{ok, SuccessReturnList, ErrorReturnList}
	end.
runLogic(LogicID, ProgromArgu) when is_integer(LogicID) ->
	#logicCfg{conditionGropuId = ConditionGroupID, triggerIdList = TriggerIDList,targetIdList =TargetIdList } = getCfg:getCfgByArgs(cfg_logic, LogicID),
	NewProgromArgu = targetLib:select_target(TargetIdList, ProgromArgu),
	case conditionLib:check_condition_group(ConditionGroupID, NewProgromArgu) of
		{ok, ConditionToTriggerArgu} ->
			ConditionToTriggerLogicArgu = conditionReturnToLogicArgu(ConditionToTriggerArgu),
			case triggerLib:runTrigger(TriggerIDList, NewProgromArgu, ConditionToTriggerLogicArgu) of
				{ok, TriggersSuccessReturn, []} ->
					LogicReturn = #logic_return{logicId = LogicID,
						conditionToTriggerArgus = ConditionToTriggerArgu,
						conditionFailReturnList = [],
						triggerFailReturnList = [],
						triggerSuccessReturnList = TriggersSuccessReturn},
					{ok, LogicReturn};
				{fail, TriggersSuccessReturn, TriggersFailReturn} ->
					LogicReturn = #logic_return{logicId = LogicID,
						conditionToTriggerArgus = ConditionToTriggerArgu,
						conditionFailReturnList = [],
						triggerFailReturnList = TriggersFailReturn,
						triggerSuccessReturnList = TriggersSuccessReturn},
%%                    ?DEBUG_OUT("run logic fail trigger not pass returnInfo:~w~n",[LogicReturn]),
					{fail, LogicReturn}
			end;
		{fail, ToTriggerArguList, FailReturnList} ->
			LogicReturn = #logic_return{logicId = LogicID,
				conditionToTriggerArgus = ToTriggerArguList,
				conditionFailReturnList = FailReturnList,
				triggerFailReturnList = [],
				triggerSuccessReturnList = []},
%%            ?DEBUG_OUT("run logic fail condition not pass returnInfo:~w~n",[LogicReturn]),
			{fail, LogicReturn}
	end.
%%获取逻辑参数
getLogicArgu(Key, Argus) ->
	case lists:keyfind(Key, #logic_argu.key, Argus) of
		#logic_argu{} = LogickArgu -> {ok, LogickArgu};
		false ->
			{fail, none}
	end.
%%获取逻辑参数里面的值
getLogicArguValue(Key, Argus) ->
	case lists:keyfind(Key, #logic_argu.key, Argus) of
		#logic_argu{value = Value} -> {ok, Value};
		false ->
			{fail, none}
	end.
%创建一个逻辑参数
createLogicArgu(Key, Value) ->
	#logic_argu{key = Key, value = Value}.
%%添加一个逻辑参数
addLogicArgu(Key, Value, OldArgus) ->
	[#logic_argu{key = Key, value = Value} | OldArgus].
%%替换指定key的值有则替换，无则添加
replaceLogicArgu(Key, NewValue, LogicArgus) ->
	lists:keystore(Key, #logic_argu.key, LogicArgus, #logic_argu{key = Key, value = NewValue}).
%%替换指定key的值有则替换，无则添加
replaceLogicArgu(#logic_argu{key = Key} = NewArgu, OldArgus) ->
	lists:keystore(Key, #logic_argu.key, OldArgus, NewArgu).


conditionReturnToLogicArgu(ConditionReturns) ->
	conditionReturnToLogicArgu(ConditionReturns, []).
conditionReturnToLogicArgu([#condition_success_return{toTriggleValueKey = []} | T], LogicArus) ->
	conditionReturnToLogicArgu(T, LogicArus);
conditionReturnToLogicArgu([#condition_success_return{toTriggleValue = Value, toTriggleValueKey = [Key]} | T], LogicArus) ->
	NewLogicArgus = replaceLogicArgu(Key,Value,LogicArus),
	conditionReturnToLogicArgu(T, NewLogicArgus);
conditionReturnToLogicArgu([], LogicArus) ->
	LogicArus.
