%%: 声明
-ifndef(cfg_activitylist).
-define(cfg_activitylist, 1).

-record(activitylistCfg, {
        id,

        %%: 活动名称
        name,

        %%: 金币
        gold,

        %%: 钻石
        diamond,

        %%: 经验
        exp,

        %%: 荣誉
        honour,

        %%: 女神
        goddess,

        %%: 宠物
        pet,

        %%: 强化重铸
        strengthen,

        %%: 宝石
        gem

 }).

-endif.