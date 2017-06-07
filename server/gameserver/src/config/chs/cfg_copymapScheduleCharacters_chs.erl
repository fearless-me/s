%% coding: latin-1
%%: 实现
-module(cfg_copymapScheduleCharacters_chs).
-compile(export_all).
-include("cfg_copymapScheduleCharacters.hrl").
-include("logger.hrl").

getRow(1)->
    #copymapScheduleCharactersCfg {
    id = 1,
    stringid = 359,
    nextsec = 1
    };
getRow(2)->
    #copymapScheduleCharactersCfg {
    id = 2,
    stringid = 355,
    nextsec = 1
    };
getRow(3)->
    #copymapScheduleCharactersCfg {
    id = 3,
    stringid = 356,
    nextsec = 1
    };
getRow(4)->
    #copymapScheduleCharactersCfg {
    id = 4,
    stringid = 357,
    nextsec = 1
    };
getRow(5)->
    #copymapScheduleCharactersCfg {
    id = 5,
    stringid = 358,
    nextsec = 1
    };
getRow(6)->
    #copymapScheduleCharactersCfg {
    id = 6,
    stringid = 360,
    nextsec = 1
    };
getRow(7)->
    #copymapScheduleCharactersCfg {
    id = 7,
    stringid = 361,
    nextsec = 1
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

