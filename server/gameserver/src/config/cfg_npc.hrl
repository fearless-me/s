%%: 声明
-ifndef(cfg_npc).
-define(cfg_npc, 1).

-record(npcCfg, {
        %%: NPCid，每1个id代表1个NPC，连续同样的id代表1个NPC的多个功能，id<=65535
        id,

        %%: task_new中target_para字段会调用，标记唯一。
        refname,

        %%: 游戏中显示的NPC名称
        name,

        %%: 游戏中显示的NPC称谓
        title,

        %%: 用于游戏中标记与显示NPC等级
        npc_level,

        %%: NPC类型：
        %%: 0 任务NPC
        %%: 1 时空裂痕NPC（活动废弃）
        %%: 2 世界BOSS入口（首领入侵活动）
        %%: 3每日抽奖（活动废弃）
        %%: 4.勇者试炼
        %%: 5.护送NPC（活动废弃）
        %%: 6.王者像
        %%: 7.黑暗之地传送npc
        %%: 8.黑暗之地资源兑换
        %%: 9.军团副本传送NPC(活动废弃)
        %%: 10 一统天下旗帜名字占坑用（活动废弃）
        %%: 11跳舞
        %%: 12游乐场管理员
        %%: 13游乐场游乐设施
        %%: 14 全民答题NPC
        type,

        %%: Coby家族游乐场专用，其他npc默认填0
        subtype,

        %%: 模型类型，用于区分代码读取路径，适用于怪物模型做NPC用
        %%: n   //NPC模型
        %%: m  //怪物模型
        param,

        %%: 类型为npc时，此处为npc模型资源名（删除n_后）
        %%: 类型为monster时，此处为monster模型资源名（删除m_后）
        mo_type,

        %%: 场景中模型的实际缩放，100指100%大小
        multiple,

        %%: 是否根据对话角色角度变更面向
        %%: 1  //不改变面向
        %%: 0  //要改变面向
        npcface,

        %%: NPC的常态对白，游戏中跟NPC对话时显示
        commonTalk,

        %%: 同时显示为数值和（程序说有时间再来换成数组显示）
        %%: 1 商店（配合button_para1字段）     2 仓库（已废弃，当前不使用npc开启仓库界面） 
        %%: 4 参与玩法(button_para1字段配置dailyinterface中的id)     8开始抽奖（已废弃）
        %%: 16 深红熔渊兑换（仅作标记，具体商品在sourceshop表中根据groupid判断）
        %%: 32 深红熔渊下一层传送（配合enter_map字段）
        %%: 64 深红熔渊上一层传送（配合enter_map字段）
        %%: 128 战场跨服排行榜          256 角斗跨服排行榜
        %%: 512 结婚申请人和离婚申请（已废弃）
        %%: 1024 传送人（配合enter_map字段）
        %%: 2048 情缘任务接取npc      4096 离婚npc
        %%: 8192 限时广场舞NPC
        button_type,

        %%: 传送类型的NPC被点击传送后，角色进入的地图id，调用mapsetting中的id字段，0为无传送；
        %%: 当前仅在主项为深红熔渊或传送人时使用（即主项类型（button_type）为32与64或1024时）
        enter_map,

        %%: npc对话框的按钮功能（部分通用，部分功能写死）
        %%: 主项类型（button_type）为1时，代表npc商店，调用npcstore表的id字段
        %%: 主项类型（button_type）为4时，代表参加玩法，调用
        %%: dailyinterface表对应玩法的id字段
        %%: 主项不为这2项时，其他id均为代码写死作用功能
        %%:       
        button_para1,

        %%: NPC对话1，读取下面路径的音效资源：
        %%: \Client\Assets\Resources\Sound\Speech
        %%: 当talk1与talk2同时存在时，随机播放2者，配空为无音效播放
        npc_talk1,

        %%: NPC对话2，读取下面路径的音效资源:
        %%: \Client\Assets\Resources\Sound\Speech
        %%: 当talk1与talk2同时存在时，随机播放2者，配空为无音效播放
        npc_talk2,

        %%: npc模型拥有的idle_rest动作数量，没有填0，用于NPC客户端表现随机休闲待机动作
        idleRestNum,

        %%: npc对话框模型展示坐标偏移，格式为[X，Y，Z]（Z默认配0）（与show2面板通用）
        offset,

        %%: npc对话框模型展示大小缩放，100意味100%
        modelUIScale,

        %%: NPC在小地图显示的图标
        %%: 0.普通
        %%: 100.小地图不显示NPC
        %%: 1.药水（废弃类型）
        %%: 2.装备（废弃类型）
        %%: 3.活动（废弃类型）
        %%: 4.仓库（废弃类型）
        %%: 5.公会（废弃类型）
        %%: 6.小地图显示NPC
        ncp_miniicon,

        %%: 朝向角度，整数，0-360区间
        %%: 已废弃（当前通过种地图时直接修改朝向），通过种地图时旋转
        ndirection,

        %%: NPC的半身像id，读取下面路径下的半身像图片资源:
        %%: \Client\Assets\Resources\Textures
        %%: 当前改为对话读取模型，已废弃
        npc_head,

        %%: （已废弃）
        %%: NPC迷你类型，用于mini地图中npc图标显示用，不同类型图标显示不同：
        %%: 0.普通NPC
        %%: 1.药水NPC
        %%: 2.装备NPC
        %%: 3.活动NPC
        npc_minimap,

        %%: 点击NPC后是否弹出对话
        %%: 1 弹
        %%: 0 不弹
        istalk

 }).

-endif.