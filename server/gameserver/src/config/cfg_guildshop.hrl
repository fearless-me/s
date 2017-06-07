%%: 声明
-ifndef(cfg_guildshop).
-define(cfg_guildshop, 1).

-record(guildshopCfg, {
        %%: 作者:
        %%: 商品排列顺序
        id,

        %%: 作者:
        %%: 道具ID
        itemID,

        %%: 作者:
        %%: 购买消耗
        cost,

        %%: 作者:
        %%: 解锁等级
        needLevel

 }).

-endif.