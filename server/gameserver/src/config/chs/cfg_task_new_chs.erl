%% coding: latin-1
%%: 实现
-module(cfg_task_new_chs).
-compile(export_all).
-include("cfg_task_new.hrl").
-include("logger.hrl").

getRow(50001)->
    #task_newCfg {
    id = 50001,
    tasktype = 1,
    maps = 10,
    groupid = 100,
    epic_task_groupid = 0,
    target_type = 11,
    task_after = 0,
    task_before = 0,
    target_para = #target_paraCfg {mst=25009, mstnum=35},
    task_name = "(每日)剿灭东郊小蝙蝠",
    task_content = "接受到委托，前往[ff00ff]阿克勒平原[-]剿灭35只[ff00ff]小蝙蝠[-]可领取丰厚的经验奖励！",
    task_reward_num = #task_reward_numCfg {gold=400, exp=1810},
    show_type1 = 0,
    show_type2 = 0,
    is_pathfinding = 0,
    branch_is_pathfinding = 0
    };
getRow(50002)->
    #task_newCfg {
    id = 50002,
    tasktype = 1,
    maps = 10,
    groupid = 100,
    epic_task_groupid = 0,
    target_type = 11,
    task_after = 0,
    task_before = 0,
    target_para = #target_paraCfg {mst=25010, mstnum=35},
    task_name = "(每日)剿灭东郊小豺狼",
    task_content = "接受到委托，前往[ff00ff]阿克勒平原[-]剿灭35只[ff00ff]小豺狼[-]可领取丰厚的经验奖励！",
    task_reward_num = #task_reward_numCfg {gold=400, exp=1810},
    show_type1 = 0,
    show_type2 = 0,
    is_pathfinding = 0,
    branch_is_pathfinding = 0
    };
getRow(50003)->
    #task_newCfg {
    id = 50003,
    tasktype = 1,
    maps = 10,
    groupid = 100,
    epic_task_groupid = 0,
    target_type = 11,
    task_after = 0,
    task_before = 0,
    target_para = #target_paraCfg {mst=25008, mstnum=35},
    task_name = "(每日)剿灭东郊魔族骷髅兵",
    task_content = "接受到委托，前往[ff00ff]阿克勒平原[-]剿灭35只[ff00ff]魔族骷髅兵[-]可领取丰厚的经验奖励！",
    task_reward_num = #task_reward_numCfg {gold=400, exp=1810},
    show_type1 = 0,
    show_type2 = 0,
    is_pathfinding = 0,
    branch_is_pathfinding = 0
    };
getRow(60001)->
    #task_newCfg {
    id = 60001,
    tasktype = 3,
    maps = 2,
    groupid = 200,
    epic_task_groupid = 0,
    target_type = 12,
    task_after = 60002,
    task_before = 0,
    target_para = nil,
    task_name = "(情缘)海贼王的宝藏1",
    task_content = "(开端)前往罗杰处了解海贼王的宝藏传说。",
    task_reward_num = #task_reward_numCfg {gold=1600, exp=15752, qinmidu=300},
    show_type1 = 0,
    show_type2 = 60001,
    is_pathfinding = 0,
    branch_is_pathfinding = 0
    };
getRow(60002)->
    #task_newCfg {
    id = 60002,
    tasktype = 3,
    maps = 2,
    groupid = 200,
    epic_task_groupid = 0,
    target_type = 12,
    task_after = 60003,
    task_before = 60001,
    target_para = nil,
    task_name = "(情缘)海贼王的宝藏2",
    task_content = "(发展)去他的妻子波特卡斯处了解更多宝藏的信息。",
    task_reward_num = #task_reward_numCfg {gold=1600, exp=15752, qinmidu=300},
    show_type1 = 0,
    show_type2 = 60002,
    is_pathfinding = 0,
    branch_is_pathfinding = 0
    };
getRow(60003)->
    #task_newCfg {
    id = 60003,
    tasktype = 3,
    maps = 2,
    groupid = 200,
    epic_task_groupid = 0,
    target_type = 12,
    task_after = 60004,
    task_before = 60002,
    target_para = nil,
    task_name = "(情缘)海贼王的宝藏3",
    task_content = "(高潮)带着宾克斯的朗姆酒前往罗杰处探寻消息。",
    task_reward_num = #task_reward_numCfg {gold=1600, exp=15752, qinmidu=300},
    show_type1 = 0,
    show_type2 = 60003,
    is_pathfinding = 0,
    branch_is_pathfinding = 0
    };
getRow(60004)->
    #task_newCfg {
    id = 60004,
    tasktype = 3,
    maps = 2,
    groupid = 200,
    epic_task_groupid = 0,
    target_type = 12,
    task_after = 60005,
    task_before = 60003,
    target_para = nil,
    task_name = "(情缘)海贼王的宝藏4",
    task_content = "(结局)再次前往波特卡斯处探寻信息。",
    task_reward_num = #task_reward_numCfg {gold=1600, exp=15752, qinmidu=300},
    show_type1 = 0,
    show_type2 = 60004,
    is_pathfinding = 0,
    branch_is_pathfinding = 0
    };
getRow(60005)->
    #task_newCfg {
    id = 60005,
    tasktype = 3,
    maps = 2,
    groupid = 200,
    epic_task_groupid = 0,
    target_type = 12,
    task_after = 0,
    task_before = 60004,
    target_para = nil,
    task_name = "(情缘)汇报结果",
    task_content = "(交付)回到玛利亚处汇报探查结果。",
    task_reward_num = #task_reward_numCfg {gold=1600, exp=15752, qinmidu=300},
    show_type1 = 0,
    show_type2 = 60005,
    is_pathfinding = 0,
    branch_is_pathfinding = 0
    };
getRow(_)->[].

getKeyList()->[
    {50001},
    {50002},
    {50003},
    {60001},
    {60002},
    {60003},
    {60004},
    {60005}
    ].

get1KeyList()->[
    50001,
    50002,
    50003,
    60001,
    60002,
    60003,
    60004,
    60005
    ].

