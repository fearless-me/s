%% coding: latin-1
%%: 实现
-module(cfg_openbag_chs).
-compile(export_all).
-include("cfg_openbag.hrl").
-include("logger.hrl").

getRow(1)->
    #openbagCfg {
    id = 1,
    needlevel = 25,
    needgold = [100,500]
    };
getRow(2)->
    #openbagCfg {
    id = 2,
    needlevel = 25,
    needgold = [100,1000]
    };
getRow(3)->
    #openbagCfg {
    id = 3,
    needlevel = 25,
    needgold = [100,2000]
    };
getRow(4)->
    #openbagCfg {
    id = 4,
    needlevel = 25,
    needgold = [100,4000]
    };
getRow(5)->
    #openbagCfg {
    id = 5,
    needlevel = 25,
    needgold = [100,8000]
    };
getRow(6)->
    #openbagCfg {
    id = 6,
    needlevel = 30,
    needgold = [100,15000]
    };
getRow(7)->
    #openbagCfg {
    id = 7,
    needlevel = 30,
    needgold = [100,30000]
    };
getRow(8)->
    #openbagCfg {
    id = 8,
    needlevel = 30,
    needgold = [100,50000]
    };
getRow(9)->
    #openbagCfg {
    id = 9,
    needlevel = 30,
    needgold = [100,80000]
    };
getRow(10)->
    #openbagCfg {
    id = 10,
    needlevel = 30,
    needgold = [100,100000]
    };
getRow(11)->
    #openbagCfg {
    id = 11,
    needlevel = 35,
    needgold = [100,200000]
    };
getRow(12)->
    #openbagCfg {
    id = 12,
    needlevel = 35,
    needgold = [100,400000]
    };
getRow(13)->
    #openbagCfg {
    id = 13,
    needlevel = 35,
    needgold = [100,600000]
    };
getRow(14)->
    #openbagCfg {
    id = 14,
    needlevel = 35,
    needgold = [100,800000]
    };
getRow(15)->
    #openbagCfg {
    id = 15,
    needlevel = 35,
    needgold = [100,1000000]
    };
getRow(16)->
    #openbagCfg {
    id = 16,
    needlevel = 40,
    needgold = [100,1000000]
    };
getRow(17)->
    #openbagCfg {
    id = 17,
    needlevel = 40,
    needgold = [100,1000000]
    };
getRow(18)->
    #openbagCfg {
    id = 18,
    needlevel = 40,
    needgold = [100,1000000]
    };
getRow(19)->
    #openbagCfg {
    id = 19,
    needlevel = 40,
    needgold = [100,1000000]
    };
getRow(20)->
    #openbagCfg {
    id = 20,
    needlevel = 40,
    needgold = [100,1000000]
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
    {12},
    {13},
    {14},
    {15},
    {16},
    {17},
    {18},
    {19},
    {20}
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
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20
    ].

