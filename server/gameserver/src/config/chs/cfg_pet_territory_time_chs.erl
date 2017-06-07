%% coding: latin-1
%%: 实现
-module(cfg_pet_territory_time_chs).
-compile(export_all).
-include("cfg_pet_territory_time.hrl").
-include("logger.hrl").

getRow(3,1)->
    #pet_territory_timeCfg {
    time = 3,
    level = 1,
    rate = 1.1,
    text = "普通级",
    coinUseType = 100,
    coinUseCount = 3000
    };
getRow(3,2)->
    #pet_territory_timeCfg {
    time = 3,
    level = 2,
    rate = 1.43,
    text = "黄金级",
    coinUseType = 103,
    coinUseCount = 35
    };
getRow(6,1)->
    #pet_territory_timeCfg {
    time = 6,
    level = 1,
    rate = 0.85,
    text = "普通级",
    coinUseType = 100,
    coinUseCount = 5500
    };
getRow(6,2)->
    #pet_territory_timeCfg {
    time = 6,
    level = 2,
    rate = 1.105,
    text = "黄金级",
    coinUseType = 103,
    coinUseCount = 55
    };
getRow(12,1)->
    #pet_territory_timeCfg {
    time = 12,
    level = 1,
    rate = 0.65,
    text = "普通级",
    coinUseType = 100,
    coinUseCount = 10000
    };
getRow(12,2)->
    #pet_territory_timeCfg {
    time = 12,
    level = 2,
    rate = 0.806,
    text = "黄金级",
    coinUseType = 103,
    coinUseCount = 100
    };
getRow(_,_)->[].

getKeyList()->[
    {3,1},
    {3,2},
    {6,1},
    {6,2},
    {12,1},
    {12,2}
    ].

get1KeyList()->[
    3,
    6,
    12
    ].

get2KeyList(3)->[
    1,
    2
    ];
get2KeyList(6)->[
    1,
    2
    ];
get2KeyList(12)->[
    1,
    2
    ];
get2KeyList(_)->[].

