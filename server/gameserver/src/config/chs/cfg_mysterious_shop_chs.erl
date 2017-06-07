%% coding: latin-1
%%: 实现
-module(cfg_mysterious_shop_chs).
-compile(export_all).
-include("cfg_mysterious_shop.hrl").
-include("logger.hrl").

getRow(1,10000)->
    #mysterious_shopCfg {
    lvl_phase = 1,
    only_id = 10000,
    itemid = 20,
    lvl_min = 30,
    lvl_max = 39,
    money_type = 3,
    money = 38,
    limit_number = 50,
    weight1 = 80,
    discount = "折扣",
    mark = 2
    };
getRow(1,10001)->
    #mysterious_shopCfg {
    lvl_phase = 1,
    only_id = 10001,
    itemid = 2601,
    lvl_min = 30,
    lvl_max = 39,
    money_type = 3,
    money = 70,
    limit_number = 12,
    weight1 = 40,
    discount = "折扣",
    mark = 2
    };
getRow(1,10002)->
    #mysterious_shopCfg {
    lvl_phase = 1,
    only_id = 10002,
    itemid = 2601,
    lvl_min = 30,
    lvl_max = 39,
    money_type = 3,
    money = 70,
    limit_number = 12,
    weight1 = 40,
    discount = "折扣",
    mark = 2
    };
getRow(1,10003)->
    #mysterious_shopCfg {
    lvl_phase = 1,
    only_id = 10003,
    itemid = 7000,
    lvl_min = 30,
    lvl_max = 39,
    money_type = 3,
    money = 20,
    limit_number = 100,
    weight1 = 50,
    discount = "折扣",
    mark = 2
    };
getRow(1,10004)->
    #mysterious_shopCfg {
    lvl_phase = 1,
    only_id = 10004,
    itemid = 21000,
    lvl_min = 30,
    lvl_max = 39,
    money_type = 3,
    money = 30,
    limit_number = 2,
    weight1 = 50,
    discount = "折扣",
    mark = 2
    };
getRow(1,10005)->
    #mysterious_shopCfg {
    lvl_phase = 1,
    only_id = 10005,
    itemid = 21001,
    lvl_min = 30,
    lvl_max = 39,
    money_type = 3,
    money = 108,
    limit_number = 1,
    weight1 = 25,
    discount = "折扣",
    mark = 2
    };
getRow(1,10006)->
    #mysterious_shopCfg {
    lvl_phase = 1,
    only_id = 10006,
    itemid = 21050,
    lvl_min = 30,
    lvl_max = 39,
    money_type = 3,
    money = 30,
    limit_number = 2,
    weight1 = 50,
    discount = "折扣",
    mark = 2
    };
getRow(1,10007)->
    #mysterious_shopCfg {
    lvl_phase = 1,
    only_id = 10007,
    itemid = 21051,
    lvl_min = 30,
    lvl_max = 39,
    money_type = 3,
    money = 108,
    limit_number = 1,
    weight1 = 25,
    discount = "折扣",
    mark = 2
    };
getRow(1,10008)->
    #mysterious_shopCfg {
    lvl_phase = 1,
    only_id = 10008,
    itemid = 21100,
    lvl_min = 30,
    lvl_max = 39,
    money_type = 3,
    money = 30,
    limit_number = 2,
    weight1 = 50,
    discount = "折扣",
    mark = 2
    };
getRow(1,10009)->
    #mysterious_shopCfg {
    lvl_phase = 1,
    only_id = 10009,
    itemid = 21101,
    lvl_min = 30,
    lvl_max = 39,
    money_type = 3,
    money = 108,
    limit_number = 1,
    weight1 = 25,
    discount = "折扣",
    mark = 2
    };
getRow(2,20000)->
    #mysterious_shopCfg {
    lvl_phase = 2,
    only_id = 20000,
    itemid = 20,
    lvl_min = 40,
    lvl_max = 70,
    money_type = 3,
    money = 38,
    limit_number = 50,
    weight1 = 80,
    discount = "折扣",
    mark = 2
    };
getRow(2,20001)->
    #mysterious_shopCfg {
    lvl_phase = 2,
    only_id = 20001,
    itemid = 2601,
    lvl_min = 40,
    lvl_max = 70,
    money_type = 3,
    money = 70,
    limit_number = 12,
    weight1 = 40,
    discount = "折扣",
    mark = 2
    };
getRow(2,20002)->
    #mysterious_shopCfg {
    lvl_phase = 2,
    only_id = 20002,
    itemid = 2601,
    lvl_min = 40,
    lvl_max = 70,
    money_type = 3,
    money = 70,
    limit_number = 12,
    weight1 = 40,
    discount = "折扣",
    mark = 2
    };
getRow(2,20003)->
    #mysterious_shopCfg {
    lvl_phase = 2,
    only_id = 20003,
    itemid = 7001,
    lvl_min = 40,
    lvl_max = 70,
    money_type = 3,
    money = 30,
    limit_number = 140,
    weight1 = 50,
    discount = "折扣",
    mark = 2
    };
getRow(2,20004)->
    #mysterious_shopCfg {
    lvl_phase = 2,
    only_id = 20004,
    itemid = 21000,
    lvl_min = 40,
    lvl_max = 70,
    money_type = 3,
    money = 30,
    limit_number = 2,
    weight1 = 50,
    discount = "折扣",
    mark = 2
    };
getRow(2,20005)->
    #mysterious_shopCfg {
    lvl_phase = 2,
    only_id = 20005,
    itemid = 21001,
    lvl_min = 40,
    lvl_max = 70,
    money_type = 3,
    money = 108,
    limit_number = 1,
    weight1 = 25,
    discount = "折扣",
    mark = 2
    };
getRow(2,20006)->
    #mysterious_shopCfg {
    lvl_phase = 2,
    only_id = 20006,
    itemid = 21050,
    lvl_min = 40,
    lvl_max = 70,
    money_type = 3,
    money = 30,
    limit_number = 2,
    weight1 = 50,
    discount = "折扣",
    mark = 2
    };
getRow(2,20007)->
    #mysterious_shopCfg {
    lvl_phase = 2,
    only_id = 20007,
    itemid = 21051,
    lvl_min = 40,
    lvl_max = 70,
    money_type = 3,
    money = 108,
    limit_number = 1,
    weight1 = 25,
    discount = "折扣",
    mark = 2
    };
getRow(2,20008)->
    #mysterious_shopCfg {
    lvl_phase = 2,
    only_id = 20008,
    itemid = 21100,
    lvl_min = 40,
    lvl_max = 70,
    money_type = 3,
    money = 30,
    limit_number = 2,
    weight1 = 50,
    discount = "折扣",
    mark = 2
    };
getRow(2,20009)->
    #mysterious_shopCfg {
    lvl_phase = 2,
    only_id = 20009,
    itemid = 21101,
    lvl_min = 40,
    lvl_max = 70,
    money_type = 3,
    money = 108,
    limit_number = 1,
    weight1 = 25,
    discount = "折扣",
    mark = 2
    };
getRow(_,_)->[].

getKeyList()->[
    {1,10000},
    {1,10001},
    {1,10002},
    {1,10003},
    {1,10004},
    {1,10005},
    {1,10006},
    {1,10007},
    {1,10008},
    {1,10009},
    {2,20000},
    {2,20001},
    {2,20002},
    {2,20003},
    {2,20004},
    {2,20005},
    {2,20006},
    {2,20007},
    {2,20008},
    {2,20009}
    ].

get1KeyList()->[
    1,
    2
    ].

get2KeyList(1)->[
    10000,
    10001,
    10002,
    10003,
    10004,
    10005,
    10006,
    10007,
    10008,
    10009
    ];
get2KeyList(2)->[
    20000,
    20001,
    20002,
    20003,
    20004,
    20005,
    20006,
    20007,
    20008,
    20009
    ];
get2KeyList(_)->[].

