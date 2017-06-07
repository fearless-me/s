%%: 声明
-ifndef(cfg_equipRecastRand).
-define(cfg_equipRecastRand, 1).

-record(equipRecastRandCfg, {
        %%: Administrator:
        %%: ID 无意义
        id,

        %%: Administrator:
        %%: 所属于的组
        group,

        %%: 值[下限，上限]
        values,

        %%: 权重
        weight

 }).

-endif.