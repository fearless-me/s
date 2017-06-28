%% coding: latin-1
%%: 实现
-module(cfg_battlePropInfo_chs).
-compile(export_all).
-include("cfg_battlePropInfo.hrl").
-include("logger.hrl").

getRow(1)->
    #battlePropInfoCfg {
    propertyId = 1,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "力量",
    display = 0,
    sequence = 1001,
    propclass = 0,
    minitips = "骑士和魔女的主属性，可以提高伤害。对于所有职业可以换算为物理防御。",
    rolePanelShow = 1
    };
getRow(2)->
    #battlePropInfoCfg {
    propertyId = 2,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "敏捷",
    display = 0,
    sequence = 1002,
    propclass = 0,
    minitips = "刺客和枪械师的主属性，可以提高伤害。对于所有职业可以换算为闪避率。",
    rolePanelShow = 1
    };
getRow(3)->
    #battlePropInfoCfg {
    propertyId = 3,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "智力",
    display = 0,
    sequence = 1003,
    propclass = 0,
    minitips = "魔法师的主属性，可以提高伤害。对于所有职业可以换算魔法防御。",
    rolePanelShow = 1
    };
getRow(4)->
    #battlePropInfoCfg {
    propertyId = 4,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "体质",
    display = 0,
    sequence = 1004,
    propclass = 0,
    minitips = "所有职业的主属性，可以提高生命上限。",
    rolePanelShow = 1
    };
getRow(5)->
    #battlePropInfoCfg {
    propertyId = 5,
    formulaIndex = 1,
    ownerType = 1,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "幸运",
    display = 0,
    sequence = 1005,
    propclass = 0,
    minitips = "所有职业的主属性，可以影响装备掉率。",
    rolePanelShow = 1
    };
getRow(6)->
    #battlePropInfoCfg {
    propertyId = 6,
    formulaIndex = 1,
    ownerType = 1,
    minNum = -2147483647,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "药水效果",
    display = 0,
    sequence = 1006,
    propclass = 0,
    minitips = "提高药水恢复效果。",
    rolePanelShow = 1
    };
getRow(7)->
    #battlePropInfoCfg {
    propertyId = 7,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "生存精通",
    display = 3,
    sequence = 46,
    propclass = 0,
    minitips = "生存精通",
    rolePanelShow = 1
    };
getRow(8)->
    #battlePropInfoCfg {
    propertyId = 8,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "对精英伤害",
    display = 3,
    sequence = 47,
    propclass = 0,
    minitips = "增加对精英或首领怪的伤害。",
    rolePanelShow = 1
    };
getRow(9)->
    #battlePropInfoCfg {
    propertyId = 9,
    formulaIndex = 1,
    ownerType = 3,
    minNum = -0.75,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "受到精英伤害",
    display = 3,
    sequence = 48,
    propclass = 0,
    minitips = "受到精英伤害",
    rolePanelShow = 1
    };
getRow(10)->
    #battlePropInfoCfg {
    propertyId = 10,
    formulaIndex = 1,
    ownerType = 1,
    minNum = 1,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "圣力上限",
    display = 0,
    sequence = 1007,
    propclass = 1,
    minitips = "骑士能量上限值。",
    rolePanelShow = 1
    };
getRow(11)->
    #battlePropInfoCfg {
    propertyId = 11,
    formulaIndex = 1,
    ownerType = 1,
    minNum = -50,
    maxNum = 2147483647,
    baseValue = 1.5,
    desc = "每秒恢复圣力",
    display = 1,
    sequence = 30,
    propclass = 1,
    minitips = "每秒圣力恢复值。",
    rolePanelShow = 1
    };
getRow(12)->
    #battlePropInfoCfg {
    propertyId = 12,
    formulaIndex = 1,
    ownerType = 1,
    minNum = 1,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "秘法上限",
    display = 0,
    sequence = 1008,
    propclass = 2,
    minitips = "法师能量上限值。",
    rolePanelShow = 1
    };
getRow(13)->
    #battlePropInfoCfg {
    propertyId = 13,
    formulaIndex = 1,
    ownerType = 1,
    minNum = -50,
    maxNum = 2147483647,
    baseValue = 10,
    desc = "每秒恢复秘法",
    display = 1,
    sequence = 31,
    propclass = 2,
    minitips = "每秒秘法恢复值。",
    rolePanelShow = 1
    };
getRow(14)->
    #battlePropInfoCfg {
    propertyId = 14,
    formulaIndex = 1,
    ownerType = 1,
    minNum = 1,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "魔怒上限",
    display = 0,
    sequence = 1009,
    propclass = 4,
    minitips = "魔女能量上限值。",
    rolePanelShow = 1
    };
getRow(15)->
    #battlePropInfoCfg {
    propertyId = 15,
    formulaIndex = 1,
    ownerType = 1,
    minNum = -50,
    maxNum = 2147483647,
    baseValue = -1,
    desc = "每秒恢复魔怒",
    display = 1,
    sequence = 32,
    propclass = 4,
    minitips = "每秒魔怒恢复值。",
    rolePanelShow = 1
    };
getRow(16)->
    #battlePropInfoCfg {
    propertyId = 16,
    formulaIndex = 1,
    ownerType = 1,
    minNum = 1,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "影力上限",
    display = 0,
    sequence = 1010,
    propclass = 3,
    minitips = "刺客能量上限值。",
    rolePanelShow = 1
    };
getRow(17)->
    #battlePropInfoCfg {
    propertyId = 17,
    formulaIndex = 1,
    ownerType = 1,
    minNum = -50,
    maxNum = 2147483647,
    baseValue = 8.5,
    desc = "每秒恢复影力",
    display = 1,
    sequence = 33,
    propclass = 3,
    minitips = "每秒影力恢复值。",
    rolePanelShow = 1
    };
getRow(18)->
    #battlePropInfoCfg {
    propertyId = 18,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 1,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "生命上限",
    display = 0,
    sequence = 13,
    propclass = 0,
    minitips = "角色生命上限值。",
    rolePanelShow = 1
    };
getRow(19)->
    #battlePropInfoCfg {
    propertyId = 19,
    formulaIndex = 1,
    ownerType = 0,
    minNum = -2147483647,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "每秒恢复生命",
    display = 0,
    sequence = 14,
    propclass = 0,
    minitips = "每秒生命恢复值。",
    rolePanelShow = 1
    };
getRow(20)->
    #battlePropInfoCfg {
    propertyId = 20,
    formulaIndex = 1,
    ownerType = 0,
    minNum = -1,
    maxNum = 1,
    baseValue = 0,
    desc = "每秒恢复生命上限",
    display = 3,
    sequence = 51,
    propclass = 0,
    minitips = "每秒恢复生命上限",
    rolePanelShow = 1
    };
getRow(21)->
    #battlePropInfoCfg {
    propertyId = 21,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "击中恢复生命",
    display = 0,
    sequence = 15,
    propclass = 0,
    minitips = "击中恢复生命",
    rolePanelShow = 1
    };
getRow(22)->
    #battlePropInfoCfg {
    propertyId = 22,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "伤害恢复生命",
    display = 3,
    sequence = 52,
    propclass = 0,
    minitips = "伤害恢复生命",
    rolePanelShow = 1
    };
getRow(23)->
    #battlePropInfoCfg {
    propertyId = 23,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "法力上限",
    display = 0,
    sequence = 16,
    propclass = 0,
    minitips = "法力上限值。",
    rolePanelShow = 1
    };
getRow(24)->
    #battlePropInfoCfg {
    propertyId = 24,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "每秒恢复法力",
    display = 0,
    sequence = 17,
    propclass = 0,
    minitips = "每秒恢复法力",
    rolePanelShow = 1
    };
getRow(25)->
    #battlePropInfoCfg {
    propertyId = 25,
    formulaIndex = 5,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "神圣防御作废",
    display = 0,
    sequence = 19,
    propclass = 0,
    minitips = "神圣防御作废",
    rolePanelShow = 1
    };
getRow(26)->
    #battlePropInfoCfg {
    propertyId = 26,
    formulaIndex = 6,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "物理防御",
    display = 0,
    sequence = 18,
    propclass = 0,
    minitips = "角色物理防御值",
    rolePanelShow = 1
    };
getRow(27)->
    #battlePropInfoCfg {
    propertyId = 27,
    formulaIndex = 5,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "暗影防御作废",
    display = 0,
    sequence = 20,
    propclass = 0,
    minitips = "暗影防御作废",
    rolePanelShow = 1
    };
getRow(28)->
    #battlePropInfoCfg {
    propertyId = 28,
    formulaIndex = 6,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "魔法防御",
    display = 0,
    sequence = 21,
    propclass = 0,
    minitips = "角色魔法防御",
    rolePanelShow = 1
    };
getRow(29)->
    #battlePropInfoCfg {
    propertyId = 29,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "混乱防御作废",
    display = 0,
    sequence = 22,
    propclass = 0,
    minitips = "角色混乱防御",
    rolePanelShow = 1
    };
getRow(30)->
    #battlePropInfoCfg {
    propertyId = 30,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "神圣伤害",
    display = 0,
    sequence = 24,
    propclass = 0,
    minitips = "角色神圣伤害",
    rolePanelShow = 1
    };
getRow(31)->
    #battlePropInfoCfg {
    propertyId = 31,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "物理伤害",
    display = 0,
    sequence = 23,
    propclass = 0,
    minitips = "角色物理伤害",
    rolePanelShow = 1
    };
getRow(32)->
    #battlePropInfoCfg {
    propertyId = 32,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "暗影伤害",
    display = 0,
    sequence = 25,
    propclass = 0,
    minitips = "角色暗影伤害",
    rolePanelShow = 1
    };
getRow(33)->
    #battlePropInfoCfg {
    propertyId = 33,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "元素伤害",
    display = 0,
    sequence = 26,
    propclass = 0,
    minitips = "角色元素伤害",
    rolePanelShow = 1
    };
getRow(34)->
    #battlePropInfoCfg {
    propertyId = 34,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "混乱伤害作废",
    display = 0,
    sequence = 27,
    propclass = 0,
    minitips = "角色混乱伤害",
    rolePanelShow = 1
    };
getRow(35)->
    #battlePropInfoCfg {
    propertyId = 35,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 1,
    baseValue = 0.05,
    desc = "暴击率",
    display = 3,
    sequence = 53,
    propclass = 0,
    minitips = "角色暴击几率。",
    rolePanelShow = 1
    };
getRow(36)->
    #battlePropInfoCfg {
    propertyId = 36,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 5,
    baseValue = 1.35,
    desc = "暴击伤害",
    display = 3,
    sequence = 54,
    propclass = 0,
    minitips = "角色暴击伤害加成。",
    rolePanelShow = 1
    };
getRow(37)->
    #battlePropInfoCfg {
    propertyId = 37,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 1,
    baseValue = 0.33,
    desc = "格挡减少伤害",
    display = 3,
    sequence = 55,
    propclass = 0,
    minitips = "格挡减少伤害",
    rolePanelShow = 1
    };
getRow(38)->
    #battlePropInfoCfg {
    propertyId = 38,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 1,
    desc = "技能治疗",
    display = 0,
    sequence = 28,
    propclass = 0,
    minitips = "技能治疗",
    rolePanelShow = 1
    };
getRow(39)->
    #battlePropInfoCfg {
    propertyId = 39,
    formulaIndex = 1,
    ownerType = 0,
    minNum = -0.95,
    maxNum = 5,
    baseValue = 1,
    desc = "受到治疗",
    display = 2,
    sequence = 39,
    propclass = 0,
    minitips = "受到治疗",
    rolePanelShow = 1
    };
getRow(40)->
    #battlePropInfoCfg {
    propertyId = 40,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 14,
    baseValue = 0,
    desc = "移动速度",
    display = 1,
    sequence = 36,
    propclass = 0,
    minitips = "角色移动速度",
    rolePanelShow = 1
    };
getRow(41)->
    #battlePropInfoCfg {
    propertyId = 41,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "伤害反射",
    display = 0,
    sequence = 29,
    propclass = 0,
    minitips = "每次被攻击反射伤害值。",
    rolePanelShow = 1
    };
getRow(42)->
    #battlePropInfoCfg {
    propertyId = 42,
    formulaIndex = 1,
    ownerType = 0,
    minNum = -0.95,
    maxNum = 3,
    baseValue = 0,
    desc = "攻击速度",
    display = 3,
    sequence = 56,
    propclass = 0,
    minitips = "攻击速度",
    rolePanelShow = 1
    };
getRow(43)->
    #battlePropInfoCfg {
    propertyId = 43,
    formulaIndex = 1,
    ownerType = 0,
    minNum = -0.95,
    maxNum = 3,
    baseValue = 0,
    desc = "节约能量",
    display = 3,
    sequence = 57,
    propclass = 0,
    minitips = "角色能量消耗减少。",
    rolePanelShow = 1
    };
getRow(44)->
    #battlePropInfoCfg {
    propertyId = 44,
    formulaIndex = 1,
    ownerType = 0,
    minNum = -0.95,
    maxNum = 3,
    baseValue = 0,
    desc = "冷却速度",
    display = 3,
    sequence = 58,
    propclass = 0,
    minitips = "角色技能冷却减少。",
    rolePanelShow = 1
    };
getRow(45)->
    #battlePropInfoCfg {
    propertyId = 45,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 1,
    baseValue = 0,
    desc = "坚韧",
    display = 2,
    sequence = 40,
    propclass = 0,
    minitips = "坚韧",
    rolePanelShow = 1
    };
getRow(46)->
    #battlePropInfoCfg {
    propertyId = 46,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "吸收盾上限",
    display = 0,
    sequence = 30,
    propclass = 0,
    minitips = "吸收盾上限",
    rolePanelShow = 1
    };
getRow(47)->
    #battlePropInfoCfg {
    propertyId = 47,
    formulaIndex = 4,
    ownerType = 0,
    minNum = -5,
    maxNum = 1,
    baseValue = 0,
    desc = "神圣抗性",
    display = 2,
    sequence = 41,
    propclass = 0,
    minitips = "神圣抗性",
    rolePanelShow = 1
    };
getRow(48)->
    #battlePropInfoCfg {
    propertyId = 48,
    formulaIndex = 4,
    ownerType = 0,
    minNum = -5,
    maxNum = 1,
    baseValue = 0,
    desc = "物理抗性",
    display = 2,
    sequence = 42,
    propclass = 0,
    minitips = "物理抗性",
    rolePanelShow = 1
    };
getRow(49)->
    #battlePropInfoCfg {
    propertyId = 49,
    formulaIndex = 4,
    ownerType = 0,
    minNum = -5,
    maxNum = 1,
    baseValue = 0,
    desc = "暗影抗性",
    display = 2,
    sequence = 43,
    propclass = 0,
    minitips = "暗影抗性",
    rolePanelShow = 1
    };
getRow(50)->
    #battlePropInfoCfg {
    propertyId = 50,
    formulaIndex = 4,
    ownerType = 0,
    minNum = -5,
    maxNum = 1,
    baseValue = 0,
    desc = "元素抗性",
    display = 2,
    sequence = 44,
    propclass = 0,
    minitips = "元素抗性",
    rolePanelShow = 1
    };
getRow(51)->
    #battlePropInfoCfg {
    propertyId = 51,
    formulaIndex = 2,
    ownerType = 0,
    minNum = -5,
    maxNum = 1,
    baseValue = 0,
    desc = "混乱抗性",
    display = 2,
    sequence = 45,
    propclass = 0,
    minitips = "混乱抗性",
    rolePanelShow = 1
    };
getRow(52)->
    #battlePropInfoCfg {
    propertyId = 52,
    formulaIndex = 2,
    ownerType = 0,
    minNum = -1,
    maxNum = 1,
    baseValue = 0,
    desc = "强韧",
    display = 3,
    sequence = 59,
    propclass = 0,
    minitips = "强韧",
    rolePanelShow = 1
    };
getRow(53)->
    #battlePropInfoCfg {
    propertyId = 53,
    formulaIndex = 2,
    ownerType = 0,
    minNum = -1,
    maxNum = 1,
    baseValue = 0,
    desc = "意志",
    display = 3,
    sequence = 60,
    propclass = 0,
    minitips = "意志",
    rolePanelShow = 1
    };
getRow(54)->
    #battlePropInfoCfg {
    propertyId = 54,
    formulaIndex = 2,
    ownerType = 0,
    minNum = -1,
    maxNum = 1,
    baseValue = 0,
    desc = "反射",
    display = 3,
    sequence = 61,
    propclass = 0,
    minitips = "反射",
    rolePanelShow = 1
    };
getRow(55)->
    #battlePropInfoCfg {
    propertyId = 55,
    formulaIndex = 2,
    ownerType = 0,
    minNum = 0,
    maxNum = 1,
    baseValue = 0,
    desc = "招架率",
    display = 3,
    sequence = 62,
    propclass = 0,
    minitips = "招架敌人攻击几率",
    rolePanelShow = 1
    };
getRow(56)->
    #battlePropInfoCfg {
    propertyId = 56,
    formulaIndex = 3,
    ownerType = 0,
    minNum = 0,
    maxNum = 1,
    baseValue = 0,
    desc = "闪避率",
    display = 3,
    sequence = 63,
    propclass = 0,
    minitips = "闪避敌人攻击几率",
    rolePanelShow = 1
    };
getRow(57)->
    #battlePropInfoCfg {
    propertyId = 57,
    formulaIndex = 2,
    ownerType = 0,
    minNum = 0,
    maxNum = 1,
    baseValue = 0,
    desc = "格挡率",
    display = 3,
    sequence = 64,
    propclass = 0,
    minitips = "格挡敌人攻击几率",
    rolePanelShow = 1
    };
getRow(58)->
    #battlePropInfoCfg {
    propertyId = 58,
    formulaIndex = 2,
    ownerType = 0,
    minNum = 0,
    maxNum = 1,
    baseValue = 0,
    desc = "伤害吸收",
    display = 2,
    sequence = 46,
    propclass = 0,
    minitips = "伤害吸收",
    rolePanelShow = 1
    };
getRow(59)->
    #battlePropInfoCfg {
    propertyId = 59,
    formulaIndex = 1,
    ownerType = 0,
    minNum = -5,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "全抗性",
    display = 2,
    sequence = 47,
    propclass = 0,
    minitips = "全抗性",
    rolePanelShow = 1
    };
getRow(60)->
    #battlePropInfoCfg {
    propertyId = 60,
    formulaIndex = 1,
    ownerType = 0,
    minNum = -10000,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "全防御",
    display = 0,
    sequence = 31,
    propclass = 0,
    minitips = "全防御",
    rolePanelShow = 1
    };
getRow(61)->
    #battlePropInfoCfg {
    propertyId = 61,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 1,
    baseValue = 0,
    desc = "被暴击",
    display = 3,
    sequence = 65,
    propclass = 0,
    minitips = "被暴击",
    rolePanelShow = 1
    };
getRow(62)->
    #battlePropInfoCfg {
    propertyId = 62,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "防御增强",
    display = 3,
    sequence = 66,
    propclass = 0,
    minitips = "防御增强",
    rolePanelShow = 1
    };
getRow(63)->
    #battlePropInfoCfg {
    propertyId = 63,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "盾牌猛击伤害",
    display = 3,
    sequence = 67,
    propclass = 1,
    minitips = "盾牌猛击伤害",
    rolePanelShow = 1
    };
getRow(64)->
    #battlePropInfoCfg {
    propertyId = 64,
    formulaIndex = 2,
    ownerType = 3,
    minNum = -5,
    maxNum = 0.95,
    baseValue = 0,
    desc = "净化冷却加速",
    display = 3,
    sequence = 68,
    propclass = 1,
    minitips = "净化冷却加速",
    rolePanelShow = 1
    };
getRow(65)->
    #battlePropInfoCfg {
    propertyId = 65,
    formulaIndex = 2,
    ownerType = 3,
    minNum = -5,
    maxNum = 0.95,
    baseValue = 0,
    desc = "冲锋冷却加速",
    display = 3,
    sequence = 69,
    propclass = 1,
    minitips = "冲锋冷却加速",
    rolePanelShow = 1
    };
getRow(66)->
    #battlePropInfoCfg {
    propertyId = 66,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "永恒之光伤害",
    display = 3,
    sequence = 70,
    propclass = 1,
    minitips = "永恒之光伤害",
    rolePanelShow = 1
    };
getRow(67)->
    #battlePropInfoCfg {
    propertyId = 67,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "忏悔伤害",
    display = 3,
    sequence = 71,
    propclass = 1,
    minitips = "忏悔伤害",
    rolePanelShow = 1
    };
getRow(68)->
    #battlePropInfoCfg {
    propertyId = 68,
    formulaIndex = 2,
    ownerType = 3,
    minNum = -5,
    maxNum = 0.95,
    baseValue = 0,
    desc = "黎明之锤冷却加速",
    display = 3,
    sequence = 72,
    propclass = 1,
    minitips = "黎明之锤冷却加速",
    rolePanelShow = 1
    };
getRow(69)->
    #battlePropInfoCfg {
    propertyId = 69,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "荣耀圣令伤害",
    display = 3,
    sequence = 73,
    propclass = 1,
    minitips = "荣耀圣令伤害",
    rolePanelShow = 1
    };
getRow(70)->
    #battlePropInfoCfg {
    propertyId = 70,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "火球术伤害",
    display = 3,
    sequence = 74,
    propclass = 2,
    minitips = "火球术伤害",
    rolePanelShow = 1
    };
getRow(71)->
    #battlePropInfoCfg {
    propertyId = 71,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "陨石术伤害",
    display = 3,
    sequence = 75,
    propclass = 2,
    minitips = "陨石术伤害",
    rolePanelShow = 1
    };
getRow(72)->
    #battlePropInfoCfg {
    propertyId = 72,
    formulaIndex = 2,
    ownerType = 3,
    minNum = -5,
    maxNum = 0.95,
    baseValue = 0,
    desc = "冰环术冷却加速",
    display = 3,
    sequence = 76,
    propclass = 2,
    minitips = "炎爆冷却加速",
    rolePanelShow = 1
    };
getRow(73)->
    #battlePropInfoCfg {
    propertyId = 73,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "冰环术伤害",
    display = 3,
    sequence = 77,
    propclass = 2,
    minitips = "冰枪术伤害",
    rolePanelShow = 1
    };
getRow(74)->
    #battlePropInfoCfg {
    propertyId = 74,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "冰风暴伤害",
    display = 3,
    sequence = 78,
    propclass = 2,
    minitips = "冰风暴伤害",
    rolePanelShow = 1
    };
getRow(75)->
    #battlePropInfoCfg {
    propertyId = 75,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "能量冲击伤害",
    display = 3,
    sequence = 79,
    propclass = 2,
    minitips = "能量冲击伤害",
    rolePanelShow = 1
    };
getRow(76)->
    #battlePropInfoCfg {
    propertyId = 76,
    formulaIndex = 2,
    ownerType = 3,
    minNum = -5,
    maxNum = 0.95,
    baseValue = 0,
    desc = "生命收割冷却加速",
    display = 3,
    sequence = 80,
    propclass = 4,
    minitips = "生命收割冷却加速",
    rolePanelShow = 1
    };
getRow(77)->
    #battlePropInfoCfg {
    propertyId = 77,
    formulaIndex = 2,
    ownerType = 3,
    minNum = -5,
    maxNum = 0.95,
    baseValue = 0,
    desc = "灵魂湮灭冷却加速",
    display = 3,
    sequence = 81,
    propclass = 4,
    minitips = "灵魂湮灭冷却加速",
    rolePanelShow = 1
    };
getRow(78)->
    #battlePropInfoCfg {
    propertyId = 78,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "亵渎伤害",
    display = 3,
    sequence = 82,
    propclass = 4,
    minitips = "亵渎伤害",
    rolePanelShow = 1
    };
getRow(79)->
    #battlePropInfoCfg {
    propertyId = 79,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "末日决战伤害",
    display = 3,
    sequence = 83,
    propclass = 4,
    minitips = "末日决战伤害",
    rolePanelShow = 1
    };
getRow(80)->
    #battlePropInfoCfg {
    propertyId = 80,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "灵魂漩涡伤害",
    display = 3,
    sequence = 84,
    propclass = 4,
    minitips = "灵魂漩涡伤害",
    rolePanelShow = 1
    };
getRow(81)->
    #battlePropInfoCfg {
    propertyId = 81,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "死亡风暴伤害",
    display = 3,
    sequence = 85,
    propclass = 4,
    minitips = "死亡风暴伤害",
    rolePanelShow = 1
    };
getRow(82)->
    #battlePropInfoCfg {
    propertyId = 82,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "死亡斩杀伤害",
    display = 3,
    sequence = 86,
    propclass = 4,
    minitips = "死亡斩杀伤害",
    rolePanelShow = 1
    };
getRow(83)->
    #battlePropInfoCfg {
    propertyId = 83,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "烈风斩伤害",
    display = 3,
    sequence = 87,
    propclass = 3,
    minitips = "烈风斩伤害",
    rolePanelShow = 1
    };
getRow(84)->
    #battlePropInfoCfg {
    propertyId = 84,
    formulaIndex = 2,
    ownerType = 3,
    minNum = -5,
    maxNum = 0.95,
    baseValue = 0,
    desc = "致命投掷冷却加速",
    display = 3,
    sequence = 88,
    propclass = 3,
    minitips = "致命投掷冷却加速",
    rolePanelShow = 1
    };
getRow(85)->
    #battlePropInfoCfg {
    propertyId = 85,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "缴械伤害",
    display = 3,
    sequence = 89,
    propclass = 3,
    minitips = "雷光刺伤害",
    rolePanelShow = 1
    };
getRow(86)->
    #battlePropInfoCfg {
    propertyId = 86,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "灭寂伤害",
    display = 3,
    sequence = 90,
    propclass = 3,
    minitips = "灭寂伤害",
    rolePanelShow = 1
    };
getRow(87)->
    #battlePropInfoCfg {
    propertyId = 87,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "乱影击伤害",
    display = 3,
    sequence = 91,
    propclass = 3,
    minitips = "乱影击伤害",
    rolePanelShow = 1
    };
getRow(88)->
    #battlePropInfoCfg {
    propertyId = 88,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "致命投掷伤害",
    display = 3,
    sequence = 92,
    propclass = 3,
    minitips = "剪切伤害",
    rolePanelShow = 1
    };
getRow(89)->
    #battlePropInfoCfg {
    propertyId = 89,
    formulaIndex = 2,
    ownerType = 3,
    minNum = -5,
    maxNum = 0.95,
    baseValue = 0,
    desc = "影武冷却加速",
    display = 3,
    sequence = 93,
    propclass = 3,
    minitips = "影武冷却加速",
    rolePanelShow = 1
    };
getRow(90)->
    #battlePropInfoCfg {
    propertyId = 90,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "影袭伤害",
    display = 3,
    sequence = 94,
    propclass = 3,
    minitips = "影袭伤害",
    rolePanelShow = 1
    };
getRow(91)->
    #battlePropInfoCfg {
    propertyId = 91,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "魔宠伤害",
    display = 3,
    sequence = 95,
    propclass = 4,
    minitips = "魔宠伤害",
    rolePanelShow = 1
    };
getRow(92)->
    #battlePropInfoCfg {
    propertyId = 92,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "恶魔仆人伤害",
    display = 3,
    sequence = 96,
    propclass = 4,
    minitips = "恶魔仆人伤害",
    rolePanelShow = 1
    };
getRow(93)->
    #battlePropInfoCfg {
    propertyId = 93,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "远古恶魔伤害",
    display = 3,
    sequence = 97,
    propclass = 4,
    minitips = "远古恶魔伤害",
    rolePanelShow = 1
    };
getRow(94)->
    #battlePropInfoCfg {
    propertyId = 94,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "恢复精通",
    display = 3,
    sequence = 98,
    propclass = 0,
    minitips = "恢复精通",
    rolePanelShow = 1
    };
getRow(95)->
    #battlePropInfoCfg {
    propertyId = 95,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "伤害精通",
    display = 3,
    sequence = 99,
    propclass = 0,
    minitips = "伤害精通",
    rolePanelShow = 1
    };
getRow(96)->
    #battlePropInfoCfg {
    propertyId = 96,
    formulaIndex = 2,
    ownerType = 3,
    minNum = -5,
    maxNum = 0.95,
    baseValue = 0,
    desc = "亵渎冷却加速",
    display = 3,
    sequence = 100,
    propclass = 4,
    minitips = "亵渎冷却加速",
    rolePanelShow = 1
    };
getRow(97)->
    #battlePropInfoCfg {
    propertyId = 97,
    formulaIndex = 2,
    ownerType = 3,
    minNum = -5,
    maxNum = 0.95,
    baseValue = 0,
    desc = "远古恶魔冷却加速",
    display = 3,
    sequence = 101,
    propclass = 4,
    minitips = "远古恶魔冷却加速",
    rolePanelShow = 1
    };
getRow(98)->
    #battlePropInfoCfg {
    propertyId = 98,
    formulaIndex = 2,
    ownerType = 3,
    minNum = -5,
    maxNum = 0.95,
    baseValue = 0,
    desc = "清算节约能量",
    display = 3,
    sequence = 102,
    propclass = 1,
    minitips = "清算节约能量",
    rolePanelShow = 1
    };
getRow(99)->
    #battlePropInfoCfg {
    propertyId = 99,
    formulaIndex = 2,
    ownerType = 3,
    minNum = -5,
    maxNum = 0.95,
    baseValue = 0,
    desc = "火球术施法加速",
    display = 3,
    sequence = 103,
    propclass = 2,
    minitips = "火球术施法加速",
    rolePanelShow = 1
    };
getRow(100)->
    #battlePropInfoCfg {
    propertyId = 100,
    formulaIndex = 2,
    ownerType = 3,
    minNum = -5,
    maxNum = 0.95,
    baseValue = 0,
    desc = "冰枪术施法加速",
    display = 3,
    sequence = 104,
    propclass = 2,
    minitips = "冰枪术施法加速",
    rolePanelShow = 1
    };
getRow(101)->
    #battlePropInfoCfg {
    propertyId = 101,
    formulaIndex = 1,
    ownerType = 1,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "消耗圣力恢复生命",
    display = 1,
    sequence = 37,
    propclass = 1,
    minitips = "消耗圣力恢复生命",
    rolePanelShow = 1
    };
getRow(102)->
    #battlePropInfoCfg {
    propertyId = 102,
    formulaIndex = 1,
    ownerType = 1,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "消耗魔怒恢复生命",
    display = 1,
    sequence = 38,
    propclass = 4,
    minitips = "消耗魔怒恢复生命",
    rolePanelShow = 1
    };
getRow(103)->
    #battlePropInfoCfg {
    propertyId = 103,
    formulaIndex = 1,
    ownerType = 1,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 100,
    desc = "体力上限",
    display = 1,
    sequence = 105,
    propclass = 0,
    minitips = "体力上限",
    rolePanelShow = 1
    };
getRow(104)->
    #battlePropInfoCfg {
    propertyId = 104,
    formulaIndex = 1,
    ownerType = 1,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 10,
    desc = "每秒恢复体力",
    display = 1,
    sequence = 106,
    propclass = 0,
    minitips = "每秒恢复体力",
    rolePanelShow = 1
    };
getRow(105)->
    #battlePropInfoCfg {
    propertyId = 105,
    formulaIndex = 2,
    ownerType = 3,
    minNum = -5,
    maxNum = 0.95,
    baseValue = 0,
    desc = "觉醒冷却加速",
    display = 3,
    sequence = 108,
    propclass = 0,
    minitips = "觉醒冷却加速",
    rolePanelShow = 1
    };
getRow(106)->
    #battlePropInfoCfg {
    propertyId = 106,
    formulaIndex = 1,
    ownerType = 1,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "觉醒持续时间",
    display = 3,
    sequence = 107,
    propclass = 0,
    minitips = "觉醒持续时间",
    rolePanelShow = 1
    };
getRow(107)->
    #battlePropInfoCfg {
    propertyId = 107,
    formulaIndex = 2,
    ownerType = 3,
    minNum = -5,
    maxNum = 0.95,
    baseValue = 0,
    desc = "永恒之光冷却加速",
    display = 3,
    sequence = 109,
    propclass = 1,
    minitips = "永恒之光冷却加速",
    rolePanelShow = 1
    };
getRow(108)->
    #battlePropInfoCfg {
    propertyId = 108,
    formulaIndex = 1,
    ownerType = 1,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "王者圣令持续时间",
    display = 3,
    sequence = 110,
    propclass = 1,
    minitips = "王者圣令持续时间",
    rolePanelShow = 1
    };
getRow(109)->
    #battlePropInfoCfg {
    propertyId = 109,
    formulaIndex = 1,
    ownerType = 1,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "希望圣令持续时间",
    display = 3,
    sequence = 111,
    propclass = 1,
    minitips = "希望圣令持续时间",
    rolePanelShow = 1
    };
getRow(110)->
    #battlePropInfoCfg {
    propertyId = 110,
    formulaIndex = 2,
    ownerType = 3,
    minNum = -5,
    maxNum = 0.95,
    baseValue = 0,
    desc = "邪恶灵气冷却加速",
    display = 3,
    sequence = 112,
    propclass = 4,
    minitips = "邪恶灵气冷却加速",
    rolePanelShow = 1
    };
getRow(111)->
    #battlePropInfoCfg {
    propertyId = 111,
    formulaIndex = 2,
    ownerType = 3,
    minNum = -5,
    maxNum = 0.95,
    baseValue = 0,
    desc = "暗影灵气冷却加速",
    display = 3,
    sequence = 113,
    propclass = 4,
    minitips = "暗影灵气冷却加速",
    rolePanelShow = 1
    };
getRow(112)->
    #battlePropInfoCfg {
    propertyId = 112,
    formulaIndex = 1,
    ownerType = 1,
    minNum = 1,
    maxNum = 2147483647,
    baseValue = 100,
    desc = "无双上限",
    display = 0,
    sequence = 1012,
    propclass = 0,
    minitips = "神器技能无双上限值",
    rolePanelShow = 1
    };
getRow(113)->
    #battlePropInfoCfg {
    propertyId = 113,
    formulaIndex = 1,
    ownerType = 1,
    minNum = -50,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "每秒无双恢复",
    display = 1,
    sequence = 35,
    propclass = 0,
    minitips = "每秒无双恢复值",
    rolePanelShow = 1
    };
getRow(114)->
    #battlePropInfoCfg {
    propertyId = 114,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "骑宠出手速度",
    display = 0,
    sequence = 114,
    propclass = 0,
    minitips = "骑宠远征出手速度",
    rolePanelShow = 1
    };
getRow(115)->
    #battlePropInfoCfg {
    propertyId = 115,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "绝对伤害",
    display = 0,
    sequence = 117,
    propclass = 0,
    minitips = "绝对伤害",
    rolePanelShow = 1
    };
getRow(116)->
    #battlePropInfoCfg {
    propertyId = 116,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "绝对防御",
    display = 0,
    sequence = 118,
    propclass = 0,
    minitips = "绝对防御",
    rolePanelShow = 1
    };
getRow(117)->
    #battlePropInfoCfg {
    propertyId = 117,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "暴击豁免",
    display = 2,
    sequence = 119,
    propclass = 0,
    minitips = "暴击豁免",
    rolePanelShow = 1
    };
getRow(118)->
    #battlePropInfoCfg {
    propertyId = 118,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "暴伤减免",
    display = 2,
    sequence = 120,
    propclass = 0,
    minitips = "暴伤减免",
    rolePanelShow = 1
    };
getRow(119)->
    #battlePropInfoCfg {
    propertyId = 119,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "眩晕豁免",
    display = 2,
    sequence = 121,
    propclass = 0,
    minitips = "眩晕豁免",
    rolePanelShow = 1
    };
getRow(120)->
    #battlePropInfoCfg {
    propertyId = 120,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "冰冻豁免",
    display = 2,
    sequence = 122,
    propclass = 0,
    minitips = "冰冻豁免",
    rolePanelShow = 1
    };
getRow(121)->
    #battlePropInfoCfg {
    propertyId = 121,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "减速豁免",
    display = 2,
    sequence = 123,
    propclass = 0,
    minitips = "减速豁免",
    rolePanelShow = 1
    };
getRow(122)->
    #battlePropInfoCfg {
    propertyId = 122,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "眩晕概率",
    display = 2,
    sequence = 124,
    propclass = 0,
    minitips = "眩晕概率",
    rolePanelShow = 1
    };
getRow(123)->
    #battlePropInfoCfg {
    propertyId = 123,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "冰冻概率",
    display = 2,
    sequence = 125,
    propclass = 0,
    minitips = "冰冻概率",
    rolePanelShow = 1
    };
getRow(124)->
    #battlePropInfoCfg {
    propertyId = 124,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "减速概率",
    display = 2,
    sequence = 126,
    propclass = 0,
    minitips = "减速概率",
    rolePanelShow = 1
    };
getRow(125)->
    #battlePropInfoCfg {
    propertyId = 125,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "命中率",
    display = 2,
    sequence = 127,
    propclass = 0,
    minitips = "命中率",
    rolePanelShow = 1
    };
getRow(126)->
    #battlePropInfoCfg {
    propertyId = 126,
    formulaIndex = 1,
    ownerType = 1,
    minNum = 1,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "火力上限",
    display = 0,
    sequence = 1011,
    propclass = 5,
    minitips = "枪械师能量上限值。",
    rolePanelShow = 1
    };
getRow(127)->
    #battlePropInfoCfg {
    propertyId = 127,
    formulaIndex = 1,
    ownerType = 1,
    minNum = -50,
    maxNum = 2147483647,
    baseValue = 8.5,
    desc = "每秒恢复火力",
    display = 1,
    sequence = 34,
    propclass = 5,
    minitips = "枪械师能量恢复值。",
    rolePanelShow = 1
    };
getRow(128)->
    #battlePropInfoCfg {
    propertyId = 128,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "烈焰寒冰伤害",
    display = 3,
    sequence = 150,
    propclass = 5,
    minitips = "烈焰寒冰伤害",
    rolePanelShow = 1
    };
getRow(129)->
    #battlePropInfoCfg {
    propertyId = 129,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "爆炎手雷伤害",
    display = 3,
    sequence = 151,
    propclass = 5,
    minitips = "爆炎手雷伤害",
    rolePanelShow = 1
    };
getRow(130)->
    #battlePropInfoCfg {
    propertyId = 130,
    formulaIndex = 2,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "火焰喷射伤害",
    display = 3,
    sequence = 152,
    propclass = 5,
    minitips = "火焰喷射伤害",
    rolePanelShow = 1
    };
getRow(131)->
    #battlePropInfoCfg {
    propertyId = 131,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "激光射线伤害",
    display = 3,
    sequence = 153,
    propclass = 5,
    minitips = "激光射线伤害",
    rolePanelShow = 1
    };
getRow(132)->
    #battlePropInfoCfg {
    propertyId = 132,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "重力炸弹伤害",
    display = 3,
    sequence = 154,
    propclass = 5,
    minitips = "重力炸弹伤害",
    rolePanelShow = 1
    };
getRow(133)->
    #battlePropInfoCfg {
    propertyId = 133,
    formulaIndex = 1,
    ownerType = 3,
    minNum = 0,
    maxNum = 5,
    baseValue = 0,
    desc = "击退伤害",
    display = 3,
    sequence = 155,
    propclass = 5,
    minitips = "击退伤害",
    rolePanelShow = 1
    };
getRow(134)->
    #battlePropInfoCfg {
    propertyId = 134,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 14,
    baseValue = 0,
    desc = "扫射",
    display = 3,
    sequence = 156,
    propclass = 5,
    minitips = "biubiubiubiu",
    rolePanelShow = 1
    };
getRow(135)->
    #battlePropInfoCfg {
    propertyId = 135,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "生命",
    display = 0,
    sequence = 1,
    propclass = 0,
    minitips = "生命值受到伤害会降低，降低为0时人物死亡",
    rolePanelShow = 0
    };
getRow(136)->
    #battlePropInfoCfg {
    propertyId = 136,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "物攻",
    display = 0,
    sequence = 2,
    propclass = 0,
    minitips = "物理攻击越高则物理技能的伤害越高",
    rolePanelShow = 0
    };
getRow(137)->
    #battlePropInfoCfg {
    propertyId = 137,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "法攻",
    display = 0,
    sequence = 3,
    propclass = 0,
    minitips = "法术攻击越高则法术技能的伤害越高",
    rolePanelShow = 0
    };
getRow(138)->
    #battlePropInfoCfg {
    propertyId = 138,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "物防",
    display = 0,
    sequence = 4,
    propclass = 0,
    minitips = "物理防御越高则受到的物理攻击相对越低",
    rolePanelShow = 0
    };
getRow(139)->
    #battlePropInfoCfg {
    propertyId = 139,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "法防",
    display = 0,
    sequence = 5,
    propclass = 0,
    minitips = "法术防御越高则受到的法术攻击相对越低",
    rolePanelShow = 0
    };
getRow(140)->
    #battlePropInfoCfg {
    propertyId = 140,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "暴击等级",
    display = 0,
    sequence = 6,
    propclass = 0,
    minitips = "暴击等级越高则技能暴击的几率越高",
    rolePanelShow = 0
    };
getRow(141)->
    #battlePropInfoCfg {
    propertyId = 141,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "抗爆等级",
    display = 0,
    sequence = 7,
    propclass = 0,
    minitips = "抗暴等级越高则被技能暴击的几率越低",
    rolePanelShow = 0
    };
getRow(142)->
    #battlePropInfoCfg {
    propertyId = 142,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "爆伤等级",
    display = 0,
    sequence = 8,
    propclass = 0,
    minitips = "爆伤等级越高则技能暴击时的伤害越高",
    rolePanelShow = 0
    };
getRow(143)->
    #battlePropInfoCfg {
    propertyId = 143,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "韧性等级",
    display = 0,
    sequence = 9,
    propclass = 0,
    minitips = "韧性等级越高则被技能暴击时的伤害越低",
    rolePanelShow = 0
    };
getRow(144)->
    #battlePropInfoCfg {
    propertyId = 144,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "命中等级",
    display = 0,
    sequence = 10,
    propclass = 0,
    minitips = "命中等级越高则技能打中目标的几率越高",
    rolePanelShow = 0
    };
getRow(145)->
    #battlePropInfoCfg {
    propertyId = 145,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "闪避等级",
    display = 0,
    sequence = 11,
    propclass = 0,
    minitips = "闪避等级越高则被技能打中的几率越低",
    rolePanelShow = 0
    };
getRow(146)->
    #battlePropInfoCfg {
    propertyId = 146,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "破甲等级",
    display = 0,
    sequence = 12,
    propclass = 0,
    minitips = "破甲会无视角色的防御属性，破甲等级越高则技能破甲的几率越高",
    rolePanelShow = 0
    };
getRow(147)->
    #battlePropInfoCfg {
    propertyId = 147,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "Hp自动回复",
    display = 0,
    sequence = 13,
    propclass = 0,
    minitips = "生命自动回复越高则每秒角色恢复的生命值越大",
    rolePanelShow = 1
    };
getRow(148)->
    #battlePropInfoCfg {
    propertyId = 148,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "Mp自动回复",
    display = 0,
    sequence = 14,
    propclass = 0,
    minitips = "魔力自动回复越高则每秒角色恢复的魔力值越大",
    rolePanelShow = 1
    };
getRow(149)->
    #battlePropInfoCfg {
    propertyId = 149,
    formulaIndex = 1,
    ownerType = 0,
    minNum = -5,
    maxNum = 5,
    baseValue = 1,
    desc = "伤害加成",
    display = 3,
    sequence = 15,
    propclass = 0,
    minitips = "伤害加成越高则造成的伤害越高",
    rolePanelShow = 0
    };
getRow(150)->
    #battlePropInfoCfg {
    propertyId = 150,
    formulaIndex = 1,
    ownerType = 0,
    minNum = -5,
    maxNum = 5,
    baseValue = 1,
    desc = "伤害减免",
    display = 3,
    sequence = 16,
    propclass = 0,
    minitips = "伤害减免越高则被造成的伤害越低",
    rolePanelShow = 0
    };
getRow(151)->
    #battlePropInfoCfg {
    propertyId = 151,
    formulaIndex = 1,
    ownerType = 0,
    minNum = -5,
    maxNum = 5,
    baseValue = 1,
    desc = "宠物伤害加成",
    display = 3,
    sequence = 17,
    propclass = 0,
    minitips = "宠物伤害加成越高则宠物造成的伤害越高",
    rolePanelShow = 0
    };
getRow(152)->
    #battlePropInfoCfg {
    propertyId = 152,
    formulaIndex = 1,
    ownerType = 0,
    minNum = -5,
    maxNum = 5,
    baseValue = 1,
    desc = "宠物伤害减免",
    display = 3,
    sequence = 18,
    propclass = 0,
    minitips = "宠物伤害减免越高则宠物被造成的伤害越低",
    rolePanelShow = 0
    };
getRow(153)->
    #battlePropInfoCfg {
    propertyId = 153,
    formulaIndex = 1,
    ownerType = 0,
    minNum = -5,
    maxNum = 5,
    baseValue = 1,
    desc = "技能cd减少",
    display = 3,
    sequence = 19,
    propclass = 0,
    minitips = "减少技能cd时间",
    rolePanelShow = 0
    };
getRow(154)->
    #battlePropInfoCfg {
    propertyId = 154,
    formulaIndex = 1,
    ownerType = 0,
    minNum = -5,
    maxNum = 5,
    baseValue = 1,
    desc = "技能治疗效果",
    display = 3,
    sequence = 20,
    propclass = 0,
    minitips = "增加技能治疗效果",
    rolePanelShow = 0
    };
getRow(155)->
    #battlePropInfoCfg {
    propertyId = 155,
    formulaIndex = 1,
    ownerType = 0,
    minNum = -5,
    maxNum = 5,
    baseValue = 1,
    desc = "受到技能治疗效果",
    display = 3,
    sequence = 21,
    propclass = 0,
    minitips = "增加收到治疗效果",
    rolePanelShow = 0
    };
getRow(156)->
    #battlePropInfoCfg {
    propertyId = 156,
    formulaIndex = 1,
    ownerType = 0,
    minNum = -5,
    maxNum = 5,
    baseValue = 1,
    desc = "吸收盾增效",
    display = 3,
    sequence = 22,
    propclass = 0,
    minitips = "增加吸收盾效果",
    rolePanelShow = 0
    };
getRow(157)->
    #battlePropInfoCfg {
    propertyId = 157,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 18,
    baseValue = 0,
    desc = "移动速度",
    display = 1,
    sequence = 23,
    propclass = 0,
    minitips = "移动速度越高则人物移动速度越快",
    rolePanelShow = 0
    };
getRow(158)->
    #battlePropInfoCfg {
    propertyId = 158,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 300,
    baseValue = 0,
    desc = "杀怪经验增加",
    display = 1,
    sequence = 24,
    propclass = 0,
    minitips = "增加人物杀怪经验",
    rolePanelShow = 0
    };
getRow(159)->
    #battlePropInfoCfg {
    propertyId = 159,
    formulaIndex = 1,
    ownerType = 0,
    minNum = -5,
    maxNum = 5,
    baseValue = 1,
    desc = "药水增效",
    display = 3,
    sequence = 25,
    propclass = 0,
    minitips = "增加药水恢复消耗",
    rolePanelShow = 0
    };
getRow(160)->
    #battlePropInfoCfg {
    propertyId = 160,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "坚固等级",
    display = 0,
    sequence = 26,
    propclass = 0,
    minitips = "坚固等级越高则受到破甲的概率越小",
    rolePanelShow = 0
    };
getRow(161)->
    #battlePropInfoCfg {
    propertyId = 161,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "附加暴击率",
    display = 0,
    sequence = 1100,
    propclass = 0,
    minitips = "初始附加暴击率",
    rolePanelShow = 1
    };
getRow(162)->
    #battlePropInfoCfg {
    propertyId = 162,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "附加闪避率",
    display = 0,
    sequence = 1101,
    propclass = 0,
    minitips = "初始附加闪避率",
    rolePanelShow = 1
    };
getRow(163)->
    #battlePropInfoCfg {
    propertyId = 163,
    formulaIndex = 1,
    ownerType = 0,
    minNum = 0,
    maxNum = 2147483647,
    baseValue = 0,
    desc = "附加破甲率",
    display = 0,
    sequence = 1102,
    propclass = 0,
    minitips = "初始附加破甲率",
    rolePanelShow = 1
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
    {148},
    {149},
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
    {163}
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
    148,
    149,
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
    163
    ].

