%% coding: latin-1
%%: 实现
-module(cfg_gorgeous_chs).
-compile(export_all).
-include("cfg_gorgeous.hrl").
-include("logger.hrl").

getRow(0)->
    #gorgeousCfg {
    id = 0,
    unmber_G = 0,
    model_G = 1,
    effects_G = 1,
    modelY = 0,
    skill = []
    };
getRow(1)->
    #gorgeousCfg {
    id = 1,
    unmber_G = 32,
    model_G = 1,
    effects_G = 1,
    modelY = 0,
    skill = []
    };
getRow(2)->
    #gorgeousCfg {
    id = 2,
    unmber_G = 68,
    model_G = 2,
    effects_G = 1,
    modelY = 0,
    skill = []
    };
getRow(3)->
    #gorgeousCfg {
    id = 3,
    unmber_G = 136,
    model_G = 3,
    effects_G = 0.8,
    modelY = -460,
    skill = []
    };
getRow(4)->
    #gorgeousCfg {
    id = 4,
    unmber_G = 272,
    model_G = 4,
    effects_G = 0.7,
    modelY = -420,
    skill = []
    };
getRow(5)->
    #gorgeousCfg {
    id = 5,
    unmber_G = 544,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    skill = []
    };
getRow(6)->
    #gorgeousCfg {
    id = 6,
    unmber_G = 1088,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    skill = []
    };
getRow(7)->
    #gorgeousCfg {
    id = 7,
    unmber_G = 2304,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    skill = []
    };
getRow(8)->
    #gorgeousCfg {
    id = 8,
    unmber_G = 4864,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    skill = []
    };
getRow(9)->
    #gorgeousCfg {
    id = 9,
    unmber_G = 10240,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    skill = []
    };
getRow(10)->
    #gorgeousCfg {
    id = 10,
    unmber_G = 16384,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    skill = []
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

