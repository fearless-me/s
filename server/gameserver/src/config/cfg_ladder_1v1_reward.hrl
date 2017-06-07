%%: 声明
-ifndef(cfg_ladder_1v1_reward).
-define(cfg_ladder_1v1_reward, 1).

-record(ladder_1v1_rewardCfg, {
        %%: tiancheng:
        %%: 排名开始
        rank_start,

        %%: tiancheng:
        %%: 排名结束
        rank_end,

        %%: tiancheng:
        %%: 普通功勋奖励
        normal,

        %%: tiancheng:
        %%: 额外功勋奖励
        extra,

        %%: user:
        %%: 每日固定时间获得的结算奖励
        %%: [货币类型，奖励值]
        everydaycoin,

        %%: 每周结算奖励
        %%: 周1凌晨4点
        item,

        %%: Administrator:
        %%: 刷新历史排名时获得的一次性钻石奖励，每个号只领取一次。
        %%: [a,b,c]表示——将该排名区间划分成a段，共a个奖励节点（不算头），当排名上升，第一次跨过其中的奖励节点时，获得一次货币类型为b的货币，数量c。
        coin

 }).

-endif.