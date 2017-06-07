%% coding: latin-1
%%: 实现
-module(cfg_lottery_ten_times_chs).
-compile(export_all).
-include("cfg_lottery_ten_times.hrl").
-include("logger.hrl").

getRow(1)->
    #lottery_ten_timesCfg {
    id = 1,
    goblin_ten_times = 5,
    treasure_ten_times = 6
    };
getRow(2)->
    #lottery_ten_timesCfg {
    id = 2,
    goblin_ten_times = 5,
    treasure_ten_times = 6
    };
getRow(3)->
    #lottery_ten_timesCfg {
    id = 3,
    goblin_ten_times = 5,
    treasure_ten_times = 6
    };
getRow(4)->
    #lottery_ten_timesCfg {
    id = 4,
    goblin_ten_times = 5,
    treasure_ten_times = 6
    };
getRow(5)->
    #lottery_ten_timesCfg {
    id = 5,
    goblin_ten_times = 5,
    treasure_ten_times = 6
    };
getRow(6)->
    #lottery_ten_timesCfg {
    id = 6,
    goblin_ten_times = 5,
    treasure_ten_times = 6
    };
getRow(7)->
    #lottery_ten_timesCfg {
    id = 7,
    goblin_ten_times = 5,
    treasure_ten_times = 6
    };
getRow(8)->
    #lottery_ten_timesCfg {
    id = 8,
    goblin_ten_times = 5,
    treasure_ten_times = 6
    };
getRow(9)->
    #lottery_ten_timesCfg {
    id = 9,
    goblin_ten_times = 5,
    treasure_ten_times = 6
    };
getRow(10)->
    #lottery_ten_timesCfg {
    id = 10,
    goblin_ten_times = 5,
    treasure_ten_times = 6
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
    {10}
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
    10
    ].

