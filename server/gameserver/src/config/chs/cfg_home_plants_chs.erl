%% coding: latin-1
%%: 实现
-module(cfg_home_plants_chs).
-compile(export_all).
-include("cfg_home_plants.hrl").
-include("logger.hrl").

getRow(1)->
    #home_plantsCfg {
    id = 1,
    name = "马铃薯种子",
    level = 1,
    buy_type = 100,
    price = 2000,
    growtime = [60,60,60],
    result = [{24050,100}],
    bonus = [{24063,3,20},{24064,5,20}],
    pestis = [20,120,3,5],
    health = [80,100],
    seed_model = "head_10_1",
    growing_model = "head_11_1",
    final_model = "head_20_1",
    droop_model = "head_21_1"
    };
getRow(2)->
    #home_plantsCfg {
    id = 2,
    name = "小麦种子",
    level = 1,
    buy_type = 100,
    price = 4000,
    growtime = [300,300,300],
    result = [{24051,100}],
    bonus = [{24063,3,20},{24064,5,20}],
    pestis = [20,120,3,5],
    health = [80,100],
    seed_model = "head_10_2",
    growing_model = "head_11_2",
    final_model = "head_20_2",
    droop_model = "head_21_2"
    };
getRow(3)->
    #home_plantsCfg {
    id = 3,
    name = "银杏种子",
    level = 1,
    buy_type = 103,
    price = 40,
    growtime = [600,600,600],
    result = [{24052,150}],
    bonus = [{24063,3,20},{24064,5,20}],
    pestis = [800,1000,3,10],
    health = [80,100],
    seed_model = "head_10_3",
    growing_model = "head_11_3",
    final_model = "head_20_3",
    droop_model = "head_21_3"
    };
getRow(4)->
    #home_plantsCfg {
    id = 4,
    name = "大白菜种子",
    level = 2,
    buy_type = 100,
    price = 5000,
    growtime = [300,300,300],
    result = [{24053,200}],
    bonus = [{24063,3,20},{24064,5,20}],
    pestis = [800,1000,3,10],
    health = [80,100],
    seed_model = "head_10_4",
    growing_model = "head_11_4",
    final_model = "head_20_4",
    droop_model = "head_21_4"
    };
getRow(5)->
    #home_plantsCfg {
    id = 5,
    name = "番茄种子",
    level = 2,
    buy_type = 100,
    price = 8000,
    growtime = [600,600,600],
    result = [{24054,100}],
    bonus = [{24063,3,20},{24064,5,20}],
    pestis = [400,600,3,10],
    health = [80,100],
    seed_model = "head_10_1",
    growing_model = "head_11_1",
    final_model = "head_20_1",
    droop_model = "head_21_1"
    };
getRow(6)->
    #home_plantsCfg {
    id = 6,
    name = "楠木种子",
    level = 2,
    buy_type = 103,
    price = 50,
    growtime = [800,800,800],
    result = [{24055,100}],
    bonus = [{24063,3,20},{24064,5,20}],
    pestis = [800,1000,3,10],
    health = [80,100],
    seed_model = "head_10_2",
    growing_model = "head_11_2",
    final_model = "head_20_2",
    droop_model = "head_21_2"
    };
getRow(7)->
    #home_plantsCfg {
    id = 7,
    name = "洋葱种子",
    level = 3,
    buy_type = 100,
    price = 10000,
    growtime = [600,600,600],
    result = [{24056,150}],
    bonus = [{24063,3,20},{24064,5,20}],
    pestis = [800,1000,3,10],
    health = [80,100],
    seed_model = "head_10_3",
    growing_model = "head_11_3",
    final_model = "head_20_3",
    droop_model = "head_21_3"
    };
getRow(8)->
    #home_plantsCfg {
    id = 8,
    name = "辣椒种子",
    level = 3,
    buy_type = 100,
    price = 12000,
    growtime = [800,800,800],
    result = [{24057,200}],
    bonus = [{24063,3,20},{24064,5,20}],
    pestis = [400,600,3,10],
    health = [80,100],
    seed_model = "head_10_4",
    growing_model = "head_11_4",
    final_model = "head_20_4",
    droop_model = "head_21_4"
    };
getRow(9)->
    #home_plantsCfg {
    id = 9,
    name = "杉树种子",
    level = 3,
    buy_type = 103,
    price = 60,
    growtime = [1000,1000,1000],
    result = [{24058,100}],
    bonus = [{24063,3,20},{24064,5,20}],
    pestis = [800,1000,3,10],
    health = [80,100],
    seed_model = "head_10_1",
    growing_model = "head_11_1",
    final_model = "head_20_1",
    droop_model = "head_21_1"
    };
getRow(10)->
    #home_plantsCfg {
    id = 10,
    name = "甘蔗种子",
    level = 4,
    buy_type = 100,
    price = 15000,
    growtime = [800,800,800],
    result = [{24059,100}],
    bonus = [{24063,3,20},{24064,5,20}],
    pestis = [800,1000,3,10],
    health = [80,100],
    seed_model = "head_10_2",
    growing_model = "head_11_2",
    final_model = "head_20_2",
    droop_model = "head_21_2"
    };
getRow(11)->
    #home_plantsCfg {
    id = 11,
    name = "豆芽种子",
    level = 4,
    buy_type = 100,
    price = 18000,
    growtime = [1000,1000,1000],
    result = [{24060,150}],
    bonus = [{24063,3,20},{24064,5,20}],
    pestis = [400,600,3,10],
    health = [80,100],
    seed_model = "head_10_3",
    growing_model = "head_11_3",
    final_model = "head_20_3",
    droop_model = "head_21_3"
    };
getRow(12)->
    #home_plantsCfg {
    id = 12,
    name = "柏木种子",
    level = 4,
    buy_type = 103,
    price = 40,
    growtime = [1200,1200,1200],
    result = [{24061,200}],
    bonus = [{24063,3,20},{24064,5,20}],
    pestis = [800,1000,3,10],
    health = [80,100],
    seed_model = "head_10_4",
    growing_model = "head_11_4",
    final_model = "head_20_4",
    droop_model = "head_21_4"
    };
getRow(13)->
    #home_plantsCfg {
    id = 13,
    name = "萝卜种子",
    level = 5,
    buy_type = 100,
    price = 20000,
    growtime = [1200,1200,1200],
    result = [{24062,100}],
    bonus = [{24063,3,20},{24064,5,20}],
    pestis = [800,1000,3,10],
    health = [80,100],
    seed_model = "head_10_1",
    growing_model = "head_11_1",
    final_model = "head_20_1",
    droop_model = "head_21_1"
    };
getRow(14)->
    #home_plantsCfg {
    id = 14,
    name = "玉米种子",
    level = 5,
    buy_type = 100,
    price = 25000,
    growtime = [1400,1400,1400],
    result = [{24063,150}],
    bonus = [{24063,3,20},{24064,5,20}],
    pestis = [400,600,3,10],
    health = [80,100],
    seed_model = "head_10_2",
    growing_model = "head_11_2",
    final_model = "head_20_2",
    droop_model = "head_21_2"
    };
getRow(15)->
    #home_plantsCfg {
    id = 15,
    name = "青松种子",
    level = 5,
    buy_type = 103,
    price = 40,
    growtime = [1400,1400,1400],
    result = [{24064,200}],
    bonus = [{24063,3,20},{24064,5,20}],
    pestis = [800,1000,3,10],
    health = [80,100],
    seed_model = "head_10_3",
    growing_model = "head_11_3",
    final_model = "head_20_3",
    droop_model = "head_21_3"
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
    {15}
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
    15
    ].

