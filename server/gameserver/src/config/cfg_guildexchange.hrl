%%: 声明
-ifndef(cfg_guildexchange).
-define(cfg_guildexchange, 1).

-record(guildexchangeCfg, {
        id,

        %%: 作者:
        %%: 属性等级
        level,

        icon,

        %%: 作者:
        %%: 属性加成{0加法，1乘法，属性类型，属性值}
        property,

        %%: 作者:
        %%: 解锁家族等级
        %%: 大于或等于level
        guildlevel,

        %%: 作者:
        %%: 消耗军贡
        cost,

        %%: user:
        %%: 技能名称
        name,

        %%: user:
        %%: 技能描述
        describe

 }).

-endif.