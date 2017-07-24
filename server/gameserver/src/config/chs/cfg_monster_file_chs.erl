%% coding: latin-1
%%: 实现
-module(cfg_monster_file_chs).
-compile(export_all).
-include("cfg_monster_file.hrl").
-include("logger.hrl").

getRow(1105)->
    #monster_fileCfg {
    monster_id = 1105,
    monster_name = "动感拳击手",
    size = 0.5,
    area = 5,
    area_name = "首领禁地",
    rank = 1,
    unlock_way = [1,0],
    unlock_reward = [1,1000,0],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "出现在野外地图",
    extra_bonus = [135,100],
    extra_target = 500
    };
getRow(1106)->
    #monster_fileCfg {
    monster_id = 1106,
    monster_name = "绿皮绅士",
    size = 0.5,
    area = 5,
    area_name = "首领禁地",
    rank = 2,
    unlock_way = [1,0],
    unlock_reward = [1,1000,0],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "出现在野外地图",
    extra_bonus = [136,100],
    extra_target = 500
    };
getRow(1107)->
    #monster_fileCfg {
    monster_id = 1107,
    monster_name = "红皮流氓",
    size = 0.5,
    area = 5,
    area_name = "首领禁地",
    rank = 3,
    unlock_way = [1,0],
    unlock_reward = [1,1000,0],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "出现在野外地图",
    extra_bonus = [137,100],
    extra_target = 500
    };
getRow(1108)->
    #monster_fileCfg {
    monster_id = 1108,
    monster_name = "岩石领主",
    size = 0.5,
    area = 5,
    area_name = "首领禁地",
    rank = 5,
    unlock_way = [1,0],
    unlock_reward = [1,1000,0],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "出现在野外地图",
    extra_bonus = [137,100],
    extra_target = 500
    };
getRow(1109)->
    #monster_fileCfg {
    monster_id = 1109,
    monster_name = "梦境龙",
    size = 0.5,
    area = 5,
    area_name = "首领禁地",
    rank = 6,
    unlock_way = [1,0],
    unlock_reward = [1,1000,0],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "出现在野外地图",
    extra_bonus = [137,100],
    extra_target = 500
    };
getRow(11070)->
    #monster_fileCfg {
    monster_id = 11070,
    monster_name = "红皮流氓",
    size = 0.5,
    area = 5,
    area_name = "首领禁地",
    rank = 4,
    unlock_way = [1,0],
    unlock_reward = [1,1000,0],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "出现在野外地图",
    extra_bonus = [137,100],
    extra_target = 500
    };
getRow(22038)->
    #monster_fileCfg {
    monster_id = 22038,
    monster_name = "大史莱姆",
    size = 0.5,
    area = 10,
    area_name = "东城郊",
    rank = 7,
    unlock_way = [1,0],
    unlock_reward = [1,1000,0],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "东城郊南边",
    extra_bonus = [139,100],
    extra_target = 500
    };
getRow(22040)->
    #monster_fileCfg {
    monster_id = 22040,
    monster_name = "螃蟹",
    size = 0.5,
    area = 10,
    area_name = "东城郊",
    rank = 8,
    unlock_way = [1,0],
    unlock_reward = [1,1000,0],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "东城郊南边",
    extra_bonus = [139,100],
    extra_target = 500
    };
getRow(22048)->
    #monster_fileCfg {
    monster_id = 22048,
    monster_name = "香菇战士",
    size = 0.5,
    area = 3,
    area_name = "阿克勒平原",
    rank = 1,
    unlock_way = [1,0],
    unlock_reward = [1,1000,0],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "东城郊南边",
    extra_bonus = [139,100],
    extra_target = 500
    };
getRow(22049)->
    #monster_fileCfg {
    monster_id = 22049,
    monster_name = "暴躁的牙牙",
    size = 0.5,
    area = 3,
    area_name = "阿克勒平原",
    rank = 2,
    unlock_way = [1,0],
    unlock_reward = [1,1000,0],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "阿克勒平原北边",
    extra_bonus = [140,100],
    extra_target = 500
    };
getRow(22050)->
    #monster_fileCfg {
    monster_id = 22050,
    monster_name = "魔化的宝箱",
    size = 0.5,
    area = 3,
    area_name = "阿克勒平原",
    rank = 3,
    unlock_way = [1,0],
    unlock_reward = [1,1000,0],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "阿克勒平原北边",
    extra_bonus = [140,100],
    extra_target = 500
    };
getRow(22051)->
    #monster_fileCfg {
    monster_id = 22051,
    monster_name = "骷髅兵",
    size = 0.5,
    area = 3,
    area_name = "阿克勒平原",
    rank = 4,
    unlock_way = [1,0],
    unlock_reward = [1,1000,0],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "阿克勒平原北边",
    extra_bonus = [140,100],
    extra_target = 500
    };
getRow(22054)->
    #monster_fileCfg {
    monster_id = 22054,
    monster_name = "魔化树人",
    size = 0.5,
    area = 3,
    area_name = "阿克勒平原",
    rank = 5,
    unlock_way = [1,0],
    unlock_reward = [1,1000,0],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "阿克勒平原北边",
    extra_bonus = [140,100],
    extra_target = 500
    };
getRow(22055)->
    #monster_fileCfg {
    monster_id = 22055,
    monster_name = "大史莱姆",
    size = 0.5,
    area = 10,
    area_name = "东城郊",
    rank = 9,
    unlock_way = [1,0],
    unlock_reward = [1,1000,0],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "阿克勒平原北边",
    extra_bonus = [141,100],
    extra_target = 500
    };
getRow(22056)->
    #monster_fileCfg {
    monster_id = 22056,
    monster_name = "橘鬼花",
    size = 0.5,
    area = 10,
    area_name = "东城郊",
    rank = 10,
    unlock_way = [1,0],
    unlock_reward = [1,1000,0],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "东城郊西边",
    extra_bonus = [141,100],
    extra_target = 500
    };
getRow(22064)->
    #monster_fileCfg {
    monster_id = 22064,
    monster_name = "魔族青年",
    size = 0.5,
    area = 4,
    area_name = "苍空之塔",
    rank = 1,
    unlock_way = [2,10],
    unlock_reward = [2,3,100],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "东城郊西边",
    extra_bonus = [141,100],
    extra_target = 500
    };
getRow(22070)->
    #monster_fileCfg {
    monster_id = 22070,
    monster_name = "冰魔人",
    size = 0.5,
    area = 4,
    area_name = "苍空之塔",
    rank = 2,
    unlock_way = [2,10],
    unlock_reward = [2,3,101],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "苍空之塔中部",
    extra_bonus = [141,100],
    extra_target = 500
    };
getRow(22071)->
    #monster_fileCfg {
    monster_id = 22071,
    monster_name = "狂雷恶魔",
    size = 0.5,
    area = 4,
    area_name = "苍空之塔",
    rank = 3,
    unlock_way = [2,10],
    unlock_reward = [2,3,102],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "苍空之塔中部",
    extra_bonus = [141,100],
    extra_target = 500
    };
getRow(22072)->
    #monster_fileCfg {
    monster_id = 22072,
    monster_name = "恶魔使者",
    size = 0.5,
    area = 4,
    area_name = "苍空之塔",
    rank = 4,
    unlock_way = [2,10],
    unlock_reward = [2,3,103],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "苍空之塔中部",
    extra_bonus = [141,100],
    extra_target = 500
    };
getRow(22073)->
    #monster_fileCfg {
    monster_id = 22073,
    monster_name = "冰巨人",
    size = 0.5,
    area = 4,
    area_name = "苍空之塔",
    rank = 5,
    unlock_way = [2,10],
    unlock_reward = [2,3,104],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "苍空之塔中部",
    extra_bonus = [142,100],
    extra_target = 500
    };
getRow(22074)->
    #monster_fileCfg {
    monster_id = 22074,
    monster_name = "狂暴魔龙(BOSS）",
    size = 0.5,
    area = 4,
    area_name = "苍空之塔",
    rank = 6,
    unlock_way = [2,10],
    unlock_reward = [2,3,105],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "苍空之塔中部",
    extra_bonus = [142,100],
    extra_target = 500
    };
getRow(22079)->
    #monster_fileCfg {
    monster_id = 22079,
    monster_name = "壮壮的白熊",
    size = 0.5,
    area = 4,
    area_name = "苍空之塔",
    rank = 7,
    unlock_way = [2,10],
    unlock_reward = [2,3,106],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "苍空之塔中部",
    extra_bonus = [142,100],
    extra_target = 500
    };
getRow(22080)->
    #monster_fileCfg {
    monster_id = 22080,
    monster_name = "炸弹头头",
    size = 0.5,
    area = 4,
    area_name = "苍空之塔",
    rank = 8,
    unlock_way = [2,10],
    unlock_reward = [2,3,107],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "苍空之塔中部",
    extra_bonus = [142,100],
    extra_target = 500
    };
getRow(22104)->
    #monster_fileCfg {
    monster_id = 22104,
    monster_name = "魔灵兽",
    size = 0.5,
    area = 9,
    area_name = "海洋之心",
    rank = 1,
    unlock_way = [2,10],
    unlock_reward = [2,3,108],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "苍空之塔中部",
    extra_bonus = [142,100],
    extra_target = 500
    };
getRow(22107)->
    #monster_fileCfg {
    monster_id = 22107,
    monster_name = "海之国侍卫",
    size = 0.5,
    area = 9,
    area_name = "海洋之心",
    rank = 2,
    unlock_way = [2,10],
    unlock_reward = [2,3,109],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "海洋之心西边",
    extra_bonus = [142,100],
    extra_target = 500
    };
getRow(22108)->
    #monster_fileCfg {
    monster_id = 22108,
    monster_name = "王宫侍女",
    size = 0.5,
    area = 9,
    area_name = "海洋之心",
    rank = 3,
    unlock_way = [2,10],
    unlock_reward = [2,3,110],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "海洋之心西边",
    extra_bonus = [143,100],
    extra_target = 500
    };
getRow(22109)->
    #monster_fileCfg {
    monster_id = 22109,
    monster_name = "稚龙兽",
    size = 0.5,
    area = 9,
    area_name = "海洋之心",
    rank = 4,
    unlock_way = [2,10],
    unlock_reward = [2,3,111],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "海洋之心西边",
    extra_bonus = [143,100],
    extra_target = 500
    };
getRow(22110)->
    #monster_fileCfg {
    monster_id = 22110,
    monster_name = "冰女",
    size = 0.5,
    area = 9,
    area_name = "海洋之心",
    rank = 5,
    unlock_way = [2,10],
    unlock_reward = [2,3,112],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "海洋之心西边",
    extra_bonus = [143,100],
    extra_target = 500
    };
getRow(22111)->
    #monster_fileCfg {
    monster_id = 22111,
    monster_name = "小螃蟹",
    size = 0.5,
    area = 9,
    area_name = "海洋之心",
    rank = 6,
    unlock_way = [2,10],
    unlock_reward = [2,3,113],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "海洋之心西边",
    extra_bonus = [143,100],
    extra_target = 500
    };
getRow(22112)->
    #monster_fileCfg {
    monster_id = 22112,
    monster_name = "小鲤鱼",
    size = 0.5,
    area = 9,
    area_name = "海洋之心",
    rank = 7,
    unlock_way = [2,10],
    unlock_reward = [2,3,114],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "海洋之心西边",
    extra_bonus = [143,100],
    extra_target = 500
    };
getRow(22113)->
    #monster_fileCfg {
    monster_id = 22113,
    monster_name = "螃蟹侍卫",
    size = 0.5,
    area = 9,
    area_name = "海洋之心",
    rank = 8,
    unlock_way = [2,10],
    unlock_reward = [2,3,115],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "海洋之心西边",
    extra_bonus = [143,100],
    extra_target = 500
    };
getRow(22114)->
    #monster_fileCfg {
    monster_id = 22114,
    monster_name = "鲤鱼大王",
    size = 0.5,
    area = 9,
    area_name = "海洋之心",
    rank = 9,
    unlock_way = [2,10],
    unlock_reward = [2,3,116],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "海洋之心西边",
    extra_bonus = [146,100],
    extra_target = 500
    };
getRow(22115)->
    #monster_fileCfg {
    monster_id = 22115,
    monster_name = "独眼大王",
    size = 0.5,
    area = 9,
    area_name = "海洋之心",
    rank = 10,
    unlock_way = [2,10],
    unlock_reward = [2,3,117],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "海洋之心西边",
    extra_bonus = [146,100],
    extra_target = 500
    };
getRow(22116)->
    #monster_fileCfg {
    monster_id = 22116,
    monster_name = "呆呆独眼怪",
    size = 0.5,
    area = 9,
    area_name = "海洋之心",
    rank = 11,
    unlock_way = [2,10],
    unlock_reward = [2,3,118],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "海洋之心西边",
    extra_bonus = [146,100],
    extra_target = 500
    };
getRow(22117)->
    #monster_fileCfg {
    monster_id = 22117,
    monster_name = "螃蟹将军",
    size = 0.5,
    area = 9,
    area_name = "海洋之心",
    rank = 12,
    unlock_way = [2,10],
    unlock_reward = [2,3,119],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "海洋之心西边",
    extra_bonus = [146,100],
    extra_target = 500
    };
getRow(22118)->
    #monster_fileCfg {
    monster_id = 22118,
    monster_name = "暗夜幽灵",
    size = 0.5,
    area = 9,
    area_name = "海洋之心",
    rank = 13,
    unlock_way = [2,10],
    unlock_reward = [2,3,120],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "海洋之心西边",
    extra_bonus = [146,100],
    extra_target = 500
    };
getRow(22200)->
    #monster_fileCfg {
    monster_id = 22200,
    monster_name = "发狂的野豹",
    size = 0.5,
    area = 10,
    area_name = "东城郊",
    rank = 1,
    unlock_way = [1,0],
    unlock_reward = [1,1000,0],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "东城郊南边",
    extra_bonus = [135,100],
    extra_target = 500
    };
getRow(22201)->
    #monster_fileCfg {
    monster_id = 22201,
    monster_name = "小猪嘟嘟",
    size = 0.5,
    area = 10,
    area_name = "东城郊",
    rank = 2,
    unlock_way = [1,0],
    unlock_reward = [1,1000,0],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "东城郊南边",
    extra_bonus = [138,100],
    extra_target = 500
    };
getRow(22204)->
    #monster_fileCfg {
    monster_id = 22204,
    monster_name = "魔族巡逻兵",
    size = 0.5,
    area = 10,
    area_name = "东城郊",
    rank = 3,
    unlock_way = [1,0],
    unlock_reward = [1,1000,0],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "东城郊南边",
    extra_bonus = [138,100],
    extra_target = 500
    };
getRow(22205)->
    #monster_fileCfg {
    monster_id = 22205,
    monster_name = "宝箱守卫",
    size = 0.5,
    area = 10,
    area_name = "东城郊",
    rank = 4,
    unlock_way = [1,0],
    unlock_reward = [1,1000,0],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "东城郊南边",
    extra_bonus = [138,100],
    extra_target = 500
    };
getRow(22210)->
    #monster_fileCfg {
    monster_id = 22210,
    monster_name = "发狂的诺拉",
    size = 0.5,
    area = 10,
    area_name = "东城郊",
    rank = 5,
    unlock_way = [1,0],
    unlock_reward = [1,1000,0],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "东城郊南边",
    extra_bonus = [138,100],
    extra_target = 500
    };
getRow(22214)->
    #monster_fileCfg {
    monster_id = 22214,
    monster_name = "炸弹头头",
    size = 0.5,
    area = 10,
    area_name = "东城郊",
    rank = 6,
    unlock_way = [1,0],
    unlock_reward = [1,1000,0],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "东城郊南边",
    extra_bonus = [139,100],
    extra_target = 500
    };
getRow(30001)->
    #monster_fileCfg {
    monster_id = 30001,
    monster_name = "香辣蟹",
    size = 0.5,
    area = 10,
    area_name = "东城郊",
    rank = 11,
    unlock_way = [2,10],
    unlock_reward = [2,3,121],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "海洋之心西边",
    extra_bonus = [147,100],
    extra_target = 500
    };
getRow(30002)->
    #monster_fileCfg {
    monster_id = 30002,
    monster_name = "魔族骨头兵",
    size = 0.5,
    area = 10,
    area_name = "东城郊",
    rank = 12,
    unlock_way = [2,10],
    unlock_reward = [2,3,122],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "东城郊北侧",
    extra_bonus = [147,100],
    extra_target = 500
    };
getRow(30003)->
    #monster_fileCfg {
    monster_id = 30003,
    monster_name = "魔族大眼兵",
    size = 0.5,
    area = 10,
    area_name = "东城郊",
    rank = 13,
    unlock_way = [2,10],
    unlock_reward = [2,3,123],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "东城郊北侧",
    extra_bonus = [147,100],
    extra_target = 500
    };
getRow(30004)->
    #monster_fileCfg {
    monster_id = 30004,
    monster_name = "魔族蛋蛋兵",
    size = 0.5,
    area = 10,
    area_name = "东城郊",
    rank = 14,
    unlock_way = [2,10],
    unlock_reward = [2,3,124],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "东城郊北侧",
    extra_bonus = [147,100],
    extra_target = 500
    };
getRow(30005)->
    #monster_fileCfg {
    monster_id = 30005,
    monster_name = "魔族大球",
    size = 0.5,
    area = 10,
    area_name = "东城郊",
    rank = 15,
    unlock_way = [2,10],
    unlock_reward = [2,3,125],
    monster_desc = "非常厉害非常牛逼",
    monster_area = "东城郊北侧",
    extra_bonus = [147,100],
    extra_target = 500
    };
getRow(_)->[].

getKeyList()->[
    {1105},
    {1106},
    {1107},
    {1108},
    {1109},
    {11070},
    {22038},
    {22040},
    {22048},
    {22049},
    {22050},
    {22051},
    {22054},
    {22055},
    {22056},
    {22064},
    {22070},
    {22071},
    {22072},
    {22073},
    {22074},
    {22079},
    {22080},
    {22104},
    {22107},
    {22108},
    {22109},
    {22110},
    {22111},
    {22112},
    {22113},
    {22114},
    {22115},
    {22116},
    {22117},
    {22118},
    {22200},
    {22201},
    {22204},
    {22205},
    {22210},
    {22214},
    {30001},
    {30002},
    {30003},
    {30004},
    {30005}
    ].

get1KeyList()->[
    1105,
    1106,
    1107,
    1108,
    1109,
    11070,
    22038,
    22040,
    22048,
    22049,
    22050,
    22051,
    22054,
    22055,
    22056,
    22064,
    22070,
    22071,
    22072,
    22073,
    22074,
    22079,
    22080,
    22104,
    22107,
    22108,
    22109,
    22110,
    22111,
    22112,
    22113,
    22114,
    22115,
    22116,
    22117,
    22118,
    22200,
    22201,
    22204,
    22205,
    22210,
    22214,
    30001,
    30002,
    30003,
    30004,
    30005
    ].

