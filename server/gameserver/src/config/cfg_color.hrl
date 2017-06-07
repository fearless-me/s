%%: 声明
-ifndef(cfg_color).
-define(cfg_color, 1).

-record(colorCfg, {
        %%: 颜色id
        id,

        %%: red
        red,

        %%: green
        green,

        %%: blue
        blue

 }).

-endif.