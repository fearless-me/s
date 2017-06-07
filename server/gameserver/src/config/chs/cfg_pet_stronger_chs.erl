%% coding: latin-1
%%: 实现
-module(cfg_pet_stronger_chs).
-compile(export_all).
-include("cfg_pet_stronger.hrl").
-include("logger.hrl").

getRow(135)->
    #pet_strongerCfg {
    stronger_id = 135,
    point_1 = 0,
    value_1 = [481,1444],
    point_2 = 0.05,
    value_2 = [481,1444],
    point_3 = 0.15,
    value_3 = [481,1444],
    point_4 = 0.35,
    value_4 = [481,1444],
    point_5 = 0.7,
    value_5 = [481,1444],
    info = "生命",
    maxvalue = 48150,
    battlepower = 500
    };
getRow(136)->
    #pet_strongerCfg {
    stronger_id = 136,
    point_1 = 0,
    value_1 = [48,144],
    point_2 = 0.05,
    value_2 = [48,144],
    point_3 = 0.15,
    value_3 = [48,144],
    point_4 = 0.35,
    value_4 = [48,144],
    point_5 = 0.7,
    value_5 = [48,144],
    info = "物理攻击",
    maxvalue = 4815,
    battlepower = 500
    };
getRow(137)->
    #pet_strongerCfg {
    stronger_id = 137,
    point_1 = 0,
    value_1 = [48,144],
    point_2 = 0.05,
    value_2 = [48,144],
    point_3 = 0.15,
    value_3 = [48,144],
    point_4 = 0.35,
    value_4 = [48,144],
    point_5 = 0.7,
    value_5 = [48,144],
    info = "魔法攻击",
    maxvalue = 4815,
    battlepower = 500
    };
getRow(138)->
    #pet_strongerCfg {
    stronger_id = 138,
    point_1 = 0,
    value_1 = [48,144],
    point_2 = 0.05,
    value_2 = [48,144],
    point_3 = 0.15,
    value_3 = [48,144],
    point_4 = 0.35,
    value_4 = [48,144],
    point_5 = 0.7,
    value_5 = [48,144],
    info = "物理防御",
    maxvalue = 4815,
    battlepower = 250
    };
getRow(139)->
    #pet_strongerCfg {
    stronger_id = 139,
    point_1 = 0,
    value_1 = [48,144],
    point_2 = 0.05,
    value_2 = [48,144],
    point_3 = 0.15,
    value_3 = [48,144],
    point_4 = 0.35,
    value_4 = [48,144],
    point_5 = 0.7,
    value_5 = [48,144],
    info = "魔法防御",
    maxvalue = 4815,
    battlepower = 250
    };
getRow(_)->[].

getKeyList()->[
    {135},
    {136},
    {137},
    {138},
    {139}
    ].

get1KeyList()->[
    135,
    136,
    137,
    138,
    139
    ].

