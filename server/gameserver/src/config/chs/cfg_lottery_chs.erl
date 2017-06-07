%% coding: latin-1
%%: 实现
-module(cfg_lottery_chs).
-compile(export_all).
-include("cfg_lottery.hrl").
-include("logger.hrl").

getRow(1)->
    #lotteryCfg {
    id = 1,
    item_id = 611,
    item_weight1 = 10000,
    item_weight2 = 10000,
    item_numberMix = 1,
    item_numberMax = 1,
    is_binded = 1,
    pool_times_perday = -1,
    need_broadcast = 0,
    is_show = 0
    };
getRow(2)->
    #lotteryCfg {
    id = 2,
    item_id = 612,
    item_weight1 = 9000,
    item_weight2 = 9000,
    item_numberMix = 1,
    item_numberMax = 1,
    is_binded = 1,
    pool_times_perday = -1,
    need_broadcast = 0,
    is_show = 0
    };
getRow(3)->
    #lotteryCfg {
    id = 3,
    item_id = 613,
    item_weight1 = 8000,
    item_weight2 = 8000,
    item_numberMix = 1,
    item_numberMax = 1,
    is_binded = 1,
    pool_times_perday = -1,
    need_broadcast = 0,
    is_show = 0
    };
getRow(4)->
    #lotteryCfg {
    id = 4,
    item_id = 614,
    item_weight1 = 7000,
    item_weight2 = 7000,
    item_numberMix = 1,
    item_numberMax = 1,
    is_binded = 1,
    pool_times_perday = -1,
    need_broadcast = 1,
    is_show = 0
    };
getRow(5)->
    #lotteryCfg {
    id = 5,
    item_id = 615,
    item_weight1 = 6000,
    item_weight2 = 6000,
    item_numberMix = 1,
    item_numberMax = 1,
    is_binded = 1,
    pool_times_perday = 20,
    need_broadcast = 1,
    is_show = 0
    };
getRow(6)->
    #lotteryCfg {
    id = 6,
    item_id = 616,
    item_weight1 = 5000,
    item_weight2 = 5000,
    item_numberMix = 1,
    item_numberMax = 1,
    is_binded = 1,
    pool_times_perday = 10,
    need_broadcast = 1,
    is_show = 1
    };
getRow(7)->
    #lotteryCfg {
    id = 7,
    item_id = 270,
    item_weight1 = 10000,
    item_weight2 = 10000,
    item_numberMix = 1,
    item_numberMax = 1,
    is_binded = 1,
    pool_times_perday = -1,
    need_broadcast = 0,
    is_show = 0
    };
getRow(8)->
    #lotteryCfg {
    id = 8,
    item_id = 270,
    item_weight1 = 10000,
    item_weight2 = 10000,
    item_numberMix = 1,
    item_numberMax = 1,
    is_binded = 1,
    pool_times_perday = -1,
    need_broadcast = 0,
    is_show = 0
    };
getRow(9)->
    #lotteryCfg {
    id = 9,
    item_id = 2005,
    item_weight1 = 10000,
    item_weight2 = 10000,
    item_numberMix = 1,
    item_numberMax = 1,
    is_binded = 1,
    pool_times_perday = -1,
    need_broadcast = 0,
    is_show = 0
    };
getRow(10)->
    #lotteryCfg {
    id = 10,
    item_id = 2006,
    item_weight1 = 5000,
    item_weight2 = 10000,
    item_numberMix = 1,
    item_numberMax = 1,
    is_binded = 1,
    pool_times_perday = -1,
    need_broadcast = 0,
    is_show = 0
    };
getRow(11)->
    #lotteryCfg {
    id = 11,
    item_id = 2007,
    item_weight1 = 2000,
    item_weight2 = 10000,
    item_numberMix = 1,
    item_numberMax = 1,
    is_binded = 1,
    pool_times_perday = 10,
    need_broadcast = 1,
    is_show = 1
    };
getRow(12)->
    #lotteryCfg {
    id = 12,
    item_id = 300,
    item_weight1 = 10000,
    item_weight2 = 10000,
    item_numberMix = 1,
    item_numberMax = 1,
    is_binded = 1,
    pool_times_perday = -1,
    need_broadcast = 0,
    is_show = 0
    };
getRow(13)->
    #lotteryCfg {
    id = 13,
    item_id = 301,
    item_weight1 = 8000,
    item_weight2 = 8000,
    item_numberMix = 1,
    item_numberMax = 1,
    is_binded = 1,
    pool_times_perday = -1,
    need_broadcast = 0,
    is_show = 0
    };
getRow(14)->
    #lotteryCfg {
    id = 14,
    item_id = 1111,
    item_weight1 = 10000,
    item_weight2 = 10000,
    item_numberMix = 1,
    item_numberMax = 1,
    is_binded = 1,
    pool_times_perday = 20,
    need_broadcast = 1,
    is_show = 0
    };
getRow(15)->
    #lotteryCfg {
    id = 15,
    item_id = 1113,
    item_weight1 = 5000,
    item_weight2 = 5000,
    item_numberMix = 1,
    item_numberMax = 1,
    is_binded = 1,
    pool_times_perday = 10,
    need_broadcast = 1,
    is_show = 0
    };
getRow(16)->
    #lotteryCfg {
    id = 16,
    item_id = 1115,
    item_weight1 = 1000,
    item_weight2 = 1000,
    item_numberMix = 1,
    item_numberMax = 1,
    is_binded = 1,
    pool_times_perday = 5,
    need_broadcast = 1,
    is_show = 1
    };
getRow(17)->
    #lotteryCfg {
    id = 17,
    item_id = 900,
    item_weight1 = 10000,
    item_weight2 = 10000,
    item_numberMix = 1,
    item_numberMax = 1,
    is_binded = 1,
    pool_times_perday = 99,
    need_broadcast = 0,
    is_show = 0
    };
getRow(18)->
    #lotteryCfg {
    id = 18,
    item_id = 901,
    item_weight1 = 5000,
    item_weight2 = 5000,
    item_numberMix = 1,
    item_numberMax = 1,
    is_binded = 1,
    pool_times_perday = 50,
    need_broadcast = 0,
    is_show = 0
    };
getRow(19)->
    #lotteryCfg {
    id = 19,
    item_id = 902,
    item_weight1 = 3000,
    item_weight2 = 3000,
    item_numberMix = 1,
    item_numberMax = 1,
    is_binded = 1,
    pool_times_perday = 20,
    need_broadcast = 0,
    is_show = 0
    };
getRow(20)->
    #lotteryCfg {
    id = 20,
    item_id = 903,
    item_weight1 = 500,
    item_weight2 = 1000,
    item_numberMix = 1,
    item_numberMax = 1,
    is_binded = 1,
    pool_times_perday = 10,
    need_broadcast = 1,
    is_show = 0
    };
getRow(21)->
    #lotteryCfg {
    id = 21,
    item_id = 904,
    item_weight1 = 200,
    item_weight2 = 500,
    item_numberMix = 1,
    item_numberMax = 1,
    is_binded = 1,
    pool_times_perday = 5,
    need_broadcast = 1,
    is_show = 1
    };
getRow(22)->
    #lotteryCfg {
    id = 22,
    item_id = 15006,
    item_weight1 = 10000,
    item_weight2 = 10000,
    item_numberMix = 1,
    item_numberMax = 1,
    is_binded = 0,
    pool_times_perday = 1,
    need_broadcast = 1,
    is_show = 1
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
    {22}
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
    22
    ].

