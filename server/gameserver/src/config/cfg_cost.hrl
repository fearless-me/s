%%: 声明
-ifndef(cfg_cost).
-define(cfg_cost, 1).

-record(costCfg, {
        %%: %%付费项目
        %%: 1月卡
        id,

        %%: 刘展:
        %%: 道具id
        itemid,

        %%: 刘展:
        %%: 道具数量
        number,

        %%: 刘展:
        %%: 是否内部购买
        %%: 0是
        %%: 1不是
        internalPurchase,

        %%: 钻石
        diamond,

        %%: 绑定钻石
        %%: -1表示无法用绑定元宝购买
        bind_diamond,

        %%: admin:
        %%: 购买需要积分点数
        %%: -1为不能用积分购买
        %%: 使用积分和购买获得积分小心不要配置错误导致无限购买
        use_integral,

        %%: admin:
        %%: 0 不是限购
        %%: 1 是限购物品
        limit_buy,

        %%: 限购购买重置时间
        %%: 单位 秒
        %%: 0 不需要重置时间
        %%: -2 一次性购买
        buy_reset,

        %%: 刘展:
        %%: 货币使用原因码
        coinUseCode,

        %%: 刘展:
        %%: 道具使用途径
        itemSourceCode

 }).

-endif.