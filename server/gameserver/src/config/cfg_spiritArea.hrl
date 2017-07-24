%%: 声明
-ifndef(cfg_spiritArea).
-define(cfg_spiritArea, 1).

-record(spiritAreaCfg, {
        %%: id,不可重复
        id,

        %%: 活动等级段下限（高于此等级都可以进）
        level,

        %%: 波数
        wave,

        %%: 类型1刷怪，格式[{怪物id,数量,概率,坐标X,坐标Y},...]
        monster1,

        %%: 类型2刷怪，格式[{怪物id,数量,概率,坐标X,坐标Y},...]
        monster2,

        %%: 类型3刷怪，格式[{怪物id,数量,概率,坐标X,坐标Y},...]
        monster3,

        %%: 波奖励,格式[{道具id,数量},...]
        reward

 }).

-endif.