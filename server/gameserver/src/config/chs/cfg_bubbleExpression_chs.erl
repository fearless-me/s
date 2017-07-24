%% coding: latin-1
%%: 实现
-module(cfg_bubbleExpression_chs).
-compile(export_all).
-include("cfg_bubbleExpression.hrl").
-include("logger.hrl").

getRow(1)->
    #bubbleExpressionCfg {
    id = 1,
    type = 1,
    name = "doge",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "小狗"
    };
getRow(2)->
    #bubbleExpressionCfg {
    id = 2,
    type = 1,
    name = "ok",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "OK"
    };
getRow(3)->
    #bubbleExpressionCfg {
    id = 3,
    type = 1,
    name = "aixinyan",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "爱心眼"
    };
getRow(4)->
    #bubbleExpressionCfg {
    id = 4,
    type = 1,
    name = "daku",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "大哭"
    };
getRow(5)->
    #bubbleExpressionCfg {
    id = 5,
    type = 1,
    name = "diantou",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "点头"
    };
getRow(6)->
    #bubbleExpressionCfg {
    id = 6,
    type = 1,
    name = "dianzan",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "点赞"
    };
getRow(7)->
    #bubbleExpressionCfg {
    id = 7,
    type = 1,
    name = "duqi",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "赌气"
    };
getRow(8)->
    #bubbleExpressionCfg {
    id = 8,
    type = 1,
    name = "fadai",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "大袋"
    };
getRow(9)->
    #bubbleExpressionCfg {
    id = 9,
    type = 1,
    name = "fanyun",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "犯晕"
    };
getRow(10)->
    #bubbleExpressionCfg {
    id = 10,
    type = 1,
    name = "gaobai",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "告白"
    };
getRow(11)->
    #bubbleExpressionCfg {
    id = 11,
    type = 1,
    name = "haipa",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "害怕"
    };
getRow(12)->
    #bubbleExpressionCfg {
    id = 12,
    type = 1,
    name = "haixiu",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "害羞"
    };
getRow(13)->
    #bubbleExpressionCfg {
    id = 13,
    type = 1,
    name = "hanyan",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "流汗"
    };
getRow(14)->
    #bubbleExpressionCfg {
    id = 14,
    type = 1,
    name = "hengheng",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "哼哼"
    };
getRow(15)->
    #bubbleExpressionCfg {
    id = 15,
    type = 1,
    name = "huaixiao",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "坏笑"
    };
getRow(16)->
    #bubbleExpressionCfg {
    id = 16,
    type = 1,
    name = "jiyanxiao",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "挤眼笑"
    };
getRow(17)->
    #bubbleExpressionCfg {
    id = 17,
    type = 1,
    name = "jiandaoshou",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "剪刀手"
    };
getRow(18)->
    #bubbleExpressionCfg {
    id = 18,
    type = 1,
    name = "jingxia",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "惊吓"
    };
getRow(19)->
    #bubbleExpressionCfg {
    id = 19,
    type = 1,
    name = "kaixin",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "开心"
    };
getRow(20)->
    #bubbleExpressionCfg {
    id = 20,
    type = 1,
    name = "kuzhexiao",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "苦笑"
    };
getRow(21)->
    #bubbleExpressionCfg {
    id = 21,
    type = 1,
    name = "ku",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "开心"
    };
getRow(22)->
    #bubbleExpressionCfg {
    id = 22,
    type = 1,
    name = "liulei",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "哭"
    };
getRow(23)->
    #bubbleExpressionCfg {
    id = 23,
    type = 1,
    name = "maimeng",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "卖萌"
    };
getRow(24)->
    #bubbleExpressionCfg {
    id = 24,
    type = 1,
    name = "miyanxiao",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "眯眼笑"
    };
getRow(25)->
    #bubbleExpressionCfg {
    id = 25,
    type = 1,
    name = "momotou",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0,
    display_name = "摸摸头"
    };
getRow(26)->
    #bubbleExpressionCfg {
    id = 26,
    type = 1,
    name = "nanguo",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0
    };
getRow(27)->
    #bubbleExpressionCfg {
    id = 27,
    type = 1,
    name = "paishou",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0
    };
getRow(28)->
    #bubbleExpressionCfg {
    id = 28,
    type = 1,
    name = "qinqin",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0
    };
getRow(29)->
    #bubbleExpressionCfg {
    id = 29,
    type = 1,
    name = "shengbing",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0
    };
getRow(30)->
    #bubbleExpressionCfg {
    id = 30,
    type = 1,
    name = "shengqi",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0
    };
getRow(31)->
    #bubbleExpressionCfg {
    id = 31,
    type = 1,
    name = "shuijiao",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0
    };
getRow(32)->
    #bubbleExpressionCfg {
    id = 32,
    type = 1,
    name = "tanqi",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0
    };
getRow(33)->
    #bubbleExpressionCfg {
    id = 33,
    type = 1,
    name = "xiexie",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0
    };
getRow(34)->
    #bubbleExpressionCfg {
    id = 34,
    type = 1,
    name = "xinsui",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0
    };
getRow(35)->
    #bubbleExpressionCfg {
    id = 35,
    type = 1,
    name = "yiwen",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0
    };
getRow(36)->
    #bubbleExpressionCfg {
    id = 36,
    type = 1,
    name = "zaijian",
    expressionlist = [1,2],
    continueTime = 2,
    lock = 0,
    action_dance = 0
    };
getRow(51)->
    #bubbleExpressionCfg {
    id = 51,
    type = 2,
    name = "paishou1",
    icon = "action_paishou",
    continueTime = 2,
    lock = 0,
    action_dance = 0
    };
getRow(52)->
    #bubbleExpressionCfg {
    id = 52,
    type = 2,
    name = "tiaopi1",
    icon = "action_guilian",
    continueTime = 2,
    lock = 0,
    action_dance = 0
    };
getRow(53)->
    #bubbleExpressionCfg {
    id = 53,
    type = 2,
    name = "wuliao1",
    icon = "action_shenyao",
    continueTime = 2,
    lock = 0,
    action_dance = 0
    };
getRow(54)->
    #bubbleExpressionCfg {
    id = 54,
    type = 2,
    name = "xingli1",
    icon = "action_xingli",
    continueTime = 2,
    lock = 0,
    action_dance = 0
    };
getRow(55)->
    #bubbleExpressionCfg {
    id = 55,
    type = 2,
    name = "aiyi1",
    icon = "action_bixin",
    continueTime = 2,
    lock = 0,
    action_dance = 0
    };
getRow(56)->
    #bubbleExpressionCfg {
    id = 56,
    type = 2,
    name = "beishang1",
    icon = "action_kuqi",
    continueTime = 2,
    lock = 0,
    action_dance = 0
    };
getRow(57)->
    #bubbleExpressionCfg {
    id = 57,
    type = 2,
    name = "feiwen1",
    icon = "action_huanying",
    continueTime = 2,
    lock = 0,
    action_dance = 0
    };
getRow(58)->
    #bubbleExpressionCfg {
    id = 58,
    type = 2,
    name = "fennu1",
    icon = "action_fennu",
    continueTime = 2,
    lock = 0,
    action_dance = 0
    };
getRow(59)->
    #bubbleExpressionCfg {
    id = 59,
    type = 2,
    name = "guancha1",
    icon = "action_zhangwang",
    continueTime = 2,
    lock = 0,
    action_dance = 0
    };
getRow(60)->
    #bubbleExpressionCfg {
    id = 60,
    type = 2,
    name = "haipa1",
    icon = "action_haipa",
    continueTime = 2,
    lock = 0,
    action_dance = 0
    };
getRow(61)->
    #bubbleExpressionCfg {
    id = 61,
    type = 2,
    name = "huaquanquan1",
    icon = "action_huaquanquan",
    continueTime = 1,
    lock = 0,
    action_dance = 0
    };
getRow(62)->
    #bubbleExpressionCfg {
    id = 62,
    type = 2,
    name = "huishou1",
    icon = "action_huishou",
    continueTime = 2,
    lock = 0,
    action_dance = 0
    };
getRow(63)->
    #bubbleExpressionCfg {
    id = 63,
    type = 2,
    name = "jingong1",
    icon = "action_qianjin",
    continueTime = 2,
    lock = 0,
    action_dance = 0
    };
getRow(64)->
    #bubbleExpressionCfg {
    id = 64,
    type = 2,
    name = "kaixin1",
    icon = "action_huanhu",
    continueTime = 2,
    lock = 0,
    action_dance = 0
    };
getRow(65)->
    #bubbleExpressionCfg {
    id = 65,
    type = 2,
    name = "tiaowu1",
    icon = "action_wudao1",
    continueTime = 1,
    lock = 0,
    action_dance = 1
    };
getRow(66)->
    #bubbleExpressionCfg {
    id = 66,
    type = 2,
    name = "wudao2",
    icon = "action_wudao2",
    continueTime = 1,
    lock = 0,
    action_dance = 1
    };
getRow(67)->
    #bubbleExpressionCfg {
    id = 67,
    type = 2,
    name = "wudao3",
    icon = "action_wudao3",
    continueTime = 1,
    lock = 0,
    action_dance = 1
    };
getRow(68)->
    #bubbleExpressionCfg {
    id = 68,
    type = 2,
    name = "dianyinshuaishouwu",
    icon = "action_wudao4",
    continueTime = 1,
    lock = 0,
    action_dance = 1
    };
getRow(69)->
    #bubbleExpressionCfg {
    id = 69,
    type = 2,
    name = "yueqiumanbu",
    icon = "action_wudao5",
    continueTime = 1,
    lock = 0,
    action_dance = 1
    };
getRow(70)->
    #bubbleExpressionCfg {
    id = 70,
    type = 2,
    name = "nobody",
    icon = "action_wudao6",
    continueTime = 1,
    lock = 0,
    action_dance = 1
    };
getRow(71)->
    #bubbleExpressionCfg {
    id = 71,
    type = 2,
    name = "jilejingtu",
    icon = "action_wudao7",
    continueTime = 1,
    lock = 0,
    action_dance = 1
    };
getRow(72)->
    #bubbleExpressionCfg {
    id = 72,
    type = 2,
    name = "fuguwu",
    icon = "action_wudao8",
    continueTime = 1,
    lock = 0,
    action_dance = 1
    };
getRow(73)->
    #bubbleExpressionCfg {
    id = 73,
    type = 2,
    name = "niuniuwu",
    icon = "action_wudao9",
    continueTime = 1,
    lock = 0,
    action_dance = 1
    };
getRow(74)->
    #bubbleExpressionCfg {
    id = 74,
    type = 2,
    name = "tufengwu1",
    icon = "action_wudao10",
    continueTime = 1,
    lock = 0,
    action_dance = 1
    };
getRow(75)->
    #bubbleExpressionCfg {
    id = 75,
    type = 3,
    name = "other\vfx_26_26",
    icon = "",
    continueTime = 1,
    lock = 0,
    action_dance = 0,
    display_name = "特效待配"
    };
getRow(76)->
    #bubbleExpressionCfg {
    id = 76,
    type = 3,
    name = "other\vfx_26_27",
    icon = "",
    continueTime = 1,
    lock = 0,
    action_dance = 0,
    display_name = "特效1"
    };
getRow(77)->
    #bubbleExpressionCfg {
    id = 77,
    type = 3,
    name = "other\vfx_26_28",
    icon = "",
    continueTime = 1,
    lock = 0,
    action_dance = 0,
    display_name = "特效2"
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
    {71},
    {72},
    {73},
    {74},
    {75},
    {76},
    {77}
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
    71,
    72,
    73,
    74,
    75,
    76,
    77
    ].

