%% coding: latin-1
%%: 实现
-module(cfg_wedding_fireworkshow_chs).
-compile(export_all).
-include("cfg_wedding_fireworkshow.hrl").
-include("logger.hrl").

getRow(1)->
    #wedding_fireworkshowCfg {
    iD = 1,
    name = "ef_marry8",
    x = 33.08905,
    y = 8.050508,
    z = 43.60884,
    show = 3
    };
getRow(2)->
    #wedding_fireworkshowCfg {
    iD = 2,
    name = "ef_marry8",
    x = 33.12506,
    y = 7.923383,
    z = 55.33643,
    show = 3
    };
getRow(3)->
    #wedding_fireworkshowCfg {
    iD = 3,
    name = "ef_marry14",
    x = 73.85163,
    y = 9.766903,
    z = 46.97501,
    show = 2
    };
getRow(4)->
    #wedding_fireworkshowCfg {
    iD = 4,
    name = "ef_marry14",
    x = 74.09289,
    y = 9.766903,
    z = 54.68383,
    show = 2
    };
getRow(5)->
    #wedding_fireworkshowCfg {
    iD = 5,
    name = "ef_marry6",
    x = 81.35648,
    y = 9.766903,
    z = 46.97484,
    show = 2
    };
getRow(6)->
    #wedding_fireworkshowCfg {
    iD = 6,
    name = "ef_marry6",
    x = 81.43188,
    y = 9.766903,
    z = 54.80416,
    show = 2
    };
getRow(7)->
    #wedding_fireworkshowCfg {
    iD = 7,
    name = "ef_marry13",
    x = 90.01842,
    y = 9.766903,
    z = 47.07864,
    show = 2
    };
getRow(8)->
    #wedding_fireworkshowCfg {
    iD = 8,
    name = "ef_marry13",
    x = 89.74866,
    y = 9.766903,
    z = 54.78431,
    show = 2
    };
getRow(11)->
    #wedding_fireworkshowCfg {
    iD = 11,
    name = "ef_marry14",
    x = 103.8391,
    y = 11.13019,
    z = 44.32122,
    show = 3
    };
getRow(12)->
    #wedding_fireworkshowCfg {
    iD = 12,
    name = "ef_marry14",
    x = 103.7694,
    y = 11.13019,
    z = 57.15972,
    show = 3
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7},
    {8},
    {11},
    {12}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    11,
    12
    ].

