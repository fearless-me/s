%%: 声明
-ifndef(cfg_skillLevelParam).
-define(cfg_skillLevelParam, 1).

-record(skillLevelParamCfg, {
        %%: 作者:
        %%: 玩家等级
        level,

        %%: 作者:
        %%: 暴击系数1
        critParam1,

        %%: 作者:
        %%: 暴击系数2
        critParam2,

        %%: 作者:
        %%: 闪避系数1
        dodgeParam1,

        %%: 作者:
        %%: 闪避系数2
        dodgeParam2,

        %%: 作者:
        %%: 破甲系数1
        breakParam1,

        %%: 作者:
        %%: 破甲系数2
        breakParam2,

        %%: 作者:
        %%: 爆伤系数1
        critdamage1,

        %%: 作者:
        %%: 爆伤系数2
        critdamage2

 }).

-endif.