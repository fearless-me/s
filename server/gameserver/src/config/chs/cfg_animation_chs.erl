%% coding: latin-1
%%: 实现
-module(cfg_animation_chs).
-compile(export_all).
-include("cfg_animation.hrl").
-include("logger.hrl").

getRow(1)->
    #animationCfg {
    id = 1,
    name = "10jifuben_1",
    isloop = 1
    };
getRow(2)->
    #animationCfg {
    id = 2,
    name = "10jifuben_boss_1",
    isloop = 0
    };
getRow(3)->
    #animationCfg {
    id = 3,
    name = "20jifuben_1",
    isloop = 1
    };
getRow(4)->
    #animationCfg {
    id = 4,
    name = "20jifuben_boss_1",
    isloop = 1
    };
getRow(5)->
    #animationCfg {
    id = 5,
    name = "30jifuben_1",
    isloop = 1
    };
getRow(6)->
    #animationCfg {
    id = 6,
    name = "30jifuben_boss_1",
    isloop = 1
    };
getRow(101)->
    #animationCfg {
    id = 101,
    name = "cailiaofuben_1",
    isloop = 1
    };
getRow(102)->
    #animationCfg {
    id = 102,
    name = "jingtianmiaodaotuan_1",
    isloop = 1
    };
getRow(1001)->
    #animationCfg {
    id = 1001,
    name = "akelegangkou_1",
    isloop = 0
    };
getRow(1002)->
    #animationCfg {
    id = 1002,
    name = "dongchengjiao_1",
    isloop = 0
    };
getRow(1004)->
    #animationCfg {
    id = 1004,
    name = "akelepingyuan_1",
    isloop = 0
    };
getRow(1005)->
    #animationCfg {
    id = 1005,
    name = "cangkongzhita_1",
    isloop = 0
    };
getRow(10000)->
    #animationCfg {
    id = 10000,
    name = "shenzhizhaohuan_1",
    isloop = 0
    };
getRow(10001)->
    #animationCfg {
    id = 10001,
    name = "zhuiganmozu_1",
    isloop = 0
    };
getRow(10002)->
    #animationCfg {
    id = 10002,
    name = "annadejia_1",
    isloop = 0
    };
getRow(10003)->
    #animationCfg {
    id = 10003,
    name = "gangkouzhizhan_1",
    isloop = 0
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {101},
    {102},
    {1001},
    {1002},
    {1004},
    {1005},
    {10000},
    {10001},
    {10002},
    {10003}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    101,
    102,
    1001,
    1002,
    1004,
    1005,
    10000,
    10001,
    10002,
    10003
    ].

