%%: 声明
-ifndef(cfg_ladder_item).
-define(cfg_ladder_item, 1).

-record(ladder_itemCfg, {
        %%: 作者:
        id,

        rank,

        item

 }).

-endif.