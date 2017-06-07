%%: 声明
-ifndef(cfg_warriortrial).
-define(cfg_warriortrial, 1).

-record(warriortrialCfg, {
        %%: 关卡号
        id,

        mapid,

        %%: 首杀奖励
        %%: 格式:[{iterid,num},{itemid,num}]
        firstkillaward,

        %%: 铁血硬币数量
        coinnum,

        %%: boss 刷新坐标
        %%: [{x,y}]
        coordinate,

        %%: 刷新的怪物ID
        bossid,

        %%: 关卡显示名
        name,

        %%: 需求宠物的战斗力
        petattack,

        %%: 标准战斗力
        attack,

        %%: 达到标准战斗力后为玩家增加的BUFF
        buff,

        %%: 经验奖励
        exp,

        %%: 金钱奖励区间取值
        gold,

        %%: 紫色精华
        purple,

        %%: 金色精华
        golden,

        %%: 扫荡掉落
        drop,

        %%: 挑战的最大时间
        maxTime,

        %%: 每层怪物模型在界面中的偏移量
        offset,

        %%: 姜泓妃
        %%: 是否出现boss镜头
        %%: 0否
        %%: 1是
        camera_boss,

        animation,

        %%: 姜泓妃
        %%: 在镜头过程中，怪物与人附带的BUFF
        inprocess_buff,

        %%: 姜泓妃
        %%: 相机锁定的骨骼点
        bone,

        %%: 姜泓妃
        %%: 镜头的目标点位置
        %%: 3个参数
        %%: 1 怪物的骨骼点
        %%: 2 摄像机的距离
        %%: 3 摄像机的角度
        cam_target,

        %%: 姜泓妃
        %%: 镜头从角色身上移动到目标点的时间
        %%: 单位 毫秒
        movetime,

        %%: 姜泓妃
        %%: 在BOSS的born动画的第XX帧进行shake。
        %%: Shake的动画是做死的
        %%: 允许多个
        cam_shake

 }).

-endif.