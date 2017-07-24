%%: 声明
-ifndef(cfg_home_level).
-define(cfg_home_level, 1).

-record(home_levelCfg, {
        %%: tiancheng:
        %%: 家园等级
        id,

        %%: admin:
        %%: 小屋名称
        name,

        %%: tiancheng:
        %%: 华丽度达到升级
        stylish,

        %%: tiancheng:
        %%: 舒适度达到
        comfort

 }).

-endif.