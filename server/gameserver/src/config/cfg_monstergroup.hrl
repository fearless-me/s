%%: 声明
-ifndef(cfg_monstergroup).
-define(cfg_monstergroup, 1).

-record(monstergroupCfg, {
        %%: 刘展:
        %%: 组id 由item表使用类型25关联
        groupid,

        %%: 刘展:
        %%: 怪物id关联monster表
        monsterid,

        %%: 刘展:
        %%: 刷新权重
        weight,

        %%: 刘展:
        %%: 刷新最小数量
        min,

        %%: 刘展:
        %%: 刷新最大数量
        max,

        %%: 刘展:
        %%: 是否跑马灯
        %%: 0不要
        %%: 1需要
        need_broadcast,

        %%: 刘展:
        %%: 召唤类型
        %%: 1怪物
        %%: 2载体（烟花）
        callType

 }).

-endif.