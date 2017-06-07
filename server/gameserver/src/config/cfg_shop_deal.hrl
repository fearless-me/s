%%: 声明
-ifndef(cfg_shop_deal).
-define(cfg_shop_deal, 1).

-record(shop_dealCfg, {
        id,

        %%: 作者:
        %%: 目标购买道具的ID
        shop_item,

        %%: 作者:
        %%: 作为货币道具的ID
        deal_item,

        %%: 作者:
        %%: 兑换这个道具需要的数量
        deal_number,

        %%: 作者:
        %%: 每日可以兑换的数量上限
        daily

 }).

-endif.