%%: 实现
-module(cfg_vIP_colour_chs).
-compile(export_all).
-include("cfg_vIP_colour.hrl").
-include("logger.hrl").

getRow(1)->
    #vIP_colourCfg {
    vip_level = "vip_level_0",
    colour_name = "纯白色",
    colour_code = "#FFFFFF"
    };
getRow(2)->
    #vIP_colourCfg {
    vip_level = "vip_level_4",
    colour_name = "鹅黄色",
    colour_code = "#faff72"
    };
getRow(3)->
    #vIP_colourCfg {
    vip_level = "vip_level_8",
    colour_name = "蔚蓝色",
    colour_code = "#70f3ff"
    };
getRow(4)->
    #vIP_colourCfg {
    vip_level = "vip_level_12",
    colour_name = "粉红色",
    colour_code = "#ftb3a7"
    };
getRow(5)->
    #vIP_colourCfg {
    vip_level = "vip_level_16",
    colour_name = "青白色",
    colour_code = "#c0ebd7"
    };
getRow(6)->
    #vIP_colourCfg {
    vip_level = "vip_level_20",
    colour_name = "丁香色",
    colour_code = "#cca4e3"
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6
    ].

