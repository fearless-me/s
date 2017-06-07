%% coding: latin-1
%%: 实现
-module(cfg_severday_task_chs).
-compile(export_all).
-include("cfg_severday_task.hrl").
-include("logger.hrl").

getRow(1)->
    #severday_taskCfg {
    id = 1,
    type = 1,
    events = [1,0],
    relation_UI = [9,0],
    show = "装备精炼{0}次",
    task_num = 10,
    item1 = 1910,
    num1 = 2,
    item2 = 622,
    num2 = 20
    };
getRow(2)->
    #severday_taskCfg {
    id = 2,
    type = 1,
    events = [2,0],
    relation_UI = [37,0],
    show = "骑宠远征{0}次",
    task_num = 5,
    item1 = 1910,
    num1 = 2,
    item2 = 622,
    num2 = 20
    };
getRow(3)->
    #severday_taskCfg {
    id = 3,
    type = 1,
    events = [3,0],
    relation_UI = [41,0],
    show = "每日必做活跃度达到{0}点",
    task_num = 30,
    item1 = 1910,
    num1 = 2,
    item2 = 622,
    num2 = 20
    };
getRow(4)->
    #severday_taskCfg {
    id = 4,
    type = 2,
    events = [1,0],
    relation_UI = [38,0],
    show = "装备精炼{0}次",
    task_num = 10,
    item1 = 1910,
    num1 = 2,
    item2 = 622,
    num2 = 20
    };
getRow(5)->
    #severday_taskCfg {
    id = 5,
    type = 2,
    events = [4,0],
    relation_UI = [22,16],
    show = "竞技场战斗{0}次",
    task_num = 5,
    item1 = 1910,
    num1 = 2,
    item2 = 622,
    num2 = 20
    };
getRow(6)->
    #severday_taskCfg {
    id = 6,
    type = 2,
    events = [16,8],
    relation_UI = [15,0],
    show = "军团专属无限星空副本通关{0}次",
    task_num = 1,
    item1 = 1910,
    num1 = 2,
    item2 = 622,
    num2 = 20
    };
getRow(7)->
    #severday_taskCfg {
    id = 7,
    type = 3,
    events = [6,0],
    relation_UI = [13,0],
    show = "宝石合成{0}次",
    task_num = 1,
    item1 = 1923,
    num1 = 3,
    item2 = 622,
    num2 = 20
    };
getRow(8)->
    #severday_taskCfg {
    id = 8,
    type = 3,
    events = [7,0],
    relation_UI = [24,0],
    show = "在商城使用钻石或绑钻消费{0}次",
    task_num = 1,
    item1 = 1923,
    num1 = 3,
    item2 = 622,
    num2 = 20
    };
getRow(9)->
    #severday_taskCfg {
    id = 9,
    type = 3,
    events = [3,0],
    relation_UI = [41,0],
    show = "每日必做活跃度达到{0}点",
    task_num = 50,
    item1 = 1923,
    num1 = 3,
    item2 = 622,
    num2 = 20
    };
getRow(10)->
    #severday_taskCfg {
    id = 10,
    type = 4,
    events = [2,0],
    relation_UI = [37,0],
    show = "骑宠远征{0}次",
    task_num = 5,
    item1 = 1923,
    num1 = 3,
    item2 = 622,
    num2 = 20
    };
getRow(11)->
    #severday_taskCfg {
    id = 11,
    type = 4,
    events = [8,0],
    relation_UI = [37,1],
    show = "骑宠领地{0}次",
    task_num = 1,
    item1 = 1923,
    num1 = 3,
    item2 = 622,
    num2 = 20
    };
getRow(12)->
    #severday_taskCfg {
    id = 12,
    type = 4,
    events = [9,0],
    relation_UI = [5,0],
    show = "骑宠技能洗练{0}次",
    task_num = 1,
    item1 = 1923,
    num1 = 3,
    item2 = 622,
    num2 = 20
    };
getRow(13)->
    #severday_taskCfg {
    id = 13,
    type = 5,
    events = [1,0],
    relation_UI = [9,0],
    show = "装备精炼{0}次",
    task_num = 3,
    item1 = 1923,
    num1 = 3,
    item2 = 622,
    num2 = 20
    };
getRow(14)->
    #severday_taskCfg {
    id = 14,
    type = 5,
    events = [10,0],
    relation_UI = [38,0],
    show = "装备冲星{0}次",
    task_num = 3,
    item1 = 1923,
    num1 = 3,
    item2 = 622,
    num2 = 20
    };
getRow(15)->
    #severday_taskCfg {
    id = 15,
    type = 5,
    events = [11,0],
    relation_UI = [39,0],
    show = "装备重铸{0}次",
    task_num = 3,
    item1 = 1923,
    num1 = 3,
    item2 = 622,
    num2 = 20
    };
getRow(16)->
    #severday_taskCfg {
    id = 16,
    type = 6,
    events = [5,5000],
    relation_UI = [22,12],
    show = "灵魂伙伴副本通关{0}次",
    task_num = 1,
    item1 = 1923,
    num1 = 3,
    item2 = 622,
    num2 = 20
    };
getRow(17)->
    #severday_taskCfg {
    id = 17,
    type = 6,
    events = [12,0],
    relation_UI = [22,15],
    show = "每日任务完成{0}轮（十环）",
    task_num = 1,
    item1 = 1923,
    num1 = 3,
    item2 = 622,
    num2 = 20
    };
getRow(18)->
    #severday_taskCfg {
    id = 18,
    type = 6,
    events = [4,0],
    relation_UI = [22,16],
    show = "竞技场战斗{0}次",
    task_num = 10,
    item1 = 1923,
    num1 = 3,
    item2 = 622,
    num2 = 20
    };
getRow(19)->
    #severday_taskCfg {
    id = 19,
    type = 7,
    events = [15,0],
    relation_UI = [22,13],
    show = "勇者试炼通关{0}关",
    task_num = 5,
    item1 = 1923,
    num1 = 3,
    item2 = 622,
    num2 = 20
    };
getRow(20)->
    #severday_taskCfg {
    id = 20,
    type = 7,
    events = [14,0],
    relation_UI = [15,0],
    show = "军团技能学习{0}次",
    task_num = 3,
    item1 = 1923,
    num1 = 3,
    item2 = 622,
    num2 = 20
    };
getRow(21)->
    #severday_taskCfg {
    id = 21,
    type = 7,
    events = [3,0],
    relation_UI = [41,0],
    show = "每日必做活跃度达到{0}点",
    task_num = 70,
    item1 = 1923,
    num1 = 3,
    item2 = 622,
    num2 = 20
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
    {20},
    {21}
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
    20,
    21
    ].

