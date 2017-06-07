%%: 声明
-ifndef(cfg_petfairy_point).
-define(cfg_petfairy_point, 1).

-record(petfairy_pointCfg, {
        %%: Administrator:
        %%: 代表等级
        id,

        %%: Administrator:
        %%: 此列代表冲星突破确认
        %%: 0代表未突破
        %%: 1代表突破
        order,

        %%: Administrator:
        %%: 此列代表转生突破确认
        %%: 0代表未突破
        %%: 1代表突破
        brkthrough,

        %%: 冲星点数（读取当前数据）
        %%: [A,B,C,D,E]
        %%: A代表白色品质宠物获取的点数
        %%: B代表绿色品质宠物获取的点数
        %%: C代表蓝色品质宠物获取的点数
        %%: D代表紫色品质宠物获取的点数
        %%: E代表橙色品质宠物获取的点数
        enhan_point,

        %%: 转生点数（读取当前数据）
        %%: [A,B,C,D,E]
        %%: A代表白色品质宠物获取的点数
        %%: B代表绿色品质宠物获取的点数
        %%: C代表蓝色品质宠物获取的点数
        %%: D代表紫色品质宠物获取的点数
        %%: E代表橙色品质宠物获取的点数
        reborn_point,

        %%: 突破材料：
        %%: []表示不突破
        %%: [X,Y]x代表材料ID，Y代表数量
        enhance_material,

        %%: 突破材料：
        %%: []表示不突破
        %%: [X,Y]x代表材料ID，Y代表数量
        reborn_material

 }).

-endif.