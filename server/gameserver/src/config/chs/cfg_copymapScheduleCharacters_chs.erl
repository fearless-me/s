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
getRow(30002)->
    #copymapScheduleCharactersCfg {
    id = 30002,
    stringid = 373,
    nextsec = 2
    };
getRow(30006)->
    #copymapScheduleCharactersCfg {
    id = 30006,
    stringid = 374,
    nextsec = 2
    };
getRow(30010)->
    #copymapScheduleCharactersCfg {
    id = 30010,
    stringid = 375,
    nextsec = 2
    };
getRow(30099)->
    #copymapScheduleCharactersCfg {
    id = 30099,
    stringid = 395,
    nextsec = 2
    };
getRow(30102)->
    #copymapScheduleCharactersCfg {
    id = 30102,
    stringid = 376,
    nextsec = 2
    };
getRow(30106)->
    #copymapScheduleCharactersCfg {
    id = 30106,
    stringid = 377,
    nextsec = 2
    };
getRow(30108)->
    #copymapScheduleCharactersCfg {
    id = 30108,
    stringid = 378,
    nextsec = 2
    };
getRow(30199)->
    #copymapScheduleCharactersCfg {
    id = 30199,
    stringid = 396,
    nextsec = 2
    };
getRow(30202)->
    #copymapScheduleCharactersCfg {
    id = 30202,
    stringid = 379,
    nextsec = 2
    };
getRow(30206)->
    #copymapScheduleCharactersCfg {
    id = 30206,
    stringid = 380,
    nextsec = 2
    };
getRow(30210)->
    #copymapScheduleCharactersCfg {
    id = 30210,
    stringid = 381,
    nextsec = 2
    };
getRow(30299)->
    #copymapScheduleCharactersCfg {
    id = 30299,
    stringid = 397,
    nextsec = 2
    };
getRow(30302)->
    #copymapScheduleCharactersCfg {
    id = 30302,
    stringid = 382,
    nextsec = 2
    };
getRow(30306)->
    #copymapScheduleCharactersCfg {
    id = 30306,
    stringid = 383,
    nextsec = 2
    };
getRow(30308)->
    #copymapScheduleCharactersCfg {
    id = 30308,
    stringid = 384,
    nextsec = 2
    };
getRow(30399)->
    #copymapScheduleCharactersCfg {
    id = 30399,
    stringid = 398,
    nextsec = 2
    };
getRow(30402)->
    #copymapScheduleCharactersCfg {
    id = 30402,
    stringid = 385,
    nextsec = 2
    };
getRow(30406)->
    #copymapScheduleCharactersCfg {
    id = 30406,
    stringid = 386,
    nextsec = 2
    };
getRow(30408)->
    #copymapScheduleCharactersCfg {
    id = 30408,
    stringid = 387,
    nextsec = 2
    };
getRow(30499)->
    #copymapScheduleCharactersCfg {
    id = 30499,
    stringid = 399,
    nextsec = 2
    };
getRow(30500)->
    #copymapScheduleCharactersCfg {
    id = 30500,
    stringid = 388,
    nextsec = 2
    };
getRow(30502)->
    #copymapScheduleCharactersCfg {
    id = 30502,
    stringid = 389,
    nextsec = 2
    };
getRow(30504)->
    #copymapScheduleCharactersCfg {
    id = 30504,
    stringid = 390,
    nextsec = 2
    };
getRow(30506)->
    #copymapScheduleCharactersCfg {
    id = 30506,
    stringid = 391,
    nextsec = 2
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7},
    {30002},
    {30006},
    {30010},
    {30099},
    {30102},
    {30106},
    {30108},
    {30199},
    {30202},
    {30206},
    {30210},
    {30299},
    {30302},
    {30306},
    {30308},
    {30399},
    {30402},
    {30406},
    {30408},
    {30499},
    {30500},
    {30502},
    {30504},
    {30506}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    30002,
    30006,
    30010,
    30099,
    30102,
    30106,
    30108,
    30199,
    30202,
    30206,
    30210,
    30299,
    30302,
    30306,
    30308,
    30399,
    30402,
    30406,
    30408,
    30499,
    30500,
    30502,
    30504,
    30506
    ].

