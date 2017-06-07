%%: 声明
-ifndef(cfg_guildbless).
-define(cfg_guildbless, 1).

-record(guildblessCfg, {
        %%: 作者:
        %%: 类型
        typ,

        %%: 作者:
        %%: 经验倍数
        rate,

        %%: 作者:
        %%: 增加军团贡献
        contribute,

        %%: 作者:
        %%: 增加军团资金
        guildresource,

        %%: 作者:
        %%: 增加军团活跃
        guildliveness,

        %%: 作者:
        %%: 货币消耗
        cost,

        %%: 作者:
        %%: 货币消耗类型
        costtype

 }).

-endif.