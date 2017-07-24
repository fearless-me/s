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
    physicalAttack = 72,
    magicAttack = 56,
    physicalDefence = 96,
    magicDefence = 88,
    criticalLevel = 47,
    criticalResistLevel = 45,
    maxHPMultiply = 114,
    physicalAttackMultiply = 9,
    magicAttackMultiply = 7,
    physicalDefenceMultiply = 12,
    magicDefenceMultiply = 11,
    criticalLevelMultiply = 5,
    criticalResistLevelMultiply = 6
    };
getRow(1,111)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 111,
    maxHP = 11477,
    physicalAttack = 864,
    magicAttack = 672,
    physicalDefence = 1248,
    magicDefence = 1008,
    criticalLevel = 572,
    criticalResistLevel = 540,
    maxHPMultiply = 166,
    physicalAttackMultiply = 12,
    magicAttackMultiply = 9,
    physicalDefenceMultiply = 18,
    magicDefenceMultiply = 14,
    criticalLevelMultiply = 8,
    criticalResistLevelMultiply = 8
    };
getRow(1,112)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 112,
    maxHP = 9334,
    physicalAttack = 1008,
    magicAttack = 672,
    physicalDefence = 1056,
    magicDefence = 864,
    criticalLevel = 685,
    criticalResistLevel = 540,
    maxHPMultiply = 135,
    physicalAttackMultiply = 14,
    magicAttackMultiply = 9,
    physicalDefenceMultiply = 15,
    magicDefenceMultiply = 12,
    criticalLevelMultiply = 9,
    criticalResistLevelMultiply = 8
    };
getRow(1,121)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 121,
    maxHP = 36528,
    physicalAttack = 2880,
    magicAttack = 2240,
    physicalDefence = 3840,
    magicDefence = 3520,
    criticalLevel = 1908,
    criticalResistLevel = 1800,
    maxHPMultiply = 242,
    physicalAttackMultiply = 19,
    magicAttackMultiply = 14,
    physicalDefenceMultiply = 25,
    magicDefenceMultiply = 23,
    criticalLevelMultiply = 12,
    criticalResistLevelMultiply = 12
    };
getRow(1,122)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 122,
    maxHP = 38258,
    physicalAttack = 2880,
    magicAttack = 2240,
    physicalDefence = 4160,
    magicDefence = 3360,
    criticalLevel = 1908,
    criticalResistLevel = 1800,
    maxHPMultiply = 253,
    physicalAttackMultiply = 19,
    magicAttackMultiply = 14,
    physicalDefenceMultiply = 27,
    magicDefenceMultiply = 22,
    criticalLevelMultiply = 12,
    criticalResistLevelMultiply = 12
    };
getRow(1,123)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 123,
    maxHP = 23711,
    physicalAttack = 2240,
    magicAttack = 4160,
    physicalDefence = 2880,
    magicDefence = 3360,
    criticalLevel = 2560,
    criticalResistLevel = 1800,
    maxHPMultiply = 157,
    physicalAttackMultiply = 14,
    magicAttackMultiply = 27,
    physicalDefenceMultiply = 19,
    magicDefenceMultiply = 22,
    criticalLevelMultiply = 16,
    criticalResistLevelMultiply = 12
    };
getRow(1,201)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 201,
    maxHP = 659,
    physicalAttack = 56,
    magicAttack = 96,
    physicalDefence = 72,
    magicDefence = 104,
    criticalLevel = 60,
    criticalResistLevel = 45,
    maxHPMultiply = 82,
    physicalAttackMultiply = 7,
    magicAttackMultiply = 12,
    physicalDefenceMultiply = 9,
    magicDefenceMultiply = 13,
    criticalLevelMultiply = 7,
    criticalResistLevelMultiply = 6
    };
getRow(1,211)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 211,
    maxHP = 8614,
    physicalAttack = 672,
    magicAttack = 1056,
    physicalDefence = 1036,
    magicDefence = 1152,
    criticalLevel = 572,
    criticalResistLevel = 540,
    maxHPMultiply = 125,
    physicalAttackMultiply = 9,
    magicAttackMultiply = 15,
    physicalDefenceMultiply = 15,
    magicDefenceMultiply = 16,
    criticalLevelMultiply = 8,
    criticalResistLevelMultiply = 8
    };
getRow(1,212)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 212,
    maxHP = 7113,
    physicalAttack = 672,
    magicAttack = 1248,
    physicalDefence = 864,
    magicDefence = 1008,
    criticalLevel = 768,
    criticalResistLevel = 540,
    maxHPMultiply = 103,
    physicalAttackMultiply = 9,
    magicAttackMultiply = 18,
    physicalDefenceMultiply = 12,
    magicDefenceMultiply = 14,
    criticalLevelMultiply = 11,
    criticalResistLevelMultiply = 8
    };
getRow(1,221)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 221,
    maxHP = 26389,
    physicalAttack = 2240,
    magicAttack = 3840,
    physicalDefence = 2880,
    magicDefence = 4160,
    criticalLevel = 2419,
    criticalResistLevel = 1800,
    maxHPMultiply = 174,
    physicalAttackMultiply = 14,
    magicAttackMultiply = 25,
    physicalDefenceMultiply = 19,
    magicDefenceMultiply = 27,
    criticalLevelMultiply = 16,
    criticalResistLevelMultiply = 12
    };
getRow(1,222)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 222,
    maxHP = 31115,
    physicalAttack = 3360,
    magicAttack = 2240,
    physicalDefence = 3520,
    magicDefence = 2880,
    criticalLevel = 2284,
    criticalResistLevel = 1800,
    maxHPMultiply = 206,
    physicalAttackMultiply = 22,
    magicAttackMultiply = 14,
    physicalDefenceMultiply = 23,
    magicDefenceMultiply = 19,
    criticalLevelMultiply = 15,
    criticalResistLevelMultiply = 12
    };
getRow(1,223)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 223,
    maxHP = 31453,
    physicalAttack = 3360,
    magicAttack = 2240,
    physicalDefence = 3360,
    magicDefence = 2880,
    criticalLevel = 2284,
    criticalResistLevel = 1800,
    maxHPMultiply = 208,
    physicalAttackMultiply = 22,
    magicAttackMultiply = 14,
    physicalDefenceMultiply = 22,
    magicDefenceMultiply = 19,
    criticalLevelMultiply = 15,
    criticalResistLevelMultiply = 12
    };
getRow(1,301)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 301,
    maxHP = 777,
    physicalAttack = 84,
    magicAttack = 56,
    physicalDefence = 84,
    magicDefence = 72,
    criticalLevel = 64,
    criticalResistLevel = 45,
    maxHPMultiply = 97,
    physicalAttackMultiply = 10,
    magicAttackMultiply = 7,
    physicalDefenceMultiply = 10,
    magicDefenceMultiply = 9,
    criticalLevelMultiply = 8,
    criticalResistLevelMultiply = 6
    };
getRow(1,311)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 311,
    maxHP = 9436,
    physicalAttack = 1008,
    magicAttack = 672,
    physicalDefence = 1008,
    magicDefence = 864,
    criticalLevel = 685,
    criticalResistLevel = 540,
    maxHPMultiply = 137,
    physicalAttackMultiply = 14,
    magicAttackMultiply = 9,
    physicalDefenceMultiply = 14,
    magicDefenceMultiply = 12,
    criticalLevelMultiply = 9,
    criticalResistLevelMultiply = 8
    };
getRow(1,312)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 312,
    maxHP = 8922,
    physicalAttack = 1036,
    magicAttack = 672,
    physicalDefence = 1008,
    magicDefence = 864,
    criticalLevel = 768,
    criticalResistLevel = 540,
    maxHPMultiply = 129,
    physicalAttackMultiply = 15,
    magicAttackMultiply = 9,
    physicalDefenceMultiply = 14,
    magicDefenceMultiply = 12,
    criticalLevelMultiply = 11,
    criticalResistLevelMultiply = 8
    };
getRow(1,321)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 321,
    maxHP = 31108,
    physicalAttack = 3360,
    magicAttack = 2240,
    physicalDefence = 3360,
    magicDefence = 2880,
    criticalLevel = 2560,
    criticalResistLevel = 1800,
    maxHPMultiply = 206,
    physicalAttackMultiply = 22,
    magicAttackMultiply = 14,
    physicalDefenceMultiply = 22,
    magicDefenceMultiply = 19,
    criticalLevelMultiply = 16,
    criticalResistLevelMultiply = 12
    };
getRow(1,322)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 322,
    maxHP = 28714,
    physicalAttack = 2240,
    magicAttack = 3520,
    physicalDefence = 3456,
    magicDefence = 3840,
    criticalLevel = 1908,
    criticalResistLevel = 1800,
    maxHPMultiply = 190,
    physicalAttackMultiply = 14,
    magicAttackMultiply = 23,
    physicalDefenceMultiply = 22,
    magicDefenceMultiply = 25,
    criticalLevelMultiply = 12,
    criticalResistLevelMultiply = 12
    };
getRow(1,323)->
    #player_baseCfg {
    level = 1,
    maxLevel = 45,
    class = 323,
    maxHP = 29740,
    physicalAttack = 3456,
    magicAttack = 2240,
    physicalDefence = 3360,
    magicDefence = 2880,
    criticalLevel = 2560,
    criticalResistLevel = 1800,
    maxHPMultiply = 197,
    physicalAttackMultiply = 22,
    magicAttackMultiply = 14,
    physicalDefenceMultiply = 22,
    magicDefenceMultiply = 19,
    criticalLevelMultiply = 16,
    criticalResistLevelMultiply = 12
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

