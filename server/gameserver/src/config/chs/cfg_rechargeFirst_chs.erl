%% coding: latin-1
%%: 实现
-module(cfg_rechargeFirst_chs).
-compile(export_all).
-include("cfg_rechargeFirst.hrl").
-include("logger.hrl").

getRow(1)->
    #rechargeFirstCfg {
    id = 1,
    diamond = 60,
    item_1 = [{4300,1,0,1},{2150,10,0,0},{614,5,0,0},{1901,1,0,0},{2161,20,0,0}]
    };
getRow(2)->
    #rechargeFirstCfg {
    id = 2,
    diamond = 280,
    item_1 = [{222,10,1,1},{222,20,2,1},{224,30,3,1},{223,40,4,1},{223,40,5,1},{2150,15,0,0},{614,10,0,0},{222,20,0,0},{904,3,0,0}]
    };
getRow(3)->
    #rechargeFirstCfg {
    id = 3,
    diamond = 590,
    item_1 = [{225,50,0,1},{2150,20,0,0},{614,15,0,0},{222,50,0,0},{904,6,0,0}]
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3}
    ].

get1KeyList()->[
    1,
    2,
    3
    ].

