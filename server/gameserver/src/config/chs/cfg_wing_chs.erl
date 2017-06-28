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
    property = [{135,374,0},{136,37,0},{137,37,0},{138,37,0},{139,37,0}],
    shownumber = 0,
    multiple = [150,150,0],
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
    property = [{135,581,0},{136,58,0},{137,58,0},{138,58,0},{139,58,0}],
    shownumber = 0,
    multiple = [150,150,0],
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
    property = [{135,817,0},{136,81,0},{137,81,0},{138,81,0},{139,81,0}],
    shownumber = 0,
    multiple = [150,150,0],
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
    property = [{135,1067,0},{136,106,0},{137,106,0},{138,106,0},{139,106,0}],
    shownumber = 0,
    multiple = [150,150,0],
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
    property = [{135,1325,0},{136,132,0},{137,132,0},{138,132,0},{139,132,0}],
    shownumber = 0,
    multiple = [150,150,0],
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
    property = [{135,1589,0},{136,158,0},{137,158,0},{138,158,0},{139,158,0}],
    shownumber = 0,
    multiple = [150,150,0],
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
    property = [{135,1859,0},{136,185,0},{137,185,0},{138,185,0},{139,185,0}],
    shownumber = 0,
    multiple = [150,150,0],
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
    property = [{135,2133,0},{136,213,0},{137,213,0},{138,213,0},{139,213,0}],
    shownumber = 0,
    multiple = [150,150,0],
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
    property = [{135,2412,0},{136,241,0},{137,241,0},{138,241,0},{139,241,0}],
    shownumber = 0,
    multiple = [150,150,0],
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
    property = [{135,2693,0},{136,269,0},{137,269,0},{138,269,0},{139,269,0}],
    shownumber = 0,
    multiple = [150,150,0],
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
    property = [{135,2978,0},{136,297,0},{137,297,0},{138,297,0},{139,297,0}],
    shownumber = 0,
    multiple = [150,150,0],
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
    property = [{135,3266,0},{136,326,0},{137,326,0},{138,326,0},{139,326,0}],
    shownumber = 0,
    multiple = [150,150,0],
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
    property = [{135,3557,0},{136,355,0},{137,355,0},{138,355,0},{139,355,0}],
    shownumber = 1,
    multiple = [100,120,0],
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
    property = [{135,3850,0},{136,385,0},{137,385,0},{138,385,0},{139,385,0}],
    shownumber = 1,
    multiple = [100,120,0],
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
    property = [{135,4145,0},{136,414,0},{137,414,0},{138,414,0},{139,414,0}],
    shownumber = 1,
    multiple = [100,120,0],
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
    property = [{135,4442,0},{136,444,0},{137,444,0},{138,444,0},{139,444,0}],
    shownumber = 1,
    multiple = [100,120,0],
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
    property = [{135,4742,0},{136,474,0},{137,474,0},{138,474,0},{139,474,0}],
    shownumber = 1,
    multiple = [100,120,0],
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
    property = [{135,5043,0},{136,504,0},{137,504,0},{138,504,0},{139,504,0}],
    shownumber = 1,
    multiple = [100,120,0],
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
    property = [{135,5346,0},{136,534,0},{137,534,0},{138,534,0},{139,534,0}],
    shownumber = 1,
    multiple = [100,120,0],
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
    property = [{135,5650,0},{136,565,0},{137,565,0},{138,565,0},{139,565,0}],
    shownumber = 1,
    multiple = [100,120,0],
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
    property = [{135,5957,0},{136,595,0},{137,595,0},{138,595,0},{139,595,0}],
    shownumber = 1,
    multiple = [100,120,0],
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
    property = [{135,6264,0},{136,626,0},{137,626,0},{138,626,0},{139,626,0}],
    shownumber = 1,
    multiple = [100,120,0],
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
    property = [{135,6574,0},{136,657,0},{137,657,0},{138,657,0},{139,657,0}],
    shownumber = 1,
    multiple = [100,120,0],
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
    property = [{135,6884,0},{136,688,0},{137,688,0},{138,688,0},{139,688,0}],
    shownumber = 1,
    multiple = [100,120,0],
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
    property = [{135,7196,0},{136,719,0},{137,719,0},{138,719,0},{139,719,0}],
    shownumber = 2,
    multiple = [80,100,0],
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
    property = [{135,7510,0},{136,751,0},{137,751,0},{138,751,0},{139,751,0}],
    shownumber = 2,
    multiple = [80,100,0],
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
    property = [{135,7824,0},{136,782,0},{137,782,0},{138,782,0},{139,782,0}],
    shownumber = 2,
    multiple = [80,100,0],
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
    property = [{135,8140,0},{136,814,0},{137,814,0},{138,814,0},{139,814,0}],
    shownumber = 2,
    multiple = [80,100,0],
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
    property = [{135,8457,0},{136,845,0},{137,845,0},{138,845,0},{139,845,0}],
    shownumber = 2,
    multiple = [80,100,0],
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
    property = [{135,8775,0},{136,877,0},{137,877,0},{138,877,0},{139,877,0}],
    shownumber = 2,
    multiple = [80,100,0],
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
    property = [{135,9095,0},{136,909,0},{137,909,0},{138,909,0},{139,909,0}],
    shownumber = 2,
    multiple = [80,100,0],
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
    property = [{135,9415,0},{136,941,0},{137,941,0},{138,941,0},{139,941,0}],
    shownumber = 2,
    multiple = [80,100,0],
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
    property = [{135,9736,0},{136,973,0},{137,973,0},{138,973,0},{139,973,0}],
    shownumber = 2,
    multiple = [80,100,0],
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
    property = [{135,10058,0},{136,1005,0},{137,1005,0},{138,1005,0},{139,1005,0}],
    shownumber = 2,
    multiple = [80,100,0],
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
    property = [{135,10382,0},{136,1038,0},{137,1038,0},{138,1038,0},{139,1038,0}],
    shownumber = 2,
    multiple = [80,100,0],
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
    property = [{135,10706,0},{136,1070,0},{137,1070,0},{138,1070,0},{139,1070,0}],
    shownumber = 2,
    multiple = [80,100,0],
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
    property = [{135,11031,0},{136,1103,0},{137,1103,0},{138,1103,0},{139,1103,0}],
    shownumber = 3,
    multiple = [75,85,0],
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
    property = [{135,11357,0},{136,1135,0},{137,1135,0},{138,1135,0},{139,1135,0}],
    shownumber = 3,
    multiple = [75,85,0],
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
    property = [{135,11684,0},{136,1168,0},{137,1168,0},{138,1168,0},{139,1168,0}],
    shownumber = 3,
    multiple = [75,85,0],
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
    property = [{135,12012,0},{136,1201,0},{137,1201,0},{138,1201,0},{139,1201,0}],
    shownumber = 3,
    multiple = [75,85,0],
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
    property = [{135,12341,0},{136,1234,0},{137,1234,0},{138,1234,0},{139,1234,0}],
    shownumber = 3,
    multiple = [75,85,0],
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
    property = [{135,12670,0},{136,1267,0},{137,1267,0},{138,1267,0},{139,1267,0}],
    shownumber = 3,
    multiple = [75,85,0],
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
    property = [{135,13001,0},{136,1300,0},{137,1300,0},{138,1300,0},{139,1300,0}],
    shownumber = 3,
    multiple = [75,85,0],
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
    property = [{135,13332,0},{136,1333,0},{137,1333,0},{138,1333,0},{139,1333,0}],
    shownumber = 3,
    multiple = [75,85,0],
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
    property = [{135,13663,0},{136,1366,0},{137,1366,0},{138,1366,0},{139,1366,0}],
    shownumber = 3,
    multiple = [75,85,0],
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
    property = [{135,13996,0},{136,1399,0},{137,1399,0},{138,1399,0},{139,1399,0}],
    shownumber = 3,
    multiple = [75,85,0],
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
    property = [{135,14329,0},{136,1432,0},{137,1432,0},{138,1432,0},{139,1432,0}],
    shownumber = 3,
    multiple = [75,85,0],
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
    property = [{135,14664,0},{136,1466,0},{137,1466,0},{138,1466,0},{139,1466,0}],
    shownumber = 3,
    multiple = [75,85,0],
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
    property = [{135,14998,0},{136,1499,0},{137,1499,0},{138,1499,0},{139,1499,0}],
    shownumber = 4,
    multiple = [65,90,0],
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
    property = [{135,15334,0},{136,1533,0},{137,1533,0},{138,1533,0},{139,1533,0}],
    shownumber = 4,
    multiple = [65,90,0],
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
    property = [{135,15670,0},{136,1567,0},{137,1567,0},{138,1567,0},{139,1567,0}],
    shownumber = 4,
    multiple = [65,90,0],
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
    property = [{135,16007,0},{136,1600,0},{137,1600,0},{138,1600,0},{139,1600,0}],
    shownumber = 4,
    multiple = [65,90,0],
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
    property = [{135,16344,0},{136,1634,0},{137,1634,0},{138,1634,0},{139,1634,0}],
    shownumber = 4,
    multiple = [65,90,0],
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
    property = [{135,16683,0},{136,1668,0},{137,1668,0},{138,1668,0},{139,1668,0}],
    shownumber = 4,
    multiple = [65,90,0],
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
    property = [{135,17021,0},{136,1702,0},{137,1702,0},{138,1702,0},{139,1702,0}],
    shownumber = 4,
    multiple = [65,90,0],
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
    property = [{135,17361,0},{136,1736,0},{137,1736,0},{138,1736,0},{139,1736,0}],
    shownumber = 4,
    multiple = [65,90,0],
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
    property = [{135,17701,0},{136,1770,0},{137,1770,0},{138,1770,0},{139,1770,0}],
    shownumber = 4,
    multiple = [65,90,0],
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
    property = [{135,18041,0},{136,1804,0},{137,1804,0},{138,1804,0},{139,1804,0}],
    shownumber = 4,
    multiple = [65,90,0],
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
    property = [{135,18383,0},{136,1838,0},{137,1838,0},{138,1838,0},{139,1838,0}],
    shownumber = 4,
    multiple = [65,90,0],
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
    property = [{135,18725,0},{136,1872,0},{137,1872,0},{138,1872,0},{139,1872,0}],
    shownumber = 4,
    multiple = [65,90,0],
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

