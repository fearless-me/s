%% coding: latin-1
%%: 实现
-module(cfg_rune_compound_chs).
-compile(export_all).
-include("cfg_rune_compound.hrl").
-include("logger.hrl").

getRow(1)->
    #rune_compoundCfg {
    id = 1,
    desc = "初级原石",
    material = [{7013,10},{3220,10},{3221,10}],
    dropid = 50000,
    cost = 10000
    };
getRow(2)->
    #rune_compoundCfg {
    id = 2,
    desc = "中级原石",
    material = [{7013,10},{3220,10},{3222,10}],
    dropid = 50001,
    cost = 100000
    };
getRow(3)->
    #rune_compoundCfg {
    id = 3,
    desc = "初级原石套装",
    material = [{7013,10},{3220,10},{3223,10}],
    dropid = 50000,
    cost = 10000
    };
getRow(4)->
    #rune_compoundCfg {
    id = 4,
    desc = "中级原石套装",
    material = [{7013,10},{3220,10},{3224,10}],
    dropid = 50001,
    cost = 100000
    };
getRow(5)->
    #rune_compoundCfg {
    id = 5,
    desc = "高级原石",
    material = [{7013,10},{3220,10},{3224,10},{3210,10}],
    dropid = 50000,
    cost = 1000000
    };
getRow(6)->
    #rune_compoundCfg {
    id = 6,
    desc = "高级原石套装",
    material = [{7013,10},{3220,10},{3224,10},{3211,10}],
    dropid = 50001,
    cost = 1000000
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

