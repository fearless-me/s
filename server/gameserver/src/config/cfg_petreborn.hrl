%%: 声明
-ifndef(cfg_petreborn).
-define(cfg_petreborn, 1).

-record(petrebornCfg, {
        %%: 组id
        %%: pet表中每只骑宠会配一个组id
        groupid,

        %%: 升星次数
        %%: 转生次数
        lv,

        %%: 作者:
        %%: 标识是否是突破
        star_up,

        %%: 作者:
        %%: 转生系数
        reborn,

        %%: 作者:
        %%: 升星系数
        star,

        %%: 作者:
        %%: 升星消耗
        %%: star_up为1时，则为突破消耗
        item_star,

        quanlity

 }).

-endif.