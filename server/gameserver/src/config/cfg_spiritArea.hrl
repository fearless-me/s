%%: 声明
-ifndef(cfg_spiritArea).
-define(cfg_spiritArea, 1).

-record(spiritAreaCfg, {
        %%: 作者:
        %%: id
        id,

        %%: 作者:
        %%: 场景阶段等级下限（高于此等级都可以进）
        level,

        %%: 作者:
        %%: 波数
        wave,

        %%: 作者:
        %%: 类型1刷怪
        monster1,

        %%: 作者:
        %%: 类型2刷怪
        monster2,

        %%: 作者:
        %%: 类型3刷怪
        monster3,

        %%: Administrator:
        %%: 波奖励
        reward

 }).

-endif.