%% coding: latin-1
%%: 实现
-module(cfg_wildboss_chs).
-compile(export_all).
-include("cfg_wildboss.hrl").
-include("logger.hrl").

getRow(1105)->
    #wildbossCfg {
    bossID = 1105,
    mapID = 5,
    pos = [193,299],
    rewardID = 310100,
    normal = 1502,
    lucky = 1501,
    refreshTime = 900,
    item = [222,225,271,7000],
    bust = 312,
    sequence = 1
    };
getRow(1106)->
    #wildbossCfg {
    bossID = 1106,
    mapID = 5,
    pos = [380,300],
    rewardID = 310103,
    normal = 1505,
    lucky = 1504,
    refreshTime = 1200,
    item = [222,225,271,7000],
    bust = 313,
    sequence = 2
    };
getRow(1107)->
    #wildbossCfg {
    bossID = 1107,
    mapID = 5,
    pos = [286,391],
    rewardID = 310106,
    normal = 1508,
    lucky = 1507,
    refreshTime = 1500,
    item = [222,225,271,7001],
    bust = 316,
    sequence = 3
    };
getRow(_)->[].

getKeyList()->[
    {1105},
    {1106},
    {1107}
    ].

get1KeyList()->[
    1105,
    1106,
    1107
    ].

