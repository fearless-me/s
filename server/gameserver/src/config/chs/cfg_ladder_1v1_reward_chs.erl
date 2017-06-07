%% coding: latin-1
%%: 实现
-module(cfg_ladder_1v1_reward_chs).
-compile(export_all).
-include("cfg_ladder_1v1_reward.hrl").
-include("logger.hrl").

getRow(1,1)->
    #ladder_1v1_rewardCfg {
    rank_start = 1,
    rank_end = 1,
    normal = 1000,
    extra = 0,
    everydaycoin = [6,100],
    item = 2400,
    coin = [1,6,300]
    };
getRow(2,2)->
    #ladder_1v1_rewardCfg {
    rank_start = 2,
    rank_end = 2,
    normal = 800,
    extra = 0,
    everydaycoin = [6,80],
    item = 2401,
    coin = [1,6,200]
    };
getRow(3,5)->
    #ladder_1v1_rewardCfg {
    rank_start = 3,
    rank_end = 5,
    normal = 700,
    extra = 0,
    everydaycoin = [6,80],
    item = 2402,
    coin = [1,6,75]
    };
getRow(6,10)->
    #ladder_1v1_rewardCfg {
    rank_start = 6,
    rank_end = 10,
    normal = 600,
    extra = 0,
    everydaycoin = [6,70],
    item = 2403,
    coin = [2,6,60]
    };
getRow(11,50)->
    #ladder_1v1_rewardCfg {
    rank_start = 11,
    rank_end = 50,
    normal = 300,
    extra = 0,
    everydaycoin = [6,70],
    item = 2404,
    coin = [19,6,60]
    };
getRow(51,100)->
    #ladder_1v1_rewardCfg {
    rank_start = 51,
    rank_end = 100,
    normal = 180,
    extra = 0,
    everydaycoin = [6,60],
    item = 2405,
    coin = [24,6,50]
    };
getRow(101,400)->
    #ladder_1v1_rewardCfg {
    rank_start = 101,
    rank_end = 400,
    normal = 130,
    extra = 0,
    everydaycoin = [6,50],
    item = 2405,
    coin = [99,6,50]
    };
getRow(401,800)->
    #ladder_1v1_rewardCfg {
    rank_start = 401,
    rank_end = 800,
    normal = 120,
    extra = 0,
    everydaycoin = [6,50],
    item = 2405,
    coin = [199,6,45]
    };
getRow(801,1300)->
    #ladder_1v1_rewardCfg {
    rank_start = 801,
    rank_end = 1300,
    normal = 110,
    extra = 0,
    everydaycoin = [6,50],
    item = 2405,
    coin = [150,6,25]
    };
getRow(1301,2000)->
    #ladder_1v1_rewardCfg {
    rank_start = 1301,
    rank_end = 2000,
    normal = 110,
    extra = 0,
    everydaycoin = [6,50],
    item = 2405,
    coin = [300,6,18]
    };
getRow(2001,3000)->
    #ladder_1v1_rewardCfg {
    rank_start = 2001,
    rank_end = 3000,
    normal = 100,
    extra = 0,
    everydaycoin = [6,50],
    item = 2405,
    coin = [500,6,15]
    };
getRow(3001,9999999)->
    #ladder_1v1_rewardCfg {
    rank_start = 3001,
    rank_end = 9999999,
    normal = 100,
    extra = 0,
    everydaycoin = [6,50],
    item = 2405,
    coin = [500,6,0]
    };
getRow(_,_)->[].

getKeyList()->[
    {1,1},
    {2,2},
    {3,5},
    {6,10},
    {11,50},
    {51,100},
    {101,400},
    {401,800},
    {801,1300},
    {1301,2000},
    {2001,3000},
    {3001,9999999}
    ].

get1KeyList()->[
    1,
    2,
    3,
    6,
    11,
    51,
    101,
    401,
    801,
    1301,
    2001,
    3001
    ].

get2KeyList(1)->[
    1
    ];
get2KeyList(2)->[
    2
    ];
get2KeyList(3)->[
    5
    ];
get2KeyList(6)->[
    10
    ];
get2KeyList(11)->[
    50
    ];
get2KeyList(51)->[
    100
    ];
get2KeyList(101)->[
    400
    ];
get2KeyList(401)->[
    800
    ];
get2KeyList(801)->[
    1300
    ];
get2KeyList(1301)->[
    2000
    ];
get2KeyList(2001)->[
    3000
    ];
get2KeyList(3001)->[
    9999999
    ];
get2KeyList(_)->[].

