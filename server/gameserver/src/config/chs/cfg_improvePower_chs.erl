%% coding: latin-1
%%: 实现
-module(cfg_improvePower_chs).
-compile(export_all).
-include("cfg_improvePower.hrl").
-include("logger.hrl").

getRow(1)->
    #improvePowerCfg {
    iD = 1,
    name = "我要升级",
    type = 1,
    parameterType = 0,
    allParameter = [1,5,75],
    icon = 437,
    description = "将等级提升至{0}级",
    relation_UI = [22,30]
    };
getRow(2)->
    #improvePowerCfg {
    iD = 2,
    name = "装备精炼",
    type = 2,
    parameterType = 1,
    allParameter = [1,1,75],
    icon = 437,
    description = "将8件装备强化提升到[ff9900]{0}[-]级",
    relation_UI = [9,0]
    };
getRow(5)->
    #improvePowerCfg {
    iD = 5,
    name = "纹章",
    type = 5,
    parameterType = 1,
    allParameter = [10,10,140],
    icon = 428,
    description = "纹章总等级达到{0}级",
    relation_UI = [13,0]
    };
getRow(6)->
    #improvePowerCfg {
    iD = 6,
    name = "时装",
    type = 6,
    parameterType = 1,
    allParameter = [1,2,15],
    icon = 429,
    description = "获得{0}件时装",
    relation_UI = [52,0]
    };
getRow(7)->
    #improvePowerCfg {
    iD = 7,
    name = "宠物升星",
    type = 7,
    parameterType = 1,
    allParameter = [2,1,25],
    icon = 430,
    description = "将任一宠物提升到[ff9900]{0}{1}[-]星",
    relation_UI = [5,0]
    };
getRow(8)->
    #improvePowerCfg {
    iD = 8,
    name = "宠物转生",
    type = 8,
    parameterType = 1,
    allParameter = [0,1,5],
    icon = 436,
    description = "将任一宠物提升到[ff9900]{0}[-]转",
    relation_UI = [5,0]
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {5},
    {6},
    {7},
    {8}
    ].

get1KeyList()->[
    1,
    2,
    5,
    6,
    7,
    8
    ].

