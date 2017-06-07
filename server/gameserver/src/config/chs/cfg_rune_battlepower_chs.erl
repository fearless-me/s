%% coding: latin-1
%%: 实现
-module(cfg_rune_battlepower_chs).
-compile(export_all).
-include("cfg_rune_battlepower.hrl").
-include("logger.hrl").

getRow(1)->
    #rune_battlepowerCfg {
    propertyId = 1,
    desc = "力量",
    minitips = "骑士和魔女的主属性，可以提高伤害。对于所有职业可以换算为物理防御。",
    standard_addition = 100,
    standard_multi = 0,
    power = 1000,
    pet_power = 0.2
    };
getRow(2)->
    #rune_battlepowerCfg {
    propertyId = 2,
    desc = "敏捷",
    minitips = "刺客和枪械师的主属性，可以提高伤害。对于所有职业可以换算为闪避率。",
    standard_addition = 100,
    standard_multi = 0,
    power = 1000,
    pet_power = 0.2
    };
getRow(3)->
    #rune_battlepowerCfg {
    propertyId = 3,
    desc = "智力",
    minitips = "魔法师的主属性，可以提高伤害。对于所有职业可以换算魔法防御。",
    standard_addition = 100,
    standard_multi = 0,
    power = 1000,
    pet_power = 0.2
    };
getRow(4)->
    #rune_battlepowerCfg {
    propertyId = 4,
    desc = "体质",
    minitips = "所有职业的主属性，可以提高生命上限。",
    standard_addition = 100,
    standard_multi = 0,
    power = 1000,
    pet_power = 0.2
    };
getRow(5)->
    #rune_battlepowerCfg {
    propertyId = 5,
    desc = "幸运",
    minitips = "所有职业的主属性，可以影响装备掉率。",
    standard_addition = 0,
    standard_multi = 0,
    power = 0,
    pet_power = 0
    };
getRow(6)->
    #rune_battlepowerCfg {
    propertyId = 6,
    desc = "药水效果",
    minitips = "提高药水恢复效果。",
    standard_addition = 100,
    standard_multi = 1,
    power = 900,
    pet_power = 0.2
    };
getRow(7)->
    #rune_battlepowerCfg {
    propertyId = 7,
    desc = "生存精通",
    minitips = "生存精通",
    standard_addition = 0,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(8)->
    #rune_battlepowerCfg {
    propertyId = 8,
    desc = "对精英伤害",
    minitips = "增加对精英或首领怪的伤害。",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 600,
    pet_power = 0.2
    };
getRow(9)->
    #rune_battlepowerCfg {
    propertyId = 9,
    desc = "受到精英伤害",
    minitips = "受到精英伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 600,
    pet_power = 0.2
    };
getRow(10)->
    #rune_battlepowerCfg {
    propertyId = 10,
    desc = "圣力上限",
    minitips = "骑士能量上限值。",
    standard_addition = 5,
    standard_multi = 1,
    power = 1600,
    pet_power = 0.2
    };
getRow(11)->
    #rune_battlepowerCfg {
    propertyId = 11,
    desc = "每秒恢复圣力",
    minitips = "每秒圣力恢复值。",
    standard_addition = 1,
    standard_multi = 1,
    power = 2000,
    pet_power = 0.2
    };
getRow(12)->
    #rune_battlepowerCfg {
    propertyId = 12,
    desc = "秘法上限",
    minitips = "法师能量上限值。",
    standard_addition = 5,
    standard_multi = 1,
    power = 1600,
    pet_power = 0.2
    };
getRow(13)->
    #rune_battlepowerCfg {
    propertyId = 13,
    desc = "每秒恢复秘法",
    minitips = "每秒秘法恢复值。",
    standard_addition = 1,
    standard_multi = 1,
    power = 2000,
    pet_power = 0.2
    };
getRow(14)->
    #rune_battlepowerCfg {
    propertyId = 14,
    desc = "魔怒上限",
    minitips = "魔女能量上限值。",
    standard_addition = 5,
    standard_multi = 1,
    power = 1600,
    pet_power = 0.2
    };
getRow(15)->
    #rune_battlepowerCfg {
    propertyId = 15,
    desc = "每秒恢复魔怒",
    minitips = "每秒魔怒恢复值。",
    standard_addition = 1,
    standard_multi = 1,
    power = 2000,
    pet_power = 0.2
    };
getRow(16)->
    #rune_battlepowerCfg {
    propertyId = 16,
    desc = "影力上限",
    minitips = "刺客能量上限值。",
    standard_addition = 5,
    standard_multi = 1,
    power = 1600,
    pet_power = 0.2
    };
getRow(17)->
    #rune_battlepowerCfg {
    propertyId = 17,
    desc = "每秒恢复影力",
    minitips = "每秒影力恢复值。",
    standard_addition = 1,
    standard_multi = 1,
    power = 2000,
    pet_power = 0.2
    };
getRow(18)->
    #rune_battlepowerCfg {
    propertyId = 18,
    desc = "生命上限",
    minitips = "角色生命上限值。",
    standard_addition = 5000,
    standard_multi = 0.001,
    power = 2000,
    pet_power = 720
    };
getRow(19)->
    #rune_battlepowerCfg {
    propertyId = 19,
    desc = "每秒恢复生命",
    minitips = "每秒生命恢复值。",
    standard_addition = 100,
    standard_multi = 1,
    power = 30.4,
    pet_power = 0.2
    };
getRow(20)->
    #rune_battlepowerCfg {
    propertyId = 20,
    desc = "每秒恢复生命上限",
    minitips = "每秒恢复生命上限",
    standard_addition = 100,
    standard_multi = 1,
    power = 30.4,
    pet_power = 0.2
    };
getRow(21)->
    #rune_battlepowerCfg {
    propertyId = 21,
    desc = "击中恢复生命",
    minitips = "击中恢复生命",
    standard_addition = 100,
    standard_multi = 1,
    power = 30.4,
    pet_power = 0.2
    };
getRow(22)->
    #rune_battlepowerCfg {
    propertyId = 22,
    desc = "伤害恢复生命",
    minitips = "伤害恢复生命",
    standard_addition = 100,
    standard_multi = 1,
    power = 30.4,
    pet_power = 0.2
    };
getRow(23)->
    #rune_battlepowerCfg {
    propertyId = 23,
    desc = "法力上限",
    minitips = "法力上限值。",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(24)->
    #rune_battlepowerCfg {
    propertyId = 24,
    desc = "每秒恢复法力",
    minitips = "每秒恢复法力",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(25)->
    #rune_battlepowerCfg {
    propertyId = 25,
    desc = "神圣防御作废",
    minitips = "神圣防御作废",
    standard_addition = 100,
    standard_multi = 1,
    power = 30.4,
    pet_power = 0.2
    };
getRow(26)->
    #rune_battlepowerCfg {
    propertyId = 26,
    desc = "物理防御",
    minitips = "角色物理防御值",
    standard_addition = 100,
    standard_multi = 1,
    power = 224.8,
    pet_power = 315.2
    };
getRow(27)->
    #rune_battlepowerCfg {
    propertyId = 27,
    desc = "暗影防御作废",
    minitips = "暗影防御作废",
    standard_addition = 100,
    standard_multi = 1,
    power = 30.4,
    pet_power = 0.2
    };
getRow(28)->
    #rune_battlepowerCfg {
    propertyId = 28,
    desc = "魔法防御",
    minitips = "角色魔法防御",
    standard_addition = 100,
    standard_multi = 1,
    power = 224.8,
    pet_power = 315.2
    };
getRow(29)->
    #rune_battlepowerCfg {
    propertyId = 29,
    desc = "混乱防御",
    minitips = "角色混乱防御",
    standard_addition = 100,
    standard_multi = 1,
    power = 224.8,
    pet_power = 315.2
    };
getRow(30)->
    #rune_battlepowerCfg {
    propertyId = 30,
    desc = "神圣伤害",
    minitips = "角色神圣伤害",
    standard_addition = 100,
    standard_multi = 1,
    power = 1320,
    pet_power = 900
    };
getRow(31)->
    #rune_battlepowerCfg {
    propertyId = 31,
    desc = "物理伤害",
    minitips = "角色物理伤害",
    standard_addition = 100,
    standard_multi = 1,
    power = 1320,
    pet_power = 900
    };
getRow(32)->
    #rune_battlepowerCfg {
    propertyId = 32,
    desc = "暗影伤害",
    minitips = "角色暗影伤害",
    standard_addition = 100,
    standard_multi = 1,
    power = 1320,
    pet_power = 900
    };
getRow(33)->
    #rune_battlepowerCfg {
    propertyId = 33,
    desc = "元素伤害",
    minitips = "角色元素伤害",
    standard_addition = 100,
    standard_multi = 1,
    power = 1320,
    pet_power = 900
    };
getRow(34)->
    #rune_battlepowerCfg {
    propertyId = 34,
    desc = "混乱伤害",
    minitips = "角色混乱伤害",
    standard_addition = 100,
    standard_multi = 1,
    power = 1320,
    pet_power = 900
    };
getRow(35)->
    #rune_battlepowerCfg {
    propertyId = 35,
    desc = "暴击率",
    minitips = "角色暴击几率。",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 1320,
    pet_power = 540
    };
getRow(36)->
    #rune_battlepowerCfg {
    propertyId = 36,
    desc = "暴击伤害",
    minitips = "角色暴击伤害加成。",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 440,
    pet_power = 540
    };
getRow(37)->
    #rune_battlepowerCfg {
    propertyId = 37,
    desc = "格挡减少伤害",
    minitips = "格挡减少伤害",
    standard_addition = 100,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(38)->
    #rune_battlepowerCfg {
    propertyId = 38,
    desc = "技能治疗",
    minitips = "技能治疗",
    standard_addition = 100,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(39)->
    #rune_battlepowerCfg {
    propertyId = 39,
    desc = "受到治疗",
    minitips = "受到治疗",
    standard_addition = 100,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(40)->
    #rune_battlepowerCfg {
    propertyId = 40,
    desc = "移动速度",
    minitips = "角色移动速度",
    standard_addition = 100,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(41)->
    #rune_battlepowerCfg {
    propertyId = 41,
    desc = "伤害反射",
    minitips = "每次被攻击反射伤害值。",
    standard_addition = 100,
    standard_multi = 1,
    power = 3000,
    pet_power = 0.2
    };
getRow(42)->
    #rune_battlepowerCfg {
    propertyId = 42,
    desc = "攻击速度",
    minitips = "攻击速度",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 1800,
    pet_power = 270.4
    };
getRow(43)->
    #rune_battlepowerCfg {
    propertyId = 43,
    desc = "节约能量",
    minitips = "角色能量消耗减少。",
    standard_addition = 100,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(44)->
    #rune_battlepowerCfg {
    propertyId = 44,
    desc = "冷却速度",
    minitips = "角色技能冷却减少。",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 900,
    pet_power = 0.2
    };
getRow(45)->
    #rune_battlepowerCfg {
    propertyId = 45,
    desc = "坚韧",
    minitips = "坚韧",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 1500,
    pet_power = 720
    };
getRow(46)->
    #rune_battlepowerCfg {
    propertyId = 46,
    desc = "吸收盾上限",
    minitips = "吸收盾上限",
    standard_addition = 100,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(47)->
    #rune_battlepowerCfg {
    propertyId = 47,
    desc = "神圣抗性",
    minitips = "神圣抗性",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 900,
    pet_power = 0.2
    };
getRow(48)->
    #rune_battlepowerCfg {
    propertyId = 48,
    desc = "物理抗性",
    minitips = "物理抗性",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 900,
    pet_power = 0.2
    };
getRow(49)->
    #rune_battlepowerCfg {
    propertyId = 49,
    desc = "暗影抗性",
    minitips = "暗影抗性",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 900,
    pet_power = 0.2
    };
getRow(50)->
    #rune_battlepowerCfg {
    propertyId = 50,
    desc = "元素抗性",
    minitips = "元素抗性",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 900,
    pet_power = 0.2
    };
getRow(51)->
    #rune_battlepowerCfg {
    propertyId = 51,
    desc = "混乱抗性",
    minitips = "混乱抗性",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 900,
    pet_power = 0.2
    };
getRow(52)->
    #rune_battlepowerCfg {
    propertyId = 52,
    desc = "强韧",
    minitips = "强韧",
    standard_addition = 100,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(53)->
    #rune_battlepowerCfg {
    propertyId = 53,
    desc = "意志",
    minitips = "意志",
    standard_addition = 100,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(54)->
    #rune_battlepowerCfg {
    propertyId = 54,
    desc = "反射",
    minitips = "反射",
    standard_addition = 100,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(55)->
    #rune_battlepowerCfg {
    propertyId = 55,
    desc = "招架率",
    minitips = "招架敌人攻击几率",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(56)->
    #rune_battlepowerCfg {
    propertyId = 56,
    desc = "闪避率",
    minitips = "闪避敌人攻击几率",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(57)->
    #rune_battlepowerCfg {
    propertyId = 57,
    desc = "格挡率",
    minitips = "格挡敌人攻击几率",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(58)->
    #rune_battlepowerCfg {
    propertyId = 58,
    desc = "伤害吸收",
    minitips = "伤害吸收",
    standard_addition = 100,
    standard_multi = 1,
    power = 30.4,
    pet_power = 0.2
    };
getRow(59)->
    #rune_battlepowerCfg {
    propertyId = 59,
    desc = "全抗性",
    minitips = "全抗性",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 30.4,
    pet_power = 0.2
    };
getRow(60)->
    #rune_battlepowerCfg {
    propertyId = 60,
    desc = "全防御",
    minitips = "全防御",
    standard_addition = 100,
    standard_multi = 1,
    power = 420,
    pet_power = 44.8
    };
getRow(61)->
    #rune_battlepowerCfg {
    propertyId = 61,
    desc = "被暴击",
    minitips = "被暴击",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 900,
    pet_power = 270.4
    };
getRow(62)->
    #rune_battlepowerCfg {
    propertyId = 62,
    desc = "防御增强",
    minitips = "防御增强",
    standard_addition = 100,
    standard_multi = 1,
    power = 900,
    pet_power = 0.2
    };
getRow(63)->
    #rune_battlepowerCfg {
    propertyId = 63,
    desc = "盾牌猛击伤害",
    minitips = "盾牌猛击伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(64)->
    #rune_battlepowerCfg {
    propertyId = 64,
    desc = "净化冷却加速",
    minitips = "净化冷却加速",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(65)->
    #rune_battlepowerCfg {
    propertyId = 65,
    desc = "冲锋冷却加速",
    minitips = "冲锋冷却加速",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(66)->
    #rune_battlepowerCfg {
    propertyId = 66,
    desc = "永恒之光伤害",
    minitips = "永恒之光伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(67)->
    #rune_battlepowerCfg {
    propertyId = 67,
    desc = "忏悔伤害",
    minitips = "忏悔伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(68)->
    #rune_battlepowerCfg {
    propertyId = 68,
    desc = "黎明之锤冷却加速",
    minitips = "黎明之锤冷却加速",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(69)->
    #rune_battlepowerCfg {
    propertyId = 69,
    desc = "荣耀圣令伤害",
    minitips = "荣耀圣令伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(70)->
    #rune_battlepowerCfg {
    propertyId = 70,
    desc = "火球术伤害",
    minitips = "火球术伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(71)->
    #rune_battlepowerCfg {
    propertyId = 71,
    desc = "陨石术伤害",
    minitips = "陨石术伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(72)->
    #rune_battlepowerCfg {
    propertyId = 72,
    desc = "冰环术冷却加速",
    minitips = "炎爆冷却加速",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(73)->
    #rune_battlepowerCfg {
    propertyId = 73,
    desc = "冰环术伤害",
    minitips = "冰枪术伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(74)->
    #rune_battlepowerCfg {
    propertyId = 74,
    desc = "冰风暴伤害",
    minitips = "冰风暴伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(75)->
    #rune_battlepowerCfg {
    propertyId = 75,
    desc = "能量冲击伤害",
    minitips = "能量冲击伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(76)->
    #rune_battlepowerCfg {
    propertyId = 76,
    desc = "生命收割冷却加速",
    minitips = "生命收割冷却加速",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(77)->
    #rune_battlepowerCfg {
    propertyId = 77,
    desc = "灵魂湮灭冷却加速",
    minitips = "灵魂湮灭冷却加速",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(78)->
    #rune_battlepowerCfg {
    propertyId = 78,
    desc = "亵渎伤害",
    minitips = "亵渎伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(79)->
    #rune_battlepowerCfg {
    propertyId = 79,
    desc = "末日决战伤害",
    minitips = "末日决战伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(80)->
    #rune_battlepowerCfg {
    propertyId = 80,
    desc = "灵魂漩涡伤害",
    minitips = "灵魂漩涡伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(81)->
    #rune_battlepowerCfg {
    propertyId = 81,
    desc = "死亡风暴伤害",
    minitips = "死亡风暴伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(82)->
    #rune_battlepowerCfg {
    propertyId = 82,
    desc = "死亡斩杀伤害",
    minitips = "死亡斩杀伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(83)->
    #rune_battlepowerCfg {
    propertyId = 83,
    desc = "烈风斩伤害",
    minitips = "烈风斩伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(84)->
    #rune_battlepowerCfg {
    propertyId = 84,
    desc = "致命投掷冷却加速",
    minitips = "致命投掷冷却加速",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(85)->
    #rune_battlepowerCfg {
    propertyId = 85,
    desc = "缴械伤害",
    minitips = "雷光刺伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(86)->
    #rune_battlepowerCfg {
    propertyId = 86,
    desc = "灭寂伤害",
    minitips = "灭寂伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(87)->
    #rune_battlepowerCfg {
    propertyId = 87,
    desc = "乱影击伤害",
    minitips = "乱影击伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(88)->
    #rune_battlepowerCfg {
    propertyId = 88,
    desc = "致命投掷伤害",
    minitips = "剪切伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(89)->
    #rune_battlepowerCfg {
    propertyId = 89,
    desc = "一闪冷却加速",
    minitips = "一闪冷却加速",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(90)->
    #rune_battlepowerCfg {
    propertyId = 90,
    desc = "影袭伤害",
    minitips = "影袭伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(91)->
    #rune_battlepowerCfg {
    propertyId = 91,
    desc = "魔宠伤害",
    minitips = "魔宠伤害",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(92)->
    #rune_battlepowerCfg {
    propertyId = 92,
    desc = "恶魔仆人伤害",
    minitips = "恶魔仆人伤害",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(93)->
    #rune_battlepowerCfg {
    propertyId = 93,
    desc = "远古恶魔伤害",
    minitips = "远古恶魔伤害",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(94)->
    #rune_battlepowerCfg {
    propertyId = 94,
    desc = "恢复精通",
    minitips = "恢复精通",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(95)->
    #rune_battlepowerCfg {
    propertyId = 95,
    desc = "伤害精通",
    minitips = "伤害精通",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(96)->
    #rune_battlepowerCfg {
    propertyId = 96,
    desc = "亵渎冷却加速",
    minitips = "亵渎冷却加速",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(97)->
    #rune_battlepowerCfg {
    propertyId = 97,
    desc = "远古恶魔冷却加速",
    minitips = "远古恶魔冷却加速",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(98)->
    #rune_battlepowerCfg {
    propertyId = 98,
    desc = "清算节约能量",
    minitips = "清算节约能量",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(99)->
    #rune_battlepowerCfg {
    propertyId = 99,
    desc = "火球术施法加速",
    minitips = "火球术施法加速",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(100)->
    #rune_battlepowerCfg {
    propertyId = 100,
    desc = "冰枪术施法加速",
    minitips = "冰枪术施法加速",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(101)->
    #rune_battlepowerCfg {
    propertyId = 101,
    desc = "消耗圣力恢复生命",
    minitips = "消耗圣力恢复生命",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(102)->
    #rune_battlepowerCfg {
    propertyId = 102,
    desc = "消耗魔怒恢复生命",
    minitips = "消耗魔怒恢复生命",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(103)->
    #rune_battlepowerCfg {
    propertyId = 103,
    desc = "体力上限",
    minitips = "体力上限",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(104)->
    #rune_battlepowerCfg {
    propertyId = 104,
    desc = "每秒恢复体力",
    minitips = "每秒恢复体力",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(105)->
    #rune_battlepowerCfg {
    propertyId = 105,
    desc = "觉醒冷却加速",
    minitips = "觉醒冷却加速",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 600,
    pet_power = 0.2
    };
getRow(106)->
    #rune_battlepowerCfg {
    propertyId = 106,
    desc = "觉醒持续时间",
    minitips = "觉醒持续时间",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 1200,
    pet_power = 0.2
    };
getRow(107)->
    #rune_battlepowerCfg {
    propertyId = 107,
    desc = "永恒之光冷却加速",
    minitips = "永恒之光冷却加速",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(108)->
    #rune_battlepowerCfg {
    propertyId = 108,
    desc = "王者圣令持续时间",
    minitips = "王者圣令持续时间",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(109)->
    #rune_battlepowerCfg {
    propertyId = 109,
    desc = "希望圣令持续时间",
    minitips = "希望圣令持续时间",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(110)->
    #rune_battlepowerCfg {
    propertyId = 110,
    desc = "邪恶灵气冷却加速",
    minitips = "邪恶灵气冷却加速",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(111)->
    #rune_battlepowerCfg {
    propertyId = 111,
    desc = "暗影灵气冷却加速",
    minitips = "暗影灵气冷却加速",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(112)->
    #rune_battlepowerCfg {
    propertyId = 112,
    desc = "无双上限",
    minitips = "神器技能无双上限值",
    standard_addition = 100,
    standard_multi = 1,
    power = 30.4,
    pet_power = 0.2
    };
getRow(113)->
    #rune_battlepowerCfg {
    propertyId = 113,
    desc = "每秒无双恢复",
    minitips = "每秒无双恢复值",
    standard_addition = 100,
    standard_multi = 1,
    power = 30.4,
    pet_power = 0.2
    };
getRow(114)->
    #rune_battlepowerCfg {
    propertyId = 114,
    desc = "骑宠出手速度",
    minitips = "骑宠远征出手速度",
    standard_addition = 1,
    standard_multi = 1,
    power = 44.8,
    pet_power = 135.2
    };
getRow(115)->
    #rune_battlepowerCfg {
    propertyId = 115,
    desc = "绝对伤害",
    minitips = "绝对伤害",
    standard_addition = 100,
    standard_multi = 1,
    power = 1280,
    pet_power = 0.2
    };
getRow(116)->
    #rune_battlepowerCfg {
    propertyId = 116,
    desc = "绝对防御",
    minitips = "绝对防御",
    standard_addition = 100,
    standard_multi = 1,
    power = 1000,
    pet_power = 0.2
    };
getRow(117)->
    #rune_battlepowerCfg {
    propertyId = 117,
    desc = "暴击豁免",
    minitips = "暴击豁免",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 1600,
    pet_power = 0.2
    };
getRow(118)->
    #rune_battlepowerCfg {
    propertyId = 118,
    desc = "暴伤减免",
    minitips = "暴伤减免",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 300,
    pet_power = 0.2
    };
getRow(119)->
    #rune_battlepowerCfg {
    propertyId = 119,
    desc = "眩晕豁免",
    minitips = "眩晕豁免",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 1350.4,
    pet_power = 0.2
    };
getRow(120)->
    #rune_battlepowerCfg {
    propertyId = 120,
    desc = "冰冻豁免",
    minitips = "冰冻豁免",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 1350.4,
    pet_power = 0.2
    };
getRow(121)->
    #rune_battlepowerCfg {
    propertyId = 121,
    desc = "减速豁免",
    minitips = "减速豁免",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 1350.4,
    pet_power = 0.2
    };
getRow(122)->
    #rune_battlepowerCfg {
    propertyId = 122,
    desc = "眩晕概率",
    minitips = "眩晕概率",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 1350.4,
    pet_power = 0.2
    };
getRow(123)->
    #rune_battlepowerCfg {
    propertyId = 123,
    desc = "冰冻概率",
    minitips = "冰冻概率",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 1350.4,
    pet_power = 0.2
    };
getRow(124)->
    #rune_battlepowerCfg {
    propertyId = 124,
    desc = "减速概率",
    minitips = "减速概率",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 1350.4,
    pet_power = 0.2
    };
getRow(125)->
    #rune_battlepowerCfg {
    propertyId = 125,
    desc = "命中率",
    minitips = "命中率",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 180
    };
getRow(126)->
    #rune_battlepowerCfg {
    propertyId = 126,
    desc = "火力上限",
    minitips = "枪械师能量上限值。",
    standard_addition = 5,
    standard_multi = 1,
    power = 1600,
    pet_power = 0.2
    };
getRow(127)->
    #rune_battlepowerCfg {
    propertyId = 127,
    desc = "每秒恢复火力",
    minitips = "枪械师能量恢复值。",
    standard_addition = 1,
    standard_multi = 1,
    power = 2000,
    pet_power = 0.2
    };
getRow(128)->
    #rune_battlepowerCfg {
    propertyId = 128,
    desc = "点射",
    minitips = "点射伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(129)->
    #rune_battlepowerCfg {
    propertyId = 129,
    desc = "爆炎手雷",
    minitips = "爆炎手雷伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(130)->
    #rune_battlepowerCfg {
    propertyId = 130,
    desc = "火焰喷射",
    minitips = "火焰喷射伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(131)->
    #rune_battlepowerCfg {
    propertyId = 131,
    desc = "激光射线",
    minitips = "激光射线伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(132)->
    #rune_battlepowerCfg {
    propertyId = 132,
    desc = "重力炸弹",
    minitips = "重力炸弹伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(133)->
    #rune_battlepowerCfg {
    propertyId = 133,
    desc = "击退",
    minitips = "击退伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(134)->
    #rune_battlepowerCfg {
    propertyId = 134,
    desc = "扫射",
    minitips = "扫射伤害",
    standard_addition = 0.01,
    standard_multi = 1,
    power = 780,
    pet_power = 0.2
    };
getRow(135)->
    #rune_battlepowerCfg {
    propertyId = 135,
    desc = "生命",
    minitips = "生命",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(136)->
    #rune_battlepowerCfg {
    propertyId = 136,
    desc = "物攻",
    minitips = "物攻",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(137)->
    #rune_battlepowerCfg {
    propertyId = 137,
    desc = "法攻",
    minitips = "法攻",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(138)->
    #rune_battlepowerCfg {
    propertyId = 138,
    desc = "物防",
    minitips = "物防",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(139)->
    #rune_battlepowerCfg {
    propertyId = 139,
    desc = "法防",
    minitips = "法防",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(140)->
    #rune_battlepowerCfg {
    propertyId = 140,
    desc = "暴击等级",
    minitips = "暴击等级",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(141)->
    #rune_battlepowerCfg {
    propertyId = 141,
    desc = "抗爆等级",
    minitips = "抗爆等级",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(142)->
    #rune_battlepowerCfg {
    propertyId = 142,
    desc = "爆伤等级",
    minitips = "爆伤等级",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(143)->
    #rune_battlepowerCfg {
    propertyId = 143,
    desc = "韧性等级",
    minitips = "韧性等级",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(144)->
    #rune_battlepowerCfg {
    propertyId = 144,
    desc = "命中等级",
    minitips = "命中等级",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(145)->
    #rune_battlepowerCfg {
    propertyId = 145,
    desc = "闪避等级",
    minitips = "闪避等级",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(146)->
    #rune_battlepowerCfg {
    propertyId = 146,
    desc = "破甲等级",
    minitips = "破甲等级",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(147)->
    #rune_battlepowerCfg {
    propertyId = 147,
    desc = "Hp自动回复",
    minitips = "Hp自动回复",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
    };
getRow(148)->
    #rune_battlepowerCfg {
    propertyId = 148,
    desc = "Mp自动回复",
    minitips = "Mp自动回复",
    standard_addition = 1,
    standard_multi = 1,
    power = 0,
    pet_power = 0.2
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
    {91},
    {92},
    {93},
    {94},
    {95},
    {96},
    {97},
    {98},
    {99},
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
    {111},
    {112},
    {113},
    {114},
    {115},
    {116},
    {117},
    {118},
    {119},
    {120},
    {121},
    {122},
    {123},
    {124},
    {125},
    {126},
    {127},
    {128},
    {129},
    {130},
    {131},
    {132},
    {133},
    {134},
    {135},
    {136},
    {137},
    {138},
    {139},
    {140},
    {141},
    {142},
    {143},
    {144},
    {145},
    {146},
    {147},
    {148}
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
    91,
    92,
    93,
    94,
    95,
    96,
    97,
    98,
    99,
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
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119,
    120,
    121,
    122,
    123,
    124,
    125,
    126,
    127,
    128,
    129,
    130,
    131,
    132,
    133,
    134,
    135,
    136,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    147,
    148
    ].

