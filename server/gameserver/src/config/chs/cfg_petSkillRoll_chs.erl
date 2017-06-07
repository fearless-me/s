%% coding: latin-1
%%: 实现
-module(cfg_petSkillRoll_chs).
-compile(export_all).
-include("cfg_petSkillRoll.hrl").
-include("logger.hrl").

getRow(0)->
    #petSkillRollCfg {
    petquality = 0,
    petSkillroll = [{0,7000},{1,3000},{2,0},{3,0},{4,0}]
    };
getRow(1)->
    #petSkillRollCfg {
    petquality = 1,
    petSkillroll = [{0,6300},{1,3500},{2,200},{3,0},{4,0}]
    };
getRow(2)->
    #petSkillRollCfg {
    petquality = 2,
    petSkillroll = [{0,5700},{1,3840},{2,450},{3,10},{4,0}]
    };
getRow(3)->
    #petSkillRollCfg {
    petquality = 3,
    petSkillroll = [{0,5000},{1,4070},{2,905},{3,20},{4,5}]
    };
getRow(4)->
    #petSkillRollCfg {
    petquality = 4,
    petSkillroll = [{0,4000},{1,4750},{2,1200},{3,40},{4,10}]
    };
getRow(_)->[].

getKeyList()->[
    {0},
    {1},
    {2},
    {3},
    {4}
    ].

get1KeyList()->[
    0,
    1,
    2,
    3,
    4
    ].

