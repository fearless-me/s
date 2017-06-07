%%: 声明
-ifndef(cfg_skillmoneycost).
-define(cfg_skillmoneycost, 1).

-record(skillmoneycostCfg, {
        %%: 技能id
        skillID,

        level,

        %%: 游戏币消耗
        money

 }).

-endif.