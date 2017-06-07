%% coding: latin-1
%%: 实现
-module(cfg_heraldry_chs).
-compile(export_all).
-include("cfg_heraldry.hrl").
-include("logger.hrl").

getRow(1)->
    #heraldryCfg {
    level = 1,
    warrior = [{31,9,0},{4,26,0}],
    mage = [{30,9,0},{19,10,0}],
    assassin = [{4,26,0},{19,10,0}]
    };
getRow(2)->
    #heraldryCfg {
    level = 3,
    warrior = [{31,10,0},{4,29,0}],
    mage = [{30,10,0},{19,12,0}],
    assassin = [{4,29,0},{19,12,0}]
    };
getRow(3)->
    #heraldryCfg {
    level = 5,
    warrior = [{31,11,0},{4,33,0}],
    mage = [{30,11,0},{19,13,0}],
    assassin = [{4,33,0},{19,13,0}]
    };
getRow(4)->
    #heraldryCfg {
    level = 7,
    warrior = [{31,13,0},{4,38,0}],
    mage = [{30,13,0},{19,15,0}],
    assassin = [{4,38,0},{19,15,0}]
    };
getRow(5)->
    #heraldryCfg {
    level = 9,
    warrior = [{31,14,0},{4,43,0}],
    mage = [{30,14,0},{19,17,0}],
    assassin = [{4,43,0},{19,17,0}]
    };
getRow(6)->
    #heraldryCfg {
    level = 11,
    warrior = [{31,16,0},{4,49,0}],
    mage = [{30,16,0},{19,19,0}],
    assassin = [{4,49,0},{19,19,0}]
    };
getRow(7)->
    #heraldryCfg {
    level = 13,
    warrior = [{31,18,0},{4,55,0}],
    mage = [{30,18,0},{19,22,0}],
    assassin = [{4,55,0},{19,22,0}]
    };
getRow(8)->
    #heraldryCfg {
    level = 15,
    warrior = [{31,21,0},{4,63,0}],
    mage = [{30,21,0},{19,25,0}],
    assassin = [{4,63,0},{19,25,0}]
    };
getRow(9)->
    #heraldryCfg {
    level = 17,
    warrior = [{31,24,0},{4,71,0}],
    mage = [{30,24,0},{19,29,0}],
    assassin = [{4,71,0},{19,29,0}]
    };
getRow(10)->
    #heraldryCfg {
    level = 19,
    warrior = [{31,27,0},{4,81,0}],
    mage = [{30,27,0},{19,32,0}],
    assassin = [{4,81,0},{19,32,0}]
    };
getRow(11)->
    #heraldryCfg {
    level = 21,
    warrior = [{31,31,0},{4,92,0}],
    mage = [{30,31,0},{19,37,0}],
    assassin = [{4,92,0},{19,37,0}]
    };
getRow(12)->
    #heraldryCfg {
    level = 23,
    warrior = [{31,35,0},{4,105,0}],
    mage = [{30,35,0},{19,42,0}],
    assassin = [{4,105,0},{19,42,0}]
    };
getRow(13)->
    #heraldryCfg {
    level = 25,
    warrior = [{31,40,0},{4,119,0}],
    mage = [{30,40,0},{19,48,0}],
    assassin = [{4,119,0},{19,48,0}]
    };
getRow(14)->
    #heraldryCfg {
    level = 27,
    warrior = [{31,45,0},{4,136,0}],
    mage = [{30,45,0},{19,54,0}],
    assassin = [{4,136,0},{19,54,0}]
    };
getRow(15)->
    #heraldryCfg {
    level = 29,
    warrior = [{31,51,0},{4,154,0}],
    mage = [{30,51,0},{19,62,0}],
    assassin = [{4,154,0},{19,62,0}]
    };
getRow(16)->
    #heraldryCfg {
    level = 31,
    warrior = [{31,58,0},{4,175,0}],
    mage = [{30,58,0},{19,70,0}],
    assassin = [{4,175,0},{19,70,0}]
    };
getRow(17)->
    #heraldryCfg {
    level = 33,
    warrior = [{31,66,0},{4,199,0}],
    mage = [{30,66,0},{19,80,0}],
    assassin = [{4,199,0},{19,80,0}]
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
    {17}
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
    17
    ].

