%% coding: latin-1
%%: 实现
-module(cfg_ladder_item_chs).
-compile(export_all).
-include("cfg_ladder_item.hrl").
-include("logger.hrl").

getRow(1)->
    #ladder_itemCfg {
    id = 1,
    rank = "1",
    item = [{1926,10,1},{1920,5,1},{618,1,0}]
    };
getRow(2)->
    #ladder_itemCfg {
    id = 2,
    rank = "2",
    item = [{1926,3,1},{1920,5,1},{616,8,0}]
    };
getRow(3)->
    #ladder_itemCfg {
    id = 3,
    rank = "3",
    item = [{1926,1,1},{1920,5,1},{616,5,0}]
    };
getRow(4)->
    #ladder_itemCfg {
    id = 4,
    rank = "4-10",
    item = [{1920,3,1},{616,3,0}]
    };
getRow(5)->
    #ladder_itemCfg {
    id = 5,
    rank = "11-50",
    item = [{1920,2,1},{616,2,0}]
    };
getRow(6)->
    #ladder_itemCfg {
    id = 6,
    rank = "51-100",
    item = [{1920,1,1},{616,1,0}]
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6
    ].

