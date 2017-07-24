%% coding: latin-1
%%: 实现
-module(cfg_petAvatareffect_chs).
-compile(export_all).
-include("cfg_petAvatareffect.hrl").
-include("logger.hrl").

getRow(0)->
    #petAvatareffectCfg {
    petAvatarelevel = 0,
    effect = "",
    scale = 0.7
    };
getRow(1)->
    #petAvatareffectCfg {
    petAvatarelevel = 1,
    effect = "ring_27",
    scale = 0.7
    };
getRow(2)->
    #petAvatareffectCfg {
    petAvatarelevel = 2,
    effect = "ring_22",
    scale = 0.7
    };
getRow(3)->
    #petAvatareffectCfg {
    petAvatarelevel = 3,
    effect = "ring_23",
    scale = 0.7
    };
getRow(4)->
    #petAvatareffectCfg {
    petAvatarelevel = 4,
    effect = "ring_23",
    scale = 0.7
    };
getRow(5)->
    #petAvatareffectCfg {
    petAvatarelevel = 5,
    effect = "ring_24",
    scale = 0.7
    };
getRow(6)->
    #petAvatareffectCfg {
    petAvatarelevel = 6,
    effect = "ring_24",
    scale = 0.7
    };
getRow(7)->
    #petAvatareffectCfg {
    petAvatarelevel = 7,
    effect = "ring_25",
    scale = 0.7
    };
getRow(8)->
    #petAvatareffectCfg {
    petAvatarelevel = 8,
    effect = "ring_25",
    scale = 0.7
    };
getRow(9)->
    #petAvatareffectCfg {
    petAvatarelevel = 9,
    effect = "ring_26",
    scale = 0.7
    };
getRow(10)->
    #petAvatareffectCfg {
    petAvatarelevel = 10,
    effect = "ring_26",
    scale = 0.7
    };
getRow(_)->[].

getKeyList()->[
    {0},
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7},
    {8},
    {9},
    {10}
    ].

get1KeyList()->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10
    ].

