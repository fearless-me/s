%% coding: latin-1
%%: 实现
-module(cfg_guildsnoman_settle_chs).
-compile(export_all).
-include("cfg_guildsnoman_settle.hrl").
-include("logger.hrl").

getRow(1)->
    #guildsnoman_settleCfg {
    id = 1,
    rl = [2212,22],
    coin = [{12,124}],
    item = [{222,10},{603,1}]
    };
getRow(2)->
    #guildsnoman_settleCfg {
    id = 2,
    rl = [2212,22],
    coin = [{12,124}],
    item = [{222,10},{603,1}]
    };
getRow(3)->
    #guildsnoman_settleCfg {
    id = 3,
    rl = [2212,22],
    coin = [{12,124}],
    item = [{222,10},{603,1}]
    };
getRow(4)->
    #guildsnoman_settleCfg {
    id = 4,
    rl = [2212,22],
    coin = [{12,124}],
    item = [{222,10},{603,1}]
    };
getRow(5)->
    #guildsnoman_settleCfg {
    id = 5,
    rl = [2212,22],
    coin = [{12,124}],
    item = [{222,10},{603,1}]
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

