%%: 实现
-module(cfg_newplayer_tory_chs).
-compile(export_all).
-include("cfg_newplayer_tory.hrl").
-include("logger.hrl").

getRow(1)->
    #newplayer_toryCfg {
    iD = 1,
    picture = "SencePanel_3",
    story = "你好这只是一个测试"
    };
getRow(_)->[].

getKeyList()->[
    {1}
    ].

get1KeyList()->[
    1
    ].

