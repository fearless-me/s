%%: 声明
-ifndef(cfg_uniqTierProperty).
-define(cfg_uniqTierProperty, 1).

-record(uniqTierPropertyCfg, {
        %%: 定制ID
        iD,

        %%: 名字
        name,

        %%: 每个花括号选择一个
        uniqAffix

 }).

-endif.