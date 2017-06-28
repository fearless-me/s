%% coding: latin-1
%%: 实现
-module(cfg_player_base_chs).
-compile(export_all).
-include("cfg_player_base.hrl").
-include("logger.hrl").

getRow(1,101)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 101,
    maxHP = 913,
    physicalAttack = 91,
    magicAttack = 91,
    physicalDefence = 91,
    magicDefence = 91,
    criticalLevel = 73,
    criticalResistLevel = 51,
    maxHPMultiply = 114,
    physicalAttackMultiply = 11,
    magicAttackMultiply = 11,
    physicalDefenceMultiply = 11,
    magicDefenceMultiply = 11,
    criticalLevelMultiply = 9,
    criticalResistLevelMultiply = 6
    };
getRow(1,111)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 111,
    maxHP = 11477,
    physicalAttack = 1147,
    magicAttack = 1147,
    physicalDefence = 1147,
    magicDefence = 1147,
    criticalLevel = 918,
    criticalResistLevel = 645,
    maxHPMultiply = 166,
    physicalAttackMultiply = 16,
    magicAttackMultiply = 16,
    physicalDefenceMultiply = 16,
    magicDefenceMultiply = 16,
    criticalLevelMultiply = 13,
    criticalResistLevelMultiply = 9
    };
getRow(1,112)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 112,
    maxHP = 9334,
    physicalAttack = 933,
    magicAttack = 933,
    physicalDefence = 933,
    magicDefence = 933,
    criticalLevel = 746,
    criticalResistLevel = 525,
    maxHPMultiply = 135,
    physicalAttackMultiply = 13,
    magicAttackMultiply = 13,
    physicalDefenceMultiply = 13,
    magicDefenceMultiply = 13,
    criticalLevelMultiply = 10,
    criticalResistLevelMultiply = 8
    };
getRow(1,121)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 121,
    maxHP = 36528,
    physicalAttack = 3652,
    magicAttack = 3652,
    physicalDefence = 3652,
    magicDefence = 3652,
    criticalLevel = 2922,
    criticalResistLevel = 2054,
    maxHPMultiply = 242,
    physicalAttackMultiply = 24,
    magicAttackMultiply = 24,
    physicalDefenceMultiply = 24,
    magicDefenceMultiply = 24,
    criticalLevelMultiply = 19,
    criticalResistLevelMultiply = 14
    };
getRow(1,122)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 122,
    maxHP = 38258,
    physicalAttack = 3825,
    magicAttack = 3825,
    physicalDefence = 3825,
    magicDefence = 3825,
    criticalLevel = 3060,
    criticalResistLevel = 2152,
    maxHPMultiply = 253,
    physicalAttackMultiply = 25,
    magicAttackMultiply = 25,
    physicalDefenceMultiply = 25,
    magicDefenceMultiply = 25,
    criticalLevelMultiply = 20,
    criticalResistLevelMultiply = 15
    };
getRow(1,123)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 123,
    maxHP = 23711,
    physicalAttack = 2371,
    magicAttack = 2371,
    physicalDefence = 2371,
    magicDefence = 2371,
    criticalLevel = 1896,
    criticalResistLevel = 1333,
    maxHPMultiply = 157,
    physicalAttackMultiply = 15,
    magicAttackMultiply = 15,
    physicalDefenceMultiply = 15,
    magicDefenceMultiply = 15,
    criticalLevelMultiply = 12,
    criticalResistLevelMultiply = 9
    };
getRow(1,201)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 201,
    maxHP = 659,
    physicalAttack = 65,
    magicAttack = 65,
    physicalDefence = 65,
    magicDefence = 65,
    criticalLevel = 52,
    criticalResistLevel = 37,
    maxHPMultiply = 82,
    physicalAttackMultiply = 8,
    magicAttackMultiply = 8,
    physicalDefenceMultiply = 8,
    magicDefenceMultiply = 8,
    criticalLevelMultiply = 6,
    criticalResistLevelMultiply = 4
    };
getRow(1,211)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 211,
    maxHP = 8614,
    physicalAttack = 861,
    magicAttack = 861,
    physicalDefence = 861,
    magicDefence = 861,
    criticalLevel = 689,
    criticalResistLevel = 484,
    maxHPMultiply = 125,
    physicalAttackMultiply = 12,
    magicAttackMultiply = 12,
    physicalDefenceMultiply = 12,
    magicDefenceMultiply = 12,
    criticalLevelMultiply = 10,
    criticalResistLevelMultiply = 7
    };
getRow(1,212)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 212,
    maxHP = 7113,
    physicalAttack = 711,
    magicAttack = 711,
    physicalDefence = 711,
    magicDefence = 711,
    criticalLevel = 569,
    criticalResistLevel = 400,
    maxHPMultiply = 103,
    physicalAttackMultiply = 10,
    magicAttackMultiply = 10,
    physicalDefenceMultiply = 10,
    magicDefenceMultiply = 10,
    criticalLevelMultiply = 8,
    criticalResistLevelMultiply = 6
    };
getRow(1,221)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 221,
    maxHP = 26389,
    physicalAttack = 2638,
    magicAttack = 2638,
    physicalDefence = 2638,
    magicDefence = 2638,
    criticalLevel = 2111,
    criticalResistLevel = 1484,
    maxHPMultiply = 174,
    physicalAttackMultiply = 17,
    magicAttackMultiply = 17,
    physicalDefenceMultiply = 17,
    magicDefenceMultiply = 17,
    criticalLevelMultiply = 13,
    criticalResistLevelMultiply = 10
    };
getRow(1,222)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 222,
    maxHP = 31115,
    physicalAttack = 3111,
    magicAttack = 3111,
    physicalDefence = 3111,
    magicDefence = 3111,
    criticalLevel = 2489,
    criticalResistLevel = 1750,
    maxHPMultiply = 206,
    physicalAttackMultiply = 20,
    magicAttackMultiply = 20,
    physicalDefenceMultiply = 20,
    magicDefenceMultiply = 20,
    criticalLevelMultiply = 16,
    criticalResistLevelMultiply = 12
    };
getRow(1,223)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 223,
    maxHP = 27042,
    physicalAttack = 2704,
    magicAttack = 2704,
    physicalDefence = 2704,
    magicDefence = 2704,
    criticalLevel = 2163,
    criticalResistLevel = 1521,
    maxHPMultiply = 179,
    physicalAttackMultiply = 17,
    magicAttackMultiply = 17,
    physicalDefenceMultiply = 17,
    magicDefenceMultiply = 17,
    criticalLevelMultiply = 14,
    criticalResistLevelMultiply = 10
    };
getRow(1,301)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 301,
    maxHP = 581,
    physicalAttack = 58,
    magicAttack = 58,
    physicalDefence = 58,
    magicDefence = 58,
    criticalLevel = 46,
    criticalResistLevel = 32,
    maxHPMultiply = 72,
    physicalAttackMultiply = 7,
    magicAttackMultiply = 7,
    physicalDefenceMultiply = 7,
    magicDefenceMultiply = 7,
    criticalLevelMultiply = 5,
    criticalResistLevelMultiply = 4
    };
getRow(1,311)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 311,
    maxHP = 8112,
    physicalAttack = 811,
    magicAttack = 811,
    physicalDefence = 811,
    magicDefence = 811,
    criticalLevel = 649,
    criticalResistLevel = 456,
    maxHPMultiply = 117,
    physicalAttackMultiply = 11,
    magicAttackMultiply = 11,
    physicalDefenceMultiply = 11,
    magicDefenceMultiply = 11,
    criticalLevelMultiply = 9,
    criticalResistLevelMultiply = 7
    };
getRow(1,312)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 312,
    maxHP = 6744,
    physicalAttack = 674,
    magicAttack = 674,
    physicalDefence = 674,
    magicDefence = 674,
    criticalLevel = 539,
    criticalResistLevel = 379,
    maxHPMultiply = 97,
    physicalAttackMultiply = 9,
    magicAttackMultiply = 9,
    physicalDefenceMultiply = 9,
    magicDefenceMultiply = 9,
    criticalLevelMultiply = 7,
    criticalResistLevelMultiply = 5
    };
getRow(1,321)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 321,
    maxHP = 23267,
    physicalAttack = 2326,
    magicAttack = 2326,
    physicalDefence = 2326,
    magicDefence = 2326,
    criticalLevel = 1861,
    criticalResistLevel = 1308,
    maxHPMultiply = 154,
    physicalAttackMultiply = 15,
    magicAttackMultiply = 15,
    physicalDefenceMultiply = 15,
    magicDefenceMultiply = 15,
    criticalLevelMultiply = 12,
    criticalResistLevelMultiply = 9
    };
getRow(1,322)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 322,
    maxHP = 28714,
    physicalAttack = 2871,
    magicAttack = 2871,
    physicalDefence = 2871,
    magicDefence = 2871,
    criticalLevel = 2297,
    criticalResistLevel = 1615,
    maxHPMultiply = 190,
    physicalAttackMultiply = 19,
    magicAttackMultiply = 19,
    physicalDefenceMultiply = 19,
    magicDefenceMultiply = 19,
    criticalLevelMultiply = 15,
    criticalResistLevelMultiply = 11
    };
getRow(1,323)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 323,
    maxHP = 22480,
    physicalAttack = 2248,
    magicAttack = 2248,
    physicalDefence = 2248,
    magicDefence = 2248,
    criticalLevel = 1798,
    criticalResistLevel = 1264,
    maxHPMultiply = 149,
    physicalAttackMultiply = 14,
    magicAttackMultiply = 14,
    physicalDefenceMultiply = 14,
    magicDefenceMultiply = 14,
    criticalLevelMultiply = 11,
    criticalResistLevelMultiply = 8
    };
getRow(_,_)->[].

getKeyList()->[
    {1,101},
    {1,111},
    {1,112},
    {1,121},
    {1,122},
    {1,123},
    {1,201},
    {1,211},
    {1,212},
    {1,221},
    {1,222},
    {1,223},
    {1,301},
    {1,311},
    {1,312},
    {1,321},
    {1,322},
    {1,323}
    ].

get1KeyList()->[
    1
    ].

get2KeyList(1)->[
    101,
    111,
    112,
    121,
    122,
    123,
    201,
    211,
    212,
    221,
    222,
    223,
    301,
    311,
    312,
    321,
    322,
    323
    ];
get2KeyList(_)->[].

