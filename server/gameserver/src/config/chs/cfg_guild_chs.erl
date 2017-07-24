%% coding: latin-1
%%: 实现
-module(cfg_guild_chs).
-compile(export_all).
-include("cfg_guild.hrl").
-include("logger.hrl").

getRow(1)->
    #guildCfg {
    id = 1,
    max_res = 18000,
    max_liv = 3600,
    need_res = 15000,
    need_liv = 3000,
    member_number = 35,
    leader_1 = 1,
    leader_2 = 5,
    shop_upgrade = [],
    reward = [1000,500,300,100],
    snowman = 5
    };
getRow(2)->
    #guildCfg {
    id = 2,
    max_res = 36000,
    max_liv = 12000,
    need_res = 30000,
    need_liv = 10000,
    member_number = 40,
    leader_1 = 1,
    leader_2 = 8,
    shop_upgrade = [{1,5000,5000},{2,10000,10000}],
    reward = [1000,500,300,101],
    snowman = 5
    };
getRow(3)->
    #guildCfg {
    id = 3,
    max_res = 54000,
    max_liv = 36000,
    need_res = 45000,
    need_liv = 30000,
    member_number = 45,
    leader_1 = 2,
    leader_2 = 12,
    shop_upgrade = [{1,5000,5000},{2,10000,10000}],
    reward = [1000,500,300,102],
    snowman = 5
    };
getRow(4)->
    #guildCfg {
    id = 4,
    max_res = 72000,
    max_liv = 96000,
    need_res = 60000,
    need_liv = 80000,
    member_number = 50,
    leader_1 = 2,
    leader_2 = 15,
    shop_upgrade = [{1,5000,5000},{2,10000,10000}],
    reward = [1000,500,300,103],
    snowman = 5
    };
getRow(5)->
    #guildCfg {
    id = 5,
    max_res = 72000,
    max_liv = 96000,
    need_res = 60000,
    need_liv = 80000,
    member_number = 50,
    leader_1 = 2,
    leader_2 = 15,
    shop_upgrade = [{1,5000,5000},{2,10000,10000}],
    reward = [1000,500,300,103],
    snowman = 5
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5
    ].

