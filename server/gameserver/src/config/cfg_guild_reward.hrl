%%: 声明
-ifndef(cfg_guild_reward).
-define(cfg_guild_reward, 1).

-record(guild_rewardCfg, {
        %%: 作者:
        %%: 军团排名
        rank,

        %%: 作者:
        %%: 奖励等级段
        %%: 等级是大于等于，小于等于
        level,

        %%: 军团长副团长的工资
        gift1,

        %%: 军团精英工资
        gift2,

        %%: 军团成员
        gift3

 }).

-endif.