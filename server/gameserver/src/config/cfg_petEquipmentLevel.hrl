%%: 声明
-ifndef(cfg_petEquipmentLevel).
-define(cfg_petEquipmentLevel, 1).

-record(petEquipmentLevelCfg, {
        %%: 骑宠装备强化等级
        level,

        coin,

        %%: 属性id，值，加法值或乘法值
        %%: 0 加法值
        %%: 1 乘法值
        propertyIndex,

        %%: 升级所需材料及数量
        item

 }).

-endif.