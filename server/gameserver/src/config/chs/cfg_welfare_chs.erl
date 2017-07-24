%% coding: latin-1
%%: 实现
-module(cfg_welfare_chs).
-compile(export_all).
-include("cfg_welfare.hrl").
-include("logger.hrl").

getRow(1)->
    #welfareCfg {
    id = 1,
    name = "每日签到",
    openconditions = 1,
    sort = 1,
    parameter = 10,
    stars = 1
    };
getRow(2)->
    #welfareCfg {
    id = 2,
    name = "七日签到",
    openconditions = 1,
    sort = 4,
    parameter = 14,
    stars = 1
    };
getRow(3)->
    #welfareCfg {
    id = 3,
    name = "手机绑定",
    openconditions = 1,
    sort = 12,
    parameter = 1000,
    stars = 0
    };
getRow(4)->
    #welfareCfg {
    id = 4,
    name = "试试手气",
    openconditions = 1,
    sort = 10,
    parameter = 1000,
    stars = 0
    };
getRow(5)->
    #welfareCfg {
    id = 5,
    name = "月卡福利",
    openconditions = 1,
    sort = 8,
    parameter = 1000,
    stars = 1
    };
getRow(7)->
    #welfareCfg {
    id = 7,
    name = "灵力冥想",
    openconditions = 1,
    sort = 6,
    parameter = 26,
    stars = 1
    };
getRow(8)->
    #welfareCfg {
    id = 8,
    name = "更新奖励",
    openconditions = 1,
    sort = 11,
    parameter = 1000,
    stars = 1
    };
getRow(9)->
    #welfareCfg {
    id = 9,
    name = "成长礼包",
    openconditions = 1,
    sort = 5,
    parameter = 1000,
    stars = 1
    };
getRow(10)->
    #welfareCfg {
    id = 10,
    name = "在线福利",
    openconditions = 1,
    sort = 2,
    parameter = 6,
    stars = 1
    };
getRow(11)->
    #welfareCfg {
    id = 11,
    name = "等级福利",
    openconditions = 1,
    sort = 3,
    parameter = 10,
    stars = 1
    };
getRow(12)->
    #welfareCfg {
    id = 12,
    name = "七日任务",
    openconditions = 1,
    sort = 7,
    parameter = 1000,
    stars = 1
    };
getRow(13)->
    #welfareCfg {
    id = 13,
    name = "资源找回",
    openconditions = 1,
    sort = 9,
    parameter = 21,
    stars = 1
    };
getRow(14)->
    #welfareCfg {
    id = 14,
    name = "点金手",
    openconditions = 1,
    sort = 13,
    parameter = 14,
    stars = 1
    };
getRow(100)->
    #welfareCfg {
    id = 100,
    name = "运营活动",
    openconditions = 1,
    sort = 0,
    parameter = 1,
    stars = 1
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {7},
    {8},
    {9},
    {10},
    {11},
    {12},
    {13},
    {14},
    {100}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    100
    ].

