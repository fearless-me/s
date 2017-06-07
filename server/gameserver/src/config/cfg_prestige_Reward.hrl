%%: 声明
-ifndef(cfg_prestige_Reward).
-define(cfg_prestige_Reward, 1).

-record(prestige_RewardCfg, {
        di,

        %%: 排名段起始
        ranking_1,

        %%: 排名段结束
        ranking_2,

        %%: 奖励道具
        item

 }).

-endif.