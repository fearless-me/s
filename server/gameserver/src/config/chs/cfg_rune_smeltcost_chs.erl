%% coding: latin-1
%%: 实现
-module(cfg_rune_smeltcost_chs).
-compile(export_all).
-include("cfg_rune_smeltcost.hrl").
-include("logger.hrl").

getRow(1)->
    #rune_smeltcostCfg {
    id = 1,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 500
    };
getRow(2)->
    #rune_smeltcostCfg {
    id = 2,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 600
    };
getRow(3)->
    #rune_smeltcostCfg {
    id = 3,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 700
    };
getRow(4)->
    #rune_smeltcostCfg {
    id = 4,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 800
    };
getRow(5)->
    #rune_smeltcostCfg {
    id = 5,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 900
    };
getRow(6)->
    #rune_smeltcostCfg {
    id = 6,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 1000
    };
getRow(7)->
    #rune_smeltcostCfg {
    id = 7,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 1100
    };
getRow(8)->
    #rune_smeltcostCfg {
    id = 8,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 1200
    };
getRow(9)->
    #rune_smeltcostCfg {
    id = 9,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 1300
    };
getRow(10)->
    #rune_smeltcostCfg {
    id = 10,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 1400
    };
getRow(11)->
    #rune_smeltcostCfg {
    id = 11,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 1500
    };
getRow(12)->
    #rune_smeltcostCfg {
    id = 12,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 1600
    };
getRow(13)->
    #rune_smeltcostCfg {
    id = 13,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 1700
    };
getRow(14)->
    #rune_smeltcostCfg {
    id = 14,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 1800
    };
getRow(15)->
    #rune_smeltcostCfg {
    id = 15,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 1900
    };
getRow(16)->
    #rune_smeltcostCfg {
    id = 16,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 2000
    };
getRow(17)->
    #rune_smeltcostCfg {
    id = 17,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 2100
    };
getRow(18)->
    #rune_smeltcostCfg {
    id = 18,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 2200
    };
getRow(19)->
    #rune_smeltcostCfg {
    id = 19,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 2300
    };
getRow(20)->
    #rune_smeltcostCfg {
    id = 20,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 2400
    };
getRow(21)->
    #rune_smeltcostCfg {
    id = 21,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 2500
    };
getRow(22)->
    #rune_smeltcostCfg {
    id = 22,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 2600
    };
getRow(23)->
    #rune_smeltcostCfg {
    id = 23,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 2700
    };
getRow(24)->
    #rune_smeltcostCfg {
    id = 24,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 2800
    };
getRow(25)->
    #rune_smeltcostCfg {
    id = 25,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 2900
    };
getRow(26)->
    #rune_smeltcostCfg {
    id = 26,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 3000
    };
getRow(27)->
    #rune_smeltcostCfg {
    id = 27,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 3100
    };
getRow(28)->
    #rune_smeltcostCfg {
    id = 28,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 3200
    };
getRow(29)->
    #rune_smeltcostCfg {
    id = 29,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 3300
    };
getRow(30)->
    #rune_smeltcostCfg {
    id = 30,
    ratio_quality = [1,1.5,2,2.5,3,3.5],
    cost = 3400
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
    {20},
    {21},
    {22},
    {23},
    {24},
    {25},
    {26},
    {27},
    {28},
    {29},
    {30}
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
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30
    ].

