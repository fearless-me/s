%% coding: latin-1
%%: 实现
-module(cfg_needForSpeedRandomAward_chs).
-compile(export_all).
-include("cfg_needForSpeedRandomAward.hrl").
-include("logger.hrl").

getRow(1)->
    #needForSpeedRandomAwardCfg {
    id = 1,
    reward = [{1,50,1,1400,0}]
    };
getRow(2)->
    #needForSpeedRandomAwardCfg {
    id = 2,
    reward = [{1,50,1,1401,0}]
    };
getRow(3)->
    #needForSpeedRandomAwardCfg {
    id = 3,
    reward = [{1,50,1,1402,0}]
    };
getRow(4)->
    #needForSpeedRandomAwardCfg {
    id = 4,
    reward = [{1,50,1,1403,0}]
    };
getRow(5)->
    #needForSpeedRandomAwardCfg {
    id = 5,
    reward = [{1,50,1,1404,0}]
    };
getRow(6)->
    #needForSpeedRandomAwardCfg {
    id = 6,
    reward = [{1,50,1,1405,0}]
    };
getRow(7)->
    #needForSpeedRandomAwardCfg {
    id = 7,
    reward = [{1,50,1,1406,0}]
    };
getRow(8)->
    #needForSpeedRandomAwardCfg {
    id = 8,
    reward = [{1,50,1,1407,0}]
    };
getRow(9)->
    #needForSpeedRandomAwardCfg {
    id = 9,
    reward = [{1,50,1,1408,0}]
    };
getRow(10)->
    #needForSpeedRandomAwardCfg {
    id = 10,
    reward = [{1,50,1,1409,0}]
    };
getRow(11)->
    #needForSpeedRandomAwardCfg {
    id = 11,
    reward = [{1,50,1,1410,0}]
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

