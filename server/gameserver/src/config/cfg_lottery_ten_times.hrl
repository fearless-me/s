%%: 声明
-ifndef(cfg_lottery_ten_times).
-define(cfg_lottery_ten_times, 1).

-record(lottery_ten_timesCfg, {
        %%: 抽奖次数
        id,

        %%: 填库ID
        goblin_ten_times,

        %%: 填库ID
        treasure_ten_times

 }).

-endif.