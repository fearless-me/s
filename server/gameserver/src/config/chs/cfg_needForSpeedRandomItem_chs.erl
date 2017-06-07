%% coding: latin-1
%%: 实现
-module(cfg_needForSpeedRandomItem_chs).
-compile(export_all).
-include("cfg_needForSpeedRandomItem.hrl").
-include("logger.hrl").

getRow(1)->
    #needForSpeedRandomItemCfg {
    id = 1,
    item_weight_list = [{2500,100},{2501,100},{2502,100},{2503,100},{2504,100}]
    };
getRow(2)->
    #needForSpeedRandomItemCfg {
    id = 2,
    item_weight_list = [{2500,100},{2501,500},{2502,500},{2503,100},{2504,100}]
    };
getRow(3)->
    #needForSpeedRandomItemCfg {
    id = 3,
    item_weight_list = [{2500,100},{2501,700},{2502,700},{2503,100},{2504,100}]
    };
getRow(4)->
    #needForSpeedRandomItemCfg {
    id = 4,
    item_weight_list = [{2500,100},{2501,700},{2502,700},{2503,100},{2504,100}]
    };
getRow(5)->
    #needForSpeedRandomItemCfg {
    id = 5,
    item_weight_list = [{2500,100},{2501,700},{2502,700},{2503,100},{2504,100}]
    };
getRow(6)->
    #needForSpeedRandomItemCfg {
    id = 6,
    item_weight_list = [{2500,100},{2501,700},{2502,700},{2503,100},{2504,100}]
    };
getRow(7)->
    #needForSpeedRandomItemCfg {
    id = 7,
    item_weight_list = [{2500,100},{2501,1000},{2502,1000},{2503,100},{2504,100}]
    };
getRow(8)->
    #needForSpeedRandomItemCfg {
    id = 8,
    item_weight_list = [{2500,100},{2501,1000},{2502,1000},{2503,100},{2504,100}]
    };
getRow(9)->
    #needForSpeedRandomItemCfg {
    id = 9,
    item_weight_list = [{2500,100},{2501,1000},{2502,1000},{2503,100},{2504,100}]
    };
getRow(10)->
    #needForSpeedRandomItemCfg {
    id = 10,
    item_weight_list = [{2500,100},{2501,1000},{2502,1000},{2503,100},{2504,100}]
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

