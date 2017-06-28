%% coding: latin-1
%%: 实现
-module(cfg_basic_head_chs).
-compile(export_all).
-include("cfg_basic_head.hrl").
-include("logger.hrl").

getRow(1)->
    #basic_headCfg {
    id = 1,
    icon = [1001,1101,2001,2101]
    };
getRow(2)->
    #basic_headCfg {
    id = 2,
    icon = [1001,1101,2001,2101]
    };
getRow(3)->
    #basic_headCfg {
    id = 3,
    icon = [1001,1101,2001,2101]
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

