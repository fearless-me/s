%%: 声明
-ifndef(cfg_appointment).
-define(cfg_appointment, 1).

-record(appointmentCfg, {
        %%: 约会地下城id，不可重复，用于程序标识副本
        id,

        %%: 活动名称，显示在日常界面标题处
        name,

        %%: 活动时间循环类型：
        %%: 1.日循环（每日全天开放）
        %%: 2.周循环（每周固定几天）
        type,

        %%: 循环类型下的循环参数：
        %%: type为1时，参数为0
        %%: type为2时，参数为周几（支持数组），格式[1,3,5,7]
        param,

        %%: 进入地下城需求的等级，显示在界面上
        level,

        %%: 梅天阳:
        %%: 服务端定义的计数器类型（当日次数计数type），由服务器告知对应策划
        daily_type,

        %%: 活动当日可参加该地下城的有效次数，同步显示在界面上，大于此次数可以参加，但无道具奖励（友好度与不同好友组队都可获得1次）
        daily_count,

        %%: 活动界面处的背景图展示，调用路径：Client\Assets\Resources\Textures
        picture,

        %%: 废弃字段
        %%: 故事，显示在界面上
        txt,

        %%: 活动界面处的奖励展示，格式[X1,X2,...]，X调取item表id字段
        reward_show,

        %%: 活动有效时间，截止时间到后，活动结束，弹出结算面板，单位S
        time,

        %%: 活动地图id，调用mapsetting表的id字段
        mapid,

        %%: 摄像机类型，调取camera_setting表type字段（一定2.5D，具体参数camera_setting配置）
        cameratype,

        %%: 约会教程界面名称
        datetitle,

        %%: 约会教程界面简介
        datetxt,

        %%: 约会教程界面图片路径
        datepicture

 }).

-endif.