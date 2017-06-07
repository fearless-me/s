%%: 声明
-ifndef(cfg_goldDragon).
-define(cfg_goldDragon, 1).

-record(goldDragonCfg, {
        %%: user:
        %%: 等级区间，使用同一地图，不同等级进入不同区间
        level,

        %%: user:
        %%: 刷怪波次，必须从1开始连续
        turn,

        %%: user:
        %%: [{怪物ID,最小数量,最大数量},...]
        %%: 按照列表顺序、随机数量、每秒1个进行刷怪
        monster

 }).

-endif.