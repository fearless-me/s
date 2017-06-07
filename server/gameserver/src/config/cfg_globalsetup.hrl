%%: 声明
-ifndef(cfg_globalsetup).
-define(cfg_globalsetup, 1).

-record(globalsetupCfg, {
        %%: 设置ID
        id,

        %%: 设置条目
        settype,

        setpara

 }).

-endif.