%%: 声明
-ifndef(cfg_allplayerquestion).
-define(cfg_allplayerquestion, 1).

-record(allplayerquestionCfg, {
        iD,

        %%: Luoch:
        %%: 全民答题的题目
        question,

        %%: Luoch:
        %%: 全民答题
        %%: 答案
        answer,

        %%: Luoch:
        %%: 全民答题
        %%: 单题结算奖励
        %%: [{货币类型ID，数量}]
        reward_server,

        %%: Luoch:
        %%: 全民答题
        %%: 单题结算奖励(客户端显示）
        %%: [{货币显示ItemID，数量}]
        reward_client

 }).

-endif.