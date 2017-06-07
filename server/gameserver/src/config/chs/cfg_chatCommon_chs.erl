%% coding: latin-1
%%: 实现
-module(cfg_chatCommon_chs).
-compile(export_all).
-include("cfg_chatCommon.hrl").
-include("logger.hrl").

getRow(1)->
    #chatCommonCfg {
    id = 1,
    sentence = "对不起，点错了。"
    };
getRow(2)->
    #chatCommonCfg {
    id = 2,
    sentence = "速度吧，都等着呢。"
    };
getRow(3)->
    #chatCommonCfg {
    id = 3,
    sentence = "稍等一下，有事。"
    };
getRow(4)->
    #chatCommonCfg {
    id = 4,
    sentence = "好的，没问题。"
    };
getRow(5)->
    #chatCommonCfg {
    id = 5,
    sentence = "求交往！"
    };
getRow(6)->
    #chatCommonCfg {
    id = 6,
    sentence = "土豪我们做朋友！"
    };
getRow(7)->
    #chatCommonCfg {
    id = 7,
    sentence = "谢谢！"
    };
getRow(8)->
    #chatCommonCfg {
    id = 8,
    sentence = "我先走了，再见！"
    };
getRow(9)->
    #chatCommonCfg {
    id = 9,
    sentence = "下次再一起玩吧。"
    };
getRow(10)->
    #chatCommonCfg {
    id = 10,
    sentence = "求不挂机！"
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7},
    {8},
    {9},
    {10}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ].

