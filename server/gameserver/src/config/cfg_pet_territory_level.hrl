%%: 声明
-ifndef(cfg_pet_territory_level).
-define(cfg_pet_territory_level, 1).

-record(pet_territory_levelCfg, {
        %%: user:
        %%: 等级
        id,

        %%: user:
        %%: 等级
        coinUseType,

        %%: user:
        %%: 等级
        coinUseCount,

        %%: user:
        %%: 等级
        rate,

        text

 }).

-endif.