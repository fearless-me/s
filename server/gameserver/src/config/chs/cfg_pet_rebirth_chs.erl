%% coding: latin-1
%%: 实现
-module(cfg_pet_rebirth_chs).
-compile(export_all).
-include("cfg_pet_rebirth.hrl").
-include("logger.hrl").

getRow(1,0)->
    #pet_rebirthCfg {
    petRebirth = 1,
    petQuality = 0,
    maxHP2 = 2407,
    physicalAttack = 240,
    magicAttack = 240,
    physicalDefence = 240,
    magicDefence = 240,
    maxHP2Multiply = 0.1,
    physicalAttackMultiply = 0.1,
    magicAttackMultiply = 0.1,
    physicalDefenceMultiply = 0.1,
    magicDefenceMultiply = 0.1,
    rebirthGrow = 0.1
    };
getRow(1,1)->
    #pet_rebirthCfg {
    petRebirth = 1,
    petQuality = 1,
    maxHP2 = 2648,
    physicalAttack = 264,
    magicAttack = 264,
    physicalDefence = 264,
    magicDefence = 264,
    maxHP2Multiply = 0.1,
    physicalAttackMultiply = 0.1,
    magicAttackMultiply = 0.1,
    physicalDefenceMultiply = 0.1,
    magicDefenceMultiply = 0.1,
    rebirthGrow = 0.1
    };
getRow(1,2)->
    #pet_rebirthCfg {
    petRebirth = 1,
    petQuality = 2,
    maxHP2 = 2889,
    physicalAttack = 288,
    magicAttack = 288,
    physicalDefence = 288,
    magicDefence = 288,
    maxHP2Multiply = 0.1,
    physicalAttackMultiply = 0.1,
    magicAttackMultiply = 0.1,
    physicalDefenceMultiply = 0.1,
    magicDefenceMultiply = 0.1,
    rebirthGrow = 0.1
    };
getRow(1,3)->
    #pet_rebirthCfg {
    petRebirth = 1,
    petQuality = 3,
    maxHP2 = 3852,
    physicalAttack = 385,
    magicAttack = 385,
    physicalDefence = 385,
    magicDefence = 385,
    maxHP2Multiply = 0.1,
    physicalAttackMultiply = 0.1,
    magicAttackMultiply = 0.1,
    physicalDefenceMultiply = 0.1,
    magicDefenceMultiply = 0.1,
    rebirthGrow = 0.1
    };
getRow(1,4)->
    #pet_rebirthCfg {
    petRebirth = 1,
    petQuality = 4,
    maxHP2 = 4815,
    physicalAttack = 481,
    magicAttack = 481,
    physicalDefence = 481,
    magicDefence = 481,
    maxHP2Multiply = 0.1,
    physicalAttackMultiply = 0.1,
    magicAttackMultiply = 0.1,
    physicalDefenceMultiply = 0.1,
    magicDefenceMultiply = 0.1,
    rebirthGrow = 0.1
    };
getRow(2,0)->
    #pet_rebirthCfg {
    petRebirth = 2,
    petQuality = 0,
    maxHP2 = 4815,
    physicalAttack = 481,
    magicAttack = 481,
    physicalDefence = 481,
    magicDefence = 481,
    maxHP2Multiply = 0.2,
    physicalAttackMultiply = 0.2,
    magicAttackMultiply = 0.2,
    physicalDefenceMultiply = 0.2,
    magicDefenceMultiply = 0.2,
    rebirthGrow = 0.2
    };
getRow(2,1)->
    #pet_rebirthCfg {
    petRebirth = 2,
    petQuality = 1,
    maxHP2 = 5296,
    physicalAttack = 529,
    magicAttack = 529,
    physicalDefence = 529,
    magicDefence = 529,
    maxHP2Multiply = 0.2,
    physicalAttackMultiply = 0.2,
    magicAttackMultiply = 0.2,
    physicalDefenceMultiply = 0.2,
    magicDefenceMultiply = 0.2,
    rebirthGrow = 0.2
    };
getRow(2,2)->
    #pet_rebirthCfg {
    petRebirth = 2,
    petQuality = 2,
    maxHP2 = 5778,
    physicalAttack = 577,
    magicAttack = 577,
    physicalDefence = 577,
    magicDefence = 577,
    maxHP2Multiply = 0.2,
    physicalAttackMultiply = 0.2,
    magicAttackMultiply = 0.2,
    physicalDefenceMultiply = 0.2,
    magicDefenceMultiply = 0.2,
    rebirthGrow = 0.2
    };
getRow(2,3)->
    #pet_rebirthCfg {
    petRebirth = 2,
    petQuality = 3,
    maxHP2 = 7704,
    physicalAttack = 770,
    magicAttack = 770,
    physicalDefence = 770,
    magicDefence = 770,
    maxHP2Multiply = 0.2,
    physicalAttackMultiply = 0.2,
    magicAttackMultiply = 0.2,
    physicalDefenceMultiply = 0.2,
    magicDefenceMultiply = 0.2,
    rebirthGrow = 0.2
    };
getRow(2,4)->
    #pet_rebirthCfg {
    petRebirth = 2,
    petQuality = 4,
    maxHP2 = 9630,
    physicalAttack = 963,
    magicAttack = 963,
    physicalDefence = 963,
    magicDefence = 963,
    maxHP2Multiply = 0.2,
    physicalAttackMultiply = 0.2,
    magicAttackMultiply = 0.2,
    physicalDefenceMultiply = 0.2,
    magicDefenceMultiply = 0.2,
    rebirthGrow = 0.2
    };
getRow(3,0)->
    #pet_rebirthCfg {
    petRebirth = 3,
    petQuality = 0,
    maxHP2 = 7222,
    physicalAttack = 722,
    magicAttack = 722,
    physicalDefence = 722,
    magicDefence = 722,
    maxHP2Multiply = 0.3,
    physicalAttackMultiply = 0.3,
    magicAttackMultiply = 0.3,
    physicalDefenceMultiply = 0.3,
    magicDefenceMultiply = 0.3,
    rebirthGrow = 0.3
    };
getRow(3,1)->
    #pet_rebirthCfg {
    petRebirth = 3,
    petQuality = 1,
    maxHP2 = 7944,
    physicalAttack = 794,
    magicAttack = 794,
    physicalDefence = 794,
    magicDefence = 794,
    maxHP2Multiply = 0.3,
    physicalAttackMultiply = 0.3,
    magicAttackMultiply = 0.3,
    physicalDefenceMultiply = 0.3,
    magicDefenceMultiply = 0.3,
    rebirthGrow = 0.3
    };
getRow(3,2)->
    #pet_rebirthCfg {
    petRebirth = 3,
    petQuality = 2,
    maxHP2 = 8667,
    physicalAttack = 866,
    magicAttack = 866,
    physicalDefence = 866,
    magicDefence = 866,
    maxHP2Multiply = 0.3,
    physicalAttackMultiply = 0.3,
    magicAttackMultiply = 0.3,
    physicalDefenceMultiply = 0.3,
    magicDefenceMultiply = 0.3,
    rebirthGrow = 0.3
    };
getRow(3,3)->
    #pet_rebirthCfg {
    petRebirth = 3,
    petQuality = 3,
    maxHP2 = 11556,
    physicalAttack = 1155,
    magicAttack = 1155,
    physicalDefence = 1155,
    magicDefence = 1155,
    maxHP2Multiply = 0.3,
    physicalAttackMultiply = 0.3,
    magicAttackMultiply = 0.3,
    physicalDefenceMultiply = 0.3,
    magicDefenceMultiply = 0.3,
    rebirthGrow = 0.3
    };
getRow(3,4)->
    #pet_rebirthCfg {
    petRebirth = 3,
    petQuality = 4,
    maxHP2 = 14445,
    physicalAttack = 1444,
    magicAttack = 1444,
    physicalDefence = 1444,
    magicDefence = 1444,
    maxHP2Multiply = 0.3,
    physicalAttackMultiply = 0.3,
    magicAttackMultiply = 0.3,
    physicalDefenceMultiply = 0.3,
    magicDefenceMultiply = 0.3,
    rebirthGrow = 0.3
    };
getRow(4,0)->
    #pet_rebirthCfg {
    petRebirth = 4,
    petQuality = 0,
    maxHP2 = 9630,
    physicalAttack = 963,
    magicAttack = 963,
    physicalDefence = 963,
    magicDefence = 963,
    maxHP2Multiply = 0.4,
    physicalAttackMultiply = 0.4,
    magicAttackMultiply = 0.4,
    physicalDefenceMultiply = 0.4,
    magicDefenceMultiply = 0.4,
    rebirthGrow = 0.4
    };
getRow(4,1)->
    #pet_rebirthCfg {
    petRebirth = 4,
    petQuality = 1,
    maxHP2 = 10593,
    physicalAttack = 1059,
    magicAttack = 1059,
    physicalDefence = 1059,
    magicDefence = 1059,
    maxHP2Multiply = 0.4,
    physicalAttackMultiply = 0.4,
    magicAttackMultiply = 0.4,
    physicalDefenceMultiply = 0.4,
    magicDefenceMultiply = 0.4,
    rebirthGrow = 0.4
    };
getRow(4,2)->
    #pet_rebirthCfg {
    petRebirth = 4,
    petQuality = 2,
    maxHP2 = 11556,
    physicalAttack = 1155,
    magicAttack = 1155,
    physicalDefence = 1155,
    magicDefence = 1155,
    maxHP2Multiply = 0.4,
    physicalAttackMultiply = 0.4,
    magicAttackMultiply = 0.4,
    physicalDefenceMultiply = 0.4,
    magicDefenceMultiply = 0.4,
    rebirthGrow = 0.4
    };
getRow(4,3)->
    #pet_rebirthCfg {
    petRebirth = 4,
    petQuality = 3,
    maxHP2 = 15408,
    physicalAttack = 1540,
    magicAttack = 1540,
    physicalDefence = 1540,
    magicDefence = 1540,
    maxHP2Multiply = 0.4,
    physicalAttackMultiply = 0.4,
    magicAttackMultiply = 0.4,
    physicalDefenceMultiply = 0.4,
    magicDefenceMultiply = 0.4,
    rebirthGrow = 0.4
    };
getRow(4,4)->
    #pet_rebirthCfg {
    petRebirth = 4,
    petQuality = 4,
    maxHP2 = 19260,
    physicalAttack = 1926,
    magicAttack = 1926,
    physicalDefence = 1926,
    magicDefence = 1926,
    maxHP2Multiply = 0.4,
    physicalAttackMultiply = 0.4,
    magicAttackMultiply = 0.4,
    physicalDefenceMultiply = 0.4,
    magicDefenceMultiply = 0.4,
    rebirthGrow = 0.4
    };
getRow(5,0)->
    #pet_rebirthCfg {
    petRebirth = 5,
    petQuality = 0,
    maxHP2 = 12037,
    physicalAttack = 1203,
    magicAttack = 1203,
    physicalDefence = 1203,
    magicDefence = 1203,
    maxHP2Multiply = 0.5,
    physicalAttackMultiply = 0.5,
    magicAttackMultiply = 0.5,
    physicalDefenceMultiply = 0.5,
    magicDefenceMultiply = 0.5,
    rebirthGrow = 0.5
    };
getRow(5,1)->
    #pet_rebirthCfg {
    petRebirth = 5,
    petQuality = 1,
    maxHP2 = 13241,
    physicalAttack = 1324,
    magicAttack = 1324,
    physicalDefence = 1324,
    magicDefence = 1324,
    maxHP2Multiply = 0.5,
    physicalAttackMultiply = 0.5,
    magicAttackMultiply = 0.5,
    physicalDefenceMultiply = 0.5,
    magicDefenceMultiply = 0.5,
    rebirthGrow = 0.5
    };
getRow(5,2)->
    #pet_rebirthCfg {
    petRebirth = 5,
    petQuality = 2,
    maxHP2 = 14445,
    physicalAttack = 1444,
    magicAttack = 1444,
    physicalDefence = 1444,
    magicDefence = 1444,
    maxHP2Multiply = 0.5,
    physicalAttackMultiply = 0.5,
    magicAttackMultiply = 0.5,
    physicalDefenceMultiply = 0.5,
    magicDefenceMultiply = 0.5,
    rebirthGrow = 0.5
    };
getRow(5,3)->
    #pet_rebirthCfg {
    petRebirth = 5,
    petQuality = 3,
    maxHP2 = 19260,
    physicalAttack = 1926,
    magicAttack = 1926,
    physicalDefence = 1926,
    magicDefence = 1926,
    maxHP2Multiply = 0.5,
    physicalAttackMultiply = 0.5,
    magicAttackMultiply = 0.5,
    physicalDefenceMultiply = 0.5,
    magicDefenceMultiply = 0.5,
    rebirthGrow = 0.5
    };
getRow(5,4)->
    #pet_rebirthCfg {
    petRebirth = 5,
    petQuality = 4,
    maxHP2 = 24075,
    physicalAttack = 2407,
    magicAttack = 2407,
    physicalDefence = 2407,
    magicDefence = 2407,
    maxHP2Multiply = 0.5,
    physicalAttackMultiply = 0.5,
    magicAttackMultiply = 0.5,
    physicalDefenceMultiply = 0.5,
    magicDefenceMultiply = 0.5,
    rebirthGrow = 0.5
    };
getRow(_,_)->[].

getKeyList()->[
    {1,0},
    {1,1},
    {1,2},
    {1,3},
    {1,4},
    {2,0},
    {2,1},
    {2,2},
    {2,3},
    {2,4},
    {3,0},
    {3,1},
    {3,2},
    {3,3},
    {3,4},
    {4,0},
    {4,1},
    {4,2},
    {4,3},
    {4,4},
    {5,0},
    {5,1},
    {5,2},
    {5,3},
    {5,4}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5
    ].

get2KeyList(1)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(2)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(3)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(4)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(5)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(_)->[].

