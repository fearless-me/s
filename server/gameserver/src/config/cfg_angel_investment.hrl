%%: 声明
-ifndef(cfg_angel_investment).
-define(cfg_angel_investment, 1).

-record(angel_investmentCfg, {
        %%: id
        id,

        %%: 道具
        item,

        %%: 道具数量
        num1,

        %%: 单个购买非绑定钻石
        buy,

        %%: 打折计算 和 一次性购买全部的钻石单价
        sale

 }).

-endif.