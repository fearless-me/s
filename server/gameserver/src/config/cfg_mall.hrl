%%: 声明
-ifndef(cfg_mall).
-define(cfg_mall, 1).

-record(mallCfg, {
        %%: 物品ID
        item_id,

        %%: 分页
        %%: 1优惠
        %%: 2成长
        %%: 3绑钻
        %%: 4积分（暂时显示关闭）
        type,

        %%: aa:
        %%: 同一页面下的顺序，从小到大排列
        sort,

        %%: 分页中的次级分页
        type1,

        %%: 钻石
        gold,

        %%: 绑定钻石
        %%: 0表示无法用绑定元宝购买
        bind_gold,

        %%: admin:
        %%: 购买需要积分点数
        %%: 0为不能用积分购买
        %%: 使用积分和购买获得积分小心不要配置错误导致无限购买
        use_integral,

        %%: 购买之后所获得积分点数
        get_integral,

        %%: admin:
        %%: 0 不是限购
        %%: >=1 为限购数量
        limit_buy,

        %%: 唐斯然:
        %%: 限购类型 如果该物品为限购物品时
        %%: 0为不限购
        %%: 1为玩家角色限购
        %%: 2全服务器限购
        %%: 3为玩家角色每日限购
        limit_type,

        %%: 唐斯然:
        %%: 0 表示不限购
        %%: >=1 为限购数量
        %%: limit_day与limit_bug 不能同时>=1
        limit_day,

        %%: 限购购买重置时间
        %%: 单位 秒
        %%: 0 不需要重置时间
        %%: -2 一次性购买
        buy_reset,

        %%: ≥等级
        %%: 玩家才能在商城中看到该物品
        level,

        %%: admin:
        %%: ≥充值元宝
        %%: 玩家才能在商城中看到该物品
        recharge,

        %%: admin:
        %%: 这个道具在商城是否真的显示
        %%: 0 不显示
        %%: 1 为显示
        ishide,

        %%: 显示购买状态
        %%: 0 普通商品
        %%: 1 限时
        %%: 2 打折商品
        showtype

 }).

-endif.