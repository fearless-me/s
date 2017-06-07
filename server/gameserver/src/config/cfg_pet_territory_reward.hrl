%%: 声明
-ifndef(cfg_pet_territory_reward).
-define(cfg_pet_territory_reward, 1).

-record(pet_territory_rewardCfg, {
        %%: 等级段
        id,

        %%: 奖励道具
        reward

 }).

-endif.