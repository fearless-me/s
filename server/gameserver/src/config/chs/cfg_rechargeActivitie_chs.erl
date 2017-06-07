%% coding: latin-1
%%: 实现
-module(cfg_rechargeActivitie_chs).
-compile(export_all).
-include("cfg_rechargeActivitie.hrl").
-include("logger.hrl").

getRow(2)->
    #rechargeActivitieCfg {
    id = 2,
    sort = 3,
    name = "七日充值",
    delete = 1
    };
getRow(3)->
    #rechargeActivitieCfg {
    id = 3,
    sort = 1,
    name = "七日首充",
    delete = 1
    };
getRow(4)->
    #rechargeActivitieCfg {
    id = 4,
    sort = 5,
    name = "累充奖励",
    delete = 0
    };
getRow(5)->
    #rechargeActivitieCfg {
    id = 5,
    sort = 6,
    name = "爵位礼包",
    delete = 0
    };
getRow(6)->
    #rechargeActivitieCfg {
    id = 6,
    sort = 2,
    name = "天使投资",
    delete = 0
    };
getRow(8)->
    #rechargeActivitieCfg {
    id = 8,
    sort = 7,
    name = "每日充值",
    delete = 0
    };
getRow(_)->[].

getKeyList()->[
    {2},
    {3},
    {4},
    {5},
    {6},
    {8}
    ].

get1KeyList()->[
    2,
    3,
    4,
    5,
    6,
    8
    ].

