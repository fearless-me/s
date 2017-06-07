%% coding: latin-1
%%: 实现
-module(cfg_userFeedbackType_chs).
-compile(export_all).
-include("cfg_userFeedbackType.hrl").
-include("logger.hrl").

getRow(1)->
    #userFeedbackTypeCfg {
    iD = 1,
    desc = "提交BUG"
    };
getRow(2)->
    #userFeedbackTypeCfg {
    iD = 2,
    desc = "玩家建议"
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2}
    ].

get1KeyList()->[
    1,
    2
    ].

