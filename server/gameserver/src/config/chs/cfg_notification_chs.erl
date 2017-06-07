%% coding: latin-1
%%: 实现
-module(cfg_notification_chs).
-compile(export_all).
-include("cfg_notification.hrl").
-include("logger.hrl").

getRow(1)->
    #notificationCfg {
    id = 1,
    type = 6,
    param = "1",
    day_time = "11_55",
    title = "黑暗之地",
    desc = "黑暗之地即将开启，丰富的奖励、极品的装备等你来拿！"
    };
getRow(2)->
    #notificationCfg {
    id = 2,
    type = 6,
    param = "1",
    day_time = "10_55",
    title = "荒野护送",
    desc = "荒野护送即将开启,马车能否安全抵达终点？"
    };
getRow(3)->
    #notificationCfg {
    id = 3,
    type = 6,
    param = "1",
    day_time = "20_35",
    title = "战天下",
    desc = "一战平天下！守护镜像之争！"
    };
getRow(4)->
    #notificationCfg {
    id = 4,
    type = 6,
    param = "1",
    day_time = "20_55",
    title = "跨服战场",
    desc = "傲视群雄，在跨服阵营战场中感受巅峰对决。"
    };
getRow(5)->
    #notificationCfg {
    id = 5,
    type = 6,
    param = "2",
    day_time = "10_55",
    title = "荒野护送",
    desc = "荒野护送即将开启,马车能否安全抵达终点？"
    };
getRow(6)->
    #notificationCfg {
    id = 6,
    type = 6,
    param = "2",
    day_time = "11_55",
    title = "黑暗之地",
    desc = "黑暗之地即将开启，丰富的奖励、极品的装备等你来拿！"
    };
getRow(7)->
    #notificationCfg {
    id = 7,
    type = 6,
    param = "2",
    day_time = "20_35",
    title = "战天下",
    desc = "一战平天下！守护镜像之争！"
    };
getRow(8)->
    #notificationCfg {
    id = 8,
    type = 6,
    param = "3",
    day_time = "21_55",
    title = "荒野护送",
    desc = "荒野护送即将开启,马车能否安全抵达终点？"
    };
getRow(9)->
    #notificationCfg {
    id = 9,
    type = 6,
    param = "3",
    day_time = "19_55",
    title = "最强军团",
    desc = "最强军团开始啦！胜者可以获得限时坐骑与称号哟！"
    };
getRow(10)->
    #notificationCfg {
    id = 10,
    type = 6,
    param = "3",
    day_time = "20_35",
    title = "战天下",
    desc = "一战平天下！守护镜像之争！"
    };
getRow(11)->
    #notificationCfg {
    id = 11,
    type = 6,
    param = "3",
    day_time = "20_55",
    title = "跨服战场",
    desc = "傲视群雄，在跨服阵营战场中感受巅峰对决。"
    };
getRow(12)->
    #notificationCfg {
    id = 12,
    type = 6,
    param = "4",
    day_time = "21_55",
    title = "荒野护送",
    desc = "荒野护送即将开启,马车能否安全抵达终点？"
    };
getRow(13)->
    #notificationCfg {
    id = 13,
    type = 6,
    param = "5",
    day_time = "10_55",
    title = "荒野护送",
    desc = "荒野护送即将开启,马车能否安全抵达终点？"
    };
getRow(14)->
    #notificationCfg {
    id = 14,
    type = 6,
    param = "5",
    day_time = "20_35",
    title = "战天下",
    desc = "一战平天下！守护镜像之争！"
    };
getRow(15)->
    #notificationCfg {
    id = 15,
    type = 6,
    param = "5",
    day_time = "20_55",
    title = "跨服战场",
    desc = "傲视群雄，在跨服阵营战场中感受巅峰对决。"
    };
getRow(16)->
    #notificationCfg {
    id = 16,
    type = 6,
    param = "6",
    day_time = "10_55",
    title = "荒野护送",
    desc = "荒野护送即将开启,马车能否安全抵达终点？"
    };
getRow(17)->
    #notificationCfg {
    id = 17,
    type = 6,
    param = "6",
    day_time = "20_35",
    title = "战天下",
    desc = "一战平天下！守护镜像之争！"
    };
getRow(18)->
    #notificationCfg {
    id = 18,
    type = 6,
    param = "6",
    day_time = "09_55",
    title = "骑宠领地",
    desc = "带上你的宠物，占领最肥沃的领地！"
    };
getRow(19)->
    #notificationCfg {
    id = 19,
    type = 6,
    param = "7",
    day_time = "10_55",
    title = "荒野护送",
    desc = "荒野护送即将开启,马车能否安全抵达终点？"
    };
getRow(20)->
    #notificationCfg {
    id = 20,
    type = 6,
    param = "7",
    day_time = "11_55",
    title = "黑暗之地",
    desc = "黑暗之地即将开启，丰富的奖励、极品的装备等你来拿！"
    };
getRow(21)->
    #notificationCfg {
    id = 21,
    type = 6,
    param = "7",
    day_time = "20_35",
    title = "战天下",
    desc = "一战平天下！守护镜像之争！"
    };
getRow(22)->
    #notificationCfg {
    id = 22,
    type = 6,
    param = "7",
    day_time = "20_55",
    title = "跨服战场",
    desc = "傲视群雄，在跨服阵营战场中感受巅峰对决。"
    };
getRow(23)->
    #notificationCfg {
    id = 23,
    type = 0,
    param = "2015_01_01",
    day_time = "1_1",
    title = "占位",
    desc = "占位"
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
    {23}
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
    23
    ].

