%% coding: latin-1
%%: 实现
-module(cfg_guildsnowman_chs).
-compile(export_all).
-include("cfg_guildsnowman.hrl").
-include("logger.hrl").

getRow(1)->
    #guildsnowmanCfg {
    id = 1,
    name = "雪块儿",
    icon = 4020,
    snowmanNeed = 50,
    carryMax = 15,
    srcType = 2,
    srcID = 11004,
    rate = 1,
    pos = [{{240,240},6},{{250,190},6},{{210,160},6},{{150,170},6},{{150,190},6}],
    reward = [{12,50}],
    describe_1 = "堆积雪人的下半身",
    describe_2 = "（当前周围场景中收集）"
    };
getRow(2)->
    #guildsnowmanCfg {
    id = 2,
    name = "雪块儿",
    icon = 4020,
    snowmanNeed = 50,
    carryMax = 15,
    srcType = 2,
    srcID = 11005,
    rate = 1,
    pos = [{{240,240},6},{{250,190},6},{{210,160},6},{{150,170},6},{{150,190},6}],
    reward = [{12,50}],
    describe_1 = "堆积雪人的上半身",
    describe_2 = "（当前周围场景中收集）"
    };
getRow(3)->
    #guildsnowmanCfg {
    id = 3,
    name = "煤球儿",
    icon = 4017,
    snowmanNeed = 50,
    carryMax = 15,
    srcType = 1,
    srcID = 3452,
    rate = 1,
    pos = [{{240,240},3},{{250,190},3},{{210,160},3},{{150,170},3},{{150,190},3}],
    reward = [{12,50}],
    describe_1 = "完成雪人的眼睛",
    describe_2 = "（击杀漆黑的煤球小人获得）"
    };
getRow(4)->
    #guildsnowmanCfg {
    id = 4,
    name = "胡萝卜",
    icon = 4016,
    snowmanNeed = 60,
    carryMax = 15,
    srcType = 1,
    srcID = 3451,
    rate = 1,
    pos = [{{240,240},3},{{250,190},3},{{210,160},3},{{150,170},3},{{150,190},3}],
    reward = [{12,50}],
    describe_1 = "完成雪人的鼻子",
    describe_2 = "（击杀偷吃的兔子获得）"
    };
getRow(5)->
    #guildsnowmanCfg {
    id = 5,
    name = "圣诞帽",
    icon = 4018,
    snowmanNeed = 50,
    carryMax = 15,
    srcType = 2,
    srcID = 11007,
    rate = 1,
    pos = [{{240,240},6},{{250,190},6},{{210,160},6},{{150,170},6},{{150,190},6}],
    reward = [{12,50}],
    describe_1 = "完成雪人的帽子",
    describe_2 = "（当前周围场景中收集）"
    };
getRow(6)->
    #guildsnowmanCfg {
    id = 6,
    name = "树枝",
    icon = 4019,
    snowmanNeed = 60,
    carryMax = 15,
    srcType = 1,
    srcID = 3450,
    rate = 1,
    pos = [{{240,240},2},{{250,190},2},{{210,160},2},{{150,170},2},{{150,190},2}],
    reward = [{12,50}],
    describe_1 = "完成雪人的双手",
    describe_2 = "（击杀树枝怪获得）"
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6
    ].

