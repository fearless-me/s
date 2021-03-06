%% coding: latin-1
%%: 实现
-module(cfg_rune_chs).
-compile(export_all).
-include("cfg_rune.hrl").
-include("logger.hrl").

getRow(100000)->
    #runeCfg {
    iD = 100000,
    name = "测试角色符文1",
    type = 0,
    subtype = 0,
    quality = 5,
    stage = 1,
    equipLevel = 30,
    icon = 9019,
    based_property_group_id = 1,
    random_property_group_id = 1,
    min_num = 4,
    max_num = 6,
    property_suite_id = 100000,
    level_up_group_id = 2,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.5,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(100001)->
    #runeCfg {
    iD = 100001,
    name = "测试角色符文2",
    type = 0,
    subtype = 1,
    quality = 4,
    stage = 1,
    equipLevel = 30,
    icon = 9025,
    based_property_group_id = 1,
    random_property_group_id = 1,
    min_num = 4,
    max_num = 6,
    property_suite_id = 100000,
    level_up_group_id = 2,
    exp_group_id = 1,
    smeltcost = 2,
    need_equipit = 0,
    battlepower_add = 1.5,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(100002)->
    #runeCfg {
    iD = 100002,
    name = "测试角色符文3",
    type = 0,
    subtype = 2,
    quality = 3,
    stage = 1,
    equipLevel = 30,
    icon = 9028,
    based_property_group_id = 1,
    random_property_group_id = 1,
    min_num = 3,
    max_num = 5,
    property_suite_id = 100000,
    level_up_group_id = 1,
    exp_group_id = 1,
    smeltcost = 3,
    need_equipit = 0,
    battlepower_add = 1.4,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(100003)->
    #runeCfg {
    iD = 100003,
    name = "测试角色符文4",
    type = 0,
    subtype = 3,
    quality = 2,
    stage = 1,
    equipLevel = 30,
    icon = 9022,
    based_property_group_id = 1,
    random_property_group_id = 1,
    min_num = 2,
    max_num = 4,
    property_suite_id = 100000,
    level_up_group_id = 1,
    exp_group_id = 1,
    smeltcost = 4,
    need_equipit = 0,
    battlepower_add = 1.3,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(100004)->
    #runeCfg {
    iD = 100004,
    name = "测试角色符文5",
    type = 0,
    subtype = 4,
    quality = 1,
    stage = 1,
    equipLevel = 30,
    icon = 9030,
    based_property_group_id = 1,
    random_property_group_id = 1,
    min_num = 1,
    max_num = 3,
    property_suite_id = 100000,
    level_up_group_id = 1,
    exp_group_id = 1,
    smeltcost = 5,
    need_equipit = 0,
    battlepower_add = 1.2,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(100005)->
    #runeCfg {
    iD = 100005,
    name = "测试角色符文6",
    type = 0,
    subtype = 5,
    quality = 0,
    stage = 1,
    equipLevel = 30,
    icon = 9030,
    based_property_group_id = 1,
    random_property_group_id = 1,
    min_num = 0,
    max_num = 2,
    property_suite_id = 100000,
    level_up_group_id = 1,
    exp_group_id = 1,
    smeltcost = 6,
    need_equipit = 0,
    battlepower_add = 1.1,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(100006)->
    #runeCfg {
    iD = 100006,
    name = "测试骑宠符文1",
    type = 1,
    subtype = 0,
    quality = 0,
    stage = 1,
    equipLevel = 30,
    icon = 9033,
    based_property_group_id = 1,
    random_property_group_id = 1,
    min_num = 0,
    max_num = 2,
    property_suite_id = 100000,
    level_up_group_id = 1,
    exp_group_id = 1,
    smeltcost = 7,
    need_equipit = 0,
    battlepower_add = 1,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(100007)->
    #runeCfg {
    iD = 100007,
    name = "测试骑宠符文2",
    type = 1,
    subtype = 1,
    quality = 1,
    stage = 1,
    equipLevel = 30,
    icon = 9039,
    based_property_group_id = 1,
    random_property_group_id = 1,
    min_num = 1,
    max_num = 3,
    property_suite_id = 100000,
    level_up_group_id = 1,
    exp_group_id = 1,
    smeltcost = 8,
    need_equipit = 0,
    battlepower_add = 1.1,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(100008)->
    #runeCfg {
    iD = 100008,
    name = "测试骑宠符文3",
    type = 1,
    subtype = 2,
    quality = 2,
    stage = 1,
    equipLevel = 30,
    icon = 9042,
    based_property_group_id = 1,
    random_property_group_id = 1,
    min_num = 2,
    max_num = 4,
    property_suite_id = 100000,
    level_up_group_id = 1,
    exp_group_id = 1,
    smeltcost = 9,
    need_equipit = 0,
    battlepower_add = 1.2,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(100009)->
    #runeCfg {
    iD = 100009,
    name = "测试骑宠符文4",
    type = 1,
    subtype = 3,
    quality = 4,
    stage = 1,
    equipLevel = 30,
    icon = 9036,
    based_property_group_id = 1,
    random_property_group_id = 1,
    min_num = 3,
    max_num = 5,
    property_suite_id = 100000,
    level_up_group_id = 2,
    exp_group_id = 1,
    smeltcost = 10,
    need_equipit = 0,
    battlepower_add = 1.4,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(100010)->
    #runeCfg {
    iD = 100010,
    name = "测试骑宠符文5",
    type = 1,
    subtype = 4,
    quality = 5,
    stage = 1,
    equipLevel = 30,
    icon = 9045,
    based_property_group_id = 1,
    random_property_group_id = 1,
    min_num = 3,
    max_num = 5,
    property_suite_id = 100000,
    level_up_group_id = 2,
    exp_group_id = 1,
    smeltcost = 11,
    need_equipit = 0,
    battlepower_add = 1.5,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101001)->
    #runeCfg {
    iD = 101001,
    name = "酋长符文",
    type = 0,
    subtype = 0,
    quality = 1,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 1,
    random_property_group_id = 1,
    min_num = 1,
    max_num = 2,
    property_suite_id = 0,
    level_up_group_id = 1,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.1,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101002)->
    #runeCfg {
    iD = 101002,
    name = "守护护符",
    type = 0,
    subtype = 1,
    quality = 1,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 6,
    random_property_group_id = 1,
    min_num = 2,
    max_num = 3,
    property_suite_id = 0,
    level_up_group_id = 2,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.1,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101003)->
    #runeCfg {
    iD = 101003,
    name = "光明符文",
    type = 0,
    subtype = 2,
    quality = 1,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 11,
    random_property_group_id = 1,
    min_num = 2,
    max_num = 5,
    property_suite_id = 0,
    level_up_group_id = 4,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.1,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101004)->
    #runeCfg {
    iD = 101004,
    name = "幻光之符",
    type = 0,
    subtype = 3,
    quality = 1,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 16,
    random_property_group_id = 1,
    min_num = 4,
    max_num = 6,
    property_suite_id = 0,
    level_up_group_id = 6,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.1,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101005)->
    #runeCfg {
    iD = 101005,
    name = "幻叶之纹",
    type = 0,
    subtype = 4,
    quality = 1,
    stage = 1,
    equipLevel = 1,
    icon = 6,
    based_property_group_id = 21,
    random_property_group_id = 1,
    min_num = 3,
    max_num = 6,
    property_suite_id = 0,
    level_up_group_id = 5,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.1,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101006)->
    #runeCfg {
    iD = 101006,
    name = "星光之纹",
    type = 0,
    subtype = 5,
    quality = 1,
    stage = 1,
    equipLevel = 1,
    icon = 2,
    based_property_group_id = 26,
    random_property_group_id = 1,
    min_num = 1,
    max_num = 2,
    property_suite_id = 0,
    level_up_group_id = 1,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.1,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101101)->
    #runeCfg {
    iD = 101101,
    name = "守护之符",
    type = 0,
    subtype = 0,
    quality = 2,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 2,
    random_property_group_id = 2,
    min_num = 1,
    max_num = 2,
    property_suite_id = 0,
    level_up_group_id = 1,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.2,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101102)->
    #runeCfg {
    iD = 101102,
    name = "磐石护符",
    type = 0,
    subtype = 1,
    quality = 2,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 7,
    random_property_group_id = 2,
    min_num = 2,
    max_num = 4,
    property_suite_id = 0,
    level_up_group_id = 3,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.2,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101103)->
    #runeCfg {
    iD = 101103,
    name = "火纹印记",
    type = 0,
    subtype = 2,
    quality = 2,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 12,
    random_property_group_id = 2,
    min_num = 2,
    max_num = 5,
    property_suite_id = 0,
    level_up_group_id = 4,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.2,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101104)->
    #runeCfg {
    iD = 101104,
    name = "嗜血之纹",
    type = 0,
    subtype = 3,
    quality = 2,
    stage = 1,
    equipLevel = 1,
    icon = 6,
    based_property_group_id = 17,
    random_property_group_id = 2,
    min_num = 1,
    max_num = 2,
    property_suite_id = 0,
    level_up_group_id = 1,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.2,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101105)->
    #runeCfg {
    iD = 101105,
    name = "春之护符",
    type = 0,
    subtype = 4,
    quality = 2,
    stage = 1,
    equipLevel = 1,
    icon = 6,
    based_property_group_id = 22,
    random_property_group_id = 2,
    min_num = 4,
    max_num = 6,
    property_suite_id = 0,
    level_up_group_id = 6,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.2,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101106)->
    #runeCfg {
    iD = 101106,
    name = "尊贵守护",
    type = 0,
    subtype = 5,
    quality = 2,
    stage = 1,
    equipLevel = 1,
    icon = 2,
    based_property_group_id = 27,
    random_property_group_id = 2,
    min_num = 1,
    max_num = 2,
    property_suite_id = 0,
    level_up_group_id = 1,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.2,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101201)->
    #runeCfg {
    iD = 101201,
    name = "冒险者之石",
    type = 0,
    subtype = 0,
    quality = 3,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 3,
    random_property_group_id = 3,
    min_num = 1,
    max_num = 2,
    property_suite_id = 0,
    level_up_group_id = 1,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.3,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101202)->
    #runeCfg {
    iD = 101202,
    name = "守护者符文",
    type = 0,
    subtype = 1,
    quality = 3,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 8,
    random_property_group_id = 3,
    min_num = 2,
    max_num = 4,
    property_suite_id = 0,
    level_up_group_id = 3,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.3,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101203)->
    #runeCfg {
    iD = 101203,
    name = "神光之符",
    type = 0,
    subtype = 2,
    quality = 3,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 13,
    random_property_group_id = 3,
    min_num = 3,
    max_num = 6,
    property_suite_id = 0,
    level_up_group_id = 5,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.3,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101204)->
    #runeCfg {
    iD = 101204,
    name = "巨神之力",
    type = 0,
    subtype = 3,
    quality = 3,
    stage = 1,
    equipLevel = 1,
    icon = 6,
    based_property_group_id = 18,
    random_property_group_id = 3,
    min_num = 2,
    max_num = 3,
    property_suite_id = 0,
    level_up_group_id = 2,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.3,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101205)->
    #runeCfg {
    iD = 101205,
    name = "暮色庇护",
    type = 0,
    subtype = 4,
    quality = 3,
    stage = 1,
    equipLevel = 1,
    icon = 2,
    based_property_group_id = 23,
    random_property_group_id = 3,
    min_num = 1,
    max_num = 2,
    property_suite_id = 0,
    level_up_group_id = 1,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.3,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101206)->
    #runeCfg {
    iD = 101206,
    name = "圣灵守护",
    type = 0,
    subtype = 5,
    quality = 3,
    stage = 1,
    equipLevel = 1,
    icon = 2,
    based_property_group_id = 28,
    random_property_group_id = 3,
    min_num = 2,
    max_num = 3,
    property_suite_id = 0,
    level_up_group_id = 2,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.3,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101301)->
    #runeCfg {
    iD = 101301,
    name = "天陨符文",
    type = 0,
    subtype = 0,
    quality = 4,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 4,
    random_property_group_id = 4,
    min_num = 2,
    max_num = 3,
    property_suite_id = 0,
    level_up_group_id = 2,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.4,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101302)->
    #runeCfg {
    iD = 101302,
    name = "星耀护符",
    type = 0,
    subtype = 1,
    quality = 4,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 9,
    random_property_group_id = 4,
    min_num = 2,
    max_num = 4,
    property_suite_id = 0,
    level_up_group_id = 3,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.4,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101303)->
    #runeCfg {
    iD = 101303,
    name = "圣贤之力",
    type = 0,
    subtype = 2,
    quality = 4,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 14,
    random_property_group_id = 4,
    min_num = 3,
    max_num = 6,
    property_suite_id = 0,
    level_up_group_id = 5,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.4,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101304)->
    #runeCfg {
    iD = 101304,
    name = "哀伤符文",
    type = 0,
    subtype = 3,
    quality = 4,
    stage = 1,
    equipLevel = 1,
    icon = 6,
    based_property_group_id = 19,
    random_property_group_id = 4,
    min_num = 2,
    max_num = 4,
    property_suite_id = 0,
    level_up_group_id = 3,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.4,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101305)->
    #runeCfg {
    iD = 101305,
    name = "月华之守",
    type = 0,
    subtype = 4,
    quality = 4,
    stage = 1,
    equipLevel = 1,
    icon = 2,
    based_property_group_id = 24,
    random_property_group_id = 4,
    min_num = 1,
    max_num = 2,
    property_suite_id = 0,
    level_up_group_id = 1,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.4,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101306)->
    #runeCfg {
    iD = 101306,
    name = "领主之证",
    type = 0,
    subtype = 5,
    quality = 4,
    stage = 1,
    equipLevel = 1,
    icon = 2,
    based_property_group_id = 29,
    random_property_group_id = 4,
    min_num = 2,
    max_num = 3,
    property_suite_id = 0,
    level_up_group_id = 2,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.4,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101401)->
    #runeCfg {
    iD = 101401,
    name = "银月精华",
    type = 0,
    subtype = 0,
    quality = 5,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 5,
    random_property_group_id = 5,
    min_num = 2,
    max_num = 3,
    property_suite_id = 0,
    level_up_group_id = 2,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.5,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101402)->
    #runeCfg {
    iD = 101402,
    name = "神威守护",
    type = 0,
    subtype = 1,
    quality = 5,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 10,
    random_property_group_id = 5,
    min_num = 2,
    max_num = 5,
    property_suite_id = 0,
    level_up_group_id = 4,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.5,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101403)->
    #runeCfg {
    iD = 101403,
    name = "烈焰潮汐",
    type = 0,
    subtype = 2,
    quality = 5,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 15,
    random_property_group_id = 5,
    min_num = 3,
    max_num = 6,
    property_suite_id = 0,
    level_up_group_id = 5,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.5,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101404)->
    #runeCfg {
    iD = 101404,
    name = "魔龙神力",
    type = 0,
    subtype = 3,
    quality = 5,
    stage = 1,
    equipLevel = 1,
    icon = 6,
    based_property_group_id = 20,
    random_property_group_id = 5,
    min_num = 2,
    max_num = 5,
    property_suite_id = 0,
    level_up_group_id = 4,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.5,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101405)->
    #runeCfg {
    iD = 101405,
    name = "月华之精",
    type = 0,
    subtype = 4,
    quality = 5,
    stage = 1,
    equipLevel = 1,
    icon = 2,
    based_property_group_id = 25,
    random_property_group_id = 5,
    min_num = 1,
    max_num = 2,
    property_suite_id = 0,
    level_up_group_id = 1,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.5,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(101406)->
    #runeCfg {
    iD = 101406,
    name = "露娜之吻",
    type = 0,
    subtype = 5,
    quality = 5,
    stage = 1,
    equipLevel = 1,
    icon = 2,
    based_property_group_id = 30,
    random_property_group_id = 5,
    min_num = 2,
    max_num = 3,
    property_suite_id = 0,
    level_up_group_id = 2,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.5,
    usefulLife = 0,
    inbind = 0,
    material_ui = [22,2]
    };
getRow(102001)->
    #runeCfg {
    iD = 102001,
    name = "飞天之纹",
    type = 0,
    subtype = 0,
    quality = 1,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 1,
    random_property_group_id = 1,
    min_num = 1,
    max_num = 2,
    property_suite_id = 0,
    level_up_group_id = 1,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.1,
    usefulLife = 0,
    inbind = 0
    };
getRow(102002)->
    #runeCfg {
    iD = 102002,
    name = "暗风之纹",
    type = 0,
    subtype = 1,
    quality = 1,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 6,
    random_property_group_id = 1,
    min_num = 2,
    max_num = 3,
    property_suite_id = 0,
    level_up_group_id = 2,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.1,
    usefulLife = 0,
    inbind = 0
    };
getRow(102003)->
    #runeCfg {
    iD = 102003,
    name = "寒冰护符",
    type = 0,
    subtype = 2,
    quality = 1,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 11,
    random_property_group_id = 1,
    min_num = 2,
    max_num = 5,
    property_suite_id = 0,
    level_up_group_id = 4,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.1,
    usefulLife = 0,
    inbind = 0
    };
getRow(102004)->
    #runeCfg {
    iD = 102004,
    name = "旅者之力",
    type = 0,
    subtype = 3,
    quality = 1,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 16,
    random_property_group_id = 1,
    min_num = 4,
    max_num = 6,
    property_suite_id = 0,
    level_up_group_id = 6,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.1,
    usefulLife = 0,
    inbind = 0
    };
getRow(102005)->
    #runeCfg {
    iD = 102005,
    name = "唤潮之灵",
    type = 0,
    subtype = 4,
    quality = 1,
    stage = 1,
    equipLevel = 1,
    icon = 6,
    based_property_group_id = 21,
    random_property_group_id = 1,
    min_num = 3,
    max_num = 6,
    property_suite_id = 0,
    level_up_group_id = 5,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.1,
    usefulLife = 0,
    inbind = 0
    };
getRow(102101)->
    #runeCfg {
    iD = 102101,
    name = "鲜血之纹",
    type = 0,
    subtype = 0,
    quality = 2,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 2,
    random_property_group_id = 2,
    min_num = 1,
    max_num = 2,
    property_suite_id = 0,
    level_up_group_id = 1,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.2,
    usefulLife = 0,
    inbind = 0
    };
getRow(102102)->
    #runeCfg {
    iD = 102102,
    name = "拯救印记",
    type = 0,
    subtype = 1,
    quality = 2,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 7,
    random_property_group_id = 2,
    min_num = 2,
    max_num = 4,
    property_suite_id = 0,
    level_up_group_id = 3,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.2,
    usefulLife = 0,
    inbind = 0
    };
getRow(102103)->
    #runeCfg {
    iD = 102103,
    name = "黑珍珠之纹",
    type = 0,
    subtype = 2,
    quality = 2,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 12,
    random_property_group_id = 2,
    min_num = 2,
    max_num = 5,
    property_suite_id = 0,
    level_up_group_id = 4,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.2,
    usefulLife = 0,
    inbind = 0
    };
getRow(102104)->
    #runeCfg {
    iD = 102104,
    name = "满月之纹",
    type = 0,
    subtype = 3,
    quality = 2,
    stage = 1,
    equipLevel = 1,
    icon = 6,
    based_property_group_id = 17,
    random_property_group_id = 2,
    min_num = 1,
    max_num = 2,
    property_suite_id = 0,
    level_up_group_id = 1,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.2,
    usefulLife = 0,
    inbind = 0
    };
getRow(102105)->
    #runeCfg {
    iD = 102105,
    name = "净化印记",
    type = 0,
    subtype = 4,
    quality = 2,
    stage = 1,
    equipLevel = 1,
    icon = 6,
    based_property_group_id = 22,
    random_property_group_id = 2,
    min_num = 4,
    max_num = 6,
    property_suite_id = 0,
    level_up_group_id = 6,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.2,
    usefulLife = 0,
    inbind = 0
    };
getRow(102201)->
    #runeCfg {
    iD = 102201,
    name = "护主之心",
    type = 0,
    subtype = 0,
    quality = 3,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 3,
    random_property_group_id = 3,
    min_num = 1,
    max_num = 2,
    property_suite_id = 0,
    level_up_group_id = 1,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.3,
    usefulLife = 0,
    inbind = 0
    };
getRow(102202)->
    #runeCfg {
    iD = 102202,
    name = "霜狼之纹",
    type = 0,
    subtype = 1,
    quality = 3,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 8,
    random_property_group_id = 3,
    min_num = 2,
    max_num = 4,
    property_suite_id = 0,
    level_up_group_id = 3,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.3,
    usefulLife = 0,
    inbind = 0
    };
getRow(102203)->
    #runeCfg {
    iD = 102203,
    name = "圣战之力",
    type = 0,
    subtype = 2,
    quality = 3,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 13,
    random_property_group_id = 3,
    min_num = 3,
    max_num = 6,
    property_suite_id = 0,
    level_up_group_id = 5,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.3,
    usefulLife = 0,
    inbind = 0
    };
getRow(102204)->
    #runeCfg {
    iD = 102204,
    name = "天蓝护符",
    type = 0,
    subtype = 3,
    quality = 3,
    stage = 1,
    equipLevel = 1,
    icon = 6,
    based_property_group_id = 18,
    random_property_group_id = 3,
    min_num = 2,
    max_num = 3,
    property_suite_id = 0,
    level_up_group_id = 2,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.3,
    usefulLife = 0,
    inbind = 0
    };
getRow(102205)->
    #runeCfg {
    iD = 102205,
    name = "刺甲之晶",
    type = 0,
    subtype = 4,
    quality = 3,
    stage = 1,
    equipLevel = 1,
    icon = 2,
    based_property_group_id = 23,
    random_property_group_id = 3,
    min_num = 1,
    max_num = 2,
    property_suite_id = 0,
    level_up_group_id = 1,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.3,
    usefulLife = 0,
    inbind = 0
    };
getRow(102301)->
    #runeCfg {
    iD = 102301,
    name = "秘银之纹",
    type = 0,
    subtype = 0,
    quality = 4,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 4,
    random_property_group_id = 4,
    min_num = 2,
    max_num = 3,
    property_suite_id = 0,
    level_up_group_id = 2,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.4,
    usefulLife = 0,
    inbind = 0
    };
getRow(102302)->
    #runeCfg {
    iD = 102302,
    name = "风舞",
    type = 0,
    subtype = 1,
    quality = 4,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 9,
    random_property_group_id = 4,
    min_num = 2,
    max_num = 4,
    property_suite_id = 0,
    level_up_group_id = 3,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.4,
    usefulLife = 0,
    inbind = 0
    };
getRow(102303)->
    #runeCfg {
    iD = 102303,
    name = "华丽护符",
    type = 0,
    subtype = 2,
    quality = 4,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 14,
    random_property_group_id = 4,
    min_num = 3,
    max_num = 6,
    property_suite_id = 0,
    level_up_group_id = 5,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.4,
    usefulLife = 0,
    inbind = 0
    };
getRow(102304)->
    #runeCfg {
    iD = 102304,
    name = "光辉印记",
    type = 0,
    subtype = 3,
    quality = 4,
    stage = 1,
    equipLevel = 1,
    icon = 6,
    based_property_group_id = 19,
    random_property_group_id = 4,
    min_num = 2,
    max_num = 4,
    property_suite_id = 0,
    level_up_group_id = 3,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.4,
    usefulLife = 0,
    inbind = 0
    };
getRow(102305)->
    #runeCfg {
    iD = 102305,
    name = "强击之纹",
    type = 0,
    subtype = 4,
    quality = 4,
    stage = 1,
    equipLevel = 1,
    icon = 2,
    based_property_group_id = 24,
    random_property_group_id = 4,
    min_num = 1,
    max_num = 2,
    property_suite_id = 0,
    level_up_group_id = 1,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.4,
    usefulLife = 0,
    inbind = 0
    };
getRow(102401)->
    #runeCfg {
    iD = 102401,
    name = "夜神月",
    type = 0,
    subtype = 0,
    quality = 5,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 5,
    random_property_group_id = 5,
    min_num = 2,
    max_num = 3,
    property_suite_id = 0,
    level_up_group_id = 2,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.5,
    usefulLife = 0,
    inbind = 0
    };
getRow(102402)->
    #runeCfg {
    iD = 102402,
    name = "氤氲",
    type = 0,
    subtype = 1,
    quality = 5,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 10,
    random_property_group_id = 5,
    min_num = 2,
    max_num = 5,
    property_suite_id = 0,
    level_up_group_id = 4,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.5,
    usefulLife = 0,
    inbind = 0
    };
getRow(102403)->
    #runeCfg {
    iD = 102403,
    name = "圣骑士之力",
    type = 0,
    subtype = 2,
    quality = 5,
    stage = 1,
    equipLevel = 1,
    icon = 3,
    based_property_group_id = 15,
    random_property_group_id = 5,
    min_num = 3,
    max_num = 6,
    property_suite_id = 0,
    level_up_group_id = 5,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.5,
    usefulLife = 0,
    inbind = 0
    };
getRow(102404)->
    #runeCfg {
    iD = 102404,
    name = "星辰之光",
    type = 0,
    subtype = 3,
    quality = 5,
    stage = 1,
    equipLevel = 1,
    icon = 6,
    based_property_group_id = 20,
    random_property_group_id = 5,
    min_num = 2,
    max_num = 5,
    property_suite_id = 0,
    level_up_group_id = 4,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.5,
    usefulLife = 0,
    inbind = 0
    };
getRow(102405)->
    #runeCfg {
    iD = 102405,
    name = "天国印记",
    type = 0,
    subtype = 4,
    quality = 5,
    stage = 1,
    equipLevel = 1,
    icon = 2,
    based_property_group_id = 25,
    random_property_group_id = 5,
    min_num = 1,
    max_num = 2,
    property_suite_id = 0,
    level_up_group_id = 1,
    exp_group_id = 1,
    smeltcost = 1,
    need_equipit = 0,
    battlepower_add = 1.5,
    usefulLife = 0,
    inbind = 0
    };
getRow(110011)->
    #runeCfg {
    iD = 110011,
    name = "测试限时符文",
    type = 1,
    subtype = 0,
    quality = 5,
    stage = 1,
    equipLevel = 30,
    icon = 9033,
    based_property_group_id = 1,
    random_property_group_id = 1,
    min_num = 3,
    max_num = 5,
    property_suite_id = 100000,
    level_up_group_id = 0,
    exp_group_id = 1,
    smeltcost = 12,
    need_equipit = 0,
    battlepower_add = 2,
    usefulLife = 86400,
    inbind = 1,
    description = "测试限时",
    explain = "测试限时符文",
    material_ui = [22,2]
    };
getRow(_)->[].

getKeyList()->[
    {100000},
    {100001},
    {100002},
    {100003},
    {100004},
    {100005},
    {100006},
    {100007},
    {100008},
    {100009},
    {100010},
    {101001},
    {101002},
    {101003},
    {101004},
    {101005},
    {101006},
    {101101},
    {101102},
    {101103},
    {101104},
    {101105},
    {101106},
    {101201},
    {101202},
    {101203},
    {101204},
    {101205},
    {101206},
    {101301},
    {101302},
    {101303},
    {101304},
    {101305},
    {101306},
    {101401},
    {101402},
    {101403},
    {101404},
    {101405},
    {101406},
    {102001},
    {102002},
    {102003},
    {102004},
    {102005},
    {102101},
    {102102},
    {102103},
    {102104},
    {102105},
    {102201},
    {102202},
    {102203},
    {102204},
    {102205},
    {102301},
    {102302},
    {102303},
    {102304},
    {102305},
    {102401},
    {102402},
    {102403},
    {102404},
    {102405},
    {110011}
    ].

get1KeyList()->[
    100000,
    100001,
    100002,
    100003,
    100004,
    100005,
    100006,
    100007,
    100008,
    100009,
    100010,
    101001,
    101002,
    101003,
    101004,
    101005,
    101006,
    101101,
    101102,
    101103,
    101104,
    101105,
    101106,
    101201,
    101202,
    101203,
    101204,
    101205,
    101206,
    101301,
    101302,
    101303,
    101304,
    101305,
    101306,
    101401,
    101402,
    101403,
    101404,
    101405,
    101406,
    102001,
    102002,
    102003,
    102004,
    102005,
    102101,
    102102,
    102103,
    102104,
    102105,
    102201,
    102202,
    102203,
    102204,
    102205,
    102301,
    102302,
    102303,
    102304,
    102305,
    102401,
    102402,
    102403,
    102404,
    102405,
    110011
    ].

