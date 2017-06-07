%% coding: latin-1
%%: 实现
-module(cfg_needForSpeedItem_chs).
-compile(export_all).
-include("cfg_needForSpeedItem.hrl").
-include("logger.hrl").

getRow(2500)->
    #needForSpeedItemCfg {
    id = 2500,
    logic_group_id = 22,
    icon = 134,
    text = "港口竞速：冰冻技能",
    name = "港口竞速：冰冻技能"
    };
getRow(2501)->
    #needForSpeedItemCfg {
    id = 2501,
    logic_group_id = 23,
    icon = 135,
    text = "港口竞速：陷阱技能",
    name = "港口竞速：陷阱技能"
    };
getRow(2502)->
    #needForSpeedItemCfg {
    id = 2502,
    logic_group_id = 24,
    icon = 138,
    text = "港口竞速：闪电技能",
    name = "港口竞速：闪电技能"
    };
getRow(2503)->
    #needForSpeedItemCfg {
    id = 2503,
    logic_group_id = 26,
    icon = 171,
    text = "港口竞速：加速技能",
    name = "港口竞速：加速技能"
    };
getRow(2504)->
    #needForSpeedItemCfg {
    id = 2504,
    logic_group_id = 27,
    icon = 14,
    text = "港口竞速：无敌技能",
    name = "港口竞速：无敌技能"
    };
getRow(_)->[].

getKeyList()->[
    {2500},
    {2501},
    {2502},
    {2503},
    {2504}
    ].

get1KeyList()->[
    2500,
    2501,
    2502,
    2503,
    2504
    ].

