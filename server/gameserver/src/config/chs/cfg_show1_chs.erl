%% coding: latin-1
%%: 实现
-module(cfg_show1_chs).
-compile(export_all).
-include("cfg_show1.hrl").
-include("logger.hrl").

getRow(500)->
    #show1Cfg {
    id = 500,
    showgroupid_1 = 500,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "茜茜，这里的怪物很多，你要紧跟着我！",
    show_wait = 2500
    };
getRow(501)->
    #show1Cfg {
    id = 501,
    showgroupid_1 = 500,
    showname_1 = "茜茜",
    emotion = 1,
    head = 3007,
    content = "好！",
    show_wait = 1000
    };
getRow(502)->
    #show1Cfg {
    id = 502,
    showgroupid_1 = 500,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "那只海象很可能在船舱的深处，我们得尽快消灭这群怪物。",
    show_wait = 1000
    };
getRow(503)->
    #show1Cfg {
    id = 503,
    showgroupid_1 = 500,
    showname_1 = "茜茜",
    emotion = 1,
    head = 3007,
    content = "这里聚集的魔物很多，我们抓紧时间吧。",
    show_wait = 1000
    };
getRow(504)->
    #show1Cfg {
    id = 504,
    showgroupid_1 = 501,
    showname_1 = "茜茜",
    emotion = 1,
    head = 3007,
    content = "茜茜第一次见到这么大个的海象。",
    show_wait = 1500
    };
getRow(505)->
    #show1Cfg {
    id = 505,
    showgroupid_1 = 501,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "只是个大块头而已，不要害怕！",
    show_wait = 1500
    };
getRow(506)->
    #show1Cfg {
    id = 506,
    showgroupid_1 = 501,
    showname_1 = "茜茜",
    emotion = 1,
    head = 3007,
    content = "它爪子的力量好可怕，注意躲开哦！",
    show_wait = 1500
    };
getRow(507)->
    #show1Cfg {
    id = 507,
    showgroupid_1 = 501,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "知道啦，看我的！",
    show_wait = 1500
    };
getRow(_)->[].

getKeyList()->[
    {500},
    {501},
    {502},
    {503},
    {504},
    {505},
    {506},
    {507}
    ].

get1KeyList()->[
    500,
    501,
    502,
    503,
    504,
    505,
    506,
    507
    ].

