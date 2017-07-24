%% coding: latin-1
%%: 实现
-module(cfg_logic_chs).
-compile(export_all).
-include("cfg_logic.hrl").
-include("logger.hrl").

getRow(1)->
    #logicCfg {
    id = 1,
    conditionGropuId = [1],
    targetIdList = [],
    triggerIdList = [2]
    };
getRow(2)->
    #logicCfg {
    id = 2,
    conditionGropuId = [2],
    targetIdList = [],
    triggerIdList = [3]
    };
getRow(3)->
    #logicCfg {
    id = 3,
    conditionGropuId = [3],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(4)->
    #logicCfg {
    id = 4,
    conditionGropuId = [4],
    targetIdList = [],
    triggerIdList = [5]
    };
getRow(5)->
    #logicCfg {
    id = 5,
    conditionGropuId = [5],
    targetIdList = [],
    triggerIdList = [5]
    };
getRow(6)->
    #logicCfg {
    id = 6,
    conditionGropuId = [8],
    targetIdList = [],
    triggerIdList = [4]
    };
getRow(7)->
    #logicCfg {
    id = 7,
    conditionGropuId = [9],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(8)->
    #logicCfg {
    id = 8,
    conditionGropuId = [10],
    targetIdList = [],
    triggerIdList = [6,16]
    };
getRow(9)->
    #logicCfg {
    id = 9,
    conditionGropuId = [11],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(10)->
    #logicCfg {
    id = 10,
    conditionGropuId = [12],
    targetIdList = [],
    triggerIdList = [7,8,16]
    };
getRow(11)->
    #logicCfg {
    id = 11,
    conditionGropuId = [13],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(12)->
    #logicCfg {
    id = 12,
    conditionGropuId = [14],
    targetIdList = [],
    triggerIdList = [9,10,16]
    };
getRow(13)->
    #logicCfg {
    id = 13,
    conditionGropuId = [15],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(14)->
    #logicCfg {
    id = 14,
    conditionGropuId = [16],
    targetIdList = [],
    triggerIdList = [11,16]
    };
getRow(15)->
    #logicCfg {
    id = 15,
    conditionGropuId = [17],
    targetIdList = [],
    triggerIdList = [12,13,16]
    };
getRow(16)->
    #logicCfg {
    id = 16,
    conditionGropuId = [18],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(17)->
    #logicCfg {
    id = 17,
    conditionGropuId = [19],
    targetIdList = [],
    triggerIdList = [14,15,16]
    };
getRow(18)->
    #logicCfg {
    id = 18,
    conditionGropuId = [20],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(19)->
    #logicCfg {
    id = 19,
    conditionGropuId = [21],
    targetIdList = [],
    triggerIdList = [17,37]
    };
getRow(20)->
    #logicCfg {
    id = 20,
    conditionGropuId = [22],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(21)->
    #logicCfg {
    id = 21,
    conditionGropuId = [23],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(22)->
    #logicCfg {
    id = 22,
    conditionGropuId = [24],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(23)->
    #logicCfg {
    id = 23,
    conditionGropuId = [25],
    targetIdList = [],
    triggerIdList = [18]
    };
getRow(24)->
    #logicCfg {
    id = 24,
    conditionGropuId = [26],
    targetIdList = [],
    triggerIdList = [19]
    };
getRow(25)->
    #logicCfg {
    id = 25,
    conditionGropuId = [27],
    targetIdList = [],
    triggerIdList = [20]
    };
getRow(26)->
    #logicCfg {
    id = 26,
    conditionGropuId = [28],
    targetIdList = [],
    triggerIdList = [21]
    };
getRow(27)->
    #logicCfg {
    id = 27,
    conditionGropuId = [29],
    targetIdList = [],
    triggerIdList = [22]
    };
getRow(28)->
    #logicCfg {
    id = 28,
    conditionGropuId = [31],
    targetIdList = [],
    triggerIdList = [23]
    };
getRow(29)->
    #logicCfg {
    id = 29,
    conditionGropuId = [30],
    targetIdList = [],
    triggerIdList = [24,26]
    };
getRow(30)->
    #logicCfg {
    id = 30,
    conditionGropuId = [32],
    targetIdList = [],
    triggerIdList = [25,39]
    };
getRow(31)->
    #logicCfg {
    id = 31,
    conditionGropuId = [33],
    targetIdList = [],
    triggerIdList = [27]
    };
getRow(32)->
    #logicCfg {
    id = 32,
    conditionGropuId = [34],
    targetIdList = [],
    triggerIdList = [28]
    };
getRow(33)->
    #logicCfg {
    id = 33,
    conditionGropuId = [35],
    targetIdList = [],
    triggerIdList = [29]
    };
getRow(34)->
    #logicCfg {
    id = 34,
    conditionGropuId = [36],
    targetIdList = [],
    triggerIdList = [30]
    };
getRow(35)->
    #logicCfg {
    id = 35,
    conditionGropuId = [37],
    targetIdList = [],
    triggerIdList = [31,38]
    };
getRow(36)->
    #logicCfg {
    id = 36,
    conditionGropuId = [38],
    targetIdList = [],
    triggerIdList = [31,38]
    };
getRow(37)->
    #logicCfg {
    id = 37,
    conditionGropuId = [39],
    targetIdList = [],
    triggerIdList = [31,38]
    };
getRow(38)->
    #logicCfg {
    id = 38,
    conditionGropuId = [40],
    targetIdList = [],
    triggerIdList = [32]
    };
getRow(39)->
    #logicCfg {
    id = 39,
    conditionGropuId = [41],
    targetIdList = [],
    triggerIdList = [33]
    };
getRow(40)->
    #logicCfg {
    id = 40,
    conditionGropuId = [42],
    targetIdList = [],
    triggerIdList = [34]
    };
getRow(41)->
    #logicCfg {
    id = 41,
    conditionGropuId = [43],
    targetIdList = [],
    triggerIdList = [35]
    };
getRow(42)->
    #logicCfg {
    id = 42,
    conditionGropuId = [46],
    targetIdList = [],
    triggerIdList = [36]
    };
getRow(43)->
    #logicCfg {
    id = 43,
    conditionGropuId = [47],
    targetIdList = [],
    triggerIdList = [37]
    };
getRow(44)->
    #logicCfg {
    id = 44,
    conditionGropuId = [48],
    targetIdList = [],
    triggerIdList = [40,41]
    };
getRow(45)->
    #logicCfg {
    id = 45,
    conditionGropuId = [49],
    targetIdList = [],
    triggerIdList = [42,43]
    };
getRow(46)->
    #logicCfg {
    id = 46,
    conditionGropuId = [50],
    targetIdList = [],
    triggerIdList = [44]
    };
getRow(47)->
    #logicCfg {
    id = 47,
    conditionGropuId = [51],
    targetIdList = [],
    triggerIdList = [45]
    };
getRow(48)->
    #logicCfg {
    id = 48,
    conditionGropuId = [53],
    targetIdList = [],
    triggerIdList = [46]
    };
getRow(49)->
    #logicCfg {
    id = 49,
    conditionGropuId = [55],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(50)->
    #logicCfg {
    id = 50,
    conditionGropuId = [56],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(51)->
    #logicCfg {
    id = 51,
    conditionGropuId = [57],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(52)->
    #logicCfg {
    id = 52,
    conditionGropuId = [58],
    targetIdList = [],
    triggerIdList = [49,47,48]
    };
getRow(53)->
    #logicCfg {
    id = 53,
    conditionGropuId = [59],
    targetIdList = [],
    triggerIdList = [50]
    };
getRow(54)->
    #logicCfg {
    id = 54,
    conditionGropuId = [70],
    targetIdList = [],
    triggerIdList = [51]
    };
getRow(55)->
    #logicCfg {
    id = 55,
    conditionGropuId = [61],
    targetIdList = [],
    triggerIdList = [52]
    };
getRow(56)->
    #logicCfg {
    id = 56,
    conditionGropuId = [67],
    targetIdList = [],
    triggerIdList = [53,62,63]
    };
getRow(57)->
    #logicCfg {
    id = 57,
    conditionGropuId = [66],
    targetIdList = [1,3,7,10],
    triggerIdList = [54]
    };
getRow(58)->
    #logicCfg {
    id = 58,
    conditionGropuId = [66],
    targetIdList = [1],
    triggerIdList = [55]
    };
getRow(59)->
    #logicCfg {
    id = 59,
    conditionGropuId = [66],
    targetIdList = [1,5,7,10],
    triggerIdList = [56]
    };
getRow(60)->
    #logicCfg {
    id = 60,
    conditionGropuId = [66],
    targetIdList = [1,8,9],
    triggerIdList = [68]
    };
getRow(61)->
    #logicCfg {
    id = 61,
    conditionGropuId = [66],
    targetIdList = [1,8,9],
    triggerIdList = [58]
    };
getRow(62)->
    #logicCfg {
    id = 62,
    conditionGropuId = [66],
    targetIdList = [1,8],
    triggerIdList = [59]
    };
getRow(63)->
    #logicCfg {
    id = 63,
    conditionGropuId = [66],
    targetIdList = [1,8],
    triggerIdList = [60]
    };
getRow(64)->
    #logicCfg {
    id = 64,
    conditionGropuId = [66],
    targetIdList = [1,8],
    triggerIdList = [61]
    };
getRow(65)->
    #logicCfg {
    id = 65,
    conditionGropuId = [64],
    targetIdList = [],
    triggerIdList = [64]
    };
getRow(66)->
    #logicCfg {
    id = 66,
    conditionGropuId = [65],
    targetIdList = [],
    triggerIdList = [62]
    };
getRow(67)->
    #logicCfg {
    id = 67,
    conditionGropuId = [68],
    targetIdList = [],
    triggerIdList = [53,62]
    };
getRow(68)->
    #logicCfg {
    id = 68,
    conditionGropuId = [],
    targetIdList = [1,8],
    triggerIdList = [66]
    };
getRow(69)->
    #logicCfg {
    id = 69,
    conditionGropuId = [74],
    targetIdList = [1,8,9],
    triggerIdList = [67]
    };
getRow(70)->
    #logicCfg {
    id = 70,
    conditionGropuId = [66],
    targetIdList = [1,8,9],
    triggerIdList = [68]
    };
getRow(71)->
    #logicCfg {
    id = 71,
    conditionGropuId = [71],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(72)->
    #logicCfg {
    id = 72,
    conditionGropuId = [72],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(73)->
    #logicCfg {
    id = 73,
    conditionGropuId = [73],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(74)->
    #logicCfg {
    id = 74,
    conditionGropuId = [75],
    targetIdList = [],
    triggerIdList = [65]
    };
getRow(75)->
    #logicCfg {
    id = 75,
    conditionGropuId = [67],
    targetIdList = [],
    triggerIdList = [63]
    };
getRow(76)->
    #logicCfg {
    id = 76,
    conditionGropuId = [],
    targetIdList = [],
    triggerIdList = [53]
    };
getRow(77)->
    #logicCfg {
    id = 77,
    conditionGropuId = [],
    targetIdList = [],
    triggerIdList = [69]
    };
getRow(78)->
    #logicCfg {
    id = 78,
    conditionGropuId = [66],
    targetIdList = [1,8],
    triggerIdList = [70]
    };
getRow(79)->
    #logicCfg {
    id = 79,
    conditionGropuId = [96],
    targetIdList = [],
    triggerIdList = [71]
    };
getRow(80)->
    #logicCfg {
    id = 80,
    conditionGropuId = [97],
    targetIdList = [],
    triggerIdList = [72,73]
    };
getRow(81)->
    #logicCfg {
    id = 81,
    conditionGropuId = [77],
    targetIdList = [],
    triggerIdList = [74]
    };
getRow(82)->
    #logicCfg {
    id = 82,
    conditionGropuId = [78],
    targetIdList = [],
    triggerIdList = [76,71]
    };
getRow(83)->
    #logicCfg {
    id = 83,
    conditionGropuId = [79],
    targetIdList = [],
    triggerIdList = [78,72]
    };
getRow(84)->
    #logicCfg {
    id = 84,
    conditionGropuId = [80],
    targetIdList = [],
    triggerIdList = [77,75]
    };
getRow(85)->
    #logicCfg {
    id = 85,
    conditionGropuId = [81],
    targetIdList = [],
    triggerIdList = [76,71]
    };
getRow(86)->
    #logicCfg {
    id = 86,
    conditionGropuId = [82],
    targetIdList = [],
    triggerIdList = [78,72]
    };
getRow(87)->
    #logicCfg {
    id = 87,
    conditionGropuId = [83],
    targetIdList = [],
    triggerIdList = [77,75]
    };
getRow(88)->
    #logicCfg {
    id = 88,
    conditionGropuId = [84],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(89)->
    #logicCfg {
    id = 89,
    conditionGropuId = [85],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(90)->
    #logicCfg {
    id = 90,
    conditionGropuId = [86],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(91)->
    #logicCfg {
    id = 91,
    conditionGropuId = [87],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(92)->
    #logicCfg {
    id = 92,
    conditionGropuId = [88],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(93)->
    #logicCfg {
    id = 93,
    conditionGropuId = [89],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(94)->
    #logicCfg {
    id = 94,
    conditionGropuId = [90],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(95)->
    #logicCfg {
    id = 95,
    conditionGropuId = [91],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(96)->
    #logicCfg {
    id = 96,
    conditionGropuId = [92],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(97)->
    #logicCfg {
    id = 97,
    conditionGropuId = [93],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(98)->
    #logicCfg {
    id = 98,
    conditionGropuId = [94],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(99)->
    #logicCfg {
    id = 99,
    conditionGropuId = [95],
    targetIdList = [],
    triggerIdList = [1]
    };
getRow(100)->
    #logicCfg {
    id = 100,
    conditionGropuId = [98],
    targetIdList = [],
    triggerIdList = [53,62]
    };
getRow(101)->
    #logicCfg {
    id = 101,
    conditionGropuId = [99],
    targetIdList = [],
    triggerIdList = [79]
    };
getRow(102)->
    #logicCfg {
    id = 102,
    conditionGropuId = [100],
    targetIdList = [],
    triggerIdList = [80]
    };
getRow(103)->
    #logicCfg {
    id = 103,
    conditionGropuId = [101],
    targetIdList = [],
    triggerIdList = [80]
    };
getRow(104)->
    #logicCfg {
    id = 104,
    conditionGropuId = [102],
    targetIdList = [],
    triggerIdList = [5]
    };
getRow(105)->
    #logicCfg {
    id = 105,
    conditionGropuId = [103],
    targetIdList = [],
    triggerIdList = [5]
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
    {85},
    {86},
    {87},
    {88},
    {89},
    {90},
    {91},
    {92},
    {93},
    {94},
    {95},
    {96},
    {97},
    {98},
    {99},
    {100},
    {101},
    {102},
    {103},
    {104},
    {105}
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
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    94,
    95,
    96,
    97,
    98,
    99,
    100,
    101,
    102,
    103,
    104,
    105
    ].

