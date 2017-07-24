%% coding: latin-1
%%: 实现
-module(cfg_home_level_chs).
-compile(export_all).
-include("cfg_home_level.hrl").
-include("logger.hrl").

getRow(1)->
    #home_levelCfg {
    id = 1,
    name = "1级家园",
    stylish = 1000,
    comfort = 5000
    };
getRow(2)->
    #home_levelCfg {
    id = 2,
    name = "2级家园",
    stylish = 2000,
    comfort = 7000
    };
getRow(3)->
    #home_levelCfg {
    id = 3,
    name = "3级家园",
    stylish = 3000,
    comfort = 9000
    };
getRow(4)->
    #home_levelCfg {
    id = 4,
    name = "4级家园",
    stylish = 4000,
    comfort = 11000
    };
getRow(5)->
    #home_levelCfg {
    id = 5,
    name = "5级家园",
    stylish = 5000,
    comfort = 13000
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5
    ].

