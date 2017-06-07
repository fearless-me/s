%%: 声明
-ifndef(cfg_guildbuff).
-define(cfg_guildbuff, 1).

-record(guildbuffCfg, {
        %%: 作者:
        %%: 技能编号
        id,

        %%: 作者:
        %%: buffID
        buff,

        %%: 作者:
        %%: 帮会等级
        guildlevel,

        %%: 作者:
        %%: 购买消耗货币
        %%: [货币代码，货币数量]
        %%: 1.金币
        %%: 2.绑定金币
        %%: 3.钻石
        %%: 4.声望
        %%: 5.荣誉
        %%: 6.绑定钻石
        %%: 如果消耗的是6和2，则当6和2不足时可以用3和1替代
        cost,

        %%: 作者:
        %%: 显示名字
        showname,

        %%: 作者:
        %%: 描述
        description

 }).

-endif.