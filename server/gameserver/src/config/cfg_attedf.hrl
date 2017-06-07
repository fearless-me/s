%%: 声明
-ifndef(cfg_attedf).
-define(cfg_attedf, 1).

-record(attedfCfg, {
        %%: 等级
        lv,

        %%: 物防转换系数
        dEF,

        %%: 魔防转换系数
        rES,

        %%: 暴击转换系数
        cRI,

        %%: 抗暴转换系数
        rCRI,

        %%: 爆伤转换系数
        cRITICAL,

        %%: 韧性转换系数
        tOU,

        %%: 命中转换系数
        hIT,

        %%: 闪避转换系数
        eVADE,

        %%: 破甲装换系数
        pEN

 }).

-endif.