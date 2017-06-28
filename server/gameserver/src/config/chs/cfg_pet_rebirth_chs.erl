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
    maxHP2 = 736,
    physicalAttack = 73,
    magicAttack = 73,
    physicalDefence = 73,
    magicDefence = 73,
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
    maxHP2 = 921,
    physicalAttack = 92,
    magicAttack = 92,
    physicalDefence = 92,
    magicDefence = 92,
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
    maxHP2 = 1152,
    physicalAttack = 115,
    magicAttack = 115,
    physicalDefence = 115,
    magicDefence = 115,
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
    maxHP2 = 1440,
    physicalAttack = 144,
    magicAttack = 144,
    physicalDefence = 144,
    magicDefence = 144,
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
    maxHP2 = 1800,
    physicalAttack = 180,
    magicAttack = 180,
    physicalDefence = 180,
    magicDefence = 180,
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
    maxHP2 = 1474,
    physicalAttack = 147,
    magicAttack = 147,
    physicalDefence = 147,
    magicDefence = 147,
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
    maxHP2 = 1843,
    physicalAttack = 184,
    magicAttack = 184,
    physicalDefence = 184,
    magicDefence = 184,
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
    maxHP2 = 2304,
    physicalAttack = 230,
    magicAttack = 230,
    physicalDefence = 230,
    magicDefence = 230,
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
    maxHP2 = 2880,
    physicalAttack = 288,
    magicAttack = 288,
    physicalDefence = 288,
    magicDefence = 288,
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
    maxHP2 = 3600,
    physicalAttack = 360,
    magicAttack = 360,
    physicalDefence = 360,
    magicDefence = 360,
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
    maxHP2 = 2211,
    physicalAttack = 220,
    magicAttack = 220,
    physicalDefence = 220,
    magicDefence = 220,
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
    maxHP2 = 2764,
    physicalAttack = 276,
    magicAttack = 276,
    physicalDefence = 276,
    magicDefence = 276,
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
    maxHP2 = 3456,
    physicalAttack = 345,
    magicAttack = 345,
    physicalDefence = 345,
    magicDefence = 345,
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
    maxHP2 = 4320,
    physicalAttack = 432,
    magicAttack = 432,
    physicalDefence = 432,
    magicDefence = 432,
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
    maxHP2 = 5400,
    physicalAttack = 540,
    magicAttack = 540,
    physicalDefence = 540,
    magicDefence = 540,
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
    maxHP2 = 2948,
    physicalAttack = 294,
    magicAttack = 294,
    physicalDefence = 294,
    magicDefence = 294,
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
    maxHP2 = 3686,
    physicalAttack = 368,
    magicAttack = 368,
    physicalDefence = 368,
    magicDefence = 368,
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
    maxHP2 = 4608,
    physicalAttack = 460,
    magicAttack = 460,
    physicalDefence = 460,
    magicDefence = 460,
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
    maxHP2 = 5760,
    physicalAttack = 576,
    magicAttack = 576,
    physicalDefence = 576,
    magicDefence = 576,
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
    maxHP2 = 7200,
    physicalAttack = 720,
    magicAttack = 720,
    physicalDefence = 720,
    magicDefence = 720,
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
    maxHP2 = 5160,
    physicalAttack = 515,
    magicAttack = 515,
    physicalDefence = 515,
    magicDefence = 515,
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
    maxHP2 = 6451,
    physicalAttack = 644,
    magicAttack = 644,
    physicalDefence = 644,
    magicDefence = 644,
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
    maxHP2 = 8064,
    physicalAttack = 806,
    magicAttack = 806,
    physicalDefence = 806,
    magicDefence = 806,
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
    maxHP2 = 10080,
    physicalAttack = 1008,
    magicAttack = 1008,
    physicalDefence = 1008,
    magicDefence = 1008,
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
    maxHP2 = 12600,
    physicalAttack = 1260,
    magicAttack = 1260,
    physicalDefence = 1260,
    magicDefence = 1260,
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

