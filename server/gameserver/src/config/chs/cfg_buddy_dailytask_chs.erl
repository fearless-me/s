%% coding: latin-1
%%: 实现
-module(cfg_buddy_dailytask_chs).
-compile(export_all).
-include("cfg_buddy_dailytask.hrl").
-include("logger.hrl").

getRow(1)->
    #buddy_dailytaskCfg {
    id = 1,
    sort = 2,
    describe = "☆通关灵魂伙伴试炼",
    useType = 3,
    useParam1 = 1,
    useParam2 = 1006,
    num = 1,
    active = 20
    };
getRow(2)->
    #buddy_dailytaskCfg {
    id = 2,
    sort = 1,
    describe = "☆通关3次普通副本",
    useType = 3,
    useParam1 = 1,
    useParam2 = 0,
    num = 3,
    active = 30
    };
getRow(5)->
    #buddy_dailytaskCfg {
    id = 5,
    sort = 10,
    describe = "完成5次拉霸游戏",
    useType = 1,
    useParam1 = 0,
    useParam2 = 0,
    num = 5,
    active = 10
    };
getRow(8)->
    #buddy_dailytaskCfg {
    id = 8,
    sort = 5,
    describe = "参加保卫小羊",
    useType = 8,
    useParam1 = 0,
    useParam2 = 0,
    num = 1,
    active = 20
    };
getRow(9)->
    #buddy_dailytaskCfg {
    id = 9,
    sort = 6,
    describe = "通关铸币熔炉",
    useType = 3,
    useParam1 = 1,
    useParam2 = 1001,
    num = 1,
    active = 10
    };
getRow(13)->
    #buddy_dailytaskCfg {
    id = 13,
    sort = 3,
    describe = "☆连续在线10分钟",
    useType = 9,
    useParam1 = 600,
    useParam2 = 0,
    num = 1,
    active = 20
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {5},
    {8},
    {9},
    {13}
    ].

get1KeyList()->[
    1,
    2,
    5,
    8,
    9,
    13
    ].

