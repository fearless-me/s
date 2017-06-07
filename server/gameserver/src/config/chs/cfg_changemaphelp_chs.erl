%% coding: latin-1
%%: 实现
-module(cfg_changemaphelp_chs).
-compile(export_all).
-include("cfg_changemaphelp.hrl").
-include("logger.hrl").

getRow(1)->
    #changemaphelpCfg {
    id = 1,
    message_content = "星月岛~阿克勒港口",
    from_mapid = 1,
    to_mapid = 2,
    need_playermaxlevel = 8,
    show_picid = 3
    };
getRow(2)->
    #changemaphelpCfg {
    id = 2,
    message_content = "阿克勒港口~星月岛",
    from_mapid = 2,
    to_mapid = 1,
    need_playermaxlevel = 8,
    show_picid = 3
    };
getRow(3)->
    #changemaphelpCfg {
    id = 3,
    message_content = "阿克勒港口~阿克勒平原",
    from_mapid = 2,
    to_mapid = 3,
    need_playermaxlevel = 12,
    show_picid = 2
    };
getRow(4)->
    #changemaphelpCfg {
    id = 4,
    message_content = "阿克勒平原~阿克勒港口",
    from_mapid = 3,
    to_mapid = 2,
    need_playermaxlevel = 12,
    show_picid = 4
    };
getRow(5)->
    #changemaphelpCfg {
    id = 5,
    message_content = "阿克勒平原~苍空之塔",
    from_mapid = 3,
    to_mapid = 4,
    need_playermaxlevel = 16,
    show_picid = 2
    };
getRow(6)->
    #changemaphelpCfg {
    id = 6,
    message_content = "苍空之塔~阿克勒平原",
    from_mapid = 4,
    to_mapid = 3,
    need_playermaxlevel = 16,
    show_picid = 4
    };
getRow(7)->
    #changemaphelpCfg {
    id = 7,
    message_content = "苍空之塔~幽魂码头",
    from_mapid = 4,
    to_mapid = 5,
    need_playermaxlevel = 20,
    show_picid = 3
    };
getRow(8)->
    #changemaphelpCfg {
    id = 8,
    message_content = "幽魂码头~苍空之塔",
    from_mapid = 5,
    to_mapid = 4,
    need_playermaxlevel = 20,
    show_picid = 2
    };
getRow(9)->
    #changemaphelpCfg {
    id = 9,
    message_content = "幽魂码头~精灵故土",
    from_mapid = 5,
    to_mapid = 6,
    need_playermaxlevel = 26,
    show_picid = 3
    };
getRow(10)->
    #changemaphelpCfg {
    id = 10,
    message_content = "精灵故土~幽魂码头",
    from_mapid = 6,
    to_mapid = 5,
    need_playermaxlevel = 26,
    show_picid = 4
    };
getRow(11)->
    #changemaphelpCfg {
    id = 11,
    message_content = "精灵故土~精灵避难所",
    from_mapid = 6,
    to_mapid = 7,
    need_playermaxlevel = 26,
    show_picid = 3
    };
getRow(12)->
    #changemaphelpCfg {
    id = 12,
    message_content = "精灵避难所~精灵故土",
    from_mapid = 7,
    to_mapid = 8,
    need_playermaxlevel = 26,
    show_picid = 3
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
    {8},
    {9},
    {10},
    {11},
    {12}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12
    ].

