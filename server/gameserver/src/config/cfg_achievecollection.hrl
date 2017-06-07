%%: 声明
-ifndef(cfg_achievecollection).
-define(cfg_achievecollection, 1).

-record(achievecollectionCfg, {
        %%: 物品掉落的地图
        map,

        %%: 描述
        describe,

        %%: 内标题描述
        title,

        %%: 客户端显示排序从小到大
        rank,

        %%: 徽章显示图片
        pic,

        %%: 物品item
        items,

        %%: 0 不显示
        %%: 1 在图标上显示new
        newflag,

        %%: 击杀怪物掉落的概率
        %%: 10000
        drop,

        %%: 对应成就表的成就点数
        %%: ID对应行的{，点数，}
        achieveid

 }).

-endif.