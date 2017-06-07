%%: 声明
-ifndef(cfg_npcdancer).
-define(cfg_npcdancer, 1).

-record(npcdancerCfg, {
        %%: 跳舞文字框或表情id，不能重复
        id,

        %%: 插入时刻类型：
        %%: 1.刚开始跳舞的时刻
        %%: 2.跳舞中的时间段
        %%: 3.刚结束跳舞的时刻
        %%: 4.本次跳舞与下次跳舞见的休息时间段
        type,

        %%: 表情或文字框内容，格式${A}内容/<表情id>${B}内容/<表情id>...,A,B为随机人，整个配置前加！代表一起弹，不加！代表按顺序随机人谈
        dialogue

 }).

-endif.