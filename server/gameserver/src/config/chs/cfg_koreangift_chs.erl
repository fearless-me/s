%% coding: latin-1
%%: 实现
-module(cfg_koreangift_chs).
-compile(export_all).
-include("cfg_koreangift.hrl").
-include("logger.hrl").

getRow(1)->
    #koreangiftCfg {
    id = 1,
    lv = 1,
    diamond = 1000
    };
getRow(2)->
    #koreangiftCfg {
    id = 2,
    lv = 10,
    diamond = 1000
    };
getRow(3)->
    #koreangiftCfg {
    id = 3,
    lv = 15,
    diamond = 1000
    };
getRow(4)->
    #koreangiftCfg {
    id = 4,
    lv = 20,
    diamond = 1000
    };
getRow(5)->
    #koreangiftCfg {
    id = 5,
    lv = 25,
    diamond = 1000
    };
getRow(6)->
    #koreangiftCfg {
    id = 6,
    lv = 30,
    diamond = 1000
    };
getRow(7)->
    #koreangiftCfg {
    id = 7,
    lv = 35,
    diamond = 1000
    };
getRow(8)->
    #koreangiftCfg {
    id = 8,
    lv = 40,
    diamond = 1000
    };
getRow(9)->
    #koreangiftCfg {
    id = 9,
    lv = 45,
    diamond = 1000
    };
getRow(10)->
    #koreangiftCfg {
    id = 10,
    lv = 50,
    diamond = 1000
    };
getRow(11)->
    #koreangiftCfg {
    id = 11,
    lv = 55,
    diamond = 1000
    };
getRow(12)->
    #koreangiftCfg {
    id = 12,
    lv = 60,
    diamond = 1000
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

