%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2015, <公司>
%%% @doc 统一条件定义头文件
%%%
%%% @end
%%% Created : 5. 九月 2016 16:35
%%%-------------------------------------------------------------------
-author("wenshaofei").


%%条件配置id 条件唯一编号，module=条件所在模块,method=条件触发函数，condationArgu=条件校验参数，toTriggleValueKey=传给trigger参数的key,toTriggleValue=传给trigger参数值
%%-record(conditionCfg,{id,module,method,argu,toTriggleValueKey,toTriggleValue}).
%%%%条件组 type=条件关系类型，condationList=条件列表,isCheckAll=
%%%% 与条件当校验到第一个fail时会中断校验，或条件检测到第一个true时也会中断。
%%-record(condition_groupCfg,{id,type,condationIDList}).
%%条件返回校验数据结构
-record(condition_success_return,{condationId,toTriggleValueKey=[],toTriggleValue=[]}).
%%条件返回校验数据结构
-record(condition_fail_return,{condationId}).
%%条件关系与关系，所有条件全部满足时校验通过
-define(CONDITION_TYPE_AND,1).
%%或关系
-define(CONDITION_TYPE_OR,2).
%%条件组关系或，有一组满足条件即可
-define(CONDITION_TYPE_GROUP_OR,3).
%%条件组关系与，所有组均满足才可以通过校验
-define(CONDITION_TYPE_GROUP_AND,4).


