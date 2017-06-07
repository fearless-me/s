%% coding: latin-1
%%: 实现
-module(cfg_removeSkillAffix_chs).
-compile(export_all).
-include("cfg_removeSkillAffix.hrl").
-include("logger.hrl").

getRow(1)->
    #removeSkillAffixCfg {
    id = 1,
    class = 1,
    buff = [7],
    carrier = [2,3]
    };
getRow(2)->
    #removeSkillAffixCfg {
    id = 2,
    class = 2,
    buff = [9,10,12],
    carrier = [5,6],
    pet = [5]
    };
getRow(3)->
    #removeSkillAffixCfg {
    id = 3,
    class = 3,
    buff = [60]
    };
getRow(4)->
    #removeSkillAffixCfg {
    id = 4,
    class = 4,
    buff = [20],
    carrier = [7],
    pet = [6,7]
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4
    ].

