%% coding: latin-1
%%: 实现
-module(cfg_shop_deal_chs).
-compile(export_all).
-include("cfg_shop_deal.hrl").
-include("logger.hrl").

getRow(1)->
    #shop_dealCfg {
    id = 1,
    shop_item = 100,
    deal_item = 102,
    deal_number = 5,
    daily = 10
    };
getRow(_)->[].

getKeyList()->[
    {1}
    ].

get1KeyList()->[
    1
    ].

