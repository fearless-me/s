%%: 声明
-ifndef(cfg_guildsupplies).
-define(cfg_guildsupplies, 1).

-record(guildsuppliesCfg, {
        %%: 作者:
        %%: id
        id,

        %%: 作者:
        %%: 物资来源
        %%: 1副本
        %%: 2任务
        %%: 3金币捐献
        %%: 4钻石捐献
        sourcematerial,

        %%: 作者:
        %%: sourcematerial=1时此处填副本id
        %%: sourcematerial=2时此处填任务id
        %%: sourcematerial=3时此处天捐献次数
        %%: sourcematerial=4时此处填捐献次数
        param,

        %%: 作者:
        %%: 获取资源数量
        quantity

 }).

-endif.