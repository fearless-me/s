%% coding: latin-1
%%: 实现
-module(cfg_guildshop_chs).
-compile(export_all).
-include("cfg_guildshop.hrl").
-include("logger.hrl").

getRow(1)->
    #guildshopCfg {
    id = 1,
    itemID = 225,
    cost = 100,
    needLevel = 1
    };
getRow(2)->
    #guildshopCfg {
    id = 2,
    itemID = 226,
    cost = 300,
    needLevel = 1
    };
getRow(3)->
    #guildshopCfg {
    id = 3,
    itemID = 227,
    cost = 900,
    needLevel = 1
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
    needLevel = 1
    };
getRow(6)->
    #guildshopCfg {
    id = 6,
    itemID = 229,
    cost = 450,
    needLevel = 1
    };
getRow(7)->
    #guildshopCfg {
    id = 7,
    itemID = 270,
    cost = 200,
    needLevel = 1
    };
getRow(8)->
    #guildshopCfg {
    id = 8,
    itemID = 271,
    cost = 800,
    needLevel = 1
    };
getRow(9)->
    #guildshopCfg {
    id = 9,
    itemID = 272,
    cost = 3200,
    needLevel = 1
    };
getRow(10)->
    #guildshopCfg {
    id = 10,
    itemID = 28010,
    cost = 10000,
    needLevel = 1
    };
getRow(11)->
    #guildshopCfg {
    id = 11,
    itemID = 28011,
    cost = 10000,
    needLevel = 1
    };
getRow(12)->
    #guildshopCfg {
    id = 12,
    itemID = 1959,
    cost = 400,
    needLevel = 1
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

