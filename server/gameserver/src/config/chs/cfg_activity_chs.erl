%% coding: latin-1
%%: 实现
-module(cfg_activity_chs).
-compile(export_all).
-include("cfg_activity.hrl").
-include("logger.hrl").

getRow(1)->
    #activityCfg {
    id = 1,
    name = "混沌战场",
    type = 0,
    cycletype = 0,
    cycletime = 0,
    starttime = [{0,21}],
    lenghtime = 3550,
    stage = [10],
    mapidlist = [4000],
    condition = 0,
    awardlist = 0
    };
getRow(2)->
    #activityCfg {
    id = 2,
    name = "守卫碧空城",
    type = 0,
    cycletype = 0,
    cycletime = 0,
    starttime = [{1,19},{2,19},{3,19},{4,19},{5,19}],
    lenghtime = 9000,
    stage = [10,1190,600],
    mapidlist = [20],
    condition = 0,
    awardlist = 0
    };
getRow(3)->
    #activityCfg {
    id = 3,
    name = "首领入侵",
    type = 0,
    cycletype = 2,
    cycletime = 0,
    starttime = [{0,1800}],
    lenghtime = 43200,
    stage = [60,43020,120],
    mapidlist = [22],
    condition = 0,
    awardlist = 0
    };
getRow(4)->
    #activityCfg {
    id = 4,
    name = "军团战",
    type = 0,
    cycletype = 0,
    cycletime = 0,
    starttime = [{1,10},{3,10},{5,10},{6,10},{7,10}],
    lenghtime = 37800,
    stage = [34200,1800,1800],
    mapidlist = [8002],
    condition = 0,
    awardlist = 0
    };
getRow(5)->
    #activityCfg {
    id = 5,
    name = "世界守护",
    type = 0,
    cycletype = 2,
    cycletime = 0,
    starttime = [{0,10}],
    lenghtime = 40000,
    stage = [200,150,100,50,1200,60],
    mapidlist = [8001],
    condition = 0,
    awardlist = 0
    };
getRow(6)->
    #activityCfg {
    id = 6,
    name = "幸运选择题",
    type = 0,
    cycletype = 0,
    cycletime = 0,
    starttime = [{0,12},{0,16},{0,19},{0,22}],
    lenghtime = 2100,
    stage = [1500,300,300],
    mapidlist = [0],
    condition = 0,
    awardlist = 0
    };
getRow(7)->
    #activityCfg {
    id = 7,
    name = "荒野护送",
    type = 0,
    cycletype = 0,
    cycletime = 0,
    starttime = [{0,11},{0,22}],
    lenghtime = 7201,
    stage = [1],
    mapidlist = [6001],
    condition = 0,
    awardlist = 0
    };
getRow(8)->
    #activityCfg {
    id = 8,
    name = "深红熔渊",
    type = 0,
    cycletype = 2,
    cycletime = 0,
    starttime = [{0,12}],
    lenghtime = 50400,
    stage = [0],
    mapidlist = [501,502,503,504,505],
    condition = 0,
    awardlist = 0
    };
getRow(9)->
    #activityCfg {
    id = 9,
    name = "骑宠领地争夺",
    type = 0,
    cycletype = 2,
    cycletime = 0,
    starttime = [{0,10}],
    lenghtime = 43230,
    stage = [0],
    mapidlist = [0],
    condition = 0,
    awardlist = 0
    };
getRow(10)->
    #activityCfg {
    id = 10,
    name = "巅峰对决",
    type = 0,
    cycletype = 0,
    cycletime = 0,
    starttime = [{3,19}],
    lenghtime = 5700,
    stage = [3300,300,900,300],
    mapidlist = [4010],
    condition = 0,
    awardlist = 0
    };
getRow(11)->
    #activityCfg {
    id = 11,
    name = "跨服战场",
    type = 1,
    cycletype = 0,
    cycletime = 0,
    starttime = [{1,21},{3,21},{5,21},{7,21}],
    lenghtime = 1800,
    stage = [1],
    mapidlist = [6016],
    condition = 0,
    awardlist = 0
    };
getRow(12)->
    #activityCfg {
    id = 12,
    name = "血腥角斗",
    type = 1,
    cycletype = 0,
    cycletime = 0,
    starttime = [{0,12}],
    lenghtime = 21600,
    stage = [1],
    mapidlist = [6018,6019,6020],
    condition = 0,
    awardlist = 0
    };
getRow(13)->
    #activityCfg {
    id = 13,
    name = "列王纷争",
    type = 0,
    cycletype = 0,
    cycletime = 0,
    starttime = [{2,20},{6,20}],
    lenghtime = 1810,
    stage = [1800,10],
    mapidlist = [6030,6031,6032,6033,6034,6035],
    condition = 0,
    awardlist = 0
    };
getRow(14)->
    #activityCfg {
    id = 14,
    name = "约会地下城",
    type = 0,
    cycletype = 6,
    cycletime = 0,
    starttime = [0],
    lenghtime = 86400,
    stage = [0],
    mapidlist = [540,541],
    condition = 0,
    awardlist = 0
    };
getRow(15)->
    #activityCfg {
    id = 15,
    name = "乱世为王",
    type = 0,
    cycletype = 6,
    cycletime = 0,
    starttime = [{0,20}],
    lenghtime = 1800,
    stage = [0],
    mapidlist = [8000],
    condition = 0,
    awardlist = 0
    };
getRow(16)->
    #activityCfg {
    id = 16,
    name = "港口竞速",
    type = 0,
    cycletype = 2,
    cycletime = 0,
    starttime = [{0,8}],
    lenghtime = 1800,
    stage = [0],
    mapidlist = [9001],
    condition = 0,
    awardlist = 0
    };
getRow(17)->
    #activityCfg {
    id = 17,
    name = "惊天喵盗团",
    type = 0,
    cycletype = 6,
    cycletime = 0,
    starttime = [{0,0}],
    lenghtime = 86400,
    stage = [0],
    mapidlist = [520],
    condition = 0,
    awardlist = 0
    };
getRow(18)->
    #activityCfg {
    id = 18,
    name = "元素保卫战",
    type = 0,
    cycletype = 6,
    cycletime = 0,
    starttime = [{0,0}],
    lenghtime = 86400,
    stage = [0],
    mapidlist = [528,529,530,531],
    condition = 0,
    awardlist = 0
    };
getRow(19)->
    #activityCfg {
    id = 19,
    name = "家族雪人",
    type = 0,
    cycletype = 2,
    cycletime = 0,
    starttime = [{0,12}],
    lenghtime = 3732,
    stage = [1800,10,1800,2,120],
    mapidlist = [7000],
    condition = 0,
    awardlist = 0
    };
getRow(20)->
    #activityCfg {
    id = 20,
    name = "混沌灵界",
    type = 0,
    cycletype = 6,
    cycletime = 0,
    starttime = [{0,0}],
    lenghtime = 86400,
    stage = [0],
    mapidlist = [550],
    condition = 0,
    awardlist = 0
    };
getRow(21)->
    #activityCfg {
    id = 21,
    name = "骑宠领地战斗",
    type = 0,
    cycletype = 6,
    cycletime = 0,
    starttime = [{0,0}],
    lenghtime = 86400,
    stage = [0],
    mapidlist = [6000],
    condition = 0,
    awardlist = 0
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
    {9},
    {10},
    {11},
    {12},
    {13},
    {14},
    {15},
    {16},
    {17},
    {18},
    {19},
    {20},
    {21}
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
    19,
    20,
    21
    ].

