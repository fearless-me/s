%% coding: latin-1
%%: 实现
-module(cfg_petreborn_chs).
-compile(export_all).
-include("cfg_petreborn.hrl").
-include("logger.hrl").

getRow(1,0)->
    #petrebornCfg {
    groupid = 1,
    lv = 0,
    star_up = 0,
    reborn = 0,
    star = 0,
    quanlity = 1.1
    };
getRow(1,1)->
    #petrebornCfg {
    groupid = 1,
    lv = 1,
    star_up = 0,
    reborn = 0.2,
    star = 0.098,
    item_star = [{2160,5}],
    quanlity = 1.1
    };
getRow(1,2)->
    #petrebornCfg {
    groupid = 1,
    lv = 2,
    star_up = 0,
    reborn = 0.35,
    star = 0.195,
    item_star = [{2160,8}],
    quanlity = 1.1
    };
getRow(1,3)->
    #petrebornCfg {
    groupid = 1,
    lv = 3,
    star_up = 0,
    reborn = 0.5,
    star = 0.293,
    item_star = [{2160,11}],
    quanlity = 1.1
    };
getRow(1,4)->
    #petrebornCfg {
    groupid = 1,
    lv = 4,
    star_up = 0,
    reborn = 0.6,
    star = 0.39,
    item_star = [{2160,14}],
    quanlity = 1.1
    };
getRow(1,5)->
    #petrebornCfg {
    groupid = 1,
    lv = 5,
    star_up = 1,
    reborn = 0.7,
    star = 0.683,
    item_star = [{2160,20}],
    quanlity = 1.1
    };
getRow(1,6)->
    #petrebornCfg {
    groupid = 1,
    lv = 6,
    star_up = 0,
    reborn = 0,
    star = 0.793,
    item_star = [{2160,26}],
    quanlity = 1.1
    };
getRow(1,7)->
    #petrebornCfg {
    groupid = 1,
    lv = 7,
    star_up = 0,
    reborn = 0,
    star = 0.904,
    item_star = [{2160,32}],
    quanlity = 1.1
    };
getRow(1,8)->
    #petrebornCfg {
    groupid = 1,
    lv = 8,
    star_up = 0,
    reborn = 0,
    star = 1.014,
    item_star = [{2160,38}],
    quanlity = 1.1
    };
getRow(1,9)->
    #petrebornCfg {
    groupid = 1,
    lv = 9,
    star_up = 0,
    reborn = 0,
    star = 1.125,
    item_star = [{2160,44}],
    quanlity = 1.1
    };
getRow(1,10)->
    #petrebornCfg {
    groupid = 1,
    lv = 10,
    star_up = 1,
    reborn = 0,
    star = 1.755,
    item_star = [{2160,50}],
    quanlity = 1.1
    };
getRow(1,11)->
    #petrebornCfg {
    groupid = 1,
    lv = 11,
    star_up = 0,
    reborn = 0,
    star = 1.885,
    item_star = [{2160,56}],
    quanlity = 1.1
    };
getRow(1,12)->
    #petrebornCfg {
    groupid = 1,
    lv = 12,
    star_up = 0,
    reborn = 0,
    star = 2.015,
    item_star = [{2160,62}],
    quanlity = 1.1
    };
getRow(1,13)->
    #petrebornCfg {
    groupid = 1,
    lv = 13,
    star_up = 0,
    reborn = 0,
    star = 2.145,
    item_star = [{2160,68}],
    quanlity = 1.1
    };
getRow(1,14)->
    #petrebornCfg {
    groupid = 1,
    lv = 14,
    star_up = 0,
    reborn = 0,
    star = 2.275,
    item_star = [{2160,74}],
    quanlity = 1.1
    };
getRow(1,15)->
    #petrebornCfg {
    groupid = 1,
    lv = 15,
    star_up = 1,
    reborn = 0,
    star = 3.055,
    item_star = [{2160,82}],
    quanlity = 1.1
    };
getRow(1,16)->
    #petrebornCfg {
    groupid = 1,
    lv = 16,
    star_up = 0,
    reborn = 0,
    star = 3.205,
    item_star = [{2161,30}],
    quanlity = 1.1
    };
getRow(1,17)->
    #petrebornCfg {
    groupid = 1,
    lv = 17,
    star_up = 0,
    reborn = 0,
    star = 3.354,
    item_star = [{2161,33}],
    quanlity = 1.1
    };
getRow(1,18)->
    #petrebornCfg {
    groupid = 1,
    lv = 18,
    star_up = 0,
    reborn = 0,
    star = 3.504,
    item_star = [{2161,35}],
    quanlity = 1.1
    };
getRow(1,19)->
    #petrebornCfg {
    groupid = 1,
    lv = 19,
    star_up = 0,
    reborn = 0,
    star = 3.653,
    item_star = [{2161,38}],
    quanlity = 1.1
    };
getRow(1,20)->
    #petrebornCfg {
    groupid = 1,
    lv = 20,
    star_up = 1,
    reborn = 0,
    star = 4.583,
    item_star = [{2161,41}],
    quanlity = 1.1
    };
getRow(1,21)->
    #petrebornCfg {
    groupid = 1,
    lv = 21,
    star_up = 0,
    reborn = 0,
    star = 4.745,
    item_star = [{2161,45}],
    quanlity = 1.1
    };
getRow(1,22)->
    #petrebornCfg {
    groupid = 1,
    lv = 22,
    star_up = 0,
    reborn = 0,
    star = 4.908,
    item_star = [{2161,48}],
    quanlity = 1.1
    };
getRow(1,23)->
    #petrebornCfg {
    groupid = 1,
    lv = 23,
    star_up = 0,
    reborn = 0,
    star = 5.07,
    item_star = [{2161,51}],
    quanlity = 1.1
    };
getRow(1,24)->
    #petrebornCfg {
    groupid = 1,
    lv = 24,
    star_up = 0,
    reborn = 0,
    star = 5.233,
    item_star = [{2161,55}],
    quanlity = 1.1
    };
getRow(_,_)->[].

getKeyList()->[
    {1,0},
    {1,1},
    {1,2},
    {1,3},
    {1,4},
    {1,5},
    {1,6},
    {1,7},
    {1,8},
    {1,9},
    {1,10},
    {1,11},
    {1,12},
    {1,13},
    {1,14},
    {1,15},
    {1,16},
    {1,17},
    {1,18},
    {1,19},
    {1,20},
    {1,21},
    {1,22},
    {1,23},
    {1,24}
    ].

get1KeyList()->[
    1
    ].

get2KeyList(1)->[
    0,
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
    24
    ];
get2KeyList(_)->[].

