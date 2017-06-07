%% coding: latin-1
%%: 实现
-module(cfg_equipRecastRand_chs).
-compile(export_all).
-include("cfg_equipRecastRand.hrl").
-include("logger.hrl").

getRow(1)->
    #equipRecastRandCfg {
    id = 1,
    group = 1,
    values = [5,10],
    weight = 100
    };
getRow(2)->
    #equipRecastRandCfg {
    id = 2,
    group = 1,
    values = [5,11],
    weight = 100
    };
getRow(3)->
    #equipRecastRandCfg {
    id = 3,
    group = 1,
    values = [5,12],
    weight = 100
    };
getRow(4)->
    #equipRecastRandCfg {
    id = 4,
    group = 1,
    values = [5,13],
    weight = 100
    };
getRow(5)->
    #equipRecastRandCfg {
    id = 5,
    group = 1,
    values = [5,14],
    weight = 100
    };
getRow(6)->
    #equipRecastRandCfg {
    id = 6,
    group = 1,
    values = [5,15],
    weight = 100
    };
getRow(7)->
    #equipRecastRandCfg {
    id = 7,
    group = 1,
    values = [-5,50],
    weight = 100
    };
getRow(8)->
    #equipRecastRandCfg {
    id = 8,
    group = 1,
    values = [-5,50],
    weight = 100
    };
getRow(9)->
    #equipRecastRandCfg {
    id = 9,
    group = 1,
    values = [-5,50],
    weight = 100
    };
getRow(10)->
    #equipRecastRandCfg {
    id = 10,
    group = 1,
    values = [-5,50],
    weight = 100
    };
getRow(11)->
    #equipRecastRandCfg {
    id = 11,
    group = 1,
    values = [-5,50],
    weight = 100
    };
getRow(12)->
    #equipRecastRandCfg {
    id = 12,
    group = 1,
    values = [-5,50],
    weight = 100
    };
getRow(13)->
    #equipRecastRandCfg {
    id = 13,
    group = 1,
    values = [-5,50],
    weight = 100
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
    {13}
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
    13
    ].

