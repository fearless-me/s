%% coding: latin-1
%%: 实现
-module(cfg_home_zoo_chs).
-compile(export_all).
-include("cfg_home_zoo.hrl").
-include("logger.hrl").

getRow(1)->
    #home_zooCfg {
    zoo_level = 1,
    pet_num = 1,
    exp_get = [100,3],
    food_times = 1
    };
getRow(2)->
    #home_zooCfg {
    zoo_level = 2,
    pet_num = 2,
    exp_get = [100,3],
    food_times = 2
    };
getRow(3)->
    #home_zooCfg {
    zoo_level = 3,
    pet_num = 3,
    exp_get = [100,3],
    food_times = 3
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3}
    ].

get1KeyList()->[
    1,
    2,
    3
    ].

