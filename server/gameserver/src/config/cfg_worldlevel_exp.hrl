%%: 声明
-ifndef(cfg_worldlevel_exp).
-define(cfg_worldlevel_exp, 1).

-record(worldlevel_expCfg, {
        %%: 世界等级 和 玩家等级的 差值
        id,

        %%: 额外增加经验加成
        %%: 0   额外不加
        %%: 0.5 额外50%经验
        %%: 1   额外100%
        exp

 }).

-endif.