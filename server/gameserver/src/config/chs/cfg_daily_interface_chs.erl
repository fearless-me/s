%% coding: latin-1
%%: 实现
-module(cfg_daily_interface_chs).
-compile(export_all).
-include("cfg_daily_interface.hrl").
-include("logger.hrl").

getRow(1)->
    #daily_interfaceCfg {
    id = 1,
    activitytype = 1,
    name = "副本",
    position = 1,
    activity_icon = "6",
    rewardtype = [3],
    active_num = 0,
    level = 0,
    describe_all = "还在玩！活动描述配了么？",
    main_output = [29001,29002,29003,29004],
    begintime = "全天开放",
    button_string = "参与",
    button_function = 0
    };
getRow(2)->
    #daily_interfaceCfg {
    id = 2,
    activitytype = 1,
    name = "守护女神",
    position = 5,
    activity_icon = "6",
    rewardtype = [2],
    active_num = 0,
    level = 20,
    describe_all = "还在玩！活动描述配了么？",
    main_output = [29001,29002,29003,29004],
    begintime = "全天开放",
    button_string = "参与",
    button_function = 1
    };
getRow(3)->
    #daily_interfaceCfg {
    id = 3,
    activitytype = 2,
    name = "首领入侵",
    position = 16,
    activity_icon = "1",
    rewardtype = [0],
    active_num = 0,
    level = 45,
    describe_all = "还在玩！活动描述配了么？",
    main_output = [29001,29002,29003,29004],
    begintime = "20:00~20:30",
    button_string = "参与",
    button_function = 2
    };
getRow(4)->
    #daily_interfaceCfg {
    id = 4,
    activitytype = 1,
    name = "惊天喵盗团",
    position = 4,
    activity_icon = "6",
    rewardtype = [1],
    active_num = 1,
    level = 23,
    describe_all = "还在玩！活动描述配了么？",
    main_output = [29001,29002,29003,29004],
    begintime = "全天开放",
    button_string = "参与",
    button_function = 4
    };
getRow(5)->
    #daily_interfaceCfg {
    id = 5,
    activitytype = 2,
    name = "世界守护",
    position = 13,
    activity_icon = "2",
    rewardtype = [0],
    active_num = 0,
    level = 48,
    describe_all = "还在玩！活动描述配了么？",
    main_output = [29001,29002,29003,29004],
    begintime = "20:00~20:20",
    button_string = "参与",
    button_function = 5
    };
getRow(6)->
    #daily_interfaceCfg {
    id = 6,
    activitytype = 1,
    name = "遗迹训练场",
    position = 12,
    activity_icon = "6",
    rewardtype = [3],
    active_num = 0,
    level = 35,
    describe_all = "还在玩！活动描述配了么？",
    main_output = [29001,29002,29003,29004],
    begintime = "全天开放",
    button_string = "参与",
    button_function = 9
    };
getRow(7)->
    #daily_interfaceCfg {
    id = 7,
    activitytype = 1,
    name = "女神禁闭室",
    position = 2,
    activity_icon = "6",
    rewardtype = [2],
    active_num = 0,
    level = 21,
    describe_all = "还在玩！活动描述配了么？",
    main_output = [29001,29002,29003,29004],
    begintime = "全天开放",
    button_string = "参与",
    button_function = 13
    };
getRow(8)->
    #daily_interfaceCfg {
    id = 8,
    activitytype = 4,
    name = "竞技场",
    position = 3,
    activity_icon = "6",
    rewardtype = [1],
    active_num = 1,
    level = 22,
    describe_all = "还在玩！活动描述配了么？",
    main_output = [29001,29002,29003,29004],
    begintime = "0",
    button_string = "参与",
    button_function = 16
    };
getRow(9)->
    #daily_interfaceCfg {
    id = 9,
    activitytype = 4,
    name = "野外首领",
    position = 11,
    activity_icon = "6",
    rewardtype = [2],
    active_num = 0,
    level = 30,
    describe_all = "还在玩！活动描述配了么？",
    main_output = [29001,29002,29003,29004],
    begintime = "0",
    button_string = "参与",
    button_function = 19
    };
getRow(10)->
    #daily_interfaceCfg {
    id = 10,
    activitytype = 4,
    name = "深红熔渊",
    position = 14,
    activity_icon = "6",
    rewardtype = [2],
    active_num = 0,
    level = 38,
    describe_all = "还在玩！活动描述配了么？",
    main_output = [29001,29002,29003,29004],
    begintime = "12~次日2点",
    button_string = "参与",
    button_function = 21
    };
getRow(12)->
    #daily_interfaceCfg {
    id = 12,
    activitytype = 2,
    name = "骑宠竞速",
    position = 15,
    activity_icon = "3",
    rewardtype = [0],
    active_num = 0,
    level = 50,
    describe_all = "还在玩！活动描述配了么？",
    main_output = [29001,29002,29003,29004],
    begintime = "20:00~20:30",
    button_string = "参与",
    button_function = 29
    };
getRow(13)->
    #daily_interfaceCfg {
    id = 13,
    activitytype = 1,
    name = "萝莉与绅士",
    position = 1,
    activity_icon = "6",
    rewardtype = [3],
    active_num = 1,
    level = 18,
    describe_all = "还在玩！活动描述配了么？",
    main_output = [29001,29002,29003,29004],
    begintime = "全天开放",
    button_string = "参与",
    button_function = 30
    };
getRow(14)->
    #daily_interfaceCfg {
    id = 14,
    activitytype = 1,
    name = "元素保卫战",
    position = 6,
    activity_icon = "6",
    rewardtype = [1,2],
    active_num = 0,
    level = 30,
    describe_all = "还在玩！活动描述配了么？",
    main_output = [29001,29002,29003,29004],
    begintime = "全天开放",
    button_string = "参与",
    button_function = 31
    };
getRow(15)->
    #daily_interfaceCfg {
    id = 15,
    activitytype = 1,
    name = "情缘任务",
    position = 10,
    activity_icon = "6",
    rewardtype = [1],
    active_num = 0,
    level = 34,
    describe_all = "还在玩！活动描述配了么？",
    main_output = [29001,29002,29003,29004],
    begintime = "全天开放",
    button_string = "参与",
    button_function = 32
    };
getRow(16)->
    #daily_interfaceCfg {
    id = 16,
    activitytype = 2,
    name = "家族雪人",
    position = 7,
    activity_icon = "4",
    rewardtype = [0],
    active_num = 0,
    level = 24,
    describe_all = "还在玩！活动描述配了么？",
    main_output = [29001,29002,29003,29004],
    begintime = "周二、四、六\n20:00~20:15",
    button_string = "参与",
    button_function = 33
    };
getRow(17)->
    #daily_interfaceCfg {
    id = 17,
    activitytype = 1,
    name = "约会地下城",
    position = 8,
    activity_icon = "6",
    rewardtype = [2,3],
    active_num = 0,
    level = 27,
    describe_all = "还在玩！活动描述配了么？",
    main_output = [29001,29002,29003,29004],
    begintime = "全天开放",
    button_string = "参与",
    button_function = 35
    };
getRow(18)->
    #daily_interfaceCfg {
    id = 18,
    activitytype = 1,
    name = "骑宠领地",
    position = 9,
    activity_icon = "6",
    rewardtype = [2],
    active_num = 0,
    level = 16,
    describe_all = "还在玩！活动描述配了么？",
    main_output = [29001,29002,29003,29004],
    begintime = "全天开放",
    button_string = "参与",
    button_function = 36
    };
getRow(19)->
    #daily_interfaceCfg {
    id = 19,
    activitytype = 2,
    name = "限时广场舞",
    position = 18,
    activity_icon = "5",
    rewardtype = [0],
    active_num = 0,
    level = 25,
    describe_all = "还在玩！活动描述配了么？",
    main_output = [29001,29002,29003,29004],
    begintime = "12:30~12:40\n20:30~20:40",
    button_string = "参与",
    button_function = 103
    };
getRow(20)->
    #daily_interfaceCfg {
    id = 20,
    activitytype = 2,
    name = "全民答题",
    position = 19,
    activity_icon = "6",
    rewardtype = [1,2],
    active_num = 0,
    level = 9,
    describe_all = "还在玩！活动描述配了么？",
    main_output = [29001,29002,29003,29004],
    begintime = "19:00~19:15",
    button_string = "参与",
    button_function = 104
    };
getRow(21)->
    #daily_interfaceCfg {
    id = 21,
    activitytype = 1,
    name = "永不停歇",
    position = 20,
    activity_icon = "6",
    rewardtype = [3],
    active_num = 0,
    level = 15,
    describe_all = "还在玩！活动描述配了么？",
    main_output = [29001,29002,29003,29004],
    begintime = "全天开放",
    button_string = "参与",
    button_function = 105
    };
getRow(22)->
    #daily_interfaceCfg {
    id = 22,
    activitytype = 0,
    name = "家族据点战（临时）",
    position = 21,
    activity_icon = "7",
    rewardtype = [0],
    active_num = 0,
    level = 1000,
    describe_all = "限时活动备用",
    main_output = [29001,29002,29003,29004],
    begintime = "全天开放",
    button_string = "参与",
    button_function = 0
    };
getRow(23)->
    #daily_interfaceCfg {
    id = 23,
    activitytype = 0,
    name = "家族首领（临时）",
    position = 22,
    activity_icon = "8",
    rewardtype = [0],
    active_num = 0,
    level = 1000,
    describe_all = "限时活动备用",
    main_output = [29001,29002,29003,29004],
    begintime = "全天开放",
    button_string = "参与",
    button_function = 0
    };
getRow(24)->
    #daily_interfaceCfg {
    id = 24,
    activitytype = 0,
    name = "沙滩派对（临时）",
    position = 23,
    activity_icon = "9",
    rewardtype = [0],
    active_num = 0,
    level = 1000,
    describe_all = "限时活动备用",
    main_output = [29001,29002,29003,29004],
    begintime = "全天开放",
    button_string = "参与",
    button_function = 0
    };
getRow(25)->
    #daily_interfaceCfg {
    id = 25,
    activitytype = 0,
    name = "家族战（临时）",
    position = 23,
    activity_icon = "10",
    rewardtype = [0],
    active_num = 0,
    level = 1000,
    describe_all = "限时活动备用",
    main_output = [29001,29002,29003,29004],
    begintime = "全天开放",
    button_string = "参与",
    button_function = 0
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

