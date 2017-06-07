%%: 声明
-ifndef(cfg_drop_package).
-define(cfg_drop_package, 1).

-record(drop_packageCfg, {
        packageId,

        %%: 微软用户:
        %%: 道具ID
        itemId,

        %%: 微软用户:
        %%: 最小个数
        min,

        %%: 微软用户:
        %%: 最大个数
        max,

        %%: 微软用户:
        %%: 掉落权重
        weight

 }).

-endif.