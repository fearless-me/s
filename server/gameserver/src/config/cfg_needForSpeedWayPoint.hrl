%%: 声明
-ifndef(cfg_needForSpeedWayPoint).
-define(cfg_needForSpeedWayPoint, 1).

-record(needForSpeedWayPointCfg, {
        %%: 作者:
        %%: 触发区域序列
        id,

        %%: 作者:
        %%: 寻路箭头指向点
        %%: [x,z]
        waypoint

 }).

-endif.