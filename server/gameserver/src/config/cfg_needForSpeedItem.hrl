%%: 声明
-ifndef(cfg_needForSpeedItem).
-define(cfg_needForSpeedItem, 1).

-record(needForSpeedItemCfg, {
        %%: 作者:
        %%: 名次
        id,

        %%: 作者:
        %%: [道具id，权重]
        logic_group_id,

        icon,

        text,

        name

 }).

-endif.