%% coding: latin-1
%%: 实现
-module(cfg_mapshadow_chs).
-compile(export_all).
-include("cfg_mapshadow.hrl").
-include("logger.hrl").

getRow(1)->
    #mapshadowCfg {
    mapname = "map9",
    day_r = 62,
    day_g = 62,
    day_b = 62,
    night_r = 62,
    night_g = 62,
    night_b = 62
    };
getRow(_)->[].

getKeyList()->[
    {1}
    ].

get1KeyList()->[
    1
    ].

