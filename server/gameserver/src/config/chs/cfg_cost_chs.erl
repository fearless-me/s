%% coding: latin-1
%%: 实现
-module(cfg_cost_chs).
-compile(export_all).
-include("cfg_cost.hrl").
-include("logger.hrl").

getRow(1)->
    #costCfg {
    id = 1,
    itemid = 4300,
    number = 1,
    internalPurchase = 0,
    diamond = 300,
    bind_diamond = -1,
    use_integral = -1,
    limit_buy = 0,
    buy_reset = 0,
    coinUseCode = 10021,
    itemSourceCode = 35
    };
getRow(2)->
    #costCfg {
    id = 2,
    itemid = 750,
    number = 1,
    internalPurchase = 0,
    diamond = 10,
    bind_diamond = 0,
    use_integral = -1,
    limit_buy = 0,
    buy_reset = 0,
    coinUseCode = 10029,
    itemSourceCode = 47
    };
getRow(3)->
    #costCfg {
    id = 3,
    itemid = 751,
    number = 1,
    internalPurchase = 0,
    diamond = 10,
    bind_diamond = 0,
    use_integral = -1,
    limit_buy = 0,
    buy_reset = 0,
    coinUseCode = 10029,
    itemSourceCode = 47
    };
getRow(4)->
    #costCfg {
    id = 4,
    itemid = 752,
    number = 1,
    internalPurchase = 0,
    diamond = 30,
    bind_diamond = 0,
    use_integral = -1,
    limit_buy = 0,
    buy_reset = 0,
    coinUseCode = 10029,
    itemSourceCode = 47
    };
getRow(5)->
    #costCfg {
    id = 5,
    itemid = 753,
    number = 1,
    internalPurchase = 0,
    diamond = 50,
    bind_diamond = 0,
    use_integral = -1,
    limit_buy = 0,
    buy_reset = 0,
    coinUseCode = 10029,
    itemSourceCode = 47
    };
getRow(6)->
    #costCfg {
    id = 6,
    itemid = 754,
    number = 1,
    internalPurchase = 0,
    diamond = 10,
    bind_diamond = 0,
    use_integral = -1,
    limit_buy = 0,
    buy_reset = 0,
    coinUseCode = 10029,
    itemSourceCode = 47
    };
getRow(7)->
    #costCfg {
    id = 7,
    itemid = 755,
    number = 1,
    internalPurchase = 0,
    diamond = 10,
    bind_diamond = 0,
    use_integral = -1,
    limit_buy = 0,
    buy_reset = 0,
    coinUseCode = 10029,
    itemSourceCode = 47
    };
getRow(8)->
    #costCfg {
    id = 8,
    itemid = 756,
    number = 1,
    internalPurchase = 0,
    diamond = 50,
    bind_diamond = 0,
    use_integral = -1,
    limit_buy = 0,
    buy_reset = 0,
    coinUseCode = 10029,
    itemSourceCode = 47
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7},
    {8}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8
    ].

