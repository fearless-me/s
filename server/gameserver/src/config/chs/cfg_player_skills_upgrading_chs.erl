%% coding: latin-1
%%: 实现
-module(cfg_player_skills_upgrading_chs).
-compile(export_all).
-include("cfg_player_skills_upgrading.hrl").
-include("logger.hrl").

getRow(101000,1)->
    #player_skills_upgradingCfg {
    skillID = 101000,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [{0,0}],
    describe = "普通攻击(40%攻击+0)点",
    id = 1
    };
getRow(101001,1)->
    #player_skills_upgradingCfg {
    skillID = 101001,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(42%攻击+0)点",
    id = 2
    };
getRow(101002,1)->
    #player_skills_upgradingCfg {
    skillID = 101002,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(60%攻击+0)点",
    id = 3
    };
getRow(101003,1)->
    #player_skills_upgradingCfg {
    skillID = 101003,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "以身化剑，攻击前方敌人，造成总计(216%攻击+48)点伤害",
    id = 4
    };
getRow(101003,2)->
    #player_skills_upgradingCfg {
    skillID = 101003,
    level = 2,
    player_level = 3,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，攻击前方敌人，造成总计(228.9%攻击+96)点伤害",
    id = 5
    };
getRow(101003,3)->
    #player_skills_upgradingCfg {
    skillID = 101003,
    level = 3,
    player_level = 4,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，攻击前方敌人，造成总计(241.8%攻击+144)点伤害",
    id = 6
    };
getRow(101003,4)->
    #player_skills_upgradingCfg {
    skillID = 101003,
    level = 4,
    player_level = 9,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，攻击前方敌人，造成总计(254.7%攻击+192)点伤害",
    id = 7
    };
getRow(101003,5)->
    #player_skills_upgradingCfg {
    skillID = 101003,
    level = 5,
    player_level = 13,
    currency = [{1,1600}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，攻击前方敌人，造成总计(267.6%攻击+240)点伤害",
    id = 8
    };
getRow(101003,6)->
    #player_skills_upgradingCfg {
    skillID = 101003,
    level = 6,
    player_level = 17,
    currency = [{1,2200}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，攻击前方敌人，造成总计(280.5%攻击+288)点伤害",
    id = 9
    };
getRow(101004,1)->
    #player_skills_upgradingCfg {
    skillID = 101004,
    level = 1,
    player_level = 4,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，对敌人造成总计(128%攻击+28)点伤害",
    id = 10
    };
getRow(101004,2)->
    #player_skills_upgradingCfg {
    skillID = 101004,
    level = 2,
    player_level = 7,
    currency = [{1,1000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，对敌人造成总计(135.6%攻击+56)点伤害",
    id = 11
    };
getRow(101004,3)->
    #player_skills_upgradingCfg {
    skillID = 101004,
    level = 3,
    player_level = 10,
    currency = [{1,1600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，对敌人造成总计(143.2%攻击+84)点伤害",
    id = 12
    };
getRow(101004,4)->
    #player_skills_upgradingCfg {
    skillID = 101004,
    level = 4,
    player_level = 13,
    currency = [{1,1600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，对敌人造成总计(150.8%攻击+112)点伤害",
    id = 13
    };
getRow(101004,5)->
    #player_skills_upgradingCfg {
    skillID = 101004,
    level = 5,
    player_level = 15,
    currency = [{1,1700}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，对敌人造成总计(158.4%攻击+140)点伤害",
    id = 14
    };
getRow(101004,6)->
    #player_skills_upgradingCfg {
    skillID = 101004,
    level = 6,
    player_level = 18,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，对敌人造成总计(166%攻击+168)点伤害",
    id = 15
    };
getRow(101005,1)->
    #player_skills_upgradingCfg {
    skillID = 101005,
    level = 1,
    player_level = 8,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行下沉回旋，卷起范围内的目标，使其总计受到(200.1%攻击+42)点伤害",
    id = 16
    };
getRow(101005,2)->
    #player_skills_upgradingCfg {
    skillID = 101005,
    level = 2,
    player_level = 10,
    currency = [{1,1600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行下沉回旋，卷起范围内的目标，使其总计受到(212.1%攻击+84)点伤害",
    id = 17
    };
getRow(101005,3)->
    #player_skills_upgradingCfg {
    skillID = 101005,
    level = 3,
    player_level = 12,
    currency = [{1,1600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行下沉回旋，卷起范围内的目标，使其总计受到(224.1%攻击+126)点伤害",
    id = 18
    };
getRow(101005,4)->
    #player_skills_upgradingCfg {
    skillID = 101005,
    level = 4,
    player_level = 14,
    currency = [{1,1600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行下沉回旋，卷起范围内的目标，使其总计受到(236.1%攻击+168)点伤害",
    id = 19
    };
getRow(101005,5)->
    #player_skills_upgradingCfg {
    skillID = 101005,
    level = 5,
    player_level = 17,
    currency = [{1,2200}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行下沉回旋，卷起范围内的目标，使其总计受到(248.1%攻击+210)点伤害",
    id = 20
    };
getRow(101005,6)->
    #player_skills_upgradingCfg {
    skillID = 101005,
    level = 6,
    player_level = 19,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行下沉回旋，卷起范围内的目标，使其总计受到(260.1%攻击+252)点伤害",
    id = 21
    };
getRow(101006,1)->
    #player_skills_upgradingCfg {
    skillID = 101006,
    level = 1,
    player_level = 12,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "周围15米内全体队友提升16%物理攻击力，持续10秒",
    id = 22
    };
getRow(101006,2)->
    #player_skills_upgradingCfg {
    skillID = 101006,
    level = 2,
    player_level = 13,
    currency = [{1,1600}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围15米内全体队友提升16.5%物理攻击力，持续10秒",
    id = 23
    };
getRow(101006,3)->
    #player_skills_upgradingCfg {
    skillID = 101006,
    level = 3,
    player_level = 14,
    currency = [{1,1600}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围15米内全体队友提升17%物理攻击力，持续10秒",
    id = 24
    };
getRow(101006,4)->
    #player_skills_upgradingCfg {
    skillID = 101006,
    level = 4,
    player_level = 15,
    currency = [{1,1700}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围15米内全体队友提升17.5%物理攻击力，持续10秒",
    id = 25
    };
getRow(101006,5)->
    #player_skills_upgradingCfg {
    skillID = 101006,
    level = 5,
    player_level = 17,
    currency = [{1,2200}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围15米内全体队友提升18%物理攻击力，持续10秒",
    id = 26
    };
getRow(101006,6)->
    #player_skills_upgradingCfg {
    skillID = 101006,
    level = 6,
    player_level = 19,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围15米内全体队友提升18.5%物理攻击力，持续10秒",
    id = 27
    };
getRow(111000,1)->
    #player_skills_upgradingCfg {
    skillID = 111000,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "#N/A",
    id = 28
    };
getRow(111001,1)->
    #player_skills_upgradingCfg {
    skillID = 111001,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(52.5%攻击+0)点",
    id = 29
    };
getRow(111002,1)->
    #player_skills_upgradingCfg {
    skillID = 111002,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(75%攻击+0)点",
    id = 30
    };
getRow(111003,1)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "使用剑，快速的斩击，对敌人造成总计(140%攻击+224)点的伤害",
    id = 31
    };
getRow(111003,2)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，对敌人造成总计(148.4%攻击+248)点的伤害",
    id = 32
    };
getRow(111003,3)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，对敌人造成总计(156.8%攻击+272)点的伤害",
    id = 33
    };
getRow(111003,4)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，对敌人造成总计(165.2%攻击+296)点的伤害",
    id = 34
    };
getRow(111003,5)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，对敌人造成总计(173.6%攻击+320)点的伤害",
    id = 35
    };
getRow(111003,6)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，对敌人造成总计(182%攻击+344)点的伤害",
    id = 36
    };
getRow(111003,7)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，对敌人造成总计(190.4%攻击+368)点的伤害",
    id = 37
    };
getRow(111003,8)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，对敌人造成总计(198.8%攻击+392)点的伤害",
    id = 38
    };
getRow(111003,9)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，对敌人造成总计(207.2%攻击+416)点的伤害",
    id = 39
    };
getRow(111003,10)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，对敌人造成总计(215.6%攻击+440)点的伤害",
    id = 40
    };
getRow(111003,11)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，对敌人造成总计(224%攻击+464)点的伤害",
    id = 41
    };
getRow(111003,12)->
    #player_skills_upgradingCfg {
    skillID = 111003,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，快速的斩击，对敌人造成总计(232.4%攻击+488)点的伤害",
    id = 42
    };
getRow(111004,1)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，用强力突刺攻击敌人，造成总计(126%攻击+162)点伤害，有一定几率使其总计受到光芒灼烧伤害，持续3秒",
    id = 43
    };
getRow(111004,2)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，用强力突刺攻击敌人，造成总计(133.5%攻击+184)点伤害，有一定几率使其总计受到光芒灼烧伤害，持续3秒",
    id = 44
    };
getRow(111004,3)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，用强力突刺攻击敌人，造成总计(141%攻击+206)点伤害，有一定几率使其总计受到光芒灼烧伤害，持续3秒",
    id = 45
    };
getRow(111004,4)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，用强力突刺攻击敌人，造成总计(148.5%攻击+228)点伤害，有一定几率使其总计受到光芒灼烧伤害，持续3秒",
    id = 46
    };
getRow(111004,5)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，用强力突刺攻击敌人，造成总计(156%攻击+250)点伤害，有一定几率使其总计受到光芒灼烧伤害，持续3秒",
    id = 47
    };
getRow(111004,6)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，用强力突刺攻击敌人，造成总计(163.5%攻击+272)点伤害，有一定几率使其总计受到光芒灼烧伤害，持续3秒",
    id = 48
    };
getRow(111004,7)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，用强力突刺攻击敌人，造成总计(170.9%攻击+294)点伤害，有一定几率使其总计受到光芒灼烧伤害，持续3秒",
    id = 49
    };
getRow(111004,8)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，用强力突刺攻击敌人，造成总计(178.4%攻击+316)点伤害，有一定几率使其总计受到光芒灼烧伤害，持续3秒",
    id = 50
    };
getRow(111004,9)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，用强力突刺攻击敌人，造成总计(185.9%攻击+338)点伤害，有一定几率使其总计受到光芒灼烧伤害，持续3秒",
    id = 51
    };
getRow(111004,10)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，用强力突刺攻击敌人，造成总计(193.4%攻击+360)点伤害，有一定几率使其总计受到光芒灼烧伤害，持续3秒",
    id = 52
    };
getRow(111004,11)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，用强力突刺攻击敌人，造成总计(200.9%攻击+382)点伤害，有一定几率使其总计受到光芒灼烧伤害，持续3秒",
    id = 53
    };
getRow(111004,12)->
    #player_skills_upgradingCfg {
    skillID = 111004,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，用强力突刺攻击敌人，造成总计(208.4%攻击+404)点伤害，有一定几率使其总计受到光芒灼烧伤害，持续3秒",
    id = 54
    };
getRow(111005,1)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成总计(150%攻击+226)点伤害，并降低敌人72点物理和魔法攻击,持续5秒。",
    id = 55
    };
getRow(111005,2)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成总计(158.9%攻击+252)点伤害，并降低敌人112点物理和魔法攻击,持续5秒。",
    id = 56
    };
getRow(111005,3)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成总计(167.8%攻击+278)点伤害，并降低敌人223点物理和魔法攻击,持续5秒。",
    id = 57
    };
getRow(111005,4)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成总计(176.7%攻击+304)点伤害，并降低敌人353点物理和魔法攻击,持续5秒。",
    id = 58
    };
getRow(111005,5)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成总计(185.6%攻击+330)点伤害，并降低敌人450点物理和魔法攻击,持续5秒。",
    id = 59
    };
getRow(111005,6)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成总计(194.5%攻击+356)点伤害，并降低敌人621点物理和魔法攻击,持续5秒。",
    id = 60
    };
getRow(111005,7)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成总计(203.4%攻击+382)点伤害，并降低敌人819点物理和魔法攻击,持续5秒。",
    id = 61
    };
getRow(111005,8)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成总计(212.3%攻击+408)点伤害，并降低敌人1046点物理和魔法攻击,持续5秒。",
    id = 62
    };
getRow(111005,9)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成总计(221.2%攻击+434)点伤害，并降低敌人1302点物理和魔法攻击,持续5秒。",
    id = 63
    };
getRow(111005,10)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成总计(230.1%攻击+460)点伤害，并降低敌人1728点物理和魔法攻击,持续5秒。",
    id = 64
    };
getRow(111005,11)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成总计(239%攻击+486)点伤害，并降低敌人2199点物理和魔法攻击,持续5秒。",
    id = 65
    };
getRow(111005,12)->
    #player_skills_upgradingCfg {
    skillID = 111005,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "用盾牌往敌人的头部猛力一击，造成总计(247.9%攻击+512)点伤害，并降低敌人2710点物理和魔法攻击,持续5秒。",
    id = 66
    };
getRow(111006,1)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 1,
    player_level = 30,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人总计(200%攻击+235)点伤害，并有一定几率击晕目标2秒",
    id = 67
    };
getRow(111006,2)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 2,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人总计(211.9%攻击+270)点伤害，并有一定几率击晕目标2秒",
    id = 68
    };
getRow(111006,3)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 3,
    player_level = 31,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人总计(223.8%攻击+305)点伤害，并有一定几率击晕目标2秒",
    id = 69
    };
getRow(111006,4)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 4,
    player_level = 32,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人总计(235.7%攻击+340)点伤害，并有一定几率击晕目标2秒",
    id = 70
    };
getRow(111006,5)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 5,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人总计(247.6%攻击+375)点伤害，并有一定几率击晕目标2秒",
    id = 71
    };
getRow(111006,6)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 6,
    player_level = 34,
    currency = [{1,8300}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人总计(259.5%攻击+410)点伤害，并有一定几率击晕目标2秒",
    id = 72
    };
getRow(111006,7)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 7,
    player_level = 35,
    currency = [{1,9800}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人总计(271.4%攻击+445)点伤害，并有一定几率击晕目标2秒",
    id = 73
    };
getRow(111006,8)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 8,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人总计(283.3%攻击+480)点伤害，并有一定几率击晕目标2秒",
    id = 74
    };
getRow(111006,9)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 9,
    player_level = 37,
    currency = [{1,13600}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人总计(295.2%攻击+515)点伤害，并有一定几率击晕目标2秒",
    id = 75
    };
getRow(111006,10)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 10,
    player_level = 38,
    currency = [{1,16500}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人总计(307.1%攻击+550)点伤害，并有一定几率击晕目标2秒",
    id = 76
    };
getRow(111006,11)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 11,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人总计(319%攻击+585)点伤害，并有一定几率击晕目标2秒",
    id = 77
    };
getRow(111006,12)->
    #player_skills_upgradingCfg {
    skillID = 111006,
    level = 12,
    player_level = 40,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用剑，跳跃到半空中奋力向下砍击，给予攻击目标前方范围内所有敌人总计(330.9%攻击+620)点伤害，并有一定几率击晕目标2秒",
    id = 78
    };
getRow(111007,1)->
    #player_skills_upgradingCfg {
    skillID = 111007,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "周围30米内队友提升18%物理防御，18%魔法防御，持续10秒",
    id = 79
    };
getRow(111007,2)->
    #player_skills_upgradingCfg {
    skillID = 111007,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围30米内队友提升19%物理防御，19%魔法防御，持续10秒",
    id = 80
    };
getRow(111007,3)->
    #player_skills_upgradingCfg {
    skillID = 111007,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围30米内队友提升20%物理防御，20%魔法防御，持续10秒",
    id = 81
    };
getRow(111007,4)->
    #player_skills_upgradingCfg {
    skillID = 111007,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围30米内队友提升21%物理防御，21%魔法防御，持续10秒",
    id = 82
    };
getRow(111007,5)->
    #player_skills_upgradingCfg {
    skillID = 111007,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围30米内队友提升22%物理防御，22%魔法防御，持续10秒",
    id = 83
    };
getRow(111007,6)->
    #player_skills_upgradingCfg {
    skillID = 111007,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围30米内队友提升23%物理防御，23%魔法防御，持续10秒",
    id = 84
    };
getRow(111007,7)->
    #player_skills_upgradingCfg {
    skillID = 111007,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围30米内队友提升24%物理防御，24%魔法防御，持续10秒",
    id = 85
    };
getRow(111007,8)->
    #player_skills_upgradingCfg {
    skillID = 111007,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围30米内队友提升25%物理防御，25%魔法防御，持续10秒",
    id = 86
    };
getRow(111007,9)->
    #player_skills_upgradingCfg {
    skillID = 111007,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围30米内队友提升26%物理防御，26%魔法防御，持续10秒",
    id = 87
    };
getRow(111007,10)->
    #player_skills_upgradingCfg {
    skillID = 111007,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围30米内队友提升27%物理防御，27%魔法防御，持续10秒",
    id = 88
    };
getRow(111007,11)->
    #player_skills_upgradingCfg {
    skillID = 111007,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围30米内队友提升28%物理防御，28%魔法防御，持续10秒",
    id = 89
    };
getRow(111007,12)->
    #player_skills_upgradingCfg {
    skillID = 111007,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围30米内队友提升29%物理防御，29%魔法防御，持续10秒",
    id = 90
    };
getRow(111008,1)->
    #player_skills_upgradingCfg {
    skillID = 111008,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "抓取目标，使目标攻击自己，并降低目标16%物理防御和16%魔法防御，持续8秒",
    id = 91
    };
getRow(111008,2)->
    #player_skills_upgradingCfg {
    skillID = 111008,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "抓取目标，使目标攻击自己，并降低目标16.75%物理防御和16.75%魔法防御，持续8秒",
    id = 92
    };
getRow(111008,3)->
    #player_skills_upgradingCfg {
    skillID = 111008,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "抓取目标，使目标攻击自己，并降低目标17.5%物理防御和17.5%魔法防御，持续8秒",
    id = 93
    };
getRow(111008,4)->
    #player_skills_upgradingCfg {
    skillID = 111008,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "抓取目标，使目标攻击自己，并降低目标18.25%物理防御和18.25%魔法防御，持续8秒",
    id = 94
    };
getRow(111008,5)->
    #player_skills_upgradingCfg {
    skillID = 111008,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "抓取目标，使目标攻击自己，并降低目标19%物理防御和19%魔法防御，持续8秒",
    id = 95
    };
getRow(111008,6)->
    #player_skills_upgradingCfg {
    skillID = 111008,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "抓取目标，使目标攻击自己，并降低目标19.75%物理防御和19.75%魔法防御，持续8秒",
    id = 96
    };
getRow(111008,7)->
    #player_skills_upgradingCfg {
    skillID = 111008,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "抓取目标，使目标攻击自己，并降低目标20.5%物理防御和20.5%魔法防御，持续8秒",
    id = 97
    };
getRow(111008,8)->
    #player_skills_upgradingCfg {
    skillID = 111008,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "抓取目标，使目标攻击自己，并降低目标21.25%物理防御和21.25%魔法防御，持续8秒",
    id = 98
    };
getRow(111008,9)->
    #player_skills_upgradingCfg {
    skillID = 111008,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "抓取目标，使目标攻击自己，并降低目标22%物理防御和22%魔法防御，持续8秒",
    id = 99
    };
getRow(111008,10)->
    #player_skills_upgradingCfg {
    skillID = 111008,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "抓取目标，使目标攻击自己，并降低目标22.75%物理防御和22.75%魔法防御，持续8秒",
    id = 100
    };
getRow(111008,11)->
    #player_skills_upgradingCfg {
    skillID = 111008,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "抓取目标，使目标攻击自己，并降低目标23.5%物理防御和23.5%魔法防御，持续8秒",
    id = 101
    };
getRow(111008,12)->
    #player_skills_upgradingCfg {
    skillID = 111008,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "抓取目标，使目标攻击自己，并降低目标24.25%物理防御和24.25%魔法防御，持续8秒",
    id = 102
    };
getRow(112000,1)->
    #player_skills_upgradingCfg {
    skillID = 112000,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(50%攻击+0)点",
    id = 103
    };
getRow(112001,1)->
    #player_skills_upgradingCfg {
    skillID = 112001,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(52.5%攻击+0)点",
    id = 104
    };
getRow(112002,1)->
    #player_skills_upgradingCfg {
    skillID = 112002,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "#N/A",
    id = 105
    };
getRow(112003,1)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "以身化剑，攻击前方敌人，造成总计(300%攻击+252)点伤害",
    id = 106
    };
getRow(112003,2)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，攻击前方敌人，造成总计(317.7%攻击+303)点伤害",
    id = 107
    };
getRow(112003,3)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，攻击前方敌人，造成总计(335.4%攻击+354)点伤害",
    id = 108
    };
getRow(112003,4)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，攻击前方敌人，造成总计(353.1%攻击+405)点伤害",
    id = 109
    };
getRow(112003,5)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，攻击前方敌人，造成总计(370.8%攻击+456)点伤害",
    id = 110
    };
getRow(112003,6)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，攻击前方敌人，造成总计(388.5%攻击+507)点伤害",
    id = 111
    };
getRow(112003,7)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，攻击前方敌人，造成总计(406.2%攻击+558)点伤害",
    id = 112
    };
getRow(112003,8)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，攻击前方敌人，造成总计(423.9%攻击+609)点伤害",
    id = 113
    };
getRow(112003,9)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，攻击前方敌人，造成总计(441.6%攻击+660)点伤害",
    id = 114
    };
getRow(112003,10)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，攻击前方敌人，造成总计(459.3%攻击+711)点伤害",
    id = 115
    };
getRow(112003,11)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，攻击前方敌人，造成总计(477%攻击+762)点伤害",
    id = 116
    };
getRow(112003,12)->
    #player_skills_upgradingCfg {
    skillID = 112003,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "以身化剑，攻击前方敌人，造成总计(494.7%攻击+813)点伤害",
    id = 117
    };
getRow(112004,1)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人总计(128%攻击+28)点伤害，并眩晕目标2秒",
    id = 118
    };
getRow(112004,2)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人总计(135.6%攻击+56)点伤害，并眩晕目标2秒",
    id = 119
    };
getRow(112004,3)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人总计(143.2%攻击+84)点伤害，并眩晕目标2秒",
    id = 120
    };
getRow(112004,4)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人总计(150.8%攻击+112)点伤害，并眩晕目标2秒",
    id = 121
    };
getRow(112004,5)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人总计(158.4%攻击+140)点伤害，并眩晕目标2秒",
    id = 122
    };
getRow(112004,6)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人总计(166%攻击+168)点伤害，并眩晕目标2秒",
    id = 123
    };
getRow(112004,7)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人总计(173.6%攻击+196)点伤害，并眩晕目标2秒",
    id = 124
    };
getRow(112004,8)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人总计(181.2%攻击+224)点伤害，并眩晕目标2秒",
    id = 125
    };
getRow(112004,9)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人总计(188.8%攻击+252)点伤害，并眩晕目标2秒",
    id = 126
    };
getRow(112004,10)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人总计(196.4%攻击+280)点伤害，并眩晕目标2秒",
    id = 127
    };
getRow(112004,11)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人总计(204%攻击+308)点伤害，并眩晕目标2秒",
    id = 128
    };
getRow(112004,12)->
    #player_skills_upgradingCfg {
    skillID = 112004,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "用最大力量砍向前方敌人，给予敌人总计(211.6%攻击+336)点伤害，并眩晕目标2秒",
    id = 129
    };
getRow(112005,1)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，卷起范围内的目标，使其受到总计(260.1%攻击+246)点伤害",
    id = 130
    };
getRow(112005,2)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，卷起范围内的目标，使其受到总计(275.4%攻击+291)点伤害",
    id = 131
    };
getRow(112005,3)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，卷起范围内的目标，使其受到总计(290.7%攻击+336)点伤害",
    id = 132
    };
getRow(112005,4)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，卷起范围内的目标，使其受到总计(306%攻击+381)点伤害",
    id = 133
    };
getRow(112005,5)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，卷起范围内的目标，使其受到总计(321.3%攻击+426)点伤害",
    id = 134
    };
getRow(112005,6)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，卷起范围内的目标，使其受到总计(336.6%攻击+471)点伤害",
    id = 135
    };
getRow(112005,7)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，卷起范围内的目标，使其受到总计(351.9%攻击+516)点伤害",
    id = 136
    };
getRow(112005,8)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，卷起范围内的目标，使其受到总计(367.2%攻击+561)点伤害",
    id = 137
    };
getRow(112005,9)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，卷起范围内的目标，使其受到总计(382.5%攻击+606)点伤害",
    id = 138
    };
getRow(112005,10)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，卷起范围内的目标，使其受到总计(397.8%攻击+651)点伤害",
    id = 139
    };
getRow(112005,11)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，卷起范围内的目标，使其受到总计(413.1%攻击+696)点伤害",
    id = 140
    };
getRow(112005,12)->
    #player_skills_upgradingCfg {
    skillID = 112005,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "用身体带动重剑进行回旋天舞，卷起范围内的目标，使其受到总计(428.4%攻击+741)点伤害",
    id = 141
    };
getRow(112006,1)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 1,
    player_level = 30,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "快速接近目标，以局部冲撞目标及周围敌方，对目标造成总计(190%攻击+233)点伤害，降低90点物防，持续6秒",
    id = 142
    };
getRow(112006,2)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 2,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速接近目标，以局部冲撞目标及周围敌方，对目标造成总计(201.3%攻击+266)点伤害，降低141点物防，持续6秒",
    id = 143
    };
getRow(112006,3)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 3,
    player_level = 31,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速接近目标，以局部冲撞目标及周围敌方，对目标造成总计(212.6%攻击+299)点伤害，降低279点物防，持续6秒",
    id = 144
    };
getRow(112006,4)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 4,
    player_level = 32,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速接近目标，以局部冲撞目标及周围敌方，对目标造成总计(223.9%攻击+332)点伤害，降低396点物防，持续6秒",
    id = 145
    };
getRow(112006,5)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 5,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速接近目标，以局部冲撞目标及周围敌方，对目标造成总计(235.2%攻击+365)点伤害，降低517点物防，持续6秒",
    id = 146
    };
getRow(112006,6)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 6,
    player_level = 34,
    currency = [{1,8300}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速接近目标，以局部冲撞目标及周围敌方，对目标造成总计(246.5%攻击+398)点伤害，降低683点物防，持续6秒",
    id = 147
    };
getRow(112006,7)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 7,
    player_level = 35,
    currency = [{1,9800}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速接近目标，以局部冲撞目标及周围敌方，对目标造成总计(257.8%攻击+431)点伤害，降低819点物防，持续6秒",
    id = 148
    };
getRow(112006,8)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 8,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速接近目标，以局部冲撞目标及周围敌方，对目标造成总计(269.1%攻击+464)点伤害，降低1046点物防，持续6秒",
    id = 149
    };
getRow(112006,9)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 9,
    player_level = 37,
    currency = [{1,13600}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速接近目标，以局部冲撞目标及周围敌方，对目标造成总计(280.4%攻击+497)点伤害，降低1302点物防，持续6秒",
    id = 150
    };
getRow(112006,10)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 10,
    player_level = 38,
    currency = [{1,16500}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速接近目标，以局部冲撞目标及周围敌方，对目标造成总计(291.7%攻击+530)点伤害，降低1728点物防，持续6秒",
    id = 151
    };
getRow(112006,11)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 11,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速接近目标，以局部冲撞目标及周围敌方，对目标造成总计(303%攻击+563)点伤害，降低2199点物防，持续6秒",
    id = 152
    };
getRow(112006,12)->
    #player_skills_upgradingCfg {
    skillID = 112006,
    level = 12,
    player_level = 40,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速接近目标，以局部冲撞目标及周围敌方，对目标造成总计(314.3%攻击+596)点伤害，降低2710点物防，持续6秒",
    id = 153
    };
getRow(112007,1)->
    #player_skills_upgradingCfg {
    skillID = 112007,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身12%物理攻击，持续13秒",
    id = 154
    };
getRow(112007,2)->
    #player_skills_upgradingCfg {
    skillID = 112007,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身13%物理攻击，持续13秒",
    id = 155
    };
getRow(112007,3)->
    #player_skills_upgradingCfg {
    skillID = 112007,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身14%物理攻击，持续13秒",
    id = 156
    };
getRow(112007,4)->
    #player_skills_upgradingCfg {
    skillID = 112007,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身15%物理攻击，持续13秒",
    id = 157
    };
getRow(112007,5)->
    #player_skills_upgradingCfg {
    skillID = 112007,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身16%物理攻击，持续13秒",
    id = 158
    };
getRow(112007,6)->
    #player_skills_upgradingCfg {
    skillID = 112007,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身17%物理攻击，持续13秒",
    id = 159
    };
getRow(112007,7)->
    #player_skills_upgradingCfg {
    skillID = 112007,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身18%物理攻击，持续13秒",
    id = 160
    };
getRow(112007,8)->
    #player_skills_upgradingCfg {
    skillID = 112007,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身19%物理攻击，持续13秒",
    id = 161
    };
getRow(112007,9)->
    #player_skills_upgradingCfg {
    skillID = 112007,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身20%物理攻击，持续13秒",
    id = 162
    };
getRow(112007,10)->
    #player_skills_upgradingCfg {
    skillID = 112007,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身21%物理攻击，持续13秒",
    id = 163
    };
getRow(112007,11)->
    #player_skills_upgradingCfg {
    skillID = 112007,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身22%物理攻击，持续13秒",
    id = 164
    };
getRow(112007,12)->
    #player_skills_upgradingCfg {
    skillID = 112007,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身23%物理攻击，持续13秒",
    id = 165
    };
getRow(112008,1)->
    #player_skills_upgradingCfg {
    skillID = 112008,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "周围15米队友10%的物理攻击，持续10秒，可与战士之心叠加",
    id = 166
    };
getRow(112008,2)->
    #player_skills_upgradingCfg {
    skillID = 112008,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围15米队友10.75%的物理攻击，持续10秒，可与战士之心叠加",
    id = 167
    };
getRow(112008,3)->
    #player_skills_upgradingCfg {
    skillID = 112008,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围15米队友11.5%的物理攻击，持续10秒，可与战士之心叠加",
    id = 168
    };
getRow(112008,4)->
    #player_skills_upgradingCfg {
    skillID = 112008,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围15米队友12.25%的物理攻击，持续10秒，可与战士之心叠加",
    id = 169
    };
getRow(112008,5)->
    #player_skills_upgradingCfg {
    skillID = 112008,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围15米队友13%的物理攻击，持续10秒，可与战士之心叠加",
    id = 170
    };
getRow(112008,6)->
    #player_skills_upgradingCfg {
    skillID = 112008,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围15米队友13.75%的物理攻击，持续10秒，可与战士之心叠加",
    id = 171
    };
getRow(112008,7)->
    #player_skills_upgradingCfg {
    skillID = 112008,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围15米队友14.5%的物理攻击，持续10秒，可与战士之心叠加",
    id = 172
    };
getRow(112008,8)->
    #player_skills_upgradingCfg {
    skillID = 112008,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围15米队友15.25%的物理攻击，持续10秒，可与战士之心叠加",
    id = 173
    };
getRow(112008,9)->
    #player_skills_upgradingCfg {
    skillID = 112008,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围15米队友16%的物理攻击，持续10秒，可与战士之心叠加",
    id = 174
    };
getRow(112008,10)->
    #player_skills_upgradingCfg {
    skillID = 112008,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围15米队友16.75%的物理攻击，持续10秒，可与战士之心叠加",
    id = 175
    };
getRow(112008,11)->
    #player_skills_upgradingCfg {
    skillID = 112008,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围15米队友17.5%的物理攻击，持续10秒，可与战士之心叠加",
    id = 176
    };
getRow(112008,12)->
    #player_skills_upgradingCfg {
    skillID = 112008,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "周围15米队友18.25%的物理攻击，持续10秒，可与战士之心叠加",
    id = 177
    };
getRow(121000,1)->
    #player_skills_upgradingCfg {
    skillID = 121000,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [{0,0}],
    describe = "普通攻击(0%攻击+1)点",
    id = 532
    };
getRow(121000,2)->
    #player_skills_upgradingCfg {
    skillID = 121000,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 533
    };
getRow(121000,3)->
    #player_skills_upgradingCfg {
    skillID = 121000,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 534
    };
getRow(121000,4)->
    #player_skills_upgradingCfg {
    skillID = 121000,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 535
    };
getRow(121000,5)->
    #player_skills_upgradingCfg {
    skillID = 121000,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 536
    };
getRow(121000,6)->
    #player_skills_upgradingCfg {
    skillID = 121000,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 537
    };
getRow(121000,7)->
    #player_skills_upgradingCfg {
    skillID = 121000,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 538
    };
getRow(121000,8)->
    #player_skills_upgradingCfg {
    skillID = 121000,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 539
    };
getRow(121000,9)->
    #player_skills_upgradingCfg {
    skillID = 121000,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 540
    };
getRow(121001,1)->
    #player_skills_upgradingCfg {
    skillID = 121001,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 541
    };
getRow(121001,2)->
    #player_skills_upgradingCfg {
    skillID = 121001,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 542
    };
getRow(121001,3)->
    #player_skills_upgradingCfg {
    skillID = 121001,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 543
    };
getRow(121001,4)->
    #player_skills_upgradingCfg {
    skillID = 121001,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 544
    };
getRow(121001,5)->
    #player_skills_upgradingCfg {
    skillID = 121001,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 545
    };
getRow(121001,6)->
    #player_skills_upgradingCfg {
    skillID = 121001,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 546
    };
getRow(121001,7)->
    #player_skills_upgradingCfg {
    skillID = 121001,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 547
    };
getRow(121001,8)->
    #player_skills_upgradingCfg {
    skillID = 121001,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 548
    };
getRow(121001,9)->
    #player_skills_upgradingCfg {
    skillID = 121001,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 549
    };
getRow(121002,1)->
    #player_skills_upgradingCfg {
    skillID = 121002,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 550
    };
getRow(121002,2)->
    #player_skills_upgradingCfg {
    skillID = 121002,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 551
    };
getRow(121002,3)->
    #player_skills_upgradingCfg {
    skillID = 121002,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 552
    };
getRow(121002,4)->
    #player_skills_upgradingCfg {
    skillID = 121002,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 553
    };
getRow(121002,5)->
    #player_skills_upgradingCfg {
    skillID = 121002,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 554
    };
getRow(121002,6)->
    #player_skills_upgradingCfg {
    skillID = 121002,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 555
    };
getRow(121002,7)->
    #player_skills_upgradingCfg {
    skillID = 121002,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 556
    };
getRow(121002,8)->
    #player_skills_upgradingCfg {
    skillID = 121002,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 557
    };
getRow(121002,9)->
    #player_skills_upgradingCfg {
    skillID = 121002,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 558
    };
getRow(121003,1)->
    #player_skills_upgradingCfg {
    skillID = 121003,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 559
    };
getRow(121003,2)->
    #player_skills_upgradingCfg {
    skillID = 121003,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 560
    };
getRow(121003,3)->
    #player_skills_upgradingCfg {
    skillID = 121003,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 561
    };
getRow(121003,4)->
    #player_skills_upgradingCfg {
    skillID = 121003,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 562
    };
getRow(121003,5)->
    #player_skills_upgradingCfg {
    skillID = 121003,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 563
    };
getRow(121003,6)->
    #player_skills_upgradingCfg {
    skillID = 121003,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 564
    };
getRow(121003,7)->
    #player_skills_upgradingCfg {
    skillID = 121003,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 565
    };
getRow(121003,8)->
    #player_skills_upgradingCfg {
    skillID = 121003,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 566
    };
getRow(121003,9)->
    #player_skills_upgradingCfg {
    skillID = 121003,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 567
    };
getRow(121004,1)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 568
    };
getRow(121004,2)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 569
    };
getRow(121004,3)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 570
    };
getRow(121004,4)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 571
    };
getRow(121004,5)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 572
    };
getRow(121004,6)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 573
    };
getRow(121004,7)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 574
    };
getRow(121004,8)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 575
    };
getRow(121004,9)->
    #player_skills_upgradingCfg {
    skillID = 121004,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 576
    };
getRow(121005,1)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 577
    };
getRow(121005,2)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 578
    };
getRow(121005,3)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 579
    };
getRow(121005,4)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 580
    };
getRow(121005,5)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 581
    };
getRow(121005,6)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 582
    };
getRow(121005,7)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 583
    };
getRow(121005,8)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 584
    };
getRow(121005,9)->
    #player_skills_upgradingCfg {
    skillID = 121005,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 585
    };
getRow(121006,1)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 586
    };
getRow(121006,2)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 587
    };
getRow(121006,3)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 588
    };
getRow(121006,4)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 589
    };
getRow(121006,5)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 590
    };
getRow(121006,6)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 591
    };
getRow(121006,7)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 592
    };
getRow(121006,8)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 593
    };
getRow(121006,9)->
    #player_skills_upgradingCfg {
    skillID = 121006,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 594
    };
getRow(122000,1)->
    #player_skills_upgradingCfg {
    skillID = 122000,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 595
    };
getRow(122000,2)->
    #player_skills_upgradingCfg {
    skillID = 122000,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 596
    };
getRow(122000,3)->
    #player_skills_upgradingCfg {
    skillID = 122000,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 597
    };
getRow(122000,4)->
    #player_skills_upgradingCfg {
    skillID = 122000,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 598
    };
getRow(122000,5)->
    #player_skills_upgradingCfg {
    skillID = 122000,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 599
    };
getRow(122000,6)->
    #player_skills_upgradingCfg {
    skillID = 122000,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 600
    };
getRow(122000,7)->
    #player_skills_upgradingCfg {
    skillID = 122000,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 601
    };
getRow(122000,8)->
    #player_skills_upgradingCfg {
    skillID = 122000,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 602
    };
getRow(122000,9)->
    #player_skills_upgradingCfg {
    skillID = 122000,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 603
    };
getRow(122001,1)->
    #player_skills_upgradingCfg {
    skillID = 122001,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 604
    };
getRow(122001,2)->
    #player_skills_upgradingCfg {
    skillID = 122001,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 605
    };
getRow(122001,3)->
    #player_skills_upgradingCfg {
    skillID = 122001,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 606
    };
getRow(122001,4)->
    #player_skills_upgradingCfg {
    skillID = 122001,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 607
    };
getRow(122001,5)->
    #player_skills_upgradingCfg {
    skillID = 122001,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 608
    };
getRow(122001,6)->
    #player_skills_upgradingCfg {
    skillID = 122001,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 609
    };
getRow(122001,7)->
    #player_skills_upgradingCfg {
    skillID = 122001,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 610
    };
getRow(122001,8)->
    #player_skills_upgradingCfg {
    skillID = 122001,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 611
    };
getRow(122001,9)->
    #player_skills_upgradingCfg {
    skillID = 122001,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 612
    };
getRow(122002,1)->
    #player_skills_upgradingCfg {
    skillID = 122002,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 613
    };
getRow(122002,2)->
    #player_skills_upgradingCfg {
    skillID = 122002,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 614
    };
getRow(122002,3)->
    #player_skills_upgradingCfg {
    skillID = 122002,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 615
    };
getRow(122002,4)->
    #player_skills_upgradingCfg {
    skillID = 122002,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 616
    };
getRow(122002,5)->
    #player_skills_upgradingCfg {
    skillID = 122002,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 617
    };
getRow(122002,6)->
    #player_skills_upgradingCfg {
    skillID = 122002,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 618
    };
getRow(122002,7)->
    #player_skills_upgradingCfg {
    skillID = 122002,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 619
    };
getRow(122002,8)->
    #player_skills_upgradingCfg {
    skillID = 122002,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 620
    };
getRow(122002,9)->
    #player_skills_upgradingCfg {
    skillID = 122002,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 621
    };
getRow(122003,1)->
    #player_skills_upgradingCfg {
    skillID = 122003,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 622
    };
getRow(122003,2)->
    #player_skills_upgradingCfg {
    skillID = 122003,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 623
    };
getRow(122003,3)->
    #player_skills_upgradingCfg {
    skillID = 122003,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 624
    };
getRow(122003,4)->
    #player_skills_upgradingCfg {
    skillID = 122003,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 625
    };
getRow(122003,5)->
    #player_skills_upgradingCfg {
    skillID = 122003,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 626
    };
getRow(122003,6)->
    #player_skills_upgradingCfg {
    skillID = 122003,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 627
    };
getRow(122003,7)->
    #player_skills_upgradingCfg {
    skillID = 122003,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 628
    };
getRow(122003,8)->
    #player_skills_upgradingCfg {
    skillID = 122003,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 629
    };
getRow(122003,9)->
    #player_skills_upgradingCfg {
    skillID = 122003,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 630
    };
getRow(122004,1)->
    #player_skills_upgradingCfg {
    skillID = 122004,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 631
    };
getRow(122004,2)->
    #player_skills_upgradingCfg {
    skillID = 122004,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 632
    };
getRow(122004,3)->
    #player_skills_upgradingCfg {
    skillID = 122004,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 633
    };
getRow(122004,4)->
    #player_skills_upgradingCfg {
    skillID = 122004,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 634
    };
getRow(122004,5)->
    #player_skills_upgradingCfg {
    skillID = 122004,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 635
    };
getRow(122004,6)->
    #player_skills_upgradingCfg {
    skillID = 122004,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 636
    };
getRow(122004,7)->
    #player_skills_upgradingCfg {
    skillID = 122004,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 637
    };
getRow(122004,8)->
    #player_skills_upgradingCfg {
    skillID = 122004,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 638
    };
getRow(122004,9)->
    #player_skills_upgradingCfg {
    skillID = 122004,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 639
    };
getRow(122005,1)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 640
    };
getRow(122005,2)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 641
    };
getRow(122005,3)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 642
    };
getRow(122005,4)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 643
    };
getRow(122005,5)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 644
    };
getRow(122005,6)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 645
    };
getRow(122005,7)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 646
    };
getRow(122005,8)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 647
    };
getRow(122005,9)->
    #player_skills_upgradingCfg {
    skillID = 122005,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 648
    };
getRow(122006,1)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 649
    };
getRow(122006,2)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 650
    };
getRow(122006,3)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 651
    };
getRow(122006,4)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 652
    };
getRow(122006,5)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 653
    };
getRow(122006,6)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 654
    };
getRow(122006,7)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 655
    };
getRow(122006,8)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 656
    };
getRow(122006,9)->
    #player_skills_upgradingCfg {
    skillID = 122006,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 657
    };
getRow(123000,1)->
    #player_skills_upgradingCfg {
    skillID = 123000,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 658
    };
getRow(123000,2)->
    #player_skills_upgradingCfg {
    skillID = 123000,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 659
    };
getRow(123000,3)->
    #player_skills_upgradingCfg {
    skillID = 123000,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 660
    };
getRow(123000,4)->
    #player_skills_upgradingCfg {
    skillID = 123000,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 661
    };
getRow(123000,5)->
    #player_skills_upgradingCfg {
    skillID = 123000,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 662
    };
getRow(123000,6)->
    #player_skills_upgradingCfg {
    skillID = 123000,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 663
    };
getRow(123000,7)->
    #player_skills_upgradingCfg {
    skillID = 123000,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 664
    };
getRow(123000,8)->
    #player_skills_upgradingCfg {
    skillID = 123000,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 665
    };
getRow(123000,9)->
    #player_skills_upgradingCfg {
    skillID = 123000,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 666
    };
getRow(123001,1)->
    #player_skills_upgradingCfg {
    skillID = 123001,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 667
    };
getRow(123001,2)->
    #player_skills_upgradingCfg {
    skillID = 123001,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 668
    };
getRow(123001,3)->
    #player_skills_upgradingCfg {
    skillID = 123001,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 669
    };
getRow(123001,4)->
    #player_skills_upgradingCfg {
    skillID = 123001,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 670
    };
getRow(123001,5)->
    #player_skills_upgradingCfg {
    skillID = 123001,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 671
    };
getRow(123001,6)->
    #player_skills_upgradingCfg {
    skillID = 123001,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 672
    };
getRow(123001,7)->
    #player_skills_upgradingCfg {
    skillID = 123001,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 673
    };
getRow(123001,8)->
    #player_skills_upgradingCfg {
    skillID = 123001,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 674
    };
getRow(123001,9)->
    #player_skills_upgradingCfg {
    skillID = 123001,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 675
    };
getRow(123002,1)->
    #player_skills_upgradingCfg {
    skillID = 123002,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 676
    };
getRow(123002,2)->
    #player_skills_upgradingCfg {
    skillID = 123002,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 677
    };
getRow(123002,3)->
    #player_skills_upgradingCfg {
    skillID = 123002,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 678
    };
getRow(123002,4)->
    #player_skills_upgradingCfg {
    skillID = 123002,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 679
    };
getRow(123002,5)->
    #player_skills_upgradingCfg {
    skillID = 123002,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 680
    };
getRow(123002,6)->
    #player_skills_upgradingCfg {
    skillID = 123002,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 681
    };
getRow(123002,7)->
    #player_skills_upgradingCfg {
    skillID = 123002,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 682
    };
getRow(123002,8)->
    #player_skills_upgradingCfg {
    skillID = 123002,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 683
    };
getRow(123002,9)->
    #player_skills_upgradingCfg {
    skillID = 123002,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 684
    };
getRow(123003,1)->
    #player_skills_upgradingCfg {
    skillID = 123003,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 685
    };
getRow(123003,2)->
    #player_skills_upgradingCfg {
    skillID = 123003,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 686
    };
getRow(123003,3)->
    #player_skills_upgradingCfg {
    skillID = 123003,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 687
    };
getRow(123003,4)->
    #player_skills_upgradingCfg {
    skillID = 123003,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 688
    };
getRow(123003,5)->
    #player_skills_upgradingCfg {
    skillID = 123003,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 689
    };
getRow(123003,6)->
    #player_skills_upgradingCfg {
    skillID = 123003,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 690
    };
getRow(123003,7)->
    #player_skills_upgradingCfg {
    skillID = 123003,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 691
    };
getRow(123003,8)->
    #player_skills_upgradingCfg {
    skillID = 123003,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 692
    };
getRow(123003,9)->
    #player_skills_upgradingCfg {
    skillID = 123003,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "连续两次攻击，给予敌人伤害(0%攻击+1)点",
    id = 693
    };
getRow(123004,1)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 694
    };
getRow(123004,2)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 695
    };
getRow(123004,3)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 696
    };
getRow(123004,4)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 697
    };
getRow(123004,5)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 698
    };
getRow(123004,6)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 699
    };
getRow(123004,7)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 700
    };
getRow(123004,8)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 701
    };
getRow(123004,9)->
    #player_skills_upgradingCfg {
    skillID = 123004,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升目标物理攻击力(0%攻击+1)点，持续30s",
    id = 702
    };
getRow(123005,1)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 703
    };
getRow(123005,2)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 704
    };
getRow(123005,3)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 705
    };
getRow(123005,4)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 706
    };
getRow(123005,5)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 707
    };
getRow(123005,6)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 708
    };
getRow(123005,7)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 709
    };
getRow(123005,8)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 710
    };
getRow(123005,9)->
    #player_skills_upgradingCfg {
    skillID = 123005,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大突刺攻击敌人，给予敌人打击伤害(0%攻击+1)点，有机率能够使敌人中毒，中毒的敌人在效果时间内，会持续总计受到毒伤害。",
    id = 711
    };
getRow(123006,1)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 712
    };
getRow(123006,2)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 713
    };
getRow(123006,3)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 714
    };
getRow(123006,4)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 715
    };
getRow(123006,5)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 716
    };
getRow(123006,6)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 717
    };
getRow(123006,7)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 718
    };
getRow(123006,8)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 719
    };
getRow(123006,9)->
    #player_skills_upgradingCfg {
    skillID = 123006,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "持武器，以强大的力量劈砍敌人(0%攻击+1)点",
    id = 720
    };
getRow(201000,1)->
    #player_skills_upgradingCfg {
    skillID = 201000,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(40%攻击+0)点",
    id = 178
    };
getRow(201001,1)->
    #player_skills_upgradingCfg {
    skillID = 201001,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(42%攻击+0)点",
    id = 179
    };
getRow(201002,1)->
    #player_skills_upgradingCfg {
    skillID = 201002,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "#N/A",
    id = 180
    };
getRow(201003,1)->
    #player_skills_upgradingCfg {
    skillID = 201003,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "用凝缩的风之力，让敌人总计遭受(120%攻击+28)点伤害，并将其震退",
    id = 181
    };
getRow(201003,2)->
    #player_skills_upgradingCfg {
    skillID = 201003,
    level = 2,
    player_level = 3,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力，让敌人总计遭受(127.1%攻击+56)点伤害，并将其震退",
    id = 182
    };
getRow(201003,3)->
    #player_skills_upgradingCfg {
    skillID = 201003,
    level = 3,
    player_level = 4,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力，让敌人总计遭受(134.2%攻击+84)点伤害，并将其震退",
    id = 183
    };
getRow(201003,4)->
    #player_skills_upgradingCfg {
    skillID = 201003,
    level = 4,
    player_level = 9,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力，让敌人总计遭受(141.3%攻击+112)点伤害，并将其震退",
    id = 184
    };
getRow(201003,5)->
    #player_skills_upgradingCfg {
    skillID = 201003,
    level = 5,
    player_level = 13,
    currency = [{1,1600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力，让敌人总计遭受(148.4%攻击+140)点伤害，并将其震退",
    id = 185
    };
getRow(201003,6)->
    #player_skills_upgradingCfg {
    skillID = 201003,
    level = 6,
    player_level = 17,
    currency = [{1,2200}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力，让敌人总计遭受(155.5%攻击+168)点伤害，并将其震退",
    id = 186
    };
getRow(201004,1)->
    #player_skills_upgradingCfg {
    skillID = 201004,
    level = 1,
    player_level = 4,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人在总计(128%攻击+42)点伤害",
    id = 187
    };
getRow(201004,2)->
    #player_skills_upgradingCfg {
    skillID = 201004,
    level = 2,
    player_level = 7,
    currency = [{1,1000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人在总计(135.6%攻击+84)点伤害",
    id = 188
    };
getRow(201004,3)->
    #player_skills_upgradingCfg {
    skillID = 201004,
    level = 3,
    player_level = 10,
    currency = [{1,1600}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人在总计(143.2%攻击+126)点伤害",
    id = 189
    };
getRow(201004,4)->
    #player_skills_upgradingCfg {
    skillID = 201004,
    level = 4,
    player_level = 13,
    currency = [{1,1600}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人在总计(150.8%攻击+168)点伤害",
    id = 190
    };
getRow(201004,5)->
    #player_skills_upgradingCfg {
    skillID = 201004,
    level = 5,
    player_level = 15,
    currency = [{1,1700}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人在总计(158.4%攻击+210)点伤害",
    id = 191
    };
getRow(201004,6)->
    #player_skills_upgradingCfg {
    skillID = 201004,
    level = 6,
    player_level = 18,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人在总计(166%攻击+252)点伤害",
    id = 192
    };
getRow(201005,1)->
    #player_skills_upgradingCfg {
    skillID = 201005,
    level = 1,
    player_level = 8,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人总计(200.1%攻击+35)点伤害，有机率降低敌人的移动速度，持续4秒。",
    id = 193
    };
getRow(201005,2)->
    #player_skills_upgradingCfg {
    skillID = 201005,
    level = 2,
    player_level = 10,
    currency = [{1,1600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人总计(212.1%攻击+70)点伤害，有机率降低敌人的移动速度，持续4秒。",
    id = 194
    };
getRow(201005,3)->
    #player_skills_upgradingCfg {
    skillID = 201005,
    level = 3,
    player_level = 12,
    currency = [{1,1600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人总计(224.1%攻击+105)点伤害，有机率降低敌人的移动速度，持续4秒。",
    id = 195
    };
getRow(201005,4)->
    #player_skills_upgradingCfg {
    skillID = 201005,
    level = 4,
    player_level = 14,
    currency = [{1,1600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人总计(236.1%攻击+140)点伤害，有机率降低敌人的移动速度，持续4秒。",
    id = 196
    };
getRow(201005,5)->
    #player_skills_upgradingCfg {
    skillID = 201005,
    level = 5,
    player_level = 17,
    currency = [{1,2200}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人总计(248.1%攻击+175)点伤害，有机率降低敌人的移动速度，持续4秒。",
    id = 197
    };
getRow(201005,6)->
    #player_skills_upgradingCfg {
    skillID = 201005,
    level = 6,
    player_level = 19,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人总计(260.1%攻击+210)点伤害，有机率降低敌人的移动速度，持续4秒。",
    id = 198
    };
getRow(201006,1)->
    #player_skills_upgradingCfg {
    skillID = 201006,
    level = 1,
    player_level = 12,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "为自己恢复(160%攻击+26)点生命值。",
    id = 199
    };
getRow(201006,2)->
    #player_skills_upgradingCfg {
    skillID = 201006,
    level = 2,
    player_level = 13,
    currency = [{1,1600}],
    skillcoin_cost = 1,
    item = [],
    describe = "为自己恢复(169.5%攻击+52)点生命值。",
    id = 200
    };
getRow(201006,3)->
    #player_skills_upgradingCfg {
    skillID = 201006,
    level = 3,
    player_level = 14,
    currency = [{1,1600}],
    skillcoin_cost = 1,
    item = [],
    describe = "为自己恢复(179%攻击+78)点生命值。",
    id = 201
    };
getRow(201006,4)->
    #player_skills_upgradingCfg {
    skillID = 201006,
    level = 4,
    player_level = 15,
    currency = [{1,1700}],
    skillcoin_cost = 1,
    item = [],
    describe = "为自己恢复(188.5%攻击+104)点生命值。",
    id = 202
    };
getRow(201006,5)->
    #player_skills_upgradingCfg {
    skillID = 201006,
    level = 5,
    player_level = 17,
    currency = [{1,2200}],
    skillcoin_cost = 1,
    item = [],
    describe = "为自己恢复(198%攻击+130)点生命值。",
    id = 203
    };
getRow(201006,6)->
    #player_skills_upgradingCfg {
    skillID = 201006,
    level = 6,
    player_level = 19,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "为自己恢复(207.5%攻击+156)点生命值。",
    id = 204
    };
getRow(211000,1)->
    #player_skills_upgradingCfg {
    skillID = 211000,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(50%攻击+0)点",
    id = 205
    };
getRow(211001,1)->
    #player_skills_upgradingCfg {
    skillID = 211001,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(52.5%攻击+0)点",
    id = 206
    };
getRow(211002,1)->
    #player_skills_upgradingCfg {
    skillID = 211002,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(75%攻击+0)点",
    id = 207
    };
getRow(211003,1)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "用神圣的力量对周围敌人进行持续打击，共造成总计(320%攻击+256)点伤害",
    id = 208
    };
getRow(211003,2)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对周围敌人进行持续打击，共造成总计(339.2%攻击+312)点伤害",
    id = 209
    };
getRow(211003,3)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对周围敌人进行持续打击，共造成总计(358.4%攻击+368)点伤害",
    id = 210
    };
getRow(211003,4)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对周围敌人进行持续打击，共造成总计(377.6%攻击+424)点伤害",
    id = 211
    };
getRow(211003,5)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对周围敌人进行持续打击，共造成总计(396.8%攻击+480)点伤害",
    id = 212
    };
getRow(211003,6)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对周围敌人进行持续打击，共造成总计(416%攻击+536)点伤害",
    id = 213
    };
getRow(211003,7)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对周围敌人进行持续打击，共造成总计(435.2%攻击+592)点伤害",
    id = 214
    };
getRow(211003,8)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对周围敌人进行持续打击，共造成总计(454.4%攻击+648)点伤害",
    id = 215
    };
getRow(211003,9)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对周围敌人进行持续打击，共造成总计(473.6%攻击+704)点伤害",
    id = 216
    };
getRow(211003,10)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对周围敌人进行持续打击，共造成总计(492.8%攻击+760)点伤害",
    id = 217
    };
getRow(211003,11)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对周围敌人进行持续打击，共造成总计(512%攻击+816)点伤害",
    id = 218
    };
getRow(211003,12)->
    #player_skills_upgradingCfg {
    skillID = 211003,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量对周围敌人进行持续打击，共造成总计(531.2%攻击+872)点伤害",
    id = 219
    };
getRow(211004,1)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身(200%攻击+235)点的生命值",
    id = 220
    };
getRow(211004,2)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身(211.9%攻击+270)点的生命值",
    id = 221
    };
getRow(211004,3)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身(223.8%攻击+305)点的生命值",
    id = 222
    };
getRow(211004,4)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身(235.7%攻击+340)点的生命值",
    id = 223
    };
getRow(211004,5)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身(247.6%攻击+375)点的生命值",
    id = 224
    };
getRow(211004,6)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身(259.5%攻击+410)点的生命值",
    id = 225
    };
getRow(211004,7)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身(271.4%攻击+445)点的生命值",
    id = 226
    };
getRow(211004,8)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身(283.3%攻击+480)点的生命值",
    id = 227
    };
getRow(211004,9)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身(295.2%攻击+515)点的生命值",
    id = 228
    };
getRow(211004,10)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身(307.1%攻击+550)点的生命值",
    id = 229
    };
getRow(211004,11)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身(319%攻击+585)点的生命值",
    id = 230
    };
getRow(211004,12)->
    #player_skills_upgradingCfg {
    skillID = 211004,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速的咏唱咒文，恢复自身(330.9%攻击+620)点的生命值",
    id = 231
    };
getRow(211005,1)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人造成总计(250%攻击+244)点的伤害。",
    id = 232
    };
getRow(211005,2)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人造成总计(264.8%攻击+288)点的伤害。",
    id = 233
    };
getRow(211005,3)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人造成总计(279.6%攻击+332)点的伤害。",
    id = 234
    };
getRow(211005,4)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人造成总计(294.4%攻击+376)点的伤害。",
    id = 235
    };
getRow(211005,5)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人造成总计(309.2%攻击+420)点的伤害。",
    id = 236
    };
getRow(211005,6)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人造成总计(324%攻击+464)点的伤害。",
    id = 237
    };
getRow(211005,7)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人造成总计(338.8%攻击+508)点的伤害。",
    id = 238
    };
getRow(211005,8)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人造成总计(353.6%攻击+552)点的伤害。",
    id = 239
    };
getRow(211005,9)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人造成总计(368.4%攻击+596)点的伤害。",
    id = 240
    };
getRow(211005,10)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人造成总计(383.2%攻击+640)点的伤害。",
    id = 241
    };
getRow(211005,11)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人造成总计(398%攻击+684)点的伤害。",
    id = 242
    };
getRow(211005,12)->
    #player_skills_upgradingCfg {
    skillID = 211005,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "降下神圣的审判，给予敌人造成总计(412.8%攻击+728)点的伤害。",
    id = 243
    };
getRow(211006,1)->
    #player_skills_upgradingCfg {
    skillID = 211006,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "对15米半径范围内敌方造成总计(100%攻击+97)点伤害，增加中毒效果，并清除队友所有debuff",
    id = 244
    };
getRow(211006,2)->
    #player_skills_upgradingCfg {
    skillID = 211006,
    level = 2,
    player_level = 20,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对15米半径范围内敌方造成总计(105.9%攻击+114)点伤害，增加中毒效果，并清除队友所有debuff",
    id = 245
    };
getRow(211006,3)->
    #player_skills_upgradingCfg {
    skillID = 211006,
    level = 3,
    player_level = 20,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对15米半径范围内敌方造成总计(111.8%攻击+131)点伤害，增加中毒效果，并清除队友所有debuff",
    id = 246
    };
getRow(211006,4)->
    #player_skills_upgradingCfg {
    skillID = 211006,
    level = 4,
    player_level = 20,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对15米半径范围内敌方造成总计(117.8%攻击+148)点伤害，增加中毒效果，并清除队友所有debuff",
    id = 247
    };
getRow(211006,5)->
    #player_skills_upgradingCfg {
    skillID = 211006,
    level = 5,
    player_level = 22,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "对15米半径范围内敌方造成总计(123.7%攻击+165)点伤害，增加中毒效果，并清除队友所有debuff",
    id = 248
    };
getRow(211006,6)->
    #player_skills_upgradingCfg {
    skillID = 211006,
    level = 6,
    player_level = 24,
    currency = [{1,8300}],
    skillcoin_cost = 1,
    item = [],
    describe = "对15米半径范围内敌方造成总计(129.6%攻击+182)点伤害，增加中毒效果，并清除队友所有debuff",
    id = 249
    };
getRow(211006,7)->
    #player_skills_upgradingCfg {
    skillID = 211006,
    level = 7,
    player_level = 26,
    currency = [{1,9800}],
    skillcoin_cost = 1,
    item = [],
    describe = "对15米半径范围内敌方造成总计(135.5%攻击+199)点伤害，增加中毒效果，并清除队友所有debuff",
    id = 250
    };
getRow(211006,8)->
    #player_skills_upgradingCfg {
    skillID = 211006,
    level = 8,
    player_level = 28,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "对15米半径范围内敌方造成总计(141.4%攻击+216)点伤害，增加中毒效果，并清除队友所有debuff",
    id = 251
    };
getRow(211006,9)->
    #player_skills_upgradingCfg {
    skillID = 211006,
    level = 9,
    player_level = 30,
    currency = [{1,13600}],
    skillcoin_cost = 1,
    item = [],
    describe = "对15米半径范围内敌方造成总计(147.4%攻击+233)点伤害，增加中毒效果，并清除队友所有debuff",
    id = 252
    };
getRow(211006,10)->
    #player_skills_upgradingCfg {
    skillID = 211006,
    level = 10,
    player_level = 33,
    currency = [{1,16500}],
    skillcoin_cost = 1,
    item = [],
    describe = "对15米半径范围内敌方造成总计(153.3%攻击+250)点伤害，增加中毒效果，并清除队友所有debuff",
    id = 253
    };
getRow(211006,11)->
    #player_skills_upgradingCfg {
    skillID = 211006,
    level = 11,
    player_level = 36,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "对15米半径范围内敌方造成总计(159.2%攻击+267)点伤害，增加中毒效果，并清除队友所有debuff",
    id = 254
    };
getRow(211006,12)->
    #player_skills_upgradingCfg {
    skillID = 211006,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "对15米半径范围内敌方造成总计(165.1%攻击+284)点伤害，增加中毒效果，并清除队友所有debuff",
    id = 255
    };
getRow(211007,1)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 1,
    player_level = 30,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围30米队友恢复持续总计(433.5%攻击+410)点生命值。",
    id = 256
    };
getRow(211007,2)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 2,
    player_level = 30,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围30米队友恢复持续总计(459%攻击+485)点生命值。",
    id = 257
    };
getRow(211007,3)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 3,
    player_level = 31,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围30米队友恢复持续总计(484.5%攻击+560)点生命值。",
    id = 258
    };
getRow(211007,4)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 4,
    player_level = 32,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围30米队友恢复持续总计(510%攻击+635)点生命值。",
    id = 259
    };
getRow(211007,5)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 5,
    player_level = 33,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围30米队友恢复持续总计(535.5%攻击+710)点生命值。",
    id = 260
    };
getRow(211007,6)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 6,
    player_level = 34,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围30米队友恢复持续总计(561%攻击+785)点生命值。",
    id = 261
    };
getRow(211007,7)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 7,
    player_level = 35,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围30米队友恢复持续总计(586.5%攻击+860)点生命值。",
    id = 262
    };
getRow(211007,8)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 8,
    player_level = 36,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围30米队友恢复持续总计(612%攻击+935)点生命值。",
    id = 263
    };
getRow(211007,9)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 9,
    player_level = 37,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围30米队友恢复持续总计(637.5%攻击+1010)点生命值。",
    id = 264
    };
getRow(211007,10)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 10,
    player_level = 38,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围30米队友恢复持续总计(663%攻击+1085)点生命值。",
    id = 265
    };
getRow(211007,11)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 11,
    player_level = 39,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围30米队友恢复持续总计(688.5%攻击+1160)点生命值。",
    id = 266
    };
getRow(211007,12)->
    #player_skills_upgradingCfg {
    skillID = 211007,
    level = 12,
    player_level = 40,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "为周围30米队友恢复持续总计(714%攻击+1235)点生命值。",
    id = 267
    };
getRow(211008,1)->
    #player_skills_upgradingCfg {
    skillID = 211008,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有debuff并瞬移到30米外",
    id = 268
    };
getRow(211008,2)->
    #player_skills_upgradingCfg {
    skillID = 211008,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有debuff并瞬移到30米外",
    id = 269
    };
getRow(211008,3)->
    #player_skills_upgradingCfg {
    skillID = 211008,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有debuff并瞬移到30米外",
    id = 270
    };
getRow(211008,4)->
    #player_skills_upgradingCfg {
    skillID = 211008,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有debuff并瞬移到30米外",
    id = 271
    };
getRow(211008,5)->
    #player_skills_upgradingCfg {
    skillID = 211008,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有debuff并瞬移到30米外",
    id = 272
    };
getRow(211008,6)->
    #player_skills_upgradingCfg {
    skillID = 211008,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有debuff并瞬移到30米外",
    id = 273
    };
getRow(211008,7)->
    #player_skills_upgradingCfg {
    skillID = 211008,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有debuff并瞬移到30米外",
    id = 274
    };
getRow(211008,8)->
    #player_skills_upgradingCfg {
    skillID = 211008,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有debuff并瞬移到30米外",
    id = 275
    };
getRow(211008,9)->
    #player_skills_upgradingCfg {
    skillID = 211008,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有debuff并瞬移到30米外",
    id = 276
    };
getRow(211008,10)->
    #player_skills_upgradingCfg {
    skillID = 211008,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有debuff并瞬移到30米外",
    id = 277
    };
getRow(211008,11)->
    #player_skills_upgradingCfg {
    skillID = 211008,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有debuff并瞬移到30米外",
    id = 278
    };
getRow(211008,12)->
    #player_skills_upgradingCfg {
    skillID = 211008,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "解除所有debuff并瞬移到30米外",
    id = 279
    };
getRow(212000,1)->
    #player_skills_upgradingCfg {
    skillID = 212000,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(50%攻击+0)点",
    id = 280
    };
getRow(212001,1)->
    #player_skills_upgradingCfg {
    skillID = 212001,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(52.5%攻击+0)点",
    id = 281
    };
getRow(212002,1)->
    #player_skills_upgradingCfg {
    skillID = 212002,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(75%攻击+0)点",
    id = 282
    };
getRow(212003,1)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "用浓缩的风之力，使敌人总计受到(120%攻击+28)点的伤害，并将其震退",
    id = 283
    };
getRow(212003,2)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，使敌人总计受到(127.1%攻击+56)点的伤害，并将其震退",
    id = 284
    };
getRow(212003,3)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，使敌人总计受到(134.2%攻击+84)点的伤害，并将其震退",
    id = 285
    };
getRow(212003,4)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，使敌人总计受到(141.3%攻击+112)点的伤害，并将其震退",
    id = 286
    };
getRow(212003,5)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，使敌人总计受到(148.4%攻击+140)点的伤害，并将其震退",
    id = 287
    };
getRow(212003,6)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，使敌人总计受到(155.5%攻击+168)点的伤害，并将其震退",
    id = 288
    };
getRow(212003,7)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，使敌人总计受到(162.6%攻击+196)点的伤害，并将其震退",
    id = 289
    };
getRow(212003,8)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，使敌人总计受到(169.7%攻击+224)点的伤害，并将其震退",
    id = 290
    };
getRow(212003,9)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，使敌人总计受到(176.8%攻击+252)点的伤害，并将其震退",
    id = 291
    };
getRow(212003,10)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，使敌人总计受到(183.9%攻击+280)点的伤害，并将其震退",
    id = 292
    };
getRow(212003,11)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，使敌人总计受到(191%攻击+308)点的伤害，并将其震退",
    id = 293
    };
getRow(212003,12)->
    #player_skills_upgradingCfg {
    skillID = 212003,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "用浓缩的风之力，使敌人总计受到(198.1%攻击+336)点的伤害，并将其震退",
    id = 294
    };
getRow(212004,1)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人总计受到(175%攻击+171)点伤害，并有几率在短时间内，持续给予目标燃烧伤害",
    id = 295
    };
getRow(212004,2)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人总计受到(185.4%攻击+202)点伤害，并有几率在短时间内，持续给予目标燃烧伤害",
    id = 296
    };
getRow(212004,3)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人总计受到(195.7%攻击+232)点伤害，并有几率在短时间内，持续给予目标燃烧伤害",
    id = 297
    };
getRow(212004,4)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人总计受到(206.1%攻击+263)点伤害，并有几率在短时间内，持续给予目标燃烧伤害",
    id = 298
    };
getRow(212004,5)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人总计受到(216.4%攻击+294)点伤害，并有几率在短时间内，持续给予目标燃烧伤害",
    id = 299
    };
getRow(212004,6)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人总计受到(226.8%攻击+325)点伤害，并有几率在短时间内，持续给予目标燃烧伤害",
    id = 300
    };
getRow(212004,7)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人总计受到(237.2%攻击+356)点伤害，并有几率在短时间内，持续给予目标燃烧伤害",
    id = 301
    };
getRow(212004,8)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人总计受到(247.5%攻击+386)点伤害，并有几率在短时间内，持续给予目标燃烧伤害",
    id = 302
    };
getRow(212004,9)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人总计受到(257.9%攻击+417)点伤害，并有几率在短时间内，持续给予目标燃烧伤害",
    id = 303
    };
getRow(212004,10)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人总计受到(268.2%攻击+448)点伤害，并有几率在短时间内，持续给予目标燃烧伤害",
    id = 304
    };
getRow(212004,11)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人总计受到(278.6%攻击+479)点伤害，并有几率在短时间内，持续给予目标燃烧伤害",
    id = 305
    };
getRow(212004,12)->
    #player_skills_upgradingCfg {
    skillID = 212004,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强大的火焰让敌人总计受到(289%攻击+510)点伤害，并有几率在短时间内，持续给予目标燃烧伤害",
    id = 306
    };
getRow(212005,1)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计(220%攻击+239)点伤害，并有几率使敌人冻结2秒",
    id = 307
    };
getRow(212005,2)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计(233.1%攻击+278)点伤害，并有几率使敌人冻结2秒",
    id = 308
    };
getRow(212005,3)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计(246.2%攻击+317)点伤害，并有几率使敌人冻结2秒",
    id = 309
    };
getRow(212005,4)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计(259.3%攻击+356)点伤害，并有几率使敌人冻结2秒",
    id = 310
    };
getRow(212005,5)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计(272.4%攻击+395)点伤害，并有几率使敌人冻结2秒",
    id = 311
    };
getRow(212005,6)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计(285.5%攻击+434)点伤害，并有几率使敌人冻结2秒",
    id = 312
    };
getRow(212005,7)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计(298.6%攻击+473)点伤害，并有几率使敌人冻结2秒",
    id = 313
    };
getRow(212005,8)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计(311.7%攻击+512)点伤害，并有几率使敌人冻结2秒",
    id = 314
    };
getRow(212005,9)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计(324.8%攻击+551)点伤害，并有几率使敌人冻结2秒",
    id = 315
    };
getRow(212005,10)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计(337.9%攻击+590)点伤害，并有几率使敌人冻结2秒",
    id = 316
    };
getRow(212005,11)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计(351%攻击+629)点伤害，并有几率使敌人冻结2秒",
    id = 317
    };
getRow(212005,12)->
    #player_skills_upgradingCfg {
    skillID = 212005,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用寒冰之力，给予敌人总计(364.1%攻击+668)点伤害，并有几率使敌人冻结2秒",
    id = 318
    };
getRow(212006,1)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 1,
    player_level = 30,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计(200.1%攻击+35)点伤害，并有几率在一定时间内，降低敌人的移动速度，持续4秒",
    id = 319
    };
getRow(212006,2)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 2,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计(212.1%攻击+70)点伤害，并有几率在一定时间内，降低敌人的移动速度，持续4秒",
    id = 320
    };
getRow(212006,3)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 3,
    player_level = 31,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计(224.1%攻击+105)点伤害，并有几率在一定时间内，降低敌人的移动速度，持续4秒",
    id = 321
    };
getRow(212006,4)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 4,
    player_level = 32,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计(236.1%攻击+140)点伤害，并有几率在一定时间内，降低敌人的移动速度，持续4秒",
    id = 322
    };
getRow(212006,5)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 5,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计(248.1%攻击+175)点伤害，并有几率在一定时间内，降低敌人的移动速度，持续4秒",
    id = 323
    };
getRow(212006,6)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 6,
    player_level = 34,
    currency = [{1,8300}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计(260.1%攻击+210)点伤害，并有几率在一定时间内，降低敌人的移动速度，持续4秒",
    id = 324
    };
getRow(212006,7)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 7,
    player_level = 35,
    currency = [{1,9800}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计(272.1%攻击+245)点伤害，并有几率在一定时间内，降低敌人的移动速度，持续4秒",
    id = 325
    };
getRow(212006,8)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 8,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计(284.1%攻击+280)点伤害，并有几率在一定时间内，降低敌人的移动速度，持续4秒",
    id = 326
    };
getRow(212006,9)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 9,
    player_level = 37,
    currency = [{1,13600}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计(296.1%攻击+315)点伤害，并有几率在一定时间内，降低敌人的移动速度，持续4秒",
    id = 327
    };
getRow(212006,10)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 10,
    player_level = 38,
    currency = [{1,16500}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计(308.1%攻击+350)点伤害，并有几率在一定时间内，降低敌人的移动速度，持续4秒",
    id = 328
    };
getRow(212006,11)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 11,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计(320.1%攻击+385)点伤害，并有几率在一定时间内，降低敌人的移动速度，持续4秒",
    id = 329
    };
getRow(212006,12)->
    #player_skills_upgradingCfg {
    skillID = 212006,
    level = 12,
    player_level = 40,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用冰箭攻击敌人，造成总计(332.1%攻击+420)点伤害，并有几率在一定时间内，降低敌人的移动速度，持续4秒",
    id = 330
    };
getRow(212007,1)->
    #player_skills_upgradingCfg {
    skillID = 212007,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "增加队友18%魔法攻击，持续10秒",
    id = 331
    };
getRow(212007,2)->
    #player_skills_upgradingCfg {
    skillID = 212007,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加队友19%魔法攻击，持续10秒",
    id = 332
    };
getRow(212007,3)->
    #player_skills_upgradingCfg {
    skillID = 212007,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加队友20%魔法攻击，持续10秒",
    id = 333
    };
getRow(212007,4)->
    #player_skills_upgradingCfg {
    skillID = 212007,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加队友21%魔法攻击，持续10秒",
    id = 334
    };
getRow(212007,5)->
    #player_skills_upgradingCfg {
    skillID = 212007,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加队友22%魔法攻击，持续10秒",
    id = 335
    };
getRow(212007,6)->
    #player_skills_upgradingCfg {
    skillID = 212007,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加队友23%魔法攻击，持续10秒",
    id = 336
    };
getRow(212007,7)->
    #player_skills_upgradingCfg {
    skillID = 212007,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加队友24%魔法攻击，持续10秒",
    id = 337
    };
getRow(212007,8)->
    #player_skills_upgradingCfg {
    skillID = 212007,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加队友25%魔法攻击，持续10秒",
    id = 338
    };
getRow(212007,9)->
    #player_skills_upgradingCfg {
    skillID = 212007,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加队友26%魔法攻击，持续10秒",
    id = 339
    };
getRow(212007,10)->
    #player_skills_upgradingCfg {
    skillID = 212007,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加队友27%魔法攻击，持续10秒",
    id = 340
    };
getRow(212007,11)->
    #player_skills_upgradingCfg {
    skillID = 212007,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加队友28%魔法攻击，持续10秒",
    id = 341
    };
getRow(212007,12)->
    #player_skills_upgradingCfg {
    skillID = 212007,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "增加队友29%魔法攻击，持续10秒",
    id = 342
    };
getRow(212008,1)->
    #player_skills_upgradingCfg {
    skillID = 212008,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "来自魔法师的祝福，提升自身16%魔法攻击，持续13秒",
    id = 343
    };
getRow(212008,2)->
    #player_skills_upgradingCfg {
    skillID = 212008,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "来自魔法师的祝福，提升自身16.75%魔法攻击，持续13秒",
    id = 344
    };
getRow(212008,3)->
    #player_skills_upgradingCfg {
    skillID = 212008,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "来自魔法师的祝福，提升自身17.5%魔法攻击，持续13秒",
    id = 345
    };
getRow(212008,4)->
    #player_skills_upgradingCfg {
    skillID = 212008,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "来自魔法师的祝福，提升自身18.25%魔法攻击，持续13秒",
    id = 346
    };
getRow(212008,5)->
    #player_skills_upgradingCfg {
    skillID = 212008,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "来自魔法师的祝福，提升自身19%魔法攻击，持续13秒",
    id = 347
    };
getRow(212008,6)->
    #player_skills_upgradingCfg {
    skillID = 212008,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "来自魔法师的祝福，提升自身19.75%魔法攻击，持续13秒",
    id = 348
    };
getRow(212008,7)->
    #player_skills_upgradingCfg {
    skillID = 212008,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "来自魔法师的祝福，提升自身20.5%魔法攻击，持续13秒",
    id = 349
    };
getRow(212008,8)->
    #player_skills_upgradingCfg {
    skillID = 212008,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "来自魔法师的祝福，提升自身21.25%魔法攻击，持续13秒",
    id = 350
    };
getRow(212008,9)->
    #player_skills_upgradingCfg {
    skillID = 212008,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "来自魔法师的祝福，提升自身22%魔法攻击，持续13秒",
    id = 351
    };
getRow(212008,10)->
    #player_skills_upgradingCfg {
    skillID = 212008,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "来自魔法师的祝福，提升自身22.75%魔法攻击，持续13秒",
    id = 352
    };
getRow(212008,11)->
    #player_skills_upgradingCfg {
    skillID = 212008,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "来自魔法师的祝福，提升自身23.5%魔法攻击，持续13秒",
    id = 353
    };
getRow(212008,12)->
    #player_skills_upgradingCfg {
    skillID = 212008,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "来自魔法师的祝福，提升自身24.25%魔法攻击，持续13秒",
    id = 354
    };
getRow(221000,1)->
    #player_skills_upgradingCfg {
    skillID = 221000,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 721
    };
getRow(221000,2)->
    #player_skills_upgradingCfg {
    skillID = 221000,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 722
    };
getRow(221000,3)->
    #player_skills_upgradingCfg {
    skillID = 221000,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 723
    };
getRow(221000,4)->
    #player_skills_upgradingCfg {
    skillID = 221000,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 724
    };
getRow(221000,5)->
    #player_skills_upgradingCfg {
    skillID = 221000,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 725
    };
getRow(221000,6)->
    #player_skills_upgradingCfg {
    skillID = 221000,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 726
    };
getRow(221000,7)->
    #player_skills_upgradingCfg {
    skillID = 221000,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 727
    };
getRow(221000,8)->
    #player_skills_upgradingCfg {
    skillID = 221000,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 728
    };
getRow(221000,9)->
    #player_skills_upgradingCfg {
    skillID = 221000,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 729
    };
getRow(221001,1)->
    #player_skills_upgradingCfg {
    skillID = 221001,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 730
    };
getRow(221001,2)->
    #player_skills_upgradingCfg {
    skillID = 221001,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 731
    };
getRow(221001,3)->
    #player_skills_upgradingCfg {
    skillID = 221001,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 732
    };
getRow(221001,4)->
    #player_skills_upgradingCfg {
    skillID = 221001,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 733
    };
getRow(221001,5)->
    #player_skills_upgradingCfg {
    skillID = 221001,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 734
    };
getRow(221001,6)->
    #player_skills_upgradingCfg {
    skillID = 221001,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 735
    };
getRow(221001,7)->
    #player_skills_upgradingCfg {
    skillID = 221001,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 736
    };
getRow(221001,8)->
    #player_skills_upgradingCfg {
    skillID = 221001,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 737
    };
getRow(221001,9)->
    #player_skills_upgradingCfg {
    skillID = 221001,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 738
    };
getRow(221002,1)->
    #player_skills_upgradingCfg {
    skillID = 221002,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 739
    };
getRow(221002,2)->
    #player_skills_upgradingCfg {
    skillID = 221002,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 740
    };
getRow(221002,3)->
    #player_skills_upgradingCfg {
    skillID = 221002,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 741
    };
getRow(221002,4)->
    #player_skills_upgradingCfg {
    skillID = 221002,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 742
    };
getRow(221002,5)->
    #player_skills_upgradingCfg {
    skillID = 221002,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 743
    };
getRow(221002,6)->
    #player_skills_upgradingCfg {
    skillID = 221002,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 744
    };
getRow(221002,7)->
    #player_skills_upgradingCfg {
    skillID = 221002,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 745
    };
getRow(221002,8)->
    #player_skills_upgradingCfg {
    skillID = 221002,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 746
    };
getRow(221002,9)->
    #player_skills_upgradingCfg {
    skillID = 221002,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 747
    };
getRow(221003,1)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 748
    };
getRow(221003,2)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 749
    };
getRow(221003,3)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 750
    };
getRow(221003,4)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 751
    };
getRow(221003,5)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 752
    };
getRow(221003,6)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 753
    };
getRow(221003,7)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 754
    };
getRow(221003,8)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 755
    };
getRow(221003,9)->
    #player_skills_upgradingCfg {
    skillID = 221003,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 756
    };
getRow(221004,1)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 757
    };
getRow(221004,2)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 758
    };
getRow(221004,3)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 759
    };
getRow(221004,4)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 760
    };
getRow(221004,5)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 761
    };
getRow(221004,6)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 762
    };
getRow(221004,7)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 763
    };
getRow(221004,8)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 764
    };
getRow(221004,9)->
    #player_skills_upgradingCfg {
    skillID = 221004,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 765
    };
getRow(221005,1)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 766
    };
getRow(221005,2)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 767
    };
getRow(221005,3)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 768
    };
getRow(221005,4)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 769
    };
getRow(221005,5)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 770
    };
getRow(221005,6)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 771
    };
getRow(221005,7)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 772
    };
getRow(221005,8)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 773
    };
getRow(221005,9)->
    #player_skills_upgradingCfg {
    skillID = 221005,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 774
    };
getRow(221006,1)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 775
    };
getRow(221006,2)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 776
    };
getRow(221006,3)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 777
    };
getRow(221006,4)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 778
    };
getRow(221006,5)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 779
    };
getRow(221006,6)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 780
    };
getRow(221006,7)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 781
    };
getRow(221006,8)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 782
    };
getRow(221006,9)->
    #player_skills_upgradingCfg {
    skillID = 221006,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 783
    };
getRow(222000,1)->
    #player_skills_upgradingCfg {
    skillID = 222000,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 784
    };
getRow(222000,2)->
    #player_skills_upgradingCfg {
    skillID = 222000,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 785
    };
getRow(222000,3)->
    #player_skills_upgradingCfg {
    skillID = 222000,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 786
    };
getRow(222000,4)->
    #player_skills_upgradingCfg {
    skillID = 222000,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 787
    };
getRow(222000,5)->
    #player_skills_upgradingCfg {
    skillID = 222000,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 788
    };
getRow(222000,6)->
    #player_skills_upgradingCfg {
    skillID = 222000,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 789
    };
getRow(222000,7)->
    #player_skills_upgradingCfg {
    skillID = 222000,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 790
    };
getRow(222000,8)->
    #player_skills_upgradingCfg {
    skillID = 222000,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 791
    };
getRow(222000,9)->
    #player_skills_upgradingCfg {
    skillID = 222000,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 792
    };
getRow(222001,1)->
    #player_skills_upgradingCfg {
    skillID = 222001,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 793
    };
getRow(222001,2)->
    #player_skills_upgradingCfg {
    skillID = 222001,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 794
    };
getRow(222001,3)->
    #player_skills_upgradingCfg {
    skillID = 222001,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 795
    };
getRow(222001,4)->
    #player_skills_upgradingCfg {
    skillID = 222001,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 796
    };
getRow(222001,5)->
    #player_skills_upgradingCfg {
    skillID = 222001,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 797
    };
getRow(222001,6)->
    #player_skills_upgradingCfg {
    skillID = 222001,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 798
    };
getRow(222001,7)->
    #player_skills_upgradingCfg {
    skillID = 222001,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 799
    };
getRow(222001,8)->
    #player_skills_upgradingCfg {
    skillID = 222001,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 800
    };
getRow(222001,9)->
    #player_skills_upgradingCfg {
    skillID = 222001,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 801
    };
getRow(222002,1)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 802
    };
getRow(222002,2)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 803
    };
getRow(222002,3)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 804
    };
getRow(222002,4)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 805
    };
getRow(222002,5)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 806
    };
getRow(222002,6)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 807
    };
getRow(222002,7)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 808
    };
getRow(222002,8)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 809
    };
getRow(222002,9)->
    #player_skills_upgradingCfg {
    skillID = 222002,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 810
    };
getRow(222003,1)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 811
    };
getRow(222003,2)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 812
    };
getRow(222003,3)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 813
    };
getRow(222003,4)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 814
    };
getRow(222003,5)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 815
    };
getRow(222003,6)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 816
    };
getRow(222003,7)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 817
    };
getRow(222003,8)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 818
    };
getRow(222003,9)->
    #player_skills_upgradingCfg {
    skillID = 222003,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 819
    };
getRow(222004,1)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 820
    };
getRow(222004,2)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 821
    };
getRow(222004,3)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 822
    };
getRow(222004,4)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 823
    };
getRow(222004,5)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 824
    };
getRow(222004,6)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 825
    };
getRow(222004,7)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 826
    };
getRow(222004,8)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 827
    };
getRow(222004,9)->
    #player_skills_upgradingCfg {
    skillID = 222004,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 828
    };
getRow(222005,1)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 829
    };
getRow(222005,2)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 830
    };
getRow(222005,3)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 831
    };
getRow(222005,4)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 832
    };
getRow(222005,5)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 833
    };
getRow(222005,6)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 834
    };
getRow(222005,7)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 835
    };
getRow(222005,8)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 836
    };
getRow(222005,9)->
    #player_skills_upgradingCfg {
    skillID = 222005,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 837
    };
getRow(222006,1)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 838
    };
getRow(222006,2)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 839
    };
getRow(222006,3)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 840
    };
getRow(222006,4)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 841
    };
getRow(222006,5)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 842
    };
getRow(222006,6)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 843
    };
getRow(222006,7)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 844
    };
getRow(222006,8)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 845
    };
getRow(222006,9)->
    #player_skills_upgradingCfg {
    skillID = 222006,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 846
    };
getRow(223000,1)->
    #player_skills_upgradingCfg {
    skillID = 223000,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 847
    };
getRow(223000,2)->
    #player_skills_upgradingCfg {
    skillID = 223000,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 848
    };
getRow(223000,3)->
    #player_skills_upgradingCfg {
    skillID = 223000,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 849
    };
getRow(223000,4)->
    #player_skills_upgradingCfg {
    skillID = 223000,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 850
    };
getRow(223000,5)->
    #player_skills_upgradingCfg {
    skillID = 223000,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 851
    };
getRow(223000,6)->
    #player_skills_upgradingCfg {
    skillID = 223000,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 852
    };
getRow(223000,7)->
    #player_skills_upgradingCfg {
    skillID = 223000,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 853
    };
getRow(223000,8)->
    #player_skills_upgradingCfg {
    skillID = 223000,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 854
    };
getRow(223000,9)->
    #player_skills_upgradingCfg {
    skillID = 223000,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 855
    };
getRow(223001,1)->
    #player_skills_upgradingCfg {
    skillID = 223001,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 856
    };
getRow(223001,2)->
    #player_skills_upgradingCfg {
    skillID = 223001,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 857
    };
getRow(223001,3)->
    #player_skills_upgradingCfg {
    skillID = 223001,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 858
    };
getRow(223001,4)->
    #player_skills_upgradingCfg {
    skillID = 223001,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 859
    };
getRow(223001,5)->
    #player_skills_upgradingCfg {
    skillID = 223001,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 860
    };
getRow(223001,6)->
    #player_skills_upgradingCfg {
    skillID = 223001,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 861
    };
getRow(223001,7)->
    #player_skills_upgradingCfg {
    skillID = 223001,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 862
    };
getRow(223001,8)->
    #player_skills_upgradingCfg {
    skillID = 223001,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 863
    };
getRow(223001,9)->
    #player_skills_upgradingCfg {
    skillID = 223001,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 864
    };
getRow(223002,1)->
    #player_skills_upgradingCfg {
    skillID = 223002,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 865
    };
getRow(223002,2)->
    #player_skills_upgradingCfg {
    skillID = 223002,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 866
    };
getRow(223002,3)->
    #player_skills_upgradingCfg {
    skillID = 223002,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 867
    };
getRow(223002,4)->
    #player_skills_upgradingCfg {
    skillID = 223002,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 868
    };
getRow(223002,5)->
    #player_skills_upgradingCfg {
    skillID = 223002,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 869
    };
getRow(223002,6)->
    #player_skills_upgradingCfg {
    skillID = 223002,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 870
    };
getRow(223002,7)->
    #player_skills_upgradingCfg {
    skillID = 223002,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 871
    };
getRow(223002,8)->
    #player_skills_upgradingCfg {
    skillID = 223002,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 872
    };
getRow(223002,9)->
    #player_skills_upgradingCfg {
    skillID = 223002,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "普通攻击(0%攻击+1)点",
    id = 873
    };
getRow(223003,1)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 874
    };
getRow(223003,2)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 875
    };
getRow(223003,3)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 876
    };
getRow(223003,4)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 877
    };
getRow(223003,5)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 878
    };
getRow(223003,6)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 879
    };
getRow(223003,7)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 880
    };
getRow(223003,8)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 881
    };
getRow(223003,9)->
    #player_skills_upgradingCfg {
    skillID = 223003,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用神圣的力量给予敌人(0%攻击+1)点伤害",
    id = 882
    };
getRow(223004,1)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 883
    };
getRow(223004,2)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 884
    };
getRow(223004,3)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 885
    };
getRow(223004,4)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 886
    };
getRow(223004,5)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 887
    };
getRow(223004,6)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 888
    };
getRow(223004,7)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 889
    };
getRow(223004,8)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 890
    };
getRow(223004,9)->
    #player_skills_upgradingCfg {
    skillID = 223004,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用火球给予敌人(0%攻击+1)点伤害",
    id = 891
    };
getRow(223005,1)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 892
    };
getRow(223005,2)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 893
    };
getRow(223005,3)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 894
    };
getRow(223005,4)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 895
    };
getRow(223005,5)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 896
    };
getRow(223005,6)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 897
    };
getRow(223005,7)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 898
    };
getRow(223005,8)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 899
    };
getRow(223005,9)->
    #player_skills_upgradingCfg {
    skillID = 223005,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用冰箭攻击敌人，给予敌人(0%攻击+1)点伤害，有特定机率在一定时间内，降低敌人的移动速度。",
    id = 900
    };
getRow(223006,1)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 901
    };
getRow(223006,2)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 902
    };
getRow(223006,3)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 903
    };
getRow(223006,4)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 904
    };
getRow(223006,5)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 905
    };
getRow(223006,6)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 906
    };
getRow(223006,7)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 907
    };
getRow(223006,8)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 908
    };
getRow(223006,9)->
    #player_skills_upgradingCfg {
    skillID = 223006,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用凝缩的风之力量进行攻击，给予敌人(0%攻击+1)点伤害，并将其震退一定距离。",
    id = 909
    };
getRow(301000,1)->
    #player_skills_upgradingCfg {
    skillID = 301000,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 355
    };
getRow(301001,1)->
    #player_skills_upgradingCfg {
    skillID = 301001,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "#N/A",
    id = 356
    };
getRow(301002,1)->
    #player_skills_upgradingCfg {
    skillID = 301002,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "#N/A",
    id = 357
    };
getRow(301003,1)->
    #player_skills_upgradingCfg {
    skillID = 301003,
    level = 1,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "让魔力爆发使敌人受到总计(256%攻击+55)点伤害，3秒内降低敌人移动速度",
    id = 358
    };
getRow(301003,2)->
    #player_skills_upgradingCfg {
    skillID = 301003,
    level = 2,
    player_level = 10,
    currency = [{1,1600}],
    skillcoin_cost = 1,
    item = [],
    describe = "让魔力爆发使敌人受到总计(271%攻击+110)点伤害，3秒内降低敌人移动速度",
    id = 359
    };
getRow(301003,3)->
    #player_skills_upgradingCfg {
    skillID = 301003,
    level = 3,
    player_level = 12,
    currency = [{1,1600}],
    skillcoin_cost = 1,
    item = [],
    describe = "让魔力爆发使敌人受到总计(286%攻击+165)点伤害，3秒内降低敌人移动速度",
    id = 360
    };
getRow(301003,4)->
    #player_skills_upgradingCfg {
    skillID = 301003,
    level = 4,
    player_level = 14,
    currency = [{1,1600}],
    skillcoin_cost = 1,
    item = [],
    describe = "让魔力爆发使敌人受到总计(301%攻击+220)点伤害，3秒内降低敌人移动速度",
    id = 361
    };
getRow(301003,5)->
    #player_skills_upgradingCfg {
    skillID = 301003,
    level = 5,
    player_level = 17,
    currency = [{1,2200}],
    skillcoin_cost = 1,
    item = [],
    describe = "让魔力爆发使敌人受到总计(316%攻击+275)点伤害，3秒内降低敌人移动速度",
    id = 362
    };
getRow(301003,6)->
    #player_skills_upgradingCfg {
    skillID = 301003,
    level = 6,
    player_level = 19,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "让魔力爆发使敌人受到总计(331%攻击+330)点伤害，3秒内降低敌人移动速度",
    id = 363
    };
getRow(301004,1)->
    #player_skills_upgradingCfg {
    skillID = 301004,
    level = 1,
    player_level = 4,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力突刺攻击敌人，给予敌人总计(136%攻击+30)点伤害",
    id = 364
    };
getRow(301004,2)->
    #player_skills_upgradingCfg {
    skillID = 301004,
    level = 2,
    player_level = 7,
    currency = [{1,1000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力突刺攻击敌人，给予敌人总计(144.1%攻击+60)点伤害",
    id = 365
    };
getRow(301004,3)->
    #player_skills_upgradingCfg {
    skillID = 301004,
    level = 3,
    player_level = 10,
    currency = [{1,1600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力突刺攻击敌人，给予敌人总计(152.2%攻击+90)点伤害",
    id = 366
    };
getRow(301004,4)->
    #player_skills_upgradingCfg {
    skillID = 301004,
    level = 4,
    player_level = 13,
    currency = [{1,1600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力突刺攻击敌人，给予敌人总计(160.3%攻击+120)点伤害",
    id = 367
    };
getRow(301004,5)->
    #player_skills_upgradingCfg {
    skillID = 301004,
    level = 5,
    player_level = 15,
    currency = [{1,1700}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力突刺攻击敌人，给予敌人总计(168.4%攻击+150)点伤害",
    id = 368
    };
getRow(301004,6)->
    #player_skills_upgradingCfg {
    skillID = 301004,
    level = 6,
    player_level = 18,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力突刺攻击敌人，给予敌人总计(176.5%攻击+180)点伤害",
    id = 369
    };
getRow(301005,1)->
    #player_skills_upgradingCfg {
    skillID = 301005,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成总计(78.4%攻击+24)点伤害，有几率引起失血，失血持续3秒",
    id = 370
    };
getRow(301005,2)->
    #player_skills_upgradingCfg {
    skillID = 301005,
    level = 2,
    player_level = 3,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成总计(83.1%攻击+48)点伤害，有几率引起失血，失血持续3秒",
    id = 371
    };
getRow(301005,3)->
    #player_skills_upgradingCfg {
    skillID = 301005,
    level = 3,
    player_level = 4,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成总计(87.8%攻击+72)点伤害，有几率引起失血，失血持续3秒",
    id = 372
    };
getRow(301005,4)->
    #player_skills_upgradingCfg {
    skillID = 301005,
    level = 4,
    player_level = 9,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成总计(92.5%攻击+96)点伤害，有几率引起失血，失血持续3秒",
    id = 373
    };
getRow(301005,5)->
    #player_skills_upgradingCfg {
    skillID = 301005,
    level = 5,
    player_level = 13,
    currency = [{1,1600}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成总计(97.2%攻击+120)点伤害，有几率引起失血，失血持续3秒",
    id = 374
    };
getRow(301005,6)->
    #player_skills_upgradingCfg {
    skillID = 301005,
    level = 6,
    player_level = 17,
    currency = [{1,2200}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，造成总计(101.9%攻击+144)点伤害，有几率引起失血，失血持续3秒",
    id = 375
    };
getRow(301006,1)->
    #player_skills_upgradingCfg {
    skillID = 301006,
    level = 1,
    player_level = 12,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身1.3移动速度，20%爆伤等级，持续13秒",
    id = 376
    };
getRow(301006,2)->
    #player_skills_upgradingCfg {
    skillID = 301006,
    level = 2,
    player_level = 13,
    currency = [{1,1600}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身1.4移动速度，22%爆伤等级，持续13秒",
    id = 377
    };
getRow(301006,3)->
    #player_skills_upgradingCfg {
    skillID = 301006,
    level = 3,
    player_level = 14,
    currency = [{1,1600}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身1.5移动速度，24%爆伤等级，持续13秒",
    id = 378
    };
getRow(301006,4)->
    #player_skills_upgradingCfg {
    skillID = 301006,
    level = 4,
    player_level = 15,
    currency = [{1,1700}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身1.6移动速度，26%爆伤等级，持续13秒",
    id = 379
    };
getRow(301006,5)->
    #player_skills_upgradingCfg {
    skillID = 301006,
    level = 5,
    player_level = 17,
    currency = [{1,2200}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身1.7移动速度，28%爆伤等级，持续13秒",
    id = 380
    };
getRow(301006,6)->
    #player_skills_upgradingCfg {
    skillID = 301006,
    level = 6,
    player_level = 19,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "提高自身1.8移动速度，30%爆伤等级，持续13秒",
    id = 381
    };
getRow(311000,1)->
    #player_skills_upgradingCfg {
    skillID = 311000,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "#N/A",
    id = 382
    };
getRow(311001,1)->
    #player_skills_upgradingCfg {
    skillID = 311001,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "#N/A",
    id = 383
    };
getRow(311002,1)->
    #player_skills_upgradingCfg {
    skillID = 311002,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "#N/A",
    id = 384
    };
getRow(311003,1)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "使用弓箭，以尖锐之箭制造风之力，对敌人造成总计(170%攻击+230)点伤害，增加自身54点物理攻击力，持续6秒",
    id = 385
    };
getRow(311003,2)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以尖锐之箭制造风之力，对敌人造成总计(180.1%攻击+260)点伤害，增加自身84点物理攻击力，持续6秒",
    id = 386
    };
getRow(311003,3)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以尖锐之箭制造风之力，对敌人造成总计(190.2%攻击+290)点伤害，增加自身167点物理攻击力，持续6秒",
    id = 387
    };
getRow(311003,4)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以尖锐之箭制造风之力，对敌人造成总计(200.3%攻击+320)点伤害，增加自身254点物理攻击力，持续6秒",
    id = 388
    };
getRow(311003,5)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以尖锐之箭制造风之力，对敌人造成总计(210.4%攻击+350)点伤害，增加自身337点物理攻击力，持续6秒",
    id = 389
    };
getRow(311003,6)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以尖锐之箭制造风之力，对敌人造成总计(220.5%攻击+380)点伤害，增加自身465点物理攻击力，持续6秒",
    id = 390
    };
getRow(311003,7)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以尖锐之箭制造风之力，对敌人造成总计(230.6%攻击+410)点伤害，增加自身614点物理攻击力，持续6秒",
    id = 391
    };
getRow(311003,8)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以尖锐之箭制造风之力，对敌人造成总计(240.7%攻击+440)点伤害，增加自身784点物理攻击力，持续6秒",
    id = 392
    };
getRow(311003,9)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以尖锐之箭制造风之力，对敌人造成总计(250.8%攻击+470)点伤害，增加自身977点物理攻击力，持续6秒",
    id = 393
    };
getRow(311003,10)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以尖锐之箭制造风之力，对敌人造成总计(260.9%攻击+500)点伤害，增加自身1296点物理攻击力，持续6秒",
    id = 394
    };
getRow(311003,11)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以尖锐之箭制造风之力，对敌人造成总计(271%攻击+530)点伤害，增加自身1649点物理攻击力，持续6秒",
    id = 395
    };
getRow(311003,12)->
    #player_skills_upgradingCfg {
    skillID = 311003,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以尖锐之箭制造风之力，对敌人造成总计(281.1%攻击+560)点伤害，增加自身2032点物理攻击力，持续6秒",
    id = 396
    };
getRow(311004,1)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人总计(119%攻击+230)点伤害，并在一定时间内持续失血，降低敌人54点物理攻击力，持续5秒",
    id = 397
    };
getRow(311004,2)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人总计(126.1%攻击+260)点伤害，并在一定时间内持续失血，降低敌人84点物理攻击力，持续5秒",
    id = 398
    };
getRow(311004,3)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人总计(133.1%攻击+290)点伤害，并在一定时间内持续失血，降低敌人167点物理攻击力，持续5秒",
    id = 399
    };
getRow(311004,4)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人总计(140.2%攻击+320)点伤害，并在一定时间内持续失血，降低敌人254点物理攻击力，持续5秒",
    id = 400
    };
getRow(311004,5)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人总计(147.3%攻击+350)点伤害，并在一定时间内持续失血，降低敌人337点物理攻击力，持续5秒",
    id = 401
    };
getRow(311004,6)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人总计(154.4%攻击+380)点伤害，并在一定时间内持续失血，降低敌人465点物理攻击力，持续5秒",
    id = 402
    };
getRow(311004,7)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人总计(161.4%攻击+410)点伤害，并在一定时间内持续失血，降低敌人614点物理攻击力，持续5秒",
    id = 403
    };
getRow(311004,8)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人总计(168.5%攻击+440)点伤害，并在一定时间内持续失血，降低敌人784点物理攻击力，持续5秒",
    id = 404
    };
getRow(311004,9)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人总计(175.6%攻击+470)点伤害，并在一定时间内持续失血，降低敌人977点物理攻击力，持续5秒",
    id = 405
    };
getRow(311004,10)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人总计(182.6%攻击+500)点伤害，并在一定时间内持续失血，降低敌人1296点物理攻击力，持续5秒",
    id = 406
    };
getRow(311004,11)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人总计(189.7%攻击+530)点伤害，并在一定时间内持续失血，降低敌人1649点物理攻击力，持续5秒",
    id = 407
    };
getRow(311004,12)->
    #player_skills_upgradingCfg {
    skillID = 311004,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用弓箭，以箭射穿接近的敌人，给予敌人总计(196.8%攻击+560)点伤害，并在一定时间内持续失血，降低敌人2032点物理攻击力，持续5秒",
    id = 408
    };
getRow(311005,1)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 1,
    player_level = 30,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，并造成总计(300%攻击+253)点伤害，有一定的几率降低敌人移动速度，持续5秒",
    id = 409
    };
getRow(311005,2)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 2,
    player_level = 30,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，并造成总计(317.8%攻击+306)点伤害，有一定的几率降低敌人移动速度，持续5秒",
    id = 410
    };
getRow(311005,3)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 3,
    player_level = 31,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，并造成总计(335.6%攻击+359)点伤害，有一定的几率降低敌人移动速度，持续5秒",
    id = 411
    };
getRow(311005,4)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 4,
    player_level = 32,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，并造成总计(353.4%攻击+412)点伤害，有一定的几率降低敌人移动速度，持续5秒",
    id = 412
    };
getRow(311005,5)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 5,
    player_level = 33,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，并造成总计(371.2%攻击+465)点伤害，有一定的几率降低敌人移动速度，持续5秒",
    id = 413
    };
getRow(311005,6)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 6,
    player_level = 34,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，并造成总计(389%攻击+518)点伤害，有一定的几率降低敌人移动速度，持续5秒",
    id = 414
    };
getRow(311005,7)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 7,
    player_level = 35,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，并造成总计(406.8%攻击+571)点伤害，有一定的几率降低敌人移动速度，持续5秒",
    id = 415
    };
getRow(311005,8)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 8,
    player_level = 36,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，并造成总计(424.6%攻击+624)点伤害，有一定的几率降低敌人移动速度，持续5秒",
    id = 416
    };
getRow(311005,9)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 9,
    player_level = 37,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，并造成总计(442.4%攻击+677)点伤害，有一定的几率降低敌人移动速度，持续5秒",
    id = 417
    };
getRow(311005,10)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 10,
    player_level = 38,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，并造成总计(460.2%攻击+730)点伤害，有一定的几率降低敌人移动速度，持续5秒",
    id = 418
    };
getRow(311005,11)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 11,
    player_level = 39,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，并造成总计(478%攻击+783)点伤害，有一定的几率降低敌人移动速度，持续5秒",
    id = 419
    };
getRow(311005,12)->
    #player_skills_upgradingCfg {
    skillID = 311005,
    level = 12,
    player_level = 40,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "用弓箭射击敌人的腿，使其往后退，并造成总计(495.8%攻击+836)点伤害，有一定的几率降低敌人移动速度，持续5秒",
    id = 420
    };
getRow(311006,1)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "在一定范围内，以尖锐之箭穿透所有敌人，造成总计(525%攻击+390)点的强力伤害",
    id = 421
    };
getRow(311006,2)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 2,
    player_level = 20,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "在一定范围内，以尖锐之箭穿透所有敌人，造成总计(556.2%攻击+480)点的强力伤害",
    id = 422
    };
getRow(311006,3)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 3,
    player_level = 20,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "在一定范围内，以尖锐之箭穿透所有敌人，造成总计(587.4%攻击+570)点的强力伤害",
    id = 423
    };
getRow(311006,4)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 4,
    player_level = 20,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "在一定范围内，以尖锐之箭穿透所有敌人，造成总计(618.6%攻击+660)点的强力伤害",
    id = 424
    };
getRow(311006,5)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 5,
    player_level = 22,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "在一定范围内，以尖锐之箭穿透所有敌人，造成总计(649.8%攻击+750)点的强力伤害",
    id = 425
    };
getRow(311006,6)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 6,
    player_level = 24,
    currency = [{1,8300}],
    skillcoin_cost = 1,
    item = [],
    describe = "在一定范围内，以尖锐之箭穿透所有敌人，造成总计(681%攻击+840)点的强力伤害",
    id = 426
    };
getRow(311006,7)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 7,
    player_level = 26,
    currency = [{1,9800}],
    skillcoin_cost = 1,
    item = [],
    describe = "在一定范围内，以尖锐之箭穿透所有敌人，造成总计(712.2%攻击+930)点的强力伤害",
    id = 427
    };
getRow(311006,8)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 8,
    player_level = 28,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "在一定范围内，以尖锐之箭穿透所有敌人，造成总计(743.4%攻击+1020)点的强力伤害",
    id = 428
    };
getRow(311006,9)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 9,
    player_level = 30,
    currency = [{1,13600}],
    skillcoin_cost = 1,
    item = [],
    describe = "在一定范围内，以尖锐之箭穿透所有敌人，造成总计(774.6%攻击+1110)点的强力伤害",
    id = 429
    };
getRow(311006,10)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 10,
    player_level = 33,
    currency = [{1,16500}],
    skillcoin_cost = 1,
    item = [],
    describe = "在一定范围内，以尖锐之箭穿透所有敌人，造成总计(805.8%攻击+1200)点的强力伤害",
    id = 430
    };
getRow(311006,11)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 11,
    player_level = 36,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "在一定范围内，以尖锐之箭穿透所有敌人，造成总计(837%攻击+1290)点的强力伤害",
    id = 431
    };
getRow(311006,12)->
    #player_skills_upgradingCfg {
    skillID = 311006,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "在一定范围内，以尖锐之箭穿透所有敌人，造成总计(868.2%攻击+1380)点的强力伤害",
    id = 432
    };
getRow(311007,1)->
    #player_skills_upgradingCfg {
    skillID = 311007,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "提升队友1.8%移动速度，25%爆伤等级，持续10秒",
    id = 433
    };
getRow(311007,2)->
    #player_skills_upgradingCfg {
    skillID = 311007,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升队友1.9%移动速度，27%爆伤等级，持续10秒",
    id = 434
    };
getRow(311007,3)->
    #player_skills_upgradingCfg {
    skillID = 311007,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升队友2%移动速度，29%爆伤等级，持续10秒",
    id = 435
    };
getRow(311007,4)->
    #player_skills_upgradingCfg {
    skillID = 311007,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升队友2.1%移动速度，31%爆伤等级，持续10秒",
    id = 436
    };
getRow(311007,5)->
    #player_skills_upgradingCfg {
    skillID = 311007,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升队友2.2%移动速度，33%爆伤等级，持续10秒",
    id = 437
    };
getRow(311007,6)->
    #player_skills_upgradingCfg {
    skillID = 311007,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升队友2.3%移动速度，35%爆伤等级，持续10秒",
    id = 438
    };
getRow(311007,7)->
    #player_skills_upgradingCfg {
    skillID = 311007,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升队友2.4%移动速度，37%爆伤等级，持续10秒",
    id = 439
    };
getRow(311007,8)->
    #player_skills_upgradingCfg {
    skillID = 311007,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升队友2.5%移动速度，39%爆伤等级，持续10秒",
    id = 440
    };
getRow(311007,9)->
    #player_skills_upgradingCfg {
    skillID = 311007,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升队友2.6%移动速度，41%爆伤等级，持续10秒",
    id = 441
    };
getRow(311007,10)->
    #player_skills_upgradingCfg {
    skillID = 311007,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升队友2.7%移动速度，43%爆伤等级，持续10秒",
    id = 442
    };
getRow(311007,11)->
    #player_skills_upgradingCfg {
    skillID = 311007,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升队友2.8%移动速度，45%爆伤等级，持续10秒",
    id = 443
    };
getRow(311007,12)->
    #player_skills_upgradingCfg {
    skillID = 311007,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升队友2.9%移动速度，47%爆伤等级，持续10秒",
    id = 444
    };
getRow(311008,1)->
    #player_skills_upgradingCfg {
    skillID = 311008,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "提升附近全体队友16%命中等级，16%闪避等级。持续10秒",
    id = 445
    };
getRow(311008,2)->
    #player_skills_upgradingCfg {
    skillID = 311008,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升附近全体队友16.75%命中等级，16.75%闪避等级。持续10秒",
    id = 446
    };
getRow(311008,3)->
    #player_skills_upgradingCfg {
    skillID = 311008,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升附近全体队友17.5%命中等级，17.5%闪避等级。持续10秒",
    id = 447
    };
getRow(311008,4)->
    #player_skills_upgradingCfg {
    skillID = 311008,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升附近全体队友18.25%命中等级，18.25%闪避等级。持续10秒",
    id = 448
    };
getRow(311008,5)->
    #player_skills_upgradingCfg {
    skillID = 311008,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升附近全体队友19%命中等级，19%闪避等级。持续10秒",
    id = 449
    };
getRow(311008,6)->
    #player_skills_upgradingCfg {
    skillID = 311008,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升附近全体队友19.75%命中等级，19.75%闪避等级。持续10秒",
    id = 450
    };
getRow(311008,7)->
    #player_skills_upgradingCfg {
    skillID = 311008,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升附近全体队友20.5%命中等级，20.5%闪避等级。持续10秒",
    id = 451
    };
getRow(311008,8)->
    #player_skills_upgradingCfg {
    skillID = 311008,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升附近全体队友21.25%命中等级，21.25%闪避等级。持续10秒",
    id = 452
    };
getRow(311008,9)->
    #player_skills_upgradingCfg {
    skillID = 311008,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升附近全体队友22%命中等级，22%闪避等级。持续10秒",
    id = 453
    };
getRow(311008,10)->
    #player_skills_upgradingCfg {
    skillID = 311008,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升附近全体队友22.75%命中等级，22.75%闪避等级。持续10秒",
    id = 454
    };
getRow(311008,11)->
    #player_skills_upgradingCfg {
    skillID = 311008,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升附近全体队友23.5%命中等级，23.5%闪避等级。持续10秒",
    id = 455
    };
getRow(311008,12)->
    #player_skills_upgradingCfg {
    skillID = 311008,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升附近全体队友24.25%命中等级，24.25%闪避等级。持续10秒",
    id = 456
    };
getRow(312000,1)->
    #player_skills_upgradingCfg {
    skillID = 312000,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "#N/A",
    id = 457
    };
getRow(312001,1)->
    #player_skills_upgradingCfg {
    skillID = 312001,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "#N/A",
    id = 458
    };
getRow(312002,1)->
    #player_skills_upgradingCfg {
    skillID = 312002,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "#N/A",
    id = 459
    };
getRow(312003,1)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，给予(126%攻击+232)点伤害，有几率引起失血，增加自身50点暴击等级，持续3秒",
    id = 460
    };
getRow(312003,2)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，给予(133.5%攻击+264)点伤害，有几率引起失血，增加自身85点暴击等级，持续3秒",
    id = 461
    };
getRow(312003,3)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，给予(141%攻击+296)点伤害，有几率引起失血，增加自身140点暴击等级，持续3秒",
    id = 462
    };
getRow(312003,4)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，给予(148.5%攻击+328)点伤害，有几率引起失血，增加自身215点暴击等级，持续3秒",
    id = 463
    };
getRow(312003,5)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，给予(156%攻击+360)点伤害，有几率引起失血，增加自身290点暴击等级，持续3秒",
    id = 464
    };
getRow(312003,6)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，给予(163.5%攻击+392)点伤害，有几率引起失血，增加自身365点暴击等级，持续3秒",
    id = 465
    };
getRow(312003,7)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，给予(170.9%攻击+424)点伤害，有几率引起失血，增加自身440点暴击等级，持续3秒",
    id = 466
    };
getRow(312003,8)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，给予(178.4%攻击+456)点伤害，有几率引起失血，增加自身515点暴击等级，持续3秒",
    id = 467
    };
getRow(312003,9)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，给予(185.9%攻击+488)点伤害，有几率引起失血，增加自身590点暴击等级，持续3秒",
    id = 468
    };
getRow(312003,10)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，给予(193.4%攻击+520)点伤害，有几率引起失血，增加自身665点暴击等级，持续3秒",
    id = 469
    };
getRow(312003,11)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，给予(200.9%攻击+552)点伤害，有几率引起失血，增加自身740点暴击等级，持续3秒",
    id = 470
    };
getRow(312003,12)->
    #player_skills_upgradingCfg {
    skillID = 312003,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，快速接近阻挡的敌人，给予(208.4%攻击+584)点伤害，有几率引起失血，增加自身815点暴击等级，持续3秒",
    id = 471
    };
getRow(312004,1)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(220%攻击+239)点打击伤害，降低敌人54点魔法攻击力，持续5秒。",
    id = 472
    };
getRow(312004,2)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(233.1%攻击+278)点打击伤害，降低敌人84点魔法攻击力，持续5秒。",
    id = 473
    };
getRow(312004,3)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(246.2%攻击+317)点打击伤害，降低敌人167点魔法攻击力，持续5秒。",
    id = 474
    };
getRow(312004,4)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(259.3%攻击+356)点打击伤害，降低敌人254点魔法攻击力，持续5秒。",
    id = 475
    };
getRow(312004,5)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(272.4%攻击+395)点打击伤害，降低敌人337点魔法攻击力，持续5秒。",
    id = 476
    };
getRow(312004,6)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(285.5%攻击+434)点打击伤害，降低敌人465点魔法攻击力，持续5秒。",
    id = 477
    };
getRow(312004,7)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(298.6%攻击+473)点打击伤害，降低敌人614点魔法攻击力，持续5秒。",
    id = 478
    };
getRow(312004,8)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(311.7%攻击+512)点打击伤害，降低敌人784点魔法攻击力，持续5秒。",
    id = 479
    };
getRow(312004,9)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(324.8%攻击+551)点打击伤害，降低敌人977点魔法攻击力，持续5秒。",
    id = 480
    };
getRow(312004,10)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(337.9%攻击+590)点打击伤害，降低敌人1296点魔法攻击力，持续5秒。",
    id = 481
    };
getRow(312004,11)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(351%攻击+629)点打击伤害，降低敌人1649点魔法攻击力，持续5秒。",
    id = 482
    };
getRow(312004,12)->
    #player_skills_upgradingCfg {
    skillID = 312004,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(364.1%攻击+668)点打击伤害，降低敌人2032点魔法攻击力，持续5秒。",
    id = 483
    };
getRow(312005,1)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 1,
    player_level = 30,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，造成总计(200%攻击+234)点伤害",
    id = 484
    };
getRow(312005,2)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 2,
    player_level = 30,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，造成总计(211.8%攻击+268)点伤害",
    id = 485
    };
getRow(312005,3)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 3,
    player_level = 31,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，造成总计(223.6%攻击+302)点伤害",
    id = 486
    };
getRow(312005,4)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 4,
    player_level = 32,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，造成总计(235.4%攻击+336)点伤害",
    id = 487
    };
getRow(312005,5)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 5,
    player_level = 33,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，造成总计(247.2%攻击+370)点伤害",
    id = 488
    };
getRow(312005,6)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 6,
    player_level = 34,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，造成总计(259%攻击+404)点伤害",
    id = 489
    };
getRow(312005,7)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 7,
    player_level = 35,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，造成总计(270.8%攻击+438)点伤害",
    id = 490
    };
getRow(312005,8)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 8,
    player_level = 36,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，造成总计(282.6%攻击+472)点伤害",
    id = 491
    };
getRow(312005,9)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 9,
    player_level = 37,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，造成总计(294.4%攻击+506)点伤害",
    id = 492
    };
getRow(312005,10)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 10,
    player_level = 38,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，造成总计(306.2%攻击+540)点伤害",
    id = 493
    };
getRow(312005,11)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 11,
    player_level = 39,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，造成总计(318%攻击+574)点伤害",
    id = 494
    };
getRow(312005,12)->
    #player_skills_upgradingCfg {
    skillID = 312005,
    level = 12,
    player_level = 40,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，以强力突刺攻击敌人，造成总计(329.8%攻击+608)点伤害",
    id = 495
    };
getRow(312006,1)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量给予15米范围内所有敌人(350%攻击+260)点伤害，并有一定的几率引起失血。持续3秒",
    id = 496
    };
getRow(312006,2)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 2,
    player_level = 20,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量给予15米范围内所有敌人(371%攻击+320)点伤害，并有一定的几率引起失血。持续3秒",
    id = 497
    };
getRow(312006,3)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 3,
    player_level = 20,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量给予15米范围内所有敌人(392%攻击+380)点伤害，并有一定的几率引起失血。持续3秒",
    id = 498
    };
getRow(312006,4)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 4,
    player_level = 20,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量给予15米范围内所有敌人(413%攻击+440)点伤害，并有一定的几率引起失血。持续3秒",
    id = 499
    };
getRow(312006,5)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 5,
    player_level = 22,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量给予15米范围内所有敌人(434%攻击+500)点伤害，并有一定的几率引起失血。持续3秒",
    id = 500
    };
getRow(312006,6)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 6,
    player_level = 24,
    currency = [{1,8300}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量给予15米范围内所有敌人(455%攻击+560)点伤害，并有一定的几率引起失血。持续3秒",
    id = 501
    };
getRow(312006,7)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 7,
    player_level = 26,
    currency = [{1,9800}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量给予15米范围内所有敌人(476%攻击+620)点伤害，并有一定的几率引起失血。持续3秒",
    id = 502
    };
getRow(312006,8)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 8,
    player_level = 28,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量给予15米范围内所有敌人(497%攻击+680)点伤害，并有一定的几率引起失血。持续3秒",
    id = 503
    };
getRow(312006,9)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 9,
    player_level = 30,
    currency = [{1,13600}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量给予15米范围内所有敌人(518%攻击+740)点伤害，并有一定的几率引起失血。持续3秒",
    id = 504
    };
getRow(312006,10)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 10,
    player_level = 33,
    currency = [{1,16500}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量给予15米范围内所有敌人(539%攻击+800)点伤害，并有一定的几率引起失血。持续3秒",
    id = 505
    };
getRow(312006,11)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 11,
    player_level = 36,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量给予15米范围内所有敌人(560%攻击+860)点伤害，并有一定的几率引起失血。持续3秒",
    id = 506
    };
getRow(312006,12)->
    #player_skills_upgradingCfg {
    skillID = 312006,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "使用匕首，用能将风刺穿的力量给予15米范围内所有敌人(581%攻击+920)点伤害，并有一定的几率引起失血。持续3秒",
    id = 507
    };
getRow(312007,1)->
    #player_skills_upgradingCfg {
    skillID = 312007,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身16点闪避等级，16命中等级，持续13秒",
    id = 508
    };
getRow(312007,2)->
    #player_skills_upgradingCfg {
    skillID = 312007,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身16.75点闪避等级，16.75命中等级，持续13秒",
    id = 509
    };
getRow(312007,3)->
    #player_skills_upgradingCfg {
    skillID = 312007,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身17.5点闪避等级，17.5命中等级，持续13秒",
    id = 510
    };
getRow(312007,4)->
    #player_skills_upgradingCfg {
    skillID = 312007,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身18.25点闪避等级，18.25命中等级，持续13秒",
    id = 511
    };
getRow(312007,5)->
    #player_skills_upgradingCfg {
    skillID = 312007,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身19点闪避等级，19命中等级，持续13秒",
    id = 512
    };
getRow(312007,6)->
    #player_skills_upgradingCfg {
    skillID = 312007,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身19.75点闪避等级，19.75命中等级，持续13秒",
    id = 513
    };
getRow(312007,7)->
    #player_skills_upgradingCfg {
    skillID = 312007,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身20.5点闪避等级，20.5命中等级，持续13秒",
    id = 514
    };
getRow(312007,8)->
    #player_skills_upgradingCfg {
    skillID = 312007,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身21.25点闪避等级，21.25命中等级，持续13秒",
    id = 515
    };
getRow(312007,9)->
    #player_skills_upgradingCfg {
    skillID = 312007,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身22点闪避等级，22命中等级，持续13秒",
    id = 516
    };
getRow(312007,10)->
    #player_skills_upgradingCfg {
    skillID = 312007,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身22.75点闪避等级，22.75命中等级，持续13秒",
    id = 517
    };
getRow(312007,11)->
    #player_skills_upgradingCfg {
    skillID = 312007,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身23.5点闪避等级，23.5命中等级，持续13秒",
    id = 518
    };
getRow(312007,12)->
    #player_skills_upgradingCfg {
    skillID = 312007,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身24.25点闪避等级，24.25命中等级，持续13秒",
    id = 519
    };
getRow(312008,1)->
    #player_skills_upgradingCfg {
    skillID = 312008,
    level = 1,
    player_level = 20,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身16%暴击等级，54%物理攻击力，持续13秒",
    id = 520
    };
getRow(312008,2)->
    #player_skills_upgradingCfg {
    skillID = 312008,
    level = 2,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身16.75%暴击等级，84%物理攻击力，持续13秒",
    id = 521
    };
getRow(312008,3)->
    #player_skills_upgradingCfg {
    skillID = 312008,
    level = 3,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身17.5%暴击等级，167%物理攻击力，持续13秒",
    id = 522
    };
getRow(312008,4)->
    #player_skills_upgradingCfg {
    skillID = 312008,
    level = 4,
    player_level = 20,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身18.25%暴击等级，254%物理攻击力，持续13秒",
    id = 523
    };
getRow(312008,5)->
    #player_skills_upgradingCfg {
    skillID = 312008,
    level = 5,
    player_level = 22,
    currency = [{1,2900}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身19%暴击等级，337%物理攻击力，持续13秒",
    id = 524
    };
getRow(312008,6)->
    #player_skills_upgradingCfg {
    skillID = 312008,
    level = 6,
    player_level = 24,
    currency = [{1,3600}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身19.75%暴击等级，465%物理攻击力，持续13秒",
    id = 525
    };
getRow(312008,7)->
    #player_skills_upgradingCfg {
    skillID = 312008,
    level = 7,
    player_level = 26,
    currency = [{1,4800}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身20.5%暴击等级，614%物理攻击力，持续13秒",
    id = 526
    };
getRow(312008,8)->
    #player_skills_upgradingCfg {
    skillID = 312008,
    level = 8,
    player_level = 28,
    currency = [{1,6300}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身21.25%暴击等级，784%物理攻击力，持续13秒",
    id = 527
    };
getRow(312008,9)->
    #player_skills_upgradingCfg {
    skillID = 312008,
    level = 9,
    player_level = 30,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身22%暴击等级，977%物理攻击力，持续13秒",
    id = 528
    };
getRow(312008,10)->
    #player_skills_upgradingCfg {
    skillID = 312008,
    level = 10,
    player_level = 33,
    currency = [{1,8000}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身22.75%暴击等级，1296%物理攻击力，持续13秒",
    id = 529
    };
getRow(312008,11)->
    #player_skills_upgradingCfg {
    skillID = 312008,
    level = 11,
    player_level = 36,
    currency = [{1,11400}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身23.5%暴击等级，1649%物理攻击力，持续13秒",
    id = 530
    };
getRow(312008,12)->
    #player_skills_upgradingCfg {
    skillID = 312008,
    level = 12,
    player_level = 39,
    currency = [{1,20500}],
    skillcoin_cost = 1,
    item = [],
    describe = "提升自身24.25%暴击等级，2032%物理攻击力，持续13秒",
    id = 531
    };
getRow(321000,1)->
    #player_skills_upgradingCfg {
    skillID = 321000,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 910
    };
getRow(321000,2)->
    #player_skills_upgradingCfg {
    skillID = 321000,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 911
    };
getRow(321000,3)->
    #player_skills_upgradingCfg {
    skillID = 321000,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 912
    };
getRow(321000,4)->
    #player_skills_upgradingCfg {
    skillID = 321000,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 913
    };
getRow(321000,5)->
    #player_skills_upgradingCfg {
    skillID = 321000,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 914
    };
getRow(321000,6)->
    #player_skills_upgradingCfg {
    skillID = 321000,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 915
    };
getRow(321000,7)->
    #player_skills_upgradingCfg {
    skillID = 321000,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 916
    };
getRow(321000,8)->
    #player_skills_upgradingCfg {
    skillID = 321000,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 917
    };
getRow(321000,9)->
    #player_skills_upgradingCfg {
    skillID = 321000,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 918
    };
getRow(321001,1)->
    #player_skills_upgradingCfg {
    skillID = 321001,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 919
    };
getRow(321001,2)->
    #player_skills_upgradingCfg {
    skillID = 321001,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 920
    };
getRow(321001,3)->
    #player_skills_upgradingCfg {
    skillID = 321001,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 921
    };
getRow(321001,4)->
    #player_skills_upgradingCfg {
    skillID = 321001,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 922
    };
getRow(321001,5)->
    #player_skills_upgradingCfg {
    skillID = 321001,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 923
    };
getRow(321001,6)->
    #player_skills_upgradingCfg {
    skillID = 321001,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 924
    };
getRow(321001,7)->
    #player_skills_upgradingCfg {
    skillID = 321001,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 925
    };
getRow(321001,8)->
    #player_skills_upgradingCfg {
    skillID = 321001,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 926
    };
getRow(321001,9)->
    #player_skills_upgradingCfg {
    skillID = 321001,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 927
    };
getRow(321002,1)->
    #player_skills_upgradingCfg {
    skillID = 321002,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 928
    };
getRow(321002,2)->
    #player_skills_upgradingCfg {
    skillID = 321002,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 929
    };
getRow(321002,3)->
    #player_skills_upgradingCfg {
    skillID = 321002,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 930
    };
getRow(321002,4)->
    #player_skills_upgradingCfg {
    skillID = 321002,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 931
    };
getRow(321002,5)->
    #player_skills_upgradingCfg {
    skillID = 321002,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 932
    };
getRow(321002,6)->
    #player_skills_upgradingCfg {
    skillID = 321002,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 933
    };
getRow(321002,7)->
    #player_skills_upgradingCfg {
    skillID = 321002,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 934
    };
getRow(321002,8)->
    #player_skills_upgradingCfg {
    skillID = 321002,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 935
    };
getRow(321002,9)->
    #player_skills_upgradingCfg {
    skillID = 321002,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 936
    };
getRow(321003,1)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "#N/A",
    id = 937
    };
getRow(321003,2)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "#N/A",
    id = 938
    };
getRow(321003,3)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "#N/A",
    id = 939
    };
getRow(321003,4)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "#N/A",
    id = 940
    };
getRow(321003,5)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "#N/A",
    id = 941
    };
getRow(321003,6)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "#N/A",
    id = 942
    };
getRow(321003,7)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "#N/A",
    id = 943
    };
getRow(321003,8)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "#N/A",
    id = 944
    };
getRow(321003,9)->
    #player_skills_upgradingCfg {
    skillID = 321003,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "#N/A",
    id = 945
    };
getRow(321004,1)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 946
    };
getRow(321004,2)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 947
    };
getRow(321004,3)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 948
    };
getRow(321004,4)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 949
    };
getRow(321004,5)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 950
    };
getRow(321004,6)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 951
    };
getRow(321004,7)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 952
    };
getRow(321004,8)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 953
    };
getRow(321004,9)->
    #player_skills_upgradingCfg {
    skillID = 321004,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 954
    };
getRow(321005,1)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 955
    };
getRow(321005,2)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 956
    };
getRow(321005,3)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 957
    };
getRow(321005,4)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 958
    };
getRow(321005,5)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 959
    };
getRow(321005,6)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 960
    };
getRow(321005,7)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 961
    };
getRow(321005,8)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 962
    };
getRow(321005,9)->
    #player_skills_upgradingCfg {
    skillID = 321005,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 963
    };
getRow(321006,1)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 964
    };
getRow(321006,2)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 965
    };
getRow(321006,3)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 966
    };
getRow(321006,4)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 967
    };
getRow(321006,5)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 968
    };
getRow(321006,6)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 969
    };
getRow(321006,7)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 970
    };
getRow(321006,8)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 971
    };
getRow(321006,9)->
    #player_skills_upgradingCfg {
    skillID = 321006,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 972
    };
getRow(322000,1)->
    #player_skills_upgradingCfg {
    skillID = 322000,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 973
    };
getRow(322000,2)->
    #player_skills_upgradingCfg {
    skillID = 322000,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 974
    };
getRow(322000,3)->
    #player_skills_upgradingCfg {
    skillID = 322000,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 975
    };
getRow(322000,4)->
    #player_skills_upgradingCfg {
    skillID = 322000,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 976
    };
getRow(322000,5)->
    #player_skills_upgradingCfg {
    skillID = 322000,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 977
    };
getRow(322000,6)->
    #player_skills_upgradingCfg {
    skillID = 322000,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 978
    };
getRow(322000,7)->
    #player_skills_upgradingCfg {
    skillID = 322000,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 979
    };
getRow(322000,8)->
    #player_skills_upgradingCfg {
    skillID = 322000,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 980
    };
getRow(322000,9)->
    #player_skills_upgradingCfg {
    skillID = 322000,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 981
    };
getRow(322001,1)->
    #player_skills_upgradingCfg {
    skillID = 322001,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 982
    };
getRow(322001,2)->
    #player_skills_upgradingCfg {
    skillID = 322001,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 983
    };
getRow(322001,3)->
    #player_skills_upgradingCfg {
    skillID = 322001,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 984
    };
getRow(322001,4)->
    #player_skills_upgradingCfg {
    skillID = 322001,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 985
    };
getRow(322001,5)->
    #player_skills_upgradingCfg {
    skillID = 322001,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 986
    };
getRow(322001,6)->
    #player_skills_upgradingCfg {
    skillID = 322001,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 987
    };
getRow(322001,7)->
    #player_skills_upgradingCfg {
    skillID = 322001,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 988
    };
getRow(322001,8)->
    #player_skills_upgradingCfg {
    skillID = 322001,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 989
    };
getRow(322001,9)->
    #player_skills_upgradingCfg {
    skillID = 322001,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 990
    };
getRow(322002,1)->
    #player_skills_upgradingCfg {
    skillID = 322002,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 991
    };
getRow(322002,2)->
    #player_skills_upgradingCfg {
    skillID = 322002,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 992
    };
getRow(322002,3)->
    #player_skills_upgradingCfg {
    skillID = 322002,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 993
    };
getRow(322002,4)->
    #player_skills_upgradingCfg {
    skillID = 322002,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 994
    };
getRow(322002,5)->
    #player_skills_upgradingCfg {
    skillID = 322002,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 995
    };
getRow(322002,6)->
    #player_skills_upgradingCfg {
    skillID = 322002,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 996
    };
getRow(322002,7)->
    #player_skills_upgradingCfg {
    skillID = 322002,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 997
    };
getRow(322002,8)->
    #player_skills_upgradingCfg {
    skillID = 322002,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 998
    };
getRow(322002,9)->
    #player_skills_upgradingCfg {
    skillID = 322002,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 999
    };
getRow(322003,1)->
    #player_skills_upgradingCfg {
    skillID = 322003,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "引诱做为目标的特定敌人，并给予敌人打击伤害(0%攻击+1)点",
    id = 1000
    };
getRow(322003,2)->
    #player_skills_upgradingCfg {
    skillID = 322003,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "引诱做为目标的特定敌人，并给予敌人打击伤害(0%攻击+1)点",
    id = 1001
    };
getRow(322003,3)->
    #player_skills_upgradingCfg {
    skillID = 322003,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "引诱做为目标的特定敌人，并给予敌人打击伤害(0%攻击+1)点",
    id = 1002
    };
getRow(322003,4)->
    #player_skills_upgradingCfg {
    skillID = 322003,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "引诱做为目标的特定敌人，并给予敌人打击伤害(0%攻击+1)点",
    id = 1003
    };
getRow(322003,5)->
    #player_skills_upgradingCfg {
    skillID = 322003,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "引诱做为目标的特定敌人，并给予敌人打击伤害(0%攻击+1)点",
    id = 1004
    };
getRow(322003,6)->
    #player_skills_upgradingCfg {
    skillID = 322003,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "引诱做为目标的特定敌人，并给予敌人打击伤害(0%攻击+1)点",
    id = 1005
    };
getRow(322003,7)->
    #player_skills_upgradingCfg {
    skillID = 322003,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "引诱做为目标的特定敌人，并给予敌人打击伤害(0%攻击+1)点",
    id = 1006
    };
getRow(322003,8)->
    #player_skills_upgradingCfg {
    skillID = 322003,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "引诱做为目标的特定敌人，并给予敌人打击伤害(0%攻击+1)点",
    id = 1007
    };
getRow(322003,9)->
    #player_skills_upgradingCfg {
    skillID = 322003,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "引诱做为目标的特定敌人，并给予敌人打击伤害(0%攻击+1)点",
    id = 1008
    };
getRow(322004,1)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 1009
    };
getRow(322004,2)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 1010
    };
getRow(322004,3)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 1011
    };
getRow(322004,4)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 1012
    };
getRow(322004,5)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 1013
    };
getRow(322004,6)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 1014
    };
getRow(322004,7)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 1015
    };
getRow(322004,8)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 1016
    };
getRow(322004,9)->
    #player_skills_upgradingCfg {
    skillID = 322004,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 1017
    };
getRow(322005,1)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1018
    };
getRow(322005,2)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1019
    };
getRow(322005,3)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1020
    };
getRow(322005,4)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1021
    };
getRow(322005,5)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1022
    };
getRow(322005,6)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1023
    };
getRow(322005,7)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1024
    };
getRow(322005,8)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1025
    };
getRow(322005,9)->
    #player_skills_upgradingCfg {
    skillID = 322005,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1026
    };
getRow(322006,1)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1027
    };
getRow(322006,2)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1028
    };
getRow(322006,3)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1029
    };
getRow(322006,4)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1030
    };
getRow(322006,5)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1031
    };
getRow(322006,6)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1032
    };
getRow(322006,7)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1033
    };
getRow(322006,8)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1034
    };
getRow(322006,9)->
    #player_skills_upgradingCfg {
    skillID = 322006,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1035
    };
getRow(323000,1)->
    #player_skills_upgradingCfg {
    skillID = 323000,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 1036
    };
getRow(323000,2)->
    #player_skills_upgradingCfg {
    skillID = 323000,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 1037
    };
getRow(323000,3)->
    #player_skills_upgradingCfg {
    skillID = 323000,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 1038
    };
getRow(323000,4)->
    #player_skills_upgradingCfg {
    skillID = 323000,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 1039
    };
getRow(323000,5)->
    #player_skills_upgradingCfg {
    skillID = 323000,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 1040
    };
getRow(323000,6)->
    #player_skills_upgradingCfg {
    skillID = 323000,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 1041
    };
getRow(323000,7)->
    #player_skills_upgradingCfg {
    skillID = 323000,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 1042
    };
getRow(323000,8)->
    #player_skills_upgradingCfg {
    skillID = 323000,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 1043
    };
getRow(323000,9)->
    #player_skills_upgradingCfg {
    skillID = 323000,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻1",
    id = 1044
    };
getRow(323001,1)->
    #player_skills_upgradingCfg {
    skillID = 323001,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 1045
    };
getRow(323001,2)->
    #player_skills_upgradingCfg {
    skillID = 323001,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 1046
    };
getRow(323001,3)->
    #player_skills_upgradingCfg {
    skillID = 323001,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 1047
    };
getRow(323001,4)->
    #player_skills_upgradingCfg {
    skillID = 323001,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 1048
    };
getRow(323001,5)->
    #player_skills_upgradingCfg {
    skillID = 323001,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 1049
    };
getRow(323001,6)->
    #player_skills_upgradingCfg {
    skillID = 323001,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 1050
    };
getRow(323001,7)->
    #player_skills_upgradingCfg {
    skillID = 323001,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 1051
    };
getRow(323001,8)->
    #player_skills_upgradingCfg {
    skillID = 323001,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 1052
    };
getRow(323001,9)->
    #player_skills_upgradingCfg {
    skillID = 323001,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻2",
    id = 1053
    };
getRow(323002,1)->
    #player_skills_upgradingCfg {
    skillID = 323002,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 1054
    };
getRow(323002,2)->
    #player_skills_upgradingCfg {
    skillID = 323002,
    level = 2,
    player_level = 2,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 1055
    };
getRow(323002,3)->
    #player_skills_upgradingCfg {
    skillID = 323002,
    level = 3,
    player_level = 3,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 1056
    };
getRow(323002,4)->
    #player_skills_upgradingCfg {
    skillID = 323002,
    level = 4,
    player_level = 4,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 1057
    };
getRow(323002,5)->
    #player_skills_upgradingCfg {
    skillID = 323002,
    level = 5,
    player_level = 5,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 1058
    };
getRow(323002,6)->
    #player_skills_upgradingCfg {
    skillID = 323002,
    level = 6,
    player_level = 6,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 1059
    };
getRow(323002,7)->
    #player_skills_upgradingCfg {
    skillID = 323002,
    level = 7,
    player_level = 7,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 1060
    };
getRow(323002,8)->
    #player_skills_upgradingCfg {
    skillID = 323002,
    level = 8,
    player_level = 8,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 1061
    };
getRow(323002,9)->
    #player_skills_upgradingCfg {
    skillID = 323002,
    level = 9,
    player_level = 9,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "游侠普攻3",
    id = 1062
    };
getRow(323003,1)->
    #player_skills_upgradingCfg {
    skillID = 323003,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 0,
    item = [],
    describe = "引诱做为目标的特定敌人，并给予敌人打击伤害(0%攻击+1)点",
    id = 1063
    };
getRow(323003,2)->
    #player_skills_upgradingCfg {
    skillID = 323003,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "引诱做为目标的特定敌人，并给予敌人打击伤害(0%攻击+1)点",
    id = 1064
    };
getRow(323003,3)->
    #player_skills_upgradingCfg {
    skillID = 323003,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "引诱做为目标的特定敌人，并给予敌人打击伤害(0%攻击+1)点",
    id = 1065
    };
getRow(323003,4)->
    #player_skills_upgradingCfg {
    skillID = 323003,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "引诱做为目标的特定敌人，并给予敌人打击伤害(0%攻击+1)点",
    id = 1066
    };
getRow(323003,5)->
    #player_skills_upgradingCfg {
    skillID = 323003,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "引诱做为目标的特定敌人，并给予敌人打击伤害(0%攻击+1)点",
    id = 1067
    };
getRow(323003,6)->
    #player_skills_upgradingCfg {
    skillID = 323003,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "引诱做为目标的特定敌人，并给予敌人打击伤害(0%攻击+1)点",
    id = 1068
    };
getRow(323003,7)->
    #player_skills_upgradingCfg {
    skillID = 323003,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "引诱做为目标的特定敌人，并给予敌人打击伤害(0%攻击+1)点",
    id = 1069
    };
getRow(323003,8)->
    #player_skills_upgradingCfg {
    skillID = 323003,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "引诱做为目标的特定敌人，并给予敌人打击伤害(0%攻击+1)点",
    id = 1070
    };
getRow(323003,9)->
    #player_skills_upgradingCfg {
    skillID = 323003,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "引诱做为目标的特定敌人，并给予敌人打击伤害(0%攻击+1)点",
    id = 1071
    };
getRow(323004,1)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 1072
    };
getRow(323004,2)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 1073
    };
getRow(323004,3)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 1074
    };
getRow(323004,4)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 1075
    };
getRow(323004,5)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 1076
    };
getRow(323004,6)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 1077
    };
getRow(323004,7)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 1078
    };
getRow(323004,8)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 1079
    };
getRow(323004,9)->
    #player_skills_upgradingCfg {
    skillID = 323004,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "快速砍击邻近的敌人，给予打击伤害(0%攻击+1)点，有一定机率会引起失血，在效果时间内，会持续总计受到失血伤害(0%攻击+1)点",
    id = 1080
    };
getRow(323005,1)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1081
    };
getRow(323005,2)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1082
    };
getRow(323005,3)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1083
    };
getRow(323005,4)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1084
    };
getRow(323005,5)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1085
    };
getRow(323005,6)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1086
    };
getRow(323005,7)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1087
    };
getRow(323005,8)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1088
    };
getRow(323005,9)->
    #player_skills_upgradingCfg {
    skillID = 323005,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "用强力的刺击，让敌人总计受到(0%攻击+1)点打击伤害。",
    id = 1089
    };
getRow(323006,1)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 1,
    player_level = 1,
    currency = [],
    skillcoin_cost = 1,
    item = [],
    describe = "#N/A",
    id = 1090
    };
getRow(323006,2)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 2,
    player_level = 2,
    currency = [{1,400}],
    skillcoin_cost = 1,
    item = [],
    describe = "#N/A",
    id = 1091
    };
getRow(323006,3)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 3,
    player_level = 3,
    currency = [{1,600}],
    skillcoin_cost = 1,
    item = [],
    describe = "#N/A",
    id = 1092
    };
getRow(323006,4)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 4,
    player_level = 4,
    currency = [{1,900}],
    skillcoin_cost = 1,
    item = [],
    describe = "#N/A",
    id = 1093
    };
getRow(323006,5)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 5,
    player_level = 5,
    currency = [{1,1100}],
    skillcoin_cost = 1,
    item = [],
    describe = "#N/A",
    id = 1094
    };
getRow(323006,6)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 6,
    player_level = 6,
    currency = [{1,1400}],
    skillcoin_cost = 1,
    item = [],
    describe = "#N/A",
    id = 1095
    };
getRow(323006,7)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 7,
    player_level = 7,
    currency = [{1,1800}],
    skillcoin_cost = 1,
    item = [],
    describe = "#N/A",
    id = 1096
    };
getRow(323006,8)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 8,
    player_level = 8,
    currency = [{1,2100}],
    skillcoin_cost = 1,
    item = [],
    describe = "#N/A",
    id = 1097
    };
getRow(323006,9)->
    #player_skills_upgradingCfg {
    skillID = 323006,
    level = 9,
    player_level = 9,
    currency = [{1,2600}],
    skillcoin_cost = 1,
    item = [],
    describe = "#N/A",
    id = 1098
    };
getRow(_,_)->[].

getKeyList()->[
    {101000,1},
    {101001,1},
    {101002,1},
    {101003,1},
    {101003,2},
    {101003,3},
    {101003,4},
    {101003,5},
    {101003,6},
    {101004,1},
    {101004,2},
    {101004,3},
    {101004,4},
    {101004,5},
    {101004,6},
    {101005,1},
    {101005,2},
    {101005,3},
    {101005,4},
    {101005,5},
    {101005,6},
    {101006,1},
    {101006,2},
    {101006,3},
    {101006,4},
    {101006,5},
    {101006,6},
    {111000,1},
    {111001,1},
    {111002,1},
    {111003,1},
    {111003,2},
    {111003,3},
    {111003,4},
    {111003,5},
    {111003,6},
    {111003,7},
    {111003,8},
    {111003,9},
    {111003,10},
    {111003,11},
    {111003,12},
    {111004,1},
    {111004,2},
    {111004,3},
    {111004,4},
    {111004,5},
    {111004,6},
    {111004,7},
    {111004,8},
    {111004,9},
    {111004,10},
    {111004,11},
    {111004,12},
    {111005,1},
    {111005,2},
    {111005,3},
    {111005,4},
    {111005,5},
    {111005,6},
    {111005,7},
    {111005,8},
    {111005,9},
    {111005,10},
    {111005,11},
    {111005,12},
    {111006,1},
    {111006,2},
    {111006,3},
    {111006,4},
    {111006,5},
    {111006,6},
    {111006,7},
    {111006,8},
    {111006,9},
    {111006,10},
    {111006,11},
    {111006,12},
    {111007,1},
    {111007,2},
    {111007,3},
    {111007,4},
    {111007,5},
    {111007,6},
    {111007,7},
    {111007,8},
    {111007,9},
    {111007,10},
    {111007,11},
    {111007,12},
    {111008,1},
    {111008,2},
    {111008,3},
    {111008,4},
    {111008,5},
    {111008,6},
    {111008,7},
    {111008,8},
    {111008,9},
    {111008,10},
    {111008,11},
    {111008,12},
    {112000,1},
    {112001,1},
    {112002,1},
    {112003,1},
    {112003,2},
    {112003,3},
    {112003,4},
    {112003,5},
    {112003,6},
    {112003,7},
    {112003,8},
    {112003,9},
    {112003,10},
    {112003,11},
    {112003,12},
    {112004,1},
    {112004,2},
    {112004,3},
    {112004,4},
    {112004,5},
    {112004,6},
    {112004,7},
    {112004,8},
    {112004,9},
    {112004,10},
    {112004,11},
    {112004,12},
    {112005,1},
    {112005,2},
    {112005,3},
    {112005,4},
    {112005,5},
    {112005,6},
    {112005,7},
    {112005,8},
    {112005,9},
    {112005,10},
    {112005,11},
    {112005,12},
    {112006,1},
    {112006,2},
    {112006,3},
    {112006,4},
    {112006,5},
    {112006,6},
    {112006,7},
    {112006,8},
    {112006,9},
    {112006,10},
    {112006,11},
    {112006,12},
    {112007,1},
    {112007,2},
    {112007,3},
    {112007,4},
    {112007,5},
    {112007,6},
    {112007,7},
    {112007,8},
    {112007,9},
    {112007,10},
    {112007,11},
    {112007,12},
    {112008,1},
    {112008,2},
    {112008,3},
    {112008,4},
    {112008,5},
    {112008,6},
    {112008,7},
    {112008,8},
    {112008,9},
    {112008,10},
    {112008,11},
    {112008,12},
    {121000,1},
    {121000,2},
    {121000,3},
    {121000,4},
    {121000,5},
    {121000,6},
    {121000,7},
    {121000,8},
    {121000,9},
    {121001,1},
    {121001,2},
    {121001,3},
    {121001,4},
    {121001,5},
    {121001,6},
    {121001,7},
    {121001,8},
    {121001,9},
    {121002,1},
    {121002,2},
    {121002,3},
    {121002,4},
    {121002,5},
    {121002,6},
    {121002,7},
    {121002,8},
    {121002,9},
    {121003,1},
    {121003,2},
    {121003,3},
    {121003,4},
    {121003,5},
    {121003,6},
    {121003,7},
    {121003,8},
    {121003,9},
    {121004,1},
    {121004,2},
    {121004,3},
    {121004,4},
    {121004,5},
    {121004,6},
    {121004,7},
    {121004,8},
    {121004,9},
    {121005,1},
    {121005,2},
    {121005,3},
    {121005,4},
    {121005,5},
    {121005,6},
    {121005,7},
    {121005,8},
    {121005,9},
    {121006,1},
    {121006,2},
    {121006,3},
    {121006,4},
    {121006,5},
    {121006,6},
    {121006,7},
    {121006,8},
    {121006,9},
    {122000,1},
    {122000,2},
    {122000,3},
    {122000,4},
    {122000,5},
    {122000,6},
    {122000,7},
    {122000,8},
    {122000,9},
    {122001,1},
    {122001,2},
    {122001,3},
    {122001,4},
    {122001,5},
    {122001,6},
    {122001,7},
    {122001,8},
    {122001,9},
    {122002,1},
    {122002,2},
    {122002,3},
    {122002,4},
    {122002,5},
    {122002,6},
    {122002,7},
    {122002,8},
    {122002,9},
    {122003,1},
    {122003,2},
    {122003,3},
    {122003,4},
    {122003,5},
    {122003,6},
    {122003,7},
    {122003,8},
    {122003,9},
    {122004,1},
    {122004,2},
    {122004,3},
    {122004,4},
    {122004,5},
    {122004,6},
    {122004,7},
    {122004,8},
    {122004,9},
    {122005,1},
    {122005,2},
    {122005,3},
    {122005,4},
    {122005,5},
    {122005,6},
    {122005,7},
    {122005,8},
    {122005,9},
    {122006,1},
    {122006,2},
    {122006,3},
    {122006,4},
    {122006,5},
    {122006,6},
    {122006,7},
    {122006,8},
    {122006,9},
    {123000,1},
    {123000,2},
    {123000,3},
    {123000,4},
    {123000,5},
    {123000,6},
    {123000,7},
    {123000,8},
    {123000,9},
    {123001,1},
    {123001,2},
    {123001,3},
    {123001,4},
    {123001,5},
    {123001,6},
    {123001,7},
    {123001,8},
    {123001,9},
    {123002,1},
    {123002,2},
    {123002,3},
    {123002,4},
    {123002,5},
    {123002,6},
    {123002,7},
    {123002,8},
    {123002,9},
    {123003,1},
    {123003,2},
    {123003,3},
    {123003,4},
    {123003,5},
    {123003,6},
    {123003,7},
    {123003,8},
    {123003,9},
    {123004,1},
    {123004,2},
    {123004,3},
    {123004,4},
    {123004,5},
    {123004,6},
    {123004,7},
    {123004,8},
    {123004,9},
    {123005,1},
    {123005,2},
    {123005,3},
    {123005,4},
    {123005,5},
    {123005,6},
    {123005,7},
    {123005,8},
    {123005,9},
    {123006,1},
    {123006,2},
    {123006,3},
    {123006,4},
    {123006,5},
    {123006,6},
    {123006,7},
    {123006,8},
    {123006,9},
    {201000,1},
    {201001,1},
    {201002,1},
    {201003,1},
    {201003,2},
    {201003,3},
    {201003,4},
    {201003,5},
    {201003,6},
    {201004,1},
    {201004,2},
    {201004,3},
    {201004,4},
    {201004,5},
    {201004,6},
    {201005,1},
    {201005,2},
    {201005,3},
    {201005,4},
    {201005,5},
    {201005,6},
    {201006,1},
    {201006,2},
    {201006,3},
    {201006,4},
    {201006,5},
    {201006,6},
    {211000,1},
    {211001,1},
    {211002,1},
    {211003,1},
    {211003,2},
    {211003,3},
    {211003,4},
    {211003,5},
    {211003,6},
    {211003,7},
    {211003,8},
    {211003,9},
    {211003,10},
    {211003,11},
    {211003,12},
    {211004,1},
    {211004,2},
    {211004,3},
    {211004,4},
    {211004,5},
    {211004,6},
    {211004,7},
    {211004,8},
    {211004,9},
    {211004,10},
    {211004,11},
    {211004,12},
    {211005,1},
    {211005,2},
    {211005,3},
    {211005,4},
    {211005,5},
    {211005,6},
    {211005,7},
    {211005,8},
    {211005,9},
    {211005,10},
    {211005,11},
    {211005,12},
    {211006,1},
    {211006,2},
    {211006,3},
    {211006,4},
    {211006,5},
    {211006,6},
    {211006,7},
    {211006,8},
    {211006,9},
    {211006,10},
    {211006,11},
    {211006,12},
    {211007,1},
    {211007,2},
    {211007,3},
    {211007,4},
    {211007,5},
    {211007,6},
    {211007,7},
    {211007,8},
    {211007,9},
    {211007,10},
    {211007,11},
    {211007,12},
    {211008,1},
    {211008,2},
    {211008,3},
    {211008,4},
    {211008,5},
    {211008,6},
    {211008,7},
    {211008,8},
    {211008,9},
    {211008,10},
    {211008,11},
    {211008,12},
    {212000,1},
    {212001,1},
    {212002,1},
    {212003,1},
    {212003,2},
    {212003,3},
    {212003,4},
    {212003,5},
    {212003,6},
    {212003,7},
    {212003,8},
    {212003,9},
    {212003,10},
    {212003,11},
    {212003,12},
    {212004,1},
    {212004,2},
    {212004,3},
    {212004,4},
    {212004,5},
    {212004,6},
    {212004,7},
    {212004,8},
    {212004,9},
    {212004,10},
    {212004,11},
    {212004,12},
    {212005,1},
    {212005,2},
    {212005,3},
    {212005,4},
    {212005,5},
    {212005,6},
    {212005,7},
    {212005,8},
    {212005,9},
    {212005,10},
    {212005,11},
    {212005,12},
    {212006,1},
    {212006,2},
    {212006,3},
    {212006,4},
    {212006,5},
    {212006,6},
    {212006,7},
    {212006,8},
    {212006,9},
    {212006,10},
    {212006,11},
    {212006,12},
    {212007,1},
    {212007,2},
    {212007,3},
    {212007,4},
    {212007,5},
    {212007,6},
    {212007,7},
    {212007,8},
    {212007,9},
    {212007,10},
    {212007,11},
    {212007,12},
    {212008,1},
    {212008,2},
    {212008,3},
    {212008,4},
    {212008,5},
    {212008,6},
    {212008,7},
    {212008,8},
    {212008,9},
    {212008,10},
    {212008,11},
    {212008,12},
    {221000,1},
    {221000,2},
    {221000,3},
    {221000,4},
    {221000,5},
    {221000,6},
    {221000,7},
    {221000,8},
    {221000,9},
    {221001,1},
    {221001,2},
    {221001,3},
    {221001,4},
    {221001,5},
    {221001,6},
    {221001,7},
    {221001,8},
    {221001,9},
    {221002,1},
    {221002,2},
    {221002,3},
    {221002,4},
    {221002,5},
    {221002,6},
    {221002,7},
    {221002,8},
    {221002,9},
    {221003,1},
    {221003,2},
    {221003,3},
    {221003,4},
    {221003,5},
    {221003,6},
    {221003,7},
    {221003,8},
    {221003,9},
    {221004,1},
    {221004,2},
    {221004,3},
    {221004,4},
    {221004,5},
    {221004,6},
    {221004,7},
    {221004,8},
    {221004,9},
    {221005,1},
    {221005,2},
    {221005,3},
    {221005,4},
    {221005,5},
    {221005,6},
    {221005,7},
    {221005,8},
    {221005,9},
    {221006,1},
    {221006,2},
    {221006,3},
    {221006,4},
    {221006,5},
    {221006,6},
    {221006,7},
    {221006,8},
    {221006,9},
    {222000,1},
    {222000,2},
    {222000,3},
    {222000,4},
    {222000,5},
    {222000,6},
    {222000,7},
    {222000,8},
    {222000,9},
    {222001,1},
    {222001,2},
    {222001,3},
    {222001,4},
    {222001,5},
    {222001,6},
    {222001,7},
    {222001,8},
    {222001,9},
    {222002,1},
    {222002,2},
    {222002,3},
    {222002,4},
    {222002,5},
    {222002,6},
    {222002,7},
    {222002,8},
    {222002,9},
    {222003,1},
    {222003,2},
    {222003,3},
    {222003,4},
    {222003,5},
    {222003,6},
    {222003,7},
    {222003,8},
    {222003,9},
    {222004,1},
    {222004,2},
    {222004,3},
    {222004,4},
    {222004,5},
    {222004,6},
    {222004,7},
    {222004,8},
    {222004,9},
    {222005,1},
    {222005,2},
    {222005,3},
    {222005,4},
    {222005,5},
    {222005,6},
    {222005,7},
    {222005,8},
    {222005,9},
    {222006,1},
    {222006,2},
    {222006,3},
    {222006,4},
    {222006,5},
    {222006,6},
    {222006,7},
    {222006,8},
    {222006,9},
    {223000,1},
    {223000,2},
    {223000,3},
    {223000,4},
    {223000,5},
    {223000,6},
    {223000,7},
    {223000,8},
    {223000,9},
    {223001,1},
    {223001,2},
    {223001,3},
    {223001,4},
    {223001,5},
    {223001,6},
    {223001,7},
    {223001,8},
    {223001,9},
    {223002,1},
    {223002,2},
    {223002,3},
    {223002,4},
    {223002,5},
    {223002,6},
    {223002,7},
    {223002,8},
    {223002,9},
    {223003,1},
    {223003,2},
    {223003,3},
    {223003,4},
    {223003,5},
    {223003,6},
    {223003,7},
    {223003,8},
    {223003,9},
    {223004,1},
    {223004,2},
    {223004,3},
    {223004,4},
    {223004,5},
    {223004,6},
    {223004,7},
    {223004,8},
    {223004,9},
    {223005,1},
    {223005,2},
    {223005,3},
    {223005,4},
    {223005,5},
    {223005,6},
    {223005,7},
    {223005,8},
    {223005,9},
    {223006,1},
    {223006,2},
    {223006,3},
    {223006,4},
    {223006,5},
    {223006,6},
    {223006,7},
    {223006,8},
    {223006,9},
    {301000,1},
    {301001,1},
    {301002,1},
    {301003,1},
    {301003,2},
    {301003,3},
    {301003,4},
    {301003,5},
    {301003,6},
    {301004,1},
    {301004,2},
    {301004,3},
    {301004,4},
    {301004,5},
    {301004,6},
    {301005,1},
    {301005,2},
    {301005,3},
    {301005,4},
    {301005,5},
    {301005,6},
    {301006,1},
    {301006,2},
    {301006,3},
    {301006,4},
    {301006,5},
    {301006,6},
    {311000,1},
    {311001,1},
    {311002,1},
    {311003,1},
    {311003,2},
    {311003,3},
    {311003,4},
    {311003,5},
    {311003,6},
    {311003,7},
    {311003,8},
    {311003,9},
    {311003,10},
    {311003,11},
    {311003,12},
    {311004,1},
    {311004,2},
    {311004,3},
    {311004,4},
    {311004,5},
    {311004,6},
    {311004,7},
    {311004,8},
    {311004,9},
    {311004,10},
    {311004,11},
    {311004,12},
    {311005,1},
    {311005,2},
    {311005,3},
    {311005,4},
    {311005,5},
    {311005,6},
    {311005,7},
    {311005,8},
    {311005,9},
    {311005,10},
    {311005,11},
    {311005,12},
    {311006,1},
    {311006,2},
    {311006,3},
    {311006,4},
    {311006,5},
    {311006,6},
    {311006,7},
    {311006,8},
    {311006,9},
    {311006,10},
    {311006,11},
    {311006,12},
    {311007,1},
    {311007,2},
    {311007,3},
    {311007,4},
    {311007,5},
    {311007,6},
    {311007,7},
    {311007,8},
    {311007,9},
    {311007,10},
    {311007,11},
    {311007,12},
    {311008,1},
    {311008,2},
    {311008,3},
    {311008,4},
    {311008,5},
    {311008,6},
    {311008,7},
    {311008,8},
    {311008,9},
    {311008,10},
    {311008,11},
    {311008,12},
    {312000,1},
    {312001,1},
    {312002,1},
    {312003,1},
    {312003,2},
    {312003,3},
    {312003,4},
    {312003,5},
    {312003,6},
    {312003,7},
    {312003,8},
    {312003,9},
    {312003,10},
    {312003,11},
    {312003,12},
    {312004,1},
    {312004,2},
    {312004,3},
    {312004,4},
    {312004,5},
    {312004,6},
    {312004,7},
    {312004,8},
    {312004,9},
    {312004,10},
    {312004,11},
    {312004,12},
    {312005,1},
    {312005,2},
    {312005,3},
    {312005,4},
    {312005,5},
    {312005,6},
    {312005,7},
    {312005,8},
    {312005,9},
    {312005,10},
    {312005,11},
    {312005,12},
    {312006,1},
    {312006,2},
    {312006,3},
    {312006,4},
    {312006,5},
    {312006,6},
    {312006,7},
    {312006,8},
    {312006,9},
    {312006,10},
    {312006,11},
    {312006,12},
    {312007,1},
    {312007,2},
    {312007,3},
    {312007,4},
    {312007,5},
    {312007,6},
    {312007,7},
    {312007,8},
    {312007,9},
    {312007,10},
    {312007,11},
    {312007,12},
    {312008,1},
    {312008,2},
    {312008,3},
    {312008,4},
    {312008,5},
    {312008,6},
    {312008,7},
    {312008,8},
    {312008,9},
    {312008,10},
    {312008,11},
    {312008,12},
    {321000,1},
    {321000,2},
    {321000,3},
    {321000,4},
    {321000,5},
    {321000,6},
    {321000,7},
    {321000,8},
    {321000,9},
    {321001,1},
    {321001,2},
    {321001,3},
    {321001,4},
    {321001,5},
    {321001,6},
    {321001,7},
    {321001,8},
    {321001,9},
    {321002,1},
    {321002,2},
    {321002,3},
    {321002,4},
    {321002,5},
    {321002,6},
    {321002,7},
    {321002,8},
    {321002,9},
    {321003,1},
    {321003,2},
    {321003,3},
    {321003,4},
    {321003,5},
    {321003,6},
    {321003,7},
    {321003,8},
    {321003,9},
    {321004,1},
    {321004,2},
    {321004,3},
    {321004,4},
    {321004,5},
    {321004,6},
    {321004,7},
    {321004,8},
    {321004,9},
    {321005,1},
    {321005,2},
    {321005,3},
    {321005,4},
    {321005,5},
    {321005,6},
    {321005,7},
    {321005,8},
    {321005,9},
    {321006,1},
    {321006,2},
    {321006,3},
    {321006,4},
    {321006,5},
    {321006,6},
    {321006,7},
    {321006,8},
    {321006,9},
    {322000,1},
    {322000,2},
    {322000,3},
    {322000,4},
    {322000,5},
    {322000,6},
    {322000,7},
    {322000,8},
    {322000,9},
    {322001,1},
    {322001,2},
    {322001,3},
    {322001,4},
    {322001,5},
    {322001,6},
    {322001,7},
    {322001,8},
    {322001,9},
    {322002,1},
    {322002,2},
    {322002,3},
    {322002,4},
    {322002,5},
    {322002,6},
    {322002,7},
    {322002,8},
    {322002,9},
    {322003,1},
    {322003,2},
    {322003,3},
    {322003,4},
    {322003,5},
    {322003,6},
    {322003,7},
    {322003,8},
    {322003,9},
    {322004,1},
    {322004,2},
    {322004,3},
    {322004,4},
    {322004,5},
    {322004,6},
    {322004,7},
    {322004,8},
    {322004,9},
    {322005,1},
    {322005,2},
    {322005,3},
    {322005,4},
    {322005,5},
    {322005,6},
    {322005,7},
    {322005,8},
    {322005,9},
    {322006,1},
    {322006,2},
    {322006,3},
    {322006,4},
    {322006,5},
    {322006,6},
    {322006,7},
    {322006,8},
    {322006,9},
    {323000,1},
    {323000,2},
    {323000,3},
    {323000,4},
    {323000,5},
    {323000,6},
    {323000,7},
    {323000,8},
    {323000,9},
    {323001,1},
    {323001,2},
    {323001,3},
    {323001,4},
    {323001,5},
    {323001,6},
    {323001,7},
    {323001,8},
    {323001,9},
    {323002,1},
    {323002,2},
    {323002,3},
    {323002,4},
    {323002,5},
    {323002,6},
    {323002,7},
    {323002,8},
    {323002,9},
    {323003,1},
    {323003,2},
    {323003,3},
    {323003,4},
    {323003,5},
    {323003,6},
    {323003,7},
    {323003,8},
    {323003,9},
    {323004,1},
    {323004,2},
    {323004,3},
    {323004,4},
    {323004,5},
    {323004,6},
    {323004,7},
    {323004,8},
    {323004,9},
    {323005,1},
    {323005,2},
    {323005,3},
    {323005,4},
    {323005,5},
    {323005,6},
    {323005,7},
    {323005,8},
    {323005,9},
    {323006,1},
    {323006,2},
    {323006,3},
    {323006,4},
    {323006,5},
    {323006,6},
    {323006,7},
    {323006,8},
    {323006,9}
    ].

get1KeyList()->[
    101000,
    101001,
    101002,
    101003,
    101004,
    101005,
    101006,
    111000,
    111001,
    111002,
    111003,
    111004,
    111005,
    111006,
    111007,
    111008,
    112000,
    112001,
    112002,
    112003,
    112004,
    112005,
    112006,
    112007,
    112008,
    121000,
    121001,
    121002,
    121003,
    121004,
    121005,
    121006,
    122000,
    122001,
    122002,
    122003,
    122004,
    122005,
    122006,
    123000,
    123001,
    123002,
    123003,
    123004,
    123005,
    123006,
    201000,
    201001,
    201002,
    201003,
    201004,
    201005,
    201006,
    211000,
    211001,
    211002,
    211003,
    211004,
    211005,
    211006,
    211007,
    211008,
    212000,
    212001,
    212002,
    212003,
    212004,
    212005,
    212006,
    212007,
    212008,
    221000,
    221001,
    221002,
    221003,
    221004,
    221005,
    221006,
    222000,
    222001,
    222002,
    222003,
    222004,
    222005,
    222006,
    223000,
    223001,
    223002,
    223003,
    223004,
    223005,
    223006,
    301000,
    301001,
    301002,
    301003,
    301004,
    301005,
    301006,
    311000,
    311001,
    311002,
    311003,
    311004,
    311005,
    311006,
    311007,
    311008,
    312000,
    312001,
    312002,
    312003,
    312004,
    312005,
    312006,
    312007,
    312008,
    321000,
    321001,
    321002,
    321003,
    321004,
    321005,
    321006,
    322000,
    322001,
    322002,
    322003,
    322004,
    322005,
    322006,
    323000,
    323001,
    323002,
    323003,
    323004,
    323005,
    323006
    ].

get2KeyList(101000)->[
    1
    ];
get2KeyList(101001)->[
    1
    ];
get2KeyList(101002)->[
    1
    ];
get2KeyList(101003)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(101004)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(101005)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(101006)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(111000)->[
    1
    ];
get2KeyList(111001)->[
    1
    ];
get2KeyList(111002)->[
    1
    ];
get2KeyList(111003)->[
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
    12
    ];
get2KeyList(111004)->[
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
    12
    ];
get2KeyList(111005)->[
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
    12
    ];
get2KeyList(111006)->[
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
    12
    ];
get2KeyList(111007)->[
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
    12
    ];
get2KeyList(111008)->[
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
    12
    ];
get2KeyList(112000)->[
    1
    ];
get2KeyList(112001)->[
    1
    ];
get2KeyList(112002)->[
    1
    ];
get2KeyList(112003)->[
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
    12
    ];
get2KeyList(112004)->[
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
    12
    ];
get2KeyList(112005)->[
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
    12
    ];
get2KeyList(112006)->[
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
    12
    ];
get2KeyList(112007)->[
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
    12
    ];
get2KeyList(112008)->[
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
    12
    ];
get2KeyList(121000)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(121001)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(121002)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(121003)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(121004)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(121005)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(121006)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(122000)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(122001)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(122002)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(122003)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(122004)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(122005)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(122006)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(123000)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(123001)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(123002)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(123003)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(123004)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(123005)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(123006)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(201000)->[
    1
    ];
get2KeyList(201001)->[
    1
    ];
get2KeyList(201002)->[
    1
    ];
get2KeyList(201003)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(201004)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(201005)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(201006)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(211000)->[
    1
    ];
get2KeyList(211001)->[
    1
    ];
get2KeyList(211002)->[
    1
    ];
get2KeyList(211003)->[
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
    12
    ];
get2KeyList(211004)->[
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
    12
    ];
get2KeyList(211005)->[
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
    12
    ];
get2KeyList(211006)->[
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
    12
    ];
get2KeyList(211007)->[
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
    12
    ];
get2KeyList(211008)->[
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
    12
    ];
get2KeyList(212000)->[
    1
    ];
get2KeyList(212001)->[
    1
    ];
get2KeyList(212002)->[
    1
    ];
get2KeyList(212003)->[
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
    12
    ];
get2KeyList(212004)->[
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
    12
    ];
get2KeyList(212005)->[
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
    12
    ];
get2KeyList(212006)->[
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
    12
    ];
get2KeyList(212007)->[
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
    12
    ];
get2KeyList(212008)->[
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
    12
    ];
get2KeyList(221000)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(221001)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(221002)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(221003)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(221004)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(221005)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(221006)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(222000)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(222001)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(222002)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(222003)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(222004)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(222005)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(222006)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(223000)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(223001)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(223002)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(223003)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(223004)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(223005)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(223006)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(301000)->[
    1
    ];
get2KeyList(301001)->[
    1
    ];
get2KeyList(301002)->[
    1
    ];
get2KeyList(301003)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(301004)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(301005)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(301006)->[
    1,
    2,
    3,
    4,
    5,
    6
    ];
get2KeyList(311000)->[
    1
    ];
get2KeyList(311001)->[
    1
    ];
get2KeyList(311002)->[
    1
    ];
get2KeyList(311003)->[
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
    12
    ];
get2KeyList(311004)->[
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
    12
    ];
get2KeyList(311005)->[
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
    12
    ];
get2KeyList(311006)->[
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
    12
    ];
get2KeyList(311007)->[
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
    12
    ];
get2KeyList(311008)->[
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
    12
    ];
get2KeyList(312000)->[
    1
    ];
get2KeyList(312001)->[
    1
    ];
get2KeyList(312002)->[
    1
    ];
get2KeyList(312003)->[
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
    12
    ];
get2KeyList(312004)->[
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
    12
    ];
get2KeyList(312005)->[
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
    12
    ];
get2KeyList(312006)->[
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
    12
    ];
get2KeyList(312007)->[
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
    12
    ];
get2KeyList(312008)->[
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
    12
    ];
get2KeyList(321000)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(321001)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(321002)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(321003)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(321004)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(321005)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(321006)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(322000)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(322001)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(322002)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(322003)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(322004)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(322005)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(322006)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(323000)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(323001)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(323002)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(323003)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(323004)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(323005)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(323006)->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9
    ];
get2KeyList(_)->[].

