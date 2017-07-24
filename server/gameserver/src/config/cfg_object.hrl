%%: 声明
-ifndef(cfg_object).
-define(cfg_object, 1).

-record(objectCfg, {
        %%: admin:
        %%: 采集品id
        %%: 1000-1999为副本地表采集物type16
        id,

        %%: admin:
        %%: 采集品名字
        name,

        %%: 微软用户:
        %%: 物件类型：
        %%: CollectType = 1,        // 采集品类型
        %%: UseItemType = 2,        // 使用品类型
        %%: DropItemType = 3,       // 掉落物品类型
        %%: GuildCannonType = 4,    // 最强军团炮台专用类型
        %%: CrossServe1Type = 5,    // 跨服战场专用采集
        %%: CrossServe2Type = 6,    // 跨服血腥角斗场采集物专用
        %%: CrossServe3Type = 7,    // 跨服血腥角斗场大炮专用
        %%: GuildResident = 8,      // 军团驻地(触发幻象)
        %%: GuildResidentCollect = 9,// 军团驻地采集物
        %%: GuildGrabFlag = 10,     // 军团据点插旗
        %%: GuildGrabBuff = 11,     // 军团据点buff
        %%:                 12,     //骑宠竞速，param1为类型， 1里程碑
        %%:                                                    2加速带
        %%:                                                    3减速陷阱
        %%:                                                    4强化加速带
        %%:                                                    5强化减速带
        %%:                                                    6道具箱
        %%:                                     param2，对于类型2345【buffid，强化buffid】，采集物所需要的buff，
        %%:                                             对于里程碑，标记第几里程碑，终点为【0】
        %%: GuildSnowCollect = 13,  // 军团堆雪人采集物
        %%: GuildBattle   = 15,     // 家族战采集物 
        %%: object.type=16    //副本地表采集物
        type,

        %%: admin:
        %%: 资源ID
        animation,

        %%: admin:
        %%: 资源ID 2
        animation2,

        %%: 微软中国:
        %%: 头像ID
        icon,

        %%: admin:
        %%: 采集时间，毫秒。
        collect_time,

        %%: 姜泓妃
        %%: 0：采集动作
        %%: 1：碰撞
        %%: 不填：按已有采集物类型来处理
        collect_mode,

        %%: 使用物品type2的
        %%: 使用后animation2的状态持续时间
        hold_time,

        %%: admin:
        %%: 采集进度条的文本
        collect_string,

        %%: admin:
        %%: 收集时播放的特效
        collect_sfx,

        %%: admin:
        %%: 备用参数
        param1,

        param2,

        %%: 刷新时间(秒)
        %%: 0 表示不刷新，采集完就永远消失
        freshCD,

        %%: 可采集次数，0无限次
        gather_Times,

        %%: 额外掉落ID，索引掉落表
        dropid

 }).

-endif.