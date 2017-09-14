%% coding: latin-1
%%: 实现
-module(cfg_mainMenu_chs).
-compile(export_all).
-include("cfg_mainMenu.hrl").
-include("logger.hrl").

getRow(1)->
    #mainMenuCfg {
    id = 1,
    effect = 0,
    name = "角色信息",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 1,
    panelType = "CharacterPanel"
    };
getRow(2)->
    #mainMenuCfg {
    id = 2,
    effect = 0,
    name = "背包",
    sort = 0,
    icon = 1,
    type = 1,
    parameters = 1,
    panelType = "CharacterPanel"
    };
getRow(3)->
    #mainMenuCfg {
    id = 3,
    effect = 0,
    name = "社交",
    sort = 0,
    icon = 19,
    type = 1,
    parameters = 1,
    panelType = "FriendsPanel"
    };
getRow(4)->
    #mainMenuCfg {
    id = 4,
    effect = 0,
    name = "任务",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 1,
    panelType = "MissionLogPanel"
    };
getRow(5)->
    #mainMenuCfg {
    id = 5,
    effect = 1,
    name = "骑宠",
    sort = 101,
    icon = 14,
    type = 3,
    parameters = 23,
    panelType = "MAndPPanel"
    };
getRow(6)->
    #mainMenuCfg {
    id = 6,
    effect = 0,
    name = "邮件",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 1,
    panelType = "MailPanel"
    };
getRow(7)->
    #mainMenuCfg {
    id = 7,
    effect = 0,
    name = "技能",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 2,
    panelType = "SkillPanel"
    };
getRow(8)->
    #mainMenuCfg {
    id = 8,
    effect = 0,
    name = "仓库",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 1,
    panelType = "StoragePanel"
    };
getRow(9)->
    #mainMenuCfg {
    id = 9,
    effect = 1,
    name = "强化",
    sort = 0,
    icon = 10,
    type = 3,
    parameters = 26,
    panelType = "StrengthenPanel"
    };
getRow(10)->
    #mainMenuCfg {
    id = 10,
    effect = 0,
    name = "队伍",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 13,
    panelType = "TeamPanel"
    };
getRow(11)->
    #mainMenuCfg {
    id = 11,
    effect = 2,
    name = "交易行",
    sort = 202,
    icon = 10,
    type = 1,
    parameters = 17,
    panelType = "BussyPanel"
    };
getRow(12)->
    #mainMenuCfg {
    id = 12,
    effect = 0,
    name = "兑换",
    sort = 0,
    icon = 24,
    type = 3,
    parameters = 66,
    panelType = "ResolvePanel"
    };
getRow(13)->
    #mainMenuCfg {
    id = 13,
    effect = 0,
    name = "纹章",
    sort = 0,
    icon = 9,
    type = 1,
    parameters = 33,
    panelType = "DiamondPanel"
    };
getRow(14)->
    #mainMenuCfg {
    id = 14,
    effect = 0,
    name = "宠物",
    sort = 0,
    icon = 0,
    type = 3,
    parameters = 23,
    panelType = "PetPanel"
    };
getRow(15)->
    #mainMenuCfg {
    id = 15,
    effect = 1,
    name = "家族",
    sort = 100,
    icon = 1,
    type = 1,
    parameters = 23,
    panelType = "GuildPanel"
    };
getRow(16)->
    #mainMenuCfg {
    id = 16,
    effect = 1,
    name = "设置",
    sort = 106,
    icon = 16,
    type = 1,
    parameters = 1,
    panelType = "GameSettingPanel"
    };
getRow(18)->
    #mainMenuCfg {
    id = 18,
    effect = 0,
    name = "女神",
    sort = 0,
    icon = 18,
    type = 1,
    parameters = 5,
    panelType = "TransformNewPanel"
    };
getRow(19)->
    #mainMenuCfg {
    id = 19,
    effect = 0,
    name = "帮助",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 1,
    panelType = "HelpPanel"
    };
getRow(20)->
    #mainMenuCfg {
    id = 20,
    effect = 2,
    name = "副本",
    sort = 204,
    icon = 17,
    type = 1,
    parameters = 10,
    panelType = "CopyPanel"
    };
getRow(21)->
    #mainMenuCfg {
    id = 21,
    effect = 0,
    name = "公告",
    sort = 0,
    icon = 16,
    type = 1,
    parameters = 1,
    panelType = "NoticePanel"
    };
getRow(22)->
    #mainMenuCfg {
    id = 22,
    effect = 2,
    name = "日常",
    sort = 203,
    icon = 17,
    type = 1,
    parameters = 13,
    panelType = "CheckInPanel"
    };
getRow(23)->
    #mainMenuCfg {
    id = 23,
    effect = 2,
    name = "排行榜",
    sort = 205,
    icon = 12,
    type = 1,
    parameters = 19,
    panelType = "RankPanel"
    };
getRow(24)->
    #mainMenuCfg {
    id = 24,
    effect = 2,
    name = "商城",
    sort = 203,
    icon = 15,
    type = 1,
    parameters = 1,
    panelType = "ShopPanel"
    };
getRow(25)->
    #mainMenuCfg {
    id = 25,
    effect = 0,
    name = "社交",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 1
    };
getRow(26)->
    #mainMenuCfg {
    id = 26,
    effect = 2,
    name = "福利",
    sort = 101,
    icon = 3,
    type = 1,
    parameters = 6,
    panelType = "WelfarePanel"
    };
getRow(27)->
    #mainMenuCfg {
    id = 27,
    effect = 0,
    name = "自动挂机",
    sort = 0,
    icon = 6,
    type = 1,
    parameters = 8
    };
getRow(28)->
    #mainMenuCfg {
    id = 28,
    effect = 0,
    name = "队伍周常（废弃）",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 1000,
    panelType = "PartnerPanel"
    };
getRow(29)->
    #mainMenuCfg {
    id = 29,
    effect = 2,
    name = "成就",
    sort = 204,
    icon = 2,
    type = 1,
    parameters = 9,
    panelType = "AchievementPanel"
    };
getRow(30)->
    #mainMenuCfg {
    id = 30,
    effect = 2,
    name = "充值活动",
    sort = 103,
    icon = 28,
    type = 1,
    parameters = 100,
    panelType = "RechargeActivityPanel"
    };
getRow(32)->
    #mainMenuCfg {
    id = 32,
    effect = 0,
    name = "骑宠装备",
    sort = 0,
    icon = 0,
    type = 3,
    parameters = 110
    };
getRow(33)->
    #mainMenuCfg {
    id = 33,
    effect = 0,
    name = "神秘商店",
    sort = 0,
    icon = 15,
    type = 1,
    parameters = 32,
    panelType = "SecretShopPanel"
    };
getRow(34)->
    #mainMenuCfg {
    id = 34,
    effect = 0,
    name = "器灵",
    sort = 201,
    icon = 11,
    type = 3,
    parameters = 40,
    panelType = "WeaponImprovePanel"
    };
getRow(35)->
    #mainMenuCfg {
    id = 35,
    effect = 0,
    name = "战力提升",
    sort = 0,
    icon = 25,
    type = 1,
    parameters = 19,
    panelType = "ImproveForcePanel"
    };
getRow(36)->
    #mainMenuCfg {
    id = 36,
    effect = 1,
    name = "装备兑换（屏蔽）",
    sort = 199,
    icon = 0,
    type = 1,
    parameters = 1000,
    panelType = "FixedEquipExchangePanel"
    };
getRow(37)->
    #mainMenuCfg {
    id = 37,
    effect = 0,
    name = "骑宠远征（废弃）",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 1000,
    panelType = "MAndPPVEPanel"
    };
getRow(38)->
    #mainMenuCfg {
    id = 38,
    effect = 0,
    name = "升星",
    sort = 0,
    icon = 10,
    type = 3,
    parameters = 264
    };
getRow(39)->
    #mainMenuCfg {
    id = 39,
    effect = 0,
    name = "装备重铸",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 40
    };
getRow(40)->
    #mainMenuCfg {
    id = 40,
    effect = 0,
    name = "占卜(废弃)",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 1000
    };
getRow(41)->
    #mainMenuCfg {
    id = 41,
    effect = 0,
    name = "每日必做",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 13
    };
getRow(42)->
    #mainMenuCfg {
    id = 42,
    effect = 0,
    name = "星空之翼",
    sort = 203,
    icon = 20,
    type = 1,
    parameters = 1000,
    panelType = "WingPanel"
    };
getRow(43)->
    #mainMenuCfg {
    id = 43,
    effect = 1,
    name = "合成",
    sort = 104,
    icon = 7,
    type = 3,
    parameters = 207,
    panelType = "ResourceMakePanel"
    };
getRow(44)->
    #mainMenuCfg {
    id = 44,
    effect = 0,
    name = "骑宠精灵(废弃)",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 1000
    };
getRow(45)->
    #mainMenuCfg {
    id = 45,
    effect = 1,
    name = "符文",
    sort = 206,
    icon = 19,
    type = 1,
    parameters = 60,
    panelType = "RunePanel"
    };
getRow(46)->
    #mainMenuCfg {
    id = 46,
    effect = 0,
    name = "魔塔宝藏(废弃)",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 1000
    };
getRow(47)->
    #mainMenuCfg {
    id = 47,
    effect = 1,
    name = "婚姻",
    sort = 103,
    icon = 8,
    type = 1,
    parameters = 34,
    panelType = "NewMarriagePanel"
    };
getRow(48)->
    #mainMenuCfg {
    id = 48,
    effect = 0,
    name = "一统天下(废弃)",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 1000
    };
getRow(49)->
    #mainMenuCfg {
    id = 49,
    effect = 1,
    name = "红包",
    sort = 103,
    icon = 47,
    type = 1,
    parameters = 11,
    panelType = "RedEnvelopePanel"
    };
getRow(50)->
    #mainMenuCfg {
    id = 50,
    effect = 0,
    name = "装备合成",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 1
    };
getRow(51)->
    #mainMenuCfg {
    id = 51,
    effect = 0,
    name = "道具合成",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 1
    };
getRow(52)->
    #mainMenuCfg {
    id = 52,
    effect = 0,
    name = "时装",
    sort = 0,
    icon = 4,
    type = 3,
    parameters = 19
    };
getRow(53)->
    #mainMenuCfg {
    id = 53,
    effect = 2,
    name = "扭蛋",
    sort = 201,
    icon = 11,
    type = 1,
    parameters = 15,
    panelType = "TreasurePanel"
    };
getRow(54)->
    #mainMenuCfg {
    id = 54,
    effect = 0,
    name = "旧约会地下城(废弃)",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 1000,
    panelType = "DateUndergroundCity"
    };
getRow(55)->
    #mainMenuCfg {
    id = 55,
    effect = 0,
    name = "骑宠领地开采",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 16,
    panelType = "PetTerritoryPanel"
    };
getRow(56)->
    #mainMenuCfg {
    id = 56,
    effect = 0,
    name = "骑宠领地掠夺",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 16,
    panelType = "PetTerritoryPanel"
    };
getRow(57)->
    #mainMenuCfg {
    id = 57,
    effect = 30,
    name = "兑换第三页签（屏蔽，勿删）",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 1000,
    panelType = "ResExchangePanel"
    };
getRow(58)->
    #mainMenuCfg {
    id = 58,
    effect = 2,
    name = "七日大奖",
    sort = 102,
    icon = 13,
    type = 1,
    parameters = 12,
    panelType = "SevenDayTagertPanel"
    };
getRow(59)->
    #mainMenuCfg {
    id = 59,
    effect = 0,
    name = "赠礼",
    sort = 0,
    icon = 0,
    type = 1,
    parameters = 25
    };
getRow(60)->
    #mainMenuCfg {
    id = 60,
    effect = 1,
    name = "家园",
    sort = 105,
    icon = 9,
    type = 1,
    parameters = 25
    };
getRow(61)->
    #mainMenuCfg {
    id = 61,
    effect = 1,
    name = "图鉴",
    sort = 108,
    icon = 0,
    type = 1,
    parameters = 12
    };
getRow(62)->
    #mainMenuCfg {
    id = 62,
    effect = 1,
    name = "衣帽间",
    sort = 102,
    icon = 18,
    type = 1,
    parameters = 1
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
    {28},
    {29},
    {30},
    {32},
    {33},
    {34},
    {35},
    {36},
    {37},
    {38},
    {39},
    {40},
    {41},
    {42},
    {43},
    {44},
    {45},
    {46},
    {47},
    {48},
    {49},
    {50},
    {51},
    {52},
    {53},
    {54},
    {55},
    {56},
    {57},
    {58},
    {59},
    {60},
    {61},
    {62}
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
    28,
    29,
    30,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62
    ].

