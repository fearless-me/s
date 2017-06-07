%%: 声明
-ifndef(cfg_pet_territory_search).
-define(cfg_pet_territory_search, 1).

-record(pet_territory_searchCfg, {
        %%: 搜索次数
        id,

        %%: 搜索消耗货币类型
        coinUseType,

        %%: 搜索消耗货币
        coinUseCount

 }).

-endif.