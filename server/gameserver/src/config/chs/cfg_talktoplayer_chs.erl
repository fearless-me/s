%% coding: latin-1
%%: 实现
-module(cfg_talktoplayer_chs).
-compile(export_all).
-include("cfg_talktoplayer.hrl").
-include("logger.hrl").

getRow(1)->
    #talktoplayerCfg {
    id = 1,
    content = "游戏的世界里交到朋友，可以玩得更开心。"
    };
getRow(2)->
    #talktoplayerCfg {
    id = 2,
    content = "刷副本，爆装备，然后去炫耀！"
    };
getRow(3)->
    #talktoplayerCfg {
    id = 3,
    content = "请用放松及休闲的心态来享受这个游戏。"
    };
getRow(4)->
    #talktoplayerCfg {
    id = 4,
    content = "朋友的价值远远大于那些装备或者金币。"
    };
getRow(5)->
    #talktoplayerCfg {
    id = 5,
    content = "大型多人情景互动聊天社区，也是这个游戏的定义之一。"
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5
    ].

