%% coding: latin-1
%%: 实现
-module(cfg_guildbuff_chs).
-compile(export_all).
-include("cfg_guildbuff.hrl").
-include("logger.hrl").

getRow(1)->
    #guildbuffCfg {
    id = 1,
    buff = 264,
    guildlevel = 1,
    cost = [{3,200}],
    showname = "全军狂化",
    description = "伤害增加10%。持续4小时"
    };
getRow(2)->
    #guildbuffCfg {
    id = 2,
    buff = 265,
    guildlevel = 1,
    cost = [{3,100}],
    showname = "全军备战",
    description = "受到伤害减少10%。持续4小时"
    };
getRow(3)->
    #guildbuffCfg {
    id = 3,
    buff = 266,
    guildlevel = 1,
    cost = [{3,100}],
    showname = "全军振奋",
    description = "生命上限提高10%。持续4小时"
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3}
    ].

get1KeyList()->[
    1,
    2,
    3
    ].

