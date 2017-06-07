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
    monster1 = [{1200,1,0.2,79.5,94},{1201,1,0.2,79.5,94},{1202,1,0.2,79.5,94},{1203,1,0.2,79.5,94},{1204,1,0.1,79.5,94},{1205,1,0.1,79.5,94}],
    monster2 = "[]",
    monster3 = "[]",
    reward = [{2600,30}]
    };
getRow(20,1)->
    #spiritAreaCfg {
    id = 2,
    level = 20,
    wave = 1,
    monster1 = [{1212,1,0.2,79.5,94},{1213,1,0.2,79.5,94},{1214,1,0.2,79.5,94},{1215,1,0.2,79.5,94},{1216,1,0.1,79.5,94},{1217,1,0.1,79.5,94}],
    monster2 = "[]",
    monster3 = "[]",
    reward = [{2600,40}]
    };
getRow(30,1)->
    #spiritAreaCfg {
    id = 3,
    level = 30,
    wave = 1,
    monster1 = [{1224,1,0.2,79.5,94},{1225,1,0.2,79.5,94},{1226,1,0.2,79.5,94},{1227,1,0.2,79.5,94},{1228,1,0.1,79.5,94},{1229,1,0.1,79.5,94}],
    monster2 = "[]",
    monster3 = "[]",
    reward = [{2600,70}]
    };
getRow(50,1)->
    #spiritAreaCfg {
    id = 4,
    level = 50,
    wave = 1,
    monster1 = [{1236,1,0.2,79.5,94},{1237,1,0.2,79.5,94},{1238,1,0.2,79.5,94},{1239,1,0.2,79.5,94},{1240,1,0.1,79.5,94},{1241,1,0.1,79.5,94}],
    monster2 = "[]",
    monster3 = "[]",
    reward = [{2600,90}]
    };
getRow(51,1)->
    #spiritAreaCfg {
    id = 5,
    level = 51,
    wave = 1,
    monster1 = [{1248,1,0.2,79.5,94},{1249,1,0.2,79.5,94},{1250,1,0.2,79.5,94},{1251,1,0.2,79.5,94},{1252,1,0.1,79.5,94},{1253,1,0.1,79.5,94}],
    monster2 = "[]",
    monster3 = "[]",
    reward = [{2600,90}]
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

