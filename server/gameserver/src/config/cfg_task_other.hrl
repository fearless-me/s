%%: 声明
-ifndef(cfg_task_other).
-define(cfg_task_other, 1).

-record(task_otherCfg, {
        %%: 触发类型
        %%: 1，用于限时活动，在活动开启时触发，或活动限时期间上线时触发
        %%: 2，到达等级时触发
        type,

        %%: type为1时，表示activity里的活动id
        %%: type为2时，表示角色等级
        id,

        %%: 触发任务的等级限制
        level,

        %%: type为有效
        %%: 是否每次活动期间都会触发任务
        %%: 0只触发第一次，1每次都触发
        loop,

        %%: 触发的任务组id
        taskid

 }).

-endif.