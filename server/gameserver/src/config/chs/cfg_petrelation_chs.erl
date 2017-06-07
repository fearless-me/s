%% coding: latin-1
%%: 实现
-module(cfg_petrelation_chs).
-compile(export_all).
-include("cfg_petrelation.hrl").
-include("logger.hrl").

getRow(1)->
    #petrelationCfg {
    id = 1,
    skill = 1029,
    petID1 = 50001,
    petID2 = 50002,
    petID3 = 0,
    petID4 = 0,
    petID5 = 0,
    petID6 = 0
    };
getRow(2)->
    #petrelationCfg {
    id = 2,
    skill = 1030,
    petID1 = 50003,
    petID2 = 50004,
    petID3 = 0,
    petID4 = 0,
    petID5 = 0,
    petID6 = 0
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

