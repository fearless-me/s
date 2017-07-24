%% coding: latin-1
%%: 实现
-module(cfg_guildbless_schedule_chs).
-compile(export_all).
-include("cfg_guildbless_schedule.hrl").
-include("logger.hrl").

getRow(1)->
    #guildbless_scheduleCfg {
    id = 1,
    schedule = 10,
    itemID = 0,
    coin = [{12,30}]
    };
getRow(2)->
    #guildbless_scheduleCfg {
    id = 2,
    schedule = 20,
    itemID = 0,
    coin = [{12,60}]
    };
getRow(3)->
    #guildbless_scheduleCfg {
    id = 3,
    schedule = 30,
    itemID = 0,
    coin = [{12,80},{6,15}]
    };
getRow(4)->
    #guildbless_scheduleCfg {
    id = 4,
    schedule = 40,
    itemID = 0,
    coin = [{12,100},{6,30}]
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4
    ].

