%%: 声明
-ifndef(cfg_player_base).
-define(cfg_player_base, 1).

-record(player_baseCfg, {
        %%: 玩家等级
        level,

        maxLevel,

        %%: 职业：BY姜泓妃
        %%: 职业ID与play_desc中一致
        class,

        %%: 生命上限
        maxHP,

        %%: Administrator:
        %%: 物攻
        physicalAttack,

        %%: Administrator:
        %%: 法攻
        magicAttack,

        %%: Administrator:
        %%: 物防
        physicalDefence,

        %%: Administrator:
        %%: 法防
        magicDefence,

        %%: Administrator:
        %%: 暴击等级
        criticalLevel,

        %%: Administrator:
        %%: 抗爆等级
        criticalResistLevel,

        maxHPMultiply,

        physicalAttackMultiply,

        magicAttackMultiply,

        physicalDefenceMultiply,

        magicDefenceMultiply,

        criticalLevelMultiply,

        criticalResistLevelMultiply

 }).

-endif.