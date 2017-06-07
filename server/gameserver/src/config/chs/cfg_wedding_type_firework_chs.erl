%%: 实现
-module(cfg_wedding_type_firework_chs).
-compile(export_all).
-include("cfg_wedding_type_firework.hrl").
-include("logger.hrl").

getRow(1)->
    #wedding_type_fireworkCfg {
    id = 1,
    name = "ef_marry6",
    cost = 10,
    cooldown = 120
    };
getRow(2)->
    #wedding_type_fireworkCfg {
    id = 2,
    name = "ef_marry7",
    cost = 10,
    cooldown = 120
    };
getRow(3)->
    #wedding_type_fireworkCfg {
    id = 3,
    name = "ef_marry8",
    cost = 10,
    cooldown = 120
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

