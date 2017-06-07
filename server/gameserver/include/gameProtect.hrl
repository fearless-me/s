%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% 目前只针对 变速齿轮类的外挂做处理, 其他的先不管
%%% 变速齿轮 是通过修改时钟实现的， 所以监控心跳即可
%%% @end
%%% Created : 22. 十二月 2014 10:53
%%%-------------------------------------------------------------------


-ifndef(GameProtect_Hrl).
-define(GameProtect_Hrl, 1).

-define(GameProtect_HeartBeat_Time, 10000). %%心跳间隔要与客户端的心跳一样 10 * 1000 单位(ms) 根据具体情况设置，要不然会误杀玩家
-define(GameProtect_HeartBeat_Check, 60000). %%检测间隔 == 玩家网络进程心跳时间

%-define(GameProtect_HeartBeat_Rate, ?GameProtect_HeartBeat_Check div ?GameProtect_HeartBeat_Time). %% 心跳频率 (n/min)
-define(GameProtect_HeartBeat_Rate, 6). %% 心跳频率 (n/min)
-define(GameProtect_HeartBeat_Rate_Max, ?GameProtect_HeartBeat_Rate + ?GameProtect_HeartBeat_Rate div 2).  %% 50% 的误差
-define(GameProtect_HeartBeat_Rate_Min, ?GameProtect_HeartBeat_Rate - ?GameProtect_HeartBeat_Rate div 2).

-define(GameProtect_Freeze_Time, 3600 ).  %% 封号1小时 单位(s)
-define(GameProtect_Err_Count, 3).        %%检测到3次,封号一小时


%%----------------------------------------------------------------------
%% 封号原因码
%%----------------------------------------------------------------------
-define(ForbiddenType_WG, 999999).  %%变速外挂封号

-endif.