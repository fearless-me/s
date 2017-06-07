%% coding: latin-1
%%: 实现
-module(cfg_vIP_color_chs).
-compile(export_all).
-include("cfg_vIP_color.hrl").
-include("logger.hrl").

getRow(1)->
    #vIP_colorCfg {
    id = 1,
    vip_level = 0,
    colour_name = "纯白色",
    colour_code = "ffffff"
    };
getRow(2)->
    #vIP_colorCfg {
    id = 2,
    vip_level = 4,
    colour_name = "鹅黄色",
    colour_code = "faff72"
    };
getRow(3)->
    #vIP_colorCfg {
    id = 3,
    vip_level = 8,
    colour_name = "蔚蓝色",
    colour_code = "70f3ff"
    };
getRow(4)->
    #vIP_colorCfg {
    id = 4,
    vip_level = 12,
    colour_name = "粉红色",
    colour_code = "ff83fa"
    };
getRow(5)->
    #vIP_colorCfg {
    id = 5,
    vip_level = 16,
    colour_name = "草绿色",
    colour_code = "66cd00"
    };
getRow(6)->
    #vIP_colorCfg {
    id = 6,
    vip_level = 20,
    colour_name = "丁香色",
    colour_code = "9932cc"
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

