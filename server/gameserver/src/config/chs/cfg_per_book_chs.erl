%% coding: latin-1
%%: 实现
-module(cfg_per_book_chs).
-compile(export_all).
-include("cfg_per_book.hrl").
-include("logger.hrl").

getRow(1)->
    #per_bookCfg {
    iD = 1,
    per_id = 51001,
    name = "测试1",
    label = 1,
    position = 1,
    gold = 0,
    growup_1 = 2,
    growup_2 = 3,
    growup_3 = 5
    };
getRow(2)->
    #per_bookCfg {
    iD = 2,
    per_id = 51002,
    name = "测试2",
    label = 1,
    position = 2,
    gold = 0,
    growup_1 = 5,
    growup_2 = 1,
    growup_3 = 7
    };
getRow(3)->
    #per_bookCfg {
    iD = 3,
    per_id = 51003,
    name = "测试3",
    label = 1,
    position = 3,
    gold = 0,
    growup_1 = 3,
    growup_2 = 3,
    growup_3 = 1
    };
getRow(4)->
    #per_bookCfg {
    iD = 4,
    per_id = 51004,
    name = "测试4",
    label = 2,
    position = 1,
    gold = 0,
    growup_1 = 8,
    growup_2 = 1,
    growup_3 = 2
    };
getRow(5)->
    #per_bookCfg {
    iD = 5,
    per_id = 51005,
    name = "测试5",
    label = 2,
    position = 2,
    gold = 3,
    growup_1 = 5,
    growup_2 = 5,
    growup_3 = 5
    };
getRow(6)->
    #per_bookCfg {
    iD = 6,
    per_id = 51006,
    name = "测试6",
    label = 2,
    position = 3,
    gold = 0,
    growup_1 = 3,
    growup_2 = 6,
    growup_3 = 7
    };
getRow(7)->
    #per_bookCfg {
    iD = 7,
    per_id = 51007,
    name = "测试7",
    label = 3,
    position = 1,
    gold = 3,
    growup_1 = 6,
    growup_2 = 4,
    growup_3 = 2
    };
getRow(8)->
    #per_bookCfg {
    iD = 8,
    per_id = 51008,
    name = "测试8",
    label = 3,
    position = 2,
    gold = 2,
    growup_1 = 2,
    growup_2 = 1,
    growup_3 = 2
    };
getRow(9)->
    #per_bookCfg {
    iD = 9,
    per_id = 51009,
    name = "测试9",
    label = 3,
    position = 3,
    gold = 1,
    growup_1 = 1,
    growup_2 = 1,
    growup_3 = 1
    };
getRow(10)->
    #per_bookCfg {
    iD = 10,
    per_id = 51025,
    name = "测试10",
    label = 1,
    position = 1,
    gold = 0,
    growup_1 = 9,
    growup_2 = 9,
    growup_3 = 8
    };
getRow(11)->
    #per_bookCfg {
    iD = 11,
    per_id = 51026,
    name = "测试11",
    label = 1,
    position = 1,
    gold = 0,
    growup_1 = 10,
    growup_2 = 2,
    growup_3 = 10
    };
getRow(12)->
    #per_bookCfg {
    iD = 12,
    per_id = 60000,
    name = "测试11",
    label = 1,
    position = 4,
    gold = 0,
    growup_1 = 2,
    growup_2 = 3,
    growup_3 = 5
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
    {12}
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
    12
    ].

