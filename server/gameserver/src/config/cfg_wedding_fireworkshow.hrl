%%: 声明
-ifndef(cfg_wedding_fireworkshow).
-define(cfg_wedding_fireworkshow, 1).

-record(wedding_fireworkshowCfg, {
        iD,

        %%: 特效名字
        name,

        %%: 特效X轴坐标
        x,

        %%: 特效Y轴坐标
        y,

        %%: 特效Z轴坐标
        z,

        %%: 场景显示
        %%: 1.仅简约婚宴显示
        %%: 2.仅豪华婚宴显示
        %%: 3.在所有婚宴中显示。
        show

 }).

-endif.