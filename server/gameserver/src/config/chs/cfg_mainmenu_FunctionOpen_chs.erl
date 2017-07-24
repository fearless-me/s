%% coding: latin-1
%%: 实现
-module(cfg_mainmenu_FunctionOpen_chs).
-compile(export_all).
-include("cfg_mainmenu_FunctionOpen.hrl").
-include("logger.hrl").

getRow(1)->
    #mainmenu_FunctionOpenCfg {
    id = 1,
    type = 1,
    param = 3,
    name = "技能",
    namedescribe = "3级开启",
    describe = "角色技能即将开启",
    icon = "MenuIcon_25"
    };
getRow(2)->
    #mainmenu_FunctionOpenCfg {
    id = 2,
    type = 1,
    param = 4,
    name = "自动战斗",
    namedescribe = "4级开启",
    describe = "自动战斗功能即将开启",
    icon = "MenuIcon_49"
    };
getRow(3)->
    #mainmenu_FunctionOpenCfg {
    id = 3,
    type = 1,
    param = 6,
    name = "在线福利",
    namedescribe = "6级开启",
    describe = "在线福利即将开启",
    icon = "MenuIcon_4"
    };
getRow(4)->
    #mainmenu_FunctionOpenCfg {
    id = 4,
    type = 2,
    param = 32,
    name = "装备精炼",
    namedescribe = "即将开启",
    describe = "强化-精炼功能即将开启",
    icon = "MenuIcon_10"
    };
getRow(5)->
    #mainmenu_FunctionOpenCfg {
    id = 5,
    type = 2,
    param = 34,
    name = "时装",
    namedescribe = "即将开启",
    describe = "时装功能即将开启",
    icon = "MenuIcon_22"
    };
getRow(6)->
    #mainmenu_FunctionOpenCfg {
    id = 6,
    type = 2,
    param = 36,
    name = "红包",
    namedescribe = "即将开启",
    describe = "红包功能即将开启",
    icon = "MenuIcon_47"
    };
getRow(7)->
    #mainmenu_FunctionOpenCfg {
    id = 7,
    type = 1,
    param = 10,
    name = "副本",
    namedescribe = "10级开启",
    describe = "副本功能即将开启",
    icon = "MenuIcon_5"
    };
getRow(8)->
    #mainmenu_FunctionOpenCfg {
    id = 8,
    type = 2,
    param = 56,
    name = "骑宠",
    namedescribe = "即将开启",
    describe = "骑宠功能即将开启",
    icon = "MenuIcon_8"
    };
getRow(9)->
    #mainmenu_FunctionOpenCfg {
    id = 9,
    type = 1,
    param = 14,
    name = "兑换",
    namedescribe = "14级开启",
    describe = "兑换功能即将开启",
    icon = "MenuIcon_24"
    };
getRow(10)->
    #mainmenu_FunctionOpenCfg {
    id = 10,
    type = 1,
    param = 15,
    name = "扭蛋",
    namedescribe = "15级开启",
    describe = "扭蛋功能即将开启",
    icon = "MenuIcon_16"
    };
getRow(11)->
    #mainmenu_FunctionOpenCfg {
    id = 11,
    type = 1,
    param = 16,
    name = "骑宠领地",
    namedescribe = "16级开启",
    describe = "日常-骑宠领地即将开启",
    icon = "MenuIcon_8"
    };
getRow(12)->
    #mainmenu_FunctionOpenCfg {
    id = 12,
    type = 1,
    param = 18,
    name = "萝莉与绅士",
    namedescribe = "18级开启",
    describe = "日常-萝莉与绅士即将开启",
    icon = "MenuIcon_6"
    };
getRow(13)->
    #mainmenu_FunctionOpenCfg {
    id = 13,
    type = 1,
    param = 20,
    name = "转职",
    namedescribe = "20级开启",
    describe = "转职功能即将开启",
    icon = "MenuIcon_7"
    };
getRow(14)->
    #mainmenu_FunctionOpenCfg {
    id = 14,
    type = 1,
    param = 22,
    name = "竞技场",
    namedescribe = "22级开启",
    describe = "日常-竞技场即将开启",
    icon = "MenuIcon_6"
    };
getRow(15)->
    #mainmenu_FunctionOpenCfg {
    id = 15,
    type = 1,
    param = 23,
    name = "惊天喵盗团",
    namedescribe = "23级开启",
    describe = "日常-惊天喵盗团即将开启",
    icon = "MenuIcon_6"
    };
getRow(16)->
    #mainmenu_FunctionOpenCfg {
    id = 16,
    type = 1,
    param = 24,
    name = "家族",
    namedescribe = "24级开启",
    describe = "家族功能即将开启",
    icon = "MenuIcon_12"
    };
getRow(17)->
    #mainmenu_FunctionOpenCfg {
    id = 17,
    type = 1,
    param = 25,
    name = "守护女神",
    namedescribe = "25级开启",
    describe = "日常-守护女神即将开启",
    icon = "MenuIcon_6"
    };
getRow(18)->
    #mainmenu_FunctionOpenCfg {
    id = 18,
    type = 1,
    param = 26,
    name = "灵力冥想",
    namedescribe = "26级开启",
    describe = "灵力冥想功能即将开启",
    icon = "MenuIcon_4"
    };
getRow(19)->
    #mainmenu_FunctionOpenCfg {
    id = 19,
    type = 1,
    param = 27,
    name = "约会地下城",
    namedescribe = "27级开启",
    describe = "日常-约会地下城即将开启",
    icon = "MenuIcon_6"
    };
getRow(20)->
    #mainmenu_FunctionOpenCfg {
    id = 20,
    type = 2,
    param = 207,
    name = "合成",
    namedescribe = "即将开启",
    describe = "合成功能即将开启",
    icon = "MenuIcon_17"
    };
getRow(21)->
    #mainmenu_FunctionOpenCfg {
    id = 21,
    type = 2,
    param = 264,
    name = "装备升星",
    namedescribe = "即将开启",
    describe = "强化-升星功能即将开启",
    icon = "MenuIcon_10"
    };
getRow(22)->
    #mainmenu_FunctionOpenCfg {
    id = 22,
    type = 1,
    param = 33,
    name = "纹章",
    namedescribe = "33级开启",
    describe = "纹章功能即将开启",
    icon = "MenuIcon_9"
    };
getRow(23)->
    #mainmenu_FunctionOpenCfg {
    id = 23,
    type = 1,
    param = 34,
    name = "婚姻",
    namedescribe = "34级开启",
    describe = "婚姻功能即将开启",
    icon = "MenuIcon_22"
    };
getRow(24)->
    #mainmenu_FunctionOpenCfg {
    id = 24,
    type = 1,
    param = 35,
    name = "遗迹训练场",
    namedescribe = "35级开启",
    describe = "日常-遗迹训练场即将开启",
    icon = "MenuIcon_6"
    };
getRow(25)->
    #mainmenu_FunctionOpenCfg {
    id = 25,
    type = 1,
    param = 38,
    name = "深红熔渊",
    namedescribe = "38级开启",
    describe = "日常-深红熔渊即将开启",
    icon = "MenuIcon_6"
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
    {25}
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
    25
    ].

