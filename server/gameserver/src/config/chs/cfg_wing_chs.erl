%% coding: latin-1
%%: 实现
-module(cfg_wing_chs).
-compile(export_all).
-include("cfg_wing.hrl").
-include("logger.hrl").

getRow(1)->
    #wingCfg {
    iD = 1,
    model = [1,1,0],
    icon = [5005,5000,0],
    level = 1,
    exp = 25,
    use_itemID = [4303,4304,4305],
    property = [{135,1337,0},{136,133,0},{137,133,0},{138,133,0},{139,133,0}],
    shownumber = 0,
    multiple = [200,200,0],
    cast_money = 0
    };
getRow(2)->
    #wingCfg {
    iD = 2,
    model = [1,1,0],
    icon = [5005,5000,0],
    level = 2,
    exp = 25,
    use_itemID = [4303,4304,4305],
    property = [{135,1364,0},{136,136,0},{137,136,0},{138,136,0},{139,136,0}],
    shownumber = 0,
    multiple = [200,200,0],
    cast_money = 0
    };
getRow(3)->
    #wingCfg {
    iD = 3,
    model = [1,1,0],
    icon = [5005,5000,0],
    level = 3,
    exp = 25,
    use_itemID = [4303,4304,4305],
    property = [{135,1412,0},{136,141,0},{137,141,0},{138,141,0},{139,141,0}],
    shownumber = 0,
    multiple = [200,200,0],
    cast_money = 0
    };
getRow(4)->
    #wingCfg {
    iD = 4,
    model = [1,1,0],
    icon = [5005,5000,0],
    level = 4,
    exp = 28,
    use_itemID = [4303,4304,4305],
    property = [{135,1475,0},{136,147,0},{137,147,0},{138,147,0},{139,147,0}],
    shownumber = 0,
    multiple = [200,200,0],
    cast_money = 0
    };
getRow(5)->
    #wingCfg {
    iD = 5,
    model = [1,1,0],
    icon = [5005,5000,0],
    level = 5,
    exp = 29,
    use_itemID = [4303,4304,4305],
    property = [{135,1549,0},{136,154,0},{137,154,0},{138,154,0},{139,154,0}],
    shownumber = 0,
    multiple = [200,200,0],
    cast_money = 0
    };
getRow(6)->
    #wingCfg {
    iD = 6,
    model = [1,1,0],
    icon = [5005,5000,0],
    level = 6,
    exp = 32,
    use_itemID = [4303,4304,4305],
    property = [{135,1634,0},{136,163,0},{137,163,0},{138,163,0},{139,163,0}],
    shownumber = 0,
    multiple = [200,200,0],
    cast_money = 0
    };
getRow(7)->
    #wingCfg {
    iD = 7,
    model = [1,1,0],
    icon = [5005,5000,0],
    level = 7,
    exp = 35,
    use_itemID = [4303,4304,4305],
    property = [{135,1727,0},{136,172,0},{137,172,0},{138,172,0},{139,172,0}],
    shownumber = 0,
    multiple = [200,200,0],
    cast_money = 0
    };
getRow(8)->
    #wingCfg {
    iD = 8,
    model = [1,1,0],
    icon = [5005,5000,0],
    level = 8,
    exp = 40,
    use_itemID = [4303,4304,4305],
    property = [{135,1829,0},{136,182,0},{137,182,0},{138,182,0},{139,182,0}],
    shownumber = 0,
    multiple = [200,200,0],
    cast_money = 0
    };
getRow(9)->
    #wingCfg {
    iD = 9,
    model = [1,1,0],
    icon = [5005,5000,0],
    level = 9,
    exp = 44,
    use_itemID = [4303,4304,4305],
    property = [{135,1938,0},{136,193,0},{137,193,0},{138,193,0},{139,193,0}],
    shownumber = 0,
    multiple = [200,200,0],
    cast_money = 0
    };
getRow(10)->
    #wingCfg {
    iD = 10,
    model = [1,1,0],
    icon = [5005,5000,0],
    level = 10,
    exp = 50,
    use_itemID = [4303,4304,4305],
    property = [{135,2054,0},{136,205,0},{137,205,0},{138,205,0},{139,205,0}],
    shownumber = 0,
    multiple = [200,200,0],
    cast_money = 0
    };
getRow(11)->
    #wingCfg {
    iD = 11,
    model = [1,1,0],
    icon = [5005,5000,0],
    level = 11,
    exp = 56,
    use_itemID = [4303,4304,4305],
    property = [{135,2177,0},{136,217,0},{137,217,0},{138,217,0},{139,217,0}],
    shownumber = 0,
    multiple = [200,200,0],
    cast_money = 0
    };
getRow(12)->
    #wingCfg {
    iD = 12,
    model = [1,1,0],
    icon = [5005,5000,0],
    level = 12,
    exp = 63,
    use_itemID = [4303,4304,4305],
    property = [{135,2306,0},{136,230,0},{137,230,0},{138,230,0},{139,230,0}],
    shownumber = 0,
    multiple = [200,200,0],
    cast_money = 0
    };
getRow(13)->
    #wingCfg {
    iD = 13,
    model = [2,2,0],
    icon = [5006,5001,0],
    level = 13,
    exp = 70,
    use_itemID = [4303,4304,4305],
    property = [{135,2441,0},{136,244,0},{137,244,0},{138,244,0},{139,244,0}],
    shownumber = 1,
    multiple = [120,150,0],
    cast_money = 0
    };
getRow(14)->
    #wingCfg {
    iD = 14,
    model = [2,2,0],
    icon = [5006,5001,0],
    level = 14,
    exp = 79,
    use_itemID = [4303,4304,4305],
    property = [{135,2582,0},{136,258,0},{137,258,0},{138,258,0},{139,258,0}],
    shownumber = 1,
    multiple = [120,150,0],
    cast_money = 0
    };
getRow(15)->
    #wingCfg {
    iD = 15,
    model = [2,2,0],
    icon = [5006,5001,0],
    level = 15,
    exp = 87,
    use_itemID = [4303,4304,4305],
    property = [{135,2728,0},{136,272,0},{137,272,0},{138,272,0},{139,272,0}],
    shownumber = 1,
    multiple = [120,150,0],
    cast_money = 0
    };
getRow(16)->
    #wingCfg {
    iD = 16,
    model = [2,2,0],
    icon = [5006,5001,0],
    level = 16,
    exp = 98,
    use_itemID = [4303,4304,4305],
    property = [{135,2880,0},{136,288,0},{137,288,0},{138,288,0},{139,288,0}],
    shownumber = 1,
    multiple = [120,150,0],
    cast_money = 0
    };
getRow(17)->
    #wingCfg {
    iD = 17,
    model = [2,2,0],
    icon = [5006,5001,0],
    level = 17,
    exp = 107,
    use_itemID = [4303,4304,4305],
    property = [{135,3037,0},{136,303,0},{137,303,0},{138,303,0},{139,303,0}],
    shownumber = 1,
    multiple = [120,150,0],
    cast_money = 0
    };
getRow(18)->
    #wingCfg {
    iD = 18,
    model = [2,2,0],
    icon = [5006,5001,0],
    level = 18,
    exp = 119,
    use_itemID = [4303,4304,4305],
    property = [{135,3199,0},{136,319,0},{137,319,0},{138,319,0},{139,319,0}],
    shownumber = 1,
    multiple = [120,150,0],
    cast_money = 0
    };
getRow(19)->
    #wingCfg {
    iD = 19,
    model = [2,2,0],
    icon = [5006,5001,0],
    level = 19,
    exp = 130,
    use_itemID = [4303,4304,4305],
    property = [{135,3365,0},{136,336,0},{137,336,0},{138,336,0},{139,336,0}],
    shownumber = 1,
    multiple = [120,150,0],
    cast_money = 0
    };
getRow(20)->
    #wingCfg {
    iD = 20,
    model = [2,2,0],
    icon = [5006,5001,0],
    level = 20,
    exp = 142,
    use_itemID = [4303,4304,4305],
    property = [{135,3537,0},{136,353,0},{137,353,0},{138,353,0},{139,353,0}],
    shownumber = 1,
    multiple = [120,150,0],
    cast_money = 0
    };
getRow(21)->
    #wingCfg {
    iD = 21,
    model = [2,2,0],
    icon = [5006,5001,0],
    level = 21,
    exp = 156,
    use_itemID = [4303,4304,4305],
    property = [{135,3713,0},{136,371,0},{137,371,0},{138,371,0},{139,371,0}],
    shownumber = 1,
    multiple = [120,150,0],
    cast_money = 0
    };
getRow(22)->
    #wingCfg {
    iD = 22,
    model = [2,2,0],
    icon = [5006,5001,0],
    level = 22,
    exp = 169,
    use_itemID = [4303,4304,4305],
    property = [{135,3893,0},{136,389,0},{137,389,0},{138,389,0},{139,389,0}],
    shownumber = 1,
    multiple = [120,150,0],
    cast_money = 0
    };
getRow(23)->
    #wingCfg {
    iD = 23,
    model = [2,2,0],
    icon = [5006,5001,0],
    level = 23,
    exp = 184,
    use_itemID = [4303,4304,4305],
    property = [{135,4078,0},{136,407,0},{137,407,0},{138,407,0},{139,407,0}],
    shownumber = 1,
    multiple = [120,150,0],
    cast_money = 0
    };
getRow(24)->
    #wingCfg {
    iD = 24,
    model = [2,2,0],
    icon = [5006,5001,0],
    level = 24,
    exp = 199,
    use_itemID = [4303,4304,4305],
    property = [{135,4267,0},{136,426,0},{137,426,0},{138,426,0},{139,426,0}],
    shownumber = 1,
    multiple = [120,150,0],
    cast_money = 0
    };
getRow(25)->
    #wingCfg {
    iD = 25,
    model = [3,3,0],
    icon = [5007,5002,0],
    level = 25,
    exp = 214,
    use_itemID = [4303,4304,4305],
    property = [{135,4460,0},{136,446,0},{137,446,0},{138,446,0},{139,446,0}],
    shownumber = 2,
    multiple = [100,120,0],
    cast_money = 0
    };
getRow(26)->
    #wingCfg {
    iD = 26,
    model = [3,3,0],
    icon = [5007,5002,0],
    level = 26,
    exp = 231,
    use_itemID = [4303,4304,4305],
    property = [{135,4657,0},{136,465,0},{137,465,0},{138,465,0},{139,465,0}],
    shownumber = 2,
    multiple = [100,120,0],
    cast_money = 0
    };
getRow(27)->
    #wingCfg {
    iD = 27,
    model = [3,3,0],
    icon = [5007,5002,0],
    level = 27,
    exp = 249,
    use_itemID = [4303,4304,4305],
    property = [{135,4858,0},{136,485,0},{137,485,0},{138,485,0},{139,485,0}],
    shownumber = 2,
    multiple = [100,120,0],
    cast_money = 0
    };
getRow(28)->
    #wingCfg {
    iD = 28,
    model = [3,3,0],
    icon = [5007,5002,0],
    level = 28,
    exp = 266,
    use_itemID = [4303,4304,4305],
    property = [{135,5064,0},{136,506,0},{137,506,0},{138,506,0},{139,506,0}],
    shownumber = 2,
    multiple = [100,120,0],
    cast_money = 0
    };
getRow(29)->
    #wingCfg {
    iD = 29,
    model = [3,3,0],
    icon = [5007,5002,0],
    level = 29,
    exp = 284,
    use_itemID = [4303,4304,4305],
    property = [{135,5272,0},{136,527,0},{137,527,0},{138,527,0},{139,527,0}],
    shownumber = 2,
    multiple = [100,120,0],
    cast_money = 0
    };
getRow(30)->
    #wingCfg {
    iD = 30,
    model = [3,3,0],
    icon = [5007,5002,0],
    level = 30,
    exp = 304,
    use_itemID = [4303,4304,4305],
    property = [{135,5485,0},{136,548,0},{137,548,0},{138,548,0},{139,548,0}],
    shownumber = 2,
    multiple = [100,120,0],
    cast_money = 0
    };
getRow(31)->
    #wingCfg {
    iD = 31,
    model = [3,3,0],
    icon = [5007,5002,0],
    level = 31,
    exp = 324,
    use_itemID = [4303,4304,4305],
    property = [{135,5702,0},{136,570,0},{137,570,0},{138,570,0},{139,570,0}],
    shownumber = 2,
    multiple = [100,120,0],
    cast_money = 0
    };
getRow(32)->
    #wingCfg {
    iD = 32,
    model = [3,3,0],
    icon = [5007,5002,0],
    level = 32,
    exp = 344,
    use_itemID = [4303,4304,4305],
    property = [{135,5922,0},{136,592,0},{137,592,0},{138,592,0},{139,592,0}],
    shownumber = 2,
    multiple = [100,120,0],
    cast_money = 0
    };
getRow(33)->
    #wingCfg {
    iD = 33,
    model = [3,3,0],
    icon = [5007,5002,0],
    level = 33,
    exp = 366,
    use_itemID = [4303,4304,4305],
    property = [{135,6145,0},{136,614,0},{137,614,0},{138,614,0},{139,614,0}],
    shownumber = 2,
    multiple = [100,120,0],
    cast_money = 0
    };
getRow(34)->
    #wingCfg {
    iD = 34,
    model = [3,3,0],
    icon = [5007,5002,0],
    level = 34,
    exp = 388,
    use_itemID = [4303,4304,4305],
    property = [{135,6372,0},{136,637,0},{137,637,0},{138,637,0},{139,637,0}],
    shownumber = 2,
    multiple = [100,120,0],
    cast_money = 0
    };
getRow(35)->
    #wingCfg {
    iD = 35,
    model = [3,3,0],
    icon = [5007,5002,0],
    level = 35,
    exp = 410,
    use_itemID = [4303,4304,4305],
    property = [{135,6603,0},{136,660,0},{137,660,0},{138,660,0},{139,660,0}],
    shownumber = 2,
    multiple = [100,120,0],
    cast_money = 0
    };
getRow(36)->
    #wingCfg {
    iD = 36,
    model = [3,3,0],
    icon = [5007,5002,0],
    level = 36,
    exp = 433,
    use_itemID = [4303,4304,4305],
    property = [{135,6837,0},{136,683,0},{137,683,0},{138,683,0},{139,683,0}],
    shownumber = 2,
    multiple = [100,120,0],
    cast_money = 0
    };
getRow(37)->
    #wingCfg {
    iD = 37,
    model = [4,4,0],
    icon = [5008,5003,0],
    level = 37,
    exp = 458,
    use_itemID = [4303,4304,4305],
    property = [{135,7074,0},{136,707,0},{137,707,0},{138,707,0},{139,707,0}],
    shownumber = 3,
    multiple = [95,105,0],
    cast_money = 0
    };
getRow(38)->
    #wingCfg {
    iD = 38,
    model = [4,4,0],
    icon = [5008,5003,0],
    level = 38,
    exp = 482,
    use_itemID = [4303,4304,4305],
    property = [{135,7315,0},{136,731,0},{137,731,0},{138,731,0},{139,731,0}],
    shownumber = 3,
    multiple = [95,105,0],
    cast_money = 0
    };
getRow(39)->
    #wingCfg {
    iD = 39,
    model = [4,4,0],
    icon = [5008,5003,0],
    level = 39,
    exp = 508,
    use_itemID = [4303,4304,4305],
    property = [{135,7559,0},{136,755,0},{137,755,0},{138,755,0},{139,755,0}],
    shownumber = 3,
    multiple = [95,105,0],
    cast_money = 0
    };
getRow(40)->
    #wingCfg {
    iD = 40,
    model = [4,4,0],
    icon = [5008,5003,0],
    level = 40,
    exp = 534,
    use_itemID = [4303,4304,4305],
    property = [{135,7806,0},{136,780,0},{137,780,0},{138,780,0},{139,780,0}],
    shownumber = 3,
    multiple = [95,105,0],
    cast_money = 0
    };
getRow(41)->
    #wingCfg {
    iD = 41,
    model = [4,4,0],
    icon = [5008,5003,0],
    level = 41,
    exp = 561,
    use_itemID = [4303,4304,4305],
    property = [{135,8057,0},{136,805,0},{137,805,0},{138,805,0},{139,805,0}],
    shownumber = 3,
    multiple = [95,105,0],
    cast_money = 0
    };
getRow(42)->
    #wingCfg {
    iD = 42,
    model = [4,4,0],
    icon = [5008,5003,0],
    level = 42,
    exp = 588,
    use_itemID = [4303,4304,4305],
    property = [{135,8310,0},{136,831,0},{137,831,0},{138,831,0},{139,831,0}],
    shownumber = 3,
    multiple = [95,105,0],
    cast_money = 0
    };
getRow(43)->
    #wingCfg {
    iD = 43,
    model = [4,4,0],
    icon = [5008,5003,0],
    level = 43,
    exp = 616,
    use_itemID = [4303,4304,4305],
    property = [{135,8567,0},{136,856,0},{137,856,0},{138,856,0},{139,856,0}],
    shownumber = 3,
    multiple = [95,105,0],
    cast_money = 0
    };
getRow(44)->
    #wingCfg {
    iD = 44,
    model = [4,4,0],
    icon = [5008,5003,0],
    level = 44,
    exp = 645,
    use_itemID = [4303,4304,4305],
    property = [{135,8827,0},{136,882,0},{137,882,0},{138,882,0},{139,882,0}],
    shownumber = 3,
    multiple = [95,105,0],
    cast_money = 0
    };
getRow(45)->
    #wingCfg {
    iD = 45,
    model = [4,4,0],
    icon = [5008,5003,0],
    level = 45,
    exp = 674,
    use_itemID = [4303,4304,4305],
    property = [{135,9089,0},{136,908,0},{137,908,0},{138,908,0},{139,908,0}],
    shownumber = 3,
    multiple = [95,105,0],
    cast_money = 0
    };
getRow(46)->
    #wingCfg {
    iD = 46,
    model = [4,4,0],
    icon = [5008,5003,0],
    level = 46,
    exp = 705,
    use_itemID = [4303,4304,4305],
    property = [{135,9355,0},{136,935,0},{137,935,0},{138,935,0},{139,935,0}],
    shownumber = 3,
    multiple = [95,105,0],
    cast_money = 0
    };
getRow(47)->
    #wingCfg {
    iD = 47,
    model = [4,4,0],
    icon = [5008,5003,0],
    level = 47,
    exp = 736,
    use_itemID = [4303,4304,4305],
    property = [{135,9624,0},{136,962,0},{137,962,0},{138,962,0},{139,962,0}],
    shownumber = 3,
    multiple = [95,105,0],
    cast_money = 0
    };
getRow(48)->
    #wingCfg {
    iD = 48,
    model = [4,4,0],
    icon = [5008,5003,0],
    level = 48,
    exp = 767,
    use_itemID = [4303,4304,4305],
    property = [{135,9896,0},{136,989,0},{137,989,0},{138,989,0},{139,989,0}],
    shownumber = 3,
    multiple = [95,105,0],
    cast_money = 0
    };
getRow(49)->
    #wingCfg {
    iD = 49,
    model = [5,5,0],
    icon = [5009,5004,0],
    level = 49,
    exp = 800,
    use_itemID = [4303,4304,4305],
    property = [{135,10170,0},{136,1017,0},{137,1017,0},{138,1017,0},{139,1017,0}],
    shownumber = 4,
    multiple = [80,110,0],
    cast_money = 0
    };
getRow(50)->
    #wingCfg {
    iD = 50,
    model = [5,5,0],
    icon = [5009,5004,0],
    level = 50,
    exp = 832,
    use_itemID = [4303,4304,4305],
    property = [{135,10448,0},{136,1044,0},{137,1044,0},{138,1044,0},{139,1044,0}],
    shownumber = 4,
    multiple = [80,110,0],
    cast_money = 0
    };
getRow(51)->
    #wingCfg {
    iD = 51,
    model = [5,5,0],
    icon = [5009,5004,0],
    level = 51,
    exp = 866,
    use_itemID = [4303,4304,4305],
    property = [{135,10728,0},{136,1072,0},{137,1072,0},{138,1072,0},{139,1072,0}],
    shownumber = 4,
    multiple = [80,110,0],
    cast_money = 0
    };
getRow(52)->
    #wingCfg {
    iD = 52,
    model = [5,5,0],
    icon = [5009,5004,0],
    level = 52,
    exp = 901,
    use_itemID = [4303,4304,4305],
    property = [{135,11011,0},{136,1101,0},{137,1101,0},{138,1101,0},{139,1101,0}],
    shownumber = 4,
    multiple = [80,110,0],
    cast_money = 0
    };
getRow(53)->
    #wingCfg {
    iD = 53,
    model = [5,5,0],
    icon = [5009,5004,0],
    level = 53,
    exp = 935,
    use_itemID = [4303,4304,4305],
    property = [{135,11297,0},{136,1129,0},{137,1129,0},{138,1129,0},{139,1129,0}],
    shownumber = 4,
    multiple = [80,110,0],
    cast_money = 0
    };
getRow(54)->
    #wingCfg {
    iD = 54,
    model = [5,5,0],
    icon = [5009,5004,0],
    level = 54,
    exp = 971,
    use_itemID = [4303,4304,4305],
    property = [{135,11586,0},{136,1158,0},{137,1158,0},{138,1158,0},{139,1158,0}],
    shownumber = 4,
    multiple = [80,110,0],
    cast_money = 0
    };
getRow(55)->
    #wingCfg {
    iD = 55,
    model = [5,5,0],
    icon = [5009,5004,0],
    level = 55,
    exp = 1008,
    use_itemID = [4303,4304,4305],
    property = [{135,11877,0},{136,1187,0},{137,1187,0},{138,1187,0},{139,1187,0}],
    shownumber = 4,
    multiple = [80,110,0],
    cast_money = 0
    };
getRow(56)->
    #wingCfg {
    iD = 56,
    model = [5,5,0],
    icon = [5009,5004,0],
    level = 56,
    exp = 1045,
    use_itemID = [4303,4304,4305],
    property = [{135,12171,0},{136,1217,0},{137,1217,0},{138,1217,0},{139,1217,0}],
    shownumber = 4,
    multiple = [80,110,0],
    cast_money = 0
    };
getRow(57)->
    #wingCfg {
    iD = 57,
    model = [5,5,0],
    icon = [5009,5004,0],
    level = 57,
    exp = 1082,
    use_itemID = [4303,4304,4305],
    property = [{135,12468,0},{136,1246,0},{137,1246,0},{138,1246,0},{139,1246,0}],
    shownumber = 4,
    multiple = [80,110,0],
    cast_money = 0
    };
getRow(58)->
    #wingCfg {
    iD = 58,
    model = [5,5,0],
    icon = [5009,5004,0],
    level = 58,
    exp = 1121,
    use_itemID = [4303,4304,4305],
    property = [{135,12768,0},{136,1276,0},{137,1276,0},{138,1276,0},{139,1276,0}],
    shownumber = 4,
    multiple = [80,110,0],
    cast_money = 0
    };
getRow(59)->
    #wingCfg {
    iD = 59,
    model = [5,5,0],
    icon = [5009,5004,0],
    level = 59,
    exp = 1160,
    use_itemID = [4303,4304,4305],
    property = [{135,13070,0},{136,1307,0},{137,1307,0},{138,1307,0},{139,1307,0}],
    shownumber = 4,
    multiple = [80,110,0],
    cast_money = 0
    };
getRow(60)->
    #wingCfg {
    iD = 60,
    model = [5,5,0],
    icon = [5009,5004,0],
    level = 60,
    exp = -1,
    use_itemID = [4303,4304,4305],
    property = [{135,13375,0},{136,1337,0},{137,1337,0},{138,1337,0},{139,1337,0}],
    shownumber = 4,
    multiple = [80,110,0],
    cast_money = 0
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
    {60}
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
    60
    ].

