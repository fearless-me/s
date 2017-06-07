%%: 声明
-ifndef(cfg_dailytask).
-define(cfg_dailytask, 1).

-record(dailytaskCfg, {
        %%: 玩家等级
        level,

        %%: 调用task表中groupid字段相同的任务组下的随机任务
        group,

        %%: 奖励经验
        reward_exp,

        %%: 奖励道具1
        %%: {物品ID，数量}
        reward_item1,

        %%: 道具奖励2
        %%: {物品ID，数量}
        reward_item2,

        %%: 奖励游戏币
        reward_money,

        %%: 展示道具1
        show_item1,

        %%: 展示道具2
        show_item2,

        %%: 展示道具3
        show_item3,

        %%: 展示道具4
        show_item4

 }).

-endif.