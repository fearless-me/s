%% coding: latin-1
%%: 实现
-module(cfg_prestige_Reward_chs).
-compile(export_all).
-include("cfg_prestige_Reward.hrl").
-include("logger.hrl").

getRow(1)->
    #prestige_RewardCfg {
    di = 1,
    ranking_1 = 1,
    ranking_2 = 1,
    item = 100
    };
getRow(2)->
    #prestige_RewardCfg {
    di = 2,
    ranking_1 = 2,
    ranking_2 = 10,
    item = 101
    };
getRow(3)->
    #prestige_RewardCfg {
    di = 3,
    ranking_1 = 11,
    ranking_2 = 35,
    item = 102
    };
getRow(4)->
    #prestige_RewardCfg {
    di = 4,
    ranking_1 = 36,
    ranking_2 = 75,
    item = 103
    };
getRow(5)->
    #prestige_RewardCfg {
    di = 5,
    ranking_1 = 76,
    ranking_2 = 9999999,
    item = 104
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

