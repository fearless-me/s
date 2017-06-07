%% coding: latin-1
%%: 实现
-module(cfg_bussyItemTree_chs).
-compile(export_all).
-include("cfg_bussyItemTree.hrl").
-include("logger.hrl").

getRow(1)->
    #bussyItemTreeCfg {
    order = 1,
    isFirst = 1,
    mainType = 1,
    type = [0,1,2,3,4,5,6,7],
    subType = -1,
    text = "装备"
    };
getRow(2)->
    #bussyItemTreeCfg {
    order = 2,
    isFirst = 0,
    mainType = 1,
    type = [0],
    subType = -1,
    text = "主手"
    };
getRow(3)->
    #bussyItemTreeCfg {
    order = 3,
    isFirst = 0,
    mainType = 1,
    type = [1],
    subType = -1,
    text = "头盔"
    };
getRow(4)->
    #bussyItemTreeCfg {
    order = 4,
    isFirst = 0,
    mainType = 1,
    type = [2],
    subType = -1,
    text = "耳环"
    };
getRow(5)->
    #bussyItemTreeCfg {
    order = 5,
    isFirst = 0,
    mainType = 1,
    type = [3],
    subType = -1,
    text = "胸甲"
    };
getRow(6)->
    #bussyItemTreeCfg {
    order = 6,
    isFirst = 0,
    mainType = 1,
    type = [4],
    subType = -1,
    text = "项链"
    };
getRow(7)->
    #bussyItemTreeCfg {
    order = 7,
    isFirst = 0,
    mainType = 1,
    type = [5],
    subType = -1,
    text = "裤子"
    };
getRow(8)->
    #bussyItemTreeCfg {
    order = 8,
    isFirst = 0,
    mainType = 1,
    type = [6],
    subType = -1,
    text = "戒指"
    };
getRow(9)->
    #bussyItemTreeCfg {
    order = 9,
    isFirst = 0,
    mainType = 1,
    type = [7],
    subType = -1,
    text = "靴子"
    };
getRow(10)->
    #bussyItemTreeCfg {
    order = 10,
    isFirst = 1,
    mainType = 2,
    type = [4],
    subType = -1,
    text = "纹章"
    };
getRow(11)->
    #bussyItemTreeCfg {
    order = 11,
    isFirst = 0,
    mainType = 2,
    type = [4],
    subType = 1,
    text = "赤尖纹章"
    };
getRow(12)->
    #bussyItemTreeCfg {
    order = 12,
    isFirst = 0,
    mainType = 2,
    type = [4],
    subType = 2,
    text = "天蓝纹章"
    };
getRow(13)->
    #bussyItemTreeCfg {
    order = 13,
    isFirst = 0,
    mainType = 2,
    type = [4],
    subType = 4,
    text = "碧月纹章"
    };
getRow(14)->
    #bussyItemTreeCfg {
    order = 14,
    isFirst = 1,
    mainType = 2,
    type = [9],
    subType = -1,
    text = "强化"
    };
getRow(15)->
    #bussyItemTreeCfg {
    order = 15,
    isFirst = 0,
    mainType = 2,
    type = [9],
    subType = 0,
    text = "装备强化"
    };
getRow(16)->
    #bussyItemTreeCfg {
    order = 16,
    isFirst = 0,
    mainType = 2,
    type = [9],
    subType = 1,
    text = "器灵强化"
    };
getRow(17)->
    #bussyItemTreeCfg {
    order = 17,
    isFirst = 0,
    mainType = 2,
    type = [9],
    subType = 2,
    text = "骑宠强化"
    };
getRow(18)->
    #bussyItemTreeCfg {
    order = 18,
    isFirst = 1,
    mainType = 2,
    type = [8],
    subType = -1,
    text = "礼包"
    };
getRow(19)->
    #bussyItemTreeCfg {
    order = 19,
    isFirst = 1,
    mainType = 2,
    type = [12],
    subType = -1,
    text = "钻石卡"
    };
getRow(20)->
    #bussyItemTreeCfg {
    order = 20,
    isFirst = 1,
    mainType = 2,
    type = [14],
    subType = -1,
    text = "藏宝图"
    };
getRow(21)->
    #bussyItemTreeCfg {
    order = 21,
    isFirst = 1,
    mainType = 2,
    type = [2],
    subType = -1,
    text = "药水合剂"
    };
getRow(22)->
    #bussyItemTreeCfg {
    order = 22,
    isFirst = 1,
    mainType = 2,
    type = [13],
    subType = -1,
    text = "能力卷轴"
    };
getRow(23)->
    #bussyItemTreeCfg {
    order = 23,
    isFirst = 1,
    mainType = 2,
    type = [15],
    subType = -1,
    text = "称号卷轴"
    };
getRow(24)->
    #bussyItemTreeCfg {
    order = 24,
    isFirst = 1,
    mainType = 2,
    type = [1,5,6,7,10,11,16],
    subType = -1,
    text = "其他"
    };
getRow(25)->
    #bussyItemTreeCfg {
    order = 25,
    isFirst = 1,
    mainType = 4,
    type = [24,25],
    subType = -1,
    text = "符文"
    };
getRow(26)->
    #bussyItemTreeCfg {
    order = 26,
    isFirst = 0,
    mainType = 4,
    type = [24],
    subType = 0,
    text = "角色符文"
    };
getRow(27)->
    #bussyItemTreeCfg {
    order = 27,
    isFirst = 0,
    mainType = 4,
    type = [25],
    subType = 1,
    text = "骑宠符文"
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
    {22},
    {23},
    {24},
    {25},
    {26},
    {27}
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
    22,
    23,
    24,
    25,
    26,
    27
    ].

