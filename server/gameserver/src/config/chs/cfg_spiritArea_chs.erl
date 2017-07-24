%% coding: latin-1
%%: 实现
-module(cfg_spiritArea_chs).
-compile(export_all).
-include("cfg_spiritArea.hrl").
-include("logger.hrl").

getRow(11,1)->
    #spiritAreaCfg {
    id = 1,
    level = 11,
    wave = 1,
    monster1 = [],
    monster2 = [],
    monster3 = [],
    reward = []
    };
getRow(20,1)->
    #spiritAreaCfg {
    id = 2,
    level = 20,
    wave = 1,
    monster1 = [],
    monster2 = [],
    monster3 = [],
    reward = []
    };
getRow(30,1)->
    #spiritAreaCfg {
    id = 3,
    level = 30,
    wave = 1,
    monster1 = [],
    monster2 = [],
    monster3 = [],
    reward = []
    };
getRow(50,1)->
    #spiritAreaCfg {
    id = 4,
    level = 50,
    wave = 1,
    monster1 = [],
    monster2 = [],
    monster3 = [],
    reward = []
    };
getRow(51,1)->
    #spiritAreaCfg {
    id = 5,
    level = 51,
    wave = 1,
    monster1 = [],
    monster2 = [],
    monster3 = [],
    reward = []
    };
getRow(_,_)->[].

getKeyList()->[
    {11,1},
    {20,1},
    {30,1},
    {50,1},
    {51,1}
    ].

get1KeyList()->[
    11,
    20,
    30,
    50,
    51
    ].

get2KeyList(11)->[
    1
    ];
get2KeyList(20)->[
    1
    ];
get2KeyList(30)->[
    1
    ];
get2KeyList(50)->[
    1
    ];
get2KeyList(51)->[
    1
    ];
get2KeyList(_)->[].

