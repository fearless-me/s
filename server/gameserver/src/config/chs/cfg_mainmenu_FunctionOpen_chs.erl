%% coding: latin-1
%%: 实现
-module(cfg_mainmenu_FunctionOpen_chs).
-compile(export_all).
-include("cfg_mainmenu_FunctionOpen.hrl").
-include("logger.hrl").

getRow(1)->
    #mainmenu_FunctionOpenCfg {
    id = 1,
    level = 3,
    name = "技能",
    describe = "角色技能开启",
    icon = "MenuIcon_25"
    };
getRow(2)->
    #mainmenu_FunctionOpenCfg {
    id = 2,
    level = 4,
    name = "自动战斗",
    describe = "自动战斗功能开启",
    icon = "MenuIcon_49"
    };
getRow(3)->
    #mainmenu_FunctionOpenCfg {
    id = 3,
    level = 5,
    name = "在线福利",
    describe = "在线福利开启",
    icon = "MenuIcon_4"
    };
getRow(4)->
    #mainmenu_FunctionOpenCfg {
    id = 4,
    level = 6,
    name = "女神",
    describe = "女神功能开启",
    icon = "MenuIcon_18"
    };
getRow(5)->
    #mainmenu_FunctionOpenCfg {
    id = 5,
    level = 7,
    name = "装备精炼",
    describe = "强化-精炼功能开启",
    icon = "MenuIcon_10"
    };
getRow(6)->
    #mainmenu_FunctionOpenCfg {
    id = 6,
    level = 8,
    name = "时装",
    describe = "时装功能开启",
    icon = "MenuIcon_22"
    };
getRow(7)->
    #mainmenu_FunctionOpenCfg {
    id = 7,
    level = 9,
    name = "红包",
    describe = "红包功能开启",
    icon = "MenuIcon_47"
    };
getRow(8)->
    #mainmenu_FunctionOpenCfg {
    id = 8,
    level = 10,
    name = "副本",
    describe = "副本功能开启",
    icon = "MenuIcon_5"
    };
getRow(9)->
    #mainmenu_FunctionOpenCfg {
    id = 9,
    level = 11,
    name = "器灵",
    describe = "器灵功能开启",
    icon = "MenuIcon_11"
    };
getRow(10)->
    #mainmenu_FunctionOpenCfg {
    id = 10,
    level = 12,
    name = "骑宠",
    describe = "骑宠功能开启",
    icon = "MenuIcon_8"
    };
getRow(11)->
    #mainmenu_FunctionOpenCfg {
    id = 11,
    level = 14,
    name = "兑换",
    describe = "兑换功能开启",
    icon = "MenuIcon_24"
    };
getRow(12)->
    #mainmenu_FunctionOpenCfg {
    id = 12,
    level = 15,
    name = "扭蛋",
    describe = "扭蛋功能开启",
    icon = "MenuIcon_16"
    };
getRow(13)->
    #mainmenu_FunctionOpenCfg {
    id = 13,
    level = 16,
    name = "骑宠助阵",
    describe = "骑宠助阵功能开启",
    icon = "MenuIcon_8"
    };
getRow(14)->
    #mainmenu_FunctionOpenCfg {
    id = 14,
    level = 18,
    name = "萝莉与绅士",
    describe = "日常-萝莉与绅士开启",
    icon = "MenuIcon_6"
    };
getRow(15)->
    #mainmenu_FunctionOpenCfg {
    id = 15,
    level = 20,
    name = "转职",
    describe = "转职功能开启",
    icon = "MenuIcon_7"
    };
getRow(16)->
    #mainmenu_FunctionOpenCfg {
    id = 16,
    level = 21,
    name = "星空之翼",
    describe = "星空之翼功能开启",
    icon = "MenuIcon_20"
    };
getRow(17)->
    #mainmenu_FunctionOpenCfg {
    id = 17,
    level = 22,
    name = "竞技场",
    describe = "日常-竞技场开启",
    icon = "MenuIcon_6"
    };
getRow(18)->
    #mainmenu_FunctionOpenCfg {
    id = 18,
    level = 23,
    name = "惊天喵盗团",
    describe = "日常-惊天喵盗团开启",
    icon = "MenuIcon_6"
    };
getRow(19)->
    #mainmenu_FunctionOpenCfg {
    id = 19,
    level = 24,
    name = "家族",
    describe = "家族功能开启",
    icon = "MenuIcon_12"
    };
getRow(20)->
    #mainmenu_FunctionOpenCfg {
    id = 20,
    level = 25,
    name = "守护女神",
    describe = "日常-守护女神开启",
    icon = "MenuIcon_6"
    };
getRow(21)->
    #mainmenu_FunctionOpenCfg {
    id = 21,
    level = 26,
    name = "灵力冥想",
    describe = "灵力冥想功能开启",
    icon = "MenuIcon_4"
    };
getRow(22)->
    #mainmenu_FunctionOpenCfg {
    id = 22,
    level = 30,
    name = "合成",
    describe = "合成功能开启",
    icon = "MenuIcon_17"
    };
getRow(23)->
    #mainmenu_FunctionOpenCfg {
    id = 23,
    level = 30,
    name = "装备升星",
    describe = "强化-升星功能开启",
    icon = "MenuIcon_10"
    };
getRow(24)->
    #mainmenu_FunctionOpenCfg {
    id = 24,
    level = 32,
    name = "约会地下城",
    describe = "日常-约会地下城开启",
    icon = "MenuIcon_6"
    };
getRow(25)->
    #mainmenu_FunctionOpenCfg {
    id = 25,
    level = 33,
    name = "纹章",
    describe = "纹章功能开启",
    icon = "MenuIcon_9"
    };
getRow(26)->
    #mainmenu_FunctionOpenCfg {
    id = 26,
    level = 34,
    name = "婚姻",
    describe = "婚姻功能开启",
    icon = "MenuIcon_22"
    };
getRow(27)->
    #mainmenu_FunctionOpenCfg {
    id = 27,
    level = 35,
    name = "遗迹训练场",
    describe = "日常-遗迹训练场开启",
    icon = "MenuIcon_6"
    };
getRow(28)->
    #mainmenu_FunctionOpenCfg {
    id = 28,
    level = 38,
    name = "深红熔渊",
    describe = "日常-深红熔渊开启",
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
    {25},
    {26},
    {27},
    {28}
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
    27,
    28
    ].

