%%: 声明
-ifndef(cfg_lottery).
-define(cfg_lottery, 1).

-record(lotteryCfg, {
        %%: 作者:
        %%: ID
        id,

        %%: 道具ID
        item_id,

        %%: 作者:
        %%: 权重1也是默认权重
        item_weight1,

        %%: 作者:
        %%: 权重2
        item_weight2,

        %%: 作者:
        %%: 获得道具最小数量
        item_numberMix,

        %%: 作者:
        %%: 获得道具最大数量
        item_numberMax,

        %%: 是否绑定
        %%: 0非绑定
        %%: 1绑定
        is_binded,

        %%: 每日最多出现道具次数
        %%: 超过后即不再产出该道具
        %%: -1 不限制
        pool_times_perday,

        %%: 作者:
        %%: 是否全服公告
        %%: 0不公告
        %%: 1要公告
        need_broadcast,

        %%: 作者:
        %%: 是否显示在福利界面
        %%: 最大支持显示5个
        %%: 0不显示
        %%: 1显示
        is_show

 }).

-endif.