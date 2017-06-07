%%: 声明
-ifndef(cfg_copymapScheduleInit).
-define(cfg_copymapScheduleInit, 1).

-record(copymapScheduleInitCfg, {
        %%: 副本关卡初始化设置id
        id,

        %%: 策划内部标记注释用
        name,

        %%: 刷怪
        %%: 刷怪范例[{怪物id,个数,坐标X,坐标Z},...]
        %%: [{306,1,101,105},{306,1,21,35},{307,4,85,96}]，使用radius原地范围刷新时，无需配置坐标XY
        addmonster,

        %%: 进地图刷采集品
        %%: [{采集id,个数,坐标X,坐标Y}]
        addcollect,

        %%: 开门的id
        openthedoor1,

        %%: 开门的id
        openthedoor2,

        %%: 开门的id
        openthedoor3,

        %%: 开门的id
        openthedoor4,

        play_show1,

        %%: 菡琦:
        %%: 参看show2表
        play_show2,

        %%: 开始前文字id索引，调取copymapScheduleCharacters表id字段
        characters,

        %%: 波数完成提示（单纯显示用，与正常实际进度不冲突）
        %%: 显示当前波数与总波数，配置格式[X,Y],X为当前波数，Y为总波数
        progress,

        %%: 怪物坐标随机刷新范围半径，单位米
        %%: 配合addmonster与coordinate字段，在addmonster或coordinate坐标的基础上半径范围随机刷新怪物，当addmonster坐标为空或coordinate为0时，为角色周围半径随机刷新
        radius,

        %%: 额外精英怪物组ID列表（丰富副本怪物刷新表现形式）
        %%: addmonster基础怪物刷新外的精英怪物组刷新id，配合elitenum，coordinate与radius字段，格式[{X1,X2,...},{X3,X4,...},...]
        elite,

        %%: 精英怪物组刷新数量
        %%: 每组怪物从elite精英怪物组中随机取，之后配合coordinate与radius字段
        elitenum,

        %%: 额外小怪组ID列表（丰富副本怪物刷新表现形式）
        %%: addmonster基础怪物刷新外的小怪组刷新id，配合coordinate与radius字段，格式[{X1,X2,...},{X3,X4,...},...]，无组数量控制，配置的所有组怪物都会刷新
        monster,

        %%: 额外BOSS组ID列表（丰富副本怪物刷新表现形式）
        %%: addmonster基础怪物刷新外的BOSS组刷新id，配合coordinate与radius字段，格式[{X1,X2,...},{X3,X4,...},...]，无组数量控制，配置的所有组怪物都会刷新
        boss,

        %%: 怪物组坐标
        %%: 怪物组刷新组坐标，格式[{X1,X2,...},{X3,X4,...},...]，配合monster，boss，elite字段进行，
        coordinate,

        %%: 该波开始时刻，角色的自动寻路坐标
        pathfinding,

        %%: 条件，条件满足的情况下触发事件event，无条件时配[{0}]，格式[{id,参数},...](且关系)
        %%: 0.无条件触发
        %%: 1.为需要第一次进行副本状态（无参数）
        %%: 2.为生命小于等于多少生命（参数1：1代表百分比，0代表数值；参数2：对应百分比或数值）
        condition,

        %%: 事件定义，condition条件下触发，无condition条件，直接触发，每条定义程序写死
        %%: 格式[id]
        %%: 1.为副本觉醒引导，与之相关的其他参数在globsetup表中配置
        %%: 2.女神技能预览引导，eventParam1配置触发的技能id
        event,

        %%: 事件参数1
        %%: 事件1时，为对应职业调用技能id，格式[{职业，技能id}...]
        eventParam1,

        %%: 事件参数2
        %%: 事件1时，为对应职业更换武器模型，调取transformspell表对应level行的模型参数，当前为调用20级的模型
        eventParam2,

        %%: 事件参数3
        eventParam3,

        %%: 进度插入动画名称索引id，调用animation表id字段
        animation,

        %%: 在动画进程中，人附带的无敌沉默BUFF
        inprocess_buff,

        %%: 魔神地宫，整个小队一共能死多少次
        fable_die,

        %%: 张龙:魔神地宫的准备时间，秒
        fable_preparetime,

        %%: 魔神地宫每一关的挑战时间/秒
        fable_challengetime,

        %%: 姜泓妃
        %%: 是否出现boss镜头
        %%: 0否
        %%: 1是
        camera_boss,

        %%: 姜泓妃
        %%: 摄像机对准的目标怪
        %%: 注意：同一关卡不允许出现相同ID的目标怪
        bossid,

        %%: 姜泓妃
        %%: 相机锁定的怪物的骨骼点
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