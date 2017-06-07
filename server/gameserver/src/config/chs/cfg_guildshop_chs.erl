%% coding: latin-1
%%: 实现
-module(cfg_guildshop_chs).
-compile(export_all).
-include("cfg_guildshop.hrl").
-include("logger.hrl").

getRow(1)->
    #guildshopCfg {
    id = 1,
    itemID = 2160,
    cost = 80,
    needLevel = 1
    };
getRow(2)->
    #guildshopCfg {
    id = 2,
    itemID = 2161,
    cost = 160,
    needLevel = 2
    };
getRow(3)->
    #guildshopCfg {
    id = 3,
    itemID = 2162,
    cost = 320,
    needLevel = 3
    };
getRow(4)->
    #guildshopCfg {
    id = 4,
    itemID = 222,
    cost = 50,
    needLevel = 1
    };
getRow(5)->
    #guildshopCfg {
    id = 5,
    itemID = 224,
    cost = 150,
    needLevel = 2
    };
getRow(6)->
    #guildshopCfg {
    id = 6,
    itemID = 229,
    cost = 400,
    needLevel = 3
    };
getRow(7)->
    #guildshopCfg {
    id = 7,
    itemID = 1854,
    cost = 200,
    needLevel = 3
    };
getRow(8)->
    #guildshopCfg {
    id = 8,
    itemID = 1859,
    cost = 600,
    needLevel = 4
    };
getRow(9)->
    #guildshopCfg {
    id = 9,
    itemID = 27040,
    cost = 1750,
    needLevel = 2
    };
getRow(10)->
    #guildshopCfg {
    id = 10,
    itemID = 27041,
    cost = 1750,
    needLevel = 2
    };
getRow(11)->
    #guildshopCfg {
    id = 11,
    itemID = 27042,
    cost = 1750,
    needLevel = 2
    };
getRow(12)->
    #guildshopCfg {
    id = 12,
    itemID = 27043,
    cost = 1750,
    needLevel = 2
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
    {11},
    {12}
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
    11,
    12
    ].

