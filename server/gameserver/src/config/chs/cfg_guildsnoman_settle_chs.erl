%% coding: latin-1
%%: 实现
-module(cfg_guildsnoman_settle_chs).
-compile(export_all).
-include("cfg_guildsnoman_settle.hrl").
-include("logger.hrl").

getRow(1)->
    #guildsnoman_settleCfg {
    id = 1,
    rl = [4424,444],
    coin = [{12,248}],
    item = [{222,9},{603,1}]
    };
getRow(2)->
    #guildsnoman_settleCfg {
    id = 2,
    rl = [6083,611],
    coin = [{12,341}],
    item = [{222,13},{603,2}]
    };
getRow(3)->
    #guildsnoman_settleCfg {
    id = 3,
    rl = [7742,777],
    coin = [{12,434}],
    item = [{222,16},{603,3}]
    };
getRow(4)->
    #guildsnoman_settleCfg {
    id = 4,
    rl = [9401,944],
    coin = [{12,527}],
    item = [{222,19},{603,4}]
    };
getRow(5)->
    #guildsnoman_settleCfg {
    id = 5,
    rl = [11060,1110],
    coin = [{12,620}],
    item = [{222,23},{603,5}]
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5
    ].

