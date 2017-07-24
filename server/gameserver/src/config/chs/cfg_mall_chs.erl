%% coding: latin-1
%%: 实现
-module(cfg_mall_chs).
-compile(export_all).
-include("cfg_mall.hrl").
-include("logger.hrl").

getRow(201,1)->
    #mallCfg {
    item_id = 201,
    type = 1,
    sort = 6,
    type1 = 0,
    gold = 3,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 10,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 2
    };
getRow(201,3)->
    #mallCfg {
    item_id = 201,
    type = 3,
    sort = 7,
    type1 = 0,
    gold = 5,
    bind_gold = 5,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 0
    };
getRow(203,1)->
    #mallCfg {
    item_id = 203,
    type = 1,
    sort = 4,
    type1 = 0,
    gold = 2,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 10,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 2
    };
getRow(203,3)->
    #mallCfg {
    item_id = 203,
    type = 3,
    sort = 2,
    type1 = 0,
    gold = 4,
    bind_gold = 4,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 0
    };
getRow(204,1)->
    #mallCfg {
    item_id = 204,
    type = 1,
    sort = 5,
    type1 = 0,
    gold = 6,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 5,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 2
    };
getRow(204,3)->
    #mallCfg {
    item_id = 204,
    type = 3,
    sort = 3,
    type1 = 0,
    gold = 10,
    bind_gold = 10,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 0
    };
getRow(222,1)->
    #mallCfg {
    item_id = 222,
    type = 1,
    sort = 1,
    type1 = 0,
    gold = 3,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 20,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 2
    };
getRow(222,2)->
    #mallCfg {
    item_id = 222,
    type = 2,
    sort = 1,
    type1 = 0,
    gold = 5,
    bind_gold = 5,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 0
    };
getRow(224,1)->
    #mallCfg {
    item_id = 224,
    type = 1,
    sort = 2,
    type1 = 0,
    gold = 9,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 10,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 2
    };
getRow(224,2)->
    #mallCfg {
    item_id = 224,
    type = 2,
    sort = 2,
    type1 = 0,
    gold = 15,
    bind_gold = 15,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 0
    };
getRow(225,2)->
    #mallCfg {
    item_id = 225,
    type = 2,
    sort = 4,
    type1 = 0,
    gold = 10,
    bind_gold = 10,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 0
    };
getRow(226,2)->
    #mallCfg {
    item_id = 226,
    type = 2,
    sort = 5,
    type1 = 0,
    gold = 30,
    bind_gold = 30,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 0
    };
getRow(227,2)->
    #mallCfg {
    item_id = 227,
    type = 2,
    sort = 6,
    type1 = 0,
    gold = 90,
    bind_gold = 90,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 0
    };
getRow(229,1)->
    #mallCfg {
    item_id = 229,
    type = 1,
    sort = 3,
    type1 = 0,
    gold = 27,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 5,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 2
    };
getRow(229,2)->
    #mallCfg {
    item_id = 229,
    type = 2,
    sort = 3,
    type1 = 0,
    gold = 45,
    bind_gold = 45,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 0
    };
getRow(602,3)->
    #mallCfg {
    item_id = 602,
    type = 3,
    sort = 8,
    type1 = 0,
    gold = 2,
    bind_gold = 2,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 0
    };
getRow(604,3)->
    #mallCfg {
    item_id = 604,
    type = 3,
    sort = 9,
    type1 = 0,
    gold = 20,
    bind_gold = 20,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 0
    };
getRow(606,3)->
    #mallCfg {
    item_id = 606,
    type = 3,
    sort = 10,
    type1 = 0,
    gold = 100,
    bind_gold = 100,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 0
    };
getRow(1800,1)->
    #mallCfg {
    item_id = 1800,
    type = 1,
    sort = 7,
    type1 = 0,
    gold = 15,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 3,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 2
    };
getRow(1800,4)->
    #mallCfg {
    item_id = 1800,
    type = 4,
    sort = 1,
    type1 = 0,
    gold = 35,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 1,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 2
    };
getRow(2160,3)->
    #mallCfg {
    item_id = 2160,
    type = 3,
    sort = 4,
    type1 = 0,
    gold = 6,
    bind_gold = 6,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 0
    };
getRow(2161,3)->
    #mallCfg {
    item_id = 2161,
    type = 3,
    sort = 5,
    type1 = 0,
    gold = 18,
    bind_gold = 18,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 0
    };
getRow(2162,3)->
    #mallCfg {
    item_id = 2162,
    type = 3,
    sort = 6,
    type1 = 0,
    gold = 54,
    bind_gold = 54,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 0
    };
getRow(4200,3)->
    #mallCfg {
    item_id = 4200,
    type = 3,
    sort = 1,
    type1 = 0,
    gold = 40,
    bind_gold = 40,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 0
    };
getRow(22000,4)->
    #mallCfg {
    item_id = 22000,
    type = 4,
    sort = 2,
    type1 = 0,
    gold = 175,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 2,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 2
    };
getRow(22001,4)->
    #mallCfg {
    item_id = 22001,
    type = 4,
    sort = 3,
    type1 = 0,
    gold = 40,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 3,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 2
    };
getRow(22002,4)->
    #mallCfg {
    item_id = 22002,
    type = 4,
    sort = 4,
    type1 = 0,
    gold = 80,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 3,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 2
    };
getRow(22003,4)->
    #mallCfg {
    item_id = 22003,
    type = 4,
    sort = 5,
    type1 = 0,
    gold = 160,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 3,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 2
    };
getRow(22004,4)->
    #mallCfg {
    item_id = 22004,
    type = 4,
    sort = 6,
    type1 = 0,
    gold = 135,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 3,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 2
    };
getRow(22005,4)->
    #mallCfg {
    item_id = 22005,
    type = 4,
    sort = 7,
    type1 = 0,
    gold = 30,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 3,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 2
    };
getRow(22006,4)->
    #mallCfg {
    item_id = 22006,
    type = 4,
    sort = 8,
    type1 = 0,
    gold = 60,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 3,
    limit_day = 3,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 2
    };
getRow(29005,3)->
    #mallCfg {
    item_id = 29005,
    type = 3,
    sort = 7,
    type1 = 0,
    gold = 10,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 0
    };
getRow(29006,3)->
    #mallCfg {
    item_id = 29006,
    type = 3,
    sort = 8,
    type1 = 0,
    gold = 20,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 0
    };
getRow(29007,3)->
    #mallCfg {
    item_id = 29007,
    type = 3,
    sort = 9,
    type1 = 0,
    gold = 30,
    bind_gold = 0,
    use_integral = 0,
    get_integral = 0,
    limit_buy = 0,
    limit_type = 0,
    limit_day = 0,
    buy_reset = 0,
    level = 1,
    recharge = 0,
    ishide = 1,
    showtype = 0
    };
getRow(_,_)->[].

getKeyList()->[
    {201,1},
    {201,3},
    {203,1},
    {203,3},
    {204,1},
    {204,3},
    {222,1},
    {222,2},
    {224,1},
    {224,2},
    {225,2},
    {226,2},
    {227,2},
    {229,1},
    {229,2},
    {602,3},
    {604,3},
    {606,3},
    {1800,1},
    {1800,4},
    {2160,3},
    {2161,3},
    {2162,3},
    {4200,3},
    {22000,4},
    {22001,4},
    {22002,4},
    {22003,4},
    {22004,4},
    {22005,4},
    {22006,4},
    {29005,3},
    {29006,3},
    {29007,3}
    ].

get1KeyList()->[
    201,
    203,
    204,
    222,
    224,
    225,
    226,
    227,
    229,
    602,
    604,
    606,
    1800,
    2160,
    2161,
    2162,
    4200,
    22000,
    22001,
    22002,
    22003,
    22004,
    22005,
    22006,
    29005,
    29006,
    29007
    ].

get2KeyList(201)->[
    1,
    3
    ];
get2KeyList(203)->[
    1,
    3
    ];
get2KeyList(204)->[
    1,
    3
    ];
get2KeyList(222)->[
    1,
    2
    ];
get2KeyList(224)->[
    1,
    2
    ];
get2KeyList(225)->[
    2
    ];
get2KeyList(226)->[
    2
    ];
get2KeyList(227)->[
    2
    ];
get2KeyList(229)->[
    1,
    2
    ];
get2KeyList(602)->[
    3
    ];
get2KeyList(604)->[
    3
    ];
get2KeyList(606)->[
    3
    ];
get2KeyList(1800)->[
    1,
    4
    ];
get2KeyList(2160)->[
    3
    ];
get2KeyList(2161)->[
    3
    ];
get2KeyList(2162)->[
    3
    ];
get2KeyList(4200)->[
    3
    ];
get2KeyList(22000)->[
    4
    ];
get2KeyList(22001)->[
    4
    ];
get2KeyList(22002)->[
    4
    ];
get2KeyList(22003)->[
    4
    ];
get2KeyList(22004)->[
    4
    ];
get2KeyList(22005)->[
    4
    ];
get2KeyList(22006)->[
    4
    ];
get2KeyList(29005)->[
    3
    ];
get2KeyList(29006)->[
    3
    ];
get2KeyList(29007)->[
    3
    ];
get2KeyList(_)->[].

