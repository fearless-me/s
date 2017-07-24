%% coding: latin-1
%%: 实现
-module(cfg_starmoonbox_chs).
-compile(export_all).
-include("cfg_starmoonbox.hrl").
-include("logger.hrl").

getRow(1)->
    #starmoonboxCfg {
    id = 1,
    jackpot = 1,
    item = 28020
    };
getRow(2)->
    #starmoonboxCfg {
    id = 2,
    jackpot = 1,
    item = 28021
    };
getRow(3)->
    #starmoonboxCfg {
    id = 3,
    jackpot = 2,
    item = 28000
    };
getRow(4)->
    #starmoonboxCfg {
    id = 4,
    jackpot = 2,
    item = 28001
    };
getRow(5)->
    #starmoonboxCfg {
    id = 5,
    jackpot = 2,
    item = 28010
    };
getRow(6)->
    #starmoonboxCfg {
    id = 6,
    jackpot = 2,
    item = 28011
    };
getRow(7)->
    #starmoonboxCfg {
    id = 7,
    jackpot = 3,
    item = 222
    };
getRow(8)->
    #starmoonboxCfg {
    id = 8,
    jackpot = 3,
    item = 224
    };
getRow(9)->
    #starmoonboxCfg {
    id = 9,
    jackpot = 3,
    item = 225
    };
getRow(10)->
    #starmoonboxCfg {
    id = 10,
    jackpot = 3,
    item = 226
    };
getRow(11)->
    #starmoonboxCfg {
    id = 11,
    jackpot = 3,
    item = 2160
    };
getRow(12)->
    #starmoonboxCfg {
    id = 12,
    jackpot = 4,
    item = 2161
    };
getRow(13)->
    #starmoonboxCfg {
    id = 13,
    jackpot = 4,
    item = 4303
    };
getRow(14)->
    #starmoonboxCfg {
    id = 14,
    jackpot = 4,
    item = 4304
    };
getRow(15)->
    #starmoonboxCfg {
    id = 15,
    jackpot = 4,
    item = 4305
    };
getRow(16)->
    #starmoonboxCfg {
    id = 16,
    jackpot = 4,
    item = 201
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
    {16}
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
    16
    ].

