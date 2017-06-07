%%: 声明
-ifndef(cfg_lotteryForTower).
-define(cfg_lotteryForTower, 1).

-record(lotteryForTowerCfg, {
        %%: admin:
        %%: 奖池ID
        pool_id,

        id,

        %%: admin:
        %%: 该奖池每天最大被抽中次数
        pool_times_perday,

        %%: admin:
        %%: 道具ID
        item_id,

        %%: aa:
        %%: 物品数量
        item_number,

        %%: admin:
        %%: 道具权重
        %%: 奖池总权重10000
        item_weight,

        %%: admin:
        %%: 是否需要跑马灯
        need_brodcast,

        %%: admin:
        %%: 是否绑定
        %%: 0不绑定
        %%: 1绑定
        is_binded,

        %%: 刘展:
        %%: 是否写入全服记录
        %%: 0不写入
        %%: 1写入
        is_record,

        %%: 刘展:
        %%: 是否进入下一层奖池抽奖
        %%: -1否
        %%: 1是
        %%: 同时
        %%: 当为1时客户端需要播放道具特效
        is_win,

        %%: 刘展:
        %%: 抽1次价格
        %%: 非绑定钻石
        for_1,

        %%: 刘展:
        %%: 抽10次价格
        %%: 非绑定钻石
        for_10,

        %%: 刘展:
        %%: 抽50次价格
        %%: 非绑定钻石
        for_50

 }).

-endif.