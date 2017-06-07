%%: 声明
-ifndef(cfg_defRegent).
-define(cfg_defRegent, 1).

-record(defRegentCfg, {
        %%: 等级
        level,

        %%: 神圣防御转换系数
        holyDefArg,

        %%: 物理防御转换系数
        phyDefArg,

        %%: 暗影防御转换系数
        shadowDefArg,

        %%: 元素防御转换系数
        eleDefArg,

        %%: 混乱防御转换系数
        chaosDefArg

 }).

-endif.