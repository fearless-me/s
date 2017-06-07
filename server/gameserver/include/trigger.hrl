-ifndef(trigger_hrl).
-define(trigger_hrl,1).

%触发器类型定义

%时间触发
-define(TriggerTypeTimer,1).
%地图初始化
-define(TriggerTypeMapInit,2).
%切换地图格子
-define(TriggerTypeChangeMapGrid,3).

%触发器最大类型数量
-define(TriggerTypeMax,10).

-endif.
