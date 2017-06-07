%%: 声明
-ifndef(cfg_rune_battlepower).
-define(cfg_rune_battlepower, 1).

-record(rune_battlepowerCfg, {
        propertyId,

        %%: Administrator:
        %%: 策划看的
        desc,

        %%: Administrator:
        %%: 策划看的
        minitips,

        %%: Administrator:
        %%: 标准加法战斗力
        standard_addition,

        %%: Administrator:
        %%: 标准乘法战斗力
        standard_multi,

        %%: Administrator:
        %%: 标准战斗力
        power,

        %%: Administrator:
        %%: 骑宠标准战斗力
        pet_power

 }).

-endif.