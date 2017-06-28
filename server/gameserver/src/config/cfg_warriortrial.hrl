%%: 声明
-ifndef(cfg_warriortrial).
-define(cfg_warriortrial, 1).

-record(warriortrialCfg, {
        %%: 关卡号
        id,

        %%: 活动地图id，调取mapsetting表id字段
        mapid,

        %%: 首杀奖励
        %%: 格式:[{iterid1,num},{itemid2,num},...]
        firstkillaward,

        %%: 废弃字段
        %%: 铁血硬币奖励数量
        coinnum,

        %%: boss 刷新坐标[{x,y}]
        coordinate,

        %%: BOSS怪物ID，调取monster表id字段
        bossid,

        %%: 关卡名，显示在界面上
        name,

        %%: 废弃字段
        %%: 推荐宠物的战斗力
        petattack,

        %%: 角色推荐战斗力，在界面上推荐战力处显示
        attack,

        %%: 废弃字段
        %%: 达到attack战力后为玩家增加增益BUFF
        buff,

        %%: 废弃字段
        %%: 经验奖励
        exp,

        %%: 废弃字段
        %%: 金钱奖励区间取值
        gold,

        %%: 废弃字段
        %%: 紫色精华
        purple,

        %%: 废弃字段
        %%: 金色精华
        golden,

        %%: 扫荡掉落，调取drop表id字段，需要与击杀怪物的掉落参数一致（保证扫荡与正常通关获得奖励区间一致）
        drop,

        %%: 挑战的最大时间
        maxTime,

        %%: 废弃字段，界面模型大小在monster表UIScale字段配置
        %%: 每层怪物模型在界面中的偏移量
        offset,

        %%: 姜泓妃
        %%: 是否出现boss镜头
        %%: 0否
        %%: 1是
        camera_boss,

        %%: boss镜头动画索引id，调取animation表id字段
        animation,

        %%: 姜泓妃
        %%: 在镜头过程中，怪物与人附带的BUFF（定身/无敌）
        inprocess_buff,

        %%: 无用字段
        %%: 姜泓妃
        %%: 相机锁定的骨骼点
        bone,

        %%: 无用字段
        %%: 姜泓妃
        %%: 镜头的目标点位置
        %%: 3个参数
        %%: 1 怪物的骨骼点
        %%: 2 摄像机的距离
        %%: 3 摄像机的角度
        cam_target,

        %%: 无用字段
        %%: 姜泓妃
        %%: 镜头从角色身上移动到目标点的时间
        %%: 单位 毫秒
        movetime,

        %%: 无用字段
        %%: 姜泓妃
        %%: 在BOSS的born动画的第XX帧进行shake。
        %%: Shake的动画是做死的
        %%: 允许多个
        cam_shake

 }).

-endif.