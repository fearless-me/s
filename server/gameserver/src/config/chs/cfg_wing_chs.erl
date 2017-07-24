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
    exp = 4,
    use_itemID = [4303,4304,4305],
    property = [{135,1337,0},{136,133,0},{137,133,0},{138,133,0},{139,133,0}],
    shownumber = "",
    multiple = [150,150,0],
    cast_money = 0
    };
getRow(2)->
    #wingCfg {
    iD = 2,
    model = [1,1,0],
    icon = [5005,5000,0],
    level = 2,
    exp = 6,
    use_itemID = [4303,4304,4305],
    property = [{135,2076,0},{136,207,0},{137,207,0},{138,207,0},{139,207,0}],
    shownumber = "",
    multiple = [150,150,0],
    cast_money = 0
    };
getRow(3)->
    #wingCfg {
    iD = 3,
    model = [1,1,0],
    icon = [5005,5000,0],
    level = 3,
    exp = 8,
    use_itemID = [4303,4304,4305],
    property = [{135,2921,0},{136,292,0},{137,292,0},{138,292,0},{139,292,0}],
    shownumber = "",
    multiple = [150,150,0],
    cast_money = 0
    };
getRow(4)->
    #wingCfg {
    iD = 4,
    model = [1,1,0],
    icon = [5005,5000,0],
    level = 4,
    exp = 10,
    use_itemID = [4303,4304,4305],
    property = [{135,3811,0},{136,381,0},{137,381,0},{138,381,0},{139,381,0}],
    shownumber = "",
    multiple = [150,150,0],
    cast_money = 0
    };
getRow(5)->
    #wingCfg {
    iD = 5,
    model = [1,1,0],
    icon = [5005,5000,0],
    level = 5,
    exp = 12,
    use_itemID = [4303,4304,4305],
    property = [{135,4732,0},{136,473,0},{137,473,0},{138,473,0},{139,473,0}],
    shownumber = "",
    multiple = [150,150,0],
    cast_money = 0
    };
getRow(6)->
    #wingCfg {
    iD = 6,
    model = [1,1,0],
    icon = [5005,5000,0],
    level = 6,
    exp = 15,
    use_itemID = [4303,4304,4305],
    property = [{135,5676,0},{136,567,0},{137,567,0},{138,567,0},{139,567,0}],
    shownumber = "",
    multiple = [150,150,0],
    cast_money = 0
    };
getRow(7)->
    #wingCfg {
    iD = 7,
    model = [1,1,0],
    icon = [5005,5000,0],
    level = 7,
    exp = 18,
    use_itemID = [4303,4304,4305],
    property = [{135,6640,0},{136,664,0},{137,664,0},{138,664,0},{139,664,0}],
    shownumber = "",
    multiple = [150,150,0],
    cast_money = 0
    };
getRow(8)->
    #wingCfg {
    iD = 8,
    model = [1,1,0],
    icon = [5005,5000,0],
    level = 8,
    exp = 21,
    use_itemID = [4303,4304,4305],
    property = [{135,7620,0},{136,762,0},{137,762,0},{138,762,0},{139,762,0}],
    shownumber = "",
    multiple = [150,150,0],
    cast_money = 0
    };
getRow(9)->
    #wingCfg {
    iD = 9,
    model = [1,1,0],
    icon = [5005,5000,0],
    level = 9,
    exp = 24,
    use_itemID = [4303,4304,4305],
    property = [{135,8614,0},{136,861,0},{137,861,0},{138,861,0},{139,861,0}],
    shownumber = "",
    multiple = [150,150,0],
    cast_money = 0
    };
getRow(10)->
    #wingCfg {
    iD = 10,
    model = [1,1,0],
    icon = [5005,5000,0],
    level = 10,
    exp = 27,
    use_itemID = [4303,4304,4305],
    property = [{135,9621,0},{136,962,0},{137,962,0},{138,962,0},{139,962,0}],
    shownumber = "",
    multiple = [150,150,0],
    cast_money = 0
    };
getRow(11)->
    #wingCfg {
    iD = 11,
    model = [1,1,0],
    icon = [5005,5000,0],
    level = 11,
    exp = 30,
    use_itemID = [4303,4304,4305],
    property = [{135,10638,0},{136,1063,0},{137,1063,0},{138,1063,0},{139,1063,0}],
    shownumber = "",
    multiple = [150,150,0],
    cast_money = 0
    };
getRow(12)->
    #wingCfg {
    iD = 12,
    model = [1,1,0],
    icon = [5005,5000,0],
    level = 12,
    exp = 34,
    use_itemID = [4303,4304,4305],
    property = [{135,11667,0},{136,1166,0},{137,1166,0},{138,1166,0},{139,1166,0}],
    shownumber = "",
    multiple = [150,150,0],
    cast_money = 0
    };
getRow(13)->
    #wingCfg {
    iD = 13,
    model = [2,2,0],
    icon = [5006,5001,0],
    level = 13,
    exp = 38,
    use_itemID = [4303,4304,4305],
    property = [{135,12704,0},{136,1270,0},{137,1270,0},{138,1270,0},{139,1270,0}],
    shownumber = "1",
    multiple = [100,120,0],
    cast_money = 0
    };
getRow(14)->
    #wingCfg {
    iD = 14,
    model = [2,2,0],
    icon = [5006,5001,0],
    level = 14,
    exp = 42,
    use_itemID = [4303,4304,4305],
    property = [{135,13750,0},{136,1375,0},{137,1375,0},{138,1375,0},{139,1375,0}],
    shownumber = "1",
    multiple = [100,120,0],
    cast_money = 0
    };
getRow(15)->
    #wingCfg {
    iD = 15,
    model = [2,2,0],
    icon = [5006,5001,0],
    level = 15,
    exp = 46,
    use_itemID = [4303,4304,4305],
    property = [{135,14805,0},{136,1480,0},{137,1480,0},{138,1480,0},{139,1480,0}],
    shownumber = "1",
    multiple = [100,120,0],
    cast_money = 0
    };
getRow(16)->
    #wingCfg {
    iD = 16,
    model = [2,2,0],
    icon = [5006,5001,0],
    level = 16,
    exp = 50,
    use_itemID = [4303,4304,4305],
    property = [{135,15867,0},{136,1586,0},{137,1586,0},{138,1586,0},{139,1586,0}],
    shownumber = "1",
    multiple = [100,120,0],
    cast_money = 0
    };
getRow(17)->
    #wingCfg {
    iD = 17,
    model = [2,2,0],
    icon = [5006,5001,0],
    level = 17,
    exp = 54,
    use_itemID = [4303,4304,4305],
    property = [{135,16936,0},{136,1693,0},{137,1693,0},{138,1693,0},{139,1693,0}],
    shownumber = "1",
    multiple = [100,120,0],
    cast_money = 0
    };
getRow(18)->
    #wingCfg {
    iD = 18,
    model = [2,2,0],
    icon = [5006,5001,0],
    level = 18,
    exp = 58,
    use_itemID = [4303,4304,4305],
    property = [{135,18011,0},{136,1801,0},{137,1801,0},{138,1801,0},{139,1801,0}],
    shownumber = "1",
    multiple = [100,120,0],
    cast_money = 0
    };
getRow(19)->
    #wingCfg {
    iD = 19,
    model = [2,2,0],
    icon = [5006,5001,0],
    level = 19,
    exp = 62,
    use_itemID = [4303,4304,4305],
    property = [{135,19093,0},{136,1909,0},{137,1909,0},{138,1909,0},{139,1909,0}],
    shownumber = "1",
    multiple = [100,120,0],
    cast_money = 0
    };
getRow(20)->
    #wingCfg {
    iD = 20,
    model = [2,2,0],
    icon = [5006,5001,0],
    level = 20,
    exp = 67,
    use_itemID = [4303,4304,4305],
    property = [{135,20181,0},{136,2018,0},{137,2018,0},{138,2018,0},{139,2018,0}],
    shownumber = "1",
    multiple = [100,120,0],
    cast_money = 0
    };
getRow(21)->
    #wingCfg {
    iD = 21,
    model = [2,2,0],
    icon = [5006,5001,0],
    level = 21,
    exp = 72,
    use_itemID = [4303,4304,4305],
    property = [{135,21275,0},{136,2127,0},{137,2127,0},{138,2127,0},{139,2127,0}],
    shownumber = "1",
    multiple = [100,120,0],
    cast_money = 0
    };
getRow(22)->
    #wingCfg {
    iD = 22,
    model = [2,2,0],
    icon = [5006,5001,0],
    level = 22,
    exp = 77,
    use_itemID = [4303,4304,4305],
    property = [{135,22374,0},{136,2237,0},{137,2237,0},{138,2237,0},{139,2237,0}],
    shownumber = "1",
    multiple = [100,120,0],
    cast_money = 0
    };
getRow(23)->
    #wingCfg {
    iD = 23,
    model = [2,2,0],
    icon = [5006,5001,0],
    level = 23,
    exp = 82,
    use_itemID = [4303,4304,4305],
    property = [{135,23479,0},{136,2347,0},{137,2347,0},{138,2347,0},{139,2347,0}],
    shownumber = "1",
    multiple = [100,120,0],
    cast_money = 0
    };
getRow(24)->
    #wingCfg {
    iD = 24,
    model = [2,2,0],
    icon = [5006,5001,0],
    level = 24,
    exp = 87,
    use_itemID = [4303,4304,4305],
    property = [{135,24589,0},{136,2458,0},{137,2458,0},{138,2458,0},{139,2458,0}],
    shownumber = "1",
    multiple = [100,120,0],
    cast_money = 0
    };
getRow(25)->
    #wingCfg {
    iD = 25,
    model = [3,3,0],
    icon = [5007,5002,0],
    level = 25,
    exp = 93,
    use_itemID = [4303,4304,4305],
    property = [{135,25703,0},{136,2570,0},{137,2570,0},{138,2570,0},{139,2570,0}],
    shownumber = "2",
    multiple = [80,100,0],
    cast_money = 0
    };
getRow(26)->
    #wingCfg {
    iD = 26,
    model = [3,3,0],
    icon = [5007,5002,0],
    level = 26,
    exp = 99,
    use_itemID = [4303,4304,4305],
    property = [{135,26822,0},{136,2682,0},{137,2682,0},{138,2682,0},{139,2682,0}],
    shownumber = "2",
    multiple = [80,100,0],
    cast_money = 0
    };
getRow(27)->
    #wingCfg {
    iD = 27,
    model = [3,3,0],
    icon = [5007,5002,0],
    level = 27,
    exp = 105,
    use_itemID = [4303,4304,4305],
    property = [{135,27946,0},{136,2794,0},{137,2794,0},{138,2794,0},{139,2794,0}],
    shownumber = "2",
    multiple = [80,100,0],
    cast_money = 0
    };
getRow(28)->
    #wingCfg {
    iD = 28,
    model = [3,3,0],
    icon = [5007,5002,0],
    level = 28,
    exp = 111,
    use_itemID = [4303,4304,4305],
    property = [{135,29074,0},{136,2907,0},{137,2907,0},{138,2907,0},{139,2907,0}],
    shownumber = "2",
    multiple = [80,100,0],
    cast_money = 0
    };
getRow(29)->
    #wingCfg {
    iD = 29,
    model = [3,3,0],
    icon = [5007,5002,0],
    level = 29,
    exp = 117,
    use_itemID = [4303,4304,4305],
    property = [{135,30206,0},{136,3020,0},{137,3020,0},{138,3020,0},{139,3020,0}],
    shownumber = "2",
    multiple = [80,100,0],
    cast_money = 0
    };
getRow(30)->
    #wingCfg {
    iD = 30,
    model = [3,3,0],
    icon = [5007,5002,0],
    level = 30,
    exp = 125,
    use_itemID = [4303,4304,4305],
    property = [{135,31342,0},{136,3134,0},{137,3134,0},{138,3134,0},{139,3134,0}],
    shownumber = "2",
    multiple = [80,100,0],
    cast_money = 0
    };
getRow(31)->
    #wingCfg {
    iD = 31,
    model = [3,3,0],
    icon = [5007,5002,0],
    level = 31,
    exp = 133,
    use_itemID = [4303,4304,4305],
    property = [{135,32482,0},{136,3248,0},{137,3248,0},{138,3248,0},{139,3248,0}],
    shownumber = "2",
    multiple = [80,100,0],
    cast_money = 0
    };
getRow(32)->
    #wingCfg {
    iD = 32,
    model = [3,3,0],
    icon = [5007,5002,0],
    level = 32,
    exp = 141,
    use_itemID = [4303,4304,4305],
    property = [{135,33626,0},{136,3362,0},{137,3362,0},{138,3362,0},{139,3362,0}],
    shownumber = "2",
    multiple = [80,100,0],
    cast_money = 0
    };
getRow(33)->
    #wingCfg {
    iD = 33,
    model = [3,3,0],
    icon = [5007,5002,0],
    level = 33,
    exp = 149,
    use_itemID = [4303,4304,4305],
    property = [{135,34773,0},{136,3477,0},{137,3477,0},{138,3477,0},{139,3477,0}],
    shownumber = "2",
    multiple = [80,100,0],
    cast_money = 0
    };
getRow(34)->
    #wingCfg {
    iD = 34,
    model = [3,3,0],
    icon = [5007,5002,0],
    level = 34,
    exp = 157,
    use_itemID = [4303,4304,4305],
    property = [{135,35924,0},{136,3592,0},{137,3592,0},{138,3592,0},{139,3592,0}],
    shownumber = "2",
    multiple = [80,100,0],
    cast_money = 0
    };
getRow(35)->
    #wingCfg {
    iD = 35,
    model = [3,3,0],
    icon = [5007,5002,0],
    level = 35,
    exp = 165,
    use_itemID = [4303,4304,4305],
    property = [{135,37079,0},{136,3707,0},{137,3707,0},{138,3707,0},{139,3707,0}],
    shownumber = "2",
    multiple = [80,100,0],
    cast_money = 0
    };
getRow(36)->
    #wingCfg {
    iD = 36,
    model = [3,3,0],
    icon = [5007,5002,0],
    level = 36,
    exp = 173,
    use_itemID = [4303,4304,4305],
    property = [{135,38237,0},{136,3823,0},{137,3823,0},{138,3823,0},{139,3823,0}],
    shownumber = "2",
    multiple = [80,100,0],
    cast_money = 0
    };
getRow(37)->
    #wingCfg {
    iD = 37,
    model = [4,4,0],
    icon = [5008,5003,0],
    level = 37,
    exp = 181,
    use_itemID = [4303,4304,4305],
    property = [{135,39398,0},{136,3939,0},{137,3939,0},{138,3939,0},{139,3939,0}],
    shownumber = "3",
    multiple = [75,85,0],
    cast_money = 0
    };
getRow(38)->
    #wingCfg {
    iD = 38,
    model = [4,4,0],
    icon = [5008,5003,0],
    level = 38,
    exp = 189,
    use_itemID = [4303,4304,4305],
    property = [{135,40563,0},{136,4056,0},{137,4056,0},{138,4056,0},{139,4056,0}],
    shownumber = "3",
    multiple = [75,85,0],
    cast_money = 0
    };
getRow(39)->
    #wingCfg {
    iD = 39,
    model = [4,4,0],
    icon = [5008,5003,0],
    level = 39,
    exp = 197,
    use_itemID = [4303,4304,4305],
    property = [{135,41731,0},{136,4173,0},{137,4173,0},{138,4173,0},{139,4173,0}],
    shownumber = "3",
    multiple = [75,85,0],
    cast_money = 0
    };
getRow(40)->
    #wingCfg {
    iD = 40,
    model = [4,4,0],
    icon = [5008,5003,0],
    level = 40,
    exp = 207,
    use_itemID = [4303,4304,4305],
    property = [{135,42902,0},{136,4290,0},{137,4290,0},{138,4290,0},{139,4290,0}],
    shownumber = "3",
    multiple = [75,85,0],
    cast_money = 0
    };
getRow(41)->
    #wingCfg {
    iD = 41,
    model = [4,4,0],
    icon = [5008,5003,0],
    level = 41,
    exp = 217,
    use_itemID = [4303,4304,4305],
    property = [{135,44075,0},{136,4407,0},{137,4407,0},{138,4407,0},{139,4407,0}],
    shownumber = "3",
    multiple = [75,85,0],
    cast_money = 0
    };
getRow(42)->
    #wingCfg {
    iD = 42,
    model = [4,4,0],
    icon = [5008,5003,0],
    level = 42,
    exp = 227,
    use_itemID = [4303,4304,4305],
    property = [{135,45252,0},{136,4525,0},{137,4525,0},{138,4525,0},{139,4525,0}],
    shownumber = "3",
    multiple = [75,85,0],
    cast_money = 0
    };
getRow(43)->
    #wingCfg {
    iD = 43,
    model = [4,4,0],
    icon = [5008,5003,0],
    level = 43,
    exp = 237,
    use_itemID = [4303,4304,4305],
    property = [{135,46432,0},{136,4643,0},{137,4643,0},{138,4643,0},{139,4643,0}],
    shownumber = "3",
    multiple = [75,85,0],
    cast_money = 0
    };
getRow(44)->
    #wingCfg {
    iD = 44,
    model = [4,4,0],
    icon = [5008,5003,0],
    level = 44,
    exp = 247,
    use_itemID = [4303,4304,4305],
    property = [{135,47614,0},{136,4761,0},{137,4761,0},{138,4761,0},{139,4761,0}],
    shownumber = "3",
    multiple = [75,85,0],
    cast_money = 0
    };
getRow(45)->
    #wingCfg {
    iD = 45,
    model = [4,4,0],
    icon = [5008,5003,0],
    level = 45,
    exp = 257,
    use_itemID = [4303,4304,4305],
    property = [{135,48799,0},{136,4879,0},{137,4879,0},{138,4879,0},{139,4879,0}],
    shownumber = "3",
    multiple = [75,85,0],
    cast_money = 0
    };
getRow(46)->
    #wingCfg {
    iD = 46,
    model = [4,4,0],
    icon = [5008,5003,0],
    level = 46,
    exp = 267,
    use_itemID = [4303,4304,4305],
    property = [{135,49987,0},{136,4998,0},{137,4998,0},{138,4998,0},{139,4998,0}],
    shownumber = "3",
    multiple = [75,85,0],
    cast_money = 0
    };
getRow(47)->
    #wingCfg {
    iD = 47,
    model = [4,4,0],
    icon = [5008,5003,0],
    level = 47,
    exp = 277,
    use_itemID = [4303,4304,4305],
    property = [{135,51178,0},{136,5117,0},{137,5117,0},{138,5117,0},{139,5117,0}],
    shownumber = "3",
    multiple = [75,85,0],
    cast_money = 0
    };
getRow(48)->
    #wingCfg {
    iD = 48,
    model = [4,4,0],
    icon = [5008,5003,0],
    level = 48,
    exp = 287,
    use_itemID = [4303,4304,4305],
    property = [{135,52371,0},{136,5237,0},{137,5237,0},{138,5237,0},{139,5237,0}],
    shownumber = "3",
    multiple = [75,85,0],
    cast_money = 0
    };
getRow(49)->
    #wingCfg {
    iD = 49,
    model = [5,5,0],
    icon = [5009,5004,0],
    level = 49,
    exp = 297,
    use_itemID = [4303,4304,4305],
    property = [{135,53567,0},{136,5356,0},{137,5356,0},{138,5356,0},{139,5356,0}],
    shownumber = "4",
    multiple = [65,90,0],
    cast_money = 0
    };
getRow(50)->
    #wingCfg {
    iD = 50,
    model = [5,5,0],
    icon = [5009,5004,0],
    level = 50,
    exp = 310,
    use_itemID = [4303,4304,4305],
    property = [{135,54765,0},{136,5476,0},{137,5476,0},{138,5476,0},{139,5476,0}],
    shownumber = "4",
    multiple = [65,90,0],
    cast_money = 0
    };
getRow(51)->
    #wingCfg {
    iD = 51,
    model = [5,5,0],
    icon = [5009,5004,0],
    level = 51,
    exp = 323,
    use_itemID = [4303,4304,4305],
    property = [{135,55966,0},{136,5596,0},{137,5596,0},{138,5596,0},{139,5596,0}],
    shownumber = "4",
    multiple = [65,90,0],
    cast_money = 0
    };
getRow(52)->
    #wingCfg {
    iD = 52,
    model = [5,5,0],
    icon = [5009,5004,0],
    level = 52,
    exp = 336,
    use_itemID = [4303,4304,4305],
    property = [{135,57169,0},{136,5716,0},{137,5716,0},{138,5716,0},{139,5716,0}],
    shownumber = "4",
    multiple = [65,90,0],
    cast_money = 0
    };
getRow(53)->
    #wingCfg {
    iD = 53,
    model = [5,5,0],
    icon = [5009,5004,0],
    level = 53,
    exp = 349,
    use_itemID = [4303,4304,4305],
    property = [{135,58374,0},{136,5837,0},{137,5837,0},{138,5837,0},{139,5837,0}],
    shownumber = "4",
    multiple = [65,90,0],
    cast_money = 0
    };
getRow(54)->
    #wingCfg {
    iD = 54,
    model = [5,5,0],
    icon = [5009,5004,0],
    level = 54,
    exp = 362,
    use_itemID = [4303,4304,4305],
    property = [{135,59582,0},{136,5958,0},{137,5958,0},{138,5958,0},{139,5958,0}],
    shownumber = "4",
    multiple = [65,90,0],
    cast_money = 0
    };
getRow(55)->
    #wingCfg {
    iD = 55,
    model = [5,5,0],
    icon = [5009,5004,0],
    level = 55,
    exp = 375,
    use_itemID = [4303,4304,4305],
    property = [{135,60792,0},{136,6079,0},{137,6079,0},{138,6079,0},{139,6079,0}],
    shownumber = "4",
    multiple = [65,90,0],
    cast_money = 0
    };
getRow(56)->
    #wingCfg {
    iD = 56,
    model = [5,5,0],
    icon = [5009,5004,0],
    level = 56,
    exp = 388,
    use_itemID = [4303,4304,4305],
    property = [{135,62004,0},{136,6200,0},{137,6200,0},{138,6200,0},{139,6200,0}],
    shownumber = "4",
    multiple = [65,90,0],
    cast_money = 0
    };
getRow(57)->
    #wingCfg {
    iD = 57,
    model = [5,5,0],
    icon = [5009,5004,0],
    level = 57,
    exp = 401,
    use_itemID = [4303,4304,4305],
    property = [{135,63218,0},{136,6321,0},{137,6321,0},{138,6321,0},{139,6321,0}],
    shownumber = "4",
    multiple = [65,90,0],
    cast_money = 0
    };
getRow(58)->
    #wingCfg {
    iD = 58,
    model = [5,5,0],
    icon = [5009,5004,0],
    level = 58,
    exp = 414,
    use_itemID = [4303,4304,4305],
    property = [{135,64435,0},{136,6443,0},{137,6443,0},{138,6443,0},{139,6443,0}],
    shownumber = "4",
    multiple = [65,90,0],
    cast_money = 0
    };
getRow(59)->
    #wingCfg {
    iD = 59,
    model = [5,5,0],
    icon = [5009,5004,0],
    level = 59,
    exp = 427,
    use_itemID = [4303,4304,4305],
    property = [{135,65654,0},{136,6565,0},{137,6565,0},{138,6565,0},{139,6565,0}],
    shownumber = "4",
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
    property = [{135,66875,0},{136,6687,0},{137,6687,0},{138,6687,0},{139,6687,0}],
    shownumber = "4",
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

