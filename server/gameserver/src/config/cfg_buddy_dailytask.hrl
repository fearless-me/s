%%: 声明
-ifndef(cfg_buddy_dailytask).
-define(cfg_buddy_dailytask, 1).

-record(buddy_dailytaskCfg, {
        %%: 日常ID
        id,

        %%: 排序数值小到大
        sort,

        %%: 界面描述文字
        describe,

        %%: 类型：
        %%: 1 完成拉霸游戏
        %%: 2 完成时空裂痕
        %%: 3 完成指定类型副本
        %%: 4 完成守卫碧空城摸宝
        %%: 5 完成一次盗宝贼(没用空着不用他，以后要用新类型新增)
        %%: 6 首领入侵对boss造成一次伤害
        %%: 7 结束一次战场收益
        %%: 8 通关至少一关保护小羊
        %%: 9 连续在线
        useType,

        useParam1,

        useParam2,

        %%: 每日完成次数显示
        num,

        %%: 完成所增加的活跃度
        active

 }).

-endif.