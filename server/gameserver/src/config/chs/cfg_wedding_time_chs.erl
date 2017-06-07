%% coding: latin-1
%%: 实现
-module(cfg_wedding_time_chs).
-compile(export_all).
-include("cfg_wedding_time.hrl").
-include("logger.hrl").

getRow(1)->
    #wedding_timeCfg {
    time_ID = 1,
    start_time = [9,00],
    end_time = [9,30],
    wedding_type = 1
    };
getRow(2)->
    #wedding_timeCfg {
    time_ID = 2,
    start_time = [10,00],
    end_time = [10,30],
    wedding_type = 1
    };
getRow(3)->
    #wedding_timeCfg {
    time_ID = 3,
    start_time = [11,00],
    end_time = [11,30],
    wedding_type = 1
    };
getRow(4)->
    #wedding_timeCfg {
    time_ID = 4,
    start_time = [12,00],
    end_time = [12,30],
    wedding_type = 1
    };
getRow(5)->
    #wedding_timeCfg {
    time_ID = 5,
    start_time = [13,00],
    end_time = [13,30],
    wedding_type = 1
    };
getRow(6)->
    #wedding_timeCfg {
    time_ID = 6,
    start_time = [14,00],
    end_time = [14,30],
    wedding_type = 1
    };
getRow(7)->
    #wedding_timeCfg {
    time_ID = 7,
    start_time = [15,00],
    end_time = [15,30],
    wedding_type = 1
    };
getRow(8)->
    #wedding_timeCfg {
    time_ID = 8,
    start_time = [16,00],
    end_time = [16,30],
    wedding_type = 1
    };
getRow(9)->
    #wedding_timeCfg {
    time_ID = 9,
    start_time = [17,00],
    end_time = [17,30],
    wedding_type = 1
    };
getRow(10)->
    #wedding_timeCfg {
    time_ID = 10,
    start_time = [18,00],
    end_time = [18,30],
    wedding_type = 1
    };
getRow(11)->
    #wedding_timeCfg {
    time_ID = 11,
    start_time = [19,00],
    end_time = [19,30],
    wedding_type = 1
    };
getRow(12)->
    #wedding_timeCfg {
    time_ID = 12,
    start_time = [20,00],
    end_time = [20,30],
    wedding_type = 1
    };
getRow(13)->
    #wedding_timeCfg {
    time_ID = 13,
    start_time = [21,00],
    end_time = [21,30],
    wedding_type = 1
    };
getRow(14)->
    #wedding_timeCfg {
    time_ID = 14,
    start_time = [22,00],
    end_time = [22,30],
    wedding_type = 1
    };
getRow(15)->
    #wedding_timeCfg {
    time_ID = 15,
    start_time = [23,00],
    end_time = [23,30],
    wedding_type = 1
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

