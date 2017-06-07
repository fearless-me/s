%%: 声明
-ifndef(cfg_equipdrop).
-define(cfg_equipdrop, 1).

-record(equipdropCfg, {
        %%: 装备掉落ID，可重复
        equipdropId,

        %%: 掉落描述
        dropDes,

        %%: 掉落类型
        %%: 1 随机掉落
        %%: 2 指定装备ID
        dropType,

        %%: 掉落来源 ,指定ID不用该字段
        %%: 1 普通掉落
        %%: 2 礼包掉落
        %%: 3 普通独特套装掉落
        %%: 4 英雄独特套装掉落
        dropSource,

        %%: 此行掉落行为执行次数
        times,

        %%: 不掉率
        noDrop,

        %%: 物品ID
        equipID,

        %%: 指定ID装备使用，独特与套装填写0
        %%: 1 白色
        %%: 2 绿色
        %%: 3 蓝色
        %%: 4 紫色
        equipQuality,

        %%: 装备的难度系数筛选下限
        minDiffcult,

        %%: 装备的难度系数筛选上限
        maxDiffcult,

        %%: 掉落装备等级小于等于
        %%: 1 怪物等级
        %%: 2 礼包物品等级
        dropLevel,

        %%: 白装权重
        quality0,

        %%: 绿装权重
        quality1,

        %%: 蓝装权重
        quality2,

        %%: 紫装权重
        quality3,

        %%: 独特权重
        %%: 橙色
        quality4,

        %%: 套装权重
        %%: 红色
        quality5,

        %%: 0 不绑定
        %%: 1 绑定
        isbind,

        %%: 受地图设置内的难度影响
        %%: 0 不受影响
        %%: 1 受影响
        mapDiffcult

 }).

-endif.