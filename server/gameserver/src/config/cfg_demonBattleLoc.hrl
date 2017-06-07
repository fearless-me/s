%%: 声明
-ifndef(cfg_demonBattleLoc).
-define(cfg_demonBattleLoc, 1).

-record(demonBattleLocCfg, {
        %%: ID
        iD,

        %%: 前一个数值<怪物波数<=该数值时的刷怪点数
        turns,

        %%: 小怪位置
        monsterLoc,

        %%: boss位置
        bossLoc

 }).

-endif.