%%: 声明
-ifndef(cfg_guildhome_task).
-define(cfg_guildhome_task, 1).

-record(guildhome_taskCfg, {
        %%: 作者:
        %%: 军团任务ID
        %%: 刺探：
        %%: 1、击杀目标军团人员幻象
        %%: 2、击杀目标军团驻地卫兵
        %%: 3、击杀目标军团玩家或被杀
        %%: 4、采集，烧帐篷
        %%: 5、采集，点燃炸药
        %%: 巡逻
        %%: 101、击杀自己驻地怪物
        %%: 102、采集，装备
        %%: 103、采集，救治伤员
        %%: 104、击杀其他军团玩家或被杀
        id,

        %%: 作者:
        %%: 任务类型
        %%: 刺探：1
        %%: 巡逻：2
        task_type,

        %%: 作者:
        %%: 1、击杀目标幻象(参数1:number)
        %%: 2、击杀怪物(参数1:monsterID,参数2:number)
        %%: 3、击杀玩家或被杀(参数1:killnumber,参数2:deadnumber) 或关系
        %%: 4、采集物品(参数1:collectID,参数2:number)
        task_subType,

        param1,

        param2,

        param3,

        point_x,

        point_y,

        %%: 作者:
        %%: 任务名字
        taskname,

        %%: 作者:
        %%: 等级≥，≤  drop
        level,

        %%: 普通时段奖励
        %%: 是drop
        normal_drop,

        %%: 作者:
        %%: 军团物资
        normal_exp,

        %%: 特殊时段
        %%: 是drop
        add_drop,

        %%: 特殊时段
        %%: 军团物资
        add_exp,

        %%: 放弃任务
        %%: 是drop
        waive_drop,

        %%: 放弃任务
        %%: 军团物资
        waive_exp

 }).

-endif.