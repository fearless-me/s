%%: 声明
-ifndef(cfg_eq_charge).
-define(cfg_eq_charge, 1).

-record(eq_chargeCfg, {
        id,

        %%: 此字段已废弃（分解当前不消耗金币）
        %%: 装备基础金币价格
        eq_charge,

        %%: 装备拆解紫色精华基础值
        source1

 }).

-endif.