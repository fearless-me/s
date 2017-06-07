%% coding: latin-1
%%: 实现
-module(cfg_top_award_chs).
-compile(export_all).
-include("cfg_top_award.hrl").
-include("logger.hrl").

getRow(1)->
    #top_awardCfg {
    id = 1,
    sequence = [{1,3,100,1},{4,9,101,1},{10,20,102,2},{21,50,103,1},{51,100,104,1},{101,999999,105,1}]
    };
getRow(_)->[].

getKeyList()->[
    {1}
    ].

get1KeyList()->[
    1
    ].

