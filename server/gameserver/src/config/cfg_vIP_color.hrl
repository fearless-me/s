%%: 声明
-ifndef(cfg_vIP_color).
-define(cfg_vIP_color, 1).

-record(vIP_colorCfg, {
        id,

        vip_level,

        colour_name,

        colour_code

 }).

-endif.