%% coding: latin-1
%%: 实现
-module(cfg_strref_chs).
-compile(export_all).
-include("cfg_strref.hrl").
-include("logger.hrl").

getRow(0)->
    #strrefCfg {
    refdesc = "主线",
    id = 0
    };
getRow(1)->
    #strrefCfg {
    refdesc = "支线",
    id = 1
    };
getRow(2)->
    #strrefCfg {
    refdesc = "循环",
    id = 2
    };
getRow(11)->
    #strrefCfg {
    refdesc = "杀怪",
    id = 11
    };
getRow(12)->
    #strrefCfg {
    refdesc = "对话",
    id = 12
    };
getRow(13)->
    #strrefCfg {
    refdesc = "采集",
    id = 13
    };
getRow(14)->
    #strrefCfg {
    refdesc = "打怪收集",
    id = 14
    };
getRow(15)->
    #strrefCfg {
    refdesc = "使用物品",
    id = 15
    };
getRow(16)->
    #strrefCfg {
    refdesc = "完成副本",
    id = 16
    };
getRow(17)->
    #strrefCfg {
    refdesc = "完成位面",
    id = 17
    };
getRow(18)->
    #strrefCfg {
    refdesc = "进入活动",
    id = 18
    };
getRow(19)->
    #strrefCfg {
    refdesc = "达到等级",
    id = 19
    };
getRow(20)->
    #strrefCfg {
    refdesc = "遇怪",
    id = 20
    };
getRow(21)->
    #strrefCfg {
    refdesc = "NPC",
    id = 21
    };
getRow(22)->
    #strrefCfg {
    refdesc = "怪物",
    id = 22
    };
getRow(23)->
    #strrefCfg {
    refdesc = "采集物",
    id = 23
    };
getRow(24)->
    #strrefCfg {
    refdesc = "使用品",
    id = 24
    };
getRow(_)->[].

getKeyList()->[
    {0},
    {1},
    {2},
    {11},
    {12},
    {13},
    {14},
    {15},
    {16},
    {17},
    {18},
    {19},
    {20},
    {21},
    {22},
    {23},
    {24}
    ].

get1KeyList()->[
    0,
    1,
    2,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24
    ].

