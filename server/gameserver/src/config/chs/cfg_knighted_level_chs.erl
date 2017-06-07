%% coding: latin-1
%%: 实现
-module(cfg_knighted_level_chs).
-compile(export_all).
-include("cfg_knighted_level.hrl").
-include("logger.hrl").

getRow(-1)->
    #knighted_levelCfg {
    level = -1,
    exp = 0,
    txt = "平民",
    power = [0],
    welfare = [0],
    reward_item = [0],
    is_effect = 0,
    icon = 0,
    show = "vip0",
    vip_buff = 0
    };
getRow(1)->
    #knighted_levelCfg {
    level = 1,
    exp = 10,
    txt = "侍从(1级)",
    power = [{16,1},{17,1},{13,1},{14,1},{1,1},{2,1},{3,1},{6,1},{9,1},{15,1},{21,1}],
    welfare = [1,2,3,4,5],
    reward_item = [{6010,1},{6129,1}],
    is_effect = 0,
    icon = 356,
    show = "vip1",
    vip_buff = 8000,
    vip_buff_explain = "攻击+50,生命+500,暴击伤害+1%,暴伤减免+1%"
    };
getRow(2)->
    #knighted_levelCfg {
    level = 2,
    exp = 180,
    txt = "兵士(2级)",
    power = [{10,1},{11,1},{12,1},{21,2}],
    welfare = [1,2,3,4,6],
    reward_item = [{6011,1},{6130,1}],
    is_effect = 0,
    icon = 357,
    show = "vip2",
    vip_buff = 8001,
    vip_buff_explain = "攻击+60,生命+600,暴击伤害+2%,暴伤减免+2%"
    };
getRow(3)->
    #knighted_levelCfg {
    level = 3,
    exp = 580,
    txt = "士官(3级)",
    power = [{7,1},{4,1},{15,2},{19,1},{21,3}],
    welfare = [1,2,3,4,7],
    reward_item = [{6012,1},{6131,1},{6126,1}],
    is_effect = 0,
    icon = 358,
    show = "vip3",
    vip_buff = 8002,
    vip_buff_explain = "攻击+80,生命+800,暴击伤害+3%,暴伤减免+3%"
    };
getRow(4)->
    #knighted_levelCfg {
    level = 4,
    exp = 1280,
    txt = "骑士(4级)",
    power = [{10,2},{12,2},{18,1},{21,4}],
    welfare = [1,2,3,4,8],
    reward_item = [{6013,1},{6132,1}],
    is_effect = 0,
    icon = 359,
    show = "vip4",
    vip_buff = 8003,
    vip_buff_explain = "攻击+110,生命+1100,暴击伤害+4%,暴伤减免+4%"
    };
getRow(5)->
    #knighted_levelCfg {
    level = 5,
    exp = 3980,
    txt = "勋爵(5级)",
    power = [{9,2},{2,2},{3,2},{15,3},{21,5}],
    welfare = [1,2,3,4,9],
    reward_item = [{6014,1},{6133,1}],
    is_effect = 1,
    icon = 360,
    show = "vip5",
    vip_buff = 8004,
    vip_buff_explain = "攻击+150,生命+1500,暴击伤害+6%,暴伤减免+6%"
    };
getRow(6)->
    #knighted_levelCfg {
    level = 6,
    exp = 6480,
    txt = "男爵(6级)",
    power = [{6,2},{4,2},{11,2},{18,2},{21,6}],
    welfare = [1,2,3,4,10],
    reward_item = [{6015,1},{6134,1}],
    is_effect = 1,
    icon = 361,
    show = "vip6",
    vip_buff = 8005,
    vip_buff_explain = "攻击+200,生命+2000,暴击伤害+8%,暴伤减免+8%"
    };
getRow(7)->
    #knighted_levelCfg {
    level = 7,
    exp = 9980,
    txt = "子爵(7级)",
    power = [{9,3},{10,3},{12,3},{15,4},{21,7}],
    welfare = [1,2,3,4,11],
    reward_item = [{6016,1},{6135,1},{6125,1}],
    is_effect = 1,
    icon = 362,
    show = "vip7",
    vip_buff = 8006,
    vip_buff_explain = "攻击+260,生命+2600,暴击伤害+10%,暴伤减免+10%"
    };
getRow(8)->
    #knighted_levelCfg {
    level = 8,
    exp = 19980,
    txt = "伯爵(8级)",
    power = [{3,3},{2,3},{4,3},{18,3},{19,1},{20,1},{21,8}],
    welfare = [1,2,3,4,12],
    reward_item = [{6017,1},{6136,1}],
    is_effect = 1,
    icon = 363,
    show = "vip8",
    vip_buff = 8007,
    vip_buff_explain = "攻击+330,生命+3300,暴击伤害+12%,暴伤减免+12%"
    };
getRow(9)->
    #knighted_levelCfg {
    level = 9,
    exp = 29980,
    txt = "候爵(9级)",
    power = [{11,3},{6,3},{4,4},{15,5},{21,9}],
    welfare = [1,2,3,4,13],
    reward_item = [{6018,1},{6137,1}],
    is_effect = 1,
    icon = 364,
    show = "vip9",
    vip_buff = 8008,
    vip_buff_explain = "攻击+410,生命+4100,暴击伤害+14%,暴伤减免+14%"
    };
getRow(10)->
    #knighted_levelCfg {
    level = 10,
    exp = 49980,
    txt = "领主(10级)",
    power = [{11,4},{9,4},{10,4},{18,4},{21,10}],
    welfare = [1,2,3,4,14],
    reward_item = [{6019,1},{6138,1},{6128,1}],
    is_effect = 1,
    icon = 365,
    show = "vip10",
    vip_buff = 8009,
    vip_buff_explain = "攻击+500,生命+5000,暴击伤害+17%,暴伤减免+17%"
    };
getRow(11)->
    #knighted_levelCfg {
    level = 11,
    exp = 99980,
    txt = "公爵(11级)",
    power = [{2,4},{6,4},{12,4},{15,6},{21,11}],
    welfare = [1,2,3,4,15],
    reward_item = [{6020,1},{6139,1}],
    is_effect = 1,
    icon = 366,
    show = "vip11",
    vip_buff = 8010,
    vip_buff_explain = "攻击+600,生命+6000,暴击伤害+20%,暴伤减免+20%"
    };
getRow(12)->
    #knighted_levelCfg {
    level = 12,
    exp = 199980,
    txt = "大公爵(12级)",
    power = [{11,5},{2,5},{3,4},{18,5},{21,12}],
    welfare = [1,2,3,4,16],
    reward_item = [{6021,1},{6140,1},{6127,1}],
    is_effect = 1,
    icon = 367,
    show = "vip12",
    vip_buff = 8011,
    vip_buff_explain = "攻击+710,生命+7100,暴击伤害+23%,暴伤减免+23%"
    };
getRow(13)->
    #knighted_levelCfg {
    level = 13,
    exp = 299980,
    txt = "帝王(13级)",
    power = [{4,5},{6,5},{9,5},{10,5},{15,7},{21,13}],
    welfare = [1,2,3,4,17],
    reward_item = [{6022,1},{6141,1}],
    is_effect = 1,
    icon = 368,
    show = "vip13",
    vip_buff = 8012,
    vip_buff_explain = "攻击+830,生命+8300,暴击伤害+26%,暴伤减免+26%"
    };
getRow(14)->
    #knighted_levelCfg {
    level = 14,
    exp = 399980,
    txt = "霸主(14级)",
    power = [{11,5},{2,5},{3,4},{18,6},{21,14}],
    welfare = [1,2,3,4,17],
    reward_item = [{6023,1},{6142,1}],
    is_effect = 1,
    icon = 598,
    show = "vip14",
    vip_buff = 8013,
    vip_buff_explain = "攻击+960,生命+9600,暴击伤害+29%,暴伤减免+29%"
    };
getRow(15)->
    #knighted_levelCfg {
    level = 15,
    exp = 599980,
    txt = "至尊(15级)",
    power = [{4,5},{6,5},{9,5},{10,5},{15,8},{21,15}],
    welfare = [1,2,3,4,17],
    reward_item = [{6024,1},{6143,1}],
    is_effect = 1,
    icon = 599,
    show = "vip15",
    vip_buff = 8014,
    vip_buff_explain = "攻击+1100,生命+11000,暴击伤害+33%,暴伤减免+33%"
    };
getRow(16)->
    #knighted_levelCfg {
    level = 16,
    exp = 999999999,
    txt = "0",
    power = [0],
    welfare = [0],
    reward_item = [0],
    is_effect = 0,
    icon = 0,
    vip_buff = 0
    };
getRow(_)->[].

getKeyList()->[
    {-1},
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
    {16}
    ].

get1KeyList()->[
    -1,
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
    16
    ].

