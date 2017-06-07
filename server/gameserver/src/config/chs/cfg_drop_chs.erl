%% coding: latin-1
%%: 实现
-module(cfg_drop_chs).
-compile(export_all).
-include("cfg_drop.hrl").
-include("logger.hrl").

getRow(1)->
    #dropCfg {
    dropId = 1,
    dropType = 0,
    dataId = 11,
    probability = 5000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2)->
    #dropCfg {
    dropId = 2,
    dropType = 1,
    dataId = 1,
    probability = 5000,
    min = 0,
    max = 0,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3)->
    #dropCfg {
    dropId = 2,
    dropType = 1,
    dataId = 2,
    probability = 5000,
    min = 0,
    max = 0,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4)->
    #dropCfg {
    dropId = 51,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(5)->
    #dropCfg {
    dropId = 52,
    dropType = 1,
    dataId = 12,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(6)->
    #dropCfg {
    dropId = 53,
    dropType = 1,
    dataId = 13,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(7)->
    #dropCfg {
    dropId = 54,
    dropType = 1,
    dataId = 14,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(8)->
    #dropCfg {
    dropId = 55,
    dropType = 1,
    dataId = 15,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(9)->
    #dropCfg {
    dropId = 56,
    dropType = 1,
    dataId = 16,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(10)->
    #dropCfg {
    dropId = 57,
    dropType = 1,
    dataId = 17,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(11)->
    #dropCfg {
    dropId = 58,
    dropType = 1,
    dataId = 18,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(12)->
    #dropCfg {
    dropId = 59,
    dropType = 1,
    dataId = 19,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(13)->
    #dropCfg {
    dropId = 60,
    dropType = 1,
    dataId = 20,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(14)->
    #dropCfg {
    dropId = 71,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(15)->
    #dropCfg {
    dropId = 72,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(16)->
    #dropCfg {
    dropId = 73,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(17)->
    #dropCfg {
    dropId = 74,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(18)->
    #dropCfg {
    dropId = 75,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(19)->
    #dropCfg {
    dropId = 76,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(20)->
    #dropCfg {
    dropId = 77,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(21)->
    #dropCfg {
    dropId = 78,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(22)->
    #dropCfg {
    dropId = 79,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(23)->
    #dropCfg {
    dropId = 80,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(24)->
    #dropCfg {
    dropId = 101,
    dropType = 0,
    dataId = 611,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(25)->
    #dropCfg {
    dropId = 101,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(26)->
    #dropCfg {
    dropId = 101,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(27)->
    #dropCfg {
    dropId = 101,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(28)->
    #dropCfg {
    dropId = 102,
    dropType = 0,
    dataId = 152,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(29)->
    #dropCfg {
    dropId = 102,
    dropType = 0,
    dataId = 200,
    probability = 10000,
    min = 99,
    max = 99,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(30)->
    #dropCfg {
    dropId = 103,
    dropType = 0,
    dataId = 21001,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(31)->
    #dropCfg {
    dropId = 103,
    dropType = 0,
    dataId = 11,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(32)->
    #dropCfg {
    dropId = 103,
    dropType = 0,
    dataId = 11,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(33)->
    #dropCfg {
    dropId = 201,
    dropType = 0,
    dataId = 300,
    probability = 5000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(34)->
    #dropCfg {
    dropId = 201,
    dropType = 0,
    dataId = 210,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(35)->
    #dropCfg {
    dropId = 202,
    dropType = 0,
    dataId = 300,
    probability = 5000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(36)->
    #dropCfg {
    dropId = 202,
    dropType = 0,
    dataId = 210,
    probability = 10000,
    min = 1,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(37)->
    #dropCfg {
    dropId = 203,
    dropType = 0,
    dataId = 300,
    probability = 5000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(38)->
    #dropCfg {
    dropId = 203,
    dropType = 0,
    dataId = 210,
    probability = 10000,
    min = 1,
    max = 9,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(39)->
    #dropCfg {
    dropId = 204,
    dropType = 0,
    dataId = 300,
    probability = 5000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(40)->
    #dropCfg {
    dropId = 204,
    dropType = 0,
    dataId = 210,
    probability = 10000,
    min = 1,
    max = 12,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(41)->
    #dropCfg {
    dropId = 205,
    dropType = 0,
    dataId = 300,
    probability = 5000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(42)->
    #dropCfg {
    dropId = 205,
    dropType = 0,
    dataId = 210,
    probability = 10000,
    min = 1,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(43)->
    #dropCfg {
    dropId = 206,
    dropType = 0,
    dataId = 301,
    probability = 5000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(44)->
    #dropCfg {
    dropId = 206,
    dropType = 0,
    dataId = 210,
    probability = 10000,
    min = 1,
    max = 18,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(45)->
    #dropCfg {
    dropId = 207,
    dropType = 0,
    dataId = 301,
    probability = 5000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(46)->
    #dropCfg {
    dropId = 207,
    dropType = 0,
    dataId = 210,
    probability = 10000,
    min = 1,
    max = 21,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(47)->
    #dropCfg {
    dropId = 208,
    dropType = 0,
    dataId = 301,
    probability = 5000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(48)->
    #dropCfg {
    dropId = 208,
    dropType = 0,
    dataId = 210,
    probability = 10000,
    min = 1,
    max = 24,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(49)->
    #dropCfg {
    dropId = 209,
    dropType = 0,
    dataId = 301,
    probability = 5000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(50)->
    #dropCfg {
    dropId = 209,
    dropType = 0,
    dataId = 210,
    probability = 10000,
    min = 1,
    max = 27,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(51)->
    #dropCfg {
    dropId = 210,
    dropType = 0,
    dataId = 301,
    probability = 5000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(52)->
    #dropCfg {
    dropId = 210,
    dropType = 0,
    dataId = 210,
    probability = 10000,
    min = 1,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(53)->
    #dropCfg {
    dropId = 211,
    dropType = 0,
    dataId = 302,
    probability = 5000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(54)->
    #dropCfg {
    dropId = 211,
    dropType = 0,
    dataId = 210,
    probability = 10000,
    min = 1,
    max = 33,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(55)->
    #dropCfg {
    dropId = 212,
    dropType = 0,
    dataId = 302,
    probability = 5000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(56)->
    #dropCfg {
    dropId = 212,
    dropType = 0,
    dataId = 210,
    probability = 10000,
    min = 1,
    max = 36,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(57)->
    #dropCfg {
    dropId = 213,
    dropType = 0,
    dataId = 302,
    probability = 5000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(58)->
    #dropCfg {
    dropId = 213,
    dropType = 0,
    dataId = 210,
    probability = 10000,
    min = 1,
    max = 39,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(59)->
    #dropCfg {
    dropId = 214,
    dropType = 0,
    dataId = 302,
    probability = 5000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(60)->
    #dropCfg {
    dropId = 214,
    dropType = 0,
    dataId = 210,
    probability = 10000,
    min = 1,
    max = 42,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(61)->
    #dropCfg {
    dropId = 215,
    dropType = 0,
    dataId = 302,
    probability = 5000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(62)->
    #dropCfg {
    dropId = 215,
    dropType = 0,
    dataId = 220,
    probability = 10000,
    min = 1,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(63)->
    #dropCfg {
    dropId = 301,
    dropType = 0,
    dataId = 611,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(64)->
    #dropCfg {
    dropId = 302,
    dropType = 0,
    dataId = 611,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(65)->
    #dropCfg {
    dropId = 303,
    dropType = 0,
    dataId = 611,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(66)->
    #dropCfg {
    dropId = 304,
    dropType = 0,
    dataId = 611,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(67)->
    #dropCfg {
    dropId = 305,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(68)->
    #dropCfg {
    dropId = 306,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(69)->
    #dropCfg {
    dropId = 307,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(70)->
    #dropCfg {
    dropId = 308,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(71)->
    #dropCfg {
    dropId = 309,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(72)->
    #dropCfg {
    dropId = 310,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(73)->
    #dropCfg {
    dropId = 311,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(74)->
    #dropCfg {
    dropId = 312,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(75)->
    #dropCfg {
    dropId = 313,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(76)->
    #dropCfg {
    dropId = 314,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(77)->
    #dropCfg {
    dropId = 315,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(78)->
    #dropCfg {
    dropId = 401,
    dropType = 0,
    dataId = 101,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(79)->
    #dropCfg {
    dropId = 402,
    dropType = 0,
    dataId = 102,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(80)->
    #dropCfg {
    dropId = 403,
    dropType = 0,
    dataId = 103,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(81)->
    #dropCfg {
    dropId = 404,
    dropType = 0,
    dataId = 104,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(82)->
    #dropCfg {
    dropId = 405,
    dropType = 0,
    dataId = 105,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(83)->
    #dropCfg {
    dropId = 406,
    dropType = 0,
    dataId = 106,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(84)->
    #dropCfg {
    dropId = 407,
    dropType = 0,
    dataId = 107,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(85)->
    #dropCfg {
    dropId = 408,
    dropType = 0,
    dataId = 109,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(86)->
    #dropCfg {
    dropId = 460,
    dropType = 0,
    dataId = 776,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(87)->
    #dropCfg {
    dropId = 460,
    dropType = 0,
    dataId = 4305,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(88)->
    #dropCfg {
    dropId = 460,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(89)->
    #dropCfg {
    dropId = 460,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(90)->
    #dropCfg {
    dropId = 460,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(91)->
    #dropCfg {
    dropId = 460,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(92)->
    #dropCfg {
    dropId = 461,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(93)->
    #dropCfg {
    dropId = 461,
    dropType = 0,
    dataId = 776,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(94)->
    #dropCfg {
    dropId = 461,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(95)->
    #dropCfg {
    dropId = 461,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(96)->
    #dropCfg {
    dropId = 461,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(97)->
    #dropCfg {
    dropId = 461,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(98)->
    #dropCfg {
    dropId = 462,
    dropType = 0,
    dataId = 776,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(99)->
    #dropCfg {
    dropId = 462,
    dropType = 0,
    dataId = 4303,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(100)->
    #dropCfg {
    dropId = 462,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(101)->
    #dropCfg {
    dropId = 462,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(102)->
    #dropCfg {
    dropId = 462,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(103)->
    #dropCfg {
    dropId = 462,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(104)->
    #dropCfg {
    dropId = 463,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(105)->
    #dropCfg {
    dropId = 463,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(106)->
    #dropCfg {
    dropId = 463,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(107)->
    #dropCfg {
    dropId = 463,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(108)->
    #dropCfg {
    dropId = 463,
    dropType = 0,
    dataId = 617,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(109)->
    #dropCfg {
    dropId = 463,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(110)->
    #dropCfg {
    dropId = 463,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    min = 1,
    max = 500,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(111)->
    #dropCfg {
    dropId = 463,
    dropType = 0,
    dataId = 226,
    probability = 10000,
    min = 2,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(112)->
    #dropCfg {
    dropId = 463,
    dropType = 0,
    dataId = 227,
    probability = 10000,
    min = 2,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(113)->
    #dropCfg {
    dropId = 464,
    dropType = 1,
    dataId = 464,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(114)->
    #dropCfg {
    dropId = 465,
    dropType = 1,
    dataId = 465,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(115)->
    #dropCfg {
    dropId = 466,
    dropType = 1,
    dataId = 466,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(116)->
    #dropCfg {
    dropId = 467,
    dropType = 1,
    dataId = 467,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(117)->
    #dropCfg {
    dropId = 470,
    dropType = 1,
    dataId = 4670,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(118)->
    #dropCfg {
    dropId = 471,
    dropType = 1,
    dataId = 4671,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(119)->
    #dropCfg {
    dropId = 472,
    dropType = 1,
    dataId = 4672,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(120)->
    #dropCfg {
    dropId = 501,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(121)->
    #dropCfg {
    dropId = 502,
    dropType = 1,
    dataId = 12,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(122)->
    #dropCfg {
    dropId = 503,
    dropType = 1,
    dataId = 13,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(123)->
    #dropCfg {
    dropId = 504,
    dropType = 1,
    dataId = 14,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(124)->
    #dropCfg {
    dropId = 505,
    dropType = 1,
    dataId = 15,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(125)->
    #dropCfg {
    dropId = 506,
    dropType = 1,
    dataId = 16,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(126)->
    #dropCfg {
    dropId = 507,
    dropType = 1,
    dataId = 17,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(127)->
    #dropCfg {
    dropId = 508,
    dropType = 1,
    dataId = 18,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(128)->
    #dropCfg {
    dropId = 509,
    dropType = 1,
    dataId = 19,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(129)->
    #dropCfg {
    dropId = 510,
    dropType = 1,
    dataId = 20,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(130)->
    #dropCfg {
    dropId = 601,
    dropType = 1,
    dataId = 21,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(131)->
    #dropCfg {
    dropId = 602,
    dropType = 1,
    dataId = 22,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(132)->
    #dropCfg {
    dropId = 603,
    dropType = 1,
    dataId = 23,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(133)->
    #dropCfg {
    dropId = 611,
    dropType = 0,
    dataId = 603,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(134)->
    #dropCfg {
    dropId = 611,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(135)->
    #dropCfg {
    dropId = 611,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(136)->
    #dropCfg {
    dropId = 611,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(137)->
    #dropCfg {
    dropId = 612,
    dropType = 0,
    dataId = 604,
    probability = 10000,
    min = 3,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(138)->
    #dropCfg {
    dropId = 612,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(139)->
    #dropCfg {
    dropId = 612,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(140)->
    #dropCfg {
    dropId = 612,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(141)->
    #dropCfg {
    dropId = 613,
    dropType = 0,
    dataId = 604,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(142)->
    #dropCfg {
    dropId = 613,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(143)->
    #dropCfg {
    dropId = 613,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 9,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(144)->
    #dropCfg {
    dropId = 613,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(145)->
    #dropCfg {
    dropId = 651,
    dropType = 0,
    dataId = 4305,
    probability = 10000,
    min = 30,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(146)->
    #dropCfg {
    dropId = 651,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 20,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(147)->
    #dropCfg {
    dropId = 652,
    dropType = 0,
    dataId = 4305,
    probability = 10000,
    min = 10,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(148)->
    #dropCfg {
    dropId = 652,
    dropType = 1,
    dataId = 616,
    probability = 10000,
    min = 10,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(149)->
    #dropCfg {
    dropId = 653,
    dropType = 0,
    dataId = 4305,
    probability = 10000,
    min = 6,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(150)->
    #dropCfg {
    dropId = 653,
    dropType = 1,
    dataId = 616,
    probability = 10000,
    min = 5,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(151)->
    #dropCfg {
    dropId = 654,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    min = 10,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(152)->
    #dropCfg {
    dropId = 654,
    dropType = 1,
    dataId = 616,
    probability = 10000,
    min = 5,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(153)->
    #dropCfg {
    dropId = 655,
    dropType = 0,
    dataId = 4305,
    probability = 10000,
    min = 10,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(154)->
    #dropCfg {
    dropId = 655,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 10,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(155)->
    #dropCfg {
    dropId = 661,
    dropType = 0,
    dataId = 20,
    probability = 2666,
    min = 50,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(156)->
    #dropCfg {
    dropId = 662,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 100,
    max = 150,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(157)->
    #dropCfg {
    dropId = 663,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(158)->
    #dropCfg {
    dropId = 663,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(159)->
    #dropCfg {
    dropId = 663,
    dropType = 0,
    dataId = 2022,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(160)->
    #dropCfg {
    dropId = 664,
    dropType = 1,
    dataId = 12,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(161)->
    #dropCfg {
    dropId = 664,
    dropType = 0,
    dataId = 2004,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(162)->
    #dropCfg {
    dropId = 664,
    dropType = 0,
    dataId = 2150,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(163)->
    #dropCfg {
    dropId = 665,
    dropType = 0,
    dataId = 164,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(164)->
    #dropCfg {
    dropId = 665,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(165)->
    #dropCfg {
    dropId = 665,
    dropType = 0,
    dataId = 301,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(166)->
    #dropCfg {
    dropId = 665,
    dropType = 0,
    dataId = 2005,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(167)->
    #dropCfg {
    dropId = 665,
    dropType = 0,
    dataId = 904,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(168)->
    #dropCfg {
    dropId = 665,
    dropType = 0,
    dataId = 210,
    probability = 10000,
    min = 99,
    max = 99,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(169)->
    #dropCfg {
    dropId = 665,
    dropType = 0,
    dataId = 211,
    probability = 10000,
    min = 9,
    max = 9,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(170)->
    #dropCfg {
    dropId = 666,
    dropType = 0,
    dataId = 903,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(171)->
    #dropCfg {
    dropId = 666,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(172)->
    #dropCfg {
    dropId = 666,
    dropType = 0,
    dataId = 301,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(173)->
    #dropCfg {
    dropId = 667,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 3,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(174)->
    #dropCfg {
    dropId = 667,
    dropType = 0,
    dataId = 615,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(175)->
    #dropCfg {
    dropId = 667,
    dropType = 0,
    dataId = 2004,
    probability = 10000,
    min = 3,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(176)->
    #dropCfg {
    dropId = 668,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(177)->
    #dropCfg {
    dropId = 668,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(178)->
    #dropCfg {
    dropId = 668,
    dropType = 0,
    dataId = 2004,
    probability = 10000,
    min = 3,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(179)->
    #dropCfg {
    dropId = 669,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(180)->
    #dropCfg {
    dropId = 669,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(181)->
    #dropCfg {
    dropId = 669,
    dropType = 0,
    dataId = 2004,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(182)->
    #dropCfg {
    dropId = 670,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(183)->
    #dropCfg {
    dropId = 670,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(184)->
    #dropCfg {
    dropId = 670,
    dropType = 0,
    dataId = 2004,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(185)->
    #dropCfg {
    dropId = 701,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(186)->
    #dropCfg {
    dropId = 701,
    dropType = 0,
    dataId = 222,
    probability = 5000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(187)->
    #dropCfg {
    dropId = 701,
    dropType = 0,
    dataId = 222,
    probability = 30,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(188)->
    #dropCfg {
    dropId = 701,
    dropType = 0,
    dataId = 2102,
    probability = 2000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(189)->
    #dropCfg {
    dropId = 701,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(190)->
    #dropCfg {
    dropId = 701,
    dropType = 0,
    dataId = 2022,
    probability = 1000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(191)->
    #dropCfg {
    dropId = 702,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(192)->
    #dropCfg {
    dropId = 702,
    dropType = 0,
    dataId = 222,
    probability = 5000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(193)->
    #dropCfg {
    dropId = 702,
    dropType = 0,
    dataId = 222,
    probability = 30,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(194)->
    #dropCfg {
    dropId = 702,
    dropType = 0,
    dataId = 2102,
    probability = 2000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(195)->
    #dropCfg {
    dropId = 702,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(196)->
    #dropCfg {
    dropId = 702,
    dropType = 0,
    dataId = 2022,
    probability = 1000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(197)->
    #dropCfg {
    dropId = 703,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(198)->
    #dropCfg {
    dropId = 703,
    dropType = 0,
    dataId = 222,
    probability = 8000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(199)->
    #dropCfg {
    dropId = 703,
    dropType = 0,
    dataId = 222,
    probability = 30,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(200)->
    #dropCfg {
    dropId = 703,
    dropType = 0,
    dataId = 2102,
    probability = 2000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(201)->
    #dropCfg {
    dropId = 703,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(202)->
    #dropCfg {
    dropId = 703,
    dropType = 0,
    dataId = 2022,
    probability = 1000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(203)->
    #dropCfg {
    dropId = 704,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(204)->
    #dropCfg {
    dropId = 704,
    dropType = 0,
    dataId = 222,
    probability = 5000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(205)->
    #dropCfg {
    dropId = 704,
    dropType = 0,
    dataId = 222,
    probability = 30,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(206)->
    #dropCfg {
    dropId = 704,
    dropType = 0,
    dataId = 2102,
    probability = 2000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(207)->
    #dropCfg {
    dropId = 704,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(208)->
    #dropCfg {
    dropId = 704,
    dropType = 0,
    dataId = 2022,
    probability = 1000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(209)->
    #dropCfg {
    dropId = 705,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(210)->
    #dropCfg {
    dropId = 705,
    dropType = 0,
    dataId = 222,
    probability = 5000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(211)->
    #dropCfg {
    dropId = 705,
    dropType = 0,
    dataId = 222,
    probability = 30,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(212)->
    #dropCfg {
    dropId = 705,
    dropType = 0,
    dataId = 2102,
    probability = 2000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(213)->
    #dropCfg {
    dropId = 705,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(214)->
    #dropCfg {
    dropId = 705,
    dropType = 0,
    dataId = 2022,
    probability = 1000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(215)->
    #dropCfg {
    dropId = 706,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(216)->
    #dropCfg {
    dropId = 706,
    dropType = 0,
    dataId = 222,
    probability = 5000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(217)->
    #dropCfg {
    dropId = 706,
    dropType = 0,
    dataId = 222,
    probability = 30,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(218)->
    #dropCfg {
    dropId = 706,
    dropType = 0,
    dataId = 2102,
    probability = 2000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(219)->
    #dropCfg {
    dropId = 706,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(220)->
    #dropCfg {
    dropId = 706,
    dropType = 0,
    dataId = 2022,
    probability = 1000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(221)->
    #dropCfg {
    dropId = 707,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(222)->
    #dropCfg {
    dropId = 707,
    dropType = 0,
    dataId = 222,
    probability = 5000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(223)->
    #dropCfg {
    dropId = 707,
    dropType = 0,
    dataId = 222,
    probability = 30,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(224)->
    #dropCfg {
    dropId = 707,
    dropType = 0,
    dataId = 2102,
    probability = 2000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(225)->
    #dropCfg {
    dropId = 707,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(226)->
    #dropCfg {
    dropId = 707,
    dropType = 0,
    dataId = 2022,
    probability = 1000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(227)->
    #dropCfg {
    dropId = 708,
    dropType = 1,
    dataId = 11,
    probability = 5000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(228)->
    #dropCfg {
    dropId = 708,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(229)->
    #dropCfg {
    dropId = 708,
    dropType = 0,
    dataId = 222,
    probability = 5000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(230)->
    #dropCfg {
    dropId = 708,
    dropType = 0,
    dataId = 222,
    probability = 50,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(231)->
    #dropCfg {
    dropId = 708,
    dropType = 0,
    dataId = 2102,
    probability = 2500,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(232)->
    #dropCfg {
    dropId = 708,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(233)->
    #dropCfg {
    dropId = 708,
    dropType = 0,
    dataId = 2022,
    probability = 300,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(234)->
    #dropCfg {
    dropId = 709,
    dropType = 1,
    dataId = 11,
    probability = 5000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(235)->
    #dropCfg {
    dropId = 709,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(236)->
    #dropCfg {
    dropId = 709,
    dropType = 0,
    dataId = 222,
    probability = 5000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(237)->
    #dropCfg {
    dropId = 709,
    dropType = 0,
    dataId = 222,
    probability = 50,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(238)->
    #dropCfg {
    dropId = 709,
    dropType = 0,
    dataId = 2102,
    probability = 2500,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(239)->
    #dropCfg {
    dropId = 709,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(240)->
    #dropCfg {
    dropId = 709,
    dropType = 0,
    dataId = 2022,
    probability = 300,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(241)->
    #dropCfg {
    dropId = 710,
    dropType = 1,
    dataId = 11,
    probability = 5000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(242)->
    #dropCfg {
    dropId = 710,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(243)->
    #dropCfg {
    dropId = 710,
    dropType = 0,
    dataId = 222,
    probability = 5000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(244)->
    #dropCfg {
    dropId = 710,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(245)->
    #dropCfg {
    dropId = 710,
    dropType = 0,
    dataId = 2102,
    probability = 2500,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(246)->
    #dropCfg {
    dropId = 710,
    dropType = 0,
    dataId = 222,
    probability = 100,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(247)->
    #dropCfg {
    dropId = 710,
    dropType = 0,
    dataId = 2022,
    probability = 300,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(248)->
    #dropCfg {
    dropId = 711,
    dropType = 1,
    dataId = 11,
    probability = 5000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(249)->
    #dropCfg {
    dropId = 711,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(250)->
    #dropCfg {
    dropId = 711,
    dropType = 0,
    dataId = 222,
    probability = 5000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(251)->
    #dropCfg {
    dropId = 711,
    dropType = 0,
    dataId = 222,
    probability = 50,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(252)->
    #dropCfg {
    dropId = 711,
    dropType = 0,
    dataId = 2102,
    probability = 2500,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(253)->
    #dropCfg {
    dropId = 711,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(254)->
    #dropCfg {
    dropId = 711,
    dropType = 0,
    dataId = 2022,
    probability = 300,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(255)->
    #dropCfg {
    dropId = 712,
    dropType = 1,
    dataId = 11,
    probability = 5000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(256)->
    #dropCfg {
    dropId = 712,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(257)->
    #dropCfg {
    dropId = 712,
    dropType = 0,
    dataId = 222,
    probability = 5000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(258)->
    #dropCfg {
    dropId = 712,
    dropType = 0,
    dataId = 222,
    probability = 50,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(259)->
    #dropCfg {
    dropId = 712,
    dropType = 0,
    dataId = 2102,
    probability = 2500,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(260)->
    #dropCfg {
    dropId = 712,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(261)->
    #dropCfg {
    dropId = 712,
    dropType = 0,
    dataId = 2022,
    probability = 300,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(262)->
    #dropCfg {
    dropId = 713,
    dropType = 1,
    dataId = 11,
    probability = 5000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(263)->
    #dropCfg {
    dropId = 713,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(264)->
    #dropCfg {
    dropId = 713,
    dropType = 0,
    dataId = 222,
    probability = 5000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(265)->
    #dropCfg {
    dropId = 713,
    dropType = 0,
    dataId = 222,
    probability = 50,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(266)->
    #dropCfg {
    dropId = 713,
    dropType = 0,
    dataId = 2102,
    probability = 2500,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(267)->
    #dropCfg {
    dropId = 713,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(268)->
    #dropCfg {
    dropId = 713,
    dropType = 0,
    dataId = 2022,
    probability = 300,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(269)->
    #dropCfg {
    dropId = 714,
    dropType = 1,
    dataId = 11,
    probability = 5000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(270)->
    #dropCfg {
    dropId = 714,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(271)->
    #dropCfg {
    dropId = 714,
    dropType = 0,
    dataId = 222,
    probability = 5000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(272)->
    #dropCfg {
    dropId = 714,
    dropType = 0,
    dataId = 222,
    probability = 50,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(273)->
    #dropCfg {
    dropId = 714,
    dropType = 0,
    dataId = 2102,
    probability = 2500,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(274)->
    #dropCfg {
    dropId = 714,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(275)->
    #dropCfg {
    dropId = 714,
    dropType = 0,
    dataId = 2022,
    probability = 300,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(276)->
    #dropCfg {
    dropId = 715,
    dropType = 1,
    dataId = 11,
    probability = 5000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(277)->
    #dropCfg {
    dropId = 715,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(278)->
    #dropCfg {
    dropId = 715,
    dropType = 0,
    dataId = 222,
    probability = 5000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(279)->
    #dropCfg {
    dropId = 715,
    dropType = 0,
    dataId = 222,
    probability = 50,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(280)->
    #dropCfg {
    dropId = 715,
    dropType = 0,
    dataId = 2102,
    probability = 2500,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(281)->
    #dropCfg {
    dropId = 715,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(282)->
    #dropCfg {
    dropId = 715,
    dropType = 0,
    dataId = 2022,
    probability = 300,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(283)->
    #dropCfg {
    dropId = 716,
    dropType = 1,
    dataId = 11,
    probability = 5000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(284)->
    #dropCfg {
    dropId = 716,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(285)->
    #dropCfg {
    dropId = 716,
    dropType = 0,
    dataId = 222,
    probability = 5000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(286)->
    #dropCfg {
    dropId = 716,
    dropType = 0,
    dataId = 222,
    probability = 50,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(287)->
    #dropCfg {
    dropId = 716,
    dropType = 0,
    dataId = 2102,
    probability = 2500,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(288)->
    #dropCfg {
    dropId = 716,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(289)->
    #dropCfg {
    dropId = 716,
    dropType = 0,
    dataId = 2022,
    probability = 300,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(290)->
    #dropCfg {
    dropId = 717,
    dropType = 1,
    dataId = 11,
    probability = 5000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(291)->
    #dropCfg {
    dropId = 717,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(292)->
    #dropCfg {
    dropId = 717,
    dropType = 0,
    dataId = 222,
    probability = 5000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(293)->
    #dropCfg {
    dropId = 717,
    dropType = 0,
    dataId = 222,
    probability = 50,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(294)->
    #dropCfg {
    dropId = 717,
    dropType = 0,
    dataId = 2102,
    probability = 2500,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(295)->
    #dropCfg {
    dropId = 717,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(296)->
    #dropCfg {
    dropId = 717,
    dropType = 0,
    dataId = 2022,
    probability = 300,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(297)->
    #dropCfg {
    dropId = 718,
    dropType = 1,
    dataId = 11,
    probability = 5000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(298)->
    #dropCfg {
    dropId = 718,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(299)->
    #dropCfg {
    dropId = 718,
    dropType = 0,
    dataId = 222,
    probability = 5000,
    min = 1,
    max = 4,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(300)->
    #dropCfg {
    dropId = 718,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(301)->
    #dropCfg {
    dropId = 718,
    dropType = 0,
    dataId = 2102,
    probability = 2500,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(302)->
    #dropCfg {
    dropId = 718,
    dropType = 0,
    dataId = 222,
    probability = 100,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(303)->
    #dropCfg {
    dropId = 718,
    dropType = 0,
    dataId = 2022,
    probability = 300,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(304)->
    #dropCfg {
    dropId = 719,
    dropType = 1,
    dataId = 11,
    probability = 5000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(305)->
    #dropCfg {
    dropId = 719,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(306)->
    #dropCfg {
    dropId = 719,
    dropType = 0,
    dataId = 222,
    probability = 5000,
    min = 1,
    max = 4,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(307)->
    #dropCfg {
    dropId = 719,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(308)->
    #dropCfg {
    dropId = 719,
    dropType = 0,
    dataId = 2102,
    probability = 2500,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(309)->
    #dropCfg {
    dropId = 719,
    dropType = 0,
    dataId = 222,
    probability = 100,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(310)->
    #dropCfg {
    dropId = 719,
    dropType = 0,
    dataId = 2022,
    probability = 300,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(311)->
    #dropCfg {
    dropId = 720,
    dropType = 1,
    dataId = 11,
    probability = 5000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(312)->
    #dropCfg {
    dropId = 720,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(313)->
    #dropCfg {
    dropId = 720,
    dropType = 0,
    dataId = 222,
    probability = 5000,
    min = 1,
    max = 4,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(314)->
    #dropCfg {
    dropId = 720,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(315)->
    #dropCfg {
    dropId = 720,
    dropType = 0,
    dataId = 2102,
    probability = 2500,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(316)->
    #dropCfg {
    dropId = 720,
    dropType = 0,
    dataId = 222,
    probability = 100,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(317)->
    #dropCfg {
    dropId = 720,
    dropType = 0,
    dataId = 2022,
    probability = 300,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(318)->
    #dropCfg {
    dropId = 721,
    dropType = 1,
    dataId = 11,
    probability = 5000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(319)->
    #dropCfg {
    dropId = 721,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(320)->
    #dropCfg {
    dropId = 721,
    dropType = 0,
    dataId = 222,
    probability = 5000,
    min = 1,
    max = 4,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(321)->
    #dropCfg {
    dropId = 721,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(322)->
    #dropCfg {
    dropId = 721,
    dropType = 0,
    dataId = 2102,
    probability = 2500,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(323)->
    #dropCfg {
    dropId = 721,
    dropType = 0,
    dataId = 222,
    probability = 100,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(324)->
    #dropCfg {
    dropId = 721,
    dropType = 0,
    dataId = 2022,
    probability = 300,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(325)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1801,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(326)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1802,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(327)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1803,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(328)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1804,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(329)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1805,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(330)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1806,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(331)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1807,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(332)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1808,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(333)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1809,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(334)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1810,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(335)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1811,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(336)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1812,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(337)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1813,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(338)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1814,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(339)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1815,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(340)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1816,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(341)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1817,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(342)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1818,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(343)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1819,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(344)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1820,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(345)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1821,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(346)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1822,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(347)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1823,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(348)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1824,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(349)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1825,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(350)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1826,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(351)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1828,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(352)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1829,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(353)->
    #dropCfg {
    dropId = 801,
    dropType = 0,
    dataId = 1831,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(354)->
    #dropCfg {
    dropId = 802,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 99,
    max = 99,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(355)->
    #dropCfg {
    dropId = 803,
    dropType = 0,
    dataId = 200,
    probability = 10000,
    min = 99,
    max = 99,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(356)->
    #dropCfg {
    dropId = 804,
    dropType = 0,
    dataId = 11,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(357)->
    #dropCfg {
    dropId = 805,
    dropType = 0,
    dataId = 11,
    probability = 10000,
    min = 33,
    max = 33,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(358)->
    #dropCfg {
    dropId = 811,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(359)->
    #dropCfg {
    dropId = 812,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(360)->
    #dropCfg {
    dropId = 813,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(361)->
    #dropCfg {
    dropId = 814,
    dropType = 0,
    dataId = 11,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(362)->
    #dropCfg {
    dropId = 814,
    dropType = 0,
    dataId = 11,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(363)->
    #dropCfg {
    dropId = 814,
    dropType = 0,
    dataId = 11,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(364)->
    #dropCfg {
    dropId = 815,
    dropType = 0,
    dataId = 11,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(365)->
    #dropCfg {
    dropId = 815,
    dropType = 0,
    dataId = 11,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(366)->
    #dropCfg {
    dropId = 815,
    dropType = 0,
    dataId = 11,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(367)->
    #dropCfg {
    dropId = 815,
    dropType = 0,
    dataId = 11,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(368)->
    #dropCfg {
    dropId = 816,
    dropType = 0,
    dataId = 11,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(369)->
    #dropCfg {
    dropId = 816,
    dropType = 0,
    dataId = 11,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(370)->
    #dropCfg {
    dropId = 816,
    dropType = 0,
    dataId = 11,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(371)->
    #dropCfg {
    dropId = 850,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 99,
    max = 99,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(372)->
    #dropCfg {
    dropId = 851,
    dropType = 0,
    dataId = 21003,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(373)->
    #dropCfg {
    dropId = 851,
    dropType = 0,
    dataId = 21053,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(374)->
    #dropCfg {
    dropId = 851,
    dropType = 0,
    dataId = 21103,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(375)->
    #dropCfg {
    dropId = 852,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 99,
    max = 99,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(376)->
    #dropCfg {
    dropId = 852,
    dropType = 0,
    dataId = 21003,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(377)->
    #dropCfg {
    dropId = 852,
    dropType = 0,
    dataId = 21053,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(378)->
    #dropCfg {
    dropId = 852,
    dropType = 0,
    dataId = 21103,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(379)->
    #dropCfg {
    dropId = 853,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 199,
    max = 199,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(380)->
    #dropCfg {
    dropId = 853,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 99,
    max = 99,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(381)->
    #dropCfg {
    dropId = 853,
    dropType = 0,
    dataId = 21003,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(382)->
    #dropCfg {
    dropId = 853,
    dropType = 0,
    dataId = 21053,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(383)->
    #dropCfg {
    dropId = 853,
    dropType = 0,
    dataId = 21103,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(384)->
    #dropCfg {
    dropId = 854,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 99,
    max = 99,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(385)->
    #dropCfg {
    dropId = 854,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 99,
    max = 99,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(386)->
    #dropCfg {
    dropId = 854,
    dropType = 0,
    dataId = 21004,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(387)->
    #dropCfg {
    dropId = 854,
    dropType = 0,
    dataId = 21054,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(388)->
    #dropCfg {
    dropId = 854,
    dropType = 0,
    dataId = 21104,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(389)->
    #dropCfg {
    dropId = 855,
    dropType = 0,
    dataId = 3019,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(390)->
    #dropCfg {
    dropId = 855,
    dropType = 0,
    dataId = 3020,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(391)->
    #dropCfg {
    dropId = 855,
    dropType = 0,
    dataId = 3021,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(392)->
    #dropCfg {
    dropId = 855,
    dropType = 0,
    dataId = 6000,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(393)->
    #dropCfg {
    dropId = 855,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(394)->
    #dropCfg {
    dropId = 855,
    dropType = 0,
    dataId = 2102,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(395)->
    #dropCfg {
    dropId = 855,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(396)->
    #dropCfg {
    dropId = 855,
    dropType = 0,
    dataId = 1115,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(397)->
    #dropCfg {
    dropId = 856,
    dropType = 0,
    dataId = 3016,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(398)->
    #dropCfg {
    dropId = 856,
    dropType = 0,
    dataId = 3017,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(399)->
    #dropCfg {
    dropId = 856,
    dropType = 0,
    dataId = 3018,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(400)->
    #dropCfg {
    dropId = 856,
    dropType = 0,
    dataId = 6114,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(401)->
    #dropCfg {
    dropId = 856,
    dropType = 0,
    dataId = 6000,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(402)->
    #dropCfg {
    dropId = 856,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(403)->
    #dropCfg {
    dropId = 856,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(404)->
    #dropCfg {
    dropId = 856,
    dropType = 0,
    dataId = 2104,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(405)->
    #dropCfg {
    dropId = 856,
    dropType = 0,
    dataId = 1115,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(406)->
    #dropCfg {
    dropId = 857,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(407)->
    #dropCfg {
    dropId = 858,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(408)->
    #dropCfg {
    dropId = 859,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(409)->
    #dropCfg {
    dropId = 901,
    dropType = 0,
    dataId = 620,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(410)->
    #dropCfg {
    dropId = 901,
    dropType = 0,
    dataId = 620,
    probability = 8000,
    min = 1,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(411)->
    #dropCfg {
    dropId = 902,
    dropType = 0,
    dataId = 304,
    probability = 8000,
    min = 1,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(412)->
    #dropCfg {
    dropId = 903,
    dropType = 0,
    dataId = 900,
    probability = 2000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(413)->
    #dropCfg {
    dropId = 903,
    dropType = 0,
    dataId = 901,
    probability = 500,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(414)->
    #dropCfg {
    dropId = 903,
    dropType = 1,
    dataId = 11,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(415)->
    #dropCfg {
    dropId = 904,
    dropType = 0,
    dataId = 900,
    probability = 2000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(416)->
    #dropCfg {
    dropId = 904,
    dropType = 0,
    dataId = 901,
    probability = 500,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(417)->
    #dropCfg {
    dropId = 904,
    dropType = 1,
    dataId = 11,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(418)->
    #dropCfg {
    dropId = 904,
    dropType = 0,
    dataId = 222,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(419)->
    #dropCfg {
    dropId = 904,
    dropType = 0,
    dataId = 223,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(420)->
    #dropCfg {
    dropId = 904,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(421)->
    #dropCfg {
    dropId = 904,
    dropType = 1,
    dataId = 110,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(422)->
    #dropCfg {
    dropId = 910,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(423)->
    #dropCfg {
    dropId = 910,
    dropType = 0,
    dataId = 614,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(424)->
    #dropCfg {
    dropId = 911,
    dropType = 0,
    dataId = 615,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(425)->
    #dropCfg {
    dropId = 911,
    dropType = 0,
    dataId = 615,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(426)->
    #dropCfg {
    dropId = 912,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(427)->
    #dropCfg {
    dropId = 912,
    dropType = 0,
    dataId = 616,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(428)->
    #dropCfg {
    dropId = 913,
    dropType = 0,
    dataId = 615,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(429)->
    #dropCfg {
    dropId = 913,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(430)->
    #dropCfg {
    dropId = 913,
    dropType = 0,
    dataId = 615,
    probability = 5000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(431)->
    #dropCfg {
    dropId = 913,
    dropType = 0,
    dataId = 616,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(432)->
    #dropCfg {
    dropId = 914,
    dropType = 1,
    dataId = 11,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(433)->
    #dropCfg {
    dropId = 914,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(434)->
    #dropCfg {
    dropId = 915,
    dropType = 1,
    dataId = 11,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(435)->
    #dropCfg {
    dropId = 915,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(436)->
    #dropCfg {
    dropId = 915,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 3,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(437)->
    #dropCfg {
    dropId = 915,
    dropType = 0,
    dataId = 223,
    probability = 10000,
    min = 3,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(438)->
    #dropCfg {
    dropId = 915,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 3,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(439)->
    #dropCfg {
    dropId = 915,
    dropType = 1,
    dataId = 110,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(440)->
    #dropCfg {
    dropId = 916,
    dropType = 0,
    dataId = 300,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(441)->
    #dropCfg {
    dropId = 917,
    dropType = 0,
    dataId = 301,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(442)->
    #dropCfg {
    dropId = 918,
    dropType = 0,
    dataId = 302,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(443)->
    #dropCfg {
    dropId = 919,
    dropType = 0,
    dataId = 303,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(444)->
    #dropCfg {
    dropId = 920,
    dropType = 0,
    dataId = 303,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(445)->
    #dropCfg {
    dropId = 921,
    dropType = 0,
    dataId = 303,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(446)->
    #dropCfg {
    dropId = 922,
    dropType = 0,
    dataId = 303,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(447)->
    #dropCfg {
    dropId = 923,
    dropType = 0,
    dataId = 303,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(448)->
    #dropCfg {
    dropId = 991,
    dropType = 0,
    dataId = 31027,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(449)->
    #dropCfg {
    dropId = 991,
    dropType = 0,
    dataId = 31075,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(450)->
    #dropCfg {
    dropId = 991,
    dropType = 0,
    dataId = 31123,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(451)->
    #dropCfg {
    dropId = 991,
    dropType = 0,
    dataId = 32028,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(452)->
    #dropCfg {
    dropId = 991,
    dropType = 0,
    dataId = 32076,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(453)->
    #dropCfg {
    dropId = 991,
    dropType = 0,
    dataId = 32124,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(454)->
    #dropCfg {
    dropId = 991,
    dropType = 0,
    dataId = 33028,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(455)->
    #dropCfg {
    dropId = 991,
    dropType = 0,
    dataId = 33076,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(456)->
    #dropCfg {
    dropId = 991,
    dropType = 0,
    dataId = 33124,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(457)->
    #dropCfg {
    dropId = 991,
    dropType = 0,
    dataId = 34028,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(458)->
    #dropCfg {
    dropId = 991,
    dropType = 0,
    dataId = 34076,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(459)->
    #dropCfg {
    dropId = 991,
    dropType = 0,
    dataId = 34124,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(460)->
    #dropCfg {
    dropId = 991,
    dropType = 0,
    dataId = 35028,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(461)->
    #dropCfg {
    dropId = 991,
    dropType = 0,
    dataId = 35076,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(462)->
    #dropCfg {
    dropId = 991,
    dropType = 0,
    dataId = 35124,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(463)->
    #dropCfg {
    dropId = 991,
    dropType = 0,
    dataId = 36028,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(464)->
    #dropCfg {
    dropId = 991,
    dropType = 0,
    dataId = 36076,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(465)->
    #dropCfg {
    dropId = 991,
    dropType = 0,
    dataId = 36124,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(466)->
    #dropCfg {
    dropId = 991,
    dropType = 0,
    dataId = 37028,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(467)->
    #dropCfg {
    dropId = 991,
    dropType = 0,
    dataId = 37076,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(468)->
    #dropCfg {
    dropId = 991,
    dropType = 0,
    dataId = 37124,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(469)->
    #dropCfg {
    dropId = 991,
    dropType = 0,
    dataId = 38028,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(470)->
    #dropCfg {
    dropId = 991,
    dropType = 0,
    dataId = 38076,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(471)->
    #dropCfg {
    dropId = 991,
    dropType = 0,
    dataId = 38124,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(472)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 31028,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(473)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 31076,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(474)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 31124,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(475)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 32029,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(476)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 32077,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(477)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 32125,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(478)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 33029,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(479)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 33077,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(480)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 33125,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(481)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 34029,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(482)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 34077,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(483)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 34125,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(484)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 35029,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(485)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 35077,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(486)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 35125,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(487)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 36029,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(488)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 36077,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(489)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 36125,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(490)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 37029,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(491)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 37077,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(492)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 37125,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(493)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 38029,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(494)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 38077,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(495)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 38125,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(496)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 612,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(497)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 613,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(498)->
    #dropCfg {
    dropId = 992,
    dropType = 0,
    dataId = 4200,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(499)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 31029,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(500)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 31077,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(501)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 31125,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(502)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 32030,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(503)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 32078,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(504)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 32126,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(505)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 33030,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(506)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 33078,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(507)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 33126,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(508)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 34030,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(509)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 34078,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(510)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 34126,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(511)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 35030,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(512)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 35078,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(513)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 35126,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(514)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 36030,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(515)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 36078,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(516)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 36126,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(517)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 37030,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(518)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 37078,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(519)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 37126,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(520)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 38030,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(521)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 38078,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(522)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 38126,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(523)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 612,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(524)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 613,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(525)->
    #dropCfg {
    dropId = 993,
    dropType = 0,
    dataId = 4200,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(526)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 31030,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(527)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 31078,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(528)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 31126,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(529)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 32031,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(530)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 32079,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(531)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 32127,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(532)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 33031,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(533)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 33079,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(534)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 33127,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(535)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 34031,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(536)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 34079,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(537)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 34127,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(538)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 35031,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(539)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 35079,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(540)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 35127,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(541)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 36031,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(542)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 36079,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(543)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 36127,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(544)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 37031,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(545)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 37079,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(546)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 37127,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(547)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 38031,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(548)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 38079,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(549)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 38127,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(550)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 612,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(551)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 613,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(552)->
    #dropCfg {
    dropId = 994,
    dropType = 0,
    dataId = 4200,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(553)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 31031,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(554)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 31079,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(555)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 31127,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(556)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 32032,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(557)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 32080,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(558)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 32128,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(559)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 33032,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(560)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 33080,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(561)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 33128,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(562)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 34032,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(563)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 34080,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(564)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 34128,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(565)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 35032,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(566)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 35080,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(567)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 35128,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(568)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 36032,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(569)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 36080,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(570)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 36128,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(571)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 37032,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(572)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 37080,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(573)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 37128,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(574)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 38032,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(575)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 38080,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(576)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 38128,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(577)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 612,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(578)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 613,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(579)->
    #dropCfg {
    dropId = 995,
    dropType = 0,
    dataId = 4200,
    probability = 333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(580)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 301,
    probability = 10000,
    min = 9,
    max = 9,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(581)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 9,
    max = 9,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(582)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 103,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(583)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 903,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(584)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(585)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 901,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(586)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(587)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 903,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(588)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 904,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(589)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(590)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 901,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(591)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(592)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 903,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(593)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 904,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(594)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 905,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(595)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 1001,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(596)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 1002,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(597)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 1003,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(598)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 1004,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(599)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 1005,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(600)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 1006,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(601)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 1007,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(602)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 1008,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(603)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 1009,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(604)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 1010,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(605)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 1011,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(606)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 21001,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(607)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 11,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(608)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 11,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(609)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 210,
    probability = 10000,
    min = 33,
    max = 33,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(610)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 211,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(611)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(612)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 210,
    probability = 10000,
    min = 99,
    max = 99,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(613)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 211,
    probability = 10000,
    min = 9,
    max = 9,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(614)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(615)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 220,
    probability = 10000,
    min = 99,
    max = 99,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(616)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 221,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(617)->
    #dropCfg {
    dropId = 999,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(618)->
    #dropCfg {
    dropId = 1001,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(619)->
    #dropCfg {
    dropId = 1001,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(620)->
    #dropCfg {
    dropId = 1001,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 1,
    max = 4,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(621)->
    #dropCfg {
    dropId = 1001,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 5,
    max = 10,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(622)->
    #dropCfg {
    dropId = 1001,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(623)->
    #dropCfg {
    dropId = 1001,
    dropType = 0,
    dataId = 7000,
    probability = 6000,
    min = 2,
    max = 10,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(624)->
    #dropCfg {
    dropId = 1001,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(625)->
    #dropCfg {
    dropId = 1001,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(626)->
    #dropCfg {
    dropId = 1001,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(627)->
    #dropCfg {
    dropId = 1001,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 3200
    };
getRow(628)->
    #dropCfg {
    dropId = 1002,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(629)->
    #dropCfg {
    dropId = 1002,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(630)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 1,
    max = 4,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(631)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 5,
    max = 10,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(632)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(633)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 7000,
    probability = 6000,
    min = 2,
    max = 10,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(634)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(635)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(636)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(637)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 4400,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4400
    };
getRow(638)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 4410,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4410
    };
getRow(639)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 4420,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4420
    };
getRow(640)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 4430,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4430
    };
getRow(641)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 4440,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4440
    };
getRow(642)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 3200
    };
getRow(643)->
    #dropCfg {
    dropId = 1003,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(644)->
    #dropCfg {
    dropId = 1003,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(645)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 1,
    max = 4,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(646)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 5,
    max = 10,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(647)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(648)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 7001,
    probability = 2500,
    min = 2,
    max = 10,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(649)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(650)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(651)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(652)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 4400,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4400
    };
getRow(653)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 4410,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4410
    };
getRow(654)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 4420,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4420
    };
getRow(655)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 4430,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4430
    };
getRow(656)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 4440,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4440
    };
getRow(657)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 3200
    };
getRow(658)->
    #dropCfg {
    dropId = 1004,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(659)->
    #dropCfg {
    dropId = 1004,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(660)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 1,
    max = 4,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(661)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 5,
    max = 10,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(662)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(663)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 7001,
    probability = 5000,
    min = 2,
    max = 10,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(664)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(665)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(666)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(667)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 4400,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4400
    };
getRow(668)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 4410,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4410
    };
getRow(669)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 4420,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4420
    };
getRow(670)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 4430,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4430
    };
getRow(671)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 4440,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4440
    };
getRow(672)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 3200
    };
getRow(673)->
    #dropCfg {
    dropId = 1005,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(674)->
    #dropCfg {
    dropId = 1005,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(675)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 1,
    max = 4,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(676)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 5,
    max = 10,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(677)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(678)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 7001,
    probability = 5000,
    min = 2,
    max = 10,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(679)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(680)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(681)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(682)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 4400,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4400
    };
getRow(683)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 4410,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4410
    };
getRow(684)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 4420,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4420
    };
getRow(685)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 4430,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4430
    };
getRow(686)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 4440,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4440
    };
getRow(687)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 3200
    };
getRow(688)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    min = 1,
    max = 10,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(689)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 1112,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(690)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 7005,
    probability = 2500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(691)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(692)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(693)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 5,
    max = 15,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(694)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(695)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(696)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 4401,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4401
    };
getRow(697)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 4411,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4411
    };
getRow(698)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 4421,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4421
    };
getRow(699)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 4431,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4431
    };
getRow(700)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 4441,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4441
    };
getRow(701)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 3200,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 3200
    };
getRow(702)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    min = 1,
    max = 10,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(703)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 1112,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(704)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 7007,
    probability = 2500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(705)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(706)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(707)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 5,
    max = 15,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(708)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(709)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(710)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 4401,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4401
    };
getRow(711)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 4411,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4411
    };
getRow(712)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 4421,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4421
    };
getRow(713)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 4431,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4431
    };
getRow(714)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 4441,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4441
    };
getRow(715)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 3200
    };
getRow(716)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 7002,
    probability = 7000,
    min = 1,
    max = 10,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(717)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 1112,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(718)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 7009,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(719)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(720)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(721)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 5,
    max = 15,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(722)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(723)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(724)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 4401,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4401
    };
getRow(725)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 4411,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4411
    };
getRow(726)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 4421,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4421
    };
getRow(727)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 4431,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4431
    };
getRow(728)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 4441,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4441
    };
getRow(729)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 3200
    };
getRow(730)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 7002,
    probability = 7000,
    min = 1,
    max = 10,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(731)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 1112,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(732)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 7009,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(733)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(734)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(735)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 5,
    max = 15,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(736)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(737)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(738)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 4401,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4401
    };
getRow(739)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 4411,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4411
    };
getRow(740)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 4421,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4421
    };
getRow(741)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 4431,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4431
    };
getRow(742)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 4441,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4441
    };
getRow(743)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 3200
    };
getRow(744)->
    #dropCfg {
    dropId = 1010,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(745)->
    #dropCfg {
    dropId = 1010,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(746)->
    #dropCfg {
    dropId = 1010,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 1,
    max = 4,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(747)->
    #dropCfg {
    dropId = 1010,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 5,
    max = 10,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(748)->
    #dropCfg {
    dropId = 1010,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(749)->
    #dropCfg {
    dropId = 1010,
    dropType = 0,
    dataId = 7004,
    probability = 8000,
    min = 6,
    max = 15,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(750)->
    #dropCfg {
    dropId = 1010,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(751)->
    #dropCfg {
    dropId = 1011,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(752)->
    #dropCfg {
    dropId = 1011,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(753)->
    #dropCfg {
    dropId = 1011,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 1,
    max = 4,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(754)->
    #dropCfg {
    dropId = 1011,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 5,
    max = 10,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(755)->
    #dropCfg {
    dropId = 1011,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(756)->
    #dropCfg {
    dropId = 1011,
    dropType = 0,
    dataId = 7004,
    probability = 8000,
    min = 6,
    max = 15,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(757)->
    #dropCfg {
    dropId = 1011,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(758)->
    #dropCfg {
    dropId = 1012,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(759)->
    #dropCfg {
    dropId = 1012,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(760)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 1,
    max = 4,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(761)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 5,
    max = 10,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(762)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(763)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 7021,
    probability = 5000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(764)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(765)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(766)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(767)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 4400,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4400
    };
getRow(768)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 4410,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4410
    };
getRow(769)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 4420,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4420
    };
getRow(770)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 4430,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4430
    };
getRow(771)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 4440,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4440
    };
getRow(772)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 3200
    };
getRow(773)->
    #dropCfg {
    dropId = 1013,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(774)->
    #dropCfg {
    dropId = 1013,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(775)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 1,
    max = 4,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(776)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 5,
    max = 10,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(777)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(778)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 7021,
    probability = 5000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(779)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(780)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(781)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(782)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 4400,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4400
    };
getRow(783)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 4410,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4410
    };
getRow(784)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 4420,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4420
    };
getRow(785)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 4430,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4430
    };
getRow(786)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 4440,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4440
    };
getRow(787)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 3200
    };
getRow(788)->
    #dropCfg {
    dropId = 1014,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(789)->
    #dropCfg {
    dropId = 1014,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(790)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 1,
    max = 4,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(791)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 5,
    max = 10,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(792)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(793)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 7023,
    probability = 5000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(794)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(795)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(796)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(797)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 4400,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4400
    };
getRow(798)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 4410,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4410
    };
getRow(799)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 4420,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4420
    };
getRow(800)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 4430,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4430
    };
getRow(801)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 4440,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4440
    };
getRow(802)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 3200
    };
getRow(803)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 7022,
    probability = 7000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(804)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 1112,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(805)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 7022,
    probability = 2500,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(806)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(807)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(808)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 20,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(809)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(810)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(811)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 4401,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4401
    };
getRow(812)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 4411,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4411
    };
getRow(813)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 4421,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4421
    };
getRow(814)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 4431,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4431
    };
getRow(815)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 4441,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4441
    };
getRow(816)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 3200
    };
getRow(817)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 7022,
    probability = 7000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(818)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 1112,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(819)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 7022,
    probability = 2500,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(820)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(821)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(822)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 20,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(823)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(824)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(825)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 4401,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4401
    };
getRow(826)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 4411,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4411
    };
getRow(827)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 4421,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4421
    };
getRow(828)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 4431,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4431
    };
getRow(829)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 4441,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4441
    };
getRow(830)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 3200
    };
getRow(831)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 7024,
    probability = 7000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(832)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 1112,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(833)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 7024,
    probability = 5000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(834)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(835)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(836)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 20,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(837)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(838)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(839)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 7025,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(840)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 7026,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(841)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 4401,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4401
    };
getRow(842)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 4411,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4411
    };
getRow(843)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 4421,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4421
    };
getRow(844)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 4431,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4431
    };
getRow(845)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 4441,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4441
    };
getRow(846)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 3200
    };
getRow(847)->
    #dropCfg {
    dropId = 1020,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(848)->
    #dropCfg {
    dropId = 1020,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(849)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 5,
    max = 10,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(850)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 5,
    max = 10,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(851)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(852)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 7026,
    probability = 5000,
    min = 2,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(853)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(854)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(855)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(856)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 4400,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4400
    };
getRow(857)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 4410,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4410
    };
getRow(858)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 4420,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4420
    };
getRow(859)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 4430,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4430
    };
getRow(860)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 4440,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4440
    };
getRow(861)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 3200
    };
getRow(862)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 3200
    };
getRow(863)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 7026,
    probability = 7000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(864)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 1112,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(865)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 7027,
    probability = 5000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(866)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(867)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(868)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 15,
    max = 25,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(869)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(870)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(871)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 7028,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(872)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 4401,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4400
    };
getRow(873)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 4411,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4410
    };
getRow(874)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 4421,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4420
    };
getRow(875)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 4431,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4430
    };
getRow(876)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 4441,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 4440
    };
getRow(877)->
    #dropCfg {
    dropId = 1101,
    dropType = 1,
    dataId = 50,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(878)->
    #dropCfg {
    dropId = 1102,
    dropType = 1,
    dataId = 51,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(879)->
    #dropCfg {
    dropId = 1103,
    dropType = 1,
    dataId = 52,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(880)->
    #dropCfg {
    dropId = 1104,
    dropType = 1,
    dataId = 53,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(881)->
    #dropCfg {
    dropId = 1105,
    dropType = 1,
    dataId = 54,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(882)->
    #dropCfg {
    dropId = 1111,
    dropType = 0,
    dataId = 3996,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(883)->
    #dropCfg {
    dropId = 1111,
    dropType = 0,
    dataId = 3996,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(884)->
    #dropCfg {
    dropId = 1112,
    dropType = 0,
    dataId = 3996,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(885)->
    #dropCfg {
    dropId = 1112,
    dropType = 0,
    dataId = 3999,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(886)->
    #dropCfg {
    dropId = 1120,
    dropType = 1,
    dataId = 60,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(887)->
    #dropCfg {
    dropId = 1120,
    dropType = 0,
    dataId = 15006,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(888)->
    #dropCfg {
    dropId = 1120,
    dropType = 0,
    dataId = 2022,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(889)->
    #dropCfg {
    dropId = 1120,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(890)->
    #dropCfg {
    dropId = 1121,
    dropType = 1,
    dataId = 61,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(891)->
    #dropCfg {
    dropId = 1122,
    dropType = 1,
    dataId = 62,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(892)->
    #dropCfg {
    dropId = 1123,
    dropType = 1,
    dataId = 63,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(893)->
    #dropCfg {
    dropId = 1123,
    dropType = 0,
    dataId = 15006,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(894)->
    #dropCfg {
    dropId = 1123,
    dropType = 0,
    dataId = 2022,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(895)->
    #dropCfg {
    dropId = 1123,
    dropType = 0,
    dataId = 903,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(896)->
    #dropCfg {
    dropId = 1200,
    dropType = 1,
    dataId = 101,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(897)->
    #dropCfg {
    dropId = 1201,
    dropType = 1,
    dataId = 111,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(898)->
    #dropCfg {
    dropId = 1210,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(899)->
    #dropCfg {
    dropId = 1210,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(900)->
    #dropCfg {
    dropId = 1210,
    dropType = 0,
    dataId = 4303,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(901)->
    #dropCfg {
    dropId = 1210,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(902)->
    #dropCfg {
    dropId = 1210,
    dropType = 0,
    dataId = 903,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(903)->
    #dropCfg {
    dropId = 1211,
    dropType = 0,
    dataId = 603,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(904)->
    #dropCfg {
    dropId = 1211,
    dropType = 0,
    dataId = 1133,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(905)->
    #dropCfg {
    dropId = 1211,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(906)->
    #dropCfg {
    dropId = 1211,
    dropType = 0,
    dataId = 4303,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(907)->
    #dropCfg {
    dropId = 1211,
    dropType = 0,
    dataId = 903,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(908)->
    #dropCfg {
    dropId = 1220,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(909)->
    #dropCfg {
    dropId = 1220,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(910)->
    #dropCfg {
    dropId = 1220,
    dropType = 0,
    dataId = 1133,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(911)->
    #dropCfg {
    dropId = 1221,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(912)->
    #dropCfg {
    dropId = 1221,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(913)->
    #dropCfg {
    dropId = 1221,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(914)->
    #dropCfg {
    dropId = 1222,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(915)->
    #dropCfg {
    dropId = 1222,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(916)->
    #dropCfg {
    dropId = 1222,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(917)->
    #dropCfg {
    dropId = 1225,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 150,
    max = 150,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(918)->
    #dropCfg {
    dropId = 1225,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(919)->
    #dropCfg {
    dropId = 1225,
    dropType = 0,
    dataId = 3220,
    probability = 10000,
    min = 9,
    max = 9,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(920)->
    #dropCfg {
    dropId = 1225,
    dropType = 0,
    dataId = 3221,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(921)->
    #dropCfg {
    dropId = 1225,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(922)->
    #dropCfg {
    dropId = 1226,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 75,
    max = 75,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(923)->
    #dropCfg {
    dropId = 1226,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(924)->
    #dropCfg {
    dropId = 1226,
    dropType = 0,
    dataId = 3220,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(925)->
    #dropCfg {
    dropId = 1226,
    dropType = 0,
    dataId = 3221,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(926)->
    #dropCfg {
    dropId = 1226,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(927)->
    #dropCfg {
    dropId = 1227,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(928)->
    #dropCfg {
    dropId = 1227,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(929)->
    #dropCfg {
    dropId = 1227,
    dropType = 0,
    dataId = 3220,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(930)->
    #dropCfg {
    dropId = 1227,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(931)->
    #dropCfg {
    dropId = 1230,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(932)->
    #dropCfg {
    dropId = 1230,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(933)->
    #dropCfg {
    dropId = 1230,
    dropType = 0,
    dataId = 3220,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(934)->
    #dropCfg {
    dropId = 1230,
    dropType = 0,
    dataId = 3221,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(935)->
    #dropCfg {
    dropId = 1230,
    dropType = 0,
    dataId = 7024,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(936)->
    #dropCfg {
    dropId = 1230,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(937)->
    #dropCfg {
    dropId = 1231,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(938)->
    #dropCfg {
    dropId = 1231,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(939)->
    #dropCfg {
    dropId = 1231,
    dropType = 0,
    dataId = 3220,
    probability = 10000,
    min = 9,
    max = 9,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(940)->
    #dropCfg {
    dropId = 1231,
    dropType = 0,
    dataId = 3221,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(941)->
    #dropCfg {
    dropId = 1231,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(942)->
    #dropCfg {
    dropId = 1231,
    dropType = 0,
    dataId = 7023,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(943)->
    #dropCfg {
    dropId = 1232,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(944)->
    #dropCfg {
    dropId = 1232,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(945)->
    #dropCfg {
    dropId = 1232,
    dropType = 0,
    dataId = 3220,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(946)->
    #dropCfg {
    dropId = 1232,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(947)->
    #dropCfg {
    dropId = 1240,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 80,
    max = 80,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(948)->
    #dropCfg {
    dropId = 1240,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(949)->
    #dropCfg {
    dropId = 1240,
    dropType = 0,
    dataId = 3220,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(950)->
    #dropCfg {
    dropId = 1240,
    dropType = 0,
    dataId = 3221,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(951)->
    #dropCfg {
    dropId = 1240,
    dropType = 0,
    dataId = 7027,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(952)->
    #dropCfg {
    dropId = 1240,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 80,
    max = 80,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(953)->
    #dropCfg {
    dropId = 1241,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(954)->
    #dropCfg {
    dropId = 1241,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(955)->
    #dropCfg {
    dropId = 1241,
    dropType = 0,
    dataId = 3220,
    probability = 10000,
    min = 12,
    max = 12,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(956)->
    #dropCfg {
    dropId = 1241,
    dropType = 0,
    dataId = 3221,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(957)->
    #dropCfg {
    dropId = 1241,
    dropType = 0,
    dataId = 7026,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(958)->
    #dropCfg {
    dropId = 1241,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(959)->
    #dropCfg {
    dropId = 1242,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(960)->
    #dropCfg {
    dropId = 1242,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(961)->
    #dropCfg {
    dropId = 1242,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(962)->
    #dropCfg {
    dropId = 1242,
    dropType = 0,
    dataId = 3220,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(963)->
    #dropCfg {
    dropId = 1299,
    dropType = 0,
    dataId = 903,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(964)->
    #dropCfg {
    dropId = 1299,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(965)->
    #dropCfg {
    dropId = 1299,
    dropType = 0,
    dataId = 2102,
    probability = 1000,
    min = 4,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(966)->
    #dropCfg {
    dropId = 1299,
    dropType = 0,
    dataId = 1911,
    probability = 500,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(967)->
    #dropCfg {
    dropId = 1299,
    dropType = 0,
    dataId = 1921,
    probability = 500,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(968)->
    #dropCfg {
    dropId = 1300,
    dropType = 0,
    dataId = 903,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(969)->
    #dropCfg {
    dropId = 1300,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(970)->
    #dropCfg {
    dropId = 1300,
    dropType = 0,
    dataId = 2102,
    probability = 1000,
    min = 4,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(971)->
    #dropCfg {
    dropId = 1300,
    dropType = 0,
    dataId = 1911,
    probability = 500,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(972)->
    #dropCfg {
    dropId = 1300,
    dropType = 0,
    dataId = 1921,
    probability = 500,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(973)->
    #dropCfg {
    dropId = 1300,
    dropType = 0,
    dataId = 3220,
    probability = 10000,
    min = 3,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(974)->
    #dropCfg {
    dropId = 1301,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(975)->
    #dropCfg {
    dropId = 1301,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(976)->
    #dropCfg {
    dropId = 1301,
    dropType = 0,
    dataId = 2104,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(977)->
    #dropCfg {
    dropId = 1302,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(978)->
    #dropCfg {
    dropId = 1302,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(979)->
    #dropCfg {
    dropId = 1302,
    dropType = 0,
    dataId = 2104,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(980)->
    #dropCfg {
    dropId = 1303,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(981)->
    #dropCfg {
    dropId = 1303,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(982)->
    #dropCfg {
    dropId = 1303,
    dropType = 0,
    dataId = 2104,
    probability = 4000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(983)->
    #dropCfg {
    dropId = 1303,
    dropType = 0,
    dataId = 1911,
    probability = 5000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(984)->
    #dropCfg {
    dropId = 1304,
    dropType = 0,
    dataId = 903,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(985)->
    #dropCfg {
    dropId = 1304,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(986)->
    #dropCfg {
    dropId = 1304,
    dropType = 0,
    dataId = 2104,
    probability = 6000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(987)->
    #dropCfg {
    dropId = 1304,
    dropType = 0,
    dataId = 1921,
    probability = 5000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(988)->
    #dropCfg {
    dropId = 1305,
    dropType = 0,
    dataId = 903,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(989)->
    #dropCfg {
    dropId = 1305,
    dropType = 0,
    dataId = 1134,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(990)->
    #dropCfg {
    dropId = 1305,
    dropType = 0,
    dataId = 2104,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(991)->
    #dropCfg {
    dropId = 1305,
    dropType = 0,
    dataId = 1913,
    probability = 3000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(992)->
    #dropCfg {
    dropId = 1311,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(993)->
    #dropCfg {
    dropId = 1311,
    dropType = 0,
    dataId = 4200,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(994)->
    #dropCfg {
    dropId = 1311,
    dropType = 0,
    dataId = 1111,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(995)->
    #dropCfg {
    dropId = 1311,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(996)->
    #dropCfg {
    dropId = 1312,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(997)->
    #dropCfg {
    dropId = 1312,
    dropType = 0,
    dataId = 4200,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(998)->
    #dropCfg {
    dropId = 1312,
    dropType = 0,
    dataId = 1111,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(999)->
    #dropCfg {
    dropId = 1312,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1000)->
    #dropCfg {
    dropId = 1313,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1001)->
    #dropCfg {
    dropId = 1313,
    dropType = 0,
    dataId = 4200,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1002)->
    #dropCfg {
    dropId = 1313,
    dropType = 0,
    dataId = 1111,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1003)->
    #dropCfg {
    dropId = 1313,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1004)->
    #dropCfg {
    dropId = 1314,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1005)->
    #dropCfg {
    dropId = 1314,
    dropType = 0,
    dataId = 4200,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1006)->
    #dropCfg {
    dropId = 1314,
    dropType = 0,
    dataId = 1111,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1007)->
    #dropCfg {
    dropId = 1314,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1008)->
    #dropCfg {
    dropId = 1315,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1009)->
    #dropCfg {
    dropId = 1315,
    dropType = 0,
    dataId = 4200,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1010)->
    #dropCfg {
    dropId = 1315,
    dropType = 0,
    dataId = 1111,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1011)->
    #dropCfg {
    dropId = 1315,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1012)->
    #dropCfg {
    dropId = 1316,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1013)->
    #dropCfg {
    dropId = 1316,
    dropType = 0,
    dataId = 4200,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1014)->
    #dropCfg {
    dropId = 1316,
    dropType = 0,
    dataId = 1111,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1015)->
    #dropCfg {
    dropId = 1316,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1016)->
    #dropCfg {
    dropId = 1317,
    dropType = 0,
    dataId = 272,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1017)->
    #dropCfg {
    dropId = 1317,
    dropType = 0,
    dataId = 4200,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1018)->
    #dropCfg {
    dropId = 1317,
    dropType = 0,
    dataId = 4203,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1019)->
    #dropCfg {
    dropId = 1317,
    dropType = 0,
    dataId = 1111,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1020)->
    #dropCfg {
    dropId = 1317,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1021)->
    #dropCfg {
    dropId = 1318,
    dropType = 0,
    dataId = 272,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1022)->
    #dropCfg {
    dropId = 1318,
    dropType = 0,
    dataId = 4200,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1023)->
    #dropCfg {
    dropId = 1318,
    dropType = 0,
    dataId = 4203,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1024)->
    #dropCfg {
    dropId = 1318,
    dropType = 0,
    dataId = 1111,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1025)->
    #dropCfg {
    dropId = 1318,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1026)->
    #dropCfg {
    dropId = 1319,
    dropType = 0,
    dataId = 273,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1027)->
    #dropCfg {
    dropId = 1319,
    dropType = 0,
    dataId = 4200,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1028)->
    #dropCfg {
    dropId = 1319,
    dropType = 0,
    dataId = 4203,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1029)->
    #dropCfg {
    dropId = 1319,
    dropType = 0,
    dataId = 1111,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1030)->
    #dropCfg {
    dropId = 1319,
    dropType = 0,
    dataId = 617,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1031)->
    #dropCfg {
    dropId = 1320,
    dropType = 0,
    dataId = 273,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1032)->
    #dropCfg {
    dropId = 1320,
    dropType = 0,
    dataId = 4200,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1033)->
    #dropCfg {
    dropId = 1320,
    dropType = 0,
    dataId = 4203,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1034)->
    #dropCfg {
    dropId = 1320,
    dropType = 0,
    dataId = 1111,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1035)->
    #dropCfg {
    dropId = 1320,
    dropType = 0,
    dataId = 617,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1036)->
    #dropCfg {
    dropId = 1321,
    dropType = 0,
    dataId = 2102,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1037)->
    #dropCfg {
    dropId = 1321,
    dropType = 0,
    dataId = 2104,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1038)->
    #dropCfg {
    dropId = 1321,
    dropType = 0,
    dataId = 2105,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1039)->
    #dropCfg {
    dropId = 1322,
    dropType = 0,
    dataId = 4303,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1040)->
    #dropCfg {
    dropId = 1323,
    dropType = 0,
    dataId = 4303,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1041)->
    #dropCfg {
    dropId = 1324,
    dropType = 0,
    dataId = 4303,
    probability = 10000,
    min = 2,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1042)->
    #dropCfg {
    dropId = 1325,
    dropType = 0,
    dataId = 4303,
    probability = 10000,
    min = 2,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1043)->
    #dropCfg {
    dropId = 1326,
    dropType = 0,
    dataId = 4303,
    probability = 10000,
    min = 3,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1044)->
    #dropCfg {
    dropId = 1327,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    min = 3,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1045)->
    #dropCfg {
    dropId = 1328,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    min = 4,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1046)->
    #dropCfg {
    dropId = 1329,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    min = 4,
    max = 9,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1047)->
    #dropCfg {
    dropId = 1330,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    min = 5,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1048)->
    #dropCfg {
    dropId = 1330,
    dropType = 0,
    dataId = 273,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1049)->
    #dropCfg {
    dropId = 1330,
    dropType = 0,
    dataId = 4200,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1050)->
    #dropCfg {
    dropId = 1330,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 1,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1051)->
    #dropCfg {
    dropId = 1330,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 3200
    };
getRow(1052)->
    #dropCfg {
    dropId = 1331,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    min = 5,
    max = 11,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1053)->
    #dropCfg {
    dropId = 1332,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    min = 6,
    max = 12,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1054)->
    #dropCfg {
    dropId = 1333,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    min = 6,
    max = 13,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1055)->
    #dropCfg {
    dropId = 1334,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    min = 7,
    max = 14,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1056)->
    #dropCfg {
    dropId = 1335,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    min = 7,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1057)->
    #dropCfg {
    dropId = 1336,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    min = 8,
    max = 16,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1058)->
    #dropCfg {
    dropId = 1337,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    min = 8,
    max = 17,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1059)->
    #dropCfg {
    dropId = 1338,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    min = 9,
    max = 18,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1060)->
    #dropCfg {
    dropId = 1339,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    min = 9,
    max = 19,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1061)->
    #dropCfg {
    dropId = 1340,
    dropType = 0,
    dataId = 4305,
    probability = 10000,
    min = 10,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1062)->
    #dropCfg {
    dropId = 1341,
    dropType = 0,
    dataId = 4305,
    probability = 10000,
    min = 10,
    max = 21,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1063)->
    #dropCfg {
    dropId = 1342,
    dropType = 0,
    dataId = 4305,
    probability = 10000,
    min = 11,
    max = 22,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1064)->
    #dropCfg {
    dropId = 1343,
    dropType = 0,
    dataId = 4305,
    probability = 10000,
    min = 11,
    max = 23,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1065)->
    #dropCfg {
    dropId = 1344,
    dropType = 0,
    dataId = 4305,
    probability = 10000,
    min = 12,
    max = 24,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1066)->
    #dropCfg {
    dropId = 1345,
    dropType = 0,
    dataId = 4305,
    probability = 10000,
    min = 12,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1067)->
    #dropCfg {
    dropId = 1346,
    dropType = 0,
    dataId = 4305,
    probability = 10000,
    min = 13,
    max = 26,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1068)->
    #dropCfg {
    dropId = 1347,
    dropType = 0,
    dataId = 4305,
    probability = 10000,
    min = 13,
    max = 27,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1069)->
    #dropCfg {
    dropId = 1348,
    dropType = 0,
    dataId = 4305,
    probability = 10000,
    min = 14,
    max = 28,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1070)->
    #dropCfg {
    dropId = 1349,
    dropType = 0,
    dataId = 4305,
    probability = 10000,
    min = 14,
    max = 29,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1071)->
    #dropCfg {
    dropId = 1350,
    dropType = 0,
    dataId = 4305,
    probability = 10000,
    min = 15,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1072)->
    #dropCfg {
    dropId = 1351,
    dropType = 0,
    dataId = 4305,
    probability = 10000,
    min = 15,
    max = 31,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1073)->
    #dropCfg {
    dropId = 1351,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 33,
    max = 33,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1074)->
    #dropCfg {
    dropId = 1352,
    dropType = 0,
    dataId = 4305,
    probability = 10000,
    min = 16,
    max = 32,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1075)->
    #dropCfg {
    dropId = 1352,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 66,
    max = 66,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1076)->
    #dropCfg {
    dropId = 1353,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 99,
    max = 99,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1077)->
    #dropCfg {
    dropId = 1354,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1078)->
    #dropCfg {
    dropId = 1354,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1079)->
    #dropCfg {
    dropId = 1354,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1080)->
    #dropCfg {
    dropId = 1354,
    dropType = 0,
    dataId = 1111,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1081)->
    #dropCfg {
    dropId = 1354,
    dropType = 0,
    dataId = 2102,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1082)->
    #dropCfg {
    dropId = 1354,
    dropType = 0,
    dataId = 2200,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1083)->
    #dropCfg {
    dropId = 1355,
    dropType = 0,
    dataId = 903,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1084)->
    #dropCfg {
    dropId = 1355,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1085)->
    #dropCfg {
    dropId = 1355,
    dropType = 0,
    dataId = 301,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1086)->
    #dropCfg {
    dropId = 1355,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1087)->
    #dropCfg {
    dropId = 1355,
    dropType = 0,
    dataId = 711,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1088)->
    #dropCfg {
    dropId = 1355,
    dropType = 0,
    dataId = 721,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1089)->
    #dropCfg {
    dropId = 1355,
    dropType = 0,
    dataId = 731,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1090)->
    #dropCfg {
    dropId = 1356,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1091)->
    #dropCfg {
    dropId = 1356,
    dropType = 0,
    dataId = 301,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1092)->
    #dropCfg {
    dropId = 1356,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 28,
    max = 28,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1093)->
    #dropCfg {
    dropId = 1356,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 99,
    max = 99,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1094)->
    #dropCfg {
    dropId = 1357,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1095)->
    #dropCfg {
    dropId = 1357,
    dropType = 0,
    dataId = 301,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1096)->
    #dropCfg {
    dropId = 1357,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1097)->
    #dropCfg {
    dropId = 1357,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1098)->
    #dropCfg {
    dropId = 1358,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1099)->
    #dropCfg {
    dropId = 1358,
    dropType = 0,
    dataId = 301,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1100)->
    #dropCfg {
    dropId = 1358,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1101)->
    #dropCfg {
    dropId = 1358,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1102)->
    #dropCfg {
    dropId = 1359,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1103)->
    #dropCfg {
    dropId = 1359,
    dropType = 0,
    dataId = 301,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1104)->
    #dropCfg {
    dropId = 1359,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1105)->
    #dropCfg {
    dropId = 1359,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1106)->
    #dropCfg {
    dropId = 1360,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1107)->
    #dropCfg {
    dropId = 1360,
    dropType = 0,
    dataId = 2102,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1108)->
    #dropCfg {
    dropId = 1360,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1109)->
    #dropCfg {
    dropId = 1360,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1110)->
    #dropCfg {
    dropId = 1360,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1111)->
    #dropCfg {
    dropId = 1360,
    dropType = 0,
    dataId = 904,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1112)->
    #dropCfg {
    dropId = 1361,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 28,
    max = 28,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1113)->
    #dropCfg {
    dropId = 1361,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 28,
    max = 28,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1114)->
    #dropCfg {
    dropId = 1361,
    dropType = 0,
    dataId = 2102,
    probability = 10000,
    min = 28,
    max = 28,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1115)->
    #dropCfg {
    dropId = 1361,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 28,
    max = 28,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1116)->
    #dropCfg {
    dropId = 1362,
    dropType = 0,
    dataId = 4200,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1117)->
    #dropCfg {
    dropId = 1362,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1118)->
    #dropCfg {
    dropId = 1362,
    dropType = 0,
    dataId = 711,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1119)->
    #dropCfg {
    dropId = 1362,
    dropType = 0,
    dataId = 721,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1120)->
    #dropCfg {
    dropId = 1362,
    dropType = 0,
    dataId = 731,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1121)->
    #dropCfg {
    dropId = 1363,
    dropType = 0,
    dataId = 4201,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1122)->
    #dropCfg {
    dropId = 1363,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1123)->
    #dropCfg {
    dropId = 1363,
    dropType = 0,
    dataId = 711,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1124)->
    #dropCfg {
    dropId = 1363,
    dropType = 0,
    dataId = 721,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1125)->
    #dropCfg {
    dropId = 1363,
    dropType = 0,
    dataId = 731,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1126)->
    #dropCfg {
    dropId = 1364,
    dropType = 0,
    dataId = 4202,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1127)->
    #dropCfg {
    dropId = 1364,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1128)->
    #dropCfg {
    dropId = 1364,
    dropType = 0,
    dataId = 711,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1129)->
    #dropCfg {
    dropId = 1364,
    dropType = 0,
    dataId = 721,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1130)->
    #dropCfg {
    dropId = 1364,
    dropType = 0,
    dataId = 731,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1131)->
    #dropCfg {
    dropId = 1365,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1132)->
    #dropCfg {
    dropId = 1365,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1133)->
    #dropCfg {
    dropId = 1365,
    dropType = 0,
    dataId = 2102,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1134)->
    #dropCfg {
    dropId = 1366,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 18,
    max = 18,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1135)->
    #dropCfg {
    dropId = 1366,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 18,
    max = 18,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1136)->
    #dropCfg {
    dropId = 1366,
    dropType = 0,
    dataId = 2102,
    probability = 10000,
    min = 18,
    max = 18,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1137)->
    #dropCfg {
    dropId = 1367,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 28,
    max = 28,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1138)->
    #dropCfg {
    dropId = 1367,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 28,
    max = 28,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1139)->
    #dropCfg {
    dropId = 1367,
    dropType = 0,
    dataId = 2102,
    probability = 10000,
    min = 28,
    max = 28,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1140)->
    #dropCfg {
    dropId = 1368,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1141)->
    #dropCfg {
    dropId = 1368,
    dropType = 0,
    dataId = 901,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1142)->
    #dropCfg {
    dropId = 1368,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1143)->
    #dropCfg {
    dropId = 1368,
    dropType = 0,
    dataId = 903,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1144)->
    #dropCfg {
    dropId = 1368,
    dropType = 0,
    dataId = 904,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1145)->
    #dropCfg {
    dropId = 1369,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1146)->
    #dropCfg {
    dropId = 1369,
    dropType = 0,
    dataId = 901,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1147)->
    #dropCfg {
    dropId = 1369,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1148)->
    #dropCfg {
    dropId = 1369,
    dropType = 0,
    dataId = 903,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1149)->
    #dropCfg {
    dropId = 1369,
    dropType = 0,
    dataId = 904,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1150)->
    #dropCfg {
    dropId = 1369,
    dropType = 0,
    dataId = 905,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1151)->
    #dropCfg {
    dropId = 1370,
    dropType = 0,
    dataId = 905,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1152)->
    #dropCfg {
    dropId = 1370,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1153)->
    #dropCfg {
    dropId = 1370,
    dropType = 0,
    dataId = 2102,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1154)->
    #dropCfg {
    dropId = 1370,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1155)->
    #dropCfg {
    dropId = 1370,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1156)->
    #dropCfg {
    dropId = 1370,
    dropType = 0,
    dataId = 4202,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1157)->
    #dropCfg {
    dropId = 1370,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1158)->
    #dropCfg {
    dropId = 1370,
    dropType = 0,
    dataId = 711,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1159)->
    #dropCfg {
    dropId = 1370,
    dropType = 0,
    dataId = 721,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1160)->
    #dropCfg {
    dropId = 1370,
    dropType = 0,
    dataId = 731,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1161)->
    #dropCfg {
    dropId = 1371,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1162)->
    #dropCfg {
    dropId = 1371,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1163)->
    #dropCfg {
    dropId = 1371,
    dropType = 0,
    dataId = 223,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1164)->
    #dropCfg {
    dropId = 1371,
    dropType = 0,
    dataId = 4201,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1165)->
    #dropCfg {
    dropId = 1372,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1166)->
    #dropCfg {
    dropId = 1372,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 28,
    max = 28,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1167)->
    #dropCfg {
    dropId = 1372,
    dropType = 0,
    dataId = 223,
    probability = 10000,
    min = 28,
    max = 28,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1168)->
    #dropCfg {
    dropId = 1372,
    dropType = 0,
    dataId = 1111,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1169)->
    #dropCfg {
    dropId = 1372,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1170)->
    #dropCfg {
    dropId = 1372,
    dropType = 0,
    dataId = 711,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1171)->
    #dropCfg {
    dropId = 1372,
    dropType = 0,
    dataId = 721,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1172)->
    #dropCfg {
    dropId = 1372,
    dropType = 0,
    dataId = 731,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1173)->
    #dropCfg {
    dropId = 1373,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1174)->
    #dropCfg {
    dropId = 1373,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1175)->
    #dropCfg {
    dropId = 1373,
    dropType = 0,
    dataId = 301,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1176)->
    #dropCfg {
    dropId = 1374,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1177)->
    #dropCfg {
    dropId = 1374,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1178)->
    #dropCfg {
    dropId = 1374,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1179)->
    #dropCfg {
    dropId = 1375,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1180)->
    #dropCfg {
    dropId = 1375,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1181)->
    #dropCfg {
    dropId = 1375,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1182)->
    #dropCfg {
    dropId = 1375,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1183)->
    #dropCfg {
    dropId = 1376,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1184)->
    #dropCfg {
    dropId = 1376,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 99,
    max = 99,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1185)->
    #dropCfg {
    dropId = 1376,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1186)->
    #dropCfg {
    dropId = 1376,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1187)->
    #dropCfg {
    dropId = 1377,
    dropType = 0,
    dataId = 617,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1188)->
    #dropCfg {
    dropId = 1377,
    dropType = 0,
    dataId = 223,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1189)->
    #dropCfg {
    dropId = 1377,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1190)->
    #dropCfg {
    dropId = 1377,
    dropType = 0,
    dataId = 2150,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1191)->
    #dropCfg {
    dropId = 1378,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1192)->
    #dropCfg {
    dropId = 1379,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 60,
    max = 60,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1193)->
    #dropCfg {
    dropId = 1380,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1194)->
    #dropCfg {
    dropId = 1381,
    dropType = 0,
    dataId = 2150,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1195)->
    #dropCfg {
    dropId = 1382,
    dropType = 0,
    dataId = 2150,
    probability = 10000,
    min = 60,
    max = 60,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1196)->
    #dropCfg {
    dropId = 1383,
    dropType = 0,
    dataId = 2150,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1197)->
    #dropCfg {
    dropId = 1384,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1198)->
    #dropCfg {
    dropId = 1385,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 60,
    max = 60,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1199)->
    #dropCfg {
    dropId = 1386,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1200)->
    #dropCfg {
    dropId = 1387,
    dropType = 0,
    dataId = 1054,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1201)->
    #dropCfg {
    dropId = 1388,
    dropType = 0,
    dataId = 1057,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1202)->
    #dropCfg {
    dropId = 1389,
    dropType = 0,
    dataId = 1059,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1203)->
    #dropCfg {
    dropId = 1401,
    dropType = 1,
    dataId = 11,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1204)->
    #dropCfg {
    dropId = 1401,
    dropType = 0,
    dataId = 222,
    probability = 5000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1205)->
    #dropCfg {
    dropId = 1401,
    dropType = 0,
    dataId = 2102,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1206)->
    #dropCfg {
    dropId = 1401,
    dropType = 0,
    dataId = 2022,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1207)->
    #dropCfg {
    dropId = 1401,
    dropType = 0,
    dataId = 300,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1208)->
    #dropCfg {
    dropId = 1402,
    dropType = 1,
    dataId = 11,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1209)->
    #dropCfg {
    dropId = 1402,
    dropType = 0,
    dataId = 222,
    probability = 5000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1210)->
    #dropCfg {
    dropId = 1402,
    dropType = 0,
    dataId = 2102,
    probability = 2500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1211)->
    #dropCfg {
    dropId = 1402,
    dropType = 0,
    dataId = 2022,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1212)->
    #dropCfg {
    dropId = 1402,
    dropType = 0,
    dataId = 300,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1213)->
    #dropCfg {
    dropId = 1403,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1214)->
    #dropCfg {
    dropId = 1403,
    dropType = 0,
    dataId = 300,
    probability = 10000,
    min = 1,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1215)->
    #dropCfg {
    dropId = 1410,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1216)->
    #dropCfg {
    dropId = 1410,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1217)->
    #dropCfg {
    dropId = 1410,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 1,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1218)->
    #dropCfg {
    dropId = 1410,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1219)->
    #dropCfg {
    dropId = 1410,
    dropType = 0,
    dataId = 223,
    probability = 5000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1220)->
    #dropCfg {
    dropId = 1410,
    dropType = 0,
    dataId = 2022,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1221)->
    #dropCfg {
    dropId = 1410,
    dropType = 0,
    dataId = 7004,
    probability = 5000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1222)->
    #dropCfg {
    dropId = 1411,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1223)->
    #dropCfg {
    dropId = 1411,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1224)->
    #dropCfg {
    dropId = 1411,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 1,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1225)->
    #dropCfg {
    dropId = 1411,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1226)->
    #dropCfg {
    dropId = 1411,
    dropType = 0,
    dataId = 223,
    probability = 5000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1227)->
    #dropCfg {
    dropId = 1411,
    dropType = 0,
    dataId = 2022,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1228)->
    #dropCfg {
    dropId = 1411,
    dropType = 0,
    dataId = 7000,
    probability = 5000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1229)->
    #dropCfg {
    dropId = 1412,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1230)->
    #dropCfg {
    dropId = 1412,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1231)->
    #dropCfg {
    dropId = 1412,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 1,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1232)->
    #dropCfg {
    dropId = 1412,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1233)->
    #dropCfg {
    dropId = 1412,
    dropType = 0,
    dataId = 223,
    probability = 5000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1234)->
    #dropCfg {
    dropId = 1412,
    dropType = 0,
    dataId = 2022,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1235)->
    #dropCfg {
    dropId = 1412,
    dropType = 0,
    dataId = 7001,
    probability = 5000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1236)->
    #dropCfg {
    dropId = 1420,
    dropType = 1,
    dataId = 120,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1237)->
    #dropCfg {
    dropId = 1420,
    dropType = 0,
    dataId = 6000,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1238)->
    #dropCfg {
    dropId = 1421,
    dropType = 0,
    dataId = 2105,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1239)->
    #dropCfg {
    dropId = 1421,
    dropType = 0,
    dataId = 617,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1240)->
    #dropCfg {
    dropId = 1421,
    dropType = 1,
    dataId = 2001,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1241)->
    #dropCfg {
    dropId = 1422,
    dropType = 0,
    dataId = 2105,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1242)->
    #dropCfg {
    dropId = 1422,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1243)->
    #dropCfg {
    dropId = 1423,
    dropType = 0,
    dataId = 2105,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1244)->
    #dropCfg {
    dropId = 1423,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1245)->
    #dropCfg {
    dropId = 1424,
    dropType = 1,
    dataId = 120,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1246)->
    #dropCfg {
    dropId = 1424,
    dropType = 0,
    dataId = 6000,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1247)->
    #dropCfg {
    dropId = 1425,
    dropType = 1,
    dataId = 120,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1248)->
    #dropCfg {
    dropId = 1425,
    dropType = 0,
    dataId = 6000,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1249)->
    #dropCfg {
    dropId = 1426,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1250)->
    #dropCfg {
    dropId = 1426,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1251)->
    #dropCfg {
    dropId = 1427,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1252)->
    #dropCfg {
    dropId = 1427,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1253)->
    #dropCfg {
    dropId = 1428,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1254)->
    #dropCfg {
    dropId = 1428,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1255)->
    #dropCfg {
    dropId = 1429,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1256)->
    #dropCfg {
    dropId = 1429,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1257)->
    #dropCfg {
    dropId = 1430,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1258)->
    #dropCfg {
    dropId = 1430,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1259)->
    #dropCfg {
    dropId = 1431,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1260)->
    #dropCfg {
    dropId = 1431,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1261)->
    #dropCfg {
    dropId = 1450,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1262)->
    #dropCfg {
    dropId = 1450,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1263)->
    #dropCfg {
    dropId = 1450,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1264)->
    #dropCfg {
    dropId = 1450,
    dropType = 0,
    dataId = 305,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1265)->
    #dropCfg {
    dropId = 1450,
    dropType = 0,
    dataId = 1134,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1266)->
    #dropCfg {
    dropId = 1451,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1267)->
    #dropCfg {
    dropId = 1451,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1268)->
    #dropCfg {
    dropId = 1451,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1269)->
    #dropCfg {
    dropId = 1451,
    dropType = 0,
    dataId = 305,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1270)->
    #dropCfg {
    dropId = 1451,
    dropType = 0,
    dataId = 1134,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1271)->
    #dropCfg {
    dropId = 1452,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1272)->
    #dropCfg {
    dropId = 1452,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1273)->
    #dropCfg {
    dropId = 1452,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1274)->
    #dropCfg {
    dropId = 1452,
    dropType = 0,
    dataId = 305,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1275)->
    #dropCfg {
    dropId = 1452,
    dropType = 0,
    dataId = 1134,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1276)->
    #dropCfg {
    dropId = 1453,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1277)->
    #dropCfg {
    dropId = 1453,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1278)->
    #dropCfg {
    dropId = 1453,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1279)->
    #dropCfg {
    dropId = 1453,
    dropType = 0,
    dataId = 305,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1280)->
    #dropCfg {
    dropId = 1453,
    dropType = 0,
    dataId = 1134,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1281)->
    #dropCfg {
    dropId = 1454,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 75,
    max = 75,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1282)->
    #dropCfg {
    dropId = 1454,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 75,
    max = 75,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1283)->
    #dropCfg {
    dropId = 1454,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1284)->
    #dropCfg {
    dropId = 1454,
    dropType = 0,
    dataId = 305,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1285)->
    #dropCfg {
    dropId = 1454,
    dropType = 0,
    dataId = 1134,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1286)->
    #dropCfg {
    dropId = 1500,
    dropType = 1,
    dataId = 150,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1287)->
    #dropCfg {
    dropId = 1500,
    dropType = 0,
    dataId = 2022,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1288)->
    #dropCfg {
    dropId = 1600,
    dropType = 1,
    dataId = 160,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1289)->
    #dropCfg {
    dropId = 1700,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1290)->
    #dropCfg {
    dropId = 1700,
    dropType = 0,
    dataId = 762,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1291)->
    #dropCfg {
    dropId = 1700,
    dropType = 1,
    dataId = 1700,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1292)->
    #dropCfg {
    dropId = 1700,
    dropType = 1,
    dataId = 1701,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1293)->
    #dropCfg {
    dropId = 1701,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1294)->
    #dropCfg {
    dropId = 1701,
    dropType = 0,
    dataId = 223,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1295)->
    #dropCfg {
    dropId = 1701,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1296)->
    #dropCfg {
    dropId = 1701,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1297)->
    #dropCfg {
    dropId = 1701,
    dropType = 0,
    dataId = 2102,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1298)->
    #dropCfg {
    dropId = 1701,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1299)->
    #dropCfg {
    dropId = 1701,
    dropType = 0,
    dataId = 1932,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1300)->
    #dropCfg {
    dropId = 1701,
    dropType = 0,
    dataId = 776,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1301)->
    #dropCfg {
    dropId = 1702,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1302)->
    #dropCfg {
    dropId = 1702,
    dropType = 0,
    dataId = 223,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1303)->
    #dropCfg {
    dropId = 1702,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1304)->
    #dropCfg {
    dropId = 1702,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1305)->
    #dropCfg {
    dropId = 1702,
    dropType = 0,
    dataId = 2102,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1306)->
    #dropCfg {
    dropId = 1702,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1307)->
    #dropCfg {
    dropId = 1702,
    dropType = 0,
    dataId = 1932,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1308)->
    #dropCfg {
    dropId = 1702,
    dropType = 0,
    dataId = 776,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1309)->
    #dropCfg {
    dropId = 1703,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1310)->
    #dropCfg {
    dropId = 1703,
    dropType = 0,
    dataId = 223,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1311)->
    #dropCfg {
    dropId = 1703,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1312)->
    #dropCfg {
    dropId = 1703,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1313)->
    #dropCfg {
    dropId = 1703,
    dropType = 0,
    dataId = 2102,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1314)->
    #dropCfg {
    dropId = 1703,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1315)->
    #dropCfg {
    dropId = 1703,
    dropType = 0,
    dataId = 1932,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1316)->
    #dropCfg {
    dropId = 1703,
    dropType = 0,
    dataId = 776,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1317)->
    #dropCfg {
    dropId = 1704,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1318)->
    #dropCfg {
    dropId = 1704,
    dropType = 0,
    dataId = 223,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1319)->
    #dropCfg {
    dropId = 1704,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1320)->
    #dropCfg {
    dropId = 1704,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1321)->
    #dropCfg {
    dropId = 1704,
    dropType = 0,
    dataId = 2104,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1322)->
    #dropCfg {
    dropId = 1704,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1323)->
    #dropCfg {
    dropId = 1704,
    dropType = 0,
    dataId = 1933,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1324)->
    #dropCfg {
    dropId = 1704,
    dropType = 0,
    dataId = 776,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1325)->
    #dropCfg {
    dropId = 1705,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1326)->
    #dropCfg {
    dropId = 1705,
    dropType = 0,
    dataId = 223,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1327)->
    #dropCfg {
    dropId = 1705,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1328)->
    #dropCfg {
    dropId = 1705,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1329)->
    #dropCfg {
    dropId = 1705,
    dropType = 0,
    dataId = 2104,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1330)->
    #dropCfg {
    dropId = 1705,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1331)->
    #dropCfg {
    dropId = 1705,
    dropType = 0,
    dataId = 1933,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1332)->
    #dropCfg {
    dropId = 1705,
    dropType = 0,
    dataId = 776,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1333)->
    #dropCfg {
    dropId = 1706,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1334)->
    #dropCfg {
    dropId = 1706,
    dropType = 0,
    dataId = 223,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1335)->
    #dropCfg {
    dropId = 1706,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1336)->
    #dropCfg {
    dropId = 1706,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1337)->
    #dropCfg {
    dropId = 1706,
    dropType = 0,
    dataId = 2104,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1338)->
    #dropCfg {
    dropId = 1706,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1339)->
    #dropCfg {
    dropId = 1706,
    dropType = 0,
    dataId = 1933,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1340)->
    #dropCfg {
    dropId = 1706,
    dropType = 0,
    dataId = 7003,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1341)->
    #dropCfg {
    dropId = 1706,
    dropType = 0,
    dataId = 776,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1342)->
    #dropCfg {
    dropId = 1707,
    dropType = 1,
    dataId = 1707,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1343)->
    #dropCfg {
    dropId = 1708,
    dropType = 1,
    dataId = 1708,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1344)->
    #dropCfg {
    dropId = 1709,
    dropType = 1,
    dataId = 1709,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1345)->
    #dropCfg {
    dropId = 1710,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    min = 1,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1346)->
    #dropCfg {
    dropId = 1711,
    dropType = 0,
    dataId = 611,
    probability = 10000,
    min = 1,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1347)->
    #dropCfg {
    dropId = 1800,
    dropType = 1,
    dataId = 1800,
    probability = 10000,
    min = 1,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1348)->
    #dropCfg {
    dropId = 1801,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 1,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1349)->
    #dropCfg {
    dropId = 1801,
    dropType = 0,
    dataId = 1932,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1350)->
    #dropCfg {
    dropId = 1801,
    dropType = 0,
    dataId = 783,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1351)->
    #dropCfg {
    dropId = 1801,
    dropType = 1,
    dataId = 1801,
    probability = 10000,
    min = 1,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1352)->
    #dropCfg {
    dropId = 1802,
    dropType = 1,
    dataId = 1802,
    probability = 10000,
    min = 1,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1353)->
    #dropCfg {
    dropId = 1803,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 1,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1354)->
    #dropCfg {
    dropId = 1803,
    dropType = 0,
    dataId = 7015,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1355)->
    #dropCfg {
    dropId = 1804,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1356)->
    #dropCfg {
    dropId = 1804,
    dropType = 0,
    dataId = 7014,
    probability = 10000,
    min = 1,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1357)->
    #dropCfg {
    dropId = 1804,
    dropType = 0,
    dataId = 7015,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1358)->
    #dropCfg {
    dropId = 1804,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1359)->
    #dropCfg {
    dropId = 1804,
    dropType = 0,
    dataId = 223,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1360)->
    #dropCfg {
    dropId = 1804,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1361)->
    #dropCfg {
    dropId = 1804,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1362)->
    #dropCfg {
    dropId = 1804,
    dropType = 0,
    dataId = 2104,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1363)->
    #dropCfg {
    dropId = 1804,
    dropType = 0,
    dataId = 1933,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1364)->
    #dropCfg {
    dropId = 1805,
    dropType = 0,
    dataId = 611,
    probability = 10000,
    min = 1,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1365)->
    #dropCfg {
    dropId = 1805,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1366)->
    #dropCfg {
    dropId = 1805,
    dropType = 0,
    dataId = 223,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1367)->
    #dropCfg {
    dropId = 1805,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1368)->
    #dropCfg {
    dropId = 1805,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1369)->
    #dropCfg {
    dropId = 1805,
    dropType = 0,
    dataId = 2102,
    probability = 10000,
    min = 1,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1370)->
    #dropCfg {
    dropId = 1805,
    dropType = 0,
    dataId = 1932,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1371)->
    #dropCfg {
    dropId = 1805,
    dropType = 0,
    dataId = 783,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1372)->
    #dropCfg {
    dropId = 1901,
    dropType = 2,
    dataId = 11,
    probability = 10000,
    min = 5,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1373)->
    #dropCfg {
    dropId = 1902,
    dropType = 2,
    dataId = 11,
    probability = 10000,
    min = 12,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1374)->
    #dropCfg {
    dropId = 1903,
    dropType = 2,
    dataId = 11,
    probability = 10000,
    min = 20,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1375)->
    #dropCfg {
    dropId = 1904,
    dropType = 2,
    dataId = 11,
    probability = 10000,
    min = 30,
    max = 35,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1376)->
    #dropCfg {
    dropId = 1905,
    dropType = 2,
    dataId = 11,
    probability = 10000,
    min = 80,
    max = 160,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1377)->
    #dropCfg {
    dropId = 1915,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1378)->
    #dropCfg {
    dropId = 1915,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1379)->
    #dropCfg {
    dropId = 1915,
    dropType = 2,
    dataId = 11,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1380)->
    #dropCfg {
    dropId = 1915,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1381)->
    #dropCfg {
    dropId = 1915,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    min = 200,
    max = 200,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1382)->
    #dropCfg {
    dropId = 1915,
    dropType = 0,
    dataId = 606,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1383)->
    #dropCfg {
    dropId = 1916,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    min = 35,
    max = 35,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1384)->
    #dropCfg {
    dropId = 1916,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1385)->
    #dropCfg {
    dropId = 1916,
    dropType = 2,
    dataId = 11,
    probability = 10000,
    min = 150,
    max = 150,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1386)->
    #dropCfg {
    dropId = 1916,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 35,
    max = 35,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1387)->
    #dropCfg {
    dropId = 1916,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    min = 250,
    max = 250,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1388)->
    #dropCfg {
    dropId = 1916,
    dropType = 0,
    dataId = 606,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1389)->
    #dropCfg {
    dropId = 1917,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1390)->
    #dropCfg {
    dropId = 1917,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1391)->
    #dropCfg {
    dropId = 1917,
    dropType = 2,
    dataId = 11,
    probability = 10000,
    min = 200,
    max = 200,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1392)->
    #dropCfg {
    dropId = 1917,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1393)->
    #dropCfg {
    dropId = 1917,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    min = 300,
    max = 300,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1394)->
    #dropCfg {
    dropId = 1917,
    dropType = 0,
    dataId = 606,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1395)->
    #dropCfg {
    dropId = 1918,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1396)->
    #dropCfg {
    dropId = 1918,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1397)->
    #dropCfg {
    dropId = 1918,
    dropType = 2,
    dataId = 11,
    probability = 10000,
    min = 200,
    max = 200,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1398)->
    #dropCfg {
    dropId = 1918,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1399)->
    #dropCfg {
    dropId = 1918,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    min = 300,
    max = 300,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1400)->
    #dropCfg {
    dropId = 1918,
    dropType = 0,
    dataId = 606,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1401)->
    #dropCfg {
    dropId = 1919,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1402)->
    #dropCfg {
    dropId = 1919,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1403)->
    #dropCfg {
    dropId = 1919,
    dropType = 2,
    dataId = 11,
    probability = 10000,
    min = 200,
    max = 200,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1404)->
    #dropCfg {
    dropId = 1919,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1405)->
    #dropCfg {
    dropId = 1919,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    min = 300,
    max = 300,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1406)->
    #dropCfg {
    dropId = 1919,
    dropType = 0,
    dataId = 606,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1407)->
    #dropCfg {
    dropId = 1920,
    dropType = 0,
    dataId = 1162,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1408)->
    #dropCfg {
    dropId = 1921,
    dropType = 0,
    dataId = 1162,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1409)->
    #dropCfg {
    dropId = 1922,
    dropType = 0,
    dataId = 1162,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1410)->
    #dropCfg {
    dropId = 1923,
    dropType = 0,
    dataId = 1162,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1411)->
    #dropCfg {
    dropId = 1924,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 80,
    max = 80,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1412)->
    #dropCfg {
    dropId = 1924,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 80,
    max = 80,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1413)->
    #dropCfg {
    dropId = 1924,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    min = 700,
    max = 700,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1414)->
    #dropCfg {
    dropId = 1924,
    dropType = 0,
    dataId = 1162,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1415)->
    #dropCfg {
    dropId = 1925,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 70,
    max = 70,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1416)->
    #dropCfg {
    dropId = 1925,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 70,
    max = 70,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1417)->
    #dropCfg {
    dropId = 1925,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    min = 500,
    max = 500,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1418)->
    #dropCfg {
    dropId = 1925,
    dropType = 0,
    dataId = 1162,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1419)->
    #dropCfg {
    dropId = 1926,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 60,
    max = 60,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1420)->
    #dropCfg {
    dropId = 1926,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 60,
    max = 60,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1421)->
    #dropCfg {
    dropId = 1926,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    min = 400,
    max = 400,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1422)->
    #dropCfg {
    dropId = 1926,
    dropType = 0,
    dataId = 1162,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1423)->
    #dropCfg {
    dropId = 1927,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1424)->
    #dropCfg {
    dropId = 1927,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1425)->
    #dropCfg {
    dropId = 1927,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    min = 300,
    max = 300,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1426)->
    #dropCfg {
    dropId = 1928,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1427)->
    #dropCfg {
    dropId = 1928,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1428)->
    #dropCfg {
    dropId = 1929,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1429)->
    #dropCfg {
    dropId = 1930,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1430)->
    #dropCfg {
    dropId = 1931,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1431)->
    #dropCfg {
    dropId = 2000,
    dropType = 1,
    dataId = 1901,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1432)->
    #dropCfg {
    dropId = 2001,
    dropType = 1,
    dataId = 1902,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1433)->
    #dropCfg {
    dropId = 2002,
    dropType = 1,
    dataId = 1903,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1434)->
    #dropCfg {
    dropId = 2003,
    dropType = 1,
    dataId = 1904,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1435)->
    #dropCfg {
    dropId = 2004,
    dropType = 1,
    dataId = 1905,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1436)->
    #dropCfg {
    dropId = 2005,
    dropType = 1,
    dataId = 1906,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1437)->
    #dropCfg {
    dropId = 2006,
    dropType = 1,
    dataId = 1907,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1438)->
    #dropCfg {
    dropId = 2007,
    dropType = 1,
    dataId = 1908,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1439)->
    #dropCfg {
    dropId = 2008,
    dropType = 1,
    dataId = 1909,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1440)->
    #dropCfg {
    dropId = 2009,
    dropType = 1,
    dataId = 1910,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1441)->
    #dropCfg {
    dropId = 2010,
    dropType = 1,
    dataId = 1911,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1442)->
    #dropCfg {
    dropId = 2011,
    dropType = 1,
    dataId = 1912,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1443)->
    #dropCfg {
    dropId = 2012,
    dropType = 1,
    dataId = 1913,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1444)->
    #dropCfg {
    dropId = 2013,
    dropType = 1,
    dataId = 1914,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1445)->
    #dropCfg {
    dropId = 2014,
    dropType = 1,
    dataId = 1915,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1446)->
    #dropCfg {
    dropId = 2015,
    dropType = 1,
    dataId = 1916,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1447)->
    #dropCfg {
    dropId = 2016,
    dropType = 1,
    dataId = 1917,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1448)->
    #dropCfg {
    dropId = 2017,
    dropType = 1,
    dataId = 1918,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1449)->
    #dropCfg {
    dropId = 2018,
    dropType = 1,
    dataId = 1919,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1450)->
    #dropCfg {
    dropId = 2019,
    dropType = 1,
    dataId = 1920,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1451)->
    #dropCfg {
    dropId = 2020,
    dropType = 1,
    dataId = 1921,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1452)->
    #dropCfg {
    dropId = 2021,
    dropType = 1,
    dataId = 1922,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1453)->
    #dropCfg {
    dropId = 2200,
    dropType = 0,
    dataId = 904,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1454)->
    #dropCfg {
    dropId = 2200,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1455)->
    #dropCfg {
    dropId = 2200,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1456)->
    #dropCfg {
    dropId = 2200,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1457)->
    #dropCfg {
    dropId = 2200,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1458)->
    #dropCfg {
    dropId = 2200,
    dropType = 0,
    dataId = 2102,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1459)->
    #dropCfg {
    dropId = 2200,
    dropType = 0,
    dataId = 1836,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1460)->
    #dropCfg {
    dropId = 2201,
    dropType = 1,
    dataId = 22011,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1461)->
    #dropCfg {
    dropId = 2202,
    dropType = 1,
    dataId = 22021,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1462)->
    #dropCfg {
    dropId = 2203,
    dropType = 1,
    dataId = 22031,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1463)->
    #dropCfg {
    dropId = 2204,
    dropType = 1,
    dataId = 22041,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1464)->
    #dropCfg {
    dropId = 2205,
    dropType = 1,
    dataId = 22051,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1465)->
    #dropCfg {
    dropId = 2206,
    dropType = 1,
    dataId = 22061,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1466)->
    #dropCfg {
    dropId = 2207,
    dropType = 1,
    dataId = 22071,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1467)->
    #dropCfg {
    dropId = 2208,
    dropType = 1,
    dataId = 22081,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1468)->
    #dropCfg {
    dropId = 2209,
    dropType = 1,
    dataId = 22091,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1469)->
    #dropCfg {
    dropId = 2300,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1470)->
    #dropCfg {
    dropId = 2300,
    dropType = 0,
    dataId = 1901,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1471)->
    #dropCfg {
    dropId = 2300,
    dropType = 0,
    dataId = 903,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1472)->
    #dropCfg {
    dropId = 2300,
    dropType = 0,
    dataId = 2102,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1473)->
    #dropCfg {
    dropId = 2300,
    dropType = 0,
    dataId = 2901,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1474)->
    #dropCfg {
    dropId = 2301,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1475)->
    #dropCfg {
    dropId = 2301,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1476)->
    #dropCfg {
    dropId = 2301,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1477)->
    #dropCfg {
    dropId = 2301,
    dropType = 0,
    dataId = 2102,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1478)->
    #dropCfg {
    dropId = 2301,
    dropType = 0,
    dataId = 2902,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1479)->
    #dropCfg {
    dropId = 2302,
    dropType = 0,
    dataId = 615,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1480)->
    #dropCfg {
    dropId = 2302,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1481)->
    #dropCfg {
    dropId = 2302,
    dropType = 0,
    dataId = 272,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1482)->
    #dropCfg {
    dropId = 2302,
    dropType = 0,
    dataId = 2102,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1483)->
    #dropCfg {
    dropId = 2302,
    dropType = 0,
    dataId = 2903,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1484)->
    #dropCfg {
    dropId = 2303,
    dropType = 0,
    dataId = 615,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1485)->
    #dropCfg {
    dropId = 2303,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1486)->
    #dropCfg {
    dropId = 2303,
    dropType = 0,
    dataId = 4303,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1487)->
    #dropCfg {
    dropId = 2303,
    dropType = 0,
    dataId = 2102,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1488)->
    #dropCfg {
    dropId = 2303,
    dropType = 0,
    dataId = 2904,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1489)->
    #dropCfg {
    dropId = 2304,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1490)->
    #dropCfg {
    dropId = 2304,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 60,
    max = 60,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1491)->
    #dropCfg {
    dropId = 2304,
    dropType = 0,
    dataId = 4303,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1492)->
    #dropCfg {
    dropId = 2304,
    dropType = 0,
    dataId = 2102,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1493)->
    #dropCfg {
    dropId = 2500,
    dropType = 1,
    dataId = 25001,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1494)->
    #dropCfg {
    dropId = 2500,
    dropType = 1,
    dataId = 25002,
    probability = 20,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1495)->
    #dropCfg {
    dropId = 2501,
    dropType = 1,
    dataId = 25011,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1496)->
    #dropCfg {
    dropId = 2501,
    dropType = 1,
    dataId = 25012,
    probability = 20,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1497)->
    #dropCfg {
    dropId = 2502,
    dropType = 1,
    dataId = 25021,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1498)->
    #dropCfg {
    dropId = 2502,
    dropType = 1,
    dataId = 25022,
    probability = 20,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1499)->
    #dropCfg {
    dropId = 2503,
    dropType = 1,
    dataId = 25031,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1500)->
    #dropCfg {
    dropId = 2503,
    dropType = 1,
    dataId = 25032,
    probability = 20,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1501)->
    #dropCfg {
    dropId = 2504,
    dropType = 1,
    dataId = 25041,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1502)->
    #dropCfg {
    dropId = 2504,
    dropType = 1,
    dataId = 25042,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1503)->
    #dropCfg {
    dropId = 2505,
    dropType = 0,
    dataId = 385,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1504)->
    #dropCfg {
    dropId = 2505,
    dropType = 0,
    dataId = 386,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1505)->
    #dropCfg {
    dropId = 2505,
    dropType = 0,
    dataId = 387,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1506)->
    #dropCfg {
    dropId = 2505,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1507)->
    #dropCfg {
    dropId = 2506,
    dropType = 0,
    dataId = 385,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1508)->
    #dropCfg {
    dropId = 2506,
    dropType = 0,
    dataId = 386,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1509)->
    #dropCfg {
    dropId = 2506,
    dropType = 0,
    dataId = 387,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1510)->
    #dropCfg {
    dropId = 2506,
    dropType = 0,
    dataId = 617,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1511)->
    #dropCfg {
    dropId = 2507,
    dropType = 0,
    dataId = 385,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1512)->
    #dropCfg {
    dropId = 2507,
    dropType = 0,
    dataId = 386,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1513)->
    #dropCfg {
    dropId = 2507,
    dropType = 0,
    dataId = 387,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1514)->
    #dropCfg {
    dropId = 2507,
    dropType = 0,
    dataId = 617,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1515)->
    #dropCfg {
    dropId = 2508,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1516)->
    #dropCfg {
    dropId = 2508,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1517)->
    #dropCfg {
    dropId = 2508,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1518)->
    #dropCfg {
    dropId = 2508,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1519)->
    #dropCfg {
    dropId = 2508,
    dropType = 0,
    dataId = 617,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1520)->
    #dropCfg {
    dropId = 2509,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1521)->
    #dropCfg {
    dropId = 2509,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1522)->
    #dropCfg {
    dropId = 2509,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1523)->
    #dropCfg {
    dropId = 2509,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1524)->
    #dropCfg {
    dropId = 2509,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1525)->
    #dropCfg {
    dropId = 2509,
    dropType = 0,
    dataId = 617,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1526)->
    #dropCfg {
    dropId = 2510,
    dropType = 1,
    dataId = 25101,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1527)->
    #dropCfg {
    dropId = 2510,
    dropType = 1,
    dataId = 25102,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1528)->
    #dropCfg {
    dropId = 2511,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1529)->
    #dropCfg {
    dropId = 2511,
    dropType = 0,
    dataId = 366,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1530)->
    #dropCfg {
    dropId = 2511,
    dropType = 0,
    dataId = 273,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1531)->
    #dropCfg {
    dropId = 2511,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1532)->
    #dropCfg {
    dropId = 2511,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1533)->
    #dropCfg {
    dropId = 2511,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1534)->
    #dropCfg {
    dropId = 2511,
    dropType = 0,
    dataId = 4200,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1535)->
    #dropCfg {
    dropId = 2512,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1536)->
    #dropCfg {
    dropId = 2512,
    dropType = 0,
    dataId = 366,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1537)->
    #dropCfg {
    dropId = 2512,
    dropType = 0,
    dataId = 274,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1538)->
    #dropCfg {
    dropId = 2512,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1539)->
    #dropCfg {
    dropId = 2512,
    dropType = 0,
    dataId = 223,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1540)->
    #dropCfg {
    dropId = 2512,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1541)->
    #dropCfg {
    dropId = 2512,
    dropType = 0,
    dataId = 2150,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1542)->
    #dropCfg {
    dropId = 2512,
    dropType = 0,
    dataId = 4203,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1543)->
    #dropCfg {
    dropId = 2513,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1544)->
    #dropCfg {
    dropId = 2513,
    dropType = 0,
    dataId = 369,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1545)->
    #dropCfg {
    dropId = 2513,
    dropType = 0,
    dataId = 275,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1546)->
    #dropCfg {
    dropId = 2513,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1547)->
    #dropCfg {
    dropId = 2513,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1548)->
    #dropCfg {
    dropId = 2513,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1549)->
    #dropCfg {
    dropId = 2513,
    dropType = 0,
    dataId = 2150,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1550)->
    #dropCfg {
    dropId = 2513,
    dropType = 0,
    dataId = 4207,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1551)->
    #dropCfg {
    dropId = 2514,
    dropType = 0,
    dataId = 618,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1552)->
    #dropCfg {
    dropId = 2514,
    dropType = 0,
    dataId = 906,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1553)->
    #dropCfg {
    dropId = 2515,
    dropType = 0,
    dataId = 2020,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1554)->
    #dropCfg {
    dropId = 2516,
    dropType = 0,
    dataId = 2021,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1555)->
    #dropCfg {
    dropId = 2517,
    dropType = 1,
    dataId = 25171,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1556)->
    #dropCfg {
    dropId = 2517,
    dropType = 1,
    dataId = 25172,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1557)->
    #dropCfg {
    dropId = 2518,
    dropType = 1,
    dataId = 25181,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1558)->
    #dropCfg {
    dropId = 2518,
    dropType = 1,
    dataId = 25182,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1559)->
    #dropCfg {
    dropId = 2519,
    dropType = 1,
    dataId = 25191,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1560)->
    #dropCfg {
    dropId = 2519,
    dropType = 1,
    dataId = 25192,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1561)->
    #dropCfg {
    dropId = 2520,
    dropType = 1,
    dataId = 25201,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1562)->
    #dropCfg {
    dropId = 2520,
    dropType = 1,
    dataId = 25202,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1563)->
    #dropCfg {
    dropId = 2521,
    dropType = 1,
    dataId = 25211,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1564)->
    #dropCfg {
    dropId = 2521,
    dropType = 1,
    dataId = 25212,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1565)->
    #dropCfg {
    dropId = 2522,
    dropType = 1,
    dataId = 25221,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1566)->
    #dropCfg {
    dropId = 2522,
    dropType = 1,
    dataId = 25222,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1567)->
    #dropCfg {
    dropId = 3000,
    dropType = 0,
    dataId = 615,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1568)->
    #dropCfg {
    dropId = 3001,
    dropType = 0,
    dataId = 617,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1569)->
    #dropCfg {
    dropId = 3001,
    dropType = 1,
    dataId = 1000,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1570)->
    #dropCfg {
    dropId = 3001,
    dropType = 1,
    dataId = 1001,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1571)->
    #dropCfg {
    dropId = 3001,
    dropType = 0,
    dataId = 7003,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1572)->
    #dropCfg {
    dropId = 3001,
    dropType = 0,
    dataId = 7023,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1573)->
    #dropCfg {
    dropId = 3002,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1574)->
    #dropCfg {
    dropId = 3002,
    dropType = 0,
    dataId = 1929,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1575)->
    #dropCfg {
    dropId = 3002,
    dropType = 0,
    dataId = 7002,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1576)->
    #dropCfg {
    dropId = 3002,
    dropType = 0,
    dataId = 7021,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1577)->
    #dropCfg {
    dropId = 3003,
    dropType = 0,
    dataId = 1914,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1578)->
    #dropCfg {
    dropId = 3003,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1579)->
    #dropCfg {
    dropId = 3004,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 3,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1580)->
    #dropCfg {
    dropId = 3004,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    min = 100,
    max = 120,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1581)->
    #dropCfg {
    dropId = 3005,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 2,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1582)->
    #dropCfg {
    dropId = 3005,
    dropType = 0,
    dataId = 6,
    probability = 10000,
    min = 90,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1583)->
    #dropCfg {
    dropId = 3006,
    dropType = 0,
    dataId = 615,
    probability = 10000,
    min = 3,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1584)->
    #dropCfg {
    dropId = 3006,
    dropType = 0,
    dataId = 6,
    probability = 10000,
    min = 70,
    max = 80,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1585)->
    #dropCfg {
    dropId = 3007,
    dropType = 0,
    dataId = 615,
    probability = 10000,
    min = 2,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1586)->
    #dropCfg {
    dropId = 3007,
    dropType = 0,
    dataId = 6,
    probability = 10000,
    min = 50,
    max = 60,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1587)->
    #dropCfg {
    dropId = 3008,
    dropType = 0,
    dataId = 615,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1588)->
    #dropCfg {
    dropId = 3008,
    dropType = 0,
    dataId = 6,
    probability = 10000,
    min = 30,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1589)->
    #dropCfg {
    dropId = 3009,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1590)->
    #dropCfg {
    dropId = 3009,
    dropType = 0,
    dataId = 6,
    probability = 10000,
    min = 10,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1591)->
    #dropCfg {
    dropId = 3210,
    dropType = 1,
    dataId = 32100,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1592)->
    #dropCfg {
    dropId = 3211,
    dropType = 1,
    dataId = 32110,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1593)->
    #dropCfg {
    dropId = 3500,
    dropType = 1,
    dataId = 35000,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1594)->
    #dropCfg {
    dropId = 3501,
    dropType = 1,
    dataId = 35010,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1595)->
    #dropCfg {
    dropId = 3502,
    dropType = 1,
    dataId = 35020,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1596)->
    #dropCfg {
    dropId = 4000,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1597)->
    #dropCfg {
    dropId = 4000,
    dropType = 1,
    dataId = 467,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1598)->
    #dropCfg {
    dropId = 4000,
    dropType = 0,
    dataId = 603,
    probability = 10000,
    min = 10,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1599)->
    #dropCfg {
    dropId = 4000,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1600)->
    #dropCfg {
    dropId = 4000,
    dropType = 3,
    dataId = 274,
    probability = 3000,
    min = 3,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1601)->
    #dropCfg {
    dropId = 4000,
    dropType = 3,
    dataId = 7000,
    probability = 10000,
    min = 20,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1602)->
    #dropCfg {
    dropId = 4001,
    dropType = 0,
    dataId = 7022,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1603)->
    #dropCfg {
    dropId = 4001,
    dropType = 1,
    dataId = 468,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1604)->
    #dropCfg {
    dropId = 4001,
    dropType = 0,
    dataId = 604,
    probability = 10000,
    min = 10,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1605)->
    #dropCfg {
    dropId = 4001,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 10,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1606)->
    #dropCfg {
    dropId = 4001,
    dropType = 3,
    dataId = 275,
    probability = 3000,
    min = 3,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1607)->
    #dropCfg {
    dropId = 4001,
    dropType = 3,
    dataId = 7000,
    probability = 10000,
    min = 20,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1608)->
    #dropCfg {
    dropId = 4002,
    dropType = 0,
    dataId = 7023,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1609)->
    #dropCfg {
    dropId = 4002,
    dropType = 1,
    dataId = 469,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1610)->
    #dropCfg {
    dropId = 4002,
    dropType = 0,
    dataId = 604,
    probability = 10000,
    min = 20,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1611)->
    #dropCfg {
    dropId = 4002,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 20,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1612)->
    #dropCfg {
    dropId = 4002,
    dropType = 3,
    dataId = 275,
    probability = 3000,
    min = 5,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1613)->
    #dropCfg {
    dropId = 4002,
    dropType = 3,
    dataId = 7001,
    probability = 10000,
    min = 20,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1614)->
    #dropCfg {
    dropId = 4003,
    dropType = 0,
    dataId = 7023,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1615)->
    #dropCfg {
    dropId = 4003,
    dropType = 1,
    dataId = 469,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1616)->
    #dropCfg {
    dropId = 4003,
    dropType = 0,
    dataId = 604,
    probability = 10000,
    min = 40,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1617)->
    #dropCfg {
    dropId = 4003,
    dropType = 0,
    dataId = 229,
    probability = 10000,
    min = 40,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1618)->
    #dropCfg {
    dropId = 4003,
    dropType = 3,
    dataId = 275,
    probability = 3000,
    min = 7,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1619)->
    #dropCfg {
    dropId = 4003,
    dropType = 3,
    dataId = 275,
    probability = 3000,
    min = 7,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1620)->
    #dropCfg {
    dropId = 4003,
    dropType = 3,
    dataId = 7001,
    probability = 10000,
    min = 20,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1621)->
    #dropCfg {
    dropId = 4004,
    dropType = 0,
    dataId = 7022,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1622)->
    #dropCfg {
    dropId = 4004,
    dropType = 1,
    dataId = 4002,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1623)->
    #dropCfg {
    dropId = 4004,
    dropType = 1,
    dataId = 4003,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1624)->
    #dropCfg {
    dropId = 4004,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1625)->
    #dropCfg {
    dropId = 4004,
    dropType = 3,
    dataId = 275,
    probability = 3000,
    min = 3,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1626)->
    #dropCfg {
    dropId = 4004,
    dropType = 3,
    dataId = 275,
    probability = 3000,
    min = 3,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1627)->
    #dropCfg {
    dropId = 4004,
    dropType = 3,
    dataId = 7002,
    probability = 10000,
    min = 20,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1628)->
    #dropCfg {
    dropId = 4005,
    dropType = 0,
    dataId = 7024,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1629)->
    #dropCfg {
    dropId = 4005,
    dropType = 1,
    dataId = 4002,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1630)->
    #dropCfg {
    dropId = 4005,
    dropType = 1,
    dataId = 4003,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1631)->
    #dropCfg {
    dropId = 4005,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1632)->
    #dropCfg {
    dropId = 4005,
    dropType = 0,
    dataId = 2214,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1633)->
    #dropCfg {
    dropId = 4005,
    dropType = 0,
    dataId = 7002,
    probability = 10000,
    min = 20,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1634)->
    #dropCfg {
    dropId = 4005,
    dropType = 0,
    dataId = 3402,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1635)->
    #dropCfg {
    dropId = 4005,
    dropType = 0,
    dataId = 3211,
    probability = 3000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1636)->
    #dropCfg {
    dropId = 4006,
    dropType = 0,
    dataId = 7027,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1637)->
    #dropCfg {
    dropId = 4006,
    dropType = 1,
    dataId = 4002,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1638)->
    #dropCfg {
    dropId = 4006,
    dropType = 1,
    dataId = 4003,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1639)->
    #dropCfg {
    dropId = 4006,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1640)->
    #dropCfg {
    dropId = 4006,
    dropType = 0,
    dataId = 2214,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1641)->
    #dropCfg {
    dropId = 4006,
    dropType = 0,
    dataId = 3400,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1642)->
    #dropCfg {
    dropId = 4006,
    dropType = 0,
    dataId = 3402,
    probability = 10000,
    min = 2,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1643)->
    #dropCfg {
    dropId = 4006,
    dropType = 0,
    dataId = 3211,
    probability = 3000,
    min = 2,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1644)->
    #dropCfg {
    dropId = 5000,
    dropType = 0,
    dataId = 2102,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1645)->
    #dropCfg {
    dropId = 5000,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1646)->
    #dropCfg {
    dropId = 5000,
    dropType = 0,
    dataId = 2105,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1647)->
    #dropCfg {
    dropId = 5000,
    dropType = 0,
    dataId = 1915,
    probability = 50,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1648)->
    #dropCfg {
    dropId = 5000,
    dropType = 0,
    dataId = 1902,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1649)->
    #dropCfg {
    dropId = 5000,
    dropType = 0,
    dataId = 1909,
    probability = 200,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1650)->
    #dropCfg {
    dropId = 6000,
    dropType = 0,
    dataId = 1142,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1651)->
    #dropCfg {
    dropId = 6000,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1652)->
    #dropCfg {
    dropId = 6000,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1653)->
    #dropCfg {
    dropId = 6000,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1654)->
    #dropCfg {
    dropId = 6001,
    dropType = 0,
    dataId = 1142,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1655)->
    #dropCfg {
    dropId = 6001,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1656)->
    #dropCfg {
    dropId = 6001,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1657)->
    #dropCfg {
    dropId = 6001,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1658)->
    #dropCfg {
    dropId = 6002,
    dropType = 0,
    dataId = 1142,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1659)->
    #dropCfg {
    dropId = 6002,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1660)->
    #dropCfg {
    dropId = 6002,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1661)->
    #dropCfg {
    dropId = 6002,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1662)->
    #dropCfg {
    dropId = 6003,
    dropType = 0,
    dataId = 1142,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1663)->
    #dropCfg {
    dropId = 6003,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1664)->
    #dropCfg {
    dropId = 6003,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1665)->
    #dropCfg {
    dropId = 6003,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1666)->
    #dropCfg {
    dropId = 6004,
    dropType = 0,
    dataId = 1142,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1667)->
    #dropCfg {
    dropId = 6004,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1668)->
    #dropCfg {
    dropId = 6004,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1669)->
    #dropCfg {
    dropId = 6004,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1670)->
    #dropCfg {
    dropId = 6005,
    dropType = 0,
    dataId = 1142,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1671)->
    #dropCfg {
    dropId = 6005,
    dropType = 0,
    dataId = 621,
    probability = 10000,
    min = 500,
    max = 500,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1672)->
    #dropCfg {
    dropId = 6005,
    dropType = 0,
    dataId = 2326,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1673)->
    #dropCfg {
    dropId = 6006,
    dropType = 0,
    dataId = 1142,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1674)->
    #dropCfg {
    dropId = 6006,
    dropType = 0,
    dataId = 621,
    probability = 10000,
    min = 500,
    max = 500,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1675)->
    #dropCfg {
    dropId = 6006,
    dropType = 0,
    dataId = 2327,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1676)->
    #dropCfg {
    dropId = 6007,
    dropType = 0,
    dataId = 1142,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1677)->
    #dropCfg {
    dropId = 6007,
    dropType = 0,
    dataId = 621,
    probability = 10000,
    min = 500,
    max = 500,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1678)->
    #dropCfg {
    dropId = 6007,
    dropType = 0,
    dataId = 2328,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1679)->
    #dropCfg {
    dropId = 6008,
    dropType = 0,
    dataId = 1142,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1680)->
    #dropCfg {
    dropId = 6008,
    dropType = 0,
    dataId = 621,
    probability = 10000,
    min = 500,
    max = 500,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1681)->
    #dropCfg {
    dropId = 6008,
    dropType = 0,
    dataId = 2329,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1682)->
    #dropCfg {
    dropId = 6009,
    dropType = 0,
    dataId = 1142,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1683)->
    #dropCfg {
    dropId = 6009,
    dropType = 0,
    dataId = 621,
    probability = 10000,
    min = 500,
    max = 500,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1684)->
    #dropCfg {
    dropId = 6009,
    dropType = 0,
    dataId = 2330,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1685)->
    #dropCfg {
    dropId = 6010,
    dropType = 0,
    dataId = 1142,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1686)->
    #dropCfg {
    dropId = 6010,
    dropType = 0,
    dataId = 621,
    probability = 10000,
    min = 500,
    max = 500,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1687)->
    #dropCfg {
    dropId = 6010,
    dropType = 0,
    dataId = 2331,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1688)->
    #dropCfg {
    dropId = 6011,
    dropType = 0,
    dataId = 1142,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1689)->
    #dropCfg {
    dropId = 6011,
    dropType = 0,
    dataId = 621,
    probability = 10000,
    min = 500,
    max = 500,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1690)->
    #dropCfg {
    dropId = 6011,
    dropType = 0,
    dataId = 2332,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1691)->
    #dropCfg {
    dropId = 6012,
    dropType = 0,
    dataId = 1142,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1692)->
    #dropCfg {
    dropId = 6012,
    dropType = 0,
    dataId = 621,
    probability = 10000,
    min = 500,
    max = 500,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1693)->
    #dropCfg {
    dropId = 6012,
    dropType = 0,
    dataId = 2333,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1694)->
    #dropCfg {
    dropId = 6013,
    dropType = 0,
    dataId = 1142,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1695)->
    #dropCfg {
    dropId = 6013,
    dropType = 0,
    dataId = 621,
    probability = 10000,
    min = 500,
    max = 500,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1696)->
    #dropCfg {
    dropId = 6013,
    dropType = 0,
    dataId = 2334,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1697)->
    #dropCfg {
    dropId = 6014,
    dropType = 0,
    dataId = 1142,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1698)->
    #dropCfg {
    dropId = 6014,
    dropType = 0,
    dataId = 621,
    probability = 10000,
    min = 500,
    max = 500,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1699)->
    #dropCfg {
    dropId = 6014,
    dropType = 0,
    dataId = 2335,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1700)->
    #dropCfg {
    dropId = 6015,
    dropType = 0,
    dataId = 1142,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1701)->
    #dropCfg {
    dropId = 6015,
    dropType = 0,
    dataId = 621,
    probability = 10000,
    min = 500,
    max = 500,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1702)->
    #dropCfg {
    dropId = 6015,
    dropType = 0,
    dataId = 2336,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1703)->
    #dropCfg {
    dropId = 6016,
    dropType = 0,
    dataId = 1142,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1704)->
    #dropCfg {
    dropId = 6016,
    dropType = 0,
    dataId = 621,
    probability = 10000,
    min = 500,
    max = 500,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1705)->
    #dropCfg {
    dropId = 6016,
    dropType = 0,
    dataId = 2337,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1706)->
    #dropCfg {
    dropId = 6017,
    dropType = 0,
    dataId = 1142,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1707)->
    #dropCfg {
    dropId = 6017,
    dropType = 0,
    dataId = 621,
    probability = 10000,
    min = 400,
    max = 400,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1708)->
    #dropCfg {
    dropId = 6018,
    dropType = 0,
    dataId = 1142,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1709)->
    #dropCfg {
    dropId = 6018,
    dropType = 0,
    dataId = 621,
    probability = 10000,
    min = 300,
    max = 300,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1710)->
    #dropCfg {
    dropId = 6019,
    dropType = 0,
    dataId = 1142,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1711)->
    #dropCfg {
    dropId = 6019,
    dropType = 0,
    dataId = 621,
    probability = 10000,
    min = 200,
    max = 200,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1712)->
    #dropCfg {
    dropId = 6020,
    dropType = 0,
    dataId = 1142,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1713)->
    #dropCfg {
    dropId = 6020,
    dropType = 0,
    dataId = 621,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1714)->
    #dropCfg {
    dropId = 6021,
    dropType = 0,
    dataId = 1142,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1715)->
    #dropCfg {
    dropId = 6021,
    dropType = 0,
    dataId = 621,
    probability = 10000,
    min = 500,
    max = 500,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1716)->
    #dropCfg {
    dropId = 6021,
    dropType = 0,
    dataId = 2350,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1717)->
    #dropCfg {
    dropId = 6022,
    dropType = 0,
    dataId = 1142,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1718)->
    #dropCfg {
    dropId = 6022,
    dropType = 0,
    dataId = 621,
    probability = 10000,
    min = 500,
    max = 500,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1719)->
    #dropCfg {
    dropId = 6022,
    dropType = 0,
    dataId = 2351,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1720)->
    #dropCfg {
    dropId = 6023,
    dropType = 0,
    dataId = 1142,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1721)->
    #dropCfg {
    dropId = 6023,
    dropType = 0,
    dataId = 621,
    probability = 10000,
    min = 500,
    max = 500,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1722)->
    #dropCfg {
    dropId = 6023,
    dropType = 0,
    dataId = 2352,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1723)->
    #dropCfg {
    dropId = 6100,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1724)->
    #dropCfg {
    dropId = 6100,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1725)->
    #dropCfg {
    dropId = 6101,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1726)->
    #dropCfg {
    dropId = 6101,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1727)->
    #dropCfg {
    dropId = 6102,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1728)->
    #dropCfg {
    dropId = 6102,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1729)->
    #dropCfg {
    dropId = 6103,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1730)->
    #dropCfg {
    dropId = 6103,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1731)->
    #dropCfg {
    dropId = 6104,
    dropType = 0,
    dataId = 904,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1732)->
    #dropCfg {
    dropId = 6104,
    dropType = 0,
    dataId = 4303,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1733)->
    #dropCfg {
    dropId = 6104,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1734)->
    #dropCfg {
    dropId = 6105,
    dropType = 0,
    dataId = 904,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1735)->
    #dropCfg {
    dropId = 6105,
    dropType = 0,
    dataId = 2101,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1736)->
    #dropCfg {
    dropId = 6105,
    dropType = 0,
    dataId = 272,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1737)->
    #dropCfg {
    dropId = 6200,
    dropType = 0,
    dataId = 2003,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1738)->
    #dropCfg {
    dropId = 6200,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1739)->
    #dropCfg {
    dropId = 6200,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1740)->
    #dropCfg {
    dropId = 6201,
    dropType = 0,
    dataId = 2003,
    probability = 10000,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1741)->
    #dropCfg {
    dropId = 6201,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1742)->
    #dropCfg {
    dropId = 6201,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1743)->
    #dropCfg {
    dropId = 6202,
    dropType = 0,
    dataId = 2003,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1744)->
    #dropCfg {
    dropId = 6202,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1745)->
    #dropCfg {
    dropId = 6202,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1746)->
    #dropCfg {
    dropId = 6203,
    dropType = 0,
    dataId = 2003,
    probability = 10000,
    min = 200,
    max = 200,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1747)->
    #dropCfg {
    dropId = 6203,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 200,
    max = 200,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1748)->
    #dropCfg {
    dropId = 6203,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    min = 200,
    max = 200,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1749)->
    #dropCfg {
    dropId = 6204,
    dropType = 0,
    dataId = 2003,
    probability = 10000,
    min = 150,
    max = 150,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1750)->
    #dropCfg {
    dropId = 6204,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 150,
    max = 150,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1751)->
    #dropCfg {
    dropId = 6204,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    min = 150,
    max = 150,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1752)->
    #dropCfg {
    dropId = 6205,
    dropType = 0,
    dataId = 2003,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1753)->
    #dropCfg {
    dropId = 6205,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1754)->
    #dropCfg {
    dropId = 6205,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1755)->
    #dropCfg {
    dropId = 6206,
    dropType = 0,
    dataId = 2003,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1756)->
    #dropCfg {
    dropId = 6206,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1757)->
    #dropCfg {
    dropId = 6206,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1758)->
    #dropCfg {
    dropId = 6207,
    dropType = 0,
    dataId = 2003,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1759)->
    #dropCfg {
    dropId = 6207,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1760)->
    #dropCfg {
    dropId = 6207,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1761)->
    #dropCfg {
    dropId = 6208,
    dropType = 0,
    dataId = 2003,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1762)->
    #dropCfg {
    dropId = 6208,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1763)->
    #dropCfg {
    dropId = 6208,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1764)->
    #dropCfg {
    dropId = 6209,
    dropType = 0,
    dataId = 2003,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1765)->
    #dropCfg {
    dropId = 6209,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1766)->
    #dropCfg {
    dropId = 6209,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1767)->
    #dropCfg {
    dropId = 6301,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1768)->
    #dropCfg {
    dropId = 6301,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1769)->
    #dropCfg {
    dropId = 6302,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1770)->
    #dropCfg {
    dropId = 6302,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1771)->
    #dropCfg {
    dropId = 6303,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1772)->
    #dropCfg {
    dropId = 6303,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1773)->
    #dropCfg {
    dropId = 6304,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1774)->
    #dropCfg {
    dropId = 6304,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1775)->
    #dropCfg {
    dropId = 6305,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1776)->
    #dropCfg {
    dropId = 6305,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1777)->
    #dropCfg {
    dropId = 6306,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1778)->
    #dropCfg {
    dropId = 6306,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 12,
    max = 12,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1779)->
    #dropCfg {
    dropId = 6307,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1780)->
    #dropCfg {
    dropId = 6307,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 14,
    max = 14,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1781)->
    #dropCfg {
    dropId = 6311,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1782)->
    #dropCfg {
    dropId = 6311,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1783)->
    #dropCfg {
    dropId = 6312,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1784)->
    #dropCfg {
    dropId = 6312,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1785)->
    #dropCfg {
    dropId = 6313,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1786)->
    #dropCfg {
    dropId = 6313,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1787)->
    #dropCfg {
    dropId = 6314,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1788)->
    #dropCfg {
    dropId = 6314,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1789)->
    #dropCfg {
    dropId = 6315,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1790)->
    #dropCfg {
    dropId = 6315,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1791)->
    #dropCfg {
    dropId = 6316,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1792)->
    #dropCfg {
    dropId = 6316,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 12,
    max = 12,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1793)->
    #dropCfg {
    dropId = 6317,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1794)->
    #dropCfg {
    dropId = 6317,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 14,
    max = 14,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1795)->
    #dropCfg {
    dropId = 6321,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1796)->
    #dropCfg {
    dropId = 6321,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1797)->
    #dropCfg {
    dropId = 6322,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1798)->
    #dropCfg {
    dropId = 6322,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1799)->
    #dropCfg {
    dropId = 6323,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1800)->
    #dropCfg {
    dropId = 6323,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1801)->
    #dropCfg {
    dropId = 6324,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1802)->
    #dropCfg {
    dropId = 6324,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1803)->
    #dropCfg {
    dropId = 6325,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1804)->
    #dropCfg {
    dropId = 6325,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1805)->
    #dropCfg {
    dropId = 6326,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1806)->
    #dropCfg {
    dropId = 6326,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 12,
    max = 12,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1807)->
    #dropCfg {
    dropId = 6327,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1808)->
    #dropCfg {
    dropId = 6327,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 14,
    max = 14,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1809)->
    #dropCfg {
    dropId = 6331,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1810)->
    #dropCfg {
    dropId = 6331,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1811)->
    #dropCfg {
    dropId = 6332,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1812)->
    #dropCfg {
    dropId = 6332,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1813)->
    #dropCfg {
    dropId = 6333,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1814)->
    #dropCfg {
    dropId = 6333,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1815)->
    #dropCfg {
    dropId = 6334,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1816)->
    #dropCfg {
    dropId = 6334,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1817)->
    #dropCfg {
    dropId = 6335,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1818)->
    #dropCfg {
    dropId = 6335,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1819)->
    #dropCfg {
    dropId = 6336,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1820)->
    #dropCfg {
    dropId = 6336,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 12,
    max = 12,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1821)->
    #dropCfg {
    dropId = 6337,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1822)->
    #dropCfg {
    dropId = 6337,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 14,
    max = 14,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1823)->
    #dropCfg {
    dropId = 6341,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1824)->
    #dropCfg {
    dropId = 6341,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1825)->
    #dropCfg {
    dropId = 6342,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1826)->
    #dropCfg {
    dropId = 6342,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1827)->
    #dropCfg {
    dropId = 6343,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1828)->
    #dropCfg {
    dropId = 6343,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1829)->
    #dropCfg {
    dropId = 6344,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1830)->
    #dropCfg {
    dropId = 6344,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1831)->
    #dropCfg {
    dropId = 6345,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1832)->
    #dropCfg {
    dropId = 6345,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1833)->
    #dropCfg {
    dropId = 6346,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1834)->
    #dropCfg {
    dropId = 6346,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 12,
    max = 12,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1835)->
    #dropCfg {
    dropId = 6347,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1836)->
    #dropCfg {
    dropId = 6347,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 14,
    max = 14,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1837)->
    #dropCfg {
    dropId = 6351,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1838)->
    #dropCfg {
    dropId = 6351,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1839)->
    #dropCfg {
    dropId = 6352,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1840)->
    #dropCfg {
    dropId = 6352,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1841)->
    #dropCfg {
    dropId = 6353,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1842)->
    #dropCfg {
    dropId = 6353,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1843)->
    #dropCfg {
    dropId = 6354,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1844)->
    #dropCfg {
    dropId = 6354,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1845)->
    #dropCfg {
    dropId = 6355,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1846)->
    #dropCfg {
    dropId = 6355,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1847)->
    #dropCfg {
    dropId = 6356,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1848)->
    #dropCfg {
    dropId = 6356,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 12,
    max = 12,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1849)->
    #dropCfg {
    dropId = 6357,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1850)->
    #dropCfg {
    dropId = 6357,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 14,
    max = 14,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1851)->
    #dropCfg {
    dropId = 6361,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1852)->
    #dropCfg {
    dropId = 6361,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1853)->
    #dropCfg {
    dropId = 6362,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1854)->
    #dropCfg {
    dropId = 6362,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1855)->
    #dropCfg {
    dropId = 6363,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1856)->
    #dropCfg {
    dropId = 6363,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1857)->
    #dropCfg {
    dropId = 6364,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1858)->
    #dropCfg {
    dropId = 6364,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1859)->
    #dropCfg {
    dropId = 6365,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1860)->
    #dropCfg {
    dropId = 6365,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1861)->
    #dropCfg {
    dropId = 6366,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1862)->
    #dropCfg {
    dropId = 6366,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 12,
    max = 12,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1863)->
    #dropCfg {
    dropId = 6367,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1864)->
    #dropCfg {
    dropId = 6367,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 14,
    max = 14,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1865)->
    #dropCfg {
    dropId = 6401,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1866)->
    #dropCfg {
    dropId = 6401,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1867)->
    #dropCfg {
    dropId = 6402,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1868)->
    #dropCfg {
    dropId = 6402,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1869)->
    #dropCfg {
    dropId = 6403,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 16,
    max = 16,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1870)->
    #dropCfg {
    dropId = 6403,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 12,
    max = 12,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1871)->
    #dropCfg {
    dropId = 6404,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1872)->
    #dropCfg {
    dropId = 6404,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 16,
    max = 16,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1873)->
    #dropCfg {
    dropId = 6405,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1874)->
    #dropCfg {
    dropId = 6405,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1875)->
    #dropCfg {
    dropId = 6406,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1876)->
    #dropCfg {
    dropId = 6406,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 24,
    max = 24,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1877)->
    #dropCfg {
    dropId = 6407,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 60,
    max = 60,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1878)->
    #dropCfg {
    dropId = 6407,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 28,
    max = 28,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1879)->
    #dropCfg {
    dropId = 6411,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1880)->
    #dropCfg {
    dropId = 6411,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1881)->
    #dropCfg {
    dropId = 6412,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1882)->
    #dropCfg {
    dropId = 6412,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1883)->
    #dropCfg {
    dropId = 6413,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 16,
    max = 16,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1884)->
    #dropCfg {
    dropId = 6413,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 12,
    max = 12,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1885)->
    #dropCfg {
    dropId = 6414,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1886)->
    #dropCfg {
    dropId = 6414,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 16,
    max = 16,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1887)->
    #dropCfg {
    dropId = 6415,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1888)->
    #dropCfg {
    dropId = 6415,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1889)->
    #dropCfg {
    dropId = 6416,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1890)->
    #dropCfg {
    dropId = 6416,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 24,
    max = 24,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1891)->
    #dropCfg {
    dropId = 6417,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 60,
    max = 60,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1892)->
    #dropCfg {
    dropId = 6417,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 28,
    max = 28,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1893)->
    #dropCfg {
    dropId = 6421,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1894)->
    #dropCfg {
    dropId = 6421,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1895)->
    #dropCfg {
    dropId = 6422,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1896)->
    #dropCfg {
    dropId = 6422,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1897)->
    #dropCfg {
    dropId = 6423,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 16,
    max = 16,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1898)->
    #dropCfg {
    dropId = 6423,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 12,
    max = 12,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1899)->
    #dropCfg {
    dropId = 6424,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1900)->
    #dropCfg {
    dropId = 6424,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 16,
    max = 16,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1901)->
    #dropCfg {
    dropId = 6425,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1902)->
    #dropCfg {
    dropId = 6425,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1903)->
    #dropCfg {
    dropId = 6426,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1904)->
    #dropCfg {
    dropId = 6426,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 24,
    max = 24,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1905)->
    #dropCfg {
    dropId = 6427,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 60,
    max = 60,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1906)->
    #dropCfg {
    dropId = 6427,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 28,
    max = 28,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1907)->
    #dropCfg {
    dropId = 6431,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1908)->
    #dropCfg {
    dropId = 6431,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1909)->
    #dropCfg {
    dropId = 6432,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1910)->
    #dropCfg {
    dropId = 6432,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1911)->
    #dropCfg {
    dropId = 6433,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 16,
    max = 16,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1912)->
    #dropCfg {
    dropId = 6433,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 12,
    max = 12,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1913)->
    #dropCfg {
    dropId = 6434,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1914)->
    #dropCfg {
    dropId = 6434,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 16,
    max = 16,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1915)->
    #dropCfg {
    dropId = 6435,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1916)->
    #dropCfg {
    dropId = 6435,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1917)->
    #dropCfg {
    dropId = 6436,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1918)->
    #dropCfg {
    dropId = 6436,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 24,
    max = 24,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1919)->
    #dropCfg {
    dropId = 6437,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 60,
    max = 60,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1920)->
    #dropCfg {
    dropId = 6437,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 28,
    max = 28,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1921)->
    #dropCfg {
    dropId = 6441,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1922)->
    #dropCfg {
    dropId = 6441,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1923)->
    #dropCfg {
    dropId = 6442,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1924)->
    #dropCfg {
    dropId = 6442,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1925)->
    #dropCfg {
    dropId = 6443,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1926)->
    #dropCfg {
    dropId = 6443,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 12,
    max = 12,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1927)->
    #dropCfg {
    dropId = 6444,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1928)->
    #dropCfg {
    dropId = 6444,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 16,
    max = 16,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1929)->
    #dropCfg {
    dropId = 6445,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1930)->
    #dropCfg {
    dropId = 6445,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1931)->
    #dropCfg {
    dropId = 6446,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1932)->
    #dropCfg {
    dropId = 6446,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 24,
    max = 24,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1933)->
    #dropCfg {
    dropId = 6447,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1934)->
    #dropCfg {
    dropId = 6447,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 28,
    max = 28,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1935)->
    #dropCfg {
    dropId = 6451,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1936)->
    #dropCfg {
    dropId = 6451,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1937)->
    #dropCfg {
    dropId = 6452,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1938)->
    #dropCfg {
    dropId = 6452,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1939)->
    #dropCfg {
    dropId = 6453,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1940)->
    #dropCfg {
    dropId = 6453,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 12,
    max = 12,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1941)->
    #dropCfg {
    dropId = 6454,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1942)->
    #dropCfg {
    dropId = 6454,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 16,
    max = 16,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1943)->
    #dropCfg {
    dropId = 6455,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1944)->
    #dropCfg {
    dropId = 6455,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1945)->
    #dropCfg {
    dropId = 6456,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1946)->
    #dropCfg {
    dropId = 6456,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 24,
    max = 24,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1947)->
    #dropCfg {
    dropId = 6457,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1948)->
    #dropCfg {
    dropId = 6457,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 28,
    max = 28,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1949)->
    #dropCfg {
    dropId = 6461,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1950)->
    #dropCfg {
    dropId = 6461,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1951)->
    #dropCfg {
    dropId = 6462,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1952)->
    #dropCfg {
    dropId = 6462,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1953)->
    #dropCfg {
    dropId = 6463,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1954)->
    #dropCfg {
    dropId = 6463,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 12,
    max = 12,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1955)->
    #dropCfg {
    dropId = 6464,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1956)->
    #dropCfg {
    dropId = 6464,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 16,
    max = 16,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1957)->
    #dropCfg {
    dropId = 6465,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1958)->
    #dropCfg {
    dropId = 6465,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1959)->
    #dropCfg {
    dropId = 6466,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1960)->
    #dropCfg {
    dropId = 6466,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 24,
    max = 24,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1961)->
    #dropCfg {
    dropId = 6467,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1962)->
    #dropCfg {
    dropId = 6467,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 28,
    max = 28,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1963)->
    #dropCfg {
    dropId = 6501,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1964)->
    #dropCfg {
    dropId = 6501,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1965)->
    #dropCfg {
    dropId = 6502,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1966)->
    #dropCfg {
    dropId = 6502,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1967)->
    #dropCfg {
    dropId = 6503,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1968)->
    #dropCfg {
    dropId = 6503,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1969)->
    #dropCfg {
    dropId = 6504,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1970)->
    #dropCfg {
    dropId = 6504,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1971)->
    #dropCfg {
    dropId = 6505,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1972)->
    #dropCfg {
    dropId = 6505,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1973)->
    #dropCfg {
    dropId = 6506,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1974)->
    #dropCfg {
    dropId = 6506,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1975)->
    #dropCfg {
    dropId = 6507,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1976)->
    #dropCfg {
    dropId = 6507,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1977)->
    #dropCfg {
    dropId = 6511,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1978)->
    #dropCfg {
    dropId = 6511,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1979)->
    #dropCfg {
    dropId = 6512,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1980)->
    #dropCfg {
    dropId = 6512,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1981)->
    #dropCfg {
    dropId = 6513,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1982)->
    #dropCfg {
    dropId = 6513,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1983)->
    #dropCfg {
    dropId = 6514,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1984)->
    #dropCfg {
    dropId = 6514,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1985)->
    #dropCfg {
    dropId = 6515,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1986)->
    #dropCfg {
    dropId = 6515,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1987)->
    #dropCfg {
    dropId = 6516,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1988)->
    #dropCfg {
    dropId = 6516,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1989)->
    #dropCfg {
    dropId = 6517,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1990)->
    #dropCfg {
    dropId = 6517,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1991)->
    #dropCfg {
    dropId = 6521,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1992)->
    #dropCfg {
    dropId = 6521,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1993)->
    #dropCfg {
    dropId = 6522,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1994)->
    #dropCfg {
    dropId = 6522,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1995)->
    #dropCfg {
    dropId = 6523,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1996)->
    #dropCfg {
    dropId = 6523,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1997)->
    #dropCfg {
    dropId = 6524,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1998)->
    #dropCfg {
    dropId = 6524,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(1999)->
    #dropCfg {
    dropId = 6525,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2000)->
    #dropCfg {
    dropId = 6525,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2001)->
    #dropCfg {
    dropId = 6526,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2002)->
    #dropCfg {
    dropId = 6526,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2003)->
    #dropCfg {
    dropId = 6527,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2004)->
    #dropCfg {
    dropId = 6527,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2005)->
    #dropCfg {
    dropId = 6531,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2006)->
    #dropCfg {
    dropId = 6531,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2007)->
    #dropCfg {
    dropId = 6532,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2008)->
    #dropCfg {
    dropId = 6532,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2009)->
    #dropCfg {
    dropId = 6533,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2010)->
    #dropCfg {
    dropId = 6533,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2011)->
    #dropCfg {
    dropId = 6534,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2012)->
    #dropCfg {
    dropId = 6534,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2013)->
    #dropCfg {
    dropId = 6535,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2014)->
    #dropCfg {
    dropId = 6535,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2015)->
    #dropCfg {
    dropId = 6536,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2016)->
    #dropCfg {
    dropId = 6536,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2017)->
    #dropCfg {
    dropId = 6537,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2018)->
    #dropCfg {
    dropId = 6537,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2019)->
    #dropCfg {
    dropId = 6541,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2020)->
    #dropCfg {
    dropId = 6541,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2021)->
    #dropCfg {
    dropId = 6542,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2022)->
    #dropCfg {
    dropId = 6542,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2023)->
    #dropCfg {
    dropId = 6543,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2024)->
    #dropCfg {
    dropId = 6543,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2025)->
    #dropCfg {
    dropId = 6544,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2026)->
    #dropCfg {
    dropId = 6544,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2027)->
    #dropCfg {
    dropId = 6545,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2028)->
    #dropCfg {
    dropId = 6545,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2029)->
    #dropCfg {
    dropId = 6546,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2030)->
    #dropCfg {
    dropId = 6546,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2031)->
    #dropCfg {
    dropId = 6547,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2032)->
    #dropCfg {
    dropId = 6547,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2033)->
    #dropCfg {
    dropId = 6551,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2034)->
    #dropCfg {
    dropId = 6551,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2035)->
    #dropCfg {
    dropId = 6552,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2036)->
    #dropCfg {
    dropId = 6552,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2037)->
    #dropCfg {
    dropId = 6553,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2038)->
    #dropCfg {
    dropId = 6553,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2039)->
    #dropCfg {
    dropId = 6554,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2040)->
    #dropCfg {
    dropId = 6554,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2041)->
    #dropCfg {
    dropId = 6555,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2042)->
    #dropCfg {
    dropId = 6555,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2043)->
    #dropCfg {
    dropId = 6556,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2044)->
    #dropCfg {
    dropId = 6556,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2045)->
    #dropCfg {
    dropId = 6557,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2046)->
    #dropCfg {
    dropId = 6557,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2047)->
    #dropCfg {
    dropId = 6561,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2048)->
    #dropCfg {
    dropId = 6561,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2049)->
    #dropCfg {
    dropId = 6562,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2050)->
    #dropCfg {
    dropId = 6562,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2051)->
    #dropCfg {
    dropId = 6563,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2052)->
    #dropCfg {
    dropId = 6563,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2053)->
    #dropCfg {
    dropId = 6564,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2054)->
    #dropCfg {
    dropId = 6564,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2055)->
    #dropCfg {
    dropId = 6565,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2056)->
    #dropCfg {
    dropId = 6565,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2057)->
    #dropCfg {
    dropId = 6566,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2058)->
    #dropCfg {
    dropId = 6566,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2059)->
    #dropCfg {
    dropId = 6567,
    dropType = 0,
    dataId = 1131,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2060)->
    #dropCfg {
    dropId = 6567,
    dropType = 0,
    dataId = 306,
    probability = 10000,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2061)->
    #dropCfg {
    dropId = 7000,
    dropType = 1,
    dataId = 70001,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2062)->
    #dropCfg {
    dropId = 7001,
    dropType = 1,
    dataId = 70011,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2063)->
    #dropCfg {
    dropId = 7002,
    dropType = 1,
    dataId = 70021,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2064)->
    #dropCfg {
    dropId = 7003,
    dropType = 1,
    dataId = 70031,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2065)->
    #dropCfg {
    dropId = 7004,
    dropType = 1,
    dataId = 70041,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2066)->
    #dropCfg {
    dropId = 7005,
    dropType = 1,
    dataId = 70051,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2067)->
    #dropCfg {
    dropId = 7006,
    dropType = 1,
    dataId = 70061,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2068)->
    #dropCfg {
    dropId = 7007,
    dropType = 1,
    dataId = 70071,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2069)->
    #dropCfg {
    dropId = 7008,
    dropType = 1,
    dataId = 70081,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2070)->
    #dropCfg {
    dropId = 7009,
    dropType = 1,
    dataId = 70091,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2071)->
    #dropCfg {
    dropId = 7010,
    dropType = 1,
    dataId = 70101,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2072)->
    #dropCfg {
    dropId = 7011,
    dropType = 1,
    dataId = 70111,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2073)->
    #dropCfg {
    dropId = 7012,
    dropType = 1,
    dataId = 70121,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2074)->
    #dropCfg {
    dropId = 7013,
    dropType = 1,
    dataId = 70131,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2075)->
    #dropCfg {
    dropId = 7014,
    dropType = 1,
    dataId = 70141,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2076)->
    #dropCfg {
    dropId = 7015,
    dropType = 1,
    dataId = 70151,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2077)->
    #dropCfg {
    dropId = 7016,
    dropType = 1,
    dataId = 70161,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2078)->
    #dropCfg {
    dropId = 7017,
    dropType = 1,
    dataId = 70171,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2079)->
    #dropCfg {
    dropId = 7018,
    dropType = 1,
    dataId = 70181,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2080)->
    #dropCfg {
    dropId = 7019,
    dropType = 1,
    dataId = 70191,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2081)->
    #dropCfg {
    dropId = 7020,
    dropType = 1,
    dataId = 70201,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2082)->
    #dropCfg {
    dropId = 7021,
    dropType = 1,
    dataId = 70211,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2083)->
    #dropCfg {
    dropId = 7022,
    dropType = 1,
    dataId = 70221,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2084)->
    #dropCfg {
    dropId = 7023,
    dropType = 1,
    dataId = 70231,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2085)->
    #dropCfg {
    dropId = 7024,
    dropType = 1,
    dataId = 70241,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2086)->
    #dropCfg {
    dropId = 7025,
    dropType = 1,
    dataId = 70251,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2087)->
    #dropCfg {
    dropId = 7026,
    dropType = 1,
    dataId = 70261,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2088)->
    #dropCfg {
    dropId = 7027,
    dropType = 1,
    dataId = 70271,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2089)->
    #dropCfg {
    dropId = 7028,
    dropType = 1,
    dataId = 70281,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2090)->
    #dropCfg {
    dropId = 7029,
    dropType = 1,
    dataId = 70291,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2091)->
    #dropCfg {
    dropId = 7030,
    dropType = 1,
    dataId = 70301,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2092)->
    #dropCfg {
    dropId = 7031,
    dropType = 1,
    dataId = 70311,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2093)->
    #dropCfg {
    dropId = 7032,
    dropType = 1,
    dataId = 70321,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2094)->
    #dropCfg {
    dropId = 7033,
    dropType = 1,
    dataId = 70331,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2095)->
    #dropCfg {
    dropId = 7034,
    dropType = 1,
    dataId = 70341,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2096)->
    #dropCfg {
    dropId = 7035,
    dropType = 1,
    dataId = 70351,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2097)->
    #dropCfg {
    dropId = 7036,
    dropType = 1,
    dataId = 70361,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2098)->
    #dropCfg {
    dropId = 8000,
    dropType = 1,
    dataId = 8000,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2099)->
    #dropCfg {
    dropId = 8001,
    dropType = 1,
    dataId = 8001,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2100)->
    #dropCfg {
    dropId = 8002,
    dropType = 1,
    dataId = 8002,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2101)->
    #dropCfg {
    dropId = 8003,
    dropType = 1,
    dataId = 8003,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2102)->
    #dropCfg {
    dropId = 8004,
    dropType = 1,
    dataId = 8004,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2103)->
    #dropCfg {
    dropId = 8005,
    dropType = 1,
    dataId = 8005,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2104)->
    #dropCfg {
    dropId = 8006,
    dropType = 1,
    dataId = 8006,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2105)->
    #dropCfg {
    dropId = 8007,
    dropType = 1,
    dataId = 8007,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2106)->
    #dropCfg {
    dropId = 8008,
    dropType = 1,
    dataId = 8008,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2107)->
    #dropCfg {
    dropId = 8009,
    dropType = 1,
    dataId = 8009,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2108)->
    #dropCfg {
    dropId = 8010,
    dropType = 0,
    dataId = 904,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2109)->
    #dropCfg {
    dropId = 8010,
    dropType = 1,
    dataId = 80100,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2110)->
    #dropCfg {
    dropId = 8010,
    dropType = 1,
    dataId = 80100,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2111)->
    #dropCfg {
    dropId = 8010,
    dropType = 1,
    dataId = 80100,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2112)->
    #dropCfg {
    dropId = 8010,
    dropType = 1,
    dataId = 80100,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2113)->
    #dropCfg {
    dropId = 8011,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2114)->
    #dropCfg {
    dropId = 8011,
    dropType = 1,
    dataId = 80110,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2115)->
    #dropCfg {
    dropId = 8011,
    dropType = 1,
    dataId = 80110,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2116)->
    #dropCfg {
    dropId = 8011,
    dropType = 1,
    dataId = 80110,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2117)->
    #dropCfg {
    dropId = 8011,
    dropType = 1,
    dataId = 80110,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2118)->
    #dropCfg {
    dropId = 8011,
    dropType = 1,
    dataId = 80110,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2119)->
    #dropCfg {
    dropId = 8011,
    dropType = 1,
    dataId = 80110,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2120)->
    #dropCfg {
    dropId = 8011,
    dropType = 1,
    dataId = 80110,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2121)->
    #dropCfg {
    dropId = 8011,
    dropType = 1,
    dataId = 80110,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2122)->
    #dropCfg {
    dropId = 8011,
    dropType = 1,
    dataId = 80110,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2123)->
    #dropCfg {
    dropId = 8011,
    dropType = 1,
    dataId = 80110,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2124)->
    #dropCfg {
    dropId = 8012,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2125)->
    #dropCfg {
    dropId = 8012,
    dropType = 1,
    dataId = 80120,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2126)->
    #dropCfg {
    dropId = 8013,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2127)->
    #dropCfg {
    dropId = 8013,
    dropType = 1,
    dataId = 80130,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2128)->
    #dropCfg {
    dropId = 8014,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2129)->
    #dropCfg {
    dropId = 8015,
    dropType = 0,
    dataId = 2102,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2130)->
    #dropCfg {
    dropId = 8016,
    dropType = 1,
    dataId = 80100,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2131)->
    #dropCfg {
    dropId = 8017,
    dropType = 1,
    dataId = 80100,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2132)->
    #dropCfg {
    dropId = 8018,
    dropType = 1,
    dataId = 80100,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2133)->
    #dropCfg {
    dropId = 8019,
    dropType = 1,
    dataId = 80100,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2134)->
    #dropCfg {
    dropId = 8020,
    dropType = 1,
    dataId = 80100,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2135)->
    #dropCfg {
    dropId = 8021,
    dropType = 1,
    dataId = 80100,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2136)->
    #dropCfg {
    dropId = 8500,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    min = 1,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2137)->
    #dropCfg {
    dropId = 8501,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    min = 1,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2138)->
    #dropCfg {
    dropId = 8502,
    dropType = 0,
    dataId = 426,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2139)->
    #dropCfg {
    dropId = 8502,
    dropType = 0,
    dataId = 427,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2140)->
    #dropCfg {
    dropId = 8502,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2141)->
    #dropCfg {
    dropId = 8502,
    dropType = 0,
    dataId = 4303,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2142)->
    #dropCfg {
    dropId = 8502,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2143)->
    #dropCfg {
    dropId = 8502,
    dropType = 0,
    dataId = 2102,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2144)->
    #dropCfg {
    dropId = 8502,
    dropType = 0,
    dataId = 2104,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2145)->
    #dropCfg {
    dropId = 8502,
    dropType = 0,
    dataId = 2105,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2146)->
    #dropCfg {
    dropId = 8502,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2147)->
    #dropCfg {
    dropId = 8502,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2148)->
    #dropCfg {
    dropId = 8502,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2149)->
    #dropCfg {
    dropId = 8502,
    dropType = 0,
    dataId = 10220,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2150)->
    #dropCfg {
    dropId = 8502,
    dropType = 0,
    dataId = 10221,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2151)->
    #dropCfg {
    dropId = 8502,
    dropType = 0,
    dataId = 10222,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2152)->
    #dropCfg {
    dropId = 9000,
    dropType = 1,
    dataId = 90000,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2153)->
    #dropCfg {
    dropId = 9001,
    dropType = 1,
    dataId = 90010,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2154)->
    #dropCfg {
    dropId = 9002,
    dropType = 1,
    dataId = 90020,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2155)->
    #dropCfg {
    dropId = 9003,
    dropType = 1,
    dataId = 90030,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2156)->
    #dropCfg {
    dropId = 9004,
    dropType = 1,
    dataId = 90040,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2157)->
    #dropCfg {
    dropId = 9005,
    dropType = 1,
    dataId = 90050,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2158)->
    #dropCfg {
    dropId = 9006,
    dropType = 1,
    dataId = 90060,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2159)->
    #dropCfg {
    dropId = 9007,
    dropType = 1,
    dataId = 90070,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2160)->
    #dropCfg {
    dropId = 10001,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2161)->
    #dropCfg {
    dropId = 10001,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2162)->
    #dropCfg {
    dropId = 10001,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2163)->
    #dropCfg {
    dropId = 10001,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2164)->
    #dropCfg {
    dropId = 10001,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2165)->
    #dropCfg {
    dropId = 10002,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2166)->
    #dropCfg {
    dropId = 10002,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2167)->
    #dropCfg {
    dropId = 10002,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2168)->
    #dropCfg {
    dropId = 10002,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2169)->
    #dropCfg {
    dropId = 10002,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2170)->
    #dropCfg {
    dropId = 10003,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2171)->
    #dropCfg {
    dropId = 10003,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2172)->
    #dropCfg {
    dropId = 10003,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2173)->
    #dropCfg {
    dropId = 10003,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2174)->
    #dropCfg {
    dropId = 10003,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2175)->
    #dropCfg {
    dropId = 10004,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2176)->
    #dropCfg {
    dropId = 10004,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2177)->
    #dropCfg {
    dropId = 10004,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2178)->
    #dropCfg {
    dropId = 10004,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2179)->
    #dropCfg {
    dropId = 10004,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2180)->
    #dropCfg {
    dropId = 10005,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2181)->
    #dropCfg {
    dropId = 10005,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2182)->
    #dropCfg {
    dropId = 10005,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2183)->
    #dropCfg {
    dropId = 10005,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2184)->
    #dropCfg {
    dropId = 10005,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2185)->
    #dropCfg {
    dropId = 10006,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2186)->
    #dropCfg {
    dropId = 10006,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2187)->
    #dropCfg {
    dropId = 10006,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2188)->
    #dropCfg {
    dropId = 10006,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2189)->
    #dropCfg {
    dropId = 10006,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2190)->
    #dropCfg {
    dropId = 10007,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2191)->
    #dropCfg {
    dropId = 10007,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2192)->
    #dropCfg {
    dropId = 10007,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2193)->
    #dropCfg {
    dropId = 10007,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2194)->
    #dropCfg {
    dropId = 10007,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2195)->
    #dropCfg {
    dropId = 10008,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2196)->
    #dropCfg {
    dropId = 10008,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2197)->
    #dropCfg {
    dropId = 10008,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2198)->
    #dropCfg {
    dropId = 10008,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2199)->
    #dropCfg {
    dropId = 10008,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2200)->
    #dropCfg {
    dropId = 10009,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2201)->
    #dropCfg {
    dropId = 10009,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2202)->
    #dropCfg {
    dropId = 10009,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2203)->
    #dropCfg {
    dropId = 10009,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2204)->
    #dropCfg {
    dropId = 10009,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2205)->
    #dropCfg {
    dropId = 10010,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2206)->
    #dropCfg {
    dropId = 10010,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2207)->
    #dropCfg {
    dropId = 10010,
    dropType = 0,
    dataId = 1912,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2208)->
    #dropCfg {
    dropId = 10010,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2209)->
    #dropCfg {
    dropId = 10010,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2210)->
    #dropCfg {
    dropId = 10010,
    dropType = 0,
    dataId = 11000,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11000
    };
getRow(2211)->
    #dropCfg {
    dropId = 10010,
    dropType = 0,
    dataId = 11010,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11010
    };
getRow(2212)->
    #dropCfg {
    dropId = 10011,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2213)->
    #dropCfg {
    dropId = 10011,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2214)->
    #dropCfg {
    dropId = 10011,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2215)->
    #dropCfg {
    dropId = 10011,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2216)->
    #dropCfg {
    dropId = 10011,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2217)->
    #dropCfg {
    dropId = 10012,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2218)->
    #dropCfg {
    dropId = 10012,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2219)->
    #dropCfg {
    dropId = 10012,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2220)->
    #dropCfg {
    dropId = 10012,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2221)->
    #dropCfg {
    dropId = 10012,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2222)->
    #dropCfg {
    dropId = 10013,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2223)->
    #dropCfg {
    dropId = 10013,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2224)->
    #dropCfg {
    dropId = 10013,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2225)->
    #dropCfg {
    dropId = 10013,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2226)->
    #dropCfg {
    dropId = 10013,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2227)->
    #dropCfg {
    dropId = 10014,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2228)->
    #dropCfg {
    dropId = 10014,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2229)->
    #dropCfg {
    dropId = 10014,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2230)->
    #dropCfg {
    dropId = 10014,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2231)->
    #dropCfg {
    dropId = 10014,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2232)->
    #dropCfg {
    dropId = 10015,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2233)->
    #dropCfg {
    dropId = 10015,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2234)->
    #dropCfg {
    dropId = 10015,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2235)->
    #dropCfg {
    dropId = 10015,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2236)->
    #dropCfg {
    dropId = 10015,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2237)->
    #dropCfg {
    dropId = 10016,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2238)->
    #dropCfg {
    dropId = 10016,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2239)->
    #dropCfg {
    dropId = 10016,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2240)->
    #dropCfg {
    dropId = 10016,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2241)->
    #dropCfg {
    dropId = 10016,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2242)->
    #dropCfg {
    dropId = 10017,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2243)->
    #dropCfg {
    dropId = 10017,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2244)->
    #dropCfg {
    dropId = 10017,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2245)->
    #dropCfg {
    dropId = 10017,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2246)->
    #dropCfg {
    dropId = 10017,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2247)->
    #dropCfg {
    dropId = 10018,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2248)->
    #dropCfg {
    dropId = 10018,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2249)->
    #dropCfg {
    dropId = 10018,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2250)->
    #dropCfg {
    dropId = 10018,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2251)->
    #dropCfg {
    dropId = 10018,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2252)->
    #dropCfg {
    dropId = 10019,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2253)->
    #dropCfg {
    dropId = 10019,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2254)->
    #dropCfg {
    dropId = 10019,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2255)->
    #dropCfg {
    dropId = 10019,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2256)->
    #dropCfg {
    dropId = 10019,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2257)->
    #dropCfg {
    dropId = 10020,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2258)->
    #dropCfg {
    dropId = 10020,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2259)->
    #dropCfg {
    dropId = 10020,
    dropType = 0,
    dataId = 1924,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2260)->
    #dropCfg {
    dropId = 10020,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2261)->
    #dropCfg {
    dropId = 10020,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2262)->
    #dropCfg {
    dropId = 10020,
    dropType = 0,
    dataId = 11000,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11000
    };
getRow(2263)->
    #dropCfg {
    dropId = 10020,
    dropType = 0,
    dataId = 11010,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11010
    };
getRow(2264)->
    #dropCfg {
    dropId = 10021,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2265)->
    #dropCfg {
    dropId = 10021,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2266)->
    #dropCfg {
    dropId = 10021,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2267)->
    #dropCfg {
    dropId = 10021,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2268)->
    #dropCfg {
    dropId = 10021,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2269)->
    #dropCfg {
    dropId = 10022,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2270)->
    #dropCfg {
    dropId = 10022,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2271)->
    #dropCfg {
    dropId = 10022,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2272)->
    #dropCfg {
    dropId = 10022,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2273)->
    #dropCfg {
    dropId = 10022,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2274)->
    #dropCfg {
    dropId = 10023,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2275)->
    #dropCfg {
    dropId = 10023,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2276)->
    #dropCfg {
    dropId = 10023,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2277)->
    #dropCfg {
    dropId = 10023,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2278)->
    #dropCfg {
    dropId = 10023,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2279)->
    #dropCfg {
    dropId = 10024,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2280)->
    #dropCfg {
    dropId = 10024,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2281)->
    #dropCfg {
    dropId = 10024,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2282)->
    #dropCfg {
    dropId = 10024,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2283)->
    #dropCfg {
    dropId = 10024,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2284)->
    #dropCfg {
    dropId = 10025,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2285)->
    #dropCfg {
    dropId = 10025,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2286)->
    #dropCfg {
    dropId = 10025,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2287)->
    #dropCfg {
    dropId = 10025,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2288)->
    #dropCfg {
    dropId = 10025,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2289)->
    #dropCfg {
    dropId = 10026,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2290)->
    #dropCfg {
    dropId = 10026,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2291)->
    #dropCfg {
    dropId = 10026,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2292)->
    #dropCfg {
    dropId = 10026,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2293)->
    #dropCfg {
    dropId = 10026,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2294)->
    #dropCfg {
    dropId = 10027,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2295)->
    #dropCfg {
    dropId = 10027,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2296)->
    #dropCfg {
    dropId = 10027,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2297)->
    #dropCfg {
    dropId = 10027,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2298)->
    #dropCfg {
    dropId = 10027,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2299)->
    #dropCfg {
    dropId = 10028,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2300)->
    #dropCfg {
    dropId = 10028,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2301)->
    #dropCfg {
    dropId = 10028,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2302)->
    #dropCfg {
    dropId = 10028,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2303)->
    #dropCfg {
    dropId = 10028,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2304)->
    #dropCfg {
    dropId = 10029,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2305)->
    #dropCfg {
    dropId = 10029,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2306)->
    #dropCfg {
    dropId = 10029,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2307)->
    #dropCfg {
    dropId = 10029,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2308)->
    #dropCfg {
    dropId = 10029,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2309)->
    #dropCfg {
    dropId = 10030,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2310)->
    #dropCfg {
    dropId = 10030,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2311)->
    #dropCfg {
    dropId = 10030,
    dropType = 0,
    dataId = 1923,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2312)->
    #dropCfg {
    dropId = 10030,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2313)->
    #dropCfg {
    dropId = 10030,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2314)->
    #dropCfg {
    dropId = 10030,
    dropType = 0,
    dataId = 11000,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11000
    };
getRow(2315)->
    #dropCfg {
    dropId = 10030,
    dropType = 0,
    dataId = 11010,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11010
    };
getRow(2316)->
    #dropCfg {
    dropId = 10031,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2317)->
    #dropCfg {
    dropId = 10031,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2318)->
    #dropCfg {
    dropId = 10031,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2319)->
    #dropCfg {
    dropId = 10031,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2320)->
    #dropCfg {
    dropId = 10031,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2321)->
    #dropCfg {
    dropId = 10032,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2322)->
    #dropCfg {
    dropId = 10032,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2323)->
    #dropCfg {
    dropId = 10032,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2324)->
    #dropCfg {
    dropId = 10032,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2325)->
    #dropCfg {
    dropId = 10032,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2326)->
    #dropCfg {
    dropId = 10033,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2327)->
    #dropCfg {
    dropId = 10033,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2328)->
    #dropCfg {
    dropId = 10033,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2329)->
    #dropCfg {
    dropId = 10033,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2330)->
    #dropCfg {
    dropId = 10033,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2331)->
    #dropCfg {
    dropId = 10034,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2332)->
    #dropCfg {
    dropId = 10034,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2333)->
    #dropCfg {
    dropId = 10034,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2334)->
    #dropCfg {
    dropId = 10034,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2335)->
    #dropCfg {
    dropId = 10034,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2336)->
    #dropCfg {
    dropId = 10035,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2337)->
    #dropCfg {
    dropId = 10035,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2338)->
    #dropCfg {
    dropId = 10035,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2339)->
    #dropCfg {
    dropId = 10035,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2340)->
    #dropCfg {
    dropId = 10035,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2341)->
    #dropCfg {
    dropId = 10036,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2342)->
    #dropCfg {
    dropId = 10036,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2343)->
    #dropCfg {
    dropId = 10036,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2344)->
    #dropCfg {
    dropId = 10036,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2345)->
    #dropCfg {
    dropId = 10036,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2346)->
    #dropCfg {
    dropId = 10037,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2347)->
    #dropCfg {
    dropId = 10037,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2348)->
    #dropCfg {
    dropId = 10037,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2349)->
    #dropCfg {
    dropId = 10037,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2350)->
    #dropCfg {
    dropId = 10037,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2351)->
    #dropCfg {
    dropId = 10038,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2352)->
    #dropCfg {
    dropId = 10038,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2353)->
    #dropCfg {
    dropId = 10038,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2354)->
    #dropCfg {
    dropId = 10038,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2355)->
    #dropCfg {
    dropId = 10038,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2356)->
    #dropCfg {
    dropId = 10039,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2357)->
    #dropCfg {
    dropId = 10039,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2358)->
    #dropCfg {
    dropId = 10039,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2359)->
    #dropCfg {
    dropId = 10039,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2360)->
    #dropCfg {
    dropId = 10039,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2361)->
    #dropCfg {
    dropId = 10040,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2362)->
    #dropCfg {
    dropId = 10040,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2363)->
    #dropCfg {
    dropId = 10040,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2364)->
    #dropCfg {
    dropId = 10040,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2365)->
    #dropCfg {
    dropId = 10040,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2366)->
    #dropCfg {
    dropId = 10040,
    dropType = 0,
    dataId = 11000,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11000
    };
getRow(2367)->
    #dropCfg {
    dropId = 10040,
    dropType = 0,
    dataId = 11010,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11010
    };
getRow(2368)->
    #dropCfg {
    dropId = 10041,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2369)->
    #dropCfg {
    dropId = 10041,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2370)->
    #dropCfg {
    dropId = 10041,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2371)->
    #dropCfg {
    dropId = 10041,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2372)->
    #dropCfg {
    dropId = 10041,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2373)->
    #dropCfg {
    dropId = 10042,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2374)->
    #dropCfg {
    dropId = 10042,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2375)->
    #dropCfg {
    dropId = 10042,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2376)->
    #dropCfg {
    dropId = 10042,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2377)->
    #dropCfg {
    dropId = 10042,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2378)->
    #dropCfg {
    dropId = 10043,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2379)->
    #dropCfg {
    dropId = 10043,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2380)->
    #dropCfg {
    dropId = 10043,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2381)->
    #dropCfg {
    dropId = 10043,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2382)->
    #dropCfg {
    dropId = 10043,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2383)->
    #dropCfg {
    dropId = 10044,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2384)->
    #dropCfg {
    dropId = 10044,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2385)->
    #dropCfg {
    dropId = 10044,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2386)->
    #dropCfg {
    dropId = 10044,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2387)->
    #dropCfg {
    dropId = 10044,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2388)->
    #dropCfg {
    dropId = 10045,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2389)->
    #dropCfg {
    dropId = 10045,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2390)->
    #dropCfg {
    dropId = 10045,
    dropType = 0,
    dataId = 1902,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2391)->
    #dropCfg {
    dropId = 10045,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2392)->
    #dropCfg {
    dropId = 10045,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2393)->
    #dropCfg {
    dropId = 10046,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2394)->
    #dropCfg {
    dropId = 10046,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2395)->
    #dropCfg {
    dropId = 10046,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2396)->
    #dropCfg {
    dropId = 10046,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2397)->
    #dropCfg {
    dropId = 10046,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2398)->
    #dropCfg {
    dropId = 10047,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2399)->
    #dropCfg {
    dropId = 10047,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2400)->
    #dropCfg {
    dropId = 10047,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2401)->
    #dropCfg {
    dropId = 10047,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2402)->
    #dropCfg {
    dropId = 10047,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2403)->
    #dropCfg {
    dropId = 10048,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2404)->
    #dropCfg {
    dropId = 10048,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2405)->
    #dropCfg {
    dropId = 10048,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2406)->
    #dropCfg {
    dropId = 10048,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2407)->
    #dropCfg {
    dropId = 10048,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2408)->
    #dropCfg {
    dropId = 10049,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2409)->
    #dropCfg {
    dropId = 10049,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2410)->
    #dropCfg {
    dropId = 10049,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2411)->
    #dropCfg {
    dropId = 10049,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2412)->
    #dropCfg {
    dropId = 10049,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2413)->
    #dropCfg {
    dropId = 10050,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2414)->
    #dropCfg {
    dropId = 10050,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2415)->
    #dropCfg {
    dropId = 10050,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2416)->
    #dropCfg {
    dropId = 10050,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2417)->
    #dropCfg {
    dropId = 10050,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2418)->
    #dropCfg {
    dropId = 10050,
    dropType = 0,
    dataId = 11000,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11000
    };
getRow(2419)->
    #dropCfg {
    dropId = 10050,
    dropType = 0,
    dataId = 11010,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11010
    };
getRow(2420)->
    #dropCfg {
    dropId = 10051,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2421)->
    #dropCfg {
    dropId = 10051,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2422)->
    #dropCfg {
    dropId = 10051,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2423)->
    #dropCfg {
    dropId = 10051,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2424)->
    #dropCfg {
    dropId = 10051,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2425)->
    #dropCfg {
    dropId = 10052,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2426)->
    #dropCfg {
    dropId = 10052,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2427)->
    #dropCfg {
    dropId = 10052,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2428)->
    #dropCfg {
    dropId = 10052,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2429)->
    #dropCfg {
    dropId = 10052,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2430)->
    #dropCfg {
    dropId = 10053,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2431)->
    #dropCfg {
    dropId = 10053,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2432)->
    #dropCfg {
    dropId = 10053,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2433)->
    #dropCfg {
    dropId = 10053,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2434)->
    #dropCfg {
    dropId = 10053,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2435)->
    #dropCfg {
    dropId = 10054,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2436)->
    #dropCfg {
    dropId = 10054,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2437)->
    #dropCfg {
    dropId = 10054,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2438)->
    #dropCfg {
    dropId = 10054,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2439)->
    #dropCfg {
    dropId = 10054,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2440)->
    #dropCfg {
    dropId = 10055,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2441)->
    #dropCfg {
    dropId = 10055,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2442)->
    #dropCfg {
    dropId = 10055,
    dropType = 0,
    dataId = 1911,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2443)->
    #dropCfg {
    dropId = 10055,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2444)->
    #dropCfg {
    dropId = 10055,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2445)->
    #dropCfg {
    dropId = 10056,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2446)->
    #dropCfg {
    dropId = 10056,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2447)->
    #dropCfg {
    dropId = 10056,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2448)->
    #dropCfg {
    dropId = 10056,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2449)->
    #dropCfg {
    dropId = 10056,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2450)->
    #dropCfg {
    dropId = 10057,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2451)->
    #dropCfg {
    dropId = 10057,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2452)->
    #dropCfg {
    dropId = 10057,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2453)->
    #dropCfg {
    dropId = 10057,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2454)->
    #dropCfg {
    dropId = 10057,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2455)->
    #dropCfg {
    dropId = 10058,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2456)->
    #dropCfg {
    dropId = 10058,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2457)->
    #dropCfg {
    dropId = 10058,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2458)->
    #dropCfg {
    dropId = 10058,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2459)->
    #dropCfg {
    dropId = 10058,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2460)->
    #dropCfg {
    dropId = 10059,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2461)->
    #dropCfg {
    dropId = 10059,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2462)->
    #dropCfg {
    dropId = 10059,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2463)->
    #dropCfg {
    dropId = 10059,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2464)->
    #dropCfg {
    dropId = 10059,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2465)->
    #dropCfg {
    dropId = 10060,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2466)->
    #dropCfg {
    dropId = 10060,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2467)->
    #dropCfg {
    dropId = 10060,
    dropType = 0,
    dataId = 1914,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2468)->
    #dropCfg {
    dropId = 10060,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2469)->
    #dropCfg {
    dropId = 10060,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2470)->
    #dropCfg {
    dropId = 10060,
    dropType = 0,
    dataId = 11000,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11000
    };
getRow(2471)->
    #dropCfg {
    dropId = 10060,
    dropType = 0,
    dataId = 11010,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11010
    };
getRow(2472)->
    #dropCfg {
    dropId = 10061,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2473)->
    #dropCfg {
    dropId = 10061,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2474)->
    #dropCfg {
    dropId = 10061,
    dropType = 0,
    dataId = 1902,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2475)->
    #dropCfg {
    dropId = 10061,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2476)->
    #dropCfg {
    dropId = 10061,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2477)->
    #dropCfg {
    dropId = 10062,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2478)->
    #dropCfg {
    dropId = 10062,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2479)->
    #dropCfg {
    dropId = 10062,
    dropType = 0,
    dataId = 1902,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2480)->
    #dropCfg {
    dropId = 10062,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2481)->
    #dropCfg {
    dropId = 10062,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2482)->
    #dropCfg {
    dropId = 10063,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2483)->
    #dropCfg {
    dropId = 10063,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2484)->
    #dropCfg {
    dropId = 10063,
    dropType = 0,
    dataId = 1902,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2485)->
    #dropCfg {
    dropId = 10063,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2486)->
    #dropCfg {
    dropId = 10063,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2487)->
    #dropCfg {
    dropId = 10064,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2488)->
    #dropCfg {
    dropId = 10064,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2489)->
    #dropCfg {
    dropId = 10064,
    dropType = 0,
    dataId = 1902,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2490)->
    #dropCfg {
    dropId = 10064,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2491)->
    #dropCfg {
    dropId = 10064,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2492)->
    #dropCfg {
    dropId = 10065,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2493)->
    #dropCfg {
    dropId = 10065,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2494)->
    #dropCfg {
    dropId = 10065,
    dropType = 0,
    dataId = 1921,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2495)->
    #dropCfg {
    dropId = 10065,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2496)->
    #dropCfg {
    dropId = 10065,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2497)->
    #dropCfg {
    dropId = 10066,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2498)->
    #dropCfg {
    dropId = 10066,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2499)->
    #dropCfg {
    dropId = 10066,
    dropType = 0,
    dataId = 1912,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2500)->
    #dropCfg {
    dropId = 10066,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2501)->
    #dropCfg {
    dropId = 10066,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2502)->
    #dropCfg {
    dropId = 10067,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2503)->
    #dropCfg {
    dropId = 10067,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2504)->
    #dropCfg {
    dropId = 10067,
    dropType = 0,
    dataId = 1912,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2505)->
    #dropCfg {
    dropId = 10067,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2506)->
    #dropCfg {
    dropId = 10067,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2507)->
    #dropCfg {
    dropId = 10068,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2508)->
    #dropCfg {
    dropId = 10068,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2509)->
    #dropCfg {
    dropId = 10068,
    dropType = 0,
    dataId = 1912,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2510)->
    #dropCfg {
    dropId = 10068,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2511)->
    #dropCfg {
    dropId = 10068,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2512)->
    #dropCfg {
    dropId = 10069,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2513)->
    #dropCfg {
    dropId = 10069,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2514)->
    #dropCfg {
    dropId = 10069,
    dropType = 0,
    dataId = 1912,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2515)->
    #dropCfg {
    dropId = 10069,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2516)->
    #dropCfg {
    dropId = 10069,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2517)->
    #dropCfg {
    dropId = 10070,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2518)->
    #dropCfg {
    dropId = 10070,
    dropType = 0,
    dataId = 1912,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2519)->
    #dropCfg {
    dropId = 10070,
    dropType = 0,
    dataId = 1919,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2520)->
    #dropCfg {
    dropId = 10070,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2521)->
    #dropCfg {
    dropId = 10070,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2522)->
    #dropCfg {
    dropId = 10070,
    dropType = 0,
    dataId = 11000,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11000
    };
getRow(2523)->
    #dropCfg {
    dropId = 10070,
    dropType = 0,
    dataId = 11010,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11010
    };
getRow(2524)->
    #dropCfg {
    dropId = 10071,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2525)->
    #dropCfg {
    dropId = 10071,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2526)->
    #dropCfg {
    dropId = 10071,
    dropType = 0,
    dataId = 1908,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2527)->
    #dropCfg {
    dropId = 10071,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2528)->
    #dropCfg {
    dropId = 10071,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2529)->
    #dropCfg {
    dropId = 10072,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2530)->
    #dropCfg {
    dropId = 10072,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2531)->
    #dropCfg {
    dropId = 10072,
    dropType = 0,
    dataId = 1908,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2532)->
    #dropCfg {
    dropId = 10072,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2533)->
    #dropCfg {
    dropId = 10072,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2534)->
    #dropCfg {
    dropId = 10073,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2535)->
    #dropCfg {
    dropId = 10073,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2536)->
    #dropCfg {
    dropId = 10073,
    dropType = 0,
    dataId = 1908,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2537)->
    #dropCfg {
    dropId = 10073,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2538)->
    #dropCfg {
    dropId = 10073,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2539)->
    #dropCfg {
    dropId = 10074,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2540)->
    #dropCfg {
    dropId = 10074,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2541)->
    #dropCfg {
    dropId = 10074,
    dropType = 0,
    dataId = 1908,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2542)->
    #dropCfg {
    dropId = 10074,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2543)->
    #dropCfg {
    dropId = 10074,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2544)->
    #dropCfg {
    dropId = 10075,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2545)->
    #dropCfg {
    dropId = 10075,
    dropType = 0,
    dataId = 1908,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2546)->
    #dropCfg {
    dropId = 10075,
    dropType = 0,
    dataId = 1910,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2547)->
    #dropCfg {
    dropId = 10075,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2548)->
    #dropCfg {
    dropId = 10075,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2549)->
    #dropCfg {
    dropId = 10076,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2550)->
    #dropCfg {
    dropId = 10076,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2551)->
    #dropCfg {
    dropId = 10076,
    dropType = 0,
    dataId = 1924,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2552)->
    #dropCfg {
    dropId = 10076,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2553)->
    #dropCfg {
    dropId = 10076,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2554)->
    #dropCfg {
    dropId = 10077,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2555)->
    #dropCfg {
    dropId = 10077,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2556)->
    #dropCfg {
    dropId = 10077,
    dropType = 0,
    dataId = 1924,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2557)->
    #dropCfg {
    dropId = 10077,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2558)->
    #dropCfg {
    dropId = 10077,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2559)->
    #dropCfg {
    dropId = 10078,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2560)->
    #dropCfg {
    dropId = 10078,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2561)->
    #dropCfg {
    dropId = 10078,
    dropType = 0,
    dataId = 1924,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2562)->
    #dropCfg {
    dropId = 10078,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2563)->
    #dropCfg {
    dropId = 10078,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2564)->
    #dropCfg {
    dropId = 10079,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2565)->
    #dropCfg {
    dropId = 10079,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2566)->
    #dropCfg {
    dropId = 10079,
    dropType = 0,
    dataId = 1924,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2567)->
    #dropCfg {
    dropId = 10079,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2568)->
    #dropCfg {
    dropId = 10079,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2569)->
    #dropCfg {
    dropId = 10080,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2570)->
    #dropCfg {
    dropId = 10080,
    dropType = 0,
    dataId = 1924,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2571)->
    #dropCfg {
    dropId = 10080,
    dropType = 0,
    dataId = 1909,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2572)->
    #dropCfg {
    dropId = 10080,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2573)->
    #dropCfg {
    dropId = 10080,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2574)->
    #dropCfg {
    dropId = 10080,
    dropType = 0,
    dataId = 11000,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11000
    };
getRow(2575)->
    #dropCfg {
    dropId = 10080,
    dropType = 0,
    dataId = 11010,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11010
    };
getRow(2576)->
    #dropCfg {
    dropId = 10081,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2577)->
    #dropCfg {
    dropId = 10081,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2578)->
    #dropCfg {
    dropId = 10081,
    dropType = 0,
    dataId = 1911,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2579)->
    #dropCfg {
    dropId = 10081,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2580)->
    #dropCfg {
    dropId = 10081,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2581)->
    #dropCfg {
    dropId = 10082,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2582)->
    #dropCfg {
    dropId = 10082,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2583)->
    #dropCfg {
    dropId = 10082,
    dropType = 0,
    dataId = 1911,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2584)->
    #dropCfg {
    dropId = 10082,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2585)->
    #dropCfg {
    dropId = 10082,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2586)->
    #dropCfg {
    dropId = 10083,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2587)->
    #dropCfg {
    dropId = 10083,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2588)->
    #dropCfg {
    dropId = 10083,
    dropType = 0,
    dataId = 1911,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2589)->
    #dropCfg {
    dropId = 10083,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2590)->
    #dropCfg {
    dropId = 10083,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2591)->
    #dropCfg {
    dropId = 10084,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2592)->
    #dropCfg {
    dropId = 10084,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2593)->
    #dropCfg {
    dropId = 10084,
    dropType = 0,
    dataId = 1911,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2594)->
    #dropCfg {
    dropId = 10084,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2595)->
    #dropCfg {
    dropId = 10084,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2596)->
    #dropCfg {
    dropId = 10085,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2597)->
    #dropCfg {
    dropId = 10085,
    dropType = 0,
    dataId = 1911,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2598)->
    #dropCfg {
    dropId = 10085,
    dropType = 0,
    dataId = 1906,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2599)->
    #dropCfg {
    dropId = 10085,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2600)->
    #dropCfg {
    dropId = 10085,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2601)->
    #dropCfg {
    dropId = 10086,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2602)->
    #dropCfg {
    dropId = 10086,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2603)->
    #dropCfg {
    dropId = 10086,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2604)->
    #dropCfg {
    dropId = 10086,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2605)->
    #dropCfg {
    dropId = 10086,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2606)->
    #dropCfg {
    dropId = 10087,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2607)->
    #dropCfg {
    dropId = 10087,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2608)->
    #dropCfg {
    dropId = 10087,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2609)->
    #dropCfg {
    dropId = 10087,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2610)->
    #dropCfg {
    dropId = 10087,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2611)->
    #dropCfg {
    dropId = 10088,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2612)->
    #dropCfg {
    dropId = 10088,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2613)->
    #dropCfg {
    dropId = 10088,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2614)->
    #dropCfg {
    dropId = 10088,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2615)->
    #dropCfg {
    dropId = 10088,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2616)->
    #dropCfg {
    dropId = 10089,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2617)->
    #dropCfg {
    dropId = 10089,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2618)->
    #dropCfg {
    dropId = 10089,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2619)->
    #dropCfg {
    dropId = 10089,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2620)->
    #dropCfg {
    dropId = 10089,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2621)->
    #dropCfg {
    dropId = 10090,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2622)->
    #dropCfg {
    dropId = 10090,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2623)->
    #dropCfg {
    dropId = 10090,
    dropType = 0,
    dataId = 1929,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2624)->
    #dropCfg {
    dropId = 10090,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2625)->
    #dropCfg {
    dropId = 10090,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2626)->
    #dropCfg {
    dropId = 10090,
    dropType = 0,
    dataId = 11000,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11000
    };
getRow(2627)->
    #dropCfg {
    dropId = 10090,
    dropType = 0,
    dataId = 11010,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11010
    };
getRow(2628)->
    #dropCfg {
    dropId = 10091,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2629)->
    #dropCfg {
    dropId = 10091,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2630)->
    #dropCfg {
    dropId = 10091,
    dropType = 0,
    dataId = 1919,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2631)->
    #dropCfg {
    dropId = 10091,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2632)->
    #dropCfg {
    dropId = 10091,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2633)->
    #dropCfg {
    dropId = 10092,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2634)->
    #dropCfg {
    dropId = 10092,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2635)->
    #dropCfg {
    dropId = 10092,
    dropType = 0,
    dataId = 1919,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2636)->
    #dropCfg {
    dropId = 10092,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2637)->
    #dropCfg {
    dropId = 10092,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2638)->
    #dropCfg {
    dropId = 10093,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2639)->
    #dropCfg {
    dropId = 10093,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2640)->
    #dropCfg {
    dropId = 10093,
    dropType = 0,
    dataId = 1919,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2641)->
    #dropCfg {
    dropId = 10093,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2642)->
    #dropCfg {
    dropId = 10093,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2643)->
    #dropCfg {
    dropId = 10094,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2644)->
    #dropCfg {
    dropId = 10094,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2645)->
    #dropCfg {
    dropId = 10094,
    dropType = 0,
    dataId = 1919,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2646)->
    #dropCfg {
    dropId = 10094,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2647)->
    #dropCfg {
    dropId = 10094,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2648)->
    #dropCfg {
    dropId = 10095,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2649)->
    #dropCfg {
    dropId = 10095,
    dropType = 0,
    dataId = 1919,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2650)->
    #dropCfg {
    dropId = 10095,
    dropType = 0,
    dataId = 1904,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2651)->
    #dropCfg {
    dropId = 10095,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2652)->
    #dropCfg {
    dropId = 10095,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2653)->
    #dropCfg {
    dropId = 10096,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2654)->
    #dropCfg {
    dropId = 10096,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2655)->
    #dropCfg {
    dropId = 10096,
    dropType = 0,
    dataId = 1921,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2656)->
    #dropCfg {
    dropId = 10096,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2657)->
    #dropCfg {
    dropId = 10096,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2658)->
    #dropCfg {
    dropId = 10097,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2659)->
    #dropCfg {
    dropId = 10097,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2660)->
    #dropCfg {
    dropId = 10097,
    dropType = 0,
    dataId = 1921,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2661)->
    #dropCfg {
    dropId = 10097,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2662)->
    #dropCfg {
    dropId = 10097,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2663)->
    #dropCfg {
    dropId = 10098,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2664)->
    #dropCfg {
    dropId = 10098,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2665)->
    #dropCfg {
    dropId = 10098,
    dropType = 0,
    dataId = 1921,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2666)->
    #dropCfg {
    dropId = 10098,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2667)->
    #dropCfg {
    dropId = 10098,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2668)->
    #dropCfg {
    dropId = 10099,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2669)->
    #dropCfg {
    dropId = 10099,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2670)->
    #dropCfg {
    dropId = 10099,
    dropType = 0,
    dataId = 1921,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2671)->
    #dropCfg {
    dropId = 10099,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2672)->
    #dropCfg {
    dropId = 10099,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2673)->
    #dropCfg {
    dropId = 10100,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2674)->
    #dropCfg {
    dropId = 10100,
    dropType = 0,
    dataId = 1921,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2675)->
    #dropCfg {
    dropId = 10100,
    dropType = 0,
    dataId = 1923,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2676)->
    #dropCfg {
    dropId = 10100,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2677)->
    #dropCfg {
    dropId = 10100,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2678)->
    #dropCfg {
    dropId = 10100,
    dropType = 0,
    dataId = 11000,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11000
    };
getRow(2679)->
    #dropCfg {
    dropId = 10100,
    dropType = 0,
    dataId = 11010,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11010
    };
getRow(2680)->
    #dropCfg {
    dropId = 10101,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2681)->
    #dropCfg {
    dropId = 10101,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2682)->
    #dropCfg {
    dropId = 10101,
    dropType = 0,
    dataId = 1910,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2683)->
    #dropCfg {
    dropId = 10101,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2684)->
    #dropCfg {
    dropId = 10101,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2685)->
    #dropCfg {
    dropId = 10102,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2686)->
    #dropCfg {
    dropId = 10102,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2687)->
    #dropCfg {
    dropId = 10102,
    dropType = 0,
    dataId = 1910,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2688)->
    #dropCfg {
    dropId = 10102,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2689)->
    #dropCfg {
    dropId = 10102,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2690)->
    #dropCfg {
    dropId = 10103,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2691)->
    #dropCfg {
    dropId = 10103,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2692)->
    #dropCfg {
    dropId = 10103,
    dropType = 0,
    dataId = 1910,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2693)->
    #dropCfg {
    dropId = 10103,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2694)->
    #dropCfg {
    dropId = 10103,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2695)->
    #dropCfg {
    dropId = 10104,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2696)->
    #dropCfg {
    dropId = 10104,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2697)->
    #dropCfg {
    dropId = 10104,
    dropType = 0,
    dataId = 1910,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2698)->
    #dropCfg {
    dropId = 10104,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2699)->
    #dropCfg {
    dropId = 10104,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2700)->
    #dropCfg {
    dropId = 10105,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2701)->
    #dropCfg {
    dropId = 10105,
    dropType = 0,
    dataId = 1910,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2702)->
    #dropCfg {
    dropId = 10105,
    dropType = 0,
    dataId = 1914,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2703)->
    #dropCfg {
    dropId = 10105,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2704)->
    #dropCfg {
    dropId = 10105,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2705)->
    #dropCfg {
    dropId = 10106,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2706)->
    #dropCfg {
    dropId = 10106,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2707)->
    #dropCfg {
    dropId = 10106,
    dropType = 0,
    dataId = 1909,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2708)->
    #dropCfg {
    dropId = 10106,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2709)->
    #dropCfg {
    dropId = 10106,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2710)->
    #dropCfg {
    dropId = 10107,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2711)->
    #dropCfg {
    dropId = 10107,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2712)->
    #dropCfg {
    dropId = 10107,
    dropType = 0,
    dataId = 1909,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2713)->
    #dropCfg {
    dropId = 10107,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2714)->
    #dropCfg {
    dropId = 10107,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2715)->
    #dropCfg {
    dropId = 10108,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2716)->
    #dropCfg {
    dropId = 10108,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2717)->
    #dropCfg {
    dropId = 10108,
    dropType = 0,
    dataId = 1909,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2718)->
    #dropCfg {
    dropId = 10108,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2719)->
    #dropCfg {
    dropId = 10108,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2720)->
    #dropCfg {
    dropId = 10109,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2721)->
    #dropCfg {
    dropId = 10109,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2722)->
    #dropCfg {
    dropId = 10109,
    dropType = 0,
    dataId = 1909,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2723)->
    #dropCfg {
    dropId = 10109,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2724)->
    #dropCfg {
    dropId = 10109,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2725)->
    #dropCfg {
    dropId = 10110,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2726)->
    #dropCfg {
    dropId = 10110,
    dropType = 0,
    dataId = 1909,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2727)->
    #dropCfg {
    dropId = 10110,
    dropType = 0,
    dataId = 1920,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2728)->
    #dropCfg {
    dropId = 10110,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2729)->
    #dropCfg {
    dropId = 10110,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2730)->
    #dropCfg {
    dropId = 10110,
    dropType = 0,
    dataId = 11000,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11000
    };
getRow(2731)->
    #dropCfg {
    dropId = 10110,
    dropType = 0,
    dataId = 11010,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11010
    };
getRow(2732)->
    #dropCfg {
    dropId = 10111,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2733)->
    #dropCfg {
    dropId = 10111,
    dropType = 0,
    dataId = 1902,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2734)->
    #dropCfg {
    dropId = 10111,
    dropType = 0,
    dataId = 1904,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2735)->
    #dropCfg {
    dropId = 10111,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2736)->
    #dropCfg {
    dropId = 10111,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2737)->
    #dropCfg {
    dropId = 10112,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2738)->
    #dropCfg {
    dropId = 10112,
    dropType = 0,
    dataId = 1902,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2739)->
    #dropCfg {
    dropId = 10112,
    dropType = 0,
    dataId = 1904,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2740)->
    #dropCfg {
    dropId = 10112,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2741)->
    #dropCfg {
    dropId = 10112,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2742)->
    #dropCfg {
    dropId = 10113,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2743)->
    #dropCfg {
    dropId = 10113,
    dropType = 0,
    dataId = 1902,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2744)->
    #dropCfg {
    dropId = 10113,
    dropType = 0,
    dataId = 1904,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2745)->
    #dropCfg {
    dropId = 10113,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2746)->
    #dropCfg {
    dropId = 10113,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2747)->
    #dropCfg {
    dropId = 10114,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2748)->
    #dropCfg {
    dropId = 10114,
    dropType = 0,
    dataId = 1902,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2749)->
    #dropCfg {
    dropId = 10114,
    dropType = 0,
    dataId = 1904,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2750)->
    #dropCfg {
    dropId = 10114,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2751)->
    #dropCfg {
    dropId = 10114,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2752)->
    #dropCfg {
    dropId = 10115,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2753)->
    #dropCfg {
    dropId = 10115,
    dropType = 0,
    dataId = 1904,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2754)->
    #dropCfg {
    dropId = 10115,
    dropType = 0,
    dataId = 1929,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2755)->
    #dropCfg {
    dropId = 10115,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2756)->
    #dropCfg {
    dropId = 10115,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2757)->
    #dropCfg {
    dropId = 10116,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2758)->
    #dropCfg {
    dropId = 10116,
    dropType = 0,
    dataId = 1902,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2759)->
    #dropCfg {
    dropId = 10116,
    dropType = 0,
    dataId = 1906,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2760)->
    #dropCfg {
    dropId = 10116,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2761)->
    #dropCfg {
    dropId = 10116,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2762)->
    #dropCfg {
    dropId = 10117,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2763)->
    #dropCfg {
    dropId = 10117,
    dropType = 0,
    dataId = 1902,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2764)->
    #dropCfg {
    dropId = 10117,
    dropType = 0,
    dataId = 1906,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2765)->
    #dropCfg {
    dropId = 10117,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2766)->
    #dropCfg {
    dropId = 10117,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2767)->
    #dropCfg {
    dropId = 10118,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2768)->
    #dropCfg {
    dropId = 10118,
    dropType = 0,
    dataId = 1902,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2769)->
    #dropCfg {
    dropId = 10118,
    dropType = 0,
    dataId = 1906,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2770)->
    #dropCfg {
    dropId = 10118,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2771)->
    #dropCfg {
    dropId = 10118,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2772)->
    #dropCfg {
    dropId = 10119,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2773)->
    #dropCfg {
    dropId = 10119,
    dropType = 0,
    dataId = 1902,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2774)->
    #dropCfg {
    dropId = 10119,
    dropType = 0,
    dataId = 1906,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2775)->
    #dropCfg {
    dropId = 10119,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2776)->
    #dropCfg {
    dropId = 10119,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2777)->
    #dropCfg {
    dropId = 10120,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2778)->
    #dropCfg {
    dropId = 10120,
    dropType = 0,
    dataId = 1920,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2779)->
    #dropCfg {
    dropId = 10120,
    dropType = 0,
    dataId = 1926,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2780)->
    #dropCfg {
    dropId = 10120,
    dropType = 1,
    dataId = 11,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2781)->
    #dropCfg {
    dropId = 10120,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2782)->
    #dropCfg {
    dropId = 10120,
    dropType = 0,
    dataId = 11000,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11000
    };
getRow(2783)->
    #dropCfg {
    dropId = 10120,
    dropType = 0,
    dataId = 11010,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11010
    };
getRow(2784)->
    #dropCfg {
    dropId = 10121,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2785)->
    #dropCfg {
    dropId = 10121,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2786)->
    #dropCfg {
    dropId = 10121,
    dropType = 0,
    dataId = 1908,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2787)->
    #dropCfg {
    dropId = 10121,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2788)->
    #dropCfg {
    dropId = 10121,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2789)->
    #dropCfg {
    dropId = 10122,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2790)->
    #dropCfg {
    dropId = 10122,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2791)->
    #dropCfg {
    dropId = 10122,
    dropType = 0,
    dataId = 1908,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2792)->
    #dropCfg {
    dropId = 10122,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2793)->
    #dropCfg {
    dropId = 10122,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2794)->
    #dropCfg {
    dropId = 10123,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2795)->
    #dropCfg {
    dropId = 10123,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2796)->
    #dropCfg {
    dropId = 10123,
    dropType = 0,
    dataId = 1908,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2797)->
    #dropCfg {
    dropId = 10123,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2798)->
    #dropCfg {
    dropId = 10123,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2799)->
    #dropCfg {
    dropId = 10124,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2800)->
    #dropCfg {
    dropId = 10124,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2801)->
    #dropCfg {
    dropId = 10124,
    dropType = 0,
    dataId = 1908,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2802)->
    #dropCfg {
    dropId = 10124,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2803)->
    #dropCfg {
    dropId = 10124,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2804)->
    #dropCfg {
    dropId = 10125,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2805)->
    #dropCfg {
    dropId = 10125,
    dropType = 0,
    dataId = 1908,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2806)->
    #dropCfg {
    dropId = 10125,
    dropType = 0,
    dataId = 1910,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2807)->
    #dropCfg {
    dropId = 10125,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2808)->
    #dropCfg {
    dropId = 10125,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2809)->
    #dropCfg {
    dropId = 10126,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2810)->
    #dropCfg {
    dropId = 10126,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2811)->
    #dropCfg {
    dropId = 10126,
    dropType = 0,
    dataId = 1924,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2812)->
    #dropCfg {
    dropId = 10126,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2813)->
    #dropCfg {
    dropId = 10126,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2814)->
    #dropCfg {
    dropId = 10127,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2815)->
    #dropCfg {
    dropId = 10127,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2816)->
    #dropCfg {
    dropId = 10127,
    dropType = 0,
    dataId = 1924,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2817)->
    #dropCfg {
    dropId = 10127,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2818)->
    #dropCfg {
    dropId = 10127,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2819)->
    #dropCfg {
    dropId = 10128,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2820)->
    #dropCfg {
    dropId = 10128,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2821)->
    #dropCfg {
    dropId = 10128,
    dropType = 0,
    dataId = 1924,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2822)->
    #dropCfg {
    dropId = 10128,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2823)->
    #dropCfg {
    dropId = 10128,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2824)->
    #dropCfg {
    dropId = 10129,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2825)->
    #dropCfg {
    dropId = 10129,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2826)->
    #dropCfg {
    dropId = 10129,
    dropType = 0,
    dataId = 1924,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2827)->
    #dropCfg {
    dropId = 10129,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2828)->
    #dropCfg {
    dropId = 10129,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2829)->
    #dropCfg {
    dropId = 10130,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2830)->
    #dropCfg {
    dropId = 10130,
    dropType = 0,
    dataId = 1924,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2831)->
    #dropCfg {
    dropId = 10130,
    dropType = 0,
    dataId = 1909,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2832)->
    #dropCfg {
    dropId = 10130,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2833)->
    #dropCfg {
    dropId = 10130,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2834)->
    #dropCfg {
    dropId = 10130,
    dropType = 0,
    dataId = 11000,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11000
    };
getRow(2835)->
    #dropCfg {
    dropId = 10130,
    dropType = 0,
    dataId = 11010,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11010
    };
getRow(2836)->
    #dropCfg {
    dropId = 10131,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2837)->
    #dropCfg {
    dropId = 10131,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2838)->
    #dropCfg {
    dropId = 10131,
    dropType = 0,
    dataId = 1911,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2839)->
    #dropCfg {
    dropId = 10131,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2840)->
    #dropCfg {
    dropId = 10131,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2841)->
    #dropCfg {
    dropId = 10132,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2842)->
    #dropCfg {
    dropId = 10132,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2843)->
    #dropCfg {
    dropId = 10132,
    dropType = 0,
    dataId = 1911,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2844)->
    #dropCfg {
    dropId = 10132,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2845)->
    #dropCfg {
    dropId = 10132,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2846)->
    #dropCfg {
    dropId = 10133,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2847)->
    #dropCfg {
    dropId = 10133,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2848)->
    #dropCfg {
    dropId = 10133,
    dropType = 0,
    dataId = 1911,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2849)->
    #dropCfg {
    dropId = 10133,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2850)->
    #dropCfg {
    dropId = 10133,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2851)->
    #dropCfg {
    dropId = 10134,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2852)->
    #dropCfg {
    dropId = 10134,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2853)->
    #dropCfg {
    dropId = 10134,
    dropType = 0,
    dataId = 1911,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2854)->
    #dropCfg {
    dropId = 10134,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2855)->
    #dropCfg {
    dropId = 10134,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2856)->
    #dropCfg {
    dropId = 10135,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2857)->
    #dropCfg {
    dropId = 10135,
    dropType = 0,
    dataId = 1911,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2858)->
    #dropCfg {
    dropId = 10135,
    dropType = 0,
    dataId = 1906,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2859)->
    #dropCfg {
    dropId = 10135,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2860)->
    #dropCfg {
    dropId = 10135,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2861)->
    #dropCfg {
    dropId = 10136,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2862)->
    #dropCfg {
    dropId = 10136,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2863)->
    #dropCfg {
    dropId = 10136,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2864)->
    #dropCfg {
    dropId = 10136,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2865)->
    #dropCfg {
    dropId = 10136,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2866)->
    #dropCfg {
    dropId = 10137,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2867)->
    #dropCfg {
    dropId = 10137,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2868)->
    #dropCfg {
    dropId = 10137,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2869)->
    #dropCfg {
    dropId = 10137,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2870)->
    #dropCfg {
    dropId = 10137,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2871)->
    #dropCfg {
    dropId = 10138,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2872)->
    #dropCfg {
    dropId = 10138,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2873)->
    #dropCfg {
    dropId = 10138,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2874)->
    #dropCfg {
    dropId = 10138,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2875)->
    #dropCfg {
    dropId = 10138,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2876)->
    #dropCfg {
    dropId = 10139,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2877)->
    #dropCfg {
    dropId = 10139,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2878)->
    #dropCfg {
    dropId = 10139,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2879)->
    #dropCfg {
    dropId = 10139,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2880)->
    #dropCfg {
    dropId = 10139,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2881)->
    #dropCfg {
    dropId = 10140,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2882)->
    #dropCfg {
    dropId = 10140,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2883)->
    #dropCfg {
    dropId = 10140,
    dropType = 0,
    dataId = 1929,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2884)->
    #dropCfg {
    dropId = 10140,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2885)->
    #dropCfg {
    dropId = 10140,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2886)->
    #dropCfg {
    dropId = 10140,
    dropType = 0,
    dataId = 11000,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11000
    };
getRow(2887)->
    #dropCfg {
    dropId = 10140,
    dropType = 0,
    dataId = 11010,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11010
    };
getRow(2888)->
    #dropCfg {
    dropId = 10141,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2889)->
    #dropCfg {
    dropId = 10141,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2890)->
    #dropCfg {
    dropId = 10141,
    dropType = 0,
    dataId = 1919,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2891)->
    #dropCfg {
    dropId = 10141,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2892)->
    #dropCfg {
    dropId = 10141,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2893)->
    #dropCfg {
    dropId = 10142,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2894)->
    #dropCfg {
    dropId = 10142,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2895)->
    #dropCfg {
    dropId = 10142,
    dropType = 0,
    dataId = 1919,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2896)->
    #dropCfg {
    dropId = 10142,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2897)->
    #dropCfg {
    dropId = 10142,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2898)->
    #dropCfg {
    dropId = 10143,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2899)->
    #dropCfg {
    dropId = 10143,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2900)->
    #dropCfg {
    dropId = 10143,
    dropType = 0,
    dataId = 1919,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2901)->
    #dropCfg {
    dropId = 10143,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2902)->
    #dropCfg {
    dropId = 10143,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2903)->
    #dropCfg {
    dropId = 10144,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2904)->
    #dropCfg {
    dropId = 10144,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2905)->
    #dropCfg {
    dropId = 10144,
    dropType = 0,
    dataId = 1919,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2906)->
    #dropCfg {
    dropId = 10144,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2907)->
    #dropCfg {
    dropId = 10144,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2908)->
    #dropCfg {
    dropId = 10145,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2909)->
    #dropCfg {
    dropId = 10145,
    dropType = 0,
    dataId = 1919,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2910)->
    #dropCfg {
    dropId = 10145,
    dropType = 0,
    dataId = 1904,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2911)->
    #dropCfg {
    dropId = 10145,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2912)->
    #dropCfg {
    dropId = 10145,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2913)->
    #dropCfg {
    dropId = 10146,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2914)->
    #dropCfg {
    dropId = 10146,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2915)->
    #dropCfg {
    dropId = 10146,
    dropType = 0,
    dataId = 1921,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2916)->
    #dropCfg {
    dropId = 10146,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2917)->
    #dropCfg {
    dropId = 10146,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2918)->
    #dropCfg {
    dropId = 10147,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2919)->
    #dropCfg {
    dropId = 10147,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2920)->
    #dropCfg {
    dropId = 10147,
    dropType = 0,
    dataId = 1921,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2921)->
    #dropCfg {
    dropId = 10147,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2922)->
    #dropCfg {
    dropId = 10147,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2923)->
    #dropCfg {
    dropId = 10148,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2924)->
    #dropCfg {
    dropId = 10148,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2925)->
    #dropCfg {
    dropId = 10148,
    dropType = 0,
    dataId = 1921,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2926)->
    #dropCfg {
    dropId = 10148,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2927)->
    #dropCfg {
    dropId = 10148,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2928)->
    #dropCfg {
    dropId = 10149,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2929)->
    #dropCfg {
    dropId = 10149,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2930)->
    #dropCfg {
    dropId = 10149,
    dropType = 0,
    dataId = 1921,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2931)->
    #dropCfg {
    dropId = 10149,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2932)->
    #dropCfg {
    dropId = 10149,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2933)->
    #dropCfg {
    dropId = 10150,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2934)->
    #dropCfg {
    dropId = 10150,
    dropType = 0,
    dataId = 1921,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2935)->
    #dropCfg {
    dropId = 10150,
    dropType = 0,
    dataId = 1923,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2936)->
    #dropCfg {
    dropId = 10150,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2937)->
    #dropCfg {
    dropId = 10150,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2938)->
    #dropCfg {
    dropId = 10150,
    dropType = 0,
    dataId = 11000,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11000
    };
getRow(2939)->
    #dropCfg {
    dropId = 10150,
    dropType = 0,
    dataId = 11010,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11010
    };
getRow(2940)->
    #dropCfg {
    dropId = 10151,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2941)->
    #dropCfg {
    dropId = 10151,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2942)->
    #dropCfg {
    dropId = 10151,
    dropType = 0,
    dataId = 1910,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2943)->
    #dropCfg {
    dropId = 10151,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2944)->
    #dropCfg {
    dropId = 10151,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2945)->
    #dropCfg {
    dropId = 10152,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2946)->
    #dropCfg {
    dropId = 10152,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2947)->
    #dropCfg {
    dropId = 10152,
    dropType = 0,
    dataId = 1910,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2948)->
    #dropCfg {
    dropId = 10152,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2949)->
    #dropCfg {
    dropId = 10152,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2950)->
    #dropCfg {
    dropId = 10153,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2951)->
    #dropCfg {
    dropId = 10153,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2952)->
    #dropCfg {
    dropId = 10153,
    dropType = 0,
    dataId = 1910,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2953)->
    #dropCfg {
    dropId = 10153,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2954)->
    #dropCfg {
    dropId = 10153,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2955)->
    #dropCfg {
    dropId = 10154,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2956)->
    #dropCfg {
    dropId = 10154,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2957)->
    #dropCfg {
    dropId = 10154,
    dropType = 0,
    dataId = 1910,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2958)->
    #dropCfg {
    dropId = 10154,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2959)->
    #dropCfg {
    dropId = 10154,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2960)->
    #dropCfg {
    dropId = 10155,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2961)->
    #dropCfg {
    dropId = 10155,
    dropType = 0,
    dataId = 1910,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2962)->
    #dropCfg {
    dropId = 10155,
    dropType = 0,
    dataId = 1904,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2963)->
    #dropCfg {
    dropId = 10155,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2964)->
    #dropCfg {
    dropId = 10155,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2965)->
    #dropCfg {
    dropId = 10156,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2966)->
    #dropCfg {
    dropId = 10156,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2967)->
    #dropCfg {
    dropId = 10156,
    dropType = 0,
    dataId = 1909,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2968)->
    #dropCfg {
    dropId = 10156,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2969)->
    #dropCfg {
    dropId = 10156,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2970)->
    #dropCfg {
    dropId = 10157,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2971)->
    #dropCfg {
    dropId = 10157,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2972)->
    #dropCfg {
    dropId = 10157,
    dropType = 0,
    dataId = 1909,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2973)->
    #dropCfg {
    dropId = 10157,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2974)->
    #dropCfg {
    dropId = 10157,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2975)->
    #dropCfg {
    dropId = 10158,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2976)->
    #dropCfg {
    dropId = 10158,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2977)->
    #dropCfg {
    dropId = 10158,
    dropType = 0,
    dataId = 1909,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2978)->
    #dropCfg {
    dropId = 10158,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2979)->
    #dropCfg {
    dropId = 10158,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2980)->
    #dropCfg {
    dropId = 10159,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2981)->
    #dropCfg {
    dropId = 10159,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2982)->
    #dropCfg {
    dropId = 10159,
    dropType = 0,
    dataId = 1909,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2983)->
    #dropCfg {
    dropId = 10159,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2984)->
    #dropCfg {
    dropId = 10159,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2985)->
    #dropCfg {
    dropId = 10160,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2986)->
    #dropCfg {
    dropId = 10160,
    dropType = 0,
    dataId = 1909,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2987)->
    #dropCfg {
    dropId = 10160,
    dropType = 0,
    dataId = 1920,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2988)->
    #dropCfg {
    dropId = 10160,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2989)->
    #dropCfg {
    dropId = 10160,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2990)->
    #dropCfg {
    dropId = 10160,
    dropType = 0,
    dataId = 11000,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11000
    };
getRow(2991)->
    #dropCfg {
    dropId = 10160,
    dropType = 0,
    dataId = 11010,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11010
    };
getRow(2992)->
    #dropCfg {
    dropId = 10161,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2993)->
    #dropCfg {
    dropId = 10161,
    dropType = 0,
    dataId = 1902,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2994)->
    #dropCfg {
    dropId = 10161,
    dropType = 0,
    dataId = 1904,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2995)->
    #dropCfg {
    dropId = 10161,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2996)->
    #dropCfg {
    dropId = 10161,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2997)->
    #dropCfg {
    dropId = 10162,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2998)->
    #dropCfg {
    dropId = 10162,
    dropType = 0,
    dataId = 1902,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(2999)->
    #dropCfg {
    dropId = 10162,
    dropType = 0,
    dataId = 1904,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3000)->
    #dropCfg {
    dropId = 10162,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3001)->
    #dropCfg {
    dropId = 10162,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3002)->
    #dropCfg {
    dropId = 10163,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3003)->
    #dropCfg {
    dropId = 10163,
    dropType = 0,
    dataId = 1902,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3004)->
    #dropCfg {
    dropId = 10163,
    dropType = 0,
    dataId = 1904,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3005)->
    #dropCfg {
    dropId = 10163,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3006)->
    #dropCfg {
    dropId = 10163,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3007)->
    #dropCfg {
    dropId = 10164,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3008)->
    #dropCfg {
    dropId = 10164,
    dropType = 0,
    dataId = 1902,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3009)->
    #dropCfg {
    dropId = 10164,
    dropType = 0,
    dataId = 1904,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3010)->
    #dropCfg {
    dropId = 10164,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3011)->
    #dropCfg {
    dropId = 10164,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3012)->
    #dropCfg {
    dropId = 10165,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3013)->
    #dropCfg {
    dropId = 10165,
    dropType = 0,
    dataId = 1904,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3014)->
    #dropCfg {
    dropId = 10165,
    dropType = 0,
    dataId = 1909,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3015)->
    #dropCfg {
    dropId = 10165,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3016)->
    #dropCfg {
    dropId = 10165,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3017)->
    #dropCfg {
    dropId = 10166,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3018)->
    #dropCfg {
    dropId = 10166,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3019)->
    #dropCfg {
    dropId = 10166,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3020)->
    #dropCfg {
    dropId = 10166,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3021)->
    #dropCfg {
    dropId = 10166,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3022)->
    #dropCfg {
    dropId = 10167,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3023)->
    #dropCfg {
    dropId = 10167,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3024)->
    #dropCfg {
    dropId = 10167,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3025)->
    #dropCfg {
    dropId = 10167,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3026)->
    #dropCfg {
    dropId = 10167,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3027)->
    #dropCfg {
    dropId = 10168,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3028)->
    #dropCfg {
    dropId = 10168,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3029)->
    #dropCfg {
    dropId = 10168,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3030)->
    #dropCfg {
    dropId = 10168,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3031)->
    #dropCfg {
    dropId = 10168,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3032)->
    #dropCfg {
    dropId = 10169,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3033)->
    #dropCfg {
    dropId = 10169,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3034)->
    #dropCfg {
    dropId = 10169,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3035)->
    #dropCfg {
    dropId = 10169,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3036)->
    #dropCfg {
    dropId = 10169,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3037)->
    #dropCfg {
    dropId = 10170,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3038)->
    #dropCfg {
    dropId = 10170,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3039)->
    #dropCfg {
    dropId = 10170,
    dropType = 0,
    dataId = 1914,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3040)->
    #dropCfg {
    dropId = 10170,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3041)->
    #dropCfg {
    dropId = 10170,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3042)->
    #dropCfg {
    dropId = 10170,
    dropType = 0,
    dataId = 11000,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11000
    };
getRow(3043)->
    #dropCfg {
    dropId = 10170,
    dropType = 0,
    dataId = 11010,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11010
    };
getRow(3044)->
    #dropCfg {
    dropId = 10171,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3045)->
    #dropCfg {
    dropId = 10171,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3046)->
    #dropCfg {
    dropId = 10171,
    dropType = 0,
    dataId = 1908,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3047)->
    #dropCfg {
    dropId = 10171,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3048)->
    #dropCfg {
    dropId = 10171,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3049)->
    #dropCfg {
    dropId = 10172,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3050)->
    #dropCfg {
    dropId = 10172,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3051)->
    #dropCfg {
    dropId = 10172,
    dropType = 0,
    dataId = 1908,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3052)->
    #dropCfg {
    dropId = 10172,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3053)->
    #dropCfg {
    dropId = 10172,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3054)->
    #dropCfg {
    dropId = 10173,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3055)->
    #dropCfg {
    dropId = 10173,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3056)->
    #dropCfg {
    dropId = 10173,
    dropType = 0,
    dataId = 1908,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3057)->
    #dropCfg {
    dropId = 10173,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3058)->
    #dropCfg {
    dropId = 10173,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3059)->
    #dropCfg {
    dropId = 10174,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3060)->
    #dropCfg {
    dropId = 10174,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3061)->
    #dropCfg {
    dropId = 10174,
    dropType = 0,
    dataId = 1908,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3062)->
    #dropCfg {
    dropId = 10174,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3063)->
    #dropCfg {
    dropId = 10174,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3064)->
    #dropCfg {
    dropId = 10175,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3065)->
    #dropCfg {
    dropId = 10175,
    dropType = 0,
    dataId = 1908,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3066)->
    #dropCfg {
    dropId = 10175,
    dropType = 0,
    dataId = 1910,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3067)->
    #dropCfg {
    dropId = 10175,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3068)->
    #dropCfg {
    dropId = 10175,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3069)->
    #dropCfg {
    dropId = 10176,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3070)->
    #dropCfg {
    dropId = 10176,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3071)->
    #dropCfg {
    dropId = 10176,
    dropType = 0,
    dataId = 1924,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3072)->
    #dropCfg {
    dropId = 10176,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3073)->
    #dropCfg {
    dropId = 10176,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3074)->
    #dropCfg {
    dropId = 10177,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3075)->
    #dropCfg {
    dropId = 10177,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3076)->
    #dropCfg {
    dropId = 10177,
    dropType = 0,
    dataId = 1924,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3077)->
    #dropCfg {
    dropId = 10177,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3078)->
    #dropCfg {
    dropId = 10177,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3079)->
    #dropCfg {
    dropId = 10178,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3080)->
    #dropCfg {
    dropId = 10178,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3081)->
    #dropCfg {
    dropId = 10178,
    dropType = 0,
    dataId = 1924,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3082)->
    #dropCfg {
    dropId = 10178,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3083)->
    #dropCfg {
    dropId = 10178,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3084)->
    #dropCfg {
    dropId = 10179,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3085)->
    #dropCfg {
    dropId = 10179,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3086)->
    #dropCfg {
    dropId = 10179,
    dropType = 0,
    dataId = 1924,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3087)->
    #dropCfg {
    dropId = 10179,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3088)->
    #dropCfg {
    dropId = 10179,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3089)->
    #dropCfg {
    dropId = 10180,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3090)->
    #dropCfg {
    dropId = 10180,
    dropType = 0,
    dataId = 1924,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3091)->
    #dropCfg {
    dropId = 10180,
    dropType = 0,
    dataId = 1909,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3092)->
    #dropCfg {
    dropId = 10180,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3093)->
    #dropCfg {
    dropId = 10180,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3094)->
    #dropCfg {
    dropId = 10180,
    dropType = 0,
    dataId = 11000,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11000
    };
getRow(3095)->
    #dropCfg {
    dropId = 10180,
    dropType = 0,
    dataId = 11010,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11010
    };
getRow(3096)->
    #dropCfg {
    dropId = 10181,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3097)->
    #dropCfg {
    dropId = 10181,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3098)->
    #dropCfg {
    dropId = 10181,
    dropType = 0,
    dataId = 1911,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3099)->
    #dropCfg {
    dropId = 10181,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3100)->
    #dropCfg {
    dropId = 10181,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3101)->
    #dropCfg {
    dropId = 10182,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3102)->
    #dropCfg {
    dropId = 10182,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3103)->
    #dropCfg {
    dropId = 10182,
    dropType = 0,
    dataId = 1911,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3104)->
    #dropCfg {
    dropId = 10182,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3105)->
    #dropCfg {
    dropId = 10182,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3106)->
    #dropCfg {
    dropId = 10183,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3107)->
    #dropCfg {
    dropId = 10183,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3108)->
    #dropCfg {
    dropId = 10183,
    dropType = 0,
    dataId = 1911,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3109)->
    #dropCfg {
    dropId = 10183,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3110)->
    #dropCfg {
    dropId = 10183,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3111)->
    #dropCfg {
    dropId = 10184,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3112)->
    #dropCfg {
    dropId = 10184,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3113)->
    #dropCfg {
    dropId = 10184,
    dropType = 0,
    dataId = 1911,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3114)->
    #dropCfg {
    dropId = 10184,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3115)->
    #dropCfg {
    dropId = 10184,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3116)->
    #dropCfg {
    dropId = 10185,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3117)->
    #dropCfg {
    dropId = 10185,
    dropType = 0,
    dataId = 1911,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3118)->
    #dropCfg {
    dropId = 10185,
    dropType = 0,
    dataId = 1906,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3119)->
    #dropCfg {
    dropId = 10185,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3120)->
    #dropCfg {
    dropId = 10185,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3121)->
    #dropCfg {
    dropId = 10186,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3122)->
    #dropCfg {
    dropId = 10186,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3123)->
    #dropCfg {
    dropId = 10186,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3124)->
    #dropCfg {
    dropId = 10186,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3125)->
    #dropCfg {
    dropId = 10186,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3126)->
    #dropCfg {
    dropId = 10187,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3127)->
    #dropCfg {
    dropId = 10187,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3128)->
    #dropCfg {
    dropId = 10187,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3129)->
    #dropCfg {
    dropId = 10187,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3130)->
    #dropCfg {
    dropId = 10187,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3131)->
    #dropCfg {
    dropId = 10188,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3132)->
    #dropCfg {
    dropId = 10188,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3133)->
    #dropCfg {
    dropId = 10188,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3134)->
    #dropCfg {
    dropId = 10188,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3135)->
    #dropCfg {
    dropId = 10188,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3136)->
    #dropCfg {
    dropId = 10189,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3137)->
    #dropCfg {
    dropId = 10189,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3138)->
    #dropCfg {
    dropId = 10189,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3139)->
    #dropCfg {
    dropId = 10189,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3140)->
    #dropCfg {
    dropId = 10189,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3141)->
    #dropCfg {
    dropId = 10190,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3142)->
    #dropCfg {
    dropId = 10190,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3143)->
    #dropCfg {
    dropId = 10190,
    dropType = 0,
    dataId = 1929,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3144)->
    #dropCfg {
    dropId = 10190,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3145)->
    #dropCfg {
    dropId = 10190,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3146)->
    #dropCfg {
    dropId = 10190,
    dropType = 0,
    dataId = 11000,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11000
    };
getRow(3147)->
    #dropCfg {
    dropId = 10190,
    dropType = 0,
    dataId = 11010,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11010
    };
getRow(3148)->
    #dropCfg {
    dropId = 10191,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3149)->
    #dropCfg {
    dropId = 10191,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3150)->
    #dropCfg {
    dropId = 10191,
    dropType = 0,
    dataId = 1919,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3151)->
    #dropCfg {
    dropId = 10191,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3152)->
    #dropCfg {
    dropId = 10191,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3153)->
    #dropCfg {
    dropId = 10192,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3154)->
    #dropCfg {
    dropId = 10192,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3155)->
    #dropCfg {
    dropId = 10192,
    dropType = 0,
    dataId = 1919,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3156)->
    #dropCfg {
    dropId = 10192,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3157)->
    #dropCfg {
    dropId = 10192,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3158)->
    #dropCfg {
    dropId = 10193,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3159)->
    #dropCfg {
    dropId = 10193,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3160)->
    #dropCfg {
    dropId = 10193,
    dropType = 0,
    dataId = 1919,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3161)->
    #dropCfg {
    dropId = 10193,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3162)->
    #dropCfg {
    dropId = 10193,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3163)->
    #dropCfg {
    dropId = 10194,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3164)->
    #dropCfg {
    dropId = 10194,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3165)->
    #dropCfg {
    dropId = 10194,
    dropType = 0,
    dataId = 1919,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3166)->
    #dropCfg {
    dropId = 10194,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3167)->
    #dropCfg {
    dropId = 10194,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3168)->
    #dropCfg {
    dropId = 10195,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3169)->
    #dropCfg {
    dropId = 10195,
    dropType = 0,
    dataId = 1919,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3170)->
    #dropCfg {
    dropId = 10195,
    dropType = 0,
    dataId = 1904,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3171)->
    #dropCfg {
    dropId = 10195,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3172)->
    #dropCfg {
    dropId = 10195,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3173)->
    #dropCfg {
    dropId = 10196,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3174)->
    #dropCfg {
    dropId = 10196,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3175)->
    #dropCfg {
    dropId = 10196,
    dropType = 0,
    dataId = 1921,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3176)->
    #dropCfg {
    dropId = 10196,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3177)->
    #dropCfg {
    dropId = 10196,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3178)->
    #dropCfg {
    dropId = 10197,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3179)->
    #dropCfg {
    dropId = 10197,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3180)->
    #dropCfg {
    dropId = 10197,
    dropType = 0,
    dataId = 1921,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3181)->
    #dropCfg {
    dropId = 10197,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3182)->
    #dropCfg {
    dropId = 10197,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3183)->
    #dropCfg {
    dropId = 10198,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3184)->
    #dropCfg {
    dropId = 10198,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3185)->
    #dropCfg {
    dropId = 10198,
    dropType = 0,
    dataId = 1921,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3186)->
    #dropCfg {
    dropId = 10198,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3187)->
    #dropCfg {
    dropId = 10198,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3188)->
    #dropCfg {
    dropId = 10199,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3189)->
    #dropCfg {
    dropId = 10199,
    dropType = 0,
    dataId = 1903,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3190)->
    #dropCfg {
    dropId = 10199,
    dropType = 0,
    dataId = 1921,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3191)->
    #dropCfg {
    dropId = 10199,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3192)->
    #dropCfg {
    dropId = 10199,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3193)->
    #dropCfg {
    dropId = 10200,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3194)->
    #dropCfg {
    dropId = 10200,
    dropType = 0,
    dataId = 1921,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3195)->
    #dropCfg {
    dropId = 10200,
    dropType = 0,
    dataId = 1923,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3196)->
    #dropCfg {
    dropId = 10200,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3197)->
    #dropCfg {
    dropId = 10200,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3198)->
    #dropCfg {
    dropId = 10200,
    dropType = 0,
    dataId = 11000,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11000
    };
getRow(3199)->
    #dropCfg {
    dropId = 10200,
    dropType = 0,
    dataId = 11010,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11010
    };
getRow(3200)->
    #dropCfg {
    dropId = 10201,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3201)->
    #dropCfg {
    dropId = 10201,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3202)->
    #dropCfg {
    dropId = 10201,
    dropType = 0,
    dataId = 1910,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3203)->
    #dropCfg {
    dropId = 10201,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3204)->
    #dropCfg {
    dropId = 10201,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3205)->
    #dropCfg {
    dropId = 10202,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3206)->
    #dropCfg {
    dropId = 10202,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3207)->
    #dropCfg {
    dropId = 10202,
    dropType = 0,
    dataId = 1910,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3208)->
    #dropCfg {
    dropId = 10202,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3209)->
    #dropCfg {
    dropId = 10202,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3210)->
    #dropCfg {
    dropId = 10203,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3211)->
    #dropCfg {
    dropId = 10203,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3212)->
    #dropCfg {
    dropId = 10203,
    dropType = 0,
    dataId = 1910,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3213)->
    #dropCfg {
    dropId = 10203,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3214)->
    #dropCfg {
    dropId = 10203,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3215)->
    #dropCfg {
    dropId = 10204,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3216)->
    #dropCfg {
    dropId = 10204,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3217)->
    #dropCfg {
    dropId = 10204,
    dropType = 0,
    dataId = 1910,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3218)->
    #dropCfg {
    dropId = 10204,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3219)->
    #dropCfg {
    dropId = 10204,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3220)->
    #dropCfg {
    dropId = 10205,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3221)->
    #dropCfg {
    dropId = 10205,
    dropType = 0,
    dataId = 1910,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3222)->
    #dropCfg {
    dropId = 10205,
    dropType = 0,
    dataId = 1904,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3223)->
    #dropCfg {
    dropId = 10205,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3224)->
    #dropCfg {
    dropId = 10205,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3225)->
    #dropCfg {
    dropId = 10206,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3226)->
    #dropCfg {
    dropId = 10206,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3227)->
    #dropCfg {
    dropId = 10206,
    dropType = 0,
    dataId = 1909,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3228)->
    #dropCfg {
    dropId = 10206,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3229)->
    #dropCfg {
    dropId = 10206,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3230)->
    #dropCfg {
    dropId = 10207,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3231)->
    #dropCfg {
    dropId = 10207,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3232)->
    #dropCfg {
    dropId = 10207,
    dropType = 0,
    dataId = 1909,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3233)->
    #dropCfg {
    dropId = 10207,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3234)->
    #dropCfg {
    dropId = 10207,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3235)->
    #dropCfg {
    dropId = 10208,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3236)->
    #dropCfg {
    dropId = 10208,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3237)->
    #dropCfg {
    dropId = 10208,
    dropType = 0,
    dataId = 1909,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3238)->
    #dropCfg {
    dropId = 10208,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3239)->
    #dropCfg {
    dropId = 10208,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3240)->
    #dropCfg {
    dropId = 10209,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3241)->
    #dropCfg {
    dropId = 10209,
    dropType = 0,
    dataId = 1905,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3242)->
    #dropCfg {
    dropId = 10209,
    dropType = 0,
    dataId = 1909,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3243)->
    #dropCfg {
    dropId = 10209,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3244)->
    #dropCfg {
    dropId = 10209,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3245)->
    #dropCfg {
    dropId = 10210,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3246)->
    #dropCfg {
    dropId = 10210,
    dropType = 0,
    dataId = 1909,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3247)->
    #dropCfg {
    dropId = 10210,
    dropType = 0,
    dataId = 1920,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3248)->
    #dropCfg {
    dropId = 10210,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3249)->
    #dropCfg {
    dropId = 10210,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3250)->
    #dropCfg {
    dropId = 10210,
    dropType = 0,
    dataId = 11000,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11000
    };
getRow(3251)->
    #dropCfg {
    dropId = 10210,
    dropType = 0,
    dataId = 11010,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11010
    };
getRow(3252)->
    #dropCfg {
    dropId = 10211,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3253)->
    #dropCfg {
    dropId = 10211,
    dropType = 0,
    dataId = 1902,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3254)->
    #dropCfg {
    dropId = 10211,
    dropType = 0,
    dataId = 1904,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3255)->
    #dropCfg {
    dropId = 10211,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3256)->
    #dropCfg {
    dropId = 10211,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3257)->
    #dropCfg {
    dropId = 10212,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3258)->
    #dropCfg {
    dropId = 10212,
    dropType = 0,
    dataId = 1902,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3259)->
    #dropCfg {
    dropId = 10212,
    dropType = 0,
    dataId = 1904,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3260)->
    #dropCfg {
    dropId = 10212,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3261)->
    #dropCfg {
    dropId = 10212,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3262)->
    #dropCfg {
    dropId = 10213,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3263)->
    #dropCfg {
    dropId = 10213,
    dropType = 0,
    dataId = 1902,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3264)->
    #dropCfg {
    dropId = 10213,
    dropType = 0,
    dataId = 1904,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3265)->
    #dropCfg {
    dropId = 10213,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3266)->
    #dropCfg {
    dropId = 10213,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3267)->
    #dropCfg {
    dropId = 10214,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3268)->
    #dropCfg {
    dropId = 10214,
    dropType = 0,
    dataId = 1902,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3269)->
    #dropCfg {
    dropId = 10214,
    dropType = 0,
    dataId = 1904,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3270)->
    #dropCfg {
    dropId = 10214,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3271)->
    #dropCfg {
    dropId = 10214,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3272)->
    #dropCfg {
    dropId = 10215,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3273)->
    #dropCfg {
    dropId = 10215,
    dropType = 0,
    dataId = 1904,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3274)->
    #dropCfg {
    dropId = 10215,
    dropType = 0,
    dataId = 1909,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3275)->
    #dropCfg {
    dropId = 10215,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3276)->
    #dropCfg {
    dropId = 10215,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3277)->
    #dropCfg {
    dropId = 10216,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3278)->
    #dropCfg {
    dropId = 10216,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3279)->
    #dropCfg {
    dropId = 10216,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3280)->
    #dropCfg {
    dropId = 10216,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3281)->
    #dropCfg {
    dropId = 10216,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3282)->
    #dropCfg {
    dropId = 10217,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3283)->
    #dropCfg {
    dropId = 10217,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3284)->
    #dropCfg {
    dropId = 10217,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3285)->
    #dropCfg {
    dropId = 10217,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3286)->
    #dropCfg {
    dropId = 10217,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3287)->
    #dropCfg {
    dropId = 10218,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3288)->
    #dropCfg {
    dropId = 10218,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3289)->
    #dropCfg {
    dropId = 10218,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3290)->
    #dropCfg {
    dropId = 10218,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3291)->
    #dropCfg {
    dropId = 10218,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3292)->
    #dropCfg {
    dropId = 10219,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3293)->
    #dropCfg {
    dropId = 10219,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3294)->
    #dropCfg {
    dropId = 10219,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3295)->
    #dropCfg {
    dropId = 10219,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3296)->
    #dropCfg {
    dropId = 10219,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3297)->
    #dropCfg {
    dropId = 10220,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3298)->
    #dropCfg {
    dropId = 10220,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3299)->
    #dropCfg {
    dropId = 10220,
    dropType = 0,
    dataId = 1914,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3300)->
    #dropCfg {
    dropId = 10220,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3301)->
    #dropCfg {
    dropId = 10220,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3302)->
    #dropCfg {
    dropId = 10220,
    dropType = 0,
    dataId = 11000,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11000
    };
getRow(3303)->
    #dropCfg {
    dropId = 10220,
    dropType = 0,
    dataId = 11010,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11010
    };
getRow(3304)->
    #dropCfg {
    dropId = 10221,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3305)->
    #dropCfg {
    dropId = 10221,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3306)->
    #dropCfg {
    dropId = 10221,
    dropType = 0,
    dataId = 1908,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3307)->
    #dropCfg {
    dropId = 10221,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3308)->
    #dropCfg {
    dropId = 10221,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3309)->
    #dropCfg {
    dropId = 10222,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3310)->
    #dropCfg {
    dropId = 10222,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3311)->
    #dropCfg {
    dropId = 10222,
    dropType = 0,
    dataId = 1908,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3312)->
    #dropCfg {
    dropId = 10222,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3313)->
    #dropCfg {
    dropId = 10222,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3314)->
    #dropCfg {
    dropId = 10223,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3315)->
    #dropCfg {
    dropId = 10223,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3316)->
    #dropCfg {
    dropId = 10223,
    dropType = 0,
    dataId = 1908,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3317)->
    #dropCfg {
    dropId = 10223,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3318)->
    #dropCfg {
    dropId = 10223,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3319)->
    #dropCfg {
    dropId = 10224,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3320)->
    #dropCfg {
    dropId = 10224,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3321)->
    #dropCfg {
    dropId = 10224,
    dropType = 0,
    dataId = 1908,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3322)->
    #dropCfg {
    dropId = 10224,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3323)->
    #dropCfg {
    dropId = 10224,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3324)->
    #dropCfg {
    dropId = 10225,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3325)->
    #dropCfg {
    dropId = 10225,
    dropType = 0,
    dataId = 1908,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3326)->
    #dropCfg {
    dropId = 10225,
    dropType = 0,
    dataId = 1910,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3327)->
    #dropCfg {
    dropId = 10225,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3328)->
    #dropCfg {
    dropId = 10225,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3329)->
    #dropCfg {
    dropId = 10226,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3330)->
    #dropCfg {
    dropId = 10226,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3331)->
    #dropCfg {
    dropId = 10226,
    dropType = 0,
    dataId = 1924,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3332)->
    #dropCfg {
    dropId = 10226,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3333)->
    #dropCfg {
    dropId = 10226,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3334)->
    #dropCfg {
    dropId = 10227,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3335)->
    #dropCfg {
    dropId = 10227,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3336)->
    #dropCfg {
    dropId = 10227,
    dropType = 0,
    dataId = 1924,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3337)->
    #dropCfg {
    dropId = 10227,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3338)->
    #dropCfg {
    dropId = 10227,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3339)->
    #dropCfg {
    dropId = 10228,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3340)->
    #dropCfg {
    dropId = 10228,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3341)->
    #dropCfg {
    dropId = 10228,
    dropType = 0,
    dataId = 1924,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3342)->
    #dropCfg {
    dropId = 10228,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3343)->
    #dropCfg {
    dropId = 10228,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3344)->
    #dropCfg {
    dropId = 10229,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3345)->
    #dropCfg {
    dropId = 10229,
    dropType = 0,
    dataId = 1925,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3346)->
    #dropCfg {
    dropId = 10229,
    dropType = 0,
    dataId = 1924,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3347)->
    #dropCfg {
    dropId = 10229,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3348)->
    #dropCfg {
    dropId = 10229,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3349)->
    #dropCfg {
    dropId = 10230,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3350)->
    #dropCfg {
    dropId = 10230,
    dropType = 0,
    dataId = 1924,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3351)->
    #dropCfg {
    dropId = 10230,
    dropType = 0,
    dataId = 1909,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3352)->
    #dropCfg {
    dropId = 10230,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3353)->
    #dropCfg {
    dropId = 10230,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3354)->
    #dropCfg {
    dropId = 10230,
    dropType = 0,
    dataId = 11000,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11000
    };
getRow(3355)->
    #dropCfg {
    dropId = 10230,
    dropType = 0,
    dataId = 11010,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11010
    };
getRow(3356)->
    #dropCfg {
    dropId = 10231,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3357)->
    #dropCfg {
    dropId = 10231,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3358)->
    #dropCfg {
    dropId = 10231,
    dropType = 0,
    dataId = 1911,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3359)->
    #dropCfg {
    dropId = 10231,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3360)->
    #dropCfg {
    dropId = 10231,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3361)->
    #dropCfg {
    dropId = 10232,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3362)->
    #dropCfg {
    dropId = 10232,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3363)->
    #dropCfg {
    dropId = 10232,
    dropType = 0,
    dataId = 1911,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3364)->
    #dropCfg {
    dropId = 10232,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3365)->
    #dropCfg {
    dropId = 10232,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3366)->
    #dropCfg {
    dropId = 10233,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3367)->
    #dropCfg {
    dropId = 10233,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3368)->
    #dropCfg {
    dropId = 10233,
    dropType = 0,
    dataId = 1911,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3369)->
    #dropCfg {
    dropId = 10233,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3370)->
    #dropCfg {
    dropId = 10233,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3371)->
    #dropCfg {
    dropId = 10234,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3372)->
    #dropCfg {
    dropId = 10234,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3373)->
    #dropCfg {
    dropId = 10234,
    dropType = 0,
    dataId = 1911,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3374)->
    #dropCfg {
    dropId = 10234,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3375)->
    #dropCfg {
    dropId = 10234,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3376)->
    #dropCfg {
    dropId = 10235,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3377)->
    #dropCfg {
    dropId = 10235,
    dropType = 0,
    dataId = 1911,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3378)->
    #dropCfg {
    dropId = 10235,
    dropType = 0,
    dataId = 1906,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3379)->
    #dropCfg {
    dropId = 10235,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3380)->
    #dropCfg {
    dropId = 10235,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3381)->
    #dropCfg {
    dropId = 10236,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3382)->
    #dropCfg {
    dropId = 10236,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3383)->
    #dropCfg {
    dropId = 10236,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3384)->
    #dropCfg {
    dropId = 10236,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3385)->
    #dropCfg {
    dropId = 10236,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3386)->
    #dropCfg {
    dropId = 10237,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3387)->
    #dropCfg {
    dropId = 10237,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3388)->
    #dropCfg {
    dropId = 10237,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3389)->
    #dropCfg {
    dropId = 10237,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3390)->
    #dropCfg {
    dropId = 10237,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3391)->
    #dropCfg {
    dropId = 10238,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3392)->
    #dropCfg {
    dropId = 10238,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3393)->
    #dropCfg {
    dropId = 10238,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3394)->
    #dropCfg {
    dropId = 10238,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3395)->
    #dropCfg {
    dropId = 10238,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3396)->
    #dropCfg {
    dropId = 10239,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3397)->
    #dropCfg {
    dropId = 10239,
    dropType = 0,
    dataId = 1918,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3398)->
    #dropCfg {
    dropId = 10239,
    dropType = 0,
    dataId = 1928,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3399)->
    #dropCfg {
    dropId = 10239,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3400)->
    #dropCfg {
    dropId = 10239,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3401)->
    #dropCfg {
    dropId = 10240,
    dropType = 0,
    dataId = 1901,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3402)->
    #dropCfg {
    dropId = 10240,
    dropType = 0,
    dataId = 1929,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3403)->
    #dropCfg {
    dropId = 10240,
    dropType = 0,
    dataId = 1926,
    probability = 100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3404)->
    #dropCfg {
    dropId = 10240,
    dropType = 1,
    dataId = 11,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3405)->
    #dropCfg {
    dropId = 10240,
    dropType = 0,
    dataId = 2160,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3406)->
    #dropCfg {
    dropId = 10240,
    dropType = 0,
    dataId = 11000,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11000
    };
getRow(3407)->
    #dropCfg {
    dropId = 10240,
    dropType = 0,
    dataId = 11010,
    probability = 10,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 11010
    };
getRow(3408)->
    #dropCfg {
    dropId = 12010,
    dropType = 1,
    dataId = 12010,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3409)->
    #dropCfg {
    dropId = 12010,
    dropType = 0,
    dataId = 904,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3410)->
    #dropCfg {
    dropId = 18001,
    dropType = 1,
    dataId = 18001,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3411)->
    #dropCfg {
    dropId = 19999,
    dropType = 0,
    dataId = 19999,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 19999
    };
getRow(3412)->
    #dropCfg {
    dropId = 19999,
    dropType = 1,
    dataId = 19999,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 19999
    };
getRow(3413)->
    #dropCfg {
    dropId = 20000,
    dropType = 1,
    dataId = 200000,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 1,
    dropclass = 0
    };
getRow(3414)->
    #dropCfg {
    dropId = 20001,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3415)->
    #dropCfg {
    dropId = 20063,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3416)->
    #dropCfg {
    dropId = 20063,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3417)->
    #dropCfg {
    dropId = 20063,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3418)->
    #dropCfg {
    dropId = 20063,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3419)->
    #dropCfg {
    dropId = 20063,
    dropType = 0,
    dataId = 2005,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3420)->
    #dropCfg {
    dropId = 20064,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3421)->
    #dropCfg {
    dropId = 20064,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3422)->
    #dropCfg {
    dropId = 20064,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3423)->
    #dropCfg {
    dropId = 20064,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3424)->
    #dropCfg {
    dropId = 20064,
    dropType = 0,
    dataId = 2006,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3425)->
    #dropCfg {
    dropId = 20064,
    dropType = 0,
    dataId = 223,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3426)->
    #dropCfg {
    dropId = 20064,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3427)->
    #dropCfg {
    dropId = 20065,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3428)->
    #dropCfg {
    dropId = 20065,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 200,
    max = 200,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3429)->
    #dropCfg {
    dropId = 20065,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3430)->
    #dropCfg {
    dropId = 20065,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3431)->
    #dropCfg {
    dropId = 20065,
    dropType = 0,
    dataId = 2007,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3432)->
    #dropCfg {
    dropId = 20065,
    dropType = 0,
    dataId = 223,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3433)->
    #dropCfg {
    dropId = 20065,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3434)->
    #dropCfg {
    dropId = 20066,
    dropType = 0,
    dataId = 383,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3435)->
    #dropCfg {
    dropId = 20067,
    dropType = 0,
    dataId = 383,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3436)->
    #dropCfg {
    dropId = 20068,
    dropType = 0,
    dataId = 383,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3437)->
    #dropCfg {
    dropId = 20069,
    dropType = 0,
    dataId = 384,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3438)->
    #dropCfg {
    dropId = 20070,
    dropType = 0,
    dataId = 384,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3439)->
    #dropCfg {
    dropId = 20071,
    dropType = 0,
    dataId = 384,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3440)->
    #dropCfg {
    dropId = 20072,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3441)->
    #dropCfg {
    dropId = 20072,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3442)->
    #dropCfg {
    dropId = 20072,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3443)->
    #dropCfg {
    dropId = 20072,
    dropType = 0,
    dataId = 2102,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3444)->
    #dropCfg {
    dropId = 20073,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3445)->
    #dropCfg {
    dropId = 20073,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3446)->
    #dropCfg {
    dropId = 20073,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3447)->
    #dropCfg {
    dropId = 20073,
    dropType = 0,
    dataId = 2102,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3448)->
    #dropCfg {
    dropId = 20074,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3449)->
    #dropCfg {
    dropId = 20074,
    dropType = 0,
    dataId = 2600,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3450)->
    #dropCfg {
    dropId = 20075,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3451)->
    #dropCfg {
    dropId = 20075,
    dropType = 0,
    dataId = 2600,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3452)->
    #dropCfg {
    dropId = 20076,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3453)->
    #dropCfg {
    dropId = 20076,
    dropType = 0,
    dataId = 2600,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3454)->
    #dropCfg {
    dropId = 20077,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3455)->
    #dropCfg {
    dropId = 20077,
    dropType = 0,
    dataId = 2605,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3456)->
    #dropCfg {
    dropId = 20078,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3457)->
    #dropCfg {
    dropId = 20078,
    dropType = 0,
    dataId = 2605,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3458)->
    #dropCfg {
    dropId = 20079,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3459)->
    #dropCfg {
    dropId = 20079,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3460)->
    #dropCfg {
    dropId = 20079,
    dropType = 0,
    dataId = 2005,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3461)->
    #dropCfg {
    dropId = 20080,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3462)->
    #dropCfg {
    dropId = 20080,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3463)->
    #dropCfg {
    dropId = 20080,
    dropType = 0,
    dataId = 2006,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3464)->
    #dropCfg {
    dropId = 20081,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3465)->
    #dropCfg {
    dropId = 20081,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 200,
    max = 200,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3466)->
    #dropCfg {
    dropId = 20081,
    dropType = 0,
    dataId = 2007,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3467)->
    #dropCfg {
    dropId = 20082,
    dropType = 1,
    dataId = 2002,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3468)->
    #dropCfg {
    dropId = 20083,
    dropType = 1,
    dataId = 2000,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3469)->
    #dropCfg {
    dropId = 20084,
    dropType = 1,
    dataId = 2001,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3470)->
    #dropCfg {
    dropId = 30000,
    dropType = 0,
    dataId = 2022,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3471)->
    #dropCfg {
    dropId = 30001,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3472)->
    #dropCfg {
    dropId = 30002,
    dropType = 0,
    dataId = 2022,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3473)->
    #dropCfg {
    dropId = 30002,
    dropType = 0,
    dataId = 2004,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3474)->
    #dropCfg {
    dropId = 30003,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3475)->
    #dropCfg {
    dropId = 30003,
    dropType = 0,
    dataId = 2004,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3476)->
    #dropCfg {
    dropId = 30004,
    dropType = 0,
    dataId = 2022,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3477)->
    #dropCfg {
    dropId = 30004,
    dropType = 0,
    dataId = 2004,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3478)->
    #dropCfg {
    dropId = 30005,
    dropType = 0,
    dataId = 2002,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3479)->
    #dropCfg {
    dropId = 30006,
    dropType = 0,
    dataId = 2022,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3480)->
    #dropCfg {
    dropId = 35000,
    dropType = 0,
    dataId = 904,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3481)->
    #dropCfg {
    dropId = 35000,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 1
    };
getRow(3482)->
    #dropCfg {
    dropId = 35000,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 2
    };
getRow(3483)->
    #dropCfg {
    dropId = 35000,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 3
    };
getRow(3484)->
    #dropCfg {
    dropId = 35000,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 4
    };
getRow(3485)->
    #dropCfg {
    dropId = 35000,
    dropType = 0,
    dataId = 2102,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 5
    };
getRow(3486)->
    #dropCfg {
    dropId = 35000,
    dropType = 0,
    dataId = 1836,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 6
    };
getRow(3487)->
    #dropCfg {
    dropId = 35001,
    dropType = 1,
    dataId = 90071,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3488)->
    #dropCfg {
    dropId = 35002,
    dropType = 1,
    dataId = 90072,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3489)->
    #dropCfg {
    dropId = 35003,
    dropType = 0,
    dataId = 1932,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3490)->
    #dropCfg {
    dropId = 35003,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3491)->
    #dropCfg {
    dropId = 35004,
    dropType = 0,
    dataId = 1932,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3492)->
    #dropCfg {
    dropId = 35004,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3493)->
    #dropCfg {
    dropId = 35005,
    dropType = 0,
    dataId = 1932,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3494)->
    #dropCfg {
    dropId = 35005,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3495)->
    #dropCfg {
    dropId = 35005,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3496)->
    #dropCfg {
    dropId = 35006,
    dropType = 1,
    dataId = 90073,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3497)->
    #dropCfg {
    dropId = 35007,
    dropType = 1,
    dataId = 90074,
    probability = 10000,
    min = 1,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3498)->
    #dropCfg {
    dropId = 35008,
    dropType = 1,
    dataId = 90075,
    probability = 10000,
    min = 1,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3499)->
    #dropCfg {
    dropId = 35009,
    dropType = 1,
    dataId = 90076,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3500)->
    #dropCfg {
    dropId = 35010,
    dropType = 0,
    dataId = 4205,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3501)->
    #dropCfg {
    dropId = 35010,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 200,
    max = 200,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3502)->
    #dropCfg {
    dropId = 35010,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 100,
    max = 100,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3503)->
    #dropCfg {
    dropId = 35010,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3504)->
    #dropCfg {
    dropId = 35010,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3505)->
    #dropCfg {
    dropId = 35010,
    dropType = 0,
    dataId = 618,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3506)->
    #dropCfg {
    dropId = 50001,
    dropType = 3,
    dataId = 100000,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3507)->
    #dropCfg {
    dropId = 50002,
    dropType = 1,
    dataId = 100001,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3508)->
    #dropCfg {
    dropId = 51000,
    dropType = 1,
    dataId = 100002,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3509)->
    #dropCfg {
    dropId = 51001,
    dropType = 1,
    dataId = 100003,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3510)->
    #dropCfg {
    dropId = 100001,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3511)->
    #dropCfg {
    dropId = 100002,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3512)->
    #dropCfg {
    dropId = 100003,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3513)->
    #dropCfg {
    dropId = 100004,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3514)->
    #dropCfg {
    dropId = 200201,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 5,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3515)->
    #dropCfg {
    dropId = 200201,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3516)->
    #dropCfg {
    dropId = 200202,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 5,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3517)->
    #dropCfg {
    dropId = 200202,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3518)->
    #dropCfg {
    dropId = 200203,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 5,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3519)->
    #dropCfg {
    dropId = 200203,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3520)->
    #dropCfg {
    dropId = 200204,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 5,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3521)->
    #dropCfg {
    dropId = 200204,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3522)->
    #dropCfg {
    dropId = 200205,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 5,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3523)->
    #dropCfg {
    dropId = 200205,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3524)->
    #dropCfg {
    dropId = 200206,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 5,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3525)->
    #dropCfg {
    dropId = 200206,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3526)->
    #dropCfg {
    dropId = 200301,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 5,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3527)->
    #dropCfg {
    dropId = 200301,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3528)->
    #dropCfg {
    dropId = 200302,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 5,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3529)->
    #dropCfg {
    dropId = 200302,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3530)->
    #dropCfg {
    dropId = 300000,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3531)->
    #dropCfg {
    dropId = 300000,
    dropType = 1,
    dataId = 312000,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3532)->
    #dropCfg {
    dropId = 300001,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3533)->
    #dropCfg {
    dropId = 300001,
    dropType = 1,
    dataId = 312001,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3534)->
    #dropCfg {
    dropId = 300002,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3535)->
    #dropCfg {
    dropId = 300002,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 5,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3536)->
    #dropCfg {
    dropId = 300002,
    dropType = 1,
    dataId = 312002,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3537)->
    #dropCfg {
    dropId = 300003,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3538)->
    #dropCfg {
    dropId = 300003,
    dropType = 1,
    dataId = 312003,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3539)->
    #dropCfg {
    dropId = 300004,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3540)->
    #dropCfg {
    dropId = 300004,
    dropType = 1,
    dataId = 312004,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3541)->
    #dropCfg {
    dropId = 300005,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3542)->
    #dropCfg {
    dropId = 300005,
    dropType = 1,
    dataId = 312004,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3543)->
    #dropCfg {
    dropId = 300006,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3544)->
    #dropCfg {
    dropId = 300006,
    dropType = 1,
    dataId = 312004,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3545)->
    #dropCfg {
    dropId = 301000,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 12,
    max = 12,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3546)->
    #dropCfg {
    dropId = 301000,
    dropType = 1,
    dataId = 312001,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3547)->
    #dropCfg {
    dropId = 301000,
    dropType = 1,
    dataId = 313000,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3548)->
    #dropCfg {
    dropId = 301001,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3549)->
    #dropCfg {
    dropId = 301001,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3550)->
    #dropCfg {
    dropId = 301001,
    dropType = 1,
    dataId = 312002,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3551)->
    #dropCfg {
    dropId = 301001,
    dropType = 1,
    dataId = 313001,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3552)->
    #dropCfg {
    dropId = 301002,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 24,
    max = 24,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3553)->
    #dropCfg {
    dropId = 301002,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 27,
    max = 27,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3554)->
    #dropCfg {
    dropId = 301002,
    dropType = 1,
    dataId = 312003,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3555)->
    #dropCfg {
    dropId = 301002,
    dropType = 1,
    dataId = 313002,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3556)->
    #dropCfg {
    dropId = 301003,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3557)->
    #dropCfg {
    dropId = 301003,
    dropType = 0,
    dataId = 226,
    probability = 10000,
    min = 17,
    max = 17,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3558)->
    #dropCfg {
    dropId = 301003,
    dropType = 1,
    dataId = 312004,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3559)->
    #dropCfg {
    dropId = 301003,
    dropType = 1,
    dataId = 313003,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3560)->
    #dropCfg {
    dropId = 301004,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3561)->
    #dropCfg {
    dropId = 301004,
    dropType = 0,
    dataId = 226,
    probability = 10000,
    min = 17,
    max = 17,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3562)->
    #dropCfg {
    dropId = 301004,
    dropType = 1,
    dataId = 312004,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3563)->
    #dropCfg {
    dropId = 301004,
    dropType = 1,
    dataId = 313004,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3564)->
    #dropCfg {
    dropId = 301005,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3565)->
    #dropCfg {
    dropId = 301005,
    dropType = 0,
    dataId = 226,
    probability = 10000,
    min = 17,
    max = 17,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3566)->
    #dropCfg {
    dropId = 301005,
    dropType = 1,
    dataId = 312004,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3567)->
    #dropCfg {
    dropId = 301005,
    dropType = 1,
    dataId = 313005,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3568)->
    #dropCfg {
    dropId = 302000,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 72,
    max = 72,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3569)->
    #dropCfg {
    dropId = 302000,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3570)->
    #dropCfg {
    dropId = 302000,
    dropType = 1,
    dataId = 312003,
    probability = 4687,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3571)->
    #dropCfg {
    dropId = 302000,
    dropType = 1,
    dataId = 313002,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3572)->
    #dropCfg {
    dropId = 302001,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3573)->
    #dropCfg {
    dropId = 302001,
    dropType = 0,
    dataId = 226,
    probability = 10000,
    min = 17,
    max = 17,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3574)->
    #dropCfg {
    dropId = 302001,
    dropType = 1,
    dataId = 312004,
    probability = 4285,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3575)->
    #dropCfg {
    dropId = 302001,
    dropType = 1,
    dataId = 313003,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3576)->
    #dropCfg {
    dropId = 302002,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3577)->
    #dropCfg {
    dropId = 302002,
    dropType = 0,
    dataId = 226,
    probability = 10000,
    min = 17,
    max = 17,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3578)->
    #dropCfg {
    dropId = 302002,
    dropType = 1,
    dataId = 312004,
    probability = 4012,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3579)->
    #dropCfg {
    dropId = 302002,
    dropType = 1,
    dataId = 313004,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3580)->
    #dropCfg {
    dropId = 302003,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3581)->
    #dropCfg {
    dropId = 302003,
    dropType = 0,
    dataId = 226,
    probability = 10000,
    min = 17,
    max = 17,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3582)->
    #dropCfg {
    dropId = 302003,
    dropType = 1,
    dataId = 312004,
    probability = 3845,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3583)->
    #dropCfg {
    dropId = 302003,
    dropType = 1,
    dataId = 313005,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3584)->
    #dropCfg {
    dropId = 310003,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 12,
    max = 16,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3585)->
    #dropCfg {
    dropId = 310003,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 7,
    max = 9,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3586)->
    #dropCfg {
    dropId = 310004,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 10,
    max = 14,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3587)->
    #dropCfg {
    dropId = 310004,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 5,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3588)->
    #dropCfg {
    dropId = 310005,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 8,
    max = 12,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3589)->
    #dropCfg {
    dropId = 310005,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 4,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3590)->
    #dropCfg {
    dropId = 310006,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 6,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3591)->
    #dropCfg {
    dropId = 310006,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 3,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3592)->
    #dropCfg {
    dropId = 310007,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    min = 6,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3593)->
    #dropCfg {
    dropId = 310007,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 3,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3594)->
    #dropCfg {
    dropId = 310100,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 19,
    max = 23,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3595)->
    #dropCfg {
    dropId = 310100,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3596)->
    #dropCfg {
    dropId = 310100,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 30,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3597)->
    #dropCfg {
    dropId = 310100,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3598)->
    #dropCfg {
    dropId = 310101,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 12,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3599)->
    #dropCfg {
    dropId = 310101,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3600)->
    #dropCfg {
    dropId = 310101,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 10,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3601)->
    #dropCfg {
    dropId = 310101,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3602)->
    #dropCfg {
    dropId = 310102,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 10,
    max = 12,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3603)->
    #dropCfg {
    dropId = 310102,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3604)->
    #dropCfg {
    dropId = 310102,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 10,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3605)->
    #dropCfg {
    dropId = 310102,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3606)->
    #dropCfg {
    dropId = 310103,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 26,
    max = 32,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3607)->
    #dropCfg {
    dropId = 310103,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3608)->
    #dropCfg {
    dropId = 310103,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 40,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3609)->
    #dropCfg {
    dropId = 310103,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    min = 80,
    max = 80,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3610)->
    #dropCfg {
    dropId = 310104,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 9,
    max = 11,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3611)->
    #dropCfg {
    dropId = 310104,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3612)->
    #dropCfg {
    dropId = 310104,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3613)->
    #dropCfg {
    dropId = 310104,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3614)->
    #dropCfg {
    dropId = 310105,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 9,
    max = 11,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3615)->
    #dropCfg {
    dropId = 310105,
    dropType = 0,
    dataId = 270,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3616)->
    #dropCfg {
    dropId = 310105,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3617)->
    #dropCfg {
    dropId = 310105,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3618)->
    #dropCfg {
    dropId = 310106,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 49,
    max = 59,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3619)->
    #dropCfg {
    dropId = 310106,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3620)->
    #dropCfg {
    dropId = 310106,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 50,
    max = 70,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3621)->
    #dropCfg {
    dropId = 310106,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    min = 160,
    max = 160,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3622)->
    #dropCfg {
    dropId = 310107,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 16,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3623)->
    #dropCfg {
    dropId = 310107,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    min = 3,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3624)->
    #dropCfg {
    dropId = 310107,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 16,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3625)->
    #dropCfg {
    dropId = 310107,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    min = 3,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3626)->
    #dropCfg {
    dropId = 310108,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 16,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3627)->
    #dropCfg {
    dropId = 310108,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    min = 3,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3628)->
    #dropCfg {
    dropId = 310108,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 16,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3629)->
    #dropCfg {
    dropId = 310108,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    min = 3,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3630)->
    #dropCfg {
    dropId = 310109,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 16,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3631)->
    #dropCfg {
    dropId = 310109,
    dropType = 0,
    dataId = 605,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3632)->
    #dropCfg {
    dropId = 310109,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 16,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3633)->
    #dropCfg {
    dropId = 310109,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3634)->
    #dropCfg {
    dropId = 310110,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 5,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3635)->
    #dropCfg {
    dropId = 310110,
    dropType = 0,
    dataId = 603,
    probability = 10000,
    min = 4,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3636)->
    #dropCfg {
    dropId = 310110,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 5,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3637)->
    #dropCfg {
    dropId = 310110,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    min = 4,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3638)->
    #dropCfg {
    dropId = 310111,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 5,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3639)->
    #dropCfg {
    dropId = 310111,
    dropType = 0,
    dataId = 603,
    probability = 10000,
    min = 4,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3640)->
    #dropCfg {
    dropId = 310111,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 5,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3641)->
    #dropCfg {
    dropId = 310111,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    min = 4,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3642)->
    #dropCfg {
    dropId = 310112,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 16,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3643)->
    #dropCfg {
    dropId = 310112,
    dropType = 0,
    dataId = 605,
    probability = 10000,
    min = 3,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3644)->
    #dropCfg {
    dropId = 310112,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 16,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3645)->
    #dropCfg {
    dropId = 310112,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    min = 3,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3646)->
    #dropCfg {
    dropId = 310113,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 5,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3647)->
    #dropCfg {
    dropId = 310113,
    dropType = 0,
    dataId = 603,
    probability = 10000,
    min = 6,
    max = 9,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3648)->
    #dropCfg {
    dropId = 310113,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 5,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3649)->
    #dropCfg {
    dropId = 310113,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    min = 6,
    max = 9,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3650)->
    #dropCfg {
    dropId = 310114,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    min = 5,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3651)->
    #dropCfg {
    dropId = 310114,
    dropType = 0,
    dataId = 603,
    probability = 10000,
    min = 6,
    max = 9,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3652)->
    #dropCfg {
    dropId = 310114,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 5,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3653)->
    #dropCfg {
    dropId = 310114,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    min = 6,
    max = 9,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3654)->
    #dropCfg {
    dropId = 310200,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3655)->
    #dropCfg {
    dropId = 310200,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3656)->
    #dropCfg {
    dropId = 310201,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    min = 18,
    max = 18,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3657)->
    #dropCfg {
    dropId = 310201,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 18,
    max = 18,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3658)->
    #dropCfg {
    dropId = 310202,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    min = 16,
    max = 16,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3659)->
    #dropCfg {
    dropId = 310202,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 16,
    max = 16,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3660)->
    #dropCfg {
    dropId = 310203,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    min = 14,
    max = 14,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3661)->
    #dropCfg {
    dropId = 310203,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3662)->
    #dropCfg {
    dropId = 310204,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    min = 12,
    max = 12,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3663)->
    #dropCfg {
    dropId = 310204,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 13,
    max = 13,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3664)->
    #dropCfg {
    dropId = 310205,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3665)->
    #dropCfg {
    dropId = 310205,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 11,
    max = 11,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3666)->
    #dropCfg {
    dropId = 310206,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3667)->
    #dropCfg {
    dropId = 310206,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3668)->
    #dropCfg {
    dropId = 310207,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3669)->
    #dropCfg {
    dropId = 310207,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3670)->
    #dropCfg {
    dropId = 310208,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3671)->
    #dropCfg {
    dropId = 310208,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3672)->
    #dropCfg {
    dropId = 310209,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3673)->
    #dropCfg {
    dropId = 310209,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3674)->
    #dropCfg {
    dropId = 310210,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3675)->
    #dropCfg {
    dropId = 310210,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3676)->
    #dropCfg {
    dropId = 310300,
    dropType = 0,
    dataId = 4303,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3677)->
    #dropCfg {
    dropId = 310301,
    dropType = 0,
    dataId = 4303,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3678)->
    #dropCfg {
    dropId = 310302,
    dropType = 0,
    dataId = 4303,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3679)->
    #dropCfg {
    dropId = 310303,
    dropType = 0,
    dataId = 4303,
    probability = 10000,
    min = 14,
    max = 14,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3680)->
    #dropCfg {
    dropId = 310304,
    dropType = 0,
    dataId = 4303,
    probability = 10000,
    min = 16,
    max = 16,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3681)->
    #dropCfg {
    dropId = 310305,
    dropType = 0,
    dataId = 4303,
    probability = 10000,
    min = 16,
    max = 16,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3682)->
    #dropCfg {
    dropId = 310306,
    dropType = 0,
    dataId = 4303,
    probability = 10000,
    min = 16,
    max = 16,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3683)->
    #dropCfg {
    dropId = 311000,
    dropType = 0,
    dataId = 3160,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3684)->
    #dropCfg {
    dropId = 311000,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3685)->
    #dropCfg {
    dropId = 311001,
    dropType = 0,
    dataId = 3160,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3686)->
    #dropCfg {
    dropId = 311001,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3687)->
    #dropCfg {
    dropId = 311002,
    dropType = 0,
    dataId = 3160,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3688)->
    #dropCfg {
    dropId = 311002,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3689)->
    #dropCfg {
    dropId = 311003,
    dropType = 0,
    dataId = 3160,
    probability = 10000,
    min = 35,
    max = 35,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3690)->
    #dropCfg {
    dropId = 311003,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 35,
    max = 35,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3691)->
    #dropCfg {
    dropId = 311004,
    dropType = 0,
    dataId = 3160,
    probability = 10000,
    min = 45,
    max = 45,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3692)->
    #dropCfg {
    dropId = 311004,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 45,
    max = 45,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3693)->
    #dropCfg {
    dropId = 311005,
    dropType = 0,
    dataId = 3160,
    probability = 10000,
    min = 55,
    max = 55,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3694)->
    #dropCfg {
    dropId = 311005,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 55,
    max = 55,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3695)->
    #dropCfg {
    dropId = 311006,
    dropType = 0,
    dataId = 3160,
    probability = 10000,
    min = 65,
    max = 65,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3696)->
    #dropCfg {
    dropId = 311006,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 65,
    max = 65,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3697)->
    #dropCfg {
    dropId = 311007,
    dropType = 0,
    dataId = 3160,
    probability = 10000,
    min = 75,
    max = 75,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3698)->
    #dropCfg {
    dropId = 311007,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 75,
    max = 75,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3699)->
    #dropCfg {
    dropId = 311008,
    dropType = 0,
    dataId = 3160,
    probability = 10000,
    min = 85,
    max = 85,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3700)->
    #dropCfg {
    dropId = 311008,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 85,
    max = 85,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3701)->
    #dropCfg {
    dropId = 311009,
    dropType = 0,
    dataId = 3160,
    probability = 10000,
    min = 95,
    max = 95,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3702)->
    #dropCfg {
    dropId = 311009,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 95,
    max = 95,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3703)->
    #dropCfg {
    dropId = 311010,
    dropType = 0,
    dataId = 3161,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3704)->
    #dropCfg {
    dropId = 311010,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3705)->
    #dropCfg {
    dropId = 311011,
    dropType = 0,
    dataId = 3161,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3706)->
    #dropCfg {
    dropId = 311011,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3707)->
    #dropCfg {
    dropId = 311012,
    dropType = 0,
    dataId = 3161,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3708)->
    #dropCfg {
    dropId = 311012,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3709)->
    #dropCfg {
    dropId = 311013,
    dropType = 0,
    dataId = 3161,
    probability = 10000,
    min = 35,
    max = 35,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3710)->
    #dropCfg {
    dropId = 311013,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 35,
    max = 35,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3711)->
    #dropCfg {
    dropId = 311014,
    dropType = 0,
    dataId = 3161,
    probability = 10000,
    min = 45,
    max = 45,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3712)->
    #dropCfg {
    dropId = 311014,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 45,
    max = 45,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3713)->
    #dropCfg {
    dropId = 311015,
    dropType = 0,
    dataId = 3161,
    probability = 10000,
    min = 55,
    max = 55,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3714)->
    #dropCfg {
    dropId = 311015,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 55,
    max = 55,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3715)->
    #dropCfg {
    dropId = 311016,
    dropType = 0,
    dataId = 3161,
    probability = 10000,
    min = 65,
    max = 65,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3716)->
    #dropCfg {
    dropId = 311016,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 65,
    max = 65,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3717)->
    #dropCfg {
    dropId = 311017,
    dropType = 0,
    dataId = 3161,
    probability = 10000,
    min = 75,
    max = 75,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3718)->
    #dropCfg {
    dropId = 311017,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 75,
    max = 75,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3719)->
    #dropCfg {
    dropId = 311018,
    dropType = 0,
    dataId = 3161,
    probability = 10000,
    min = 85,
    max = 85,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3720)->
    #dropCfg {
    dropId = 311018,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 85,
    max = 85,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3721)->
    #dropCfg {
    dropId = 311019,
    dropType = 0,
    dataId = 3161,
    probability = 10000,
    min = 95,
    max = 95,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3722)->
    #dropCfg {
    dropId = 311019,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 95,
    max = 95,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3723)->
    #dropCfg {
    dropId = 311020,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3724)->
    #dropCfg {
    dropId = 311020,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3725)->
    #dropCfg {
    dropId = 311021,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3726)->
    #dropCfg {
    dropId = 311021,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3727)->
    #dropCfg {
    dropId = 311022,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3728)->
    #dropCfg {
    dropId = 311022,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3729)->
    #dropCfg {
    dropId = 311023,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    min = 35,
    max = 35,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3730)->
    #dropCfg {
    dropId = 311023,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 35,
    max = 35,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3731)->
    #dropCfg {
    dropId = 311024,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    min = 45,
    max = 45,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3732)->
    #dropCfg {
    dropId = 311024,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 45,
    max = 45,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3733)->
    #dropCfg {
    dropId = 311025,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    min = 55,
    max = 55,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3734)->
    #dropCfg {
    dropId = 311025,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 55,
    max = 55,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3735)->
    #dropCfg {
    dropId = 311026,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    min = 65,
    max = 65,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3736)->
    #dropCfg {
    dropId = 311026,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 65,
    max = 65,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3737)->
    #dropCfg {
    dropId = 311027,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    min = 75,
    max = 75,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3738)->
    #dropCfg {
    dropId = 311027,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 75,
    max = 75,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3739)->
    #dropCfg {
    dropId = 311028,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    min = 85,
    max = 85,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3740)->
    #dropCfg {
    dropId = 311028,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 85,
    max = 85,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3741)->
    #dropCfg {
    dropId = 311029,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    min = 95,
    max = 95,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3742)->
    #dropCfg {
    dropId = 311029,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 95,
    max = 95,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3743)->
    #dropCfg {
    dropId = 311030,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    min = 105,
    max = 105,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3744)->
    #dropCfg {
    dropId = 311030,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 105,
    max = 105,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3745)->
    #dropCfg {
    dropId = 311031,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    min = 115,
    max = 115,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3746)->
    #dropCfg {
    dropId = 311031,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 115,
    max = 115,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3747)->
    #dropCfg {
    dropId = 311032,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    min = 125,
    max = 125,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3748)->
    #dropCfg {
    dropId = 311032,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 125,
    max = 125,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3749)->
    #dropCfg {
    dropId = 312000,
    dropType = 1,
    dataId = 312000,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3750)->
    #dropCfg {
    dropId = 312001,
    dropType = 1,
    dataId = 312001,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3751)->
    #dropCfg {
    dropId = 312002,
    dropType = 1,
    dataId = 312002,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3752)->
    #dropCfg {
    dropId = 312003,
    dropType = 1,
    dataId = 312003,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3753)->
    #dropCfg {
    dropId = 312004,
    dropType = 1,
    dataId = 312004,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3754)->
    #dropCfg {
    dropId = 314000,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3755)->
    #dropCfg {
    dropId = 314000,
    dropType = 0,
    dataId = 700,
    probability = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3756)->
    #dropCfg {
    dropId = 314001,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3757)->
    #dropCfg {
    dropId = 314001,
    dropType = 0,
    dataId = 700,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3758)->
    #dropCfg {
    dropId = 314002,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3759)->
    #dropCfg {
    dropId = 314002,
    dropType = 0,
    dataId = 700,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3760)->
    #dropCfg {
    dropId = 314003,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3761)->
    #dropCfg {
    dropId = 314003,
    dropType = 0,
    dataId = 701,
    probability = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3762)->
    #dropCfg {
    dropId = 314004,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3763)->
    #dropCfg {
    dropId = 314004,
    dropType = 0,
    dataId = 700,
    probability = 4000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3764)->
    #dropCfg {
    dropId = 314005,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3765)->
    #dropCfg {
    dropId = 314005,
    dropType = 0,
    dataId = 700,
    probability = 2500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3766)->
    #dropCfg {
    dropId = 314006,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3767)->
    #dropCfg {
    dropId = 314006,
    dropType = 0,
    dataId = 700,
    probability = 9000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3768)->
    #dropCfg {
    dropId = 314007,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3769)->
    #dropCfg {
    dropId = 314007,
    dropType = 0,
    dataId = 701,
    probability = 4000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3770)->
    #dropCfg {
    dropId = 314008,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3771)->
    #dropCfg {
    dropId = 314008,
    dropType = 0,
    dataId = 700,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3772)->
    #dropCfg {
    dropId = 314009,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3773)->
    #dropCfg {
    dropId = 314009,
    dropType = 0,
    dataId = 700,
    probability = 7500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3774)->
    #dropCfg {
    dropId = 314010,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3775)->
    #dropCfg {
    dropId = 314010,
    dropType = 0,
    dataId = 700,
    probability = 6500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3776)->
    #dropCfg {
    dropId = 314011,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3777)->
    #dropCfg {
    dropId = 314011,
    dropType = 0,
    dataId = 701,
    probability = 8400,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3778)->
    #dropCfg {
    dropId = 314012,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3779)->
    #dropCfg {
    dropId = 314012,
    dropType = 0,
    dataId = 700,
    probability = 2500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3780)->
    #dropCfg {
    dropId = 314013,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3781)->
    #dropCfg {
    dropId = 314013,
    dropType = 0,
    dataId = 700,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3782)->
    #dropCfg {
    dropId = 314014,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    min = 9,
    max = 9,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3783)->
    #dropCfg {
    dropId = 314014,
    dropType = 0,
    dataId = 700,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3784)->
    #dropCfg {
    dropId = 314015,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3785)->
    #dropCfg {
    dropId = 314015,
    dropType = 0,
    dataId = 701,
    probability = 3200,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3786)->
    #dropCfg {
    dropId = 314016,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3787)->
    #dropCfg {
    dropId = 314016,
    dropType = 0,
    dataId = 700,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3788)->
    #dropCfg {
    dropId = 314017,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3789)->
    #dropCfg {
    dropId = 314017,
    dropType = 0,
    dataId = 700,
    probability = 7600,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3790)->
    #dropCfg {
    dropId = 314018,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3791)->
    #dropCfg {
    dropId = 314018,
    dropType = 0,
    dataId = 700,
    probability = 6400,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3792)->
    #dropCfg {
    dropId = 314019,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3793)->
    #dropCfg {
    dropId = 314019,
    dropType = 0,
    dataId = 701,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3794)->
    #dropCfg {
    dropId = 314020,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3795)->
    #dropCfg {
    dropId = 314020,
    dropType = 0,
    dataId = 700,
    probability = 2500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3796)->
    #dropCfg {
    dropId = 314021,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3797)->
    #dropCfg {
    dropId = 314021,
    dropType = 0,
    dataId = 700,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3798)->
    #dropCfg {
    dropId = 314022,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    min = 9,
    max = 9,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3799)->
    #dropCfg {
    dropId = 314022,
    dropType = 0,
    dataId = 700,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3800)->
    #dropCfg {
    dropId = 314023,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3801)->
    #dropCfg {
    dropId = 314023,
    dropType = 0,
    dataId = 701,
    probability = 2800,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3802)->
    #dropCfg {
    dropId = 314024,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3803)->
    #dropCfg {
    dropId = 314024,
    dropType = 0,
    dataId = 700,
    probability = 7500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3804)->
    #dropCfg {
    dropId = 314025,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3805)->
    #dropCfg {
    dropId = 314025,
    dropType = 0,
    dataId = 700,
    probability = 9000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3806)->
    #dropCfg {
    dropId = 314026,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3807)->
    #dropCfg {
    dropId = 314026,
    dropType = 0,
    dataId = 700,
    probability = 4500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3808)->
    #dropCfg {
    dropId = 314027,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3809)->
    #dropCfg {
    dropId = 314027,
    dropType = 0,
    dataId = 701,
    probability = 8050,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3810)->
    #dropCfg {
    dropId = 314028,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3811)->
    #dropCfg {
    dropId = 314028,
    dropType = 0,
    dataId = 700,
    probability = 3000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3812)->
    #dropCfg {
    dropId = 314029,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3813)->
    #dropCfg {
    dropId = 314029,
    dropType = 0,
    dataId = 700,
    probability = 5500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3814)->
    #dropCfg {
    dropId = 314030,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    min = 11,
    max = 11,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3815)->
    #dropCfg {
    dropId = 314030,
    dropType = 0,
    dataId = 700,
    probability = 4500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3816)->
    #dropCfg {
    dropId = 314031,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3817)->
    #dropCfg {
    dropId = 314031,
    dropType = 0,
    dataId = 701,
    probability = 3850,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3818)->
    #dropCfg {
    dropId = 314032,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3819)->
    #dropCfg {
    dropId = 314032,
    dropType = 0,
    dataId = 700,
    probability = 4000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3820)->
    #dropCfg {
    dropId = 314033,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3821)->
    #dropCfg {
    dropId = 314033,
    dropType = 0,
    dataId = 700,
    probability = 8800,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3822)->
    #dropCfg {
    dropId = 314034,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3823)->
    #dropCfg {
    dropId = 314034,
    dropType = 0,
    dataId = 700,
    probability = 3200,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3824)->
    #dropCfg {
    dropId = 314035,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3825)->
    #dropCfg {
    dropId = 314035,
    dropType = 0,
    dataId = 701,
    probability = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3826)->
    #dropCfg {
    dropId = 314036,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3827)->
    #dropCfg {
    dropId = 314036,
    dropType = 0,
    dataId = 700,
    probability = 6400,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3828)->
    #dropCfg {
    dropId = 314037,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3829)->
    #dropCfg {
    dropId = 314037,
    dropType = 0,
    dataId = 700,
    probability = 1600,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3830)->
    #dropCfg {
    dropId = 314038,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3831)->
    #dropCfg {
    dropId = 314038,
    dropType = 0,
    dataId = 700,
    probability = 7400,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3832)->
    #dropCfg {
    dropId = 314039,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3833)->
    #dropCfg {
    dropId = 314039,
    dropType = 0,
    dataId = 701,
    probability = 6000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3834)->
    #dropCfg {
    dropId = 314040,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3835)->
    #dropCfg {
    dropId = 314040,
    dropType = 0,
    dataId = 700,
    probability = 9000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3836)->
    #dropCfg {
    dropId = 314041,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3837)->
    #dropCfg {
    dropId = 314041,
    dropType = 0,
    dataId = 700,
    probability = 4600,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3838)->
    #dropCfg {
    dropId = 314042,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3839)->
    #dropCfg {
    dropId = 314042,
    dropType = 0,
    dataId = 700,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3840)->
    #dropCfg {
    dropId = 314043,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3841)->
    #dropCfg {
    dropId = 314043,
    dropType = 0,
    dataId = 701,
    probability = 2600,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3842)->
    #dropCfg {
    dropId = 314044,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3843)->
    #dropCfg {
    dropId = 314044,
    dropType = 0,
    dataId = 700,
    probability = 1800,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3844)->
    #dropCfg {
    dropId = 314045,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3845)->
    #dropCfg {
    dropId = 314045,
    dropType = 0,
    dataId = 700,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3846)->
    #dropCfg {
    dropId = 314046,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3847)->
    #dropCfg {
    dropId = 314046,
    dropType = 0,
    dataId = 700,
    probability = 7200,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3848)->
    #dropCfg {
    dropId = 314047,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3849)->
    #dropCfg {
    dropId = 314047,
    dropType = 0,
    dataId = 701,
    probability = 9850,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3850)->
    #dropCfg {
    dropId = 314048,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3851)->
    #dropCfg {
    dropId = 314048,
    dropType = 0,
    dataId = 700,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3852)->
    #dropCfg {
    dropId = 314049,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3853)->
    #dropCfg {
    dropId = 314049,
    dropType = 0,
    dataId = 700,
    probability = 8400,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3854)->
    #dropCfg {
    dropId = 314050,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3855)->
    #dropCfg {
    dropId = 314050,
    dropType = 0,
    dataId = 700,
    probability = 7600,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3856)->
    #dropCfg {
    dropId = 314051,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3857)->
    #dropCfg {
    dropId = 314051,
    dropType = 0,
    dataId = 701,
    probability = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3858)->
    #dropCfg {
    dropId = 314052,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3859)->
    #dropCfg {
    dropId = 314052,
    dropType = 0,
    dataId = 700,
    probability = 5200,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3860)->
    #dropCfg {
    dropId = 314053,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3861)->
    #dropCfg {
    dropId = 314053,
    dropType = 0,
    dataId = 700,
    probability = 2200,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3862)->
    #dropCfg {
    dropId = 314054,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3863)->
    #dropCfg {
    dropId = 314054,
    dropType = 0,
    dataId = 700,
    probability = 3200,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3864)->
    #dropCfg {
    dropId = 314055,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3865)->
    #dropCfg {
    dropId = 314055,
    dropType = 0,
    dataId = 701,
    probability = 8000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3866)->
    #dropCfg {
    dropId = 314056,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3867)->
    #dropCfg {
    dropId = 314056,
    dropType = 0,
    dataId = 700,
    probability = 8600,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3868)->
    #dropCfg {
    dropId = 314057,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3869)->
    #dropCfg {
    dropId = 314057,
    dropType = 0,
    dataId = 700,
    probability = 6400,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3870)->
    #dropCfg {
    dropId = 314058,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3871)->
    #dropCfg {
    dropId = 314058,
    dropType = 0,
    dataId = 700,
    probability = 9400,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3872)->
    #dropCfg {
    dropId = 314059,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 9,
    max = 9,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3873)->
    #dropCfg {
    dropId = 314059,
    dropType = 0,
    dataId = 701,
    probability = 6800,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3874)->
    #dropCfg {
    dropId = 314060,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3875)->
    #dropCfg {
    dropId = 314060,
    dropType = 0,
    dataId = 700,
    probability = 2400,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3876)->
    #dropCfg {
    dropId = 314061,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3877)->
    #dropCfg {
    dropId = 314061,
    dropType = 0,
    dataId = 700,
    probability = 1000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3878)->
    #dropCfg {
    dropId = 314062,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3879)->
    #dropCfg {
    dropId = 314062,
    dropType = 0,
    dataId = 700,
    probability = 6200,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3880)->
    #dropCfg {
    dropId = 314063,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3881)->
    #dropCfg {
    dropId = 314063,
    dropType = 0,
    dataId = 701,
    probability = 6450,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3882)->
    #dropCfg {
    dropId = 314064,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3883)->
    #dropCfg {
    dropId = 314064,
    dropType = 0,
    dataId = 700,
    probability = 6000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3884)->
    #dropCfg {
    dropId = 314065,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3885)->
    #dropCfg {
    dropId = 314065,
    dropType = 0,
    dataId = 700,
    probability = 9200,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3886)->
    #dropCfg {
    dropId = 314066,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3887)->
    #dropCfg {
    dropId = 314066,
    dropType = 0,
    dataId = 700,
    probability = 8800,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3888)->
    #dropCfg {
    dropId = 314067,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3889)->
    #dropCfg {
    dropId = 314067,
    dropType = 0,
    dataId = 701,
    probability = 4000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3890)->
    #dropCfg {
    dropId = 314068,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3891)->
    #dropCfg {
    dropId = 314068,
    dropType = 0,
    dataId = 700,
    probability = 7600,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3892)->
    #dropCfg {
    dropId = 314069,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3893)->
    #dropCfg {
    dropId = 314069,
    dropType = 0,
    dataId = 700,
    probability = 1100,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3894)->
    #dropCfg {
    dropId = 314070,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3895)->
    #dropCfg {
    dropId = 314070,
    dropType = 0,
    dataId = 700,
    probability = 1650,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3896)->
    #dropCfg {
    dropId = 314071,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3897)->
    #dropCfg {
    dropId = 314071,
    dropType = 0,
    dataId = 701,
    probability = 400,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3898)->
    #dropCfg {
    dropId = 314072,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3899)->
    #dropCfg {
    dropId = 314072,
    dropType = 0,
    dataId = 700,
    probability = 9350,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3900)->
    #dropCfg {
    dropId = 314073,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3901)->
    #dropCfg {
    dropId = 314073,
    dropType = 0,
    dataId = 700,
    probability = 3200,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3902)->
    #dropCfg {
    dropId = 314074,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3903)->
    #dropCfg {
    dropId = 314074,
    dropType = 0,
    dataId = 700,
    probability = 4800,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3904)->
    #dropCfg {
    dropId = 314075,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    min = 7,
    max = 7,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3905)->
    #dropCfg {
    dropId = 314075,
    dropType = 0,
    dataId = 701,
    probability = 7440,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3906)->
    #dropCfg {
    dropId = 314076,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3907)->
    #dropCfg {
    dropId = 314076,
    dropType = 0,
    dataId = 700,
    probability = 1250,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3908)->
    #dropCfg {
    dropId = 314077,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3909)->
    #dropCfg {
    dropId = 314077,
    dropType = 0,
    dataId = 700,
    probability = 5500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3910)->
    #dropCfg {
    dropId = 314078,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3911)->
    #dropCfg {
    dropId = 314078,
    dropType = 0,
    dataId = 700,
    probability = 8250,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3912)->
    #dropCfg {
    dropId = 314079,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3913)->
    #dropCfg {
    dropId = 314079,
    dropType = 0,
    dataId = 701,
    probability = 5180,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3914)->
    #dropCfg {
    dropId = 314080,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 0,
    max = 0,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3915)->
    #dropCfg {
    dropId = 314080,
    dropType = 0,
    dataId = 700,
    probability = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3916)->
    #dropCfg {
    dropId = 314081,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 0,
    max = 0,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3917)->
    #dropCfg {
    dropId = 314081,
    dropType = 0,
    dataId = 700,
    probability = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3918)->
    #dropCfg {
    dropId = 314082,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 0,
    max = 0,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3919)->
    #dropCfg {
    dropId = 314082,
    dropType = 0,
    dataId = 700,
    probability = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3920)->
    #dropCfg {
    dropId = 314083,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    min = 0,
    max = 0,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3921)->
    #dropCfg {
    dropId = 314083,
    dropType = 0,
    dataId = 701,
    probability = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3922)->
    #dropCfg {
    dropId = 314084,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 0,
    max = 0,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3923)->
    #dropCfg {
    dropId = 314084,
    dropType = 0,
    dataId = 700,
    probability = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3924)->
    #dropCfg {
    dropId = 314085,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 0,
    max = 0,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3925)->
    #dropCfg {
    dropId = 314085,
    dropType = 0,
    dataId = 700,
    probability = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3926)->
    #dropCfg {
    dropId = 314086,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 0,
    max = 0,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3927)->
    #dropCfg {
    dropId = 314086,
    dropType = 0,
    dataId = 700,
    probability = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3928)->
    #dropCfg {
    dropId = 314087,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    min = 0,
    max = 0,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3929)->
    #dropCfg {
    dropId = 314087,
    dropType = 0,
    dataId = 701,
    probability = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3930)->
    #dropCfg {
    dropId = 314088,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 0,
    max = 0,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3931)->
    #dropCfg {
    dropId = 314088,
    dropType = 0,
    dataId = 700,
    probability = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3932)->
    #dropCfg {
    dropId = 314089,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 0,
    max = 0,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3933)->
    #dropCfg {
    dropId = 314089,
    dropType = 0,
    dataId = 700,
    probability = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3934)->
    #dropCfg {
    dropId = 314090,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 0,
    max = 0,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3935)->
    #dropCfg {
    dropId = 314090,
    dropType = 0,
    dataId = 700,
    probability = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3936)->
    #dropCfg {
    dropId = 314091,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    min = 0,
    max = 0,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3937)->
    #dropCfg {
    dropId = 314091,
    dropType = 0,
    dataId = 701,
    probability = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3938)->
    #dropCfg {
    dropId = 314092,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 0,
    max = 0,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3939)->
    #dropCfg {
    dropId = 314092,
    dropType = 0,
    dataId = 700,
    probability = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3940)->
    #dropCfg {
    dropId = 314093,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 0,
    max = 0,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3941)->
    #dropCfg {
    dropId = 314093,
    dropType = 0,
    dataId = 700,
    probability = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3942)->
    #dropCfg {
    dropId = 314094,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    min = 0,
    max = 0,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3943)->
    #dropCfg {
    dropId = 314094,
    dropType = 0,
    dataId = 700,
    probability = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3944)->
    #dropCfg {
    dropId = 314095,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    min = 0,
    max = 0,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3945)->
    #dropCfg {
    dropId = 314095,
    dropType = 0,
    dataId = 701,
    probability = 0,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3946)->
    #dropCfg {
    dropId = 315000,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    min = 42,
    max = 42,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3947)->
    #dropCfg {
    dropId = 315001,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    min = 63,
    max = 63,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3948)->
    #dropCfg {
    dropId = 315002,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3949)->
    #dropCfg {
    dropId = 315003,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3950)->
    #dropCfg {
    dropId = 315004,
    dropType = 0,
    dataId = 7002,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3951)->
    #dropCfg {
    dropId = 315005,
    dropType = 0,
    dataId = 7002,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3952)->
    #dropCfg {
    dropId = 315006,
    dropType = 0,
    dataId = 7003,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3953)->
    #dropCfg {
    dropId = 315007,
    dropType = 0,
    dataId = 7003,
    probability = 10000,
    min = 7,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3954)->
    #dropCfg {
    dropId = 315008,
    dropType = 0,
    dataId = 7004,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3955)->
    #dropCfg {
    dropId = 315009,
    dropType = 0,
    dataId = 7004,
    probability = 10000,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3956)->
    #dropCfg {
    dropId = 316000,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    min = 135,
    max = 135,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3957)->
    #dropCfg {
    dropId = 316001,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3958)->
    #dropCfg {
    dropId = 316002,
    dropType = 0,
    dataId = 7002,
    probability = 10000,
    min = 7,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3959)->
    #dropCfg {
    dropId = 316003,
    dropType = 0,
    dataId = 7003,
    probability = 10000,
    min = 14,
    max = 14,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3960)->
    #dropCfg {
    dropId = 316004,
    dropType = 0,
    dataId = 7004,
    probability = 10000,
    min = 18,
    max = 18,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3961)->
    #dropCfg {
    dropId = 317000,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 27,
    max = 27,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3962)->
    #dropCfg {
    dropId = 317001,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 36,
    max = 36,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3963)->
    #dropCfg {
    dropId = 317002,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 45,
    max = 45,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3964)->
    #dropCfg {
    dropId = 317003,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 72,
    max = 72,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3965)->
    #dropCfg {
    dropId = 318000,
    dropType = 0,
    dataId = 270,
    probability = 50,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3966)->
    #dropCfg {
    dropId = 318000,
    dropType = 1,
    dataId = 312002,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3967)->
    #dropCfg {
    dropId = 318001,
    dropType = 0,
    dataId = 270,
    probability = 50,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3968)->
    #dropCfg {
    dropId = 318001,
    dropType = 1,
    dataId = 312002,
    probability = 500,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3969)->
    #dropCfg {
    dropId = 318002,
    dropType = 0,
    dataId = 270,
    probability = 50,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3970)->
    #dropCfg {
    dropId = 318003,
    dropType = 0,
    dataId = 270,
    probability = 50,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3971)->
    #dropCfg {
    dropId = 318004,
    dropType = 0,
    dataId = 270,
    probability = 50,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3972)->
    #dropCfg {
    dropId = 319000,
    dropType = 1,
    dataId = 319000,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3973)->
    #dropCfg {
    dropId = 319001,
    dropType = 1,
    dataId = 319001,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3974)->
    #dropCfg {
    dropId = 319002,
    dropType = 1,
    dataId = 319002,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3975)->
    #dropCfg {
    dropId = 320000,
    dropType = 0,
    dataId = 4303,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3976)->
    #dropCfg {
    dropId = 320000,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3977)->
    #dropCfg {
    dropId = 320000,
    dropType = 0,
    dataId = 4305,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3978)->
    #dropCfg {
    dropId = 320001,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3979)->
    #dropCfg {
    dropId = 320002,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3980)->
    #dropCfg {
    dropId = 320003,
    dropType = 0,
    dataId = 2162,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3981)->
    #dropCfg {
    dropId = 320004,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3982)->
    #dropCfg {
    dropId = 320004,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    min = 10,
    max = 10,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3983)->
    #dropCfg {
    dropId = 320005,
    dropType = 0,
    dataId = 2600,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3984)->
    #dropCfg {
    dropId = 320006,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3985)->
    #dropCfg {
    dropId = 330000,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3986)->
    #dropCfg {
    dropId = 330000,
    dropType = 0,
    dataId = 2161,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3987)->
    #dropCfg {
    dropId = 330000,
    dropType = 0,
    dataId = 2162,
    probability = 1667,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3988)->
    #dropCfg {
    dropId = 330001,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3989)->
    #dropCfg {
    dropId = 330001,
    dropType = 0,
    dataId = 2161,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3990)->
    #dropCfg {
    dropId = 330001,
    dropType = 0,
    dataId = 2162,
    probability = 1750,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3991)->
    #dropCfg {
    dropId = 330002,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3992)->
    #dropCfg {
    dropId = 330002,
    dropType = 0,
    dataId = 2160,
    probability = 1250,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3993)->
    #dropCfg {
    dropId = 330002,
    dropType = 0,
    dataId = 2161,
    probability = 6250,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3994)->
    #dropCfg {
    dropId = 330002,
    dropType = 0,
    dataId = 2162,
    probability = 2250,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3995)->
    #dropCfg {
    dropId = 331000,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 1,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3996)->
    #dropCfg {
    dropId = 331000,
    dropType = 1,
    dataId = 331000,
    probability = 1750,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3997)->
    #dropCfg {
    dropId = 331000,
    dropType = 1,
    dataId = 331001,
    probability = 1250,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3998)->
    #dropCfg {
    dropId = 331000,
    dropType = 1,
    dataId = 331002,
    probability = 625,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(3999)->
    #dropCfg {
    dropId = 332000,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4000)->
    #dropCfg {
    dropId = 332000,
    dropType = 1,
    dataId = 331000,
    probability = 1875,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4001)->
    #dropCfg {
    dropId = 332000,
    dropType = 1,
    dataId = 331001,
    probability = 1375,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4002)->
    #dropCfg {
    dropId = 332000,
    dropType = 1,
    dataId = 331002,
    probability = 750,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4003)->
    #dropCfg {
    dropId = 333000,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4004)->
    #dropCfg {
    dropId = 333000,
    dropType = 0,
    dataId = 201,
    probability = 1250,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4005)->
    #dropCfg {
    dropId = 333000,
    dropType = 1,
    dataId = 331000,
    probability = 2000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4006)->
    #dropCfg {
    dropId = 333000,
    dropType = 1,
    dataId = 331001,
    probability = 1500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4007)->
    #dropCfg {
    dropId = 333000,
    dropType = 1,
    dataId = 331002,
    probability = 875,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4008)->
    #dropCfg {
    dropId = 340000,
    dropType = 2,
    dataId = 12,
    probability = 10000,
    min = 40,
    max = 40,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4009)->
    #dropCfg {
    dropId = 340001,
    dropType = 2,
    dataId = 12,
    probability = 10000,
    min = 60,
    max = 60,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4010)->
    #dropCfg {
    dropId = 340002,
    dropType = 2,
    dataId = 12,
    probability = 10000,
    min = 90,
    max = 90,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4011)->
    #dropCfg {
    dropId = 340002,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4012)->
    #dropCfg {
    dropId = 340003,
    dropType = 2,
    dataId = 12,
    probability = 10000,
    min = 120,
    max = 120,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4013)->
    #dropCfg {
    dropId = 340003,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    min = 25,
    max = 25,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4014)->
    #dropCfg {
    dropId = 350000,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4015)->
    #dropCfg {
    dropId = 350000,
    dropType = 0,
    dataId = 20,
    probability = 1666,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4016)->
    #dropCfg {
    dropId = 350001,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4017)->
    #dropCfg {
    dropId = 350001,
    dropType = 0,
    dataId = 20,
    probability = 3611,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4018)->
    #dropCfg {
    dropId = 350002,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4019)->
    #dropCfg {
    dropId = 350002,
    dropType = 0,
    dataId = 20,
    probability = 5555,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4020)->
    #dropCfg {
    dropId = 350003,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4021)->
    #dropCfg {
    dropId = 350003,
    dropType = 0,
    dataId = 20,
    probability = 7500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4022)->
    #dropCfg {
    dropId = 350004,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4023)->
    #dropCfg {
    dropId = 350004,
    dropType = 0,
    dataId = 20,
    probability = 9444,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4024)->
    #dropCfg {
    dropId = 350005,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4025)->
    #dropCfg {
    dropId = 350005,
    dropType = 0,
    dataId = 20,
    probability = 1388,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4026)->
    #dropCfg {
    dropId = 350006,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4027)->
    #dropCfg {
    dropId = 350006,
    dropType = 0,
    dataId = 20,
    probability = 3333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4028)->
    #dropCfg {
    dropId = 350007,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4029)->
    #dropCfg {
    dropId = 350007,
    dropType = 0,
    dataId = 20,
    probability = 5277,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4030)->
    #dropCfg {
    dropId = 350008,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4031)->
    #dropCfg {
    dropId = 350008,
    dropType = 0,
    dataId = 20,
    probability = 7222,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4032)->
    #dropCfg {
    dropId = 350009,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 2,
    max = 2,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4033)->
    #dropCfg {
    dropId = 350009,
    dropType = 0,
    dataId = 20,
    probability = 9166,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4034)->
    #dropCfg {
    dropId = 350010,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4035)->
    #dropCfg {
    dropId = 350010,
    dropType = 0,
    dataId = 20,
    probability = 1111,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4036)->
    #dropCfg {
    dropId = 350011,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4037)->
    #dropCfg {
    dropId = 350011,
    dropType = 0,
    dataId = 20,
    probability = 3055,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4038)->
    #dropCfg {
    dropId = 350012,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4039)->
    #dropCfg {
    dropId = 350012,
    dropType = 0,
    dataId = 20,
    probability = 5000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4040)->
    #dropCfg {
    dropId = 350013,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4041)->
    #dropCfg {
    dropId = 350013,
    dropType = 0,
    dataId = 20,
    probability = 6944,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4042)->
    #dropCfg {
    dropId = 350014,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 3,
    max = 3,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4043)->
    #dropCfg {
    dropId = 350014,
    dropType = 0,
    dataId = 20,
    probability = 8888,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4044)->
    #dropCfg {
    dropId = 350015,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4045)->
    #dropCfg {
    dropId = 350015,
    dropType = 0,
    dataId = 20,
    probability = 833,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4046)->
    #dropCfg {
    dropId = 350016,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4047)->
    #dropCfg {
    dropId = 350016,
    dropType = 0,
    dataId = 20,
    probability = 2777,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4048)->
    #dropCfg {
    dropId = 350017,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4049)->
    #dropCfg {
    dropId = 350017,
    dropType = 0,
    dataId = 20,
    probability = 4722,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4050)->
    #dropCfg {
    dropId = 350018,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4051)->
    #dropCfg {
    dropId = 350018,
    dropType = 0,
    dataId = 20,
    probability = 6666,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4052)->
    #dropCfg {
    dropId = 350019,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 4,
    max = 4,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4053)->
    #dropCfg {
    dropId = 350019,
    dropType = 0,
    dataId = 20,
    probability = 8611,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4054)->
    #dropCfg {
    dropId = 350020,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4055)->
    #dropCfg {
    dropId = 350020,
    dropType = 0,
    dataId = 20,
    probability = 555,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4056)->
    #dropCfg {
    dropId = 350021,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4057)->
    #dropCfg {
    dropId = 350021,
    dropType = 0,
    dataId = 20,
    probability = 2500,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4058)->
    #dropCfg {
    dropId = 350022,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4059)->
    #dropCfg {
    dropId = 350022,
    dropType = 0,
    dataId = 20,
    probability = 4444,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4060)->
    #dropCfg {
    dropId = 350023,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4061)->
    #dropCfg {
    dropId = 350023,
    dropType = 0,
    dataId = 20,
    probability = 6388,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4062)->
    #dropCfg {
    dropId = 350024,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 5,
    max = 5,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4063)->
    #dropCfg {
    dropId = 350024,
    dropType = 0,
    dataId = 20,
    probability = 8333,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4064)->
    #dropCfg {
    dropId = 350025,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4065)->
    #dropCfg {
    dropId = 350025,
    dropType = 0,
    dataId = 20,
    probability = 277,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4066)->
    #dropCfg {
    dropId = 350026,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4067)->
    #dropCfg {
    dropId = 350026,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4068)->
    #dropCfg {
    dropId = 350027,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4069)->
    #dropCfg {
    dropId = 350027,
    dropType = 0,
    dataId = 20,
    probability = 4166,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4070)->
    #dropCfg {
    dropId = 350028,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4071)->
    #dropCfg {
    dropId = 350028,
    dropType = 0,
    dataId = 20,
    probability = 6111,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4072)->
    #dropCfg {
    dropId = 350029,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 6,
    max = 6,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4073)->
    #dropCfg {
    dropId = 350029,
    dropType = 0,
    dataId = 20,
    probability = 8055,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4074)->
    #dropCfg {
    dropId = 351000,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 9,
    max = 9,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4075)->
    #dropCfg {
    dropId = 351001,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 11,
    max = 11,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4076)->
    #dropCfg {
    dropId = 351002,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 12,
    max = 12,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4077)->
    #dropCfg {
    dropId = 351003,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 14,
    max = 14,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4078)->
    #dropCfg {
    dropId = 351004,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 15,
    max = 15,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4079)->
    #dropCfg {
    dropId = 351005,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 17,
    max = 17,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4080)->
    #dropCfg {
    dropId = 351006,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 18,
    max = 18,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4081)->
    #dropCfg {
    dropId = 351007,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 20,
    max = 20,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4082)->
    #dropCfg {
    dropId = 351008,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 21,
    max = 21,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4083)->
    #dropCfg {
    dropId = 351009,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 23,
    max = 23,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4084)->
    #dropCfg {
    dropId = 351010,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 24,
    max = 24,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4085)->
    #dropCfg {
    dropId = 351011,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 26,
    max = 26,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4086)->
    #dropCfg {
    dropId = 351012,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 27,
    max = 27,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4087)->
    #dropCfg {
    dropId = 351013,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 29,
    max = 29,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4088)->
    #dropCfg {
    dropId = 351014,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 30,
    max = 30,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4089)->
    #dropCfg {
    dropId = 351015,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 32,
    max = 32,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4090)->
    #dropCfg {
    dropId = 351016,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 33,
    max = 33,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4091)->
    #dropCfg {
    dropId = 351017,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 35,
    max = 35,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4092)->
    #dropCfg {
    dropId = 351018,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 36,
    max = 36,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4093)->
    #dropCfg {
    dropId = 351019,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 38,
    max = 38,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4094)->
    #dropCfg {
    dropId = 351020,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 39,
    max = 39,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4095)->
    #dropCfg {
    dropId = 351021,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 41,
    max = 41,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4096)->
    #dropCfg {
    dropId = 351022,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 42,
    max = 42,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4097)->
    #dropCfg {
    dropId = 351023,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 44,
    max = 44,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4098)->
    #dropCfg {
    dropId = 351024,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 45,
    max = 45,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4099)->
    #dropCfg {
    dropId = 351025,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 47,
    max = 47,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4100)->
    #dropCfg {
    dropId = 351026,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 48,
    max = 48,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4101)->
    #dropCfg {
    dropId = 351027,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 50,
    max = 50,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4102)->
    #dropCfg {
    dropId = 351028,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 51,
    max = 51,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4103)->
    #dropCfg {
    dropId = 351029,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    min = 53,
    max = 53,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4104)->
    #dropCfg {
    dropId = 360000,
    dropType = 0,
    dataId = 27072,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4105)->
    #dropCfg {
    dropId = 360000,
    dropType = 0,
    dataId = 27073,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4106)->
    #dropCfg {
    dropId = 360000,
    dropType = 0,
    dataId = 27074,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4107)->
    #dropCfg {
    dropId = 360001,
    dropType = 0,
    dataId = 27075,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4108)->
    #dropCfg {
    dropId = 360001,
    dropType = 0,
    dataId = 27076,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4109)->
    #dropCfg {
    dropId = 360001,
    dropType = 0,
    dataId = 27077,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4110)->
    #dropCfg {
    dropId = 360002,
    dropType = 0,
    dataId = 27078,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4111)->
    #dropCfg {
    dropId = 360002,
    dropType = 0,
    dataId = 27079,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4112)->
    #dropCfg {
    dropId = 360002,
    dropType = 0,
    dataId = 27080,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4113)->
    #dropCfg {
    dropId = 360003,
    dropType = 0,
    dataId = 27081,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4114)->
    #dropCfg {
    dropId = 360003,
    dropType = 0,
    dataId = 27082,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4115)->
    #dropCfg {
    dropId = 360003,
    dropType = 0,
    dataId = 27083,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4116)->
    #dropCfg {
    dropId = 360004,
    dropType = 0,
    dataId = 27084,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4117)->
    #dropCfg {
    dropId = 360004,
    dropType = 0,
    dataId = 27085,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4118)->
    #dropCfg {
    dropId = 360004,
    dropType = 0,
    dataId = 27086,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4119)->
    #dropCfg {
    dropId = 360005,
    dropType = 0,
    dataId = 27087,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4120)->
    #dropCfg {
    dropId = 360005,
    dropType = 0,
    dataId = 27088,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4121)->
    #dropCfg {
    dropId = 360005,
    dropType = 0,
    dataId = 27089,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4122)->
    #dropCfg {
    dropId = 360006,
    dropType = 0,
    dataId = 27090,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4123)->
    #dropCfg {
    dropId = 360006,
    dropType = 0,
    dataId = 27091,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4124)->
    #dropCfg {
    dropId = 360006,
    dropType = 0,
    dataId = 27092,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4125)->
    #dropCfg {
    dropId = 360007,
    dropType = 0,
    dataId = 27093,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4126)->
    #dropCfg {
    dropId = 360007,
    dropType = 0,
    dataId = 27094,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4127)->
    #dropCfg {
    dropId = 360007,
    dropType = 0,
    dataId = 27095,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4128)->
    #dropCfg {
    dropId = 360008,
    dropType = 0,
    dataId = 27096,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4129)->
    #dropCfg {
    dropId = 360008,
    dropType = 0,
    dataId = 27097,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4130)->
    #dropCfg {
    dropId = 360008,
    dropType = 0,
    dataId = 27098,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4131)->
    #dropCfg {
    dropId = 360009,
    dropType = 0,
    dataId = 27099,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4132)->
    #dropCfg {
    dropId = 360009,
    dropType = 0,
    dataId = 27100,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4133)->
    #dropCfg {
    dropId = 360009,
    dropType = 0,
    dataId = 27101,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4134)->
    #dropCfg {
    dropId = 360010,
    dropType = 0,
    dataId = 27102,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4135)->
    #dropCfg {
    dropId = 360010,
    dropType = 0,
    dataId = 27103,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4136)->
    #dropCfg {
    dropId = 360010,
    dropType = 0,
    dataId = 27104,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4137)->
    #dropCfg {
    dropId = 360011,
    dropType = 0,
    dataId = 27105,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4138)->
    #dropCfg {
    dropId = 360011,
    dropType = 0,
    dataId = 27106,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4139)->
    #dropCfg {
    dropId = 360011,
    dropType = 0,
    dataId = 27107,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4140)->
    #dropCfg {
    dropId = 360012,
    dropType = 0,
    dataId = 27108,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4141)->
    #dropCfg {
    dropId = 360012,
    dropType = 0,
    dataId = 27109,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4142)->
    #dropCfg {
    dropId = 360012,
    dropType = 0,
    dataId = 27110,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4143)->
    #dropCfg {
    dropId = 360013,
    dropType = 0,
    dataId = 27111,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4144)->
    #dropCfg {
    dropId = 360013,
    dropType = 0,
    dataId = 27112,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4145)->
    #dropCfg {
    dropId = 360013,
    dropType = 0,
    dataId = 27113,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4146)->
    #dropCfg {
    dropId = 360014,
    dropType = 0,
    dataId = 27114,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4147)->
    #dropCfg {
    dropId = 360014,
    dropType = 0,
    dataId = 27115,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4148)->
    #dropCfg {
    dropId = 360014,
    dropType = 0,
    dataId = 27116,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4149)->
    #dropCfg {
    dropId = 360015,
    dropType = 0,
    dataId = 27117,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4150)->
    #dropCfg {
    dropId = 360015,
    dropType = 0,
    dataId = 27118,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4151)->
    #dropCfg {
    dropId = 360015,
    dropType = 0,
    dataId = 27119,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4152)->
    #dropCfg {
    dropId = 360016,
    dropType = 0,
    dataId = 27120,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4153)->
    #dropCfg {
    dropId = 360016,
    dropType = 0,
    dataId = 27121,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4154)->
    #dropCfg {
    dropId = 360016,
    dropType = 0,
    dataId = 27122,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4155)->
    #dropCfg {
    dropId = 360017,
    dropType = 0,
    dataId = 27123,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4156)->
    #dropCfg {
    dropId = 360017,
    dropType = 0,
    dataId = 27124,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
    };
getRow(4157)->
    #dropCfg {
    dropId = 360017,
    dropType = 0,
    dataId = 27125,
    probability = 10000,
    min = 1,
    max = 1,
    isbind = 0,
    dropcontrol = 0,
    dropclass = 0
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
    {33},
    {34},
    {35},
    {36},
    {37},
    {38},
    {39},
    {40},
    {41},
    {42},
    {43},
    {44},
    {45},
    {46},
    {47},
    {48},
    {49},
    {50},
    {51},
    {52},
    {53},
    {54},
    {55},
    {56},
    {57},
    {58},
    {59},
    {60},
    {61},
    {62},
    {63},
    {64},
    {65},
    {66},
    {67},
    {68},
    {69},
    {70},
    {71},
    {72},
    {73},
    {74},
    {75},
    {76},
    {77},
    {78},
    {79},
    {80},
    {81},
    {82},
    {83},
    {84},
    {85},
    {86},
    {87},
    {88},
    {89},
    {90},
    {91},
    {92},
    {93},
    {94},
    {95},
    {96},
    {97},
    {98},
    {99},
    {100},
    {101},
    {102},
    {103},
    {104},
    {105},
    {106},
    {107},
    {108},
    {109},
    {110},
    {111},
    {112},
    {113},
    {114},
    {115},
    {116},
    {117},
    {118},
    {119},
    {120},
    {121},
    {122},
    {123},
    {124},
    {125},
    {126},
    {127},
    {128},
    {129},
    {130},
    {131},
    {132},
    {133},
    {134},
    {135},
    {136},
    {137},
    {138},
    {139},
    {140},
    {141},
    {142},
    {143},
    {144},
    {145},
    {146},
    {147},
    {148},
    {149},
    {150},
    {151},
    {152},
    {153},
    {154},
    {155},
    {156},
    {157},
    {158},
    {159},
    {160},
    {161},
    {162},
    {163},
    {164},
    {165},
    {166},
    {167},
    {168},
    {169},
    {170},
    {171},
    {172},
    {173},
    {174},
    {175},
    {176},
    {177},
    {178},
    {179},
    {180},
    {181},
    {182},
    {183},
    {184},
    {185},
    {186},
    {187},
    {188},
    {189},
    {190},
    {191},
    {192},
    {193},
    {194},
    {195},
    {196},
    {197},
    {198},
    {199},
    {200},
    {201},
    {202},
    {203},
    {204},
    {205},
    {206},
    {207},
    {208},
    {209},
    {210},
    {211},
    {212},
    {213},
    {214},
    {215},
    {216},
    {217},
    {218},
    {219},
    {220},
    {221},
    {222},
    {223},
    {224},
    {225},
    {226},
    {227},
    {228},
    {229},
    {230},
    {231},
    {232},
    {233},
    {234},
    {235},
    {236},
    {237},
    {238},
    {239},
    {240},
    {241},
    {242},
    {243},
    {244},
    {245},
    {246},
    {247},
    {248},
    {249},
    {250},
    {251},
    {252},
    {253},
    {254},
    {255},
    {256},
    {257},
    {258},
    {259},
    {260},
    {261},
    {262},
    {263},
    {264},
    {265},
    {266},
    {267},
    {268},
    {269},
    {270},
    {271},
    {272},
    {273},
    {274},
    {275},
    {276},
    {277},
    {278},
    {279},
    {280},
    {281},
    {282},
    {283},
    {284},
    {285},
    {286},
    {287},
    {288},
    {289},
    {290},
    {291},
    {292},
    {293},
    {294},
    {295},
    {296},
    {297},
    {298},
    {299},
    {300},
    {301},
    {302},
    {303},
    {304},
    {305},
    {306},
    {307},
    {308},
    {309},
    {310},
    {311},
    {312},
    {313},
    {314},
    {315},
    {316},
    {317},
    {318},
    {319},
    {320},
    {321},
    {322},
    {323},
    {324},
    {325},
    {326},
    {327},
    {328},
    {329},
    {330},
    {331},
    {332},
    {333},
    {334},
    {335},
    {336},
    {337},
    {338},
    {339},
    {340},
    {341},
    {342},
    {343},
    {344},
    {345},
    {346},
    {347},
    {348},
    {349},
    {350},
    {351},
    {352},
    {353},
    {354},
    {355},
    {356},
    {357},
    {358},
    {359},
    {360},
    {361},
    {362},
    {363},
    {364},
    {365},
    {366},
    {367},
    {368},
    {369},
    {370},
    {371},
    {372},
    {373},
    {374},
    {375},
    {376},
    {377},
    {378},
    {379},
    {380},
    {381},
    {382},
    {383},
    {384},
    {385},
    {386},
    {387},
    {388},
    {389},
    {390},
    {391},
    {392},
    {393},
    {394},
    {395},
    {396},
    {397},
    {398},
    {399},
    {400},
    {401},
    {402},
    {403},
    {404},
    {405},
    {406},
    {407},
    {408},
    {409},
    {410},
    {411},
    {412},
    {413},
    {414},
    {415},
    {416},
    {417},
    {418},
    {419},
    {420},
    {421},
    {422},
    {423},
    {424},
    {425},
    {426},
    {427},
    {428},
    {429},
    {430},
    {431},
    {432},
    {433},
    {434},
    {435},
    {436},
    {437},
    {438},
    {439},
    {440},
    {441},
    {442},
    {443},
    {444},
    {445},
    {446},
    {447},
    {448},
    {449},
    {450},
    {451},
    {452},
    {453},
    {454},
    {455},
    {456},
    {457},
    {458},
    {459},
    {460},
    {461},
    {462},
    {463},
    {464},
    {465},
    {466},
    {467},
    {468},
    {469},
    {470},
    {471},
    {472},
    {473},
    {474},
    {475},
    {476},
    {477},
    {478},
    {479},
    {480},
    {481},
    {482},
    {483},
    {484},
    {485},
    {486},
    {487},
    {488},
    {489},
    {490},
    {491},
    {492},
    {493},
    {494},
    {495},
    {496},
    {497},
    {498},
    {499},
    {500},
    {501},
    {502},
    {503},
    {504},
    {505},
    {506},
    {507},
    {508},
    {509},
    {510},
    {511},
    {512},
    {513},
    {514},
    {515},
    {516},
    {517},
    {518},
    {519},
    {520},
    {521},
    {522},
    {523},
    {524},
    {525},
    {526},
    {527},
    {528},
    {529},
    {530},
    {531},
    {532},
    {533},
    {534},
    {535},
    {536},
    {537},
    {538},
    {539},
    {540},
    {541},
    {542},
    {543},
    {544},
    {545},
    {546},
    {547},
    {548},
    {549},
    {550},
    {551},
    {552},
    {553},
    {554},
    {555},
    {556},
    {557},
    {558},
    {559},
    {560},
    {561},
    {562},
    {563},
    {564},
    {565},
    {566},
    {567},
    {568},
    {569},
    {570},
    {571},
    {572},
    {573},
    {574},
    {575},
    {576},
    {577},
    {578},
    {579},
    {580},
    {581},
    {582},
    {583},
    {584},
    {585},
    {586},
    {587},
    {588},
    {589},
    {590},
    {591},
    {592},
    {593},
    {594},
    {595},
    {596},
    {597},
    {598},
    {599},
    {600},
    {601},
    {602},
    {603},
    {604},
    {605},
    {606},
    {607},
    {608},
    {609},
    {610},
    {611},
    {612},
    {613},
    {614},
    {615},
    {616},
    {617},
    {618},
    {619},
    {620},
    {621},
    {622},
    {623},
    {624},
    {625},
    {626},
    {627},
    {628},
    {629},
    {630},
    {631},
    {632},
    {633},
    {634},
    {635},
    {636},
    {637},
    {638},
    {639},
    {640},
    {641},
    {642},
    {643},
    {644},
    {645},
    {646},
    {647},
    {648},
    {649},
    {650},
    {651},
    {652},
    {653},
    {654},
    {655},
    {656},
    {657},
    {658},
    {659},
    {660},
    {661},
    {662},
    {663},
    {664},
    {665},
    {666},
    {667},
    {668},
    {669},
    {670},
    {671},
    {672},
    {673},
    {674},
    {675},
    {676},
    {677},
    {678},
    {679},
    {680},
    {681},
    {682},
    {683},
    {684},
    {685},
    {686},
    {687},
    {688},
    {689},
    {690},
    {691},
    {692},
    {693},
    {694},
    {695},
    {696},
    {697},
    {698},
    {699},
    {700},
    {701},
    {702},
    {703},
    {704},
    {705},
    {706},
    {707},
    {708},
    {709},
    {710},
    {711},
    {712},
    {713},
    {714},
    {715},
    {716},
    {717},
    {718},
    {719},
    {720},
    {721},
    {722},
    {723},
    {724},
    {725},
    {726},
    {727},
    {728},
    {729},
    {730},
    {731},
    {732},
    {733},
    {734},
    {735},
    {736},
    {737},
    {738},
    {739},
    {740},
    {741},
    {742},
    {743},
    {744},
    {745},
    {746},
    {747},
    {748},
    {749},
    {750},
    {751},
    {752},
    {753},
    {754},
    {755},
    {756},
    {757},
    {758},
    {759},
    {760},
    {761},
    {762},
    {763},
    {764},
    {765},
    {766},
    {767},
    {768},
    {769},
    {770},
    {771},
    {772},
    {773},
    {774},
    {775},
    {776},
    {777},
    {778},
    {779},
    {780},
    {781},
    {782},
    {783},
    {784},
    {785},
    {786},
    {787},
    {788},
    {789},
    {790},
    {791},
    {792},
    {793},
    {794},
    {795},
    {796},
    {797},
    {798},
    {799},
    {800},
    {801},
    {802},
    {803},
    {804},
    {805},
    {806},
    {807},
    {808},
    {809},
    {810},
    {811},
    {812},
    {813},
    {814},
    {815},
    {816},
    {817},
    {818},
    {819},
    {820},
    {821},
    {822},
    {823},
    {824},
    {825},
    {826},
    {827},
    {828},
    {829},
    {830},
    {831},
    {832},
    {833},
    {834},
    {835},
    {836},
    {837},
    {838},
    {839},
    {840},
    {841},
    {842},
    {843},
    {844},
    {845},
    {846},
    {847},
    {848},
    {849},
    {850},
    {851},
    {852},
    {853},
    {854},
    {855},
    {856},
    {857},
    {858},
    {859},
    {860},
    {861},
    {862},
    {863},
    {864},
    {865},
    {866},
    {867},
    {868},
    {869},
    {870},
    {871},
    {872},
    {873},
    {874},
    {875},
    {876},
    {877},
    {878},
    {879},
    {880},
    {881},
    {882},
    {883},
    {884},
    {885},
    {886},
    {887},
    {888},
    {889},
    {890},
    {891},
    {892},
    {893},
    {894},
    {895},
    {896},
    {897},
    {898},
    {899},
    {900},
    {901},
    {902},
    {903},
    {904},
    {905},
    {906},
    {907},
    {908},
    {909},
    {910},
    {911},
    {912},
    {913},
    {914},
    {915},
    {916},
    {917},
    {918},
    {919},
    {920},
    {921},
    {922},
    {923},
    {924},
    {925},
    {926},
    {927},
    {928},
    {929},
    {930},
    {931},
    {932},
    {933},
    {934},
    {935},
    {936},
    {937},
    {938},
    {939},
    {940},
    {941},
    {942},
    {943},
    {944},
    {945},
    {946},
    {947},
    {948},
    {949},
    {950},
    {951},
    {952},
    {953},
    {954},
    {955},
    {956},
    {957},
    {958},
    {959},
    {960},
    {961},
    {962},
    {963},
    {964},
    {965},
    {966},
    {967},
    {968},
    {969},
    {970},
    {971},
    {972},
    {973},
    {974},
    {975},
    {976},
    {977},
    {978},
    {979},
    {980},
    {981},
    {982},
    {983},
    {984},
    {985},
    {986},
    {987},
    {988},
    {989},
    {990},
    {991},
    {992},
    {993},
    {994},
    {995},
    {996},
    {997},
    {998},
    {999},
    {1000},
    {1001},
    {1002},
    {1003},
    {1004},
    {1005},
    {1006},
    {1007},
    {1008},
    {1009},
    {1010},
    {1011},
    {1012},
    {1013},
    {1014},
    {1015},
    {1016},
    {1017},
    {1018},
    {1019},
    {1020},
    {1021},
    {1022},
    {1023},
    {1024},
    {1025},
    {1026},
    {1027},
    {1028},
    {1029},
    {1030},
    {1031},
    {1032},
    {1033},
    {1034},
    {1035},
    {1036},
    {1037},
    {1038},
    {1039},
    {1040},
    {1041},
    {1042},
    {1043},
    {1044},
    {1045},
    {1046},
    {1047},
    {1048},
    {1049},
    {1050},
    {1051},
    {1052},
    {1053},
    {1054},
    {1055},
    {1056},
    {1057},
    {1058},
    {1059},
    {1060},
    {1061},
    {1062},
    {1063},
    {1064},
    {1065},
    {1066},
    {1067},
    {1068},
    {1069},
    {1070},
    {1071},
    {1072},
    {1073},
    {1074},
    {1075},
    {1076},
    {1077},
    {1078},
    {1079},
    {1080},
    {1081},
    {1082},
    {1083},
    {1084},
    {1085},
    {1086},
    {1087},
    {1088},
    {1089},
    {1090},
    {1091},
    {1092},
    {1093},
    {1094},
    {1095},
    {1096},
    {1097},
    {1098},
    {1099},
    {1100},
    {1101},
    {1102},
    {1103},
    {1104},
    {1105},
    {1106},
    {1107},
    {1108},
    {1109},
    {1110},
    {1111},
    {1112},
    {1113},
    {1114},
    {1115},
    {1116},
    {1117},
    {1118},
    {1119},
    {1120},
    {1121},
    {1122},
    {1123},
    {1124},
    {1125},
    {1126},
    {1127},
    {1128},
    {1129},
    {1130},
    {1131},
    {1132},
    {1133},
    {1134},
    {1135},
    {1136},
    {1137},
    {1138},
    {1139},
    {1140},
    {1141},
    {1142},
    {1143},
    {1144},
    {1145},
    {1146},
    {1147},
    {1148},
    {1149},
    {1150},
    {1151},
    {1152},
    {1153},
    {1154},
    {1155},
    {1156},
    {1157},
    {1158},
    {1159},
    {1160},
    {1161},
    {1162},
    {1163},
    {1164},
    {1165},
    {1166},
    {1167},
    {1168},
    {1169},
    {1170},
    {1171},
    {1172},
    {1173},
    {1174},
    {1175},
    {1176},
    {1177},
    {1178},
    {1179},
    {1180},
    {1181},
    {1182},
    {1183},
    {1184},
    {1185},
    {1186},
    {1187},
    {1188},
    {1189},
    {1190},
    {1191},
    {1192},
    {1193},
    {1194},
    {1195},
    {1196},
    {1197},
    {1198},
    {1199},
    {1200},
    {1201},
    {1202},
    {1203},
    {1204},
    {1205},
    {1206},
    {1207},
    {1208},
    {1209},
    {1210},
    {1211},
    {1212},
    {1213},
    {1214},
    {1215},
    {1216},
    {1217},
    {1218},
    {1219},
    {1220},
    {1221},
    {1222},
    {1223},
    {1224},
    {1225},
    {1226},
    {1227},
    {1228},
    {1229},
    {1230},
    {1231},
    {1232},
    {1233},
    {1234},
    {1235},
    {1236},
    {1237},
    {1238},
    {1239},
    {1240},
    {1241},
    {1242},
    {1243},
    {1244},
    {1245},
    {1246},
    {1247},
    {1248},
    {1249},
    {1250},
    {1251},
    {1252},
    {1253},
    {1254},
    {1255},
    {1256},
    {1257},
    {1258},
    {1259},
    {1260},
    {1261},
    {1262},
    {1263},
    {1264},
    {1265},
    {1266},
    {1267},
    {1268},
    {1269},
    {1270},
    {1271},
    {1272},
    {1273},
    {1274},
    {1275},
    {1276},
    {1277},
    {1278},
    {1279},
    {1280},
    {1281},
    {1282},
    {1283},
    {1284},
    {1285},
    {1286},
    {1287},
    {1288},
    {1289},
    {1290},
    {1291},
    {1292},
    {1293},
    {1294},
    {1295},
    {1296},
    {1297},
    {1298},
    {1299},
    {1300},
    {1301},
    {1302},
    {1303},
    {1304},
    {1305},
    {1306},
    {1307},
    {1308},
    {1309},
    {1310},
    {1311},
    {1312},
    {1313},
    {1314},
    {1315},
    {1316},
    {1317},
    {1318},
    {1319},
    {1320},
    {1321},
    {1322},
    {1323},
    {1324},
    {1325},
    {1326},
    {1327},
    {1328},
    {1329},
    {1330},
    {1331},
    {1332},
    {1333},
    {1334},
    {1335},
    {1336},
    {1337},
    {1338},
    {1339},
    {1340},
    {1341},
    {1342},
    {1343},
    {1344},
    {1345},
    {1346},
    {1347},
    {1348},
    {1349},
    {1350},
    {1351},
    {1352},
    {1353},
    {1354},
    {1355},
    {1356},
    {1357},
    {1358},
    {1359},
    {1360},
    {1361},
    {1362},
    {1363},
    {1364},
    {1365},
    {1366},
    {1367},
    {1368},
    {1369},
    {1370},
    {1371},
    {1372},
    {1373},
    {1374},
    {1375},
    {1376},
    {1377},
    {1378},
    {1379},
    {1380},
    {1381},
    {1382},
    {1383},
    {1384},
    {1385},
    {1386},
    {1387},
    {1388},
    {1389},
    {1390},
    {1391},
    {1392},
    {1393},
    {1394},
    {1395},
    {1396},
    {1397},
    {1398},
    {1399},
    {1400},
    {1401},
    {1402},
    {1403},
    {1404},
    {1405},
    {1406},
    {1407},
    {1408},
    {1409},
    {1410},
    {1411},
    {1412},
    {1413},
    {1414},
    {1415},
    {1416},
    {1417},
    {1418},
    {1419},
    {1420},
    {1421},
    {1422},
    {1423},
    {1424},
    {1425},
    {1426},
    {1427},
    {1428},
    {1429},
    {1430},
    {1431},
    {1432},
    {1433},
    {1434},
    {1435},
    {1436},
    {1437},
    {1438},
    {1439},
    {1440},
    {1441},
    {1442},
    {1443},
    {1444},
    {1445},
    {1446},
    {1447},
    {1448},
    {1449},
    {1450},
    {1451},
    {1452},
    {1453},
    {1454},
    {1455},
    {1456},
    {1457},
    {1458},
    {1459},
    {1460},
    {1461},
    {1462},
    {1463},
    {1464},
    {1465},
    {1466},
    {1467},
    {1468},
    {1469},
    {1470},
    {1471},
    {1472},
    {1473},
    {1474},
    {1475},
    {1476},
    {1477},
    {1478},
    {1479},
    {1480},
    {1481},
    {1482},
    {1483},
    {1484},
    {1485},
    {1486},
    {1487},
    {1488},
    {1489},
    {1490},
    {1491},
    {1492},
    {1493},
    {1494},
    {1495},
    {1496},
    {1497},
    {1498},
    {1499},
    {1500},
    {1501},
    {1502},
    {1503},
    {1504},
    {1505},
    {1506},
    {1507},
    {1508},
    {1509},
    {1510},
    {1511},
    {1512},
    {1513},
    {1514},
    {1515},
    {1516},
    {1517},
    {1518},
    {1519},
    {1520},
    {1521},
    {1522},
    {1523},
    {1524},
    {1525},
    {1526},
    {1527},
    {1528},
    {1529},
    {1530},
    {1531},
    {1532},
    {1533},
    {1534},
    {1535},
    {1536},
    {1537},
    {1538},
    {1539},
    {1540},
    {1541},
    {1542},
    {1543},
    {1544},
    {1545},
    {1546},
    {1547},
    {1548},
    {1549},
    {1550},
    {1551},
    {1552},
    {1553},
    {1554},
    {1555},
    {1556},
    {1557},
    {1558},
    {1559},
    {1560},
    {1561},
    {1562},
    {1563},
    {1564},
    {1565},
    {1566},
    {1567},
    {1568},
    {1569},
    {1570},
    {1571},
    {1572},
    {1573},
    {1574},
    {1575},
    {1576},
    {1577},
    {1578},
    {1579},
    {1580},
    {1581},
    {1582},
    {1583},
    {1584},
    {1585},
    {1586},
    {1587},
    {1588},
    {1589},
    {1590},
    {1591},
    {1592},
    {1593},
    {1594},
    {1595},
    {1596},
    {1597},
    {1598},
    {1599},
    {1600},
    {1601},
    {1602},
    {1603},
    {1604},
    {1605},
    {1606},
    {1607},
    {1608},
    {1609},
    {1610},
    {1611},
    {1612},
    {1613},
    {1614},
    {1615},
    {1616},
    {1617},
    {1618},
    {1619},
    {1620},
    {1621},
    {1622},
    {1623},
    {1624},
    {1625},
    {1626},
    {1627},
    {1628},
    {1629},
    {1630},
    {1631},
    {1632},
    {1633},
    {1634},
    {1635},
    {1636},
    {1637},
    {1638},
    {1639},
    {1640},
    {1641},
    {1642},
    {1643},
    {1644},
    {1645},
    {1646},
    {1647},
    {1648},
    {1649},
    {1650},
    {1651},
    {1652},
    {1653},
    {1654},
    {1655},
    {1656},
    {1657},
    {1658},
    {1659},
    {1660},
    {1661},
    {1662},
    {1663},
    {1664},
    {1665},
    {1666},
    {1667},
    {1668},
    {1669},
    {1670},
    {1671},
    {1672},
    {1673},
    {1674},
    {1675},
    {1676},
    {1677},
    {1678},
    {1679},
    {1680},
    {1681},
    {1682},
    {1683},
    {1684},
    {1685},
    {1686},
    {1687},
    {1688},
    {1689},
    {1690},
    {1691},
    {1692},
    {1693},
    {1694},
    {1695},
    {1696},
    {1697},
    {1698},
    {1699},
    {1700},
    {1701},
    {1702},
    {1703},
    {1704},
    {1705},
    {1706},
    {1707},
    {1708},
    {1709},
    {1710},
    {1711},
    {1712},
    {1713},
    {1714},
    {1715},
    {1716},
    {1717},
    {1718},
    {1719},
    {1720},
    {1721},
    {1722},
    {1723},
    {1724},
    {1725},
    {1726},
    {1727},
    {1728},
    {1729},
    {1730},
    {1731},
    {1732},
    {1733},
    {1734},
    {1735},
    {1736},
    {1737},
    {1738},
    {1739},
    {1740},
    {1741},
    {1742},
    {1743},
    {1744},
    {1745},
    {1746},
    {1747},
    {1748},
    {1749},
    {1750},
    {1751},
    {1752},
    {1753},
    {1754},
    {1755},
    {1756},
    {1757},
    {1758},
    {1759},
    {1760},
    {1761},
    {1762},
    {1763},
    {1764},
    {1765},
    {1766},
    {1767},
    {1768},
    {1769},
    {1770},
    {1771},
    {1772},
    {1773},
    {1774},
    {1775},
    {1776},
    {1777},
    {1778},
    {1779},
    {1780},
    {1781},
    {1782},
    {1783},
    {1784},
    {1785},
    {1786},
    {1787},
    {1788},
    {1789},
    {1790},
    {1791},
    {1792},
    {1793},
    {1794},
    {1795},
    {1796},
    {1797},
    {1798},
    {1799},
    {1800},
    {1801},
    {1802},
    {1803},
    {1804},
    {1805},
    {1806},
    {1807},
    {1808},
    {1809},
    {1810},
    {1811},
    {1812},
    {1813},
    {1814},
    {1815},
    {1816},
    {1817},
    {1818},
    {1819},
    {1820},
    {1821},
    {1822},
    {1823},
    {1824},
    {1825},
    {1826},
    {1827},
    {1828},
    {1829},
    {1830},
    {1831},
    {1832},
    {1833},
    {1834},
    {1835},
    {1836},
    {1837},
    {1838},
    {1839},
    {1840},
    {1841},
    {1842},
    {1843},
    {1844},
    {1845},
    {1846},
    {1847},
    {1848},
    {1849},
    {1850},
    {1851},
    {1852},
    {1853},
    {1854},
    {1855},
    {1856},
    {1857},
    {1858},
    {1859},
    {1860},
    {1861},
    {1862},
    {1863},
    {1864},
    {1865},
    {1866},
    {1867},
    {1868},
    {1869},
    {1870},
    {1871},
    {1872},
    {1873},
    {1874},
    {1875},
    {1876},
    {1877},
    {1878},
    {1879},
    {1880},
    {1881},
    {1882},
    {1883},
    {1884},
    {1885},
    {1886},
    {1887},
    {1888},
    {1889},
    {1890},
    {1891},
    {1892},
    {1893},
    {1894},
    {1895},
    {1896},
    {1897},
    {1898},
    {1899},
    {1900},
    {1901},
    {1902},
    {1903},
    {1904},
    {1905},
    {1906},
    {1907},
    {1908},
    {1909},
    {1910},
    {1911},
    {1912},
    {1913},
    {1914},
    {1915},
    {1916},
    {1917},
    {1918},
    {1919},
    {1920},
    {1921},
    {1922},
    {1923},
    {1924},
    {1925},
    {1926},
    {1927},
    {1928},
    {1929},
    {1930},
    {1931},
    {1932},
    {1933},
    {1934},
    {1935},
    {1936},
    {1937},
    {1938},
    {1939},
    {1940},
    {1941},
    {1942},
    {1943},
    {1944},
    {1945},
    {1946},
    {1947},
    {1948},
    {1949},
    {1950},
    {1951},
    {1952},
    {1953},
    {1954},
    {1955},
    {1956},
    {1957},
    {1958},
    {1959},
    {1960},
    {1961},
    {1962},
    {1963},
    {1964},
    {1965},
    {1966},
    {1967},
    {1968},
    {1969},
    {1970},
    {1971},
    {1972},
    {1973},
    {1974},
    {1975},
    {1976},
    {1977},
    {1978},
    {1979},
    {1980},
    {1981},
    {1982},
    {1983},
    {1984},
    {1985},
    {1986},
    {1987},
    {1988},
    {1989},
    {1990},
    {1991},
    {1992},
    {1993},
    {1994},
    {1995},
    {1996},
    {1997},
    {1998},
    {1999},
    {2000},
    {2001},
    {2002},
    {2003},
    {2004},
    {2005},
    {2006},
    {2007},
    {2008},
    {2009},
    {2010},
    {2011},
    {2012},
    {2013},
    {2014},
    {2015},
    {2016},
    {2017},
    {2018},
    {2019},
    {2020},
    {2021},
    {2022},
    {2023},
    {2024},
    {2025},
    {2026},
    {2027},
    {2028},
    {2029},
    {2030},
    {2031},
    {2032},
    {2033},
    {2034},
    {2035},
    {2036},
    {2037},
    {2038},
    {2039},
    {2040},
    {2041},
    {2042},
    {2043},
    {2044},
    {2045},
    {2046},
    {2047},
    {2048},
    {2049},
    {2050},
    {2051},
    {2052},
    {2053},
    {2054},
    {2055},
    {2056},
    {2057},
    {2058},
    {2059},
    {2060},
    {2061},
    {2062},
    {2063},
    {2064},
    {2065},
    {2066},
    {2067},
    {2068},
    {2069},
    {2070},
    {2071},
    {2072},
    {2073},
    {2074},
    {2075},
    {2076},
    {2077},
    {2078},
    {2079},
    {2080},
    {2081},
    {2082},
    {2083},
    {2084},
    {2085},
    {2086},
    {2087},
    {2088},
    {2089},
    {2090},
    {2091},
    {2092},
    {2093},
    {2094},
    {2095},
    {2096},
    {2097},
    {2098},
    {2099},
    {2100},
    {2101},
    {2102},
    {2103},
    {2104},
    {2105},
    {2106},
    {2107},
    {2108},
    {2109},
    {2110},
    {2111},
    {2112},
    {2113},
    {2114},
    {2115},
    {2116},
    {2117},
    {2118},
    {2119},
    {2120},
    {2121},
    {2122},
    {2123},
    {2124},
    {2125},
    {2126},
    {2127},
    {2128},
    {2129},
    {2130},
    {2131},
    {2132},
    {2133},
    {2134},
    {2135},
    {2136},
    {2137},
    {2138},
    {2139},
    {2140},
    {2141},
    {2142},
    {2143},
    {2144},
    {2145},
    {2146},
    {2147},
    {2148},
    {2149},
    {2150},
    {2151},
    {2152},
    {2153},
    {2154},
    {2155},
    {2156},
    {2157},
    {2158},
    {2159},
    {2160},
    {2161},
    {2162},
    {2163},
    {2164},
    {2165},
    {2166},
    {2167},
    {2168},
    {2169},
    {2170},
    {2171},
    {2172},
    {2173},
    {2174},
    {2175},
    {2176},
    {2177},
    {2178},
    {2179},
    {2180},
    {2181},
    {2182},
    {2183},
    {2184},
    {2185},
    {2186},
    {2187},
    {2188},
    {2189},
    {2190},
    {2191},
    {2192},
    {2193},
    {2194},
    {2195},
    {2196},
    {2197},
    {2198},
    {2199},
    {2200},
    {2201},
    {2202},
    {2203},
    {2204},
    {2205},
    {2206},
    {2207},
    {2208},
    {2209},
    {2210},
    {2211},
    {2212},
    {2213},
    {2214},
    {2215},
    {2216},
    {2217},
    {2218},
    {2219},
    {2220},
    {2221},
    {2222},
    {2223},
    {2224},
    {2225},
    {2226},
    {2227},
    {2228},
    {2229},
    {2230},
    {2231},
    {2232},
    {2233},
    {2234},
    {2235},
    {2236},
    {2237},
    {2238},
    {2239},
    {2240},
    {2241},
    {2242},
    {2243},
    {2244},
    {2245},
    {2246},
    {2247},
    {2248},
    {2249},
    {2250},
    {2251},
    {2252},
    {2253},
    {2254},
    {2255},
    {2256},
    {2257},
    {2258},
    {2259},
    {2260},
    {2261},
    {2262},
    {2263},
    {2264},
    {2265},
    {2266},
    {2267},
    {2268},
    {2269},
    {2270},
    {2271},
    {2272},
    {2273},
    {2274},
    {2275},
    {2276},
    {2277},
    {2278},
    {2279},
    {2280},
    {2281},
    {2282},
    {2283},
    {2284},
    {2285},
    {2286},
    {2287},
    {2288},
    {2289},
    {2290},
    {2291},
    {2292},
    {2293},
    {2294},
    {2295},
    {2296},
    {2297},
    {2298},
    {2299},
    {2300},
    {2301},
    {2302},
    {2303},
    {2304},
    {2305},
    {2306},
    {2307},
    {2308},
    {2309},
    {2310},
    {2311},
    {2312},
    {2313},
    {2314},
    {2315},
    {2316},
    {2317},
    {2318},
    {2319},
    {2320},
    {2321},
    {2322},
    {2323},
    {2324},
    {2325},
    {2326},
    {2327},
    {2328},
    {2329},
    {2330},
    {2331},
    {2332},
    {2333},
    {2334},
    {2335},
    {2336},
    {2337},
    {2338},
    {2339},
    {2340},
    {2341},
    {2342},
    {2343},
    {2344},
    {2345},
    {2346},
    {2347},
    {2348},
    {2349},
    {2350},
    {2351},
    {2352},
    {2353},
    {2354},
    {2355},
    {2356},
    {2357},
    {2358},
    {2359},
    {2360},
    {2361},
    {2362},
    {2363},
    {2364},
    {2365},
    {2366},
    {2367},
    {2368},
    {2369},
    {2370},
    {2371},
    {2372},
    {2373},
    {2374},
    {2375},
    {2376},
    {2377},
    {2378},
    {2379},
    {2380},
    {2381},
    {2382},
    {2383},
    {2384},
    {2385},
    {2386},
    {2387},
    {2388},
    {2389},
    {2390},
    {2391},
    {2392},
    {2393},
    {2394},
    {2395},
    {2396},
    {2397},
    {2398},
    {2399},
    {2400},
    {2401},
    {2402},
    {2403},
    {2404},
    {2405},
    {2406},
    {2407},
    {2408},
    {2409},
    {2410},
    {2411},
    {2412},
    {2413},
    {2414},
    {2415},
    {2416},
    {2417},
    {2418},
    {2419},
    {2420},
    {2421},
    {2422},
    {2423},
    {2424},
    {2425},
    {2426},
    {2427},
    {2428},
    {2429},
    {2430},
    {2431},
    {2432},
    {2433},
    {2434},
    {2435},
    {2436},
    {2437},
    {2438},
    {2439},
    {2440},
    {2441},
    {2442},
    {2443},
    {2444},
    {2445},
    {2446},
    {2447},
    {2448},
    {2449},
    {2450},
    {2451},
    {2452},
    {2453},
    {2454},
    {2455},
    {2456},
    {2457},
    {2458},
    {2459},
    {2460},
    {2461},
    {2462},
    {2463},
    {2464},
    {2465},
    {2466},
    {2467},
    {2468},
    {2469},
    {2470},
    {2471},
    {2472},
    {2473},
    {2474},
    {2475},
    {2476},
    {2477},
    {2478},
    {2479},
    {2480},
    {2481},
    {2482},
    {2483},
    {2484},
    {2485},
    {2486},
    {2487},
    {2488},
    {2489},
    {2490},
    {2491},
    {2492},
    {2493},
    {2494},
    {2495},
    {2496},
    {2497},
    {2498},
    {2499},
    {2500},
    {2501},
    {2502},
    {2503},
    {2504},
    {2505},
    {2506},
    {2507},
    {2508},
    {2509},
    {2510},
    {2511},
    {2512},
    {2513},
    {2514},
    {2515},
    {2516},
    {2517},
    {2518},
    {2519},
    {2520},
    {2521},
    {2522},
    {2523},
    {2524},
    {2525},
    {2526},
    {2527},
    {2528},
    {2529},
    {2530},
    {2531},
    {2532},
    {2533},
    {2534},
    {2535},
    {2536},
    {2537},
    {2538},
    {2539},
    {2540},
    {2541},
    {2542},
    {2543},
    {2544},
    {2545},
    {2546},
    {2547},
    {2548},
    {2549},
    {2550},
    {2551},
    {2552},
    {2553},
    {2554},
    {2555},
    {2556},
    {2557},
    {2558},
    {2559},
    {2560},
    {2561},
    {2562},
    {2563},
    {2564},
    {2565},
    {2566},
    {2567},
    {2568},
    {2569},
    {2570},
    {2571},
    {2572},
    {2573},
    {2574},
    {2575},
    {2576},
    {2577},
    {2578},
    {2579},
    {2580},
    {2581},
    {2582},
    {2583},
    {2584},
    {2585},
    {2586},
    {2587},
    {2588},
    {2589},
    {2590},
    {2591},
    {2592},
    {2593},
    {2594},
    {2595},
    {2596},
    {2597},
    {2598},
    {2599},
    {2600},
    {2601},
    {2602},
    {2603},
    {2604},
    {2605},
    {2606},
    {2607},
    {2608},
    {2609},
    {2610},
    {2611},
    {2612},
    {2613},
    {2614},
    {2615},
    {2616},
    {2617},
    {2618},
    {2619},
    {2620},
    {2621},
    {2622},
    {2623},
    {2624},
    {2625},
    {2626},
    {2627},
    {2628},
    {2629},
    {2630},
    {2631},
    {2632},
    {2633},
    {2634},
    {2635},
    {2636},
    {2637},
    {2638},
    {2639},
    {2640},
    {2641},
    {2642},
    {2643},
    {2644},
    {2645},
    {2646},
    {2647},
    {2648},
    {2649},
    {2650},
    {2651},
    {2652},
    {2653},
    {2654},
    {2655},
    {2656},
    {2657},
    {2658},
    {2659},
    {2660},
    {2661},
    {2662},
    {2663},
    {2664},
    {2665},
    {2666},
    {2667},
    {2668},
    {2669},
    {2670},
    {2671},
    {2672},
    {2673},
    {2674},
    {2675},
    {2676},
    {2677},
    {2678},
    {2679},
    {2680},
    {2681},
    {2682},
    {2683},
    {2684},
    {2685},
    {2686},
    {2687},
    {2688},
    {2689},
    {2690},
    {2691},
    {2692},
    {2693},
    {2694},
    {2695},
    {2696},
    {2697},
    {2698},
    {2699},
    {2700},
    {2701},
    {2702},
    {2703},
    {2704},
    {2705},
    {2706},
    {2707},
    {2708},
    {2709},
    {2710},
    {2711},
    {2712},
    {2713},
    {2714},
    {2715},
    {2716},
    {2717},
    {2718},
    {2719},
    {2720},
    {2721},
    {2722},
    {2723},
    {2724},
    {2725},
    {2726},
    {2727},
    {2728},
    {2729},
    {2730},
    {2731},
    {2732},
    {2733},
    {2734},
    {2735},
    {2736},
    {2737},
    {2738},
    {2739},
    {2740},
    {2741},
    {2742},
    {2743},
    {2744},
    {2745},
    {2746},
    {2747},
    {2748},
    {2749},
    {2750},
    {2751},
    {2752},
    {2753},
    {2754},
    {2755},
    {2756},
    {2757},
    {2758},
    {2759},
    {2760},
    {2761},
    {2762},
    {2763},
    {2764},
    {2765},
    {2766},
    {2767},
    {2768},
    {2769},
    {2770},
    {2771},
    {2772},
    {2773},
    {2774},
    {2775},
    {2776},
    {2777},
    {2778},
    {2779},
    {2780},
    {2781},
    {2782},
    {2783},
    {2784},
    {2785},
    {2786},
    {2787},
    {2788},
    {2789},
    {2790},
    {2791},
    {2792},
    {2793},
    {2794},
    {2795},
    {2796},
    {2797},
    {2798},
    {2799},
    {2800},
    {2801},
    {2802},
    {2803},
    {2804},
    {2805},
    {2806},
    {2807},
    {2808},
    {2809},
    {2810},
    {2811},
    {2812},
    {2813},
    {2814},
    {2815},
    {2816},
    {2817},
    {2818},
    {2819},
    {2820},
    {2821},
    {2822},
    {2823},
    {2824},
    {2825},
    {2826},
    {2827},
    {2828},
    {2829},
    {2830},
    {2831},
    {2832},
    {2833},
    {2834},
    {2835},
    {2836},
    {2837},
    {2838},
    {2839},
    {2840},
    {2841},
    {2842},
    {2843},
    {2844},
    {2845},
    {2846},
    {2847},
    {2848},
    {2849},
    {2850},
    {2851},
    {2852},
    {2853},
    {2854},
    {2855},
    {2856},
    {2857},
    {2858},
    {2859},
    {2860},
    {2861},
    {2862},
    {2863},
    {2864},
    {2865},
    {2866},
    {2867},
    {2868},
    {2869},
    {2870},
    {2871},
    {2872},
    {2873},
    {2874},
    {2875},
    {2876},
    {2877},
    {2878},
    {2879},
    {2880},
    {2881},
    {2882},
    {2883},
    {2884},
    {2885},
    {2886},
    {2887},
    {2888},
    {2889},
    {2890},
    {2891},
    {2892},
    {2893},
    {2894},
    {2895},
    {2896},
    {2897},
    {2898},
    {2899},
    {2900},
    {2901},
    {2902},
    {2903},
    {2904},
    {2905},
    {2906},
    {2907},
    {2908},
    {2909},
    {2910},
    {2911},
    {2912},
    {2913},
    {2914},
    {2915},
    {2916},
    {2917},
    {2918},
    {2919},
    {2920},
    {2921},
    {2922},
    {2923},
    {2924},
    {2925},
    {2926},
    {2927},
    {2928},
    {2929},
    {2930},
    {2931},
    {2932},
    {2933},
    {2934},
    {2935},
    {2936},
    {2937},
    {2938},
    {2939},
    {2940},
    {2941},
    {2942},
    {2943},
    {2944},
    {2945},
    {2946},
    {2947},
    {2948},
    {2949},
    {2950},
    {2951},
    {2952},
    {2953},
    {2954},
    {2955},
    {2956},
    {2957},
    {2958},
    {2959},
    {2960},
    {2961},
    {2962},
    {2963},
    {2964},
    {2965},
    {2966},
    {2967},
    {2968},
    {2969},
    {2970},
    {2971},
    {2972},
    {2973},
    {2974},
    {2975},
    {2976},
    {2977},
    {2978},
    {2979},
    {2980},
    {2981},
    {2982},
    {2983},
    {2984},
    {2985},
    {2986},
    {2987},
    {2988},
    {2989},
    {2990},
    {2991},
    {2992},
    {2993},
    {2994},
    {2995},
    {2996},
    {2997},
    {2998},
    {2999},
    {3000},
    {3001},
    {3002},
    {3003},
    {3004},
    {3005},
    {3006},
    {3007},
    {3008},
    {3009},
    {3010},
    {3011},
    {3012},
    {3013},
    {3014},
    {3015},
    {3016},
    {3017},
    {3018},
    {3019},
    {3020},
    {3021},
    {3022},
    {3023},
    {3024},
    {3025},
    {3026},
    {3027},
    {3028},
    {3029},
    {3030},
    {3031},
    {3032},
    {3033},
    {3034},
    {3035},
    {3036},
    {3037},
    {3038},
    {3039},
    {3040},
    {3041},
    {3042},
    {3043},
    {3044},
    {3045},
    {3046},
    {3047},
    {3048},
    {3049},
    {3050},
    {3051},
    {3052},
    {3053},
    {3054},
    {3055},
    {3056},
    {3057},
    {3058},
    {3059},
    {3060},
    {3061},
    {3062},
    {3063},
    {3064},
    {3065},
    {3066},
    {3067},
    {3068},
    {3069},
    {3070},
    {3071},
    {3072},
    {3073},
    {3074},
    {3075},
    {3076},
    {3077},
    {3078},
    {3079},
    {3080},
    {3081},
    {3082},
    {3083},
    {3084},
    {3085},
    {3086},
    {3087},
    {3088},
    {3089},
    {3090},
    {3091},
    {3092},
    {3093},
    {3094},
    {3095},
    {3096},
    {3097},
    {3098},
    {3099},
    {3100},
    {3101},
    {3102},
    {3103},
    {3104},
    {3105},
    {3106},
    {3107},
    {3108},
    {3109},
    {3110},
    {3111},
    {3112},
    {3113},
    {3114},
    {3115},
    {3116},
    {3117},
    {3118},
    {3119},
    {3120},
    {3121},
    {3122},
    {3123},
    {3124},
    {3125},
    {3126},
    {3127},
    {3128},
    {3129},
    {3130},
    {3131},
    {3132},
    {3133},
    {3134},
    {3135},
    {3136},
    {3137},
    {3138},
    {3139},
    {3140},
    {3141},
    {3142},
    {3143},
    {3144},
    {3145},
    {3146},
    {3147},
    {3148},
    {3149},
    {3150},
    {3151},
    {3152},
    {3153},
    {3154},
    {3155},
    {3156},
    {3157},
    {3158},
    {3159},
    {3160},
    {3161},
    {3162},
    {3163},
    {3164},
    {3165},
    {3166},
    {3167},
    {3168},
    {3169},
    {3170},
    {3171},
    {3172},
    {3173},
    {3174},
    {3175},
    {3176},
    {3177},
    {3178},
    {3179},
    {3180},
    {3181},
    {3182},
    {3183},
    {3184},
    {3185},
    {3186},
    {3187},
    {3188},
    {3189},
    {3190},
    {3191},
    {3192},
    {3193},
    {3194},
    {3195},
    {3196},
    {3197},
    {3198},
    {3199},
    {3200},
    {3201},
    {3202},
    {3203},
    {3204},
    {3205},
    {3206},
    {3207},
    {3208},
    {3209},
    {3210},
    {3211},
    {3212},
    {3213},
    {3214},
    {3215},
    {3216},
    {3217},
    {3218},
    {3219},
    {3220},
    {3221},
    {3222},
    {3223},
    {3224},
    {3225},
    {3226},
    {3227},
    {3228},
    {3229},
    {3230},
    {3231},
    {3232},
    {3233},
    {3234},
    {3235},
    {3236},
    {3237},
    {3238},
    {3239},
    {3240},
    {3241},
    {3242},
    {3243},
    {3244},
    {3245},
    {3246},
    {3247},
    {3248},
    {3249},
    {3250},
    {3251},
    {3252},
    {3253},
    {3254},
    {3255},
    {3256},
    {3257},
    {3258},
    {3259},
    {3260},
    {3261},
    {3262},
    {3263},
    {3264},
    {3265},
    {3266},
    {3267},
    {3268},
    {3269},
    {3270},
    {3271},
    {3272},
    {3273},
    {3274},
    {3275},
    {3276},
    {3277},
    {3278},
    {3279},
    {3280},
    {3281},
    {3282},
    {3283},
    {3284},
    {3285},
    {3286},
    {3287},
    {3288},
    {3289},
    {3290},
    {3291},
    {3292},
    {3293},
    {3294},
    {3295},
    {3296},
    {3297},
    {3298},
    {3299},
    {3300},
    {3301},
    {3302},
    {3303},
    {3304},
    {3305},
    {3306},
    {3307},
    {3308},
    {3309},
    {3310},
    {3311},
    {3312},
    {3313},
    {3314},
    {3315},
    {3316},
    {3317},
    {3318},
    {3319},
    {3320},
    {3321},
    {3322},
    {3323},
    {3324},
    {3325},
    {3326},
    {3327},
    {3328},
    {3329},
    {3330},
    {3331},
    {3332},
    {3333},
    {3334},
    {3335},
    {3336},
    {3337},
    {3338},
    {3339},
    {3340},
    {3341},
    {3342},
    {3343},
    {3344},
    {3345},
    {3346},
    {3347},
    {3348},
    {3349},
    {3350},
    {3351},
    {3352},
    {3353},
    {3354},
    {3355},
    {3356},
    {3357},
    {3358},
    {3359},
    {3360},
    {3361},
    {3362},
    {3363},
    {3364},
    {3365},
    {3366},
    {3367},
    {3368},
    {3369},
    {3370},
    {3371},
    {3372},
    {3373},
    {3374},
    {3375},
    {3376},
    {3377},
    {3378},
    {3379},
    {3380},
    {3381},
    {3382},
    {3383},
    {3384},
    {3385},
    {3386},
    {3387},
    {3388},
    {3389},
    {3390},
    {3391},
    {3392},
    {3393},
    {3394},
    {3395},
    {3396},
    {3397},
    {3398},
    {3399},
    {3400},
    {3401},
    {3402},
    {3403},
    {3404},
    {3405},
    {3406},
    {3407},
    {3408},
    {3409},
    {3410},
    {3411},
    {3412},
    {3413},
    {3414},
    {3415},
    {3416},
    {3417},
    {3418},
    {3419},
    {3420},
    {3421},
    {3422},
    {3423},
    {3424},
    {3425},
    {3426},
    {3427},
    {3428},
    {3429},
    {3430},
    {3431},
    {3432},
    {3433},
    {3434},
    {3435},
    {3436},
    {3437},
    {3438},
    {3439},
    {3440},
    {3441},
    {3442},
    {3443},
    {3444},
    {3445},
    {3446},
    {3447},
    {3448},
    {3449},
    {3450},
    {3451},
    {3452},
    {3453},
    {3454},
    {3455},
    {3456},
    {3457},
    {3458},
    {3459},
    {3460},
    {3461},
    {3462},
    {3463},
    {3464},
    {3465},
    {3466},
    {3467},
    {3468},
    {3469},
    {3470},
    {3471},
    {3472},
    {3473},
    {3474},
    {3475},
    {3476},
    {3477},
    {3478},
    {3479},
    {3480},
    {3481},
    {3482},
    {3483},
    {3484},
    {3485},
    {3486},
    {3487},
    {3488},
    {3489},
    {3490},
    {3491},
    {3492},
    {3493},
    {3494},
    {3495},
    {3496},
    {3497},
    {3498},
    {3499},
    {3500},
    {3501},
    {3502},
    {3503},
    {3504},
    {3505},
    {3506},
    {3507},
    {3508},
    {3509},
    {3510},
    {3511},
    {3512},
    {3513},
    {3514},
    {3515},
    {3516},
    {3517},
    {3518},
    {3519},
    {3520},
    {3521},
    {3522},
    {3523},
    {3524},
    {3525},
    {3526},
    {3527},
    {3528},
    {3529},
    {3530},
    {3531},
    {3532},
    {3533},
    {3534},
    {3535},
    {3536},
    {3537},
    {3538},
    {3539},
    {3540},
    {3541},
    {3542},
    {3543},
    {3544},
    {3545},
    {3546},
    {3547},
    {3548},
    {3549},
    {3550},
    {3551},
    {3552},
    {3553},
    {3554},
    {3555},
    {3556},
    {3557},
    {3558},
    {3559},
    {3560},
    {3561},
    {3562},
    {3563},
    {3564},
    {3565},
    {3566},
    {3567},
    {3568},
    {3569},
    {3570},
    {3571},
    {3572},
    {3573},
    {3574},
    {3575},
    {3576},
    {3577},
    {3578},
    {3579},
    {3580},
    {3581},
    {3582},
    {3583},
    {3584},
    {3585},
    {3586},
    {3587},
    {3588},
    {3589},
    {3590},
    {3591},
    {3592},
    {3593},
    {3594},
    {3595},
    {3596},
    {3597},
    {3598},
    {3599},
    {3600},
    {3601},
    {3602},
    {3603},
    {3604},
    {3605},
    {3606},
    {3607},
    {3608},
    {3609},
    {3610},
    {3611},
    {3612},
    {3613},
    {3614},
    {3615},
    {3616},
    {3617},
    {3618},
    {3619},
    {3620},
    {3621},
    {3622},
    {3623},
    {3624},
    {3625},
    {3626},
    {3627},
    {3628},
    {3629},
    {3630},
    {3631},
    {3632},
    {3633},
    {3634},
    {3635},
    {3636},
    {3637},
    {3638},
    {3639},
    {3640},
    {3641},
    {3642},
    {3643},
    {3644},
    {3645},
    {3646},
    {3647},
    {3648},
    {3649},
    {3650},
    {3651},
    {3652},
    {3653},
    {3654},
    {3655},
    {3656},
    {3657},
    {3658},
    {3659},
    {3660},
    {3661},
    {3662},
    {3663},
    {3664},
    {3665},
    {3666},
    {3667},
    {3668},
    {3669},
    {3670},
    {3671},
    {3672},
    {3673},
    {3674},
    {3675},
    {3676},
    {3677},
    {3678},
    {3679},
    {3680},
    {3681},
    {3682},
    {3683},
    {3684},
    {3685},
    {3686},
    {3687},
    {3688},
    {3689},
    {3690},
    {3691},
    {3692},
    {3693},
    {3694},
    {3695},
    {3696},
    {3697},
    {3698},
    {3699},
    {3700},
    {3701},
    {3702},
    {3703},
    {3704},
    {3705},
    {3706},
    {3707},
    {3708},
    {3709},
    {3710},
    {3711},
    {3712},
    {3713},
    {3714},
    {3715},
    {3716},
    {3717},
    {3718},
    {3719},
    {3720},
    {3721},
    {3722},
    {3723},
    {3724},
    {3725},
    {3726},
    {3727},
    {3728},
    {3729},
    {3730},
    {3731},
    {3732},
    {3733},
    {3734},
    {3735},
    {3736},
    {3737},
    {3738},
    {3739},
    {3740},
    {3741},
    {3742},
    {3743},
    {3744},
    {3745},
    {3746},
    {3747},
    {3748},
    {3749},
    {3750},
    {3751},
    {3752},
    {3753},
    {3754},
    {3755},
    {3756},
    {3757},
    {3758},
    {3759},
    {3760},
    {3761},
    {3762},
    {3763},
    {3764},
    {3765},
    {3766},
    {3767},
    {3768},
    {3769},
    {3770},
    {3771},
    {3772},
    {3773},
    {3774},
    {3775},
    {3776},
    {3777},
    {3778},
    {3779},
    {3780},
    {3781},
    {3782},
    {3783},
    {3784},
    {3785},
    {3786},
    {3787},
    {3788},
    {3789},
    {3790},
    {3791},
    {3792},
    {3793},
    {3794},
    {3795},
    {3796},
    {3797},
    {3798},
    {3799},
    {3800},
    {3801},
    {3802},
    {3803},
    {3804},
    {3805},
    {3806},
    {3807},
    {3808},
    {3809},
    {3810},
    {3811},
    {3812},
    {3813},
    {3814},
    {3815},
    {3816},
    {3817},
    {3818},
    {3819},
    {3820},
    {3821},
    {3822},
    {3823},
    {3824},
    {3825},
    {3826},
    {3827},
    {3828},
    {3829},
    {3830},
    {3831},
    {3832},
    {3833},
    {3834},
    {3835},
    {3836},
    {3837},
    {3838},
    {3839},
    {3840},
    {3841},
    {3842},
    {3843},
    {3844},
    {3845},
    {3846},
    {3847},
    {3848},
    {3849},
    {3850},
    {3851},
    {3852},
    {3853},
    {3854},
    {3855},
    {3856},
    {3857},
    {3858},
    {3859},
    {3860},
    {3861},
    {3862},
    {3863},
    {3864},
    {3865},
    {3866},
    {3867},
    {3868},
    {3869},
    {3870},
    {3871},
    {3872},
    {3873},
    {3874},
    {3875},
    {3876},
    {3877},
    {3878},
    {3879},
    {3880},
    {3881},
    {3882},
    {3883},
    {3884},
    {3885},
    {3886},
    {3887},
    {3888},
    {3889},
    {3890},
    {3891},
    {3892},
    {3893},
    {3894},
    {3895},
    {3896},
    {3897},
    {3898},
    {3899},
    {3900},
    {3901},
    {3902},
    {3903},
    {3904},
    {3905},
    {3906},
    {3907},
    {3908},
    {3909},
    {3910},
    {3911},
    {3912},
    {3913},
    {3914},
    {3915},
    {3916},
    {3917},
    {3918},
    {3919},
    {3920},
    {3921},
    {3922},
    {3923},
    {3924},
    {3925},
    {3926},
    {3927},
    {3928},
    {3929},
    {3930},
    {3931},
    {3932},
    {3933},
    {3934},
    {3935},
    {3936},
    {3937},
    {3938},
    {3939},
    {3940},
    {3941},
    {3942},
    {3943},
    {3944},
    {3945},
    {3946},
    {3947},
    {3948},
    {3949},
    {3950},
    {3951},
    {3952},
    {3953},
    {3954},
    {3955},
    {3956},
    {3957},
    {3958},
    {3959},
    {3960},
    {3961},
    {3962},
    {3963},
    {3964},
    {3965},
    {3966},
    {3967},
    {3968},
    {3969},
    {3970},
    {3971},
    {3972},
    {3973},
    {3974},
    {3975},
    {3976},
    {3977},
    {3978},
    {3979},
    {3980},
    {3981},
    {3982},
    {3983},
    {3984},
    {3985},
    {3986},
    {3987},
    {3988},
    {3989},
    {3990},
    {3991},
    {3992},
    {3993},
    {3994},
    {3995},
    {3996},
    {3997},
    {3998},
    {3999},
    {4000},
    {4001},
    {4002},
    {4003},
    {4004},
    {4005},
    {4006},
    {4007},
    {4008},
    {4009},
    {4010},
    {4011},
    {4012},
    {4013},
    {4014},
    {4015},
    {4016},
    {4017},
    {4018},
    {4019},
    {4020},
    {4021},
    {4022},
    {4023},
    {4024},
    {4025},
    {4026},
    {4027},
    {4028},
    {4029},
    {4030},
    {4031},
    {4032},
    {4033},
    {4034},
    {4035},
    {4036},
    {4037},
    {4038},
    {4039},
    {4040},
    {4041},
    {4042},
    {4043},
    {4044},
    {4045},
    {4046},
    {4047},
    {4048},
    {4049},
    {4050},
    {4051},
    {4052},
    {4053},
    {4054},
    {4055},
    {4056},
    {4057},
    {4058},
    {4059},
    {4060},
    {4061},
    {4062},
    {4063},
    {4064},
    {4065},
    {4066},
    {4067},
    {4068},
    {4069},
    {4070},
    {4071},
    {4072},
    {4073},
    {4074},
    {4075},
    {4076},
    {4077},
    {4078},
    {4079},
    {4080},
    {4081},
    {4082},
    {4083},
    {4084},
    {4085},
    {4086},
    {4087},
    {4088},
    {4089},
    {4090},
    {4091},
    {4092},
    {4093},
    {4094},
    {4095},
    {4096},
    {4097},
    {4098},
    {4099},
    {4100},
    {4101},
    {4102},
    {4103},
    {4104},
    {4105},
    {4106},
    {4107},
    {4108},
    {4109},
    {4110},
    {4111},
    {4112},
    {4113},
    {4114},
    {4115},
    {4116},
    {4117},
    {4118},
    {4119},
    {4120},
    {4121},
    {4122},
    {4123},
    {4124},
    {4125},
    {4126},
    {4127},
    {4128},
    {4129},
    {4130},
    {4131},
    {4132},
    {4133},
    {4134},
    {4135},
    {4136},
    {4137},
    {4138},
    {4139},
    {4140},
    {4141},
    {4142},
    {4143},
    {4144},
    {4145},
    {4146},
    {4147},
    {4148},
    {4149},
    {4150},
    {4151},
    {4152},
    {4153},
    {4154},
    {4155},
    {4156},
    {4157}
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
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    94,
    95,
    96,
    97,
    98,
    99,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119,
    120,
    121,
    122,
    123,
    124,
    125,
    126,
    127,
    128,
    129,
    130,
    131,
    132,
    133,
    134,
    135,
    136,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    147,
    148,
    149,
    150,
    151,
    152,
    153,
    154,
    155,
    156,
    157,
    158,
    159,
    160,
    161,
    162,
    163,
    164,
    165,
    166,
    167,
    168,
    169,
    170,
    171,
    172,
    173,
    174,
    175,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    187,
    188,
    189,
    190,
    191,
    192,
    193,
    194,
    195,
    196,
    197,
    198,
    199,
    200,
    201,
    202,
    203,
    204,
    205,
    206,
    207,
    208,
    209,
    210,
    211,
    212,
    213,
    214,
    215,
    216,
    217,
    218,
    219,
    220,
    221,
    222,
    223,
    224,
    225,
    226,
    227,
    228,
    229,
    230,
    231,
    232,
    233,
    234,
    235,
    236,
    237,
    238,
    239,
    240,
    241,
    242,
    243,
    244,
    245,
    246,
    247,
    248,
    249,
    250,
    251,
    252,
    253,
    254,
    255,
    256,
    257,
    258,
    259,
    260,
    261,
    262,
    263,
    264,
    265,
    266,
    267,
    268,
    269,
    270,
    271,
    272,
    273,
    274,
    275,
    276,
    277,
    278,
    279,
    280,
    281,
    282,
    283,
    284,
    285,
    286,
    287,
    288,
    289,
    290,
    291,
    292,
    293,
    294,
    295,
    296,
    297,
    298,
    299,
    300,
    301,
    302,
    303,
    304,
    305,
    306,
    307,
    308,
    309,
    310,
    311,
    312,
    313,
    314,
    315,
    316,
    317,
    318,
    319,
    320,
    321,
    322,
    323,
    324,
    325,
    326,
    327,
    328,
    329,
    330,
    331,
    332,
    333,
    334,
    335,
    336,
    337,
    338,
    339,
    340,
    341,
    342,
    343,
    344,
    345,
    346,
    347,
    348,
    349,
    350,
    351,
    352,
    353,
    354,
    355,
    356,
    357,
    358,
    359,
    360,
    361,
    362,
    363,
    364,
    365,
    366,
    367,
    368,
    369,
    370,
    371,
    372,
    373,
    374,
    375,
    376,
    377,
    378,
    379,
    380,
    381,
    382,
    383,
    384,
    385,
    386,
    387,
    388,
    389,
    390,
    391,
    392,
    393,
    394,
    395,
    396,
    397,
    398,
    399,
    400,
    401,
    402,
    403,
    404,
    405,
    406,
    407,
    408,
    409,
    410,
    411,
    412,
    413,
    414,
    415,
    416,
    417,
    418,
    419,
    420,
    421,
    422,
    423,
    424,
    425,
    426,
    427,
    428,
    429,
    430,
    431,
    432,
    433,
    434,
    435,
    436,
    437,
    438,
    439,
    440,
    441,
    442,
    443,
    444,
    445,
    446,
    447,
    448,
    449,
    450,
    451,
    452,
    453,
    454,
    455,
    456,
    457,
    458,
    459,
    460,
    461,
    462,
    463,
    464,
    465,
    466,
    467,
    468,
    469,
    470,
    471,
    472,
    473,
    474,
    475,
    476,
    477,
    478,
    479,
    480,
    481,
    482,
    483,
    484,
    485,
    486,
    487,
    488,
    489,
    490,
    491,
    492,
    493,
    494,
    495,
    496,
    497,
    498,
    499,
    500,
    501,
    502,
    503,
    504,
    505,
    506,
    507,
    508,
    509,
    510,
    511,
    512,
    513,
    514,
    515,
    516,
    517,
    518,
    519,
    520,
    521,
    522,
    523,
    524,
    525,
    526,
    527,
    528,
    529,
    530,
    531,
    532,
    533,
    534,
    535,
    536,
    537,
    538,
    539,
    540,
    541,
    542,
    543,
    544,
    545,
    546,
    547,
    548,
    549,
    550,
    551,
    552,
    553,
    554,
    555,
    556,
    557,
    558,
    559,
    560,
    561,
    562,
    563,
    564,
    565,
    566,
    567,
    568,
    569,
    570,
    571,
    572,
    573,
    574,
    575,
    576,
    577,
    578,
    579,
    580,
    581,
    582,
    583,
    584,
    585,
    586,
    587,
    588,
    589,
    590,
    591,
    592,
    593,
    594,
    595,
    596,
    597,
    598,
    599,
    600,
    601,
    602,
    603,
    604,
    605,
    606,
    607,
    608,
    609,
    610,
    611,
    612,
    613,
    614,
    615,
    616,
    617,
    618,
    619,
    620,
    621,
    622,
    623,
    624,
    625,
    626,
    627,
    628,
    629,
    630,
    631,
    632,
    633,
    634,
    635,
    636,
    637,
    638,
    639,
    640,
    641,
    642,
    643,
    644,
    645,
    646,
    647,
    648,
    649,
    650,
    651,
    652,
    653,
    654,
    655,
    656,
    657,
    658,
    659,
    660,
    661,
    662,
    663,
    664,
    665,
    666,
    667,
    668,
    669,
    670,
    671,
    672,
    673,
    674,
    675,
    676,
    677,
    678,
    679,
    680,
    681,
    682,
    683,
    684,
    685,
    686,
    687,
    688,
    689,
    690,
    691,
    692,
    693,
    694,
    695,
    696,
    697,
    698,
    699,
    700,
    701,
    702,
    703,
    704,
    705,
    706,
    707,
    708,
    709,
    710,
    711,
    712,
    713,
    714,
    715,
    716,
    717,
    718,
    719,
    720,
    721,
    722,
    723,
    724,
    725,
    726,
    727,
    728,
    729,
    730,
    731,
    732,
    733,
    734,
    735,
    736,
    737,
    738,
    739,
    740,
    741,
    742,
    743,
    744,
    745,
    746,
    747,
    748,
    749,
    750,
    751,
    752,
    753,
    754,
    755,
    756,
    757,
    758,
    759,
    760,
    761,
    762,
    763,
    764,
    765,
    766,
    767,
    768,
    769,
    770,
    771,
    772,
    773,
    774,
    775,
    776,
    777,
    778,
    779,
    780,
    781,
    782,
    783,
    784,
    785,
    786,
    787,
    788,
    789,
    790,
    791,
    792,
    793,
    794,
    795,
    796,
    797,
    798,
    799,
    800,
    801,
    802,
    803,
    804,
    805,
    806,
    807,
    808,
    809,
    810,
    811,
    812,
    813,
    814,
    815,
    816,
    817,
    818,
    819,
    820,
    821,
    822,
    823,
    824,
    825,
    826,
    827,
    828,
    829,
    830,
    831,
    832,
    833,
    834,
    835,
    836,
    837,
    838,
    839,
    840,
    841,
    842,
    843,
    844,
    845,
    846,
    847,
    848,
    849,
    850,
    851,
    852,
    853,
    854,
    855,
    856,
    857,
    858,
    859,
    860,
    861,
    862,
    863,
    864,
    865,
    866,
    867,
    868,
    869,
    870,
    871,
    872,
    873,
    874,
    875,
    876,
    877,
    878,
    879,
    880,
    881,
    882,
    883,
    884,
    885,
    886,
    887,
    888,
    889,
    890,
    891,
    892,
    893,
    894,
    895,
    896,
    897,
    898,
    899,
    900,
    901,
    902,
    903,
    904,
    905,
    906,
    907,
    908,
    909,
    910,
    911,
    912,
    913,
    914,
    915,
    916,
    917,
    918,
    919,
    920,
    921,
    922,
    923,
    924,
    925,
    926,
    927,
    928,
    929,
    930,
    931,
    932,
    933,
    934,
    935,
    936,
    937,
    938,
    939,
    940,
    941,
    942,
    943,
    944,
    945,
    946,
    947,
    948,
    949,
    950,
    951,
    952,
    953,
    954,
    955,
    956,
    957,
    958,
    959,
    960,
    961,
    962,
    963,
    964,
    965,
    966,
    967,
    968,
    969,
    970,
    971,
    972,
    973,
    974,
    975,
    976,
    977,
    978,
    979,
    980,
    981,
    982,
    983,
    984,
    985,
    986,
    987,
    988,
    989,
    990,
    991,
    992,
    993,
    994,
    995,
    996,
    997,
    998,
    999,
    1000,
    1001,
    1002,
    1003,
    1004,
    1005,
    1006,
    1007,
    1008,
    1009,
    1010,
    1011,
    1012,
    1013,
    1014,
    1015,
    1016,
    1017,
    1018,
    1019,
    1020,
    1021,
    1022,
    1023,
    1024,
    1025,
    1026,
    1027,
    1028,
    1029,
    1030,
    1031,
    1032,
    1033,
    1034,
    1035,
    1036,
    1037,
    1038,
    1039,
    1040,
    1041,
    1042,
    1043,
    1044,
    1045,
    1046,
    1047,
    1048,
    1049,
    1050,
    1051,
    1052,
    1053,
    1054,
    1055,
    1056,
    1057,
    1058,
    1059,
    1060,
    1061,
    1062,
    1063,
    1064,
    1065,
    1066,
    1067,
    1068,
    1069,
    1070,
    1071,
    1072,
    1073,
    1074,
    1075,
    1076,
    1077,
    1078,
    1079,
    1080,
    1081,
    1082,
    1083,
    1084,
    1085,
    1086,
    1087,
    1088,
    1089,
    1090,
    1091,
    1092,
    1093,
    1094,
    1095,
    1096,
    1097,
    1098,
    1099,
    1100,
    1101,
    1102,
    1103,
    1104,
    1105,
    1106,
    1107,
    1108,
    1109,
    1110,
    1111,
    1112,
    1113,
    1114,
    1115,
    1116,
    1117,
    1118,
    1119,
    1120,
    1121,
    1122,
    1123,
    1124,
    1125,
    1126,
    1127,
    1128,
    1129,
    1130,
    1131,
    1132,
    1133,
    1134,
    1135,
    1136,
    1137,
    1138,
    1139,
    1140,
    1141,
    1142,
    1143,
    1144,
    1145,
    1146,
    1147,
    1148,
    1149,
    1150,
    1151,
    1152,
    1153,
    1154,
    1155,
    1156,
    1157,
    1158,
    1159,
    1160,
    1161,
    1162,
    1163,
    1164,
    1165,
    1166,
    1167,
    1168,
    1169,
    1170,
    1171,
    1172,
    1173,
    1174,
    1175,
    1176,
    1177,
    1178,
    1179,
    1180,
    1181,
    1182,
    1183,
    1184,
    1185,
    1186,
    1187,
    1188,
    1189,
    1190,
    1191,
    1192,
    1193,
    1194,
    1195,
    1196,
    1197,
    1198,
    1199,
    1200,
    1201,
    1202,
    1203,
    1204,
    1205,
    1206,
    1207,
    1208,
    1209,
    1210,
    1211,
    1212,
    1213,
    1214,
    1215,
    1216,
    1217,
    1218,
    1219,
    1220,
    1221,
    1222,
    1223,
    1224,
    1225,
    1226,
    1227,
    1228,
    1229,
    1230,
    1231,
    1232,
    1233,
    1234,
    1235,
    1236,
    1237,
    1238,
    1239,
    1240,
    1241,
    1242,
    1243,
    1244,
    1245,
    1246,
    1247,
    1248,
    1249,
    1250,
    1251,
    1252,
    1253,
    1254,
    1255,
    1256,
    1257,
    1258,
    1259,
    1260,
    1261,
    1262,
    1263,
    1264,
    1265,
    1266,
    1267,
    1268,
    1269,
    1270,
    1271,
    1272,
    1273,
    1274,
    1275,
    1276,
    1277,
    1278,
    1279,
    1280,
    1281,
    1282,
    1283,
    1284,
    1285,
    1286,
    1287,
    1288,
    1289,
    1290,
    1291,
    1292,
    1293,
    1294,
    1295,
    1296,
    1297,
    1298,
    1299,
    1300,
    1301,
    1302,
    1303,
    1304,
    1305,
    1306,
    1307,
    1308,
    1309,
    1310,
    1311,
    1312,
    1313,
    1314,
    1315,
    1316,
    1317,
    1318,
    1319,
    1320,
    1321,
    1322,
    1323,
    1324,
    1325,
    1326,
    1327,
    1328,
    1329,
    1330,
    1331,
    1332,
    1333,
    1334,
    1335,
    1336,
    1337,
    1338,
    1339,
    1340,
    1341,
    1342,
    1343,
    1344,
    1345,
    1346,
    1347,
    1348,
    1349,
    1350,
    1351,
    1352,
    1353,
    1354,
    1355,
    1356,
    1357,
    1358,
    1359,
    1360,
    1361,
    1362,
    1363,
    1364,
    1365,
    1366,
    1367,
    1368,
    1369,
    1370,
    1371,
    1372,
    1373,
    1374,
    1375,
    1376,
    1377,
    1378,
    1379,
    1380,
    1381,
    1382,
    1383,
    1384,
    1385,
    1386,
    1387,
    1388,
    1389,
    1390,
    1391,
    1392,
    1393,
    1394,
    1395,
    1396,
    1397,
    1398,
    1399,
    1400,
    1401,
    1402,
    1403,
    1404,
    1405,
    1406,
    1407,
    1408,
    1409,
    1410,
    1411,
    1412,
    1413,
    1414,
    1415,
    1416,
    1417,
    1418,
    1419,
    1420,
    1421,
    1422,
    1423,
    1424,
    1425,
    1426,
    1427,
    1428,
    1429,
    1430,
    1431,
    1432,
    1433,
    1434,
    1435,
    1436,
    1437,
    1438,
    1439,
    1440,
    1441,
    1442,
    1443,
    1444,
    1445,
    1446,
    1447,
    1448,
    1449,
    1450,
    1451,
    1452,
    1453,
    1454,
    1455,
    1456,
    1457,
    1458,
    1459,
    1460,
    1461,
    1462,
    1463,
    1464,
    1465,
    1466,
    1467,
    1468,
    1469,
    1470,
    1471,
    1472,
    1473,
    1474,
    1475,
    1476,
    1477,
    1478,
    1479,
    1480,
    1481,
    1482,
    1483,
    1484,
    1485,
    1486,
    1487,
    1488,
    1489,
    1490,
    1491,
    1492,
    1493,
    1494,
    1495,
    1496,
    1497,
    1498,
    1499,
    1500,
    1501,
    1502,
    1503,
    1504,
    1505,
    1506,
    1507,
    1508,
    1509,
    1510,
    1511,
    1512,
    1513,
    1514,
    1515,
    1516,
    1517,
    1518,
    1519,
    1520,
    1521,
    1522,
    1523,
    1524,
    1525,
    1526,
    1527,
    1528,
    1529,
    1530,
    1531,
    1532,
    1533,
    1534,
    1535,
    1536,
    1537,
    1538,
    1539,
    1540,
    1541,
    1542,
    1543,
    1544,
    1545,
    1546,
    1547,
    1548,
    1549,
    1550,
    1551,
    1552,
    1553,
    1554,
    1555,
    1556,
    1557,
    1558,
    1559,
    1560,
    1561,
    1562,
    1563,
    1564,
    1565,
    1566,
    1567,
    1568,
    1569,
    1570,
    1571,
    1572,
    1573,
    1574,
    1575,
    1576,
    1577,
    1578,
    1579,
    1580,
    1581,
    1582,
    1583,
    1584,
    1585,
    1586,
    1587,
    1588,
    1589,
    1590,
    1591,
    1592,
    1593,
    1594,
    1595,
    1596,
    1597,
    1598,
    1599,
    1600,
    1601,
    1602,
    1603,
    1604,
    1605,
    1606,
    1607,
    1608,
    1609,
    1610,
    1611,
    1612,
    1613,
    1614,
    1615,
    1616,
    1617,
    1618,
    1619,
    1620,
    1621,
    1622,
    1623,
    1624,
    1625,
    1626,
    1627,
    1628,
    1629,
    1630,
    1631,
    1632,
    1633,
    1634,
    1635,
    1636,
    1637,
    1638,
    1639,
    1640,
    1641,
    1642,
    1643,
    1644,
    1645,
    1646,
    1647,
    1648,
    1649,
    1650,
    1651,
    1652,
    1653,
    1654,
    1655,
    1656,
    1657,
    1658,
    1659,
    1660,
    1661,
    1662,
    1663,
    1664,
    1665,
    1666,
    1667,
    1668,
    1669,
    1670,
    1671,
    1672,
    1673,
    1674,
    1675,
    1676,
    1677,
    1678,
    1679,
    1680,
    1681,
    1682,
    1683,
    1684,
    1685,
    1686,
    1687,
    1688,
    1689,
    1690,
    1691,
    1692,
    1693,
    1694,
    1695,
    1696,
    1697,
    1698,
    1699,
    1700,
    1701,
    1702,
    1703,
    1704,
    1705,
    1706,
    1707,
    1708,
    1709,
    1710,
    1711,
    1712,
    1713,
    1714,
    1715,
    1716,
    1717,
    1718,
    1719,
    1720,
    1721,
    1722,
    1723,
    1724,
    1725,
    1726,
    1727,
    1728,
    1729,
    1730,
    1731,
    1732,
    1733,
    1734,
    1735,
    1736,
    1737,
    1738,
    1739,
    1740,
    1741,
    1742,
    1743,
    1744,
    1745,
    1746,
    1747,
    1748,
    1749,
    1750,
    1751,
    1752,
    1753,
    1754,
    1755,
    1756,
    1757,
    1758,
    1759,
    1760,
    1761,
    1762,
    1763,
    1764,
    1765,
    1766,
    1767,
    1768,
    1769,
    1770,
    1771,
    1772,
    1773,
    1774,
    1775,
    1776,
    1777,
    1778,
    1779,
    1780,
    1781,
    1782,
    1783,
    1784,
    1785,
    1786,
    1787,
    1788,
    1789,
    1790,
    1791,
    1792,
    1793,
    1794,
    1795,
    1796,
    1797,
    1798,
    1799,
    1800,
    1801,
    1802,
    1803,
    1804,
    1805,
    1806,
    1807,
    1808,
    1809,
    1810,
    1811,
    1812,
    1813,
    1814,
    1815,
    1816,
    1817,
    1818,
    1819,
    1820,
    1821,
    1822,
    1823,
    1824,
    1825,
    1826,
    1827,
    1828,
    1829,
    1830,
    1831,
    1832,
    1833,
    1834,
    1835,
    1836,
    1837,
    1838,
    1839,
    1840,
    1841,
    1842,
    1843,
    1844,
    1845,
    1846,
    1847,
    1848,
    1849,
    1850,
    1851,
    1852,
    1853,
    1854,
    1855,
    1856,
    1857,
    1858,
    1859,
    1860,
    1861,
    1862,
    1863,
    1864,
    1865,
    1866,
    1867,
    1868,
    1869,
    1870,
    1871,
    1872,
    1873,
    1874,
    1875,
    1876,
    1877,
    1878,
    1879,
    1880,
    1881,
    1882,
    1883,
    1884,
    1885,
    1886,
    1887,
    1888,
    1889,
    1890,
    1891,
    1892,
    1893,
    1894,
    1895,
    1896,
    1897,
    1898,
    1899,
    1900,
    1901,
    1902,
    1903,
    1904,
    1905,
    1906,
    1907,
    1908,
    1909,
    1910,
    1911,
    1912,
    1913,
    1914,
    1915,
    1916,
    1917,
    1918,
    1919,
    1920,
    1921,
    1922,
    1923,
    1924,
    1925,
    1926,
    1927,
    1928,
    1929,
    1930,
    1931,
    1932,
    1933,
    1934,
    1935,
    1936,
    1937,
    1938,
    1939,
    1940,
    1941,
    1942,
    1943,
    1944,
    1945,
    1946,
    1947,
    1948,
    1949,
    1950,
    1951,
    1952,
    1953,
    1954,
    1955,
    1956,
    1957,
    1958,
    1959,
    1960,
    1961,
    1962,
    1963,
    1964,
    1965,
    1966,
    1967,
    1968,
    1969,
    1970,
    1971,
    1972,
    1973,
    1974,
    1975,
    1976,
    1977,
    1978,
    1979,
    1980,
    1981,
    1982,
    1983,
    1984,
    1985,
    1986,
    1987,
    1988,
    1989,
    1990,
    1991,
    1992,
    1993,
    1994,
    1995,
    1996,
    1997,
    1998,
    1999,
    2000,
    2001,
    2002,
    2003,
    2004,
    2005,
    2006,
    2007,
    2008,
    2009,
    2010,
    2011,
    2012,
    2013,
    2014,
    2015,
    2016,
    2017,
    2018,
    2019,
    2020,
    2021,
    2022,
    2023,
    2024,
    2025,
    2026,
    2027,
    2028,
    2029,
    2030,
    2031,
    2032,
    2033,
    2034,
    2035,
    2036,
    2037,
    2038,
    2039,
    2040,
    2041,
    2042,
    2043,
    2044,
    2045,
    2046,
    2047,
    2048,
    2049,
    2050,
    2051,
    2052,
    2053,
    2054,
    2055,
    2056,
    2057,
    2058,
    2059,
    2060,
    2061,
    2062,
    2063,
    2064,
    2065,
    2066,
    2067,
    2068,
    2069,
    2070,
    2071,
    2072,
    2073,
    2074,
    2075,
    2076,
    2077,
    2078,
    2079,
    2080,
    2081,
    2082,
    2083,
    2084,
    2085,
    2086,
    2087,
    2088,
    2089,
    2090,
    2091,
    2092,
    2093,
    2094,
    2095,
    2096,
    2097,
    2098,
    2099,
    2100,
    2101,
    2102,
    2103,
    2104,
    2105,
    2106,
    2107,
    2108,
    2109,
    2110,
    2111,
    2112,
    2113,
    2114,
    2115,
    2116,
    2117,
    2118,
    2119,
    2120,
    2121,
    2122,
    2123,
    2124,
    2125,
    2126,
    2127,
    2128,
    2129,
    2130,
    2131,
    2132,
    2133,
    2134,
    2135,
    2136,
    2137,
    2138,
    2139,
    2140,
    2141,
    2142,
    2143,
    2144,
    2145,
    2146,
    2147,
    2148,
    2149,
    2150,
    2151,
    2152,
    2153,
    2154,
    2155,
    2156,
    2157,
    2158,
    2159,
    2160,
    2161,
    2162,
    2163,
    2164,
    2165,
    2166,
    2167,
    2168,
    2169,
    2170,
    2171,
    2172,
    2173,
    2174,
    2175,
    2176,
    2177,
    2178,
    2179,
    2180,
    2181,
    2182,
    2183,
    2184,
    2185,
    2186,
    2187,
    2188,
    2189,
    2190,
    2191,
    2192,
    2193,
    2194,
    2195,
    2196,
    2197,
    2198,
    2199,
    2200,
    2201,
    2202,
    2203,
    2204,
    2205,
    2206,
    2207,
    2208,
    2209,
    2210,
    2211,
    2212,
    2213,
    2214,
    2215,
    2216,
    2217,
    2218,
    2219,
    2220,
    2221,
    2222,
    2223,
    2224,
    2225,
    2226,
    2227,
    2228,
    2229,
    2230,
    2231,
    2232,
    2233,
    2234,
    2235,
    2236,
    2237,
    2238,
    2239,
    2240,
    2241,
    2242,
    2243,
    2244,
    2245,
    2246,
    2247,
    2248,
    2249,
    2250,
    2251,
    2252,
    2253,
    2254,
    2255,
    2256,
    2257,
    2258,
    2259,
    2260,
    2261,
    2262,
    2263,
    2264,
    2265,
    2266,
    2267,
    2268,
    2269,
    2270,
    2271,
    2272,
    2273,
    2274,
    2275,
    2276,
    2277,
    2278,
    2279,
    2280,
    2281,
    2282,
    2283,
    2284,
    2285,
    2286,
    2287,
    2288,
    2289,
    2290,
    2291,
    2292,
    2293,
    2294,
    2295,
    2296,
    2297,
    2298,
    2299,
    2300,
    2301,
    2302,
    2303,
    2304,
    2305,
    2306,
    2307,
    2308,
    2309,
    2310,
    2311,
    2312,
    2313,
    2314,
    2315,
    2316,
    2317,
    2318,
    2319,
    2320,
    2321,
    2322,
    2323,
    2324,
    2325,
    2326,
    2327,
    2328,
    2329,
    2330,
    2331,
    2332,
    2333,
    2334,
    2335,
    2336,
    2337,
    2338,
    2339,
    2340,
    2341,
    2342,
    2343,
    2344,
    2345,
    2346,
    2347,
    2348,
    2349,
    2350,
    2351,
    2352,
    2353,
    2354,
    2355,
    2356,
    2357,
    2358,
    2359,
    2360,
    2361,
    2362,
    2363,
    2364,
    2365,
    2366,
    2367,
    2368,
    2369,
    2370,
    2371,
    2372,
    2373,
    2374,
    2375,
    2376,
    2377,
    2378,
    2379,
    2380,
    2381,
    2382,
    2383,
    2384,
    2385,
    2386,
    2387,
    2388,
    2389,
    2390,
    2391,
    2392,
    2393,
    2394,
    2395,
    2396,
    2397,
    2398,
    2399,
    2400,
    2401,
    2402,
    2403,
    2404,
    2405,
    2406,
    2407,
    2408,
    2409,
    2410,
    2411,
    2412,
    2413,
    2414,
    2415,
    2416,
    2417,
    2418,
    2419,
    2420,
    2421,
    2422,
    2423,
    2424,
    2425,
    2426,
    2427,
    2428,
    2429,
    2430,
    2431,
    2432,
    2433,
    2434,
    2435,
    2436,
    2437,
    2438,
    2439,
    2440,
    2441,
    2442,
    2443,
    2444,
    2445,
    2446,
    2447,
    2448,
    2449,
    2450,
    2451,
    2452,
    2453,
    2454,
    2455,
    2456,
    2457,
    2458,
    2459,
    2460,
    2461,
    2462,
    2463,
    2464,
    2465,
    2466,
    2467,
    2468,
    2469,
    2470,
    2471,
    2472,
    2473,
    2474,
    2475,
    2476,
    2477,
    2478,
    2479,
    2480,
    2481,
    2482,
    2483,
    2484,
    2485,
    2486,
    2487,
    2488,
    2489,
    2490,
    2491,
    2492,
    2493,
    2494,
    2495,
    2496,
    2497,
    2498,
    2499,
    2500,
    2501,
    2502,
    2503,
    2504,
    2505,
    2506,
    2507,
    2508,
    2509,
    2510,
    2511,
    2512,
    2513,
    2514,
    2515,
    2516,
    2517,
    2518,
    2519,
    2520,
    2521,
    2522,
    2523,
    2524,
    2525,
    2526,
    2527,
    2528,
    2529,
    2530,
    2531,
    2532,
    2533,
    2534,
    2535,
    2536,
    2537,
    2538,
    2539,
    2540,
    2541,
    2542,
    2543,
    2544,
    2545,
    2546,
    2547,
    2548,
    2549,
    2550,
    2551,
    2552,
    2553,
    2554,
    2555,
    2556,
    2557,
    2558,
    2559,
    2560,
    2561,
    2562,
    2563,
    2564,
    2565,
    2566,
    2567,
    2568,
    2569,
    2570,
    2571,
    2572,
    2573,
    2574,
    2575,
    2576,
    2577,
    2578,
    2579,
    2580,
    2581,
    2582,
    2583,
    2584,
    2585,
    2586,
    2587,
    2588,
    2589,
    2590,
    2591,
    2592,
    2593,
    2594,
    2595,
    2596,
    2597,
    2598,
    2599,
    2600,
    2601,
    2602,
    2603,
    2604,
    2605,
    2606,
    2607,
    2608,
    2609,
    2610,
    2611,
    2612,
    2613,
    2614,
    2615,
    2616,
    2617,
    2618,
    2619,
    2620,
    2621,
    2622,
    2623,
    2624,
    2625,
    2626,
    2627,
    2628,
    2629,
    2630,
    2631,
    2632,
    2633,
    2634,
    2635,
    2636,
    2637,
    2638,
    2639,
    2640,
    2641,
    2642,
    2643,
    2644,
    2645,
    2646,
    2647,
    2648,
    2649,
    2650,
    2651,
    2652,
    2653,
    2654,
    2655,
    2656,
    2657,
    2658,
    2659,
    2660,
    2661,
    2662,
    2663,
    2664,
    2665,
    2666,
    2667,
    2668,
    2669,
    2670,
    2671,
    2672,
    2673,
    2674,
    2675,
    2676,
    2677,
    2678,
    2679,
    2680,
    2681,
    2682,
    2683,
    2684,
    2685,
    2686,
    2687,
    2688,
    2689,
    2690,
    2691,
    2692,
    2693,
    2694,
    2695,
    2696,
    2697,
    2698,
    2699,
    2700,
    2701,
    2702,
    2703,
    2704,
    2705,
    2706,
    2707,
    2708,
    2709,
    2710,
    2711,
    2712,
    2713,
    2714,
    2715,
    2716,
    2717,
    2718,
    2719,
    2720,
    2721,
    2722,
    2723,
    2724,
    2725,
    2726,
    2727,
    2728,
    2729,
    2730,
    2731,
    2732,
    2733,
    2734,
    2735,
    2736,
    2737,
    2738,
    2739,
    2740,
    2741,
    2742,
    2743,
    2744,
    2745,
    2746,
    2747,
    2748,
    2749,
    2750,
    2751,
    2752,
    2753,
    2754,
    2755,
    2756,
    2757,
    2758,
    2759,
    2760,
    2761,
    2762,
    2763,
    2764,
    2765,
    2766,
    2767,
    2768,
    2769,
    2770,
    2771,
    2772,
    2773,
    2774,
    2775,
    2776,
    2777,
    2778,
    2779,
    2780,
    2781,
    2782,
    2783,
    2784,
    2785,
    2786,
    2787,
    2788,
    2789,
    2790,
    2791,
    2792,
    2793,
    2794,
    2795,
    2796,
    2797,
    2798,
    2799,
    2800,
    2801,
    2802,
    2803,
    2804,
    2805,
    2806,
    2807,
    2808,
    2809,
    2810,
    2811,
    2812,
    2813,
    2814,
    2815,
    2816,
    2817,
    2818,
    2819,
    2820,
    2821,
    2822,
    2823,
    2824,
    2825,
    2826,
    2827,
    2828,
    2829,
    2830,
    2831,
    2832,
    2833,
    2834,
    2835,
    2836,
    2837,
    2838,
    2839,
    2840,
    2841,
    2842,
    2843,
    2844,
    2845,
    2846,
    2847,
    2848,
    2849,
    2850,
    2851,
    2852,
    2853,
    2854,
    2855,
    2856,
    2857,
    2858,
    2859,
    2860,
    2861,
    2862,
    2863,
    2864,
    2865,
    2866,
    2867,
    2868,
    2869,
    2870,
    2871,
    2872,
    2873,
    2874,
    2875,
    2876,
    2877,
    2878,
    2879,
    2880,
    2881,
    2882,
    2883,
    2884,
    2885,
    2886,
    2887,
    2888,
    2889,
    2890,
    2891,
    2892,
    2893,
    2894,
    2895,
    2896,
    2897,
    2898,
    2899,
    2900,
    2901,
    2902,
    2903,
    2904,
    2905,
    2906,
    2907,
    2908,
    2909,
    2910,
    2911,
    2912,
    2913,
    2914,
    2915,
    2916,
    2917,
    2918,
    2919,
    2920,
    2921,
    2922,
    2923,
    2924,
    2925,
    2926,
    2927,
    2928,
    2929,
    2930,
    2931,
    2932,
    2933,
    2934,
    2935,
    2936,
    2937,
    2938,
    2939,
    2940,
    2941,
    2942,
    2943,
    2944,
    2945,
    2946,
    2947,
    2948,
    2949,
    2950,
    2951,
    2952,
    2953,
    2954,
    2955,
    2956,
    2957,
    2958,
    2959,
    2960,
    2961,
    2962,
    2963,
    2964,
    2965,
    2966,
    2967,
    2968,
    2969,
    2970,
    2971,
    2972,
    2973,
    2974,
    2975,
    2976,
    2977,
    2978,
    2979,
    2980,
    2981,
    2982,
    2983,
    2984,
    2985,
    2986,
    2987,
    2988,
    2989,
    2990,
    2991,
    2992,
    2993,
    2994,
    2995,
    2996,
    2997,
    2998,
    2999,
    3000,
    3001,
    3002,
    3003,
    3004,
    3005,
    3006,
    3007,
    3008,
    3009,
    3010,
    3011,
    3012,
    3013,
    3014,
    3015,
    3016,
    3017,
    3018,
    3019,
    3020,
    3021,
    3022,
    3023,
    3024,
    3025,
    3026,
    3027,
    3028,
    3029,
    3030,
    3031,
    3032,
    3033,
    3034,
    3035,
    3036,
    3037,
    3038,
    3039,
    3040,
    3041,
    3042,
    3043,
    3044,
    3045,
    3046,
    3047,
    3048,
    3049,
    3050,
    3051,
    3052,
    3053,
    3054,
    3055,
    3056,
    3057,
    3058,
    3059,
    3060,
    3061,
    3062,
    3063,
    3064,
    3065,
    3066,
    3067,
    3068,
    3069,
    3070,
    3071,
    3072,
    3073,
    3074,
    3075,
    3076,
    3077,
    3078,
    3079,
    3080,
    3081,
    3082,
    3083,
    3084,
    3085,
    3086,
    3087,
    3088,
    3089,
    3090,
    3091,
    3092,
    3093,
    3094,
    3095,
    3096,
    3097,
    3098,
    3099,
    3100,
    3101,
    3102,
    3103,
    3104,
    3105,
    3106,
    3107,
    3108,
    3109,
    3110,
    3111,
    3112,
    3113,
    3114,
    3115,
    3116,
    3117,
    3118,
    3119,
    3120,
    3121,
    3122,
    3123,
    3124,
    3125,
    3126,
    3127,
    3128,
    3129,
    3130,
    3131,
    3132,
    3133,
    3134,
    3135,
    3136,
    3137,
    3138,
    3139,
    3140,
    3141,
    3142,
    3143,
    3144,
    3145,
    3146,
    3147,
    3148,
    3149,
    3150,
    3151,
    3152,
    3153,
    3154,
    3155,
    3156,
    3157,
    3158,
    3159,
    3160,
    3161,
    3162,
    3163,
    3164,
    3165,
    3166,
    3167,
    3168,
    3169,
    3170,
    3171,
    3172,
    3173,
    3174,
    3175,
    3176,
    3177,
    3178,
    3179,
    3180,
    3181,
    3182,
    3183,
    3184,
    3185,
    3186,
    3187,
    3188,
    3189,
    3190,
    3191,
    3192,
    3193,
    3194,
    3195,
    3196,
    3197,
    3198,
    3199,
    3200,
    3201,
    3202,
    3203,
    3204,
    3205,
    3206,
    3207,
    3208,
    3209,
    3210,
    3211,
    3212,
    3213,
    3214,
    3215,
    3216,
    3217,
    3218,
    3219,
    3220,
    3221,
    3222,
    3223,
    3224,
    3225,
    3226,
    3227,
    3228,
    3229,
    3230,
    3231,
    3232,
    3233,
    3234,
    3235,
    3236,
    3237,
    3238,
    3239,
    3240,
    3241,
    3242,
    3243,
    3244,
    3245,
    3246,
    3247,
    3248,
    3249,
    3250,
    3251,
    3252,
    3253,
    3254,
    3255,
    3256,
    3257,
    3258,
    3259,
    3260,
    3261,
    3262,
    3263,
    3264,
    3265,
    3266,
    3267,
    3268,
    3269,
    3270,
    3271,
    3272,
    3273,
    3274,
    3275,
    3276,
    3277,
    3278,
    3279,
    3280,
    3281,
    3282,
    3283,
    3284,
    3285,
    3286,
    3287,
    3288,
    3289,
    3290,
    3291,
    3292,
    3293,
    3294,
    3295,
    3296,
    3297,
    3298,
    3299,
    3300,
    3301,
    3302,
    3303,
    3304,
    3305,
    3306,
    3307,
    3308,
    3309,
    3310,
    3311,
    3312,
    3313,
    3314,
    3315,
    3316,
    3317,
    3318,
    3319,
    3320,
    3321,
    3322,
    3323,
    3324,
    3325,
    3326,
    3327,
    3328,
    3329,
    3330,
    3331,
    3332,
    3333,
    3334,
    3335,
    3336,
    3337,
    3338,
    3339,
    3340,
    3341,
    3342,
    3343,
    3344,
    3345,
    3346,
    3347,
    3348,
    3349,
    3350,
    3351,
    3352,
    3353,
    3354,
    3355,
    3356,
    3357,
    3358,
    3359,
    3360,
    3361,
    3362,
    3363,
    3364,
    3365,
    3366,
    3367,
    3368,
    3369,
    3370,
    3371,
    3372,
    3373,
    3374,
    3375,
    3376,
    3377,
    3378,
    3379,
    3380,
    3381,
    3382,
    3383,
    3384,
    3385,
    3386,
    3387,
    3388,
    3389,
    3390,
    3391,
    3392,
    3393,
    3394,
    3395,
    3396,
    3397,
    3398,
    3399,
    3400,
    3401,
    3402,
    3403,
    3404,
    3405,
    3406,
    3407,
    3408,
    3409,
    3410,
    3411,
    3412,
    3413,
    3414,
    3415,
    3416,
    3417,
    3418,
    3419,
    3420,
    3421,
    3422,
    3423,
    3424,
    3425,
    3426,
    3427,
    3428,
    3429,
    3430,
    3431,
    3432,
    3433,
    3434,
    3435,
    3436,
    3437,
    3438,
    3439,
    3440,
    3441,
    3442,
    3443,
    3444,
    3445,
    3446,
    3447,
    3448,
    3449,
    3450,
    3451,
    3452,
    3453,
    3454,
    3455,
    3456,
    3457,
    3458,
    3459,
    3460,
    3461,
    3462,
    3463,
    3464,
    3465,
    3466,
    3467,
    3468,
    3469,
    3470,
    3471,
    3472,
    3473,
    3474,
    3475,
    3476,
    3477,
    3478,
    3479,
    3480,
    3481,
    3482,
    3483,
    3484,
    3485,
    3486,
    3487,
    3488,
    3489,
    3490,
    3491,
    3492,
    3493,
    3494,
    3495,
    3496,
    3497,
    3498,
    3499,
    3500,
    3501,
    3502,
    3503,
    3504,
    3505,
    3506,
    3507,
    3508,
    3509,
    3510,
    3511,
    3512,
    3513,
    3514,
    3515,
    3516,
    3517,
    3518,
    3519,
    3520,
    3521,
    3522,
    3523,
    3524,
    3525,
    3526,
    3527,
    3528,
    3529,
    3530,
    3531,
    3532,
    3533,
    3534,
    3535,
    3536,
    3537,
    3538,
    3539,
    3540,
    3541,
    3542,
    3543,
    3544,
    3545,
    3546,
    3547,
    3548,
    3549,
    3550,
    3551,
    3552,
    3553,
    3554,
    3555,
    3556,
    3557,
    3558,
    3559,
    3560,
    3561,
    3562,
    3563,
    3564,
    3565,
    3566,
    3567,
    3568,
    3569,
    3570,
    3571,
    3572,
    3573,
    3574,
    3575,
    3576,
    3577,
    3578,
    3579,
    3580,
    3581,
    3582,
    3583,
    3584,
    3585,
    3586,
    3587,
    3588,
    3589,
    3590,
    3591,
    3592,
    3593,
    3594,
    3595,
    3596,
    3597,
    3598,
    3599,
    3600,
    3601,
    3602,
    3603,
    3604,
    3605,
    3606,
    3607,
    3608,
    3609,
    3610,
    3611,
    3612,
    3613,
    3614,
    3615,
    3616,
    3617,
    3618,
    3619,
    3620,
    3621,
    3622,
    3623,
    3624,
    3625,
    3626,
    3627,
    3628,
    3629,
    3630,
    3631,
    3632,
    3633,
    3634,
    3635,
    3636,
    3637,
    3638,
    3639,
    3640,
    3641,
    3642,
    3643,
    3644,
    3645,
    3646,
    3647,
    3648,
    3649,
    3650,
    3651,
    3652,
    3653,
    3654,
    3655,
    3656,
    3657,
    3658,
    3659,
    3660,
    3661,
    3662,
    3663,
    3664,
    3665,
    3666,
    3667,
    3668,
    3669,
    3670,
    3671,
    3672,
    3673,
    3674,
    3675,
    3676,
    3677,
    3678,
    3679,
    3680,
    3681,
    3682,
    3683,
    3684,
    3685,
    3686,
    3687,
    3688,
    3689,
    3690,
    3691,
    3692,
    3693,
    3694,
    3695,
    3696,
    3697,
    3698,
    3699,
    3700,
    3701,
    3702,
    3703,
    3704,
    3705,
    3706,
    3707,
    3708,
    3709,
    3710,
    3711,
    3712,
    3713,
    3714,
    3715,
    3716,
    3717,
    3718,
    3719,
    3720,
    3721,
    3722,
    3723,
    3724,
    3725,
    3726,
    3727,
    3728,
    3729,
    3730,
    3731,
    3732,
    3733,
    3734,
    3735,
    3736,
    3737,
    3738,
    3739,
    3740,
    3741,
    3742,
    3743,
    3744,
    3745,
    3746,
    3747,
    3748,
    3749,
    3750,
    3751,
    3752,
    3753,
    3754,
    3755,
    3756,
    3757,
    3758,
    3759,
    3760,
    3761,
    3762,
    3763,
    3764,
    3765,
    3766,
    3767,
    3768,
    3769,
    3770,
    3771,
    3772,
    3773,
    3774,
    3775,
    3776,
    3777,
    3778,
    3779,
    3780,
    3781,
    3782,
    3783,
    3784,
    3785,
    3786,
    3787,
    3788,
    3789,
    3790,
    3791,
    3792,
    3793,
    3794,
    3795,
    3796,
    3797,
    3798,
    3799,
    3800,
    3801,
    3802,
    3803,
    3804,
    3805,
    3806,
    3807,
    3808,
    3809,
    3810,
    3811,
    3812,
    3813,
    3814,
    3815,
    3816,
    3817,
    3818,
    3819,
    3820,
    3821,
    3822,
    3823,
    3824,
    3825,
    3826,
    3827,
    3828,
    3829,
    3830,
    3831,
    3832,
    3833,
    3834,
    3835,
    3836,
    3837,
    3838,
    3839,
    3840,
    3841,
    3842,
    3843,
    3844,
    3845,
    3846,
    3847,
    3848,
    3849,
    3850,
    3851,
    3852,
    3853,
    3854,
    3855,
    3856,
    3857,
    3858,
    3859,
    3860,
    3861,
    3862,
    3863,
    3864,
    3865,
    3866,
    3867,
    3868,
    3869,
    3870,
    3871,
    3872,
    3873,
    3874,
    3875,
    3876,
    3877,
    3878,
    3879,
    3880,
    3881,
    3882,
    3883,
    3884,
    3885,
    3886,
    3887,
    3888,
    3889,
    3890,
    3891,
    3892,
    3893,
    3894,
    3895,
    3896,
    3897,
    3898,
    3899,
    3900,
    3901,
    3902,
    3903,
    3904,
    3905,
    3906,
    3907,
    3908,
    3909,
    3910,
    3911,
    3912,
    3913,
    3914,
    3915,
    3916,
    3917,
    3918,
    3919,
    3920,
    3921,
    3922,
    3923,
    3924,
    3925,
    3926,
    3927,
    3928,
    3929,
    3930,
    3931,
    3932,
    3933,
    3934,
    3935,
    3936,
    3937,
    3938,
    3939,
    3940,
    3941,
    3942,
    3943,
    3944,
    3945,
    3946,
    3947,
    3948,
    3949,
    3950,
    3951,
    3952,
    3953,
    3954,
    3955,
    3956,
    3957,
    3958,
    3959,
    3960,
    3961,
    3962,
    3963,
    3964,
    3965,
    3966,
    3967,
    3968,
    3969,
    3970,
    3971,
    3972,
    3973,
    3974,
    3975,
    3976,
    3977,
    3978,
    3979,
    3980,
    3981,
    3982,
    3983,
    3984,
    3985,
    3986,
    3987,
    3988,
    3989,
    3990,
    3991,
    3992,
    3993,
    3994,
    3995,
    3996,
    3997,
    3998,
    3999,
    4000,
    4001,
    4002,
    4003,
    4004,
    4005,
    4006,
    4007,
    4008,
    4009,
    4010,
    4011,
    4012,
    4013,
    4014,
    4015,
    4016,
    4017,
    4018,
    4019,
    4020,
    4021,
    4022,
    4023,
    4024,
    4025,
    4026,
    4027,
    4028,
    4029,
    4030,
    4031,
    4032,
    4033,
    4034,
    4035,
    4036,
    4037,
    4038,
    4039,
    4040,
    4041,
    4042,
    4043,
    4044,
    4045,
    4046,
    4047,
    4048,
    4049,
    4050,
    4051,
    4052,
    4053,
    4054,
    4055,
    4056,
    4057,
    4058,
    4059,
    4060,
    4061,
    4062,
    4063,
    4064,
    4065,
    4066,
    4067,
    4068,
    4069,
    4070,
    4071,
    4072,
    4073,
    4074,
    4075,
    4076,
    4077,
    4078,
    4079,
    4080,
    4081,
    4082,
    4083,
    4084,
    4085,
    4086,
    4087,
    4088,
    4089,
    4090,
    4091,
    4092,
    4093,
    4094,
    4095,
    4096,
    4097,
    4098,
    4099,
    4100,
    4101,
    4102,
    4103,
    4104,
    4105,
    4106,
    4107,
    4108,
    4109,
    4110,
    4111,
    4112,
    4113,
    4114,
    4115,
    4116,
    4117,
    4118,
    4119,
    4120,
    4121,
    4122,
    4123,
    4124,
    4125,
    4126,
    4127,
    4128,
    4129,
    4130,
    4131,
    4132,
    4133,
    4134,
    4135,
    4136,
    4137,
    4138,
    4139,
    4140,
    4141,
    4142,
    4143,
    4144,
    4145,
    4146,
    4147,
    4148,
    4149,
    4150,
    4151,
    4152,
    4153,
    4154,
    4155,
    4156,
    4157
    ].

getKey(1)->[
    1
    ];
getKey(2)->[
    2,
    3
    ];
getKey(51)->[
    4
    ];
getKey(52)->[
    5
    ];
getKey(53)->[
    6
    ];
getKey(54)->[
    7
    ];
getKey(55)->[
    8
    ];
getKey(56)->[
    9
    ];
getKey(57)->[
    10
    ];
getKey(58)->[
    11
    ];
getKey(59)->[
    12
    ];
getKey(60)->[
    13
    ];
getKey(71)->[
    14
    ];
getKey(72)->[
    15
    ];
getKey(73)->[
    16
    ];
getKey(74)->[
    17
    ];
getKey(75)->[
    18
    ];
getKey(76)->[
    19
    ];
getKey(77)->[
    20
    ];
getKey(78)->[
    21
    ];
getKey(79)->[
    22
    ];
getKey(80)->[
    23
    ];
getKey(101)->[
    24,
    25,
    26,
    27
    ];
getKey(102)->[
    28,
    29
    ];
getKey(103)->[
    30,
    31,
    32
    ];
getKey(201)->[
    33,
    34
    ];
getKey(202)->[
    35,
    36
    ];
getKey(203)->[
    37,
    38
    ];
getKey(204)->[
    39,
    40
    ];
getKey(205)->[
    41,
    42
    ];
getKey(206)->[
    43,
    44
    ];
getKey(207)->[
    45,
    46
    ];
getKey(208)->[
    47,
    48
    ];
getKey(209)->[
    49,
    50
    ];
getKey(210)->[
    51,
    52
    ];
getKey(211)->[
    53,
    54
    ];
getKey(212)->[
    55,
    56
    ];
getKey(213)->[
    57,
    58
    ];
getKey(214)->[
    59,
    60
    ];
getKey(215)->[
    61,
    62
    ];
getKey(301)->[
    63
    ];
getKey(302)->[
    64
    ];
getKey(303)->[
    65
    ];
getKey(304)->[
    66
    ];
getKey(305)->[
    67
    ];
getKey(306)->[
    68
    ];
getKey(307)->[
    69
    ];
getKey(308)->[
    70
    ];
getKey(309)->[
    71
    ];
getKey(310)->[
    72
    ];
getKey(311)->[
    73
    ];
getKey(312)->[
    74
    ];
getKey(313)->[
    75
    ];
getKey(314)->[
    76
    ];
getKey(315)->[
    77
    ];
getKey(401)->[
    78
    ];
getKey(402)->[
    79
    ];
getKey(403)->[
    80
    ];
getKey(404)->[
    81
    ];
getKey(405)->[
    82
    ];
getKey(406)->[
    83
    ];
getKey(407)->[
    84
    ];
getKey(408)->[
    85
    ];
getKey(460)->[
    86,
    87,
    88,
    89,
    90,
    91
    ];
getKey(461)->[
    92,
    93,
    94,
    95,
    96,
    97
    ];
getKey(462)->[
    98,
    99,
    100,
    101,
    102,
    103
    ];
getKey(463)->[
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112
    ];
getKey(464)->[
    113
    ];
getKey(465)->[
    114
    ];
getKey(466)->[
    115
    ];
getKey(467)->[
    116
    ];
getKey(470)->[
    117
    ];
getKey(471)->[
    118
    ];
getKey(472)->[
    119
    ];
getKey(501)->[
    120
    ];
getKey(502)->[
    121
    ];
getKey(503)->[
    122
    ];
getKey(504)->[
    123
    ];
getKey(505)->[
    124
    ];
getKey(506)->[
    125
    ];
getKey(507)->[
    126
    ];
getKey(508)->[
    127
    ];
getKey(509)->[
    128
    ];
getKey(510)->[
    129
    ];
getKey(601)->[
    130
    ];
getKey(602)->[
    131
    ];
getKey(603)->[
    132
    ];
getKey(611)->[
    133,
    134,
    135,
    136
    ];
getKey(612)->[
    137,
    138,
    139,
    140
    ];
getKey(613)->[
    141,
    142,
    143,
    144
    ];
getKey(651)->[
    145,
    146
    ];
getKey(652)->[
    147,
    148
    ];
getKey(653)->[
    149,
    150
    ];
getKey(654)->[
    151,
    152
    ];
getKey(655)->[
    153,
    154
    ];
getKey(661)->[
    155
    ];
getKey(662)->[
    156
    ];
getKey(663)->[
    157,
    158,
    159
    ];
getKey(664)->[
    160,
    161,
    162
    ];
getKey(665)->[
    163,
    164,
    165,
    166,
    167,
    168,
    169
    ];
getKey(666)->[
    170,
    171,
    172
    ];
getKey(667)->[
    173,
    174,
    175
    ];
getKey(668)->[
    176,
    177,
    178
    ];
getKey(669)->[
    179,
    180,
    181
    ];
getKey(670)->[
    182,
    183,
    184
    ];
getKey(701)->[
    185,
    186,
    187,
    188,
    189,
    190
    ];
getKey(702)->[
    191,
    192,
    193,
    194,
    195,
    196
    ];
getKey(703)->[
    197,
    198,
    199,
    200,
    201,
    202
    ];
getKey(704)->[
    203,
    204,
    205,
    206,
    207,
    208
    ];
getKey(705)->[
    209,
    210,
    211,
    212,
    213,
    214
    ];
getKey(706)->[
    215,
    216,
    217,
    218,
    219,
    220
    ];
getKey(707)->[
    221,
    222,
    223,
    224,
    225,
    226
    ];
getKey(708)->[
    227,
    228,
    229,
    230,
    231,
    232,
    233
    ];
getKey(709)->[
    234,
    235,
    236,
    237,
    238,
    239,
    240
    ];
getKey(710)->[
    241,
    242,
    243,
    244,
    245,
    246,
    247
    ];
getKey(711)->[
    248,
    249,
    250,
    251,
    252,
    253,
    254
    ];
getKey(712)->[
    255,
    256,
    257,
    258,
    259,
    260,
    261
    ];
getKey(713)->[
    262,
    263,
    264,
    265,
    266,
    267,
    268
    ];
getKey(714)->[
    269,
    270,
    271,
    272,
    273,
    274,
    275
    ];
getKey(715)->[
    276,
    277,
    278,
    279,
    280,
    281,
    282
    ];
getKey(716)->[
    283,
    284,
    285,
    286,
    287,
    288,
    289
    ];
getKey(717)->[
    290,
    291,
    292,
    293,
    294,
    295,
    296
    ];
getKey(718)->[
    297,
    298,
    299,
    300,
    301,
    302,
    303
    ];
getKey(719)->[
    304,
    305,
    306,
    307,
    308,
    309,
    310
    ];
getKey(720)->[
    311,
    312,
    313,
    314,
    315,
    316,
    317
    ];
getKey(721)->[
    318,
    319,
    320,
    321,
    322,
    323,
    324
    ];
getKey(801)->[
    325,
    326,
    327,
    328,
    329,
    330,
    331,
    332,
    333,
    334,
    335,
    336,
    337,
    338,
    339,
    340,
    341,
    342,
    343,
    344,
    345,
    346,
    347,
    348,
    349,
    350,
    351,
    352,
    353
    ];
getKey(802)->[
    354
    ];
getKey(803)->[
    355
    ];
getKey(804)->[
    356
    ];
getKey(805)->[
    357
    ];
getKey(811)->[
    358
    ];
getKey(812)->[
    359
    ];
getKey(813)->[
    360
    ];
getKey(814)->[
    361,
    362,
    363
    ];
getKey(815)->[
    364,
    365,
    366,
    367
    ];
getKey(816)->[
    368,
    369,
    370
    ];
getKey(850)->[
    371
    ];
getKey(851)->[
    372,
    373,
    374
    ];
getKey(852)->[
    375,
    376,
    377,
    378
    ];
getKey(853)->[
    379,
    380,
    381,
    382,
    383
    ];
getKey(854)->[
    384,
    385,
    386,
    387,
    388
    ];
getKey(855)->[
    389,
    390,
    391,
    392,
    393,
    394,
    395,
    396
    ];
getKey(856)->[
    397,
    398,
    399,
    400,
    401,
    402,
    403,
    404,
    405
    ];
getKey(857)->[
    406
    ];
getKey(858)->[
    407
    ];
getKey(859)->[
    408
    ];
getKey(901)->[
    409,
    410
    ];
getKey(902)->[
    411
    ];
getKey(903)->[
    412,
    413,
    414
    ];
getKey(904)->[
    415,
    416,
    417,
    418,
    419,
    420,
    421
    ];
getKey(910)->[
    422,
    423
    ];
getKey(911)->[
    424,
    425
    ];
getKey(912)->[
    426,
    427
    ];
getKey(913)->[
    428,
    429,
    430,
    431
    ];
getKey(914)->[
    432,
    433
    ];
getKey(915)->[
    434,
    435,
    436,
    437,
    438,
    439
    ];
getKey(916)->[
    440
    ];
getKey(917)->[
    441
    ];
getKey(918)->[
    442
    ];
getKey(919)->[
    443
    ];
getKey(920)->[
    444
    ];
getKey(921)->[
    445
    ];
getKey(922)->[
    446
    ];
getKey(923)->[
    447
    ];
getKey(991)->[
    448,
    449,
    450,
    451,
    452,
    453,
    454,
    455,
    456,
    457,
    458,
    459,
    460,
    461,
    462,
    463,
    464,
    465,
    466,
    467,
    468,
    469,
    470,
    471
    ];
getKey(992)->[
    472,
    473,
    474,
    475,
    476,
    477,
    478,
    479,
    480,
    481,
    482,
    483,
    484,
    485,
    486,
    487,
    488,
    489,
    490,
    491,
    492,
    493,
    494,
    495,
    496,
    497,
    498
    ];
getKey(993)->[
    499,
    500,
    501,
    502,
    503,
    504,
    505,
    506,
    507,
    508,
    509,
    510,
    511,
    512,
    513,
    514,
    515,
    516,
    517,
    518,
    519,
    520,
    521,
    522,
    523,
    524,
    525
    ];
getKey(994)->[
    526,
    527,
    528,
    529,
    530,
    531,
    532,
    533,
    534,
    535,
    536,
    537,
    538,
    539,
    540,
    541,
    542,
    543,
    544,
    545,
    546,
    547,
    548,
    549,
    550,
    551,
    552
    ];
getKey(995)->[
    553,
    554,
    555,
    556,
    557,
    558,
    559,
    560,
    561,
    562,
    563,
    564,
    565,
    566,
    567,
    568,
    569,
    570,
    571,
    572,
    573,
    574,
    575,
    576,
    577,
    578,
    579
    ];
getKey(999)->[
    580,
    581,
    582,
    583,
    584,
    585,
    586,
    587,
    588,
    589,
    590,
    591,
    592,
    593,
    594,
    595,
    596,
    597,
    598,
    599,
    600,
    601,
    602,
    603,
    604,
    605,
    606,
    607,
    608,
    609,
    610,
    611,
    612,
    613,
    614,
    615,
    616,
    617
    ];
getKey(1001)->[
    618,
    619,
    620,
    621,
    622,
    623,
    624,
    625,
    626,
    627
    ];
getKey(1002)->[
    628,
    629,
    630,
    631,
    632,
    633,
    634,
    635,
    636,
    637,
    638,
    639,
    640,
    641,
    642
    ];
getKey(1003)->[
    643,
    644,
    645,
    646,
    647,
    648,
    649,
    650,
    651,
    652,
    653,
    654,
    655,
    656,
    657
    ];
getKey(1004)->[
    658,
    659,
    660,
    661,
    662,
    663,
    664,
    665,
    666,
    667,
    668,
    669,
    670,
    671,
    672
    ];
getKey(1005)->[
    673,
    674,
    675,
    676,
    677,
    678,
    679,
    680,
    681,
    682,
    683,
    684,
    685,
    686,
    687
    ];
getKey(1006)->[
    688,
    689,
    690,
    691,
    692,
    693,
    694,
    695,
    696,
    697,
    698,
    699,
    700,
    701
    ];
getKey(1007)->[
    702,
    703,
    704,
    705,
    706,
    707,
    708,
    709,
    710,
    711,
    712,
    713,
    714,
    715
    ];
getKey(1008)->[
    716,
    717,
    718,
    719,
    720,
    721,
    722,
    723,
    724,
    725,
    726,
    727,
    728,
    729
    ];
getKey(1009)->[
    730,
    731,
    732,
    733,
    734,
    735,
    736,
    737,
    738,
    739,
    740,
    741,
    742,
    743
    ];
getKey(1010)->[
    744,
    745,
    746,
    747,
    748,
    749,
    750
    ];
getKey(1011)->[
    751,
    752,
    753,
    754,
    755,
    756,
    757
    ];
getKey(1012)->[
    758,
    759,
    760,
    761,
    762,
    763,
    764,
    765,
    766,
    767,
    768,
    769,
    770,
    771,
    772
    ];
getKey(1013)->[
    773,
    774,
    775,
    776,
    777,
    778,
    779,
    780,
    781,
    782,
    783,
    784,
    785,
    786,
    787
    ];
getKey(1014)->[
    788,
    789,
    790,
    791,
    792,
    793,
    794,
    795,
    796,
    797,
    798,
    799,
    800,
    801,
    802
    ];
getKey(1015)->[
    803,
    804,
    805,
    806,
    807,
    808,
    809,
    810,
    811,
    812,
    813,
    814,
    815,
    816
    ];
getKey(1016)->[
    817,
    818,
    819,
    820,
    821,
    822,
    823,
    824,
    825,
    826,
    827,
    828,
    829,
    830
    ];
getKey(1017)->[
    831,
    832,
    833,
    834,
    835,
    836,
    837,
    838,
    839,
    840,
    841,
    842,
    843,
    844,
    845,
    846
    ];
getKey(1020)->[
    847,
    848,
    849,
    850,
    851,
    852,
    853,
    854,
    855,
    856,
    857,
    858,
    859,
    860,
    861
    ];
getKey(1021)->[
    862,
    863,
    864,
    865,
    866,
    867,
    868,
    869,
    870,
    871,
    872,
    873,
    874,
    875,
    876
    ];
getKey(1101)->[
    877
    ];
getKey(1102)->[
    878
    ];
getKey(1103)->[
    879
    ];
getKey(1104)->[
    880
    ];
getKey(1105)->[
    881
    ];
getKey(1111)->[
    882,
    883
    ];
getKey(1112)->[
    884,
    885
    ];
getKey(1120)->[
    886,
    887,
    888,
    889
    ];
getKey(1121)->[
    890
    ];
getKey(1122)->[
    891
    ];
getKey(1123)->[
    892,
    893,
    894,
    895
    ];
getKey(1200)->[
    896
    ];
getKey(1201)->[
    897
    ];
getKey(1210)->[
    898,
    899,
    900,
    901,
    902
    ];
getKey(1211)->[
    903,
    904,
    905,
    906,
    907
    ];
getKey(1220)->[
    908,
    909,
    910
    ];
getKey(1221)->[
    911,
    912,
    913
    ];
getKey(1222)->[
    914,
    915,
    916
    ];
getKey(1225)->[
    917,
    918,
    919,
    920,
    921
    ];
getKey(1226)->[
    922,
    923,
    924,
    925,
    926
    ];
getKey(1227)->[
    927,
    928,
    929,
    930
    ];
getKey(1230)->[
    931,
    932,
    933,
    934,
    935,
    936
    ];
getKey(1231)->[
    937,
    938,
    939,
    940,
    941,
    942
    ];
getKey(1232)->[
    943,
    944,
    945,
    946
    ];
getKey(1240)->[
    947,
    948,
    949,
    950,
    951,
    952
    ];
getKey(1241)->[
    953,
    954,
    955,
    956,
    957,
    958
    ];
getKey(1242)->[
    959,
    960,
    961,
    962
    ];
getKey(1299)->[
    963,
    964,
    965,
    966,
    967
    ];
getKey(1300)->[
    968,
    969,
    970,
    971,
    972,
    973
    ];
getKey(1301)->[
    974,
    975,
    976
    ];
getKey(1302)->[
    977,
    978,
    979
    ];
getKey(1303)->[
    980,
    981,
    982,
    983
    ];
getKey(1304)->[
    984,
    985,
    986,
    987
    ];
getKey(1305)->[
    988,
    989,
    990,
    991
    ];
getKey(1311)->[
    992,
    993,
    994,
    995
    ];
getKey(1312)->[
    996,
    997,
    998,
    999
    ];
getKey(1313)->[
    1000,
    1001,
    1002,
    1003
    ];
getKey(1314)->[
    1004,
    1005,
    1006,
    1007
    ];
getKey(1315)->[
    1008,
    1009,
    1010,
    1011
    ];
getKey(1316)->[
    1012,
    1013,
    1014,
    1015
    ];
getKey(1317)->[
    1016,
    1017,
    1018,
    1019,
    1020
    ];
getKey(1318)->[
    1021,
    1022,
    1023,
    1024,
    1025
    ];
getKey(1319)->[
    1026,
    1027,
    1028,
    1029,
    1030
    ];
getKey(1320)->[
    1031,
    1032,
    1033,
    1034,
    1035
    ];
getKey(1321)->[
    1036,
    1037,
    1038
    ];
getKey(1322)->[
    1039
    ];
getKey(1323)->[
    1040
    ];
getKey(1324)->[
    1041
    ];
getKey(1325)->[
    1042
    ];
getKey(1326)->[
    1043
    ];
getKey(1327)->[
    1044
    ];
getKey(1328)->[
    1045
    ];
getKey(1329)->[
    1046
    ];
getKey(1330)->[
    1047,
    1048,
    1049,
    1050,
    1051
    ];
getKey(1331)->[
    1052
    ];
getKey(1332)->[
    1053
    ];
getKey(1333)->[
    1054
    ];
getKey(1334)->[
    1055
    ];
getKey(1335)->[
    1056
    ];
getKey(1336)->[
    1057
    ];
getKey(1337)->[
    1058
    ];
getKey(1338)->[
    1059
    ];
getKey(1339)->[
    1060
    ];
getKey(1340)->[
    1061
    ];
getKey(1341)->[
    1062
    ];
getKey(1342)->[
    1063
    ];
getKey(1343)->[
    1064
    ];
getKey(1344)->[
    1065
    ];
getKey(1345)->[
    1066
    ];
getKey(1346)->[
    1067
    ];
getKey(1347)->[
    1068
    ];
getKey(1348)->[
    1069
    ];
getKey(1349)->[
    1070
    ];
getKey(1350)->[
    1071
    ];
getKey(1351)->[
    1072,
    1073
    ];
getKey(1352)->[
    1074,
    1075
    ];
getKey(1353)->[
    1076
    ];
getKey(1354)->[
    1077,
    1078,
    1079,
    1080,
    1081,
    1082
    ];
getKey(1355)->[
    1083,
    1084,
    1085,
    1086,
    1087,
    1088,
    1089
    ];
getKey(1356)->[
    1090,
    1091,
    1092,
    1093
    ];
getKey(1357)->[
    1094,
    1095,
    1096,
    1097
    ];
getKey(1358)->[
    1098,
    1099,
    1100,
    1101
    ];
getKey(1359)->[
    1102,
    1103,
    1104,
    1105
    ];
getKey(1360)->[
    1106,
    1107,
    1108,
    1109,
    1110,
    1111
    ];
getKey(1361)->[
    1112,
    1113,
    1114,
    1115
    ];
getKey(1362)->[
    1116,
    1117,
    1118,
    1119,
    1120
    ];
getKey(1363)->[
    1121,
    1122,
    1123,
    1124,
    1125
    ];
getKey(1364)->[
    1126,
    1127,
    1128,
    1129,
    1130
    ];
getKey(1365)->[
    1131,
    1132,
    1133
    ];
getKey(1366)->[
    1134,
    1135,
    1136
    ];
getKey(1367)->[
    1137,
    1138,
    1139
    ];
getKey(1368)->[
    1140,
    1141,
    1142,
    1143,
    1144
    ];
getKey(1369)->[
    1145,
    1146,
    1147,
    1148,
    1149,
    1150
    ];
getKey(1370)->[
    1151,
    1152,
    1153,
    1154,
    1155,
    1156,
    1157,
    1158,
    1159,
    1160
    ];
getKey(1371)->[
    1161,
    1162,
    1163,
    1164
    ];
getKey(1372)->[
    1165,
    1166,
    1167,
    1168,
    1169,
    1170,
    1171,
    1172
    ];
getKey(1373)->[
    1173,
    1174,
    1175
    ];
getKey(1374)->[
    1176,
    1177,
    1178
    ];
getKey(1375)->[
    1179,
    1180,
    1181,
    1182
    ];
getKey(1376)->[
    1183,
    1184,
    1185,
    1186
    ];
getKey(1377)->[
    1187,
    1188,
    1189,
    1190
    ];
getKey(1378)->[
    1191
    ];
getKey(1379)->[
    1192
    ];
getKey(1380)->[
    1193
    ];
getKey(1381)->[
    1194
    ];
getKey(1382)->[
    1195
    ];
getKey(1383)->[
    1196
    ];
getKey(1384)->[
    1197
    ];
getKey(1385)->[
    1198
    ];
getKey(1386)->[
    1199
    ];
getKey(1387)->[
    1200
    ];
getKey(1388)->[
    1201
    ];
getKey(1389)->[
    1202
    ];
getKey(1401)->[
    1203,
    1204,
    1205,
    1206,
    1207
    ];
getKey(1402)->[
    1208,
    1209,
    1210,
    1211,
    1212
    ];
getKey(1403)->[
    1213,
    1214
    ];
getKey(1410)->[
    1215,
    1216,
    1217,
    1218,
    1219,
    1220,
    1221
    ];
getKey(1411)->[
    1222,
    1223,
    1224,
    1225,
    1226,
    1227,
    1228
    ];
getKey(1412)->[
    1229,
    1230,
    1231,
    1232,
    1233,
    1234,
    1235
    ];
getKey(1420)->[
    1236,
    1237
    ];
getKey(1421)->[
    1238,
    1239,
    1240
    ];
getKey(1422)->[
    1241,
    1242
    ];
getKey(1423)->[
    1243,
    1244
    ];
getKey(1424)->[
    1245,
    1246
    ];
getKey(1425)->[
    1247,
    1248
    ];
getKey(1426)->[
    1249,
    1250
    ];
getKey(1427)->[
    1251,
    1252
    ];
getKey(1428)->[
    1253,
    1254
    ];
getKey(1429)->[
    1255,
    1256
    ];
getKey(1430)->[
    1257,
    1258
    ];
getKey(1431)->[
    1259,
    1260
    ];
getKey(1450)->[
    1261,
    1262,
    1263,
    1264,
    1265
    ];
getKey(1451)->[
    1266,
    1267,
    1268,
    1269,
    1270
    ];
getKey(1452)->[
    1271,
    1272,
    1273,
    1274,
    1275
    ];
getKey(1453)->[
    1276,
    1277,
    1278,
    1279,
    1280
    ];
getKey(1454)->[
    1281,
    1282,
    1283,
    1284,
    1285
    ];
getKey(1500)->[
    1286,
    1287
    ];
getKey(1600)->[
    1288
    ];
getKey(1700)->[
    1289,
    1290,
    1291,
    1292
    ];
getKey(1701)->[
    1293,
    1294,
    1295,
    1296,
    1297,
    1298,
    1299,
    1300
    ];
getKey(1702)->[
    1301,
    1302,
    1303,
    1304,
    1305,
    1306,
    1307,
    1308
    ];
getKey(1703)->[
    1309,
    1310,
    1311,
    1312,
    1313,
    1314,
    1315,
    1316
    ];
getKey(1704)->[
    1317,
    1318,
    1319,
    1320,
    1321,
    1322,
    1323,
    1324
    ];
getKey(1705)->[
    1325,
    1326,
    1327,
    1328,
    1329,
    1330,
    1331,
    1332
    ];
getKey(1706)->[
    1333,
    1334,
    1335,
    1336,
    1337,
    1338,
    1339,
    1340,
    1341
    ];
getKey(1707)->[
    1342
    ];
getKey(1708)->[
    1343
    ];
getKey(1709)->[
    1344
    ];
getKey(1710)->[
    1345
    ];
getKey(1711)->[
    1346
    ];
getKey(1800)->[
    1347
    ];
getKey(1801)->[
    1348,
    1349,
    1350,
    1351
    ];
getKey(1802)->[
    1352
    ];
getKey(1803)->[
    1353,
    1354
    ];
getKey(1804)->[
    1355,
    1356,
    1357,
    1358,
    1359,
    1360,
    1361,
    1362,
    1363
    ];
getKey(1805)->[
    1364,
    1365,
    1366,
    1367,
    1368,
    1369,
    1370,
    1371
    ];
getKey(1901)->[
    1372
    ];
getKey(1902)->[
    1373
    ];
getKey(1903)->[
    1374
    ];
getKey(1904)->[
    1375
    ];
getKey(1905)->[
    1376
    ];
getKey(1915)->[
    1377,
    1378,
    1379,
    1380,
    1381,
    1382
    ];
getKey(1916)->[
    1383,
    1384,
    1385,
    1386,
    1387,
    1388
    ];
getKey(1917)->[
    1389,
    1390,
    1391,
    1392,
    1393,
    1394
    ];
getKey(1918)->[
    1395,
    1396,
    1397,
    1398,
    1399,
    1400
    ];
getKey(1919)->[
    1401,
    1402,
    1403,
    1404,
    1405,
    1406
    ];
getKey(1920)->[
    1407
    ];
getKey(1921)->[
    1408
    ];
getKey(1922)->[
    1409
    ];
getKey(1923)->[
    1410
    ];
getKey(1924)->[
    1411,
    1412,
    1413,
    1414
    ];
getKey(1925)->[
    1415,
    1416,
    1417,
    1418
    ];
getKey(1926)->[
    1419,
    1420,
    1421,
    1422
    ];
getKey(1927)->[
    1423,
    1424,
    1425
    ];
getKey(1928)->[
    1426,
    1427
    ];
getKey(1929)->[
    1428
    ];
getKey(1930)->[
    1429
    ];
getKey(1931)->[
    1430
    ];
getKey(2000)->[
    1431
    ];
getKey(2001)->[
    1432
    ];
getKey(2002)->[
    1433
    ];
getKey(2003)->[
    1434
    ];
getKey(2004)->[
    1435
    ];
getKey(2005)->[
    1436
    ];
getKey(2006)->[
    1437
    ];
getKey(2007)->[
    1438
    ];
getKey(2008)->[
    1439
    ];
getKey(2009)->[
    1440
    ];
getKey(2010)->[
    1441
    ];
getKey(2011)->[
    1442
    ];
getKey(2012)->[
    1443
    ];
getKey(2013)->[
    1444
    ];
getKey(2014)->[
    1445
    ];
getKey(2015)->[
    1446
    ];
getKey(2016)->[
    1447
    ];
getKey(2017)->[
    1448
    ];
getKey(2018)->[
    1449
    ];
getKey(2019)->[
    1450
    ];
getKey(2020)->[
    1451
    ];
getKey(2021)->[
    1452
    ];
getKey(2200)->[
    1453,
    1454,
    1455,
    1456,
    1457,
    1458,
    1459
    ];
getKey(2201)->[
    1460
    ];
getKey(2202)->[
    1461
    ];
getKey(2203)->[
    1462
    ];
getKey(2204)->[
    1463
    ];
getKey(2205)->[
    1464
    ];
getKey(2206)->[
    1465
    ];
getKey(2207)->[
    1466
    ];
getKey(2208)->[
    1467
    ];
getKey(2209)->[
    1468
    ];
getKey(2300)->[
    1469,
    1470,
    1471,
    1472,
    1473
    ];
getKey(2301)->[
    1474,
    1475,
    1476,
    1477,
    1478
    ];
getKey(2302)->[
    1479,
    1480,
    1481,
    1482,
    1483
    ];
getKey(2303)->[
    1484,
    1485,
    1486,
    1487,
    1488
    ];
getKey(2304)->[
    1489,
    1490,
    1491,
    1492
    ];
getKey(2500)->[
    1493,
    1494
    ];
getKey(2501)->[
    1495,
    1496
    ];
getKey(2502)->[
    1497,
    1498
    ];
getKey(2503)->[
    1499,
    1500
    ];
getKey(2504)->[
    1501,
    1502
    ];
getKey(2505)->[
    1503,
    1504,
    1505,
    1506
    ];
getKey(2506)->[
    1507,
    1508,
    1509,
    1510
    ];
getKey(2507)->[
    1511,
    1512,
    1513,
    1514
    ];
getKey(2508)->[
    1515,
    1516,
    1517,
    1518,
    1519
    ];
getKey(2509)->[
    1520,
    1521,
    1522,
    1523,
    1524,
    1525
    ];
getKey(2510)->[
    1526,
    1527
    ];
getKey(2511)->[
    1528,
    1529,
    1530,
    1531,
    1532,
    1533,
    1534
    ];
getKey(2512)->[
    1535,
    1536,
    1537,
    1538,
    1539,
    1540,
    1541,
    1542
    ];
getKey(2513)->[
    1543,
    1544,
    1545,
    1546,
    1547,
    1548,
    1549,
    1550
    ];
getKey(2514)->[
    1551,
    1552
    ];
getKey(2515)->[
    1553
    ];
getKey(2516)->[
    1554
    ];
getKey(2517)->[
    1555,
    1556
    ];
getKey(2518)->[
    1557,
    1558
    ];
getKey(2519)->[
    1559,
    1560
    ];
getKey(2520)->[
    1561,
    1562
    ];
getKey(2521)->[
    1563,
    1564
    ];
getKey(2522)->[
    1565,
    1566
    ];
getKey(3000)->[
    1567
    ];
getKey(3001)->[
    1568,
    1569,
    1570,
    1571,
    1572
    ];
getKey(3002)->[
    1573,
    1574,
    1575,
    1576
    ];
getKey(3003)->[
    1577,
    1578
    ];
getKey(3004)->[
    1579,
    1580
    ];
getKey(3005)->[
    1581,
    1582
    ];
getKey(3006)->[
    1583,
    1584
    ];
getKey(3007)->[
    1585,
    1586
    ];
getKey(3008)->[
    1587,
    1588
    ];
getKey(3009)->[
    1589,
    1590
    ];
getKey(3210)->[
    1591
    ];
getKey(3211)->[
    1592
    ];
getKey(3500)->[
    1593
    ];
getKey(3501)->[
    1594
    ];
getKey(3502)->[
    1595
    ];
getKey(4000)->[
    1596,
    1597,
    1598,
    1599,
    1600,
    1601
    ];
getKey(4001)->[
    1602,
    1603,
    1604,
    1605,
    1606,
    1607
    ];
getKey(4002)->[
    1608,
    1609,
    1610,
    1611,
    1612,
    1613
    ];
getKey(4003)->[
    1614,
    1615,
    1616,
    1617,
    1618,
    1619,
    1620
    ];
getKey(4004)->[
    1621,
    1622,
    1623,
    1624,
    1625,
    1626,
    1627
    ];
getKey(4005)->[
    1628,
    1629,
    1630,
    1631,
    1632,
    1633,
    1634,
    1635
    ];
getKey(4006)->[
    1636,
    1637,
    1638,
    1639,
    1640,
    1641,
    1642,
    1643
    ];
getKey(5000)->[
    1644,
    1645,
    1646,
    1647,
    1648,
    1649
    ];
getKey(6000)->[
    1650,
    1651,
    1652,
    1653
    ];
getKey(6001)->[
    1654,
    1655,
    1656,
    1657
    ];
getKey(6002)->[
    1658,
    1659,
    1660,
    1661
    ];
getKey(6003)->[
    1662,
    1663,
    1664,
    1665
    ];
getKey(6004)->[
    1666,
    1667,
    1668,
    1669
    ];
getKey(6005)->[
    1670,
    1671,
    1672
    ];
getKey(6006)->[
    1673,
    1674,
    1675
    ];
getKey(6007)->[
    1676,
    1677,
    1678
    ];
getKey(6008)->[
    1679,
    1680,
    1681
    ];
getKey(6009)->[
    1682,
    1683,
    1684
    ];
getKey(6010)->[
    1685,
    1686,
    1687
    ];
getKey(6011)->[
    1688,
    1689,
    1690
    ];
getKey(6012)->[
    1691,
    1692,
    1693
    ];
getKey(6013)->[
    1694,
    1695,
    1696
    ];
getKey(6014)->[
    1697,
    1698,
    1699
    ];
getKey(6015)->[
    1700,
    1701,
    1702
    ];
getKey(6016)->[
    1703,
    1704,
    1705
    ];
getKey(6017)->[
    1706,
    1707
    ];
getKey(6018)->[
    1708,
    1709
    ];
getKey(6019)->[
    1710,
    1711
    ];
getKey(6020)->[
    1712,
    1713
    ];
getKey(6021)->[
    1714,
    1715,
    1716
    ];
getKey(6022)->[
    1717,
    1718,
    1719
    ];
getKey(6023)->[
    1720,
    1721,
    1722
    ];
getKey(6100)->[
    1723,
    1724
    ];
getKey(6101)->[
    1725,
    1726
    ];
getKey(6102)->[
    1727,
    1728
    ];
getKey(6103)->[
    1729,
    1730
    ];
getKey(6104)->[
    1731,
    1732,
    1733
    ];
getKey(6105)->[
    1734,
    1735,
    1736
    ];
getKey(6200)->[
    1737,
    1738,
    1739
    ];
getKey(6201)->[
    1740,
    1741,
    1742
    ];
getKey(6202)->[
    1743,
    1744,
    1745
    ];
getKey(6203)->[
    1746,
    1747,
    1748
    ];
getKey(6204)->[
    1749,
    1750,
    1751
    ];
getKey(6205)->[
    1752,
    1753,
    1754
    ];
getKey(6206)->[
    1755,
    1756,
    1757
    ];
getKey(6207)->[
    1758,
    1759,
    1760
    ];
getKey(6208)->[
    1761,
    1762,
    1763
    ];
getKey(6209)->[
    1764,
    1765,
    1766
    ];
getKey(6301)->[
    1767,
    1768
    ];
getKey(6302)->[
    1769,
    1770
    ];
getKey(6303)->[
    1771,
    1772
    ];
getKey(6304)->[
    1773,
    1774
    ];
getKey(6305)->[
    1775,
    1776
    ];
getKey(6306)->[
    1777,
    1778
    ];
getKey(6307)->[
    1779,
    1780
    ];
getKey(6311)->[
    1781,
    1782
    ];
getKey(6312)->[
    1783,
    1784
    ];
getKey(6313)->[
    1785,
    1786
    ];
getKey(6314)->[
    1787,
    1788
    ];
getKey(6315)->[
    1789,
    1790
    ];
getKey(6316)->[
    1791,
    1792
    ];
getKey(6317)->[
    1793,
    1794
    ];
getKey(6321)->[
    1795,
    1796
    ];
getKey(6322)->[
    1797,
    1798
    ];
getKey(6323)->[
    1799,
    1800
    ];
getKey(6324)->[
    1801,
    1802
    ];
getKey(6325)->[
    1803,
    1804
    ];
getKey(6326)->[
    1805,
    1806
    ];
getKey(6327)->[
    1807,
    1808
    ];
getKey(6331)->[
    1809,
    1810
    ];
getKey(6332)->[
    1811,
    1812
    ];
getKey(6333)->[
    1813,
    1814
    ];
getKey(6334)->[
    1815,
    1816
    ];
getKey(6335)->[
    1817,
    1818
    ];
getKey(6336)->[
    1819,
    1820
    ];
getKey(6337)->[
    1821,
    1822
    ];
getKey(6341)->[
    1823,
    1824
    ];
getKey(6342)->[
    1825,
    1826
    ];
getKey(6343)->[
    1827,
    1828
    ];
getKey(6344)->[
    1829,
    1830
    ];
getKey(6345)->[
    1831,
    1832
    ];
getKey(6346)->[
    1833,
    1834
    ];
getKey(6347)->[
    1835,
    1836
    ];
getKey(6351)->[
    1837,
    1838
    ];
getKey(6352)->[
    1839,
    1840
    ];
getKey(6353)->[
    1841,
    1842
    ];
getKey(6354)->[
    1843,
    1844
    ];
getKey(6355)->[
    1845,
    1846
    ];
getKey(6356)->[
    1847,
    1848
    ];
getKey(6357)->[
    1849,
    1850
    ];
getKey(6361)->[
    1851,
    1852
    ];
getKey(6362)->[
    1853,
    1854
    ];
getKey(6363)->[
    1855,
    1856
    ];
getKey(6364)->[
    1857,
    1858
    ];
getKey(6365)->[
    1859,
    1860
    ];
getKey(6366)->[
    1861,
    1862
    ];
getKey(6367)->[
    1863,
    1864
    ];
getKey(6401)->[
    1865,
    1866
    ];
getKey(6402)->[
    1867,
    1868
    ];
getKey(6403)->[
    1869,
    1870
    ];
getKey(6404)->[
    1871,
    1872
    ];
getKey(6405)->[
    1873,
    1874
    ];
getKey(6406)->[
    1875,
    1876
    ];
getKey(6407)->[
    1877,
    1878
    ];
getKey(6411)->[
    1879,
    1880
    ];
getKey(6412)->[
    1881,
    1882
    ];
getKey(6413)->[
    1883,
    1884
    ];
getKey(6414)->[
    1885,
    1886
    ];
getKey(6415)->[
    1887,
    1888
    ];
getKey(6416)->[
    1889,
    1890
    ];
getKey(6417)->[
    1891,
    1892
    ];
getKey(6421)->[
    1893,
    1894
    ];
getKey(6422)->[
    1895,
    1896
    ];
getKey(6423)->[
    1897,
    1898
    ];
getKey(6424)->[
    1899,
    1900
    ];
getKey(6425)->[
    1901,
    1902
    ];
getKey(6426)->[
    1903,
    1904
    ];
getKey(6427)->[
    1905,
    1906
    ];
getKey(6431)->[
    1907,
    1908
    ];
getKey(6432)->[
    1909,
    1910
    ];
getKey(6433)->[
    1911,
    1912
    ];
getKey(6434)->[
    1913,
    1914
    ];
getKey(6435)->[
    1915,
    1916
    ];
getKey(6436)->[
    1917,
    1918
    ];
getKey(6437)->[
    1919,
    1920
    ];
getKey(6441)->[
    1921,
    1922
    ];
getKey(6442)->[
    1923,
    1924
    ];
getKey(6443)->[
    1925,
    1926
    ];
getKey(6444)->[
    1927,
    1928
    ];
getKey(6445)->[
    1929,
    1930
    ];
getKey(6446)->[
    1931,
    1932
    ];
getKey(6447)->[
    1933,
    1934
    ];
getKey(6451)->[
    1935,
    1936
    ];
getKey(6452)->[
    1937,
    1938
    ];
getKey(6453)->[
    1939,
    1940
    ];
getKey(6454)->[
    1941,
    1942
    ];
getKey(6455)->[
    1943,
    1944
    ];
getKey(6456)->[
    1945,
    1946
    ];
getKey(6457)->[
    1947,
    1948
    ];
getKey(6461)->[
    1949,
    1950
    ];
getKey(6462)->[
    1951,
    1952
    ];
getKey(6463)->[
    1953,
    1954
    ];
getKey(6464)->[
    1955,
    1956
    ];
getKey(6465)->[
    1957,
    1958
    ];
getKey(6466)->[
    1959,
    1960
    ];
getKey(6467)->[
    1961,
    1962
    ];
getKey(6501)->[
    1963,
    1964
    ];
getKey(6502)->[
    1965,
    1966
    ];
getKey(6503)->[
    1967,
    1968
    ];
getKey(6504)->[
    1969,
    1970
    ];
getKey(6505)->[
    1971,
    1972
    ];
getKey(6506)->[
    1973,
    1974
    ];
getKey(6507)->[
    1975,
    1976
    ];
getKey(6511)->[
    1977,
    1978
    ];
getKey(6512)->[
    1979,
    1980
    ];
getKey(6513)->[
    1981,
    1982
    ];
getKey(6514)->[
    1983,
    1984
    ];
getKey(6515)->[
    1985,
    1986
    ];
getKey(6516)->[
    1987,
    1988
    ];
getKey(6517)->[
    1989,
    1990
    ];
getKey(6521)->[
    1991,
    1992
    ];
getKey(6522)->[
    1993,
    1994
    ];
getKey(6523)->[
    1995,
    1996
    ];
getKey(6524)->[
    1997,
    1998
    ];
getKey(6525)->[
    1999,
    2000
    ];
getKey(6526)->[
    2001,
    2002
    ];
getKey(6527)->[
    2003,
    2004
    ];
getKey(6531)->[
    2005,
    2006
    ];
getKey(6532)->[
    2007,
    2008
    ];
getKey(6533)->[
    2009,
    2010
    ];
getKey(6534)->[
    2011,
    2012
    ];
getKey(6535)->[
    2013,
    2014
    ];
getKey(6536)->[
    2015,
    2016
    ];
getKey(6537)->[
    2017,
    2018
    ];
getKey(6541)->[
    2019,
    2020
    ];
getKey(6542)->[
    2021,
    2022
    ];
getKey(6543)->[
    2023,
    2024
    ];
getKey(6544)->[
    2025,
    2026
    ];
getKey(6545)->[
    2027,
    2028
    ];
getKey(6546)->[
    2029,
    2030
    ];
getKey(6547)->[
    2031,
    2032
    ];
getKey(6551)->[
    2033,
    2034
    ];
getKey(6552)->[
    2035,
    2036
    ];
getKey(6553)->[
    2037,
    2038
    ];
getKey(6554)->[
    2039,
    2040
    ];
getKey(6555)->[
    2041,
    2042
    ];
getKey(6556)->[
    2043,
    2044
    ];
getKey(6557)->[
    2045,
    2046
    ];
getKey(6561)->[
    2047,
    2048
    ];
getKey(6562)->[
    2049,
    2050
    ];
getKey(6563)->[
    2051,
    2052
    ];
getKey(6564)->[
    2053,
    2054
    ];
getKey(6565)->[
    2055,
    2056
    ];
getKey(6566)->[
    2057,
    2058
    ];
getKey(6567)->[
    2059,
    2060
    ];
getKey(7000)->[
    2061
    ];
getKey(7001)->[
    2062
    ];
getKey(7002)->[
    2063
    ];
getKey(7003)->[
    2064
    ];
getKey(7004)->[
    2065
    ];
getKey(7005)->[
    2066
    ];
getKey(7006)->[
    2067
    ];
getKey(7007)->[
    2068
    ];
getKey(7008)->[
    2069
    ];
getKey(7009)->[
    2070
    ];
getKey(7010)->[
    2071
    ];
getKey(7011)->[
    2072
    ];
getKey(7012)->[
    2073
    ];
getKey(7013)->[
    2074
    ];
getKey(7014)->[
    2075
    ];
getKey(7015)->[
    2076
    ];
getKey(7016)->[
    2077
    ];
getKey(7017)->[
    2078
    ];
getKey(7018)->[
    2079
    ];
getKey(7019)->[
    2080
    ];
getKey(7020)->[
    2081
    ];
getKey(7021)->[
    2082
    ];
getKey(7022)->[
    2083
    ];
getKey(7023)->[
    2084
    ];
getKey(7024)->[
    2085
    ];
getKey(7025)->[
    2086
    ];
getKey(7026)->[
    2087
    ];
getKey(7027)->[
    2088
    ];
getKey(7028)->[
    2089
    ];
getKey(7029)->[
    2090
    ];
getKey(7030)->[
    2091
    ];
getKey(7031)->[
    2092
    ];
getKey(7032)->[
    2093
    ];
getKey(7033)->[
    2094
    ];
getKey(7034)->[
    2095
    ];
getKey(7035)->[
    2096
    ];
getKey(7036)->[
    2097
    ];
getKey(8000)->[
    2098
    ];
getKey(8001)->[
    2099
    ];
getKey(8002)->[
    2100
    ];
getKey(8003)->[
    2101
    ];
getKey(8004)->[
    2102
    ];
getKey(8005)->[
    2103
    ];
getKey(8006)->[
    2104
    ];
getKey(8007)->[
    2105
    ];
getKey(8008)->[
    2106
    ];
getKey(8009)->[
    2107
    ];
getKey(8010)->[
    2108,
    2109,
    2110,
    2111,
    2112
    ];
getKey(8011)->[
    2113,
    2114,
    2115,
    2116,
    2117,
    2118,
    2119,
    2120,
    2121,
    2122,
    2123
    ];
getKey(8012)->[
    2124,
    2125
    ];
getKey(8013)->[
    2126,
    2127
    ];
getKey(8014)->[
    2128
    ];
getKey(8015)->[
    2129
    ];
getKey(8016)->[
    2130
    ];
getKey(8017)->[
    2131
    ];
getKey(8018)->[
    2132
    ];
getKey(8019)->[
    2133
    ];
getKey(8020)->[
    2134
    ];
getKey(8021)->[
    2135
    ];
getKey(8500)->[
    2136
    ];
getKey(8501)->[
    2137
    ];
getKey(8502)->[
    2138,
    2139,
    2140,
    2141,
    2142,
    2143,
    2144,
    2145,
    2146,
    2147,
    2148,
    2149,
    2150,
    2151
    ];
getKey(9000)->[
    2152
    ];
getKey(9001)->[
    2153
    ];
getKey(9002)->[
    2154
    ];
getKey(9003)->[
    2155
    ];
getKey(9004)->[
    2156
    ];
getKey(9005)->[
    2157
    ];
getKey(9006)->[
    2158
    ];
getKey(9007)->[
    2159
    ];
getKey(10001)->[
    2160,
    2161,
    2162,
    2163,
    2164
    ];
getKey(10002)->[
    2165,
    2166,
    2167,
    2168,
    2169
    ];
getKey(10003)->[
    2170,
    2171,
    2172,
    2173,
    2174
    ];
getKey(10004)->[
    2175,
    2176,
    2177,
    2178,
    2179
    ];
getKey(10005)->[
    2180,
    2181,
    2182,
    2183,
    2184
    ];
getKey(10006)->[
    2185,
    2186,
    2187,
    2188,
    2189
    ];
getKey(10007)->[
    2190,
    2191,
    2192,
    2193,
    2194
    ];
getKey(10008)->[
    2195,
    2196,
    2197,
    2198,
    2199
    ];
getKey(10009)->[
    2200,
    2201,
    2202,
    2203,
    2204
    ];
getKey(10010)->[
    2205,
    2206,
    2207,
    2208,
    2209,
    2210,
    2211
    ];
getKey(10011)->[
    2212,
    2213,
    2214,
    2215,
    2216
    ];
getKey(10012)->[
    2217,
    2218,
    2219,
    2220,
    2221
    ];
getKey(10013)->[
    2222,
    2223,
    2224,
    2225,
    2226
    ];
getKey(10014)->[
    2227,
    2228,
    2229,
    2230,
    2231
    ];
getKey(10015)->[
    2232,
    2233,
    2234,
    2235,
    2236
    ];
getKey(10016)->[
    2237,
    2238,
    2239,
    2240,
    2241
    ];
getKey(10017)->[
    2242,
    2243,
    2244,
    2245,
    2246
    ];
getKey(10018)->[
    2247,
    2248,
    2249,
    2250,
    2251
    ];
getKey(10019)->[
    2252,
    2253,
    2254,
    2255,
    2256
    ];
getKey(10020)->[
    2257,
    2258,
    2259,
    2260,
    2261,
    2262,
    2263
    ];
getKey(10021)->[
    2264,
    2265,
    2266,
    2267,
    2268
    ];
getKey(10022)->[
    2269,
    2270,
    2271,
    2272,
    2273
    ];
getKey(10023)->[
    2274,
    2275,
    2276,
    2277,
    2278
    ];
getKey(10024)->[
    2279,
    2280,
    2281,
    2282,
    2283
    ];
getKey(10025)->[
    2284,
    2285,
    2286,
    2287,
    2288
    ];
getKey(10026)->[
    2289,
    2290,
    2291,
    2292,
    2293
    ];
getKey(10027)->[
    2294,
    2295,
    2296,
    2297,
    2298
    ];
getKey(10028)->[
    2299,
    2300,
    2301,
    2302,
    2303
    ];
getKey(10029)->[
    2304,
    2305,
    2306,
    2307,
    2308
    ];
getKey(10030)->[
    2309,
    2310,
    2311,
    2312,
    2313,
    2314,
    2315
    ];
getKey(10031)->[
    2316,
    2317,
    2318,
    2319,
    2320
    ];
getKey(10032)->[
    2321,
    2322,
    2323,
    2324,
    2325
    ];
getKey(10033)->[
    2326,
    2327,
    2328,
    2329,
    2330
    ];
getKey(10034)->[
    2331,
    2332,
    2333,
    2334,
    2335
    ];
getKey(10035)->[
    2336,
    2337,
    2338,
    2339,
    2340
    ];
getKey(10036)->[
    2341,
    2342,
    2343,
    2344,
    2345
    ];
getKey(10037)->[
    2346,
    2347,
    2348,
    2349,
    2350
    ];
getKey(10038)->[
    2351,
    2352,
    2353,
    2354,
    2355
    ];
getKey(10039)->[
    2356,
    2357,
    2358,
    2359,
    2360
    ];
getKey(10040)->[
    2361,
    2362,
    2363,
    2364,
    2365,
    2366,
    2367
    ];
getKey(10041)->[
    2368,
    2369,
    2370,
    2371,
    2372
    ];
getKey(10042)->[
    2373,
    2374,
    2375,
    2376,
    2377
    ];
getKey(10043)->[
    2378,
    2379,
    2380,
    2381,
    2382
    ];
getKey(10044)->[
    2383,
    2384,
    2385,
    2386,
    2387
    ];
getKey(10045)->[
    2388,
    2389,
    2390,
    2391,
    2392
    ];
getKey(10046)->[
    2393,
    2394,
    2395,
    2396,
    2397
    ];
getKey(10047)->[
    2398,
    2399,
    2400,
    2401,
    2402
    ];
getKey(10048)->[
    2403,
    2404,
    2405,
    2406,
    2407
    ];
getKey(10049)->[
    2408,
    2409,
    2410,
    2411,
    2412
    ];
getKey(10050)->[
    2413,
    2414,
    2415,
    2416,
    2417,
    2418,
    2419
    ];
getKey(10051)->[
    2420,
    2421,
    2422,
    2423,
    2424
    ];
getKey(10052)->[
    2425,
    2426,
    2427,
    2428,
    2429
    ];
getKey(10053)->[
    2430,
    2431,
    2432,
    2433,
    2434
    ];
getKey(10054)->[
    2435,
    2436,
    2437,
    2438,
    2439
    ];
getKey(10055)->[
    2440,
    2441,
    2442,
    2443,
    2444
    ];
getKey(10056)->[
    2445,
    2446,
    2447,
    2448,
    2449
    ];
getKey(10057)->[
    2450,
    2451,
    2452,
    2453,
    2454
    ];
getKey(10058)->[
    2455,
    2456,
    2457,
    2458,
    2459
    ];
getKey(10059)->[
    2460,
    2461,
    2462,
    2463,
    2464
    ];
getKey(10060)->[
    2465,
    2466,
    2467,
    2468,
    2469,
    2470,
    2471
    ];
getKey(10061)->[
    2472,
    2473,
    2474,
    2475,
    2476
    ];
getKey(10062)->[
    2477,
    2478,
    2479,
    2480,
    2481
    ];
getKey(10063)->[
    2482,
    2483,
    2484,
    2485,
    2486
    ];
getKey(10064)->[
    2487,
    2488,
    2489,
    2490,
    2491
    ];
getKey(10065)->[
    2492,
    2493,
    2494,
    2495,
    2496
    ];
getKey(10066)->[
    2497,
    2498,
    2499,
    2500,
    2501
    ];
getKey(10067)->[
    2502,
    2503,
    2504,
    2505,
    2506
    ];
getKey(10068)->[
    2507,
    2508,
    2509,
    2510,
    2511
    ];
getKey(10069)->[
    2512,
    2513,
    2514,
    2515,
    2516
    ];
getKey(10070)->[
    2517,
    2518,
    2519,
    2520,
    2521,
    2522,
    2523
    ];
getKey(10071)->[
    2524,
    2525,
    2526,
    2527,
    2528
    ];
getKey(10072)->[
    2529,
    2530,
    2531,
    2532,
    2533
    ];
getKey(10073)->[
    2534,
    2535,
    2536,
    2537,
    2538
    ];
getKey(10074)->[
    2539,
    2540,
    2541,
    2542,
    2543
    ];
getKey(10075)->[
    2544,
    2545,
    2546,
    2547,
    2548
    ];
getKey(10076)->[
    2549,
    2550,
    2551,
    2552,
    2553
    ];
getKey(10077)->[
    2554,
    2555,
    2556,
    2557,
    2558
    ];
getKey(10078)->[
    2559,
    2560,
    2561,
    2562,
    2563
    ];
getKey(10079)->[
    2564,
    2565,
    2566,
    2567,
    2568
    ];
getKey(10080)->[
    2569,
    2570,
    2571,
    2572,
    2573,
    2574,
    2575
    ];
getKey(10081)->[
    2576,
    2577,
    2578,
    2579,
    2580
    ];
getKey(10082)->[
    2581,
    2582,
    2583,
    2584,
    2585
    ];
getKey(10083)->[
    2586,
    2587,
    2588,
    2589,
    2590
    ];
getKey(10084)->[
    2591,
    2592,
    2593,
    2594,
    2595
    ];
getKey(10085)->[
    2596,
    2597,
    2598,
    2599,
    2600
    ];
getKey(10086)->[
    2601,
    2602,
    2603,
    2604,
    2605
    ];
getKey(10087)->[
    2606,
    2607,
    2608,
    2609,
    2610
    ];
getKey(10088)->[
    2611,
    2612,
    2613,
    2614,
    2615
    ];
getKey(10089)->[
    2616,
    2617,
    2618,
    2619,
    2620
    ];
getKey(10090)->[
    2621,
    2622,
    2623,
    2624,
    2625,
    2626,
    2627
    ];
getKey(10091)->[
    2628,
    2629,
    2630,
    2631,
    2632
    ];
getKey(10092)->[
    2633,
    2634,
    2635,
    2636,
    2637
    ];
getKey(10093)->[
    2638,
    2639,
    2640,
    2641,
    2642
    ];
getKey(10094)->[
    2643,
    2644,
    2645,
    2646,
    2647
    ];
getKey(10095)->[
    2648,
    2649,
    2650,
    2651,
    2652
    ];
getKey(10096)->[
    2653,
    2654,
    2655,
    2656,
    2657
    ];
getKey(10097)->[
    2658,
    2659,
    2660,
    2661,
    2662
    ];
getKey(10098)->[
    2663,
    2664,
    2665,
    2666,
    2667
    ];
getKey(10099)->[
    2668,
    2669,
    2670,
    2671,
    2672
    ];
getKey(10100)->[
    2673,
    2674,
    2675,
    2676,
    2677,
    2678,
    2679
    ];
getKey(10101)->[
    2680,
    2681,
    2682,
    2683,
    2684
    ];
getKey(10102)->[
    2685,
    2686,
    2687,
    2688,
    2689
    ];
getKey(10103)->[
    2690,
    2691,
    2692,
    2693,
    2694
    ];
getKey(10104)->[
    2695,
    2696,
    2697,
    2698,
    2699
    ];
getKey(10105)->[
    2700,
    2701,
    2702,
    2703,
    2704
    ];
getKey(10106)->[
    2705,
    2706,
    2707,
    2708,
    2709
    ];
getKey(10107)->[
    2710,
    2711,
    2712,
    2713,
    2714
    ];
getKey(10108)->[
    2715,
    2716,
    2717,
    2718,
    2719
    ];
getKey(10109)->[
    2720,
    2721,
    2722,
    2723,
    2724
    ];
getKey(10110)->[
    2725,
    2726,
    2727,
    2728,
    2729,
    2730,
    2731
    ];
getKey(10111)->[
    2732,
    2733,
    2734,
    2735,
    2736
    ];
getKey(10112)->[
    2737,
    2738,
    2739,
    2740,
    2741
    ];
getKey(10113)->[
    2742,
    2743,
    2744,
    2745,
    2746
    ];
getKey(10114)->[
    2747,
    2748,
    2749,
    2750,
    2751
    ];
getKey(10115)->[
    2752,
    2753,
    2754,
    2755,
    2756
    ];
getKey(10116)->[
    2757,
    2758,
    2759,
    2760,
    2761
    ];
getKey(10117)->[
    2762,
    2763,
    2764,
    2765,
    2766
    ];
getKey(10118)->[
    2767,
    2768,
    2769,
    2770,
    2771
    ];
getKey(10119)->[
    2772,
    2773,
    2774,
    2775,
    2776
    ];
getKey(10120)->[
    2777,
    2778,
    2779,
    2780,
    2781,
    2782,
    2783
    ];
getKey(10121)->[
    2784,
    2785,
    2786,
    2787,
    2788
    ];
getKey(10122)->[
    2789,
    2790,
    2791,
    2792,
    2793
    ];
getKey(10123)->[
    2794,
    2795,
    2796,
    2797,
    2798
    ];
getKey(10124)->[
    2799,
    2800,
    2801,
    2802,
    2803
    ];
getKey(10125)->[
    2804,
    2805,
    2806,
    2807,
    2808
    ];
getKey(10126)->[
    2809,
    2810,
    2811,
    2812,
    2813
    ];
getKey(10127)->[
    2814,
    2815,
    2816,
    2817,
    2818
    ];
getKey(10128)->[
    2819,
    2820,
    2821,
    2822,
    2823
    ];
getKey(10129)->[
    2824,
    2825,
    2826,
    2827,
    2828
    ];
getKey(10130)->[
    2829,
    2830,
    2831,
    2832,
    2833,
    2834,
    2835
    ];
getKey(10131)->[
    2836,
    2837,
    2838,
    2839,
    2840
    ];
getKey(10132)->[
    2841,
    2842,
    2843,
    2844,
    2845
    ];
getKey(10133)->[
    2846,
    2847,
    2848,
    2849,
    2850
    ];
getKey(10134)->[
    2851,
    2852,
    2853,
    2854,
    2855
    ];
getKey(10135)->[
    2856,
    2857,
    2858,
    2859,
    2860
    ];
getKey(10136)->[
    2861,
    2862,
    2863,
    2864,
    2865
    ];
getKey(10137)->[
    2866,
    2867,
    2868,
    2869,
    2870
    ];
getKey(10138)->[
    2871,
    2872,
    2873,
    2874,
    2875
    ];
getKey(10139)->[
    2876,
    2877,
    2878,
    2879,
    2880
    ];
getKey(10140)->[
    2881,
    2882,
    2883,
    2884,
    2885,
    2886,
    2887
    ];
getKey(10141)->[
    2888,
    2889,
    2890,
    2891,
    2892
    ];
getKey(10142)->[
    2893,
    2894,
    2895,
    2896,
    2897
    ];
getKey(10143)->[
    2898,
    2899,
    2900,
    2901,
    2902
    ];
getKey(10144)->[
    2903,
    2904,
    2905,
    2906,
    2907
    ];
getKey(10145)->[
    2908,
    2909,
    2910,
    2911,
    2912
    ];
getKey(10146)->[
    2913,
    2914,
    2915,
    2916,
    2917
    ];
getKey(10147)->[
    2918,
    2919,
    2920,
    2921,
    2922
    ];
getKey(10148)->[
    2923,
    2924,
    2925,
    2926,
    2927
    ];
getKey(10149)->[
    2928,
    2929,
    2930,
    2931,
    2932
    ];
getKey(10150)->[
    2933,
    2934,
    2935,
    2936,
    2937,
    2938,
    2939
    ];
getKey(10151)->[
    2940,
    2941,
    2942,
    2943,
    2944
    ];
getKey(10152)->[
    2945,
    2946,
    2947,
    2948,
    2949
    ];
getKey(10153)->[
    2950,
    2951,
    2952,
    2953,
    2954
    ];
getKey(10154)->[
    2955,
    2956,
    2957,
    2958,
    2959
    ];
getKey(10155)->[
    2960,
    2961,
    2962,
    2963,
    2964
    ];
getKey(10156)->[
    2965,
    2966,
    2967,
    2968,
    2969
    ];
getKey(10157)->[
    2970,
    2971,
    2972,
    2973,
    2974
    ];
getKey(10158)->[
    2975,
    2976,
    2977,
    2978,
    2979
    ];
getKey(10159)->[
    2980,
    2981,
    2982,
    2983,
    2984
    ];
getKey(10160)->[
    2985,
    2986,
    2987,
    2988,
    2989,
    2990,
    2991
    ];
getKey(10161)->[
    2992,
    2993,
    2994,
    2995,
    2996
    ];
getKey(10162)->[
    2997,
    2998,
    2999,
    3000,
    3001
    ];
getKey(10163)->[
    3002,
    3003,
    3004,
    3005,
    3006
    ];
getKey(10164)->[
    3007,
    3008,
    3009,
    3010,
    3011
    ];
getKey(10165)->[
    3012,
    3013,
    3014,
    3015,
    3016
    ];
getKey(10166)->[
    3017,
    3018,
    3019,
    3020,
    3021
    ];
getKey(10167)->[
    3022,
    3023,
    3024,
    3025,
    3026
    ];
getKey(10168)->[
    3027,
    3028,
    3029,
    3030,
    3031
    ];
getKey(10169)->[
    3032,
    3033,
    3034,
    3035,
    3036
    ];
getKey(10170)->[
    3037,
    3038,
    3039,
    3040,
    3041,
    3042,
    3043
    ];
getKey(10171)->[
    3044,
    3045,
    3046,
    3047,
    3048
    ];
getKey(10172)->[
    3049,
    3050,
    3051,
    3052,
    3053
    ];
getKey(10173)->[
    3054,
    3055,
    3056,
    3057,
    3058
    ];
getKey(10174)->[
    3059,
    3060,
    3061,
    3062,
    3063
    ];
getKey(10175)->[
    3064,
    3065,
    3066,
    3067,
    3068
    ];
getKey(10176)->[
    3069,
    3070,
    3071,
    3072,
    3073
    ];
getKey(10177)->[
    3074,
    3075,
    3076,
    3077,
    3078
    ];
getKey(10178)->[
    3079,
    3080,
    3081,
    3082,
    3083
    ];
getKey(10179)->[
    3084,
    3085,
    3086,
    3087,
    3088
    ];
getKey(10180)->[
    3089,
    3090,
    3091,
    3092,
    3093,
    3094,
    3095
    ];
getKey(10181)->[
    3096,
    3097,
    3098,
    3099,
    3100
    ];
getKey(10182)->[
    3101,
    3102,
    3103,
    3104,
    3105
    ];
getKey(10183)->[
    3106,
    3107,
    3108,
    3109,
    3110
    ];
getKey(10184)->[
    3111,
    3112,
    3113,
    3114,
    3115
    ];
getKey(10185)->[
    3116,
    3117,
    3118,
    3119,
    3120
    ];
getKey(10186)->[
    3121,
    3122,
    3123,
    3124,
    3125
    ];
getKey(10187)->[
    3126,
    3127,
    3128,
    3129,
    3130
    ];
getKey(10188)->[
    3131,
    3132,
    3133,
    3134,
    3135
    ];
getKey(10189)->[
    3136,
    3137,
    3138,
    3139,
    3140
    ];
getKey(10190)->[
    3141,
    3142,
    3143,
    3144,
    3145,
    3146,
    3147
    ];
getKey(10191)->[
    3148,
    3149,
    3150,
    3151,
    3152
    ];
getKey(10192)->[
    3153,
    3154,
    3155,
    3156,
    3157
    ];
getKey(10193)->[
    3158,
    3159,
    3160,
    3161,
    3162
    ];
getKey(10194)->[
    3163,
    3164,
    3165,
    3166,
    3167
    ];
getKey(10195)->[
    3168,
    3169,
    3170,
    3171,
    3172
    ];
getKey(10196)->[
    3173,
    3174,
    3175,
    3176,
    3177
    ];
getKey(10197)->[
    3178,
    3179,
    3180,
    3181,
    3182
    ];
getKey(10198)->[
    3183,
    3184,
    3185,
    3186,
    3187
    ];
getKey(10199)->[
    3188,
    3189,
    3190,
    3191,
    3192
    ];
getKey(10200)->[
    3193,
    3194,
    3195,
    3196,
    3197,
    3198,
    3199
    ];
getKey(10201)->[
    3200,
    3201,
    3202,
    3203,
    3204
    ];
getKey(10202)->[
    3205,
    3206,
    3207,
    3208,
    3209
    ];
getKey(10203)->[
    3210,
    3211,
    3212,
    3213,
    3214
    ];
getKey(10204)->[
    3215,
    3216,
    3217,
    3218,
    3219
    ];
getKey(10205)->[
    3220,
    3221,
    3222,
    3223,
    3224
    ];
getKey(10206)->[
    3225,
    3226,
    3227,
    3228,
    3229
    ];
getKey(10207)->[
    3230,
    3231,
    3232,
    3233,
    3234
    ];
getKey(10208)->[
    3235,
    3236,
    3237,
    3238,
    3239
    ];
getKey(10209)->[
    3240,
    3241,
    3242,
    3243,
    3244
    ];
getKey(10210)->[
    3245,
    3246,
    3247,
    3248,
    3249,
    3250,
    3251
    ];
getKey(10211)->[
    3252,
    3253,
    3254,
    3255,
    3256
    ];
getKey(10212)->[
    3257,
    3258,
    3259,
    3260,
    3261
    ];
getKey(10213)->[
    3262,
    3263,
    3264,
    3265,
    3266
    ];
getKey(10214)->[
    3267,
    3268,
    3269,
    3270,
    3271
    ];
getKey(10215)->[
    3272,
    3273,
    3274,
    3275,
    3276
    ];
getKey(10216)->[
    3277,
    3278,
    3279,
    3280,
    3281
    ];
getKey(10217)->[
    3282,
    3283,
    3284,
    3285,
    3286
    ];
getKey(10218)->[
    3287,
    3288,
    3289,
    3290,
    3291
    ];
getKey(10219)->[
    3292,
    3293,
    3294,
    3295,
    3296
    ];
getKey(10220)->[
    3297,
    3298,
    3299,
    3300,
    3301,
    3302,
    3303
    ];
getKey(10221)->[
    3304,
    3305,
    3306,
    3307,
    3308
    ];
getKey(10222)->[
    3309,
    3310,
    3311,
    3312,
    3313
    ];
getKey(10223)->[
    3314,
    3315,
    3316,
    3317,
    3318
    ];
getKey(10224)->[
    3319,
    3320,
    3321,
    3322,
    3323
    ];
getKey(10225)->[
    3324,
    3325,
    3326,
    3327,
    3328
    ];
getKey(10226)->[
    3329,
    3330,
    3331,
    3332,
    3333
    ];
getKey(10227)->[
    3334,
    3335,
    3336,
    3337,
    3338
    ];
getKey(10228)->[
    3339,
    3340,
    3341,
    3342,
    3343
    ];
getKey(10229)->[
    3344,
    3345,
    3346,
    3347,
    3348
    ];
getKey(10230)->[
    3349,
    3350,
    3351,
    3352,
    3353,
    3354,
    3355
    ];
getKey(10231)->[
    3356,
    3357,
    3358,
    3359,
    3360
    ];
getKey(10232)->[
    3361,
    3362,
    3363,
    3364,
    3365
    ];
getKey(10233)->[
    3366,
    3367,
    3368,
    3369,
    3370
    ];
getKey(10234)->[
    3371,
    3372,
    3373,
    3374,
    3375
    ];
getKey(10235)->[
    3376,
    3377,
    3378,
    3379,
    3380
    ];
getKey(10236)->[
    3381,
    3382,
    3383,
    3384,
    3385
    ];
getKey(10237)->[
    3386,
    3387,
    3388,
    3389,
    3390
    ];
getKey(10238)->[
    3391,
    3392,
    3393,
    3394,
    3395
    ];
getKey(10239)->[
    3396,
    3397,
    3398,
    3399,
    3400
    ];
getKey(10240)->[
    3401,
    3402,
    3403,
    3404,
    3405,
    3406,
    3407
    ];
getKey(12010)->[
    3408,
    3409
    ];
getKey(18001)->[
    3410
    ];
getKey(19999)->[
    3411,
    3412
    ];
getKey(20000)->[
    3413
    ];
getKey(20001)->[
    3414
    ];
getKey(20063)->[
    3415,
    3416,
    3417,
    3418,
    3419
    ];
getKey(20064)->[
    3420,
    3421,
    3422,
    3423,
    3424,
    3425,
    3426
    ];
getKey(20065)->[
    3427,
    3428,
    3429,
    3430,
    3431,
    3432,
    3433
    ];
getKey(20066)->[
    3434
    ];
getKey(20067)->[
    3435
    ];
getKey(20068)->[
    3436
    ];
getKey(20069)->[
    3437
    ];
getKey(20070)->[
    3438
    ];
getKey(20071)->[
    3439
    ];
getKey(20072)->[
    3440,
    3441,
    3442,
    3443
    ];
getKey(20073)->[
    3444,
    3445,
    3446,
    3447
    ];
getKey(20074)->[
    3448,
    3449
    ];
getKey(20075)->[
    3450,
    3451
    ];
getKey(20076)->[
    3452,
    3453
    ];
getKey(20077)->[
    3454,
    3455
    ];
getKey(20078)->[
    3456,
    3457
    ];
getKey(20079)->[
    3458,
    3459,
    3460
    ];
getKey(20080)->[
    3461,
    3462,
    3463
    ];
getKey(20081)->[
    3464,
    3465,
    3466
    ];
getKey(20082)->[
    3467
    ];
getKey(20083)->[
    3468
    ];
getKey(20084)->[
    3469
    ];
getKey(30000)->[
    3470
    ];
getKey(30001)->[
    3471
    ];
getKey(30002)->[
    3472,
    3473
    ];
getKey(30003)->[
    3474,
    3475
    ];
getKey(30004)->[
    3476,
    3477
    ];
getKey(30005)->[
    3478
    ];
getKey(30006)->[
    3479
    ];
getKey(35000)->[
    3480,
    3481,
    3482,
    3483,
    3484,
    3485,
    3486
    ];
getKey(35001)->[
    3487
    ];
getKey(35002)->[
    3488
    ];
getKey(35003)->[
    3489,
    3490
    ];
getKey(35004)->[
    3491,
    3492
    ];
getKey(35005)->[
    3493,
    3494,
    3495
    ];
getKey(35006)->[
    3496
    ];
getKey(35007)->[
    3497
    ];
getKey(35008)->[
    3498
    ];
getKey(35009)->[
    3499
    ];
getKey(35010)->[
    3500,
    3501,
    3502,
    3503,
    3504,
    3505
    ];
getKey(50001)->[
    3506
    ];
getKey(50002)->[
    3507
    ];
getKey(51000)->[
    3508
    ];
getKey(51001)->[
    3509
    ];
getKey(100001)->[
    3510
    ];
getKey(100002)->[
    3511
    ];
getKey(100003)->[
    3512
    ];
getKey(100004)->[
    3513
    ];
getKey(200201)->[
    3514,
    3515
    ];
getKey(200202)->[
    3516,
    3517
    ];
getKey(200203)->[
    3518,
    3519
    ];
getKey(200204)->[
    3520,
    3521
    ];
getKey(200205)->[
    3522,
    3523
    ];
getKey(200206)->[
    3524,
    3525
    ];
getKey(200301)->[
    3526,
    3527
    ];
getKey(200302)->[
    3528,
    3529
    ];
getKey(300000)->[
    3530,
    3531
    ];
getKey(300001)->[
    3532,
    3533
    ];
getKey(300002)->[
    3534,
    3535,
    3536
    ];
getKey(300003)->[
    3537,
    3538
    ];
getKey(300004)->[
    3539,
    3540
    ];
getKey(300005)->[
    3541,
    3542
    ];
getKey(300006)->[
    3543,
    3544
    ];
getKey(301000)->[
    3545,
    3546,
    3547
    ];
getKey(301001)->[
    3548,
    3549,
    3550,
    3551
    ];
getKey(301002)->[
    3552,
    3553,
    3554,
    3555
    ];
getKey(301003)->[
    3556,
    3557,
    3558,
    3559
    ];
getKey(301004)->[
    3560,
    3561,
    3562,
    3563
    ];
getKey(301005)->[
    3564,
    3565,
    3566,
    3567
    ];
getKey(302000)->[
    3568,
    3569,
    3570,
    3571
    ];
getKey(302001)->[
    3572,
    3573,
    3574,
    3575
    ];
getKey(302002)->[
    3576,
    3577,
    3578,
    3579
    ];
getKey(302003)->[
    3580,
    3581,
    3582,
    3583
    ];
getKey(310003)->[
    3584,
    3585
    ];
getKey(310004)->[
    3586,
    3587
    ];
getKey(310005)->[
    3588,
    3589
    ];
getKey(310006)->[
    3590,
    3591
    ];
getKey(310007)->[
    3592,
    3593
    ];
getKey(310100)->[
    3594,
    3595,
    3596,
    3597
    ];
getKey(310101)->[
    3598,
    3599,
    3600,
    3601
    ];
getKey(310102)->[
    3602,
    3603,
    3604,
    3605
    ];
getKey(310103)->[
    3606,
    3607,
    3608,
    3609
    ];
getKey(310104)->[
    3610,
    3611,
    3612,
    3613
    ];
getKey(310105)->[
    3614,
    3615,
    3616,
    3617
    ];
getKey(310106)->[
    3618,
    3619,
    3620,
    3621
    ];
getKey(310107)->[
    3622,
    3623,
    3624,
    3625
    ];
getKey(310108)->[
    3626,
    3627,
    3628,
    3629
    ];
getKey(310109)->[
    3630,
    3631,
    3632,
    3633
    ];
getKey(310110)->[
    3634,
    3635,
    3636,
    3637
    ];
getKey(310111)->[
    3638,
    3639,
    3640,
    3641
    ];
getKey(310112)->[
    3642,
    3643,
    3644,
    3645
    ];
getKey(310113)->[
    3646,
    3647,
    3648,
    3649
    ];
getKey(310114)->[
    3650,
    3651,
    3652,
    3653
    ];
getKey(310200)->[
    3654,
    3655
    ];
getKey(310201)->[
    3656,
    3657
    ];
getKey(310202)->[
    3658,
    3659
    ];
getKey(310203)->[
    3660,
    3661
    ];
getKey(310204)->[
    3662,
    3663
    ];
getKey(310205)->[
    3664,
    3665
    ];
getKey(310206)->[
    3666,
    3667
    ];
getKey(310207)->[
    3668,
    3669
    ];
getKey(310208)->[
    3670,
    3671
    ];
getKey(310209)->[
    3672,
    3673
    ];
getKey(310210)->[
    3674,
    3675
    ];
getKey(310300)->[
    3676
    ];
getKey(310301)->[
    3677
    ];
getKey(310302)->[
    3678
    ];
getKey(310303)->[
    3679
    ];
getKey(310304)->[
    3680
    ];
getKey(310305)->[
    3681
    ];
getKey(310306)->[
    3682
    ];
getKey(311000)->[
    3683,
    3684
    ];
getKey(311001)->[
    3685,
    3686
    ];
getKey(311002)->[
    3687,
    3688
    ];
getKey(311003)->[
    3689,
    3690
    ];
getKey(311004)->[
    3691,
    3692
    ];
getKey(311005)->[
    3693,
    3694
    ];
getKey(311006)->[
    3695,
    3696
    ];
getKey(311007)->[
    3697,
    3698
    ];
getKey(311008)->[
    3699,
    3700
    ];
getKey(311009)->[
    3701,
    3702
    ];
getKey(311010)->[
    3703,
    3704
    ];
getKey(311011)->[
    3705,
    3706
    ];
getKey(311012)->[
    3707,
    3708
    ];
getKey(311013)->[
    3709,
    3710
    ];
getKey(311014)->[
    3711,
    3712
    ];
getKey(311015)->[
    3713,
    3714
    ];
getKey(311016)->[
    3715,
    3716
    ];
getKey(311017)->[
    3717,
    3718
    ];
getKey(311018)->[
    3719,
    3720
    ];
getKey(311019)->[
    3721,
    3722
    ];
getKey(311020)->[
    3723,
    3724
    ];
getKey(311021)->[
    3725,
    3726
    ];
getKey(311022)->[
    3727,
    3728
    ];
getKey(311023)->[
    3729,
    3730
    ];
getKey(311024)->[
    3731,
    3732
    ];
getKey(311025)->[
    3733,
    3734
    ];
getKey(311026)->[
    3735,
    3736
    ];
getKey(311027)->[
    3737,
    3738
    ];
getKey(311028)->[
    3739,
    3740
    ];
getKey(311029)->[
    3741,
    3742
    ];
getKey(311030)->[
    3743,
    3744
    ];
getKey(311031)->[
    3745,
    3746
    ];
getKey(311032)->[
    3747,
    3748
    ];
getKey(312000)->[
    3749
    ];
getKey(312001)->[
    3750
    ];
getKey(312002)->[
    3751
    ];
getKey(312003)->[
    3752
    ];
getKey(312004)->[
    3753
    ];
getKey(314000)->[
    3754,
    3755
    ];
getKey(314001)->[
    3756,
    3757
    ];
getKey(314002)->[
    3758,
    3759
    ];
getKey(314003)->[
    3760,
    3761
    ];
getKey(314004)->[
    3762,
    3763
    ];
getKey(314005)->[
    3764,
    3765
    ];
getKey(314006)->[
    3766,
    3767
    ];
getKey(314007)->[
    3768,
    3769
    ];
getKey(314008)->[
    3770,
    3771
    ];
getKey(314009)->[
    3772,
    3773
    ];
getKey(314010)->[
    3774,
    3775
    ];
getKey(314011)->[
    3776,
    3777
    ];
getKey(314012)->[
    3778,
    3779
    ];
getKey(314013)->[
    3780,
    3781
    ];
getKey(314014)->[
    3782,
    3783
    ];
getKey(314015)->[
    3784,
    3785
    ];
getKey(314016)->[
    3786,
    3787
    ];
getKey(314017)->[
    3788,
    3789
    ];
getKey(314018)->[
    3790,
    3791
    ];
getKey(314019)->[
    3792,
    3793
    ];
getKey(314020)->[
    3794,
    3795
    ];
getKey(314021)->[
    3796,
    3797
    ];
getKey(314022)->[
    3798,
    3799
    ];
getKey(314023)->[
    3800,
    3801
    ];
getKey(314024)->[
    3802,
    3803
    ];
getKey(314025)->[
    3804,
    3805
    ];
getKey(314026)->[
    3806,
    3807
    ];
getKey(314027)->[
    3808,
    3809
    ];
getKey(314028)->[
    3810,
    3811
    ];
getKey(314029)->[
    3812,
    3813
    ];
getKey(314030)->[
    3814,
    3815
    ];
getKey(314031)->[
    3816,
    3817
    ];
getKey(314032)->[
    3818,
    3819
    ];
getKey(314033)->[
    3820,
    3821
    ];
getKey(314034)->[
    3822,
    3823
    ];
getKey(314035)->[
    3824,
    3825
    ];
getKey(314036)->[
    3826,
    3827
    ];
getKey(314037)->[
    3828,
    3829
    ];
getKey(314038)->[
    3830,
    3831
    ];
getKey(314039)->[
    3832,
    3833
    ];
getKey(314040)->[
    3834,
    3835
    ];
getKey(314041)->[
    3836,
    3837
    ];
getKey(314042)->[
    3838,
    3839
    ];
getKey(314043)->[
    3840,
    3841
    ];
getKey(314044)->[
    3842,
    3843
    ];
getKey(314045)->[
    3844,
    3845
    ];
getKey(314046)->[
    3846,
    3847
    ];
getKey(314047)->[
    3848,
    3849
    ];
getKey(314048)->[
    3850,
    3851
    ];
getKey(314049)->[
    3852,
    3853
    ];
getKey(314050)->[
    3854,
    3855
    ];
getKey(314051)->[
    3856,
    3857
    ];
getKey(314052)->[
    3858,
    3859
    ];
getKey(314053)->[
    3860,
    3861
    ];
getKey(314054)->[
    3862,
    3863
    ];
getKey(314055)->[
    3864,
    3865
    ];
getKey(314056)->[
    3866,
    3867
    ];
getKey(314057)->[
    3868,
    3869
    ];
getKey(314058)->[
    3870,
    3871
    ];
getKey(314059)->[
    3872,
    3873
    ];
getKey(314060)->[
    3874,
    3875
    ];
getKey(314061)->[
    3876,
    3877
    ];
getKey(314062)->[
    3878,
    3879
    ];
getKey(314063)->[
    3880,
    3881
    ];
getKey(314064)->[
    3882,
    3883
    ];
getKey(314065)->[
    3884,
    3885
    ];
getKey(314066)->[
    3886,
    3887
    ];
getKey(314067)->[
    3888,
    3889
    ];
getKey(314068)->[
    3890,
    3891
    ];
getKey(314069)->[
    3892,
    3893
    ];
getKey(314070)->[
    3894,
    3895
    ];
getKey(314071)->[
    3896,
    3897
    ];
getKey(314072)->[
    3898,
    3899
    ];
getKey(314073)->[
    3900,
    3901
    ];
getKey(314074)->[
    3902,
    3903
    ];
getKey(314075)->[
    3904,
    3905
    ];
getKey(314076)->[
    3906,
    3907
    ];
getKey(314077)->[
    3908,
    3909
    ];
getKey(314078)->[
    3910,
    3911
    ];
getKey(314079)->[
    3912,
    3913
    ];
getKey(314080)->[
    3914,
    3915
    ];
getKey(314081)->[
    3916,
    3917
    ];
getKey(314082)->[
    3918,
    3919
    ];
getKey(314083)->[
    3920,
    3921
    ];
getKey(314084)->[
    3922,
    3923
    ];
getKey(314085)->[
    3924,
    3925
    ];
getKey(314086)->[
    3926,
    3927
    ];
getKey(314087)->[
    3928,
    3929
    ];
getKey(314088)->[
    3930,
    3931
    ];
getKey(314089)->[
    3932,
    3933
    ];
getKey(314090)->[
    3934,
    3935
    ];
getKey(314091)->[
    3936,
    3937
    ];
getKey(314092)->[
    3938,
    3939
    ];
getKey(314093)->[
    3940,
    3941
    ];
getKey(314094)->[
    3942,
    3943
    ];
getKey(314095)->[
    3944,
    3945
    ];
getKey(315000)->[
    3946
    ];
getKey(315001)->[
    3947
    ];
getKey(315002)->[
    3948
    ];
getKey(315003)->[
    3949
    ];
getKey(315004)->[
    3950
    ];
getKey(315005)->[
    3951
    ];
getKey(315006)->[
    3952
    ];
getKey(315007)->[
    3953
    ];
getKey(315008)->[
    3954
    ];
getKey(315009)->[
    3955
    ];
getKey(316000)->[
    3956
    ];
getKey(316001)->[
    3957
    ];
getKey(316002)->[
    3958
    ];
getKey(316003)->[
    3959
    ];
getKey(316004)->[
    3960
    ];
getKey(317000)->[
    3961
    ];
getKey(317001)->[
    3962
    ];
getKey(317002)->[
    3963
    ];
getKey(317003)->[
    3964
    ];
getKey(318000)->[
    3965,
    3966
    ];
getKey(318001)->[
    3967,
    3968
    ];
getKey(318002)->[
    3969
    ];
getKey(318003)->[
    3970
    ];
getKey(318004)->[
    3971
    ];
getKey(319000)->[
    3972
    ];
getKey(319001)->[
    3973
    ];
getKey(319002)->[
    3974
    ];
getKey(320000)->[
    3975,
    3976,
    3977
    ];
getKey(320001)->[
    3978
    ];
getKey(320002)->[
    3979
    ];
getKey(320003)->[
    3980
    ];
getKey(320004)->[
    3981,
    3982
    ];
getKey(320005)->[
    3983
    ];
getKey(320006)->[
    3984
    ];
getKey(330000)->[
    3985,
    3986,
    3987
    ];
getKey(330001)->[
    3988,
    3989,
    3990
    ];
getKey(330002)->[
    3991,
    3992,
    3993,
    3994
    ];
getKey(331000)->[
    3995,
    3996,
    3997,
    3998
    ];
getKey(332000)->[
    3999,
    4000,
    4001,
    4002
    ];
getKey(333000)->[
    4003,
    4004,
    4005,
    4006,
    4007
    ];
getKey(340000)->[
    4008
    ];
getKey(340001)->[
    4009
    ];
getKey(340002)->[
    4010,
    4011
    ];
getKey(340003)->[
    4012,
    4013
    ];
getKey(350000)->[
    4014,
    4015
    ];
getKey(350001)->[
    4016,
    4017
    ];
getKey(350002)->[
    4018,
    4019
    ];
getKey(350003)->[
    4020,
    4021
    ];
getKey(350004)->[
    4022,
    4023
    ];
getKey(350005)->[
    4024,
    4025
    ];
getKey(350006)->[
    4026,
    4027
    ];
getKey(350007)->[
    4028,
    4029
    ];
getKey(350008)->[
    4030,
    4031
    ];
getKey(350009)->[
    4032,
    4033
    ];
getKey(350010)->[
    4034,
    4035
    ];
getKey(350011)->[
    4036,
    4037
    ];
getKey(350012)->[
    4038,
    4039
    ];
getKey(350013)->[
    4040,
    4041
    ];
getKey(350014)->[
    4042,
    4043
    ];
getKey(350015)->[
    4044,
    4045
    ];
getKey(350016)->[
    4046,
    4047
    ];
getKey(350017)->[
    4048,
    4049
    ];
getKey(350018)->[
    4050,
    4051
    ];
getKey(350019)->[
    4052,
    4053
    ];
getKey(350020)->[
    4054,
    4055
    ];
getKey(350021)->[
    4056,
    4057
    ];
getKey(350022)->[
    4058,
    4059
    ];
getKey(350023)->[
    4060,
    4061
    ];
getKey(350024)->[
    4062,
    4063
    ];
getKey(350025)->[
    4064,
    4065
    ];
getKey(350026)->[
    4066,
    4067
    ];
getKey(350027)->[
    4068,
    4069
    ];
getKey(350028)->[
    4070,
    4071
    ];
getKey(350029)->[
    4072,
    4073
    ];
getKey(351000)->[
    4074
    ];
getKey(351001)->[
    4075
    ];
getKey(351002)->[
    4076
    ];
getKey(351003)->[
    4077
    ];
getKey(351004)->[
    4078
    ];
getKey(351005)->[
    4079
    ];
getKey(351006)->[
    4080
    ];
getKey(351007)->[
    4081
    ];
getKey(351008)->[
    4082
    ];
getKey(351009)->[
    4083
    ];
getKey(351010)->[
    4084
    ];
getKey(351011)->[
    4085
    ];
getKey(351012)->[
    4086
    ];
getKey(351013)->[
    4087
    ];
getKey(351014)->[
    4088
    ];
getKey(351015)->[
    4089
    ];
getKey(351016)->[
    4090
    ];
getKey(351017)->[
    4091
    ];
getKey(351018)->[
    4092
    ];
getKey(351019)->[
    4093
    ];
getKey(351020)->[
    4094
    ];
getKey(351021)->[
    4095
    ];
getKey(351022)->[
    4096
    ];
getKey(351023)->[
    4097
    ];
getKey(351024)->[
    4098
    ];
getKey(351025)->[
    4099
    ];
getKey(351026)->[
    4100
    ];
getKey(351027)->[
    4101
    ];
getKey(351028)->[
    4102
    ];
getKey(351029)->[
    4103
    ];
getKey(360000)->[
    4104,
    4105,
    4106
    ];
getKey(360001)->[
    4107,
    4108,
    4109
    ];
getKey(360002)->[
    4110,
    4111,
    4112
    ];
getKey(360003)->[
    4113,
    4114,
    4115
    ];
getKey(360004)->[
    4116,
    4117,
    4118
    ];
getKey(360005)->[
    4119,
    4120,
    4121
    ];
getKey(360006)->[
    4122,
    4123,
    4124
    ];
getKey(360007)->[
    4125,
    4126,
    4127
    ];
getKey(360008)->[
    4128,
    4129,
    4130
    ];
getKey(360009)->[
    4131,
    4132,
    4133
    ];
getKey(360010)->[
    4134,
    4135,
    4136
    ];
getKey(360011)->[
    4137,
    4138,
    4139
    ];
getKey(360012)->[
    4140,
    4141,
    4142
    ];
getKey(360013)->[
    4143,
    4144,
    4145
    ];
getKey(360014)->[
    4146,
    4147,
    4148
    ];
getKey(360015)->[
    4149,
    4150,
    4151
    ];
getKey(360016)->[
    4152,
    4153,
    4154
    ];
getKey(360017)->[
    4155,
    4156,
    4157
    ];
getKey(_)->[].
