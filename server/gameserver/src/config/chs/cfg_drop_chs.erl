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
    career = 0,
    sex = 0,
    min = 1,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(2)->
    #dropCfg {
    dropId = 2,
    dropType = 1,
    dataId = 1,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(3)->
    #dropCfg {
    dropId = 2,
    dropType = 1,
    dataId = 2,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(4)->
    #dropCfg {
    dropId = 51,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(5)->
    #dropCfg {
    dropId = 52,
    dropType = 1,
    dataId = 12,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(6)->
    #dropCfg {
    dropId = 53,
    dropType = 1,
    dataId = 13,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(7)->
    #dropCfg {
    dropId = 54,
    dropType = 1,
    dataId = 14,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(8)->
    #dropCfg {
    dropId = 55,
    dropType = 1,
    dataId = 15,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(9)->
    #dropCfg {
    dropId = 56,
    dropType = 1,
    dataId = 16,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(10)->
    #dropCfg {
    dropId = 57,
    dropType = 1,
    dataId = 17,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(11)->
    #dropCfg {
    dropId = 58,
    dropType = 1,
    dataId = 18,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(12)->
    #dropCfg {
    dropId = 59,
    dropType = 1,
    dataId = 19,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(13)->
    #dropCfg {
    dropId = 60,
    dropType = 1,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(14)->
    #dropCfg {
    dropId = 71,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(15)->
    #dropCfg {
    dropId = 72,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(16)->
    #dropCfg {
    dropId = 73,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(17)->
    #dropCfg {
    dropId = 74,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(18)->
    #dropCfg {
    dropId = 75,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(19)->
    #dropCfg {
    dropId = 76,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(20)->
    #dropCfg {
    dropId = 77,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(21)->
    #dropCfg {
    dropId = 78,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(22)->
    #dropCfg {
    dropId = 79,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(23)->
    #dropCfg {
    dropId = 80,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(24)->
    #dropCfg {
    dropId = 101,
    dropType = 0,
    dataId = 611,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(25)->
    #dropCfg {
    dropId = 101,
    dropType = 0,
    dataId = 612,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(26)->
    #dropCfg {
    dropId = 101,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(27)->
    #dropCfg {
    dropId = 101,
    dropType = 0,
    dataId = 614,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(28)->
    #dropCfg {
    dropId = 102,
    dropType = 0,
    dataId = 152,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(29)->
    #dropCfg {
    dropId = 102,
    dropType = 0,
    dataId = 200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 99,
    max = 99,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(30)->
    #dropCfg {
    dropId = 103,
    dropType = 0,
    dataId = 21001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(31)->
    #dropCfg {
    dropId = 103,
    dropType = 0,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(32)->
    #dropCfg {
    dropId = 103,
    dropType = 0,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(33)->
    #dropCfg {
    dropId = 1001,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(34)->
    #dropCfg {
    dropId = 1001,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(35)->
    #dropCfg {
    dropId = 1001,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 4,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(36)->
    #dropCfg {
    dropId = 1001,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(37)->
    #dropCfg {
    dropId = 1001,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(38)->
    #dropCfg {
    dropId = 1001,
    dropType = 0,
    dataId = 7000,
    probability = 6000,
    career = 0,
    sex = 0,
    min = 2,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(39)->
    #dropCfg {
    dropId = 1001,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(40)->
    #dropCfg {
    dropId = 1001,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(41)->
    #dropCfg {
    dropId = 1001,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(42)->
    #dropCfg {
    dropId = 1001,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1
    };
getRow(43)->
    #dropCfg {
    dropId = 1002,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(44)->
    #dropCfg {
    dropId = 1002,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(45)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 4,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(46)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(47)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(48)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 7000,
    probability = 6000,
    career = 0,
    sex = 0,
    min = 2,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(49)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(50)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(51)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    career = 0,
    sex = 0,
    min = 1,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(52)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 4400,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4400,
    level = 1
    };
getRow(53)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 4410,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4410,
    level = 1
    };
getRow(54)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 4420,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4420,
    level = 1
    };
getRow(55)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 4430,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4430,
    level = 1
    };
getRow(56)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 4440,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4440,
    level = 1
    };
getRow(57)->
    #dropCfg {
    dropId = 1002,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1
    };
getRow(58)->
    #dropCfg {
    dropId = 1003,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(59)->
    #dropCfg {
    dropId = 1003,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(60)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 4,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(61)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(62)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(63)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 7001,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 2,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(64)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(65)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(66)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(67)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 4400,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4400,
    level = 1
    };
getRow(68)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 4410,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4410,
    level = 1
    };
getRow(69)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 4420,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4420,
    level = 1
    };
getRow(70)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 4430,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4430,
    level = 1
    };
getRow(71)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 4440,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4440,
    level = 1
    };
getRow(72)->
    #dropCfg {
    dropId = 1003,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1
    };
getRow(73)->
    #dropCfg {
    dropId = 1004,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(74)->
    #dropCfg {
    dropId = 1004,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(75)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 4,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(76)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(77)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(78)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 7001,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 2,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(79)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(80)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(81)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(82)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 4400,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4400,
    level = 1
    };
getRow(83)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 4410,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4410,
    level = 1
    };
getRow(84)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 4420,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4420,
    level = 1
    };
getRow(85)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 4430,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4430,
    level = 1
    };
getRow(86)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 4440,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4440,
    level = 1
    };
getRow(87)->
    #dropCfg {
    dropId = 1004,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1
    };
getRow(88)->
    #dropCfg {
    dropId = 1005,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(89)->
    #dropCfg {
    dropId = 1005,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(90)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 4,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(91)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(92)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(93)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 7001,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 2,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(94)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(95)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(96)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(97)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 4400,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4400,
    level = 1
    };
getRow(98)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 4410,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4410,
    level = 1
    };
getRow(99)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 4420,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4420,
    level = 1
    };
getRow(100)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 4430,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4430,
    level = 1
    };
getRow(101)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 4440,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4440,
    level = 1
    };
getRow(102)->
    #dropCfg {
    dropId = 1005,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1
    };
getRow(103)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(104)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 1112,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(105)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 7005,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(106)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(107)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(108)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 15,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(109)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(110)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(111)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 4401,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4401,
    level = 1
    };
getRow(112)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 4411,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4411,
    level = 1
    };
getRow(113)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 4421,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4421,
    level = 1
    };
getRow(114)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 4431,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4431,
    level = 1
    };
getRow(115)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 4441,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4441,
    level = 1
    };
getRow(116)->
    #dropCfg {
    dropId = 1006,
    dropType = 0,
    dataId = 3200,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1
    };
getRow(117)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(118)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 1112,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(119)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 7007,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(120)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(121)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(122)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 15,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(123)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(124)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(125)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 4401,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4401,
    level = 1
    };
getRow(126)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 4411,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4411,
    level = 1
    };
getRow(127)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 4421,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4421,
    level = 1
    };
getRow(128)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 4431,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4431,
    level = 1
    };
getRow(129)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 4441,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4441,
    level = 1
    };
getRow(130)->
    #dropCfg {
    dropId = 1007,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1
    };
getRow(131)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 7002,
    probability = 7000,
    career = 0,
    sex = 0,
    min = 1,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(132)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 1112,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(133)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 7009,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(134)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(135)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(136)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 15,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(137)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(138)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(139)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 4401,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4401,
    level = 1
    };
getRow(140)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 4411,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4411,
    level = 1
    };
getRow(141)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 4421,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4421,
    level = 1
    };
getRow(142)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 4431,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4431,
    level = 1
    };
getRow(143)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 4441,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4441,
    level = 1
    };
getRow(144)->
    #dropCfg {
    dropId = 1008,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1
    };
getRow(145)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 7002,
    probability = 7000,
    career = 0,
    sex = 0,
    min = 1,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(146)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 1112,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(147)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 7009,
    probability = 2000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(148)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(149)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(150)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 15,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(151)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(152)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(153)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 4401,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4401,
    level = 1
    };
getRow(154)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 4411,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4411,
    level = 1
    };
getRow(155)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 4421,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4421,
    level = 1
    };
getRow(156)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 4431,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4431,
    level = 1
    };
getRow(157)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 4441,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4441,
    level = 1
    };
getRow(158)->
    #dropCfg {
    dropId = 1009,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1
    };
getRow(159)->
    #dropCfg {
    dropId = 1010,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(160)->
    #dropCfg {
    dropId = 1010,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(161)->
    #dropCfg {
    dropId = 1010,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 4,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(162)->
    #dropCfg {
    dropId = 1010,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(163)->
    #dropCfg {
    dropId = 1010,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(164)->
    #dropCfg {
    dropId = 1010,
    dropType = 0,
    dataId = 7004,
    probability = 8000,
    career = 0,
    sex = 0,
    min = 6,
    max = 15,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(165)->
    #dropCfg {
    dropId = 1010,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(166)->
    #dropCfg {
    dropId = 1011,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(167)->
    #dropCfg {
    dropId = 1011,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(168)->
    #dropCfg {
    dropId = 1011,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 4,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(169)->
    #dropCfg {
    dropId = 1011,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(170)->
    #dropCfg {
    dropId = 1011,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(171)->
    #dropCfg {
    dropId = 1011,
    dropType = 0,
    dataId = 7004,
    probability = 8000,
    career = 0,
    sex = 0,
    min = 6,
    max = 15,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(172)->
    #dropCfg {
    dropId = 1011,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(173)->
    #dropCfg {
    dropId = 1012,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(174)->
    #dropCfg {
    dropId = 1012,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(175)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 4,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(176)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(177)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(178)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 7021,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(179)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(180)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(181)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(182)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 4400,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4400,
    level = 1
    };
getRow(183)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 4410,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4410,
    level = 1
    };
getRow(184)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 4420,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4420,
    level = 1
    };
getRow(185)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 4430,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4430,
    level = 1
    };
getRow(186)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 4440,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4440,
    level = 1
    };
getRow(187)->
    #dropCfg {
    dropId = 1012,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1
    };
getRow(188)->
    #dropCfg {
    dropId = 1013,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(189)->
    #dropCfg {
    dropId = 1013,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(190)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 4,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(191)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(192)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(193)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 7021,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(194)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(195)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(196)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(197)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 4400,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4400,
    level = 1
    };
getRow(198)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 4410,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4410,
    level = 1
    };
getRow(199)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 4420,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4420,
    level = 1
    };
getRow(200)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 4430,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4430,
    level = 1
    };
getRow(201)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 4440,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4440,
    level = 1
    };
getRow(202)->
    #dropCfg {
    dropId = 1013,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1
    };
getRow(203)->
    #dropCfg {
    dropId = 1014,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(204)->
    #dropCfg {
    dropId = 1014,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(205)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 4,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(206)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(207)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(208)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 7023,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(209)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(210)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(211)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(212)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 4400,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4400,
    level = 1
    };
getRow(213)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 4410,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4410,
    level = 1
    };
getRow(214)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 4420,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4420,
    level = 1
    };
getRow(215)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 4430,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4430,
    level = 1
    };
getRow(216)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 4440,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4440,
    level = 1
    };
getRow(217)->
    #dropCfg {
    dropId = 1014,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1
    };
getRow(218)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 7022,
    probability = 7000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(219)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 1112,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(220)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 7022,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(221)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(222)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(223)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 20,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(224)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(225)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(226)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 4401,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4401,
    level = 1
    };
getRow(227)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 4411,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4411,
    level = 1
    };
getRow(228)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 4421,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4421,
    level = 1
    };
getRow(229)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 4431,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4431,
    level = 1
    };
getRow(230)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 4441,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4441,
    level = 1
    };
getRow(231)->
    #dropCfg {
    dropId = 1015,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1
    };
getRow(232)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 7022,
    probability = 7000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(233)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 1112,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(234)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 7022,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(235)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(236)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(237)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 20,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(238)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(239)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(240)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 4401,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4401,
    level = 1
    };
getRow(241)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 4411,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4411,
    level = 1
    };
getRow(242)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 4421,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4421,
    level = 1
    };
getRow(243)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 4431,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4431,
    level = 1
    };
getRow(244)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 4441,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4441,
    level = 1
    };
getRow(245)->
    #dropCfg {
    dropId = 1016,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1
    };
getRow(246)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 7024,
    probability = 7000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(247)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 1112,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(248)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 7024,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(249)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(250)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(251)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 20,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(252)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(253)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(254)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 7025,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(255)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 7026,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(256)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 4401,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4401,
    level = 1
    };
getRow(257)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 4411,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4411,
    level = 1
    };
getRow(258)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 4421,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4421,
    level = 1
    };
getRow(259)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 4431,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4431,
    level = 1
    };
getRow(260)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 4441,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4441,
    level = 1
    };
getRow(261)->
    #dropCfg {
    dropId = 1017,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1
    };
getRow(262)->
    #dropCfg {
    dropId = 1020,
    dropType = 1,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(263)->
    #dropCfg {
    dropId = 1020,
    dropType = 1,
    dataId = 12,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(264)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(265)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 622,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 10,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(266)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(267)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 7026,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 2,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(268)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(269)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 2213,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(270)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 2215,
    probability = 300,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(271)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 4400,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4400,
    level = 1
    };
getRow(272)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 4410,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4410,
    level = 1
    };
getRow(273)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 4420,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4420,
    level = 1
    };
getRow(274)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 4430,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4430,
    level = 1
    };
getRow(275)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 4440,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4440,
    level = 1
    };
getRow(276)->
    #dropCfg {
    dropId = 1020,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1
    };
getRow(277)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 3200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 3200,
    level = 1
    };
getRow(278)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 7026,
    probability = 7000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(279)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 1112,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(280)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 7027,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(281)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(282)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(283)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15,
    max = 25,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(284)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 2022,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(285)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 382,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(286)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 7028,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 0,
    level = 1
    };
getRow(287)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 4401,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4400,
    level = 1
    };
getRow(288)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 4411,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4410,
    level = 1
    };
getRow(289)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 4421,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4420,
    level = 1
    };
getRow(290)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 4431,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4430,
    level = 1
    };
getRow(291)->
    #dropCfg {
    dropId = 1021,
    dropType = 0,
    dataId = 4441,
    probability = 100,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 1,
    dropclass = 4440,
    level = 1
    };
getRow(292)->
    #dropCfg {
    dropId = 1301,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(293)->
    #dropCfg {
    dropId = 1301,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(294)->
    #dropCfg {
    dropId = 1301,
    dropType = 0,
    dataId = 2104,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(295)->
    #dropCfg {
    dropId = 1302,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(296)->
    #dropCfg {
    dropId = 1302,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(297)->
    #dropCfg {
    dropId = 1302,
    dropType = 0,
    dataId = 2104,
    probability = 3000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(298)->
    #dropCfg {
    dropId = 1303,
    dropType = 0,
    dataId = 902,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(299)->
    #dropCfg {
    dropId = 1303,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(300)->
    #dropCfg {
    dropId = 1303,
    dropType = 0,
    dataId = 2104,
    probability = 4000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(301)->
    #dropCfg {
    dropId = 1303,
    dropType = 0,
    dataId = 1911,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(302)->
    #dropCfg {
    dropId = 1304,
    dropType = 0,
    dataId = 903,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(303)->
    #dropCfg {
    dropId = 1304,
    dropType = 0,
    dataId = 1132,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(304)->
    #dropCfg {
    dropId = 1304,
    dropType = 0,
    dataId = 2104,
    probability = 6000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(305)->
    #dropCfg {
    dropId = 1304,
    dropType = 0,
    dataId = 1921,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(306)->
    #dropCfg {
    dropId = 1305,
    dropType = 0,
    dataId = 903,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(307)->
    #dropCfg {
    dropId = 1305,
    dropType = 0,
    dataId = 1134,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(308)->
    #dropCfg {
    dropId = 1305,
    dropType = 0,
    dataId = 2104,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(309)->
    #dropCfg {
    dropId = 1305,
    dropType = 0,
    dataId = 1913,
    probability = 3000,
    career = 0,
    sex = 0,
    min = 1,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(310)->
    #dropCfg {
    dropId = 1426,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(311)->
    #dropCfg {
    dropId = 1426,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(312)->
    #dropCfg {
    dropId = 1427,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(313)->
    #dropCfg {
    dropId = 1427,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(314)->
    #dropCfg {
    dropId = 1428,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(315)->
    #dropCfg {
    dropId = 1428,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(316)->
    #dropCfg {
    dropId = 1429,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(317)->
    #dropCfg {
    dropId = 1429,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(318)->
    #dropCfg {
    dropId = 1430,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(319)->
    #dropCfg {
    dropId = 1430,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(320)->
    #dropCfg {
    dropId = 1431,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(321)->
    #dropCfg {
    dropId = 1431,
    dropType = 0,
    dataId = 616,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(322)->
    #dropCfg {
    dropId = 1901,
    dropType = 2,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 16,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(323)->
    #dropCfg {
    dropId = 1902,
    dropType = 2,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 24,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(324)->
    #dropCfg {
    dropId = 1903,
    dropType = 2,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(325)->
    #dropCfg {
    dropId = 1904,
    dropType = 2,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 60,
    max = 70,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(326)->
    #dropCfg {
    dropId = 1905,
    dropType = 2,
    dataId = 11,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 160,
    max = 320,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(327)->
    #dropCfg {
    dropId = 1915,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20000,
    max = 20000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(328)->
    #dropCfg {
    dropId = 1915,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 200,
    max = 200,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(329)->
    #dropCfg {
    dropId = 1915,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(330)->
    #dropCfg {
    dropId = 1916,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30000,
    max = 30000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(331)->
    #dropCfg {
    dropId = 1916,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 300,
    max = 300,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(332)->
    #dropCfg {
    dropId = 1916,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 150,
    max = 150,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(333)->
    #dropCfg {
    dropId = 1917,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40000,
    max = 40000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(334)->
    #dropCfg {
    dropId = 1917,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 300,
    max = 300,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(335)->
    #dropCfg {
    dropId = 1917,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 150,
    max = 150,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(336)->
    #dropCfg {
    dropId = 1918,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50000,
    max = 50000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(337)->
    #dropCfg {
    dropId = 1918,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 300,
    max = 300,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(338)->
    #dropCfg {
    dropId = 1918,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 150,
    max = 150,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(339)->
    #dropCfg {
    dropId = 1919,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 60000,
    max = 60000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(340)->
    #dropCfg {
    dropId = 1919,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 300,
    max = 300,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(341)->
    #dropCfg {
    dropId = 1919,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 150,
    max = 150,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(342)->
    #dropCfg {
    dropId = 1920,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30000,
    max = 30000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(343)->
    #dropCfg {
    dropId = 1920,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 150,
    max = 150,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(344)->
    #dropCfg {
    dropId = 1921,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20000,
    max = 20000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(345)->
    #dropCfg {
    dropId = 1921,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(346)->
    #dropCfg {
    dropId = 1922,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15000,
    max = 15000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(347)->
    #dropCfg {
    dropId = 1922,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 75,
    max = 75,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(348)->
    #dropCfg {
    dropId = 1923,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10000,
    max = 10000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(349)->
    #dropCfg {
    dropId = 1923,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(350)->
    #dropCfg {
    dropId = 1924,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(351)->
    #dropCfg {
    dropId = 1924,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 800,
    max = 800,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(352)->
    #dropCfg {
    dropId = 1924,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(353)->
    #dropCfg {
    dropId = 1925,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 80,
    max = 80,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(354)->
    #dropCfg {
    dropId = 1925,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 700,
    max = 700,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(355)->
    #dropCfg {
    dropId = 1925,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(356)->
    #dropCfg {
    dropId = 1926,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 70,
    max = 70,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(357)->
    #dropCfg {
    dropId = 1926,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 600,
    max = 600,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(358)->
    #dropCfg {
    dropId = 1926,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15,
    max = 15,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(359)->
    #dropCfg {
    dropId = 1927,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 60,
    max = 60,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(360)->
    #dropCfg {
    dropId = 1927,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 550,
    max = 550,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(361)->
    #dropCfg {
    dropId = 1927,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 60,
    max = 60,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(362)->
    #dropCfg {
    dropId = 1928,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 55,
    max = 55,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(363)->
    #dropCfg {
    dropId = 1928,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(364)->
    #dropCfg {
    dropId = 1928,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(365)->
    #dropCfg {
    dropId = 1929,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(366)->
    #dropCfg {
    dropId = 1929,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 450,
    max = 450,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(367)->
    #dropCfg {
    dropId = 1929,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(368)->
    #dropCfg {
    dropId = 1930,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 45,
    max = 45,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(369)->
    #dropCfg {
    dropId = 1930,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 400,
    max = 400,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(370)->
    #dropCfg {
    dropId = 1930,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(371)->
    #dropCfg {
    dropId = 1931,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(372)->
    #dropCfg {
    dropId = 1931,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 350,
    max = 350,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(373)->
    #dropCfg {
    dropId = 1931,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(374)->
    #dropCfg {
    dropId = 1932,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(375)->
    #dropCfg {
    dropId = 1932,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 350,
    max = 350,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(376)->
    #dropCfg {
    dropId = 1932,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(377)->
    #dropCfg {
    dropId = 1933,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(378)->
    #dropCfg {
    dropId = 1933,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 300,
    max = 300,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(379)->
    #dropCfg {
    dropId = 1933,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(380)->
    #dropCfg {
    dropId = 1934,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(381)->
    #dropCfg {
    dropId = 1934,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(382)->
    #dropCfg {
    dropId = 1934,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(383)->
    #dropCfg {
    dropId = 3500,
    dropType = 1,
    dataId = 35000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(384)->
    #dropCfg {
    dropId = 3501,
    dropType = 1,
    dataId = 35010,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(385)->
    #dropCfg {
    dropId = 3502,
    dropType = 1,
    dataId = 35020,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(386)->
    #dropCfg {
    dropId = 5000,
    dropType = 0,
    dataId = 2102,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(387)->
    #dropCfg {
    dropId = 5000,
    dropType = 0,
    dataId = 2104,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(388)->
    #dropCfg {
    dropId = 5000,
    dropType = 0,
    dataId = 2105,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(389)->
    #dropCfg {
    dropId = 5000,
    dropType = 0,
    dataId = 1915,
    probability = 50,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(390)->
    #dropCfg {
    dropId = 5000,
    dropType = 0,
    dataId = 1902,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(391)->
    #dropCfg {
    dropId = 5000,
    dropType = 0,
    dataId = 1909,
    probability = 200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(392)->
    #dropCfg {
    dropId = 8000,
    dropType = 1,
    dataId = 8000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(393)->
    #dropCfg {
    dropId = 8001,
    dropType = 1,
    dataId = 8001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(394)->
    #dropCfg {
    dropId = 8002,
    dropType = 1,
    dataId = 8002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(395)->
    #dropCfg {
    dropId = 8003,
    dropType = 1,
    dataId = 8003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(396)->
    #dropCfg {
    dropId = 8004,
    dropType = 1,
    dataId = 8004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(397)->
    #dropCfg {
    dropId = 8005,
    dropType = 1,
    dataId = 8005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(398)->
    #dropCfg {
    dropId = 8006,
    dropType = 1,
    dataId = 8006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(399)->
    #dropCfg {
    dropId = 8007,
    dropType = 1,
    dataId = 8007,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(400)->
    #dropCfg {
    dropId = 8008,
    dropType = 1,
    dataId = 8008,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(401)->
    #dropCfg {
    dropId = 8009,
    dropType = 1,
    dataId = 8009,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(402)->
    #dropCfg {
    dropId = 18001,
    dropType = 1,
    dataId = 18001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(403)->
    #dropCfg {
    dropId = 250000,
    dropType = 1,
    dataId = 250000,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(404)->
    #dropCfg {
    dropId = 250000,
    dropType = 1,
    dataId = 250001,
    probability = 10000,
    career = 2,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(405)->
    #dropCfg {
    dropId = 250000,
    dropType = 1,
    dataId = 250002,
    probability = 10000,
    career = 3,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(406)->
    #dropCfg {
    dropId = 251000,
    dropType = 1,
    dataId = 251000,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(407)->
    #dropCfg {
    dropId = 251000,
    dropType = 1,
    dataId = 251001,
    probability = 10000,
    career = 2,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(408)->
    #dropCfg {
    dropId = 251000,
    dropType = 1,
    dataId = 251002,
    probability = 10000,
    career = 3,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(409)->
    #dropCfg {
    dropId = 252000,
    dropType = 1,
    dataId = 252000,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(410)->
    #dropCfg {
    dropId = 252000,
    dropType = 1,
    dataId = 252001,
    probability = 10000,
    career = 2,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(411)->
    #dropCfg {
    dropId = 252000,
    dropType = 1,
    dataId = 252002,
    probability = 10000,
    career = 3,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(412)->
    #dropCfg {
    dropId = 260000,
    dropType = 1,
    dataId = 260000,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(413)->
    #dropCfg {
    dropId = 260000,
    dropType = 1,
    dataId = 260001,
    probability = 10000,
    career = 2,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(414)->
    #dropCfg {
    dropId = 260000,
    dropType = 1,
    dataId = 260002,
    probability = 10000,
    career = 3,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(415)->
    #dropCfg {
    dropId = 300000,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(416)->
    #dropCfg {
    dropId = 300000,
    dropType = 1,
    dataId = 312100,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(417)->
    #dropCfg {
    dropId = 300001,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 9,
    max = 9,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(418)->
    #dropCfg {
    dropId = 300001,
    dropType = 1,
    dataId = 312101,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(419)->
    #dropCfg {
    dropId = 300002,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 12,
    max = 12,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(420)->
    #dropCfg {
    dropId = 300002,
    dropType = 1,
    dataId = 312102,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(421)->
    #dropCfg {
    dropId = 300003,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(422)->
    #dropCfg {
    dropId = 300003,
    dropType = 1,
    dataId = 312103,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(423)->
    #dropCfg {
    dropId = 300004,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(424)->
    #dropCfg {
    dropId = 300004,
    dropType = 1,
    dataId = 312104,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(425)->
    #dropCfg {
    dropId = 300005,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(426)->
    #dropCfg {
    dropId = 300005,
    dropType = 1,
    dataId = 312105,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(427)->
    #dropCfg {
    dropId = 300006,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(428)->
    #dropCfg {
    dropId = 300006,
    dropType = 1,
    dataId = 312106,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(429)->
    #dropCfg {
    dropId = 301000,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 16,
    max = 16,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(430)->
    #dropCfg {
    dropId = 301000,
    dropType = 1,
    dataId = 312101,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(431)->
    #dropCfg {
    dropId = 301000,
    dropType = 1,
    dataId = 313000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(432)->
    #dropCfg {
    dropId = 301001,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 18,
    max = 18,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(433)->
    #dropCfg {
    dropId = 301001,
    dropType = 1,
    dataId = 312102,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(434)->
    #dropCfg {
    dropId = 301001,
    dropType = 1,
    dataId = 313001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(435)->
    #dropCfg {
    dropId = 301002,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 24,
    max = 24,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(436)->
    #dropCfg {
    dropId = 301002,
    dropType = 1,
    dataId = 312103,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(437)->
    #dropCfg {
    dropId = 301002,
    dropType = 1,
    dataId = 313002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(438)->
    #dropCfg {
    dropId = 301003,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(439)->
    #dropCfg {
    dropId = 301003,
    dropType = 1,
    dataId = 312104,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(440)->
    #dropCfg {
    dropId = 301003,
    dropType = 1,
    dataId = 313003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(441)->
    #dropCfg {
    dropId = 301004,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 60,
    max = 60,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(442)->
    #dropCfg {
    dropId = 301004,
    dropType = 1,
    dataId = 312105,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(443)->
    #dropCfg {
    dropId = 301004,
    dropType = 1,
    dataId = 313004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(444)->
    #dropCfg {
    dropId = 301005,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 80,
    max = 80,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(445)->
    #dropCfg {
    dropId = 301005,
    dropType = 1,
    dataId = 312106,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(446)->
    #dropCfg {
    dropId = 301005,
    dropType = 1,
    dataId = 313005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(447)->
    #dropCfg {
    dropId = 302000,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 72,
    max = 72,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(448)->
    #dropCfg {
    dropId = 302000,
    dropType = 1,
    dataId = 312103,
    probability = 4687,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(449)->
    #dropCfg {
    dropId = 302000,
    dropType = 1,
    dataId = 313002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(450)->
    #dropCfg {
    dropId = 302001,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(451)->
    #dropCfg {
    dropId = 302001,
    dropType = 1,
    dataId = 312104,
    probability = 4285,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(452)->
    #dropCfg {
    dropId = 302001,
    dropType = 1,
    dataId = 313003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(453)->
    #dropCfg {
    dropId = 302002,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(454)->
    #dropCfg {
    dropId = 302002,
    dropType = 1,
    dataId = 312105,
    probability = 4012,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(455)->
    #dropCfg {
    dropId = 302002,
    dropType = 1,
    dataId = 313004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(456)->
    #dropCfg {
    dropId = 302003,
    dropType = 0,
    dataId = 224,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(457)->
    #dropCfg {
    dropId = 302003,
    dropType = 1,
    dataId = 312106,
    probability = 3845,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(458)->
    #dropCfg {
    dropId = 302003,
    dropType = 1,
    dataId = 313005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(459)->
    #dropCfg {
    dropId = 310003,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 12,
    max = 16,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(460)->
    #dropCfg {
    dropId = 310003,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 9,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(461)->
    #dropCfg {
    dropId = 310004,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 14,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(462)->
    #dropCfg {
    dropId = 310004,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(463)->
    #dropCfg {
    dropId = 310005,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 12,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(464)->
    #dropCfg {
    dropId = 310005,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(465)->
    #dropCfg {
    dropId = 310006,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(466)->
    #dropCfg {
    dropId = 310006,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(467)->
    #dropCfg {
    dropId = 310007,
    dropType = 0,
    dataId = 613,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(468)->
    #dropCfg {
    dropId = 310007,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(469)->
    #dropCfg {
    dropId = 310100,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 80,
    max = 80,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(470)->
    #dropCfg {
    dropId = 310100,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(471)->
    #dropCfg {
    dropId = 310100,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(472)->
    #dropCfg {
    dropId = 310101,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(473)->
    #dropCfg {
    dropId = 310102,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30000,
    max = 30000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(474)->
    #dropCfg {
    dropId = 310102,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 60,
    max = 60,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(475)->
    #dropCfg {
    dropId = 310102,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(476)->
    #dropCfg {
    dropId = 310103,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 80,
    max = 80,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(477)->
    #dropCfg {
    dropId = 310103,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(478)->
    #dropCfg {
    dropId = 310103,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(479)->
    #dropCfg {
    dropId = 310104,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 80,
    max = 80,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(480)->
    #dropCfg {
    dropId = 310105,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40000,
    max = 40000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(481)->
    #dropCfg {
    dropId = 310105,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 80,
    max = 80,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(482)->
    #dropCfg {
    dropId = 310105,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(483)->
    #dropCfg {
    dropId = 310106,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 120,
    max = 120,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(484)->
    #dropCfg {
    dropId = 310106,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(485)->
    #dropCfg {
    dropId = 310106,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(486)->
    #dropCfg {
    dropId = 310107,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 200,
    max = 200,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(487)->
    #dropCfg {
    dropId = 310108,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50000,
    max = 50000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(488)->
    #dropCfg {
    dropId = 310108,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(489)->
    #dropCfg {
    dropId = 310108,
    dropType = 0,
    dataId = 271,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3,
    max = 3,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(490)->
    #dropCfg {
    dropId = 310200,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(491)->
    #dropCfg {
    dropId = 310200,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(492)->
    #dropCfg {
    dropId = 310201,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 18,
    max = 18,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(493)->
    #dropCfg {
    dropId = 310201,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 18,
    max = 18,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(494)->
    #dropCfg {
    dropId = 310202,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 16,
    max = 16,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(495)->
    #dropCfg {
    dropId = 310202,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 16,
    max = 16,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(496)->
    #dropCfg {
    dropId = 310203,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 14,
    max = 14,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(497)->
    #dropCfg {
    dropId = 310203,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15,
    max = 15,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(498)->
    #dropCfg {
    dropId = 310204,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 12,
    max = 12,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(499)->
    #dropCfg {
    dropId = 310204,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 13,
    max = 13,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(500)->
    #dropCfg {
    dropId = 310205,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(501)->
    #dropCfg {
    dropId = 310205,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 11,
    max = 11,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(502)->
    #dropCfg {
    dropId = 310206,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(503)->
    #dropCfg {
    dropId = 310206,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(504)->
    #dropCfg {
    dropId = 310207,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(505)->
    #dropCfg {
    dropId = 310207,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(506)->
    #dropCfg {
    dropId = 310208,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(507)->
    #dropCfg {
    dropId = 310208,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(508)->
    #dropCfg {
    dropId = 310209,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(509)->
    #dropCfg {
    dropId = 310209,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(510)->
    #dropCfg {
    dropId = 310210,
    dropType = 0,
    dataId = 900,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(511)->
    #dropCfg {
    dropId = 310210,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(512)->
    #dropCfg {
    dropId = 310300,
    dropType = 0,
    dataId = 4303,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0
    };
getRow(513)->
    #dropCfg {
    dropId = 310300,
    dropType = 0,
    dataId = 1111,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0
    };
getRow(514)->
    #dropCfg {
    dropId = 310301,
    dropType = 0,
    dataId = 1111,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0
    };
getRow(515)->
    #dropCfg {
    dropId = 311000,
    dropType = 0,
    dataId = 3160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(516)->
    #dropCfg {
    dropId = 311000,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(517)->
    #dropCfg {
    dropId = 311001,
    dropType = 0,
    dataId = 3160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15,
    max = 15,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(518)->
    #dropCfg {
    dropId = 311001,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(519)->
    #dropCfg {
    dropId = 311002,
    dropType = 0,
    dataId = 3160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(520)->
    #dropCfg {
    dropId = 311002,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(521)->
    #dropCfg {
    dropId = 311003,
    dropType = 0,
    dataId = 3160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(522)->
    #dropCfg {
    dropId = 311003,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(523)->
    #dropCfg {
    dropId = 311004,
    dropType = 0,
    dataId = 3160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 45,
    max = 45,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(524)->
    #dropCfg {
    dropId = 311004,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 45,
    max = 45,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(525)->
    #dropCfg {
    dropId = 311005,
    dropType = 0,
    dataId = 3160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 55,
    max = 55,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(526)->
    #dropCfg {
    dropId = 311005,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 55,
    max = 55,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(527)->
    #dropCfg {
    dropId = 311006,
    dropType = 0,
    dataId = 3160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 65,
    max = 65,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(528)->
    #dropCfg {
    dropId = 311006,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 65,
    max = 65,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(529)->
    #dropCfg {
    dropId = 311007,
    dropType = 0,
    dataId = 3160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 75,
    max = 75,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(530)->
    #dropCfg {
    dropId = 311007,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 75,
    max = 75,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(531)->
    #dropCfg {
    dropId = 311008,
    dropType = 0,
    dataId = 3160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 85,
    max = 85,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(532)->
    #dropCfg {
    dropId = 311008,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 85,
    max = 85,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(533)->
    #dropCfg {
    dropId = 311009,
    dropType = 0,
    dataId = 3160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 95,
    max = 95,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(534)->
    #dropCfg {
    dropId = 311009,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 95,
    max = 95,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(535)->
    #dropCfg {
    dropId = 311010,
    dropType = 0,
    dataId = 3161,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(536)->
    #dropCfg {
    dropId = 311010,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(537)->
    #dropCfg {
    dropId = 311011,
    dropType = 0,
    dataId = 3161,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15,
    max = 15,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(538)->
    #dropCfg {
    dropId = 311011,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15,
    max = 15,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(539)->
    #dropCfg {
    dropId = 311012,
    dropType = 0,
    dataId = 3161,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(540)->
    #dropCfg {
    dropId = 311012,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(541)->
    #dropCfg {
    dropId = 311013,
    dropType = 0,
    dataId = 3161,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(542)->
    #dropCfg {
    dropId = 311013,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(543)->
    #dropCfg {
    dropId = 311014,
    dropType = 0,
    dataId = 3161,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 45,
    max = 45,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(544)->
    #dropCfg {
    dropId = 311014,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 45,
    max = 45,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(545)->
    #dropCfg {
    dropId = 311015,
    dropType = 0,
    dataId = 3161,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 55,
    max = 55,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(546)->
    #dropCfg {
    dropId = 311015,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 55,
    max = 55,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(547)->
    #dropCfg {
    dropId = 311016,
    dropType = 0,
    dataId = 3161,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 65,
    max = 65,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(548)->
    #dropCfg {
    dropId = 311016,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 65,
    max = 65,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(549)->
    #dropCfg {
    dropId = 311017,
    dropType = 0,
    dataId = 3161,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 75,
    max = 75,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(550)->
    #dropCfg {
    dropId = 311017,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 75,
    max = 75,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(551)->
    #dropCfg {
    dropId = 311018,
    dropType = 0,
    dataId = 3161,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 85,
    max = 85,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(552)->
    #dropCfg {
    dropId = 311018,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 85,
    max = 85,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(553)->
    #dropCfg {
    dropId = 311019,
    dropType = 0,
    dataId = 3161,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 95,
    max = 95,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(554)->
    #dropCfg {
    dropId = 311019,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 95,
    max = 95,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(555)->
    #dropCfg {
    dropId = 311020,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(556)->
    #dropCfg {
    dropId = 311020,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(557)->
    #dropCfg {
    dropId = 311021,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15,
    max = 15,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(558)->
    #dropCfg {
    dropId = 311021,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15,
    max = 15,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(559)->
    #dropCfg {
    dropId = 311022,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(560)->
    #dropCfg {
    dropId = 311022,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(561)->
    #dropCfg {
    dropId = 311023,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(562)->
    #dropCfg {
    dropId = 311023,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 35,
    max = 35,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(563)->
    #dropCfg {
    dropId = 311024,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 45,
    max = 45,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(564)->
    #dropCfg {
    dropId = 311024,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 45,
    max = 45,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(565)->
    #dropCfg {
    dropId = 311025,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 55,
    max = 55,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(566)->
    #dropCfg {
    dropId = 311025,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 55,
    max = 55,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(567)->
    #dropCfg {
    dropId = 311026,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 65,
    max = 65,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(568)->
    #dropCfg {
    dropId = 311026,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 65,
    max = 65,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(569)->
    #dropCfg {
    dropId = 311027,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 75,
    max = 75,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(570)->
    #dropCfg {
    dropId = 311027,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 75,
    max = 75,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(571)->
    #dropCfg {
    dropId = 311028,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 85,
    max = 85,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(572)->
    #dropCfg {
    dropId = 311028,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 85,
    max = 85,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(573)->
    #dropCfg {
    dropId = 311029,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 95,
    max = 95,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(574)->
    #dropCfg {
    dropId = 311029,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 95,
    max = 95,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(575)->
    #dropCfg {
    dropId = 311030,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 105,
    max = 105,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(576)->
    #dropCfg {
    dropId = 311030,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 105,
    max = 105,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(577)->
    #dropCfg {
    dropId = 311031,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 115,
    max = 115,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(578)->
    #dropCfg {
    dropId = 311031,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 115,
    max = 115,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(579)->
    #dropCfg {
    dropId = 311032,
    dropType = 0,
    dataId = 3162,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 125,
    max = 125,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(580)->
    #dropCfg {
    dropId = 311032,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 125,
    max = 125,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(581)->
    #dropCfg {
    dropId = 312000,
    dropType = 1,
    dataId = 312000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 10
    };
getRow(582)->
    #dropCfg {
    dropId = 312001,
    dropType = 1,
    dataId = 312001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 20
    };
getRow(583)->
    #dropCfg {
    dropId = 312002,
    dropType = 1,
    dataId = 312002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 30
    };
getRow(584)->
    #dropCfg {
    dropId = 312003,
    dropType = 1,
    dataId = 312003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 40
    };
getRow(585)->
    #dropCfg {
    dropId = 312004,
    dropType = 1,
    dataId = 312004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 50
    };
getRow(586)->
    #dropCfg {
    dropId = 312005,
    dropType = 1,
    dataId = 312005,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 60
    };
getRow(587)->
    #dropCfg {
    dropId = 312006,
    dropType = 1,
    dataId = 312006,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 70
    };
getRow(588)->
    #dropCfg {
    dropId = 312100,
    dropType = 1,
    dataId = 312100,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 10
    };
getRow(589)->
    #dropCfg {
    dropId = 312101,
    dropType = 1,
    dataId = 312101,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 20
    };
getRow(590)->
    #dropCfg {
    dropId = 312102,
    dropType = 1,
    dataId = 312102,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 30
    };
getRow(591)->
    #dropCfg {
    dropId = 312103,
    dropType = 1,
    dataId = 312103,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 40
    };
getRow(592)->
    #dropCfg {
    dropId = 312104,
    dropType = 1,
    dataId = 312104,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 50
    };
getRow(593)->
    #dropCfg {
    dropId = 312105,
    dropType = 1,
    dataId = 312105,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 60
    };
getRow(594)->
    #dropCfg {
    dropId = 312106,
    dropType = 1,
    dataId = 312106,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 70
    };
getRow(595)->
    #dropCfg {
    dropId = 312200,
    dropType = 1,
    dataId = 312200,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 10
    };
getRow(596)->
    #dropCfg {
    dropId = 312201,
    dropType = 1,
    dataId = 312201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 20
    };
getRow(597)->
    #dropCfg {
    dropId = 312202,
    dropType = 1,
    dataId = 312202,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 30
    };
getRow(598)->
    #dropCfg {
    dropId = 312203,
    dropType = 1,
    dataId = 312203,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 40
    };
getRow(599)->
    #dropCfg {
    dropId = 312204,
    dropType = 1,
    dataId = 312204,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 50
    };
getRow(600)->
    #dropCfg {
    dropId = 312205,
    dropType = 1,
    dataId = 312205,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 60
    };
getRow(601)->
    #dropCfg {
    dropId = 312206,
    dropType = 1,
    dataId = 312206,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 70
    };
getRow(602)->
    #dropCfg {
    dropId = 314000,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(603)->
    #dropCfg {
    dropId = 314000,
    dropType = 0,
    dataId = 701,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(604)->
    #dropCfg {
    dropId = 314001,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(605)->
    #dropCfg {
    dropId = 314001,
    dropType = 0,
    dataId = 701,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(606)->
    #dropCfg {
    dropId = 314002,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(607)->
    #dropCfg {
    dropId = 314002,
    dropType = 0,
    dataId = 701,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(608)->
    #dropCfg {
    dropId = 314003,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(609)->
    #dropCfg {
    dropId = 314003,
    dropType = 0,
    dataId = 703,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(610)->
    #dropCfg {
    dropId = 314004,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(611)->
    #dropCfg {
    dropId = 314004,
    dropType = 0,
    dataId = 701,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(612)->
    #dropCfg {
    dropId = 314005,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(613)->
    #dropCfg {
    dropId = 314005,
    dropType = 0,
    dataId = 701,
    probability = 400,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(614)->
    #dropCfg {
    dropId = 314006,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(615)->
    #dropCfg {
    dropId = 314006,
    dropType = 0,
    dataId = 701,
    probability = 1400,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(616)->
    #dropCfg {
    dropId = 314007,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(617)->
    #dropCfg {
    dropId = 314007,
    dropType = 0,
    dataId = 703,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(618)->
    #dropCfg {
    dropId = 314008,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(619)->
    #dropCfg {
    dropId = 314008,
    dropType = 0,
    dataId = 701,
    probability = 400,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(620)->
    #dropCfg {
    dropId = 314009,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(621)->
    #dropCfg {
    dropId = 314009,
    dropType = 0,
    dataId = 701,
    probability = 6400,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(622)->
    #dropCfg {
    dropId = 314010,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(623)->
    #dropCfg {
    dropId = 314010,
    dropType = 0,
    dataId = 701,
    probability = 8400,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(624)->
    #dropCfg {
    dropId = 314011,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(625)->
    #dropCfg {
    dropId = 314011,
    dropType = 0,
    dataId = 703,
    probability = 500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(626)->
    #dropCfg {
    dropId = 314012,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(627)->
    #dropCfg {
    dropId = 314012,
    dropType = 0,
    dataId = 701,
    probability = 6400,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(628)->
    #dropCfg {
    dropId = 314013,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(629)->
    #dropCfg {
    dropId = 314013,
    dropType = 0,
    dataId = 701,
    probability = 3000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(630)->
    #dropCfg {
    dropId = 314014,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(631)->
    #dropCfg {
    dropId = 314014,
    dropType = 0,
    dataId = 701,
    probability = 6200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(632)->
    #dropCfg {
    dropId = 314015,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(633)->
    #dropCfg {
    dropId = 314015,
    dropType = 0,
    dataId = 703,
    probability = 6540,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(634)->
    #dropCfg {
    dropId = 314016,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15,
    max = 15,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(635)->
    #dropCfg {
    dropId = 314016,
    dropType = 0,
    dataId = 700,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(636)->
    #dropCfg {
    dropId = 314017,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 16,
    max = 16,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(637)->
    #dropCfg {
    dropId = 314017,
    dropType = 0,
    dataId = 700,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(638)->
    #dropCfg {
    dropId = 314018,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 19,
    max = 19,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(639)->
    #dropCfg {
    dropId = 314018,
    dropType = 0,
    dataId = 700,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(640)->
    #dropCfg {
    dropId = 314019,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15,
    max = 15,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(641)->
    #dropCfg {
    dropId = 314019,
    dropType = 0,
    dataId = 702,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(642)->
    #dropCfg {
    dropId = 314020,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 16,
    max = 16,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(643)->
    #dropCfg {
    dropId = 314020,
    dropType = 0,
    dataId = 700,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(644)->
    #dropCfg {
    dropId = 314021,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 18,
    max = 18,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(645)->
    #dropCfg {
    dropId = 314021,
    dropType = 0,
    dataId = 700,
    probability = 1500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(646)->
    #dropCfg {
    dropId = 314022,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 21,
    max = 21,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(647)->
    #dropCfg {
    dropId = 314022,
    dropType = 0,
    dataId = 700,
    probability = 4500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(648)->
    #dropCfg {
    dropId = 314023,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 16,
    max = 16,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(649)->
    #dropCfg {
    dropId = 314023,
    dropType = 0,
    dataId = 702,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(650)->
    #dropCfg {
    dropId = 314024,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 18,
    max = 18,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(651)->
    #dropCfg {
    dropId = 314024,
    dropType = 0,
    dataId = 700,
    probability = 1500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(652)->
    #dropCfg {
    dropId = 314025,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 19,
    max = 19,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(653)->
    #dropCfg {
    dropId = 314025,
    dropType = 0,
    dataId = 700,
    probability = 9500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(654)->
    #dropCfg {
    dropId = 314026,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 23,
    max = 23,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(655)->
    #dropCfg {
    dropId = 314026,
    dropType = 0,
    dataId = 700,
    probability = 5500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(656)->
    #dropCfg {
    dropId = 314027,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 18,
    max = 18,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(657)->
    #dropCfg {
    dropId = 314027,
    dropType = 0,
    dataId = 702,
    probability = 1500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(658)->
    #dropCfg {
    dropId = 314028,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 19,
    max = 19,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(659)->
    #dropCfg {
    dropId = 314028,
    dropType = 0,
    dataId = 700,
    probability = 9500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(660)->
    #dropCfg {
    dropId = 314029,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 21,
    max = 21,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(661)->
    #dropCfg {
    dropId = 314029,
    dropType = 0,
    dataId = 700,
    probability = 9000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(662)->
    #dropCfg {
    dropId = 314030,
    dropType = 0,
    dataId = 700,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(663)->
    #dropCfg {
    dropId = 314030,
    dropType = 0,
    dataId = 700,
    probability = 9000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(664)->
    #dropCfg {
    dropId = 314031,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 19,
    max = 19,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(665)->
    #dropCfg {
    dropId = 314031,
    dropType = 0,
    dataId = 702,
    probability = 9650,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(666)->
    #dropCfg {
    dropId = 314032,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(667)->
    #dropCfg {
    dropId = 314032,
    dropType = 0,
    dataId = 701,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(668)->
    #dropCfg {
    dropId = 314033,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(669)->
    #dropCfg {
    dropId = 314033,
    dropType = 0,
    dataId = 701,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(670)->
    #dropCfg {
    dropId = 314034,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 9,
    max = 9,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(671)->
    #dropCfg {
    dropId = 314034,
    dropType = 0,
    dataId = 701,
    probability = 7500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(672)->
    #dropCfg {
    dropId = 314035,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 18,
    max = 18,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(673)->
    #dropCfg {
    dropId = 314035,
    dropType = 0,
    dataId = 702,
    probability = 7500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(674)->
    #dropCfg {
    dropId = 314036,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(675)->
    #dropCfg {
    dropId = 314036,
    dropType = 0,
    dataId = 701,
    probability = 2400,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(676)->
    #dropCfg {
    dropId = 314037,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 9,
    max = 9,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(677)->
    #dropCfg {
    dropId = 314037,
    dropType = 0,
    dataId = 701,
    probability = 600,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(678)->
    #dropCfg {
    dropId = 314038,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(679)->
    #dropCfg {
    dropId = 314038,
    dropType = 0,
    dataId = 701,
    probability = 7200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(680)->
    #dropCfg {
    dropId = 314039,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(681)->
    #dropCfg {
    dropId = 314039,
    dropType = 0,
    dataId = 702,
    probability = 6250,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(682)->
    #dropCfg {
    dropId = 314040,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 9,
    max = 9,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(683)->
    #dropCfg {
    dropId = 314040,
    dropType = 0,
    dataId = 701,
    probability = 600,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(684)->
    #dropCfg {
    dropId = 314041,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 9,
    max = 9,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(685)->
    #dropCfg {
    dropId = 314041,
    dropType = 0,
    dataId = 701,
    probability = 9600,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(686)->
    #dropCfg {
    dropId = 314042,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 11,
    max = 11,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(687)->
    #dropCfg {
    dropId = 314042,
    dropType = 0,
    dataId = 701,
    probability = 7800,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(688)->
    #dropCfg {
    dropId = 314043,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 22,
    max = 22,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(689)->
    #dropCfg {
    dropId = 314043,
    dropType = 0,
    dataId = 702,
    probability = 6850,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(690)->
    #dropCfg {
    dropId = 314044,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 9,
    max = 9,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(691)->
    #dropCfg {
    dropId = 314044,
    dropType = 0,
    dataId = 701,
    probability = 9600,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(692)->
    #dropCfg {
    dropId = 314045,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(693)->
    #dropCfg {
    dropId = 314045,
    dropType = 0,
    dataId = 701,
    probability = 9400,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(694)->
    #dropCfg {
    dropId = 314046,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 12,
    max = 12,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(695)->
    #dropCfg {
    dropId = 314046,
    dropType = 0,
    dataId = 701,
    probability = 9400,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(696)->
    #dropCfg {
    dropId = 314047,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 24,
    max = 24,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(697)->
    #dropCfg {
    dropId = 314047,
    dropType = 0,
    dataId = 702,
    probability = 9500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(698)->
    #dropCfg {
    dropId = 314048,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(699)->
    #dropCfg {
    dropId = 314048,
    dropType = 0,
    dataId = 701,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(700)->
    #dropCfg {
    dropId = 314049,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 11,
    max = 11,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(701)->
    #dropCfg {
    dropId = 314049,
    dropType = 0,
    dataId = 701,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(702)->
    #dropCfg {
    dropId = 314050,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 13,
    max = 13,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(703)->
    #dropCfg {
    dropId = 314050,
    dropType = 0,
    dataId = 701,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(704)->
    #dropCfg {
    dropId = 314051,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(705)->
    #dropCfg {
    dropId = 314051,
    dropType = 0,
    dataId = 702,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(706)->
    #dropCfg {
    dropId = 314052,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 11,
    max = 11,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(707)->
    #dropCfg {
    dropId = 314052,
    dropType = 0,
    dataId = 701,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(708)->
    #dropCfg {
    dropId = 314053,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 12,
    max = 12,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(709)->
    #dropCfg {
    dropId = 314053,
    dropType = 0,
    dataId = 701,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(710)->
    #dropCfg {
    dropId = 314054,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 14,
    max = 14,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(711)->
    #dropCfg {
    dropId = 314054,
    dropType = 0,
    dataId = 701,
    probability = 3000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(712)->
    #dropCfg {
    dropId = 314055,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 27,
    max = 27,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(713)->
    #dropCfg {
    dropId = 314055,
    dropType = 0,
    dataId = 702,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(714)->
    #dropCfg {
    dropId = 314056,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 12,
    max = 12,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(715)->
    #dropCfg {
    dropId = 314056,
    dropType = 0,
    dataId = 701,
    probability = 1000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(716)->
    #dropCfg {
    dropId = 314057,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 13,
    max = 13,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(717)->
    #dropCfg {
    dropId = 314057,
    dropType = 0,
    dataId = 701,
    probability = 3000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(718)->
    #dropCfg {
    dropId = 314058,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15,
    max = 15,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(719)->
    #dropCfg {
    dropId = 314058,
    dropType = 0,
    dataId = 701,
    probability = 7200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(720)->
    #dropCfg {
    dropId = 314059,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(721)->
    #dropCfg {
    dropId = 314059,
    dropType = 0,
    dataId = 702,
    probability = 2500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(722)->
    #dropCfg {
    dropId = 314060,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 13,
    max = 13,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(723)->
    #dropCfg {
    dropId = 314060,
    dropType = 0,
    dataId = 701,
    probability = 3000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(724)->
    #dropCfg {
    dropId = 314061,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 14,
    max = 14,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(725)->
    #dropCfg {
    dropId = 314061,
    dropType = 0,
    dataId = 701,
    probability = 6200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(726)->
    #dropCfg {
    dropId = 314062,
    dropType = 0,
    dataId = 701,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 17,
    max = 17,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(727)->
    #dropCfg {
    dropId = 314062,
    dropType = 0,
    dataId = 701,
    probability = 2800,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(728)->
    #dropCfg {
    dropId = 314063,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 33,
    max = 33,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(729)->
    #dropCfg {
    dropId = 314063,
    dropType = 0,
    dataId = 702,
    probability = 2750,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(730)->
    #dropCfg {
    dropId = 314064,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(731)->
    #dropCfg {
    dropId = 314064,
    dropType = 0,
    dataId = 702,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(732)->
    #dropCfg {
    dropId = 314065,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(733)->
    #dropCfg {
    dropId = 314065,
    dropType = 0,
    dataId = 702,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(734)->
    #dropCfg {
    dropId = 314066,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(735)->
    #dropCfg {
    dropId = 314066,
    dropType = 0,
    dataId = 702,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(736)->
    #dropCfg {
    dropId = 314067,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20,
    max = 20,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(737)->
    #dropCfg {
    dropId = 314067,
    dropType = 0,
    dataId = 703,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(738)->
    #dropCfg {
    dropId = 314068,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(739)->
    #dropCfg {
    dropId = 314068,
    dropType = 0,
    dataId = 702,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(740)->
    #dropCfg {
    dropId = 314069,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(741)->
    #dropCfg {
    dropId = 314069,
    dropType = 0,
    dataId = 702,
    probability = 500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(742)->
    #dropCfg {
    dropId = 314070,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(743)->
    #dropCfg {
    dropId = 314070,
    dropType = 0,
    dataId = 702,
    probability = 1500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(744)->
    #dropCfg {
    dropId = 314071,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 22,
    max = 22,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(745)->
    #dropCfg {
    dropId = 314071,
    dropType = 0,
    dataId = 703,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(746)->
    #dropCfg {
    dropId = 314072,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(747)->
    #dropCfg {
    dropId = 314072,
    dropType = 0,
    dataId = 702,
    probability = 500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(748)->
    #dropCfg {
    dropId = 314073,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(749)->
    #dropCfg {
    dropId = 314073,
    dropType = 0,
    dataId = 702,
    probability = 6550,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(750)->
    #dropCfg {
    dropId = 314074,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(751)->
    #dropCfg {
    dropId = 314074,
    dropType = 0,
    dataId = 702,
    probability = 8650,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(752)->
    #dropCfg {
    dropId = 314075,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 24,
    max = 24,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(753)->
    #dropCfg {
    dropId = 314075,
    dropType = 0,
    dataId = 703,
    probability = 2000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(754)->
    #dropCfg {
    dropId = 314076,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(755)->
    #dropCfg {
    dropId = 314076,
    dropType = 0,
    dataId = 702,
    probability = 6550,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(756)->
    #dropCfg {
    dropId = 314077,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(757)->
    #dropCfg {
    dropId = 314077,
    dropType = 0,
    dataId = 702,
    probability = 3200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(758)->
    #dropCfg {
    dropId = 314078,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(759)->
    #dropCfg {
    dropId = 314078,
    dropType = 0,
    dataId = 702,
    probability = 6500,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(760)->
    #dropCfg {
    dropId = 314079,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 26,
    max = 26,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(761)->
    #dropCfg {
    dropId = 314079,
    dropType = 0,
    dataId = 703,
    probability = 6200,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(762)->
    #dropCfg {
    dropId = 314080,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(763)->
    #dropCfg {
    dropId = 314080,
    dropType = 0,
    dataId = 702,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(764)->
    #dropCfg {
    dropId = 314081,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(765)->
    #dropCfg {
    dropId = 314081,
    dropType = 0,
    dataId = 702,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(766)->
    #dropCfg {
    dropId = 314082,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(767)->
    #dropCfg {
    dropId = 314082,
    dropType = 0,
    dataId = 702,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(768)->
    #dropCfg {
    dropId = 314083,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(769)->
    #dropCfg {
    dropId = 314083,
    dropType = 0,
    dataId = 703,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(770)->
    #dropCfg {
    dropId = 314084,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(771)->
    #dropCfg {
    dropId = 314084,
    dropType = 0,
    dataId = 702,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(772)->
    #dropCfg {
    dropId = 314085,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(773)->
    #dropCfg {
    dropId = 314085,
    dropType = 0,
    dataId = 702,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(774)->
    #dropCfg {
    dropId = 314086,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(775)->
    #dropCfg {
    dropId = 314086,
    dropType = 0,
    dataId = 702,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(776)->
    #dropCfg {
    dropId = 314087,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(777)->
    #dropCfg {
    dropId = 314087,
    dropType = 0,
    dataId = 703,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(778)->
    #dropCfg {
    dropId = 314088,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(779)->
    #dropCfg {
    dropId = 314088,
    dropType = 0,
    dataId = 702,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(780)->
    #dropCfg {
    dropId = 314089,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(781)->
    #dropCfg {
    dropId = 314089,
    dropType = 0,
    dataId = 702,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(782)->
    #dropCfg {
    dropId = 314090,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(783)->
    #dropCfg {
    dropId = 314090,
    dropType = 0,
    dataId = 702,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(784)->
    #dropCfg {
    dropId = 314091,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(785)->
    #dropCfg {
    dropId = 314091,
    dropType = 0,
    dataId = 703,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(786)->
    #dropCfg {
    dropId = 314092,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(787)->
    #dropCfg {
    dropId = 314092,
    dropType = 0,
    dataId = 702,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(788)->
    #dropCfg {
    dropId = 314093,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(789)->
    #dropCfg {
    dropId = 314093,
    dropType = 0,
    dataId = 702,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(790)->
    #dropCfg {
    dropId = 314094,
    dropType = 0,
    dataId = 702,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(791)->
    #dropCfg {
    dropId = 314094,
    dropType = 0,
    dataId = 702,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(792)->
    #dropCfg {
    dropId = 314095,
    dropType = 0,
    dataId = 703,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(793)->
    #dropCfg {
    dropId = 314095,
    dropType = 0,
    dataId = 703,
    probability = 0,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(794)->
    #dropCfg {
    dropId = 315000,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 4,
    max = 4,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0
    };
getRow(795)->
    #dropCfg {
    dropId = 315001,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0
    };
getRow(796)->
    #dropCfg {
    dropId = 315002,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 6,
    max = 6,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0
    };
getRow(797)->
    #dropCfg {
    dropId = 315003,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 8,
    max = 8,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0
    };
getRow(798)->
    #dropCfg {
    dropId = 315004,
    dropType = 0,
    dataId = 7002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 7,
    max = 7,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0
    };
getRow(799)->
    #dropCfg {
    dropId = 315005,
    dropType = 0,
    dataId = 7002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 12,
    max = 12,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0
    };
getRow(800)->
    #dropCfg {
    dropId = 315006,
    dropType = 0,
    dataId = 7003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0
    };
getRow(801)->
    #dropCfg {
    dropId = 315007,
    dropType = 0,
    dataId = 7003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0
    };
getRow(802)->
    #dropCfg {
    dropId = 315008,
    dropType = 0,
    dataId = 7004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0
    };
getRow(803)->
    #dropCfg {
    dropId = 315009,
    dropType = 0,
    dataId = 7004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0
    };
getRow(804)->
    #dropCfg {
    dropId = 316000,
    dropType = 0,
    dataId = 7000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 12,
    max = 12,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0
    };
getRow(805)->
    #dropCfg {
    dropId = 316000,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0
    };
getRow(806)->
    #dropCfg {
    dropId = 316001,
    dropType = 0,
    dataId = 7001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 18,
    max = 18,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0
    };
getRow(807)->
    #dropCfg {
    dropId = 316001,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 60,
    max = 60,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0
    };
getRow(808)->
    #dropCfg {
    dropId = 316002,
    dropType = 0,
    dataId = 7002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 24,
    max = 24,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0
    };
getRow(809)->
    #dropCfg {
    dropId = 316003,
    dropType = 0,
    dataId = 7003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0
    };
getRow(810)->
    #dropCfg {
    dropId = 316004,
    dropType = 0,
    dataId = 7004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 0
    };
getRow(811)->
    #dropCfg {
    dropId = 317000,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 27,
    max = 27,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(812)->
    #dropCfg {
    dropId = 317001,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 36,
    max = 36,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(813)->
    #dropCfg {
    dropId = 317002,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 45,
    max = 45,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(814)->
    #dropCfg {
    dropId = 317003,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 72,
    max = 72,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(815)->
    #dropCfg {
    dropId = 318000,
    dropType = 0,
    dataId = 270,
    probability = 56,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(816)->
    #dropCfg {
    dropId = 318000,
    dropType = 1,
    dataId = 312002,
    probability = 265,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(817)->
    #dropCfg {
    dropId = 318001,
    dropType = 0,
    dataId = 270,
    probability = 89,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(818)->
    #dropCfg {
    dropId = 318001,
    dropType = 1,
    dataId = 312002,
    probability = 278,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(819)->
    #dropCfg {
    dropId = 318002,
    dropType = 0,
    dataId = 270,
    probability = 50,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(820)->
    #dropCfg {
    dropId = 318003,
    dropType = 0,
    dataId = 270,
    probability = 50,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(821)->
    #dropCfg {
    dropId = 318004,
    dropType = 0,
    dataId = 270,
    probability = 50,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(822)->
    #dropCfg {
    dropId = 319000,
    dropType = 1,
    dataId = 319000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(823)->
    #dropCfg {
    dropId = 319001,
    dropType = 1,
    dataId = 319001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(824)->
    #dropCfg {
    dropId = 319002,
    dropType = 1,
    dataId = 319002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(825)->
    #dropCfg {
    dropId = 320000,
    dropType = 0,
    dataId = 4303,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(826)->
    #dropCfg {
    dropId = 320000,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    career = 0,
    sex = 1,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 5
    };
getRow(827)->
    #dropCfg {
    dropId = 320000,
    dropType = 0,
    dataId = 4305,
    probability = 10000,
    career = 0,
    sex = 2,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 10
    };
getRow(828)->
    #dropCfg {
    dropId = 320001,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(829)->
    #dropCfg {
    dropId = 320002,
    dropType = 0,
    dataId = 2161,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(830)->
    #dropCfg {
    dropId = 320003,
    dropType = 1,
    dataId = 420000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(831)->
    #dropCfg {
    dropId = 320004,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 15,
    max = 15,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(832)->
    #dropCfg {
    dropId = 320004,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 2,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(833)->
    #dropCfg {
    dropId = 320005,
    dropType = 0,
    dataId = 2600,
    probability = 10000,
    career = 3,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(834)->
    #dropCfg {
    dropId = 320006,
    dropType = 0,
    dataId = 2601,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 5,
    max = 5,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(835)->
    #dropCfg {
    dropId = 330000,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(836)->
    #dropCfg {
    dropId = 330000,
    dropType = 0,
    dataId = 201,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(837)->
    #dropCfg {
    dropId = 330000,
    dropType = 0,
    dataId = 201,
    probability = 5000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(838)->
    #dropCfg {
    dropId = 340000,
    dropType = 2,
    dataId = 12,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(839)->
    #dropCfg {
    dropId = 340001,
    dropType = 2,
    dataId = 12,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 60,
    max = 60,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(840)->
    #dropCfg {
    dropId = 340002,
    dropType = 2,
    dataId = 12,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 80,
    max = 80,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(841)->
    #dropCfg {
    dropId = 340002,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15,
    max = 15,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(842)->
    #dropCfg {
    dropId = 340003,
    dropType = 2,
    dataId = 12,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(843)->
    #dropCfg {
    dropId = 340003,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(844)->
    #dropCfg {
    dropId = 350000,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(845)->
    #dropCfg {
    dropId = 350000,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(846)->
    #dropCfg {
    dropId = 350001,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(847)->
    #dropCfg {
    dropId = 350001,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(848)->
    #dropCfg {
    dropId = 350002,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(849)->
    #dropCfg {
    dropId = 350002,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(850)->
    #dropCfg {
    dropId = 350003,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(851)->
    #dropCfg {
    dropId = 350003,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(852)->
    #dropCfg {
    dropId = 350004,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(853)->
    #dropCfg {
    dropId = 350004,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(854)->
    #dropCfg {
    dropId = 350005,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(855)->
    #dropCfg {
    dropId = 350005,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(856)->
    #dropCfg {
    dropId = 350006,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(857)->
    #dropCfg {
    dropId = 350006,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(858)->
    #dropCfg {
    dropId = 350007,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(859)->
    #dropCfg {
    dropId = 350007,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(860)->
    #dropCfg {
    dropId = 350008,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(861)->
    #dropCfg {
    dropId = 350008,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(862)->
    #dropCfg {
    dropId = 350009,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(863)->
    #dropCfg {
    dropId = 350009,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(864)->
    #dropCfg {
    dropId = 350010,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(865)->
    #dropCfg {
    dropId = 350010,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(866)->
    #dropCfg {
    dropId = 350011,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(867)->
    #dropCfg {
    dropId = 350011,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(868)->
    #dropCfg {
    dropId = 350012,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(869)->
    #dropCfg {
    dropId = 350012,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(870)->
    #dropCfg {
    dropId = 350013,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(871)->
    #dropCfg {
    dropId = 350013,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(872)->
    #dropCfg {
    dropId = 350014,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(873)->
    #dropCfg {
    dropId = 350014,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(874)->
    #dropCfg {
    dropId = 350015,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(875)->
    #dropCfg {
    dropId = 350015,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(876)->
    #dropCfg {
    dropId = 350016,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(877)->
    #dropCfg {
    dropId = 350016,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(878)->
    #dropCfg {
    dropId = 350017,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(879)->
    #dropCfg {
    dropId = 350017,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(880)->
    #dropCfg {
    dropId = 350018,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(881)->
    #dropCfg {
    dropId = 350018,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(882)->
    #dropCfg {
    dropId = 350019,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(883)->
    #dropCfg {
    dropId = 350019,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(884)->
    #dropCfg {
    dropId = 350020,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(885)->
    #dropCfg {
    dropId = 350020,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(886)->
    #dropCfg {
    dropId = 350021,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(887)->
    #dropCfg {
    dropId = 350021,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(888)->
    #dropCfg {
    dropId = 350022,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(889)->
    #dropCfg {
    dropId = 350022,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(890)->
    #dropCfg {
    dropId = 350023,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(891)->
    #dropCfg {
    dropId = 350023,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(892)->
    #dropCfg {
    dropId = 350024,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(893)->
    #dropCfg {
    dropId = 350024,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(894)->
    #dropCfg {
    dropId = 350025,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(895)->
    #dropCfg {
    dropId = 350025,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(896)->
    #dropCfg {
    dropId = 350026,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(897)->
    #dropCfg {
    dropId = 350026,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(898)->
    #dropCfg {
    dropId = 350027,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(899)->
    #dropCfg {
    dropId = 350027,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(900)->
    #dropCfg {
    dropId = 350028,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(901)->
    #dropCfg {
    dropId = 350028,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(902)->
    #dropCfg {
    dropId = 350029,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(903)->
    #dropCfg {
    dropId = 350029,
    dropType = 0,
    dataId = 20,
    probability = 2222,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(904)->
    #dropCfg {
    dropId = 351000,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(905)->
    #dropCfg {
    dropId = 351001,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(906)->
    #dropCfg {
    dropId = 351002,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(907)->
    #dropCfg {
    dropId = 351003,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(908)->
    #dropCfg {
    dropId = 351004,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(909)->
    #dropCfg {
    dropId = 351005,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(910)->
    #dropCfg {
    dropId = 351006,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(911)->
    #dropCfg {
    dropId = 351007,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(912)->
    #dropCfg {
    dropId = 351008,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(913)->
    #dropCfg {
    dropId = 351009,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(914)->
    #dropCfg {
    dropId = 351010,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(915)->
    #dropCfg {
    dropId = 351011,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(916)->
    #dropCfg {
    dropId = 351012,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(917)->
    #dropCfg {
    dropId = 351013,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(918)->
    #dropCfg {
    dropId = 351014,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(919)->
    #dropCfg {
    dropId = 351015,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(920)->
    #dropCfg {
    dropId = 351016,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(921)->
    #dropCfg {
    dropId = 351017,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(922)->
    #dropCfg {
    dropId = 351018,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(923)->
    #dropCfg {
    dropId = 351019,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(924)->
    #dropCfg {
    dropId = 351020,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(925)->
    #dropCfg {
    dropId = 351021,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(926)->
    #dropCfg {
    dropId = 351022,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(927)->
    #dropCfg {
    dropId = 351023,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(928)->
    #dropCfg {
    dropId = 351024,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(929)->
    #dropCfg {
    dropId = 351025,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(930)->
    #dropCfg {
    dropId = 351026,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(931)->
    #dropCfg {
    dropId = 351027,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(932)->
    #dropCfg {
    dropId = 351028,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 0,
    max = 0,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(933)->
    #dropCfg {
    dropId = 351029,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(934)->
    #dropCfg {
    dropId = 360000,
    dropType = 0,
    dataId = 27072,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(935)->
    #dropCfg {
    dropId = 360000,
    dropType = 0,
    dataId = 27073,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(936)->
    #dropCfg {
    dropId = 360000,
    dropType = 0,
    dataId = 27074,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(937)->
    #dropCfg {
    dropId = 360001,
    dropType = 0,
    dataId = 27075,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(938)->
    #dropCfg {
    dropId = 360001,
    dropType = 0,
    dataId = 27076,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(939)->
    #dropCfg {
    dropId = 360001,
    dropType = 0,
    dataId = 27077,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(940)->
    #dropCfg {
    dropId = 360002,
    dropType = 0,
    dataId = 27078,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(941)->
    #dropCfg {
    dropId = 360002,
    dropType = 0,
    dataId = 27079,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(942)->
    #dropCfg {
    dropId = 360002,
    dropType = 0,
    dataId = 27080,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(943)->
    #dropCfg {
    dropId = 360003,
    dropType = 0,
    dataId = 27081,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(944)->
    #dropCfg {
    dropId = 360003,
    dropType = 0,
    dataId = 27082,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(945)->
    #dropCfg {
    dropId = 360003,
    dropType = 0,
    dataId = 27083,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(946)->
    #dropCfg {
    dropId = 360004,
    dropType = 0,
    dataId = 27084,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(947)->
    #dropCfg {
    dropId = 360004,
    dropType = 0,
    dataId = 27085,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(948)->
    #dropCfg {
    dropId = 360004,
    dropType = 0,
    dataId = 27086,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(949)->
    #dropCfg {
    dropId = 360005,
    dropType = 0,
    dataId = 27087,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(950)->
    #dropCfg {
    dropId = 360005,
    dropType = 0,
    dataId = 27088,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(951)->
    #dropCfg {
    dropId = 360005,
    dropType = 0,
    dataId = 27089,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(952)->
    #dropCfg {
    dropId = 360006,
    dropType = 0,
    dataId = 27090,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(953)->
    #dropCfg {
    dropId = 360006,
    dropType = 0,
    dataId = 27091,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(954)->
    #dropCfg {
    dropId = 360006,
    dropType = 0,
    dataId = 27092,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(955)->
    #dropCfg {
    dropId = 360007,
    dropType = 0,
    dataId = 27093,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(956)->
    #dropCfg {
    dropId = 360007,
    dropType = 0,
    dataId = 27094,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(957)->
    #dropCfg {
    dropId = 360007,
    dropType = 0,
    dataId = 27095,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(958)->
    #dropCfg {
    dropId = 360008,
    dropType = 0,
    dataId = 27096,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(959)->
    #dropCfg {
    dropId = 360008,
    dropType = 0,
    dataId = 27097,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(960)->
    #dropCfg {
    dropId = 360008,
    dropType = 0,
    dataId = 27098,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(961)->
    #dropCfg {
    dropId = 360009,
    dropType = 0,
    dataId = 27099,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(962)->
    #dropCfg {
    dropId = 360009,
    dropType = 0,
    dataId = 27100,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(963)->
    #dropCfg {
    dropId = 360009,
    dropType = 0,
    dataId = 27101,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(964)->
    #dropCfg {
    dropId = 360010,
    dropType = 0,
    dataId = 27102,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(965)->
    #dropCfg {
    dropId = 360010,
    dropType = 0,
    dataId = 27103,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(966)->
    #dropCfg {
    dropId = 360010,
    dropType = 0,
    dataId = 27104,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(967)->
    #dropCfg {
    dropId = 360011,
    dropType = 0,
    dataId = 27105,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(968)->
    #dropCfg {
    dropId = 360011,
    dropType = 0,
    dataId = 27106,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(969)->
    #dropCfg {
    dropId = 360011,
    dropType = 0,
    dataId = 27107,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(970)->
    #dropCfg {
    dropId = 360012,
    dropType = 0,
    dataId = 27108,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(971)->
    #dropCfg {
    dropId = 360012,
    dropType = 0,
    dataId = 27109,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(972)->
    #dropCfg {
    dropId = 360012,
    dropType = 0,
    dataId = 27110,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(973)->
    #dropCfg {
    dropId = 360013,
    dropType = 0,
    dataId = 27111,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(974)->
    #dropCfg {
    dropId = 360013,
    dropType = 0,
    dataId = 27112,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(975)->
    #dropCfg {
    dropId = 360013,
    dropType = 0,
    dataId = 27113,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(976)->
    #dropCfg {
    dropId = 360014,
    dropType = 0,
    dataId = 27114,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(977)->
    #dropCfg {
    dropId = 360014,
    dropType = 0,
    dataId = 27115,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(978)->
    #dropCfg {
    dropId = 360014,
    dropType = 0,
    dataId = 27116,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(979)->
    #dropCfg {
    dropId = 360015,
    dropType = 0,
    dataId = 27117,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(980)->
    #dropCfg {
    dropId = 360015,
    dropType = 0,
    dataId = 27118,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(981)->
    #dropCfg {
    dropId = 360015,
    dropType = 0,
    dataId = 27119,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(982)->
    #dropCfg {
    dropId = 360016,
    dropType = 0,
    dataId = 27120,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(983)->
    #dropCfg {
    dropId = 360016,
    dropType = 0,
    dataId = 27121,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(984)->
    #dropCfg {
    dropId = 360016,
    dropType = 0,
    dataId = 27122,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(985)->
    #dropCfg {
    dropId = 360017,
    dropType = 0,
    dataId = 27123,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(986)->
    #dropCfg {
    dropId = 360017,
    dropType = 0,
    dataId = 27124,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(987)->
    #dropCfg {
    dropId = 360017,
    dropType = 0,
    dataId = 27125,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(988)->
    #dropCfg {
    dropId = 369000,
    dropType = 1,
    dataId = 369000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(989)->
    #dropCfg {
    dropId = 369000,
    dropType = 1,
    dataId = 369001,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(990)->
    #dropCfg {
    dropId = 369000,
    dropType = 1,
    dataId = 369002,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(991)->
    #dropCfg {
    dropId = 369001,
    dropType = 1,
    dataId = 369000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(992)->
    #dropCfg {
    dropId = 369001,
    dropType = 1,
    dataId = 369003,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(993)->
    #dropCfg {
    dropId = 369001,
    dropType = 1,
    dataId = 369004,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(994)->
    #dropCfg {
    dropId = 370001,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 40,
    max = 40,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(995)->
    #dropCfg {
    dropId = 370001,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 200,
    max = 200,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(996)->
    #dropCfg {
    dropId = 370001,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 200,
    max = 200,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(997)->
    #dropCfg {
    dropId = 370001,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(998)->
    #dropCfg {
    dropId = 370001,
    dropType = 0,
    dataId = 606,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(999)->
    #dropCfg {
    dropId = 370002,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1000)->
    #dropCfg {
    dropId = 370002,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 150,
    max = 150,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1001)->
    #dropCfg {
    dropId = 370002,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 150,
    max = 150,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1002)->
    #dropCfg {
    dropId = 370002,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 70,
    max = 70,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1003)->
    #dropCfg {
    dropId = 370002,
    dropType = 0,
    dataId = 606,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1004)->
    #dropCfg {
    dropId = 370003,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 15,
    max = 15,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1005)->
    #dropCfg {
    dropId = 370003,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1006)->
    #dropCfg {
    dropId = 370003,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1007)->
    #dropCfg {
    dropId = 370003,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1008)->
    #dropCfg {
    dropId = 370003,
    dropType = 0,
    dataId = 606,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1009)->
    #dropCfg {
    dropId = 370004,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1010)->
    #dropCfg {
    dropId = 370004,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1011)->
    #dropCfg {
    dropId = 370004,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1012)->
    #dropCfg {
    dropId = 370004,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 30,
    max = 30,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1013)->
    #dropCfg {
    dropId = 370004,
    dropType = 0,
    dataId = 605,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1014)->
    #dropCfg {
    dropId = 370005,
    dropType = 0,
    dataId = 4304,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 25,
    max = 25,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1015)->
    #dropCfg {
    dropId = 370005,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 150,
    max = 150,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1016)->
    #dropCfg {
    dropId = 370005,
    dropType = 0,
    dataId = 2160,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 150,
    max = 150,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1017)->
    #dropCfg {
    dropId = 370005,
    dropType = 0,
    dataId = 225,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 70,
    max = 70,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1018)->
    #dropCfg {
    dropId = 370005,
    dropType = 0,
    dataId = 606,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2,
    max = 2,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1019)->
    #dropCfg {
    dropId = 380001,
    dropType = 2,
    dataId = 1,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 20000,
    max = 20000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1020)->
    #dropCfg {
    dropId = 380002,
    dropType = 0,
    dataId = 222,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 50,
    max = 50,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1021)->
    #dropCfg {
    dropId = 380003,
    dropType = 0,
    dataId = 20,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 100,
    max = 100,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1022)->
    #dropCfg {
    dropId = 380004,
    dropType = 0,
    dataId = 1800,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 10,
    max = 10,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1023)->
    #dropCfg {
    dropId = 380005,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 500,
    max = 500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1024)->
    #dropCfg {
    dropId = 390001,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2000,
    max = 2000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1025)->
    #dropCfg {
    dropId = 390001,
    dropType = 0,
    dataId = 22008,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1026)->
    #dropCfg {
    dropId = 390002,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2500,
    max = 2500,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1027)->
    #dropCfg {
    dropId = 390002,
    dropType = 0,
    dataId = 22009,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1028)->
    #dropCfg {
    dropId = 390003,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 2800,
    max = 2800,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1029)->
    #dropCfg {
    dropId = 390003,
    dropType = 0,
    dataId = 22010,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1030)->
    #dropCfg {
    dropId = 390004,
    dropType = 2,
    dataId = 6,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 3000,
    max = 3000,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1031)->
    #dropCfg {
    dropId = 400000,
    dropType = 0,
    dataId = 27048,
    probability = 10000,
    career = 0,
    sex = 1,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1032)->
    #dropCfg {
    dropId = 400000,
    dropType = 0,
    dataId = 27049,
    probability = 10000,
    career = 0,
    sex = 2,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1033)->
    #dropCfg {
    dropId = 400001,
    dropType = 0,
    dataId = 27050,
    probability = 10000,
    career = 0,
    sex = 1,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1034)->
    #dropCfg {
    dropId = 400001,
    dropType = 0,
    dataId = 27051,
    probability = 10000,
    career = 0,
    sex = 2,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1035)->
    #dropCfg {
    dropId = 400002,
    dropType = 0,
    dataId = 27016,
    probability = 10000,
    career = 0,
    sex = 1,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1036)->
    #dropCfg {
    dropId = 400002,
    dropType = 0,
    dataId = 27017,
    probability = 10000,
    career = 0,
    sex = 2,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1037)->
    #dropCfg {
    dropId = 400003,
    dropType = 0,
    dataId = 27018,
    probability = 10000,
    career = 0,
    sex = 1,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1038)->
    #dropCfg {
    dropId = 400003,
    dropType = 0,
    dataId = 27019,
    probability = 10000,
    career = 0,
    sex = 2,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1039)->
    #dropCfg {
    dropId = 400004,
    dropType = 0,
    dataId = 27028,
    probability = 10000,
    career = 0,
    sex = 1,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1040)->
    #dropCfg {
    dropId = 400004,
    dropType = 0,
    dataId = 27029,
    probability = 10000,
    career = 0,
    sex = 2,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1041)->
    #dropCfg {
    dropId = 400005,
    dropType = 0,
    dataId = 27030,
    probability = 10000,
    career = 0,
    sex = 1,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1042)->
    #dropCfg {
    dropId = 400005,
    dropType = 0,
    dataId = 27031,
    probability = 10000,
    career = 0,
    sex = 2,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1043)->
    #dropCfg {
    dropId = 410000,
    dropType = 1,
    dataId = 410000,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1044)->
    #dropCfg {
    dropId = 500000,
    dropType = 0,
    dataId = 908,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1045)->
    #dropCfg {
    dropId = 500000,
    dropType = 0,
    dataId = 27040,
    probability = 10000,
    career = 0,
    sex = 1,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1046)->
    #dropCfg {
    dropId = 500000,
    dropType = 0,
    dataId = 27042,
    probability = 10000,
    career = 0,
    sex = 1,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1047)->
    #dropCfg {
    dropId = 500000,
    dropType = 0,
    dataId = 27041,
    probability = 10000,
    career = 0,
    sex = 2,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1048)->
    #dropCfg {
    dropId = 500000,
    dropType = 0,
    dataId = 27043,
    probability = 10000,
    career = 0,
    sex = 2,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1049)->
    #dropCfg {
    dropId = 500000,
    dropType = 0,
    dataId = 60000,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1050)->
    #dropCfg {
    dropId = 500000,
    dropType = 0,
    dataId = 60003,
    probability = 10000,
    career = 1,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1051)->
    #dropCfg {
    dropId = 500000,
    dropType = 0,
    dataId = 60001,
    probability = 10000,
    career = 2,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1052)->
    #dropCfg {
    dropId = 500000,
    dropType = 0,
    dataId = 60004,
    probability = 10000,
    career = 2,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1053)->
    #dropCfg {
    dropId = 500000,
    dropType = 0,
    dataId = 60002,
    probability = 10000,
    career = 3,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1054)->
    #dropCfg {
    dropId = 500000,
    dropType = 0,
    dataId = 60005,
    probability = 10000,
    career = 3,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
    };
getRow(1055)->
    #dropCfg {
    dropId = 501000,
    dropType = 0,
    dataId = 1828,
    probability = 10000,
    career = 0,
    sex = 0,
    min = 1,
    max = 1,
    isbind = 1,
    dropcontrol = 0,
    dropclass = 0,
    level = 1
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
    {1055}
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
    1055
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
getKey(1001)->[
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42
    ];
getKey(1002)->[
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
    57
    ];
getKey(1003)->[
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
    72
    ];
getKey(1004)->[
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
    87
    ];
getKey(1005)->[
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
    102
    ];
getKey(1006)->[
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
    116
    ];
getKey(1007)->[
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
    130
    ];
getKey(1008)->[
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
    144
    ];
getKey(1009)->[
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
    158
    ];
getKey(1010)->[
    159,
    160,
    161,
    162,
    163,
    164,
    165
    ];
getKey(1011)->[
    166,
    167,
    168,
    169,
    170,
    171,
    172
    ];
getKey(1012)->[
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
    187
    ];
getKey(1013)->[
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
    202
    ];
getKey(1014)->[
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
    217
    ];
getKey(1015)->[
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
    231
    ];
getKey(1016)->[
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
    245
    ];
getKey(1017)->[
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
    261
    ];
getKey(1020)->[
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
    276
    ];
getKey(1021)->[
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
    291
    ];
getKey(1301)->[
    292,
    293,
    294
    ];
getKey(1302)->[
    295,
    296,
    297
    ];
getKey(1303)->[
    298,
    299,
    300,
    301
    ];
getKey(1304)->[
    302,
    303,
    304,
    305
    ];
getKey(1305)->[
    306,
    307,
    308,
    309
    ];
getKey(1426)->[
    310,
    311
    ];
getKey(1427)->[
    312,
    313
    ];
getKey(1428)->[
    314,
    315
    ];
getKey(1429)->[
    316,
    317
    ];
getKey(1430)->[
    318,
    319
    ];
getKey(1431)->[
    320,
    321
    ];
getKey(1901)->[
    322
    ];
getKey(1902)->[
    323
    ];
getKey(1903)->[
    324
    ];
getKey(1904)->[
    325
    ];
getKey(1905)->[
    326
    ];
getKey(1915)->[
    327,
    328,
    329
    ];
getKey(1916)->[
    330,
    331,
    332
    ];
getKey(1917)->[
    333,
    334,
    335
    ];
getKey(1918)->[
    336,
    337,
    338
    ];
getKey(1919)->[
    339,
    340,
    341
    ];
getKey(1920)->[
    342,
    343
    ];
getKey(1921)->[
    344,
    345
    ];
getKey(1922)->[
    346,
    347
    ];
getKey(1923)->[
    348,
    349
    ];
getKey(1924)->[
    350,
    351,
    352
    ];
getKey(1925)->[
    353,
    354,
    355
    ];
getKey(1926)->[
    356,
    357,
    358
    ];
getKey(1927)->[
    359,
    360,
    361
    ];
getKey(1928)->[
    362,
    363,
    364
    ];
getKey(1929)->[
    365,
    366,
    367
    ];
getKey(1930)->[
    368,
    369,
    370
    ];
getKey(1931)->[
    371,
    372,
    373
    ];
getKey(1932)->[
    374,
    375,
    376
    ];
getKey(1933)->[
    377,
    378,
    379
    ];
getKey(1934)->[
    380,
    381,
    382
    ];
getKey(3500)->[
    383
    ];
getKey(3501)->[
    384
    ];
getKey(3502)->[
    385
    ];
getKey(5000)->[
    386,
    387,
    388,
    389,
    390,
    391
    ];
getKey(8000)->[
    392
    ];
getKey(8001)->[
    393
    ];
getKey(8002)->[
    394
    ];
getKey(8003)->[
    395
    ];
getKey(8004)->[
    396
    ];
getKey(8005)->[
    397
    ];
getKey(8006)->[
    398
    ];
getKey(8007)->[
    399
    ];
getKey(8008)->[
    400
    ];
getKey(8009)->[
    401
    ];
getKey(18001)->[
    402
    ];
getKey(250000)->[
    403,
    404,
    405
    ];
getKey(251000)->[
    406,
    407,
    408
    ];
getKey(252000)->[
    409,
    410,
    411
    ];
getKey(260000)->[
    412,
    413,
    414
    ];
getKey(300000)->[
    415,
    416
    ];
getKey(300001)->[
    417,
    418
    ];
getKey(300002)->[
    419,
    420
    ];
getKey(300003)->[
    421,
    422
    ];
getKey(300004)->[
    423,
    424
    ];
getKey(300005)->[
    425,
    426
    ];
getKey(300006)->[
    427,
    428
    ];
getKey(301000)->[
    429,
    430,
    431
    ];
getKey(301001)->[
    432,
    433,
    434
    ];
getKey(301002)->[
    435,
    436,
    437
    ];
getKey(301003)->[
    438,
    439,
    440
    ];
getKey(301004)->[
    441,
    442,
    443
    ];
getKey(301005)->[
    444,
    445,
    446
    ];
getKey(302000)->[
    447,
    448,
    449
    ];
getKey(302001)->[
    450,
    451,
    452
    ];
getKey(302002)->[
    453,
    454,
    455
    ];
getKey(302003)->[
    456,
    457,
    458
    ];
getKey(310003)->[
    459,
    460
    ];
getKey(310004)->[
    461,
    462
    ];
getKey(310005)->[
    463,
    464
    ];
getKey(310006)->[
    465,
    466
    ];
getKey(310007)->[
    467,
    468
    ];
getKey(310100)->[
    469,
    470,
    471
    ];
getKey(310101)->[
    472
    ];
getKey(310102)->[
    473,
    474,
    475
    ];
getKey(310103)->[
    476,
    477,
    478
    ];
getKey(310104)->[
    479
    ];
getKey(310105)->[
    480,
    481,
    482
    ];
getKey(310106)->[
    483,
    484,
    485
    ];
getKey(310107)->[
    486
    ];
getKey(310108)->[
    487,
    488,
    489
    ];
getKey(310200)->[
    490,
    491
    ];
getKey(310201)->[
    492,
    493
    ];
getKey(310202)->[
    494,
    495
    ];
getKey(310203)->[
    496,
    497
    ];
getKey(310204)->[
    498,
    499
    ];
getKey(310205)->[
    500,
    501
    ];
getKey(310206)->[
    502,
    503
    ];
getKey(310207)->[
    504,
    505
    ];
getKey(310208)->[
    506,
    507
    ];
getKey(310209)->[
    508,
    509
    ];
getKey(310210)->[
    510,
    511
    ];
getKey(310300)->[
    512,
    513
    ];
getKey(310301)->[
    514
    ];
getKey(311000)->[
    515,
    516
    ];
getKey(311001)->[
    517,
    518
    ];
getKey(311002)->[
    519,
    520
    ];
getKey(311003)->[
    521,
    522
    ];
getKey(311004)->[
    523,
    524
    ];
getKey(311005)->[
    525,
    526
    ];
getKey(311006)->[
    527,
    528
    ];
getKey(311007)->[
    529,
    530
    ];
getKey(311008)->[
    531,
    532
    ];
getKey(311009)->[
    533,
    534
    ];
getKey(311010)->[
    535,
    536
    ];
getKey(311011)->[
    537,
    538
    ];
getKey(311012)->[
    539,
    540
    ];
getKey(311013)->[
    541,
    542
    ];
getKey(311014)->[
    543,
    544
    ];
getKey(311015)->[
    545,
    546
    ];
getKey(311016)->[
    547,
    548
    ];
getKey(311017)->[
    549,
    550
    ];
getKey(311018)->[
    551,
    552
    ];
getKey(311019)->[
    553,
    554
    ];
getKey(311020)->[
    555,
    556
    ];
getKey(311021)->[
    557,
    558
    ];
getKey(311022)->[
    559,
    560
    ];
getKey(311023)->[
    561,
    562
    ];
getKey(311024)->[
    563,
    564
    ];
getKey(311025)->[
    565,
    566
    ];
getKey(311026)->[
    567,
    568
    ];
getKey(311027)->[
    569,
    570
    ];
getKey(311028)->[
    571,
    572
    ];
getKey(311029)->[
    573,
    574
    ];
getKey(311030)->[
    575,
    576
    ];
getKey(311031)->[
    577,
    578
    ];
getKey(311032)->[
    579,
    580
    ];
getKey(312000)->[
    581
    ];
getKey(312001)->[
    582
    ];
getKey(312002)->[
    583
    ];
getKey(312003)->[
    584
    ];
getKey(312004)->[
    585
    ];
getKey(312005)->[
    586
    ];
getKey(312006)->[
    587
    ];
getKey(312100)->[
    588
    ];
getKey(312101)->[
    589
    ];
getKey(312102)->[
    590
    ];
getKey(312103)->[
    591
    ];
getKey(312104)->[
    592
    ];
getKey(312105)->[
    593
    ];
getKey(312106)->[
    594
    ];
getKey(312200)->[
    595
    ];
getKey(312201)->[
    596
    ];
getKey(312202)->[
    597
    ];
getKey(312203)->[
    598
    ];
getKey(312204)->[
    599
    ];
getKey(312205)->[
    600
    ];
getKey(312206)->[
    601
    ];
getKey(314000)->[
    602,
    603
    ];
getKey(314001)->[
    604,
    605
    ];
getKey(314002)->[
    606,
    607
    ];
getKey(314003)->[
    608,
    609
    ];
getKey(314004)->[
    610,
    611
    ];
getKey(314005)->[
    612,
    613
    ];
getKey(314006)->[
    614,
    615
    ];
getKey(314007)->[
    616,
    617
    ];
getKey(314008)->[
    618,
    619
    ];
getKey(314009)->[
    620,
    621
    ];
getKey(314010)->[
    622,
    623
    ];
getKey(314011)->[
    624,
    625
    ];
getKey(314012)->[
    626,
    627
    ];
getKey(314013)->[
    628,
    629
    ];
getKey(314014)->[
    630,
    631
    ];
getKey(314015)->[
    632,
    633
    ];
getKey(314016)->[
    634,
    635
    ];
getKey(314017)->[
    636,
    637
    ];
getKey(314018)->[
    638,
    639
    ];
getKey(314019)->[
    640,
    641
    ];
getKey(314020)->[
    642,
    643
    ];
getKey(314021)->[
    644,
    645
    ];
getKey(314022)->[
    646,
    647
    ];
getKey(314023)->[
    648,
    649
    ];
getKey(314024)->[
    650,
    651
    ];
getKey(314025)->[
    652,
    653
    ];
getKey(314026)->[
    654,
    655
    ];
getKey(314027)->[
    656,
    657
    ];
getKey(314028)->[
    658,
    659
    ];
getKey(314029)->[
    660,
    661
    ];
getKey(314030)->[
    662,
    663
    ];
getKey(314031)->[
    664,
    665
    ];
getKey(314032)->[
    666,
    667
    ];
getKey(314033)->[
    668,
    669
    ];
getKey(314034)->[
    670,
    671
    ];
getKey(314035)->[
    672,
    673
    ];
getKey(314036)->[
    674,
    675
    ];
getKey(314037)->[
    676,
    677
    ];
getKey(314038)->[
    678,
    679
    ];
getKey(314039)->[
    680,
    681
    ];
getKey(314040)->[
    682,
    683
    ];
getKey(314041)->[
    684,
    685
    ];
getKey(314042)->[
    686,
    687
    ];
getKey(314043)->[
    688,
    689
    ];
getKey(314044)->[
    690,
    691
    ];
getKey(314045)->[
    692,
    693
    ];
getKey(314046)->[
    694,
    695
    ];
getKey(314047)->[
    696,
    697
    ];
getKey(314048)->[
    698,
    699
    ];
getKey(314049)->[
    700,
    701
    ];
getKey(314050)->[
    702,
    703
    ];
getKey(314051)->[
    704,
    705
    ];
getKey(314052)->[
    706,
    707
    ];
getKey(314053)->[
    708,
    709
    ];
getKey(314054)->[
    710,
    711
    ];
getKey(314055)->[
    712,
    713
    ];
getKey(314056)->[
    714,
    715
    ];
getKey(314057)->[
    716,
    717
    ];
getKey(314058)->[
    718,
    719
    ];
getKey(314059)->[
    720,
    721
    ];
getKey(314060)->[
    722,
    723
    ];
getKey(314061)->[
    724,
    725
    ];
getKey(314062)->[
    726,
    727
    ];
getKey(314063)->[
    728,
    729
    ];
getKey(314064)->[
    730,
    731
    ];
getKey(314065)->[
    732,
    733
    ];
getKey(314066)->[
    734,
    735
    ];
getKey(314067)->[
    736,
    737
    ];
getKey(314068)->[
    738,
    739
    ];
getKey(314069)->[
    740,
    741
    ];
getKey(314070)->[
    742,
    743
    ];
getKey(314071)->[
    744,
    745
    ];
getKey(314072)->[
    746,
    747
    ];
getKey(314073)->[
    748,
    749
    ];
getKey(314074)->[
    750,
    751
    ];
getKey(314075)->[
    752,
    753
    ];
getKey(314076)->[
    754,
    755
    ];
getKey(314077)->[
    756,
    757
    ];
getKey(314078)->[
    758,
    759
    ];
getKey(314079)->[
    760,
    761
    ];
getKey(314080)->[
    762,
    763
    ];
getKey(314081)->[
    764,
    765
    ];
getKey(314082)->[
    766,
    767
    ];
getKey(314083)->[
    768,
    769
    ];
getKey(314084)->[
    770,
    771
    ];
getKey(314085)->[
    772,
    773
    ];
getKey(314086)->[
    774,
    775
    ];
getKey(314087)->[
    776,
    777
    ];
getKey(314088)->[
    778,
    779
    ];
getKey(314089)->[
    780,
    781
    ];
getKey(314090)->[
    782,
    783
    ];
getKey(314091)->[
    784,
    785
    ];
getKey(314092)->[
    786,
    787
    ];
getKey(314093)->[
    788,
    789
    ];
getKey(314094)->[
    790,
    791
    ];
getKey(314095)->[
    792,
    793
    ];
getKey(315000)->[
    794
    ];
getKey(315001)->[
    795
    ];
getKey(315002)->[
    796
    ];
getKey(315003)->[
    797
    ];
getKey(315004)->[
    798
    ];
getKey(315005)->[
    799
    ];
getKey(315006)->[
    800
    ];
getKey(315007)->[
    801
    ];
getKey(315008)->[
    802
    ];
getKey(315009)->[
    803
    ];
getKey(316000)->[
    804,
    805
    ];
getKey(316001)->[
    806,
    807
    ];
getKey(316002)->[
    808
    ];
getKey(316003)->[
    809
    ];
getKey(316004)->[
    810
    ];
getKey(317000)->[
    811
    ];
getKey(317001)->[
    812
    ];
getKey(317002)->[
    813
    ];
getKey(317003)->[
    814
    ];
getKey(318000)->[
    815,
    816
    ];
getKey(318001)->[
    817,
    818
    ];
getKey(318002)->[
    819
    ];
getKey(318003)->[
    820
    ];
getKey(318004)->[
    821
    ];
getKey(319000)->[
    822
    ];
getKey(319001)->[
    823
    ];
getKey(319002)->[
    824
    ];
getKey(320000)->[
    825,
    826,
    827
    ];
getKey(320001)->[
    828
    ];
getKey(320002)->[
    829
    ];
getKey(320003)->[
    830
    ];
getKey(320004)->[
    831,
    832
    ];
getKey(320005)->[
    833
    ];
getKey(320006)->[
    834
    ];
getKey(330000)->[
    835,
    836,
    837
    ];
getKey(340000)->[
    838
    ];
getKey(340001)->[
    839
    ];
getKey(340002)->[
    840,
    841
    ];
getKey(340003)->[
    842,
    843
    ];
getKey(350000)->[
    844,
    845
    ];
getKey(350001)->[
    846,
    847
    ];
getKey(350002)->[
    848,
    849
    ];
getKey(350003)->[
    850,
    851
    ];
getKey(350004)->[
    852,
    853
    ];
getKey(350005)->[
    854,
    855
    ];
getKey(350006)->[
    856,
    857
    ];
getKey(350007)->[
    858,
    859
    ];
getKey(350008)->[
    860,
    861
    ];
getKey(350009)->[
    862,
    863
    ];
getKey(350010)->[
    864,
    865
    ];
getKey(350011)->[
    866,
    867
    ];
getKey(350012)->[
    868,
    869
    ];
getKey(350013)->[
    870,
    871
    ];
getKey(350014)->[
    872,
    873
    ];
getKey(350015)->[
    874,
    875
    ];
getKey(350016)->[
    876,
    877
    ];
getKey(350017)->[
    878,
    879
    ];
getKey(350018)->[
    880,
    881
    ];
getKey(350019)->[
    882,
    883
    ];
getKey(350020)->[
    884,
    885
    ];
getKey(350021)->[
    886,
    887
    ];
getKey(350022)->[
    888,
    889
    ];
getKey(350023)->[
    890,
    891
    ];
getKey(350024)->[
    892,
    893
    ];
getKey(350025)->[
    894,
    895
    ];
getKey(350026)->[
    896,
    897
    ];
getKey(350027)->[
    898,
    899
    ];
getKey(350028)->[
    900,
    901
    ];
getKey(350029)->[
    902,
    903
    ];
getKey(351000)->[
    904
    ];
getKey(351001)->[
    905
    ];
getKey(351002)->[
    906
    ];
getKey(351003)->[
    907
    ];
getKey(351004)->[
    908
    ];
getKey(351005)->[
    909
    ];
getKey(351006)->[
    910
    ];
getKey(351007)->[
    911
    ];
getKey(351008)->[
    912
    ];
getKey(351009)->[
    913
    ];
getKey(351010)->[
    914
    ];
getKey(351011)->[
    915
    ];
getKey(351012)->[
    916
    ];
getKey(351013)->[
    917
    ];
getKey(351014)->[
    918
    ];
getKey(351015)->[
    919
    ];
getKey(351016)->[
    920
    ];
getKey(351017)->[
    921
    ];
getKey(351018)->[
    922
    ];
getKey(351019)->[
    923
    ];
getKey(351020)->[
    924
    ];
getKey(351021)->[
    925
    ];
getKey(351022)->[
    926
    ];
getKey(351023)->[
    927
    ];
getKey(351024)->[
    928
    ];
getKey(351025)->[
    929
    ];
getKey(351026)->[
    930
    ];
getKey(351027)->[
    931
    ];
getKey(351028)->[
    932
    ];
getKey(351029)->[
    933
    ];
getKey(360000)->[
    934,
    935,
    936
    ];
getKey(360001)->[
    937,
    938,
    939
    ];
getKey(360002)->[
    940,
    941,
    942
    ];
getKey(360003)->[
    943,
    944,
    945
    ];
getKey(360004)->[
    946,
    947,
    948
    ];
getKey(360005)->[
    949,
    950,
    951
    ];
getKey(360006)->[
    952,
    953,
    954
    ];
getKey(360007)->[
    955,
    956,
    957
    ];
getKey(360008)->[
    958,
    959,
    960
    ];
getKey(360009)->[
    961,
    962,
    963
    ];
getKey(360010)->[
    964,
    965,
    966
    ];
getKey(360011)->[
    967,
    968,
    969
    ];
getKey(360012)->[
    970,
    971,
    972
    ];
getKey(360013)->[
    973,
    974,
    975
    ];
getKey(360014)->[
    976,
    977,
    978
    ];
getKey(360015)->[
    979,
    980,
    981
    ];
getKey(360016)->[
    982,
    983,
    984
    ];
getKey(360017)->[
    985,
    986,
    987
    ];
getKey(369000)->[
    988,
    989,
    990
    ];
getKey(369001)->[
    991,
    992,
    993
    ];
getKey(370001)->[
    994,
    995,
    996,
    997,
    998
    ];
getKey(370002)->[
    999,
    1000,
    1001,
    1002,
    1003
    ];
getKey(370003)->[
    1004,
    1005,
    1006,
    1007,
    1008
    ];
getKey(370004)->[
    1009,
    1010,
    1011,
    1012,
    1013
    ];
getKey(370005)->[
    1014,
    1015,
    1016,
    1017,
    1018
    ];
getKey(380001)->[
    1019
    ];
getKey(380002)->[
    1020
    ];
getKey(380003)->[
    1021
    ];
getKey(380004)->[
    1022
    ];
getKey(380005)->[
    1023
    ];
getKey(390001)->[
    1024,
    1025
    ];
getKey(390002)->[
    1026,
    1027
    ];
getKey(390003)->[
    1028,
    1029
    ];
getKey(390004)->[
    1030
    ];
getKey(400000)->[
    1031,
    1032
    ];
getKey(400001)->[
    1033,
    1034
    ];
getKey(400002)->[
    1035,
    1036
    ];
getKey(400003)->[
    1037,
    1038
    ];
getKey(400004)->[
    1039,
    1040
    ];
getKey(400005)->[
    1041,
    1042
    ];
getKey(410000)->[
    1043
    ];
getKey(500000)->[
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
    1054
    ];
getKey(501000)->[
    1055
    ];
getKey(_)->[].
