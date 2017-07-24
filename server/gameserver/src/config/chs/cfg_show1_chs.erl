%% coding: latin-1
%%: 实现
-module(cfg_show1_chs).
-compile(export_all).
-include("cfg_show1.hrl").
-include("logger.hrl").

getRow(100)->
    #show1Cfg {
    id = 100,
    showgroupid_1 = 100,
    showname_1 = "露娜女神",
    emotion = 1,
    head = 451,
    content = "打败看守魔物的守卫，你就能拿到打开囚笼的钥匙了，加油吧！",
    show_wait = 2500
    };
getRow(101)->
    #show1Cfg {
    id = 101,
    showgroupid_1 = 101,
    showname_1 = "露娜女神",
    emotion = 1,
    head = 451,
    content = "钥匙一共有两把，前边那是第一把钥匙，点击即可采集获得。",
    show_wait = 2500
    };
getRow(102)->
    #show1Cfg {
    id = 102,
    showgroupid_1 = 102,
    showname_1 = "露娜女神",
    emotion = 1,
    head = 451,
    content = "左侧还有另一把钥匙，赶紧去获得吧。",
    show_wait = 2500
    };
getRow(103)->
    #show1Cfg {
    id = 103,
    showgroupid_1 = 103,
    showname_1 = "露娜女神",
    emotion = 1,
    head = 451,
    content = "这里就是魔龙克拉斯，它被囚禁多年，怒气颇深，你可要小心。",
    show_wait = 2500
    };
getRow(104)->
    #show1Cfg {
    id = 104,
    showgroupid_1 = 104,
    showname_1 = "丽莎",
    emotion = 1,
    head = 450,
    content = "主人，骑宠最爱“兽灵精华”，采集一些引它出来吧。",
    show_wait = 2500
    };
getRow(105)->
    #show1Cfg {
    id = 105,
    showgroupid_1 = 105,
    showname_1 = "丽莎",
    emotion = 1,
    head = 450,
    content = "主人，前边有很多帮助你战胜镇守出口灵兽的道具，一个不漏的采集它们吧。",
    show_wait = 2500
    };
getRow(106)->
    #show1Cfg {
    id = 106,
    showgroupid_1 = 105,
    showname_1 = "丽莎",
    emotion = 1,
    head = 450,
    content = "山胖是个力气大的怪物，不喜欢被打扰，前进的时候注意绕开它。",
    show_wait = 2500
    };
getRow(107)->
    #show1Cfg {
    id = 107,
    showgroupid_1 = 105,
    showname_1 = "丽莎",
    emotion = 1,
    head = 450,
    content = "主人，骑上坐骑前进速度会加快，不如试试吧。",
    show_wait = 2500
    };
getRow(108)->
    #show1Cfg {
    id = 108,
    showgroupid_1 = 106,
    showname_1 = "小鱼人",
    emotion = 1,
    head = 452,
    content = "我们女王睡得正香，你这小鬼竟敢来打扰。",
    show_wait = 2500
    };
getRow(109)->
    #show1Cfg {
    id = 109,
    showgroupid_1 = 107,
    showname_1 = "丽莎",
    emotion = 1,
    head = 450,
    content = "不好，镇守出口的冰姬女王出来了，主人，你可要小心。",
    show_wait = 2500
    };
getRow(501)->
    #show1Cfg {
    id = 501,
    showgroupid_1 = 500,
    showname_1 = "安娜",
    emotion = 1,
    head = 454,
    content = "我们要掌握船的方向，才能回去。",
    show_wait = 2500
    };
getRow(502)->
    #show1Cfg {
    id = 502,
    showgroupid_1 = 500,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "看来是一场硬仗，先解决门口的这些看守怪吧。",
    show_wait = 1000
    };
getRow(503)->
    #show1Cfg {
    id = 503,
    showgroupid_1 = 500,
    showname_1 = "安娜",
    emotion = 1,
    head = 454,
    content = "嗯，那我们一起上吧。",
    show_wait = 1000
    };
getRow(504)->
    #show1Cfg {
    id = 504,
    showgroupid_1 = 501,
    showname_1 = "魔族女战士",
    emotion = 1,
    head = 450,
    content = "真是废物，连个人都看不住，给我抓住他们。",
    show_wait = 1500
    };
getRow(505)->
    #show1Cfg {
    id = 505,
    showgroupid_1 = 502,
    showname_1 = "罗撒特",
    emotion = 1,
    head = 455,
    content = "呵，你以为你们能逃出去，说出漂浮之石的下落，我会考虑放了你们。",
    show_wait = 1500
    };
getRow(506)->
    #show1Cfg {
    id = 506,
    showgroupid_1 = 502,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "你先告诉我漂浮之石是什么？我才知道是不是你要找的东西！",
    show_wait = 1500
    };
getRow(507)->
    #show1Cfg {
    id = 507,
    showgroupid_1 = 502,
    showname_1 = "罗撒特",
    emotion = 1,
    head = 455,
    content = "漂浮之石是魔王阿尔赛德重生的关键之物，你拿了也没有用，不如交给我。",
    show_wait = 1500
    };
getRow(508)->
    #show1Cfg {
    id = 508,
    showgroupid_1 = 502,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "原来如此，可惜我并不知道它的下落",
    show_wait = 1500
    };
getRow(509)->
    #show1Cfg {
    id = 509,
    showgroupid_1 = 502,
    showname_1 = "罗撒特",
    emotion = 1,
    head = 455,
    content = "竟然敢耍我，简直活腻了。",
    show_wait = 1500
    };
getRow(_)->[].

getKeyList()->[
    {100},
    {101},
    {102},
    {103},
    {104},
    {105},
    {106},
    {107},
    {108},
    {109},
    {501},
    {502},
    {503},
    {504},
    {505},
    {506},
    {507},
    {508},
    {509}
    ].

get1KeyList()->[
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    501,
    502,
    503,
    504,
    505,
    506,
    507,
    508,
    509
    ].

