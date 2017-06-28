%% coding: latin-1
%%: 实现
-module(cfg_identity_zodiac_chs).
-compile(export_all).
-include("cfg_identity_zodiac.hrl").
-include("logger.hrl").

getRow(1)->
    #identity_zodiacCfg {
    id = 1,
    name = "水瓶座"
    };
getRow(2)->
    #identity_zodiacCfg {
    id = 2,
    name = "双鱼座"
    };
getRow(3)->
    #identity_zodiacCfg {
    id = 3,
    name = "白羊座"
    };
getRow(4)->
    #identity_zodiacCfg {
    id = 4,
    name = "金牛座"
    };
getRow(5)->
    #identity_zodiacCfg {
    id = 5,
    name = "双子座"
    };
getRow(6)->
    #identity_zodiacCfg {
    id = 6,
    name = "巨蟹座"
    };
getRow(7)->
    #identity_zodiacCfg {
    id = 7,
    name = "狮子座"
    };
getRow(8)->
    #identity_zodiacCfg {
    id = 8,
    name = "处女座"
    };
getRow(9)->
    #identity_zodiacCfg {
    id = 9,
    name = "天秤座"
    };
getRow(10)->
    #identity_zodiacCfg {
    id = 10,
    name = "天蝎座"
    };
getRow(11)->
    #identity_zodiacCfg {
    id = 11,
    name = "射手座"
    };
getRow(12)->
    #identity_zodiacCfg {
    id = 12,
    name = "摩羯座"
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
    {12}
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
    12
    ].

