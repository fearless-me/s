%%: 声明
-ifndef(cfg_equipAffixes).
-define(cfg_equipAffixes, 1).

-record(equipAffixesCfg, {
        %%: 唯一编号
        iD,

        %%: 前缀ID
        affixID,

        %%: 名字
        name,

        %%: 词缀等级
        affixLevel,

        %%: 前缀或者后缀
        %%: 0 前缀
        %%: 1 后缀
        %%: 2 独特套装前缀
        %%: 3 独特套装后缀
        %%: 4 独特套装特殊前缀，不会被随机选择，只能被手动填写
        %%: 5 独特套装特殊后缀，不会被随机选择，只能被手动填写
        affixType,

        %%: 相同数值不共存
        %%: 0无冲突
        conflict,

        %%: 适用物品等级
        itemLevel,

        %%: 装备部位
        %%: -1，全部位
        %%: 0 主手
        %%: 1 副手
        %%: 2 胸甲
        %%: 3 靴子
        %%: 4 戒指
        %%: 5 项链
        %%: 6 头盔
        %%: 7 裤子
        equipType,

        %%: 适用职业
        %%:  0, 所有职业
        %%:  1, 圣殿骑士
        %%:  2, 龙脉法师
        %%:  3, 幽影刺客
        %%:  4, 灵魂收割者
        %%:  5,枪械师
        equipClass,

        %%: 属性类型
        propType,

        %%: 最小值
        min,

        %%: 最大值1
        max1,

        %%: 最大值2
        max2,

        %%: 乘法或者加法
        %%: 0 加法
        %%: 1 乘法
        mulityOrPlus,

        weight,

        %%: 几个面的骰子
        dice

 }).

-endif.