%%: 声明
-ifndef(cfg_bribery_money).
-define(cfg_bribery_money, 1).

-record(bribery_moneyCfg, {
        iD,

        %%: 红包类型
        %%: 1世界红包
        %%: 2军团红包
        %%: 3结婚红包
        type,

        %%: 发红包的最低个数
        min_num,

        %%: 发红包的最大个数
        max_num,

        %%: 单个红包最低钻石
        min_money,

        %%: 单个红包最多钻石数
        max_money,

        %%: 红包存在时间
        %%: 单位秒
        time,

        %%: 红包的发送CD时间
        %%: 单位秒
        cD

 }).

-endif.