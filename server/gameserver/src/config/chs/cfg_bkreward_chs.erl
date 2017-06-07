%% coding: latin-1
%%: 实现
-module(cfg_bkreward_chs).
-compile(export_all).
-include("cfg_bkreward.hrl").
-include("logger.hrl").

getRow(1)->
    #bkrewardCfg {
    id = 1,
    item_id = 611,
    item_weight = 10000,
    item_numberMin = 1,
    item_numberMax = 1,
    is_binded = 0,
    pool_times_perday = -1,
    need_broadcast = 0
    };
getRow(2)->
    #bkrewardCfg {
    id = 2,
    item_id = 612,
    item_weight = 9000,
    item_numberMin = 1,
    item_numberMax = 1,
    is_binded = 0,
    pool_times_perday = -1,
    need_broadcast = 0
    };
getRow(3)->
    #bkrewardCfg {
    id = 3,
    item_id = 613,
    item_weight = 8000,
    item_numberMin = 1,
    item_numberMax = 1,
    is_binded = 0,
    pool_times_perday = -1,
    need_broadcast = 0
    };
getRow(4)->
    #bkrewardCfg {
    id = 4,
    item_id = 614,
    item_weight = 7000,
    item_numberMin = 1,
    item_numberMax = 1,
    is_binded = 0,
    pool_times_perday = -1,
    need_broadcast = 0
    };
getRow(5)->
    #bkrewardCfg {
    id = 5,
    item_id = 615,
    item_weight = 6000,
    item_numberMin = 1,
    item_numberMax = 1,
    is_binded = 0,
    pool_times_perday = 20,
    need_broadcast = 1
    };
getRow(6)->
    #bkrewardCfg {
    id = 6,
    item_id = 616,
    item_weight = 5000,
    item_numberMin = 1,
    item_numberMax = 1,
    is_binded = 0,
    pool_times_perday = 10,
    need_broadcast = 1
    };
getRow(7)->
    #bkrewardCfg {
    id = 7,
    item_id = 270,
    item_weight = 10000,
    item_numberMin = 1,
    item_numberMax = 1,
    is_binded = 0,
    pool_times_perday = -1,
    need_broadcast = 0
    };
getRow(8)->
    #bkrewardCfg {
    id = 8,
    item_id = 270,
    item_weight = 10000,
    item_numberMin = 1,
    item_numberMax = 1,
    is_binded = 0,
    pool_times_perday = -1,
    need_broadcast = 0
    };
getRow(9)->
    #bkrewardCfg {
    id = 9,
    item_id = 2005,
    item_weight = 10000,
    item_numberMin = 1,
    item_numberMax = 1,
    is_binded = 0,
    pool_times_perday = -1,
    need_broadcast = 0
    };
getRow(10)->
    #bkrewardCfg {
    id = 10,
    item_id = 2006,
    item_weight = 5000,
    item_numberMin = 1,
    item_numberMax = 1,
    is_binded = 0,
    pool_times_perday = -1,
    need_broadcast = 0
    };
getRow(11)->
    #bkrewardCfg {
    id = 11,
    item_id = 2007,
    item_weight = 2000,
    item_numberMin = 1,
    item_numberMax = 1,
    is_binded = 0,
    pool_times_perday = 10,
    need_broadcast = 1
    };
getRow(12)->
    #bkrewardCfg {
    id = 12,
    item_id = 300,
    item_weight = 10000,
    item_numberMin = 1,
    item_numberMax = 1,
    is_binded = 0,
    pool_times_perday = -1,
    need_broadcast = 0
    };
getRow(13)->
    #bkrewardCfg {
    id = 13,
    item_id = 301,
    item_weight = 8000,
    item_numberMin = 1,
    item_numberMax = 1,
    is_binded = 0,
    pool_times_perday = -1,
    need_broadcast = 0
    };
getRow(14)->
    #bkrewardCfg {
    id = 14,
    item_id = 1111,
    item_weight = 10000,
    item_numberMin = 1,
    item_numberMax = 1,
    is_binded = 0,
    pool_times_perday = 20,
    need_broadcast = 0
    };
getRow(15)->
    #bkrewardCfg {
    id = 15,
    item_id = 1113,
    item_weight = 5000,
    item_numberMin = 1,
    item_numberMax = 1,
    is_binded = 0,
    pool_times_perday = 10,
    need_broadcast = 0
    };
getRow(16)->
    #bkrewardCfg {
    id = 16,
    item_id = 1115,
    item_weight = 1000,
    item_numberMin = 1,
    item_numberMax = 1,
    is_binded = 0,
    pool_times_perday = 5,
    need_broadcast = 1
    };
getRow(17)->
    #bkrewardCfg {
    id = 17,
    item_id = 900,
    item_weight = 10000,
    item_numberMin = 1,
    item_numberMax = 1,
    is_binded = 0,
    pool_times_perday = 99,
    need_broadcast = 0
    };
getRow(18)->
    #bkrewardCfg {
    id = 18,
    item_id = 901,
    item_weight = 5000,
    item_numberMin = 1,
    item_numberMax = 1,
    is_binded = 0,
    pool_times_perday = 50,
    need_broadcast = 0
    };
getRow(19)->
    #bkrewardCfg {
    id = 19,
    item_id = 902,
    item_weight = 3000,
    item_numberMin = 1,
    item_numberMax = 1,
    is_binded = 0,
    pool_times_perday = 20,
    need_broadcast = 0
    };
getRow(20)->
    #bkrewardCfg {
    id = 20,
    item_id = 903,
    item_weight = 500,
    item_numberMin = 1,
    item_numberMax = 1,
    is_binded = 0,
    pool_times_perday = 10,
    need_broadcast = 1
    };
getRow(21)->
    #bkrewardCfg {
    id = 21,
    item_id = 904,
    item_weight = 200,
    item_numberMin = 1,
    item_numberMax = 1,
    is_binded = 0,
    pool_times_perday = 5,
    need_broadcast = 1
    };
getRow(22)->
    #bkrewardCfg {
    id = 22,
    item_id = 16000,
    item_weight = 500,
    item_numberMin = 1,
    item_numberMax = 1,
    is_binded = 0,
    pool_times_perday = 1,
    need_broadcast = 1
    };
getRow(23)->
    #bkrewardCfg {
    id = 23,
    item_id = 2214,
    item_weight = 20000,
    item_numberMin = 1,
    item_numberMax = 1,
    is_binded = 0,
    pool_times_perday = 5,
    need_broadcast = 1
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
    {23}
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
    23
    ].

