%%: 声明
-ifndef(cfg_pet_territory_force).
-define(cfg_pet_territory_force, 1).

-record(pet_territory_forceCfg, {
        %%: 战力区间
        id,

        %%: 战力的奖励系数
        rate

 }).

-endif.