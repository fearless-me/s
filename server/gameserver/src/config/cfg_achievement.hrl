%%: 声明
-ifndef(cfg_achievement).
-define(cfg_achievement, 1).

-record(achievementCfg, {
        id,

        %%: 类型分页
        %%: 1勇者之路 
        %%: 2无尽财富
        %%: 3登峰造极
        %%: 4社交养成
        %%: 5王者霸权
        %%: 6节日活动
        type,

        %%: 分页成就项
        subtype,

        %%: 成就不要删除行 
        %%: 1 不显示 不要这行成就
        %%: 0 正常使用
        open,

        %%: 成就名
        name,

        %%: 给自己看的描述
        %%: 玩家看不到
        describe,

        %%: 客户端显示成就条件
        show,

        %%: user:
        %%: 0，从0开始计数
        %%: 1，从1开始计数，后面一列对应数字减1
        limit,

        %%: 奖励
        %%: {目标，成就点，钻石=}
        %%: -1 怪物击杀个数
        %%: -2 2位 
        reward,

        %%: 称号ID
        %%: 用数组 [X,X,X]
        %%: 如果没有给称号
        %%: 则空置 不填写
        titleid,

        %%: 杀目标怪物
        %%: reward第一项为-1时用
        goal_kill

 }).

-endif.