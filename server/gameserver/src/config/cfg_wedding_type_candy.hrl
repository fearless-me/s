%%: 声明
-ifndef(cfg_wedding_type_candy).
-define(cfg_wedding_type_candy, 1).

-record(wedding_type_candyCfg, {
        %%: 与配置wedding_type中的id对应
        wedding_type,

        %%: 采集物在object中的id
        object_ID,

        %%: 消耗非绑定钻石
        cost,

        %%: 发喜糖冷却时间。单位为秒s
        cooldown,

        %%: 喜糖个数
        count,

        %%: 喜糖坐标，只有X，Y
        rand_pos

 }).

-endif.