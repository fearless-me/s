%% coding: latin-1
%%: 实现
-module(cfg_question_chs).
-compile(export_all).
-include("cfg_question.hrl").
-include("logger.hrl").

getRow(1)->
    #questionCfg {
    id = 1,
    type = 1,
    question = "a",
    answer1 = "a",
    answer2 = "a",
    answer3 = "a",
    answer4 = "a"
    };
getRow(_)->[].

getKeyList()->[
    {1}
    ].

get1KeyList()->[
    1
    ].

