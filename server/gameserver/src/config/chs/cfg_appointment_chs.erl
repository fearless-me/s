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
    type = 2,
    param = [1,3,5,7],
    level = 32,
    daily_type = 104,
    daily_count = 1,
    picture = "menghuanxiaochu",
    txt = "废弃",
    reward_show = [20,31,32],
    time = 300,
    mapid = 540
    };
getRow(2)->
    #appointmentCfg {
    id = 2,
    name = "游园惊梦",
    type = 2,
    param = [2,4,6],
    level = 32,
    daily_type = 108,
    daily_count = 1,
    picture = "menghuanxiaochu",
    txt = "废弃",
    reward_show = [20,31,32],
    time = 300,
    mapid = 541
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

