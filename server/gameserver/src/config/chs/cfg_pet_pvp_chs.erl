%% coding: latin-1
%%: 实现
-module(cfg_pet_pvp_chs).
-compile(export_all).
-include("cfg_pet_pvp.hrl").
-include("logger.hrl").

getRow(1)->
    #pet_pvpCfg {
    id = 1,
    type = 1,
    name = "骑宠领地1号",
    level = 1,
    res = "PetSign_1",
    petmapx = -776,
    petmapy = 367,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3160,5},{20,5}],
    time = 1,
    integral = 5
    };
getRow(2)->
    #pet_pvpCfg {
    id = 2,
    type = 1,
    name = "骑宠领地2号",
    level = 2,
    res = "PetSign_1",
    petmapx = -608,
    petmapy = 403,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3160,15},{20,10}],
    time = 1,
    integral = 8
    };
getRow(3)->
    #pet_pvpCfg {
    id = 3,
    type = 1,
    name = "骑宠领地3号",
    level = 3,
    res = "PetSign_1",
    petmapx = -449,
    petmapy = 384,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3160,25},{20,15}],
    time = 1,
    integral = 11
    };
getRow(4)->
    #pet_pvpCfg {
    id = 4,
    type = 1,
    name = "骑宠领地4号",
    level = 4,
    res = "PetSign_1",
    petmapx = -287,
    petmapy = 416,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3160,35},{20,20}],
    time = 1,
    integral = 14
    };
getRow(5)->
    #pet_pvpCfg {
    id = 5,
    type = 1,
    name = "骑宠领地5号",
    level = 5,
    res = "PetSign_1",
    petmapx = -367,
    petmapy = 222,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3160,45},{20,25}],
    time = 1,
    integral = 17
    };
getRow(6)->
    #pet_pvpCfg {
    id = 6,
    type = 1,
    name = "骑宠领地6号",
    level = 6,
    res = "PetSign_1",
    petmapx = -584,
    petmapy = 220,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3160,55},{20,30}],
    time = 1,
    integral = 20
    };
getRow(7)->
    #pet_pvpCfg {
    id = 7,
    type = 1,
    name = "骑宠领地7号",
    level = 7,
    res = "PetSign_1",
    petmapx = -757,
    petmapy = 181,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3160,65},{20,35}],
    time = 1,
    integral = 23
    };
getRow(8)->
    #pet_pvpCfg {
    id = 8,
    type = 1,
    name = "骑宠领地8号",
    level = 8,
    res = "PetSign_1",
    petmapx = -730,
    petmapy = 0,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3160,75},{20,40}],
    time = 1,
    integral = 26
    };
getRow(9)->
    #pet_pvpCfg {
    id = 9,
    type = 1,
    name = "骑宠领地9号",
    level = 9,
    res = "PetSign_1",
    petmapx = -565,
    petmapy = 34,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3160,85},{20,45}],
    time = 1,
    integral = 29
    };
getRow(10)->
    #pet_pvpCfg {
    id = 10,
    type = 1,
    name = "骑宠领地10号",
    level = 10,
    res = "PetSign_1",
    petmapx = -371,
    petmapy = 34,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3160,95},{20,50}],
    time = 1,
    integral = 32
    };
getRow(21)->
    #pet_pvpCfg {
    id = 21,
    type = 2,
    name = "骑宠领地11号",
    level = 1,
    res = "PetSign_3",
    petmapx = -710,
    petmapy = -168,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3161,5},{20,55}],
    time = 3,
    integral = 5
    };
getRow(22)->
    #pet_pvpCfg {
    id = 22,
    type = 2,
    name = "骑宠领地12号",
    level = 2,
    res = "PetSign_3",
    petmapx = -647,
    petmapy = -331,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3161,15},{20,60}],
    time = 3,
    integral = 8
    };
getRow(23)->
    #pet_pvpCfg {
    id = 23,
    type = 2,
    name = "骑宠领地13号",
    level = 3,
    res = "PetSign_3",
    petmapx = -483,
    petmapy = -369,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3161,25},{20,65}],
    time = 3,
    integral = 11
    };
getRow(24)->
    #pet_pvpCfg {
    id = 24,
    type = 2,
    name = "骑宠领地14号",
    level = 4,
    res = "PetSign_3",
    petmapx = -531,
    petmapy = -154,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3161,35},{20,70}],
    time = 3,
    integral = 14
    };
getRow(25)->
    #pet_pvpCfg {
    id = 25,
    type = 2,
    name = "骑宠领地15号",
    level = 5,
    res = "PetSign_3",
    petmapx = -374,
    petmapy = -154,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3161,45},{20,75}],
    time = 3,
    integral = 17
    };
getRow(26)->
    #pet_pvpCfg {
    id = 26,
    type = 2,
    name = "骑宠领地16号",
    level = 6,
    res = "PetSign_3",
    petmapx = -311,
    petmapy = -369,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3161,55},{20,80}],
    time = 3,
    integral = 20
    };
getRow(27)->
    #pet_pvpCfg {
    id = 27,
    type = 2,
    name = "骑宠领地17号",
    level = 7,
    res = "PetSign_3",
    petmapx = -96,
    petmapy = -352,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3161,65},{20,85}],
    time = 3,
    integral = 23
    };
getRow(28)->
    #pet_pvpCfg {
    id = 28,
    type = 2,
    name = "骑宠领地18号",
    level = 8,
    res = "PetSign_3",
    petmapx = 112,
    petmapy = -352,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3161,75},{20,90}],
    time = 3,
    integral = 26
    };
getRow(29)->
    #pet_pvpCfg {
    id = 29,
    type = 2,
    name = "骑宠领地19号",
    level = 9,
    res = "PetSign_3",
    petmapx = 219,
    petmapy = -184,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3161,85},{20,95}],
    time = 3,
    integral = 29
    };
getRow(30)->
    #pet_pvpCfg {
    id = 30,
    type = 2,
    name = "骑宠领地20号",
    level = 10,
    res = "PetSign_3",
    petmapx = -205,
    petmapy = -201,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3161,95},{20,100}],
    time = 3,
    integral = 32
    };
getRow(41)->
    #pet_pvpCfg {
    id = 41,
    type = 3,
    name = "骑宠领地21号",
    level = 1,
    res = "PetSign_8",
    petmapx = 714,
    petmapy = 215,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3162,5},{20,105}],
    time = 5,
    integral = 5
    };
getRow(42)->
    #pet_pvpCfg {
    id = 42,
    type = 3,
    name = "骑宠领地22号",
    level = 2,
    res = "PetSign_8",
    petmapx = 640,
    petmapy = 401,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3162,15},{20,110}],
    time = 5,
    integral = 8
    };
getRow(43)->
    #pet_pvpCfg {
    id = 43,
    type = 3,
    name = "骑宠领地23号",
    level = 3,
    res = "PetSign_8",
    petmapx = 405,
    petmapy = 410,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3162,25},{20,115}],
    time = 5,
    integral = 11
    };
getRow(44)->
    #pet_pvpCfg {
    id = 44,
    type = 3,
    name = "骑宠领地24号",
    level = 4,
    res = "PetSign_8",
    petmapx = 243,
    petmapy = 396,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3162,35},{20,120}],
    time = 5,
    integral = 14
    };
getRow(45)->
    #pet_pvpCfg {
    id = 45,
    type = 3,
    name = "骑宠领地25号",
    level = 5,
    res = "PetSign_8",
    petmapx = 311,
    petmapy = 222,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3162,45},{20,125}],
    time = 5,
    integral = 17
    };
getRow(46)->
    #pet_pvpCfg {
    id = 46,
    type = 3,
    name = "骑宠领地26号",
    level = 6,
    res = "PetSign_8",
    petmapx = 540,
    petmapy = 213,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3162,55},{20,130}],
    time = 5,
    integral = 20
    };
getRow(47)->
    #pet_pvpCfg {
    id = 47,
    type = 3,
    name = "骑宠领地27号",
    level = 7,
    res = "PetSign_8",
    petmapx = 558,
    petmapy = 22,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3162,65},{20,135}],
    time = 5,
    integral = 23
    };
getRow(48)->
    #pet_pvpCfg {
    id = 48,
    type = 3,
    name = "骑宠领地28号",
    level = 8,
    res = "PetSign_8",
    petmapx = 353,
    petmapy = 41,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3162,75},{20,140}],
    time = 5,
    integral = 26
    };
getRow(49)->
    #pet_pvpCfg {
    id = 49,
    type = 3,
    name = "骑宠领地29号",
    level = 9,
    res = "PetSign_8",
    petmapx = 111,
    petmapy = 222,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3162,85},{20,145}],
    time = 5,
    integral = 29
    };
getRow(50)->
    #pet_pvpCfg {
    id = 50,
    type = 3,
    name = "骑宠领地30号",
    level = 10,
    res = "PetSign_8",
    petmapx = -54,
    petmapy = 181,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3162,95},{20,150}],
    time = 5,
    integral = 32
    };
getRow(100)->
    #pet_pvpCfg {
    id = 100,
    type = 4,
    name = "骑宠领地31号",
    level = 20,
    res = "PetSign_2",
    petmapx = 124,
    petmapy = 28,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3162,105},{20,155}],
    time = 8,
    integral = 50
    };
getRow(101)->
    #pet_pvpCfg {
    id = 101,
    type = 4,
    name = "骑宠领地32号",
    level = 15,
    res = "PetSign_2",
    petmapx = 0,
    petmapy = -109,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3162,115},{20,160}],
    time = 8,
    integral = 50
    };
getRow(102)->
    #pet_pvpCfg {
    id = 102,
    type = 4,
    name = "骑宠领地33号",
    level = 18,
    res = "PetSign_2",
    petmapx = -136,
    petmapy = 0,
    drop_item = 1901,
    drop_money = [],
    drop_show = [{3162,125},{20,165}],
    time = 8,
    integral = 50
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
    {21},
    {22},
    {23},
    {24},
    {25},
    {26},
    {27},
    {28},
    {29},
    {30},
    {41},
    {42},
    {43},
    {44},
    {45},
    {46},
    {47},
    {48},
    {49},
    {50},
    {100},
    {101},
    {102}
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
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    100,
    101,
    102
    ].

