%% coding: latin-1
%%: 实现
-module(cfg_activitylist_chs).
-compile(export_all).
-include("cfg_activitylist.hrl").
-include("logger.hrl").

getRow(1)->
    #activitylistCfg {
    id = 1,
    name = "铸币熔炉",
    gold = 3,
    diamond = 0,
    exp = 0,
    honour = 0,
    goddess = 0,
    pet = 0,
    strengthen = 0,
    gem = 0
    };
getRow(2)->
    #activitylistCfg {
    id = 2,
    name = "新兵训练营",
    gold = 0,
    diamond = 0,
    exp = 3,
    honour = 0,
    goddess = 0,
    pet = 0,
    strengthen = 0,
    gem = 0
    };
getRow(3)->
    #activitylistCfg {
    id = 3,
    name = "星空宝库",
    gold = 0,
    diamond = 2,
    exp = 0,
    honour = 0,
    goddess = 0,
    pet = 0,
    strengthen = 0,
    gem = 2
    };
getRow(4)->
    #activitylistCfg {
    id = 4,
    name = "藏宝海湾",
    gold = 0,
    diamond = 0,
    exp = 0,
    honour = 0,
    goddess = 0,
    pet = 3,
    strengthen = 3,
    gem = 0
    };
getRow(5)->
    #activitylistCfg {
    id = 5,
    name = "时空裂痕",
    gold = 2,
    diamond = 0,
    exp = 2,
    honour = 0,
    goddess = 1,
    pet = 1,
    strengthen = 1,
    gem = 1
    };
getRow(6)->
    #activitylistCfg {
    id = 6,
    name = "盗宝贼踪迹",
    gold = 1,
    diamond = 0,
    exp = 1,
    honour = 0,
    goddess = 1,
    pet = 2,
    strengthen = 1,
    gem = 1
    };
getRow(7)->
    #activitylistCfg {
    id = 7,
    name = "首领入侵",
    gold = 1,
    diamond = 0,
    exp = 0,
    honour = 0,
    goddess = 2,
    pet = 0,
    strengthen = 0,
    gem = 1
    };
getRow(8)->
    #activitylistCfg {
    id = 8,
    name = "守护女神",
    gold = 0,
    diamond = 0,
    exp = 2,
    honour = 0,
    goddess = 0,
    pet = 0,
    strengthen = 0,
    gem = 3
    };
getRow(9)->
    #activitylistCfg {
    id = 9,
    name = "守卫碧空城",
    gold = 1,
    diamond = 0,
    exp = 1,
    honour = 0,
    goddess = 1,
    pet = 1,
    strengthen = 2,
    gem = 1
    };
getRow(10)->
    #activitylistCfg {
    id = 10,
    name = "混沌战场",
    gold = 0,
    diamond = 0,
    exp = 0,
    honour = 3,
    goddess = 3,
    pet = 0,
    strengthen = 0,
    gem = 0
    };
getRow(11)->
    #activitylistCfg {
    id = 11,
    name = "经验地图",
    gold = 0,
    diamond = 0,
    exp = 2,
    honour = 0,
    goddess = 0,
    pet = 0,
    strengthen = 0,
    gem = 0
    };
getRow(12)->
    #activitylistCfg {
    id = 12,
    name = "勇者试炼",
    gold = 0,
    diamond = 0,
    exp = 0,
    honour = 0,
    goddess = 2,
    pet = 0,
    strengthen = 0,
    gem = 0
    };
getRow(13)->
    #activitylistCfg {
    id = 13,
    name = "伙伴试炼",
    gold = 0,
    diamond = 0,
    exp = 0,
    honour = 0,
    goddess = 1,
    pet = 1,
    strengthen = 1,
    gem = 1
    };
getRow(14)->
    #activitylistCfg {
    id = 14,
    name = "世界守护",
    gold = 0,
    diamond = 0,
    exp = 0,
    honour = 2,
    goddess = 0,
    pet = 0,
    strengthen = 0,
    gem = 0
    };
getRow(15)->
    #activitylistCfg {
    id = 15,
    name = "循环任务",
    gold = 0,
    diamond = 0,
    exp = 4,
    honour = 0,
    goddess = 0,
    pet = 0,
    strengthen = 0,
    gem = 0
    };
getRow(16)->
    #activitylistCfg {
    id = 16,
    name = "港口竞速",
    gold = 0,
    diamond = 0,
    exp = 4,
    honour = 0,
    goddess = 0,
    pet = 0,
    strengthen = 0,
    gem = 0
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
    {12},
    {13},
    {14},
    {15},
    {16}
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
    12,
    13,
    14,
    15,
    16
    ].

