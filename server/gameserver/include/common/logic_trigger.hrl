%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2015, <公司>
%%% @doc 统一条件定义头文件
%%%
%%% @end
%%% Created : 5. 九月 2016 16:35
%%%-------------------------------------------------------------------
-author("wenshaofei").

%%%%条件触发器id， triggerIdList：触发器id列表
%%-record(cfg_trigger_group,{id,triggerIdList}).
%%%%触发器配置
%%-record(cfg_trigger,{id,module,method,argu}).
%%触发器返回校验数据结构
-record(trigger_success_return,{triggerId,argus,fromCondationArgus}).
%%触发器失败返回校验数据结构
-record(trigger_fail_return,{triggerId,info}).
