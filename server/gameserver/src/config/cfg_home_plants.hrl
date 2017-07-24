%%: 声明
-ifndef(cfg_home_plants).
-define(cfg_home_plants, 1).

-record(home_plantsCfg, {
        id,

        name,

        level,

        %%: 100 仅使用金币
        %%: 103 先使用绑钻再使用非绑钻
        %%: 105 仅使用非绑钻
        buy_type,

        price,

        %%: [幼苗阶段分钟数,发育到成熟分钟数,成熟后的枯萎分钟数]
        growtime,

        %%: [{道具id,道具数量}]
        result,

        %%: [道具ID,道具数量,几率值]
        %%: 几率为[0,100]，对应百分比
        bonus,

        %%: [产生虫害最小分钟数,最大分钟数,最大虫害次数,虫害导致每小时降低健康值]
        pestis,

        health,

        seed_model,

        growing_model,

        final_model,

        droop_model

 }).

-endif.