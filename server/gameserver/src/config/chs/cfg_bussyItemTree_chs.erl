%% coding: latin-1
%%: 实现
-module(cfg_bussyItemTree_chs).
-compile(export_all).
-include("cfg_bussyItemTree.hrl").
-include("logger.hrl").

getRow(1)->
    #bussyItemTreeCfg {
    order = 10,
    isFirst = 1,
    mainType = 1,
    type = [-1],
    text = "装备",
    icon = 0,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(2)->
    #bussyItemTreeCfg {
    order = 11,
    isFirst = 0,
    mainType = 1,
    type = [-1],
    text = "全部",
    icon = 1005,
    quality = -1,
    subType = -1,
    qualityRangeShow = 1,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 1
    };
getRow(3)->
    #bussyItemTreeCfg {
    order = 12,
    isFirst = 0,
    mainType = 1,
    type = [0],
    text = "武器",
    icon = 1001,
    quality = -1,
    subType = -1,
    qualityRangeShow = 1,
    weaponRangeShow = 1,
    raceRangeShow = 0,
    levelRangeShow = 1
    };
getRow(4)->
    #bussyItemTreeCfg {
    order = 13,
    isFirst = 0,
    mainType = 1,
    type = [1],
    text = "头盔",
    icon = 1302,
    quality = -1,
    subType = -1,
    qualityRangeShow = 1,
    weaponRangeShow = 0,
    raceRangeShow = 1,
    levelRangeShow = 1
    };
getRow(5)->
    #bussyItemTreeCfg {
    order = 14,
    isFirst = 0,
    mainType = 1,
    type = [2],
    text = "耳环",
    icon = 201,
    quality = -1,
    subType = -1,
    qualityRangeShow = 1,
    weaponRangeShow = 0,
    raceRangeShow = 1,
    levelRangeShow = 1
    };
getRow(6)->
    #bussyItemTreeCfg {
    order = 15,
    isFirst = 0,
    mainType = 1,
    type = [3],
    text = "衣服",
    icon = 1105,
    quality = -1,
    subType = -1,
    qualityRangeShow = 1,
    weaponRangeShow = 0,
    raceRangeShow = 1,
    levelRangeShow = 1
    };
getRow(7)->
    #bussyItemTreeCfg {
    order = 16,
    isFirst = 0,
    mainType = 1,
    type = [4],
    text = "项链",
    icon = 101,
    quality = -1,
    subType = -1,
    qualityRangeShow = 1,
    weaponRangeShow = 0,
    raceRangeShow = 1,
    levelRangeShow = 1
    };
getRow(8)->
    #bussyItemTreeCfg {
    order = 17,
    isFirst = 0,
    mainType = 1,
    type = [5],
    text = "裤子",
    icon = 1402,
    quality = -1,
    subType = -1,
    qualityRangeShow = 1,
    weaponRangeShow = 0,
    raceRangeShow = 1,
    levelRangeShow = 1
    };
getRow(9)->
    #bussyItemTreeCfg {
    order = 18,
    isFirst = 0,
    mainType = 1,
    type = [6],
    text = "戒指",
    icon = 1,
    quality = -1,
    subType = -1,
    qualityRangeShow = 1,
    weaponRangeShow = 0,
    raceRangeShow = 1,
    levelRangeShow = 1
    };
getRow(10)->
    #bussyItemTreeCfg {
    order = 19,
    isFirst = 0,
    mainType = 1,
    type = [7],
    text = "鞋子",
    icon = 2202,
    quality = -1,
    subType = -1,
    qualityRangeShow = 1,
    weaponRangeShow = 0,
    raceRangeShow = 1,
    levelRangeShow = 1
    };
getRow(11)->
    #bussyItemTreeCfg {
    order = 21,
    isFirst = 1,
    mainType = 2,
    type = [3],
    text = "装备材料",
    icon = 0,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(12)->
    #bussyItemTreeCfg {
    order = 22,
    isFirst = 0,
    mainType = 2,
    type = [3],
    text = "全部",
    icon = 228,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 1
    };
getRow(13)->
    #bussyItemTreeCfg {
    order = 23,
    isFirst = 0,
    mainType = 2,
    type = [3],
    text = "红装",
    icon = 42,
    quality = 3,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 1
    };
getRow(14)->
    #bussyItemTreeCfg {
    order = 24,
    isFirst = 0,
    mainType = 2,
    type = [3],
    text = "紫装",
    icon = 230,
    quality = 4,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 1
    };
getRow(15)->
    #bussyItemTreeCfg {
    order = 31,
    isFirst = 1,
    mainType = 2,
    type = [28],
    text = "宠物",
    icon = 0,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(16)->
    #bussyItemTreeCfg {
    order = 32,
    isFirst = 0,
    mainType = 2,
    type = [28],
    text = "全部",
    icon = 1011,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(17)->
    #bussyItemTreeCfg {
    order = 33,
    isFirst = 0,
    mainType = 2,
    type = [28],
    text = "红宠",
    icon = 1034,
    quality = 3,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(18)->
    #bussyItemTreeCfg {
    order = 34,
    isFirst = 0,
    mainType = 2,
    type = [28],
    text = "紫宠",
    icon = 1018,
    quality = 4,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(19)->
    #bussyItemTreeCfg {
    order = 41,
    isFirst = 1,
    mainType = 2,
    type = [8],
    text = "宝箱礼包",
    icon = 0,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(20)->
    #bussyItemTreeCfg {
    order = 42,
    isFirst = 0,
    mainType = 2,
    type = [8],
    text = "全部",
    icon = 98,
    quality = -1,
    subType = -1,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
    };
getRow(21)->
    #bussyItemTreeCfg {
    order = 43,
    isFirst = 0,
    mainType = 2,
    type = [8],
    text = "装备礼包",
    icon = 462,
    quality = -1,
    subType = 7,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 1
    };
getRow(22)->
    #bussyItemTreeCfg {
    order = 44,
    isFirst = 0,
    mainType = 2,
    type = [8],
    text = "时装礼包",
    icon = 4026,
    quality = -1,
    subType = 34,
    qualityRangeShow = 0,
    weaponRangeShow = 0,
    raceRangeShow = 0,
    levelRangeShow = 0
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
    {16},
    {17},
    {18},
    {19},
    {20},
    {21},
    {22}
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
    16,
    17,
    18,
    19,
    20,
    21,
    22
    ].

