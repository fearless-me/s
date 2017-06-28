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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "收集未知的液体",
    collect_sfx = 1,
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
    hold_time = 2000,
    collect_string = "投掷香草",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "搬运食物",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "搜索四周",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "收集毒蘑菇",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "采集无光蘑菇",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "采集寒霜草",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "拾取魔族遗憾",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "找到七彩皮球",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "拾取神秘水晶球",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "点燃魔法信标",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "采集寒星水晶草",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "放上漂浮之石",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "采集草药",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "提取神秘的脚印",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "救治受伤士兵",
    collect_sfx = 1,
    param1 = 0,
    freshCD = 0,
    gather_Times = 0,
    dropid = 0
    };
getRow(21)->
    #objectCfg {
    id = 21,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 1,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(22)->
    #objectCfg {
    id = 22,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 2,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(23)->
    #objectCfg {
    id = 23,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 3,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(24)->
    #objectCfg {
    id = 24,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 4,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(25)->
    #objectCfg {
    id = 25,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 5,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(26)->
    #objectCfg {
    id = 26,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 6,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(27)->
    #objectCfg {
    id = 27,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 7,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(28)->
    #objectCfg {
    id = 28,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 8,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(29)->
    #objectCfg {
    id = 29,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 9,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(30)->
    #objectCfg {
    id = 30,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 10,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(31)->
    #objectCfg {
    id = 31,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 11,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(32)->
    #objectCfg {
    id = 32,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 12,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(33)->
    #objectCfg {
    id = 33,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 13,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(34)->
    #objectCfg {
    id = 34,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 14,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(35)->
    #objectCfg {
    id = 35,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 15,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(36)->
    #objectCfg {
    id = 36,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 16,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(37)->
    #objectCfg {
    id = 37,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 17,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(38)->
    #objectCfg {
    id = 38,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 18,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(39)->
    #objectCfg {
    id = 39,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 19,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(40)->
    #objectCfg {
    id = 40,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 20,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(41)->
    #objectCfg {
    id = 41,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 21,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(42)->
    #objectCfg {
    id = 42,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 22,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(43)->
    #objectCfg {
    id = 43,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 23,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(44)->
    #objectCfg {
    id = 44,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 24,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(45)->
    #objectCfg {
    id = 45,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 25,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(46)->
    #objectCfg {
    id = 46,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 26,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(47)->
    #objectCfg {
    id = 47,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 27,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(48)->
    #objectCfg {
    id = 48,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 28,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(49)->
    #objectCfg {
    id = 49,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 29,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(50)->
    #objectCfg {
    id = 50,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 30,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(51)->
    #objectCfg {
    id = 51,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 31,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(52)->
    #objectCfg {
    id = 52,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 32,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(53)->
    #objectCfg {
    id = 53,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 33,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(54)->
    #objectCfg {
    id = 54,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 34,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(55)->
    #objectCfg {
    id = 55,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 35,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(56)->
    #objectCfg {
    id = 56,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 36,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(57)->
    #objectCfg {
    id = 57,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 37,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(58)->
    #objectCfg {
    id = 58,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 38,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(59)->
    #objectCfg {
    id = 59,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 39,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(60)->
    #objectCfg {
    id = 60,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 40,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(61)->
    #objectCfg {
    id = 61,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 41,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(62)->
    #objectCfg {
    id = 62,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 42,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(63)->
    #objectCfg {
    id = 63,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 43,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(64)->
    #objectCfg {
    id = 64,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 44,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(65)->
    #objectCfg {
    id = 65,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 45,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(66)->
    #objectCfg {
    id = 66,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 46,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(67)->
    #objectCfg {
    id = 67,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 47,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(68)->
    #objectCfg {
    id = 68,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 48,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(69)->
    #objectCfg {
    id = 69,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 49,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(70)->
    #objectCfg {
    id = 70,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 50,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(71)->
    #objectCfg {
    id = 71,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 51,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(72)->
    #objectCfg {
    id = 72,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 52,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(73)->
    #objectCfg {
    id = 73,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 53,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(74)->
    #objectCfg {
    id = 74,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 54,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(75)->
    #objectCfg {
    id = 75,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 55,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(76)->
    #objectCfg {
    id = 76,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 56,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(77)->
    #objectCfg {
    id = 77,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 57,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(78)->
    #objectCfg {
    id = 78,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 58,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(79)->
    #objectCfg {
    id = 79,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 59,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(80)->
    #objectCfg {
    id = 80,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 60,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(81)->
    #objectCfg {
    id = 81,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 61,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(82)->
    #objectCfg {
    id = 82,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 62,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(83)->
    #objectCfg {
    id = 83,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 63,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(84)->
    #objectCfg {
    id = 84,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 64,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(85)->
    #objectCfg {
    id = 85,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 65,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(86)->
    #objectCfg {
    id = 86,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 66,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(87)->
    #objectCfg {
    id = 87,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 67,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(88)->
    #objectCfg {
    id = 88,
    name = "港口竞速道具箱",
    type = 12,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "点燃魔法产物",
    collect_sfx = 1,
    param1 = 68,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(1000)->
    #objectCfg {
    id = 1000,
    name = "昼夜系统测试采集物（白天）",
    type = 1,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "昼夜系统测试采集物（白天）",
    collect_sfx = 1,
    param1 = 0,
    freshCD = 3,
    gather_Times = 0,
    dropid = 0
    };
getRow(1001)->
    #objectCfg {
    id = 1001,
    name = "昼夜系统测试采集物（晚上）",
    type = 1,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "昼夜系统测试采集物（晚上）",
    collect_sfx = 1,
    param1 = 0,
    freshCD = 3,
    gather_Times = 0,
    dropid = 0
    };
getRow(9000)->
    #objectCfg {
    id = 9000,
    name = "鱼干",
    type = 1,
    animation = "sc_object_bx_02",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "尝尝小鱼干",
    collect_sfx = 1,
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9001)->
    #objectCfg {
    id = 9001,
    name = "带着粘液的植物",
    type = 1,
    animation = "sc_object_yg_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "调查粘液",
    collect_sfx = 1,
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9002)->
    #objectCfg {
    id = 9002,
    name = "木桶",
    type = 1,
    animation = "sc_object_mt_02",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "追踪痕迹",
    collect_sfx = 1,
    param1 = 0,
    freshCD = 2,
    gather_Times = 0,
    dropid = 0
    };
getRow(9003)->
    #objectCfg {
    id = 9003,
    name = "大炮",
    type = 2,
    animation = "sc_object_mt_01",
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "来点新鲜的？",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "摇动的花丛",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "告示牌任务",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "告示牌任务",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "伪造情书3",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "冷漠学者",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "冷漠学者",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "冷漠学者",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "魔法器",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "收集红木",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "丢失的项链",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "采集红梅",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "采集橄榄",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "采集蓝血草",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "采集薄荷草",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "采集鳞片",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "采集生命之石",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "采集火龙果实",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "采集伏加特",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "采集木箱",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "阅读内容",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "采集泰罗果",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "采集冰焰草",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 0,
    collect_string = "采集蓝血草",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "调查任务使用",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "调查任务使用",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "收集散落的物资",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "查看魔法印记",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "驱散黑暗",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "查看魔力装置",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "采集鳞片",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "拾取麦迪的水晶球",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "熔炼魔力水晶",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "发现魔族的消息",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "采集野果",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "观察情况",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "收集精灵石",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "获得麦迪的印记",
    collect_sfx = 1,
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
    animation2 = "0",
    icon = 316,
    collect_time = 2000,
    hold_time = 2000,
    collect_string = "获得女王的印记",
    collect_sfx = 1,
    param1 = 0,
    freshCD = 3,
    gather_Times = 0,
    dropid = 0
    };
getRow(11000)->
    #objectCfg {
    id = 11000,
    name = "中心大水晶",
    type = 15,
    animation = "sc_object_baoshi_01",
    animation2 = "0",
    icon = 316,
    collect_time = 5000,
    hold_time = 0,
    collect_string = "火龙晶占领中",
    collect_sfx = 1,
    param1 = 0,
    freshCD = 10,
    gather_Times = 0,
    dropid = 0
    };
getRow(11001)->
    #objectCfg {
    id = 11001,
    name = "红方小矿石",
    type = 15,
    animation = "sc_object_kuangshi_01",
    animation2 = "0",
    icon = 316,
    collect_time = 5000,
    hold_time = 0,
    collect_string = "矿藏采集中",
    collect_sfx = 1,
    param1 = 0,
    freshCD = 10,
    gather_Times = 0,
    dropid = 0
    };
getRow(11002)->
    #objectCfg {
    id = 11002,
    name = "蓝方小矿石",
    type = 15,
    animation = "sc_object_kuangshi_01",
    animation2 = "0",
    icon = 316,
    collect_time = 5000,
    hold_time = 0,
    collect_string = "矿藏采集中",
    collect_sfx = 1,
    param1 = 0,
    freshCD = 10,
    gather_Times = 0,
    dropid = 0
    };
getRow(11003)->
    #objectCfg {
    id = 11003,
    name = "散落小水晶",
    type = 15,
    animation = "sc_object_shuij_01",
    animation2 = "0",
    icon = 316,
    collect_time = 5000,
    hold_time = 2000,
    collect_string = "散落小水晶采集中",
    collect_sfx = 1,
    param1 = 1,
    freshCD = 1,
    gather_Times = 1,
    dropid = 0
    };
getRow(11004)->
    #objectCfg {
    id = 11004,
    name = "雪块儿",
    type = 13,
    animation = "sc_object_xuedui_01",
    animation2 = "0",
    icon = 316,
    collect_time = 1500,
    hold_time = 0,
    collect_string = "采集堆雪人所用的雪块儿",
    collect_sfx = 1,
    param1 = 0,
    freshCD = 3,
    gather_Times = 1,
    dropid = 0
    };
getRow(11005)->
    #objectCfg {
    id = 11005,
    name = "雪块儿",
    type = 13,
    animation = "sc_object_xuedui_01",
    animation2 = "0",
    icon = 316,
    collect_time = 1500,
    hold_time = 0,
    collect_string = "采集堆雪人所用的雪块儿",
    collect_sfx = 1,
    param1 = 0,
    freshCD = 3,
    gather_Times = 1,
    dropid = 0
    };
getRow(11006)->
    #objectCfg {
    id = 11006,
    name = "煤球儿",
    type = 13,
    animation = "sc_object_meiqiu_01",
    animation2 = "0",
    icon = 316,
    collect_time = 1500,
    hold_time = 0,
    collect_string = "采集堆雪人所用的煤球儿",
    collect_sfx = 1,
    param1 = 0,
    freshCD = 3,
    gather_Times = 1,
    dropid = 0
    };
getRow(11007)->
    #objectCfg {
    id = 11007,
    name = "圣诞帽",
    type = 13,
    animation = "sc_object_shengdanshu_01",
    animation2 = "0",
    icon = 316,
    collect_time = 1500,
    hold_time = 0,
    collect_string = "采集堆雪人所用的圣诞帽",
    collect_sfx = 1,
    param1 = 0,
    freshCD = 3,
    gather_Times = 1,
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
    {1000},
    {1001},
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
    1000,
    1001,
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

