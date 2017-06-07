%%: 声明
-ifndef(cfg_equipRecastAdvance).
-define(cfg_equipRecastAdvance, 1).

-record(equipRecastAdvanceCfg, {
        id,

        %%: 职业
        career,

        %%: 孔位
        slot,

        %%: user:
        %%: 栏位icon
        icon,

        %%: user:
        %%: 栏位名字
        name,

        %%: 属性
        props,

        %%: Administrator:
        %%: 权重
        weight

 }).

-endif.