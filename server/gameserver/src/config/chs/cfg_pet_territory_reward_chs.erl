%% coding: latin-1
%%: 实现
-module(cfg_pet_territory_reward_chs).
-compile(export_all).
-include("cfg_pet_territory_reward.hrl").
-include("logger.hrl").

getRow(16)->
    #pet_territory_rewardCfg {
    id = 16,
    reward = [{240,3},{250,3}]
    };
getRow(29)->
    #pet_territory_rewardCfg {
    id = 29,
    reward = [{240,3},{250,3}]
    };
getRow(39)->
    #pet_territory_rewardCfg {
    id = 39,
    reward = [{241,4},{251,4}]
    };
getRow(50)->
    #pet_territory_rewardCfg {
    id = 50,
    reward = [{241,4},{251,4}]
    };
getRow(_)->[].

getKeyList()->[
    {16},
    {29},
    {39},
    {50}
    ].

get1KeyList()->[
    16,
    29,
    39,
    50
    ].

