%% coding: latin-1
%%: 实现
-module(cfg_pet_territory_search_chs).
-compile(export_all).
-include("cfg_pet_territory_search.hrl").
-include("logger.hrl").

getRow(1)->
    #pet_territory_searchCfg {
    id = 1,
    coinUseType = 100,
    coinUseCount = 0
    };
getRow(2)->
    #pet_territory_searchCfg {
    id = 2,
    coinUseType = 100,
    coinUseCount = 0
    };
getRow(3)->
    #pet_territory_searchCfg {
    id = 3,
    coinUseType = 100,
    coinUseCount = 0
    };
getRow(4)->
    #pet_territory_searchCfg {
    id = 4,
    coinUseType = 100,
    coinUseCount = 10000
    };
getRow(5)->
    #pet_territory_searchCfg {
    id = 5,
    coinUseType = 100,
    coinUseCount = 20000
    };
getRow(6)->
    #pet_territory_searchCfg {
    id = 6,
    coinUseType = 100,
    coinUseCount = 50000
    };
getRow(7)->
    #pet_territory_searchCfg {
    id = 7,
    coinUseType = 103,
    coinUseCount = 20
    };
getRow(8)->
    #pet_territory_searchCfg {
    id = 8,
    coinUseType = 103,
    coinUseCount = 30
    };
getRow(9)->
    #pet_territory_searchCfg {
    id = 9,
    coinUseType = 103,
    coinUseCount = 40
    };
getRow(10)->
    #pet_territory_searchCfg {
    id = 10,
    coinUseType = 103,
    coinUseCount = 50
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
    {10}
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
    10
    ].

