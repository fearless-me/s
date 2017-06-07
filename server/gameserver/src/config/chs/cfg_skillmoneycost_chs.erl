%% coding: latin-1
%%: 实现
-module(cfg_skillmoneycost_chs).
-compile(export_all).
-include("cfg_skillmoneycost.hrl").
-include("logger.hrl").

getRow(1033,1)->
    #skillmoneycostCfg {
    skillID = 1033,
    level = 1,
    money = 100
    };
getRow(_,_)->[].

getKeyList()->[
    {1033,1}
    ].

get1KeyList()->[
    1033
    ].

get2KeyList(1033)->[
    1
    ];
get2KeyList(_)->[].

