%% coding: latin-1
%%: 实现
-module(cfg_guildbless_chs).
-compile(export_all).
-include("cfg_guildbless.hrl").
-include("logger.hrl").

getRow(1)->
    #guildblessCfg {
    typ = 1,
    rate = 0,
    contribute = 139,
    guildresource = 88,
    guildliveness = 9,
    cost = 10000,
    costtype = 100
    };
getRow(2)->
    #guildblessCfg {
    typ = 2,
    rate = 0,
    contribute = 232,
    guildresource = 147,
    guildliveness = 15,
    cost = 15,
    costtype = 103
    };
getRow(3)->
    #guildblessCfg {
    typ = 3,
    rate = 0,
    contribute = 465,
    guildresource = 295,
    guildliveness = 29,
    cost = 50,
    costtype = 103
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

