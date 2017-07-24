%% coding: latin-1
%%: 实现
-module(cfg_object_chs).
-compile(export_all).
-include("cfg_object.hrl").
-include("logger.hrl").

getRow(1)->
    #objectCfg {
    id = 1,
    name = "奇怪的水晶",
    type = 1,
    animation = "sc_object_shuij_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "收集未知的液体",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 1,
    gather_Times = 0,
    dropid = 0
    };
getRow(2)->
    #objectCfg {
    id = 2,
    name = "魔法火盆",
    type = 2,
    animation = "sc_caijiwu02",
    animation2 = "sc_object42_01",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "投掷香草",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 0,
    gather_Times = 0,
    dropid = 0
    };
getRow(3)->
    #objectCfg {
    id = 3,
    name = "食物堆",
    type = 1,
    animation = "sc_object_bx_02",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "搬运食物",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 1,
    gather_Times = 0,
    dropid = 0
    };
getRow(5)->
    #objectCfg {
    id = 5,
    name = "侦查点",
    type = 2,
    animation = "sc_object_gsp_02",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "搜索四周",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 0,
    gather_Times = 0,
    dropid = 0
    };
getRow(6)->
    #objectCfg {
    id = 6,
    name = "污染植物",
    type = 1,
    animation = "sc_object_cc_04",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "收集毒蘑菇",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 1,
    gather_Times = 0,
    dropid = 0
    };
getRow(7)->
    #objectCfg {
    id = 7,
    name = "蘑菇堆",
    type = 1,
    animation = "sc_object_yg_02",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "采集无光蘑菇",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 1,
    gather_Times = 0,
    dropid = 0
    };
getRow(8)->
    #objectCfg {
    id = 8,
    name = "寒霜草",
    type = 1,
    animation = "sc_object_cc_02",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "采集寒霜草",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 1,
    gather_Times = 0,
    dropid = 0
    };
getRow(9)->
    #objectCfg {
    id = 9,
    name = "魔族遗骸",
    type = 1,
    animation = "sc_object_sb_02",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "拾取魔族遗憾",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 1,
    gather_Times = 0,
    dropid = 0
    };
getRow(10)->
    #objectCfg {
    id = 10,
    name = "火堆",
    type = 2,
    animation = "sc_caijiwu02",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = "1",
    param1 = 1,
    freshCD = 0,
    gather_Times = 0,
    dropid = 0
    };
getRow(11)->
    #objectCfg {
    id = 11,
    name = "火堆",
    type = 2,
    animation = "sc_caijiwu02",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = "1",
    param1 = 1,
    freshCD = 0,
    gather_Times = 0,
    dropid = 0
    };
getRow(12)->
    #objectCfg {
    id = 12,
    name = "港口竞速测试",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = "1",
    param1 = 1,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(13)->
    #objectCfg {
    id = 13,
    name = "藏东西的木桶",
    type = 1,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "找到七彩皮球",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 0,
    gather_Times = 0,
    dropid = 0
    };
getRow(14)->
    #objectCfg {
    id = 14,
    name = "神秘的箱子",
    type = 1,
    animation = "sc_object_bx_02",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "拾取神秘水晶球",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 0,
    gather_Times = 0,
    dropid = 0
    };
getRow(15)->
    #objectCfg {
    id = 15,
    name = "传讯点",
    type = 2,
    animation = "sc_object_qzps_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "点燃魔法信标",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 0,
    gather_Times = 0,
    dropid = 0
    };
getRow(16)->
    #objectCfg {
    id = 16,
    name = "水晶草",
    type = 1,
    animation = "sc_object_cc_02",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "采集寒星水晶草",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 1,
    gather_Times = 0,
    dropid = 0
    };
getRow(17)->
    #objectCfg {
    id = 17,
    name = "神力源泉",
    type = 2,
    animation = "sc_object_sjq_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "放上漂浮之石",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 0,
    gather_Times = 0,
    dropid = 0
    };
getRow(18)->
    #objectCfg {
    id = 18,
    name = "草药丛",
    type = 1,
    animation = "sc_object_cc_03",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "采集草药",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 0,
    gather_Times = 0,
    dropid = 0
    };
getRow(19)->
    #objectCfg {
    id = 19,
    name = "奇怪的踪迹",
    type = 1,
    animation = "sc_object_cc_04",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "提取神秘的脚印",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 0,
    gather_Times = 0,
    dropid = 0
    };
getRow(20)->
    #objectCfg {
    id = 20,
    name = "受伤士兵",
    type = 2,
    animation = "sc_caijiwu02",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "救治受伤士兵",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 0,
    gather_Times = 0,
    dropid = 0
    };
getRow(21)->
    #objectCfg {
    id = 21,
    name = "港口竞速里程碑终点",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [0],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(22)->
    #objectCfg {
    id = 22,
    name = "港口竞速里程碑起点",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [1],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(23)->
    #objectCfg {
    id = 23,
    name = "港口竞速里程碑1",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [2],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(24)->
    #objectCfg {
    id = 24,
    name = "港口竞速里程碑2",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [3],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(25)->
    #objectCfg {
    id = 25,
    name = "港口竞速里程碑3",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [4],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(26)->
    #objectCfg {
    id = 26,
    name = "港口竞速里程碑4",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [5],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(27)->
    #objectCfg {
    id = 27,
    name = "港口竞速里程碑5",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [6],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(28)->
    #objectCfg {
    id = 28,
    name = "港口竞速里程碑6",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [7],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(29)->
    #objectCfg {
    id = 29,
    name = "港口竞速里程碑7",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [8],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(30)->
    #objectCfg {
    id = 30,
    name = "港口竞速里程碑8",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [9],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(31)->
    #objectCfg {
    id = 31,
    name = "港口竞速里程碑9",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [10],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(32)->
    #objectCfg {
    id = 32,
    name = "港口竞速里程碑10",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [11],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(33)->
    #objectCfg {
    id = 33,
    name = "港口竞速里程碑11",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [12],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(34)->
    #objectCfg {
    id = 34,
    name = "港口竞速里程碑12",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [13],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(35)->
    #objectCfg {
    id = 35,
    name = "港口竞速里程碑13",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [14],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(36)->
    #objectCfg {
    id = 36,
    name = "港口竞速里程碑14",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [15],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(37)->
    #objectCfg {
    id = 37,
    name = "港口竞速里程碑15",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [16],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(38)->
    #objectCfg {
    id = 38,
    name = "港口竞速里程碑16",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [17],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(39)->
    #objectCfg {
    id = 39,
    name = "港口竞速里程碑17",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [18],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(40)->
    #objectCfg {
    id = 40,
    name = "港口竞速里程碑18",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [19],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(41)->
    #objectCfg {
    id = 41,
    name = "港口竞速里程碑19",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [20],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(42)->
    #objectCfg {
    id = 42,
    name = "港口竞速里程碑20",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [21],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(43)->
    #objectCfg {
    id = 43,
    name = "港口竞速里程碑21",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [22],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(44)->
    #objectCfg {
    id = 44,
    name = "港口竞速里程碑22",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [23],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(45)->
    #objectCfg {
    id = 45,
    name = "港口竞速里程碑23",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [24],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(46)->
    #objectCfg {
    id = 46,
    name = "港口竞速里程碑24",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [25],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(47)->
    #objectCfg {
    id = 47,
    name = "港口竞速里程碑25",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [26],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(48)->
    #objectCfg {
    id = 48,
    name = "港口竞速里程碑26",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [27],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(49)->
    #objectCfg {
    id = 49,
    name = "港口竞速里程碑27",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [28],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(50)->
    #objectCfg {
    id = 50,
    name = "港口竞速里程碑28",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [29],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(51)->
    #objectCfg {
    id = 51,
    name = "港口竞速里程碑29",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [30],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(52)->
    #objectCfg {
    id = 52,
    name = "港口竞速里程碑30",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [31],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(53)->
    #objectCfg {
    id = 53,
    name = "港口竞速里程碑31",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [32],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(54)->
    #objectCfg {
    id = 54,
    name = "港口竞速里程碑32",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [33],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(55)->
    #objectCfg {
    id = 55,
    name = "港口竞速里程碑33",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [34],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(56)->
    #objectCfg {
    id = 56,
    name = "港口竞速里程碑34",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [35],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(57)->
    #objectCfg {
    id = 57,
    name = "港口竞速里程碑35",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [36],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(58)->
    #objectCfg {
    id = 58,
    name = "港口竞速里程碑36",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [37],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(59)->
    #objectCfg {
    id = 59,
    name = "港口竞速里程碑37",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [38],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(60)->
    #objectCfg {
    id = 60,
    name = "港口竞速里程碑38",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [39],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(61)->
    #objectCfg {
    id = 61,
    name = "港口竞速里程碑39",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [40],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(62)->
    #objectCfg {
    id = 62,
    name = "港口竞速里程碑40",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [41],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(63)->
    #objectCfg {
    id = 63,
    name = "港口竞速里程碑41",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [42],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(64)->
    #objectCfg {
    id = 64,
    name = "港口竞速里程碑42",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [43],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(65)->
    #objectCfg {
    id = 65,
    name = "港口竞速里程碑43",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [44],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(66)->
    #objectCfg {
    id = 66,
    name = "港口竞速里程碑44",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [45],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(67)->
    #objectCfg {
    id = 67,
    name = "港口竞速里程碑45",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [46],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(68)->
    #objectCfg {
    id = 68,
    name = "港口竞速里程碑46",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [47],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(69)->
    #objectCfg {
    id = 69,
    name = "港口竞速里程碑47",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [48],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(70)->
    #objectCfg {
    id = 70,
    name = "港口竞速里程碑48",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [49],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(71)->
    #objectCfg {
    id = 71,
    name = "港口竞速里程碑49",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [50],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(72)->
    #objectCfg {
    id = 72,
    name = "港口竞速里程碑50",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [51],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(73)->
    #objectCfg {
    id = 73,
    name = "港口竞速里程碑51",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [52],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(74)->
    #objectCfg {
    id = 74,
    name = "港口竞速里程碑52",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [53],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(75)->
    #objectCfg {
    id = 75,
    name = "港口竞速里程碑53",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [54],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(76)->
    #objectCfg {
    id = 76,
    name = "港口竞速里程碑54",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [55],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(77)->
    #objectCfg {
    id = 77,
    name = "港口竞速里程碑55",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [56],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(78)->
    #objectCfg {
    id = 78,
    name = "港口竞速里程碑56",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [57],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(79)->
    #objectCfg {
    id = 79,
    name = "港口竞速里程碑57",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [58],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(80)->
    #objectCfg {
    id = 80,
    name = "港口竞速里程碑58",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [59],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(81)->
    #objectCfg {
    id = 81,
    name = "港口竞速里程碑59",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [60],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(82)->
    #objectCfg {
    id = 82,
    name = "港口竞速里程碑60",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [61],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(83)->
    #objectCfg {
    id = 83,
    name = "港口竞速里程碑61",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [62],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(84)->
    #objectCfg {
    id = 84,
    name = "港口竞速里程碑62",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [63],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(85)->
    #objectCfg {
    id = 85,
    name = "港口竞速里程碑63",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [64],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(86)->
    #objectCfg {
    id = 86,
    name = "港口竞速里程碑64",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [65],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(87)->
    #objectCfg {
    id = 87,
    name = "港口竞速里程碑65",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [66],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(88)->
    #objectCfg {
    id = 88,
    name = "港口竞速里程碑66",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 1,
    param2 = [67],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(89)->
    #objectCfg {
    id = 89,
    name = "港口竞速加速带",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 2,
    param2 = [63012],
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(90)->
    #objectCfg {
    id = 90,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获得道具",
    collect_sfx = "1",
    param1 = 6,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(100)->
    #objectCfg {
    id = 100,
    name = "餐桌",
    type = 1,
    animation = "sc_object_zhuozi_01",
    animation2 = "",
    icon = 316,
    collect_time = 3000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "1",
    collect_sfx = "",
    param1 = 1,
    freshCD = 0,
    gather_Times = 0,
    dropid = 0
    };
getRow(101)->
    #objectCfg {
    id = 101,
    name = "御敌警钟",
    type = 1,
    animation = "sc_object_sjz_01",
    animation2 = "",
    icon = 316,
    collect_time = 3000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "1",
    collect_sfx = "",
    param1 = 1,
    freshCD = 0,
    gather_Times = 0,
    dropid = 0
    };
getRow(102)->
    #objectCfg {
    id = 102,
    name = "兽灵精华",
    type = 1,
    animation = "sc_object_shuij_01",
    animation2 = "",
    icon = 316,
    collect_time = 3000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "1",
    collect_sfx = "",
    param1 = 1,
    freshCD = 0,
    gather_Times = 0,
    dropid = 0
    };
getRow(103)->
    #objectCfg {
    id = 103,
    name = "沙土",
    type = 1,
    animation = "sc_object_gsp_02",
    animation2 = "",
    icon = 316,
    collect_time = 3000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "1",
    collect_sfx = "",
    param1 = 1,
    freshCD = 0,
    gather_Times = 0,
    dropid = 0
    };
getRow(1000)->
    #objectCfg {
    id = 1000,
    name = "守护女神-攻加",
    type = 16,
    animation = "sc_object_dcr_02",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获取测试BUFF1",
    collect_sfx = "youxia/vfx_3_99",
    param1 = 401,
    freshCD = 0,
    gather_Times = 1,
    dropid = 0
    };
getRow(1001)->
    #objectCfg {
    id = 1001,
    name = "守护女神-防加",
    type = 16,
    animation = "sc_object_dcr_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获取测试BUFF2",
    collect_sfx = "youxia/vfx_3_99",
    param1 = 402,
    freshCD = 0,
    gather_Times = 1,
    dropid = 0
    };
getRow(1002)->
    #objectCfg {
    id = 1002,
    name = "守护女神-暴击",
    type = 16,
    animation = "sc_object_dcr_03",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获取测试BUFF1",
    collect_sfx = "youxia/vfx_3_99",
    param1 = 403,
    freshCD = 0,
    gather_Times = 1,
    dropid = 0
    };
getRow(1003)->
    #objectCfg {
    id = 1003,
    name = "守护女神-回血",
    type = 16,
    animation = "sc_object_shengdanshu_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 1,
    hold_time = 0,
    collect_string = "获取测试BUFF2",
    collect_sfx = "youxia/vfx_3_99",
    param1 = 404,
    freshCD = 0,
    gather_Times = 1,
    dropid = 0
    };
getRow(8003)->
    #objectCfg {
    id = 8003,
    name = "加速buff",
    type = 16,
    animation = "sc_object_sj_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "获得加速buff",
    collect_sfx = "youxia/vfx_3_99",
    param1 = 40108,
    freshCD = 0,
    gather_Times = 1,
    dropid = 0
    };
getRow(8004)->
    #objectCfg {
    id = 8004,
    name = "治疗buff",
    type = 16,
    animation = "sc_object_sj_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "获得加速buff",
    collect_sfx = "youxia/vfx_3_99",
    param1 = 404,
    freshCD = 0,
    gather_Times = 1,
    dropid = 0
    };
getRow(8005)->
    #objectCfg {
    id = 8005,
    name = "治疗buff",
    type = 16,
    animation = "sc_object_sj_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "获得加速buff",
    collect_sfx = "youxia/vfx_3_99",
    param1 = 404,
    freshCD = 0,
    gather_Times = 1,
    dropid = 0
    };
getRow(8006)->
    #objectCfg {
    id = 8006,
    name = "治疗buff",
    type = 16,
    animation = "sc_object_sj_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "获得加速buff",
    collect_sfx = "youxia/vfx_3_99",
    param1 = 404,
    freshCD = 0,
    gather_Times = 1,
    dropid = 0
    };
getRow(8007)->
    #objectCfg {
    id = 8007,
    name = "武器架",
    type = 1,
    animation = "sc_object_wuqijia",
    animation2 = "",
    icon = 316,
    collect_time = 1000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "挑选武器",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9000)->
    #objectCfg {
    id = 9000,
    name = "开门钥匙",
    type = 1,
    animation = "sc_object_shuij_03",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "收集钥匙中",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 0,
    gather_Times = 0,
    dropid = 0
    };
getRow(9001)->
    #objectCfg {
    id = 9001,
    name = "开门钥匙",
    type = 1,
    animation = "sc_object_shuij_03",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "收集钥匙中",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 0,
    gather_Times = 0,
    dropid = 0
    };
getRow(9002)->
    #objectCfg {
    id = 9002,
    name = "兽灵精华",
    type = 1,
    animation = "sc_object_shuij_01",
    animation2 = "",
    icon = 316,
    collect_time = 0,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "收集兽灵精华",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 0,
    gather_Times = 1,
    dropid = 501000
    };
getRow(9003)->
    #objectCfg {
    id = 9003,
    name = "大炮",
    type = 2,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "来点新鲜的？",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9004)->
    #objectCfg {
    id = 9004,
    name = "摇动的植物",
    type = 1,
    animation = "sc_object_yg_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "摇动的花丛",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9005)->
    #objectCfg {
    id = 9005,
    name = "告示牌",
    type = 1,
    animation = "sc_object_gsp_02",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "告示牌任务",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9006)->
    #objectCfg {
    id = 9006,
    name = "蓝血草",
    type = 1,
    animation = "sc_object_cc_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "告示牌任务",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9007)->
    #objectCfg {
    id = 9007,
    name = "箱子",
    type = 1,
    animation = "sc_object_bx_02",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "伪造情书3",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9008)->
    #objectCfg {
    id = 9008,
    name = "赤龙果",
    type = 1,
    animation = "sc_object_yg_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "冷漠学者",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9009)->
    #objectCfg {
    id = 9009,
    name = "苍空之塔武器架",
    type = 1,
    animation = "sc_object_wuqijia",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "冷漠学者",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9010)->
    #objectCfg {
    id = 9010,
    name = "平原农具",
    type = 1,
    animation = "sc_object_nongju",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "冷漠学者",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9011)->
    #objectCfg {
    id = 9011,
    name = "魔法器",
    type = 1,
    animation = "sc_object_mogu_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "魔法器",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9012)->
    #objectCfg {
    id = 9012,
    name = "红木",
    type = 1,
    animation = "sc_object_bx_02",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "收集红木",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9013)->
    #objectCfg {
    id = 9013,
    name = "项链",
    type = 1,
    animation = "sc_object_bx_02",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "丢失的项链",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9014)->
    #objectCfg {
    id = 9014,
    name = "红梅",
    type = 1,
    animation = "sc_object_yg_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "采集红梅",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9015)->
    #objectCfg {
    id = 9015,
    name = "橄榄",
    type = 1,
    animation = "sc_object_cc_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "采集橄榄",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9016)->
    #objectCfg {
    id = 9016,
    name = "蓝血草",
    type = 1,
    animation = "sc_object_cc_02",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "采集蓝血草",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9017)->
    #objectCfg {
    id = 9017,
    name = "薄荷草",
    type = 1,
    animation = "sc_object_cc_03",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "采集薄荷草",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9018)->
    #objectCfg {
    id = 9018,
    name = "鳞片",
    type = 1,
    animation = "sc_object_bx_02",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "采集鳞片",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9019)->
    #objectCfg {
    id = 9019,
    name = "生命之石",
    type = 1,
    animation = "sc_object_bx_03",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "采集生命之石",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9020)->
    #objectCfg {
    id = 9020,
    name = "火龙果",
    type = 1,
    animation = "sc_object_yg_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "采集火龙果实",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9021)->
    #objectCfg {
    id = 9021,
    name = "伏特加",
    type = 1,
    animation = "sc_object_mt_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "采集伏加特",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9022)->
    #objectCfg {
    id = 9022,
    name = "宝箱",
    type = 1,
    animation = "sc_object_bx_03",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "采集木箱",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9023)->
    #objectCfg {
    id = 9023,
    name = "告示栏",
    type = 1,
    animation = "sc_object_gsp_02",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "阅读内容",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9024)->
    #objectCfg {
    id = 9024,
    name = "泰罗果",
    type = 1,
    animation = "sc_object_yg_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "采集泰罗果",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9025)->
    #objectCfg {
    id = 9025,
    name = "冰焰草",
    type = 1,
    animation = "sc_object_cc_03",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "采集冰焰草",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9026)->
    #objectCfg {
    id = 9026,
    name = "蓝血草",
    type = 1,
    animation = "sc_object_cc_02",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "采集蓝血草",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9100)->
    #objectCfg {
    id = 9100,
    name = "兽灵精华",
    type = 1,
    animation = "sc_object_shuij_01",
    animation2 = "",
    icon = 316,
    collect_time = 1500,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "采集兽灵精华",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 0,
    gather_Times = 0,
    dropid = 0
    };
getRow(9101)->
    #objectCfg {
    id = 9101,
    name = "伊凡的宝箱",
    type = 1,
    animation = "sc_object_bx_03",
    animation2 = "",
    icon = 316,
    collect_time = 1500,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "采集宝箱",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 0,
    gather_Times = 0,
    dropid = 0
    };
getRow(9102)->
    #objectCfg {
    id = 9102,
    name = "“灵踪”的解药",
    type = 1,
    animation = "sc_object_sjq_01",
    animation2 = "",
    icon = 316,
    collect_time = 1500,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "收集解药",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9103)->
    #objectCfg {
    id = 9103,
    name = "伊凡的宝箱",
    type = 1,
    animation = "sc_object_bx_03",
    animation2 = "",
    icon = 316,
    collect_time = 1500,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "收集宝箱里的精华",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(10001)->
    #objectCfg {
    id = 10001,
    name = "安娜家附近的宝箱",
    type = 2,
    animation = "sc_object_bx_03",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "调查任务使用",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 3,
    gather_Times = 0,
    dropid = 0
    };
getRow(10002)->
    #objectCfg {
    id = 10002,
    name = "安娜家附近的宝箱",
    type = 1,
    animation = "sc_object_bx_03",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "调查任务使用",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 3,
    gather_Times = 0,
    dropid = 0
    };
getRow(10003)->
    #objectCfg {
    id = 10003,
    name = "物资箱",
    type = 1,
    animation = "sc_object_bx_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "收集散落的物资",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 3,
    gather_Times = 0,
    dropid = 0
    };
getRow(10004)->
    #objectCfg {
    id = 10004,
    name = "遗失的书籍",
    type = 1,
    animation = "sc_object_sj_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "查看魔法印记",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 3,
    gather_Times = 0,
    dropid = 0
    };
getRow(10005)->
    #objectCfg {
    id = 10005,
    name = "黑暗之源",
    type = 2,
    animation = "sc_object_sjq_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "驱散黑暗",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 3,
    gather_Times = 0,
    dropid = 0
    };
getRow(10006)->
    #objectCfg {
    id = 10006,
    name = "魔力装置",
    type = 2,
    animation = "sc_object_sjq_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "查看魔力装置",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 3,
    gather_Times = 0,
    dropid = 0
    };
getRow(10007)->
    #objectCfg {
    id = 10007,
    name = "蓝水晶",
    type = 2,
    animation = "sc_object_shuij_03",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "采集鳞片",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 3,
    gather_Times = 0,
    dropid = 0
    };
getRow(10008)->
    #objectCfg {
    id = 10008,
    name = "麦迪的水晶",
    type = 2,
    animation = "sc_object_sjq_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "拾取麦迪的水晶球",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 3,
    gather_Times = 0,
    dropid = 0
    };
getRow(10009)->
    #objectCfg {
    id = 10009,
    name = "魔法石柱",
    type = 1,
    animation = "sc_object_sjz_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "熔炼魔力水晶",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 3,
    gather_Times = 0,
    dropid = 0
    };
getRow(10010)->
    #objectCfg {
    id = 10010,
    name = "魔族的踪迹",
    type = 1,
    animation = "sc_object_cc_04",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "发现魔族的消息",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 3,
    gather_Times = 0,
    dropid = 0
    };
getRow(10011)->
    #objectCfg {
    id = 10011,
    name = "特殊的野果",
    type = 1,
    animation = "sc_object_yg_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "采集野果",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 3,
    gather_Times = 0,
    dropid = 0
    };
getRow(10012)->
    #objectCfg {
    id = 10012,
    name = "精灵旗帜",
    type = 2,
    animation = "sc_object_qzwz_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "观察情况",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 3,
    gather_Times = 0,
    dropid = 0
    };
getRow(10013)->
    #objectCfg {
    id = 10013,
    name = "残缺的精灵石",
    type = 1,
    animation = "sc_object_shuij_02",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "收集精灵石",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 3,
    gather_Times = 0,
    dropid = 0
    };
getRow(10014)->
    #objectCfg {
    id = 10014,
    name = "麦迪的印记",
    type = 1,
    animation = "sc_object_sjq_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "获得麦迪的印记",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 3,
    gather_Times = 0,
    dropid = 0
    };
getRow(10015)->
    #objectCfg {
    id = 10015,
    name = "女王的印记",
    type = 1,
    animation = "sc_object_sjq_01",
    animation2 = "",
    icon = 316,
    collect_time = 2000,
    collect_mode = 0,
    hold_time = 2000,
    collect_string = "获得女王的印记",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 3,
    gather_Times = 0,
    dropid = 0
    };
getRow(11000)->
    #objectCfg {
    id = 11000,
    name = "火龙晶（大）",
    type = 15,
    animation = "sc_object_baoshi_01",
    animation2 = "",
    icon = 316,
    collect_time = 15000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "火龙晶占领中",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 10,
    gather_Times = 0,
    dropid = 0
    };
getRow(11001)->
    #objectCfg {
    id = 11001,
    name = "黄色矿藏（小）",
    type = 15,
    animation = "sc_object_kuangshi_01",
    animation2 = "",
    icon = 316,
    collect_time = 10000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "矿藏占领中",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 10,
    gather_Times = 0,
    dropid = 0
    };
getRow(11002)->
    #objectCfg {
    id = 11002,
    name = "黄色矿藏（小）",
    type = 15,
    animation = "sc_object_kuangshi_01",
    animation2 = "",
    icon = 316,
    collect_time = 10000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "矿藏占领中",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 10,
    gather_Times = 0,
    dropid = 0
    };
getRow(11003)->
    #objectCfg {
    id = 11003,
    name = "散落蓝水晶",
    type = 15,
    animation = "sc_object_shuij_01",
    animation2 = "",
    icon = 316,
    collect_time = 3000,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "散落蓝水晶采集中",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 10,
    gather_Times = 1,
    dropid = 0
    };
getRow(11004)->
    #objectCfg {
    id = 11004,
    name = "雪块儿",
    type = 13,
    animation = "sc_object_xuedui_01",
    animation2 = "",
    icon = 316,
    collect_time = 1500,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "采集雪块儿",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 6,
    gather_Times = 1,
    dropid = 0
    };
getRow(11005)->
    #objectCfg {
    id = 11005,
    name = "雪块儿",
    type = 13,
    animation = "sc_object_xuedui_01",
    animation2 = "",
    icon = 316,
    collect_time = 1500,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "采集雪块儿",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 6,
    gather_Times = 1,
    dropid = 0
    };
getRow(11006)->
    #objectCfg {
    id = 11006,
    name = "煤球儿",
    type = 13,
    animation = "sc_object_meiqiu_01",
    animation2 = "",
    icon = 316,
    collect_time = 1500,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "采集堆雪人所用的煤球儿",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 6,
    gather_Times = 1,
    dropid = 0
    };
getRow(11007)->
    #objectCfg {
    id = 11007,
    name = "圣诞帽",
    type = 13,
    animation = "sc_object_shengdanshu_01",
    animation2 = "",
    icon = 316,
    collect_time = 1500,
    collect_mode = 0,
    hold_time = 0,
    collect_string = "摘下圣诞帽",
    collect_sfx = "1",
    param1 = 0,
    freshCD = 10,
    gather_Times = 3,
    dropid = 0
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
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
    {30},
    {31},
    {32},
    {33},
    {34},
    {35},
    {36},
    {37},
    {38},
    {39},
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
    {54},
    {55},
    {56},
    {57},
    {58},
    {59},
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
    {100},
    {101},
    {102},
    {103},
    {1000},
    {1001},
    {1002},
    {1003},
    {8003},
    {8004},
    {8005},
    {8006},
    {8007},
    {9000},
    {9001},
    {9002},
    {9003},
    {9004},
    {9005},
    {9006},
    {9007},
    {9008},
    {9009},
    {9010},
    {9011},
    {9012},
    {9013},
    {9014},
    {9015},
    {9016},
    {9017},
    {9018},
    {9019},
    {9020},
    {9021},
    {9022},
    {9023},
    {9024},
    {9025},
    {9026},
    {9100},
    {9101},
    {9102},
    {9103},
    {10001},
    {10002},
    {10003},
    {10004},
    {10005},
    {10006},
    {10007},
    {10008},
    {10009},
    {10010},
    {10011},
    {10012},
    {10013},
    {10014},
    {10015},
    {11000},
    {11001},
    {11002},
    {11003},
    {11004},
    {11005},
    {11006},
    {11007}
    ].

get1KeyList()->[
    1,
    2,
    3,
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
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
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
    54,
    55,
    56,
    57,
    58,
    59,
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
    100,
    101,
    102,
    103,
    1000,
    1001,
    1002,
    1003,
    8003,
    8004,
    8005,
    8006,
    8007,
    9000,
    9001,
    9002,
    9003,
    9004,
    9005,
    9006,
    9007,
    9008,
    9009,
    9010,
    9011,
    9012,
    9013,
    9014,
    9015,
    9016,
    9017,
    9018,
    9019,
    9020,
    9021,
    9022,
    9023,
    9024,
    9025,
    9026,
    9100,
    9101,
    9102,
    9103,
    10001,
    10002,
    10003,
    10004,
    10005,
    10006,
    10007,
    10008,
    10009,
    10010,
    10011,
    10012,
    10013,
    10014,
    10015,
    11000,
    11001,
    11002,
    11003,
    11004,
    11005,
    11006,
    11007
    ].

