%%: 声明
-ifndef(cfg_pet_pvp).
-define(cfg_pet_pvp, 1).

-record(pet_pvpCfg, {
        id,

        %%: 领地类型
        %%: 1 金币
        %%: 2 道具
        %%: 3 碎片
        %%: 4综合
        type,

        %%: 领地名称
        name,

        %%: 显示领地等级
        level,

        %%: 领地资源图
        res,

        %%: 地图所在X坐标
        petmapx,

        %%: 地图所在Y坐标
        petmapy,

        %%: 领地收益 物品item
        drop_item,

        %%: 2 绑定金币
        drop_money,

        %%: 显示占领结算获得物品
        %%: [{物品item,物品数量}]
        drop_show,

        %%: 领地收益结算时间间隔
        %%: （15分钟=1）
        time,

        %%: 占领之后结算时的勋章
        integral

 }).

-endif.