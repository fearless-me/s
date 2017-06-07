%% coding: latin-1
%%: 实现
-module(cfg_color_chs).
-compile(export_all).
-include("cfg_color.hrl").
-include("logger.hrl").

getRow(1)->
    #colorCfg {
    id = 1,
    red = 230,
    green = 10,
    blue = 10
    };
getRow(2)->
    #colorCfg {
    id = 2,
    red = 10,
    green = 10,
    blue = 10
    };
getRow(3)->
    #colorCfg {
    id = 3,
    red = 240,
    green = 240,
    blue = 240
    };
getRow(4)->
    #colorCfg {
    id = 4,
    red = 20,
    green = 240,
    blue = 20
    };
getRow(5)->
    #colorCfg {
    id = 5,
    red = 20,
    green = 60,
    blue = 240
    };
getRow(6)->
    #colorCfg {
    id = 6,
    red = 200,
    green = 20,
    blue = 200
    };
getRow(7)->
    #colorCfg {
    id = 7,
    red = 255,
    green = 140,
    blue = 20
    };
getRow(8)->
    #colorCfg {
    id = 8,
    red = 250,
    green = 30,
    blue = 30
    };
getRow(9)->
    #colorCfg {
    id = 9,
    red = 255,
    green = 140,
    blue = 20
    };
getRow(10)->
    #colorCfg {
    id = 10,
    red = 230,
    green = 230,
    blue = 20
    };
getRow(11)->
    #colorCfg {
    id = 11,
    red = 100,
    green = 240,
    blue = 20
    };
getRow(12)->
    #colorCfg {
    id = 12,
    red = 20,
    green = 240,
    blue = 240
    };
getRow(13)->
    #colorCfg {
    id = 13,
    red = 97,
    green = 178,
    blue = 231
    };
getRow(14)->
    #colorCfg {
    id = 14,
    red = 181,
    green = 66,
    blue = 242
    };
getRow(15)->
    #colorCfg {
    id = 15,
    red = 75,
    green = 65,
    blue = 120
    };
getRow(16)->
    #colorCfg {
    id = 16,
    red = 30,
    green = 120,
    blue = 60
    };
getRow(17)->
    #colorCfg {
    id = 17,
    red = 135,
    green = 175,
    blue = 10
    };
getRow(18)->
    #colorCfg {
    id = 18,
    red = 240,
    green = 230,
    blue = 60
    };
getRow(19)->
    #colorCfg {
    id = 19,
    red = 180,
    green = 8,
    blue = 28
    };
getRow(20)->
    #colorCfg {
    id = 20,
    red = 240,
    green = 240,
    blue = 240
    };
getRow(21)->
    #colorCfg {
    id = 21,
    red = 205,
    green = 205,
    blue = 205
    };
getRow(22)->
    #colorCfg {
    id = 22,
    red = 180,
    green = 180,
    blue = 180
    };
getRow(23)->
    #colorCfg {
    id = 23,
    red = 155,
    green = 155,
    blue = 155
    };
getRow(24)->
    #colorCfg {
    id = 24,
    red = 130,
    green = 130,
    blue = 130
    };
getRow(25)->
    #colorCfg {
    id = 25,
    red = 105,
    green = 105,
    blue = 105
    };
getRow(26)->
    #colorCfg {
    id = 26,
    red = 80,
    green = 80,
    blue = 80
    };
getRow(27)->
    #colorCfg {
    id = 27,
    red = 55,
    green = 55,
    blue = 55
    };
getRow(28)->
    #colorCfg {
    id = 28,
    red = 30,
    green = 30,
    blue = 30
    };
getRow(29)->
    #colorCfg {
    id = 29,
    red = 15,
    green = 15,
    blue = 15
    };
getRow(30)->
    #colorCfg {
    id = 30,
    red = 230,
    green = 230,
    blue = 20
    };
getRow(31)->
    #colorCfg {
    id = 31,
    red = 204,
    green = 124,
    blue = 255
    };
getRow(32)->
    #colorCfg {
    id = 32,
    red = 74,
    green = 187,
    blue = 247
    };
getRow(33)->
    #colorCfg {
    id = 33,
    red = 0,
    green = 201,
    blue = 78
    };
getRow(34)->
    #colorCfg {
    id = 34,
    red = 230,
    green = 10,
    blue = 10
    };
getRow(35)->
    #colorCfg {
    id = 35,
    red = 0,
    green = 0,
    blue = 0
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
    {35}
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
    35
    ].

