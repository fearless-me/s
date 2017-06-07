%%: 声明
-ifndef(cfg_demonBattleID).
-define(cfg_demonBattleID, 1).

-record(demonBattleIDCfg, {
        %%: 组ID
        iD,

        %%: 怪物ID
        monster,

        %%: BossID
        boss

 }).

-endif.