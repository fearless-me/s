%%: 声明
-ifndef(cfg_wedding_time).
-define(cfg_wedding_time, 1).

-record(wedding_timeCfg, {
        %%: 时间段ID
        time_ID,

        %%: 婚礼起始时间
        start_time,

        %%: 婚礼结束时间
        end_time,

        %%: 该时间段可以允许婚礼类型
        %%: 1.可以举办所有婚礼类型
        %%: 2.仅可以举办豪华婚礼
        %%: 3.仅可以举办简约婚礼
        wedding_type

 }).

-endif.