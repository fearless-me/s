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
        %%: 模型名字:%前字母表类型n-npc，m-monster，c-采集物
        %%: 无%符号表特效
        %%: 末尾加！表示受摄像机转动效果影响
        %%: 特效名字
        %%: 默认在Client\Assets\Resources\VFX\other下边
        %%: 如需其他文件的特效填写成 文件名\特效名，文件名只能是VFX下边的文件
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