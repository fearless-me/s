%% coding: latin-1
%%: 实现
-module(cfg_skillLevelParam_chs).
-compile(export_all).
-include("cfg_skillLevelParam.hrl").
-include("logger.hrl").

getRow(1)->
    #skillLevelParamCfg {
    level = 1,
    critParam1 = 55,
    critParam2 = 385,
    dodgeParam1 = 0,
    dodgeParam2 = 450,
    breakParam1 = 0,
    breakParam2 = 60,
    critdamage1 = 0,
    critdamage2 = 100
    };
getRow(2)->
    #skillLevelParamCfg {
    level = 2,
    critParam1 = 60,
    critParam2 = 436,
    dodgeParam1 = 0,
    dodgeParam2 = 510,
    breakParam1 = 0,
    breakParam2 = 68,
    critdamage1 = 0,
    critdamage2 = 113
    };
getRow(3)->
    #skillLevelParamCfg {
    level = 3,
    critParam1 = 64,
    critParam2 = 488,
    dodgeParam1 = 0,
    dodgeParam2 = 570,
    breakParam1 = 0,
    breakParam2 = 76,
    critdamage1 = 0,
    critdamage2 = 127
    };
getRow(4)->
    #skillLevelParamCfg {
    level = 4,
    critParam1 = 69,
    critParam2 = 539,
    dodgeParam1 = 0,
    dodgeParam2 = 630,
    breakParam1 = 0,
    breakParam2 = 84,
    critdamage1 = 0,
    critdamage2 = 140
    };
getRow(5)->
    #skillLevelParamCfg {
    level = 5,
    critParam1 = 74,
    critParam2 = 590,
    dodgeParam1 = 0,
    dodgeParam2 = 690,
    breakParam1 = 0,
    breakParam2 = 92,
    critdamage1 = 0,
    critdamage2 = 153
    };
getRow(6)->
    #skillLevelParamCfg {
    level = 6,
    critParam1 = 78,
    critParam2 = 642,
    dodgeParam1 = 0,
    dodgeParam2 = 750,
    breakParam1 = 0,
    breakParam2 = 100,
    critdamage1 = 0,
    critdamage2 = 167
    };
getRow(7)->
    #skillLevelParamCfg {
    level = 7,
    critParam1 = 83,
    critParam2 = 693,
    dodgeParam1 = 0,
    dodgeParam2 = 810,
    breakParam1 = 0,
    breakParam2 = 108,
    critdamage1 = 0,
    critdamage2 = 180
    };
getRow(8)->
    #skillLevelParamCfg {
    level = 8,
    critParam1 = 88,
    critParam2 = 744,
    dodgeParam1 = 0,
    dodgeParam2 = 870,
    breakParam1 = 0,
    breakParam2 = 116,
    critdamage1 = 0,
    critdamage2 = 193
    };
getRow(9)->
    #skillLevelParamCfg {
    level = 9,
    critParam1 = 92,
    critParam2 = 796,
    dodgeParam1 = 0,
    dodgeParam2 = 930,
    breakParam1 = 0,
    breakParam2 = 124,
    critdamage1 = 0,
    critdamage2 = 207
    };
getRow(10)->
    #skillLevelParamCfg {
    level = 10,
    critParam1 = 97,
    critParam2 = 847,
    dodgeParam1 = 0,
    dodgeParam2 = 990,
    breakParam1 = 0,
    breakParam2 = 132,
    critdamage1 = 0,
    critdamage2 = 220
    };
getRow(11)->
    #skillLevelParamCfg {
    level = 11,
    critParam1 = 102,
    critParam2 = 898,
    dodgeParam1 = 0,
    dodgeParam2 = 1050,
    breakParam1 = 0,
    breakParam2 = 140,
    critdamage1 = 0,
    critdamage2 = 233
    };
getRow(12)->
    #skillLevelParamCfg {
    level = 12,
    critParam1 = 106,
    critParam2 = 950,
    dodgeParam1 = 0,
    dodgeParam2 = 1110,
    breakParam1 = 0,
    breakParam2 = 148,
    critdamage1 = 0,
    critdamage2 = 247
    };
getRow(13)->
    #skillLevelParamCfg {
    level = 13,
    critParam1 = 111,
    critParam2 = 1001,
    dodgeParam1 = 0,
    dodgeParam2 = 1170,
    breakParam1 = 0,
    breakParam2 = 156,
    critdamage1 = 0,
    critdamage2 = 260
    };
getRow(14)->
    #skillLevelParamCfg {
    level = 14,
    critParam1 = 116,
    critParam2 = 1052,
    dodgeParam1 = 0,
    dodgeParam2 = 1230,
    breakParam1 = 0,
    breakParam2 = 164,
    critdamage1 = 0,
    critdamage2 = 273
    };
getRow(15)->
    #skillLevelParamCfg {
    level = 15,
    critParam1 = 120,
    critParam2 = 1104,
    dodgeParam1 = 0,
    dodgeParam2 = 1290,
    breakParam1 = 0,
    breakParam2 = 172,
    critdamage1 = 0,
    critdamage2 = 287
    };
getRow(16)->
    #skillLevelParamCfg {
    level = 16,
    critParam1 = 125,
    critParam2 = 1155,
    dodgeParam1 = 0,
    dodgeParam2 = 1350,
    breakParam1 = 0,
    breakParam2 = 180,
    critdamage1 = 0,
    critdamage2 = 300
    };
getRow(17)->
    #skillLevelParamCfg {
    level = 17,
    critParam1 = 130,
    critParam2 = 1206,
    dodgeParam1 = 0,
    dodgeParam2 = 1410,
    breakParam1 = 0,
    breakParam2 = 188,
    critdamage1 = 0,
    critdamage2 = 313
    };
getRow(18)->
    #skillLevelParamCfg {
    level = 18,
    critParam1 = 152,
    critParam2 = 1456,
    dodgeParam1 = 0,
    dodgeParam2 = 1702,
    breakParam1 = 0,
    breakParam2 = 227,
    critdamage1 = 0,
    critdamage2 = 378
    };
getRow(19)->
    #skillLevelParamCfg {
    level = 19,
    critParam1 = 184,
    critParam2 = 1807,
    dodgeParam1 = 0,
    dodgeParam2 = 2112,
    breakParam1 = 0,
    breakParam2 = 282,
    critdamage1 = 0,
    critdamage2 = 469
    };
getRow(20)->
    #skillLevelParamCfg {
    level = 20,
    critParam1 = 222,
    critParam2 = 2221,
    dodgeParam1 = 0,
    dodgeParam2 = 2596,
    breakParam1 = 0,
    breakParam2 = 346,
    critdamage1 = 0,
    critdamage2 = 577
    };
getRow(21)->
    #skillLevelParamCfg {
    level = 21,
    critParam1 = 312,
    critParam2 = 3209,
    dodgeParam1 = 0,
    dodgeParam2 = 3751,
    breakParam1 = 0,
    breakParam2 = 500,
    critdamage1 = 0,
    critdamage2 = 834
    };
getRow(22)->
    #skillLevelParamCfg {
    level = 22,
    critParam1 = 364,
    critParam2 = 3782,
    dodgeParam1 = 0,
    dodgeParam2 = 4421,
    breakParam1 = 0,
    breakParam2 = 589,
    critdamage1 = 0,
    critdamage2 = 982
    };
getRow(23)->
    #skillLevelParamCfg {
    level = 23,
    critParam1 = 436,
    critParam2 = 4578,
    dodgeParam1 = 0,
    dodgeParam2 = 5351,
    breakParam1 = 0,
    breakParam2 = 714,
    critdamage1 = 0,
    critdamage2 = 1189
    };
getRow(24)->
    #skillLevelParamCfg {
    level = 24,
    critParam1 = 506,
    critParam2 = 5345,
    dodgeParam1 = 0,
    dodgeParam2 = 6247,
    breakParam1 = 0,
    breakParam2 = 833,
    critdamage1 = 0,
    critdamage2 = 1388
    };
getRow(25)->
    #skillLevelParamCfg {
    level = 25,
    critParam1 = 582,
    critParam2 = 6178,
    dodgeParam1 = 0,
    dodgeParam2 = 7221,
    breakParam1 = 0,
    breakParam2 = 963,
    critdamage1 = 0,
    critdamage2 = 1605
    };
getRow(26)->
    #skillLevelParamCfg {
    level = 26,
    critParam1 = 662,
    critParam2 = 7062,
    dodgeParam1 = 0,
    dodgeParam2 = 8254,
    breakParam1 = 0,
    breakParam2 = 1100,
    critdamage1 = 0,
    critdamage2 = 1834
    };
getRow(27)->
    #skillLevelParamCfg {
    level = 27,
    critParam1 = 746,
    critParam2 = 7989,
    dodgeParam1 = 0,
    dodgeParam2 = 9337,
    breakParam1 = 0,
    breakParam2 = 1245,
    critdamage1 = 0,
    critdamage2 = 2075
    };
getRow(28)->
    #skillLevelParamCfg {
    level = 28,
    critParam1 = 834,
    critParam2 = 8956,
    dodgeParam1 = 0,
    dodgeParam2 = 10468,
    breakParam1 = 0,
    breakParam2 = 1396,
    critdamage1 = 0,
    critdamage2 = 2326
    };
getRow(29)->
    #skillLevelParamCfg {
    level = 29,
    critParam1 = 925,
    critParam2 = 9960,
    dodgeParam1 = 0,
    dodgeParam2 = 11642,
    breakParam1 = 0,
    breakParam2 = 1552,
    critdamage1 = 0,
    critdamage2 = 2587
    };
getRow(30)->
    #skillLevelParamCfg {
    level = 30,
    critParam1 = 1020,
    critParam2 = 11000,
    dodgeParam1 = 0,
    dodgeParam2 = 12857,
    breakParam1 = 0,
    breakParam2 = 1714,
    critdamage1 = 0,
    critdamage2 = 2857
    };
getRow(31)->
    #skillLevelParamCfg {
    level = 31,
    critParam1 = 1117,
    critParam2 = 12072,
    dodgeParam1 = 0,
    dodgeParam2 = 14111,
    breakParam1 = 0,
    breakParam2 = 1881,
    critdamage1 = 0,
    critdamage2 = 3136
    };
getRow(32)->
    #skillLevelParamCfg {
    level = 32,
    critParam1 = 1218,
    critParam2 = 13177,
    dodgeParam1 = 0,
    dodgeParam2 = 15401,
    breakParam1 = 0,
    breakParam2 = 2053,
    critdamage1 = 0,
    critdamage2 = 3422
    };
getRow(33)->
    #skillLevelParamCfg {
    level = 33,
    critParam1 = 1321,
    critParam2 = 14311,
    dodgeParam1 = 0,
    dodgeParam2 = 16727,
    breakParam1 = 0,
    breakParam2 = 2230,
    critdamage1 = 0,
    critdamage2 = 3717
    };
getRow(34)->
    #skillLevelParamCfg {
    level = 34,
    critParam1 = 1427,
    critParam2 = 15475,
    dodgeParam1 = 0,
    dodgeParam2 = 18088,
    breakParam1 = 0,
    breakParam2 = 2412,
    critdamage1 = 0,
    critdamage2 = 4019
    };
getRow(35)->
    #skillLevelParamCfg {
    level = 35,
    critParam1 = 1535,
    critParam2 = 16667,
    dodgeParam1 = 0,
    dodgeParam2 = 19481,
    breakParam1 = 0,
    breakParam2 = 2597,
    critdamage1 = 0,
    critdamage2 = 4329
    };
getRow(36)->
    #skillLevelParamCfg {
    level = 36,
    critParam1 = 1646,
    critParam2 = 17886,
    dodgeParam1 = 0,
    dodgeParam2 = 20906,
    breakParam1 = 0,
    breakParam2 = 2787,
    critdamage1 = 0,
    critdamage2 = 4646
    };
getRow(37)->
    #skillLevelParamCfg {
    level = 37,
    critParam1 = 1759,
    critParam2 = 19132,
    dodgeParam1 = 0,
    dodgeParam2 = 22362,
    breakParam1 = 0,
    breakParam2 = 2982,
    critdamage1 = 0,
    critdamage2 = 4969
    };
getRow(38)->
    #skillLevelParamCfg {
    level = 38,
    critParam1 = 1875,
    critParam2 = 20404,
    dodgeParam1 = 0,
    dodgeParam2 = 23848,
    breakParam1 = 0,
    breakParam2 = 3180,
    critdamage1 = 0,
    critdamage2 = 5300
    };
getRow(39)->
    #skillLevelParamCfg {
    level = 39,
    critParam1 = 1993,
    critParam2 = 21700,
    dodgeParam1 = 0,
    dodgeParam2 = 25364,
    breakParam1 = 0,
    breakParam2 = 3382,
    critdamage1 = 0,
    critdamage2 = 5636
    };
getRow(40)->
    #skillLevelParamCfg {
    level = 40,
    critParam1 = 2113,
    critParam2 = 23021,
    dodgeParam1 = 0,
    dodgeParam2 = 26907,
    breakParam1 = 0,
    breakParam2 = 3588,
    critdamage1 = 0,
    critdamage2 = 5979
    };
getRow(41)->
    #skillLevelParamCfg {
    level = 41,
    critParam1 = 2235,
    critParam2 = 24365,
    dodgeParam1 = 0,
    dodgeParam2 = 28479,
    breakParam1 = 0,
    breakParam2 = 3797,
    critdamage1 = 0,
    critdamage2 = 6329
    };
getRow(42)->
    #skillLevelParamCfg {
    level = 42,
    critParam1 = 2359,
    critParam2 = 25733,
    dodgeParam1 = 0,
    dodgeParam2 = 30078,
    breakParam1 = 0,
    breakParam2 = 4010,
    critdamage1 = 0,
    critdamage2 = 6684
    };
getRow(43)->
    #skillLevelParamCfg {
    level = 43,
    critParam1 = 2486,
    critParam2 = 27124,
    dodgeParam1 = 0,
    dodgeParam2 = 31703,
    breakParam1 = 0,
    breakParam2 = 4227,
    critdamage1 = 0,
    critdamage2 = 7045
    };
getRow(44)->
    #skillLevelParamCfg {
    level = 44,
    critParam1 = 2614,
    critParam2 = 28537,
    dodgeParam1 = 0,
    dodgeParam2 = 33354,
    breakParam1 = 0,
    breakParam2 = 4447,
    critdamage1 = 0,
    critdamage2 = 7412
    };
getRow(45)->
    #skillLevelParamCfg {
    level = 45,
    critParam1 = 2745,
    critParam2 = 29971,
    dodgeParam1 = 0,
    dodgeParam2 = 35031,
    breakParam1 = 0,
    breakParam2 = 4671,
    critdamage1 = 0,
    critdamage2 = 7785
    };
getRow(46)->
    #skillLevelParamCfg {
    level = 46,
    critParam1 = 2877,
    critParam2 = 31427,
    dodgeParam1 = 0,
    dodgeParam2 = 36733,
    breakParam1 = 0,
    breakParam2 = 4898,
    critdamage1 = 0,
    critdamage2 = 8163
    };
getRow(47)->
    #skillLevelParamCfg {
    level = 47,
    critParam1 = 3011,
    critParam2 = 32904,
    dodgeParam1 = 0,
    dodgeParam2 = 38459,
    breakParam1 = 0,
    breakParam2 = 5128,
    critdamage1 = 0,
    critdamage2 = 8547
    };
getRow(48)->
    #skillLevelParamCfg {
    level = 48,
    critParam1 = 3147,
    critParam2 = 34402,
    dodgeParam1 = 0,
    dodgeParam2 = 40210,
    breakParam1 = 0,
    breakParam2 = 5361,
    critdamage1 = 0,
    critdamage2 = 8935
    };
getRow(49)->
    #skillLevelParamCfg {
    level = 49,
    critParam1 = 3285,
    critParam2 = 35919,
    dodgeParam1 = 0,
    dodgeParam2 = 41984,
    breakParam1 = 0,
    breakParam2 = 5598,
    critdamage1 = 0,
    critdamage2 = 9330
    };
getRow(50)->
    #skillLevelParamCfg {
    level = 50,
    critParam1 = 3425,
    critParam2 = 37457,
    dodgeParam1 = 0,
    dodgeParam2 = 43781,
    breakParam1 = 0,
    breakParam2 = 5837,
    critdamage1 = 0,
    critdamage2 = 9729
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7},
    {8},
    {9},
    {10},
    {11},
    {12},
    {13},
    {14},
    {15},
    {16},
    {17},
    {18},
    {19},
    {20},
    {21},
    {22},
    {23},
    {24},
    {25},
    {26},
    {27},
    {28},
    {29},
    {30},
    {31},
    {32},
    {33},
    {34},
    {35},
    {36},
    {37},
    {38},
    {39},
    {40},
    {41},
    {42},
    {43},
    {44},
    {45},
    {46},
    {47},
    {48},
    {49},
    {50}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50
    ].

