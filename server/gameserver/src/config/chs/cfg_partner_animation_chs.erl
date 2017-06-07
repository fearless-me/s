%% coding: latin-1
%%: 实现
-module(cfg_partner_animation_chs).
-compile(export_all).
-include("cfg_partner_animation.hrl").
-include("logger.hrl").

getRow(1)->
    #partner_animationCfg {
    id = 1,
    profession = 1,
    anima = "baseattack1",
    number = 1,
    all = 42
    };
getRow(2)->
    #partner_animationCfg {
    id = 2,
    profession = 1,
    anima = "idle",
    number = 14,
    all = 40
    };
getRow(3)->
    #partner_animationCfg {
    id = 3,
    profession = 1,
    anima = "baseattack1",
    number = 12,
    all = 42
    };
getRow(4)->
    #partner_animationCfg {
    id = 4,
    profession = 1,
    anima = "baseattack1",
    number = 26,
    all = 42
    };
getRow(5)->
    #partner_animationCfg {
    id = 5,
    profession = 1,
    anima = "baseattack2",
    number = 2,
    all = 25
    };
getRow(6)->
    #partner_animationCfg {
    id = 6,
    profession = 1,
    anima = "baseattack2",
    number = 8,
    all = 25
    };
getRow(7)->
    #partner_animationCfg {
    id = 7,
    profession = 1,
    anima = "baseattack2",
    number = 18,
    all = 25
    };
getRow(8)->
    #partner_animationCfg {
    id = 8,
    profession = 1,
    anima = "buff",
    number = 15,
    all = 30
    };
getRow(9)->
    #partner_animationCfg {
    id = 9,
    profession = 1,
    anima = "cast",
    number = 21,
    all = 30
    };
getRow(10)->
    #partner_animationCfg {
    id = 10,
    profession = 1,
    anima = "change",
    number = 15,
    all = 42
    };
getRow(11)->
    #partner_animationCfg {
    id = 11,
    profession = 1,
    anima = "change",
    number = 30,
    all = 42
    };
getRow(12)->
    #partner_animationCfg {
    id = 12,
    profession = 1,
    anima = "dash_start",
    number = 10,
    all = 16
    };
getRow(13)->
    #partner_animationCfg {
    id = 13,
    profession = 1,
    anima = "dead",
    number = 10,
    all = 70
    };
getRow(14)->
    #partner_animationCfg {
    id = 14,
    profession = 1,
    anima = "dead",
    number = 38,
    all = 70
    };
getRow(15)->
    #partner_animationCfg {
    id = 15,
    profession = 1,
    anima = "dead",
    number = 69,
    all = 70
    };
getRow(16)->
    #partner_animationCfg {
    id = 16,
    profession = 1,
    anima = "mountidle2",
    number = 22,
    all = 40
    };
getRow(17)->
    #partner_animationCfg {
    id = 17,
    profession = 1,
    anima = "skillcast1",
    number = 20,
    all = 45
    };
getRow(18)->
    #partner_animationCfg {
    id = 18,
    profession = 2,
    anima = "skillcast6",
    number = 4,
    all = 10
    };
getRow(19)->
    #partner_animationCfg {
    id = 19,
    profession = 2,
    anima = "baseattack1",
    number = 24,
    all = 35
    };
getRow(20)->
    #partner_animationCfg {
    id = 20,
    profession = 2,
    anima = "baseattack2",
    number = 26,
    all = 35
    };
getRow(21)->
    #partner_animationCfg {
    id = 21,
    profession = 2,
    anima = "change",
    number = 18,
    all = 40
    };
getRow(22)->
    #partner_animationCfg {
    id = 22,
    profession = 2,
    anima = "dead",
    number = 46,
    all = 53
    };
getRow(23)->
    #partner_animationCfg {
    id = 23,
    profession = 2,
    anima = "mountidle2",
    number = 30,
    all = 40
    };
getRow(24)->
    #partner_animationCfg {
    id = 24,
    profession = 2,
    anima = "run",
    number = 10,
    all = 20
    };
getRow(25)->
    #partner_animationCfg {
    id = 25,
    profession = 2,
    anima = "Shapechange_after",
    number = 19,
    all = 47
    };
getRow(26)->
    #partner_animationCfg {
    id = 26,
    profession = 2,
    anima = "Shapechange_after",
    number = 27,
    all = 47
    };
getRow(27)->
    #partner_animationCfg {
    id = 27,
    profession = 2,
    anima = "Shapechange_before",
    number = 54,
    all = 55
    };
getRow(28)->
    #partner_animationCfg {
    id = 28,
    profession = 2,
    anima = "skillcast1",
    number = 21,
    all = 40
    };
getRow(29)->
    #partner_animationCfg {
    id = 29,
    profession = 2,
    anima = "skillcast1",
    number = 35,
    all = 40
    };
getRow(30)->
    #partner_animationCfg {
    id = 30,
    profession = 2,
    anima = "skillcast2",
    number = 14,
    all = 45
    };
getRow(31)->
    #partner_animationCfg {
    id = 31,
    profession = 2,
    anima = "skillcast4",
    number = 15,
    all = 38
    };
getRow(32)->
    #partner_animationCfg {
    id = 32,
    profession = 2,
    anima = "skillcast4",
    number = 21,
    all = 38
    };
getRow(33)->
    #partner_animationCfg {
    id = 33,
    profession = 2,
    anima = "idle",
    number = 25,
    all = 40
    };
getRow(34)->
    #partner_animationCfg {
    id = 34,
    profession = 2,
    anima = "buff",
    number = 25,
    all = 40
    };
getRow(35)->
    #partner_animationCfg {
    id = 35,
    profession = 3,
    anima = "skillcast8",
    number = 30,
    all = 36
    };
getRow(36)->
    #partner_animationCfg {
    id = 36,
    profession = 3,
    anima = "mountidle2",
    number = 20,
    all = 40
    };
getRow(37)->
    #partner_animationCfg {
    id = 37,
    profession = 3,
    anima = "baseattack1",
    number = 4,
    all = 27
    };
getRow(38)->
    #partner_animationCfg {
    id = 38,
    profession = 3,
    anima = "baseattack1",
    number = 18,
    all = 27
    };
getRow(39)->
    #partner_animationCfg {
    id = 39,
    profession = 3,
    anima = "baseattack2",
    number = 17,
    all = 25
    };
getRow(40)->
    #partner_animationCfg {
    id = 40,
    profession = 3,
    anima = "change",
    number = 15,
    all = 40
    };
getRow(41)->
    #partner_animationCfg {
    id = 41,
    profession = 3,
    anima = "dead",
    number = 39,
    all = 40
    };
getRow(42)->
    #partner_animationCfg {
    id = 42,
    profession = 3,
    anima = "run",
    number = 7,
    all = 20
    };
getRow(43)->
    #partner_animationCfg {
    id = 43,
    profession = 3,
    anima = "Shapechange_idle",
    number = 44,
    all = 65
    };
getRow(44)->
    #partner_animationCfg {
    id = 44,
    profession = 3,
    anima = "skillcast1",
    number = 9,
    all = 25
    };
getRow(45)->
    #partner_animationCfg {
    id = 45,
    profession = 3,
    anima = "skillcast1",
    number = 19,
    all = 25
    };
getRow(46)->
    #partner_animationCfg {
    id = 46,
    profession = 3,
    anima = "skillcast2",
    number = 10,
    all = 25
    };
getRow(47)->
    #partner_animationCfg {
    id = 47,
    profession = 3,
    anima = "skillcast2",
    number = 20,
    all = 25
    };
getRow(48)->
    #partner_animationCfg {
    id = 48,
    profession = 3,
    anima = "skillcast3",
    number = 9,
    all = 28
    };
getRow(49)->
    #partner_animationCfg {
    id = 49,
    profession = 3,
    anima = "skillcast3",
    number = 20,
    all = 28
    };
getRow(50)->
    #partner_animationCfg {
    id = 50,
    profession = 3,
    anima = "skillcast5",
    number = 7,
    all = 17
    };
getRow(51)->
    #partner_animationCfg {
    id = 51,
    profession = 3,
    anima = "idle",
    number = 24,
    all = 40
    };
getRow(52)->
    #partner_animationCfg {
    id = 52,
    profession = 4,
    anima = "victory",
    number = 34,
    all = 80
    };
getRow(53)->
    #partner_animationCfg {
    id = 53,
    profession = 4,
    anima = "baseattack1",
    number = 12,
    all = 41
    };
getRow(54)->
    #partner_animationCfg {
    id = 54,
    profession = 4,
    anima = "baseattack1",
    number = 20,
    all = 41
    };
getRow(55)->
    #partner_animationCfg {
    id = 55,
    profession = 4,
    anima = "baseattack1",
    number = 39,
    all = 41
    };
getRow(56)->
    #partner_animationCfg {
    id = 56,
    profession = 4,
    anima = "baseattack2",
    number = 12,
    all = 36
    };
getRow(57)->
    #partner_animationCfg {
    id = 57,
    profession = 4,
    anima = "baseattack2",
    number = 27,
    all = 36
    };
getRow(58)->
    #partner_animationCfg {
    id = 58,
    profession = 4,
    anima = "baseattack2",
    number = 19,
    all = 36
    };
getRow(59)->
    #partner_animationCfg {
    id = 59,
    profession = 4,
    anima = "changebody",
    number = 10,
    all = 40
    };
getRow(60)->
    #partner_animationCfg {
    id = 60,
    profession = 4,
    anima = "changebody",
    number = 20,
    all = 40
    };
getRow(61)->
    #partner_animationCfg {
    id = 61,
    profession = 4,
    anima = "changebody",
    number = 30,
    all = 40
    };
getRow(62)->
    #partner_animationCfg {
    id = 62,
    profession = 4,
    anima = "dash_end",
    number = 12,
    all = 24
    };
getRow(63)->
    #partner_animationCfg {
    id = 63,
    profession = 4,
    anima = "dead",
    number = 25,
    all = 38
    };
getRow(64)->
    #partner_animationCfg {
    id = 64,
    profession = 4,
    anima = "dead",
    number = 37,
    all = 38
    };
getRow(65)->
    #partner_animationCfg {
    id = 65,
    profession = 4,
    anima = "idle_rest",
    number = 56,
    all = 196
    };
getRow(66)->
    #partner_animationCfg {
    id = 66,
    profession = 4,
    anima = "idle_rest",
    number = 115,
    all = 196
    };
getRow(67)->
    #partner_animationCfg {
    id = 67,
    profession = 4,
    anima = "idle_rest",
    number = 161,
    all = 196
    };
getRow(68)->
    #partner_animationCfg {
    id = 68,
    profession = 4,
    anima = "idle",
    number = 22,
    all = 40
    };
getRow(69)->
    #partner_animationCfg {
    id = 69,
    profession = 5,
    anima = "victory",
    number = 8,
    all = 75
    };
getRow(70)->
    #partner_animationCfg {
    id = 70,
    profession = 5,
    anima = "victory",
    number = 23,
    all = 75
    };
getRow(71)->
    #partner_animationCfg {
    id = 71,
    profession = 5,
    anima = "victory",
    number = 27,
    all = 75
    };
getRow(72)->
    #partner_animationCfg {
    id = 72,
    profession = 5,
    anima = "victory",
    number = 51,
    all = 75
    };
getRow(73)->
    #partner_animationCfg {
    id = 73,
    profession = 5,
    anima = "baseattack1",
    number = 8,
    all = 20
    };
getRow(74)->
    #partner_animationCfg {
    id = 74,
    profession = 5,
    anima = "baseattack2",
    number = 14,
    all = 38
    };
getRow(75)->
    #partner_animationCfg {
    id = 75,
    profession = 5,
    anima = "baseattack2",
    number = 18,
    all = 38
    };
getRow(76)->
    #partner_animationCfg {
    id = 76,
    profession = 5,
    anima = "baseattack2",
    number = 26,
    all = 38
    };
getRow(77)->
    #partner_animationCfg {
    id = 77,
    profession = 5,
    anima = "skillcast2",
    number = 6,
    all = 75
    };
getRow(78)->
    #partner_animationCfg {
    id = 78,
    profession = 5,
    anima = "skillcast2",
    number = 18,
    all = 75
    };
getRow(79)->
    #partner_animationCfg {
    id = 79,
    profession = 5,
    anima = "skillcast2",
    number = 50,
    all = 75
    };
getRow(80)->
    #partner_animationCfg {
    id = 80,
    profession = 5,
    anima = "skillcast2",
    number = 60,
    all = 75
    };
getRow(81)->
    #partner_animationCfg {
    id = 81,
    profession = 5,
    anima = "skillcast2",
    number = 63,
    all = 75
    };
getRow(82)->
    #partner_animationCfg {
    id = 82,
    profession = 5,
    anima = "skillcast3",
    number = 17,
    all = 75
    };
getRow(83)->
    #partner_animationCfg {
    id = 83,
    profession = 5,
    anima = "skillcast3",
    number = 27,
    all = 75
    };
getRow(84)->
    #partner_animationCfg {
    id = 84,
    profession = 5,
    anima = "skillcast3",
    number = 44,
    all = 75
    };
getRow(85)->
    #partner_animationCfg {
    id = 85,
    profession = 5,
    anima = "skillcast6",
    number = 35,
    all = 110
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
    {50},
    {51},
    {52},
    {53},
    {54},
    {55},
    {56},
    {57},
    {58},
    {59},
    {60},
    {61},
    {62},
    {63},
    {64},
    {65},
    {66},
    {67},
    {68},
    {69},
    {70},
    {71},
    {72},
    {73},
    {74},
    {75},
    {76},
    {77},
    {78},
    {79},
    {80},
    {81},
    {82},
    {83},
    {84},
    {85}
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
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85
    ].

