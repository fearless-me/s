%% coding: latin-1
%%: 实现
-module(cfg_honor_chs).
-compile(export_all).
-include("cfg_honor.hrl").
-include("logger.hrl").

getRow(1)->
    #honorCfg {
    level = 1,
    consumption = 1000,
    paladin = [{30,13,0},{31,13,0}],
    wizard = [{32,13,0},{33,13,0}],
    assassin = [{31,13,0},{33,13,0}],
    soulReaper = [{31,13,0},{32,13,0}],
    mechanic = [{31,13,0},{32,13,0}],
    newplayer_1 = [{31,13,0},{32,13,0}],
    newplayer_2 = [{31,13,0},{32,13,0}],
    money = 1000,
    model = "chacha1",
    name = "残缺的海神之枪I",
    icon = "item_226"
    };
getRow(2)->
    #honorCfg {
    level = 2,
    consumption = 3000,
    paladin = [{4,76,0}],
    wizard = [{4,76,0}],
    assassin = [{4,76,0}],
    soulReaper = [{4,76,0}],
    mechanic = [{4,76,0}],
    newplayer_1 = [{4,76,0}],
    newplayer_2 = [{4,76,0}],
    money = 2000,
    model = "chacha1",
    name = "残缺的海神之枪II",
    icon = "item_226"
    };
getRow(3)->
    #honorCfg {
    level = 3,
    consumption = 4500,
    paladin = [{21,46,0}],
    wizard = [{21,46,0}],
    assassin = [{21,46,0}],
    soulReaper = [{21,46,0}],
    mechanic = [{21,46,0}],
    newplayer_1 = [{21,46,0}],
    newplayer_2 = [{21,46,0}],
    money = 5000,
    model = "chacha1",
    name = "残缺的海神之枪III",
    icon = "item_226"
    };
getRow(4)->
    #honorCfg {
    level = 4,
    consumption = 6000,
    paladin = [{1,38,0}],
    wizard = [{3,38,0}],
    assassin = [{2,38,0}],
    soulReaper = [{1,38,0}],
    mechanic = [{1,38,0}],
    newplayer_1 = [{1,38,0}],
    newplayer_2 = [{1,38,0}],
    money = 10000,
    model = "chacha1",
    name = "残缺的海神之枪IV",
    icon = "item_226"
    };
getRow(5)->
    #honorCfg {
    level = 5,
    consumption = 7500,
    paladin = [{26,98,0}],
    wizard = [{26,98,0}],
    assassin = [{26,98,0}],
    soulReaper = [{26,98,0}],
    mechanic = [{26,98,0}],
    newplayer_1 = [{26,98,0}],
    newplayer_2 = [{26,98,0}],
    money = 17000,
    model = "chacha1",
    name = "残缺的海神之枪V",
    icon = "item_226"
    };
getRow(6)->
    #honorCfg {
    level = 6,
    consumption = 9000,
    paladin = [{28,98,0}],
    wizard = [{28,98,0}],
    assassin = [{28,98,0}],
    soulReaper = [{28,98,0}],
    mechanic = [{28,98,0}],
    newplayer_1 = [{28,98,0}],
    newplayer_2 = [{28,98,0}],
    money = 26000,
    model = "chacha1",
    name = "复原的海神之枪I",
    icon = "item_227"
    };
getRow(7)->
    #honorCfg {
    level = 7,
    consumption = 10500,
    paladin = [{30,8,0},{31,8,0}],
    wizard = [{32,8,0},{33,8,0}],
    assassin = [{31,8,0},{33,8,0}],
    soulReaper = [{31,8,0},{32,8,0}],
    mechanic = [{31,8,0},{32,8,0}],
    newplayer_1 = [{31,8,0},{32,8,0}],
    newplayer_2 = [{31,8,0},{32,8,0}],
    money = 37000,
    model = "chacha2",
    name = "复原的海神之枪II",
    icon = "item_227"
    };
getRow(8)->
    #honorCfg {
    level = 8,
    consumption = 12000,
    paladin = [{4,50,0}],
    wizard = [{4,50,0}],
    assassin = [{4,50,0}],
    soulReaper = [{4,50,0}],
    mechanic = [{4,50,0}],
    newplayer_1 = [{4,50,0}],
    newplayer_2 = [{4,50,0}],
    money = 50000,
    model = "chacha2",
    name = "复原的海神之枪III",
    icon = "item_227"
    };
getRow(9)->
    #honorCfg {
    level = 9,
    consumption = 13500,
    paladin = [{21,30,0}],
    wizard = [{21,30,0}],
    assassin = [{21,30,0}],
    soulReaper = [{21,30,0}],
    mechanic = [{21,30,0}],
    newplayer_1 = [{21,30,0}],
    newplayer_2 = [{21,30,0}],
    money = 65000,
    model = "chacha2",
    name = "复原的海神之枪IV",
    icon = "item_227"
    };
getRow(10)->
    #honorCfg {
    level = 10,
    consumption = 15000,
    paladin = [{1,26,0}],
    wizard = [{3,26,0}],
    assassin = [{2,26,0}],
    soulReaper = [{1,26,0}],
    mechanic = [{1,26,0}],
    newplayer_1 = [{1,26,0}],
    newplayer_2 = [{1,26,0}],
    money = 82000,
    model = "chacha2",
    name = "复原的海神之枪V",
    icon = "item_227"
    };
getRow(11)->
    #honorCfg {
    level = 11,
    consumption = 16500,
    paladin = [{26,66,0}],
    wizard = [{26,66,0}],
    assassin = [{26,66,0}],
    soulReaper = [{26,66,0}],
    mechanic = [{26,66,0}],
    newplayer_1 = [{26,66,0}],
    newplayer_2 = [{26,66,0}],
    money = 101000,
    model = "chacha2",
    name = "无暇的海神之枪I",
    icon = "item_228"
    };
getRow(12)->
    #honorCfg {
    level = 12,
    consumption = 18000,
    paladin = [{28,66,0}],
    wizard = [{28,66,0}],
    assassin = [{28,66,0}],
    soulReaper = [{28,66,0}],
    mechanic = [{28,66,0}],
    newplayer_1 = [{28,66,0}],
    newplayer_2 = [{28,66,0}],
    money = 122000,
    model = "chacha2",
    name = "无暇的海神之枪II",
    icon = "item_228"
    };
getRow(13)->
    #honorCfg {
    level = 13,
    consumption = 19500,
    paladin = [{30,14,0},{31,14,0}],
    wizard = [{32,14,0},{33,14,0}],
    assassin = [{31,14,0},{33,14,0}],
    soulReaper = [{31,14,0},{32,14,0}],
    mechanic = [{31,14,0},{32,14,0}],
    newplayer_1 = [{31,14,0},{32,14,0}],
    newplayer_2 = [{31,14,0},{32,14,0}],
    money = 145000,
    model = "chacha3",
    name = "无暇的海神之枪III",
    icon = "item_228"
    };
getRow(14)->
    #honorCfg {
    level = 14,
    consumption = 21000,
    paladin = [{4,84,0}],
    wizard = [{4,84,0}],
    assassin = [{4,84,0}],
    soulReaper = [{4,84,0}],
    mechanic = [{4,84,0}],
    newplayer_1 = [{4,84,0}],
    newplayer_2 = [{4,84,0}],
    money = 170000,
    model = "chacha3",
    name = "无暇的海神之枪IV",
    icon = "item_228"
    };
getRow(15)->
    #honorCfg {
    level = 15,
    consumption = 22500,
    paladin = [{21,50,0}],
    wizard = [{21,50,0}],
    assassin = [{21,50,0}],
    soulReaper = [{21,50,0}],
    mechanic = [{21,50,0}],
    newplayer_1 = [{21,50,0}],
    newplayer_2 = [{21,50,0}],
    money = 197000,
    model = "chacha3",
    name = "无暇的海神之枪V",
    icon = "item_228"
    };
getRow(16)->
    #honorCfg {
    level = 16,
    consumption = 24000,
    paladin = [{1,44,0}],
    wizard = [{3,44,0}],
    assassin = [{2,44,0}],
    soulReaper = [{1,44,0}],
    mechanic = [{1,44,0}],
    newplayer_1 = [{1,44,0}],
    newplayer_2 = [{1,44,0}],
    money = 226000,
    model = "chacha3",
    name = "完美的海神之枪I",
    icon = "item_229"
    };
getRow(17)->
    #honorCfg {
    level = 17,
    consumption = 25500,
    paladin = [{26,112,0}],
    wizard = [{26,112,0}],
    assassin = [{26,112,0}],
    soulReaper = [{26,112,0}],
    mechanic = [{26,112,0}],
    newplayer_1 = [{26,112,0}],
    newplayer_2 = [{26,112,0}],
    money = 257000,
    model = "chacha3",
    name = "完美的海神之枪II",
    icon = "item_229"
    };
getRow(18)->
    #honorCfg {
    level = 18,
    consumption = 27000,
    paladin = [{28,112,0}],
    wizard = [{28,112,0}],
    assassin = [{28,112,0}],
    soulReaper = [{28,112,0}],
    mechanic = [{28,112,0}],
    newplayer_1 = [{28,112,0}],
    newplayer_2 = [{28,112,0}],
    money = 290000,
    model = "chacha3",
    name = "完美的海神之枪III",
    icon = "item_229"
    };
getRow(19)->
    #honorCfg {
    level = 19,
    consumption = 28500,
    paladin = [{30,23,0},{31,23,0}],
    wizard = [{32,23,0},{33,23,0}],
    assassin = [{31,23,0},{33,23,0}],
    soulReaper = [{31,23,0},{32,23,0}],
    mechanic = [{31,23,0},{32,23,0}],
    newplayer_1 = [{31,23,0},{32,23,0}],
    newplayer_2 = [{31,23,0},{32,23,0}],
    money = 325000,
    model = "chacha4",
    name = "完美的海神之枪IV",
    icon = "item_229"
    };
getRow(20)->
    #honorCfg {
    level = 20,
    consumption = 30000,
    paladin = [{4,140,0}],
    wizard = [{4,140,0}],
    assassin = [{4,140,0}],
    soulReaper = [{4,140,0}],
    mechanic = [{4,140,0}],
    newplayer_1 = [{4,140,0}],
    newplayer_2 = [{4,140,0}],
    money = 362000,
    model = "chacha4",
    name = "完美的海神之枪V",
    icon = "item_229"
    };
getRow(21)->
    #honorCfg {
    level = 21,
    consumption = 31500,
    paladin = [{21,84,0}],
    wizard = [{21,84,0}],
    assassin = [{21,84,0}],
    soulReaper = [{21,84,0}],
    mechanic = [{21,84,0}],
    newplayer_1 = [{21,84,0}],
    newplayer_2 = [{21,84,0}],
    money = 401000,
    model = "chacha4",
    name = "卓越的海神之枪I",
    icon = "item_230"
    };
getRow(22)->
    #honorCfg {
    level = 22,
    consumption = 33000,
    paladin = [{1,72,0}],
    wizard = [{3,72,0}],
    assassin = [{2,72,0}],
    soulReaper = [{1,72,0}],
    mechanic = [{1,72,0}],
    newplayer_1 = [{1,72,0}],
    newplayer_2 = [{1,72,0}],
    money = 442000,
    model = "chacha4",
    name = "卓越的海神之枪II",
    icon = "item_230"
    };
getRow(23)->
    #honorCfg {
    level = 23,
    consumption = 34500,
    paladin = [{26,184,0}],
    wizard = [{26,184,0}],
    assassin = [{26,184,0}],
    soulReaper = [{26,184,0}],
    mechanic = [{26,184,0}],
    newplayer_1 = [{26,184,0}],
    newplayer_2 = [{26,184,0}],
    money = 485000,
    model = "chacha4",
    name = "卓越的海神之枪III",
    icon = "item_230"
    };
getRow(24)->
    #honorCfg {
    level = 24,
    consumption = 36000,
    paladin = [{28,184,0}],
    wizard = [{28,184,0}],
    assassin = [{28,184,0}],
    soulReaper = [{28,184,0}],
    mechanic = [{28,184,0}],
    newplayer_1 = [{28,184,0}],
    newplayer_2 = [{28,184,0}],
    money = 530000,
    model = "chacha4",
    name = "卓越的海神之枪IV",
    icon = "item_230"
    };
getRow(25)->
    #honorCfg {
    level = 25,
    consumption = 37500,
    paladin = [{30,40,0},{31,40,0}],
    wizard = [{32,40,0},{33,40,0}],
    assassin = [{31,40,0},{33,40,0}],
    soulReaper = [{31,40,0},{32,40,0}],
    mechanic = [{31,40,0},{32,40,0}],
    newplayer_1 = [{31,40,0},{32,40,0}],
    newplayer_2 = [{31,40,0},{32,40,0}],
    money = 577000,
    model = "chacha5",
    name = "卓越的海神之枪V",
    icon = "item_230"
    };
getRow(26)->
    #honorCfg {
    level = 26,
    consumption = 39000,
    paladin = [{4,236,0}],
    wizard = [{4,236,0}],
    assassin = [{4,236,0}],
    soulReaper = [{4,236,0}],
    mechanic = [{4,236,0}],
    newplayer_1 = [{4,236,0}],
    newplayer_2 = [{4,236,0}],
    money = 626000,
    model = "chacha5",
    name = "神圣的海神之枪I",
    icon = "item_231"
    };
getRow(27)->
    #honorCfg {
    level = 27,
    consumption = 40500,
    paladin = [{21,142,0}],
    wizard = [{21,142,0}],
    assassin = [{21,142,0}],
    soulReaper = [{21,142,0}],
    mechanic = [{21,142,0}],
    newplayer_1 = [{21,142,0}],
    newplayer_2 = [{21,142,0}],
    money = 677000,
    model = "chacha5",
    name = "神圣的海神之枪II",
    icon = "item_231"
    };
getRow(28)->
    #honorCfg {
    level = 28,
    consumption = 42000,
    paladin = [{1,120,0}],
    wizard = [{3,120,0}],
    assassin = [{2,120,0}],
    soulReaper = [{1,120,0}],
    mechanic = [{1,120,0}],
    newplayer_1 = [{1,120,0}],
    newplayer_2 = [{1,120,0}],
    money = 730000,
    model = "chacha5",
    name = "神圣的海神之枪III",
    icon = "item_231"
    };
getRow(29)->
    #honorCfg {
    level = 29,
    consumption = 43500,
    paladin = [{26,308,0}],
    wizard = [{26,308,0}],
    assassin = [{26,308,0}],
    soulReaper = [{26,308,0}],
    mechanic = [{26,308,0}],
    newplayer_1 = [{26,308,0}],
    newplayer_2 = [{26,308,0}],
    money = 785000,
    model = "chacha5",
    name = "神圣的海神之枪IV",
    icon = "item_231"
    };
getRow(30)->
    #honorCfg {
    level = 30,
    consumption = 45000,
    paladin = [{28,308,0}],
    wizard = [{28,308,0}],
    assassin = [{28,308,0}],
    soulReaper = [{28,308,0}],
    mechanic = [{28,308,0}],
    newplayer_1 = [{28,308,0}],
    newplayer_2 = [{28,308,0}],
    money = 842000,
    model = "chacha5",
    name = "苏醒的海神之枪",
    icon = "item_232"
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
    {30}
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
    30
    ].

