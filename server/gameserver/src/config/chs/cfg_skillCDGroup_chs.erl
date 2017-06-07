%% coding: latin-1
%%: 实现
-module(cfg_skillCDGroup_chs).
-compile(export_all).
-include("cfg_skillCDGroup.hrl").
-include("logger.hrl").

getRow(1)->
    #skillCDGroupCfg {
    id = 1,
    time = 3000
    };
getRow(2)->
    #skillCDGroupCfg {
    id = 2,
    time = 6000
    };
getRow(3)->
    #skillCDGroupCfg {
    id = 3,
    time = 9000
    };
getRow(4)->
    #skillCDGroupCfg {
    id = 4,
    time = 15000
    };
getRow(5)->
    #skillCDGroupCfg {
    id = 5,
    time = 8000
    };
getRow(6)->
    #skillCDGroupCfg {
    id = 6,
    time = 10000
    };
getRow(7)->
    #skillCDGroupCfg {
    id = 7,
    time = 60000
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ].

