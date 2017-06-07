%%: 声明
-ifndef(cfg_needForSpeedRandomItem).
-define(cfg_needForSpeedRandomItem, 1).

-record(needForSpeedRandomItemCfg, {
        %%: 作者:
        %%: 名次
        id,

        %%: 作者:
        %%: [道具id，权重]
        item_weight_list

 }).

-endif.