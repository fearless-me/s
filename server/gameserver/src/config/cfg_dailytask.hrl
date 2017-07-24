%%: 声明
-ifndef(cfg_dailytask).
-define(cfg_dailytask, 1).

-record(dailytaskCfg, {
        %%: 角色等级
        level,

        %%: 调用task表中groupid字段相同的任务组下的随机任务
        group,

        %%: 十环奖励经验
        reward_exp,

        %%: 十环奖励道具1，格式[{物品ID，数量},…]
        reward_item1,

        %%: 十环奖励道具2，格式[{物品ID，数量},…]
        reward_item2,

        %%: 十环奖励金币
        reward_money,

        %%: 十环奖励家族资金
        reward_guildresource,

        %%: 十环奖励家族活跃
        reward_active,

        %%: 十环奖励个人家族贡献
        reward_contribute,

        %%: 日常界面展示奖励道具1
        show_item1,

        %%: 日常界面展示奖励道具2
        show_item2,

        %%: 日常界面展示奖励道具3
        show_item3,

        %%: 日常界面展示奖励道具4
        show_item4,

        %%: 日常界面展示奖励道具5
        show_item5,

        %%: 日常界面展示奖励道具6
        show_item6,

        %%: 日常界面展示奖励道具7
        show_item7

 }).

-endif.