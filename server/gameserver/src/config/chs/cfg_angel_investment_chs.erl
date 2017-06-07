%% coding: latin-1
%%: 实现
-module(cfg_angel_investment_chs).
-compile(export_all).
-include("cfg_angel_investment.hrl").
-include("logger.hrl").

getRow(1)->
    #angel_investmentCfg {
    id = 1,
    item = 222,
    num1 = 10,
    buy = 80,
    sale = 64
    };
getRow(2)->
    #angel_investmentCfg {
    id = 2,
    item = 2160,
    num1 = 10,
    buy = 80,
    sale = 64
    };
getRow(3)->
    #angel_investmentCfg {
    id = 3,
    item = 2102,
    num1 = 10,
    buy = 80,
    sale = 64
    };
getRow(4)->
    #angel_investmentCfg {
    id = 4,
    item = 273,
    num1 = 10,
    buy = 240,
    sale = 192
    };
getRow(5)->
    #angel_investmentCfg {
    id = 5,
    item = 622,
    num1 = 50,
    buy = 80,
    sale = 64
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5
    ].

