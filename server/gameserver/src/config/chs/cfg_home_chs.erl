%% coding: latin-1
%%: 实现
-module(cfg_home_chs).
-compile(export_all).
-include("cfg_home.hrl").
-include("logger.hrl").

getRow(1)->
    #homeCfg {
    id = 1,
    adminID = 1,
    name = "阿克勒城",
    mapIDs = [10001,10001,10001],
    courtyardMapIDs = [10000,10000,10000,10000,10000]
    };
getRow(2)->
    #homeCfg {
    id = 2,
    adminID = 2,
    name = "阿克勒港口",
    mapIDs = [10001,10001,10001],
    courtyardMapIDs = [10000,10000,10000,10000,10000]
    };
getRow(3)->
    #homeCfg {
    id = 3,
    adminID = 3,
    name = "阿克勒东城郊",
    mapIDs = [10001,10001,10001],
    courtyardMapIDs = [10000,10000,10000,10000,10000]
    };
getRow(4)->
    #homeCfg {
    id = 4,
    adminID = 4,
    name = "阿克勒平原",
    mapIDs = [10001,10001,10001],
    courtyardMapIDs = [10000,10000,10000,10000,10000]
    };
getRow(5)->
    #homeCfg {
    id = 5,
    adminID = 5,
    name = "苍空之塔",
    mapIDs = [10001,10001,10001],
    courtyardMapIDs = [10000,10000,10000,10000,10000]
    };
getRow(6)->
    #homeCfg {
    id = 6,
    adminID = 6,
    name = "海洋之心",
    mapIDs = [10001,10001,10001],
    courtyardMapIDs = [10000,10000,10000,10000,10000]
    };
getRow(7)->
    #homeCfg {
    id = 7,
    adminID = 7,
    name = "精灵故土",
    mapIDs = [10001,10001,10001],
    courtyardMapIDs = [10000,10000,10000,10000,10000]
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ].

