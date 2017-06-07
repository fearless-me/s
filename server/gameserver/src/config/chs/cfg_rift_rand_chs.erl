%% coding: latin-1
%%: 实现
-module(cfg_rift_rand_chs).
-compile(export_all).
-include("cfg_rift_rand.hrl").
-include("logger.hrl").

getRow(8,347)->
    #rift_randCfg {
    mapid = 8,
    npcid = 347,
    mapsetting_id = [1240,1240,1240,1240,1260]
    };
getRow(9,348)->
    #rift_randCfg {
    mapid = 9,
    npcid = 348,
    mapsetting_id = [1241,1241,1241,1241,1261]
    };
getRow(10,349)->
    #rift_randCfg {
    mapid = 10,
    npcid = 349,
    mapsetting_id = [1242,1242,1242,1242,1262]
    };
getRow(11,350)->
    #rift_randCfg {
    mapid = 11,
    npcid = 350,
    mapsetting_id = [1243,1243,1243,1243,1263]
    };
getRow(12,350)->
    #rift_randCfg {
    mapid = 12,
    npcid = 350,
    mapsetting_id = [1244,1244,1244,1244,1264]
    };
getRow(13,350)->
    #rift_randCfg {
    mapid = 13,
    npcid = 350,
    mapsetting_id = [1245,1245,1245,1245,1265]
    };
getRow(14,350)->
    #rift_randCfg {
    mapid = 14,
    npcid = 350,
    mapsetting_id = [1246,1246,1246,1246,1266]
    };
getRow(15,350)->
    #rift_randCfg {
    mapid = 15,
    npcid = 350,
    mapsetting_id = [1247,1247,1247,1247,1267]
    };
getRow(16,354)->
    #rift_randCfg {
    mapid = 16,
    npcid = 354,
    mapsetting_id = [1248,1248,1248,1248,1268]
    };
getRow(17,354)->
    #rift_randCfg {
    mapid = 17,
    npcid = 354,
    mapsetting_id = [1249,1249,1249,1249,1269]
    };
getRow(18,354)->
    #rift_randCfg {
    mapid = 18,
    npcid = 354,
    mapsetting_id = [1250,1250,1250,1250,1270]
    };
getRow(19,354)->
    #rift_randCfg {
    mapid = 19,
    npcid = 354,
    mapsetting_id = [1251,1251,1251,1251,1271]
    };
getRow(_,_)->[].

getKeyList()->[
    {8,347},
    {9,348},
    {10,349},
    {11,350},
    {12,350},
    {13,350},
    {14,350},
    {15,350},
    {16,354},
    {17,354},
    {18,354},
    {19,354}
    ].

get1KeyList()->[
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19
    ].

get2KeyList(8)->[
    347
    ];
get2KeyList(9)->[
    348
    ];
get2KeyList(10)->[
    349
    ];
get2KeyList(11)->[
    350
    ];
get2KeyList(12)->[
    350
    ];
get2KeyList(13)->[
    350
    ];
get2KeyList(14)->[
    350
    ];
get2KeyList(15)->[
    350
    ];
get2KeyList(16)->[
    354
    ];
get2KeyList(17)->[
    354
    ];
get2KeyList(18)->[
    354
    ];
get2KeyList(19)->[
    354
    ];
get2KeyList(_)->[].

