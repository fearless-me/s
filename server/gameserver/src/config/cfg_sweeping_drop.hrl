%%: 声明
-ifndef(cfg_sweeping_drop).
-define(cfg_sweeping_drop, 1).

-record(sweeping_dropCfg, {
        %%: 副本的ID,调取mapsetting表的id字段
        id,

        %%: 副本名称，策划内部标记用
        name,

        %%: 经验奖励
        exp,

        %%: 金钱奖励区间取值
        gold,

        %%: 紫色精华奖励
        purple,

        %%: 金色精华奖励
        golden,

        %%: 扫荡掉落，调取drop表
        drop,

        %%: 扫荡一次消耗金币
        cost_money

 }).

-endif.