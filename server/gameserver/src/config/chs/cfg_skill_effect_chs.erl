%% coding: latin-1
%%: 实现
-module(cfg_skill_effect_chs).
-compile(export_all).
-include("cfg_skill_effect.hrl").
-include("logger.hrl").

getRow(0)->
    #skill_effectCfg {
    iD = 0,
    effectType = 0,
    effectChance = 0,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "永不触发"
    };
getRow(1)->
    #skill_effectCfg {
    iD = 1,
    effectType = 11,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 1,
    param1 = 1,
    param2 = 6.8,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "骑士普攻回神力"
    };
getRow(2)->
    #skill_effectCfg {
    iD = 2,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 204,
    param2 = 122,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "神圣盾击击晕目标"
    };
getRow(3)->
    #skill_effectCfg {
    iD = 3,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 2,
    param2 = 0,
    param3 = 6,
    param4 = 10800,
    param5 = 0,
    param6 = 1,
    skillName = "净化伤害载体"
    };
getRow(4)->
    #skill_effectCfg {
    iD = 4,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 18,
    param2 = 0,
    param3 = 6,
    param4 = 1800,
    param5 = 1,
    param6 = 1,
    skillName = "净化抓取载体"
    };
getRow(5)->
    #skill_effectCfg {
    iD = 5,
    effectType = 5,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 0.5,
    param2 = 15,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "冲锋"
    };
getRow(6)->
    #skill_effectCfg {
    iD = 6,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "王者光环主动"
    };
getRow(7)->
    #skill_effectCfg {
    iD = 7,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "赦免"
    };
getRow(8)->
    #skill_effectCfg {
    iD = 8,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "圣光守护"
    };
getRow(9)->
    #skill_effectCfg {
    iD = 9,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 3,
    param2 = 2,
    param3 = 6,
    param4 = 6800,
    param5 = 0,
    param6 = 1,
    skillName = "黎明之锤载体"
    };
getRow(10)->
    #skill_effectCfg {
    iD = 10,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 2,
    param1 = 15,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "黎明之锤暴击"
    };
getRow(11)->
    #skill_effectCfg {
    iD = 11,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4,
    param2 = 0,
    param3 = 6,
    param4 = 10800,
    param5 = 1,
    param6 = 1,
    skillName = "圣光壁垒载体"
    };
getRow(12)->
    #skill_effectCfg {
    iD = 12,
    effectType = 12,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1,
    param2 = 0.03,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "圣光壁垒载体回血"
    };
getRow(13)->
    #skill_effectCfg {
    iD = 13,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 4,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "港口竞速减速"
    };
getRow(14)->
    #skill_effectCfg {
    iD = 14,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 6,
    param2 = 22,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "忏悔"
    };
getRow(15)->
    #skill_effectCfg {
    iD = 15,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5000,
    param2 = 1,
    param3 = 4000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    skillName = "召唤女神"
    };
getRow(16)->
    #skill_effectCfg {
    iD = 16,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 6,
    param2 = 22,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "信仰铠甲"
    };
getRow(17)->
    #skill_effectCfg {
    iD = 17,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 38,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "守护之力"
    };
getRow(18)->
    #skill_effectCfg {
    iD = 18,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 39,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "十字军"
    };
getRow(19)->
    #skill_effectCfg {
    iD = 19,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40,
    param2 = 109,
    param3 = 203,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "盾牌大师"
    };
getRow(20)->
    #skill_effectCfg {
    iD = 20,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 41,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "圣光之速"
    };
getRow(21)->
    #skill_effectCfg {
    iD = 21,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 42,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "辩护"
    };
getRow(22)->
    #skill_effectCfg {
    iD = 22,
    effectType = 3,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 0,
    param2 = 1,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "审判"
    };
getRow(23)->
    #skill_effectCfg {
    iD = 23,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 43,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "惩戒"
    };
getRow(24)->
    #skill_effectCfg {
    iD = 24,
    effectType = 11,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1,
    param2 = 5,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "圣力精通"
    };
getRow(25)->
    #skill_effectCfg {
    iD = 25,
    effectType = 7,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0.5,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "净化抓取载体效果"
    };
getRow(26)->
    #skill_effectCfg {
    iD = 26,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 8,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "致命火焰点燃"
    };
getRow(27)->
    #skill_effectCfg {
    iD = 27,
    effectType = 11,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 2,
    param2 = 5,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "御法暴击回秘法"
    };
getRow(28)->
    #skill_effectCfg {
    iD = 28,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 5,
    param2 = 0,
    param3 = 6,
    param4 = 3800,
    param5 = 0,
    param6 = 1,
    skillName = "陨石术伤害载体"
    };
getRow(29)->
    #skill_effectCfg {
    iD = 29,
    effectType = 15,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 5,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "炎爆"
    };
getRow(30)->
    #skill_effectCfg {
    iD = 30,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 54,
    param2 = 151,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "击退不受控制0.5秒"
    };
getRow(31)->
    #skill_effectCfg {
    iD = 31,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 9,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "法术结界"
    };
getRow(32)->
    #skill_effectCfg {
    iD = 32,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "熔岩护甲"
    };
getRow(33)->
    #skill_effectCfg {
    iD = 33,
    effectType = 8,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 50004,
    param2 = 1,
    param3 = 0,
    param4 = 1,
    param5 = 0,
    param6 = 0,
    skillName = "召唤魔宠"
    };
getRow(34)->
    #skill_effectCfg {
    iD = 34,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 5,
    param2 = 124,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "冰寒减速"
    };
getRow(35)->
    #skill_effectCfg {
    iD = 35,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 6,
    param2 = 0,
    param3 = 6,
    param4 = 6800,
    param5 = 0,
    param6 = 1,
    skillName = "冰风暴载体"
    };
getRow(36)->
    #skill_effectCfg {
    iD = 36,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 5,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "冰风暴载体减速"
    };
getRow(37)->
    #skill_effectCfg {
    iD = 37,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 11,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "变形术"
    };
getRow(38)->
    #skill_effectCfg {
    iD = 38,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 12,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "寒冰护甲"
    };
getRow(39)->
    #skill_effectCfg {
    iD = 39,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 5,
    param2 = 124,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "寒冰甲触发减速"
    };
getRow(40)->
    #skill_effectCfg {
    iD = 40,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 14,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "冰环术冻结"
    };
getRow(41)->
    #skill_effectCfg {
    iD = 41,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 44,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "极寒之风"
    };
getRow(42)->
    #skill_effectCfg {
    iD = 42,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 45,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "魔龙之心"
    };
getRow(43)->
    #skill_effectCfg {
    iD = 43,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 46,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "冰冷血脉"
    };
getRow(44)->
    #skill_effectCfg {
    iD = 44,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 47,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "虚空之盾"
    };
getRow(45)->
    #skill_effectCfg {
    iD = 45,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 48,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "秘学大师"
    };
getRow(46)->
    #skill_effectCfg {
    iD = 46,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 9,
    param2 = 1,
    param3 = 6,
    param4 = 4800,
    param5 = 0,
    param6 = 1,
    skillName = "秘能之核载体"
    };
getRow(47)->
    #skill_effectCfg {
    iD = 47,
    effectType = 7,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 0,
    param2 = 1,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "灵魂收割抓人"
    };
getRow(48)->
    #skill_effectCfg {
    iD = 48,
    effectType = 16,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 2,
    param1 = 13000,
    param2 = 1000,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "灵魂收割减少冷却"
    };
getRow(49)->
    #skill_effectCfg {
    iD = 49,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 54,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "灵魂收割抓人不受控制"
    };
getRow(50)->
    #skill_effectCfg {
    iD = 50,
    effectType = 12,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 2,
    param1 = 10,
    param2 = 0.05,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "生命收割"
    };
getRow(51)->
    #skill_effectCfg {
    iD = 51,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 16,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "灵魂湮灭"
    };
getRow(52)->
    #skill_effectCfg {
    iD = 52,
    effectType = 11,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 1,
    param1 = 4,
    param2 = 12,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "魔女普攻回魔怒"
    };
getRow(53)->
    #skill_effectCfg {
    iD = 53,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 17,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "邪恶光环"
    };
getRow(54)->
    #skill_effectCfg {
    iD = 54,
    effectType = 8,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 50005,
    param2 = 1,
    param3 = 0,
    param4 = 1,
    param5 = 0,
    param6 = 0,
    skillName = "恶魔仆人"
    };
getRow(55)->
    #skill_effectCfg {
    iD = 55,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7,
    param2 = 0,
    param3 = 6,
    param4 = 6800,
    param5 = 0,
    param6 = 1,
    skillName = "亵渎之地载体"
    };
getRow(56)->
    #skill_effectCfg {
    iD = 56,
    effectType = 16,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 2,
    param1 = 13003,
    param2 = 1000,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "末日决战减少冷却"
    };
getRow(57)->
    #skill_effectCfg {
    iD = 57,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 19,
    param2 = 122,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "末日决战击晕"
    };
getRow(58)->
    #skill_effectCfg {
    iD = 58,
    effectType = 5,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 0.5,
    param2 = 0,
    param3 = 700,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "末日决战冲锋"
    };
getRow(59)->
    #skill_effectCfg {
    iD = 59,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 62,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "暗影灵气"
    };
getRow(60)->
    #skill_effectCfg {
    iD = 60,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 20,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "亡者气息"
    };
getRow(61)->
    #skill_effectCfg {
    iD = 61,
    effectType = 8,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 50006,
    param2 = 1,
    param3 = 0,
    param4 = 1,
    param5 = 0,
    param6 = 0,
    skillName = "远古恶魔"
    };
getRow(62)->
    #skill_effectCfg {
    iD = 62,
    effectType = 8,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 50006,
    param2 = 4,
    param3 = 0,
    param4 = 3,
    param5 = 0,
    param6 = 0,
    skillName = "生生不息额外召唤"
    };
getRow(63)->
    #skill_effectCfg {
    iD = 63,
    effectType = 8,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 50009,
    param2 = 1,
    param3 = 0,
    param4 = 1,
    param5 = 0,
    param6 = 0,
    skillName = "地狱坚韧额外召唤"
    };
getRow(64)->
    #skill_effectCfg {
    iD = 64,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 50,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "邪恶仪式"
    };
getRow(65)->
    #skill_effectCfg {
    iD = 65,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 51,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "地狱坚韧"
    };
getRow(66)->
    #skill_effectCfg {
    iD = 66,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 51,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "地狱坚韧"
    };
getRow(67)->
    #skill_effectCfg {
    iD = 67,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 52,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "黑暗正义"
    };
getRow(68)->
    #skill_effectCfg {
    iD = 68,
    effectType = 11,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 1,
    param2 = -5,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "灵魂燃烧减圣力"
    };
getRow(69)->
    #skill_effectCfg {
    iD = 69,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 2,
    param1 = 53,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "献祭"
    };
getRow(70)->
    #skill_effectCfg {
    iD = 70,
    effectType = 5,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 0.5,
    param2 = 25,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "雷光刺"
    };
getRow(71)->
    #skill_effectCfg {
    iD = 71,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 57,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "致命投掷"
    };
getRow(72)->
    #skill_effectCfg {
    iD = 72,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 58,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "缴械"
    };
getRow(73)->
    #skill_effectCfg {
    iD = 73,
    effectType = 5,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = -0.5,
    param2 = 50,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "一闪"
    };
getRow(74)->
    #skill_effectCfg {
    iD = 74,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 59,
    param2 = 66,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "影袭"
    };
getRow(75)->
    #skill_effectCfg {
    iD = 75,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 60,
    param2 = 152,
    param3 = 153,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "影武"
    };
getRow(76)->
    #skill_effectCfg {
    iD = 76,
    effectType = 2,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2,
    param2 = 3,
    param3 = 4,
    param4 = 7,
    param5 = 24,
    param6 = 0,
    skillName = "影武"
    };
getRow(77)->
    #skill_effectCfg {
    iD = 77,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 61,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "影疗"
    };
getRow(78)->
    #skill_effectCfg {
    iD = 78,
    effectType = 2,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2,
    param2 = 3,
    param3 = 4,
    param4 = 7,
    param5 = 0,
    param6 = 0,
    skillName = "影疗"
    };
getRow(79)->
    #skill_effectCfg {
    iD = 79,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 21,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "无敌"
    };
getRow(80)->
    #skill_effectCfg {
    iD = 80,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 22,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "定身3秒"
    };
getRow(81)->
    #skill_effectCfg {
    iD = 81,
    effectType = 19,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 23,
    param2 = 123,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "冻结"
    };
getRow(82)->
    #skill_effectCfg {
    iD = 82,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 24,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "形变"
    };
getRow(83)->
    #skill_effectCfg {
    iD = 83,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 25,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "沉默"
    };
getRow(84)->
    #skill_effectCfg {
    iD = 84,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 26,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "缴械"
    };
getRow(85)->
    #skill_effectCfg {
    iD = 85,
    effectType = 19,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 27,
    param2 = 124,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "减速"
    };
getRow(86)->
    #skill_effectCfg {
    iD = 86,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 28,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "pk保护"
    };
getRow(87)->
    #skill_effectCfg {
    iD = 87,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 29,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "击退"
    };
getRow(88)->
    #skill_effectCfg {
    iD = 88,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 30,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "伤害转血"
    };
getRow(89)->
    #skill_effectCfg {
    iD = 89,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 31,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "修改生命"
    };
getRow(90)->
    #skill_effectCfg {
    iD = 90,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 32,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "修改法力"
    };
getRow(91)->
    #skill_effectCfg {
    iD = 91,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 33,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "虚化"
    };
getRow(92)->
    #skill_effectCfg {
    iD = 92,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 34,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "吸收盾"
    };
getRow(93)->
    #skill_effectCfg {
    iD = 93,
    effectType = 2,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 2,
    param2 = 3,
    param3 = 4,
    param4 = 5,
    param5 = 0,
    param6 = 0,
    skillName = "移除状态buff"
    };
getRow(94)->
    #skill_effectCfg {
    iD = 94,
    effectType = 3,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 2,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "随机移除buff"
    };
getRow(95)->
    #skill_effectCfg {
    iD = 95,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 50004,
    param2 = 2,
    param3 = 3000,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "召唤怪物"
    };
getRow(97)->
    #skill_effectCfg {
    iD = 97,
    effectType = 6,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "强拉仇恨"
    };
getRow(98)->
    #skill_effectCfg {
    iD = 98,
    effectType = 8,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 3,
    param2 = 1,
    param3 = 10000,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "召唤怪物"
    };
getRow(99)->
    #skill_effectCfg {
    iD = 99,
    effectType = 10,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 0.1,
    param2 = 0.1,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "伤害转血"
    };
getRow(100)->
    #skill_effectCfg {
    iD = 100,
    effectType = 11,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10,
    param2 = 5,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "获得神圣之力"
    };
getRow(101)->
    #skill_effectCfg {
    iD = 101,
    effectType = 12,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = -100,
    param2 = -0.1,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "直接修改目标血"
    };
getRow(102)->
    #skill_effectCfg {
    iD = 102,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 35,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "护法被动技能"
    };
getRow(103)->
    #skill_effectCfg {
    iD = 103,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 36,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "羁绊被动技能"
    };
getRow(104)->
    #skill_effectCfg {
    iD = 104,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 100,
    param2 = 10,
    param3 = 60000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    skillName = "召唤骷髅战士10"
    };
getRow(105)->
    #skill_effectCfg {
    iD = 105,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 101,
    param2 = 10,
    param3 = 60000,
    param4 = 0,
    param5 = 0,
    param6 = 1,
    skillName = "召唤骷髅弓手10"
    };
getRow(106)->
    #skill_effectCfg {
    iD = 106,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 102,
    param2 = 10,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    skillName = "召唤骷髅战士20"
    };
getRow(107)->
    #skill_effectCfg {
    iD = 107,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19,
    param2 = 0,
    param3 = 6,
    param4 = 10800,
    param5 = 0,
    param6 = 1,
    skillName = "火池伤害载体"
    };
getRow(108)->
    #skill_effectCfg {
    iD = 108,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 55,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战士神力觉醒"
    };
getRow(109)->
    #skill_effectCfg {
    iD = 109,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 56,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战士神力觉醒被动1技能"
    };
getRow(110)->
    #skill_effectCfg {
    iD = 110,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 57,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战士神力觉醒被动2技能"
    };
getRow(111)->
    #skill_effectCfg {
    iD = 111,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 58,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战士神力觉醒被动3技能"
    };
getRow(112)->
    #skill_effectCfg {
    iD = 112,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 59,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战士神力觉醒被动4技能"
    };
getRow(113)->
    #skill_effectCfg {
    iD = 113,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 60,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "法师神力觉醒"
    };
getRow(114)->
    #skill_effectCfg {
    iD = 114,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 61,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "法师神力觉醒被动1技能"
    };
getRow(115)->
    #skill_effectCfg {
    iD = 115,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 62,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "法师神力觉醒被动2技能"
    };
getRow(116)->
    #skill_effectCfg {
    iD = 116,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 63,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "法师神力觉醒被动3技能"
    };
getRow(117)->
    #skill_effectCfg {
    iD = 117,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 64,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "法师神力觉醒被动全技能"
    };
getRow(118)->
    #skill_effectCfg {
    iD = 118,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 65,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "刺客神力觉醒"
    };
getRow(119)->
    #skill_effectCfg {
    iD = 119,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 66,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "刺客神力觉醒被动1技能"
    };
getRow(120)->
    #skill_effectCfg {
    iD = 120,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 67,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "刺客神力觉醒被动2技能"
    };
getRow(121)->
    #skill_effectCfg {
    iD = 121,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 68,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "刺客神力觉醒被动3技能"
    };
getRow(122)->
    #skill_effectCfg {
    iD = 122,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 69,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "刺客神力觉醒被动全技能"
    };
getRow(123)->
    #skill_effectCfg {
    iD = 123,
    effectType = 11,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 2,
    param2 = -5,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "灵魂燃烧减秘法"
    };
getRow(124)->
    #skill_effectCfg {
    iD = 124,
    effectType = 11,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 3,
    param2 = -5,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "灵魂燃烧减魔怒"
    };
getRow(125)->
    #skill_effectCfg {
    iD = 125,
    effectType = 11,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 4,
    param2 = -5,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "灵魂燃烧减影力"
    };
getRow(126)->
    #skill_effectCfg {
    iD = 126,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 73,
    param2 = 101,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "乱影击不受控制虚化"
    };
getRow(127)->
    #skill_effectCfg {
    iD = 127,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 75,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "杀戮机器"
    };
getRow(128)->
    #skill_effectCfg {
    iD = 128,
    effectType = 11,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3,
    param2 = 25,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "乘胜追击"
    };
getRow(129)->
    #skill_effectCfg {
    iD = 129,
    effectType = 11,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4,
    param2 = 3,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战斗潜能"
    };
getRow(130)->
    #skill_effectCfg {
    iD = 130,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 76,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "刺客信条"
    };
getRow(131)->
    #skill_effectCfg {
    iD = 131,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 77,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "料敌先机"
    };
getRow(132)->
    #skill_effectCfg {
    iD = 132,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 78,
    param2 = 151,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "麻痹毒药"
    };
getRow(133)->
    #skill_effectCfg {
    iD = 133,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 79,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "致伤毒药"
    };
getRow(134)->
    #skill_effectCfg {
    iD = 134,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 80,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "熔岩护甲触发跑速"
    };
getRow(135)->
    #skill_effectCfg {
    iD = 135,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 81,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "王者光环调用"
    };
getRow(136)->
    #skill_effectCfg {
    iD = 136,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 82,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "王者光环被动属性"
    };
getRow(137)->
    #skill_effectCfg {
    iD = 137,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 83,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "邪恶光环调用"
    };
getRow(138)->
    #skill_effectCfg {
    iD = 138,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 84,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "邪恶光环被动属性"
    };
getRow(139)->
    #skill_effectCfg {
    iD = 139,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 85,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "希望光环调用"
    };
getRow(140)->
    #skill_effectCfg {
    iD = 140,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 86,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "希望光环被动属性"
    };
getRow(141)->
    #skill_effectCfg {
    iD = 141,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 87,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "极寒之风伤害加深"
    };
getRow(142)->
    #skill_effectCfg {
    iD = 142,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 111,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "极寒之风提高暴击"
    };
getRow(143)->
    #skill_effectCfg {
    iD = 143,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 89,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "邪恶光环调用"
    };
getRow(144)->
    #skill_effectCfg {
    iD = 144,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 90,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "邪恶光环被动属性"
    };
getRow(145)->
    #skill_effectCfg {
    iD = 145,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 88,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "审判"
    };
getRow(146)->
    #skill_effectCfg {
    iD = 146,
    effectType = 11,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 4,
    param2 = 3,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "受到攻击回魔怒"
    };
getRow(147)->
    #skill_effectCfg {
    iD = 147,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 92,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "影踪劲"
    };
getRow(148)->
    #skill_effectCfg {
    iD = 148,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 93,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "影踪劲触发持续伤害"
    };
getRow(149)->
    #skill_effectCfg {
    iD = 149,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 94,
    param2 = 122,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "M冲锋击晕"
    };
getRow(150)->
    #skill_effectCfg {
    iD = 150,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 103,
    param2 = 10,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 2,
    skillName = "召唤骷髅弓手20"
    };
getRow(151)->
    #skill_effectCfg {
    iD = 151,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 23,
    param2 = 0,
    param3 = 6,
    param4 = 10800,
    param5 = 0,
    param6 = 1,
    skillName = "高级火池伤害载体"
    };
getRow(152)->
    #skill_effectCfg {
    iD = 152,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 24,
    param2 = 0,
    param3 = 6,
    param4 = 10800,
    param5 = 0,
    param6 = 1,
    skillName = "毒池伤害载体"
    };
getRow(153)->
    #skill_effectCfg {
    iD = 153,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 95,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "持续暗影伤害"
    };
getRow(154)->
    #skill_effectCfg {
    iD = 154,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 25,
    param2 = 0,
    param3 = 6,
    param4 = 10800,
    param5 = 0,
    param6 = 1,
    skillName = "高级毒池伤害载体"
    };
getRow(155)->
    #skill_effectCfg {
    iD = 155,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 96,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "持续暗影伤害"
    };
getRow(156)->
    #skill_effectCfg {
    iD = 156,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 26,
    param2 = 0,
    param3 = 6,
    param4 = 10800,
    param5 = 0,
    param6 = 1,
    skillName = "冰池伤害载体"
    };
getRow(157)->
    #skill_effectCfg {
    iD = 157,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 27,
    param2 = 0,
    param3 = 6,
    param4 = 10800,
    param5 = 0,
    param6 = 1,
    skillName = "高级冰池伤害载体"
    };
getRow(158)->
    #skill_effectCfg {
    iD = 158,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 5,
    param2 = 124,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "减速"
    };
getRow(159)->
    #skill_effectCfg {
    iD = 159,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 28,
    param2 = 0,
    param3 = 6,
    param4 = 10800,
    param5 = 0,
    param6 = 1,
    skillName = "血池"
    };
getRow(160)->
    #skill_effectCfg {
    iD = 160,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 29,
    param2 = 2,
    param3 = 6,
    param4 = 10800,
    param5 = 0,
    param6 = 1,
    skillName = "旋风伤害载体"
    };
getRow(161)->
    #skill_effectCfg {
    iD = 161,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 97,
    param2 = 123,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "冰环术冻结"
    };
getRow(162)->
    #skill_effectCfg {
    iD = 162,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 30,
    param2 = 2,
    param3 = 6,
    param4 = 2300,
    param5 = 0,
    param6 = 1,
    skillName = "追踪炸弹"
    };
getRow(163)->
    #skill_effectCfg {
    iD = 163,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 98,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "吸收盾"
    };
getRow(164)->
    #skill_effectCfg {
    iD = 164,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 94,
    param2 = 122,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "水爆术击晕"
    };
getRow(165)->
    #skill_effectCfg {
    iD = 165,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 99,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "狂化"
    };
getRow(166)->
    #skill_effectCfg {
    iD = 166,
    effectType = 12,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = -10,
    param2 = -0.05,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "吸血扣目标血"
    };
getRow(167)->
    #skill_effectCfg {
    iD = 167,
    effectType = 12,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10,
    param2 = 0.001,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "吸血加自身血"
    };
getRow(168)->
    #skill_effectCfg {
    iD = 168,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 19,
    param2 = 122,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "击晕目标"
    };
getRow(169)->
    #skill_effectCfg {
    iD = 169,
    effectType = 12,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = -10,
    param2 = -0.15,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "直接扣除25%+10生命值"
    };
getRow(170)->
    #skill_effectCfg {
    iD = 170,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 104,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "行云流水"
    };
getRow(171)->
    #skill_effectCfg {
    iD = 171,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 105,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "迅雷之势"
    };
getRow(172)->
    #skill_effectCfg {
    iD = 172,
    effectType = 17,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 105,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "迅雷之势移除buff"
    };
getRow(173)->
    #skill_effectCfg {
    iD = 173,
    effectType = 12,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = -10,
    param2 = -0.025,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "直接扣除2.5%+10生命值"
    };
getRow(174)->
    #skill_effectCfg {
    iD = 174,
    effectType = 12,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 1,
    param2 = 0.01,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "直接+2.5%+1生命值"
    };
getRow(175)->
    #skill_effectCfg {
    iD = 175,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 106,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "击退不受控制1秒"
    };
getRow(176)->
    #skill_effectCfg {
    iD = 176,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 31,
    param2 = 2,
    param3 = 6,
    param4 = 10800,
    param5 = 0,
    param6 = 1,
    skillName = "高级旋风伤害载体"
    };
getRow(177)->
    #skill_effectCfg {
    iD = 177,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 32,
    param2 = 2,
    param3 = 6,
    param4 = 2300,
    param5 = 0,
    param6 = 1,
    skillName = "高级追踪炸弹"
    };
getRow(178)->
    #skill_effectCfg {
    iD = 178,
    effectType = 12,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = -10,
    param2 = -0.1,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "高级吸血扣目标血"
    };
getRow(179)->
    #skill_effectCfg {
    iD = 179,
    effectType = 12,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10,
    param2 = 0.01,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "高级吸血加自身血"
    };
getRow(180)->
    #skill_effectCfg {
    iD = 180,
    effectType = 1,
    effectChance = 0.3,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 110,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "怪物近战烧能量"
    };
getRow(181)->
    #skill_effectCfg {
    iD = 181,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 125,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "穷追猛打持续伤害"
    };
getRow(182)->
    #skill_effectCfg {
    iD = 182,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 126,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "被动闪避15%"
    };
getRow(183)->
    #skill_effectCfg {
    iD = 183,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 33,
    param2 = 2,
    param3 = 6,
    param4 = 30800,
    param5 = 0,
    param6 = 1,
    skillName = "追踪炸弹2000型"
    };
getRow(184)->
    #skill_effectCfg {
    iD = 184,
    effectType = 19,
    effectChance = 0.25,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 14,
    param2 = 123,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "霜冻领域冻结"
    };
getRow(185)->
    #skill_effectCfg {
    iD = 185,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 34,
    param2 = 0,
    param3 = 6,
    param4 = 8300,
    param5 = 0,
    param6 = 1,
    skillName = "霜冻领域载体"
    };
getRow(186)->
    #skill_effectCfg {
    iD = 186,
    effectType = 8,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 50008,
    param2 = 1,
    param3 = 20000,
    param4 = 1,
    param5 = 0,
    param6 = 0,
    skillName = "召唤邪神"
    };
getRow(187)->
    #skill_effectCfg {
    iD = 187,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 128,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "死亡标记"
    };
getRow(188)->
    #skill_effectCfg {
    iD = 188,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 94,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "高级冲锋击晕"
    };
getRow(189)->
    #skill_effectCfg {
    iD = 189,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 129,
    param2 = 122,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "普通冲锋击晕"
    };
getRow(190)->
    #skill_effectCfg {
    iD = 190,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 132,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "神迹变身2"
    };
getRow(191)->
    #skill_effectCfg {
    iD = 191,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 133,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "神迹变身3"
    };
getRow(192)->
    #skill_effectCfg {
    iD = 192,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 134,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "神迹变身4"
    };
getRow(193)->
    #skill_effectCfg {
    iD = 193,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 135,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "神迹变身5"
    };
getRow(194)->
    #skill_effectCfg {
    iD = 194,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 136,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "御法者变身2"
    };
getRow(195)->
    #skill_effectCfg {
    iD = 195,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 137,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "御法者变身3"
    };
getRow(196)->
    #skill_effectCfg {
    iD = 196,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 138,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "御法者变身4"
    };
getRow(197)->
    #skill_effectCfg {
    iD = 197,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 139,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "御法者变身5"
    };
getRow(198)->
    #skill_effectCfg {
    iD = 198,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 140,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "死神变身2"
    };
getRow(199)->
    #skill_effectCfg {
    iD = 199,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 141,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "死神变身3"
    };
getRow(200)->
    #skill_effectCfg {
    iD = 200,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 142,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "死神变身4"
    };
getRow(201)->
    #skill_effectCfg {
    iD = 201,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 143,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "死神变身5"
    };
getRow(202)->
    #skill_effectCfg {
    iD = 202,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 144,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "影王变身2"
    };
getRow(203)->
    #skill_effectCfg {
    iD = 203,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 145,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "影王变身3"
    };
getRow(204)->
    #skill_effectCfg {
    iD = 204,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 146,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "影王变身4"
    };
getRow(205)->
    #skill_effectCfg {
    iD = 205,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 147,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "影王变身5"
    };
getRow(206)->
    #skill_effectCfg {
    iD = 206,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 148,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "传奇击中提高攻速10%"
    };
getRow(207)->
    #skill_effectCfg {
    iD = 207,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 35,
    param2 = 0,
    param3 = 6,
    param4 = 5800,
    param5 = 0,
    param6 = 1,
    skillName = "传奇击中自身火焰载体"
    };
getRow(208)->
    #skill_effectCfg {
    iD = 208,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 150,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "传奇持续物理伤害"
    };
getRow(209)->
    #skill_effectCfg {
    iD = 209,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 151,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "非冰寒减速"
    };
getRow(210)->
    #skill_effectCfg {
    iD = 210,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 156,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "传奇击中提高暴击10%"
    };
getRow(211)->
    #skill_effectCfg {
    iD = 211,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 157,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "传奇击中提高攻速15%"
    };
getRow(212)->
    #skill_effectCfg {
    iD = 212,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 158,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "传奇击中提高暴击15%"
    };
getRow(213)->
    #skill_effectCfg {
    iD = 213,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 159,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "被动招架10%"
    };
getRow(214)->
    #skill_effectCfg {
    iD = 214,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 160,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "被动格挡30%"
    };
getRow(215)->
    #skill_effectCfg {
    iD = 215,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 161,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "血腥爪击"
    };
getRow(216)->
    #skill_effectCfg {
    iD = 216,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 162,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "生命之种"
    };
getRow(217)->
    #skill_effectCfg {
    iD = 217,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 163,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "蛮力猛击"
    };
getRow(218)->
    #skill_effectCfg {
    iD = 218,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 164,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "洞悉弱点"
    };
getRow(219)->
    #skill_effectCfg {
    iD = 219,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 165,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "迅疾打击"
    };
getRow(220)->
    #skill_effectCfg {
    iD = 220,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 166,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "节能施法"
    };
getRow(221)->
    #skill_effectCfg {
    iD = 221,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 167,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "虚空调和"
    };
getRow(222)->
    #skill_effectCfg {
    iD = 222,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 168,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "自然之力"
    };
getRow(223)->
    #skill_effectCfg {
    iD = 223,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 169,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "原始坚韧"
    };
getRow(224)->
    #skill_effectCfg {
    iD = 224,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 170,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "野蛮防御"
    };
getRow(225)->
    #skill_effectCfg {
    iD = 225,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 171,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "狂乱"
    };
getRow(226)->
    #skill_effectCfg {
    iD = 226,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 172,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "锋利兽爪"
    };
getRow(227)->
    #skill_effectCfg {
    iD = 227,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 173,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "急奔"
    };
getRow(228)->
    #skill_effectCfg {
    iD = 228,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 5,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "割裂"
    };
getRow(229)->
    #skill_effectCfg {
    iD = 229,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 174,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "狂野怒火"
    };
getRow(230)->
    #skill_effectCfg {
    iD = 230,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 175,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "生存本能"
    };
getRow(231)->
    #skill_effectCfg {
    iD = 231,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 176,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战争精英"
    };
getRow(232)->
    #skill_effectCfg {
    iD = 232,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 177,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "毁灭打击"
    };
getRow(233)->
    #skill_effectCfg {
    iD = 233,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 178,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "野性狂怒"
    };
getRow(234)->
    #skill_effectCfg {
    iD = 234,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 179,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "秘能恢复"
    };
getRow(235)->
    #skill_effectCfg {
    iD = 235,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 181,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "血腥爪击II"
    };
getRow(236)->
    #skill_effectCfg {
    iD = 236,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 182,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "生命之种"
    };
getRow(237)->
    #skill_effectCfg {
    iD = 237,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 183,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "蛮力猛击"
    };
getRow(238)->
    #skill_effectCfg {
    iD = 238,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 184,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "洞悉弱点"
    };
getRow(239)->
    #skill_effectCfg {
    iD = 239,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 185,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "迅疾打击"
    };
getRow(240)->
    #skill_effectCfg {
    iD = 240,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 186,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "节能施法"
    };
getRow(241)->
    #skill_effectCfg {
    iD = 241,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 187,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "虚空调和"
    };
getRow(242)->
    #skill_effectCfg {
    iD = 242,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 188,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "自然之力"
    };
getRow(243)->
    #skill_effectCfg {
    iD = 243,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 189,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战争精英"
    };
getRow(244)->
    #skill_effectCfg {
    iD = 244,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 190,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "毁灭打击"
    };
getRow(245)->
    #skill_effectCfg {
    iD = 245,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 191,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "血腥爪击I"
    };
getRow(246)->
    #skill_effectCfg {
    iD = 246,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 192,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "生命之种"
    };
getRow(247)->
    #skill_effectCfg {
    iD = 247,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 193,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "蛮力猛击"
    };
getRow(248)->
    #skill_effectCfg {
    iD = 248,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 194,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "洞悉弱点"
    };
getRow(249)->
    #skill_effectCfg {
    iD = 249,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 195,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "迅疾打击"
    };
getRow(250)->
    #skill_effectCfg {
    iD = 250,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 196,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "节能施法"
    };
getRow(251)->
    #skill_effectCfg {
    iD = 251,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 197,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "虚空调和"
    };
getRow(252)->
    #skill_effectCfg {
    iD = 252,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 198,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "自然之力"
    };
getRow(253)->
    #skill_effectCfg {
    iD = 253,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 199,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战争精英"
    };
getRow(254)->
    #skill_effectCfg {
    iD = 254,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 200,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "毁灭打击"
    };
getRow(255)->
    #skill_effectCfg {
    iD = 255,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 202,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "骑士祝福"
    };
getRow(256)->
    #skill_effectCfg {
    iD = 256,
    effectType = 16,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 1,
    param1 = 6,
    param2 = 1000,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "王者圣令冷却加速"
    };
getRow(257)->
    #skill_effectCfg {
    iD = 257,
    effectType = 16,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 1,
    param1 = 12,
    param2 = 1000,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "希望圣令冷却加速"
    };
getRow(258)->
    #skill_effectCfg {
    iD = 258,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 37,
    param2 = 0,
    param3 = 6,
    param4 = 10800,
    param5 = 0,
    param6 = 1,
    skillName = "祝福伤害载体"
    };
getRow(259)->
    #skill_effectCfg {
    iD = 259,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 205,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "能量过载"
    };
getRow(260)->
    #skill_effectCfg {
    iD = 260,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 206,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "天才法师加速施法"
    };
getRow(261)->
    #skill_effectCfg {
    iD = 261,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 38,
    param2 = 2,
    param3 = 6,
    param4 = 6800,
    param5 = 0,
    param6 = 1,
    skillName = "黎明之锤载体"
    };
getRow(262)->
    #skill_effectCfg {
    iD = 262,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 39,
    param2 = 0,
    param3 = 6,
    param4 = 6800,
    param5 = 0,
    param6 = 1,
    skillName = "陨石术伤害载体"
    };
getRow(263)->
    #skill_effectCfg {
    iD = 263,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 223,
    param2 = 66,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "影袭"
    };
getRow(264)->
    #skill_effectCfg {
    iD = 264,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40,
    param2 = 0,
    param3 = 6,
    param4 = 6800,
    param5 = 0,
    param6 = 1,
    skillName = "亵渎之地载体"
    };
getRow(265)->
    #skill_effectCfg {
    iD = 265,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 224,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "致命武力"
    };
getRow(266)->
    #skill_effectCfg {
    iD = 266,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 225,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "绝对防御"
    };
getRow(267)->
    #skill_effectCfg {
    iD = 267,
    effectType = 5,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 0.5,
    param2 = 20,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "冲锋"
    };
getRow(268)->
    #skill_effectCfg {
    iD = 268,
    effectType = 18,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "攻击获得无双值"
    };
getRow(269)->
    #skill_effectCfg {
    iD = 269,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 229,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "降低速度"
    };
getRow(270)->
    #skill_effectCfg {
    iD = 270,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 230,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "点燃"
    };
getRow(271)->
    #skill_effectCfg {
    iD = 271,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 231,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "神器增强自身"
    };
getRow(272)->
    #skill_effectCfg {
    iD = 272,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 232,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "神器技能减疗"
    };
getRow(273)->
    #skill_effectCfg {
    iD = 273,
    effectType = 15,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 9,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "米诺陶斯击退"
    };
getRow(274)->
    #skill_effectCfg {
    iD = 274,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 233,
    param2 = 122,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "米诺陶斯眩晕"
    };
getRow(275)->
    #skill_effectCfg {
    iD = 275,
    effectType = 12,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 0,
    param2 = -0.25,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "米诺陶斯扣除25%血量"
    };
getRow(276)->
    #skill_effectCfg {
    iD = 276,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 41,
    param2 = 0,
    param3 = 6,
    param4 = 5000,
    param5 = 0,
    param6 = 1,
    skillName = "毒池伤害载体"
    };
getRow(277)->
    #skill_effectCfg {
    iD = 277,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 242,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "持续暗影伤害"
    };
getRow(278)->
    #skill_effectCfg {
    iD = 278,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 32,
    param2 = 0,
    param3 = 6,
    param4 = 1800,
    param5 = 0,
    param6 = 1,
    skillName = "导弹伤害载体"
    };
getRow(279)->
    #skill_effectCfg {
    iD = 279,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 244,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "强化致命投掷"
    };
getRow(280)->
    #skill_effectCfg {
    iD = 280,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 204,
    param2 = 122,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "击晕目标"
    };
getRow(281)->
    #skill_effectCfg {
    iD = 281,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 246,
    param2 = 123,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "冰环术冻结2秒"
    };
getRow(282)->
    #skill_effectCfg {
    iD = 282,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 247,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "非冰寒减速"
    };
getRow(283)->
    #skill_effectCfg {
    iD = 283,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 3,
    param1 = 248,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "火球灼烧"
    };
getRow(284)->
    #skill_effectCfg {
    iD = 284,
    effectType = 15,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 2,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "神器技能击退"
    };
getRow(285)->
    #skill_effectCfg {
    iD = 285,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 252,
    param2 = 123,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "金鱼粘液冰冻"
    };
getRow(286)->
    #skill_effectCfg {
    iD = 286,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 262,
    param2 = 122,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "击晕目标2秒"
    };
getRow(287)->
    #skill_effectCfg {
    iD = 287,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 263,
    param2 = 122,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "击晕目标3秒"
    };
getRow(288)->
    #skill_effectCfg {
    iD = 288,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 263,
    param2 = 122,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "80%概率击晕目标3秒"
    };
getRow(289)->
    #skill_effectCfg {
    iD = 289,
    effectType = 15,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 5,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "星际战神击退定身2秒"
    };
getRow(290)->
    #skill_effectCfg {
    iD = 290,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 290,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "星际战神击退不受控制0.5秒"
    };
getRow(291)->
    #skill_effectCfg {
    iD = 291,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 291,
    param2 = 122,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "熊猫缴械3秒"
    };
getRow(292)->
    #skill_effectCfg {
    iD = 292,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 292,
    param2 = 123,
    param3 = 1,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "鲸鱼冻结3秒"
    };
getRow(293)->
    #skill_effectCfg {
    iD = 293,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 293,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "金龙变形术3秒"
    };
getRow(294)->
    #skill_effectCfg {
    iD = 294,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 294,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "军团团员眩晕1.5秒"
    };
getRow(295)->
    #skill_effectCfg {
    iD = 295,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 295,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "军团军团长缴械2秒"
    };
getRow(296)->
    #skill_effectCfg {
    iD = 296,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 296,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "远行兽眩晕1.5秒"
    };
getRow(297)->
    #skill_effectCfg {
    iD = 297,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 297,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "远行兽眩晕伤害抗性降低30%"
    };
getRow(300)->
    #skill_effectCfg {
    iD = 300,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 300,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身生命上限+500"
    };
getRow(301)->
    #skill_effectCfg {
    iD = 301,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 301,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身生命上限+3000"
    };
getRow(302)->
    #skill_effectCfg {
    iD = 302,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 302,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身生命上限+6000"
    };
getRow(303)->
    #skill_effectCfg {
    iD = 303,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 303,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身生命上限+12000"
    };
getRow(304)->
    #skill_effectCfg {
    iD = 304,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 304,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身生命上限+24000"
    };
getRow(305)->
    #skill_effectCfg {
    iD = 305,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 305,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身物理防御+35"
    };
getRow(306)->
    #skill_effectCfg {
    iD = 306,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 306,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身物理防御+210"
    };
getRow(307)->
    #skill_effectCfg {
    iD = 307,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 307,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身物理防御+420"
    };
getRow(308)->
    #skill_effectCfg {
    iD = 308,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 308,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身物理防御+840"
    };
getRow(309)->
    #skill_effectCfg {
    iD = 309,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 309,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身物理防御+1680"
    };
getRow(310)->
    #skill_effectCfg {
    iD = 310,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 310,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身魔法防御+35"
    };
getRow(311)->
    #skill_effectCfg {
    iD = 311,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 311,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身魔法防御+210"
    };
getRow(312)->
    #skill_effectCfg {
    iD = 312,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 312,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身魔法防御+420"
    };
getRow(313)->
    #skill_effectCfg {
    iD = 313,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 313,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身魔法防御+840"
    };
getRow(314)->
    #skill_effectCfg {
    iD = 314,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 314,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身魔法防御+1680"
    };
getRow(315)->
    #skill_effectCfg {
    iD = 315,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 315,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身神圣伤害+25"
    };
getRow(316)->
    #skill_effectCfg {
    iD = 316,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 316,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身神圣伤害+150"
    };
getRow(317)->
    #skill_effectCfg {
    iD = 317,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 317,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身神圣伤害+300"
    };
getRow(318)->
    #skill_effectCfg {
    iD = 318,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 318,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身神圣伤害+600"
    };
getRow(319)->
    #skill_effectCfg {
    iD = 319,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 319,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身神圣伤害+1200"
    };
getRow(320)->
    #skill_effectCfg {
    iD = 320,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 320,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身物理伤害+25"
    };
getRow(321)->
    #skill_effectCfg {
    iD = 321,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 321,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身物理伤害+150"
    };
getRow(322)->
    #skill_effectCfg {
    iD = 322,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 322,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身物理伤害+300"
    };
getRow(323)->
    #skill_effectCfg {
    iD = 323,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 323,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身物理伤害+600"
    };
getRow(324)->
    #skill_effectCfg {
    iD = 324,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 324,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身物理伤害+1200"
    };
getRow(325)->
    #skill_effectCfg {
    iD = 325,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 325,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身暗影伤害+25"
    };
getRow(326)->
    #skill_effectCfg {
    iD = 326,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 326,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身暗影伤害+150"
    };
getRow(327)->
    #skill_effectCfg {
    iD = 327,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 327,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身暗影伤害+300"
    };
getRow(328)->
    #skill_effectCfg {
    iD = 328,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 328,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身暗影伤害+600"
    };
getRow(329)->
    #skill_effectCfg {
    iD = 329,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 329,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身暗影伤害+1200"
    };
getRow(330)->
    #skill_effectCfg {
    iD = 330,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 330,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身元素伤害+25"
    };
getRow(331)->
    #skill_effectCfg {
    iD = 331,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 331,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身元素伤害+150"
    };
getRow(332)->
    #skill_effectCfg {
    iD = 332,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 332,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身元素伤害+300"
    };
getRow(333)->
    #skill_effectCfg {
    iD = 333,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 333,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身元素伤害+600"
    };
getRow(334)->
    #skill_effectCfg {
    iD = 334,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 334,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "宠物自身元素伤害+1200"
    };
getRow(335)->
    #skill_effectCfg {
    iD = 335,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 335,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人暴伤减免+0.02"
    };
getRow(336)->
    #skill_effectCfg {
    iD = 336,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 336,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人暴伤减免+0.14"
    };
getRow(337)->
    #skill_effectCfg {
    iD = 337,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 337,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人暴伤减免+0.36"
    };
getRow(338)->
    #skill_effectCfg {
    iD = 338,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 338,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人暴伤减免+0.68"
    };
getRow(339)->
    #skill_effectCfg {
    iD = 339,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 339,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人暴伤减免+1.1"
    };
getRow(340)->
    #skill_effectCfg {
    iD = 340,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 340,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人冰冻豁免+0.01"
    };
getRow(341)->
    #skill_effectCfg {
    iD = 341,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 341,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人冰冻豁免+0.06"
    };
getRow(342)->
    #skill_effectCfg {
    iD = 342,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 342,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人冰冻豁免+0.11"
    };
getRow(343)->
    #skill_effectCfg {
    iD = 343,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 343,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人冰冻豁免+0.16"
    };
getRow(344)->
    #skill_effectCfg {
    iD = 344,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 344,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人冰冻豁免+0.21"
    };
getRow(345)->
    #skill_effectCfg {
    iD = 345,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 345,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人减速豁免+0.01"
    };
getRow(346)->
    #skill_effectCfg {
    iD = 346,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 346,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人减速豁免+0.06"
    };
getRow(347)->
    #skill_effectCfg {
    iD = 347,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 347,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人减速豁免+0.11"
    };
getRow(348)->
    #skill_effectCfg {
    iD = 348,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 348,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人减速豁免+0.16"
    };
getRow(349)->
    #skill_effectCfg {
    iD = 349,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 349,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人减速豁免+0.21"
    };
getRow(350)->
    #skill_effectCfg {
    iD = 350,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 350,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人眩晕豁免+0.01"
    };
getRow(351)->
    #skill_effectCfg {
    iD = 351,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 351,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人眩晕豁免+0.06"
    };
getRow(352)->
    #skill_effectCfg {
    iD = 352,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 352,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人眩晕豁免+0.11"
    };
getRow(353)->
    #skill_effectCfg {
    iD = 353,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 353,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人眩晕豁免+0.16"
    };
getRow(354)->
    #skill_effectCfg {
    iD = 354,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 354,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人眩晕豁免+0.21"
    };
getRow(355)->
    #skill_effectCfg {
    iD = 355,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 355,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人暴击豁免+0.01"
    };
getRow(356)->
    #skill_effectCfg {
    iD = 356,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 356,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人暴击豁免+0.06"
    };
getRow(357)->
    #skill_effectCfg {
    iD = 357,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 357,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人暴击豁免+0.11"
    };
getRow(358)->
    #skill_effectCfg {
    iD = 358,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 358,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人暴击豁免+0.16"
    };
getRow(359)->
    #skill_effectCfg {
    iD = 359,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 359,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人暴击豁免+0.21"
    };
getRow(360)->
    #skill_effectCfg {
    iD = 360,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 360,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "主人控制豁免2秒 （翅膀）"
    };
getRow(400)->
    #skill_effectCfg {
    iD = 400,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 400,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "远行兽增加主人攻击"
    };
getRow(3200)->
    #skill_effectCfg {
    iD = 3200,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 3200,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "裁决者变身1"
    };
getRow(3201)->
    #skill_effectCfg {
    iD = 3201,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 3201,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "裁决者变身2"
    };
getRow(3202)->
    #skill_effectCfg {
    iD = 3202,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 3202,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "裁决者变身3"
    };
getRow(3203)->
    #skill_effectCfg {
    iD = 3203,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 3203,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "裁决者变身4"
    };
getRow(3204)->
    #skill_effectCfg {
    iD = 3204,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 3204,
    param2 = 201,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "裁决者变身5"
    };
getRow(3300)->
    #skill_effectCfg {
    iD = 3300,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 42,
    param2 = 0,
    param3 = 6,
    param4 = 8300,
    param5 = 0,
    param6 = 1,
    skillName = "烈焰领域载体"
    };
getRow(3301)->
    #skill_effectCfg {
    iD = 3301,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 3301,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "烈焰领域降低伤害"
    };
getRow(3302)->
    #skill_effectCfg {
    iD = 3302,
    effectType = 19,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 3302,
    param2 = 122,
    param3 = 0.25,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "烈焰领域冻结"
    };
getRow(3505)->
    #skill_effectCfg {
    iD = 3505,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3505,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战神之力I"
    };
getRow(3506)->
    #skill_effectCfg {
    iD = 3506,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3506,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战神之力II"
    };
getRow(3507)->
    #skill_effectCfg {
    iD = 3507,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3507,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战神之力III"
    };
getRow(3508)->
    #skill_effectCfg {
    iD = 3508,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3508,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战神之力IV"
    };
getRow(3509)->
    #skill_effectCfg {
    iD = 3509,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3509,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战神之力V"
    };
getRow(3510)->
    #skill_effectCfg {
    iD = 3510,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3510,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战神之力VI"
    };
getRow(3511)->
    #skill_effectCfg {
    iD = 3511,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3511,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战神之力VII"
    };
getRow(3512)->
    #skill_effectCfg {
    iD = 3512,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3512,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战神之力VIII"
    };
getRow(3513)->
    #skill_effectCfg {
    iD = 3513,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3513,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战神之力IX"
    };
getRow(3514)->
    #skill_effectCfg {
    iD = 3514,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3514,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战神之力X"
    };
getRow(3515)->
    #skill_effectCfg {
    iD = 3515,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3515,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "生命之力I"
    };
getRow(3516)->
    #skill_effectCfg {
    iD = 3516,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3516,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "生命之力II"
    };
getRow(3517)->
    #skill_effectCfg {
    iD = 3517,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3517,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "生命之力III"
    };
getRow(3518)->
    #skill_effectCfg {
    iD = 3518,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3518,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "生命之力IV"
    };
getRow(3519)->
    #skill_effectCfg {
    iD = 3519,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3519,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "生命之力V"
    };
getRow(3520)->
    #skill_effectCfg {
    iD = 3520,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3520,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "生命之力VI"
    };
getRow(3521)->
    #skill_effectCfg {
    iD = 3521,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3521,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "生命之力VII"
    };
getRow(3522)->
    #skill_effectCfg {
    iD = 3522,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3522,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "生命之力VIII"
    };
getRow(3523)->
    #skill_effectCfg {
    iD = 3523,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3523,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "生命之力IX"
    };
getRow(3524)->
    #skill_effectCfg {
    iD = 3524,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3524,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "生命之力X"
    };
getRow(3525)->
    #skill_effectCfg {
    iD = 3525,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3525,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "坚韧之力I"
    };
getRow(3526)->
    #skill_effectCfg {
    iD = 3526,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3526,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "坚韧之力II"
    };
getRow(3527)->
    #skill_effectCfg {
    iD = 3527,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3527,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "坚韧之力III"
    };
getRow(3528)->
    #skill_effectCfg {
    iD = 3528,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3528,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "坚韧之力IV"
    };
getRow(3529)->
    #skill_effectCfg {
    iD = 3529,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3529,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "坚韧之力V"
    };
getRow(3530)->
    #skill_effectCfg {
    iD = 3530,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3530,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "坚韧之力VI"
    };
getRow(3531)->
    #skill_effectCfg {
    iD = 3531,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3531,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "坚韧之力VII"
    };
getRow(3532)->
    #skill_effectCfg {
    iD = 3532,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3532,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "坚韧之力VIII"
    };
getRow(3533)->
    #skill_effectCfg {
    iD = 3533,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3533,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "坚韧之力IX"
    };
getRow(3534)->
    #skill_effectCfg {
    iD = 3534,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 3534,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "坚韧之力X"
    };
getRow(7011)->
    #skill_effectCfg {
    iD = 7011,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7011,
    param2 = 0,
    param3 = 6,
    param4 = 13000,
    param5 = 1,
    param6 = 1,
    skillName = "召唤仁慈女神"
    };
getRow(7012)->
    #skill_effectCfg {
    iD = 7012,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7012,
    param2 = 0,
    param3 = 6,
    param4 = 13000,
    param5 = 1,
    param6 = 1,
    skillName = "召唤仁慈女神"
    };
getRow(7013)->
    #skill_effectCfg {
    iD = 7013,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7013,
    param2 = 0,
    param3 = 6,
    param4 = 13000,
    param5 = 1,
    param6 = 1,
    skillName = "召唤仁慈女神"
    };
getRow(7014)->
    #skill_effectCfg {
    iD = 7014,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7014,
    param2 = 0,
    param3 = 6,
    param4 = 13000,
    param5 = 1,
    param6 = 1,
    skillName = "召唤仁慈女神"
    };
getRow(7015)->
    #skill_effectCfg {
    iD = 7015,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7015,
    param2 = 0,
    param3 = 6,
    param4 = 13000,
    param5 = 1,
    param6 = 1,
    skillName = "召唤仁慈女神"
    };
getRow(7021)->
    #skill_effectCfg {
    iD = 7021,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7021,
    param2 = 0,
    param3 = 6,
    param4 = 15000,
    param5 = 1,
    param6 = 1,
    skillName = "召唤战争女神"
    };
getRow(7022)->
    #skill_effectCfg {
    iD = 7022,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7022,
    param2 = 0,
    param3 = 6,
    param4 = 15000,
    param5 = 1,
    param6 = 1,
    skillName = "召唤战争女神"
    };
getRow(7023)->
    #skill_effectCfg {
    iD = 7023,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7023,
    param2 = 0,
    param3 = 6,
    param4 = 15000,
    param5 = 1,
    param6 = 1,
    skillName = "召唤战争女神"
    };
getRow(7024)->
    #skill_effectCfg {
    iD = 7024,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7024,
    param2 = 0,
    param3 = 6,
    param4 = 15000,
    param5 = 1,
    param6 = 1,
    skillName = "召唤战争女神"
    };
getRow(7025)->
    #skill_effectCfg {
    iD = 7025,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7025,
    param2 = 0,
    param3 = 6,
    param4 = 15000,
    param5 = 1,
    param6 = 1,
    skillName = "召唤战争女神"
    };
getRow(7031)->
    #skill_effectCfg {
    iD = 7031,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7031,
    param2 = 0,
    param3 = 6,
    param4 = 25000,
    param5 = 1,
    param6 = 1,
    skillName = "召唤智慧女神"
    };
getRow(7032)->
    #skill_effectCfg {
    iD = 7032,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7032,
    param2 = 0,
    param3 = 6,
    param4 = 25000,
    param5 = 1,
    param6 = 1,
    skillName = "召唤智慧女神"
    };
getRow(7033)->
    #skill_effectCfg {
    iD = 7033,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7033,
    param2 = 0,
    param3 = 6,
    param4 = 25000,
    param5 = 1,
    param6 = 1,
    skillName = "召唤智慧女神"
    };
getRow(7034)->
    #skill_effectCfg {
    iD = 7034,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7034,
    param2 = 0,
    param3 = 6,
    param4 = 25000,
    param5 = 1,
    param6 = 1,
    skillName = "召唤智慧女神"
    };
getRow(7035)->
    #skill_effectCfg {
    iD = 7035,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7035,
    param2 = 0,
    param3 = 6,
    param4 = 25000,
    param5 = 1,
    param6 = 1,
    skillName = "召唤智慧女神"
    };
getRow(7041)->
    #skill_effectCfg {
    iD = 7041,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7041,
    param2 = 0,
    param3 = 6,
    param4 = 25000,
    param5 = 1,
    param6 = 1,
    skillName = "召唤暗夜女神"
    };
getRow(7042)->
    #skill_effectCfg {
    iD = 7042,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7042,
    param2 = 0,
    param3 = 6,
    param4 = 25000,
    param5 = 1,
    param6 = 1,
    skillName = "召唤暗夜女神"
    };
getRow(7043)->
    #skill_effectCfg {
    iD = 7043,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7043,
    param2 = 0,
    param3 = 6,
    param4 = 25000,
    param5 = 1,
    param6 = 1,
    skillName = "召唤暗夜女神"
    };
getRow(7044)->
    #skill_effectCfg {
    iD = 7044,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7044,
    param2 = 0,
    param3 = 6,
    param4 = 25000,
    param5 = 1,
    param6 = 1,
    skillName = "召唤暗夜女神"
    };
getRow(7045)->
    #skill_effectCfg {
    iD = 7045,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7045,
    param2 = 0,
    param3 = 6,
    param4 = 25000,
    param5 = 1,
    param6 = 1,
    skillName = "召唤暗夜女神"
    };
getRow(7111)->
    #skill_effectCfg {
    iD = 7111,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7111,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "召唤仁慈女神"
    };
getRow(7112)->
    #skill_effectCfg {
    iD = 7112,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7112,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "召唤仁慈女神"
    };
getRow(7113)->
    #skill_effectCfg {
    iD = 7113,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7113,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "召唤仁慈女神"
    };
getRow(7114)->
    #skill_effectCfg {
    iD = 7114,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7114,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "召唤仁慈女神"
    };
getRow(7115)->
    #skill_effectCfg {
    iD = 7115,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7115,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "召唤仁慈女神"
    };
getRow(7121)->
    #skill_effectCfg {
    iD = 7121,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7121,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "召唤战争女神"
    };
getRow(7122)->
    #skill_effectCfg {
    iD = 7122,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7122,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "召唤战争女神"
    };
getRow(7123)->
    #skill_effectCfg {
    iD = 7123,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7123,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "召唤战争女神"
    };
getRow(7124)->
    #skill_effectCfg {
    iD = 7124,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7124,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "召唤战争女神"
    };
getRow(7125)->
    #skill_effectCfg {
    iD = 7125,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7125,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "召唤战争女神"
    };
getRow(7131)->
    #skill_effectCfg {
    iD = 7131,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7131,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "召唤智慧女神"
    };
getRow(7132)->
    #skill_effectCfg {
    iD = 7132,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7132,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "召唤智慧女神"
    };
getRow(7133)->
    #skill_effectCfg {
    iD = 7133,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7133,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "召唤智慧女神"
    };
getRow(7134)->
    #skill_effectCfg {
    iD = 7134,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7134,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "召唤智慧女神"
    };
getRow(7135)->
    #skill_effectCfg {
    iD = 7135,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7135,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "召唤智慧女神"
    };
getRow(7141)->
    #skill_effectCfg {
    iD = 7141,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7141,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "召唤暗夜女神"
    };
getRow(7142)->
    #skill_effectCfg {
    iD = 7142,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7142,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "召唤暗夜女神"
    };
getRow(7143)->
    #skill_effectCfg {
    iD = 7143,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7143,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "召唤暗夜女神"
    };
getRow(7144)->
    #skill_effectCfg {
    iD = 7144,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7144,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "召唤暗夜女神"
    };
getRow(7145)->
    #skill_effectCfg {
    iD = 7145,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7145,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "召唤暗夜女神"
    };
getRow(7211)->
    #skill_effectCfg {
    iD = 7211,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5001,
    param2 = 1,
    param3 = 4500,
    param4 = 4,
    param5 = 4,
    param6 = 1,
    skillName = "仁慈召唤I"
    };
getRow(7212)->
    #skill_effectCfg {
    iD = 7212,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5002,
    param2 = 1,
    param3 = 4000,
    param4 = 4,
    param5 = -4,
    param6 = 1,
    skillName = "战争召唤I"
    };
getRow(7213)->
    #skill_effectCfg {
    iD = 7213,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5003,
    param2 = 1,
    param3 = 4500,
    param4 = -4,
    param5 = 4,
    param6 = 1,
    skillName = "智慧召唤I"
    };
getRow(7214)->
    #skill_effectCfg {
    iD = 7214,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5004,
    param2 = 1,
    param3 = 3500,
    param4 = -4,
    param5 = -4,
    param6 = 1,
    skillName = "暗夜召唤I"
    };
getRow(7311)->
    #skill_effectCfg {
    iD = 7311,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7311,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    skillName = "召唤仁慈女神"
    };
getRow(7312)->
    #skill_effectCfg {
    iD = 7312,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7312,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    skillName = "召唤仁慈女神"
    };
getRow(7313)->
    #skill_effectCfg {
    iD = 7313,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7313,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    skillName = "召唤仁慈女神"
    };
getRow(7314)->
    #skill_effectCfg {
    iD = 7314,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7314,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    skillName = "召唤仁慈女神"
    };
getRow(7315)->
    #skill_effectCfg {
    iD = 7315,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7315,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    skillName = "召唤仁慈女神"
    };
getRow(7321)->
    #skill_effectCfg {
    iD = 7321,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7321,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    skillName = "召唤战争女神"
    };
getRow(7322)->
    #skill_effectCfg {
    iD = 7322,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7322,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    skillName = "召唤战争女神"
    };
getRow(7323)->
    #skill_effectCfg {
    iD = 7323,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7323,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    skillName = "召唤战争女神"
    };
getRow(7324)->
    #skill_effectCfg {
    iD = 7324,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7324,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    skillName = "召唤战争女神"
    };
getRow(7325)->
    #skill_effectCfg {
    iD = 7325,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7325,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    skillName = "召唤战争女神"
    };
getRow(7331)->
    #skill_effectCfg {
    iD = 7331,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7331,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    skillName = "召唤智慧女神"
    };
getRow(7332)->
    #skill_effectCfg {
    iD = 7332,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7332,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    skillName = "召唤智慧女神"
    };
getRow(7333)->
    #skill_effectCfg {
    iD = 7333,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7333,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    skillName = "召唤智慧女神"
    };
getRow(7334)->
    #skill_effectCfg {
    iD = 7334,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7334,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    skillName = "召唤智慧女神"
    };
getRow(7335)->
    #skill_effectCfg {
    iD = 7335,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7335,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    skillName = "召唤智慧女神"
    };
getRow(7341)->
    #skill_effectCfg {
    iD = 7341,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7341,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    skillName = "召唤暗夜女神"
    };
getRow(7342)->
    #skill_effectCfg {
    iD = 7342,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7342,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    skillName = "召唤暗夜女神"
    };
getRow(7343)->
    #skill_effectCfg {
    iD = 7343,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7343,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    skillName = "召唤暗夜女神"
    };
getRow(7344)->
    #skill_effectCfg {
    iD = 7344,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7344,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    skillName = "召唤暗夜女神"
    };
getRow(7345)->
    #skill_effectCfg {
    iD = 7345,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7345,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    skillName = "召唤暗夜女神"
    };
getRow(7411)->
    #skill_effectCfg {
    iD = 7411,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7411,
    param2 = 0,
    param3 = 6,
    param4 = 1500,
    param5 = 1,
    param6 = 1,
    skillName = "召唤仁慈女神"
    };
getRow(7421)->
    #skill_effectCfg {
    iD = 7421,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7421,
    param2 = 0,
    param3 = 6,
    param4 = 5000,
    param5 = 0,
    param6 = 1,
    skillName = "召唤仁慈女神"
    };
getRow(7431)->
    #skill_effectCfg {
    iD = 7431,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7431,
    param2 = 0,
    param3 = 6,
    param4 = 8000,
    param5 = 0,
    param6 = 1,
    skillName = "召唤仁慈女神"
    };
getRow(7441)->
    #skill_effectCfg {
    iD = 7441,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 7441,
    param2 = 0,
    param3 = 6,
    param4 = 10000,
    param5 = 0,
    param6 = 1,
    skillName = "召唤仁慈女神"
    };
getRow(10001)->
    #skill_effectCfg {
    iD = 10001,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10001,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "骑士大招免控1"
    };
getRow(10002)->
    #skill_effectCfg {
    iD = 10002,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10002,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "骑士大招免控2"
    };
getRow(10003)->
    #skill_effectCfg {
    iD = 10003,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10003,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "怒焰之心"
    };
getRow(10004)->
    #skill_effectCfg {
    iD = 10004,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10004,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "法师大招免控1"
    };
getRow(10005)->
    #skill_effectCfg {
    iD = 10005,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10005,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "法师大招免控2"
    };
getRow(10006)->
    #skill_effectCfg {
    iD = 10006,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10006,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "刺客先发制人"
    };
getRow(10007)->
    #skill_effectCfg {
    iD = 10007,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10007,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "刺客生存意志"
    };
getRow(10008)->
    #skill_effectCfg {
    iD = 10008,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10008,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "雷霆意志被动"
    };
getRow(10009)->
    #skill_effectCfg {
    iD = 10009,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10009,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "魔女亡者气息免控1"
    };
getRow(10010)->
    #skill_effectCfg {
    iD = 10010,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10010,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "魔女亡者气息免控2"
    };
getRow(10011)->
    #skill_effectCfg {
    iD = 10011,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10011,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "远古恶魔"
    };
getRow(10012)->
    #skill_effectCfg {
    iD = 10012,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10012,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "献祭，力量+5%"
    };
getRow(10013)->
    #skill_effectCfg {
    iD = 10013,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10013,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "亡者意志，体质+5%"
    };
getRow(10014)->
    #skill_effectCfg {
    iD = 10014,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10014,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "死亡凝视，防御+5%"
    };
getRow(10015)->
    #skill_effectCfg {
    iD = 10015,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 10015,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "点射定身"
    };
getRow(10016)->
    #skill_effectCfg {
    iD = 10016,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "爆炎手雷击退"
    };
getRow(10017)->
    #skill_effectCfg {
    iD = 10017,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 10017,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "爆炎手雷击退抓取不受控制"
    };
getRow(10018)->
    #skill_effectCfg {
    iD = 10018,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 10018,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "火焰喷射降低伤害抗性"
    };
getRow(10019)->
    #skill_effectCfg {
    iD = 10019,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 10019,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "激光射线降低伤害"
    };
getRow(10020)->
    #skill_effectCfg {
    iD = 10020,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 10020,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "重力炸弹定身"
    };
getRow(10021)->
    #skill_effectCfg {
    iD = 10021,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "炮击击退"
    };
getRow(10022)->
    #skill_effectCfg {
    iD = 10022,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 10022,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "炮击击退不受控制"
    };
getRow(10023)->
    #skill_effectCfg {
    iD = 10023,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10023,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "迅捷加速，伤害提高，攻速提高"
    };
getRow(10024)->
    #skill_effectCfg {
    iD = 10024,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10024,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "迅捷免疫1"
    };
getRow(10025)->
    #skill_effectCfg {
    iD = 10025,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10025,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "迅捷免疫2"
    };
getRow(10026)->
    #skill_effectCfg {
    iD = 10026,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10026,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "嗜血光环"
    };
getRow(10027)->
    #skill_effectCfg {
    iD = 10027,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10027,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "杀戮意志暴击"
    };
getRow(10028)->
    #skill_effectCfg {
    iD = 10028,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 10028,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "杀戮意志调用"
    };
getRow(10029)->
    #skill_effectCfg {
    iD = 10029,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10029,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "力破"
    };
getRow(10030)->
    #skill_effectCfg {
    iD = 10030,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 10030,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "力破调用"
    };
getRow(10031)->
    #skill_effectCfg {
    iD = 10031,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10031,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "血腥杀戮"
    };
getRow(10032)->
    #skill_effectCfg {
    iD = 10032,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10032,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "神佑"
    };
getRow(10033)->
    #skill_effectCfg {
    iD = 10033,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10033,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "急速"
    };
getRow(12101)->
    #skill_effectCfg {
    iD = 12101,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 12101,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "影踪劲"
    };
getRow(12201)->
    #skill_effectCfg {
    iD = 12201,
    effectType = 1,
    effectChance = 1,
    effectcondition = 1,
    effectTarget = 0,
    param1 = 12201,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "影踪劲触发持续伤害"
    };
getRow(13007)->
    #skill_effectCfg {
    iD = 13007,
    effectType = 8,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 50010,
    param2 = 1,
    param3 = 0,
    param4 = 1,
    param5 = 0,
    param6 = 0,
    skillName = "远古恶魔"
    };
getRow(13302)->
    #skill_effectCfg {
    iD = 13302,
    effectType = 8,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 50011,
    param2 = 1,
    param3 = 0,
    param4 = 1,
    param5 = 0,
    param6 = 0,
    skillName = "生生不息额外召唤1"
    };
getRow(13303)->
    #skill_effectCfg {
    iD = 13303,
    effectType = 8,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 50012,
    param2 = 1,
    param3 = 0,
    param4 = 1,
    param5 = 0,
    param6 = 0,
    skillName = "生生不息额外召唤2"
    };
getRow(13304)->
    #skill_effectCfg {
    iD = 13304,
    effectType = 8,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 50013,
    param2 = 1,
    param3 = 0,
    param4 = 1,
    param5 = 0,
    param6 = 0,
    skillName = "生生不息额外召唤3"
    };
getRow(13500)->
    #skill_effectCfg {
    iD = 13500,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 13500,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "夫妻技能增加生命（被动）"
    };
getRow(13501)->
    #skill_effectCfg {
    iD = 13501,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 13501,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "夫妻技能增加物攻（被动）"
    };
getRow(13502)->
    #skill_effectCfg {
    iD = 13502,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 13502,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "夫妻技能增加法攻（被动）"
    };
getRow(13503)->
    #skill_effectCfg {
    iD = 13503,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 13503,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "夫妻技能增加物防（被动）"
    };
getRow(13504)->
    #skill_effectCfg {
    iD = 13504,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 13504,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "夫妻技能增加法防（被动）"
    };
getRow(14008)->
    #skill_effectCfg {
    iD = 14008,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 43,
    param2 = 0,
    param3 = 6,
    param4 = 6800,
    param5 = 0,
    param6 = 1,
    skillName = "冰风暴载体"
    };
getRow(15000)->
    #skill_effectCfg {
    iD = 15000,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 44,
    param2 = 0,
    param3 = 6,
    param4 = 8300,
    param5 = 0,
    param6 = 1,
    skillName = "冥王召唤"
    };
getRow(15001)->
    #skill_effectCfg {
    iD = 15001,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 20015,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "闪避提升20%"
    };
getRow(15010)->
    #skill_effectCfg {
    iD = 15010,
    effectType = 12,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = -0.05,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "第三次攻击减最大生命值"
    };
getRow(15020)->
    #skill_effectCfg {
    iD = 15020,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 13400,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "枪械师治疗"
    };
getRow(19000)->
    #skill_effectCfg {
    iD = 19000,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "首领入侵boss1号"
    };
getRow(19001)->
    #skill_effectCfg {
    iD = 19001,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19001,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "首领入侵boss1号"
    };
getRow(19002)->
    #skill_effectCfg {
    iD = 19002,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "首领入侵boss1号"
    };
getRow(19003)->
    #skill_effectCfg {
    iD = 19003,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19003,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "首领入侵boss1号"
    };
getRow(19004)->
    #skill_effectCfg {
    iD = 19004,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "首领入侵boss2号"
    };
getRow(19005)->
    #skill_effectCfg {
    iD = 19005,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "首领入侵boss2号"
    };
getRow(19006)->
    #skill_effectCfg {
    iD = 19006,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 19006,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "首领入侵boss2号"
    };
getRow(19007)->
    #skill_effectCfg {
    iD = 19007,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "首领入侵boss2号"
    };
getRow(19008)->
    #skill_effectCfg {
    iD = 19008,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "首领入侵boss3号"
    };
getRow(19009)->
    #skill_effectCfg {
    iD = 19009,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19009,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "首领入侵boss3号"
    };
getRow(19010)->
    #skill_effectCfg {
    iD = 19010,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 19010,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "首领入侵boss3号"
    };
getRow(19011)->
    #skill_effectCfg {
    iD = 19011,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19011,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "首领入侵boss3号"
    };
getRow(19012)->
    #skill_effectCfg {
    iD = 19012,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "首领入侵boss4号"
    };
getRow(19013)->
    #skill_effectCfg {
    iD = 19013,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "首领入侵boss4号"
    };
getRow(19014)->
    #skill_effectCfg {
    iD = 19014,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19014,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "首领入侵boss4号"
    };
getRow(19015)->
    #skill_effectCfg {
    iD = 19015,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "首领入侵boss4号"
    };
getRow(19016)->
    #skill_effectCfg {
    iD = 19016,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "首领入侵boss5号"
    };
getRow(19017)->
    #skill_effectCfg {
    iD = 19017,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19017,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "首领入侵boss5号"
    };
getRow(19018)->
    #skill_effectCfg {
    iD = 19018,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19017,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "首领入侵boss5号"
    };
getRow(19019)->
    #skill_effectCfg {
    iD = 19019,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "首领入侵boss5号"
    };
getRow(19020)->
    #skill_effectCfg {
    iD = 19020,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "野外boss2号"
    };
getRow(19021)->
    #skill_effectCfg {
    iD = 19021,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "野外boss2号"
    };
getRow(19022)->
    #skill_effectCfg {
    iD = 19022,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "野外boss2号"
    };
getRow(19023)->
    #skill_effectCfg {
    iD = 19023,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19023,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "野外boss2号"
    };
getRow(19024)->
    #skill_effectCfg {
    iD = 19024,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "野外boss3号"
    };
getRow(19025)->
    #skill_effectCfg {
    iD = 19025,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19025,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "野外boss3号"
    };
getRow(19026)->
    #skill_effectCfg {
    iD = 19026,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "野外boss3号"
    };
getRow(19027)->
    #skill_effectCfg {
    iD = 19027,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19027,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "野外boss3号"
    };
getRow(19028)->
    #skill_effectCfg {
    iD = 19028,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "野外boss4号"
    };
getRow(19029)->
    #skill_effectCfg {
    iD = 19029,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "野外boss4号"
    };
getRow(19030)->
    #skill_effectCfg {
    iD = 19030,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19030,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "野外boss4号"
    };
getRow(19031)->
    #skill_effectCfg {
    iD = 19031,
    effectType = 4,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 1110,
    param2 = 10,
    param3 = 20,
    param4 = 0,
    param5 = 0,
    param6 = 20,
    skillName = "野外boss4号"
    };
getRow(19032)->
    #skill_effectCfg {
    iD = 19032,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "野外boss5号"
    };
getRow(19033)->
    #skill_effectCfg {
    iD = 19033,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "野外boss5号"
    };
getRow(19034)->
    #skill_effectCfg {
    iD = 19034,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19034,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "野外boss5号"
    };
getRow(19035)->
    #skill_effectCfg {
    iD = 19035,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 19035,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "野外boss5号"
    };
getRow(20000)->
    #skill_effectCfg {
    iD = 20000,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 20000,
    param2 = 0,
    param3 = 0,
    param4 = 5000,
    param5 = 0,
    param6 = 0,
    skillName = "首领入侵2号boss载体"
    };
getRow(20001)->
    #skill_effectCfg {
    iD = 20001,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 15001,
    param2 = 0,
    param3 = 0,
    param4 = 5000,
    param5 = 0,
    param6 = 0,
    skillName = "首领入侵4号boss载体"
    };
getRow(20002)->
    #skill_effectCfg {
    iD = 20002,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 15002,
    param2 = 0,
    param3 = 0,
    param4 = 1500,
    param5 = 0,
    param6 = 0,
    skillName = "首领入侵4号boss载体"
    };
getRow(20003)->
    #skill_effectCfg {
    iD = 20003,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 15003,
    param2 = 0,
    param3 = 0,
    param4 = 5000,
    param5 = 0,
    param6 = 0,
    skillName = "首领入侵4号boss载体"
    };
getRow(20004)->
    #skill_effectCfg {
    iD = 20004,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 20004,
    param2 = 0,
    param3 = 0,
    param4 = 5000,
    param5 = 0,
    param6 = 0,
    skillName = "野外1号boss载体"
    };
getRow(20005)->
    #skill_effectCfg {
    iD = 20005,
    effectType = 14,
    effectChance = 0.3,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 20005,
    param2 = 0,
    param3 = 0,
    param4 = 5000,
    param5 = 0,
    param6 = 0,
    skillName = "野外5号boss载体"
    };
getRow(20006)->
    #skill_effectCfg {
    iD = 20006,
    effectType = 14,
    effectChance = 0.3,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 20006,
    param2 = 0,
    param3 = 0,
    param4 = 7000,
    param5 = 0,
    param6 = 0,
    skillName = "野外5号boss载体"
    };
getRow(30001)->
    #skill_effectCfg {
    iD = 30001,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 30001,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "火器灵灼烧"
    };
getRow(30002)->
    #skill_effectCfg {
    iD = 30002,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 30002,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "火器灵灼烧"
    };
getRow(30003)->
    #skill_effectCfg {
    iD = 30003,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 30003,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "冰器灵冰盾"
    };
getRow(30004)->
    #skill_effectCfg {
    iD = 30004,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 30004,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "冰器灵冰盾"
    };
getRow(30005)->
    #skill_effectCfg {
    iD = 30005,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 30005,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "电器灵闪电风暴"
    };
getRow(30006)->
    #skill_effectCfg {
    iD = 30006,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 30006,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "电器灵闪电风暴"
    };
getRow(30007)->
    #skill_effectCfg {
    iD = 30007,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 30007,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "风器灵风刃"
    };
getRow(30008)->
    #skill_effectCfg {
    iD = 30008,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 30008,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "风器灵风刃"
    };
getRow(30009)->
    #skill_effectCfg {
    iD = 30009,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 30009,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "光器灵光愈"
    };
getRow(30010)->
    #skill_effectCfg {
    iD = 30010,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 30010,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "光器灵光愈"
    };
getRow(30011)->
    #skill_effectCfg {
    iD = 30011,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 30011,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "暗器灵暗灭"
    };
getRow(30012)->
    #skill_effectCfg {
    iD = 30012,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 30012,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "暗器灵暗灭"
    };
getRow(31001)->
    #skill_effectCfg {
    iD = 31001,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 31001,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "火器灵灼烧"
    };
getRow(31002)->
    #skill_effectCfg {
    iD = 31002,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 31002,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "火器灵灼烧"
    };
getRow(31003)->
    #skill_effectCfg {
    iD = 31003,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 31003,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "冰器灵冰盾"
    };
getRow(31004)->
    #skill_effectCfg {
    iD = 31004,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 31004,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "冰器灵冰盾"
    };
getRow(31005)->
    #skill_effectCfg {
    iD = 31005,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 31005,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "电器灵闪电风暴"
    };
getRow(31006)->
    #skill_effectCfg {
    iD = 31006,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 31006,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "电器灵闪电风暴"
    };
getRow(31007)->
    #skill_effectCfg {
    iD = 31007,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 31007,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "风器灵风刃"
    };
getRow(31008)->
    #skill_effectCfg {
    iD = 31008,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 31008,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "风器灵风刃"
    };
getRow(32111)->
    #skill_effectCfg {
    iD = 32111,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32111,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "药水恢复+10%"
    };
getRow(32112)->
    #skill_effectCfg {
    iD = 32112,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32112,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "药水恢复+20%"
    };
getRow(32113)->
    #skill_effectCfg {
    iD = 32113,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32113,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "药水恢复+30%"
    };
getRow(32114)->
    #skill_effectCfg {
    iD = 32114,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32114,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "药水恢复+30%"
    };
getRow(32115)->
    #skill_effectCfg {
    iD = 32115,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32115,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "药水恢复+30%"
    };
getRow(32211)->
    #skill_effectCfg {
    iD = 32211,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32211,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "物理防御和魔法防御+300"
    };
getRow(32212)->
    #skill_effectCfg {
    iD = 32212,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32212,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "物理防御和魔法防御+400"
    };
getRow(32213)->
    #skill_effectCfg {
    iD = 32213,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32213,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "物理防御和魔法防御+500"
    };
getRow(32214)->
    #skill_effectCfg {
    iD = 32214,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32214,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "物理防御和魔法防御+600"
    };
getRow(32215)->
    #skill_effectCfg {
    iD = 32215,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32215,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "物理防御和魔法防御+700"
    };
getRow(32311)->
    #skill_effectCfg {
    iD = 32311,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32311,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "受到的所有伤害-5%"
    };
getRow(32312)->
    #skill_effectCfg {
    iD = 32312,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32312,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "受到的所有伤害-10%"
    };
getRow(32313)->
    #skill_effectCfg {
    iD = 32313,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32313,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "受到的所有伤害-15%"
    };
getRow(32314)->
    #skill_effectCfg {
    iD = 32314,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32314,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "受到的所有伤害-20%"
    };
getRow(32315)->
    #skill_effectCfg {
    iD = 32315,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32315,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "受到的所有伤害-25%"
    };
getRow(32411)->
    #skill_effectCfg {
    iD = 32411,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32411,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "暴击等级+200"
    };
getRow(32412)->
    #skill_effectCfg {
    iD = 32412,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32412,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "暴击等级+300"
    };
getRow(32413)->
    #skill_effectCfg {
    iD = 32413,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32413,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "暴击等级+500"
    };
getRow(32414)->
    #skill_effectCfg {
    iD = 32414,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32414,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "暴击等级+500"
    };
getRow(32415)->
    #skill_effectCfg {
    iD = 32415,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32415,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "暴击等级+500"
    };
getRow(32511)->
    #skill_effectCfg {
    iD = 32511,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32511,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "物理攻击和魔法攻击+50"
    };
getRow(32512)->
    #skill_effectCfg {
    iD = 32512,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32512,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "物理攻击和魔法攻击+100"
    };
getRow(32513)->
    #skill_effectCfg {
    iD = 32513,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32513,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "物理攻击和魔法攻击+150"
    };
getRow(32514)->
    #skill_effectCfg {
    iD = 32514,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32514,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "物理攻击和魔法攻击+200"
    };
getRow(32515)->
    #skill_effectCfg {
    iD = 32515,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32515,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "物理攻击和魔法攻击+250"
    };
getRow(32611)->
    #skill_effectCfg {
    iD = 32611,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32611,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "造成的所有伤害+10%"
    };
getRow(32612)->
    #skill_effectCfg {
    iD = 32612,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32612,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "造成的所有伤害+15%"
    };
getRow(32613)->
    #skill_effectCfg {
    iD = 32613,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32613,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "造成的所有伤害+20%"
    };
getRow(32614)->
    #skill_effectCfg {
    iD = 32614,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32614,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "造成的所有伤害+25%"
    };
getRow(32615)->
    #skill_effectCfg {
    iD = 32615,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32615,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "造成的所有伤害+30%"
    };
getRow(32711)->
    #skill_effectCfg {
    iD = 32711,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32711,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "破甲等级+200"
    };
getRow(32712)->
    #skill_effectCfg {
    iD = 32712,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32712,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "破甲等级+300"
    };
getRow(32713)->
    #skill_effectCfg {
    iD = 32713,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32713,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "破甲等级+500"
    };
getRow(32714)->
    #skill_effectCfg {
    iD = 32714,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32714,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "破甲等级+500"
    };
getRow(32715)->
    #skill_effectCfg {
    iD = 32715,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32715,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "破甲等级+500"
    };
getRow(32811)->
    #skill_effectCfg {
    iD = 32811,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32811,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "命中等级+50"
    };
getRow(32812)->
    #skill_effectCfg {
    iD = 32812,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32812,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "命中等级+100"
    };
getRow(32813)->
    #skill_effectCfg {
    iD = 32813,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32813,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "命中等级+150"
    };
getRow(32814)->
    #skill_effectCfg {
    iD = 32814,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32814,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "命中等级+200"
    };
getRow(32815)->
    #skill_effectCfg {
    iD = 32815,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32815,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "命中等级+250"
    };
getRow(32911)->
    #skill_effectCfg {
    iD = 32911,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32911,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "基础技能的冷却时间减少5%"
    };
getRow(32912)->
    #skill_effectCfg {
    iD = 32912,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32912,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "基础技能的冷却时间减少6%"
    };
getRow(32913)->
    #skill_effectCfg {
    iD = 32913,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32913,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "基础技能的冷却时间减少7%"
    };
getRow(32914)->
    #skill_effectCfg {
    iD = 32914,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32914,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "基础技能的冷却时间减少8%"
    };
getRow(32915)->
    #skill_effectCfg {
    iD = 32915,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32915,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "基础技能的冷却时间减少10%"
    };
getRow(33011)->
    #skill_effectCfg {
    iD = 33011,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33011,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "闪避+100"
    };
getRow(33012)->
    #skill_effectCfg {
    iD = 33012,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33012,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "闪避+150"
    };
getRow(33013)->
    #skill_effectCfg {
    iD = 33013,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33013,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "闪避+200"
    };
getRow(33014)->
    #skill_effectCfg {
    iD = 33014,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33014,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "闪避+200"
    };
getRow(33015)->
    #skill_effectCfg {
    iD = 33015,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33015,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "闪避+200"
    };
getRow(33111)->
    #skill_effectCfg {
    iD = 33111,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33111,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "韧性+150"
    };
getRow(33112)->
    #skill_effectCfg {
    iD = 33112,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33112,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "韧性+200"
    };
getRow(33113)->
    #skill_effectCfg {
    iD = 33113,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33113,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "韧性+250"
    };
getRow(33114)->
    #skill_effectCfg {
    iD = 33114,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33114,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "韧性+300"
    };
getRow(33115)->
    #skill_effectCfg {
    iD = 33115,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33115,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "韧性+350"
    };
getRow(33211)->
    #skill_effectCfg {
    iD = 33211,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33211,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "骑宠伤害+5%"
    };
getRow(33212)->
    #skill_effectCfg {
    iD = 33212,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33212,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "骑宠伤害+10%"
    };
getRow(33213)->
    #skill_effectCfg {
    iD = 33213,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33213,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "骑宠伤害+15%"
    };
getRow(33214)->
    #skill_effectCfg {
    iD = 33214,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33214,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "骑宠伤害+20%"
    };
getRow(33215)->
    #skill_effectCfg {
    iD = 33215,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33215,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "骑宠伤害+25%"
    };
getRow(40001)->
    #skill_effectCfg {
    iD = 40001,
    effectType = 1,
    effectChance = 0,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40001,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "荼毒BUFF"
    };
getRow(40002)->
    #skill_effectCfg {
    iD = 40002,
    effectType = 1,
    effectChance = 0.5,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 173,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "概率中毒BUFF"
    };
getRow(40003)->
    #skill_effectCfg {
    iD = 40003,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40003,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战士加攻"
    };
getRow(40004)->
    #skill_effectCfg {
    iD = 40004,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40004,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战士加防"
    };
getRow(40006)->
    #skill_effectCfg {
    iD = 40006,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40006,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "龙翔斩击退2m"
    };
getRow(40007)->
    #skill_effectCfg {
    iD = 40007,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40007,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "肩击震退"
    };
getRow(40008)->
    #skill_effectCfg {
    iD = 40008,
    effectType = 19,
    effectChance = 0.8,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40008,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "肩击概率击晕"
    };
getRow(40009)->
    #skill_effectCfg {
    iD = 40009,
    effectType = 19,
    effectChance = 0.8,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40009,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "敲击概率击晕"
    };
getRow(40010)->
    #skill_effectCfg {
    iD = 40010,
    effectType = 1,
    effectChance = 0.2,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40010,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "暗斩概率流血"
    };
getRow(40011)->
    #skill_effectCfg {
    iD = 40011,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40011,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "快步疾走加速"
    };
getRow(40012)->
    #skill_effectCfg {
    iD = 40012,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40012,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "弱点侦测加暴击"
    };
getRow(40013)->
    #skill_effectCfg {
    iD = 40013,
    effectType = 1,
    effectChance = 0.8,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40013,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "升龙斩概率击晕"
    };
getRow(40014)->
    #skill_effectCfg {
    iD = 40014,
    effectType = 1,
    effectChance = 0.5,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40014,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "烈风突刺概率流血"
    };
getRow(40015)->
    #skill_effectCfg {
    iD = 40015,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40015,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "强力打击暴击伤害增加"
    };
getRow(40016)->
    #skill_effectCfg {
    iD = 40016,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40016,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "增加法功"
    };
getRow(40017)->
    #skill_effectCfg {
    iD = 40017,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40017,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "恢复HP（单体）"
    };
getRow(40018)->
    #skill_effectCfg {
    iD = 40018,
    effectType = 19,
    effectChance = 0.3,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40018,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "概率减速"
    };
getRow(40019)->
    #skill_effectCfg {
    iD = 40019,
    effectType = 15,
    effectChance = 0.3,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 6,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "概率震退"
    };
getRow(40020)->
    #skill_effectCfg {
    iD = 40020,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40020,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "神光护体（无敌）"
    };
getRow(40021)->
    #skill_effectCfg {
    iD = 40021,
    effectType = 1,
    effectChance = 0.2,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40021,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "概率冰冻效果"
    };
getRow(40022)->
    #skill_effectCfg {
    iD = 40022,
    effectType = 19,
    effectChance = 0.2,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40022,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "概率减攻速"
    };
getRow(40023)->
    #skill_effectCfg {
    iD = 40023,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40023,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "增加法功"
    };
getRow(40024)->
    #skill_effectCfg {
    iD = 40024,
    effectType = 1,
    effectChance = 0.5,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40024,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "概率灼烧效果"
    };
getRow(40025)->
    #skill_effectCfg {
    iD = 40025,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 45,
    param2 = 0,
    param3 = 0,
    param4 = 2000,
    param5 = 0,
    param6 = 0,
    skillName = "风刃群攻"
    };
getRow(40026)->
    #skill_effectCfg {
    iD = 40026,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 46,
    param2 = 0,
    param3 = 0,
    param4 = 2000,
    param5 = 0,
    param6 = 0,
    skillName = "燃焰术群攻"
    };
getRow(40027)->
    #skill_effectCfg {
    iD = 40027,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 40027,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "降法防"
    };
getRow(40028)->
    #skill_effectCfg {
    iD = 40028,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 47,
    param2 = 0,
    param3 = 0,
    param4 = 2000,
    param5 = 0,
    param6 = 0,
    skillName = "神圣审判群攻"
    };
getRow(40031)->
    #skill_effectCfg {
    iD = 40031,
    effectType = 1,
    effectChance = 0.5,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40031,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战士技能撞击-眩晕"
    };
getRow(40032)->
    #skill_effectCfg {
    iD = 40032,
    effectType = 1,
    effectChance = 0.5,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40032,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "法师技能减速"
    };
getRow(40033)->
    #skill_effectCfg {
    iD = 40033,
    effectType = 1,
    effectChance = 0.5,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40033,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "法师技能冰冻"
    };
getRow(40034)->
    #skill_effectCfg {
    iD = 40034,
    effectType = 5,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 15,
    param2 = 0,
    param3 = 200,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "法师技能位移"
    };
getRow(40035)->
    #skill_effectCfg {
    iD = 40035,
    effectType = 3,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "法师技能解除状态"
    };
getRow(40036)->
    #skill_effectCfg {
    iD = 40036,
    effectType = 5,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 2,
    param2 = 40,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战士普攻3 冲锋"
    };
getRow(40043)->
    #skill_effectCfg {
    iD = 40043,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "法师烈风术小击退"
    };
getRow(40044)->
    #skill_effectCfg {
    iD = 40044,
    effectType = 2,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "治疗中毒"
    };
getRow(40045)->
    #skill_effectCfg {
    iD = 40045,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40045,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "修士魔法师的祝福增加法攻"
    };
getRow(40046)->
    #skill_effectCfg {
    iD = 40046,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40046,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "修士魔法师的祝福增加移动速度"
    };
getRow(40048)->
    #skill_effectCfg {
    iD = 40048,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40048,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "巫师强化睿智加法伤"
    };
getRow(40049)->
    #skill_effectCfg {
    iD = 40049,
    effectType = 1,
    effectChance = 0.75,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40049,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "概率灼烧效果"
    };
getRow(40050)->
    #skill_effectCfg {
    iD = 40050,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40050,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "斗士-龙翔斩-眩晕"
    };
getRow(40051)->
    #skill_effectCfg {
    iD = 40051,
    effectType = 1,
    effectChance = 0.5,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40051,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "守卫-飞天斩-眩晕"
    };
getRow(40052)->
    #skill_effectCfg {
    iD = 40052,
    effectType = 7,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 0,
    param2 = 0.5,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "守卫-嘲讽-聚集目标"
    };
getRow(40053)->
    #skill_effectCfg {
    iD = 40053,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 20000,
    param2 = 0,
    param3 = 0,
    param4 = 2000,
    param5 = 1,
    param6 = 1,
    skillName = "守卫-嘲讽-召唤载体"
    };
getRow(40054)->
    #skill_effectCfg {
    iD = 40054,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20001,
    param2 = 0,
    param3 = 0,
    param4 = 4000,
    param5 = 1,
    param6 = 1,
    skillName = "巫师-冻结之风-载体持续伤害"
    };
getRow(40055)->
    #skill_effectCfg {
    iD = 40055,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 20002,
    param2 = 0,
    param3 = 0,
    param4 = 2000,
    param5 = 0,
    param6 = 1,
    skillName = "守卫-嘲讽-召唤载体"
    };
getRow(40056)->
    #skill_effectCfg {
    iD = 40056,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20003,
    param2 = 0,
    param3 = 0,
    param4 = 4000,
    param5 = 1,
    param6 = 1,
    skillName = "巫师-烈风术载体持续伤害"
    };
getRow(40057)->
    #skill_effectCfg {
    iD = 40057,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20004,
    param2 = 0,
    param3 = 0,
    param4 = 500,
    param5 = 1,
    param6 = 1,
    skillName = "修士-治疗中毒治疗载体"
    };
getRow(40058)->
    #skill_effectCfg {
    iD = 40058,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20005,
    param2 = 0,
    param3 = 0,
    param4 = 500,
    param5 = 1,
    param6 = 1,
    skillName = "修士-治疗中毒中毒载体"
    };
getRow(40059)->
    #skill_effectCfg {
    iD = 40059,
    effectType = 3,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 1,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "修士-治疗技能解除状态"
    };
getRow(40060)->
    #skill_effectCfg {
    iD = 40060,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40060,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "修士-治疗中毒中毒效果"
    };
getRow(40061)->
    #skill_effectCfg {
    iD = 40061,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20006,
    param2 = 0,
    param3 = 0,
    param4 = 3000,
    param5 = 0,
    param6 = 1,
    skillName = "修士-神圣审判载体持续伤害"
    };
getRow(40062)->
    #skill_effectCfg {
    iD = 40062,
    effectType = 1,
    effectChance = 0.3,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40062,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "巫师-烈风术减速"
    };
getRow(40063)->
    #skill_effectCfg {
    iD = 40063,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 3,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "斗士-局击-击退3米"
    };
getRow(40064)->
    #skill_effectCfg {
    iD = 40064,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40064,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "斗士-战士之心-增强队友物防"
    };
getRow(40065)->
    #skill_effectCfg {
    iD = 40065,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40065,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "斗士-强化攻击-增强自身物防"
    };
getRow(40066)->
    #skill_effectCfg {
    iD = 40066,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20008,
    param2 = 0,
    param3 = 0,
    param4 = 7000,
    param5 = 1,
    param6 = 1,
    skillName = "修士-心之祝福载体持续治疗"
    };
getRow(40067)->
    #skill_effectCfg {
    iD = 40067,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40067,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "守卫-局击-降低物攻"
    };
getRow(40068)->
    #skill_effectCfg {
    iD = 40068,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40068,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "守卫-局击-降低法攻"
    };
getRow(40069)->
    #skill_effectCfg {
    iD = 40069,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40069,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "刺客-快速疾走-加暴伤"
    };
getRow(40070)->
    #skill_effectCfg {
    iD = 40070,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40070,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "旅者-快速疾走-加暴伤"
    };
getRow(40071)->
    #skill_effectCfg {
    iD = 40071,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 40071,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "流氓-暗斩-加暴击"
    };
getRow(40072)->
    #skill_effectCfg {
    iD = 40072,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40072,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "流氓-心脏刺激-降低法攻"
    };
getRow(40100)->
    #skill_effectCfg {
    iD = 40100,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40100,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战士-战士之心增强队友物攻"
    };
getRow(40101)->
    #skill_effectCfg {
    iD = 40101,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40101,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "守卫-圣光突刺-中毒"
    };
getRow(40102)->
    #skill_effectCfg {
    iD = 40102,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40102,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "守卫-祝福战士-增强队友物防"
    };
getRow(40103)->
    #skill_effectCfg {
    iD = 40103,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40103,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "守卫-祝福战士-增强队友法防"
    };
getRow(40104)->
    #skill_effectCfg {
    iD = 40104,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40104,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "守卫-嘲讽-降低物防"
    };
getRow(40105)->
    #skill_effectCfg {
    iD = 40105,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40105,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "守卫-嘲讽-降低法防"
    };
getRow(40106)->
    #skill_effectCfg {
    iD = 40106,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40106,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "刺客-漫步航行-减速"
    };
getRow(40107)->
    #skill_effectCfg {
    iD = 40107,
    effectType = 1,
    effectChance = 0.5,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40107,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "刺客-暗斩-流血"
    };
getRow(40108)->
    #skill_effectCfg {
    iD = 40108,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40108,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "刺客-快速疾走-加速"
    };
getRow(40109)->
    #skill_effectCfg {
    iD = 40109,
    effectType = 1,
    effectChance = 0.5,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40109,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "旅者-刺针射击-流血"
    };
getRow(40110)->
    #skill_effectCfg {
    iD = 40110,
    effectType = 1,
    effectChance = 0.5,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40110,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "旅者-刺针射击-降低物攻"
    };
getRow(40111)->
    #skill_effectCfg {
    iD = 40111,
    effectType = 15,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 5,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "旅者-断筋射击-击退"
    };
getRow(40112)->
    #skill_effectCfg {
    iD = 40112,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40112,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "旅者-断筋射击-减速"
    };
getRow(40113)->
    #skill_effectCfg {
    iD = 40113,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40113,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "旅者-快速疾走-加速"
    };
getRow(40114)->
    #skill_effectCfg {
    iD = 40114,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40114,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "旅者-强化视野-队友加命中"
    };
getRow(40115)->
    #skill_effectCfg {
    iD = 40115,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40115,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "旅者-强化视野-队友加闪避"
    };
getRow(40116)->
    #skill_effectCfg {
    iD = 40116,
    effectType = 5,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 0.1,
    param2 = 100,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "流氓-暗斩-冲锋"
    };
getRow(40117)->
    #skill_effectCfg {
    iD = 40117,
    effectType = 5,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 0.1,
    param2 = 100,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "刺客-暗斩-冲锋"
    };
getRow(40118)->
    #skill_effectCfg {
    iD = 40118,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40118,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "流氓-暗斩-流血"
    };
getRow(40120)->
    #skill_effectCfg {
    iD = 40120,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40120,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "旅者-疾风-自身加命中"
    };
getRow(40121)->
    #skill_effectCfg {
    iD = 40121,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40121,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "旅者-疾风-自身加闪避"
    };
getRow(40122)->
    #skill_effectCfg {
    iD = 40122,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40122,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "旅者-尼达的祝福-自身加暴击"
    };
getRow(40123)->
    #skill_effectCfg {
    iD = 40123,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40123,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "战士-强化攻击-增强自身物攻"
    };
getRow(40124)->
    #skill_effectCfg {
    iD = 40124,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40124,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "法师烈风术-防止BUG而设定的怪物定身"
    };
getRow(40125)->
    #skill_effectCfg {
    iD = 40125,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20007,
    param2 = 0,
    param3 = 0,
    param4 = 2000,
    param5 = 1,
    param6 = 1,
    skillName = "职业通用-虚假怪物硬值"
    };
getRow(40126)->
    #skill_effectCfg {
    iD = 40126,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40126,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "虚假怪物硬值（冰冻）"
    };
getRow(40127)->
    #skill_effectCfg {
    iD = 40127,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40127,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "守卫-嘲讽-强制攻击"
    };
getRow(40128)->
    #skill_effectCfg {
    iD = 40128,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40128,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "物理防御降低"
    };
getRow(40129)->
    #skill_effectCfg {
    iD = 40129,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40129,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "物理攻击力增加"
    };
getRow(40130)->
    #skill_effectCfg {
    iD = 40130,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40130,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "物理防御降低"
    };
getRow(40131)->
    #skill_effectCfg {
    iD = 40131,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 20009,
    param2 = 0,
    param3 = 0,
    param4 = 5000,
    param5 = 0,
    param6 = 1,
    skillName = "旅者-漫天箭雨-载体"
    };
getRow(40132)->
    #skill_effectCfg {
    iD = 40132,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 40132,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "持续恢复"
    };
getRow(51000)->
    #skill_effectCfg {
    iD = 51000,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 51000,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "约会怪物减速"
    };
getRow(52000)->
    #skill_effectCfg {
    iD = 52000,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 52000,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "材料副本减速NPC1级"
    };
getRow(52001)->
    #skill_effectCfg {
    iD = 52001,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 52001,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "材料副本减速NPC2级"
    };
getRow(52002)->
    #skill_effectCfg {
    iD = 52002,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 52002,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "材料副本减速NPC3级"
    };
getRow(52003)->
    #skill_effectCfg {
    iD = 52003,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 52003,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "材料副本减速NPC4级"
    };
getRow(52004)->
    #skill_effectCfg {
    iD = 52004,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 52004,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "材料副本加伤NPC1级"
    };
getRow(52005)->
    #skill_effectCfg {
    iD = 52005,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 52005,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "材料副本加伤NPC2级"
    };
getRow(52006)->
    #skill_effectCfg {
    iD = 52006,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 52006,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "材料副本加伤NPC3级"
    };
getRow(52007)->
    #skill_effectCfg {
    iD = 52007,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 52007,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "材料副本加伤NPC4级"
    };
getRow(53000)->
    #skill_effectCfg {
    iD = 53000,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 61000,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "副本引导战士神力觉醒"
    };
getRow(53001)->
    #skill_effectCfg {
    iD = 53001,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 61001,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "副本引导战士神力觉醒被动全技能"
    };
getRow(53002)->
    #skill_effectCfg {
    iD = 53002,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 61002,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "副本引导法师神力觉醒"
    };
getRow(53003)->
    #skill_effectCfg {
    iD = 53003,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 61003,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "副本引导法师神力觉醒被动全技能"
    };
getRow(53004)->
    #skill_effectCfg {
    iD = 53004,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 61004,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "副本引导刺客神力觉醒"
    };
getRow(53005)->
    #skill_effectCfg {
    iD = 53005,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 61005,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "副本引导刺客神力觉醒被动全技能"
    };
getRow(53101)->
    #skill_effectCfg {
    iD = 53101,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 61101,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "器灵材料活动器灵技能-火器灵灼烧"
    };
getRow(53103)->
    #skill_effectCfg {
    iD = 53103,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 61103,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "器灵材料活动器灵技能-冰器灵冰盾"
    };
getRow(53105)->
    #skill_effectCfg {
    iD = 53105,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 61105,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "器灵材料活动器灵技能-电器灵闪电风暴"
    };
getRow(53107)->
    #skill_effectCfg {
    iD = 53107,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 61107,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "器灵材料活动器灵技能-风器灵风刃"
    };
getRow(53109)->
    #skill_effectCfg {
    iD = 53109,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 61109,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "器灵材料活动器灵技能-光器灵光愈"
    };
getRow(53111)->
    #skill_effectCfg {
    iD = 53111,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 61111,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "器灵材料活动器灵技能-暗器灵暗灭"
    };
getRow(53200)->
    #skill_effectCfg {
    iD = 53200,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 61201,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "器灵材料活动战士觉醒"
    };
getRow(53201)->
    #skill_effectCfg {
    iD = 53201,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 61202,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "器灵材料活动战士觉醒被动1技能"
    };
getRow(53202)->
    #skill_effectCfg {
    iD = 53202,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 61203,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "器灵材料活动战士觉醒被动2技能"
    };
getRow(53203)->
    #skill_effectCfg {
    iD = 53203,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 61204,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "器灵材料活动战士觉醒被动3技能"
    };
getRow(53204)->
    #skill_effectCfg {
    iD = 53204,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 61205,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "器灵材料活动战士觉醒被动4技能"
    };
getRow(53205)->
    #skill_effectCfg {
    iD = 53205,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 61206,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "器灵材料活动法师觉醒"
    };
getRow(53206)->
    #skill_effectCfg {
    iD = 53206,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 61207,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "器灵材料活动法师觉醒被动1技能"
    };
getRow(53207)->
    #skill_effectCfg {
    iD = 53207,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 61208,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "器灵材料活动法师觉醒被动2技能"
    };
getRow(53208)->
    #skill_effectCfg {
    iD = 53208,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 61209,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "器灵材料活动法师觉醒被动3技能"
    };
getRow(53209)->
    #skill_effectCfg {
    iD = 53209,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 61210,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "器灵材料活动法师觉醒被动全技能"
    };
getRow(53210)->
    #skill_effectCfg {
    iD = 53210,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 61211,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "器灵材料活动刺客觉醒"
    };
getRow(53211)->
    #skill_effectCfg {
    iD = 53211,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 61212,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "器灵材料活动刺客觉醒被动1技能"
    };
getRow(53212)->
    #skill_effectCfg {
    iD = 53212,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 61213,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "器灵材料活动刺客觉醒被动2技能"
    };
getRow(53213)->
    #skill_effectCfg {
    iD = 53213,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 61214,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "器灵材料活动刺客觉醒被动3技能"
    };
getRow(53214)->
    #skill_effectCfg {
    iD = 53214,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 61215,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "器灵材料活动刺客觉醒被动4技能"
    };
getRow(53301)->
    #skill_effectCfg {
    iD = 53301,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 0,
    param1 = 61301,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "守护之石霸体"
    };
getRow(53302)->
    #skill_effectCfg {
    iD = 53302,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 3,
    param1 = 2143,
    param2 = 0,
    param3 = 0,
    param4 = 2000,
    param5 = 0,
    param6 = 1,
    skillName = "龙法师技能载体"
    };
getRow(60006)->
    #skill_effectCfg {
    iD = 60006,
    effectType = 1,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 60006,
    param2 = 0,
    param3 = 0,
    param4 = 0,
    param5 = 0,
    param6 = 0,
    skillName = "控制女神小精灵隐藏"
    };
getRow(60010)->
    #skill_effectCfg {
    iD = 60010,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 10,
    param2 = 0,
    param3 = 1,
    param4 = 5000,
    param5 = 0,
    param6 = 1,
    skillName = "觉醒技能释放伤害载体-战士"
    };
getRow(60011)->
    #skill_effectCfg {
    iD = 60011,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 11,
    param2 = 0,
    param3 = 1,
    param4 = 2000,
    param5 = 0,
    param6 = 1,
    skillName = "觉醒技能释放伤害载体-战士"
    };
getRow(60012)->
    #skill_effectCfg {
    iD = 60012,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 12,
    param2 = 0,
    param3 = 1,
    param4 = 3000,
    param5 = 0,
    param6 = 1,
    skillName = "觉醒技能释放伤害载体-战士"
    };
getRow(60013)->
    #skill_effectCfg {
    iD = 60013,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 12,
    param2 = 0,
    param3 = 1,
    param4 = 3000,
    param5 = 0,
    param6 = 1,
    skillName = "觉醒技能释放伤害载体-战士"
    };
getRow(60014)->
    #skill_effectCfg {
    iD = 60014,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 13,
    param2 = 0,
    param3 = 1,
    param4 = 4000,
    param5 = 0,
    param6 = 1,
    skillName = "觉醒技能释放伤害载体-战士"
    };
getRow(60015)->
    #skill_effectCfg {
    iD = 60015,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 14,
    param2 = 0,
    param3 = 1,
    param4 = 4000,
    param5 = 0,
    param6 = 1,
    skillName = "觉醒技能释放伤害载体-战士"
    };
getRow(60020)->
    #skill_effectCfg {
    iD = 60020,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 20,
    param2 = 0,
    param3 = 1,
    param4 = 2000,
    param5 = 0,
    param6 = 1,
    skillName = "觉醒技能释放伤害载体-法师"
    };
getRow(60021)->
    #skill_effectCfg {
    iD = 60021,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 21,
    param2 = 0,
    param3 = 1,
    param4 = 2000,
    param5 = 0,
    param6 = 1,
    skillName = "觉醒技能释放伤害载体-法师"
    };
getRow(60022)->
    #skill_effectCfg {
    iD = 60022,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 22,
    param2 = 0,
    param3 = 1,
    param4 = 3000,
    param5 = 0,
    param6 = 1,
    skillName = "觉醒技能释放伤害载体-法师"
    };
getRow(60023)->
    #skill_effectCfg {
    iD = 60023,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 23,
    param2 = 0,
    param3 = 1,
    param4 = 3000,
    param5 = 0,
    param6 = 1,
    skillName = "觉醒技能释放伤害载体-法师"
    };
getRow(60024)->
    #skill_effectCfg {
    iD = 60024,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 24,
    param2 = 0,
    param3 = 1,
    param4 = 4000,
    param5 = 0,
    param6 = 1,
    skillName = "觉醒技能释放伤害载体-法师"
    };
getRow(60025)->
    #skill_effectCfg {
    iD = 60025,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 25,
    param2 = 0,
    param3 = 1,
    param4 = 5000,
    param5 = 0,
    param6 = 1,
    skillName = "觉醒技能释放伤害载体-法师"
    };
getRow(60030)->
    #skill_effectCfg {
    iD = 60030,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 30,
    param2 = 0,
    param3 = 1,
    param4 = 2000,
    param5 = 0,
    param6 = 1,
    skillName = "觉醒技能释放伤害载体-刺客"
    };
getRow(60031)->
    #skill_effectCfg {
    iD = 60031,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 31,
    param2 = 0,
    param3 = 1,
    param4 = 2000,
    param5 = 0,
    param6 = 1,
    skillName = "觉醒技能释放伤害载体-刺客"
    };
getRow(60032)->
    #skill_effectCfg {
    iD = 60032,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 32,
    param2 = 0,
    param3 = 1,
    param4 = 3000,
    param5 = 0,
    param6 = 1,
    skillName = "觉醒技能释放伤害载体-刺客"
    };
getRow(60033)->
    #skill_effectCfg {
    iD = 60033,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 33,
    param2 = 0,
    param3 = 1,
    param4 = 3000,
    param5 = 0,
    param6 = 1,
    skillName = "觉醒技能释放伤害载体-刺客"
    };
getRow(60034)->
    #skill_effectCfg {
    iD = 60034,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 34,
    param2 = 0,
    param3 = 1,
    param4 = 4000,
    param5 = 0,
    param6 = 1,
    skillName = "觉醒技能释放伤害载体-刺客"
    };
getRow(60035)->
    #skill_effectCfg {
    iD = 60035,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 35,
    param2 = 0,
    param3 = 1,
    param4 = 4000,
    param5 = 0,
    param6 = 1,
    skillName = "觉醒技能释放伤害载体-刺客"
    };
getRow(60036)->
    #skill_effectCfg {
    iD = 60036,
    effectType = 14,
    effectChance = 1,
    effectcondition = 0,
    effectTarget = 1,
    param1 = 36,
    param2 = 0,
    param3 = 1,
    param4 = 5000,
    param5 = 0,
    param6 = 1,
    skillName = "觉醒技能释放伤害载体-刺客"
    };
getRow(_)->[].

getKeyList()->[
    {0},
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
    {163},
    {164},
    {165},
    {166},
    {167},
    {168},
    {169},
    {170},
    {171},
    {172},
    {173},
    {174},
    {175},
    {176},
    {177},
    {178},
    {179},
    {180},
    {181},
    {182},
    {183},
    {184},
    {185},
    {186},
    {187},
    {188},
    {189},
    {190},
    {191},
    {192},
    {193},
    {194},
    {195},
    {196},
    {197},
    {198},
    {199},
    {200},
    {201},
    {202},
    {203},
    {204},
    {205},
    {206},
    {207},
    {208},
    {209},
    {210},
    {211},
    {212},
    {213},
    {214},
    {215},
    {216},
    {217},
    {218},
    {219},
    {220},
    {221},
    {222},
    {223},
    {224},
    {225},
    {226},
    {227},
    {228},
    {229},
    {230},
    {231},
    {232},
    {233},
    {234},
    {235},
    {236},
    {237},
    {238},
    {239},
    {240},
    {241},
    {242},
    {243},
    {244},
    {245},
    {246},
    {247},
    {248},
    {249},
    {250},
    {251},
    {252},
    {253},
    {254},
    {255},
    {256},
    {257},
    {258},
    {259},
    {260},
    {261},
    {262},
    {263},
    {264},
    {265},
    {266},
    {267},
    {268},
    {269},
    {270},
    {271},
    {272},
    {273},
    {274},
    {275},
    {276},
    {277},
    {278},
    {279},
    {280},
    {281},
    {282},
    {283},
    {284},
    {285},
    {286},
    {287},
    {288},
    {289},
    {290},
    {291},
    {292},
    {293},
    {294},
    {295},
    {296},
    {297},
    {300},
    {301},
    {302},
    {303},
    {304},
    {305},
    {306},
    {307},
    {308},
    {309},
    {310},
    {311},
    {312},
    {313},
    {314},
    {315},
    {316},
    {317},
    {318},
    {319},
    {320},
    {321},
    {322},
    {323},
    {324},
    {325},
    {326},
    {327},
    {328},
    {329},
    {330},
    {331},
    {332},
    {333},
    {334},
    {335},
    {336},
    {337},
    {338},
    {339},
    {340},
    {341},
    {342},
    {343},
    {344},
    {345},
    {346},
    {347},
    {348},
    {349},
    {350},
    {351},
    {352},
    {353},
    {354},
    {355},
    {356},
    {357},
    {358},
    {359},
    {360},
    {400},
    {3200},
    {3201},
    {3202},
    {3203},
    {3204},
    {3300},
    {3301},
    {3302},
    {3505},
    {3506},
    {3507},
    {3508},
    {3509},
    {3510},
    {3511},
    {3512},
    {3513},
    {3514},
    {3515},
    {3516},
    {3517},
    {3518},
    {3519},
    {3520},
    {3521},
    {3522},
    {3523},
    {3524},
    {3525},
    {3526},
    {3527},
    {3528},
    {3529},
    {3530},
    {3531},
    {3532},
    {3533},
    {3534},
    {7011},
    {7012},
    {7013},
    {7014},
    {7015},
    {7021},
    {7022},
    {7023},
    {7024},
    {7025},
    {7031},
    {7032},
    {7033},
    {7034},
    {7035},
    {7041},
    {7042},
    {7043},
    {7044},
    {7045},
    {7111},
    {7112},
    {7113},
    {7114},
    {7115},
    {7121},
    {7122},
    {7123},
    {7124},
    {7125},
    {7131},
    {7132},
    {7133},
    {7134},
    {7135},
    {7141},
    {7142},
    {7143},
    {7144},
    {7145},
    {7211},
    {7212},
    {7213},
    {7214},
    {7311},
    {7312},
    {7313},
    {7314},
    {7315},
    {7321},
    {7322},
    {7323},
    {7324},
    {7325},
    {7331},
    {7332},
    {7333},
    {7334},
    {7335},
    {7341},
    {7342},
    {7343},
    {7344},
    {7345},
    {7411},
    {7421},
    {7431},
    {7441},
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
    {10016},
    {10017},
    {10018},
    {10019},
    {10020},
    {10021},
    {10022},
    {10023},
    {10024},
    {10025},
    {10026},
    {10027},
    {10028},
    {10029},
    {10030},
    {10031},
    {10032},
    {10033},
    {12101},
    {12201},
    {13007},
    {13302},
    {13303},
    {13304},
    {13500},
    {13501},
    {13502},
    {13503},
    {13504},
    {14008},
    {15000},
    {15001},
    {15010},
    {15020},
    {19000},
    {19001},
    {19002},
    {19003},
    {19004},
    {19005},
    {19006},
    {19007},
    {19008},
    {19009},
    {19010},
    {19011},
    {19012},
    {19013},
    {19014},
    {19015},
    {19016},
    {19017},
    {19018},
    {19019},
    {19020},
    {19021},
    {19022},
    {19023},
    {19024},
    {19025},
    {19026},
    {19027},
    {19028},
    {19029},
    {19030},
    {19031},
    {19032},
    {19033},
    {19034},
    {19035},
    {20000},
    {20001},
    {20002},
    {20003},
    {20004},
    {20005},
    {20006},
    {30001},
    {30002},
    {30003},
    {30004},
    {30005},
    {30006},
    {30007},
    {30008},
    {30009},
    {30010},
    {30011},
    {30012},
    {31001},
    {31002},
    {31003},
    {31004},
    {31005},
    {31006},
    {31007},
    {31008},
    {32111},
    {32112},
    {32113},
    {32114},
    {32115},
    {32211},
    {32212},
    {32213},
    {32214},
    {32215},
    {32311},
    {32312},
    {32313},
    {32314},
    {32315},
    {32411},
    {32412},
    {32413},
    {32414},
    {32415},
    {32511},
    {32512},
    {32513},
    {32514},
    {32515},
    {32611},
    {32612},
    {32613},
    {32614},
    {32615},
    {32711},
    {32712},
    {32713},
    {32714},
    {32715},
    {32811},
    {32812},
    {32813},
    {32814},
    {32815},
    {32911},
    {32912},
    {32913},
    {32914},
    {32915},
    {33011},
    {33012},
    {33013},
    {33014},
    {33015},
    {33111},
    {33112},
    {33113},
    {33114},
    {33115},
    {33211},
    {33212},
    {33213},
    {33214},
    {33215},
    {40001},
    {40002},
    {40003},
    {40004},
    {40006},
    {40007},
    {40008},
    {40009},
    {40010},
    {40011},
    {40012},
    {40013},
    {40014},
    {40015},
    {40016},
    {40017},
    {40018},
    {40019},
    {40020},
    {40021},
    {40022},
    {40023},
    {40024},
    {40025},
    {40026},
    {40027},
    {40028},
    {40031},
    {40032},
    {40033},
    {40034},
    {40035},
    {40036},
    {40043},
    {40044},
    {40045},
    {40046},
    {40048},
    {40049},
    {40050},
    {40051},
    {40052},
    {40053},
    {40054},
    {40055},
    {40056},
    {40057},
    {40058},
    {40059},
    {40060},
    {40061},
    {40062},
    {40063},
    {40064},
    {40065},
    {40066},
    {40067},
    {40068},
    {40069},
    {40070},
    {40071},
    {40072},
    {40100},
    {40101},
    {40102},
    {40103},
    {40104},
    {40105},
    {40106},
    {40107},
    {40108},
    {40109},
    {40110},
    {40111},
    {40112},
    {40113},
    {40114},
    {40115},
    {40116},
    {40117},
    {40118},
    {40120},
    {40121},
    {40122},
    {40123},
    {40124},
    {40125},
    {40126},
    {40127},
    {40128},
    {40129},
    {40130},
    {40131},
    {40132},
    {51000},
    {52000},
    {52001},
    {52002},
    {52003},
    {52004},
    {52005},
    {52006},
    {52007},
    {53000},
    {53001},
    {53002},
    {53003},
    {53004},
    {53005},
    {53101},
    {53103},
    {53105},
    {53107},
    {53109},
    {53111},
    {53200},
    {53201},
    {53202},
    {53203},
    {53204},
    {53205},
    {53206},
    {53207},
    {53208},
    {53209},
    {53210},
    {53211},
    {53212},
    {53213},
    {53214},
    {53301},
    {53302},
    {60006},
    {60010},
    {60011},
    {60012},
    {60013},
    {60014},
    {60015},
    {60020},
    {60021},
    {60022},
    {60023},
    {60024},
    {60025},
    {60030},
    {60031},
    {60032},
    {60033},
    {60034},
    {60035},
    {60036}
    ].

get1KeyList()->[
    0,
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
    163,
    164,
    165,
    166,
    167,
    168,
    169,
    170,
    171,
    172,
    173,
    174,
    175,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    187,
    188,
    189,
    190,
    191,
    192,
    193,
    194,
    195,
    196,
    197,
    198,
    199,
    200,
    201,
    202,
    203,
    204,
    205,
    206,
    207,
    208,
    209,
    210,
    211,
    212,
    213,
    214,
    215,
    216,
    217,
    218,
    219,
    220,
    221,
    222,
    223,
    224,
    225,
    226,
    227,
    228,
    229,
    230,
    231,
    232,
    233,
    234,
    235,
    236,
    237,
    238,
    239,
    240,
    241,
    242,
    243,
    244,
    245,
    246,
    247,
    248,
    249,
    250,
    251,
    252,
    253,
    254,
    255,
    256,
    257,
    258,
    259,
    260,
    261,
    262,
    263,
    264,
    265,
    266,
    267,
    268,
    269,
    270,
    271,
    272,
    273,
    274,
    275,
    276,
    277,
    278,
    279,
    280,
    281,
    282,
    283,
    284,
    285,
    286,
    287,
    288,
    289,
    290,
    291,
    292,
    293,
    294,
    295,
    296,
    297,
    300,
    301,
    302,
    303,
    304,
    305,
    306,
    307,
    308,
    309,
    310,
    311,
    312,
    313,
    314,
    315,
    316,
    317,
    318,
    319,
    320,
    321,
    322,
    323,
    324,
    325,
    326,
    327,
    328,
    329,
    330,
    331,
    332,
    333,
    334,
    335,
    336,
    337,
    338,
    339,
    340,
    341,
    342,
    343,
    344,
    345,
    346,
    347,
    348,
    349,
    350,
    351,
    352,
    353,
    354,
    355,
    356,
    357,
    358,
    359,
    360,
    400,
    3200,
    3201,
    3202,
    3203,
    3204,
    3300,
    3301,
    3302,
    3505,
    3506,
    3507,
    3508,
    3509,
    3510,
    3511,
    3512,
    3513,
    3514,
    3515,
    3516,
    3517,
    3518,
    3519,
    3520,
    3521,
    3522,
    3523,
    3524,
    3525,
    3526,
    3527,
    3528,
    3529,
    3530,
    3531,
    3532,
    3533,
    3534,
    7011,
    7012,
    7013,
    7014,
    7015,
    7021,
    7022,
    7023,
    7024,
    7025,
    7031,
    7032,
    7033,
    7034,
    7035,
    7041,
    7042,
    7043,
    7044,
    7045,
    7111,
    7112,
    7113,
    7114,
    7115,
    7121,
    7122,
    7123,
    7124,
    7125,
    7131,
    7132,
    7133,
    7134,
    7135,
    7141,
    7142,
    7143,
    7144,
    7145,
    7211,
    7212,
    7213,
    7214,
    7311,
    7312,
    7313,
    7314,
    7315,
    7321,
    7322,
    7323,
    7324,
    7325,
    7331,
    7332,
    7333,
    7334,
    7335,
    7341,
    7342,
    7343,
    7344,
    7345,
    7411,
    7421,
    7431,
    7441,
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
    10016,
    10017,
    10018,
    10019,
    10020,
    10021,
    10022,
    10023,
    10024,
    10025,
    10026,
    10027,
    10028,
    10029,
    10030,
    10031,
    10032,
    10033,
    12101,
    12201,
    13007,
    13302,
    13303,
    13304,
    13500,
    13501,
    13502,
    13503,
    13504,
    14008,
    15000,
    15001,
    15010,
    15020,
    19000,
    19001,
    19002,
    19003,
    19004,
    19005,
    19006,
    19007,
    19008,
    19009,
    19010,
    19011,
    19012,
    19013,
    19014,
    19015,
    19016,
    19017,
    19018,
    19019,
    19020,
    19021,
    19022,
    19023,
    19024,
    19025,
    19026,
    19027,
    19028,
    19029,
    19030,
    19031,
    19032,
    19033,
    19034,
    19035,
    20000,
    20001,
    20002,
    20003,
    20004,
    20005,
    20006,
    30001,
    30002,
    30003,
    30004,
    30005,
    30006,
    30007,
    30008,
    30009,
    30010,
    30011,
    30012,
    31001,
    31002,
    31003,
    31004,
    31005,
    31006,
    31007,
    31008,
    32111,
    32112,
    32113,
    32114,
    32115,
    32211,
    32212,
    32213,
    32214,
    32215,
    32311,
    32312,
    32313,
    32314,
    32315,
    32411,
    32412,
    32413,
    32414,
    32415,
    32511,
    32512,
    32513,
    32514,
    32515,
    32611,
    32612,
    32613,
    32614,
    32615,
    32711,
    32712,
    32713,
    32714,
    32715,
    32811,
    32812,
    32813,
    32814,
    32815,
    32911,
    32912,
    32913,
    32914,
    32915,
    33011,
    33012,
    33013,
    33014,
    33015,
    33111,
    33112,
    33113,
    33114,
    33115,
    33211,
    33212,
    33213,
    33214,
    33215,
    40001,
    40002,
    40003,
    40004,
    40006,
    40007,
    40008,
    40009,
    40010,
    40011,
    40012,
    40013,
    40014,
    40015,
    40016,
    40017,
    40018,
    40019,
    40020,
    40021,
    40022,
    40023,
    40024,
    40025,
    40026,
    40027,
    40028,
    40031,
    40032,
    40033,
    40034,
    40035,
    40036,
    40043,
    40044,
    40045,
    40046,
    40048,
    40049,
    40050,
    40051,
    40052,
    40053,
    40054,
    40055,
    40056,
    40057,
    40058,
    40059,
    40060,
    40061,
    40062,
    40063,
    40064,
    40065,
    40066,
    40067,
    40068,
    40069,
    40070,
    40071,
    40072,
    40100,
    40101,
    40102,
    40103,
    40104,
    40105,
    40106,
    40107,
    40108,
    40109,
    40110,
    40111,
    40112,
    40113,
    40114,
    40115,
    40116,
    40117,
    40118,
    40120,
    40121,
    40122,
    40123,
    40124,
    40125,
    40126,
    40127,
    40128,
    40129,
    40130,
    40131,
    40132,
    51000,
    52000,
    52001,
    52002,
    52003,
    52004,
    52005,
    52006,
    52007,
    53000,
    53001,
    53002,
    53003,
    53004,
    53005,
    53101,
    53103,
    53105,
    53107,
    53109,
    53111,
    53200,
    53201,
    53202,
    53203,
    53204,
    53205,
    53206,
    53207,
    53208,
    53209,
    53210,
    53211,
    53212,
    53213,
    53214,
    53301,
    53302,
    60006,
    60010,
    60011,
    60012,
    60013,
    60014,
    60015,
    60020,
    60021,
    60022,
    60023,
    60024,
    60025,
    60030,
    60031,
    60032,
    60033,
    60034,
    60035,
    60036
    ].

