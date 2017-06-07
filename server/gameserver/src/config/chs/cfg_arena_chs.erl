%% coding: latin-1
%%: 实现
-module(cfg_arena_chs).
-compile(export_all).
-include("cfg_arena.hrl").
-include("logger.hrl").

getRow(6018)->
    #arenaCfg {
    mapid = 6018,
    event_type = 1,
    event_id = [7039,7040,7041,7042,7043,7044],
    coordinate = [{128.0,65.0}],
    event_num = 1,
    event_time = 180
    };
getRow(6019)->
    #arenaCfg {
    mapid = 6019,
    event_type = 2,
    event_id = [230,231,232,233,234,235,236,237,238],
    coordinate = [{19.9,17.3},{48.5,16.1},{74.9,20.3},{38.3,15.7}],
    event_num = 1,
    event_time = 80
    };
getRow(6020)->
    #arenaCfg {
    mapid = 6020,
    event_type = 3,
    event_id = [229],
    coordinate = [{147.4,116.4}],
    event_num = 1,
    event_time = 0
    };
getRow(_)->[].

getKeyList()->[
    {6018},
    {6019},
    {6020}
    ].

get1KeyList()->[
    6018,
    6019,
    6020
    ].

