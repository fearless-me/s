%%: 声明
-ifndef(cfg_mount).
-define(cfg_mount, 1).

-record(mountCfg, {
        %%: 坐骑等级
        mountLv,

        %%: 坐骑名字
        mountName,

        %%: 坐骑模型ID
        mountModelID,

        %%: 移动速度加成
        %%: [属性ID,值,加法or乘法]
        %%: 加法0 乘法1
        speed,

        %%: 属性
        %%: {属性ID，值，加法值或乘法值}
        property,

        %%: 升下一级需要消耗的食物个数
        food,

        %%: 每次消耗的个数
        %%: 客户端显示金钱为
        %%: 每次消耗个数*每个消耗的金币
        consumeNum,

        %%: 每个食物消耗的金币
        money,

        %%: 坐骑拥有的技能
        skill

 }).

-endif.