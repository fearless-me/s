%% coding: latin-1
%%: 实现
-module(cfg_pet_territory_level_chs).
-compile(export_all).
-include("cfg_pet_territory_level.hrl").
-include("logger.hrl").

getRow(1)->
    #pet_territory_levelCfg {
    id = 1,
    coinUseType = 100,
    coinUseCount = 10000,
    rate = 1,
    text = "普通级"
    };
getRow(2)->
    #pet_territory_levelCfg {
    id = 2,
    coinUseType = 103,
    coinUseCount = 100,
    rate = 1.3,
    text = "黄金级"
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

