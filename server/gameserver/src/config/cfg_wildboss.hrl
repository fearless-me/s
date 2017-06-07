%%: 声明
-ifndef(cfg_wildboss).
-define(cfg_wildboss, 1).

-record(wildbossCfg, {
        %%: BOSS的怪物id
        bossID,

        %%: 地图ID
        mapID,

        %%: BOSS的坐标
        pos,

        %%: 奖励的掉落包
        rewardID,

        %%: 刷新间隔时间，单位秒
        refreshTime,

        item,

        %%: 半身像
        bust,

        %%: 刘展:
        %%: 客户端显示排序
        sequence

 }).

-endif.