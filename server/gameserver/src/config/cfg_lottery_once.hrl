%%: 声明
-ifndef(cfg_lottery_once).
-define(cfg_lottery_once, 1).

-record(lottery_onceCfg, {
        %%: 抽奖次数
        %%: 抽奖次数只有15次 固定的
        id,

        %%: 金币抽取的 一般库权重
        goblin_free,

        %%: 金币抽取的稀有库权重
        goblin_pay_money,

        %%: 钻石抽取的一般库权重
        treasure_free,

        %%: 钻石抽取的稀有库权重
        treasure_pay_money

 }).

-endif.