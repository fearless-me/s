%%: 声明
-ifndef(cfg_petLevelProperty).
-define(cfg_petLevelProperty, 1).

-record(petLevelPropertyCfg, {
        %%: Windows 用户:
        %%: 等级
        level,

        %%: 生命上限
        maxHP,

        %%: 物理防御系数
        phyDef,

        %%: 神圣防御系数
        holyDef,

        %%: 暗影防御系数
        shadDef,

        %%: 元素防御系数
        eleDef,

        %%: 物理伤害系数
        phycDam,

        %%: 神圣伤害系数
        holyDam,

        %%: 暗影伤害系数
        shadDam,

        %%: 元素伤害系数
        eleDam,

        %%: 生命上限
        maxHP2,

        %%: Administrator:
        %%: 物攻
        physicalAttack,

        %%: Administrator:
        %%: 法攻
        magicAttack,

        %%: Administrator:
        %%: 物防
        physicalDefence,

        %%: Administrator:
        %%: 法防
        magicDefence,

        %%: Administrator:
        %%: 命中等级
        hitLevel,

        %%: Administrator:
        %%: 暴击等级
        criticalLevel,

        %%: Administrator:
        %%: 爆伤等级
        criticalDamageLevel,

        %%: Administrator:
        %%: 破甲等级
        armorPenetrationLevel,

        %%: Administrator:
        %%: 闪避等级
        dodgeLevel,

        %%: Administrator:
        %%: 抗爆等级
        criticalResistLevel,

        %%: Administrator:
        %%: 韧性等级
        tenaciousLevel,

        %%: Administrator:
        %%: 生命秒回值
        hPRecover,

        %%: Administrator:
        mPRecover

 }).

-endif.