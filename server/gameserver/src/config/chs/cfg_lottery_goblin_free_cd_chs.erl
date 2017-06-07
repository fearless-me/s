%% coding: latin-1
%%: 实现
-module(cfg_lottery_goblin_free_cd_chs).
-compile(export_all).
-include("cfg_lottery_goblin_free_cd.hrl").
-include("logger.hrl").

getRow(1)->
    #lottery_goblin_free_cdCfg {
    id = 1,
    cd = 600
    };
getRow(2)->
    #lottery_goblin_free_cdCfg {
    id = 2,
    cd = 1800
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

