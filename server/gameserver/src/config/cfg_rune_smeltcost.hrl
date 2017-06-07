%%: 声明
-ifndef(cfg_rune_smeltcost).
-define(cfg_rune_smeltcost, 1).

-record(rune_smeltcostCfg, {
        id,

        %%: 消耗品质系数，白绿蓝紫橙红
        %%: 消耗数量=ratio_quality*cost
        ratio_quality,

        %%: 赵思琦
        %%: 消耗的非绑定金币数量
        cost

 }).

-endif.