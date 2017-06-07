%% coding: latin-1
%%: 实现
-module(cfg_treasuremap_chs).
-compile(export_all).
-include("cfg_treasuremap.hrl").
-include("logger.hrl").

getRow(1)->
    #treasuremapCfg {
    id = 1,
    pos = [{2,9,21}],
    range = 2,
    event = [{1,1},{2,3},{3,2}]
    };
getRow(2)->
    #treasuremapCfg {
    id = 2,
    pos = [{2,9,22}],
    range = 2,
    event = [{1,1},{2,3},{3,3}]
    };
getRow(3)->
    #treasuremapCfg {
    id = 3,
    pos = [{2,9,23}],
    range = 2,
    event = [{1,1},{2,3},{3,4}]
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

