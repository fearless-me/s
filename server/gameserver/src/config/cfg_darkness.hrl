%%: 声明
-ifndef(cfg_darkness).
-define(cfg_darkness, 1).

-record(darknessCfg, {
        %%: 楼层id，id数代表楼层数
        id,

        %%: 刘渊：
        %%: 小怪（恶魔）id以及特殊活动时间内的额外奖励
        %%: [{怪物id, 硬币,积分},...]
        %%:  
        drop,

        %%: 刘渊：
        %%: 小怪（恶魔）刷新坐标，一一对应本表中的drop字段怪物
        %%: [{x,y},{x,y}...]
        elite_coordinate,

        %%: 刘渊：
        %%: 死亡点击营地复活后重生在当前地图的随机坐标
        %%: [{X.0,Y.0},...]
        relive,

        %%: 特殊活动时间，Boss击杀额外奖励：
        %%: 【怪物id, 硬币，积分】
        boss_id,

        %%: boss刷新坐标:
        %%: [{X,Y},...] 在多个坐标中随机刷新
        boss_coordinate,

        %%: boss复活时间随机选一个间隔 秒
        %%: 不要的，但是不要删除
        bossfreshtime

 }).

-endif.