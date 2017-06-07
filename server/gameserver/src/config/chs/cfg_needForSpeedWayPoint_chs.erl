%% coding: latin-1
%%: 实现
-module(cfg_needForSpeedWayPoint_chs).
-compile(export_all).
-include("cfg_needForSpeedWayPoint.hrl").
-include("logger.hrl").

getRow(1)->
    #needForSpeedWayPointCfg {
    id = 1,
    waypoint = [111,182]
    };
getRow(2)->
    #needForSpeedWayPointCfg {
    id = 2,
    waypoint = [62,181]
    };
getRow(3)->
    #needForSpeedWayPointCfg {
    id = 3,
    waypoint = [39,166]
    };
getRow(4)->
    #needForSpeedWayPointCfg {
    id = 4,
    waypoint = [33,124]
    };
getRow(5)->
    #needForSpeedWayPointCfg {
    id = 5,
    waypoint = [27,64]
    };
getRow(6)->
    #needForSpeedWayPointCfg {
    id = 6,
    waypoint = [34,32]
    };
getRow(7)->
    #needForSpeedWayPointCfg {
    id = 7,
    waypoint = [67,31]
    };
getRow(8)->
    #needForSpeedWayPointCfg {
    id = 8,
    waypoint = [148,37]
    };
getRow(9)->
    #needForSpeedWayPointCfg {
    id = 9,
    waypoint = [194,93]
    };
getRow(10)->
    #needForSpeedWayPointCfg {
    id = 10,
    waypoint = [214,125]
    };
getRow(11)->
    #needForSpeedWayPointCfg {
    id = 11,
    waypoint = [202,144]
    };
getRow(12)->
    #needForSpeedWayPointCfg {
    id = 12,
    waypoint = [171,128]
    };
getRow(13)->
    #needForSpeedWayPointCfg {
    id = 13,
    waypoint = [156,156]
    };
getRow(14)->
    #needForSpeedWayPointCfg {
    id = 14,
    waypoint = [180,182]
    };
getRow(15)->
    #needForSpeedWayPointCfg {
    id = 15,
    waypoint = [212,199]
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
    {15}
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
    15
    ].

