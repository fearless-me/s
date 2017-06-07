%% coding: latin-1
%%: 实现
-module(cfg_fightall_chs).
-compile(export_all).
-include("cfg_fightall.hrl").
-include("logger.hrl").

getRow(100000)->
    #fightallCfg {
    id = 100000,
    bufid = 207
    };
getRow(150000)->
    #fightallCfg {
    id = 150000,
    bufid = 208
    };
getRow(200000)->
    #fightallCfg {
    id = 200000,
    bufid = 209
    };
getRow(250000)->
    #fightallCfg {
    id = 250000,
    bufid = 210
    };
getRow(300000)->
    #fightallCfg {
    id = 300000,
    bufid = 211
    };
getRow(350000)->
    #fightallCfg {
    id = 350000,
    bufid = 212
    };
getRow(400000)->
    #fightallCfg {
    id = 400000,
    bufid = 213
    };
getRow(450000)->
    #fightallCfg {
    id = 450000,
    bufid = 214
    };
getRow(600000)->
    #fightallCfg {
    id = 600000,
    bufid = 215
    };
getRow(700000)->
    #fightallCfg {
    id = 700000,
    bufid = 216
    };
getRow(100000000)->
    #fightallCfg {
    id = 100000000,
    bufid = 216
    };
getRow(_)->[].

getKeyList()->[
    {100000},
    {150000},
    {200000},
    {250000},
    {300000},
    {350000},
    {400000},
    {450000},
    {600000},
    {700000},
    {100000000}
    ].

get1KeyList()->[
    100000,
    150000,
    200000,
    250000,
    300000,
    350000,
    400000,
    450000,
    600000,
    700000,
    100000000
    ].

