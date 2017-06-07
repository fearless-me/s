%%: 声明
-ifndef(cfg_equipIntensify).
-define(cfg_equipIntensify, 1).

-record(equipIntensifyCfg, {
        iD,

        %%: 强化等级
        level,

        %%: 职业
        %%: 1 骑士
        %%: 2 法师
        %%: 3 刺客
        %%: 4 魔女
        class,

        %%: 基础属性倍率
        baseBonus,

        %%: 主手属性奖励
        %%: [{属性ID，数值，加法或乘法值}]
        %%: 0 加法值
        %%: 1 乘法值
        mainHandBonus,

        %%: 副手属性奖励
        offHandBonus,

        %%: 衣服属性奖励
        chestBonus,

        %%: 鞋子属性奖励
        bootBonus,

        %%: 戒指属性奖励
        ringBonus,

        %%: 项链属性奖励
        amuletBonus,

        %%: 头盔属性奖励
        helmBonus,

        %%: 裤子属性奖励
        pantBonus,

        %%: 升到下一级消耗的金币
        goldCost,

        %%: 全部位强化奖励，逐行累加
        allBonus,

        %%: 升到下一级消耗的材料
        %%: [{ID，数量}]
        materialCost,

        %%: 张龙
        %%: 主手套装特效
        sfx_1,

        %%: 张龙
        %%: 副手套装特效
        sfx_2,

        %%: 张龙
        %%: 衣服套装特效
        sfx_3

 }).

-endif.