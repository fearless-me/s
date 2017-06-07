%% coding: latin-1
%%: 实现
-module(cfg_skillLevelParam_chs).
-compile(export_all).
-include("cfg_skillLevelParam.hrl").
-include("logger.hrl").

getRow(1)->
    #skillLevelParamCfg {
    level = 1,
    critParam1 = 50,
    critParam2 = 550,
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
    critParam1 = 56.5,
    critParam2 = 621.5,
    dodgeParam1 = 0,
    dodgeParam2 = 508.5,
    breakParam1 = 0,
    breakParam2 = 67.8,
    critdamage1 = 0,
    critdamage2 = 112
    };
getRow(3)->
    #skillLevelParamCfg {
    level = 3,
    critParam1 = 63.5,
    critParam2 = 698.5,
    dodgeParam1 = 0,
    dodgeParam2 = 562.5,
    breakParam1 = 0,
    breakParam2 = 75,
    critdamage1 = 0,
    critdamage2 = 124
    };
getRow(4)->
    #skillLevelParamCfg {
    level = 4,
    critParam1 = 70,
    critParam2 = 770,
    dodgeParam1 = 0,
    dodgeParam2 = 621,
    breakParam1 = 0,
    breakParam2 = 82.8,
    critdamage1 = 0,
    critdamage2 = 136
    };
getRow(5)->
    #skillLevelParamCfg {
    level = 5,
    critParam1 = 76.5,
    critParam2 = 841.5,
    dodgeParam1 = 0,
    dodgeParam2 = 675,
    breakParam1 = 0,
    breakParam2 = 90,
    critdamage1 = 0,
    critdamage2 = 148
    };
getRow(6)->
    #skillLevelParamCfg {
    level = 6,
    critParam1 = 83.5,
    critParam2 = 918.5,
    dodgeParam1 = 0,
    dodgeParam2 = 733.5,
    breakParam1 = 0,
    breakParam2 = 97.8,
    critdamage1 = 0,
    critdamage2 = 160
    };
getRow(7)->
    #skillLevelParamCfg {
    level = 7,
    critParam1 = 90,
    critParam2 = 990,
    dodgeParam1 = 0,
    dodgeParam2 = 787.5,
    breakParam1 = 0,
    breakParam2 = 105,
    critdamage1 = 0,
    critdamage2 = 172
    };
getRow(8)->
    #skillLevelParamCfg {
    level = 8,
    critParam1 = 96.5,
    critParam2 = 1061.5,
    dodgeParam1 = 0,
    dodgeParam2 = 846,
    breakParam1 = 0,
    breakParam2 = 112.8,
    critdamage1 = 0,
    critdamage2 = 184
    };
getRow(9)->
    #skillLevelParamCfg {
    level = 9,
    critParam1 = 103.5,
    critParam2 = 1138.5,
    dodgeParam1 = 0,
    dodgeParam2 = 900,
    breakParam1 = 0,
    breakParam2 = 120,
    critdamage1 = 0,
    critdamage2 = 196
    };
getRow(10)->
    #skillLevelParamCfg {
    level = 10,
    critParam1 = 110,
    critParam2 = 1210,
    dodgeParam1 = 0,
    dodgeParam2 = 958.5,
    breakParam1 = 0,
    breakParam2 = 127.8,
    critdamage1 = 0,
    critdamage2 = 208
    };
getRow(11)->
    #skillLevelParamCfg {
    level = 11,
    critParam1 = 116.5,
    critParam2 = 1281.5,
    dodgeParam1 = 0,
    dodgeParam2 = 1012.5,
    breakParam1 = 0,
    breakParam2 = 135,
    critdamage1 = 0,
    critdamage2 = 220
    };
getRow(12)->
    #skillLevelParamCfg {
    level = 12,
    critParam1 = 123.5,
    critParam2 = 1358.5,
    dodgeParam1 = 0,
    dodgeParam2 = 1071,
    breakParam1 = 0,
    breakParam2 = 142.8,
    critdamage1 = 0,
    critdamage2 = 232
    };
getRow(13)->
    #skillLevelParamCfg {
    level = 13,
    critParam1 = 130,
    critParam2 = 1430,
    dodgeParam1 = 0,
    dodgeParam2 = 1125,
    breakParam1 = 0,
    breakParam2 = 150,
    critdamage1 = 0,
    critdamage2 = 244
    };
getRow(14)->
    #skillLevelParamCfg {
    level = 14,
    critParam1 = 136.5,
    critParam2 = 1501.5,
    dodgeParam1 = 0,
    dodgeParam2 = 1183.5,
    breakParam1 = 0,
    breakParam2 = 157.8,
    critdamage1 = 0,
    critdamage2 = 256
    };
getRow(15)->
    #skillLevelParamCfg {
    level = 15,
    critParam1 = 143.5,
    critParam2 = 1578.5,
    dodgeParam1 = 0,
    dodgeParam2 = 1237.5,
    breakParam1 = 0,
    breakParam2 = 165,
    critdamage1 = 0,
    critdamage2 = 268
    };
getRow(16)->
    #skillLevelParamCfg {
    level = 16,
    critParam1 = 150,
    critParam2 = 1650,
    dodgeParam1 = 0,
    dodgeParam2 = 1296,
    breakParam1 = 0,
    breakParam2 = 172.8,
    critdamage1 = 0,
    critdamage2 = 280
    };
getRow(17)->
    #skillLevelParamCfg {
    level = 17,
    critParam1 = 156.5,
    critParam2 = 1721.5,
    dodgeParam1 = 0,
    dodgeParam2 = 1350,
    breakParam1 = 0,
    breakParam2 = 180,
    critdamage1 = 0,
    critdamage2 = 292
    };
getRow(18)->
    #skillLevelParamCfg {
    level = 18,
    critParam1 = 163.5,
    critParam2 = 1798.5,
    dodgeParam1 = 0,
    dodgeParam2 = 1408.5,
    breakParam1 = 0,
    breakParam2 = 187.8,
    critdamage1 = 0,
    critdamage2 = 304
    };
getRow(19)->
    #skillLevelParamCfg {
    level = 19,
    critParam1 = 170,
    critParam2 = 1870,
    dodgeParam1 = 0,
    dodgeParam2 = 1462.5,
    breakParam1 = 0,
    breakParam2 = 195,
    critdamage1 = 0,
    critdamage2 = 316
    };
getRow(20)->
    #skillLevelParamCfg {
    level = 20,
    critParam1 = 176.5,
    critParam2 = 1941.5,
    dodgeParam1 = 0,
    dodgeParam2 = 1521,
    breakParam1 = 0,
    breakParam2 = 202.8,
    critdamage1 = 0,
    critdamage2 = 328
    };
getRow(21)->
    #skillLevelParamCfg {
    level = 21,
    critParam1 = 183.5,
    critParam2 = 2018.5,
    dodgeParam1 = 0,
    dodgeParam2 = 1575,
    breakParam1 = 0,
    breakParam2 = 210,
    critdamage1 = 0,
    critdamage2 = 340
    };
getRow(22)->
    #skillLevelParamCfg {
    level = 22,
    critParam1 = 190,
    critParam2 = 2090,
    dodgeParam1 = 0,
    dodgeParam2 = 1633.5,
    breakParam1 = 0,
    breakParam2 = 217.8,
    critdamage1 = 0,
    critdamage2 = 352
    };
getRow(23)->
    #skillLevelParamCfg {
    level = 23,
    critParam1 = 196.5,
    critParam2 = 2161.5,
    dodgeParam1 = 0,
    dodgeParam2 = 1687.5,
    breakParam1 = 0,
    breakParam2 = 225,
    critdamage1 = 0,
    critdamage2 = 364
    };
getRow(24)->
    #skillLevelParamCfg {
    level = 24,
    critParam1 = 203.5,
    critParam2 = 2238.5,
    dodgeParam1 = 0,
    dodgeParam2 = 1746,
    breakParam1 = 0,
    breakParam2 = 232.8,
    critdamage1 = 0,
    critdamage2 = 376
    };
getRow(25)->
    #skillLevelParamCfg {
    level = 25,
    critParam1 = 210,
    critParam2 = 2310,
    dodgeParam1 = 0,
    dodgeParam2 = 1800,
    breakParam1 = 0,
    breakParam2 = 240,
    critdamage1 = 0,
    critdamage2 = 388
    };
getRow(26)->
    #skillLevelParamCfg {
    level = 26,
    critParam1 = 216.5,
    critParam2 = 2381.5,
    dodgeParam1 = 0,
    dodgeParam2 = 1858.5,
    breakParam1 = 0,
    breakParam2 = 247.8,
    critdamage1 = 0,
    critdamage2 = 400
    };
getRow(27)->
    #skillLevelParamCfg {
    level = 27,
    critParam1 = 223.5,
    critParam2 = 2458.5,
    dodgeParam1 = 0,
    dodgeParam2 = 1912.5,
    breakParam1 = 0,
    breakParam2 = 255,
    critdamage1 = 0,
    critdamage2 = 412
    };
getRow(28)->
    #skillLevelParamCfg {
    level = 28,
    critParam1 = 230,
    critParam2 = 2530,
    dodgeParam1 = 0,
    dodgeParam2 = 1971,
    breakParam1 = 0,
    breakParam2 = 262.8,
    critdamage1 = 0,
    critdamage2 = 424
    };
getRow(29)->
    #skillLevelParamCfg {
    level = 29,
    critParam1 = 236.5,
    critParam2 = 2601.5,
    dodgeParam1 = 0,
    dodgeParam2 = 2025,
    breakParam1 = 0,
    breakParam2 = 270,
    critdamage1 = 0,
    critdamage2 = 436
    };
getRow(30)->
    #skillLevelParamCfg {
    level = 30,
    critParam1 = 243.5,
    critParam2 = 2678.5,
    dodgeParam1 = 0,
    dodgeParam2 = 2083.5,
    breakParam1 = 0,
    breakParam2 = 277.8,
    critdamage1 = 0,
    critdamage2 = 448
    };
getRow(31)->
    #skillLevelParamCfg {
    level = 31,
    critParam1 = 250,
    critParam2 = 2750,
    dodgeParam1 = 0,
    dodgeParam2 = 2137.5,
    breakParam1 = 0,
    breakParam2 = 285,
    critdamage1 = 0,
    critdamage2 = 460
    };
getRow(32)->
    #skillLevelParamCfg {
    level = 32,
    critParam1 = 256.5,
    critParam2 = 2821.5,
    dodgeParam1 = 0,
    dodgeParam2 = 2196,
    breakParam1 = 0,
    breakParam2 = 292.8,
    critdamage1 = 0,
    critdamage2 = 472
    };
getRow(33)->
    #skillLevelParamCfg {
    level = 33,
    critParam1 = 263.5,
    critParam2 = 2898.5,
    dodgeParam1 = 0,
    dodgeParam2 = 2250,
    breakParam1 = 0,
    breakParam2 = 300,
    critdamage1 = 0,
    critdamage2 = 484
    };
getRow(34)->
    #skillLevelParamCfg {
    level = 34,
    critParam1 = 270,
    critParam2 = 2970,
    dodgeParam1 = 0,
    dodgeParam2 = 2308.5,
    breakParam1 = 0,
    breakParam2 = 307.8,
    critdamage1 = 0,
    critdamage2 = 496
    };
getRow(35)->
    #skillLevelParamCfg {
    level = 35,
    critParam1 = 276.5,
    critParam2 = 3041.5,
    dodgeParam1 = 0,
    dodgeParam2 = 2362.5,
    breakParam1 = 0,
    breakParam2 = 315,
    critdamage1 = 0,
    critdamage2 = 508
    };
getRow(36)->
    #skillLevelParamCfg {
    level = 36,
    critParam1 = 283.5,
    critParam2 = 3118.5,
    dodgeParam1 = 0,
    dodgeParam2 = 2421,
    breakParam1 = 0,
    breakParam2 = 322.8,
    critdamage1 = 0,
    critdamage2 = 520
    };
getRow(37)->
    #skillLevelParamCfg {
    level = 37,
    critParam1 = 290,
    critParam2 = 3190,
    dodgeParam1 = 0,
    dodgeParam2 = 2475,
    breakParam1 = 0,
    breakParam2 = 330,
    critdamage1 = 0,
    critdamage2 = 532
    };
getRow(38)->
    #skillLevelParamCfg {
    level = 38,
    critParam1 = 296.5,
    critParam2 = 3261.5,
    dodgeParam1 = 0,
    dodgeParam2 = 2533.5,
    breakParam1 = 0,
    breakParam2 = 337.8,
    critdamage1 = 0,
    critdamage2 = 544
    };
getRow(39)->
    #skillLevelParamCfg {
    level = 39,
    critParam1 = 303.5,
    critParam2 = 3338.5,
    dodgeParam1 = 0,
    dodgeParam2 = 2587.5,
    breakParam1 = 0,
    breakParam2 = 345,
    critdamage1 = 0,
    critdamage2 = 556
    };
getRow(40)->
    #skillLevelParamCfg {
    level = 40,
    critParam1 = 310,
    critParam2 = 3410,
    dodgeParam1 = 0,
    dodgeParam2 = 2646,
    breakParam1 = 0,
    breakParam2 = 352.8,
    critdamage1 = 0,
    critdamage2 = 568
    };
getRow(41)->
    #skillLevelParamCfg {
    level = 41,
    critParam1 = 316.5,
    critParam2 = 3481.5,
    dodgeParam1 = 0,
    dodgeParam2 = 2700,
    breakParam1 = 0,
    breakParam2 = 360,
    critdamage1 = 0,
    critdamage2 = 580
    };
getRow(42)->
    #skillLevelParamCfg {
    level = 42,
    critParam1 = 323.5,
    critParam2 = 3558.5,
    dodgeParam1 = 0,
    dodgeParam2 = 2758.5,
    breakParam1 = 0,
    breakParam2 = 367.8,
    critdamage1 = 0,
    critdamage2 = 592
    };
getRow(43)->
    #skillLevelParamCfg {
    level = 43,
    critParam1 = 330,
    critParam2 = 3630,
    dodgeParam1 = 0,
    dodgeParam2 = 2812.5,
    breakParam1 = 0,
    breakParam2 = 375,
    critdamage1 = 0,
    critdamage2 = 604
    };
getRow(44)->
    #skillLevelParamCfg {
    level = 44,
    critParam1 = 336.5,
    critParam2 = 3701.5,
    dodgeParam1 = 0,
    dodgeParam2 = 2871,
    breakParam1 = 0,
    breakParam2 = 382.8,
    critdamage1 = 0,
    critdamage2 = 616
    };
getRow(45)->
    #skillLevelParamCfg {
    level = 45,
    critParam1 = 343.5,
    critParam2 = 3778.5,
    dodgeParam1 = 0,
    dodgeParam2 = 2925,
    breakParam1 = 0,
    breakParam2 = 390,
    critdamage1 = 0,
    critdamage2 = 628
    };
getRow(46)->
    #skillLevelParamCfg {
    level = 46,
    critParam1 = 350,
    critParam2 = 3850,
    dodgeParam1 = 0,
    dodgeParam2 = 2983.5,
    breakParam1 = 0,
    breakParam2 = 397.8,
    critdamage1 = 0,
    critdamage2 = 640
    };
getRow(47)->
    #skillLevelParamCfg {
    level = 47,
    critParam1 = 356.5,
    critParam2 = 3921.5,
    dodgeParam1 = 0,
    dodgeParam2 = 3037.5,
    breakParam1 = 0,
    breakParam2 = 405,
    critdamage1 = 0,
    critdamage2 = 652
    };
getRow(48)->
    #skillLevelParamCfg {
    level = 48,
    critParam1 = 363.5,
    critParam2 = 3998.5,
    dodgeParam1 = 0,
    dodgeParam2 = 3096,
    breakParam1 = 0,
    breakParam2 = 412.8,
    critdamage1 = 0,
    critdamage2 = 664
    };
getRow(49)->
    #skillLevelParamCfg {
    level = 49,
    critParam1 = 370,
    critParam2 = 4070,
    dodgeParam1 = 0,
    dodgeParam2 = 3150,
    breakParam1 = 0,
    breakParam2 = 420,
    critdamage1 = 0,
    critdamage2 = 676
    };
getRow(50)->
    #skillLevelParamCfg {
    level = 50,
    critParam1 = 376.5,
    critParam2 = 4141.5,
    dodgeParam1 = 0,
    dodgeParam2 = 3208.5,
    breakParam1 = 0,
    breakParam2 = 427.8,
    critdamage1 = 0,
    critdamage2 = 688
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

