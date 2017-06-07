%%: 声明
-ifndef(cfg_guildbless_schedule).
-define(cfg_guildbless_schedule, 1).

-record(guildbless_scheduleCfg, {
        %%: 作者:
        %%: 序号
        id,

        %%: 作者:
        %%: 进度值，到达该进度值使用该条记录
        schedule,

        %%: 作者:
        %%: 获得礼包id
        itemID

 }).

-endif.