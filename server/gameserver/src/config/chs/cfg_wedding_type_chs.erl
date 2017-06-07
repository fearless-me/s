%% coding: latin-1
%%: 实现
-module(cfg_wedding_type_chs).
-compile(export_all).
-include("cfg_wedding_type.hrl").
-include("logger.hrl").

getRow(1)->
    #wedding_typeCfg {
    id = 1,
    name = "简约婚宴",
    wedding_time = 1800,
    show_time = "30分钟",
    describe = "系统免费发放2次鲜花和1次精致喜糖。",
    order_cost = 100,
    percent_if_cancel = 80,
    percent_if_stop_before = 100,
    percent_if_stop_after = 100,
    ordinary_limit = 40,
    friend_limit = 10,
    invite_CD = 180,
    sys_firework_type = 1,
    sys_flower_type = "ef_marry09",
    sys_flower_numb = 2,
    sys_candy_type = 1,
    sys_candy_numb = 1,
    user_flower_type = [10,20],
    user_candy_type = 1
    };
getRow(2)->
    #wedding_typeCfg {
    id = 2,
    name = "豪华婚宴",
    wedding_time = 1800,
    show_time = "30分钟",
    describe = "系统免费发放5次鲜花和2次豪华喜糖。",
    order_cost = 888,
    percent_if_cancel = 80,
    percent_if_stop_before = 100,
    percent_if_stop_after = 100,
    ordinary_limit = 40,
    friend_limit = 10,
    invite_CD = 180,
    sys_firework_type = 2,
    sys_flower_type = "ef_marry09",
    sys_flower_numb = 5,
    sys_candy_type = 2,
    sys_candy_numb = 2,
    user_flower_type = [10,20],
    user_candy_type = 2
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2}
    ].

get1KeyList()->[
    1,
    2
    ].

