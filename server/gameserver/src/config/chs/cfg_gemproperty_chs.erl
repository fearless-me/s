%% coding: latin-1
%%: 实现
-module(cfg_gemproperty_chs).
-compile(export_all).
-include("cfg_gemproperty.hrl").
-include("logger.hrl").

getRow(1,1)->
    #gempropertyCfg {
    color = 1,
    level = 1,
    pro = [{136,107,0},{144,44,0}],
    cost = [{1,1000}]
    };
getRow(1,2)->
    #gempropertyCfg {
    color = 1,
    level = 2,
    pro = [{136,428,0},{144,176,0}],
    cost = [{1,1000}]
    };
getRow(1,3)->
    #gempropertyCfg {
    color = 1,
    level = 3,
    pro = [{136,1712,0},{144,704,0}],
    cost = [{1,1000}]
    };
getRow(1,4)->
    #gempropertyCfg {
    color = 1,
    level = 4,
    pro = [{136,6848,0},{144,2816,0}],
    cost = [{1,1000}]
    };
getRow(1,5)->
    #gempropertyCfg {
    color = 1,
    level = 5,
    pro = [{136,148100,0},{144,62100,0}],
    cost = [{1,1000}]
    };
getRow(1,6)->
    #gempropertyCfg {
    color = 1,
    level = 6,
    pro = [{136,1713,0},{144,718,0}],
    cost = [{1,1000}]
    };
getRow(1,7)->
    #gempropertyCfg {
    color = 1,
    level = 7,
    pro = [{136,1713,0},{144,718,0}],
    cost = [{1,1000}]
    };
getRow(1,8)->
    #gempropertyCfg {
    color = 1,
    level = 8,
    pro = [{136,1713,0},{144,718,0}],
    cost = [{1,1000}]
    };
getRow(1,9)->
    #gempropertyCfg {
    color = 1,
    level = 9,
    pro = [{136,1713,0},{144,718,0}]
    };
getRow(2,1)->
    #gempropertyCfg {
    color = 2,
    level = 1,
    pro = [{138,107,0},{139,107,0},{145,64,0}],
    cost = [{1,1000}]
    };
getRow(2,2)->
    #gempropertyCfg {
    color = 2,
    level = 2,
    pro = [{138,428,0},{139,428,0},{145,256,0}],
    cost = [{1,1000}]
    };
getRow(2,3)->
    #gempropertyCfg {
    color = 2,
    level = 3,
    pro = [{138,1712,0},{139,1712,0},{145,1024,0}],
    cost = [{1,1000}]
    };
getRow(2,4)->
    #gempropertyCfg {
    color = 2,
    level = 4,
    pro = [{138,6848,0},{139,6848,0},{145,4096,0}],
    cost = [{1,1000}]
    };
getRow(2,5)->
    #gempropertyCfg {
    color = 2,
    level = 5,
    pro = [{138,148100,0},{139,148100,0},{145,88800,0}],
    cost = [{1,1000}]
    };
getRow(2,6)->
    #gempropertyCfg {
    color = 2,
    level = 6,
    pro = [{138,1713,0},{139,1713,0},{145,1028,0}],
    cost = [{1,1000}]
    };
getRow(2,7)->
    #gempropertyCfg {
    color = 2,
    level = 7,
    pro = [{138,1713,0},{139,1713,0},{145,1028,0}],
    cost = [{1,1000}]
    };
getRow(2,8)->
    #gempropertyCfg {
    color = 2,
    level = 8,
    pro = [{138,1713,0},{139,1713,0},{145,1028,0}],
    cost = [{1,1000}]
    };
getRow(2,9)->
    #gempropertyCfg {
    color = 2,
    level = 9,
    pro = [{138,1713,0},{139,1713,0},{145,1028,0}]
    };
getRow(3,1)->
    #gempropertyCfg {
    color = 3,
    level = 1,
    pro = [{135,1070,0},{146,42,0},{160,30,0}],
    cost = [{1,1000}]
    };
getRow(3,2)->
    #gempropertyCfg {
    color = 3,
    level = 2,
    pro = [{135,4280,0},{146,168,0},{160,120,0}],
    cost = [{1,1000}]
    };
getRow(3,3)->
    #gempropertyCfg {
    color = 3,
    level = 3,
    pro = [{135,17120,0},{146,672,0},{160,480,0}],
    cost = [{1,1000}]
    };
getRow(3,4)->
    #gempropertyCfg {
    color = 3,
    level = 4,
    pro = [{135,68480,0},{146,2688,0},{160,1920,0}],
    cost = [{1,1000}]
    };
getRow(3,5)->
    #gempropertyCfg {
    color = 3,
    level = 5,
    pro = [{135,1481000,0},{146,59200,0},{160,41600,0}],
    cost = [{1,1000}]
    };
getRow(3,6)->
    #gempropertyCfg {
    color = 3,
    level = 6,
    pro = [{135,17133,0},{146,685,0},{160,482,0}],
    cost = [{1,1000}]
    };
getRow(3,7)->
    #gempropertyCfg {
    color = 3,
    level = 7,
    pro = [{135,17133,0},{146,685,0},{160,482,0}],
    cost = [{1,1000}]
    };
getRow(3,8)->
    #gempropertyCfg {
    color = 3,
    level = 8,
    pro = [{135,17133,0},{146,685,0},{160,482,0}],
    cost = [{1,1000}]
    };
getRow(3,9)->
    #gempropertyCfg {
    color = 3,
    level = 9,
    pro = [{135,17133,0},{146,685,0},{160,482,0}]
    };
getRow(_,_)->[].

getKeyList()->[
    {1,1},
    {1,2},
    {1,3},
    {1,4},
    {1,5},
    {1,6},
    {1,7},
    {1,8},
    {1,9},
    {2,1},
    {2,2},
    {2,3},
    {2,4},
    {2,5},
    {2,6},
    {2,7},
    {2,8},
    {2,9},
    {3,1},
    {3,2},
    {3,3},
    {3,4},
    {3,5},
    {3,6},
    {3,7},
    {3,8},
    {3,9}
    ].

get1KeyList()->[
    1,
    2,
    3
    ].

get2KeyList(1)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(2)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(3)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(_)->[].

