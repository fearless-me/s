%% coding: latin-1
%%: 实现
-module(cfg_task_other_chs).
-compile(export_all).
-include("cfg_task_other.hrl").
-include("logger.hrl").

getRow(1,3)->
    #task_otherCfg {
    type = 1,
    id = 3,
    level = 40,
    loop = 1,
    taskid = [10007]
    };
getRow(1,5)->
    #task_otherCfg {
    type = 1,
    id = 5,
    level = 40,
    loop = 0,
    taskid = [10008]
    };
getRow(1,8)->
    #task_otherCfg {
    type = 1,
    id = 8,
    level = 38,
    loop = 1,
    taskid = [10006]
    };
getRow(1,19)->
    #task_otherCfg {
    type = 1,
    id = 19,
    level = 24,
    loop = 0,
    taskid = [10009]
    };
getRow(2,6)->
    #task_otherCfg {
    type = 2,
    id = 6,
    level = 6,
    loop = 0,
    taskid = [11005]
    };
getRow(2,7)->
    #task_otherCfg {
    type = 2,
    id = 7,
    level = 7,
    loop = 0,
    taskid = [11000]
    };
getRow(2,8)->
    #task_otherCfg {
    type = 2,
    id = 8,
    level = 8,
    loop = 0,
    taskid = [11009]
    };
getRow(2,11)->
    #task_otherCfg {
    type = 2,
    id = 11,
    level = 11,
    loop = 0,
    taskid = [10004]
    };
getRow(2,16)->
    #task_otherCfg {
    type = 2,
    id = 16,
    level = 16,
    loop = 0,
    taskid = [10014]
    };
getRow(2,18)->
    #task_otherCfg {
    type = 2,
    id = 18,
    level = 18,
    loop = 0,
    taskid = [10000]
    };
getRow(2,20)->
    #task_otherCfg {
    type = 2,
    id = 20,
    level = 20,
    loop = 0,
    taskid = [10010]
    };
getRow(2,21)->
    #task_otherCfg {
    type = 2,
    id = 21,
    level = 21,
    loop = 0,
    taskid = [10011]
    };
getRow(2,22)->
    #task_otherCfg {
    type = 2,
    id = 22,
    level = 22,
    loop = 0,
    taskid = [10012]
    };
getRow(2,23)->
    #task_otherCfg {
    type = 2,
    id = 23,
    level = 23,
    loop = 0,
    taskid = [10001]
    };
getRow(2,24)->
    #task_otherCfg {
    type = 2,
    id = 24,
    level = 24,
    loop = 0,
    taskid = [11008]
    };
getRow(2,25)->
    #task_otherCfg {
    type = 2,
    id = 25,
    level = 25,
    loop = 0,
    taskid = [10005]
    };
getRow(2,30)->
    #task_otherCfg {
    type = 2,
    id = 30,
    level = 30,
    loop = 0,
    taskid = [10002]
    };
getRow(2,32)->
    #task_otherCfg {
    type = 2,
    id = 32,
    level = 32,
    loop = 0,
    taskid = [10003]
    };
getRow(2,33)->
    #task_otherCfg {
    type = 2,
    id = 33,
    level = 33,
    loop = 0,
    taskid = [11004]
    };
getRow(2,34)->
    #task_otherCfg {
    type = 2,
    id = 34,
    level = 34,
    loop = 0,
    taskid = [10013]
    };
getRow(_,_)->[].

getKeyList()->[
    {1,3},
    {1,5},
    {1,8},
    {1,19},
    {2,6},
    {2,7},
    {2,8},
    {2,11},
    {2,16},
    {2,18},
    {2,20},
    {2,21},
    {2,22},
    {2,23},
    {2,24},
    {2,25},
    {2,30},
    {2,32},
    {2,33},
    {2,34}
    ].

get1KeyList()->[
    1,
    2
    ].

get2KeyList(1)->[
    3,
    5,
    8,
    19
    ];
get2KeyList(2)->[
    6,
    7,
    8,
    11,
    16,
    18,
    20,
    21,
    22,
    23,
    24,
    25,
    30,
    32,
    33,
    34
    ];
get2KeyList(_)->[].

