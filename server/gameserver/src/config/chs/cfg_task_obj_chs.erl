%% coding: latin-1
%%: 实现
-module(cfg_task_obj_chs).
-compile(export_all).
-include("cfg_task_obj.hrl").
-include("logger.hrl").

getRow(1)->
    #task_objCfg {
    id = 1,
    type = 2,
    belong = "任务用采集物特效",
    name = "vfx_26_21",
    rotate = [0,0,0],
    scale = [1,1,1],
    attach = 0
    };
getRow(2)->
    #task_objCfg {
    id = 2,
    type = 1,
    belong = "星月岛木桌",
    name = "sc_object_zhuozi_01",
    location = [36.8,8.6,94.2],
    rotate = [0,7.14,0],
    scale = [1,1,1],
    maps = "map330",
    attach = 0
    };
getRow(3)->
    #task_objCfg {
    id = 3,
    type = 1,
    belong = "星月岛木桌粘液",
    name = "sc_object_nianye_01",
    location = [37.8,12.1,94.5],
    rotate = [2.5,15.0,-1.52],
    scale = [1,1,1],
    maps = "map330",
    attach = 1
    };
getRow(4)->
    #task_objCfg {
    id = 4,
    type = 1,
    belong = "星月岛木桶",
    name = "sc_object_mt_02",
    location = [107.4,4,115],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map330",
    attach = 1
    };
getRow(5)->
    #task_objCfg {
    id = 5,
    type = 1,
    belong = "星月岛木桶",
    name = "sc_object_mt_02",
    location = [107.4,4,115],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map330",
    attach = 0
    };
getRow(6)->
    #task_objCfg {
    id = 6,
    type = 2,
    belong = "草丛闪光",
    name = "vfx_26_21",
    location = [46,8,147],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map330",
    attach = 0
    };
getRow(8)->
    #task_objCfg {
    id = 8,
    type = 1,
    belong = "平原农具",
    name = "sc_object_nongju",
    location = [161,8.7,232.8],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 1
    };
getRow(9)->
    #task_objCfg {
    id = 9,
    type = 1,
    belong = "平原雕塑",
    name = "sc_object_diaoshu",
    location = [298.4,12.9,227.1],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 1
    };
getRow(10)->
    #task_objCfg {
    id = 10,
    type = 1,
    belong = "苍空之塔武器架",
    name = "sc_object_wuqijia",
    location = [290,33,288],
    rotate = [0,114,0],
    scale = [1,1,1],
    maps = "map324",
    attach = 1
    };
getRow(11)->
    #task_objCfg {
    id = 11,
    type = 2,
    belong = "任务用采集物特效",
    name = "vfx_26_21",
    rotate = [0,0,0],
    scale = [1,1,1],
    attach = 0
    };
getRow(12)->
    #task_objCfg {
    id = 12,
    type = 2,
    belong = "港口铃铛_特效",
    name = "vfx_26_21",
    location = [65.27,19.22,168.01],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(13)->
    #task_objCfg {
    id = 13,
    type = 2,
    belong = "港口红木_特效",
    name = "vfx_26_21",
    location = [58,16.67,221],
    rotate = [0,8.6,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(14)->
    #task_objCfg {
    id = 14,
    type = 2,
    belong = "港口项链_特效",
    name = "vfx_26_21",
    location = [128.05,19.53,60.98],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(15)->
    #task_objCfg {
    id = 15,
    type = 2,
    belong = "青梅-特效",
    name = "vfx_26_21",
    location = [120.39,33.41,123.37],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(16)->
    #task_objCfg {
    id = 16,
    type = 2,
    belong = "青梅-特效",
    name = "vfx_26_21",
    location = [122.33,32.73,121.26],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(17)->
    #task_objCfg {
    id = 17,
    type = 2,
    belong = "青梅-特效",
    name = "vfx_26_21",
    location = [125.48,32.29,121.28],
    rotate = [0,-90,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(18)->
    #task_objCfg {
    id = 18,
    type = 2,
    belong = "橄榄-特效",
    name = "vfx_26_21",
    location = [150.23,31.97,114.87],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(19)->
    #task_objCfg {
    id = 19,
    type = 2,
    belong = "橄榄-特效",
    name = "vfx_26_21",
    location = [146.7,31.97,114.87],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(20)->
    #task_objCfg {
    id = 20,
    type = 2,
    belong = "橄榄-特效",
    name = "vfx_26_21",
    location = [142.96,31.97,114.87],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(21)->
    #task_objCfg {
    id = 21,
    type = 2,
    belong = "橄榄-特效",
    name = "vfx_26_21",
    location = [139.3,31.97,114.57],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(22)->
    #task_objCfg {
    id = 22,
    type = 2,
    belong = "蓝血草-特效",
    name = "vfx_26_21",
    location = [158.71,8.7,88.98],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(23)->
    #task_objCfg {
    id = 23,
    type = 2,
    belong = "蓝血草-特效",
    name = "vfx_26_21",
    location = [159.86,8.7,98.31],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(24)->
    #task_objCfg {
    id = 24,
    type = 2,
    belong = "蓝血草-特效",
    name = "vfx_26_21",
    location = [159.43,8.7,93.37],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(25)->
    #task_objCfg {
    id = 25,
    type = 2,
    belong = "薄荷草-特效",
    name = "vfx_26_21",
    location = [140.54,8.70,86.48],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(26)->
    #task_objCfg {
    id = 26,
    type = 2,
    belong = "薄荷草-特效",
    name = "vfx_26_21",
    location = [140.55,8.70,83.46],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(27)->
    #task_objCfg {
    id = 27,
    type = 2,
    belong = "薄荷草-特效",
    name = "vfx_26_21",
    location = [140.33,8.70,80.10],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(28)->
    #task_objCfg {
    id = 28,
    type = 2,
    belong = "薄荷草-特效",
    name = "vfx_26_21",
    location = [140.44,8.70,76.65],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(29)->
    #task_objCfg {
    id = 29,
    type = 2,
    belong = "鳞片-特效",
    name = "vfx_26_21",
    location = [122.81,8.70,141.73],
    rotate = [0,90,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(30)->
    #task_objCfg {
    id = 30,
    type = 2,
    belong = "生命之石特效",
    name = "vfx_26_21",
    location = [86.17,15.99,65.58],
    rotate = [0,178,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(31)->
    #task_objCfg {
    id = 31,
    type = 2,
    belong = "火龙果-特效",
    name = "vfx_26_21",
    location = [165.37,47.84,324.63],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map324",
    attach = 0
    };
getRow(32)->
    #task_objCfg {
    id = 32,
    type = 2,
    belong = "火龙果-特效",
    name = "vfx_26_21",
    location = [168.79,46.59,324.69],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map324",
    attach = 0
    };
getRow(33)->
    #task_objCfg {
    id = 33,
    type = 2,
    belong = "火龙果-特效",
    name = "vfx_26_21",
    location = [172.16,45.36,324.75],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map324",
    attach = 0
    };
getRow(34)->
    #task_objCfg {
    id = 34,
    type = 2,
    belong = "火龙果-特效",
    name = "vfx_26_21",
    location = [175.67,44.08,324.82],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map324",
    attach = 0
    };
getRow(35)->
    #task_objCfg {
    id = 35,
    type = 2,
    belong = "伏加特-特效",
    name = "vfx_26_21",
    location = [287.39,36.01,281.86],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map324",
    attach = 0
    };
getRow(36)->
    #task_objCfg {
    id = 36,
    type = 2,
    belong = "伏加特-特效",
    name = "vfx_26_21",
    location = [287.46,36.01,285.33],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map324",
    attach = 0
    };
getRow(37)->
    #task_objCfg {
    id = 37,
    type = 2,
    belong = "伏加特-特效",
    name = "vfx_26_21",
    location = [287.46,36.01,288.75],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map324",
    attach = 0
    };
getRow(38)->
    #task_objCfg {
    id = 38,
    type = 2,
    belong = "宝箱-特效",
    name = "vfx_26_21",
    location = [68.3,50.32,209.4],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map324",
    attach = 0
    };
getRow(40)->
    #task_objCfg {
    id = 40,
    type = 2,
    belong = "泰罗果-特效",
    name = "vfx_26_21",
    location = [119.64,7.62,240.41],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map326",
    attach = 0
    };
getRow(41)->
    #task_objCfg {
    id = 41,
    type = 2,
    belong = "泰罗果-特效",
    name = "vfx_26_21",
    location = [117.7,7.62,243.47],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map326",
    attach = 0
    };
getRow(42)->
    #task_objCfg {
    id = 42,
    type = 2,
    belong = "泰罗果-特效",
    name = "vfx_26_21",
    location = [115.52,7.62,246.41],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map326",
    attach = 0
    };
getRow(43)->
    #task_objCfg {
    id = 43,
    type = 2,
    belong = "泰罗果-特效",
    name = "vfx_26_21",
    location = [113.75,7.62,249.29],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map326",
    attach = 0
    };
getRow(44)->
    #task_objCfg {
    id = 44,
    type = 2,
    belong = "冰焰草-特效",
    name = "vfx_26_21",
    location = [127.93,7.62,270.23],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map326",
    attach = 0
    };
getRow(45)->
    #task_objCfg {
    id = 45,
    type = 2,
    belong = "冰焰草-特效",
    name = "vfx_26_21",
    location = [131.26,7.62,270.23],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map326",
    attach = 0
    };
getRow(46)->
    #task_objCfg {
    id = 46,
    type = 2,
    belong = "冰焰草-特效",
    name = "vfx_26_21",
    location = [134.59,7.62,270.23],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map326",
    attach = 0
    };
getRow(47)->
    #task_objCfg {
    id = 47,
    type = 2,
    belong = "冰焰草-特效",
    name = "vfx_26_21",
    location = [137.67,7.62,270.23],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map326",
    attach = 0
    };
getRow(48)->
    #task_objCfg {
    id = 48,
    type = 2,
    belong = "冰焰草-特效",
    name = "vfx_26_21",
    location = [140.95,7.62,270.23],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map326",
    attach = 0
    };
getRow(49)->
    #task_objCfg {
    id = 49,
    type = 2,
    belong = "蓝血草-特效",
    name = "vfx_26_21",
    location = [151.47,8.7,53.77],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map326",
    attach = 0
    };
getRow(50)->
    #task_objCfg {
    id = 50,
    type = 2,
    belong = "蓝血草-特效",
    name = "vfx_26_21",
    location = [151.1,8.7,57.52],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map326",
    attach = 0
    };
getRow(51)->
    #task_objCfg {
    id = 51,
    type = 2,
    belong = "蓝血草-特效",
    name = "vfx_26_21",
    location = [151.47,8.7,60.92],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map326",
    attach = 0
    };
getRow(52)->
    #task_objCfg {
    id = 52,
    type = 2,
    belong = "蓝血草-特效",
    name = "vfx_26_21",
    location = [151.47,8.7,63.88],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map326",
    attach = 0
    };
getRow(53)->
    #task_objCfg {
    id = 53,
    type = 2,
    belong = "蓝血草-特效",
    name = "vfx_26_21",
    location = [151.47,8.7,67.03],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map326",
    attach = 0
    };
getRow(56)->
    #task_objCfg {
    id = 56,
    type = 2,
    belong = "侍卫衣服特此",
    name = "vfx_26_21",
    location = [289,7.62,271.26],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map326",
    attach = 0
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
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
    {30},
    {31},
    {32},
    {33},
    {34},
    {35},
    {36},
    {37},
    {38},
    {40},
    {41},
    {42},
    {43},
    {44},
    {45},
    {46},
    {47},
    {48},
    {49},
    {50},
    {51},
    {52},
    {53},
    {56}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
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
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    56
    ].

