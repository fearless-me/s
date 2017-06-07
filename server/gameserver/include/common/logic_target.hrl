%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <公司>
%%% @doc 逻辑功能目标查找头文件
%%%
%%% @end
%%% Created : 5. 九月 2016 16:35
%%%-------------------------------------------------------------------
-author("wenshaofei").


%%目标查找返回校验数据结构
-record(target_success_return,{targetId,fromProgromArgus}).
%%目标查找失败返回校验数据结构
-record(target_fail_return,{targetId,info}).
