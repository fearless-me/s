%% coding: latin-1
%%: 实现
-module(cfg_fashionCollectionLevel_chs).
-compile(export_all).
-include("cfg_fashionCollectionLevel.hrl").
-include("logger.hrl").

getRow(1)->
    #fashionCollectionLevelCfg {
    level = 1,
    exp = 100,
    attribute = [{135,1203,0},{136,120,0},{137,120,0},{138,120,0},{139,120,0}]
    };
getRow(2)->
    #fashionCollectionLevelCfg {
    level = 2,
    exp = 200,
    attribute = [{135,2360,0},{136,236,0},{137,236,0},{138,236,0},{139,236,0}]
    };
getRow(3)->
    #fashionCollectionLevelCfg {
    level = 3,
    exp = 300,
    attribute = [{135,4711,0},{136,471,0},{137,471,0},{138,471,0},{139,471,0}]
    };
getRow(4)->
    #fashionCollectionLevelCfg {
    level = 4,
    exp = 500,
    attribute = [{135,7914,0},{136,791,0},{137,791,0},{138,791,0},{139,791,0}]
    };
getRow(5)->
    #fashionCollectionLevelCfg {
    level = 5,
    exp = 700,
    attribute = [{135,11837,0},{136,1183,0},{137,1183,0},{138,1183,0},{139,1183,0}]
    };
getRow(6)->
    #fashionCollectionLevelCfg {
    level = 6,
    exp = 1000,
    attribute = [{135,16400,0},{136,1640,0},{137,1640,0},{138,1640,0},{139,1640,0}]
    };
getRow(7)->
    #fashionCollectionLevelCfg {
    level = 7,
    exp = 1200,
    attribute = [{135,21547,0},{136,2154,0},{137,2154,0},{138,2154,0},{139,2154,0}]
    };
getRow(8)->
    #fashionCollectionLevelCfg {
    level = 8,
    exp = 1500,
    attribute = [{135,27238,0},{136,2723,0},{137,2723,0},{138,2723,0},{139,2723,0}]
    };
getRow(9)->
    #fashionCollectionLevelCfg {
    level = 9,
    exp = 1800,
    attribute = [{135,33439,0},{136,3343,0},{137,3343,0},{138,3343,0},{139,3343,0}]
    };
getRow(10)->
    #fashionCollectionLevelCfg {
    level = 10,
    exp = 2000,
    attribute = [{135,40125,0},{136,4012,0},{137,4012,0},{138,4012,0},{139,4012,0}]
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
    {10}
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
    10
    ].

