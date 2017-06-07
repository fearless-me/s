%%: 声明
-ifndef(cfg_task_obj).
-define(cfg_task_obj, 1).

-record(task_objCfg, {
        %%: 李菡琦:
        %%: 采集物物品id
        id,

        %%: 李菡琦:
        %%: 1.模型
        %%: 2.特效
        type,

        belong,

        %%: 李菡琦:
        %%: 模型名字
        %%: 特效名字
        %%: 路径默认
        name,

        %%: 李菡琦:
        %%: 需要刷出的坐标点
        %%: [x,y,z]
        location,

        %%: 李菡琦:
        %%: 刷出物品时，旋转方向
        %%: [x,y,z]
        rotate,

        %%: admin:
        %%: 缩放
        scale,

        %%: 李菡琦:
        %%: 所属地图
        maps,

        %%: 李菡琦:
        %%: 附着物
        %%: 在物品上附着特效用
        attach,

        %%: admin:
        %%: 偏移
        attachOffset

 }).

-endif.