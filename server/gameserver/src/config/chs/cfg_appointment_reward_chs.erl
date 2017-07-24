%% coding: latin-1
%%: 实现
-module(cfg_appointment_reward_chs).
-compile(export_all).
-include("cfg_appointment_reward.hrl").
-include("logger.hrl").

getRow(1,27)->
    #appointment_rewardCfg {
    id = 1,
    level = 27,
    name = "梦幻消除",
    reward = [{0,3300},{20,3301},{60,3302},{100,3303}],
    reward_friend = 100,
    reward_couple = 100
    };
getRow(1,40)->
    #appointment_rewardCfg {
    id = 1,
    level = 40,
    name = "梦幻消除",
    reward = [{0,3300},{20,3301},{60,3302},{100,3303}],
    reward_friend = 150,
    reward_couple = 150
    };
getRow(2,27)->
    #appointment_rewardCfg {
    id = 2,
    level = 27,
    name = "游园惊梦",
    reward = [{0,3300},{20,3301},{60,3302},{100,3303}],
    reward_friend = 100,
    reward_couple = 100
    };
getRow(2,40)->
    #appointment_rewardCfg {
    id = 2,
    level = 40,
    name = "游园惊梦",
    reward = [{0,3300},{20,3301},{60,3302},{100,3303}],
    reward_friend = 150,
    reward_couple = 150
    };
getRow(3,27)->
    #appointment_rewardCfg {
    id = 3,
    level = 27,
    name = "泳池派对",
    reward = [{0,3300},{20,3301},{60,3302},{100,3303}],
    reward_friend = 100,
    reward_couple = 100
    };
getRow(3,40)->
    #appointment_rewardCfg {
    id = 3,
    level = 40,
    name = "泳池派对",
    reward = [{0,3300},{20,3301},{60,3302},{100,3303}],
    reward_friend = 150,
    reward_couple = 150
    };
getRow(4,27)->
    #appointment_rewardCfg {
    id = 4,
    level = 27,
    name = "躲喵喵",
    reward = [{0,3300},{20,3301},{60,3302},{100,3303}],
    reward_friend = 100,
    reward_couple = 100
    };
getRow(4,40)->
    #appointment_rewardCfg {
    id = 4,
    level = 40,
    name = "躲喵喵",
    reward = [{0,3300},{20,3301},{60,3302},{100,3303}],
    reward_friend = 150,
    reward_couple = 150
    };
getRow(_,_)->[].

getKeyList()->[
    {1,27},
    {1,40},
    {2,27},
    {2,40},
    {3,27},
    {3,40},
    {4,27},
    {4,40}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4
    ].

get2KeyList(1)->[
    27,
    40
    ];
get2KeyList(2)->[
    27,
    40
    ];
get2KeyList(3)->[
    27,
    40
    ];
get2KeyList(4)->[
    27,
    40
    ];
get2KeyList(_)->[].

