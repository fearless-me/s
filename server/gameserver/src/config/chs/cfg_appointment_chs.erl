%% coding: latin-1
%%: 实现
-module(cfg_appointment_chs).
-compile(export_all).
-include("cfg_appointment.hrl").
-include("logger.hrl").

getRow(1)->
    #appointmentCfg {
    id = 1,
    name = "梦幻消除",
    type = 1,
    param = [],
    level = 27,
    daily_type = 104,
    daily_count = 1,
    picture = "menghuanxiaochu",
    txt = "废弃",
    reward_show = [20,31,32],
    time = 270,
    mapid = 540,
    cameratype = 5,
    datetitle = "梦幻消除",
    datetxt = "梦幻消除简介",
    datepicture = "Textures/UI/BaseFrame_Date"
    };
getRow(2)->
    #appointmentCfg {
    id = 2,
    name = "游园惊梦",
    type = 1,
    param = [],
    level = 27,
    daily_type = 108,
    daily_count = 1,
    picture = "youyuanjingmeng",
    txt = "废弃",
    reward_show = [20,31,32],
    time = 270,
    mapid = 541,
    cameratype = 6,
    datetitle = "游园惊梦",
    datetxt = "游园惊梦简介",
    datepicture = "Textures/UI/BaseFrame_Date"
    };
getRow(3)->
    #appointmentCfg {
    id = 3,
    name = "泳池派对",
    type = 1,
    param = [],
    level = 27,
    daily_type = 109,
    daily_count = 1,
    picture = "youyuanjingmeng",
    txt = "废弃",
    reward_show = [20,31,32],
    time = 270,
    mapid = 542,
    cameratype = 7,
    datetitle = "泳池派对",
    datetxt = "泳池派对简介",
    datepicture = "Textures/UI/BaseFrame_Date"
    };
getRow(4)->
    #appointmentCfg {
    id = 4,
    name = "躲喵喵",
    type = 1,
    param = [],
    level = 27,
    daily_type = 110,
    daily_count = 1,
    picture = "youyuanjingmeng",
    txt = "废弃",
    reward_show = [20,31,32],
    time = 270,
    mapid = 543,
    cameratype = 8,
    datetitle = "躲猫猫",
    datetxt = "躲猫猫简介",
    datepicture = "Textures/UI/BaseFrame_Date"
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4
    ].

