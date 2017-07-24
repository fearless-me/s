%%: 声明
-ifndef(cfg_equipIntenLevel).
-define(cfg_equipIntenLevel, 1).

-record(equipIntenLevelCfg, {
        %%: 强化等级
        level,

        %%: 属性奖励
        %%: [{属性ID，数值，加法或乘法值}]
        %%: 0 加法值
        %%: 1 乘法值
        bonus,

        %%: 升到下一级消耗的材料
        %%: [{ID，数量}]
        materialCost,

        %%: 其余道具在消耗时可自动转化为MaterialCost
        %%: [{被转化的道具id，转化比例}]
        %%: 转化比例为，被转化道具：转化后道具
        %%: 填0为不转化
        materialTransform,

        suitIs,

        %%: 全部位强化奖励，逐行累加
        allBonus,

        %%: 张龙
        %%: 特效等级
        %%: w1_1_1（职业，部位，等级）
        %%: 如果是负数则不显示特效
        vfxLv

 }).

-endif.