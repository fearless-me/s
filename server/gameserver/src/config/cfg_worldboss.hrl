%%: 声明
-ifndef(cfg_worldboss).
-define(cfg_worldboss, 1).

-record(worldbossCfg, {
        %%: 设置ID
        id,

        %%: 设置条目
        settype,

        setpara

 }).

-endif.