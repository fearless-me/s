%% coding: latin-1
%%: 实现
-module(cfg_recharge_item_relation_chs).
-compile(export_all).
-include("cfg_recharge_item_relation.hrl").
-include("logger.hrl").

getRow(1)->
    #recharge_item_relationCfg {
    id = 1,
    items = [[226,10,1]]
    };
getRow(165001)->
    #recharge_item_relationCfg {
    id = 165001,
    items = []
    };
getRow(168011)->
    #recharge_item_relationCfg {
    id = 168011,
    items = []
    };
getRow(168012)->
    #recharge_item_relationCfg {
    id = 168012,
    items = []
    };
getRow(168013)->
    #recharge_item_relationCfg {
    id = 168013,
    items = []
    };
getRow(168014)->
    #recharge_item_relationCfg {
    id = 168014,
    items = []
    };
getRow(168015)->
    #recharge_item_relationCfg {
    id = 168015,
    items = []
    };
getRow(168016)->
    #recharge_item_relationCfg {
    id = 168016,
    items = []
    };
getRow(168017)->
    #recharge_item_relationCfg {
    id = 168017,
    items = []
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {165001},
    {168011},
    {168012},
    {168013},
    {168014},
    {168015},
    {168016},
    {168017}
    ].

get1KeyList()->[
    1,
    165001,
    168011,
    168012,
    168013,
    168014,
    168015,
    168016,
    168017
    ].

