%%: 声明
-ifndef(cfg_itemCDandCount).
-define(cfg_itemCDandCount, 1).

-record(itemCDandCountCfg, {
        %%: id < 1000 是冷却
        %%: id>=1000 是个数
        iD,

        %%: 单位：
        %%: 秒
        %%: 个数
        value

 }).

-endif.