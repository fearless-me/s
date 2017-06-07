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
    reborn = 0.24,
    star = 0.03,
    item_star = [{2160,1}],
    quanlity = 1.1
    };
getRow(1,2)->
    #petrebornCfg {
    groupid = 1,
    lv = 2,
    star_up = 0,
    reborn = 0.49,
    star = 0.06,
    item_star = [{2160,3}],
    quanlity = 1.1
    };
getRow(1,3)->
    #petrebornCfg {
    groupid = 1,
    lv = 3,
    star_up = 0,
    reborn = 0.73,
    star = 0.09,
    item_star = [{2160,5}],
    quanlity = 1.1
    };
getRow(1,4)->
    #petrebornCfg {
    groupid = 1,
    lv = 4,
    star_up = 0,
    reborn = 0.98,
    star = 0.12,
    item_star = [{2160,7}],
    quanlity = 1.1
    };
getRow(1,5)->
    #petrebornCfg {
    groupid = 1,
    lv = 5,
    star_up = 1,
    reborn = 1.22,
    star = 0.18,
    item_star = [{2160,11}],
    quanlity = 1.1
    };
getRow(1,6)->
    #petrebornCfg {
    groupid = 1,
    lv = 6,
    star_up = 0,
    reborn = 0,
    star = 0.22,
    item_star = [{2160,7}],
    quanlity = 1.1
    };
getRow(1,7)->
    #petrebornCfg {
    groupid = 1,
    lv = 7,
    star_up = 0,
    reborn = 0,
    star = 0.26,
    item_star = [{2160,11}],
    quanlity = 1.1
    };
getRow(1,8)->
    #petrebornCfg {
    groupid = 1,
    lv = 8,
    star_up = 0,
    reborn = 0,
    star = 0.3,
    item_star = [{2160,15}],
    quanlity = 1.1
    };
getRow(1,9)->
    #petrebornCfg {
    groupid = 1,
    lv = 9,
    star_up = 0,
    reborn = 0,
    star = 0.34,
    item_star = [{2160,19}],
    quanlity = 1.1
    };
getRow(1,10)->
    #petrebornCfg {
    groupid = 1,
    lv = 10,
    star_up = 1,
    reborn = 0,
    star = 0.42,
    item_star = [{2160,27}],
    quanlity = 1.1
    };
getRow(1,11)->
    #petrebornCfg {
    groupid = 1,
    lv = 11,
    star_up = 0,
    reborn = 0,
    star = 0.49,
    item_star = [{2160,19}],
    quanlity = 1.1
    };
getRow(1,12)->
    #petrebornCfg {
    groupid = 1,
    lv = 12,
    star_up = 0,
    reborn = 0,
    star = 0.55,
    item_star = [{2160,28}],
    quanlity = 1.1
    };
getRow(1,13)->
    #petrebornCfg {
    groupid = 1,
    lv = 13,
    star_up = 0,
    reborn = 0,
    star = 0.62,
    item_star = [{2160,37}],
    quanlity = 1.1
    };
getRow(1,14)->
    #petrebornCfg {
    groupid = 1,
    lv = 14,
    star_up = 0,
    reborn = 0,
    star = 0.68,
    item_star = [{2160,46}],
    quanlity = 1.1
    };
getRow(1,15)->
    #petrebornCfg {
    groupid = 1,
    lv = 15,
    star_up = 1,
    reborn = 0,
    star = 0.81,
    item_star = [{2160,54}],
    quanlity = 1.1
    };
getRow(1,16)->
    #petrebornCfg {
    groupid = 1,
    lv = 16,
    star_up = 0,
    reborn = 0,
    star = 0.9,
    item_star = [{2160,46}],
    quanlity = 1.1
    };
getRow(1,17)->
    #petrebornCfg {
    groupid = 1,
    lv = 17,
    star_up = 0,
    reborn = 0,
    star = 0.99,
    item_star = [{2160,59}],
    quanlity = 1.1
    };
getRow(1,18)->
    #petrebornCfg {
    groupid = 1,
    lv = 18,
    star_up = 0,
    reborn = 0,
    star = 1.08,
    item_star = [{2160,72}],
    quanlity = 1.1
    };
getRow(1,19)->
    #petrebornCfg {
    groupid = 1,
    lv = 19,
    star_up = 0,
    reborn = 0,
    star = 1.17,
    item_star = [{2160,85}],
    quanlity = 1.1
    };
getRow(1,20)->
    #petrebornCfg {
    groupid = 1,
    lv = 20,
    star_up = 1,
    reborn = 0,
    star = 1.35,
    item_star = [{2160,111}],
    quanlity = 1.1
    };
getRow(1,21)->
    #petrebornCfg {
    groupid = 1,
    lv = 21,
    star_up = 0,
    reborn = 0,
    star = 1.48,
    item_star = [{2160,85}],
    quanlity = 1.1
    };
getRow(1,22)->
    #petrebornCfg {
    groupid = 1,
    lv = 22,
    star_up = 0,
    reborn = 0,
    star = 1.61,
    item_star = [{2160,102}],
    quanlity = 1.1
    };
getRow(1,23)->
    #petrebornCfg {
    groupid = 1,
    lv = 23,
    star_up = 0,
    reborn = 0,
    star = 1.74,
    item_star = [{2160,119}],
    quanlity = 1.1
    };
getRow(1,24)->
    #petrebornCfg {
    groupid = 1,
    lv = 24,
    star_up = 0,
    reborn = 0,
    star = 1.82,
    item_star = [{2160,136}],
    quanlity = 1.1
    };
getRow(2,0)->
    #petrebornCfg {
    groupid = 2,
    lv = 0,
    star_up = 0,
    reborn = 0,
    star = 0,
    quanlity = 1.1
    };
getRow(2,1)->
    #petrebornCfg {
    groupid = 2,
    lv = 1,
    star_up = 0,
    reborn = 0.24,
    star = 0.03,
    item_star = [{2161,1}],
    quanlity = 1.1
    };
getRow(2,2)->
    #petrebornCfg {
    groupid = 2,
    lv = 2,
    star_up = 0,
    reborn = 0.49,
    star = 0.06,
    item_star = [{2161,3}],
    quanlity = 1.1
    };
getRow(2,3)->
    #petrebornCfg {
    groupid = 2,
    lv = 3,
    star_up = 0,
    reborn = 0.73,
    star = 0.09,
    item_star = [{2161,5}],
    quanlity = 1.1
    };
getRow(2,4)->
    #petrebornCfg {
    groupid = 2,
    lv = 4,
    star_up = 0,
    reborn = 0.98,
    star = 0.12,
    item_star = [{2161,7}],
    quanlity = 1.1
    };
getRow(2,5)->
    #petrebornCfg {
    groupid = 2,
    lv = 5,
    star_up = 1,
    reborn = 1.22,
    star = 0.18,
    item_star = [{2161,11}],
    quanlity = 1.1
    };
getRow(2,6)->
    #petrebornCfg {
    groupid = 2,
    lv = 6,
    star_up = 0,
    reborn = 0,
    star = 0.22,
    item_star = [{2161,7}],
    quanlity = 1.1
    };
getRow(2,7)->
    #petrebornCfg {
    groupid = 2,
    lv = 7,
    star_up = 0,
    reborn = 0,
    star = 0.26,
    item_star = [{2161,11}],
    quanlity = 1.1
    };
getRow(2,8)->
    #petrebornCfg {
    groupid = 2,
    lv = 8,
    star_up = 0,
    reborn = 0,
    star = 0.3,
    item_star = [{2161,15}],
    quanlity = 1.1
    };
getRow(2,9)->
    #petrebornCfg {
    groupid = 2,
    lv = 9,
    star_up = 0,
    reborn = 0,
    star = 0.34,
    item_star = [{2161,19}],
    quanlity = 1.1
    };
getRow(2,10)->
    #petrebornCfg {
    groupid = 2,
    lv = 10,
    star_up = 1,
    reborn = 0,
    star = 0.42,
    item_star = [{2161,27}],
    quanlity = 1.1
    };
getRow(2,11)->
    #petrebornCfg {
    groupid = 2,
    lv = 11,
    star_up = 0,
    reborn = 0,
    star = 0.49,
    item_star = [{2161,19}],
    quanlity = 1.1
    };
getRow(2,12)->
    #petrebornCfg {
    groupid = 2,
    lv = 12,
    star_up = 0,
    reborn = 0,
    star = 0.55,
    item_star = [{2161,28}],
    quanlity = 1.1
    };
getRow(2,13)->
    #petrebornCfg {
    groupid = 2,
    lv = 13,
    star_up = 0,
    reborn = 0,
    star = 0.62,
    item_star = [{2161,37}],
    quanlity = 1.1
    };
getRow(2,14)->
    #petrebornCfg {
    groupid = 2,
    lv = 14,
    star_up = 0,
    reborn = 0,
    star = 0.68,
    item_star = [{2161,46}],
    quanlity = 1.1
    };
getRow(2,15)->
    #petrebornCfg {
    groupid = 2,
    lv = 15,
    star_up = 1,
    reborn = 0,
    star = 0.81,
    item_star = [{2161,54}],
    quanlity = 1.1
    };
getRow(2,16)->
    #petrebornCfg {
    groupid = 2,
    lv = 16,
    star_up = 0,
    reborn = 0,
    star = 0.9,
    item_star = [{2161,46}],
    quanlity = 1.1
    };
getRow(2,17)->
    #petrebornCfg {
    groupid = 2,
    lv = 17,
    star_up = 0,
    reborn = 0,
    star = 0.99,
    item_star = [{2161,59}],
    quanlity = 1.1
    };
getRow(2,18)->
    #petrebornCfg {
    groupid = 2,
    lv = 18,
    star_up = 0,
    reborn = 0,
    star = 1.08,
    item_star = [{2161,72}],
    quanlity = 1.1
    };
getRow(2,19)->
    #petrebornCfg {
    groupid = 2,
    lv = 19,
    star_up = 0,
    reborn = 0,
    star = 1.17,
    item_star = [{2161,85}],
    quanlity = 1.1
    };
getRow(2,20)->
    #petrebornCfg {
    groupid = 2,
    lv = 20,
    star_up = 1,
    reborn = 0,
    star = 1.35,
    item_star = [{2161,111}],
    quanlity = 1.1
    };
getRow(2,21)->
    #petrebornCfg {
    groupid = 2,
    lv = 21,
    star_up = 0,
    reborn = 0,
    star = 1.48,
    item_star = [{2161,85}],
    quanlity = 1.1
    };
getRow(2,22)->
    #petrebornCfg {
    groupid = 2,
    lv = 22,
    star_up = 0,
    reborn = 0,
    star = 1.61,
    item_star = [{2161,102}],
    quanlity = 1.1
    };
getRow(2,23)->
    #petrebornCfg {
    groupid = 2,
    lv = 23,
    star_up = 0,
    reborn = 0,
    star = 1.74,
    item_star = [{2161,119}],
    quanlity = 1.1
    };
getRow(2,24)->
    #petrebornCfg {
    groupid = 2,
    lv = 24,
    star_up = 0,
    reborn = 0,
    star = 1.82,
    item_star = [{2161,136}],
    quanlity = 1.1
    };
getRow(3,0)->
    #petrebornCfg {
    groupid = 3,
    lv = 0,
    star_up = 0,
    reborn = 0,
    star = 0,
    quanlity = 1.1
    };
getRow(3,1)->
    #petrebornCfg {
    groupid = 3,
    lv = 1,
    star_up = 0,
    reborn = 0.24,
    star = 0.03,
    item_star = [{2162,1}],
    quanlity = 1.1
    };
getRow(3,2)->
    #petrebornCfg {
    groupid = 3,
    lv = 2,
    star_up = 0,
    reborn = 0.49,
    star = 0.06,
    item_star = [{2162,3}],
    quanlity = 1.1
    };
getRow(3,3)->
    #petrebornCfg {
    groupid = 3,
    lv = 3,
    star_up = 0,
    reborn = 0.73,
    star = 0.09,
    item_star = [{2162,5}],
    quanlity = 1.1
    };
getRow(3,4)->
    #petrebornCfg {
    groupid = 3,
    lv = 4,
    star_up = 0,
    reborn = 0.98,
    star = 0.12,
    item_star = [{2162,7}],
    quanlity = 1.1
    };
getRow(3,5)->
    #petrebornCfg {
    groupid = 3,
    lv = 5,
    star_up = 1,
    reborn = 1.22,
    star = 0.18,
    item_star = [{2162,11}],
    quanlity = 1.1
    };
getRow(3,6)->
    #petrebornCfg {
    groupid = 3,
    lv = 6,
    star_up = 0,
    reborn = 0,
    star = 0.22,
    item_star = [{2162,7}],
    quanlity = 1.1
    };
getRow(3,7)->
    #petrebornCfg {
    groupid = 3,
    lv = 7,
    star_up = 0,
    reborn = 0,
    star = 0.26,
    item_star = [{2162,11}],
    quanlity = 1.1
    };
getRow(3,8)->
    #petrebornCfg {
    groupid = 3,
    lv = 8,
    star_up = 0,
    reborn = 0,
    star = 0.3,
    item_star = [{2162,15}],
    quanlity = 1.1
    };
getRow(3,9)->
    #petrebornCfg {
    groupid = 3,
    lv = 9,
    star_up = 0,
    reborn = 0,
    star = 0.34,
    item_star = [{2162,19}],
    quanlity = 1.1
    };
getRow(3,10)->
    #petrebornCfg {
    groupid = 3,
    lv = 10,
    star_up = 1,
    reborn = 0,
    star = 0.42,
    item_star = [{2162,27}],
    quanlity = 1.1
    };
getRow(3,11)->
    #petrebornCfg {
    groupid = 3,
    lv = 11,
    star_up = 0,
    reborn = 0,
    star = 0.49,
    item_star = [{2162,19}],
    quanlity = 1.1
    };
getRow(3,12)->
    #petrebornCfg {
    groupid = 3,
    lv = 12,
    star_up = 0,
    reborn = 0,
    star = 0.55,
    item_star = [{2162,28}],
    quanlity = 1.1
    };
getRow(3,13)->
    #petrebornCfg {
    groupid = 3,
    lv = 13,
    star_up = 0,
    reborn = 0,
    star = 0.62,
    item_star = [{2162,37}],
    quanlity = 1.1
    };
getRow(3,14)->
    #petrebornCfg {
    groupid = 3,
    lv = 14,
    star_up = 0,
    reborn = 0,
    star = 0.68,
    item_star = [{2162,46}],
    quanlity = 1.1
    };
getRow(3,15)->
    #petrebornCfg {
    groupid = 3,
    lv = 15,
    star_up = 1,
    reborn = 0,
    star = 0.81,
    item_star = [{2162,54}],
    quanlity = 1.1
    };
getRow(3,16)->
    #petrebornCfg {
    groupid = 3,
    lv = 16,
    star_up = 0,
    reborn = 0,
    star = 0.9,
    item_star = [{2162,46}],
    quanlity = 1.1
    };
getRow(3,17)->
    #petrebornCfg {
    groupid = 3,
    lv = 17,
    star_up = 0,
    reborn = 0,
    star = 0.99,
    item_star = [{2162,59}],
    quanlity = 1.1
    };
getRow(3,18)->
    #petrebornCfg {
    groupid = 3,
    lv = 18,
    star_up = 0,
    reborn = 0,
    star = 1.08,
    item_star = [{2162,72}],
    quanlity = 1.1
    };
getRow(3,19)->
    #petrebornCfg {
    groupid = 3,
    lv = 19,
    star_up = 0,
    reborn = 0,
    star = 1.17,
    item_star = [{2162,85}],
    quanlity = 1.1
    };
getRow(3,20)->
    #petrebornCfg {
    groupid = 3,
    lv = 20,
    star_up = 1,
    reborn = 0,
    star = 1.35,
    item_star = [{2162,111}],
    quanlity = 1.1
    };
getRow(3,21)->
    #petrebornCfg {
    groupid = 3,
    lv = 21,
    star_up = 0,
    reborn = 0,
    star = 1.48,
    item_star = [{2162,85}],
    quanlity = 1.1
    };
getRow(3,22)->
    #petrebornCfg {
    groupid = 3,
    lv = 22,
    star_up = 0,
    reborn = 0,
    star = 1.61,
    item_star = [{2162,102}],
    quanlity = 1.1
    };
getRow(3,23)->
    #petrebornCfg {
    groupid = 3,
    lv = 23,
    star_up = 0,
    reborn = 0,
    star = 1.74,
    item_star = [{2162,119}],
    quanlity = 1.1
    };
getRow(3,24)->
    #petrebornCfg {
    groupid = 3,
    lv = 24,
    star_up = 0,
    reborn = 0,
    star = 1.82,
    item_star = [{2162,136}],
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
    {1,24},
    {2,0},
    {2,1},
    {2,2},
    {2,3},
    {2,4},
    {2,5},
    {2,6},
    {2,7},
    {2,8},
    {2,9},
    {2,10},
    {2,11},
    {2,12},
    {2,13},
    {2,14},
    {2,15},
    {2,16},
    {2,17},
    {2,18},
    {2,19},
    {2,20},
    {2,21},
    {2,22},
    {2,23},
    {2,24},
    {3,0},
    {3,1},
    {3,2},
    {3,3},
    {3,4},
    {3,5},
    {3,6},
    {3,7},
    {3,8},
    {3,9},
    {3,10},
    {3,11},
    {3,12},
    {3,13},
    {3,14},
    {3,15},
    {3,16},
    {3,17},
    {3,18},
    {3,19},
    {3,20},
    {3,21},
    {3,22},
    {3,23},
    {3,24}
    ].

get1KeyList()->[
    1,
    2,
    3
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
get2KeyList(2)->[
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
get2KeyList(3)->[
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
