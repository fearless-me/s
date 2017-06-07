%%: 声明
-ifndef(cfg_wedding_blessing).
-define(cfg_wedding_blessing, 1).

-record(wedding_blessingCfg, {
        id,

        %%: 显示内容
        content

 }).

-endif.