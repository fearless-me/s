%% coding: latin-1
%%: 实现
-module(cfg_improvePower_chs).
-compile(export_all).
-include("cfg_improvePower.hrl").
-include("logger.hrl").

getRow(1)->
    #improvePowerCfg {
    iD = 1,
    name = "装备精炼",
    type = 1,
    parameterType = 1,
    allParameter = [1,1,75],
    icon = 437,
    description = "将8件装备强化提升到[ff9900]{0}[-]级",
    relation_UI = 9
    };
getRow(3)->
    #improvePowerCfg {
    iD = 3,
    name = "翅膀",
    type = 3,
    parameterType = 1,
    allParameter = [1,3,60],
    icon = 439,
    description = "将星空之翼提升到[ff9900]{0}[-]阶[ff9900]{1}[-]级",
    relation_UI = 42
    };
getRow(4)->
    #improvePowerCfg {
    iD = 4,
    name = "器灵",
    type = 4,
    parameterType = 1,
    allParameter = [1,1,50],
    icon = 435,
    description = "将火冰雷风4个器灵提升到[ff9900]{0}[-]级",
    relation_UI = 34
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
    relation_UI = 13
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
    relation_UI = 52
    };
getRow(8)->
    #improvePowerCfg {
    iD = 8,
    name = "宠物升星",
    type = 8,
    parameterType = 1,
    allParameter = [2,1,25],
    icon = 430,
    description = "将任一宠物提升到[ff9900]{0}{1}[-]星",
    relation_UI = 5
    };
getRow(9)->
    #improvePowerCfg {
    iD = 9,
    name = "宠物转生",
    type = 9,
    parameterType = 1,
    allParameter = [0,1,5],
    icon = 436,
    description = "将任一宠物提升到[ff9900]{0}[-]转",
    relation_UI = 5
    };
getRow(10)->
    #improvePowerCfg {
    iD = 10,
    name = "女神",
    type = 10,
    parameterType = 1,
    allParameter = [10,10,120],
    icon = 436,
    description = "将女神总等级提升到[ff9900]{0}[-]级",
    relation_UI = 18
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {3},
    {4},
    {5},
    {6},
    {8},
    {9},
    {10}
    ].

get1KeyList()->[
    1,
    3,
    4,
    5,
    6,
    8,
    9,
    10
    ].

