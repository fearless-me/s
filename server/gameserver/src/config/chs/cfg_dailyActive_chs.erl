%% coding: latin-1
%%: 实现
-module(cfg_dailyActive_chs).
-compile(export_all).
-include("cfg_dailyActive.hrl").
-include("logger.hrl").

getRow(1)->
    #dailyActiveCfg {
    iD = 1,
    sort = 1,
    name = "通关普通本",
    type = 1,
    subType = 0,
    activeReward = 0,
    activeDegree = 4,
    limit = 3,
    relation_UI = [20,101],
    completeCondition = 0,
    itemshow = 57
    };
getRow(2)->
    #dailyActiveCfg {
    iD = 2,
    sort = 2,
    name = "通关英雄本",
    type = 1,
    subType = 6,
    activeReward = 0,
    activeDegree = 16,
    limit = 1,
    relation_UI = [20,201],
    completeCondition = 0,
    itemshow = 58
    };
getRow(4)->
    #dailyActiveCfg {
    iD = 4,
    sort = 6,
    name = "公会的委托",
    type = 2,
    subType = 15,
    activeReward = 0,
    activeDegree = 8,
    limit = 2,
    relation_UI = [15,0],
    completeCondition = 0,
    itemshow = 4200
    };
getRow(5)->
    #dailyActiveCfg {
    iD = 5,
    sort = 7,
    name = "女神禁闭室",
    type = 2,
    subType = 13,
    activeReward = 0,
    activeDegree = 15,
    limit = 1,
    relation_UI = [22,13],
    completeCondition = 1,
    itemshow = 4303
    };
getRow(6)->
    #dailyActiveCfg {
    iD = 6,
    sort = 4,
    name = "守护女神",
    type = 2,
    subType = 1,
    activeReward = 0,
    activeDegree = 15,
    limit = 1,
    relation_UI = [22,1],
    completeCondition = 1,
    itemshow = 20
    };
getRow(7)->
    #dailyActiveCfg {
    iD = 7,
    sort = 3,
    name = "惊天喵盗团",
    type = 2,
    subType = 4,
    activeReward = 0,
    activeDegree = 10,
    limit = 2,
    relation_UI = [22,4],
    completeCondition = 0,
    itemshow = 700
    };
getRow(8)->
    #dailyActiveCfg {
    iD = 8,
    sort = 8,
    name = "首领入侵",
    type = 2,
    subType = 2,
    activeReward = 0,
    activeDegree = 10,
    limit = 1,
    relation_UI = [22,2],
    completeCondition = 1,
    itemshow = 700
    };
getRow(9)->
    #dailyActiveCfg {
    iD = 9,
    sort = 5,
    name = "竞技场",
    type = 2,
    subType = 16,
    activeReward = 0,
    activeDegree = 3,
    limit = 5,
    relation_UI = [22,16],
    completeCondition = 1,
    itemshow = 902
    };
getRow(10)->
    #dailyActiveCfg {
    iD = 10,
    sort = 9,
    name = "萝莉与绅士",
    type = 2,
    subType = 30,
    activeReward = 0,
    activeDegree = 8,
    limit = 2,
    relation_UI = [22,30],
    completeCondition = 1,
    itemshow = 1
    };
getRow(12)->
    #dailyActiveCfg {
    iD = 12,
    sort = 11,
    name = "元素保卫战",
    type = 2,
    subType = 31,
    activeReward = 0,
    activeDegree = 15,
    limit = 1,
    relation_UI = [22,31],
    completeCondition = 0,
    itemshow = 7000
    };
getRow(13)->
    #dailyActiveCfg {
    iD = 13,
    sort = 12,
    name = "体力赠送",
    type = 3,
    subType = 0,
    activeReward = 0,
    activeDegree = 20,
    limit = 1,
    relation_UI = [3,0],
    completeCondition = 0,
    itemshow = 85
    };
getRow(14)->
    #dailyActiveCfg {
    iD = 14,
    sort = 13,
    name = "乘坐家族游乐设施",
    type = 3,
    subType = 0,
    activeReward = 0,
    activeDegree = 20,
    limit = 1,
    relation_UI = [15,0],
    completeCondition = 0,
    itemshow = 11
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {4},
    {5},
    {6},
    {7},
    {8},
    {9},
    {10},
    {12},
    {13},
    {14}
    ].

get1KeyList()->[
    1,
    2,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    12,
    13,
    14
    ].

