%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 05. 九月 2016 11:44
%%%-------------------------------------------------------------------
-module(conditionLib).
-author("wenshaofei").
-include("gsInc.hrl").
%% API
-export([check_condition_group/2,getSuccessReturn/1,getFailReturn/1]).

%%%% {ok,SuccessReturnList,FailReturnList} 此处无论校验是否通过只会得到ok的返回
%%check_all_and_condation_in_group(#condation_group{type = ?CONDATION_TYPE_AND_CHECK_ALL,ConditionIDList =ConditionIDList }, Args) ->
%%    check_and_condation_list(ConditionIDList,[],[],true).

%%校验条件组
%% {ok,ToTriggerArguList}|  {fail,ToTriggerArguList,FaiCondations}
check_condition_group([],_)->
    {ok,[]};
check_condition_group([ConditionGroupId], Argus) when is_integer(ConditionGroupId) ->
    check_condition_group(ConditionGroupId, Argus);
check_condition_group(ConditionGroupId, Argus) when is_integer(ConditionGroupId) ->
    CondationGroup = getCfg:getCfgByArgs(cfg_condition_group,ConditionGroupId),
    check_condition_group(CondationGroup,Argus);
check_condition_group(#condition_groupCfg{type = ?CONDITION_TYPE_AND,conditionIDList =ConditionIDList }, Args) ->
    check_and_condition_list(ConditionIDList,Args,[]);
check_condition_group(#condition_groupCfg{type = ?CONDITION_TYPE_OR,conditionIDList =ConditionIDList }, Args) ->
    check_or_condition_list(ConditionIDList,Args,[],[]);
check_condition_group(#condition_groupCfg{type = ?CONDITION_TYPE_GROUP_OR,conditionIDList =CondationGroupIDList }, Args) ->
   check_or_condition_group_list(CondationGroupIDList,Args,[],[]);
check_condition_group(#condition_groupCfg{type = ?CONDITION_TYPE_GROUP_AND,conditionIDList =CondationGroupIDList }, Args) ->
    check_and_condition_group_list(CondationGroupIDList,Args,[],[]);
check_condition_group(CondationGroup, Args) ->
    ?ERROR_OUT("undefined condationGroup:~w,args:~w~n",[CondationGroup,Args]).

%%检测与条件组
check_and_condition_group_list([],_Args,ToTriggerArguList,_FailCondationList)->
    {ok,ToTriggerArguList};
check_and_condition_group_list([GroupId|GroupList],Args,ToTriggerArguList,FailConditionList)->
    case check_condition_group(GroupId,Args) of
        {ok,ToTriggerArgu}->
            check_and_condition_group_list(GroupList,Args,lists:append(ToTriggerArgu,ToTriggerArguList),FailConditionList);
        {fail,NewToTriggerArguList,FaiCondition}->
            {fail,NewToTriggerArguList,FaiCondition}
    end.

%%检测或条件组
check_or_condition_group_list([],_Args,ToTriggerArguList,FailConditionList)->
    {fail,ToTriggerArguList,FailConditionList};
check_or_condition_group_list([GroupId|GroupList],Args,ToTriggerArguList,FailConditionList)->
    case check_condition_group(GroupId,Args) of
        {ok,ToTriggerArgu}->
            {ok,lists:append(ToTriggerArgu,ToTriggerArguList)};
        {fail,NewToTriggerArguList,FaiCondition}->
            check_or_condition_group_list(GroupList,Args,NewToTriggerArguList,lists:append(FaiCondition,FailConditionList))
    end.

%%检测或条件
check_or_condition_list([],_Args,ToTriggerArguList,FailConditionList)->
    {fail,ToTriggerArguList,FailConditionList};
check_or_condition_list([ConditionID|ConditionIDList],Args,ToTriggerArguList,FailConditionList)->
    case check_condition(ConditionID,Args) of
        ok->
            {ok, ToTriggerArguList };
        {ok,ToTriggerArgu}->
            {ok,[ToTriggerArgu|ToTriggerArguList]};
        {fail,FaiCondition}->
            check_or_condition_list(ConditionIDList,Args,ToTriggerArguList,[FaiCondition|FailConditionList])
    end.


%%校验与条件列表
check_and_condition_list([],_Args,ToTriggerArguList)->
    {ok,ToTriggerArguList};
check_and_condition_list([ConditionID|ConditionIDList],Args,ToTriggerArguList)->
    case check_condition(ConditionID,Args) of
        ok ->
            check_and_condition_list(ConditionIDList,Args,ToTriggerArguList);
        {ok,ToTriggerArgu} ->
            NewToTriggerArguList = [ToTriggerArgu|ToTriggerArguList],
            check_and_condition_list(ConditionIDList,Args,NewToTriggerArguList);
        {fail,FaiCondition}  ->
            {fail,ToTriggerArguList,[FaiCondition]}
    end.
%%校验单个条件
check_condition(ConditionID,Args)->
    Condation= #conditionCfg{ module = Module,method = Method  } = getCfg:getCfgByArgs(cfg_condition,ConditionID),
    AtomModule = list_to_atom(Module),
    AtomMethod = list_to_atom(Method),
    AtomModule:AtomMethod(Args,Condation).


%%获取条件校验成功返回
getSuccessReturn(#conditionCfg{toTriggleValue = [],toTriggleValueKey = []})->
    ok;
getSuccessReturn(#conditionCfg{id = CfgID,toTriggleValue = Value,toTriggleValueKey = Key})->
    {ok,#condition_success_return{condationId = CfgID ,toTriggleValueKey =Key,toTriggleValue =Value}}.

%%获取条件校验失败返回
getFailReturn(#conditionCfg{id = CfgID})->
    {fail,#condition_fail_return{condationId = CfgID}}.
