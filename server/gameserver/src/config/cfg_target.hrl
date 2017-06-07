%%: 声明
-ifndef(cfg_target).
-define(cfg_target, 1).

-record(targetCfg, {
        %%: 温少飞：
        %%: 目标筛选器编号，不允许重复
        id,

        %%: 温少飞：（名称由程序提供）
        %%: 目标筛选器所在的模块
        module,

        %%: 温少飞：（名称由程序提供）
        %%: 目标筛选器所在的函数
        method,

        %%: 温少飞:
        %%: 目标筛选器参数
        argu

 }).

-endif.