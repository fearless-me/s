%% coding: latin-1
%%: 实现
-module(cfg_treasure_map_chs).
-compile(export_all).
-include("cfg_treasure_map.hrl").
-include("logger.hrl").

getRow(1)->
    #treasure_mapCfg {
    id = 1,
    map = 4,
    coordinate = [{102,96},{102,81},{101,55},{91,63},{72,51},{53,47},{63,69},{52,93}]
    };
getRow(2)->
    #treasure_mapCfg {
    id = 2,
    map = 5,
    coordinate = [{22,64},{13,62},{26,43},{21,17},{30,16},{52,29},{80,22},{50,61},{66,63}]
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2}
    ].

get1KeyList()->[
    1,
    2
    ].

