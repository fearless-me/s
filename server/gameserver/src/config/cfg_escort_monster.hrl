%%: 声明
-ifndef(cfg_escort_monster).
-define(cfg_escort_monster, 1).

-record(escort_monsterCfg, {
        %%: 刘展:
        %%: 怪物分组
        id,

        %%: 怪物组
        %%: [｛怪物ID1，怪物数量｝，｛怪物ID2，怪物数量｝]
        monster

 }).

-endif.