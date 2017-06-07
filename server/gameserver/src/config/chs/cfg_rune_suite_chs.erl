%% coding: latin-1
%%: 实现
-module(cfg_rune_suite_chs).
-compile(export_all).
-include("cfg_rune_suite.hrl").
-include("logger.hrl").

getRow(100000,2)->
    #rune_suiteCfg {
    id = 100000,
    num = 2,
    property = [{30,200,0}],
    dec = "神圣伤害+ 200",
    addpower = 1.3
    };
getRow(100000,3)->
    #rune_suiteCfg {
    id = 100000,
    num = 3,
    property = [{30,200,0}],
    dec = "神圣伤害+ 200",
    addpower = 1.3
    };
getRow(100000,5)->
    #rune_suiteCfg {
    id = 100000,
    num = 5,
    property = [{30,200,0},{31,200,0}],
    dec = "神圣伤害+ 200，物理伤害+200",
    addpower = 1.3
    };
getRow(_,_)->[].

getKeyList()->[
    {100000,2},
    {100000,3},
    {100000,5}
    ].

get1KeyList()->[
    100000
    ].

get2KeyList(100000)->[
    2,
    3,
    5
    ];
get2KeyList(_)->[].

