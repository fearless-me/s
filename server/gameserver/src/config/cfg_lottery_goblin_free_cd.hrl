%%: 声明
-ifndef(cfg_lottery_goblin_free_cd).
-define(cfg_lottery_goblin_free_cd, 1).

-record(lottery_goblin_free_cdCfg, {
        %%: 抽奖次数
        id,

        %%: cd时间
        cd

 }).

-endif.