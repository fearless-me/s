%% coding: latin-1
%%: 实现
-module(cfg_eventSoundCfg_chs).
-compile(export_all).
-include("cfg_eventSoundCfg.hrl").
-include("logger.hrl").

getRow(1)->
    #eventSoundCfgCfg {
    id = 1,
    sound = "ui_mission_finish",
    desc = "任务完成"
    };
getRow(2)->
    #eventSoundCfgCfg {
    id = 2,
    sound = "ui_phase_finish",
    desc = "章节完成"
    };
getRow(3)->
    #eventSoundCfgCfg {
    id = 3,
    sound = "ui_buy",
    desc = "购买道具、装备"
    };
getRow(4)->
    #eventSoundCfgCfg {
    id = 4,
    sound = "ui_sold",
    desc = "出售道具、装备"
    };
getRow(5)->
    #eventSoundCfgCfg {
    id = 5,
    sound = "ui_close",
    desc = "关闭界面"
    };
getRow(6)->
    #eventSoundCfgCfg {
    id = 6,
    sound = "ui_error",
    desc = "金钱不足、材料不足等"
    };
getRow(7)->
    #eventSoundCfgCfg {
    id = 7,
    sound = "ui_openbag",
    desc = "打开背包"
    };
getRow(8)->
    #eventSoundCfgCfg {
    id = 8,
    sound = "ui_normal_click1",
    desc = "平常的点击"
    };
getRow(9)->
    #eventSoundCfgCfg {
    id = 9,
    sound = "other_levelup",
    desc = "等级提升"
    };
getRow(10)->
    #eventSoundCfgCfg {
    id = 10,
    sound = "other_bianshen",
    desc = "变身"
    };
getRow(11)->
    #eventSoundCfgCfg {
    id = 11,
    sound = "other_logo_dragon",
    desc = "登陆的龙车"
    };
getRow(12)->
    #eventSoundCfgCfg {
    id = 12,
    sound = "other_weimian_in",
    desc = "进入位面"
    };
getRow(13)->
    #eventSoundCfgCfg {
    id = 13,
    sound = "other_weimian_out",
    desc = "退出位面"
    };
getRow(14)->
    #eventSoundCfgCfg {
    id = 14,
    sound = "other_qianghua",
    desc = "装备强化"
    };
getRow(15)->
    #eventSoundCfgCfg {
    id = 15,
    sound = "ui_itemselect",
    desc = "道具选择"
    };
getRow(16)->
    #eventSoundCfgCfg {
    id = 16,
    sound = "ui_dimix",
    desc = "宝石合成"
    };
getRow(17)->
    #eventSoundCfgCfg {
    id = 17,
    sound = "ui_diput",
    desc = "宝石镶嵌"
    };
getRow(18)->
    #eventSoundCfgCfg {
    id = 18,
    sound = "other_creat",
    desc = "创建帮会成功"
    };
getRow(19)->
    #eventSoundCfgCfg {
    id = 19,
    sound = "PVP_Count_05",
    desc = "倒数5"
    };
getRow(20)->
    #eventSoundCfgCfg {
    id = 20,
    sound = "PVP_Count_04",
    desc = "倒数4"
    };
getRow(21)->
    #eventSoundCfgCfg {
    id = 21,
    sound = "PVP_Count_03",
    desc = "倒数3"
    };
getRow(22)->
    #eventSoundCfgCfg {
    id = 22,
    sound = "PVP_Count_02",
    desc = "倒数2"
    };
getRow(23)->
    #eventSoundCfgCfg {
    id = 23,
    sound = "PVP_Count_01",
    desc = "倒数1"
    };
getRow(24)->
    #eventSoundCfgCfg {
    id = 24,
    sound = "pvp_lose",
    desc = "战斗失败"
    };
getRow(25)->
    #eventSoundCfgCfg {
    id = 25,
    sound = "pvp_success",
    desc = "战斗成功"
    };
getRow(26)->
    #eventSoundCfgCfg {
    id = 26,
    sound = "PVP_Battle_START",
    desc = "战斗开始"
    };
getRow(27)->
    #eventSoundCfgCfg {
    id = 27,
    sound = "PVP_Time_Over",
    desc = "时间到"
    };
getRow(28)->
    #eventSoundCfgCfg {
    id = 28,
    sound = "ui_message",
    desc = "新邮件到了"
    };
getRow(29)->
    #eventSoundCfgCfg {
    id = 29,
    sound = "bagfull",
    desc = "背包满了，需要程序组职业id(格式：bagfull1)"
    };
getRow(30)->
    #eventSoundCfgCfg {
    id = 30,
    sound = "intro",
    desc = "自我介绍，需要程序组职业id(格式：intro1)"
    };
getRow(31)->
    #eventSoundCfgCfg {
    id = 31,
    sound = "needmana",
    desc = "能量不足，需要程序组职业id(格式：needmana1)"
    };
getRow(32)->
    #eventSoundCfgCfg {
    id = 32,
    sound = "ph",
    desc = "攻击喊叫，需要程序组职业id和数量id(格式：ph11),各职业有3个"
    };
getRow(33)->
    #eventSoundCfgCfg {
    id = 33,
    sound = "pht",
    desc = "受击喊叫，需要程序组职业id和数量id(格式：pht11),各职业有2个"
    };
getRow(34)->
    #eventSoundCfgCfg {
    id = 34,
    sound = "other_bianshenback",
    desc = "变身回来"
    };
getRow(35)->
    #eventSoundCfgCfg {
    id = 35,
    sound = "welcome",
    desc = "打开商城"
    };
getRow(36)->
    #eventSoundCfgCfg {
    id = 36,
    sound = "welcomeback",
    desc = "关闭商城"
    };
getRow(37)->
    #eventSoundCfgCfg {
    id = 37,
    sound = "ui_newmountget",
    desc = "获得坐骑"
    };
getRow(38)->
    #eventSoundCfgCfg {
    id = 38,
    sound = "ui_newmountstar",
    desc = "坐骑升级加星"
    };
getRow(39)->
    #eventSoundCfgCfg {
    id = 39,
    sound = "card_cancel",
    desc = "创建角色时卡牌飞出音效"
    };
getRow(40)->
    #eventSoundCfgCfg {
    id = 40,
    sound = "login_wiz_sound1",
    desc = "创建角色时卡牌点击音效"
    };
getRow(41)->
    #eventSoundCfgCfg {
    id = 41,
    sound = "card_page",
    desc = "创建角色时卡牌翻页（每次）音效"
    };
getRow(42)->
    #eventSoundCfgCfg {
    id = 42,
    sound = "login_cardbreak",
    desc = "角色出现时卡牌碎裂音效"
    };
getRow(43)->
    #eventSoundCfgCfg {
    id = 43,
    sound = "login_pal_sound1",
    desc = "创建骑士时用到的音效"
    };
getRow(44)->
    #eventSoundCfgCfg {
    id = 44,
    sound = "login_pal_sound2",
    desc = "创建骑士时用到的音效"
    };
getRow(45)->
    #eventSoundCfgCfg {
    id = 45,
    sound = "login_pal_sound3",
    desc = "创建骑士时用到的音效"
    };
getRow(46)->
    #eventSoundCfgCfg {
    id = 46,
    sound = "login_pal_sound4",
    desc = "创建骑士时用到的音效"
    };
getRow(47)->
    #eventSoundCfgCfg {
    id = 47,
    sound = "login_pal_sound5",
    desc = "创建骑士时用到的音效"
    };
getRow(48)->
    #eventSoundCfgCfg {
    id = 48,
    sound = "login_pal_sound6",
    desc = "创建骑士时用到的音效"
    };
getRow(49)->
    #eventSoundCfgCfg {
    id = 49,
    sound = "login_loli_sound1",
    desc = "创建魔女时用到的音效"
    };
getRow(50)->
    #eventSoundCfgCfg {
    id = 50,
    sound = "login_loli_sound2",
    desc = "创建魔女时用到的音效"
    };
getRow(51)->
    #eventSoundCfgCfg {
    id = 51,
    sound = "login_loli_sound3",
    desc = "创建魔女时用到的音效"
    };
getRow(52)->
    #eventSoundCfgCfg {
    id = 52,
    sound = "login_loli_sound4",
    desc = "创建魔女时用到的音效"
    };
getRow(53)->
    #eventSoundCfgCfg {
    id = 53,
    sound = "login_loli_sound5",
    desc = "创建魔女时用到的音效"
    };
getRow(54)->
    #eventSoundCfgCfg {
    id = 54,
    sound = "login_loli_sound6",
    desc = "创建魔女时用到的音效"
    };
getRow(55)->
    #eventSoundCfgCfg {
    id = 55,
    sound = "login_loli_sound7",
    desc = "创建魔女时用到的音效"
    };
getRow(56)->
    #eventSoundCfgCfg {
    id = 56,
    sound = "login_wiz_sound1",
    desc = "创建法师时用到的音效"
    };
getRow(57)->
    #eventSoundCfgCfg {
    id = 57,
    sound = "login_wiz_sound2",
    desc = "创建法师时用到的音效"
    };
getRow(58)->
    #eventSoundCfgCfg {
    id = 58,
    sound = "login_wiz_sound3",
    desc = "创建法师时用到的音效"
    };
getRow(59)->
    #eventSoundCfgCfg {
    id = 59,
    sound = "login_wiz_sound4",
    desc = "创建法师时用到的音效"
    };
getRow(60)->
    #eventSoundCfgCfg {
    id = 60,
    sound = "login_wiz_sound5",
    desc = "创建法师时用到的音效"
    };
getRow(61)->
    #eventSoundCfgCfg {
    id = 61,
    sound = "login_wiz_sound6",
    desc = "创建法师时用到的音效"
    };
getRow(62)->
    #eventSoundCfgCfg {
    id = 62,
    sound = "login_wiz_sound7",
    desc = "创建法师时用到的音效"
    };
getRow(63)->
    #eventSoundCfgCfg {
    id = 63,
    sound = "login_wiz_sound8",
    desc = "创建法师时用到的音效"
    };
getRow(64)->
    #eventSoundCfgCfg {
    id = 64,
    sound = "login_ass_sound1",
    desc = "创建刺客时用到的音效"
    };
getRow(65)->
    #eventSoundCfgCfg {
    id = 65,
    sound = "login_ass_sound2",
    desc = "创建刺客时用到的音效"
    };
getRow(66)->
    #eventSoundCfgCfg {
    id = 66,
    sound = "login_ass_sound3",
    desc = "创建刺客时用到的音效"
    };
getRow(67)->
    #eventSoundCfgCfg {
    id = 67,
    sound = "login_ass_sound4",
    desc = "创建刺客时用到的音效"
    };
getRow(68)->
    #eventSoundCfgCfg {
    id = 68,
    sound = "login_ass_sound5",
    desc = "创建刺客时用到的音效"
    };
getRow(69)->
    #eventSoundCfgCfg {
    id = 69,
    sound = "login_ass_sound6",
    desc = "创建刺客时用到的音效"
    };
getRow(70)->
    #eventSoundCfgCfg {
    id = 70,
    sound = "login_ass_sound7",
    desc = "创建刺客时用到的音效"
    };
getRow(71)->
    #eventSoundCfgCfg {
    id = 71,
    sound = "ui_message",
    desc = "任务目标数量达到的音效"
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
    {28},
    {29},
    {30},
    {31},
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
    {62},
    {63},
    {64},
    {65},
    {66},
    {67},
    {68},
    {69},
    {70},
    {71}
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
    28,
    29,
    30,
    31,
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
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71
    ].

