%%: 声明
-ifndef(cfg_level_reward).
-define(cfg_level_reward, 1).

-record(level_rewardCfg, {
        %%: 等级
        id,

        %%: 可领取道具
        item1,

        %%: 道具数量
        num1,

        %%: 客户端是否显示特效
        %%: 1 显示
        %%: 0 不显示
        tpye1,

        item2,

        num2,

        tpye2,

        item3,

        num3,

        tpye3,

        item4,

        num4,

        tpye4,

        item5,

        num5,

        tpye5

 }).

-endif.