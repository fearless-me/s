%% coding: latin-1
%%: 实现
-module(cfg_newplayer_Story_chs).
-compile(export_all).
-include("cfg_newplayer_Story.hrl").
-include("logger.hrl").

getRow(1)->
    #newplayer_StoryCfg {
    type = 1,
    iD = 1,
    picture = "gdcity",
    story = "黑潮军团的入侵带来了毁灭和远古血脉的觉醒。"
    };
getRow(2)->
    #newplayer_StoryCfg {
    type = 1,
    iD = 2,
    picture = "time",
    story = "消失的神之后裔纷纷觉醒，踏上了对抗黑潮之灾的行程。"
    };
getRow(3)->
    #newplayer_StoryCfg {
    type = 1,
    iD = 3,
    picture = "Image_instance_109",
    story = "为了女神和荣耀，奋勇向前吧，勇士们！"
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

