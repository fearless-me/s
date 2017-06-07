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
    snowmanNeed = 30,
    carryMax = 500,
    srcType = 2,
    srcID = 11004,
    rate = 1,
    pos = [{247,197},{244,188},{177,201},{200,242},{160,219},{136,185},{160,155},{244,250},{220,156},{150,182}],
    reward = [{12,5}]
    };
getRow(2)->
    #guildsnowmanCfg {
    id = 2,
    name = "雪块儿",
    icon = 4020,
    snowmanNeed = 60,
    carryMax = 500,
    srcType = 2,
    srcID = 11005,
    rate = 1,
    pos = [{247,197},{244,188},{177,201},{200,242},{160,219},{136,185},{160,155},{244,250},{220,156},{150,182}],
    reward = [{12,5}]
    };
getRow(3)->
    #guildsnowmanCfg {
    id = 3,
    name = "煤球儿",
    icon = 4017,
    snowmanNeed = 30,
    carryMax = 100,
    srcType = 2,
    srcID = 11006,
    rate = 1,
    pos = [{162,266},{173,264},{172,252},{180,245},{187,237},{198,234},{210,237},{218,242},{226,247}],
    reward = [{12,5}]
    };
getRow(4)->
    #guildsnowmanCfg {
    id = 4,
    name = "胡萝卜",
    icon = 4016,
    snowmanNeed = 60,
    carryMax = 500,
    srcType = 1,
    srcID = 3451,
    rate = 1,
    pos = [{255,195},{262,197},{257,218}],
    reward = [{12,5}]
    };
getRow(5)->
    #guildsnowmanCfg {
    id = 5,
    name = "圣诞帽",
    icon = 4018,
    snowmanNeed = 30,
    carryMax = 500,
    srcType = 2,
    srcID = 11007,
    rate = 1,
    pos = [{269,185},{269,205},{237,257},{218,260},{112,180}],
    reward = [{12,5}]
    };
getRow(6)->
    #guildsnowmanCfg {
    id = 6,
    name = "树枝",
    icon = 4019,
    snowmanNeed = 120,
    carryMax = 500,
    srcType = 1,
    srcID = 3450,
    rate = 1,
    pos = [{139,161},{132,165},{127,174},{135,175},{136,165},{145,176}],
    reward = [{12,5}]
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

