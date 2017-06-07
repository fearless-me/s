%% coding: latin-1
%%: 实现
-module(cfg_itemCDandCount_chs).
-compile(export_all).
-include("cfg_itemCDandCount.hrl").
-include("logger.hrl").

getRow(1)->
    #itemCDandCountCfg {
    iD = 1,
    value = 10
    };
getRow(2)->
    #itemCDandCountCfg {
    iD = 2,
    value = 10
    };
getRow(3)->
    #itemCDandCountCfg {
    iD = 3,
    value = 10
    };
getRow(4)->
    #itemCDandCountCfg {
    iD = 4,
    value = 10
    };
getRow(5)->
    #itemCDandCountCfg {
    iD = 5,
    value = 180
    };
getRow(6)->
    #itemCDandCountCfg {
    iD = 6,
    value = 10
    };
getRow(1000)->
    #itemCDandCountCfg {
    iD = 1000,
    value = 555
    };
getRow(1001)->
    #itemCDandCountCfg {
    iD = 1001,
    value = 888
    };
getRow(1098)->
    #itemCDandCountCfg {
    iD = 1098,
    value = 999
    };
getRow(1099)->
    #itemCDandCountCfg {
    iD = 1099,
    value = 999
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {1000},
    {1001},
    {1098},
    {1099}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    1000,
    1001,
    1098,
    1099
    ].

