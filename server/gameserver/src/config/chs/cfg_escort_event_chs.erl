%% coding: latin-1
%%: 实现
-module(cfg_escort_event_chs).
-compile(export_all).
-include("cfg_escort_event.hrl").
-include("logger.hrl").

getRow(1)->
    #escort_eventCfg {
    id = 1,
    event = [1,0.1],
    event_name = "护送收益增加",
    event_num = 1
    };
getRow(2)->
    #escort_eventCfg {
    id = 2,
    event = [1,0.25],
    event_name = "护送收益爆增",
    event_num = 1
    };
getRow(3)->
    #escort_eventCfg {
    id = 3,
    event = [2,237],
    event_name = "马车速度+100%",
    event_num = -1
    };
getRow(4)->
    #escort_eventCfg {
    id = 4,
    event = [2,241],
    event_name = "马车速度-50%",
    event_num = -1
    };
getRow(5)->
    #escort_eventCfg {
    id = 5,
    event = [2,240],
    event_name = "马车无敌",
    event_num = -1
    };
getRow(6)->
    #escort_eventCfg {
    id = 6,
    event = [3,234],
    event_name = "护送玩家伤害+100%",
    event_num = -1
    };
getRow(7)->
    #escort_eventCfg {
    id = 7,
    event = [3,236],
    event_name = "护送玩家血量+100%",
    event_num = -1
    };
getRow(8)->
    #escort_eventCfg {
    id = 8,
    event = [3,235],
    event_name = "护送玩家免控",
    event_num = -1
    };
getRow(9)->
    #escort_eventCfg {
    id = 9,
    event = [5,0,5],
    event_name = "额外劫掠怪物刷新",
    event_num = -1
    };
getRow(10)->
    #escort_eventCfg {
    id = 10,
    event = [4,238],
    event_name = "劫掠玩家伤害+15%",
    event_num = -1
    };
getRow(11)->
    #escort_eventCfg {
    id = 11,
    event = [4,239],
    event_name = "劫掠玩家血量+30%",
    event_num = -1
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
    {8},
    {9},
    {10},
    {11}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11
    ].

