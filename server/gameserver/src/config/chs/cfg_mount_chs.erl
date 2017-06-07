%%: 实现
-module(cfg_mount_chs).
-compile(export_all).
-include("cfg_mount.hrl").
-include("logger.hrl").

getRow(1)->
    #mountCfg {
    mountLv = 1,
    mountName = "战马1",
    mountModelID = 4,
    speed = [1.4,0],
    food = 6,
    consumeNum = 1,
    money = 50,
    skill = 0
    };
getRow(2)->
    #mountCfg {
    mountLv = 2,
    mountName = "战马1",
    mountModelID = 0,
    speed = [1.45,0],
    food = 6,
    consumeNum = 1,
    money = 70,
    skill = 0
    };
getRow(3)->
    #mountCfg {
    mountLv = 3,
    mountName = "战马1",
    mountModelID = 0,
    speed = [1.5,0],
    food = 6,
    consumeNum = 1,
    money = 95,
    skill = 0
    };
getRow(4)->
    #mountCfg {
    mountLv = 4,
    mountName = "战马1",
    mountModelID = 0,
    speed = [1.55,0],
    food = 6,
    consumeNum = 1,
    money = 120,
    skill = 0
    };
getRow(5)->
    #mountCfg {
    mountLv = 5,
    mountName = "战马1",
    mountModelID = 5,
    speed = [1.6,0],
    food = 12,
    consumeNum = 2,
    money = 140,
    skill = 0
    };
getRow(6)->
    #mountCfg {
    mountLv = 6,
    mountName = "战马1",
    mountModelID = 0,
    speed = [1.65,0],
    food = 12,
    consumeNum = 2,
    money = 165,
    skill = 0
    };
getRow(7)->
    #mountCfg {
    mountLv = 7,
    mountName = "战马1",
    mountModelID = 0,
    speed = [1.7,0],
    food = 12,
    consumeNum = 2,
    money = 190,
    skill = 0
    };
getRow(8)->
    #mountCfg {
    mountLv = 8,
    mountName = "战马1",
    mountModelID = 0,
    speed = [1.75,0],
    food = 12,
    consumeNum = 2,
    money = 210,
    skill = 0
    };
getRow(9)->
    #mountCfg {
    mountLv = 9,
    mountName = "战马1",
    mountModelID = 0,
    speed = [1.8,0],
    food = 12,
    consumeNum = 2,
    money = 235,
    skill = 0
    };
getRow(10)->
    #mountCfg {
    mountLv = 10,
    mountName = "战马2",
    mountModelID = 6,
    speed = [1.85,0],
    food = 24,
    consumeNum = 4,
    money = 260,
    skill = 0
    };
getRow(11)->
    #mountCfg {
    mountLv = 11,
    mountName = "战马2",
    mountModelID = 0,
    speed = [1.9,0],
    food = 24,
    consumeNum = 4,
    money = 280,
    skill = 0
    };
getRow(12)->
    #mountCfg {
    mountLv = 12,
    mountName = "战马2",
    mountModelID = 0,
    speed = [1.95,0],
    food = 24,
    consumeNum = 4,
    money = 305,
    skill = 0
    };
getRow(13)->
    #mountCfg {
    mountLv = 13,
    mountName = "战马2",
    mountModelID = 0,
    speed = [2,0],
    food = 24,
    consumeNum = 4,
    money = 330,
    skill = 0
    };
getRow(14)->
    #mountCfg {
    mountLv = 14,
    mountName = "战马2",
    mountModelID = 0,
    speed = [2.05,0],
    food = 24,
    consumeNum = 4,
    money = 350,
    skill = 0
    };
getRow(15)->
    #mountCfg {
    mountLv = 15,
    mountName = "战马2",
    mountModelID = 7,
    speed = [2.1,0],
    food = 36,
    consumeNum = 6,
    money = 350,
    skill = 0
    };
getRow(16)->
    #mountCfg {
    mountLv = 16,
    mountName = "战马2",
    mountModelID = 0,
    speed = [2.15,0],
    food = 36,
    consumeNum = 6,
    money = 350,
    skill = 0
    };
getRow(17)->
    #mountCfg {
    mountLv = 17,
    mountName = "战马2",
    mountModelID = 0,
    speed = [2.2,0],
    food = 36,
    consumeNum = 6,
    money = 350,
    skill = 0
    };
getRow(18)->
    #mountCfg {
    mountLv = 18,
    mountName = "战马2",
    mountModelID = 0,
    speed = [2.25,0],
    food = 36,
    consumeNum = 6,
    money = 350,
    skill = 0
    };
getRow(19)->
    #mountCfg {
    mountLv = 19,
    mountName = "战马2",
    mountModelID = 0,
    speed = [2.3,0],
    food = 36,
    consumeNum = 6,
    money = 350,
    skill = 0
    };
getRow(20)->
    #mountCfg {
    mountLv = 20,
    mountName = "战马3",
    mountModelID = 8,
    speed = [2.35,0],
    food = 72,
    consumeNum = 8,
    money = 350,
    skill = 0
    };
getRow(21)->
    #mountCfg {
    mountLv = 21,
    mountName = "战马3",
    mountModelID = 0,
    speed = [2.4,0],
    food = 72,
    consumeNum = 8,
    money = 350,
    skill = 0
    };
getRow(22)->
    #mountCfg {
    mountLv = 22,
    mountName = "战马3",
    mountModelID = 0,
    speed = [2.45,0],
    food = 72,
    consumeNum = 8,
    money = 350,
    skill = 0
    };
getRow(23)->
    #mountCfg {
    mountLv = 23,
    mountName = "战马3",
    mountModelID = 0,
    speed = [2.5,0],
    food = 72,
    consumeNum = 8,
    money = 350,
    skill = 0
    };
getRow(24)->
    #mountCfg {
    mountLv = 24,
    mountName = "战马3",
    mountModelID = 0,
    speed = [2.55,0],
    food = 72,
    consumeNum = 8,
    money = 350,
    skill = 0
    };
getRow(25)->
    #mountCfg {
    mountLv = 25,
    mountName = "战马3",
    mountModelID = 9,
    speed = [2.6,0],
    food = 96,
    consumeNum = 12,
    money = 350,
    skill = 0
    };
getRow(26)->
    #mountCfg {
    mountLv = 26,
    mountName = "战马3",
    mountModelID = 0,
    speed = [2.65,0],
    food = 96,
    consumeNum = 12,
    money = 350,
    skill = 0
    };
getRow(27)->
    #mountCfg {
    mountLv = 27,
    mountName = "战马3",
    mountModelID = 0,
    speed = [2.7,0],
    food = 96,
    consumeNum = 12,
    money = 350,
    skill = 0
    };
getRow(28)->
    #mountCfg {
    mountLv = 28,
    mountName = "战马3",
    mountModelID = 0,
    speed = [2.75,0],
    food = 96,
    consumeNum = 12,
    money = 350,
    skill = 0
    };
getRow(29)->
    #mountCfg {
    mountLv = 29,
    mountName = "战马3",
    mountModelID = 0,
    speed = [2.8,0],
    food = 96,
    consumeNum = 12,
    money = 350,
    skill = 0
    };
getRow(30)->
    #mountCfg {
    mountLv = 30,
    mountName = "战狼4",
    mountModelID = 19,
    speed = [2.85,0],
    food = 192,
    consumeNum = 16,
    money = 350,
    skill = 0
    };
getRow(31)->
    #mountCfg {
    mountLv = 31,
    mountName = "战狼4",
    mountModelID = 0,
    speed = [2.9,0],
    food = 192,
    consumeNum = 16,
    money = 350,
    skill = 0
    };
getRow(32)->
    #mountCfg {
    mountLv = 32,
    mountName = "战狼4",
    mountModelID = 0,
    speed = [2.95,0],
    food = 192,
    consumeNum = 16,
    money = 350,
    skill = 0
    };
getRow(33)->
    #mountCfg {
    mountLv = 33,
    mountName = "战狼4",
    mountModelID = 0,
    speed = [3,0],
    food = 192,
    consumeNum = 16,
    money = 350,
    skill = 0
    };
getRow(34)->
    #mountCfg {
    mountLv = 34,
    mountName = "战狼4",
    mountModelID = 0,
    speed = [3.05,0],
    food = 192,
    consumeNum = 16,
    money = 350,
    skill = 0
    };
getRow(35)->
    #mountCfg {
    mountLv = 35,
    mountName = "战狼5",
    mountModelID = 20,
    speed = [3.1,0],
    food = 384,
    consumeNum = 16,
    money = 350,
    skill = 0
    };
getRow(36)->
    #mountCfg {
    mountLv = 36,
    mountName = "战狼5",
    mountModelID = 0,
    speed = [3.15,0],
    food = 384,
    consumeNum = 16,
    money = 350,
    skill = 0
    };
getRow(37)->
    #mountCfg {
    mountLv = 37,
    mountName = "战狼5",
    mountModelID = 0,
    speed = [3.2,0],
    food = 384,
    consumeNum = 16,
    money = 350,
    skill = 0
    };
getRow(38)->
    #mountCfg {
    mountLv = 38,
    mountName = "战狼5",
    mountModelID = 0,
    speed = [3.25,0],
    food = 384,
    consumeNum = 16,
    money = 350,
    skill = 0
    };
getRow(39)->
    #mountCfg {
    mountLv = 39,
    mountName = "战狼5",
    mountModelID = 0,
    speed = [3.3,0],
    food = 384,
    consumeNum = 16,
    money = 350,
    skill = 0
    };
getRow(40)->
    #mountCfg {
    mountLv = 40,
    mountName = "战狼6",
    mountModelID = 18,
    speed = [3.35,0],
    food = 768,
    consumeNum = 16,
    money = 350,
    skill = 0
    };
getRow(41)->
    #mountCfg {
    mountLv = 41,
    mountName = "战狼6",
    mountModelID = 0,
    speed = [3.4,0],
    food = 768,
    consumeNum = 16,
    money = 350,
    skill = 0
    };
getRow(42)->
    #mountCfg {
    mountLv = 42,
    mountName = "战狼6",
    mountModelID = 0,
    speed = [3.45,0],
    food = 768,
    consumeNum = 16,
    money = 350,
    skill = 0
    };
getRow(43)->
    #mountCfg {
    mountLv = 43,
    mountName = "战狼6",
    mountModelID = 0,
    speed = [3.5,0],
    food = 768,
    consumeNum = 16,
    money = 350,
    skill = 0
    };
getRow(44)->
    #mountCfg {
    mountLv = 44,
    mountName = "战狼6",
    mountModelID = 0,
    speed = [3.55,0],
    food = 768,
    consumeNum = 16,
    money = 350,
    skill = 0
    };
getRow(45)->
    #mountCfg {
    mountLv = 45,
    mountName = "战熊7",
    mountModelID = 25,
    speed = [3.6,0],
    food = 1536,
    consumeNum = 32,
    money = 350,
    skill = 0
    };
getRow(46)->
    #mountCfg {
    mountLv = 46,
    mountName = "战熊7",
    mountModelID = 0,
    speed = [3.65,0],
    food = 1536,
    consumeNum = 32,
    money = 350,
    skill = 0
    };
getRow(47)->
    #mountCfg {
    mountLv = 47,
    mountName = "战熊7",
    mountModelID = 0,
    speed = [3.7,0],
    food = 1536,
    consumeNum = 32,
    money = 350,
    skill = 0
    };
getRow(48)->
    #mountCfg {
    mountLv = 48,
    mountName = "战熊7",
    mountModelID = 0,
    speed = [3.75,0],
    food = 1536,
    consumeNum = 32,
    money = 350,
    skill = 0
    };
getRow(49)->
    #mountCfg {
    mountLv = 49,
    mountName = "战熊7",
    mountModelID = 0,
    speed = [3.8,0],
    food = 1536,
    consumeNum = 32,
    money = 350,
    skill = 0
    };
getRow(50)->
    #mountCfg {
    mountLv = 50,
    mountName = "战熊8",
    mountModelID = 26,
    speed = [3.85,0],
    food = 3072,
    consumeNum = 32,
    money = 350,
    skill = 0
    };
getRow(51)->
    #mountCfg {
    mountLv = 51,
    mountName = "战熊8",
    mountModelID = 0,
    speed = [3.9,0],
    food = 3072,
    consumeNum = 32,
    money = 350,
    skill = 0
    };
getRow(52)->
    #mountCfg {
    mountLv = 52,
    mountName = "战熊8",
    mountModelID = 0,
    speed = [3.95,0],
    food = 3072,
    consumeNum = 32,
    money = 350,
    skill = 0
    };
getRow(53)->
    #mountCfg {
    mountLv = 53,
    mountName = "战熊8",
    mountModelID = 0,
    speed = [4,0],
    food = 3072,
    consumeNum = 32,
    money = 350,
    skill = 0
    };
getRow(54)->
    #mountCfg {
    mountLv = 54,
    mountName = "战熊8",
    mountModelID = 0,
    speed = [4.05,0],
    food = 3072,
    consumeNum = 32,
    money = 350,
    skill = 0
    };
getRow(55)->
    #mountCfg {
    mountLv = 55,
    mountName = "战熊9",
    mountModelID = 21,
    speed = [4.1,0],
    food = 3072,
    consumeNum = 64,
    money = 350,
    skill = 0
    };
getRow(56)->
    #mountCfg {
    mountLv = 56,
    mountName = "战熊9",
    mountModelID = 0,
    speed = [4.15,0],
    food = 3072,
    consumeNum = 64,
    money = 350,
    skill = 0
    };
getRow(57)->
    #mountCfg {
    mountLv = 57,
    mountName = "战熊9",
    mountModelID = 0,
    speed = [4.2,0],
    food = 3072,
    consumeNum = 64,
    money = 350,
    skill = 0
    };
getRow(58)->
    #mountCfg {
    mountLv = 58,
    mountName = "战熊9",
    mountModelID = 0,
    speed = [4.25,0],
    food = 6144,
    consumeNum = 64,
    money = 350,
    skill = 0
    };
getRow(59)->
    #mountCfg {
    mountLv = 59,
    mountName = "战熊9",
    mountModelID = 0,
    speed = [4.3,0],
    food = 6144,
    consumeNum = 64,
    money = 350,
    skill = 0
    };
getRow(60)->
    #mountCfg {
    mountLv = 60,
    mountName = "无敌战马",
    mountModelID = 10,
    speed = [4.35,0],
    food = 0,
    consumeNum = 0,
    money = 500,
    skill = 0
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
    {60}
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
    60
    ].

