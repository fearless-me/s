%% coding: latin-1
%%: 实现
-module(cfg_rank_chs).
-compile(export_all).
-include("cfg_rank.hrl").
-include("logger.hrl").

getRow(1)->
    #rankCfg {
    id = 1,
    show_name = "等级榜",
    dec = "等级",
    show_id = 3,
    show_client = 1,
    fresh_cycle = 1,
    fresh_time = [400,1600],
    player_number = 100,
    rank_reward = 0
    };
getRow(2)->
    #rankCfg {
    id = 2,
    show_name = "财富榜",
    dec = "金币",
    show_id = 4,
    show_client = 1,
    fresh_cycle = 1,
    fresh_time = [400,1600],
    player_number = 100,
    rank_reward = 0
    };
getRow(3)->
    #rankCfg {
    id = 3,
    show_name = "爵位榜",
    dec = "爵位",
    show_id = 11,
    show_client = 0,
    fresh_cycle = 0,
    fresh_time = [400,1600],
    player_number = 100,
    rank_reward = 0
    };
getRow(4)->
    #rankCfg {
    id = 4,
    show_name = "战力榜",
    dec = "角色战斗力",
    show_id = 1,
    show_client = 1,
    fresh_cycle = 1,
    fresh_time = [400,1600],
    player_number = 100,
    rank_reward = 0
    };
getRow(5)->
    #rankCfg {
    id = 5,
    show_name = "宠物榜",
    dec = "宠物战斗力",
    show_id = 2,
    show_client = 1,
    fresh_cycle = 1,
    fresh_time = [400,1600],
    player_number = 100,
    rank_reward = 0
    };
getRow(6)->
    #rankCfg {
    id = 6,
    show_name = "成就榜",
    dec = "成就点数",
    show_id = 6,
    show_client = 1,
    fresh_cycle = 1,
    fresh_time = [400,1600],
    player_number = 100,
    rank_reward = 0
    };
getRow(7)->
    #rankCfg {
    id = 7,
    show_name = "点赞榜",
    dec = "点赞",
    show_id = 7,
    show_client = 0,
    fresh_cycle = 1,
    fresh_time = [400,1600],
    player_number = 100,
    rank_reward = 0
    };
getRow(8)->
    #rankCfg {
    id = 8,
    show_name = "军团战力榜",
    dec = "综合战斗力",
    show_id = 9,
    show_client = 0,
    fresh_cycle = 1,
    fresh_time = [400],
    player_number = 30,
    rank_reward = 0
    };
getRow(9)->
    #rankCfg {
    id = 9,
    show_name = "至尊王者榜",
    dec = "至尊天数",
    show_id = 8,
    show_client = 0,
    fresh_cycle = 1,
    fresh_time = [400,1600],
    player_number = 100,
    rank_reward = 0
    };
getRow(10)->
    #rankCfg {
    id = 10,
    show_name = "禁闭室榜",
    dec = "女神禁闭室",
    show_id = 10,
    show_client = 1,
    fresh_cycle = 1,
    fresh_time = [357],
    player_number = 100,
    rank_reward = 0
    };
getRow(11)->
    #rankCfg {
    id = 11,
    show_name = "领地积分榜",
    dec = "领地积分",
    show_id = 12,
    show_client = 0,
    fresh_cycle = 1,
    fresh_time = [1000,1100,1200,1300,1400,1500,1600,1700,1800,1900,2000,2100,2200],
    player_number = 100,
    rank_reward = 0
    };
getRow(12)->
    #rankCfg {
    id = 12,
    show_name = "邪徒榜",
    dec = "杀人数",
    show_id = 5,
    show_client = 0,
    fresh_cycle = 1,
    fresh_time = [400,1600],
    player_number = 100,
    rank_reward = 0
    };
getRow(13)->
    #rankCfg {
    id = 13,
    show_name = "巅峰对决榜",
    dec = "击杀助攻",
    show_id = 13,
    show_client = 0,
    fresh_cycle = 2,
    fresh_time = [{3,400},{3,1000},{3,1400},{3,1900}],
    player_number = 100,
    rank_reward = 0
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

