%% coding: latin-1
%%: 实现
-module(cfg_wedding_type_candy_chs).
-compile(export_all).
-include("cfg_wedding_type_candy.hrl").
-include("logger.hrl").

getRow(1)->
    #wedding_type_candyCfg {
    wedding_type = 1,
    object_ID = 1102,
    cost = 200,
    cooldown = 20,
    count = 5,
    rand_pos = [{103,54},{106,57},{100,58},{96,59},{95,51},{95,46},{99,44},{107,45},{101,50},{93,45},{92,47},{91,56},{88,53},{93,48},{98,64}]
    };
getRow(2)->
    #wedding_type_candyCfg {
    wedding_type = 2,
    object_ID = 1103,
    cost = 666,
    cooldown = 20,
    count = 10,
    rand_pos = [{103,54},{106,57},{100,58},{96,59},{95,51},{95,46},{99,44},{107,45},{101,50},{93,45},{92,47},{91,56},{88,53},{93,48},{98,64}]
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2}
    ].

get1KeyList()->[
    1,
    2
    ].

