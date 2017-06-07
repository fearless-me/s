%%: 声明
-ifndef(cfg_factionList).
-define(cfg_factionList, 1).

-record(factionListCfg, {
        id,

        %%: 0 无关系
        %%: 1友好
        %%: 2 敌对
        faction,

        %%: 玩家，宠物，载体
        player,

        %%: 联盟怪物
        alliedMonster,

        %%: 敌对怪物
        hostileMonster,

        %%: 战场蓝方
        battleBlue,

        %%: 战场红方
        battleRed,

        %%: 队友
        teamMate,

        %%: 非队友
        nonTeamMate,

        %%: 同公会
        memberShip,

        %%: 非同公会
        nonMemberShip

 }).

-endif.