%%: 声明
-ifndef(cfg_rune_basePro).
-define(cfg_rune_basePro, 1).

-record(rune_baseProCfg, {
        group_id,

        %%: Administrator:
        %%: 属性id，引用battlePropInfo
        property_id,

        %%: Administrator:
        %%: 属性数值
        property_number,

        %%: Administrator:
        %%: 乘法或加法，0为乘法
        %%: 1为加法
        mulityOrPlus

 }).

-endif.