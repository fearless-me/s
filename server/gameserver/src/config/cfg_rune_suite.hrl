%%: 声明
-ifndef(cfg_rune_suite).
-define(cfg_rune_suite, 1).

-record(rune_suiteCfg, {
        id,

        num,

        %%: 符文套装属性：
        %%: {[属性id，属性值，加法或乘法]}
        property,

        %%: 客户端描述
        dec,

        %%: Administrator:
        %%: 假战斗力系数
        addpower

 }).

-endif.