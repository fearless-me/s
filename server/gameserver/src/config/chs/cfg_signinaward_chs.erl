%% coding: latin-1
%%: 实现
-module(cfg_signinaward_chs).
-compile(export_all).
-include("cfg_signinaward.hrl").
-include("logger.hrl").

getRow(0,604)->
    #signinawardCfg {
    id = 1,
    signtype = 0,
    itemid = 604,
    itemnum = 1,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(0,902)->
    #signinawardCfg {
    id = 2,
    signtype = 0,
    itemid = 902,
    itemnum = 2,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(0,1111)->
    #signinawardCfg {
    id = 3,
    signtype = 0,
    itemid = 1111,
    itemnum = 1,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(1,222)->
    #signinawardCfg {
    id = 5,
    signtype = 1,
    itemid = 222,
    itemnum = 20,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(1,615)->
    #signinawardCfg {
    id = 9,
    signtype = 1,
    itemid = 615,
    itemnum = 1,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(1,904)->
    #signinawardCfg {
    id = 7,
    signtype = 1,
    itemid = 904,
    itemnum = 1,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(1,2160)->
    #signinawardCfg {
    id = 8,
    signtype = 1,
    itemid = 2160,
    itemnum = 15,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(2,1835)->
    #signinawardCfg {
    id = 10,
    signtype = 2,
    itemid = 1835,
    itemnum = 1,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(2,2161)->
    #signinawardCfg {
    id = 12,
    signtype = 2,
    itemid = 2161,
    itemnum = 15,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(2,2600)->
    #signinawardCfg {
    id = 13,
    signtype = 2,
    itemid = 2600,
    itemnum = 50,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(2,4303)->
    #signinawardCfg {
    id = 11,
    signtype = 2,
    itemid = 4303,
    itemnum = 50,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(3,20)->
    #signinawardCfg {
    id = 17,
    signtype = 3,
    itemid = 20,
    itemnum = 200,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(3,225)->
    #signinawardCfg {
    id = 15,
    signtype = 3,
    itemid = 225,
    itemnum = 60,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(3,904)->
    #signinawardCfg {
    id = 14,
    signtype = 3,
    itemid = 904,
    itemnum = 2,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(3,2502)->
    #signinawardCfg {
    id = 16,
    signtype = 3,
    itemid = 2502,
    itemnum = 1,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(4,20)->
    #signinawardCfg {
    id = 21,
    signtype = 4,
    itemid = 20,
    itemnum = 200,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(4,271)->
    #signinawardCfg {
    id = 18,
    signtype = 4,
    itemid = 271,
    itemnum = 2,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(4,2161)->
    #signinawardCfg {
    id = 19,
    signtype = 4,
    itemid = 2161,
    itemnum = 20,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(4,2600)->
    #signinawardCfg {
    id = 20,
    signtype = 4,
    itemid = 2600,
    itemnum = 100,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(5,20)->
    #signinawardCfg {
    id = 25,
    signtype = 5,
    itemid = 20,
    itemnum = 200,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(5,222)->
    #signinawardCfg {
    id = 22,
    signtype = 5,
    itemid = 222,
    itemnum = 100,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(5,271)->
    #signinawardCfg {
    id = 23,
    signtype = 5,
    itemid = 271,
    itemnum = 2,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(5,4304)->
    #signinawardCfg {
    id = 24,
    signtype = 5,
    itemid = 4304,
    itemnum = 50,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(6,20)->
    #signinawardCfg {
    id = 29,
    signtype = 6,
    itemid = 20,
    itemnum = 300,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(6,225)->
    #signinawardCfg {
    id = 26,
    signtype = 6,
    itemid = 225,
    itemnum = 100,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(6,615)->
    #signinawardCfg {
    id = 28,
    signtype = 6,
    itemid = 615,
    itemnum = 5,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(6,1113)->
    #signinawardCfg {
    id = 27,
    signtype = 6,
    itemid = 1113,
    itemnum = 2,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(7,904)->
    #signinawardCfg {
    id = 30,
    signtype = 7,
    itemid = 904,
    itemnum = 3,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(7,2162)->
    #signinawardCfg {
    id = 32,
    signtype = 7,
    itemid = 2162,
    itemnum = 30,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(7,2600)->
    #signinawardCfg {
    id = 33,
    signtype = 7,
    itemid = 2600,
    itemnum = 200,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(7,4305)->
    #signinawardCfg {
    id = 31,
    signtype = 7,
    itemid = 4305,
    itemnum = 20,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(8,616)->
    #signinawardCfg {
    id = 41,
    signtype = 8,
    itemid = 616,
    itemnum = 1,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(8,904)->
    #signinawardCfg {
    id = 42,
    signtype = 8,
    itemid = 904,
    itemnum = 1,
    angle = 0,
    size = 0,
    posOffset = 0
    };
getRow(_,_)->[].

getKeyList()->[
    {0,604},
    {0,902},
    {0,1111},
    {1,222},
    {1,615},
    {1,904},
    {1,2160},
    {2,1835},
    {2,2161},
    {2,2600},
    {2,4303},
    {3,20},
    {3,225},
    {3,904},
    {3,2502},
    {4,20},
    {4,271},
    {4,2161},
    {4,2600},
    {5,20},
    {5,222},
    {5,271},
    {5,4304},
    {6,20},
    {6,225},
    {6,615},
    {6,1113},
    {7,904},
    {7,2162},
    {7,2600},
    {7,4305},
    {8,616},
    {8,904}
    ].

get1KeyList()->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8
    ].

get2KeyList(0)->[
    604,
    902,
    1111
    ];
get2KeyList(1)->[
    222,
    615,
    904,
    2160
    ];
get2KeyList(2)->[
    1835,
    2161,
    2600,
    4303
    ];
get2KeyList(3)->[
    20,
    225,
    904,
    2502
    ];
get2KeyList(4)->[
    20,
    271,
    2161,
    2600
    ];
get2KeyList(5)->[
    20,
    222,
    271,
    4304
    ];
get2KeyList(6)->[
    20,
    225,
    615,
    1113
    ];
get2KeyList(7)->[
    904,
    2162,
    2600,
    4305
    ];
get2KeyList(8)->[
    616,
    904
    ];
get2KeyList(_)->[].

