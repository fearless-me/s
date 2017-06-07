%% coding: latin-1
%%: 实现
-module(cfg_lotteryForTower_chs).
-compile(export_all).
-include("cfg_lotteryForTower.hrl").
-include("logger.hrl").

getRow(1)->
    #lotteryForTowerCfg {
    pool_id = 1,
    id = 1,
    pool_times_perday = -1,
    item_id = 614,
    item_number = 1,
    item_weight = 1500,
    need_brodcast = 0,
    is_binded = 1,
    is_record = 0,
    is_win = -1,
    for_1 = 10,
    for_10 = 90,
    for_50 = 450
    };
getRow(2)->
    #lotteryForTowerCfg {
    pool_id = 1,
    id = 2,
    pool_times_perday = -1,
    item_id = 815,
    item_number = 1,
    item_weight = 1500,
    need_brodcast = 0,
    is_binded = 1,
    is_record = 0,
    is_win = -1,
    for_1 = 10,
    for_10 = 90,
    for_50 = 450
    };
getRow(3)->
    #lotteryForTowerCfg {
    pool_id = 1,
    id = 3,
    pool_times_perday = -1,
    item_id = 225,
    item_number = 1,
    item_weight = 1500,
    need_brodcast = 0,
    is_binded = 1,
    is_record = 0,
    is_win = -1,
    for_1 = 10,
    for_10 = 90,
    for_50 = 450
    };
getRow(4)->
    #lotteryForTowerCfg {
    pool_id = 1,
    id = 4,
    pool_times_perday = -1,
    item_id = 201,
    item_number = 1,
    item_weight = 1500,
    need_brodcast = 0,
    is_binded = 1,
    is_record = 0,
    is_win = -1,
    for_1 = 10,
    for_10 = 90,
    for_50 = 450
    };
getRow(5)->
    #lotteryForTowerCfg {
    pool_id = 1,
    id = 5,
    pool_times_perday = -1,
    item_id = 810,
    item_number = 1,
    item_weight = 1500,
    need_brodcast = 0,
    is_binded = 1,
    is_record = 0,
    is_win = -1,
    for_1 = 10,
    for_10 = 90,
    for_50 = 450
    };
getRow(6)->
    #lotteryForTowerCfg {
    pool_id = 1,
    id = 6,
    pool_times_perday = -1,
    item_id = 902,
    item_number = 1,
    item_weight = 2500,
    need_brodcast = 0,
    is_binded = 1,
    is_record = 0,
    is_win = 1,
    for_1 = 10,
    for_10 = 90,
    for_50 = 450
    };
getRow(7)->
    #lotteryForTowerCfg {
    pool_id = 2,
    id = 7,
    pool_times_perday = -1,
    item_id = 222,
    item_number = 3,
    item_weight = 1500,
    need_brodcast = 0,
    is_binded = 1,
    is_record = 0,
    is_win = -1,
    for_1 = 10,
    for_10 = 90,
    for_50 = 450
    };
getRow(8)->
    #lotteryForTowerCfg {
    pool_id = 2,
    id = 8,
    pool_times_perday = -1,
    item_id = 818,
    item_number = 1,
    item_weight = 2500,
    need_brodcast = 0,
    is_binded = 1,
    is_record = 0,
    is_win = -1,
    for_1 = 10,
    for_10 = 90,
    for_50 = 450
    };
getRow(9)->
    #lotteryForTowerCfg {
    pool_id = 2,
    id = 9,
    pool_times_perday = -1,
    item_id = 2160,
    item_number = 3,
    item_weight = 2000,
    need_brodcast = 0,
    is_binded = 1,
    is_record = 0,
    is_win = -1,
    for_1 = 10,
    for_10 = 90,
    for_50 = 450
    };
getRow(10)->
    #lotteryForTowerCfg {
    pool_id = 2,
    id = 10,
    pool_times_perday = -1,
    item_id = 813,
    item_number = 1,
    item_weight = 2500,
    need_brodcast = 0,
    is_binded = 1,
    is_record = 0,
    is_win = -1,
    for_1 = 10,
    for_10 = 90,
    for_50 = 450
    };
getRow(11)->
    #lotteryForTowerCfg {
    pool_id = 2,
    id = 11,
    pool_times_perday = -1,
    item_id = 903,
    item_number = 1,
    item_weight = 1500,
    need_brodcast = 0,
    is_binded = 1,
    is_record = 0,
    is_win = 1,
    for_1 = 10,
    for_10 = 90,
    for_50 = 450
    };
getRow(12)->
    #lotteryForTowerCfg {
    pool_id = 3,
    id = 12,
    pool_times_perday = -1,
    item_id = 4303,
    item_number = 3,
    item_weight = 3000,
    need_brodcast = 0,
    is_binded = 1,
    is_record = 0,
    is_win = -1,
    for_1 = 10,
    for_10 = 90,
    for_50 = 450
    };
getRow(13)->
    #lotteryForTowerCfg {
    pool_id = 3,
    id = 13,
    pool_times_perday = -1,
    item_id = 224,
    item_number = 3,
    item_weight = 2500,
    need_brodcast = 0,
    is_binded = 1,
    is_record = 0,
    is_win = -1,
    for_1 = 10,
    for_10 = 90,
    for_50 = 450
    };
getRow(14)->
    #lotteryForTowerCfg {
    pool_id = 3,
    id = 14,
    pool_times_perday = -1,
    item_id = 2161,
    item_number = 3,
    item_weight = 3000,
    need_brodcast = 0,
    is_binded = 1,
    is_record = 0,
    is_win = -1,
    for_1 = 10,
    for_10 = 90,
    for_50 = 450
    };
getRow(15)->
    #lotteryForTowerCfg {
    pool_id = 3,
    id = 15,
    pool_times_perday = -1,
    item_id = 904,
    item_number = 1,
    item_weight = 1500,
    need_brodcast = 0,
    is_binded = 1,
    is_record = 1,
    is_win = 1,
    for_1 = 10,
    for_10 = 90,
    for_50 = 450
    };
getRow(16)->
    #lotteryForTowerCfg {
    pool_id = 4,
    id = 16,
    pool_times_perday = -1,
    item_id = 4305,
    item_number = 3,
    item_weight = 6000,
    need_brodcast = 0,
    is_binded = 1,
    is_record = 1,
    is_win = -1,
    for_1 = 10,
    for_10 = 90,
    for_50 = 450
    };
getRow(17)->
    #lotteryForTowerCfg {
    pool_id = 4,
    id = 17,
    pool_times_perday = 100,
    item_id = 4444,
    item_number = 1,
    item_weight = 3000,
    need_brodcast = 0,
    is_binded = 0,
    is_record = 1,
    is_win = -1,
    for_1 = 10,
    for_10 = 90,
    for_50 = 450
    };
getRow(18)->
    #lotteryForTowerCfg {
    pool_id = 4,
    id = 18,
    pool_times_perday = 100,
    item_id = 904,
    item_number = 3,
    item_weight = 1000,
    need_brodcast = 1,
    is_binded = 1,
    is_record = 1,
    is_win = 1,
    for_1 = 10,
    for_10 = 90,
    for_50 = 450
    };
getRow(19)->
    #lotteryForTowerCfg {
    pool_id = 5,
    id = 19,
    pool_times_perday = -1,
    item_id = 4443,
    item_number = 1,
    item_weight = 7000,
    need_brodcast = 1,
    is_binded = 0,
    is_record = 1,
    is_win = -1,
    for_1 = 10,
    for_10 = 90,
    for_50 = 450
    };
getRow(20)->
    #lotteryForTowerCfg {
    pool_id = 5,
    id = 20,
    pool_times_perday = 20,
    item_id = 905,
    item_number = 2,
    item_weight = 3000,
    need_brodcast = 1,
    is_binded = 1,
    is_record = 1,
    is_win = 1,
    for_1 = 10,
    for_10 = 90,
    for_50 = 450
    };
getRow(21)->
    #lotteryForTowerCfg {
    pool_id = 6,
    id = 21,
    pool_times_perday = -1,
    item_id = 279,
    item_number = 1,
    item_weight = 10000,
    need_brodcast = 1,
    is_binded = 1,
    is_record = 1,
    is_win = -1,
    for_1 = 10,
    for_10 = 90,
    for_50 = 450
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
    {21}
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
    21
    ].

