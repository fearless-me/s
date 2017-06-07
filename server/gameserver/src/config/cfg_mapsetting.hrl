%%: 声明
-ifndef(cfg_mapsetting).
-define(cfg_mapsetting, 1).

-record(mapsettingCfg, {
        %%: 地图ID,不可重复
        id,

        %%: 地图类型
        %%: 0 普通地图  1 副本  2 位面
        %%: 3 玩法地图  4 无用  5 军团副本
        type,

        %%: 地图子类型
        %%: 888，子类型，游乐场地图，特殊处理同步规则
        %%: 主项type为 0 普通地图时，subtype为0 普通   【3 BOSS地图，废弃】
        %%: 主项type为 1 副本时，subtype为0 普通副本 6 英雄副本   9挑战副本  8单人军团副本  【1 魔神地宫 废弃】
        %%: 1001 玩法（铸币） 1002 玩法（新兵） 1003 玩法（星空） 1004 玩法（藏宝） 1005多人军团副本  1006情缘团队副本
        %%: 1007 挑战30关   1008先锋行动
        %%: 主项为 2 位面
        %%: 0 普通位面 2 时空裂痕 4 切磋位面
        %%: 主项为 3 特殊玩法地图 
        %%: 7 混沌战场地图
        %%: 8 虚空BOSS地图
        %%: 9 军团领地战
        %%: 10 战天下活动地图
        %%: 11护送玩法
        %%: 12 黑暗之地
        %%: 13 黑暗之地准备间
        %%: 14 军团争霸战
        %%: 15跨服战场
        %%: 16 军团驻地
        %%: 17血腥角斗
        %%: 18竞技场
        %%: 19 沙盘军团玩法 一统天下
        %%: 20 结婚地图
        %%: 21 乱世为王
        %%: 22 经验地图
        %%: 主项为 4
        %%: 这里不用判断，这是无用的地图
        subtype,

        name,

        %%: 地图描述
        desc,

        %%: 游戏中地图显示的名字
        show_name,

        %%: 难度不相同，为同一组副本的标示。英雄副本难度梯度用
        instance_group,

        %%: 王亚栋
        %%: 英雄副本难度
        %%: 1-5
        difficulty,

        %%: admin:
        %%: 1号资源
        res1,

        %%: admin:
        %%: 2号资源
        res2,

        %%: 李菡琦:
        %%: 不填表示不显示小地图
        useminimap,

        %%: 进入场景初始默认摄像机纵向角度
        cam_pitch,

        %%: 进入场景初始默认摄像机横向角度
        cam_yaw,

        %%: 角色进入地图初始朝向，0~6.28
        role_direction,

        %%: admin:
        %%: 3号资源
        res3,

        %%: admin:
        %%: 地图内怪物死亡掉落，从【drop】表中查询。
        %%: 掉落物id
        dropid,

        %%: admin:
        %%: 装备掉落id
        equipdropid,

        %%: 副本的排序，按id大小来排
        copyrand,

        %%: 该场景允许玩家进入的最小等级
        playerEnter_MinLevel,

        %%: 该场景允许玩家进入的最大等级（配置游戏角色最高等级限制）
        playerEnter_MaxLevel,

        %%: admin:
        %%: pk标注
        %%: 1 可以切磋
        %%: 2 可以杀戮
        %%: 1+2 都可以
        pkflag,

        %%: 场景的背景音乐名称，调用路径为：Client\Assets\Resources\Sound\Music
        music,

        %%: admin:
        %%: 环境音效
        ambient,

        %%: 世界地图所在X坐标
        worldMapx,

        %%: 世界地图所在Y坐标
        worldMapy,

        %%: 地图进入人数最大数
        maxnum,

        %%: 是否单人副本。
        %%: 0 不是
        %%: 1 是
        if_single,

        %%: 地图进入次数(每天）
        %%: 当地图的类型与子类型都为为副本时，配置9999，代表无限次
        daily_entercount,

        %%: 副本进入次数组，同样id共用次数限制
        %%: 1为元素保卫战
        %%: 2为经验副本
        daily_entercount_group,

        %%: 副本有效次数
        %%: 只有type为1，subtype=0、6、9的时候有效，配置9999时代表无限次
        daily_effectivecount,

        %%: 副本进入条件：
        %%: 1.前置任务
        %%: 2.背包内拥有道具ID
        enter_Conditions,

        %%: 对应进入条件参数
        enter_Conditions_Param,

        %%: aa:
        %%: 副本关卡配置
        %%: [{关卡初始化设置,关卡结束判断条件}]
        scheduleConf,

        %%: 副本单独事件
        %%: [{独立事件初始化设置,独立事件结束判断条件}]
        parallelScheduleConf,

        %%: 地图存在总时间
        %%: 地图创建开始计时，单位：秒。超过该时间后强制销毁副本地图,角色被传出当前场景
        %%: 副本类型会在主界面右上角显示倒计时时间
        %%: 副本类型配置为86400时不做倒计时显示
        all_time,

        %%: 结算面板等待时间，单位秒，超过此时间自动离开该场景
        finish_time,

        %%: 临时离开保护时间，单位秒，在此时间内保留场景进度
        wait_time,

        %%: 位面地图归属于哪张普通地图，仅适用位面地图
        belongto,

        %%: 第一次进场景，是否需要场景浏览功能
        need_view,

        %%: 如果最终目的已经达成，那就干掉副本里剩下的怪，无论是栽的、刷的、召唤的
        %%: 1 干掉
        %%: 0 不干掉，放他们一马
        kill_thelastofus,

        %%: 位面，副本怪物等级是否需要自动匹配角色等级
        %%: 1 需要匹配
        %%: 0 不需要匹配
        matching,

        %%: 张龙:
        %%: 副本面板上的怪物攻防属性
        monster_element,

        %%: 副本界面奖励显示
        drop_show,

        %%: 切磋配置项
        %%: 仅可切磋场景需求配置，调取服务器映射切磋地图ID（mapsetting）
        onevsone,

        %%: 进入副本扣除的掉率数值
        %%: 仅副本地图应用，与进入等级相差10级外不会扣除
        dropnum,

        %%: 每次进入地图播放动画id
        %%: 调用动画索引表id
        animation,

        %%: 昼夜变化（灯光，天空盒不同）
        %%: 0  普通昼夜时间
        %%: 1  只有白天（Lightmap-X_comp_light）
        %%: 2  只有晚上 
        daynight,

        %%: 进入地图需要消耗的体力值,当前仅副本地图应用
        useVitality,

        %%: 地图允许进入的时段
        %%: [起始时间,结束时间]，时间格式XXYY，XX代表时，YY代表分，不限制时间配[0,0]
        timestep,

        %%: 白天刷新的Monster，NPC与采集物id，id调用chaos表的type字段，格式[MonsterID, NpcID,采集物ID]，无刷新配[0,0,0]
        day,

        %%: 夜晚刷新的Monster，NPC与采集物id，id调用chaos表的type字段，格式[MonsterID, NpcID,采集物ID]，无刷新配[0,0,0]
        night,

        %%: 因为当前为3D模式，此字段已废弃
        %%: 摄像机左右最大可旋转角度，正负各自都是此配置
        cam_yawmove,

        %%: 已废弃字段
        %%: 城镇类型(小地图）
        %%: 0.不显示
        %%: 1.野外mapsence.png
        %%: 2.城镇city.png
        map_type,

        %%: 已屏蔽
        %%: 副本和位面的开头动画名字
        cutscene,

        %%: user:
        %%: 每日购买总次数
        %%: 仅副本地图使用
        buytime,

        %%: user:
        %%: 购买次数消耗钻石价格，格式[{变更次数1,钻石价格},...]
        %%: 仅副本地图使用
        buycost,

        %%: 副本队伍类型（当为1时，会在组队大厅中显示该副本）
        %%: 1 是组队副本
        %%: 0 其他（默认）
        teamtype

 }).

-endif.