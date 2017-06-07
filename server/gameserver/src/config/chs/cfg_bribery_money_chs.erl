%% coding: latin-1
%%: 实现
-module(cfg_bribery_money_chs).
-compile(export_all).
-include("cfg_bribery_money.hrl").
-include("logger.hrl").

getRow(1)->
    #bribery_moneyCfg {
    iD = 1,
    type = 1,
    min_num = 10,
    max_num = 50,
    min_money = 200,
    max_money = 10000,
    time = 1800,
    cD = 1800
    };
getRow(2)->
    #bribery_moneyCfg {
    iD = 2,
    type = 2,
    min_num = 5,
    max_num = 50,
    min_money = 100,
    max_money = 10000,
    time = 600,
    cD = 600
    };
getRow(3)->
    #bribery_moneyCfg {
    iD = 3,
    type = 3,
    min_num = 10,
    max_num = 10,
    min_money = 100,
    max_money = 100,
    time = 600,
    cD = 600
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3}
    ].

get1KeyList()->[
    1,
    2,
    3
    ].

