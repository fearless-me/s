%% coding: latin-1
%%: 实现
-module(cfg_level_reward_chs).
-compile(export_all).
-include("cfg_level_reward.hrl").
-include("logger.hrl").

getRow(10)->
    #level_rewardCfg {
    id = 10,
    item1 = 222,
    num1 = 30,
    tpye1 = 0,
    item2 = 2600,
    num2 = 30,
    tpye2 = 0,
    item3 = 0,
    num3 = 0,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(20)->
    #level_rewardCfg {
    id = 20,
    item1 = 1111,
    num1 = 4,
    tpye1 = 0,
    item2 = 2160,
    num2 = 20,
    tpye2 = 0,
    item3 = 1801,
    num3 = 10,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(30)->
    #level_rewardCfg {
    id = 30,
    item1 = 4303,
    num1 = 20,
    tpye1 = 0,
    item2 = 2160,
    num2 = 30,
    tpye2 = 0,
    item3 = 20,
    num3 = 100,
    tpye3 = 0,
    item4 = 0,
    num4 = 0,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(40)->
    #level_rewardCfg {
    id = 40,
    item1 = 222,
    num1 = 50,
    tpye1 = 0,
    item2 = 225,
    num2 = 50,
    tpye2 = 0,
    item3 = 7001,
    num3 = 400,
    tpye3 = 0,
    item4 = 271,
    num4 = 3,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(45)->
    #level_rewardCfg {
    id = 45,
    item1 = 4304,
    num1 = 20,
    tpye1 = 0,
    item2 = 1801,
    num2 = 30,
    tpye2 = 0,
    item3 = 2600,
    num3 = 50,
    tpye3 = 0,
    item4 = 2503,
    num4 = 1,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(50)->
    #level_rewardCfg {
    id = 50,
    item1 = 1802,
    num1 = 1,
    tpye1 = 0,
    item2 = 2161,
    num2 = 30,
    tpye2 = 0,
    item3 = 2162,
    num3 = 20,
    tpye3 = 0,
    item4 = 272,
    num4 = 3,
    tpye4 = 0,
    item5 = 0,
    num5 = 0,
    tpye5 = 0
    };
getRow(_)->[].

getKeyList()->[
    {10},
    {20},
    {30},
    {40},
    {45},
    {50}
    ].

get1KeyList()->[
    10,
    20,
    30,
    40,
    45,
    50
    ].

