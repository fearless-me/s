%%: 声明
-ifndef(cfg_petfightForce).
-define(cfg_petfightForce, 1).

-record(petfightForceCfg, {
        %%: 骑宠类型，对应pet中prosType字段
        %%: 1：防御型
        %%: 2：攻击型
        %%: 3：暴击型
        %%: 4：灵巧型
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
        %%: 命中系数
        %%: 人物战斗力=各项系数乘以对应属性再求和
        prop_hitratio,

        %%: 作者:
        %%: 暴击系数
        %%: 人物战斗力=各项系数乘以对应属性再求和
        prop_critical,

        %%: 作者:
        %%: 爆伤系数
        %%: 人物战斗力=各项系数乘以对应属性再求和
        prop_CriticalDamageLevel,

        %%: 作者:
        %%: 破甲系数
        %%: 人物战斗力=各项系数乘以对应属性再求和
        prop_ArmorPenetrationLevel,

        %%: 作者:
        %%: 闪避系数
        %%: 人物战斗力=各项系数乘以对应属性再求和
        prop_dodge,

        %%: 作者:
        %%: 抗暴系数
        %%: 人物战斗力=各项系数乘以对应属性再求和
        prop_criticalimmunity,

        %%: 作者:
        %%: 韧性系数
        %%: 人物战斗力=各项系数乘以对应属性再求和
        prop_TenaciousLevel

 }).

-endif.