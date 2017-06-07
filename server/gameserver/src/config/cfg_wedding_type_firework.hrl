%%: 声明
-ifndef(cfg_wedding_type_firework).
-define(cfg_wedding_type_firework, 1).

-record(wedding_type_fireworkCfg, {
        id,

        name,

        %%: 消耗非绑定钻石数目
        cost,

        %%: UI冷却时间（在场所有玩家是同一个冷却时间）
        %%: 单位时间秒
        cooldown

 }).

-endif.