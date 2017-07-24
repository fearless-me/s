%% coding: latin-1
%%: 实现
-module(cfg_sweeping_drop_chs).
-compile(export_all).
-include("cfg_sweeping_drop.hrl").
-include("logger.hrl").

getRow(101)->
    #sweeping_dropCfg {
    id = 101,
    name = "10级剧情副本",
    exp = 1000,
    gold = [1000,1000],
    purple = [0,0],
    golden = [0,0],
    drop = 300000,
    cost_money = 0
    };
getRow(102)->
    #sweeping_dropCfg {
    id = 102,
    name = "20级剧情副本",
    exp = 1000,
    gold = [2000,2000],
    purple = [0,0],
    golden = [0,0],
    drop = 300001,
    cost_money = 0
    };
getRow(103)->
    #sweeping_dropCfg {
    id = 103,
    name = "30级剧情副本",
    exp = 1000,
    gold = [3000,3000],
    purple = [0,0],
    golden = [0,0],
    drop = 300002,
    cost_money = 0
    };
getRow(104)->
    #sweeping_dropCfg {
    id = 104,
    name = "40级剧情副本",
    exp = 1000,
    gold = [4000,4000],
    purple = [0,0],
    golden = [0,0],
    drop = 300003,
    cost_money = 0
    };
getRow(105)->
    #sweeping_dropCfg {
    id = 105,
    name = "50级剧情副本",
    exp = 1000,
    gold = [4000,4000],
    purple = [0,0],
    golden = [0,0],
    drop = 300004,
    cost_money = 0
    };
getRow(106)->
    #sweeping_dropCfg {
    id = 106,
    name = "60级剧情副本",
    exp = 1000,
    gold = [600,1200],
    purple = [0,0],
    golden = [0,0],
    drop = 300005,
    cost_money = 0
    };
getRow(201)->
    #sweeping_dropCfg {
    id = 201,
    name = "20级英雄副本",
    exp = 4000,
    gold = [4000,4000],
    purple = [0,0],
    golden = [0,0],
    drop = 301000,
    cost_money = 0
    };
getRow(202)->
    #sweeping_dropCfg {
    id = 202,
    name = "30级英雄副本",
    exp = 5500,
    gold = [6000,6000],
    purple = [0,0],
    golden = [0,0],
    drop = 301001,
    cost_money = 0
    };
getRow(203)->
    #sweeping_dropCfg {
    id = 203,
    name = "40级英雄副本",
    exp = 6500,
    gold = [6000,6000],
    purple = [0,0],
    golden = [0,0],
    drop = 301002,
    cost_money = 0
    };
getRow(204)->
    #sweeping_dropCfg {
    id = 204,
    name = "50级英雄副本",
    exp = 6500,
    gold = [6000,6000],
    purple = [0,0],
    golden = [0,0],
    drop = 301003,
    cost_money = 0
    };
getRow(301)->
    #sweeping_dropCfg {
    id = 301,
    name = "40级挑战副本",
    exp = 109200,
    gold = [6000,6000],
    purple = [0,0],
    golden = [0,0],
    drop = 302000,
    cost_money = 0
    };
getRow(302)->
    #sweeping_dropCfg {
    id = 302,
    name = "50级挑战副本",
    exp = 109200,
    gold = [6000,6000],
    purple = [0,0],
    golden = [0,0],
    drop = 302001,
    cost_money = 0
    };
getRow(_)->[].

getKeyList()->[
    {101},
    {102},
    {103},
    {104},
    {105},
    {106},
    {201},
    {202},
    {203},
    {204},
    {301},
    {302}
    ].

get1KeyList()->[
    101,
    102,
    103,
    104,
    105,
    106,
    201,
    202,
    203,
    204,
    301,
    302
    ].

