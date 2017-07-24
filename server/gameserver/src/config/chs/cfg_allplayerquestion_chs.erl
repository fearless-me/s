%% coding: latin-1
%%: 实现
-module(cfg_allplayerquestion_chs).
-compile(export_all).
-include("cfg_allplayerquestion.hrl").
-include("logger.hrl").

getRow(1)->
    #allplayerquestionCfg {
    iD = 1,
    question = "女朋友出轨了，你应该？",
    answer = "原谅她",
    reward_server = [{6,8000}],
    reward_client = [{3,8000}]
    };
getRow(2)->
    #allplayerquestionCfg {
    iD = 2,
    question = "小明给小红表白了，谁给他的勇气？",
    answer = "梁静茹",
    reward_server = [{6,8000}],
    reward_client = [{3,8000}]
    };
getRow(3)->
    #allplayerquestionCfg {
    iD = 3,
    question = "花是米的妈妈，蝶是花的什么？",
    answer = "恋人",
    reward_server = [{6,8000}],
    reward_client = [{3,8000}]
    };
getRow(4)->
    #allplayerquestionCfg {
    iD = 4,
    question = "狼来了（一种水果）？",
    answer = "杨桃",
    reward_server = [{6,8000}],
    reward_client = [{3,8000}]
    };
getRow(5)->
    #allplayerquestionCfg {
    iD = 5,
    question = "路飞是哪一部动漫的角色",
    answer = "海贼王",
    reward_server = [{6,8000}],
    reward_client = [{3,8000}]
    };
getRow(6)->
    #allplayerquestionCfg {
    iD = 6,
    question = "什么马可以下海？",
    answer = "海马",
    reward_server = [{6,8000}],
    reward_client = [{3,8000}]
    };
getRow(7)->
    #allplayerquestionCfg {
    iD = 7,
    question = "一年的司机是新司机，十年的司机呢？",
    answer = "老司机",
    reward_server = [{6,8000}],
    reward_client = [{3,8000}]
    };
getRow(8)->
    #allplayerquestionCfg {
    iD = 8,
    question = "如果原谅有颜色，那一定是？",
    answer = "绿色",
    reward_server = [{6,8000}],
    reward_client = [{3,8000}]
    };
getRow(9)->
    #allplayerquestionCfg {
    iD = 9,
    question = "小明生日是29号，他不可能生于几月？",
    answer = "二月",
    reward_server = [{6,8000}],
    reward_client = [{3,8000}]
    };
getRow(10)->
    #allplayerquestionCfg {
    iD = 10,
    question = "杨贵妃看到什么会笑？",
    answer = "荔枝",
    reward_server = [{6,8000}],
    reward_client = [{3,8000}]
    };
getRow(11)->
    #allplayerquestionCfg {
    iD = 11,
    question = "孙悟空的座驾是什么？",
    answer = "筋斗云",
    reward_server = [{6,8000}],
    reward_client = [{3,8000}]
    };
getRow(12)->
    #allplayerquestionCfg {
    iD = 12,
    question = "二郎神的宠物叫什么？",
    answer = "哮天犬",
    reward_server = [{6,8000}],
    reward_client = [{3,8000}]
    };
getRow(13)->
    #allplayerquestionCfg {
    iD = 13,
    question = "问题13？",
    answer = "答案13",
    reward_server = [{6,8000}],
    reward_client = [{3,8000}]
    };
getRow(14)->
    #allplayerquestionCfg {
    iD = 14,
    question = "问题14？",
    answer = "答案14",
    reward_server = [{6,8000}],
    reward_client = [{3,8000}]
    };
getRow(15)->
    #allplayerquestionCfg {
    iD = 15,
    question = "问题15？",
    answer = "答案15",
    reward_server = [{6,8000}],
    reward_client = [{3,8000}]
    };
getRow(16)->
    #allplayerquestionCfg {
    iD = 16,
    question = "问题16？",
    answer = "答案16",
    reward_server = [{6,8000}],
    reward_client = [{3,8000}]
    };
getRow(17)->
    #allplayerquestionCfg {
    iD = 17,
    question = "问题17？",
    answer = "答案17",
    reward_server = [{6,8000}],
    reward_client = [{3,8000}]
    };
getRow(18)->
    #allplayerquestionCfg {
    iD = 18,
    question = "问题18？",
    answer = "答案18",
    reward_server = [{6,8000}],
    reward_client = [{3,8000}]
    };
getRow(19)->
    #allplayerquestionCfg {
    iD = 19,
    question = "问题19？",
    answer = "答案19",
    reward_server = [{6,8000}],
    reward_client = [{3,8000}]
    };
getRow(20)->
    #allplayerquestionCfg {
    iD = 20,
    question = "问题20？",
    answer = "答案20",
    reward_server = [{6,8000}],
    reward_client = [{3,8000}]
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

