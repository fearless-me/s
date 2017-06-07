%%: 声明
-ifndef(cfg_dungeonschallenge).
-define(cfg_dungeonschallenge, 1).

-record(dungeonschallengeCfg, {
        %%: 副本的ID
        %%: 对应mapsetting表中的id字段
        id,

        %%: 副本备注
        %%: 仅策划做标记用
        name,

        %%: 评级为S所需要的通关时间，单位为秒；
        time_1,

        %%: 评级为A所需要的通关时间，单位为秒；
        time_2,

        %%: 评级为B所需要的通关时间，单位为秒；
        time_3,

        %%: 评级为C所需要的通关时间，单位为秒；
        time_4,

        %%: 评级为D所需要的通关时间，单位为秒；
        time_5,

        %%: 已废弃
        %%: 装备箱（原翻牌结算用）
        reward_E1,

        %%: 已废弃
        %%: 道具箱（原翻牌结算用）
        reward_E2,

        %%: 已废弃
        %%: 钱袋（原翻牌结算用）
        reward_E3,

        %%: 已废弃
        %%: 秘宝（原翻牌结算用）
        reward_E4,

        %%: 已废弃
        %%: 奖励1被剔除的权重（原翻牌结算用）
        reward_R1,

        %%: 已废弃
        %%: 奖励2被剔除的权重（原翻牌结算用）
        reward_R2,

        %%: 已废弃
        %%: 奖励3被剔除的权重（原翻牌结算用）
        reward_R3,

        %%: 已废弃
        %%: 奖励4被剔除的权重（原翻牌结算用）
        reward_R4,

        %%: 通关副本一定会获得的经验奖励
        exp_reward,

        %%: 通关副本一定会获得的金钱奖励
        gold_reward,

        %%: S评价的金钱经验倍率
        s_rate,

        %%: A评价的经验金钱倍率
        a_rate,

        %%: B评价的经验金钱倍率
        b_rate,

        %%: C评价的经验金钱倍率
        c_rate,

        %%: D评价的经验金钱倍率
        d_rate,

        %%: 通关副本一定会获得的道具id
        giftid

 }).

-endif.