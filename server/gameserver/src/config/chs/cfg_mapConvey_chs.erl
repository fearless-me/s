%% coding: latin-1
%%: 实现
-module(cfg_mapConvey_chs).
-compile(export_all).
-include("cfg_mapConvey.hrl").
-include("logger.hrl").

getRow(1)->
    #mapConveyCfg {
    id = 1,
    mapId = 1,
    isConvey = 1,
    opencondition = 0,
    sparameter = 1
    };
getRow(2)->
    #mapConveyCfg {
    id = 2,
    mapId = 2,
    isConvey = 1,
    opencondition = 0,
    sparameter = 1
    };
getRow(3)->
    #mapConveyCfg {
    id = 3,
    mapId = 3,
    isConvey = 1,
    opencondition = 0,
    sparameter = 1
    };
getRow(4)->
    #mapConveyCfg {
    id = 4,
    mapId = 4,
    isConvey = 1,
    opencondition = 0,
    sparameter = 1
    };
getRow(5)->
    #mapConveyCfg {
    id = 5,
    mapId = 5,
    isConvey = 1,
    opencondition = 0,
    sparameter = 1
    };
getRow(6)->
    #mapConveyCfg {
    id = 6,
    mapId = 6,
    isConvey = 1,
    opencondition = 0,
    sparameter = 1
    };
getRow(7)->
    #mapConveyCfg {
    id = 7,
    mapId = 7,
    isConvey = 1,
    opencondition = 0,
    sparameter = 1
    };
getRow(8)->
    #mapConveyCfg {
    id = 8,
    mapId = 8,
    isConvey = 1,
    opencondition = 0,
    sparameter = 1
    };
getRow(9)->
    #mapConveyCfg {
    id = 9,
    mapId = 9,
    isConvey = 1,
    opencondition = 0,
    sparameter = 1
    };
getRow(10)->
    #mapConveyCfg {
    id = 10,
    mapId = 10,
    isConvey = 1,
    opencondition = 0,
    sparameter = 1
    };
getRow(11)->
    #mapConveyCfg {
    id = 11,
    mapId = 11,
    isConvey = 1,
    opencondition = 0,
    sparameter = 1
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
    {11}
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
    11
    ].

