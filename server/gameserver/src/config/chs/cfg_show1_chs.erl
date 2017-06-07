%% coding: latin-1
%%: 实现
-module(cfg_show1_chs).
-compile(export_all).
-include("cfg_show1.hrl").
-include("logger.hrl").

getRow(1)->
    #show1Cfg {
    id = 1,
    showgroupid_1 = 1,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "嗯，好像是汤姆的哭声，她到底怎么了？",
    show_wait = 3500
    };
getRow(2)->
    #show1Cfg {
    id = 2,
    showgroupid_1 = 2,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "这里就是汤姆经常玩耍的地方，嗯？这里有一些粘液，是什么留下的呢？",
    show_wait = 3500
    };
getRow(3)->
    #show1Cfg {
    id = 3,
    showgroupid_1 = 3,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "嗯，嗯，好香好香，这到底有什么作用？",
    show_wait = 3500
    };
getRow(4)->
    #show1Cfg {
    id = 4,
    showgroupid_1 = 4,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "这里应该是史莱姆的聚集地了吧，咦，那有个木桶，难道七彩皮球就在这个里面？",
    show_wait = 3500
    };
getRow(5)->
    #show1Cfg {
    id = 5,
    showgroupid_1 = 5,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "站住站住，可恶的小偷，再跑小心我把你吃掉，吃掉。",
    show_wait = 3500
    };
getRow(6)->
    #show1Cfg {
    id = 6,
    showgroupid_1 = 6,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "累死我了，终于赶走了讨厌的史莱姆。前面那是什么，七彩的光晕？这难道也是史莱姆偷来的什么东西？",
    show_wait = 3500
    };
getRow(7)->
    #show1Cfg {
    id = 7,
    showgroupid_1 = 7,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "该死的小偷，偷走史莱姆大王的东西还敢打伤我，呜呜呜，我要找妈妈！",
    show_wait = 3500
    };
getRow(8)->
    #show1Cfg {
    id = 8,
    showgroupid_1 = 8,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "啊哈，有了这批准备好的食物，我们就可以出发了！",
    show_wait = 3500
    };
getRow(9)->
    #show1Cfg {
    id = 9,
    showgroupid_1 = 9,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "嗯，好像有动静了。",
    show_wait = 3500
    };
getRow(10)->
    #show1Cfg {
    id = 10,
    showgroupid_1 = 10,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "消灭史莱姆只是第一步，开启下一步试炼。",
    show_wait = 3500
    };
getRow(11)->
    #show1Cfg {
    id = 11,
    showgroupid_1 = 11,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "马马虎虎吧，下面是新兵试炼的最后一步。",
    show_wait = 3500
    };
getRow(12)->
    #show1Cfg {
    id = 12,
    showgroupid_1 = 12,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "还不错，新兵试炼完成。",
    show_wait = 3500
    };
getRow(13)->
    #show1Cfg {
    id = 13,
    showgroupid_1 = 13,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "这些草药应该有些作用。",
    show_wait = 3500
    };
getRow(14)->
    #show1Cfg {
    id = 14,
    showgroupid_1 = 13,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "已经开始止血了，不是很碍事了，赶紧去追踪魔狼王的行踪。",
    show_wait = 3500
    };
getRow(15)->
    #show1Cfg {
    id = 15,
    showgroupid_1 = 13,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "我马上就去。",
    show_wait = 3500
    };
getRow(16)->
    #show1Cfg {
    id = 16,
    showgroupid_1 = 14,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "伴随这些魔狼王经过的痕迹，居然还有一些奇怪的东西！",
    show_wait = 3500
    };
getRow(17)->
    #show1Cfg {
    id = 17,
    showgroupid_1 = 15,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "狡猾的魔狼王居然知道派遣部队来阻拦我们！",
    show_wait = 3500
    };
getRow(18)->
    #show1Cfg {
    id = 18,
    showgroupid_1 = 15,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "别管那么多，赶紧找到魔狼王才是重点。",
    show_wait = 3500
    };
getRow(19)->
    #show1Cfg {
    id = 19,
    showgroupid_1 = 16,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "这就是奔袭的怪兽群，他们是朝着一个方向前去的。",
    show_wait = 3500
    };
getRow(20)->
    #show1Cfg {
    id = 20,
    showgroupid_1 = 16,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "我或许可以跟随他们，找到他们的目的地。",
    show_wait = 3500
    };
getRow(21)->
    #show1Cfg {
    id = 21,
    showgroupid_1 = 17,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "越来越多的怪物！",
    show_wait = 3500
    };
getRow(22)->
    #show1Cfg {
    id = 22,
    showgroupid_1 = 18,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "这里的怪物好像已经受到了魔族到来的影响。",
    show_wait = 3500
    };
getRow(23)->
    #show1Cfg {
    id = 23,
    showgroupid_1 = 18,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "这些腐化之种去交给魔法师分析下，或许会有发现。",
    show_wait = 3500
    };
getRow(24)->
    #show1Cfg {
    id = 24,
    showgroupid_1 = 19,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "好像这些怪物越来越难缠了。",
    show_wait = 3500
    };
getRow(25)->
    #show1Cfg {
    id = 25,
    showgroupid_1 = 20,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "这些就是莉安需要的烈焰之心，希望女神保佑莉安，一定不能让他有事啊。",
    show_wait = 3500
    };
getRow(26)->
    #show1Cfg {
    id = 26,
    showgroupid_1 = 20,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "除了烈焰之心，还需要纯净水滴来中和黑暗力量，纯净水滴在史莱姆大王身上。",
    show_wait = 3500
    };
getRow(27)->
    #show1Cfg {
    id = 27,
    showgroupid_1 = 21,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "得赶紧给魔法师送去材料，莉安可千万不能有事啊。",
    show_wait = 3500
    };
getRow(28)->
    #show1Cfg {
    id = 28,
    showgroupid_1 = 22,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "魔狼王的阻拦，真是该死。",
    show_wait = 3500
    };
getRow(29)->
    #show1Cfg {
    id = 29,
    showgroupid_1 = 23,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "好像已经抵达了怪物的聚集地，魔狼王就在里面？",
    show_wait = 3500
    };
getRow(30)->
    #show1Cfg {
    id = 30,
    showgroupid_1 = 24,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "好像发现了魔狼王？",
    show_wait = 3500
    };
getRow(31)->
    #show1Cfg {
    id = 31,
    showgroupid_1 = 25,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "这该死的魔狼王居然还会逃跑！",
    show_wait = 3500
    };
getRow(32)->
    #show1Cfg {
    id = 32,
    showgroupid_1 = 26,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "连阿克勒平原的熊王都被魔狼王控制了，情况有点严重。",
    show_wait = 3500
    };
getRow(500)->
    #show1Cfg {
    id = 500,
    showgroupid_1 = 500,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "这是哪",
    show_wait = 2500
    };
getRow(501)->
    #show1Cfg {
    id = 501,
    showgroupid_1 = 500,
    showname_1 = "皮皮",
    emotion = 1,
    head = 1,
    content = "似乎是海盗巢穴",
    show_wait = 1500
    };
getRow(502)->
    #show1Cfg {
    id = 502,
    showgroupid_1 = 502,
    showname_1 = "皮皮",
    emotion = 1,
    head = 1,
    content = "似乎是一头强大的海妖，有点难办",
    show_wait = 1500
    };
getRow(503)->
    #show1Cfg {
    id = 503,
    showgroupid_1 = 502,
    showname_1 = "0",
    emotion = 1,
    head = 0,
    content = "...身体中涌现一股神秘的力量...",
    show_wait = 1500
    };
getRow(504)->
    #show1Cfg {
    id = 504,
    showgroupid_1 = 502,
    showname_1 = "皮皮",
    emotion = 1,
    head = 1,
    content = "你似乎觉醒了，尝试着使用这股力量",
    show_wait = 1500
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
    {31},
    {32},
    {500},
    {501},
    {502},
    {503},
    {504}
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
    31,
    32,
    500,
    501,
    502,
    503,
    504
    ].

