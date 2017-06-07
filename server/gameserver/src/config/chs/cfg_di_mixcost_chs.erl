%% coding: latin-1
%%: 实现
-module(cfg_di_mixcost_chs).
-compile(export_all).
-include("cfg_di_mixcost.hrl").
-include("logger.hrl").

getRow(1)->
    #di_mixcostCfg {
    id = 1,
    di_mixcost = 0
    };
getRow(2)->
    #di_mixcostCfg {
    id = 2,
    di_mixcost = 5000
    };
getRow(3)->
    #di_mixcostCfg {
    id = 3,
    di_mixcost = 15000
    };
getRow(4)->
    #di_mixcostCfg {
    id = 4,
    di_mixcost = 60000
    };
getRow(5)->
    #di_mixcostCfg {
    id = 5,
    di_mixcost = 100000
    };
getRow(6)->
    #di_mixcostCfg {
    id = 6,
    di_mixcost = 500000
    };
getRow(7)->
    #di_mixcostCfg {
    id = 7,
    di_mixcost = 800000
    };
getRow(8)->
    #di_mixcostCfg {
    id = 8,
    di_mixcost = 800000
    };
getRow(9)->
    #di_mixcostCfg {
    id = 9,
    di_mixcost = 800000
    };
getRow(10)->
    #di_mixcostCfg {
    id = 10,
    di_mixcost = 800000
    };
getRow(11)->
    #di_mixcostCfg {
    id = 11,
    di_mixcost = 800000
    };
getRow(12)->
    #di_mixcostCfg {
    id = 12,
    di_mixcost = 800000
    };
getRow(13)->
    #di_mixcostCfg {
    id = 13,
    di_mixcost = 800000
    };
getRow(14)->
    #di_mixcostCfg {
    id = 14,
    di_mixcost = 800000
    };
getRow(15)->
    #di_mixcostCfg {
    id = 15,
    di_mixcost = 800000
    };
getRow(16)->
    #di_mixcostCfg {
    id = 16,
    di_mixcost = 800000
    };
getRow(17)->
    #di_mixcostCfg {
    id = 17,
    di_mixcost = 800000
    };
getRow(18)->
    #di_mixcostCfg {
    id = 18,
    di_mixcost = 800000
    };
getRow(19)->
    #di_mixcostCfg {
    id = 19,
    di_mixcost = 800000
    };
getRow(20)->
    #di_mixcostCfg {
    id = 20,
    di_mixcost = 800000
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

