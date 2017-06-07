%%: 声明
-ifndef(cfg_recharge).
-define(cfg_recharge, 1).

-record(rechargeCfg, {
        %%: 作者:
        id,

        %%: 作者:
        %%: 1七日充值
        %%: 2累计充值
        mode,

        %%: 作者:
        %%: 充值额度，单位是多少钻石数量
        diamond,

        %%: 作者:
        %%: 展示道具1
        %%: 格式{4000,1} 前一个参数表示道具id后一个参数表示道具数量
        item_1,

        %%: 作者:
        %%: 展示道具2
        item_2,

        %%: 作者:
        %%: 展示道具3
        item_3,

        %%: 作者:
        %%: 展示道具4
        item_4,

        %%: 作者:
        %%: 展示道具5
        item_5,

        %%: 作者:
        %%: 展示道具6
        item_6

 }).

-endif.