%%: 声明
-ifndef(cfg_daily_interface).
-define(cfg_daily_interface, 1).

-record(daily_interfaceCfg, {
        %%: Luoch:
        %%: 活动ID，不可重复，客户端使用。
        id,

        %%: Luoch:
        %%: 该活动的类型，影响显示在哪一个签页下。
        %%: 1 日常玩法
        %%: 2 限时活动
        %%: 4 竞技玩法
        activitytype,

        name,

        %%: Luoch:
        %%: 影响在该签页下的默认显示顺序。但是实际顺序会受到程序代码排序规则影响。
        position,

        %%: Luoch:
        %%: 该活动的图标、背景图资源。
        %%: 当玩法类型为1时，对应的活动图标资源。
        %%: 当玩法类型为2时，对应背景图资源。
        %%: 当玩法类型为3时，对应图标资源。
        activity_icon,

        %%: Luoch:
        %%: 主要产出奖励类型（最多显示两个）
        %%: 1 金币
        %%: 2 材料
        %%: 3 经验
        rewardtype,

        %%: Luoch:
        %%: 控制是否显示并检测更新该类活动的次数。
        %%: 注：仅独立功能副本可以检测。
        active_num,

        %%: 日常玩法最低进入等级
        %%: 仅用于日常界面对应显示
        level,

        %%: Luoch:
        %%: 该大类活动的描述
        describe_all,

        main_output,

        begintime,

        button_string,

        %%: Luoch:
        %%: 按钮寻路功能
        %%: [x,{y1,y2}]
        %%: X 为1寻路npc,为2寻路地图，为3寻路具体坐标。
        %%: Y1,y2为具体寻路的参数
        button_function

 }).

-endif.