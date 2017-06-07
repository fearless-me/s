%% coding: latin-1
%%: 实现
-module(cfg_needForSpeedCollideRoadBox_chs).
-compile(export_all).
-include("cfg_needForSpeedCollideRoadBox.hrl").
-include("logger.hrl").

getRow(1)->
    #needForSpeedCollideRoadBoxCfg {
    id = 1,
    born_x = 182,
    born_z = 111,
    check_area_range = 2
    };
getRow(2)->
    #needForSpeedCollideRoadBoxCfg {
    id = 2,
    born_x = 187,
    born_z = 110,
    check_area_range = 2
    };
getRow(3)->
    #needForSpeedCollideRoadBoxCfg {
    id = 3,
    born_x = 194,
    born_z = 110,
    check_area_range = 2
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

