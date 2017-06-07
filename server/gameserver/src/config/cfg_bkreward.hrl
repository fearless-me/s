%%: 声明
-ifndef(cfg_bkreward).
-define(cfg_bkreward, 1).

-record(bkrewardCfg, {
        %%: 作者:
        %%: ID
        id,

        %%: 道具ID
        item_id,

        %%: 作者:
        %%: 道具生成权重
        item_weight,

        %%: 作者:
        %%: 获得道具最小数量
        item_numberMin,

        %%: 作者:
        %%: 获得道具最大数量
        item_numberMax,

        %%: 是否绑定
        %%: 0绑定
        %%: 1非绑定
        is_binded,

        %%: 每日最多出现道具次数
        %%: 超过后即不再产出该道具
        %%: -1 不限制
        pool_times_perday,

        %%: 作者:
        %%: 是否全服公告
        %%: 0不公告
        %%: 1要公告
        need_broadcast

 }).

-endif.