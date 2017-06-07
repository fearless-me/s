%%: 声明
-ifndef(cfg_recharge_item_relation).
-define(cfg_recharge_item_relation, 1).

-record(recharge_item_relationCfg, {
        id,

        %%: 充值道具列表配置：
        %%: 【【道具id，个数，是否绑定（1绑定，0不绑定）】】
        items

 }).

-endif.