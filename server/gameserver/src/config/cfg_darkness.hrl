%%: 声明
-ifndef(cfg_darkness).
-define(cfg_darkness, 1).

-record(darknessCfg, {
        %%: 楼层id，id数代表楼层数
        id,

        %%: 特殊活动时间，小怪（恶魔）掉落的额外奖励
        %%: [{怪物id, 硬币,积分},...]
        %%:  
        drop,

        %%: 小怪（恶魔）刷新坐标，一一对应本表中的drop字段怪物
        %%: [{x,y},{x,y}...]
        elite_coordinate,

        %%: 死亡点击营地复活后重生在当前地图的随机坐标，格式  [{X1,Y1},{X2,Y2}...]
        relive,

        %%: 特殊活动时间，Boss击杀额外奖励：
        %%: 【怪物id, 硬币，积分】
        boss_id,

        %%: boss刷新坐标:
        %%: [{X,Y},...] 在多个坐标中随机刷新
        boss_coordinate,

        %%: boss复活时间间隔 秒
        %%: 默认57600，不要删除修改
        bossfreshtime

 }).

-endif.