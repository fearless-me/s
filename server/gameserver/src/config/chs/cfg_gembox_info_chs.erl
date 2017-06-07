%% coding: latin-1
%%: 实现
-module(cfg_gembox_info_chs).
-compile(export_all).
-include("cfg_gembox_info.hrl").
-include("logger.hrl").

getRow(1)->
    #gembox_infoCfg {
    id = 1,
    gem_type = 1,
    gem_show = 30,
    gem_black = "gem_red"
    };
getRow(2)->
    #gembox_infoCfg {
    id = 2,
    gem_type = 1,
    gem_show = 30,
    gem_black = "gem_red"
    };
getRow(3)->
    #gembox_infoCfg {
    id = 3,
    gem_type = 1,
    gem_show = 30,
    gem_black = "gem_red"
    };
getRow(4)->
    #gembox_infoCfg {
    id = 4,
    gem_type = 1,
    gem_show = 32,
    gem_black = "gem_red"
    };
getRow(5)->
    #gembox_infoCfg {
    id = 5,
    gem_type = 1,
    gem_show = 34,
    gem_black = "gem_red"
    };
getRow(6)->
    #gembox_infoCfg {
    id = 6,
    gem_type = 1,
    gem_show = 36,
    gem_black = "gem_red"
    };
getRow(7)->
    #gembox_infoCfg {
    id = 7,
    gem_type = 1,
    gem_show = 38,
    gem_black = "gem_red"
    };
getRow(8)->
    #gembox_infoCfg {
    id = 8,
    gem_type = 1,
    gem_show = 40,
    gem_black = "gem_red"
    };
getRow(9)->
    #gembox_infoCfg {
    id = 9,
    gem_type = 2,
    gem_show = 30,
    gem_black = "gem_blue"
    };
getRow(10)->
    #gembox_infoCfg {
    id = 10,
    gem_type = 2,
    gem_show = 30,
    gem_black = "gem_blue"
    };
getRow(11)->
    #gembox_infoCfg {
    id = 11,
    gem_type = 2,
    gem_show = 30,
    gem_black = "gem_blue"
    };
getRow(12)->
    #gembox_infoCfg {
    id = 12,
    gem_type = 2,
    gem_show = 32,
    gem_black = "gem_blue"
    };
getRow(13)->
    #gembox_infoCfg {
    id = 13,
    gem_type = 2,
    gem_show = 34,
    gem_black = "gem_blue"
    };
getRow(14)->
    #gembox_infoCfg {
    id = 14,
    gem_type = 2,
    gem_show = 36,
    gem_black = "gem_blue"
    };
getRow(15)->
    #gembox_infoCfg {
    id = 15,
    gem_type = 2,
    gem_show = 38,
    gem_black = "gem_blue"
    };
getRow(16)->
    #gembox_infoCfg {
    id = 16,
    gem_type = 2,
    gem_show = 40,
    gem_black = "gem_blue"
    };
getRow(17)->
    #gembox_infoCfg {
    id = 17,
    gem_type = 3,
    gem_show = 30,
    gem_black = "gem_green"
    };
getRow(18)->
    #gembox_infoCfg {
    id = 18,
    gem_type = 3,
    gem_show = 30,
    gem_black = "gem_green"
    };
getRow(19)->
    #gembox_infoCfg {
    id = 19,
    gem_type = 3,
    gem_show = 30,
    gem_black = "gem_green"
    };
getRow(20)->
    #gembox_infoCfg {
    id = 20,
    gem_type = 3,
    gem_show = 32,
    gem_black = "gem_green"
    };
getRow(21)->
    #gembox_infoCfg {
    id = 21,
    gem_type = 3,
    gem_show = 34,
    gem_black = "gem_green"
    };
getRow(22)->
    #gembox_infoCfg {
    id = 22,
    gem_type = 3,
    gem_show = 36,
    gem_black = "gem_green"
    };
getRow(23)->
    #gembox_infoCfg {
    id = 23,
    gem_type = 3,
    gem_show = 38,
    gem_black = "gem_green"
    };
getRow(24)->
    #gembox_infoCfg {
    id = 24,
    gem_type = 3,
    gem_show = 40,
    gem_black = "gem_green"
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7},
    {8},
    {9},
    {10},
    {11},
    {12},
    {13},
    {14},
    {15},
    {16},
    {17},
    {18},
    {19},
    {20},
    {21},
    {22},
    {23},
    {24}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24
    ].

