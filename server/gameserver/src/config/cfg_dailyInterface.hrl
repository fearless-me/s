%%: 声明
-ifndef(cfg_dailyInterface).
-define(cfg_dailyInterface, 1).

-record(dailyInterfaceCfg, {
        %%: 日常id
        %%: 不可重复，不能修改旧id
        id,

        %%: 日常玩法名称
        %%: 显示在日常面板中的日常名字处
        name,

        %%: 客户端显示排序
        %%: 配置越小，排列越上
        sort,

        %%: 日常玩法开启条件类型（仅用于客户端日常界面显示）
        %%: 1.等级开启
        %%: 2.任务开启
        openconditions,

        %%: 日常玩法开启条件参数（仅用于客户端日常界面显示）
        %%: openconditions为1，则parameter配置对应等级
        %%: openconditions为2，则parameter配置开启任务ID；
        parameter,

        %%: 日常玩法最低进入等级
        %%: 仅用于日常界面对应显示
        level,

        %%: 日常界面背景图名称，资源路径为：Client\Assets\Resources\Textures\DailyPanelImage
        picture,

        %%: 是否显示限时标签
        %%: 1.显示限时标签
        %%: 0.不显示限时标签
        stars,

        %%: 奖励展示道具1id
        item_1,

        %%: 奖励展示道具2id
        item_2,

        %%: 奖励展示道具3id
        item_3,

        %%: 奖励展示道具4id
        item_4,

        %%: 奖励展示道具5id
        item_5,

        %%: 奖励展示道具6id
        item_6,

        %%: 右下一级功能按钮显示文字（没有按钮，配空）
        %%: 通用文字：前往NPC的玩法，文字“寻路前往”；
        %%: 直接传送的玩法，文字“前往挑战”；特殊玩法，文字自定
        button,

        %%: 快捷组队按钮
        %%: 格式为[{等级，对应进入地图},...]，配置为0时无快捷组队按钮，聊天框中的等级显示为对应id地图的进入等级限制（mapsetting表的playerEnter_MinLevel字段）
        team,

        %%: 日常界面的活动信息内容
        txt,

        %%: 开放时间（仅在客户端日常玩法界面起显示作用）
        time,

        %%: 每日最大可玩次数（仅在客户端日常玩法界面起显示作用）
        %%: 0表示不显示
        num,

        %%: 记录次数地图组的mapID组（配合客户端num字段显示）
        %%: 格式为[{等级，地图id},...]，等级为-1时代表所有等级
        mapid,

        %%: 点击按钮后寻路前往到NPCID（寻路到npc的日常玩法无需配置lookup_mapid相关）
        npcid,

        %%: 点击按钮后寻路到某个地图ID
        %%: 走野外传送门寻路流程，不会直接传送到目标地图
        lookup_mapid,

        %%: 寻路到地图的具体坐标
        %%: 与lookup_mapid字段配合，格式为[X,Y]
        coordinate,

        %%: 暂时废弃字段
        %%: 是否显示爵位加成次数
        %%: 0不显示
        %%: 1显示
        is_showvip,

        %%: 是否是竞技活动，用于客户端页签筛选
        %%: 1为竞技活动
        %%: 0为休闲活动
        ispvp,

        %%: 客户端使用，用于区分显示该副本是否显示在组队大厅界面中。
        %%: 格式[{等级，ID}]
        %%: -1 代表所有等级
        %%: ID为0时客户端不显示在组队大厅中
        mapid_team

 }).

-endif.