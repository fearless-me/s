%%: 声明
-ifndef(cfg_tierBonus).
-define(cfg_tierBonus, 1).

-record(tierBonusCfg, {
        %%: 唯一编号
        iD,

        %%: 套装奖励ID
        tierBonusID,

        %%: 套装名称
        tierName,

        %%: 装备几件给予的奖励
        count,

        %%: 属性类型
        propType1,

        %%: 值
        value1,

        %%: 乘法或者加法
        %%: 0 加法
        %%: 1 乘法
        mulityOrPlus1,

        %%: 属性类型
        propType2,

        %%: 值
        value2,

        %%: 乘法或者加法
        %%: 0 加法
        %%: 1 乘法
        mulityOrPlus2,

        %%: 属性类型
        propType3,

        %%: 值
        value3,

        %%: 乘法或者加法
        %%: 0 加法
        %%: 1 乘法
        mulityOrPlus3,

        %%: 属性类型
        propType4,

        %%: 值
        value4,

        %%: 乘法或者加法
        %%: 0 加法
        %%: 1 乘法
        mulityOrPlus4,

        %%: 附加技能
        skill1,

        %%: 附加技能
        skill2,

        %%: 附加技能
        skill3,

        %%: 附加技能
        skill4

 }).

-endif.