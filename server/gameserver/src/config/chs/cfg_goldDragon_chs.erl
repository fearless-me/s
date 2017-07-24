%% coding: latin-1
%%: 实现
-module(cfg_goldDragon_chs).
-compile(export_all).
-include("cfg_goldDragon.hrl").
-include("logger.hrl").

getRow(24,1)->
    #goldDragonCfg {
    level = 24,
    turn = 1,
    monster = [{771,3,3},{772,3,3},{773,2,2},{774,1,1}]
    };
getRow(24,2)->
    #goldDragonCfg {
    level = 24,
    turn = 2,
    monster = [{775,3,3},{776,3,3},{777,2,2},{778,1,1}]
    };
getRow(24,3)->
    #goldDragonCfg {
    level = 24,
    turn = 3,
    monster = [{779,3,3},{780,3,3},{781,2,2},{782,1,1}]
    };
getRow(24,4)->
    #goldDragonCfg {
    level = 24,
    turn = 4,
    monster = [{783,3,3},{784,3,3},{785,2,2},{786,1,1}]
    };
getRow(30,1)->
    #goldDragonCfg {
    level = 30,
    turn = 1,
    monster = [{795,3,3},{796,3,3},{797,2,2},{798,1,1}]
    };
getRow(30,2)->
    #goldDragonCfg {
    level = 30,
    turn = 2,
    monster = [{799,3,3},{800,3,3},{801,2,2},{802,1,1}]
    };
getRow(30,3)->
    #goldDragonCfg {
    level = 30,
    turn = 3,
    monster = [{803,3,3},{804,3,3},{805,2,2},{806,1,1}]
    };
getRow(30,4)->
    #goldDragonCfg {
    level = 30,
    turn = 4,
    monster = [{807,3,3},{808,3,3},{809,2,2},{810,1,1}]
    };
getRow(35,1)->
    #goldDragonCfg {
    level = 35,
    turn = 1,
    monster = [{819,3,3},{820,3,3},{821,2,2},{822,1,1}]
    };
getRow(35,2)->
    #goldDragonCfg {
    level = 35,
    turn = 2,
    monster = [{823,3,3},{824,3,3},{825,2,2},{826,1,1}]
    };
getRow(35,3)->
    #goldDragonCfg {
    level = 35,
    turn = 3,
    monster = [{827,3,3},{828,3,3},{829,2,2},{830,1,1}]
    };
getRow(35,4)->
    #goldDragonCfg {
    level = 35,
    turn = 4,
    monster = [{831,3,3},{832,3,3},{833,2,2},{834,1,1}]
    };
getRow(40,1)->
    #goldDragonCfg {
    level = 40,
    turn = 1,
    monster = [{843,3,3},{844,3,3},{845,2,2},{846,1,1}]
    };
getRow(40,2)->
    #goldDragonCfg {
    level = 40,
    turn = 2,
    monster = [{847,3,3},{848,3,3},{849,2,2},{850,1,1}]
    };
getRow(40,3)->
    #goldDragonCfg {
    level = 40,
    turn = 3,
    monster = [{851,3,3},{852,3,3},{853,2,2},{854,1,1}]
    };
getRow(40,4)->
    #goldDragonCfg {
    level = 40,
    turn = 4,
    monster = [{855,3,3},{856,3,3},{857,2,2},{858,1,1}]
    };
getRow(45,1)->
    #goldDragonCfg {
    level = 45,
    turn = 1,
    monster = [{867,3,3},{868,3,3},{869,2,2},{870,1,1}]
    };
getRow(45,2)->
    #goldDragonCfg {
    level = 45,
    turn = 2,
    monster = [{871,3,3},{872,3,3},{873,2,2},{874,1,1}]
    };
getRow(45,3)->
    #goldDragonCfg {
    level = 45,
    turn = 3,
    monster = [{875,3,3},{876,3,3},{877,2,2},{878,1,1}]
    };
getRow(45,4)->
    #goldDragonCfg {
    level = 45,
    turn = 4,
    monster = [{879,3,3},{880,3,3},{881,2,2},{882,1,1}]
    };
getRow(51,1)->
    #goldDragonCfg {
    level = 51,
    turn = 1,
    monster = [{891,3,3},{892,3,3},{893,2,2},{894,1,1}]
    };
getRow(51,2)->
    #goldDragonCfg {
    level = 51,
    turn = 2,
    monster = [{895,3,3},{896,3,3},{897,2,2},{898,1,1}]
    };
getRow(51,3)->
    #goldDragonCfg {
    level = 51,
    turn = 3,
    monster = [{899,3,3},{900,3,3},{901,2,2},{902,1,1}]
    };
getRow(51,4)->
    #goldDragonCfg {
    level = 51,
    turn = 4,
    monster = [{903,3,3},{904,3,3},{905,2,2},{906,1,1}]
    };
getRow(_,_)->[].

getKeyList()->[
    {24,1},
    {24,2},
    {24,3},
    {24,4},
    {30,1},
    {30,2},
    {30,3},
    {30,4},
    {35,1},
    {35,2},
    {35,3},
    {35,4},
    {40,1},
    {40,2},
    {40,3},
    {40,4},
    {45,1},
    {45,2},
    {45,3},
    {45,4},
    {51,1},
    {51,2},
    {51,3},
    {51,4}
    ].

get1KeyList()->[
    24,
    30,
    35,
    40,
    45,
    51
    ].

get2KeyList(24)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(30)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(35)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(40)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(45)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(51)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(_)->[].

