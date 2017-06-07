%% coding: latin-1
%%: 实现
-module(cfg_accessresources_chs).
-compile(export_all).
-include("cfg_accessresources.hrl").
-include("logger.hrl").

getRow(1)->
    #accessresourcesCfg {
    iD = 1,
    name = "金币",
    type = 1,
    type_id = 1,
    description_1 = "[ff9900]【金币】[-]基础的通用货币",
    description_2 = "[00ff00]主要途径：[-][ff9900]惊天喵盗团[-][00ff00],[-][ff9900]商城[-]",
    relation_UI = [22,4],
    number_display = 1,
    new_rule = 0
    };
getRow(2)->
    #accessresourcesCfg {
    iD = 2,
    name = "绑定钻石",
    type = 1,
    type_id = 6,
    description_1 = "[ff9900]【绑定钻石】[-]可[ff3300]购买商城道具[-]和[ff3300]游戏功能[-]",
    description_2 = "[00ff00]主要途径：[-][ff9900]竞技场[-][00ff00],[-][ff9900]完成成就[-]",
    relation_UI = [22,16],
    number_display = 1,
    new_rule = 0
    };
getRow(3)->
    #accessresourcesCfg {
    iD = 3,
    name = "钻石",
    type = 1,
    type_id = 3,
    description_1 = "[ff9900]【钻石】[-]可[ff3300]购买更多的商城道具[-]和[ff3300]游戏功能[-]",
    description_2 = "[00ff00]主要途径：[-][ff9900]商城充值[-]",
    relation_UI = [24,0],
    number_display = 1,
    new_rule = 0
    };
getRow(4)->
    #accessresourcesCfg {
    iD = 4,
    name = "紫色精华",
    type = 1,
    type_id = 7,
    description_1 = "[ff9900]【紫色精华】[-]用在[ff3300]资源兑换商店[-]中兑换商品",
    description_2 = "[00ff00]主要途径：[-][ff9900]装备分解[-]",
    relation_UI = [2,0],
    number_display = 1,
    new_rule = 0
    };
getRow(5)->
    #accessresourcesCfg {
    iD = 5,
    name = "兽灵硬币",
    type = 2,
    type_id = 2002,
    description_1 = "[ff9900]【兽灵硬币】[-]用在[ff3300]碎片商店[-]中兑换商品",
    description_2 = "[00ff00]主要途径：[-][ff9900]骑宠回购[-]",
    relation_UI = [2,0],
    number_display = 1,
    new_rule = 0
    };
getRow(6)->
    #accessresourcesCfg {
    iD = 6,
    name = "精炼石I",
    type = 2,
    type_id = 222,
    description_1 = "[ff9900]【精炼石I】[-][ff3300]精炼装备[-]1-30级材料",
    description_2 = "[00ff00]主要途径：[-][ff9900]剧情副本[-][00ff00],[-][ff9900]英雄副本[-],[-][ff9900]挑战副本[-]",
    relation_UI = [20,101],
    number_display = 1,
    new_rule = 0
    };
getRow(7)->
    #accessresourcesCfg {
    iD = 7,
    name = "精炼石II",
    type = 2,
    type_id = 224,
    description_1 = "[ff9900]【精炼石II】[-][ff3300]精炼装备[-]31-60级材料",
    description_2 = "[00ff00]主要途径：[-][ff9900]英雄副本[-],[-][ff9900]挑战副本[-]",
    relation_UI = [20,201],
    number_display = 1,
    new_rule = 0
    };
getRow(8)->
    #accessresourcesCfg {
    iD = 8,
    name = "时装碎片",
    type = 2,
    type_id = 20,
    description_1 = "[ff9900]【时装碎片】[-]可用于兑换[-][ff3300]时装[-]",
    description_2 = "[00ff00]主要途径：[-][ff9900]守护女神[-],[-][ff9900]商城[-]",
    relation_UI = [22,1],
    number_display = 1,
    new_rule = 0
    };
getRow(9)->
    #accessresourcesCfg {
    iD = 9,
    name = "勇气碎片",
    type = 2,
    type_id = 7000,
    description_1 = "[ff9900]【勇气碎片】[-]可兑换[ff3300]30级红色套装[-]",
    description_2 = "[00ff00]主要途径：[-][ff9900]元素保卫战[-][00ff00]",
    relation_UI = [22,31],
    number_display = 1,
    new_rule = 0
    };
getRow(10)->
    #accessresourcesCfg {
    iD = 10,
    name = "专注碎片",
    type = 2,
    type_id = 7001,
    description_1 = "[ff9900]【专注碎片】[-]可兑换[ff3300]40级红色套装[-]",
    description_2 = "[00ff00]主要途径：[-][ff9900]元素保卫战[-][00ff00]",
    relation_UI = [22,31],
    number_display = 1,
    new_rule = 0
    };
getRow(11)->
    #accessresourcesCfg {
    iD = 11,
    name = "虔诚碎片",
    type = 2,
    type_id = 7002,
    description_1 = "[ff9900]【虔诚碎片】[-]可兑换[ff3300]50级红色套装[-]",
    description_2 = "[00ff00]主要途径：[-][ff9900]元素保卫战[-][00ff00]",
    relation_UI = [22,31],
    number_display = 1,
    new_rule = 0
    };
getRow(12)->
    #accessresourcesCfg {
    iD = 12,
    name = "纹章",
    type = 2,
    type_id = 62,
    description_1 = "[ff9900]【纹章】[-]可[ff3300]镶嵌[-]在角色身上提高战斗力",
    description_2 = "[00ff00]主要途径：[-][ff9900]遗迹训练场[-],[-][ff9900]神秘商店[-]",
    relation_UI = [33,0],
    number_display = 1,
    new_rule = 0
    };
getRow(13)->
    #accessresourcesCfg {
    iD = 13,
    name = "兽灵精华I",
    type = 2,
    type_id = 2160,
    description_1 = "[ff9900]【兽灵精华I】[-]可用于灰色、绿色和蓝色骑宠的[ff3300]升星[-]以及[ff3300]骑宠装备[-]升级",
    description_2 = "[00ff00]主要途径：[-][ff9900]骑宠领地[-][00ff00],[-][ff9900]商城[-]",
    relation_UI = [55,0],
    number_display = 1,
    new_rule = 0
    };
getRow(14)->
    #accessresourcesCfg {
    iD = 14,
    name = "兽灵精华II",
    type = 2,
    type_id = 2161,
    description_1 = "[ff9900]【兽灵精华II】[-]可用于红色骑宠的[ff3300]升星[-]以及[ff3300]骑宠装备[-]升级",
    description_2 = "[00ff00]主要途径：[-][ff9900]骑宠领地[-][00ff00],[-][ff9900]商城[-]",
    relation_UI = [55,0],
    number_display = 1,
    new_rule = 0
    };
getRow(15)->
    #accessresourcesCfg {
    iD = 15,
    name = "兽灵精华III",
    type = 2,
    type_id = 2162,
    description_1 = "[ff9900]【兽灵精华III】[-]可用于紫色骑宠的[ff3300]升星[-]以及[ff3300]骑宠装备[-]升级",
    description_2 = "[00ff00]主要途径：[-][ff9900]骑宠领地[-][00ff00],[-][ff9900]商城[-]",
    relation_UI = [55,0],
    number_display = 1,
    new_rule = 0
    };
getRow(16)->
    #accessresourcesCfg {
    iD = 16,
    name = "魔力晶体",
    type = 2,
    type_id = 2600,
    description_1 = "[ff9900]【魔力晶体】[-]可用于火冰雷风四系[ff3300]器灵[-]升级",
    description_2 = "[00ff00]主要途径：[-][ff9900]混沌灵界[-],[-][ff9900]神秘商店[-]",
    relation_UI = [22,34],
    number_display = 1,
    new_rule = 0
    };
getRow(17)->
    #accessresourcesCfg {
    iD = 17,
    name = "璀璨晶体",
    type = 2,
    type_id = 2601,
    description_1 = "[ff9900]【璀璨晶体】[-]可用于光暗双系[ff3300]器灵[-]升级",
    description_2 = "[00ff00]主要途径：[-][ff9900]商城[-]",
    relation_UI = [24,0],
    number_display = 1,
    new_rule = 0
    };
getRow(18)->
    #accessresourcesCfg {
    iD = 18,
    name = "宠物碎片",
    type = 2,
    type_id = 84,
    description_1 = "[ff9900]【宠物碎片】[-]可用于[ff3300]兑换宠物[-]",
    description_2 = "[00ff00]主要途径：[-][ff9900]扭蛋[-][00ff00],[-][ff9900]骑宠领地[-]",
    relation_UI = [53,0],
    number_display = 1,
    new_rule = 0
    };
getRow(19)->
    #accessresourcesCfg {
    iD = 19,
    name = "星星石",
    type = 2,
    type_id = 4303,
    description_1 = "[ff9900]【星星石】[-]升级[ff3300]翅膀[-]的必需品之一",
    description_2 = "[00ff00]主要途径：[-][ff9900]女神禁闭室[-],[-][ff9900]神秘商店[-]",
    relation_UI = [22,13],
    number_display = 1,
    new_rule = 0
    };
getRow(20)->
    #accessresourcesCfg {
    iD = 20,
    name = "月亮石",
    type = 2,
    type_id = 4304,
    description_1 = "[ff9900]【月亮石】[-]升级[ff3300]翅膀[-]的必需品之一",
    description_2 = "[00ff00]主要途径：[-][ff9900]女神禁闭室[-],[-][ff9900]神秘商店[-]",
    relation_UI = [22,13],
    number_display = 1,
    new_rule = 0
    };
getRow(21)->
    #accessresourcesCfg {
    iD = 21,
    name = "太阳石",
    type = 2,
    type_id = 4305,
    description_1 = "[ff9900]【太阳石】[-]升级[ff3300]翅膀[-]的必需品之一",
    description_2 = "[00ff00]主要途径：[-][ff9900]商城[-]",
    relation_UI = [24,0],
    number_display = 1,
    new_rule = 0
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

