%%: 声明
-ifndef(cfg_attributeRegent).
-define(cfg_attributeRegent, 1).

-record(attributeRegentCfg, {
        %%: 等级
        level,

        %%: 源属性
        attribute1,

        %%: 目标属性
        toAttribute1,

        %%: 转换数
        regent1,

        %%: 源属性
        attribute2,

        %%: 目标属性
        toAttribute2,

        %%: 转换数
        regent2,

        %%: 源属性
        attribute3,

        %%: 目标属性
        toAttribute3,

        %%: 转换数
        regent3

 }).

-endif.