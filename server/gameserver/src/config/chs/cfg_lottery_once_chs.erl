%% coding: latin-1
%%: 实现
-module(cfg_lottery_once_chs).
-compile(export_all).
-include("cfg_lottery_once.hrl").
-include("logger.hrl").

getRow(1)->
    #lottery_onceCfg {
    id = 1,
    goblin_free = 9000,
    goblin_pay_money = 0,
    treasure_free = 9000,
    treasure_pay_money = 0
    };
getRow(2)->
    #lottery_onceCfg {
    id = 2,
    goblin_free = 8000,
    goblin_pay_money = 0,
    treasure_free = 8000,
    treasure_pay_money = 0
    };
getRow(3)->
    #lottery_onceCfg {
    id = 3,
    goblin_free = 8000,
    goblin_pay_money = 0,
    treasure_free = 8000,
    treasure_pay_money = 0
    };
getRow(4)->
    #lottery_onceCfg {
    id = 4,
    goblin_free = 8000,
    goblin_pay_money = 0,
    treasure_free = 8000,
    treasure_pay_money = 0
    };
getRow(5)->
    #lottery_onceCfg {
    id = 5,
    goblin_free = 7000,
    goblin_pay_money = 0,
    treasure_free = 7000,
    treasure_pay_money = 0
    };
getRow(6)->
    #lottery_onceCfg {
    id = 6,
    goblin_free = 7000,
    goblin_pay_money = 0,
    treasure_free = 7000,
    treasure_pay_money = 0
    };
getRow(7)->
    #lottery_onceCfg {
    id = 7,
    goblin_free = 7000,
    goblin_pay_money = 0,
    treasure_free = 7000,
    treasure_pay_money = 0
    };
getRow(8)->
    #lottery_onceCfg {
    id = 8,
    goblin_free = 5000,
    goblin_pay_money = 0,
    treasure_free = 5000,
    treasure_pay_money = 0
    };
getRow(9)->
    #lottery_onceCfg {
    id = 9,
    goblin_free = 5000,
    goblin_pay_money = 0,
    treasure_free = 5000,
    treasure_pay_money = 0
    };
getRow(10)->
    #lottery_onceCfg {
    id = 10,
    goblin_free = 5000,
    goblin_pay_money = 0,
    treasure_free = 5000,
    treasure_pay_money = 0
    };
getRow(11)->
    #lottery_onceCfg {
    id = 11,
    goblin_free = 5000,
    goblin_pay_money = 0,
    treasure_free = 5000,
    treasure_pay_money = 0
    };
getRow(12)->
    #lottery_onceCfg {
    id = 12,
    goblin_free = 5000,
    goblin_pay_money = 0,
    treasure_free = 5000,
    treasure_pay_money = 0
    };
getRow(13)->
    #lottery_onceCfg {
    id = 13,
    goblin_free = 5000,
    goblin_pay_money = 0,
    treasure_free = 5000,
    treasure_pay_money = 0
    };
getRow(14)->
    #lottery_onceCfg {
    id = 14,
    goblin_free = 5000,
    goblin_pay_money = 0,
    treasure_free = 5000,
    treasure_pay_money = 0
    };
getRow(15)->
    #lottery_onceCfg {
    id = 15,
    goblin_free = 5000,
    goblin_pay_money = 0,
    treasure_free = 5000,
    treasure_pay_money = 0
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

