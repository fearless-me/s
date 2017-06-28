%% coding: latin-1
%%: 实现
-module(cfg_petEquipment_chs).
-compile(export_all).
-include("cfg_petEquipment.hrl").
-include("logger.hrl").

getRow(1)->
    #petEquipmentCfg {
    id = 1,
    icon = 280,
    name = "魔钢护铠 I",
    parts = 0,
    quality = 0,
    advanced = 2,
    baseProperty = [{138,0.7,0},{139,0.7,0}],
    info = "初阶骑宠护铠"
    };
getRow(2)->
    #petEquipmentCfg {
    id = 2,
    icon = 281,
    name = "魔钢护铠 II",
    parts = 0,
    quality = 1,
    advanced = 3,
    baseProperty = [{138,0.7,0},{139,0.7,0}],
    info = "中阶骑宠护铠"
    };
getRow(3)->
    #petEquipmentCfg {
    id = 3,
    icon = 282,
    name = "魔钢护铠 III",
    parts = 0,
    quality = 2,
    advanced = 4,
    baseProperty = [{138,0.7,0},{139,0.7,0}],
    info = "高阶骑宠护铠"
    };
getRow(4)->
    #petEquipmentCfg {
    id = 4,
    icon = 283,
    name = "魔钢护铠 IV",
    parts = 0,
    quality = 3,
    advanced = 5,
    baseProperty = [{138,0.7,0},{139,0.7,0}],
    info = "顶阶骑宠护铠"
    };
getRow(5)->
    #petEquipmentCfg {
    id = 5,
    icon = 283,
    name = "魔钢护铠 V",
    parts = 0,
    quality = 4,
    advanced = 0,
    baseProperty = [{138,0.7,0},{139,0.7,0}],
    info = "神阶骑宠护铠"
    };
getRow(6)->
    #petEquipmentCfg {
    id = 6,
    icon = 284,
    name = "嘶吼水晶 I",
    parts = 1,
    quality = 0,
    advanced = 7,
    baseProperty = [{136,1,0},{137,1,0}],
    info = "初阶骑宠饰品"
    };
getRow(7)->
    #petEquipmentCfg {
    id = 7,
    icon = 285,
    name = "嘶吼水晶 II",
    parts = 1,
    quality = 1,
    advanced = 8,
    baseProperty = [{136,1,0},{137,1,0}],
    info = "中阶骑宠饰品"
    };
getRow(8)->
    #petEquipmentCfg {
    id = 8,
    icon = 286,
    name = "嘶吼水晶 III",
    parts = 1,
    quality = 2,
    advanced = 9,
    baseProperty = [{136,1,0},{137,1,0}],
    info = "高阶骑宠饰品"
    };
getRow(9)->
    #petEquipmentCfg {
    id = 9,
    icon = 287,
    name = "嘶吼水晶 IV",
    parts = 1,
    quality = 3,
    advanced = 10,
    baseProperty = [{136,1,0},{137,1,0}],
    info = "顶阶骑宠饰品"
    };
getRow(10)->
    #petEquipmentCfg {
    id = 10,
    icon = 287,
    name = "嘶吼水晶 V",
    parts = 1,
    quality = 4,
    advanced = 0,
    baseProperty = [{136,1,0},{137,1,0}],
    info = "神阶骑宠饰品"
    };
getRow(11)->
    #petEquipmentCfg {
    id = 11,
    icon = 288,
    name = "巨兽皮鞭 I",
    parts = 2,
    quality = 0,
    advanced = 12,
    baseProperty = [{135,0.5,0},{139,0.3,0}],
    info = "初阶驯兽鞭"
    };
getRow(12)->
    #petEquipmentCfg {
    id = 12,
    icon = 289,
    name = "巨兽皮鞭 II",
    parts = 2,
    quality = 1,
    advanced = 13,
    baseProperty = [{135,0.5,0},{139,0.3,0}],
    info = "中阶驯兽鞭"
    };
getRow(13)->
    #petEquipmentCfg {
    id = 13,
    icon = 290,
    name = "巨兽皮鞭 III",
    parts = 2,
    quality = 2,
    advanced = 14,
    baseProperty = [{135,0.5,0},{139,0.3,0}],
    info = "高阶驯兽鞭"
    };
getRow(14)->
    #petEquipmentCfg {
    id = 14,
    icon = 291,
    name = "巨兽皮鞭 IV",
    parts = 2,
    quality = 3,
    advanced = 15,
    baseProperty = [{135,0.5,0},{139,0.3,0}],
    info = "顶阶驯兽鞭"
    };
getRow(15)->
    #petEquipmentCfg {
    id = 15,
    icon = 291,
    name = "巨兽皮鞭 V",
    parts = 2,
    quality = 4,
    advanced = 0,
    baseProperty = [{135,0.5,0},{139,0.3,0}],
    info = "神阶驯兽鞭"
    };
getRow(16)->
    #petEquipmentCfg {
    id = 16,
    icon = 292,
    name = "甲龙骑蹬 I",
    parts = 3,
    quality = 0,
    advanced = 17,
    baseProperty = [{135,0.5,0},{138,0.3,0}],
    info = "初阶驯兽骑镫"
    };
getRow(17)->
    #petEquipmentCfg {
    id = 17,
    icon = 293,
    name = "甲龙骑蹬 II",
    parts = 3,
    quality = 1,
    advanced = 18,
    baseProperty = [{135,0.5,0},{138,0.3,0}],
    info = "中阶驯兽骑镫"
    };
getRow(18)->
    #petEquipmentCfg {
    id = 18,
    icon = 294,
    name = "甲龙骑蹬 III",
    parts = 3,
    quality = 2,
    advanced = 19,
    baseProperty = [{135,0.5,0},{138,0.3,0}],
    info = "高阶驯兽骑镫"
    };
getRow(19)->
    #petEquipmentCfg {
    id = 19,
    icon = 295,
    name = "甲龙骑蹬 IV",
    parts = 3,
    quality = 3,
    advanced = 20,
    baseProperty = [{135,0.5,0},{138,0.3,0}],
    info = "顶阶驯兽骑镫"
    };
getRow(20)->
    #petEquipmentCfg {
    id = 20,
    icon = 295,
    name = "甲龙骑蹬 V",
    parts = 3,
    quality = 4,
    advanced = 0,
    baseProperty = [{135,0.5,0},{138,0.3,0}],
    info = "神阶驯兽骑镫"
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
    {17},
    {18},
    {19},
    {20}
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
    17,
    18,
    19,
    20
    ].

