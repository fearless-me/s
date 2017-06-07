%%: 声明
-ifndef(cfg_player_skills_upgrading).
-define(cfg_player_skills_upgrading, 1).

-record(player_skills_upgradingCfg, {
        skillID,

        level,

        %%: 作者:
        %%: 需要角色等级
        player_level,

        %%: 作者:
        %%: 升级到当前级的货币消耗，前值类型，后值消耗量
        currency,

        skillcoin_cost,

        %%: 作者:
        %%: 升级到当前级的道具消耗，前值类型，后值消耗量
        item,

        %%: 作者:
        %%: 编号 方便策划管理
        describe,

        id

 }).

-endif.