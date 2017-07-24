%% coding: latin-1
%%: 实现
-module(cfg_drop_package_chs).
-compile(export_all).
-include("cfg_drop_package.hrl").
-include("logger.hrl").

getRow(1)->
    #drop_packageCfg {
    packageId = 1,
    itemId = 14,
    min = 1,
    max = 5,
    weight = 10000
    };
getRow(2)->
    #drop_packageCfg {
    packageId = 1,
    itemId = 15,
    min = 1,
    max = 5,
    weight = 10000
    };
getRow(3)->
    #drop_packageCfg {
    packageId = 2,
    itemId = 16,
    min = 1,
    max = 5,
    weight = 10000
    };
getRow(4)->
    #drop_packageCfg {
    packageId = 2,
    itemId = 17,
    min = 1,
    max = 5,
    weight = 10000
    };
getRow(5)->
    #drop_packageCfg {
    packageId = 11,
    itemId = 21000,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(6)->
    #drop_packageCfg {
    packageId = 11,
    itemId = 21050,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(7)->
    #drop_packageCfg {
    packageId = 11,
    itemId = 21100,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(8)->
    #drop_packageCfg {
    packageId = 12,
    itemId = 21001,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(9)->
    #drop_packageCfg {
    packageId = 12,
    itemId = 21051,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(10)->
    #drop_packageCfg {
    packageId = 12,
    itemId = 21101,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(11)->
    #drop_packageCfg {
    packageId = 13,
    itemId = 21002,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(12)->
    #drop_packageCfg {
    packageId = 13,
    itemId = 21052,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(13)->
    #drop_packageCfg {
    packageId = 13,
    itemId = 21102,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(14)->
    #drop_packageCfg {
    packageId = 14,
    itemId = 21003,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(15)->
    #drop_packageCfg {
    packageId = 14,
    itemId = 21053,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(16)->
    #drop_packageCfg {
    packageId = 14,
    itemId = 21103,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(17)->
    #drop_packageCfg {
    packageId = 15,
    itemId = 21004,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(18)->
    #drop_packageCfg {
    packageId = 15,
    itemId = 21054,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(19)->
    #drop_packageCfg {
    packageId = 15,
    itemId = 21104,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(20)->
    #drop_packageCfg {
    packageId = 16,
    itemId = 21005,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(21)->
    #drop_packageCfg {
    packageId = 16,
    itemId = 21055,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(22)->
    #drop_packageCfg {
    packageId = 16,
    itemId = 21105,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(23)->
    #drop_packageCfg {
    packageId = 17,
    itemId = 21006,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(24)->
    #drop_packageCfg {
    packageId = 17,
    itemId = 21056,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(25)->
    #drop_packageCfg {
    packageId = 17,
    itemId = 21106,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(26)->
    #drop_packageCfg {
    packageId = 18,
    itemId = 21007,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(27)->
    #drop_packageCfg {
    packageId = 18,
    itemId = 21057,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(28)->
    #drop_packageCfg {
    packageId = 18,
    itemId = 21107,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(29)->
    #drop_packageCfg {
    packageId = 19,
    itemId = 21008,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(30)->
    #drop_packageCfg {
    packageId = 19,
    itemId = 21058,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(31)->
    #drop_packageCfg {
    packageId = 19,
    itemId = 21108,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(32)->
    #drop_packageCfg {
    packageId = 20,
    itemId = 21009,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(33)->
    #drop_packageCfg {
    packageId = 20,
    itemId = 21059,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(34)->
    #drop_packageCfg {
    packageId = 20,
    itemId = 21109,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(35)->
    #drop_packageCfg {
    packageId = 201,
    itemId = 21650,
    min = 1,
    max = 1,
    weight = 10000
    };
getRow(36)->
    #drop_packageCfg {
    packageId = 201,
    itemId = 21700,
    min = 1,
    max = 1,
    weight = 10000
    };
getRow(37)->
    #drop_packageCfg {
    packageId = 201,
    itemId = 21750,
    min = 1,
    max = 1,
    weight = 10000
    };
getRow(38)->
    #drop_packageCfg {
    packageId = 201,
    itemId = 21800,
    min = 1,
    max = 1,
    weight = 10000
    };
getRow(39)->
    #drop_packageCfg {
    packageId = 201,
    itemId = 21850,
    min = 1,
    max = 1,
    weight = 10000
    };
getRow(40)->
    #drop_packageCfg {
    packageId = 201,
    itemId = 21900,
    min = 1,
    max = 1,
    weight = 10000
    };
getRow(41)->
    #drop_packageCfg {
    packageId = 201,
    itemId = 21950,
    min = 1,
    max = 1,
    weight = 10000
    };
getRow(42)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 222,
    min = 1,
    max = 1,
    weight = 20000
    };
getRow(43)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 224,
    min = 1,
    max = 1,
    weight = 10000
    };
getRow(44)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 2160,
    min = 1,
    max = 1,
    weight = 20000
    };
getRow(45)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 2161,
    min = 1,
    max = 1,
    weight = 10000
    };
getRow(46)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 21000,
    min = 1,
    max = 1,
    weight = 20000
    };
getRow(47)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 21050,
    min = 1,
    max = 1,
    weight = 20000
    };
getRow(48)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 21100,
    min = 1,
    max = 1,
    weight = 20000
    };
getRow(49)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 21002,
    min = 1,
    max = 1,
    weight = 10000
    };
getRow(50)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 21052,
    min = 1,
    max = 1,
    weight = 10000
    };
getRow(51)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 21102,
    min = 1,
    max = 1,
    weight = 10000
    };
getRow(52)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 21004,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(53)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 21054,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(54)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 21104,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(55)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 790,
    min = 1,
    max = 1,
    weight = 10000
    };
getRow(56)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 791,
    min = 1,
    max = 1,
    weight = 10000
    };
getRow(57)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 792,
    min = 1,
    max = 1,
    weight = 10000
    };
getRow(58)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 793,
    min = 1,
    max = 1,
    weight = 10000
    };
getRow(59)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 794,
    min = 1,
    max = 1,
    weight = 10000
    };
getRow(60)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 615,
    min = 1,
    max = 1,
    weight = 20000
    };
getRow(61)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 616,
    min = 1,
    max = 1,
    weight = 5000
    };
getRow(62)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 617,
    min = 1,
    max = 1,
    weight = 500
    };
getRow(63)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 618,
    min = 1,
    max = 1,
    weight = 500
    };
getRow(64)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 383,
    min = 1,
    max = 1,
    weight = 5000
    };
getRow(65)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 384,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(66)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 1932,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(67)->
    #drop_packageCfg {
    packageId = 1800,
    itemId = 1933,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(68)->
    #drop_packageCfg {
    packageId = 8000,
    itemId = 32029,
    min = 1,
    max = 1,
    weight = 1250
    };
getRow(69)->
    #drop_packageCfg {
    packageId = 8000,
    itemId = 33029,
    min = 1,
    max = 1,
    weight = 1250
    };
getRow(70)->
    #drop_packageCfg {
    packageId = 8000,
    itemId = 34029,
    min = 1,
    max = 1,
    weight = 1250
    };
getRow(71)->
    #drop_packageCfg {
    packageId = 8000,
    itemId = 35029,
    min = 1,
    max = 1,
    weight = 1250
    };
getRow(72)->
    #drop_packageCfg {
    packageId = 8000,
    itemId = 36029,
    min = 1,
    max = 1,
    weight = 1250
    };
getRow(73)->
    #drop_packageCfg {
    packageId = 8000,
    itemId = 37029,
    min = 1,
    max = 1,
    weight = 1250
    };
getRow(74)->
    #drop_packageCfg {
    packageId = 8000,
    itemId = 38029,
    min = 1,
    max = 1,
    weight = 1250
    };
getRow(75)->
    #drop_packageCfg {
    packageId = 8001,
    itemId = 32077,
    min = 1,
    max = 1,
    weight = 1250
    };
getRow(76)->
    #drop_packageCfg {
    packageId = 8001,
    itemId = 33077,
    min = 1,
    max = 1,
    weight = 1250
    };
getRow(77)->
    #drop_packageCfg {
    packageId = 8001,
    itemId = 34077,
    min = 1,
    max = 1,
    weight = 1250
    };
getRow(78)->
    #drop_packageCfg {
    packageId = 8001,
    itemId = 35077,
    min = 1,
    max = 1,
    weight = 1250
    };
getRow(79)->
    #drop_packageCfg {
    packageId = 8001,
    itemId = 36077,
    min = 1,
    max = 1,
    weight = 1250
    };
getRow(80)->
    #drop_packageCfg {
    packageId = 8001,
    itemId = 37077,
    min = 1,
    max = 1,
    weight = 1250
    };
getRow(81)->
    #drop_packageCfg {
    packageId = 8001,
    itemId = 38077,
    min = 1,
    max = 1,
    weight = 1250
    };
getRow(82)->
    #drop_packageCfg {
    packageId = 8002,
    itemId = 32125,
    min = 1,
    max = 1,
    weight = 1250
    };
getRow(83)->
    #drop_packageCfg {
    packageId = 8002,
    itemId = 33125,
    min = 1,
    max = 1,
    weight = 1250
    };
getRow(84)->
    #drop_packageCfg {
    packageId = 8002,
    itemId = 34125,
    min = 1,
    max = 1,
    weight = 1250
    };
getRow(85)->
    #drop_packageCfg {
    packageId = 8002,
    itemId = 35125,
    min = 1,
    max = 1,
    weight = 1250
    };
getRow(86)->
    #drop_packageCfg {
    packageId = 8002,
    itemId = 36125,
    min = 1,
    max = 1,
    weight = 1250
    };
getRow(87)->
    #drop_packageCfg {
    packageId = 8002,
    itemId = 37125,
    min = 1,
    max = 1,
    weight = 1250
    };
getRow(88)->
    #drop_packageCfg {
    packageId = 8002,
    itemId = 38125,
    min = 1,
    max = 1,
    weight = 1250
    };
getRow(89)->
    #drop_packageCfg {
    packageId = 18001,
    itemId = 1901,
    min = 1,
    max = 3,
    weight = 772
    };
getRow(90)->
    #drop_packageCfg {
    packageId = 18001,
    itemId = 1902,
    min = 1,
    max = 3,
    weight = 769
    };
getRow(91)->
    #drop_packageCfg {
    packageId = 18001,
    itemId = 1903,
    min = 1,
    max = 3,
    weight = 769
    };
getRow(92)->
    #drop_packageCfg {
    packageId = 18001,
    itemId = 1904,
    min = 1,
    max = 3,
    weight = 769
    };
getRow(93)->
    #drop_packageCfg {
    packageId = 18001,
    itemId = 1905,
    min = 1,
    max = 3,
    weight = 769
    };
getRow(94)->
    #drop_packageCfg {
    packageId = 18001,
    itemId = 1906,
    min = 1,
    max = 3,
    weight = 769
    };
getRow(95)->
    #drop_packageCfg {
    packageId = 18001,
    itemId = 1908,
    min = 1,
    max = 3,
    weight = 769
    };
getRow(96)->
    #drop_packageCfg {
    packageId = 18001,
    itemId = 1909,
    min = 1,
    max = 3,
    weight = 769
    };
getRow(97)->
    #drop_packageCfg {
    packageId = 18001,
    itemId = 1910,
    min = 1,
    max = 3,
    weight = 769
    };
getRow(98)->
    #drop_packageCfg {
    packageId = 18001,
    itemId = 1913,
    min = 1,
    max = 3,
    weight = 769
    };
getRow(99)->
    #drop_packageCfg {
    packageId = 18001,
    itemId = 1915,
    min = 1,
    max = 3,
    weight = 769
    };
getRow(100)->
    #drop_packageCfg {
    packageId = 18001,
    itemId = 1916,
    min = 1,
    max = 3,
    weight = 769
    };
getRow(101)->
    #drop_packageCfg {
    packageId = 18001,
    itemId = 1917,
    min = 1,
    max = 3,
    weight = 769
    };
getRow(102)->
    #drop_packageCfg {
    packageId = 35000,
    itemId = 101001,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(103)->
    #drop_packageCfg {
    packageId = 35000,
    itemId = 101002,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(104)->
    #drop_packageCfg {
    packageId = 35000,
    itemId = 101003,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(105)->
    #drop_packageCfg {
    packageId = 35000,
    itemId = 101004,
    min = 1,
    max = 1,
    weight = 250
    };
getRow(106)->
    #drop_packageCfg {
    packageId = 35000,
    itemId = 101005,
    min = 1,
    max = 1,
    weight = 250
    };
getRow(107)->
    #drop_packageCfg {
    packageId = 35000,
    itemId = 101006,
    min = 1,
    max = 1,
    weight = 250
    };
getRow(108)->
    #drop_packageCfg {
    packageId = 35000,
    itemId = 101101,
    min = 1,
    max = 1,
    weight = 107
    };
getRow(109)->
    #drop_packageCfg {
    packageId = 35000,
    itemId = 101102,
    min = 1,
    max = 1,
    weight = 107
    };
getRow(110)->
    #drop_packageCfg {
    packageId = 35000,
    itemId = 101103,
    min = 1,
    max = 1,
    weight = 107
    };
getRow(111)->
    #drop_packageCfg {
    packageId = 35000,
    itemId = 101104,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(112)->
    #drop_packageCfg {
    packageId = 35000,
    itemId = 101105,
    min = 1,
    max = 1,
    weight = 250
    };
getRow(113)->
    #drop_packageCfg {
    packageId = 35000,
    itemId = 101106,
    min = 1,
    max = 1,
    weight = 107
    };
getRow(114)->
    #drop_packageCfg {
    packageId = 35000,
    itemId = 101201,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(115)->
    #drop_packageCfg {
    packageId = 35000,
    itemId = 101202,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(116)->
    #drop_packageCfg {
    packageId = 35000,
    itemId = 101203,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(117)->
    #drop_packageCfg {
    packageId = 35000,
    itemId = 101204,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(118)->
    #drop_packageCfg {
    packageId = 35000,
    itemId = 101205,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(119)->
    #drop_packageCfg {
    packageId = 35000,
    itemId = 101206,
    min = 1,
    max = 1,
    weight = 250
    };
getRow(120)->
    #drop_packageCfg {
    packageId = 35010,
    itemId = 101101,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(121)->
    #drop_packageCfg {
    packageId = 35010,
    itemId = 101102,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(122)->
    #drop_packageCfg {
    packageId = 35010,
    itemId = 101103,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(123)->
    #drop_packageCfg {
    packageId = 35010,
    itemId = 101104,
    min = 1,
    max = 1,
    weight = 250
    };
getRow(124)->
    #drop_packageCfg {
    packageId = 35010,
    itemId = 101105,
    min = 1,
    max = 1,
    weight = 250
    };
getRow(125)->
    #drop_packageCfg {
    packageId = 35010,
    itemId = 101106,
    min = 1,
    max = 1,
    weight = 250
    };
getRow(126)->
    #drop_packageCfg {
    packageId = 35010,
    itemId = 101201,
    min = 1,
    max = 1,
    weight = 107
    };
getRow(127)->
    #drop_packageCfg {
    packageId = 35010,
    itemId = 101202,
    min = 1,
    max = 1,
    weight = 107
    };
getRow(128)->
    #drop_packageCfg {
    packageId = 35010,
    itemId = 101203,
    min = 1,
    max = 1,
    weight = 107
    };
getRow(129)->
    #drop_packageCfg {
    packageId = 35010,
    itemId = 101204,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(130)->
    #drop_packageCfg {
    packageId = 35010,
    itemId = 101205,
    min = 1,
    max = 1,
    weight = 250
    };
getRow(131)->
    #drop_packageCfg {
    packageId = 35010,
    itemId = 101206,
    min = 1,
    max = 1,
    weight = 107
    };
getRow(132)->
    #drop_packageCfg {
    packageId = 35010,
    itemId = 101301,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(133)->
    #drop_packageCfg {
    packageId = 35010,
    itemId = 101302,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(134)->
    #drop_packageCfg {
    packageId = 35010,
    itemId = 101303,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(135)->
    #drop_packageCfg {
    packageId = 35010,
    itemId = 101304,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(136)->
    #drop_packageCfg {
    packageId = 35010,
    itemId = 101305,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(137)->
    #drop_packageCfg {
    packageId = 35010,
    itemId = 101306,
    min = 1,
    max = 1,
    weight = 250
    };
getRow(138)->
    #drop_packageCfg {
    packageId = 35020,
    itemId = 101201,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(139)->
    #drop_packageCfg {
    packageId = 35020,
    itemId = 101202,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(140)->
    #drop_packageCfg {
    packageId = 35020,
    itemId = 101203,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(141)->
    #drop_packageCfg {
    packageId = 35020,
    itemId = 101204,
    min = 1,
    max = 1,
    weight = 250
    };
getRow(142)->
    #drop_packageCfg {
    packageId = 35020,
    itemId = 101205,
    min = 1,
    max = 1,
    weight = 250
    };
getRow(143)->
    #drop_packageCfg {
    packageId = 35020,
    itemId = 101206,
    min = 1,
    max = 1,
    weight = 250
    };
getRow(144)->
    #drop_packageCfg {
    packageId = 35020,
    itemId = 101301,
    min = 1,
    max = 1,
    weight = 107
    };
getRow(145)->
    #drop_packageCfg {
    packageId = 35020,
    itemId = 101302,
    min = 1,
    max = 1,
    weight = 107
    };
getRow(146)->
    #drop_packageCfg {
    packageId = 35020,
    itemId = 101303,
    min = 1,
    max = 1,
    weight = 107
    };
getRow(147)->
    #drop_packageCfg {
    packageId = 35020,
    itemId = 101304,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(148)->
    #drop_packageCfg {
    packageId = 35020,
    itemId = 101305,
    min = 1,
    max = 1,
    weight = 250
    };
getRow(149)->
    #drop_packageCfg {
    packageId = 35020,
    itemId = 101306,
    min = 1,
    max = 1,
    weight = 107
    };
getRow(150)->
    #drop_packageCfg {
    packageId = 35020,
    itemId = 101401,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(151)->
    #drop_packageCfg {
    packageId = 35020,
    itemId = 101402,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(152)->
    #drop_packageCfg {
    packageId = 35020,
    itemId = 101403,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(153)->
    #drop_packageCfg {
    packageId = 35020,
    itemId = 101404,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(154)->
    #drop_packageCfg {
    packageId = 35020,
    itemId = 101405,
    min = 1,
    max = 1,
    weight = 357
    };
getRow(155)->
    #drop_packageCfg {
    packageId = 35020,
    itemId = 101406,
    min = 1,
    max = 1,
    weight = 250
    };
getRow(156)->
    #drop_packageCfg {
    packageId = 250000,
    itemId = 32010,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(157)->
    #drop_packageCfg {
    packageId = 250000,
    itemId = 33010,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(158)->
    #drop_packageCfg {
    packageId = 250000,
    itemId = 34010,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(159)->
    #drop_packageCfg {
    packageId = 250000,
    itemId = 35010,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(160)->
    #drop_packageCfg {
    packageId = 250000,
    itemId = 36010,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(161)->
    #drop_packageCfg {
    packageId = 250000,
    itemId = 37010,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(162)->
    #drop_packageCfg {
    packageId = 250000,
    itemId = 38010,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(163)->
    #drop_packageCfg {
    packageId = 250001,
    itemId = 32058,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(164)->
    #drop_packageCfg {
    packageId = 250001,
    itemId = 33058,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(165)->
    #drop_packageCfg {
    packageId = 250001,
    itemId = 34058,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(166)->
    #drop_packageCfg {
    packageId = 250001,
    itemId = 35058,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(167)->
    #drop_packageCfg {
    packageId = 250001,
    itemId = 36058,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(168)->
    #drop_packageCfg {
    packageId = 250001,
    itemId = 37058,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(169)->
    #drop_packageCfg {
    packageId = 250001,
    itemId = 38058,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(170)->
    #drop_packageCfg {
    packageId = 250002,
    itemId = 32106,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(171)->
    #drop_packageCfg {
    packageId = 250002,
    itemId = 33106,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(172)->
    #drop_packageCfg {
    packageId = 250002,
    itemId = 34106,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(173)->
    #drop_packageCfg {
    packageId = 250002,
    itemId = 35106,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(174)->
    #drop_packageCfg {
    packageId = 250002,
    itemId = 36106,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(175)->
    #drop_packageCfg {
    packageId = 250002,
    itemId = 37106,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(176)->
    #drop_packageCfg {
    packageId = 250002,
    itemId = 38106,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(177)->
    #drop_packageCfg {
    packageId = 251000,
    itemId = 32011,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(178)->
    #drop_packageCfg {
    packageId = 251000,
    itemId = 33011,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(179)->
    #drop_packageCfg {
    packageId = 251000,
    itemId = 34011,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(180)->
    #drop_packageCfg {
    packageId = 251000,
    itemId = 35011,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(181)->
    #drop_packageCfg {
    packageId = 251000,
    itemId = 36011,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(182)->
    #drop_packageCfg {
    packageId = 251000,
    itemId = 37011,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(183)->
    #drop_packageCfg {
    packageId = 251000,
    itemId = 38011,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(184)->
    #drop_packageCfg {
    packageId = 251000,
    itemId = 32011,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(185)->
    #drop_packageCfg {
    packageId = 251000,
    itemId = 33011,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(186)->
    #drop_packageCfg {
    packageId = 251000,
    itemId = 34011,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(187)->
    #drop_packageCfg {
    packageId = 251000,
    itemId = 35011,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(188)->
    #drop_packageCfg {
    packageId = 251000,
    itemId = 36011,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(189)->
    #drop_packageCfg {
    packageId = 251000,
    itemId = 37011,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(190)->
    #drop_packageCfg {
    packageId = 251000,
    itemId = 38011,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(191)->
    #drop_packageCfg {
    packageId = 251001,
    itemId = 32059,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(192)->
    #drop_packageCfg {
    packageId = 251001,
    itemId = 33059,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(193)->
    #drop_packageCfg {
    packageId = 251001,
    itemId = 34059,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(194)->
    #drop_packageCfg {
    packageId = 251001,
    itemId = 35059,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(195)->
    #drop_packageCfg {
    packageId = 251001,
    itemId = 36059,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(196)->
    #drop_packageCfg {
    packageId = 251001,
    itemId = 37059,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(197)->
    #drop_packageCfg {
    packageId = 251001,
    itemId = 38059,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(198)->
    #drop_packageCfg {
    packageId = 251001,
    itemId = 32059,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(199)->
    #drop_packageCfg {
    packageId = 251001,
    itemId = 33059,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(200)->
    #drop_packageCfg {
    packageId = 251001,
    itemId = 34059,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(201)->
    #drop_packageCfg {
    packageId = 251001,
    itemId = 35059,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(202)->
    #drop_packageCfg {
    packageId = 251001,
    itemId = 36059,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(203)->
    #drop_packageCfg {
    packageId = 251001,
    itemId = 37059,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(204)->
    #drop_packageCfg {
    packageId = 251001,
    itemId = 38059,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(205)->
    #drop_packageCfg {
    packageId = 251002,
    itemId = 32107,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(206)->
    #drop_packageCfg {
    packageId = 251002,
    itemId = 33107,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(207)->
    #drop_packageCfg {
    packageId = 251002,
    itemId = 34107,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(208)->
    #drop_packageCfg {
    packageId = 251002,
    itemId = 35107,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(209)->
    #drop_packageCfg {
    packageId = 251002,
    itemId = 36107,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(210)->
    #drop_packageCfg {
    packageId = 251002,
    itemId = 37107,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(211)->
    #drop_packageCfg {
    packageId = 251002,
    itemId = 38107,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(212)->
    #drop_packageCfg {
    packageId = 251002,
    itemId = 32107,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(213)->
    #drop_packageCfg {
    packageId = 251002,
    itemId = 33107,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(214)->
    #drop_packageCfg {
    packageId = 251002,
    itemId = 34107,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(215)->
    #drop_packageCfg {
    packageId = 251002,
    itemId = 35107,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(216)->
    #drop_packageCfg {
    packageId = 251002,
    itemId = 36107,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(217)->
    #drop_packageCfg {
    packageId = 251002,
    itemId = 37107,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(218)->
    #drop_packageCfg {
    packageId = 251002,
    itemId = 38107,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(219)->
    #drop_packageCfg {
    packageId = 252000,
    itemId = 32012,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(220)->
    #drop_packageCfg {
    packageId = 252000,
    itemId = 33012,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(221)->
    #drop_packageCfg {
    packageId = 252000,
    itemId = 34012,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(222)->
    #drop_packageCfg {
    packageId = 252000,
    itemId = 35012,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(223)->
    #drop_packageCfg {
    packageId = 252000,
    itemId = 36012,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(224)->
    #drop_packageCfg {
    packageId = 252000,
    itemId = 37012,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(225)->
    #drop_packageCfg {
    packageId = 252000,
    itemId = 38012,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(226)->
    #drop_packageCfg {
    packageId = 252001,
    itemId = 32060,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(227)->
    #drop_packageCfg {
    packageId = 252001,
    itemId = 33060,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(228)->
    #drop_packageCfg {
    packageId = 252001,
    itemId = 34060,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(229)->
    #drop_packageCfg {
    packageId = 252001,
    itemId = 35060,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(230)->
    #drop_packageCfg {
    packageId = 252001,
    itemId = 36060,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(231)->
    #drop_packageCfg {
    packageId = 252001,
    itemId = 37060,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(232)->
    #drop_packageCfg {
    packageId = 252001,
    itemId = 38060,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(233)->
    #drop_packageCfg {
    packageId = 252002,
    itemId = 32108,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(234)->
    #drop_packageCfg {
    packageId = 252002,
    itemId = 33108,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(235)->
    #drop_packageCfg {
    packageId = 252002,
    itemId = 34108,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(236)->
    #drop_packageCfg {
    packageId = 252002,
    itemId = 35108,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(237)->
    #drop_packageCfg {
    packageId = 252002,
    itemId = 36108,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(238)->
    #drop_packageCfg {
    packageId = 252002,
    itemId = 37108,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(239)->
    #drop_packageCfg {
    packageId = 252002,
    itemId = 38108,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(240)->
    #drop_packageCfg {
    packageId = 260000,
    itemId = 32028,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(241)->
    #drop_packageCfg {
    packageId = 260000,
    itemId = 33028,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(242)->
    #drop_packageCfg {
    packageId = 260000,
    itemId = 34028,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(243)->
    #drop_packageCfg {
    packageId = 260000,
    itemId = 35028,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(244)->
    #drop_packageCfg {
    packageId = 260000,
    itemId = 36028,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(245)->
    #drop_packageCfg {
    packageId = 260000,
    itemId = 37028,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(246)->
    #drop_packageCfg {
    packageId = 260000,
    itemId = 38028,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(247)->
    #drop_packageCfg {
    packageId = 260001,
    itemId = 32076,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(248)->
    #drop_packageCfg {
    packageId = 260001,
    itemId = 33076,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(249)->
    #drop_packageCfg {
    packageId = 260001,
    itemId = 34076,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(250)->
    #drop_packageCfg {
    packageId = 260001,
    itemId = 35076,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(251)->
    #drop_packageCfg {
    packageId = 260001,
    itemId = 36076,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(252)->
    #drop_packageCfg {
    packageId = 260001,
    itemId = 37076,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(253)->
    #drop_packageCfg {
    packageId = 260001,
    itemId = 38076,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(254)->
    #drop_packageCfg {
    packageId = 260002,
    itemId = 32124,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(255)->
    #drop_packageCfg {
    packageId = 260002,
    itemId = 33124,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(256)->
    #drop_packageCfg {
    packageId = 260002,
    itemId = 34124,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(257)->
    #drop_packageCfg {
    packageId = 260002,
    itemId = 35124,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(258)->
    #drop_packageCfg {
    packageId = 260002,
    itemId = 36124,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(259)->
    #drop_packageCfg {
    packageId = 260002,
    itemId = 37124,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(260)->
    #drop_packageCfg {
    packageId = 260002,
    itemId = 38124,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(261)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 31001,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(262)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 31009,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(263)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 31017,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(264)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 31049,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(265)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 31057,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(266)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 31065,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(267)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 31097,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(268)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 31105,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(269)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 31113,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(270)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 31145,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(271)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 31152,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(272)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 31159,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(273)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 31180,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(274)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 31187,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(275)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 31194,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(276)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 31215,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(277)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 31222,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(278)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 31229,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(279)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 31250,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(280)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 31257,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(281)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 31264,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(282)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 32002,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(283)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 32010,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(284)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 32018,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(285)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 32050,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(286)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 32058,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(287)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 32066,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(288)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 32098,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(289)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 32106,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(290)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 32114,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(291)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 33002,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(292)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 33010,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(293)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 33018,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(294)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 33050,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(295)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 33058,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(296)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 33066,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(297)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 33098,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(298)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 33106,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(299)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 33114,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(300)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 34002,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(301)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 34010,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(302)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 34018,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(303)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 34050,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(304)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 34058,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(305)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 34066,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(306)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 34098,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(307)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 34106,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(308)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 34114,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(309)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 35002,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(310)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 35010,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(311)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 35018,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(312)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 35050,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(313)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 35058,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(314)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 35066,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(315)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 35098,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(316)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 35106,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(317)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 35114,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(318)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 36002,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(319)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 36010,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(320)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 36018,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(321)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 36050,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(322)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 36058,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(323)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 36066,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(324)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 36098,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(325)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 36106,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(326)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 36114,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(327)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 37002,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(328)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 37010,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(329)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 37018,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(330)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 37050,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(331)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 37058,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(332)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 37066,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(333)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 37098,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(334)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 37106,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(335)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 37114,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(336)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 38002,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(337)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 38010,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(338)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 38018,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(339)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 38050,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(340)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 38058,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(341)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 38066,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(342)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 38098,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(343)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 38106,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(344)->
    #drop_packageCfg {
    packageId = 312000,
    itemId = 38114,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(345)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 31002,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(346)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 31010,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(347)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 31018,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(348)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 31050,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(349)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 31058,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(350)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 31066,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(351)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 31098,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(352)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 31106,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(353)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 31114,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(354)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 31146,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(355)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 31153,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(356)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 31160,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(357)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 31181,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(358)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 31188,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(359)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 31195,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(360)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 31216,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(361)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 31223,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(362)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 31230,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(363)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 31251,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(364)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 31258,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(365)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 31265,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(366)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 32003,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(367)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 32011,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(368)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 32019,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(369)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 32051,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(370)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 32059,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(371)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 32067,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(372)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 32099,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(373)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 32107,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(374)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 32115,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(375)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 33003,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(376)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 33011,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(377)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 33019,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(378)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 33051,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(379)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 33059,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(380)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 33067,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(381)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 33099,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(382)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 33107,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(383)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 33115,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(384)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 34003,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(385)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 34011,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(386)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 34019,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(387)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 34051,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(388)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 34059,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(389)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 34067,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(390)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 34099,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(391)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 34107,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(392)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 34115,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(393)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 35003,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(394)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 35011,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(395)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 35019,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(396)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 35051,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(397)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 35059,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(398)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 35067,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(399)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 35099,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(400)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 35107,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(401)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 35115,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(402)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 36003,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(403)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 36011,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(404)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 36019,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(405)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 36051,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(406)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 36059,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(407)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 36067,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(408)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 36099,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(409)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 36107,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(410)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 36115,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(411)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 37003,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(412)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 37011,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(413)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 37019,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(414)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 37051,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(415)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 37059,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(416)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 37067,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(417)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 37099,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(418)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 37107,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(419)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 37115,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(420)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 38003,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(421)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 38011,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(422)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 38019,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(423)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 38051,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(424)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 38059,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(425)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 38067,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(426)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 38099,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(427)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 38107,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(428)->
    #drop_packageCfg {
    packageId = 312001,
    itemId = 38115,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(429)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 31003,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(430)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 31011,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(431)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 31019,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(432)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 31051,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(433)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 31059,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(434)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 31067,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(435)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 31099,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(436)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 31107,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(437)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 31115,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(438)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 31147,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(439)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 31154,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(440)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 31161,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(441)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 31182,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(442)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 31189,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(443)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 31196,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(444)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 31217,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(445)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 31224,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(446)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 31231,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(447)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 31252,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(448)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 31259,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(449)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 31266,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(450)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 32004,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(451)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 32012,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(452)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 32020,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(453)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 32052,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(454)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 32060,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(455)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 32068,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(456)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 32100,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(457)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 32108,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(458)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 32116,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(459)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 33004,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(460)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 33012,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(461)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 33020,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(462)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 33052,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(463)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 33060,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(464)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 33068,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(465)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 33100,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(466)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 33108,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(467)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 33116,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(468)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 34004,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(469)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 34012,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(470)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 34020,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(471)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 34052,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(472)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 34060,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(473)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 34068,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(474)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 34100,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(475)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 34108,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(476)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 34116,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(477)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 35004,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(478)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 35012,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(479)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 35020,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(480)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 35052,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(481)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 35060,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(482)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 35068,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(483)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 35100,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(484)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 35108,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(485)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 35116,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(486)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 36004,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(487)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 36012,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(488)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 36020,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(489)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 36052,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(490)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 36060,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(491)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 36068,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(492)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 36100,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(493)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 36108,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(494)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 36116,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(495)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 37004,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(496)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 37012,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(497)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 37020,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(498)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 37052,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(499)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 37060,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(500)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 37068,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(501)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 37100,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(502)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 37108,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(503)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 37116,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(504)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 38004,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(505)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 38012,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(506)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 38020,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(507)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 38052,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(508)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 38060,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(509)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 38068,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(510)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 38100,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(511)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 38108,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(512)->
    #drop_packageCfg {
    packageId = 312002,
    itemId = 38116,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(513)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 31004,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(514)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 31012,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(515)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 31020,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(516)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 31052,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(517)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 31060,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(518)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 31068,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(519)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 31100,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(520)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 31108,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(521)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 31116,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(522)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 31148,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(523)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 31155,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(524)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 31162,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(525)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 31183,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(526)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 31190,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(527)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 31197,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(528)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 31218,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(529)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 31225,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(530)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 31232,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(531)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 31253,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(532)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 31260,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(533)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 31267,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(534)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 32005,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(535)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 32013,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(536)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 32021,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(537)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 32053,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(538)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 32061,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(539)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 32069,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(540)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 32101,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(541)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 32109,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(542)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 32117,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(543)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 33005,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(544)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 33013,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(545)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 33021,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(546)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 33053,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(547)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 33061,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(548)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 33069,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(549)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 33101,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(550)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 33109,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(551)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 33117,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(552)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 34005,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(553)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 34013,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(554)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 34021,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(555)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 34053,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(556)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 34061,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(557)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 34069,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(558)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 34101,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(559)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 34109,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(560)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 34117,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(561)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 35005,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(562)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 35013,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(563)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 35021,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(564)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 35053,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(565)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 35061,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(566)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 35069,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(567)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 35101,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(568)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 35109,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(569)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 35117,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(570)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 36005,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(571)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 36013,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(572)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 36021,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(573)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 36053,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(574)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 36061,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(575)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 36069,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(576)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 36101,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(577)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 36109,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(578)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 36117,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(579)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 37005,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(580)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 37013,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(581)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 37021,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(582)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 37053,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(583)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 37061,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(584)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 37069,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(585)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 37101,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(586)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 37109,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(587)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 37117,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(588)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 38005,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(589)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 38013,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(590)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 38021,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(591)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 38053,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(592)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 38061,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(593)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 38069,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(594)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 38101,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(595)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 38109,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(596)->
    #drop_packageCfg {
    packageId = 312003,
    itemId = 38117,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(597)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 31005,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(598)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 31013,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(599)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 31021,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(600)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 31053,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(601)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 31061,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(602)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 31069,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(603)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 31101,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(604)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 31109,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(605)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 31117,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(606)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 31149,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(607)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 31156,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(608)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 31163,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(609)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 31184,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(610)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 31191,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(611)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 31198,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(612)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 31219,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(613)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 31226,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(614)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 31233,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(615)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 31254,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(616)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 31261,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(617)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 31268,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(618)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 32006,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(619)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 32014,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(620)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 32022,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(621)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 32054,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(622)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 32062,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(623)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 32070,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(624)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 32102,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(625)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 32110,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(626)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 32118,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(627)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 33006,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(628)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 33014,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(629)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 33022,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(630)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 33054,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(631)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 33062,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(632)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 33070,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(633)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 33102,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(634)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 33110,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(635)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 33118,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(636)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 34006,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(637)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 34014,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(638)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 34022,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(639)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 34054,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(640)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 34062,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(641)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 34070,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(642)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 34102,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(643)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 34110,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(644)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 34118,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(645)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 35006,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(646)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 35014,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(647)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 35022,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(648)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 35054,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(649)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 35062,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(650)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 35070,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(651)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 35102,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(652)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 35110,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(653)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 35118,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(654)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 36006,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(655)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 36014,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(656)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 36022,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(657)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 36054,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(658)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 36062,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(659)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 36070,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(660)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 36102,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(661)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 36110,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(662)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 36118,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(663)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 37006,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(664)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 37014,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(665)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 37022,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(666)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 37054,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(667)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 37062,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(668)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 37070,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(669)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 37102,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(670)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 37110,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(671)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 37118,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(672)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 38006,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(673)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 38014,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(674)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 38022,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(675)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 38054,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(676)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 38062,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(677)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 38070,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(678)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 38102,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(679)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 38110,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(680)->
    #drop_packageCfg {
    packageId = 312004,
    itemId = 38118,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(681)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 31006,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(682)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 31014,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(683)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 31022,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(684)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 31054,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(685)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 31062,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(686)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 31070,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(687)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 31102,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(688)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 31110,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(689)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 31118,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(690)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 31150,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(691)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 31157,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(692)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 31164,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(693)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 31185,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(694)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 31192,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(695)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 31199,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(696)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 31220,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(697)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 31227,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(698)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 31234,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(699)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 31255,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(700)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 31262,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(701)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 31269,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(702)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 32007,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(703)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 32015,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(704)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 32023,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(705)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 32055,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(706)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 32063,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(707)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 32071,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(708)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 32103,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(709)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 32111,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(710)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 32119,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(711)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 33007,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(712)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 33015,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(713)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 33023,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(714)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 33055,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(715)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 33063,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(716)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 33071,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(717)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 33103,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(718)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 33111,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(719)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 33119,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(720)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 34007,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(721)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 34015,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(722)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 34023,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(723)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 34055,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(724)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 34063,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(725)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 34071,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(726)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 34103,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(727)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 34111,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(728)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 34119,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(729)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 35007,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(730)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 35015,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(731)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 35023,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(732)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 35055,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(733)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 35063,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(734)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 35071,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(735)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 35103,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(736)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 35111,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(737)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 35119,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(738)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 36007,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(739)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 36015,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(740)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 36023,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(741)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 36055,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(742)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 36063,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(743)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 36071,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(744)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 36103,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(745)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 36111,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(746)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 36119,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(747)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 37007,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(748)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 37015,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(749)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 37023,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(750)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 37055,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(751)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 37063,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(752)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 37071,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(753)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 37103,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(754)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 37111,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(755)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 37119,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(756)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 38007,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(757)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 38015,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(758)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 38023,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(759)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 38055,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(760)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 38063,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(761)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 38071,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(762)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 38103,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(763)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 38111,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(764)->
    #drop_packageCfg {
    packageId = 312005,
    itemId = 38119,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(765)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 31007,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(766)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 31015,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(767)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 31023,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(768)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 31055,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(769)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 31063,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(770)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 31071,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(771)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 31103,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(772)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 31111,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(773)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 31119,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(774)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 31151,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(775)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 31158,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(776)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 31165,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(777)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 31186,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(778)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 31193,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(779)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 31200,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(780)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 31221,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(781)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 31228,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(782)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 31235,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(783)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 31256,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(784)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 31263,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(785)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 31270,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(786)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 32008,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(787)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 32016,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(788)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 32024,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(789)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 32056,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(790)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 32064,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(791)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 32072,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(792)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 32104,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(793)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 32112,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(794)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 32120,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(795)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 33008,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(796)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 33016,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(797)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 33024,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(798)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 33056,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(799)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 33064,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(800)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 33072,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(801)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 33104,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(802)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 33112,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(803)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 33120,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(804)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 34008,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(805)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 34016,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(806)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 34024,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(807)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 34056,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(808)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 34064,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(809)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 34072,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(810)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 34104,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(811)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 34112,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(812)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 34120,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(813)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 35008,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(814)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 35016,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(815)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 35024,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(816)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 35056,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(817)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 35064,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(818)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 35072,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(819)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 35104,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(820)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 35112,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(821)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 35120,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(822)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 36008,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(823)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 36016,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(824)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 36024,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(825)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 36056,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(826)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 36064,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(827)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 36072,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(828)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 36104,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(829)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 36112,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(830)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 36120,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(831)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 37008,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(832)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 37016,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(833)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 37024,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(834)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 37056,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(835)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 37064,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(836)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 37072,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(837)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 37104,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(838)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 37112,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(839)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 37120,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(840)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 38008,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(841)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 38016,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(842)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 38024,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(843)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 38056,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(844)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 38064,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(845)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 38072,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(846)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 38104,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(847)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 38112,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(848)->
    #drop_packageCfg {
    packageId = 312006,
    itemId = 38120,
    min = 1,
    max = 1,
    weight = 3000
    };
getRow(849)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 31001,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(850)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 31009,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(851)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 31017,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(852)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 31049,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(853)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 31057,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(854)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 31065,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(855)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 31097,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(856)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 31105,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(857)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 31113,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(858)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 31145,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(859)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 31152,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(860)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 31159,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(861)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 31180,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(862)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 31187,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(863)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 31194,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(864)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 31215,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(865)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 31222,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(866)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 31229,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(867)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 31250,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(868)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 31257,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(869)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 31264,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(870)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 32002,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(871)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 32010,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(872)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 32018,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(873)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 32050,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(874)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 32058,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(875)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 32066,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(876)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 32098,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(877)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 32106,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(878)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 32114,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(879)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 33002,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(880)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 33010,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(881)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 33018,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(882)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 33050,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(883)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 33058,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(884)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 33066,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(885)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 33098,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(886)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 33106,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(887)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 33114,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(888)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 34002,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(889)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 34010,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(890)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 34018,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(891)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 34050,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(892)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 34058,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(893)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 34066,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(894)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 34098,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(895)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 34106,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(896)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 34114,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(897)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 35002,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(898)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 35010,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(899)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 35018,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(900)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 35050,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(901)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 35058,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(902)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 35066,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(903)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 35098,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(904)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 35106,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(905)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 35114,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(906)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 36002,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(907)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 36010,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(908)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 36018,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(909)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 36050,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(910)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 36058,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(911)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 36066,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(912)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 36098,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(913)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 36106,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(914)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 36114,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(915)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 37002,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(916)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 37010,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(917)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 37018,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(918)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 37050,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(919)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 37058,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(920)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 37066,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(921)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 37098,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(922)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 37106,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(923)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 37114,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(924)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 38002,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(925)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 38010,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(926)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 38018,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(927)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 38050,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(928)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 38058,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(929)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 38066,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(930)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 38098,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(931)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 38106,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(932)->
    #drop_packageCfg {
    packageId = 312100,
    itemId = 38114,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(933)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 31002,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(934)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 31010,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(935)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 31018,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(936)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 31050,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(937)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 31058,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(938)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 31066,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(939)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 31098,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(940)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 31106,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(941)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 31114,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(942)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 31146,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(943)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 31153,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(944)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 31160,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(945)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 31181,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(946)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 31188,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(947)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 31195,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(948)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 31216,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(949)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 31223,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(950)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 31230,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(951)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 31251,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(952)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 31258,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(953)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 31265,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(954)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 32003,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(955)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 32011,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(956)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 32019,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(957)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 32051,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(958)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 32059,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(959)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 32067,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(960)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 32099,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(961)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 32107,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(962)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 32115,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(963)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 33003,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(964)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 33011,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(965)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 33019,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(966)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 33051,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(967)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 33059,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(968)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 33067,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(969)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 33099,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(970)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 33107,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(971)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 33115,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(972)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 34003,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(973)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 34011,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(974)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 34019,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(975)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 34051,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(976)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 34059,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(977)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 34067,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(978)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 34099,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(979)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 34107,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(980)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 34115,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(981)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 35003,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(982)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 35011,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(983)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 35019,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(984)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 35051,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(985)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 35059,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(986)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 35067,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(987)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 35099,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(988)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 35107,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(989)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 35115,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(990)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 36003,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(991)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 36011,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(992)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 36019,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(993)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 36051,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(994)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 36059,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(995)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 36067,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(996)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 36099,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(997)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 36107,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(998)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 36115,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(999)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 37003,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1000)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 37011,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1001)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 37019,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1002)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 37051,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1003)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 37059,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1004)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 37067,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1005)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 37099,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1006)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 37107,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1007)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 37115,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1008)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 38003,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1009)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 38011,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1010)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 38019,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1011)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 38051,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1012)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 38059,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1013)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 38067,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1014)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 38099,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1015)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 38107,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1016)->
    #drop_packageCfg {
    packageId = 312101,
    itemId = 38115,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1017)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 31003,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1018)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 31011,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1019)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 31019,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1020)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 31051,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1021)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 31059,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1022)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 31067,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1023)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 31099,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1024)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 31107,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1025)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 31115,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1026)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 31147,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1027)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 31154,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1028)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 31161,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1029)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 31182,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1030)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 31189,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1031)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 31196,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1032)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 31217,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1033)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 31224,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1034)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 31231,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1035)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 31252,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1036)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 31259,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1037)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 31266,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1038)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 32004,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1039)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 32012,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1040)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 32020,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1041)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 32052,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1042)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 32060,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1043)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 32068,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1044)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 32100,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1045)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 32108,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1046)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 32116,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1047)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 33004,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1048)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 33012,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1049)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 33020,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1050)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 33052,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1051)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 33060,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1052)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 33068,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1053)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 33100,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1054)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 33108,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1055)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 33116,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1056)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 34004,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1057)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 34012,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1058)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 34020,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1059)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 34052,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1060)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 34060,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1061)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 34068,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1062)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 34100,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1063)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 34108,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1064)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 34116,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1065)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 35004,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1066)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 35012,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1067)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 35020,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1068)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 35052,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1069)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 35060,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1070)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 35068,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1071)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 35100,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1072)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 35108,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1073)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 35116,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1074)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 36004,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1075)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 36012,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1076)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 36020,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1077)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 36052,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1078)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 36060,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1079)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 36068,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1080)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 36100,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1081)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 36108,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1082)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 36116,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1083)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 37004,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1084)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 37012,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1085)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 37020,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1086)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 37052,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1087)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 37060,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1088)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 37068,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1089)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 37100,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1090)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 37108,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1091)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 37116,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1092)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 38004,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1093)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 38012,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1094)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 38020,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1095)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 38052,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1096)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 38060,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1097)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 38068,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1098)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 38100,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1099)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 38108,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1100)->
    #drop_packageCfg {
    packageId = 312102,
    itemId = 38116,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1101)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 31004,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1102)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 31012,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1103)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 31020,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1104)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 31052,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1105)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 31060,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1106)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 31068,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1107)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 31100,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1108)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 31108,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1109)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 31116,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1110)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 31148,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1111)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 31155,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1112)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 31162,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1113)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 31183,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1114)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 31190,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1115)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 31197,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1116)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 31218,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1117)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 31225,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1118)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 31232,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1119)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 31253,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1120)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 31260,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1121)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 31267,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1122)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 32005,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1123)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 32013,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1124)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 32021,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1125)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 32053,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1126)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 32061,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1127)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 32069,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1128)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 32101,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1129)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 32109,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1130)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 32117,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1131)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 33005,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1132)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 33013,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1133)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 33021,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1134)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 33053,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1135)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 33061,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1136)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 33069,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1137)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 33101,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1138)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 33109,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1139)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 33117,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1140)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 34005,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1141)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 34013,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1142)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 34021,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1143)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 34053,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1144)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 34061,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1145)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 34069,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1146)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 34101,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1147)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 34109,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1148)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 34117,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1149)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 35005,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1150)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 35013,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1151)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 35021,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1152)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 35053,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1153)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 35061,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1154)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 35069,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1155)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 35101,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1156)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 35109,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1157)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 35117,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1158)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 36005,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1159)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 36013,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1160)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 36021,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1161)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 36053,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1162)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 36061,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1163)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 36069,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1164)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 36101,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1165)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 36109,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1166)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 36117,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1167)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 37005,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1168)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 37013,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1169)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 37021,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1170)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 37053,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1171)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 37061,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1172)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 37069,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1173)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 37101,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1174)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 37109,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1175)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 37117,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1176)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 38005,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1177)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 38013,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1178)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 38021,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1179)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 38053,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1180)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 38061,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1181)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 38069,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1182)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 38101,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1183)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 38109,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1184)->
    #drop_packageCfg {
    packageId = 312103,
    itemId = 38117,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1185)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 31005,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1186)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 31013,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1187)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 31021,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1188)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 31053,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1189)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 31061,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1190)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 31069,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1191)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 31101,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1192)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 31109,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1193)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 31117,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1194)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 31149,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1195)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 31156,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1196)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 31163,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1197)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 31184,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1198)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 31191,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1199)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 31198,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1200)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 31219,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1201)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 31226,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1202)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 31233,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1203)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 31254,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1204)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 31261,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1205)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 31268,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1206)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 32006,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1207)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 32014,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1208)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 32022,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1209)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 32054,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1210)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 32062,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1211)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 32070,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1212)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 32102,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1213)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 32110,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1214)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 32118,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1215)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 33006,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1216)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 33014,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1217)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 33022,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1218)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 33054,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1219)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 33062,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1220)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 33070,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1221)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 33102,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1222)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 33110,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1223)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 33118,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1224)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 34006,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1225)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 34014,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1226)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 34022,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1227)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 34054,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1228)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 34062,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1229)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 34070,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1230)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 34102,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1231)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 34110,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1232)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 34118,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1233)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 35006,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1234)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 35014,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1235)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 35022,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1236)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 35054,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1237)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 35062,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1238)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 35070,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1239)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 35102,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1240)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 35110,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1241)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 35118,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1242)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 36006,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1243)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 36014,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1244)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 36022,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1245)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 36054,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1246)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 36062,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1247)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 36070,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1248)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 36102,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1249)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 36110,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1250)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 36118,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1251)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 37006,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1252)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 37014,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1253)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 37022,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1254)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 37054,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1255)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 37062,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1256)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 37070,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1257)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 37102,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1258)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 37110,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1259)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 37118,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1260)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 38006,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1261)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 38014,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1262)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 38022,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1263)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 38054,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1264)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 38062,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1265)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 38070,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1266)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 38102,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1267)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 38110,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1268)->
    #drop_packageCfg {
    packageId = 312104,
    itemId = 38118,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1269)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 31006,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1270)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 31014,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1271)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 31022,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1272)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 31054,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1273)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 31062,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1274)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 31070,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1275)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 31102,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1276)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 31110,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1277)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 31118,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1278)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 31150,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1279)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 31157,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1280)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 31164,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1281)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 31185,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1282)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 31192,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1283)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 31199,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1284)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 31220,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1285)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 31227,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1286)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 31234,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1287)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 31255,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1288)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 31262,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1289)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 31269,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1290)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 32007,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1291)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 32015,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1292)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 32023,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1293)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 32055,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1294)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 32063,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1295)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 32071,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1296)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 32103,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1297)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 32111,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1298)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 32119,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1299)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 33007,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1300)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 33015,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1301)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 33023,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1302)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 33055,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1303)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 33063,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1304)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 33071,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1305)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 33103,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1306)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 33111,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1307)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 33119,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1308)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 34007,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1309)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 34015,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1310)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 34023,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1311)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 34055,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1312)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 34063,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1313)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 34071,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1314)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 34103,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1315)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 34111,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1316)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 34119,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1317)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 35007,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1318)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 35015,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1319)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 35023,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1320)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 35055,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1321)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 35063,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1322)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 35071,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1323)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 35103,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1324)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 35111,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1325)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 35119,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1326)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 36007,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1327)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 36015,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1328)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 36023,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1329)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 36055,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1330)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 36063,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1331)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 36071,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1332)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 36103,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1333)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 36111,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1334)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 36119,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1335)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 37007,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1336)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 37015,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1337)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 37023,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1338)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 37055,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1339)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 37063,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1340)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 37071,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1341)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 37103,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1342)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 37111,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1343)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 37119,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1344)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 38007,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1345)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 38015,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1346)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 38023,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1347)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 38055,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1348)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 38063,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1349)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 38071,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1350)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 38103,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1351)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 38111,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1352)->
    #drop_packageCfg {
    packageId = 312105,
    itemId = 38119,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1353)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 31007,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1354)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 31015,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1355)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 31023,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1356)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 31055,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1357)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 31063,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1358)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 31071,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1359)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 31103,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1360)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 31111,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1361)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 31119,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1362)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 31151,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1363)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 31158,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1364)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 31165,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1365)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 31186,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1366)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 31193,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1367)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 31200,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1368)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 31221,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1369)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 31228,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1370)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 31235,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1371)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 31256,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1372)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 31263,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1373)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 31270,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1374)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 32008,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1375)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 32016,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1376)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 32024,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1377)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 32056,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1378)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 32064,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1379)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 32072,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1380)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 32104,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1381)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 32112,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1382)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 32120,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1383)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 33008,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1384)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 33016,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1385)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 33024,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1386)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 33056,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1387)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 33064,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1388)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 33072,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1389)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 33104,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1390)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 33112,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1391)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 33120,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1392)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 34008,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1393)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 34016,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1394)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 34024,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1395)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 34056,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1396)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 34064,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1397)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 34072,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1398)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 34104,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1399)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 34112,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1400)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 34120,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1401)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 35008,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1402)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 35016,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1403)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 35024,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1404)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 35056,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1405)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 35064,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1406)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 35072,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1407)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 35104,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1408)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 35112,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1409)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 35120,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1410)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 36008,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1411)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 36016,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1412)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 36024,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1413)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 36056,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1414)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 36064,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1415)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 36072,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1416)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 36104,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1417)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 36112,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1418)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 36120,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1419)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 37008,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1420)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 37016,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1421)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 37024,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1422)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 37056,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1423)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 37064,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1424)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 37072,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1425)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 37104,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1426)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 37112,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1427)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 37120,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1428)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 38008,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1429)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 38016,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1430)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 38024,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1431)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 38056,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1432)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 38064,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1433)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 38072,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1434)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 38104,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1435)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 38112,
    min = 1,
    max = 1,
    weight = 2000
    };
getRow(1436)->
    #drop_packageCfg {
    packageId = 312106,
    itemId = 38120,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1437)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 31009,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1438)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 31017,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1439)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 31057,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1440)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 31065,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1441)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 31105,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1442)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 31113,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1443)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 31152,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1444)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 31159,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1445)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 31187,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1446)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 31194,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1447)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 31222,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1448)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 31229,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1449)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 31257,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1450)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 31264,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1451)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 32010,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1452)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 32018,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1453)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 32058,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1454)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 32066,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1455)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 32106,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1456)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 32114,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1457)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 33010,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1458)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 33018,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1459)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 33058,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1460)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 33066,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1461)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 33106,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1462)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 33114,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1463)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 34010,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1464)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 34018,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1465)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 34058,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1466)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 34066,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1467)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 34106,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1468)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 34114,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1469)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 35010,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1470)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 35018,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1471)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 35058,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1472)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 35066,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1473)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 35106,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1474)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 35114,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1475)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 36010,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1476)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 36018,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1477)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 36058,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1478)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 36066,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1479)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 36106,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1480)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 36114,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1481)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 37010,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1482)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 37018,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1483)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 37058,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1484)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 37066,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1485)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 37106,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1486)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 37114,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1487)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 38010,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1488)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 38018,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1489)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 38058,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1490)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 38066,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1491)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 38106,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1492)->
    #drop_packageCfg {
    packageId = 312200,
    itemId = 38114,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1493)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 31010,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1494)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 31018,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1495)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 31058,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1496)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 31066,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1497)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 31106,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1498)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 31114,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1499)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 31153,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1500)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 31160,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1501)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 31188,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1502)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 31195,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1503)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 31223,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1504)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 31230,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1505)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 31258,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1506)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 31265,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1507)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 32011,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1508)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 32019,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1509)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 32059,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1510)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 32067,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1511)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 32107,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1512)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 32115,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1513)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 33011,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1514)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 33019,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1515)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 33059,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1516)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 33067,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1517)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 33107,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1518)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 33115,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1519)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 34011,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1520)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 34019,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1521)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 34059,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1522)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 34067,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1523)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 34107,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1524)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 34115,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1525)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 35011,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1526)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 35019,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1527)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 35059,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1528)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 35067,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1529)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 35107,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1530)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 35115,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1531)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 36011,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1532)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 36019,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1533)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 36059,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1534)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 36067,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1535)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 36107,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1536)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 36115,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1537)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 37011,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1538)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 37019,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1539)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 37059,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1540)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 37067,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1541)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 37107,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1542)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 37115,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1543)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 38011,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1544)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 38019,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1545)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 38059,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1546)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 38067,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1547)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 38107,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1548)->
    #drop_packageCfg {
    packageId = 312201,
    itemId = 38115,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1549)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 31011,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1550)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 31019,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1551)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 31059,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1552)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 31067,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1553)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 31107,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1554)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 31115,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1555)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 31154,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1556)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 31161,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1557)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 31189,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1558)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 31196,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1559)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 31224,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1560)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 31231,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1561)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 31259,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1562)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 31266,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1563)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 32012,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1564)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 32020,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1565)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 32060,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1566)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 32068,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1567)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 32108,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1568)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 32116,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1569)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 33012,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1570)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 33020,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1571)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 33060,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1572)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 33068,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1573)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 33108,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1574)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 33116,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1575)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 34012,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1576)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 34020,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1577)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 34060,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1578)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 34068,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1579)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 34108,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1580)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 34116,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1581)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 35012,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1582)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 35020,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1583)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 35060,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1584)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 35068,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1585)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 35108,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1586)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 35116,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1587)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 36012,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1588)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 36020,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1589)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 36060,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1590)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 36068,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1591)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 36108,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1592)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 36116,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1593)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 37012,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1594)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 37020,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1595)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 37060,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1596)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 37068,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1597)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 37108,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1598)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 37116,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1599)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 38012,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1600)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 38020,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1601)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 38060,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1602)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 38068,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1603)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 38108,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1604)->
    #drop_packageCfg {
    packageId = 312202,
    itemId = 38116,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1605)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 31012,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1606)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 31020,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1607)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 31060,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1608)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 31068,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1609)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 31108,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1610)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 31116,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1611)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 31155,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1612)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 31162,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1613)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 31190,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1614)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 31197,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1615)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 31225,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1616)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 31232,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1617)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 31260,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1618)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 31267,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1619)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 32013,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1620)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 32021,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1621)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 32061,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1622)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 32069,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1623)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 32109,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1624)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 32117,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1625)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 33013,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1626)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 33021,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1627)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 33061,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1628)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 33069,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1629)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 33109,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1630)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 33117,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1631)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 34013,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1632)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 34021,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1633)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 34061,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1634)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 34069,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1635)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 34109,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1636)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 34117,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1637)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 35013,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1638)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 35021,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1639)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 35061,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1640)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 35069,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1641)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 35109,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1642)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 35117,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1643)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 36013,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1644)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 36021,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1645)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 36061,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1646)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 36069,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1647)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 36109,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1648)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 36117,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1649)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 37013,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1650)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 37021,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1651)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 37061,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1652)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 37069,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1653)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 37109,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1654)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 37117,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1655)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 38013,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1656)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 38021,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1657)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 38061,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1658)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 38069,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1659)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 38109,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1660)->
    #drop_packageCfg {
    packageId = 312203,
    itemId = 38117,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1661)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 31013,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1662)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 31021,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1663)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 31061,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1664)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 31069,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1665)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 31109,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1666)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 31117,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1667)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 31156,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1668)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 31163,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1669)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 31191,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1670)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 31198,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1671)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 31226,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1672)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 31233,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1673)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 31261,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1674)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 31268,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1675)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 32014,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1676)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 32022,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1677)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 32062,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1678)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 32070,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1679)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 32110,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1680)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 32118,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1681)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 33014,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1682)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 33022,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1683)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 33062,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1684)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 33070,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1685)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 33110,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1686)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 33118,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1687)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 34014,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1688)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 34022,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1689)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 34062,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1690)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 34070,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1691)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 34110,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1692)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 34118,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1693)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 35014,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1694)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 35022,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1695)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 35062,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1696)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 35070,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1697)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 35110,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1698)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 35118,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1699)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 36014,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1700)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 36022,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1701)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 36062,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1702)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 36070,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1703)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 36110,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1704)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 36118,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1705)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 37014,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1706)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 37022,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1707)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 37062,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1708)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 37070,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1709)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 37110,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1710)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 37118,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1711)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 38014,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1712)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 38022,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1713)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 38062,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1714)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 38070,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1715)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 38110,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1716)->
    #drop_packageCfg {
    packageId = 312204,
    itemId = 38118,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1717)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 31014,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1718)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 31022,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1719)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 31062,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1720)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 31070,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1721)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 31110,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1722)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 31118,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1723)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 31157,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1724)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 31164,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1725)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 31192,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1726)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 31199,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1727)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 31227,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1728)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 31234,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1729)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 31262,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1730)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 31269,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1731)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 32015,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1732)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 32023,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1733)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 32063,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1734)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 32071,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1735)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 32111,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1736)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 32119,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1737)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 33015,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1738)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 33023,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1739)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 33063,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1740)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 33071,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1741)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 33111,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1742)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 33119,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1743)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 34015,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1744)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 34023,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1745)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 34063,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1746)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 34071,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1747)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 34111,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1748)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 34119,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1749)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 35015,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1750)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 35023,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1751)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 35063,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1752)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 35071,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1753)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 35111,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1754)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 35119,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1755)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 36015,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1756)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 36023,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1757)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 36063,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1758)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 36071,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1759)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 36111,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1760)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 36119,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1761)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 37015,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1762)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 37023,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1763)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 37063,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1764)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 37071,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1765)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 37111,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1766)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 37119,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1767)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 38015,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1768)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 38023,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1769)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 38063,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1770)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 38071,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1771)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 38111,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1772)->
    #drop_packageCfg {
    packageId = 312205,
    itemId = 38119,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1773)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 31015,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1774)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 31023,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1775)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 31063,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1776)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 31071,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1777)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 31111,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1778)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 31119,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1779)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 31158,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1780)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 31165,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1781)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 31193,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1782)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 31200,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1783)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 31228,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1784)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 31235,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1785)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 31263,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1786)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 31270,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1787)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 32016,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1788)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 32024,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1789)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 32064,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1790)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 32072,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1791)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 32112,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1792)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 32120,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1793)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 33016,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1794)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 33024,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1795)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 33064,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1796)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 33072,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1797)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 33112,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1798)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 33120,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1799)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 34016,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1800)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 34024,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1801)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 34064,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1802)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 34072,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1803)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 34112,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1804)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 34120,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1805)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 35016,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1806)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 35024,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1807)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 35064,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1808)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 35072,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1809)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 35112,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1810)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 35120,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1811)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 36016,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1812)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 36024,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1813)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 36064,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1814)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 36072,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1815)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 36112,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1816)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 36120,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1817)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 37016,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1818)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 37024,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1819)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 37064,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1820)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 37072,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1821)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 37112,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1822)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 37120,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1823)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 38016,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1824)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 38024,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1825)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 38064,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1826)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 38072,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1827)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 38112,
    min = 1,
    max = 1,
    weight = 6000
    };
getRow(1828)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 38120,
    min = 1,
    max = 1,
    weight = 4000
    };
getRow(1829)->
    #drop_packageCfg {
    packageId = 312206,
    itemId = 38144,
    min = 1,
    max = 1,
    weight = 0
    };
getRow(1830)->
    #drop_packageCfg {
    packageId = 313000,
    itemId = 1911,
    min = 10,
    max = 10,
    weight = 1650
    };
getRow(1831)->
    #drop_packageCfg {
    packageId = 313000,
    itemId = 1921,
    min = 10,
    max = 10,
    weight = 600
    };
getRow(1832)->
    #drop_packageCfg {
    packageId = 313000,
    itemId = 1922,
    min = 10,
    max = 10,
    weight = 600
    };
getRow(1833)->
    #drop_packageCfg {
    packageId = 313000,
    itemId = 1931,
    min = 10,
    max = 10,
    weight = 300
    };
getRow(1834)->
    #drop_packageCfg {
    packageId = 313000,
    itemId = 1933,
    min = 10,
    max = 10,
    weight = 300
    };
getRow(1835)->
    #drop_packageCfg {
    packageId = 313001,
    itemId = 1912,
    min = 10,
    max = 10,
    weight = 1250
    };
getRow(1836)->
    #drop_packageCfg {
    packageId = 313001,
    itemId = 1923,
    min = 10,
    max = 10,
    weight = 600
    };
getRow(1837)->
    #drop_packageCfg {
    packageId = 313001,
    itemId = 1924,
    min = 10,
    max = 10,
    weight = 600
    };
getRow(1838)->
    #drop_packageCfg {
    packageId = 313001,
    itemId = 1932,
    min = 10,
    max = 10,
    weight = 300
    };
getRow(1839)->
    #drop_packageCfg {
    packageId = 313001,
    itemId = 1934,
    min = 10,
    max = 10,
    weight = 300
    };
getRow(1840)->
    #drop_packageCfg {
    packageId = 313001,
    itemId = 1941,
    min = 10,
    max = 10,
    weight = 100
    };
getRow(1841)->
    #drop_packageCfg {
    packageId = 313002,
    itemId = 1913,
    min = 10,
    max = 10,
    weight = 1250
    };
getRow(1842)->
    #drop_packageCfg {
    packageId = 313002,
    itemId = 1925,
    min = 10,
    max = 10,
    weight = 600
    };
getRow(1843)->
    #drop_packageCfg {
    packageId = 313002,
    itemId = 1926,
    min = 10,
    max = 10,
    weight = 600
    };
getRow(1844)->
    #drop_packageCfg {
    packageId = 313002,
    itemId = 1935,
    min = 10,
    max = 10,
    weight = 300
    };
getRow(1845)->
    #drop_packageCfg {
    packageId = 313002,
    itemId = 1936,
    min = 10,
    max = 10,
    weight = 300
    };
getRow(1846)->
    #drop_packageCfg {
    packageId = 313002,
    itemId = 1945,
    min = 10,
    max = 10,
    weight = 100
    };
getRow(1847)->
    #drop_packageCfg {
    packageId = 313003,
    itemId = 1913,
    min = 1,
    max = 1,
    weight = 1250
    };
getRow(1848)->
    #drop_packageCfg {
    packageId = 313003,
    itemId = 1927,
    min = 1,
    max = 1,
    weight = 600
    };
getRow(1849)->
    #drop_packageCfg {
    packageId = 313003,
    itemId = 1937,
    min = 1,
    max = 1,
    weight = 300
    };
getRow(1850)->
    #drop_packageCfg {
    packageId = 313003,
    itemId = 1938,
    min = 1,
    max = 1,
    weight = 300
    };
getRow(1851)->
    #drop_packageCfg {
    packageId = 313003,
    itemId = 1946,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1852)->
    #drop_packageCfg {
    packageId = 319000,
    itemId = 1931,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1853)->
    #drop_packageCfg {
    packageId = 319000,
    itemId = 1932,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1854)->
    #drop_packageCfg {
    packageId = 319000,
    itemId = 1933,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1855)->
    #drop_packageCfg {
    packageId = 319000,
    itemId = 1934,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1856)->
    #drop_packageCfg {
    packageId = 319000,
    itemId = 1935,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1857)->
    #drop_packageCfg {
    packageId = 319000,
    itemId = 1936,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1858)->
    #drop_packageCfg {
    packageId = 319000,
    itemId = 1937,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1859)->
    #drop_packageCfg {
    packageId = 319000,
    itemId = 1938,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1860)->
    #drop_packageCfg {
    packageId = 319000,
    itemId = 1941,
    min = 1,
    max = 1,
    weight = 5
    };
getRow(1861)->
    #drop_packageCfg {
    packageId = 319000,
    itemId = 1942,
    min = 1,
    max = 1,
    weight = 5
    };
getRow(1862)->
    #drop_packageCfg {
    packageId = 319000,
    itemId = 1943,
    min = 1,
    max = 1,
    weight = 5
    };
getRow(1863)->
    #drop_packageCfg {
    packageId = 319000,
    itemId = 1944,
    min = 1,
    max = 1,
    weight = 5
    };
getRow(1864)->
    #drop_packageCfg {
    packageId = 319000,
    itemId = 1945,
    min = 1,
    max = 1,
    weight = 5
    };
getRow(1865)->
    #drop_packageCfg {
    packageId = 319000,
    itemId = 1946,
    min = 1,
    max = 1,
    weight = 5
    };
getRow(1866)->
    #drop_packageCfg {
    packageId = 319000,
    itemId = 1947,
    min = 1,
    max = 1,
    weight = 5
    };
getRow(1867)->
    #drop_packageCfg {
    packageId = 319000,
    itemId = 1948,
    min = 1,
    max = 1,
    weight = 5
    };
getRow(1868)->
    #drop_packageCfg {
    packageId = 319001,
    itemId = 1931,
    min = 1,
    max = 1,
    weight = 2
    };
getRow(1869)->
    #drop_packageCfg {
    packageId = 319001,
    itemId = 1932,
    min = 1,
    max = 1,
    weight = 2
    };
getRow(1870)->
    #drop_packageCfg {
    packageId = 319001,
    itemId = 1933,
    min = 1,
    max = 1,
    weight = 2
    };
getRow(1871)->
    #drop_packageCfg {
    packageId = 319001,
    itemId = 1934,
    min = 1,
    max = 1,
    weight = 2
    };
getRow(1872)->
    #drop_packageCfg {
    packageId = 319001,
    itemId = 1935,
    min = 1,
    max = 1,
    weight = 2
    };
getRow(1873)->
    #drop_packageCfg {
    packageId = 319001,
    itemId = 1936,
    min = 1,
    max = 1,
    weight = 2
    };
getRow(1874)->
    #drop_packageCfg {
    packageId = 319001,
    itemId = 1937,
    min = 1,
    max = 1,
    weight = 2
    };
getRow(1875)->
    #drop_packageCfg {
    packageId = 319001,
    itemId = 1938,
    min = 1,
    max = 1,
    weight = 2
    };
getRow(1876)->
    #drop_packageCfg {
    packageId = 319002,
    itemId = 1831,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1877)->
    #drop_packageCfg {
    packageId = 319002,
    itemId = 1832,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1878)->
    #drop_packageCfg {
    packageId = 319002,
    itemId = 1833,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1879)->
    #drop_packageCfg {
    packageId = 319002,
    itemId = 1834,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1880)->
    #drop_packageCfg {
    packageId = 319002,
    itemId = 1835,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1881)->
    #drop_packageCfg {
    packageId = 319002,
    itemId = 1836,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1882)->
    #drop_packageCfg {
    packageId = 319002,
    itemId = 1837,
    min = 1,
    max = 1,
    weight = 10
    };
getRow(1883)->
    #drop_packageCfg {
    packageId = 319002,
    itemId = 1838,
    min = 1,
    max = 1,
    weight = 10
    };
getRow(1884)->
    #drop_packageCfg {
    packageId = 331000,
    itemId = 1921,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1885)->
    #drop_packageCfg {
    packageId = 331000,
    itemId = 1922,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1886)->
    #drop_packageCfg {
    packageId = 331000,
    itemId = 1923,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1887)->
    #drop_packageCfg {
    packageId = 331000,
    itemId = 1924,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1888)->
    #drop_packageCfg {
    packageId = 331000,
    itemId = 1925,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1889)->
    #drop_packageCfg {
    packageId = 331000,
    itemId = 1926,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1890)->
    #drop_packageCfg {
    packageId = 331000,
    itemId = 1927,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1891)->
    #drop_packageCfg {
    packageId = 331001,
    itemId = 1931,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1892)->
    #drop_packageCfg {
    packageId = 331001,
    itemId = 1932,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1893)->
    #drop_packageCfg {
    packageId = 331001,
    itemId = 1933,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1894)->
    #drop_packageCfg {
    packageId = 331001,
    itemId = 1934,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1895)->
    #drop_packageCfg {
    packageId = 331001,
    itemId = 1935,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1896)->
    #drop_packageCfg {
    packageId = 331001,
    itemId = 1936,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1897)->
    #drop_packageCfg {
    packageId = 331001,
    itemId = 1937,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1898)->
    #drop_packageCfg {
    packageId = 331001,
    itemId = 1938,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1899)->
    #drop_packageCfg {
    packageId = 331002,
    itemId = 1941,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1900)->
    #drop_packageCfg {
    packageId = 331002,
    itemId = 1945,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1901)->
    #drop_packageCfg {
    packageId = 331002,
    itemId = 1946,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1902)->
    #drop_packageCfg {
    packageId = 369000,
    itemId = 26005,
    min = 1,
    max = 1,
    weight = 200
    };
getRow(1903)->
    #drop_packageCfg {
    packageId = 369000,
    itemId = 26004,
    min = 1,
    max = 1,
    weight = 300
    };
getRow(1904)->
    #drop_packageCfg {
    packageId = 369000,
    itemId = 26003,
    min = 1,
    max = 1,
    weight = 500
    };
getRow(1905)->
    #drop_packageCfg {
    packageId = 369001,
    itemId = 26106,
    min = 1,
    max = 1,
    weight = 500
    };
getRow(1906)->
    #drop_packageCfg {
    packageId = 369001,
    itemId = 26107,
    min = 1,
    max = 1,
    weight = 500
    };
getRow(1907)->
    #drop_packageCfg {
    packageId = 369002,
    itemId = 26100,
    min = 1,
    max = 1,
    weight = 500
    };
getRow(1908)->
    #drop_packageCfg {
    packageId = 369002,
    itemId = 26101,
    min = 1,
    max = 1,
    weight = 500
    };
getRow(1909)->
    #drop_packageCfg {
    packageId = 369002,
    itemId = 26103,
    min = 1,
    max = 1,
    weight = 300
    };
getRow(1910)->
    #drop_packageCfg {
    packageId = 369002,
    itemId = 26104,
    min = 1,
    max = 1,
    weight = 300
    };
getRow(1911)->
    #drop_packageCfg {
    packageId = 369002,
    itemId = 26102,
    min = 1,
    max = 1,
    weight = 200
    };
getRow(1912)->
    #drop_packageCfg {
    packageId = 369003,
    itemId = 26121,
    min = 1,
    max = 1,
    weight = 500
    };
getRow(1913)->
    #drop_packageCfg {
    packageId = 369003,
    itemId = 26122,
    min = 1,
    max = 1,
    weight = 500
    };
getRow(1914)->
    #drop_packageCfg {
    packageId = 369004,
    itemId = 26123,
    min = 1,
    max = 1,
    weight = 500
    };
getRow(1915)->
    #drop_packageCfg {
    packageId = 369004,
    itemId = 26124,
    min = 1,
    max = 1,
    weight = 500
    };
getRow(1916)->
    #drop_packageCfg {
    packageId = 369004,
    itemId = 26125,
    min = 1,
    max = 1,
    weight = 300
    };
getRow(1917)->
    #drop_packageCfg {
    packageId = 369004,
    itemId = 26126,
    min = 1,
    max = 1,
    weight = 300
    };
getRow(1918)->
    #drop_packageCfg {
    packageId = 369004,
    itemId = 26127,
    min = 1,
    max = 1,
    weight = 200
    };
getRow(1919)->
    #drop_packageCfg {
    packageId = 410000,
    itemId = 222,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1920)->
    #drop_packageCfg {
    packageId = 410000,
    itemId = 224,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1921)->
    #drop_packageCfg {
    packageId = 410000,
    itemId = 225,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1922)->
    #drop_packageCfg {
    packageId = 410000,
    itemId = 226,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1923)->
    #drop_packageCfg {
    packageId = 410000,
    itemId = 2160,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1924)->
    #drop_packageCfg {
    packageId = 410000,
    itemId = 2161,
    min = 1,
    max = 1,
    weight = 100
    };
getRow(1925)->
    #drop_packageCfg {
    packageId = 410000,
    itemId = 4303,
    min = 1,
    max = 1,
    weight = 20
    };
getRow(1926)->
    #drop_packageCfg {
    packageId = 410000,
    itemId = 4304,
    min = 1,
    max = 1,
    weight = 20
    };
getRow(1927)->
    #drop_packageCfg {
    packageId = 410000,
    itemId = 4305,
    min = 1,
    max = 1,
    weight = 20
    };
getRow(1928)->
    #drop_packageCfg {
    packageId = 410000,
    itemId = 201,
    min = 1,
    max = 1,
    weight = 20
    };
getRow(1929)->
    #drop_packageCfg {
    packageId = 410000,
    itemId = 28000,
    min = 1,
    max = 1,
    weight = 5
    };
getRow(1930)->
    #drop_packageCfg {
    packageId = 410000,
    itemId = 28001,
    min = 1,
    max = 1,
    weight = 5
    };
getRow(1931)->
    #drop_packageCfg {
    packageId = 410000,
    itemId = 28010,
    min = 1,
    max = 1,
    weight = 5
    };
getRow(1932)->
    #drop_packageCfg {
    packageId = 410000,
    itemId = 28011,
    min = 1,
    max = 1,
    weight = 5
    };
getRow(1933)->
    #drop_packageCfg {
    packageId = 410000,
    itemId = 28020,
    min = 1,
    max = 1,
    weight = 5
    };
getRow(1934)->
    #drop_packageCfg {
    packageId = 410000,
    itemId = 28021,
    min = 1,
    max = 1,
    weight = 5
    };
getRow(1935)->
    #drop_packageCfg {
    packageId = 420000,
    itemId = 222,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(1936)->
    #drop_packageCfg {
    packageId = 420000,
    itemId = 224,
    min = 1,
    max = 1,
    weight = 1000
    };
getRow(1937)->
    #drop_packageCfg {
    packageId = 420000,
    itemId = 229,
    min = 1,
    max = 1,
    weight = 1000
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
    {1937}
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
    1937
    ].

getKey(1)->[
    1,
    2
    ];
getKey(2)->[
    3,
    4
    ];
getKey(11)->[
    5,
    6,
    7
    ];
getKey(12)->[
    8,
    9,
    10
    ];
getKey(13)->[
    11,
    12,
    13
    ];
getKey(14)->[
    14,
    15,
    16
    ];
getKey(15)->[
    17,
    18,
    19
    ];
getKey(16)->[
    20,
    21,
    22
    ];
getKey(17)->[
    23,
    24,
    25
    ];
getKey(18)->[
    26,
    27,
    28
    ];
getKey(19)->[
    29,
    30,
    31
    ];
getKey(20)->[
    32,
    33,
    34
    ];
getKey(201)->[
    35,
    36,
    37,
    38,
    39,
    40,
    41
    ];
getKey(1800)->[
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
    67
    ];
getKey(8000)->[
    68,
    69,
    70,
    71,
    72,
    73,
    74
    ];
getKey(8001)->[
    75,
    76,
    77,
    78,
    79,
    80,
    81
    ];
getKey(8002)->[
    82,
    83,
    84,
    85,
    86,
    87,
    88
    ];
getKey(18001)->[
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
    101
    ];
getKey(35000)->[
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
    119
    ];
getKey(35010)->[
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
    137
    ];
getKey(35020)->[
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
    155
    ];
getKey(250000)->[
    156,
    157,
    158,
    159,
    160,
    161,
    162
    ];
getKey(250001)->[
    163,
    164,
    165,
    166,
    167,
    168,
    169
    ];
getKey(250002)->[
    170,
    171,
    172,
    173,
    174,
    175,
    176
    ];
getKey(251000)->[
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
    190
    ];
getKey(251001)->[
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
    204
    ];
getKey(251002)->[
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
    218
    ];
getKey(252000)->[
    219,
    220,
    221,
    222,
    223,
    224,
    225
    ];
getKey(252001)->[
    226,
    227,
    228,
    229,
    230,
    231,
    232
    ];
getKey(252002)->[
    233,
    234,
    235,
    236,
    237,
    238,
    239
    ];
getKey(260000)->[
    240,
    241,
    242,
    243,
    244,
    245,
    246
    ];
getKey(260001)->[
    247,
    248,
    249,
    250,
    251,
    252,
    253
    ];
getKey(260002)->[
    254,
    255,
    256,
    257,
    258,
    259,
    260
    ];
getKey(312000)->[
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
    344
    ];
getKey(312001)->[
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
    428
    ];
getKey(312002)->[
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
    512
    ];
getKey(312003)->[
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
    596
    ];
getKey(312004)->[
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
    680
    ];
getKey(312005)->[
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
    764
    ];
getKey(312006)->[
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
    848
    ];
getKey(312100)->[
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
    932
    ];
getKey(312101)->[
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
    1016
    ];
getKey(312102)->[
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
    1100
    ];
getKey(312103)->[
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
    1184
    ];
getKey(312104)->[
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
    1268
    ];
getKey(312105)->[
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
    1352
    ];
getKey(312106)->[
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
    1436
    ];
getKey(312200)->[
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
    1492
    ];
getKey(312201)->[
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
    1548
    ];
getKey(312202)->[
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
    1604
    ];
getKey(312203)->[
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
    1660
    ];
getKey(312204)->[
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
    1716
    ];
getKey(312205)->[
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
    1772
    ];
getKey(312206)->[
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
    1829
    ];
getKey(313000)->[
    1830,
    1831,
    1832,
    1833,
    1834
    ];
getKey(313001)->[
    1835,
    1836,
    1837,
    1838,
    1839,
    1840
    ];
getKey(313002)->[
    1841,
    1842,
    1843,
    1844,
    1845,
    1846
    ];
getKey(313003)->[
    1847,
    1848,
    1849,
    1850,
    1851
    ];
getKey(319000)->[
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
    1867
    ];
getKey(319001)->[
    1868,
    1869,
    1870,
    1871,
    1872,
    1873,
    1874,
    1875
    ];
getKey(319002)->[
    1876,
    1877,
    1878,
    1879,
    1880,
    1881,
    1882,
    1883
    ];
getKey(331000)->[
    1884,
    1885,
    1886,
    1887,
    1888,
    1889,
    1890
    ];
getKey(331001)->[
    1891,
    1892,
    1893,
    1894,
    1895,
    1896,
    1897,
    1898
    ];
getKey(331002)->[
    1899,
    1900,
    1901
    ];
getKey(369000)->[
    1902,
    1903,
    1904
    ];
getKey(369001)->[
    1905,
    1906
    ];
getKey(369002)->[
    1907,
    1908,
    1909,
    1910,
    1911
    ];
getKey(369003)->[
    1912,
    1913
    ];
getKey(369004)->[
    1914,
    1915,
    1916,
    1917,
    1918
    ];
getKey(410000)->[
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
    1934
    ];
getKey(420000)->[
    1935,
    1936,
    1937
    ];
getKey(_)->[].
