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
    name = "c%sc_object_zhuozi_01",
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
    name = "c%sc_object_nianye_01",
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
    name = "c%sc_object_mt_02",
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
    name = "c%sc_object_mt_02",
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
    name = "c%sc_object_nongju",
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
    name = "c%sc_object_diaoshu",
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
    name = "c%sc_object_wuqijia",
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
    location = [65.89,17.66,166.63],
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
getRow(60)->
    #task_objCfg {
    id = 60,
    type = 1,
    belong = "考核官出现",
    name = "n%n_47",
    location = [96.06,17.9,167.46],
    rotate = [0,0,0],
    scale = [1.2,1.2,1.2],
    maps = "map333",
    attach = 0
    };
getRow(61)->
    #task_objCfg {
    id = 61,
    type = 1,
    belong = "史莱姆出现",
    name = "m%m_1!",
    location = [216.98,21.39,193.01],
    rotate = [0,-145.93,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(62)->
    #task_objCfg {
    id = 62,
    type = 2,
    belong = "觉醒副本特效",
    name = "vfx_26_21",
    location = [47.19,20.67,126.5],
    rotate = [0,0,0],
    scale = [2,2,2],
    maps = "map333",
    attach = 0
    };
getRow(63)->
    #task_objCfg {
    id = 63,
    type = 1,
    belong = "采集布娃娃",
    name = "n%n_76",
    location = [220.06,21.39,200.31],
    rotate = [0,-30,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(64)->
    #task_objCfg {
    id = 64,
    type = 1,
    belong = "安娜跟随后出现",
    name = "m%m_82",
    location = [114.84,19.55,61.65],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(65)->
    #task_objCfg {
    id = 65,
    type = 1,
    belong = "安娜失踪后出现",
    name = "m%m_82",
    location = [71.60,17.98,168.85],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(66)->
    #task_objCfg {
    id = 66,
    type = 2,
    belong = "港口动态特效",
    name = "vfx_26_36",
    location = [65.52,17.88294,171.5],
    rotate = [0,0,0],
    scale = [2,2,2],
    maps = "map333",
    attach = 0
    };
getRow(67)->
    #task_objCfg {
    id = 67,
    type = 2,
    belong = "骑宠副本特效",
    name = "vfx_26_21",
    location = [127.4,17.74,169.5],
    rotate = [0,0,0],
    scale = [2,2,2],
    maps = "map333",
    attach = 0
    };
getRow(68)->
    #task_objCfg {
    id = 68,
    type = 1,
    belong = "寻找大白2踪迹",
    name = "c%sc_object_nianye_01",
    location = [222.5,21.66,58.4],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(69)->
    #task_objCfg {
    id = 69,
    type = 1,
    belong = "寻找大白3-大白",
    name = "m%m_67!",
    location = [170.07,19.98,56.7],
    rotate = [0,69.32,0],
    scale = [5,5,5],
    maps = "map333",
    attach = 0
    };
getRow(70)->
    #task_objCfg {
    id = 70,
    type = 1,
    belong = "寻找大白2踪迹",
    name = "c%sc_object_nianye_01",
    location = [214.3,21.62,50.7],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(71)->
    #task_objCfg {
    id = 71,
    type = 1,
    belong = "寻找大白3-红海龟",
    name = "m%m_508!",
    location = [175.3,19.9,55.5],
    rotate = [0,98.8,0],
    scale = [1.2,1.2,1.2],
    maps = "map333",
    attach = 0
    };
getRow(72)->
    #task_objCfg {
    id = 72,
    type = 1,
    belong = "绑架安娜的炸弹头头",
    name = "m%m_14",
    location = [64.31,21.05,70.84],
    rotate = [0,-122.15,0],
    scale = [1.2,1.2,1.2],
    maps = "map333",
    attach = 0
    };
getRow(73)->
    #task_objCfg {
    id = 73,
    type = 1,
    belong = "绑架安娜位面后的安娜",
    name = "m%m_82",
    location = [61.61,21,78.8],
    rotate = [0,-159,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(74)->
    #task_objCfg {
    id = 74,
    type = 1,
    belong = "猫绅士左1",
    name = "n%n_300",
    location = [42.63,16.63,178.74],
    rotate = [0,36.80,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(75)->
    #task_objCfg {
    id = 75,
    type = 1,
    belong = "猫绅士左2",
    name = "n%n_301",
    location = [40.57,16.63,181.92],
    rotate = [0,50.42,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(76)->
    #task_objCfg {
    id = 76,
    type = 1,
    belong = "猫绅士左3",
    name = "n%n_201",
    location = [39.1,16.60,184.8],
    rotate = [0,56.07,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(77)->
    #task_objCfg {
    id = 77,
    type = 1,
    belong = "猫绅士右1",
    name = "n%n_500",
    location = [38.42,16.59,193.34],
    rotate = [0,97.78,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(78)->
    #task_objCfg {
    id = 78,
    type = 1,
    belong = "猫绅士右2",
    name = "n%n_400",
    location = [40.43,16.54,197.35],
    rotate = [0,118.25,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(79)->
    #task_objCfg {
    id = 79,
    type = 1,
    belong = "猫绅士右3",
    name = "n%n_200",
    location = [43.65,16.46,200.13],
    rotate = [0,140.72,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(80)->
    #task_objCfg {
    id = 80,
    type = 2,
    belong = "位面点光效",
    name = "vfx_26_4",
    location = [127.8,17.96,122.6],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(81)->
    #task_objCfg {
    id = 81,
    type = 2,
    belong = "武器架光效",
    name = "vfx_26_21",
    location = [110.62,18.38,102.89],
    rotate = [0,0,0],
    scale = [2,2,2],
    maps = "map333",
    attach = 0
    };
getRow(82)->
    #task_objCfg {
    id = 82,
    type = 2,
    belong = "武器架光效",
    name = "vfx_26_4",
    location = [110.62,18.38,102.89],
    rotate = [0,0,0],
    scale = [2,2,2],
    maps = "map333",
    attach = 0
    };
getRow(83)->
    #task_objCfg {
    id = 83,
    type = 1,
    belong = "史莱姆的踪迹1",
    name = "m%m_5",
    location = [213.546,21.28,199.92],
    rotate = [0,21.287,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(84)->
    #task_objCfg {
    id = 84,
    type = 1,
    belong = "史莱姆的踪迹2",
    name = "m%m_5",
    location = [216.48,21.28,199.93],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(85)->
    #task_objCfg {
    id = 85,
    type = 1,
    belong = "史莱姆的踪迹3",
    name = "m%m_5",
    location = [219.21,21.28,199.94],
    rotate = [0,21.287,2],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(86)->
    #task_objCfg {
    id = 86,
    type = 1,
    belong = "史莱姆的踪迹4",
    name = "m%m_5",
    location = [221.38,21.28,199.95],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(87)->
    #task_objCfg {
    id = 87,
    type = 1,
    belong = "武器架光效",
    name = "c%sc_object_wuqijia",
    location = [110.62,18.38,102.89],
    rotate = [0,0,0],
    scale = [0.5,0.5,0.5],
    maps = "map333",
    attach = 0
    };
getRow(88)->
    #task_objCfg {
    id = 88,
    type = 1,
    belong = "托比的骑宠",
    name = "m%m_545",
    location = [225.5,22.93,192.8],
    rotate = [0,-140,0],
    scale = [0.2,0.2,0.2],
    maps = "map333",
    attach = 0
    };
getRow(89)->
    #task_objCfg {
    id = 89,
    type = 1,
    belong = "罗撒特出现",
    name = "m%m_23",
    location = [74.87,16.62,192.8],
    rotate = [0,-140.13,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(90)->
    #task_objCfg {
    id = 90,
    type = 1,
    belong = "考核通过的特效",
    name = "plot\vfx_29_27",
    location = [100.29,17.87,166.86],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(91)->
    #task_objCfg {
    id = 91,
    type = 1,
    belong = "考核通过的特效",
    name = "plot\vfx_29_27",
    location = [100.29,17.87,166.86],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map333",
    attach = 0
    };
getRow(100)->
    #task_objCfg {
    id = 100,
    type = 1,
    belong = "金大胖出现",
    name = "m%m_26",
    location = [181.44,33.2,204.09],
    rotate = [0,171.57,0],
    scale = [2.7,2.7,2.7],
    maps = "map332",
    attach = 0
    };
getRow(101)->
    #task_objCfg {
    id = 101,
    type = 1,
    belong = "金中胖出现",
    name = "m%m_26",
    location = [194.63,33.2,204.10],
    rotate = [0,171.57,0],
    scale = [2.2,2.2,2.2],
    maps = "map332",
    attach = 0
    };
getRow(102)->
    #task_objCfg {
    id = 102,
    type = 1,
    belong = "金小胖出现",
    name = "m%m_26",
    location = [205.06,33.2,204.11],
    rotate = [0,171.57,0],
    scale = [1.2,1.2,1.2],
    maps = "map332",
    attach = 0
    };
getRow(103)->
    #task_objCfg {
    id = 103,
    type = 1,
    belong = "美味蟹肉",
    name = "c%sc_object_xuedui_01",
    location = [150.83,27.06,69.05],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(104)->
    #task_objCfg {
    id = 104,
    type = 1,
    belong = "美味蟹肉特效",
    name = "vfx_26_21",
    location = [150.83,27.06,69.05],
    rotate = [0,0,0],
    scale = [2,2,2],
    maps = "map332",
    attach = 0
    };
getRow(105)->
    #task_objCfg {
    id = 105,
    type = 1,
    belong = "吹响号角后追随的骑士",
    name = "n%n_42",
    location = [257.69,34.54,140.5],
    rotate = [0,71.12,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(106)->
    #task_objCfg {
    id = 106,
    type = 1,
    belong = "吹响号角后追随的骑士",
    name = "n%n_46",
    location = [255.58,34.54,136.8],
    rotate = [0,71.12,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(107)->
    #task_objCfg {
    id = 107,
    type = 1,
    belong = "吹响号角后追随的骑士",
    name = "n%n_46",
    location = [254.05,34.54,133.45],
    rotate = [0,71.12,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(108)->
    #task_objCfg {
    id = 108,
    type = 1,
    belong = "吹响号角后追随的骑士",
    name = "n%n_42",
    location = [253.01,34.54,129.53],
    rotate = [0,71.12,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(109)->
    #task_objCfg {
    id = 109,
    type = 1,
    belong = "吹响号角后追随的骑士",
    name = "n%n_46",
    location = [252.53,34.54,125.21],
    rotate = [0,71.12,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(110)->
    #task_objCfg {
    id = 110,
    type = 1,
    belong = "吹响号角后骑士领主",
    name = "n%n_46",
    location = [261.03,34.54,133.65],
    rotate = [0,-71.12,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(113)->
    #task_objCfg {
    id = 113,
    type = 1,
    belong = "大风营救I魔族小鬼",
    name = "m%m_78",
    location = [127.29,32.4,129.52],
    rotate = [0,96.9,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(114)->
    #task_objCfg {
    id = 114,
    type = 1,
    belong = "大风营救I魔族女战士",
    name = "m%m_30",
    location = [117.7,33.97,128.91],
    rotate = [0,76.28,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(116)->
    #task_objCfg {
    id = 116,
    type = 1,
    belong = "护送宝马后领主",
    name = "m%m_23",
    location = [96.56,34.48,217.95],
    rotate = [0,163.85,0],
    scale = [1.2,1.2,1.2],
    maps = "map332",
    attach = 0
    };
getRow(117)->
    #task_objCfg {
    id = 117,
    type = 1,
    belong = "护送宝马后宝马",
    name = "m%m_502",
    location = [100.36,34.48,218.09],
    rotate = [0,163.85,1],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(120)->
    #task_objCfg {
    id = 120,
    type = 2,
    belong = "吹响号角后的特效",
    name = "vfx_26_37",
    location = [295.09,69,125.91],
    rotate = [0,0,0],
    scale = [2,2,2],
    maps = "map332",
    attach = 0
    };
getRow(125)->
    #task_objCfg {
    id = 125,
    type = 1,
    belong = "护送宝马处魔族包围",
    name = "m%m_54",
    location = [98,39,167],
    rotate = [0,-140,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(126)->
    #task_objCfg {
    id = 126,
    type = 1,
    belong = "护送宝马处魔族包围",
    name = "m%m_54",
    location = [104,38,172],
    rotate = [0,-140,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(127)->
    #task_objCfg {
    id = 127,
    type = 1,
    belong = "护送宝马处魔族包围",
    name = "m%m_54",
    location = [106,36,178],
    rotate = [0,-140,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(128)->
    #task_objCfg {
    id = 128,
    type = 1,
    belong = "护送宝马处魔族包围",
    name = "m%m_54",
    location = [110,35,183],
    rotate = [0,-140,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(129)->
    #task_objCfg {
    id = 129,
    type = 1,
    belong = "护送宝马处魔族包围",
    name = "m%m_27",
    location = [106,34,190],
    rotate = [0,148,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(130)->
    #task_objCfg {
    id = 130,
    type = 1,
    belong = "护送宝马处魔族包围",
    name = "m%m_27",
    location = [100,34,198],
    rotate = [0,169,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(131)->
    #task_objCfg {
    id = 131,
    type = 1,
    belong = "护送宝马处魔族包围",
    name = "m%m_27",
    location = [100,34.5,208],
    rotate = [0,172,0],
    scale = [1,1,1],
    maps = "map332",
    attach = 0
    };
getRow(150)->
    #task_objCfg {
    id = 150,
    type = 1,
    belong = "弗洛多老爷跟随后出现",
    name = "n%n_21",
    location = [127.08,8.59,130],
    rotate = [0,100,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(151)->
    #task_objCfg {
    id = 151,
    type = 1,
    belong = "弗洛多老爷跟随后出现",
    name = "n%n_21",
    location = [122,8.59,139.5],
    rotate = [0,59,0],
    scale = [1,1,1],
    maps = "map331",
    attach = 0
    };
getRow(152)->
    #task_objCfg {
    id = 152,
    type = 1,
    belong = "主城-打劫现场调查",
    name = "m%m_57",
    location = [111,6.38,256],
    rotate = [0,-55,-88],
    scale = [3,3,3],
    maps = "map340",
    attach = 0
    };
getRow(153)->
    #task_objCfg {
    id = 153,
    type = 1,
    belong = "主城-打劫现场调查",
    name = "m%m_57",
    location = [114,6.38,258],
    rotate = [0,-55,-88],
    scale = [3,3,3],
    maps = "map340",
    attach = 0
    };
getRow(154)->
    #task_objCfg {
    id = 154,
    type = 1,
    belong = "主城-打劫现场调查",
    name = "m%m_57",
    location = [111,6.38,256],
    rotate = [0,-3.4,-88],
    scale = [3,3,3],
    maps = "map340",
    attach = 0
    };
getRow(155)->
    #task_objCfg {
    id = 155,
    type = 2,
    belong = "主城-打劫现场调查特效",
    name = "vfx_26_4",
    location = [112,6,255],
    rotate = [0,0,0],
    scale = [3,3,3],
    maps = "map340",
    attach = 0
    };
getRow(156)->
    #task_objCfg {
    id = 156,
    type = 2,
    belong = "主城-打劫现场调查特效",
    name = "vfx_26_21",
    location = [109,6,256],
    rotate = [0,0,0],
    scale = [2,2,2],
    maps = "map340",
    attach = 0
    };
getRow(157)->
    #task_objCfg {
    id = 157,
    type = 1,
    belong = "主城-铁匠处调查",
    name = "m%m_57",
    location = [281,6.16,302],
    rotate = [0.5,146,-88],
    scale = [3,3,3],
    maps = "map340",
    attach = 0
    };
getRow(158)->
    #task_objCfg {
    id = 158,
    type = 2,
    belong = "主城-铁匠处调查特效",
    name = "vfx_26_4",
    location = [281,6,302],
    rotate = [0,0,0],
    scale = [3,3,3],
    maps = "map340",
    attach = 0
    };
getRow(159)->
    #task_objCfg {
    id = 159,
    type = 2,
    belong = "主城-铁匠处调查特效",
    name = "vfx_26_21",
    location = [281,6,302],
    rotate = [0,0,0],
    scale = [2,2,2],
    maps = "map340",
    attach = 0
    };
getRow(160)->
    #task_objCfg {
    id = 160,
    type = 1,
    belong = "主城-打劫现场劫匪出现",
    name = "m%m_23",
    location = [115,6,261],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(161)->
    #task_objCfg {
    id = 161,
    type = 1,
    belong = "主城-打劫现场劫匪出现",
    name = "m%m_23",
    location = [120,6,261],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(162)->
    #task_objCfg {
    id = 162,
    type = 1,
    belong = "主城-打劫现场劫匪出现",
    name = "m%m_23",
    location = [111,6,261],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(163)->
    #task_objCfg {
    id = 163,
    type = 1,
    belong = "主城-打劫现场劫匪出现",
    name = "m%m_73",
    location = [119.6,6,251],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map340",
    attach = 0
    };
getRow(164)->
    #task_objCfg {
    id = 164,
    type = 1,
    belong = "主城-打劫现场劫匪出现",
    name = "m%m_73",
    location = [112,6,251],
    rotate = [0,0,0],
    scale = [1,1,1],
    maps = "map340",
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
    {56},
    {60},
    {61},
    {62},
    {63},
    {64},
    {65},
    {66},
    {67},
    {68},
    {69},
    {70},
    {71},
    {72},
    {73},
    {74},
    {75},
    {76},
    {77},
    {78},
    {79},
    {80},
    {81},
    {82},
    {83},
    {84},
    {85},
    {86},
    {87},
    {88},
    {89},
    {90},
    {91},
    {100},
    {101},
    {102},
    {103},
    {104},
    {105},
    {106},
    {107},
    {108},
    {109},
    {110},
    {113},
    {114},
    {116},
    {117},
    {120},
    {125},
    {126},
    {127},
    {128},
    {129},
    {130},
    {131},
    {150},
    {151},
    {152},
    {153},
    {154},
    {155},
    {156},
    {157},
    {158},
    {159},
    {160},
    {161},
    {162},
    {163},
    {164}
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
    56,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    113,
    114,
    116,
    117,
    120,
    125,
    126,
    127,
    128,
    129,
    130,
    131,
    150,
    151,
    152,
    153,
    154,
    155,
    156,
    157,
    158,
    159,
    160,
    161,
    162,
    163,
    164
    ].

