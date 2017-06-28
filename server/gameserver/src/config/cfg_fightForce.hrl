%%: 声明
-ifndef(cfg_fightForce).
-define(cfg_fightForce, 1).

-record(fightForceCfg, {
        %%: 作者:
        %%: 职业id
        %%: 找对应的职业ID
        %%: by姜泓妃
        id,

        %%: 作者:
        %%: 生命系数
        %%: 人物战斗力=各项系数乘以对应属性再求和
        hp,

        %%: 作者:
        %%: 物攻系数
        %%: 人物战斗力=各项系数乘以对应属性再求和
        prop_physicaldamage,

        %%: 作者:
        %%: 法攻系数
        %%: 人物战斗力=各项系数乘以对应属性再求和
        prop_MagicAttack,

        %%: 作者:
        %%: 物防系数
        %%: 人物战斗力=各项系数乘以对应属性再求和
        prop_physicaldefence,

        %%: 作者:
        %%: 法防系数
        %%: 人物战斗力=各项系数乘以对应属性再求和
        prop_MagicDefence,

        %%: 作者:
        %%: 暴击系数
        %%: 人物战斗力=各项系数乘以对应属性再求和
        prop_critical,

        %%: 作者:
        %%: 抗暴系数
        %%: 人物战斗力=各项系数乘以对应属性再求和
        prop_criticalimmunity,

        %%: 作者:
        %%: 爆伤系数
        %%: 人物战斗力=各项系数乘以对应属性再求和
        prop_CriticalDamageLevel,

        %%: 作者:
        %%: 韧性系数
        %%: 人物战斗力=各项系数乘以对应属性再求和
        prop_TenaciousLevel,

        %%: 作者:
        %%: 命中系数
        %%: 人物战斗力=各项系数乘以对应属性再求和
        prop_hitratio,

        %%: 作者:
        %%: 闪避系数
        %%: 人物战斗力=各项系数乘以对应属性再求和
        prop_dodge,

        %%: 作者:
        %%: 破甲系数
        %%: 人物战斗力=各项系数乘以对应属性再求和
        prop_ArmorPenetrationLevel,

        %%: 作者:
        %%: 坚固等级系数
        prop_firm,

        %%: 作者:
        %%: 物理伤害加成系数
        prop_DgeAdd1,

        %%: 作者:
        %%: 魔法伤害加成系数
        prop_DgeAdd2,

        %%: 作者:
        %%: 伤害减免系数
        prop_dgeCut,

        %%: 作者:
        %%: 技能CD减免系数
        prop_CD

 }).

-endif.