%% coding: latin-1
%%: 实现
-module(cfg_equipstar_chs).
-compile(export_all).
-include("cfg_equipstar.hrl").
-include("logger.hrl").

getRow(0)->
    #equipstarCfg {
    level = 0,
    desc = "白色0星",
    limit_level = 31,
    ratio = 0,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 1,
    cost_item = 225,
    cost_num = 1,
    cost_coin = 500,
    allbonus = [0]
    };
getRow(1)->
    #equipstarCfg {
    level = 1,
    desc = "白色1星",
    limit_level = 31,
    ratio = 0.13,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 1,
    cost_coin = 1000,
    allbonus = [{135,535,0},{136,53,0},{137,53,0},{138,53,0},{139,53,0}]
    };
getRow(2)->
    #equipstarCfg {
    level = 2,
    desc = "白色2星",
    limit_level = 31,
    ratio = 0.16,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    cost_coin = 1500,
    allbonus = [{135,770,0},{136,77,0},{137,77,0},{138,77,0},{139,77,0}]
    };
getRow(3)->
    #equipstarCfg {
    level = 3,
    desc = "白色3星",
    limit_level = 31,
    ratio = 0.19,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    cost_coin = 2000,
    allbonus = [{135,1249,0},{136,124,0},{137,124,0},{138,124,0},{139,124,0}]
    };
getRow(4)->
    #equipstarCfg {
    level = 4,
    desc = "白色4星",
    limit_level = 31,
    ratio = 0.22,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 2,
    cost_coin = 2500,
    allbonus = [{135,1902,0},{136,190,0},{137,190,0},{138,190,0},{139,190,0}]
    };
getRow(5)->
    #equipstarCfg {
    level = 5,
    desc = "白色5星",
    limit_level = 31,
    ratio = 0.25,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.9,
    cost_item = 225,
    cost_num = 3,
    cost_coin = 3000,
    allbonus = [{135,2701,0},{136,270,0},{137,270,0},{138,270,0},{139,270,0}]
    };
getRow(6)->
    #equipstarCfg {
    level = 6,
    desc = "[13E826]绿色1星[-]",
    limit_level = 31,
    ratio = 0.28,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.85,
    cost_item = 225,
    cost_num = 3,
    cost_coin = 3500,
    allbonus = [{135,3631,0},{136,363,0},{137,363,0},{138,363,0},{139,363,0}]
    };
getRow(7)->
    #equipstarCfg {
    level = 7,
    desc = "[13E826]绿色2星[-]",
    limit_level = 31,
    ratio = 0.31,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.84,
    cost_item = 225,
    cost_num = 3,
    cost_coin = 4000,
    allbonus = [{135,4680,0},{136,468,0},{137,468,0},{138,468,0},{139,468,0}]
    };
getRow(8)->
    #equipstarCfg {
    level = 8,
    desc = "[13E826]绿色3星[-]",
    limit_level = 31,
    ratio = 0.34,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.83,
    cost_item = 225,
    cost_num = 4,
    cost_coin = 4500,
    allbonus = [{135,5840,0},{136,584,0},{137,584,0},{138,584,0},{139,584,0}]
    };
getRow(9)->
    #equipstarCfg {
    level = 9,
    desc = "[13E826]绿色4星[-]",
    limit_level = 31,
    ratio = 0.37,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 0,
    odd = 0.82,
    cost_item = 225,
    cost_num = 4,
    cost_coin = 5000,
    allbonus = [{135,7103,0},{136,710,0},{137,710,0},{138,710,0},{139,710,0}]
    };
getRow(10)->
    #equipstarCfg {
    level = 10,
    desc = "[13E826]绿色5星[-]",
    limit_level = 31,
    ratio = 0.4,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.8,
    cost_item = 225,
    cost_num = 4,
    cost_coin = 5500,
    allbonus = [{135,8466,0},{136,846,0},{137,846,0},{138,846,0},{139,846,0}]
    };
getRow(11)->
    #equipstarCfg {
    level = 11,
    desc = "[4674F9]蓝色1星[-]",
    limit_level = 31,
    ratio = 0.43,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.7,
    cost_item = 225,
    cost_num = 5,
    cost_coin = 6000,
    allbonus = [{135,9922,0},{136,992,0},{137,992,0},{138,992,0},{139,992,0}]
    };
getRow(12)->
    #equipstarCfg {
    level = 12,
    desc = "[4674F9]蓝色2星[-]",
    limit_level = 31,
    ratio = 0.46,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 1,
    odd = 0.68,
    cost_item = 225,
    cost_num = 5,
    cost_coin = 6500,
    allbonus = [{135,11468,0},{136,1146,0},{137,1146,0},{138,1146,0},{139,1146,0}]
    };
getRow(13)->
    #equipstarCfg {
    level = 13,
    desc = "[4674F9]蓝色3星[-]",
    limit_level = 31,
    ratio = 0.49,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 3,
    odd = 0.66,
    cost_item = 225,
    cost_num = 5,
    cost_coin = 7000,
    allbonus = [{135,13102,0},{136,1310,0},{137,1310,0},{138,1310,0},{139,1310,0}]
    };
getRow(14)->
    #equipstarCfg {
    level = 14,
    desc = "[4674F9]蓝色4星[-]",
    limit_level = 31,
    ratio = 0.52,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.64,
    cost_item = 225,
    cost_num = 5,
    cost_coin = 7500,
    allbonus = [{135,14819,0},{136,1481,0},{137,1481,0},{138,1481,0},{139,1481,0}]
    };
getRow(15)->
    #equipstarCfg {
    level = 15,
    desc = "[4674F9]蓝色5星[-]",
    limit_level = 31,
    ratio = 0.55,
    progress = 1,
    fail_odd = 0.1,
    fail_min = 2,
    odd = 0.62,
    cost_item = 225,
    cost_num = 1,
    cost_coin = 8000,
    allbonus = [{135,16617,0},{136,1661,0},{137,1661,0},{138,1661,0},{139,1661,0}]
    };
getRow(16)->
    #equipstarCfg {
    level = 16,
    desc = "[FF0000]红色1星[-]",
    limit_level = 31,
    ratio = 0.58,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 2,
    odd = 0.6,
    cost_item = 226,
    cost_num = 1,
    cost_coin = 8500,
    allbonus = [{135,18494,0},{136,1849,0},{137,1849,0},{138,1849,0},{139,1849,0}]
    };
getRow(17)->
    #equipstarCfg {
    level = 17,
    desc = "[FF0000]红色2星[-]",
    limit_level = 31,
    ratio = 0.61,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 3,
    odd = 0.59,
    cost_item = 226,
    cost_num = 1,
    cost_coin = 9000,
    allbonus = [{135,20447,0},{136,2044,0},{137,2044,0},{138,2044,0},{139,2044,0}]
    };
getRow(18)->
    #equipstarCfg {
    level = 18,
    desc = "[FF0000]红色3星[-]",
    limit_level = 31,
    ratio = 0.64,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 3,
    odd = 0.58,
    cost_item = 226,
    cost_num = 2,
    cost_coin = 9500,
    allbonus = [{135,22476,0},{136,2247,0},{137,2247,0},{138,2247,0},{139,2247,0}]
    };
getRow(19)->
    #equipstarCfg {
    level = 19,
    desc = "[FF0000]红色4星[-]",
    limit_level = 31,
    ratio = 0.67,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 2,
    odd = 0.57,
    cost_item = 226,
    cost_num = 2,
    cost_coin = 10000,
    allbonus = [{135,24577,0},{136,2457,0},{137,2457,0},{138,2457,0},{139,2457,0}]
    };
getRow(20)->
    #equipstarCfg {
    level = 20,
    desc = "[FF0000]红色5星[-]",
    limit_level = 31,
    ratio = 0.7,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 3,
    odd = 0.56,
    cost_item = 226,
    cost_num = 2,
    cost_coin = 10500,
    allbonus = [{135,26750,0},{136,2675,0},{137,2675,0},{138,2675,0},{139,2675,0}]
    };
getRow(21)->
    #equipstarCfg {
    level = 21,
    desc = "[FF5AFF]紫色1星[-]",
    limit_level = 31,
    ratio = 0.73,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 3,
    odd = 0.55,
    cost_item = 226,
    cost_num = 3,
    cost_coin = 11000,
    allbonus = [{135,26750,0},{136,2675,0},{137,2675,0},{138,2675,0},{139,2675,0}]
    };
getRow(22)->
    #equipstarCfg {
    level = 22,
    desc = "[FF5AFF]紫色2星[-]",
    limit_level = 31,
    ratio = 0.76,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 2,
    odd = 0.55,
    cost_item = 226,
    cost_num = 3,
    cost_coin = 11500,
    allbonus = [{135,26750,0},{136,2675,0},{137,2675,0},{138,2675,0},{139,2675,0}]
    };
getRow(23)->
    #equipstarCfg {
    level = 23,
    desc = "[FF5AFF]紫色3星[-]",
    limit_level = 31,
    ratio = 0.79,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 3,
    odd = 0.55,
    cost_item = 226,
    cost_num = 3,
    cost_coin = 12000,
    allbonus = [{135,26750,0},{136,2675,0},{137,2675,0},{138,2675,0},{139,2675,0}]
    };
getRow(24)->
    #equipstarCfg {
    level = 24,
    desc = "[FF5AFF]紫色4星[-]",
    limit_level = 31,
    ratio = 0.82,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 3,
    odd = 0.55,
    cost_item = 226,
    cost_num = 3,
    cost_coin = 12500,
    allbonus = [{135,26750,0},{136,2675,0},{137,2675,0},{138,2675,0},{139,2675,0}]
    };
getRow(25)->
    #equipstarCfg {
    level = 25,
    desc = "[FF5AFF]紫色5星[-]",
    limit_level = 31,
    ratio = 0.85,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 2,
    odd = 0.55,
    cost_item = 226,
    cost_num = 3,
    cost_coin = 13000,
    allbonus = [{135,26750,0},{136,2675,0},{137,2675,0},{138,2675,0},{139,2675,0}]
    };
getRow(26)->
    #equipstarCfg {
    level = 26,
    desc = "[FF6100]橙色1星[-]",
    limit_level = 31,
    ratio = 0.88,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 5,
    odd = 0.5,
    cost_item = 227,
    cost_num = 3,
    cost_coin = 13500,
    allbonus = [{135,26750,0},{136,2675,0},{137,2675,0},{138,2675,0},{139,2675,0}]
    };
getRow(27)->
    #equipstarCfg {
    level = 27,
    desc = "[FF6100]橙色2星[-]",
    limit_level = 31,
    ratio = 0.91,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 5,
    odd = 0.5,
    cost_item = 227,
    cost_num = 3,
    cost_coin = 14000,
    allbonus = [{135,26750,0},{136,2675,0},{137,2675,0},{138,2675,0},{139,2675,0}]
    };
getRow(28)->
    #equipstarCfg {
    level = 28,
    desc = "[FF6100]橙色3星[-]",
    limit_level = 31,
    ratio = 0.94,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 5,
    odd = 0.5,
    cost_item = 227,
    cost_num = 3,
    cost_coin = 14500,
    allbonus = [{135,26750,0},{136,2675,0},{137,2675,0},{138,2675,0},{139,2675,0}]
    };
getRow(29)->
    #equipstarCfg {
    level = 29,
    desc = "[FF6100]橙色4星[-]",
    limit_level = 31,
    ratio = 0.97,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 5,
    odd = 0.5,
    cost_item = 227,
    cost_num = 3,
    cost_coin = 15000,
    allbonus = [{135,26750,0},{136,2675,0},{137,2675,0},{138,2675,0},{139,2675,0}]
    };
getRow(30)->
    #equipstarCfg {
    level = 30,
    desc = "[FF6100]橙色5星[-]",
    limit_level = 31,
    ratio = 1,
    progress = 1,
    fail_odd = 0.05,
    fail_min = 5,
    odd = 0.5,
    cost_item = 227,
    cost_num = 3,
    cost_coin = 15500,
    allbonus = [{135,26750,0},{136,2675,0},{137,2675,0},{138,2675,0},{139,2675,0}]
    };
getRow(_)->[].

getKeyList()->[
    {0},
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
    {21},
    {22},
    {23},
    {24},
    {25},
    {26},
    {27},
    {28},
    {29},
    {30}
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
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30
    ].

