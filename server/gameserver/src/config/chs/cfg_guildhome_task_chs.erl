%% coding: latin-1
%%: 实现
-module(cfg_guildhome_task_chs).
-compile(export_all).
-include("cfg_guildhome_task.hrl").
-include("logger.hrl").

getRow(1)->
    #guildhome_taskCfg {
    id = 1,
    task_type = 1,
    task_subType = 1,
    param1 = 240,
    param2 = 1,
    param3 = 0,
    point_x = 0,
    point_y = 0,
    taskname = "[探]刺杀目标",
    level = [{1,40},{41,50},{51,60},{61,70},{71,80},{81,90},{91,100}],
    normal_drop = [6301,6302,6303,6304,6305,6306,6307],
    normal_exp = [20,20,20,20,20,20,20],
    add_drop = [6401,6402,6403,6404,6405,6406,6407],
    add_exp = [40,40,40,40,40,40,40],
    waive_drop = [6501,6502,6503,6504,6505,6506,6507],
    waive_exp = [10,10,10,10,10,10,10]
    };
getRow(2)->
    #guildhome_taskCfg {
    id = 2,
    task_type = 1,
    task_subType = 2,
    param1 = 7031,
    param2 = 50,
    param3 = 0,
    point_x = 34,
    point_y = 79,
    taskname = "[探]驻地守卫",
    level = [{1,40},{41,50},{51,60},{61,70},{71,80},{81,90},{91,100}],
    normal_drop = [6311,6312,6313,6314,6315,6316,6317],
    normal_exp = [20,20,20,20,20,20,20],
    add_drop = [6411,6412,6413,6414,6415,6416,6417],
    add_exp = [40,40,40,40,40,40,40],
    waive_drop = [6511,6512,6513,6514,6515,6516,6517],
    waive_exp = [10,10,10,10,10,10,10]
    };
getRow(3)->
    #guildhome_taskCfg {
    id = 3,
    task_type = 1,
    task_subType = 3,
    param1 = 1,
    param2 = 1,
    param3 = 0,
    point_x = 0,
    point_y = 0,
    taskname = "[探]击杀敌军",
    level = [{1,40},{41,50},{51,60},{61,70},{71,80},{81,90},{91,100}],
    normal_drop = [6321,6322,6323,6324,6325,6326,6327],
    normal_exp = [20,20,20,20,20,20,20],
    add_drop = [6421,6422,6423,6424,6425,6426,6427],
    add_exp = [50,50,50,50,50,50,50],
    waive_drop = [6321,6322,6323,6324,6325,6326,6327],
    waive_exp = [20,20,20,20,20,20,20]
    };
getRow(4)->
    #guildhome_taskCfg {
    id = 4,
    task_type = 1,
    task_subType = 4,
    param1 = 227,
    param2 = 1,
    param3 = 0,
    point_x = 0,
    point_y = 0,
    taskname = "[探]焚烧帐篷",
    level = [{1,40},{41,50},{51,60},{61,70},{71,80},{81,90},{91,100}],
    normal_drop = [6331,6332,6333,6334,6335,6336,6337],
    normal_exp = [20,20,20,20,20,20,20],
    add_drop = [6431,6432,6433,6434,6435,6436,6437],
    add_exp = [40,40,40,40,40,40,40],
    waive_drop = [6531,6532,6533,6534,6535,6536,6537],
    waive_exp = [10,10,10,10,10,10,10]
    };
getRow(5)->
    #guildhome_taskCfg {
    id = 5,
    task_type = 1,
    task_subType = 4,
    param1 = 228,
    param2 = 1,
    param3 = 0,
    point_x = 0,
    point_y = 0,
    taskname = "[探]点燃炸药",
    level = [{1,40},{41,50},{51,60},{61,70},{71,80},{81,90},{91,100}],
    normal_drop = [6331,6332,6333,6334,6335,6336,6337],
    normal_exp = [20,20,20,20,20,20,20],
    add_drop = [6431,6432,6433,6434,6435,6436,6437],
    add_exp = [40,40,40,40,40,40,40],
    waive_drop = [6531,6532,6533,6534,6535,6536,6537],
    waive_exp = [10,10,10,10,10,10,10]
    };
getRow(6)->
    #guildhome_taskCfg {
    id = 6,
    task_type = 1,
    task_subType = 1,
    param1 = 240,
    param2 = 1,
    param3 = 0,
    point_x = 0,
    point_y = 0,
    taskname = "[探]刺杀目标",
    level = [{1,40},{41,50},{51,60},{61,70},{71,80},{81,90},{91,100}],
    normal_drop = [6301,6302,6303,6304,6305,6306,6307],
    normal_exp = [20,20,20,20,20,20,20],
    add_drop = [6401,6402,6403,6404,6405,6406,6407],
    add_exp = [40,40,40,40,40,40,40],
    waive_drop = [6501,6502,6503,6504,6505,6506,6507],
    waive_exp = [10,10,10,10,10,10,10]
    };
getRow(7)->
    #guildhome_taskCfg {
    id = 7,
    task_type = 1,
    task_subType = 2,
    param1 = 7031,
    param2 = 50,
    param3 = 0,
    point_x = 34,
    point_y = 79,
    taskname = "[探]驻地守卫",
    level = [{1,40},{41,50},{51,60},{61,70},{71,80},{81,90},{91,100}],
    normal_drop = [6311,6312,6313,6314,6315,6316,6317],
    normal_exp = [20,20,20,20,20,20,20],
    add_drop = [6411,6412,6413,6414,6415,6416,6417],
    add_exp = [40,40,40,40,40,40,40],
    waive_drop = [6511,6512,6513,6514,6515,6516,6517],
    waive_exp = [10,10,10,10,10,10,10]
    };
getRow(8)->
    #guildhome_taskCfg {
    id = 8,
    task_type = 1,
    task_subType = 4,
    param1 = 227,
    param2 = 1,
    param3 = 0,
    point_x = 0,
    point_y = 0,
    taskname = "[探]焚烧帐篷",
    level = [{1,40},{41,50},{51,60},{61,70},{71,80},{81,90},{91,100}],
    normal_drop = [6331,6332,6333,6334,6335,6336,6337],
    normal_exp = [20,20,20,20,20,20,20],
    add_drop = [6431,6432,6433,6434,6435,6436,6437],
    add_exp = [40,40,40,40,40,40,40],
    waive_drop = [6531,6532,6533,6534,6535,6536,6537],
    waive_exp = [10,10,10,10,10,10,10]
    };
getRow(9)->
    #guildhome_taskCfg {
    id = 9,
    task_type = 1,
    task_subType = 4,
    param1 = 228,
    param2 = 1,
    param3 = 0,
    point_x = 0,
    point_y = 0,
    taskname = "[探]点燃炸药",
    level = [{1,40},{41,50},{51,60},{61,70},{71,80},{81,90},{91,100}],
    normal_drop = [6331,6332,6333,6334,6335,6336,6337],
    normal_exp = [20,20,20,20,20,20,20],
    add_drop = [6431,6432,6433,6434,6435,6436,6437],
    add_exp = [40,40,40,40,40,40,40],
    waive_drop = [6531,6532,6533,6534,6535,6536,6537],
    waive_exp = [10,10,10,10,10,10,10]
    };
getRow(101)->
    #guildhome_taskCfg {
    id = 101,
    task_type = 2,
    task_subType = 2,
    param1 = 7030,
    param2 = 50,
    param3 = 0,
    point_x = 0,
    point_y = 0,
    taskname = "[巡]击杀斥候",
    level = [{1,40},{41,50},{51,60},{61,70},{71,80},{81,90},{91,100}],
    normal_drop = [6341,6342,6343,6344,6345,6346,6347],
    normal_exp = [15,15,15,15,15,15,15],
    add_drop = [6441,6442,6443,6444,6445,6446,6447],
    add_exp = [30,30,30,30,30,30,30],
    waive_drop = [6541,6542,6543,6544,6545,6546,6547],
    waive_exp = [5,5,5,5,5,5,5]
    };
getRow(102)->
    #guildhome_taskCfg {
    id = 102,
    task_type = 2,
    task_subType = 4,
    param1 = 225,
    param2 = 1,
    param3 = 0,
    point_x = 0,
    point_y = 0,
    taskname = "[巡]清点武器",
    level = [{1,40},{41,50},{51,60},{61,70},{71,80},{81,90},{91,100}],
    normal_drop = [6351,6352,6353,6354,6355,6356,6357],
    normal_exp = [15,15,15,15,15,15,15],
    add_drop = [6451,6452,6453,6454,6455,6456,6457],
    add_exp = [30,30,30,30,30,30,30],
    waive_drop = [6551,6552,6553,6554,6555,6556,6557],
    waive_exp = [5,5,5,5,5,5,5]
    };
getRow(103)->
    #guildhome_taskCfg {
    id = 103,
    task_type = 2,
    task_subType = 4,
    param1 = 226,
    param2 = 1,
    param3 = 0,
    point_x = 0,
    point_y = 0,
    taskname = "[巡]救治守卫",
    level = [{1,40},{41,50},{51,60},{61,70},{71,80},{81,90},{91,100}],
    normal_drop = [6361,6362,6363,6364,6365,6366,6367],
    normal_exp = [15,15,15,15,15,15,15],
    add_drop = [6461,6462,6463,6464,6465,6466,6467],
    add_exp = [30,30,30,30,30,30,30],
    waive_drop = [6561,6562,6563,6564,6565,6566,6567],
    waive_exp = [5,5,5,5,5,5,5]
    };
getRow(104)->
    #guildhome_taskCfg {
    id = 104,
    task_type = 2,
    task_subType = 3,
    param1 = 1,
    param2 = 1,
    param3 = 0,
    point_x = 0,
    point_y = 0,
    taskname = "[巡]击杀敌军",
    level = [{1,40},{41,50},{51,60},{61,70},{71,80},{81,90},{91,100}],
    normal_drop = [6301,6302,6303,6304,6305,6306,6307],
    normal_exp = [15,15,15,15,15,15,15],
    add_drop = [6401,6402,6403,6404,6405,6406,6407],
    add_exp = [40,40,40,40,40,40,40],
    waive_drop = [6301,6302,6303,6304,6305,6306,6307],
    waive_exp = [15,15,15,15,15,15,15]
    };
getRow(105)->
    #guildhome_taskCfg {
    id = 105,
    task_type = 2,
    task_subType = 2,
    param1 = 7030,
    param2 = 50,
    param3 = 0,
    point_x = 0,
    point_y = 0,
    taskname = "[巡]击杀斥候",
    level = [{1,40},{41,50},{51,60},{61,70},{71,80},{81,90},{91,100}],
    normal_drop = [6341,6342,6343,6344,6345,6346,6347],
    normal_exp = [15,15,15,15,15,15,15],
    add_drop = [6441,6442,6443,6444,6445,6446,6447],
    add_exp = [30,30,30,30,30,30,30],
    waive_drop = [6541,6542,6543,6544,6545,6546,6547],
    waive_exp = [5,5,5,5,5,5,5]
    };
getRow(106)->
    #guildhome_taskCfg {
    id = 106,
    task_type = 2,
    task_subType = 4,
    param1 = 225,
    param2 = 1,
    param3 = 0,
    point_x = 0,
    point_y = 0,
    taskname = "[巡]清点武器",
    level = [{1,40},{41,50},{51,60},{61,70},{71,80},{81,90},{91,100}],
    normal_drop = [6351,6352,6353,6354,6355,6356,6357],
    normal_exp = [15,15,15,15,15,15,15],
    add_drop = [6451,6452,6453,6454,6455,6456,6457],
    add_exp = [30,30,30,30,30,30,30],
    waive_drop = [6551,6552,6553,6554,6555,6556,6557],
    waive_exp = [5,5,5,5,5,5,5]
    };
getRow(107)->
    #guildhome_taskCfg {
    id = 107,
    task_type = 2,
    task_subType = 4,
    param1 = 226,
    param2 = 1,
    param3 = 0,
    point_x = 0,
    point_y = 0,
    taskname = "[巡]救治守卫",
    level = [{1,40},{41,50},{51,60},{61,70},{71,80},{81,90},{91,100}],
    normal_drop = [6361,6362,6363,6364,6365,6366,6367],
    normal_exp = [15,15,15,15,15,15,15],
    add_drop = [6461,6462,6463,6464,6465,6466,6467],
    add_exp = [30,30,30,30,30,30,30],
    waive_drop = [6561,6562,6563,6564,6565,6566,6567],
    waive_exp = [5,5,5,5,5,5,5]
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
    {101},
    {102},
    {103},
    {104},
    {105},
    {106},
    {107}
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
    101,
    102,
    103,
    104,
    105,
    106,
    107
    ].

