%% coding: latin-1
%%: 实现
-module(cfg_price_chs).
-compile(export_all).
-include("cfg_price.hrl").
-include("logger.hrl").

getRow(1)->
    #priceCfg {
    id = 1,
    coinBuy = 0
    };
getRow(2)->
    #priceCfg {
    id = 2,
    coinBuy = 10
    };
getRow(3)->
    #priceCfg {
    id = 3,
    coinBuy = 10
    };
getRow(4)->
    #priceCfg {
    id = 4,
    coinBuy = 15
    };
getRow(5)->
    #priceCfg {
    id = 5,
    coinBuy = 15
    };
getRow(6)->
    #priceCfg {
    id = 6,
    coinBuy = 15
    };
getRow(7)->
    #priceCfg {
    id = 7,
    coinBuy = 20
    };
getRow(8)->
    #priceCfg {
    id = 8,
    coinBuy = 20
    };
getRow(9)->
    #priceCfg {
    id = 9,
    coinBuy = 20
    };
getRow(10)->
    #priceCfg {
    id = 10,
    coinBuy = 20
    };
getRow(11)->
    #priceCfg {
    id = 11,
    coinBuy = 20
    };
getRow(12)->
    #priceCfg {
    id = 12,
    coinBuy = 25
    };
getRow(13)->
    #priceCfg {
    id = 13,
    coinBuy = 25
    };
getRow(14)->
    #priceCfg {
    id = 14,
    coinBuy = 25
    };
getRow(15)->
    #priceCfg {
    id = 15,
    coinBuy = 30
    };
getRow(16)->
    #priceCfg {
    id = 16,
    coinBuy = 30
    };
getRow(17)->
    #priceCfg {
    id = 17,
    coinBuy = 30
    };
getRow(18)->
    #priceCfg {
    id = 18,
    coinBuy = 35
    };
getRow(19)->
    #priceCfg {
    id = 19,
    coinBuy = 35
    };
getRow(20)->
    #priceCfg {
    id = 20,
    coinBuy = 35
    };
getRow(21)->
    #priceCfg {
    id = 21,
    coinBuy = 40
    };
getRow(22)->
    #priceCfg {
    id = 22,
    coinBuy = 40
    };
getRow(23)->
    #priceCfg {
    id = 23,
    coinBuy = 40
    };
getRow(24)->
    #priceCfg {
    id = 24,
    coinBuy = 50
    };
getRow(25)->
    #priceCfg {
    id = 25,
    coinBuy = 50
    };
getRow(26)->
    #priceCfg {
    id = 26,
    coinBuy = 50
    };
getRow(27)->
    #priceCfg {
    id = 27,
    coinBuy = 60
    };
getRow(28)->
    #priceCfg {
    id = 28,
    coinBuy = 60
    };
getRow(29)->
    #priceCfg {
    id = 29,
    coinBuy = 60
    };
getRow(30)->
    #priceCfg {
    id = 30,
    coinBuy = 70
    };
getRow(31)->
    #priceCfg {
    id = 31,
    coinBuy = 70
    };
getRow(32)->
    #priceCfg {
    id = 32,
    coinBuy = 70
    };
getRow(33)->
    #priceCfg {
    id = 33,
    coinBuy = 80
    };
getRow(34)->
    #priceCfg {
    id = 34,
    coinBuy = 80
    };
getRow(35)->
    #priceCfg {
    id = 35,
    coinBuy = 80
    };
getRow(36)->
    #priceCfg {
    id = 36,
    coinBuy = 90
    };
getRow(37)->
    #priceCfg {
    id = 37,
    coinBuy = 90
    };
getRow(38)->
    #priceCfg {
    id = 38,
    coinBuy = 90
    };
getRow(39)->
    #priceCfg {
    id = 39,
    coinBuy = 100
    };
getRow(40)->
    #priceCfg {
    id = 40,
    coinBuy = 100
    };
getRow(41)->
    #priceCfg {
    id = 41,
    coinBuy = 120
    };
getRow(42)->
    #priceCfg {
    id = 42,
    coinBuy = 120
    };
getRow(43)->
    #priceCfg {
    id = 43,
    coinBuy = 140
    };
getRow(44)->
    #priceCfg {
    id = 44,
    coinBuy = 140
    };
getRow(45)->
    #priceCfg {
    id = 45,
    coinBuy = 160
    };
getRow(46)->
    #priceCfg {
    id = 46,
    coinBuy = 160
    };
getRow(47)->
    #priceCfg {
    id = 47,
    coinBuy = 180
    };
getRow(48)->
    #priceCfg {
    id = 48,
    coinBuy = 180
    };
getRow(49)->
    #priceCfg {
    id = 49,
    coinBuy = 200
    };
getRow(50)->
    #priceCfg {
    id = 50,
    coinBuy = 200
    };
getRow(51)->
    #priceCfg {
    id = 51,
    coinBuy = 200
    };
getRow(52)->
    #priceCfg {
    id = 52,
    coinBuy = 200
    };
getRow(53)->
    #priceCfg {
    id = 53,
    coinBuy = 200
    };
getRow(54)->
    #priceCfg {
    id = 54,
    coinBuy = 200
    };
getRow(55)->
    #priceCfg {
    id = 55,
    coinBuy = 200
    };
getRow(56)->
    #priceCfg {
    id = 56,
    coinBuy = 200
    };
getRow(57)->
    #priceCfg {
    id = 57,
    coinBuy = 250
    };
getRow(58)->
    #priceCfg {
    id = 58,
    coinBuy = 250
    };
getRow(59)->
    #priceCfg {
    id = 59,
    coinBuy = 250
    };
getRow(60)->
    #priceCfg {
    id = 60,
    coinBuy = 250
    };
getRow(61)->
    #priceCfg {
    id = 61,
    coinBuy = 250
    };
getRow(62)->
    #priceCfg {
    id = 62,
    coinBuy = 250
    };
getRow(63)->
    #priceCfg {
    id = 63,
    coinBuy = 250
    };
getRow(64)->
    #priceCfg {
    id = 64,
    coinBuy = 250
    };
getRow(65)->
    #priceCfg {
    id = 65,
    coinBuy = 250
    };
getRow(66)->
    #priceCfg {
    id = 66,
    coinBuy = 250
    };
getRow(67)->
    #priceCfg {
    id = 67,
    coinBuy = 300
    };
getRow(68)->
    #priceCfg {
    id = 68,
    coinBuy = 300
    };
getRow(69)->
    #priceCfg {
    id = 69,
    coinBuy = 300
    };
getRow(70)->
    #priceCfg {
    id = 70,
    coinBuy = 300
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
    {70}
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
    70
    ].

