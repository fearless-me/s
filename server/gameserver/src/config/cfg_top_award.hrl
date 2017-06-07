%%: 声明
-ifndef(cfg_top_award).
-define(cfg_top_award, 1).

-record(top_awardCfg, {
        id,

        %%: 配置方式
        %%: [{排名段起始，排名段结束，奖励道具的ID，奖励道具的数量}]
        sequence

 }).

-endif.