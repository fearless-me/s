%%: 声明
-ifndef(cfg_divine).
-define(cfg_divine, 1).

-record(divineCfg, {
        %%: admin:
        %%: 奖池ID
        pool_id,

        id,

        %%: admin:
        %%: 奖池权重
        pool_weight,

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
        item_weight,

        %%: admin:
        %%: 是否需要跑马灯
        need_brodcast,

        %%: admin:
        %%: 是否需要展示在面板上
        %%: 0不展示
        %%: 1展示
        %%: 同时也是每日大奖，服务器每天会随机5个大将，大奖每日中奖只能1个
        need_onboard,

        %%: admin:
        %%: 是否绑定
        %%: 0不绑定
        %%: 1绑定
        is_binded,

        %%: 刘展:
        %%: 是否加入展示特效
        %%: 0不展示
        %%: 1展示
        is_flash,

        %%: 刘展:
        %%: 是否写入全服记录
        %%: 0不写入
        %%: 1写入
        is_record,

        %%: 刘展:
        %%: 奖池奖金≥此参数才将道具加入奖池
        %%: [{货币类型，货币数量}]
        %%: 1金币
        %%: 2钻石
        gold_open,

        %%: 刘展:
        %%: 自己抽奖次数≥此参数才将该奖励加入奖池
        own_counts_open,

        %%: 刘展:
        %%: 服务器抽奖次数≥该参数
        %%: 才会将该奖励加入奖池
        sever_counts_open

 }).

-endif.