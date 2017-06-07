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
    value_1 = [100,150],
    point_2 = 0.05,
    value_2 = [-50,300],
    point_3 = 0.15,
    value_3 = [-100,350],
    point_4 = 0.35,
    value_4 = [-150,400],
    point_5 = 0.7,
    value_5 = [-250,500],
    info = "生命",
    maxvalue = 50000,
    battlepower = 500
    };
getRow(136)->
    #pet_strongerCfg {
    stronger_id = 136,
    point_1 = 0,
    value_1 = [3,5],
    point_2 = 0.05,
    value_2 = [-2,10],
    point_3 = 0.15,
    value_3 = [-6,14],
    point_4 = 0.35,
    value_4 = [-10,18],
    point_5 = 0.7,
    value_5 = [-15,23],
    info = "物理攻击",
    maxvalue = 1500,
    battlepower = 500
    };
getRow(137)->
    #pet_strongerCfg {
    stronger_id = 137,
    point_1 = 0,
    value_1 = [3,5],
    point_2 = 0.05,
    value_2 = [-2,10],
    point_3 = 0.15,
    value_3 = [-6,14],
    point_4 = 0.35,
    value_4 = [-10,18],
    point_5 = 0.7,
    value_5 = [-15,23],
    info = "魔法攻击",
    maxvalue = 1500,
    battlepower = 500
    };
getRow(138)->
    #pet_strongerCfg {
    stronger_id = 138,
    point_1 = 0,
    value_1 = [2,4],
    point_2 = 0.05,
    value_2 = [-1,5],
    point_3 = 0.15,
    value_3 = [-3,9],
    point_4 = 0.35,
    value_4 = [-10,16],
    point_5 = 0.7,
    value_5 = [-15,21],
    info = "物理防御",
    maxvalue = 950,
    battlepower = 250
    };
getRow(139)->
    #pet_strongerCfg {
    stronger_id = 139,
    point_1 = 0,
    value_1 = [2,4],
    point_2 = 0.05,
    value_2 = [-1,5],
    point_3 = 0.15,
    value_3 = [-3,9],
    point_4 = 0.35,
    value_4 = [-10,16],
    point_5 = 0.7,
    value_5 = [-15,21],
    info = "魔法防御",
    maxvalue = 950,
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

