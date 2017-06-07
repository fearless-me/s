%% coding: latin-1
%%: 实现
-module(cfg_logic_group_chs).
-compile(export_all).
-include("cfg_logic_group.hrl").
-include("logger.hrl").

getRow(1)->
    #logic_groupCfg {
    id = 1,
    logicIdList = [1,2,3,7]
    };
getRow(2)->
    #logic_groupCfg {
    id = 2,
    logicIdList = [4,5,6]
    };
getRow(3)->
    #logic_groupCfg {
    id = 3,
    logicIdList = [8,9]
    };
getRow(4)->
    #logic_groupCfg {
    id = 4,
    logicIdList = [9,10,11]
    };
getRow(5)->
    #logic_groupCfg {
    id = 5,
    logicIdList = [9,12,13]
    };
getRow(6)->
    #logic_groupCfg {
    id = 6,
    logicIdList = [9,14]
    };
getRow(7)->
    #logic_groupCfg {
    id = 7,
    logicIdList = [9,15,16]
    };
getRow(8)->
    #logic_groupCfg {
    id = 8,
    logicIdList = [9,17,18]
    };
getRow(9)->
    #logic_groupCfg {
    id = 9,
    logicIdList = [19,20,21,22]
    };
getRow(10)->
    #logic_groupCfg {
    id = 10,
    logicIdList = [23,24,25,26,48,53]
    };
getRow(11)->
    #logic_groupCfg {
    id = 11,
    logicIdList = [27]
    };
getRow(12)->
    #logic_groupCfg {
    id = 12,
    logicIdList = [28,29,30,31,32,33,34,38,39,40,41,44]
    };
getRow(13)->
    #logic_groupCfg {
    id = 13,
    logicIdList = [35,36,37]
    };
getRow(14)->
    #logic_groupCfg {
    id = 14,
    logicIdList = [42]
    };
getRow(15)->
    #logic_groupCfg {
    id = 15,
    logicIdList = [43]
    };
getRow(16)->
    #logic_groupCfg {
    id = 16,
    logicIdList = [45]
    };
getRow(17)->
    #logic_groupCfg {
    id = 17,
    logicIdList = [46,47]
    };
getRow(18)->
    #logic_groupCfg {
    id = 18,
    logicIdList = [49,50,51,52]
    };
getRow(19)->
    #logic_groupCfg {
    id = 19,
    logicIdList = [54,72,73,71]
    };
getRow(20)->
    #logic_groupCfg {
    id = 20,
    logicIdList = [55]
    };
getRow(21)->
    #logic_groupCfg {
    id = 21,
    logicIdList = [56,67,100]
    };
getRow(22)->
    #logic_groupCfg {
    id = 22,
    logicIdList = [57,62]
    };
getRow(23)->
    #logic_groupCfg {
    id = 23,
    logicIdList = [78,58]
    };
getRow(24)->
    #logic_groupCfg {
    id = 24,
    logicIdList = [59,63]
    };
getRow(25)->
    #logic_groupCfg {
    id = 25,
    logicIdList = [60]
    };
getRow(26)->
    #logic_groupCfg {
    id = 26,
    logicIdList = [61,64]
    };
getRow(27)->
    #logic_groupCfg {
    id = 27,
    logicIdList = [60]
    };
getRow(28)->
    #logic_groupCfg {
    id = 28,
    logicIdList = [65]
    };
getRow(29)->
    #logic_groupCfg {
    id = 29,
    logicIdList = [66]
    };
getRow(30)->
    #logic_groupCfg {
    id = 30,
    logicIdList = [77,69,68,74]
    };
getRow(31)->
    #logic_groupCfg {
    id = 31,
    logicIdList = [75,76]
    };
getRow(32)->
    #logic_groupCfg {
    id = 32,
    logicIdList = [79,80]
    };
getRow(33)->
    #logic_groupCfg {
    id = 33,
    logicIdList = [81]
    };
getRow(34)->
    #logic_groupCfg {
    id = 34,
    logicIdList = [82,88,94]
    };
getRow(35)->
    #logic_groupCfg {
    id = 35,
    logicIdList = [83,89,95]
    };
getRow(36)->
    #logic_groupCfg {
    id = 36,
    logicIdList = [84,90,96]
    };
getRow(37)->
    #logic_groupCfg {
    id = 37,
    logicIdList = [85,91,97]
    };
getRow(38)->
    #logic_groupCfg {
    id = 38,
    logicIdList = [86,92,98]
    };
getRow(39)->
    #logic_groupCfg {
    id = 39,
    logicIdList = [87,91,99]
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
    {39}
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
    39
    ].

