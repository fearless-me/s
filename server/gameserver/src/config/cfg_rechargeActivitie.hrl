%%: 声明
-ifndef(cfg_rechargeActivitie).
-define(cfg_rechargeActivitie, 1).

-record(rechargeActivitieCfg, {
        %%: 1是 活动推荐删除掉了 
        id,

        %%: 顺序排序从小到大
        sort,

        %%: 作者:
        %%: 活动名称
        name,

        %%: 活动过期后是否删除
        %%: 0不删除
        %%: 1删除
        delete

 }).

-endif.