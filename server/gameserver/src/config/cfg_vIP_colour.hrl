%%: 声明
-ifndef(cfg_vIP_colour).
-define(cfg_vIP_colour, 1).

-record(vIP_colourCfg, {
        vip_level,

        colour_name,

        colour_code

 }).

-endif.