%%: 声明
-ifndef(cfg_pet_territory_time).
-define(cfg_pet_territory_time, 1).

-record(pet_territory_timeCfg, {
        %%: 时间段选择 小时
        time,

        level,

        %%: 资源速率倍数
        rate,

        text,

        %%: user:
        %%: 等级
        coinUseType,

        %%: user:
        %%: 等级
        coinUseCount

 }).

-endif.