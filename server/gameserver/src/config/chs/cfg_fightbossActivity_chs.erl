%% coding: latin-1
%%: 实现
-module(cfg_fightbossActivity_chs).
-compile(export_all).
-include("cfg_fightbossActivity.hrl").
-include("logger.hrl").

getRow(1)->
    #fightbossActivityCfg {
    mapid = 1,
    coordinate = [53.7,40.4]
    };
getRow(2)->
    #fightbossActivityCfg {
    mapid = 2,
    coordinate = [58.5,121.7]
    };
getRow(3)->
    #fightbossActivityCfg {
    mapid = 3,
    coordinate = [94.4,121.1]
    };
getRow(4)->
    #fightbossActivityCfg {
    mapid = 4,
    coordinate = [61.5,78.3]
    };
getRow(5)->
    #fightbossActivityCfg {
    mapid = 5,
    coordinate = [51.1,28.8]
    };
getRow(6)->
    #fightbossActivityCfg {
    mapid = 6,
    coordinate = [134.2,87.2]
    };
getRow(7)->
    #fightbossActivityCfg {
    mapid = 7,
    coordinate = [61.1,48.2]
    };
getRow(8)->
    #fightbossActivityCfg {
    mapid = 8,
    coordinate = [14.5,9.1]
    };
getRow(9)->
    #fightbossActivityCfg {
    mapid = 9,
    coordinate = [24.7,45.0]
    };
getRow(10)->
    #fightbossActivityCfg {
    mapid = 10,
    coordinate = [36.3,49.1]
    };
getRow(11)->
    #fightbossActivityCfg {
    mapid = 11,
    coordinate = [60.8,32.6]
    };
getRow(12)->
    #fightbossActivityCfg {
    mapid = 12,
    coordinate = [47.6,45.9]
    };
getRow(13)->
    #fightbossActivityCfg {
    mapid = 13,
    coordinate = [53.4,73.9]
    };
getRow(14)->
    #fightbossActivityCfg {
    mapid = 14,
    coordinate = [35.4,67.0]
    };
getRow(15)->
    #fightbossActivityCfg {
    mapid = 15,
    coordinate = [47.1,86.8]
    };
getRow(16)->
    #fightbossActivityCfg {
    mapid = 16,
    coordinate = [64.6,77.8]
    };
getRow(17)->
    #fightbossActivityCfg {
    mapid = 17,
    coordinate = [84.1,109.2]
    };
getRow(18)->
    #fightbossActivityCfg {
    mapid = 18,
    coordinate = [88.1,48.3]
    };
getRow(19)->
    #fightbossActivityCfg {
    mapid = 19,
    coordinate = [88.6,79.3]
    };
getRow(20)->
    #fightbossActivityCfg {
    mapid = 20,
    coordinate = [91.8,88.1]
    };
getRow(21)->
    #fightbossActivityCfg {
    mapid = 201,
    coordinate = [85.5,78.3]
    };
getRow(22)->
    #fightbossActivityCfg {
    mapid = 200,
    coordinate = [85.5,75.5]
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
    {22}
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
    22
    ].

