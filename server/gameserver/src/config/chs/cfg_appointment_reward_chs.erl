%% coding: latin-1
%%: 实现
-module(cfg_appointment_reward_chs).
-compile(export_all).
-include("cfg_appointment_reward.hrl").
-include("logger.hrl").

getRow(1,32)->
    #appointment_rewardCfg {
    id = 1,
    level = 32,
    name = "梦幻消除",
    reward = [{0,3300},{20,3301},{60,3302},{100,3303}],
    reward_friend = 100,
    reward_couple = 100
    };
getRow(1,50)->
    #appointment_rewardCfg {
    id = 1,
    level = 50,
    name = "梦幻消除",
    reward = [{0,3300},{20,3301},{60,3302},{100,3303}],
    reward_friend = 100,
    reward_couple = 100
    };
getRow(2,32)->
    #appointment_rewardCfg {
    id = 2,
    level = 32,
    name = "游园惊梦",
    reward = [{0,3300},{20,3301},{60,3302},{100,3303}],
    reward_friend = 100,
    reward_couple = 100
    };
getRow(2,50)->
    #appointment_rewardCfg {
    id = 2,
    level = 50,
    name = "游园惊梦",
    reward = [{0,3300},{20,3301},{60,3302},{100,3303}],
    reward_friend = 100,
    reward_couple = 100
    };
getRow(_,_)->[].

getKeyList()->[
    {1,32},
    {1,50},
    {2,32},
    {2,50}
    ].

get1KeyList()->[
    1,
    2
    ].

get2KeyList(1)->[
    32,
    50
    ];
get2KeyList(2)->[
    32,
    50
    ];
get2KeyList(_)->[].

