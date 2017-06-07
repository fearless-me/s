%%: 声明
-ifndef(cfg_appointment_reward).
-define(cfg_appointment_reward, 1).

-record(appointment_rewardCfg, {
        %%: id，用于程序标识约会活动（调用appointment表id字段）
        id,

        %%: 参与角色等级区间，当只配置1个等级时，条件含义为默认大于等于该等级；配置多个等级时，条件含义为大于等于该等级小于下一条等级
        level,

        %%: 活动名称，策划仅作标记用
        name,

        %%: 结算奖励，格式为【{X，Y}，{X，Y}，...】，X为达到参数，Y为奖励道具id，奖励一定为礼包形式，X为0时为保底奖励
        reward,

        %%: 参加约会地下城一定会获得的友好度
        reward_friend,

        %%: 夫妻参与约会地下城获得的亲密度
        reward_couple

 }).

-endif.