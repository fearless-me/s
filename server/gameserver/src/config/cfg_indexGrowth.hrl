%%: 声明
-ifndef(cfg_indexGrowth).
-define(cfg_indexGrowth, 1).

-record(indexGrowthCfg, {
        %%: 技能等级
        level,

        %%: 战士
        %%: 连招1
        index1,

        %%: 战士
        %%: 连招2
        index2,

        %%: 战士
        %%: 连招3
        index3,

        %%: 战士
        %%: 居合斩
        index4,

        %%: 战士
        %%: 龙翔斩
        index5,

        %%: 战士
        %%: 下沉回旋
        index6,

        %%: 战士
        %%: 强化生命
        index7,

        %%: 斗士
        %%: 连招1
        index8,

        %%: 斗士
        %%: 连招2
        index9,

        %%: 斗士
        %%: 连招3
        index10,

        %%: 斗士
        %%: 居合斩
        index11,

        %%: 斗士
        %%: 龙翔斩
        index12,

        %%: 斗士
        %%: 回旋天舞
        index13,

        %%: 局击
        index14,

        %%: 斗士
        %%: 战士之心
        index15,

        %%: 斗士
        %%: 强化生命
        index16,

        %%: 守卫
        %%: 连招2
        index17,

        %%: 守卫
        %%: 连招2
        index18,

        %%: 守卫
        %%: 连招3
        index19,

        %%: 守卫
        %%: 烈风斩
        index20,

        %%: 守卫
        %%: 毒牙突刺
        index21,

        %%: 守卫
        %%: 盾击
        index22,

        %%: 守卫
        %%: 飞天斩
        index23,

        %%: 守卫
        %%: 祝福战士
        index24,

        %%: 守卫
        %%: 挑衅
        index25,

        %%: 火器灵伤害值
        index26,

        %%: 冰器灵伤害值
        index27,

        %%: 雷器灵伤害值
        index28,

        %%: 风器灵伤害值
        index29,

        %%: 光器灵伤害值
        index30,

        %%: 暗器灵伤害值
        index31,

        %%: 火器灵伤害值
        index32,

        %%: 冰器灵伤害值
        index33,

        %%: 雷器灵伤害值
        index34,

        %%: 风器灵伤害值
        index35,

        %%: 光器灵伤害值
        index36,

        %%: 暗器灵伤害值
        index37,

        %%: 首领入侵BOOS血量修正
        %%: 首领血量*index38
        index38,

        %%: 盗宝贼踪迹攻击修正
        %%: 盗宝贼攻击*index39
        index39,

        %%: 盗宝贼血量修正
        %%: 盗宝贼血量*index40
        index40,

        %%: 守卫碧空城BOSS攻击修正
        %%: BOSS攻击*index41
        index41,

        %%: 碧空城BOOS血量修正
        %%: 碧空城首领血量*index42
        index42,

        %%: 战天下镜像攻击修正
        %%: 攻击*index43
        index43,

        %%: 战天下镜像血量修正
        %%: 镜像血量*index44
        index44,

        %%: 野外首领和黑暗之地BOSS攻击修正
        %%: BOSS攻击*index45
        index45,

        %%: 野外首领和黑暗之地BOOS血量修正
        %%: 野外首领首领血量*index46
        index46,

        %%: 器灵觉醒技能加成属性——战士属性1
        index47,

        %%: 器灵觉醒技能加成属性——战士属性2
        index48,

        %%: 器灵觉醒技能加成属性——战士属性3
        index49,

        %%: 器灵觉醒技能加成属性——战士属性4
        index50,

        %%: 器灵觉醒技能加成属性——战士属性5
        index51,

        %%: 器灵觉醒技能加成属性——法师属性1
        index52,

        %%: 器灵觉醒技能加成属性——法师属性2
        index53,

        %%: 器灵觉醒技能加成属性——法师属性3
        index54,

        %%: 器灵觉醒技能加成属性——法师属性4
        index55,

        %%: 器灵觉醒技能加成属性——法师属性5
        index56,

        %%: 器灵觉醒技能加成属性——刺客属性1
        index57,

        %%: 器灵觉醒技能加成属性——刺客属性2
        index58,

        %%: 器灵觉醒技能加成属性——刺客属性3
        index59,

        %%: 器灵觉醒技能加成属性——刺客属性4
        index60,

        %%: 器灵觉醒技能加成属性——刺客属性5
        index61,

        %%: 姜泓妃
        %%: 技能点伴随角色等级的成长
        index62,

        index620,

        index63,

        index64,

        index65,

        index66,

        index67,

        index68,

        index69,

        index70,

        index71,

        index72,

        index73,

        index74,

        index75,

        index76,

        index77,

        index78,

        index79,

        index80,

        index81,

        index82,

        index83,

        index84,

        index85,

        index86,

        index87,

        index88,

        index89,

        index90,

        index91,

        index92,

        index93,

        index94,

        index95,

        index96,

        index97,

        index98,

        index99,

        index100,

        index101,

        index102,

        index103,

        index104,

        index105,

        index106,

        index107,

        index108

 }).

-endif.