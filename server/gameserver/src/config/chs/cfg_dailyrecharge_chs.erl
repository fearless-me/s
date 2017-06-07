%% coding: latin-1
%%: 实现
-module(cfg_dailyrecharge_chs).
-compile(export_all).
-include("cfg_dailyrecharge.hrl").
-include("logger.hrl").

getRow(1)->
    #dailyrechargeCfg {
    id = 1,
    day = 1,
    diamond = 60,
    item = [{222,5,0,0},{617,1,0,0},{902,6,0,0},{2002,1,0,0}]
    };
getRow(2)->
    #dailyrechargeCfg {
    id = 2,
    day = 1,
    diamond = 300,
    item = [{222,10,0,0},{1901,5,0,0},{904,3,0,0},{2022,5,0,0}]
    };
getRow(3)->
    #dailyrechargeCfg {
    id = 3,
    day = 1,
    diamond = 980,
    item = [{222,15,0,0},{617,2,0,0},{223,5,0,0},{2004,5,0,0}]
    };
getRow(4)->
    #dailyrechargeCfg {
    id = 4,
    day = 1,
    diamond = 1980,
    item = [{222,20,0,0},{1901,5,0,0},{2022,5,0,0},{2002,1,0,0}]
    };
getRow(5)->
    #dailyrechargeCfg {
    id = 5,
    day = 1,
    diamond = 3280,
    item = [{224,10,0,0},{617,4,0,0},{223,10,0,0},{2004,5,0,0}]
    };
getRow(6)->
    #dailyrechargeCfg {
    id = 6,
    day = 1,
    diamond = 6480,
    item = [{224,15,0,0},{1901,10,0,0},{2004,5,0,0}]
    };
getRow(7)->
    #dailyrechargeCfg {
    id = 7,
    day = 1,
    diamond = 12880,
    item = [{224,20,0,0},{1902,10,0,0},{223,15,0,0},{2002,1,0,0},{2004,5,0,0}]
    };
getRow(8)->
    #dailyrechargeCfg {
    id = 8,
    day = 2,
    diamond = 60,
    item = [{2160,5,0,0},{617,1,0,0},{902,6,0,0},{2002,1,0,0}]
    };
getRow(9)->
    #dailyrechargeCfg {
    id = 9,
    day = 2,
    diamond = 300,
    item = [{2160,10,0,0},{1903,5,0,0},{904,3,0,0},{2022,5,0,0}]
    };
getRow(10)->
    #dailyrechargeCfg {
    id = 10,
    day = 2,
    diamond = 980,
    item = [{2160,15,0,0},{617,2,0,0},{201,5,0,0},{2004,5,0,0}]
    };
getRow(11)->
    #dailyrechargeCfg {
    id = 11,
    day = 2,
    diamond = 1980,
    item = [{2161,10,0,0},{1903,5,0,0},{2022,5,0,0},{2002,1,0,0}]
    };
getRow(12)->
    #dailyrechargeCfg {
    id = 12,
    day = 2,
    diamond = 3280,
    item = [{2161,15,0,0},{617,4,0,0},{201,10,0,0},{2004,5,0,0}]
    };
getRow(13)->
    #dailyrechargeCfg {
    id = 13,
    day = 2,
    diamond = 6480,
    item = [{2161,20,0,0},{1903,10,0,0},{2004,5,0,0}]
    };
getRow(14)->
    #dailyrechargeCfg {
    id = 14,
    day = 2,
    diamond = 12880,
    item = [{2162,10,0,0},{1902,10,0,0},{201,15,0,0},{2002,1,0,0},{2004,5,0,0}]
    };
getRow(15)->
    #dailyrechargeCfg {
    id = 15,
    day = 3,
    diamond = 60,
    item = [{2102,5,0,0},{617,1,0,0},{902,6,0,0},{2002,1,0,0}]
    };
getRow(16)->
    #dailyrechargeCfg {
    id = 16,
    day = 3,
    diamond = 300,
    item = [{2102,10,0,0},{1901,5,0,0},{904,3,0,0},{2022,5,0,0}]
    };
getRow(17)->
    #dailyrechargeCfg {
    id = 17,
    day = 3,
    diamond = 980,
    item = [{2102,15,0,0},{617,2,0,0},{225,5,0,0},{2004,5,0,0}]
    };
getRow(18)->
    #dailyrechargeCfg {
    id = 18,
    day = 3,
    diamond = 1980,
    item = [{2104,10,0,0},{1901,5,0,0},{2022,5,0,0},{2002,1,0,0}]
    };
getRow(19)->
    #dailyrechargeCfg {
    id = 19,
    day = 3,
    diamond = 3280,
    item = [{2104,15,0,0},{617,4,0,0},{225,10,0,0},{2004,5,0,0}]
    };
getRow(20)->
    #dailyrechargeCfg {
    id = 20,
    day = 3,
    diamond = 6480,
    item = [{2104,20,0,0},{1901,10,0,0},{2004,5,0,0}]
    };
getRow(21)->
    #dailyrechargeCfg {
    id = 21,
    day = 3,
    diamond = 12880,
    item = [{2105,10,0,0},{1902,10,0,0},{225,20,0,0},{2002,1,0,0},{2004,5,0,0}]
    };
getRow(22)->
    #dailyrechargeCfg {
    id = 22,
    day = 4,
    diamond = 60,
    item = [{222,5,0,0},{617,1,0,0},{902,6,0,0},{2002,1,0,0}]
    };
getRow(23)->
    #dailyrechargeCfg {
    id = 23,
    day = 4,
    diamond = 300,
    item = [{222,10,0,0},{1903,5,0,0},{904,3,0,0},{2022,5,0,0}]
    };
getRow(24)->
    #dailyrechargeCfg {
    id = 24,
    day = 4,
    diamond = 980,
    item = [{222,15,0,0},{617,2,0,0},{223,5,0,0},{2004,5,0,0}]
    };
getRow(25)->
    #dailyrechargeCfg {
    id = 25,
    day = 4,
    diamond = 1980,
    item = [{222,20,0,0},{1903,5,0,0},{2022,5,0,0},{2002,1,0,0}]
    };
getRow(26)->
    #dailyrechargeCfg {
    id = 26,
    day = 4,
    diamond = 3280,
    item = [{224,10,0,0},{617,4,0,0},{223,10,0,0},{2004,5,0,0}]
    };
getRow(27)->
    #dailyrechargeCfg {
    id = 27,
    day = 4,
    diamond = 6480,
    item = [{224,15,0,0},{1903,10,0,0},{2004,5,0,0}]
    };
getRow(28)->
    #dailyrechargeCfg {
    id = 28,
    day = 4,
    diamond = 12880,
    item = [{224,20,0,0},{1902,10,0,0},{223,15,0,0},{2002,1,0,0},{2004,5,0,0}]
    };
getRow(29)->
    #dailyrechargeCfg {
    id = 29,
    day = 5,
    diamond = 60,
    item = [{2160,5,0,0},{617,1,0,0},{902,6,0,0},{2002,1,0,0}]
    };
getRow(30)->
    #dailyrechargeCfg {
    id = 30,
    day = 5,
    diamond = 300,
    item = [{2160,10,0,0},{1901,5,0,0},{904,3,0,0},{2022,5,0,0}]
    };
getRow(31)->
    #dailyrechargeCfg {
    id = 31,
    day = 5,
    diamond = 980,
    item = [{2160,15,0,0},{617,2,0,0},{201,5,0,0},{2004,5,0,0}]
    };
getRow(32)->
    #dailyrechargeCfg {
    id = 32,
    day = 5,
    diamond = 1980,
    item = [{2161,10,0,0},{1901,5,0,0},{2022,5,0,0},{2002,1,0,0}]
    };
getRow(33)->
    #dailyrechargeCfg {
    id = 33,
    day = 5,
    diamond = 3280,
    item = [{2161,15,0,0},{617,4,0,0},{201,10,0,0},{2004,5,0,0}]
    };
getRow(34)->
    #dailyrechargeCfg {
    id = 34,
    day = 5,
    diamond = 6480,
    item = [{2161,20,0,0},{1901,10,0,0},{2004,5,0,0}]
    };
getRow(35)->
    #dailyrechargeCfg {
    id = 35,
    day = 5,
    diamond = 12880,
    item = [{2162,10,0,0},{1902,10,0,0},{201,15,0,0},{2002,1,0,0},{2004,5,0,0}]
    };
getRow(36)->
    #dailyrechargeCfg {
    id = 36,
    day = 6,
    diamond = 60,
    item = [{2102,5,0,0},{617,1,0,0},{902,6,0,0},{2002,1,0,0}]
    };
getRow(37)->
    #dailyrechargeCfg {
    id = 37,
    day = 6,
    diamond = 300,
    item = [{2102,10,0,0},{1903,5,0,0},{904,3,0,0},{2022,5,0,0}]
    };
getRow(38)->
    #dailyrechargeCfg {
    id = 38,
    day = 6,
    diamond = 980,
    item = [{2102,15,0,0},{617,2,0,0},{225,5,0,0},{2004,5,0,0}]
    };
getRow(39)->
    #dailyrechargeCfg {
    id = 39,
    day = 6,
    diamond = 1980,
    item = [{2104,10,0,0},{1903,5,0,0},{2022,5,0,0},{2002,1,0,0}]
    };
getRow(40)->
    #dailyrechargeCfg {
    id = 40,
    day = 6,
    diamond = 3280,
    item = [{2104,15,0,0},{617,4,0,0},{225,10,0,0},{2004,5,0,0}]
    };
getRow(41)->
    #dailyrechargeCfg {
    id = 41,
    day = 6,
    diamond = 6480,
    item = [{2104,20,0,0},{1903,10,0,0},{2004,5,0,0}]
    };
getRow(42)->
    #dailyrechargeCfg {
    id = 42,
    day = 6,
    diamond = 12880,
    item = [{2105,10,0,0},{1902,10,0,0},{225,20,0,0},{2002,1,0,0},{2004,5,0,0}]
    };
getRow(43)->
    #dailyrechargeCfg {
    id = 43,
    day = 7,
    diamond = 60,
    item = [{272,1,0,0},{617,1,0,0},{902,6,0,0},{2002,1,0,0}]
    };
getRow(44)->
    #dailyrechargeCfg {
    id = 44,
    day = 7,
    diamond = 300,
    item = [{272,2,0,0},{1901,5,0,0},{904,3,0,0},{2022,5,0,0}]
    };
getRow(45)->
    #dailyrechargeCfg {
    id = 45,
    day = 7,
    diamond = 980,
    item = [{272,3,0,0},{617,2,0,0},{4201,3,0,0},{2004,5,0,0}]
    };
getRow(46)->
    #dailyrechargeCfg {
    id = 46,
    day = 7,
    diamond = 1980,
    item = [{272,4,0,0},{1901,5,0,0},{2022,5,0,0},{2002,1,0,0}]
    };
getRow(47)->
    #dailyrechargeCfg {
    id = 47,
    day = 7,
    diamond = 3280,
    item = [{273,1,0,0},{617,4,0,0},{4201,3,0,0},{2004,5,0,0}]
    };
getRow(48)->
    #dailyrechargeCfg {
    id = 48,
    day = 7,
    diamond = 6480,
    item = [{273,2,0,0},{1901,10,0,0},{2004,5,0,0}]
    };
getRow(49)->
    #dailyrechargeCfg {
    id = 49,
    day = 7,
    diamond = 12880,
    item = [{273,2,0,0},{1902,10,0,0},{4202,3,0,0},{2002,1,0,0},{2004,5,0,0}]
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
    {49}
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
    49
    ].

