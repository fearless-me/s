%% coding: latin-1
%%: 实现
-module(cfg_rechargeAccumulation_chs).
-compile(export_all).
-include("cfg_rechargeAccumulation.hrl").
-include("logger.hrl").

getRow(1)->
    #rechargeAccumulationCfg {
    id = 1,
    diamond = 10,
    item_1 = [{31600,4,1,1},{31602,4,2,1},{31604,4,3,1},{31606,4,4,1},{50239,4,5,1},{614,5,0,0},{4200,1,0,0},{222,10,0,0}]
    };
getRow(2)->
    #rechargeAccumulationCfg {
    id = 2,
    diamond = 180,
    item_1 = [{31592,4,1,1},{31594,4,2,1},{31596,4,3,1},{31598,4,4,1},{50238,4,5,1},{614,10,0,0},{4200,2,0,0},{222,20,0,0}]
    };
getRow(3)->
    #rechargeAccumulationCfg {
    id = 3,
    diamond = 580,
    item_1 = [{31585,4,1,1},{31587,4,2,1},{31589,4,3,1},{31591,4,4,1},{50241,4,5,1},{614,15,0,0},{1901,1,0,0},{222,30,0,0}]
    };
getRow(4)->
    #rechargeAccumulationCfg {
    id = 4,
    diamond = 1280,
    item_1 = [{31577,4,1,1},{31579,4,2,1},{31581,4,3,1},{31583,4,4,1},{50240,4,5,1},{615,8,0,0},{2160,10,0,0},{222,50,0,0}]
    };
getRow(5)->
    #rechargeAccumulationCfg {
    id = 5,
    diamond = 3980,
    item_1 = [{31601,4,1,1},{31603,4,2,1},{31605,4,3,1},{31607,4,4,1},{50243,4,5,1},{615,10,0,0},{4200,4,0,0},{2160,20,0,0}]
    };
getRow(6)->
    #rechargeAccumulationCfg {
    id = 6,
    diamond = 6480,
    item_1 = [{31593,4,1,1},{31595,4,2,1},{31597,4,3,1},{31599,4,4,1},{50242,4,5,1},{615,12,0,0},{4200,5,0,0},{2160,30,0,0}]
    };
getRow(7)->
    #rechargeAccumulationCfg {
    id = 7,
    diamond = 9980,
    item_1 = [{274,1,0,0},{616,7,0,0},{1901,1,0,1},{2162,3,0,0}]
    };
getRow(8)->
    #rechargeAccumulationCfg {
    id = 8,
    diamond = 19980,
    item_1 = [{274,2,0,0},{616,8,0,0},{4203,1,0,0},{224,20,0,0}]
    };
getRow(9)->
    #rechargeAccumulationCfg {
    id = 9,
    diamond = 29980,
    item_1 = [{274,3,0,0},{616,9,0,0},{4203,2,0,0},{2161,20,0,0}]
    };
getRow(10)->
    #rechargeAccumulationCfg {
    id = 10,
    diamond = 49980,
    item_1 = [{274,4,0,0},{616,10,0,0},{1901,1,0,1},{2162,10,0,0}]
    };
getRow(11)->
    #rechargeAccumulationCfg {
    id = 11,
    diamond = 99980,
    item_1 = [{275,1,0,1},{616,20,0,0},{4203,3,0,0},{224,60,0,0}]
    };
getRow(12)->
    #rechargeAccumulationCfg {
    id = 12,
    diamond = 199980,
    item_1 = [{275,2,0,1},{616,25,0,0},{4207,2,0,1},{2162,20,0,0}]
    };
getRow(13)->
    #rechargeAccumulationCfg {
    id = 13,
    diamond = 299980,
    item_1 = [{276,1,0,1},{2151,1,0,0},{616,50,0,0},{1901,1,0,1},{224,120,0,0}]
    };
getRow(14)->
    #rechargeAccumulationCfg {
    id = 14,
    diamond = 399980,
    item_1 = [{277,4,0,1},{616,75,0,0},{1901,1,0,1},{224,240,0,0}]
    };
getRow(15)->
    #rechargeAccumulationCfg {
    id = 15,
    diamond = 599980,
    item_1 = [{277,8,0,1},{616,100,0,0},{1901,1,0,1},{224,360,0,0}]
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
    {15}
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
    15
    ].

