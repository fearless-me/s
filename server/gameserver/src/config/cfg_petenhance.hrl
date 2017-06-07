%%: 声明
-ifndef(cfg_petenhance).
-define(cfg_petenhance, 1).

-record(petenhanceCfg, {
        %%: 神器ID
        artifact,

        %%: 神器等级
        level,

        %%: 神器经验
        exp,

        %%: 属性
        p1,

        %%: 属性值
        p1value,

        %%: 0 加法值
        %%: 1 乘法值
        p1type,

        %%: 属性
        p2,

        %%: 属性值
        p2value,

        %%: 0 加法值
        %%: 1 乘法值
        p2type,

        %%: 属性
        p3,

        %%: 属性值
        p3value,

        %%: 0 加法值
        %%: 1 乘法值
        p3type,

        %%: 属性
        p4,

        %%: 属性值
        p4value,

        %%: 0 加法值
        %%: 1 乘法值
        p4type

 }).

-endif.