%% coding: latin-1
%%: 实现
-module(cfg_equipIntenLevel_chs).
-compile(export_all).
-include("cfg_equipIntenLevel.hrl").
-include("logger.hrl").

getRow(1)->
    #equipIntenLevelCfg {
    level = 1,
    bonus = [{135,385,0},{136,38,0},{137,38,0},{138,38,0},{139,38,0},{140,30,0},{141,21,0},{142,18,0},{143,15,0},{144,16,0},{145,23,0},{146,15,0},{160,10,0}],
    materialCost = [{222,2}],
    materialTransform = [],
    suitIs = 0,
    allBonus = [{135,0,0},{136,0,0},{137,0,0},{138,0,0},{139,0,0},{140,0,0},{141,0,0},{142,0,0},{143,0,0},{144,0,0},{145,0,0},{146,0,0},{160,0,0}],
    vfxLv = -1
    };
getRow(2)->
    #equipIntenLevelCfg {
    level = 2,
    bonus = [{135,508,0},{136,50,0},{137,50,0},{138,50,0},{139,50,0},{140,40,0},{141,28,0},{142,24,0},{143,20,0},{144,21,0},{145,30,0},{146,20,0},{160,14,0}],
    materialCost = [{222,3}],
    materialTransform = [],
    suitIs = 0,
    allBonus = [{135,0,0},{136,0,0},{137,0,0},{138,0,0},{139,0,0},{140,0,0},{141,0,0},{142,0,0},{143,0,0},{144,0,0},{145,0,0},{146,0,0},{160,0,0}],
    vfxLv = -1
    };
getRow(3)->
    #equipIntenLevelCfg {
    level = 3,
    bonus = [{135,758,0},{136,75,0},{137,75,0},{138,75,0},{139,75,0},{140,60,0},{141,42,0},{142,36,0},{143,30,0},{144,31,0},{145,45,0},{146,30,0},{160,21,0}],
    materialCost = [{222,4}],
    materialTransform = [],
    suitIs = 0,
    allBonus = [{135,0,0},{136,0,0},{137,0,0},{138,0,0},{139,0,0},{140,0,0},{141,0,0},{142,0,0},{143,0,0},{144,0,0},{145,0,0},{146,0,0},{160,0,0}],
    vfxLv = -1
    };
getRow(4)->
    #equipIntenLevelCfg {
    level = 4,
    bonus = [{135,1099,0},{136,109,0},{137,109,0},{138,109,0},{139,109,0},{140,87,0},{141,61,0},{142,52,0},{143,44,0},{144,46,0},{145,65,0},{146,43,0},{160,30,0}],
    materialCost = [{222,5}],
    materialTransform = [],
    suitIs = 0,
    allBonus = [{135,0,0},{136,0,0},{137,0,0},{138,0,0},{139,0,0},{140,0,0},{141,0,0},{142,0,0},{143,0,0},{144,0,0},{145,0,0},{146,0,0},{160,0,0}],
    vfxLv = -1
    };
getRow(5)->
    #equipIntenLevelCfg {
    level = 5,
    bonus = [{135,1517,0},{136,151,0},{137,151,0},{138,151,0},{139,151,0},{140,120,0},{141,85,0},{142,73,0},{143,61,0},{144,63,0},{145,91,0},{146,60,0},{160,42,0}],
    materialCost = [{222,6}],
    materialTransform = [],
    suitIs = 1,
    allBonus = [{135,505,0},{136,50,0},{137,50,0},{138,50,0},{139,50,0},{140,40,0},{141,28,0},{142,24,0},{143,20,0},{144,21,0},{145,30,0},{146,20,0},{160,14,0}],
    vfxLv = -1
    };
getRow(6)->
    #equipIntenLevelCfg {
    level = 6,
    bonus = [{135,2003,0},{136,200,0},{137,200,0},{138,200,0},{139,200,0},{140,159,0},{141,112,0},{142,96,0},{143,81,0},{144,84,0},{145,120,0},{146,80,0},{160,56,0}],
    materialCost = [{222,7}],
    materialTransform = [],
    suitIs = 0,
    allBonus = [{135,505,0},{136,50,0},{137,50,0},{138,50,0},{139,50,0},{140,40,0},{141,28,0},{142,24,0},{143,20,0},{144,21,0},{145,30,0},{146,20,0},{160,14,0}],
    vfxLv = -1
    };
getRow(7)->
    #equipIntenLevelCfg {
    level = 7,
    bonus = [{135,2551,0},{136,255,0},{137,255,0},{138,255,0},{139,255,0},{140,203,0},{141,143,0},{142,122,0},{143,103,0},{144,107,0},{145,153,0},{146,102,0},{160,71,0}],
    materialCost = [{222,8}],
    materialTransform = [],
    suitIs = 0,
    allBonus = [{135,505,0},{136,50,0},{137,50,0},{138,50,0},{139,50,0},{140,40,0},{141,28,0},{142,24,0},{143,20,0},{144,21,0},{145,30,0},{146,20,0},{160,14,0}],
    vfxLv = -1
    };
getRow(8)->
    #equipIntenLevelCfg {
    level = 8,
    bonus = [{135,3158,0},{136,315,0},{137,315,0},{138,315,0},{139,315,0},{140,251,0},{141,177,0},{142,152,0},{143,128,0},{144,132,0},{145,189,0},{146,126,0},{160,88,0}],
    materialCost = [{222,10}],
    materialTransform = [],
    suitIs = 0,
    allBonus = [{135,505,0},{136,50,0},{137,50,0},{138,50,0},{139,50,0},{140,40,0},{141,28,0},{142,24,0},{143,20,0},{144,21,0},{145,30,0},{146,20,0},{160,14,0}],
    vfxLv = -1
    };
getRow(9)->
    #equipIntenLevelCfg {
    level = 9,
    bonus = [{135,3818,0},{136,381,0},{137,381,0},{138,381,0},{139,381,0},{140,304,0},{141,214,0},{142,183,0},{143,155,0},{144,160,0},{145,229,0},{146,152,0},{160,107,0}],
    materialCost = [{222,12}],
    materialTransform = [],
    suitIs = 0,
    allBonus = [{135,505,0},{136,50,0},{137,50,0},{138,50,0},{139,50,0},{140,40,0},{141,28,0},{142,24,0},{143,20,0},{144,21,0},{145,30,0},{146,20,0},{160,14,0}],
    vfxLv = -1
    };
getRow(10)->
    #equipIntenLevelCfg {
    level = 10,
    bonus = [{135,4530,0},{136,453,0},{137,453,0},{138,453,0},{139,453,0},{140,360,0},{141,254,0},{142,218,0},{143,184,0},{144,189,0},{145,271,0},{146,181,0},{160,127,0}],
    materialCost = [{222,15}],
    materialTransform = [],
    suitIs = 1,
    allBonus = [{135,1510,0},{136,151,0},{137,151,0},{138,151,0},{139,151,0},{140,120,0},{141,84,0},{142,72,0},{143,61,0},{144,63,0},{145,90,0},{146,60,0},{160,42,0}],
    vfxLv = -1
    };
getRow(11)->
    #equipIntenLevelCfg {
    level = 11,
    bonus = [{135,5291,0},{136,529,0},{137,529,0},{138,529,0},{139,529,0},{140,421,0},{141,296,0},{142,254,0},{143,215,0},{144,221,0},{145,317,0},{146,211,0},{160,148,0}],
    materialCost = [{222,18}],
    materialTransform = [],
    suitIs = 0,
    allBonus = [{135,1510,0},{136,151,0},{137,151,0},{138,151,0},{139,151,0},{140,120,0},{141,84,0},{142,72,0},{143,61,0},{144,63,0},{145,90,0},{146,60,0},{160,42,0}],
    vfxLv = -1
    };
getRow(12)->
    #equipIntenLevelCfg {
    level = 12,
    bonus = [{135,6099,0},{136,609,0},{137,609,0},{138,609,0},{139,609,0},{140,485,0},{141,342,0},{142,293,0},{143,248,0},{144,255,0},{145,365,0},{146,243,0},{160,171,0}],
    materialCost = [{222,21}],
    materialTransform = [],
    suitIs = 0,
    allBonus = [{135,1510,0},{136,151,0},{137,151,0},{138,151,0},{139,151,0},{140,120,0},{141,84,0},{142,72,0},{143,61,0},{144,63,0},{145,90,0},{146,60,0},{160,42,0}],
    vfxLv = -1
    };
getRow(13)->
    #equipIntenLevelCfg {
    level = 13,
    bonus = [{135,6953,0},{136,695,0},{137,695,0},{138,695,0},{139,695,0},{140,553,0},{141,390,0},{142,334,0},{143,283,0},{144,291,0},{145,417,0},{146,278,0},{160,195,0}],
    materialCost = [{222,24}],
    materialTransform = [],
    suitIs = 0,
    allBonus = [{135,1510,0},{136,151,0},{137,151,0},{138,151,0},{139,151,0},{140,120,0},{141,84,0},{142,72,0},{143,61,0},{144,63,0},{145,90,0},{146,60,0},{160,42,0}],
    vfxLv = -1
    };
getRow(14)->
    #equipIntenLevelCfg {
    level = 14,
    bonus = [{135,7851,0},{136,785,0},{137,785,0},{138,785,0},{139,785,0},{140,625,0},{141,440,0},{142,378,0},{143,319,0},{144,329,0},{145,471,0},{146,314,0},{160,221,0}],
    materialCost = [{222,27}],
    materialTransform = [],
    suitIs = 1,
    allBonus = [{135,2617,0},{136,261,0},{137,261,0},{138,261,0},{139,261,0},{140,208,0},{141,146,0},{142,126,0},{143,106,0},{144,109,0},{145,157,0},{146,104,0},{160,73,0}],
    vfxLv = -1
    };
getRow(15)->
    #equipIntenLevelCfg {
    level = 15,
    bonus = [{135,8790,0},{136,879,0},{137,879,0},{138,879,0},{139,879,0},{140,699,0},{141,493,0},{142,423,0},{143,358,0},{144,368,0},{145,527,0},{146,351,0},{160,247,0}],
    materialCost = [{222,30}],
    materialTransform = [],
    suitIs = 0,
    allBonus = [{135,2617,0},{136,261,0},{137,261,0},{138,261,0},{139,261,0},{140,208,0},{141,146,0},{142,126,0},{143,106,0},{144,109,0},{145,157,0},{146,104,0},{160,73,0}],
    vfxLv = -1
    };
getRow(16)->
    #equipIntenLevelCfg {
    level = 16,
    bonus = [{135,9771,0},{136,977,0},{137,977,0},{138,977,0},{139,977,0},{140,778,0},{141,548,0},{142,470,0},{143,398,0},{144,409,0},{145,586,0},{146,390,0},{160,275,0}],
    materialCost = [{222,33}],
    materialTransform = [],
    suitIs = 0,
    allBonus = [{135,2617,0},{136,261,0},{137,261,0},{138,261,0},{139,261,0},{140,208,0},{141,146,0},{142,126,0},{143,106,0},{144,109,0},{145,157,0},{146,104,0},{160,73,0}],
    vfxLv = -1
    };
getRow(17)->
    #equipIntenLevelCfg {
    level = 17,
    bonus = [{135,10793,0},{136,1079,0},{137,1079,0},{138,1079,0},{139,1079,0},{140,859,0},{141,605,0},{142,519,0},{143,439,0},{144,452,0},{145,647,0},{146,431,0},{160,303,0}],
    materialCost = [{222,36}],
    materialTransform = [],
    suitIs = 0,
    allBonus = [{135,2617,0},{136,261,0},{137,261,0},{138,261,0},{139,261,0},{140,208,0},{141,146,0},{142,126,0},{143,106,0},{144,109,0},{145,157,0},{146,104,0},{160,73,0}],
    vfxLv = -1
    };
getRow(18)->
    #equipIntenLevelCfg {
    level = 18,
    bonus = [{135,11853,0},{136,1185,0},{137,1185,0},{138,1185,0},{139,1185,0},{140,943,0},{141,665,0},{142,570,0},{143,482,0},{144,497,0},{145,711,0},{146,474,0},{160,333,0}],
    materialCost = [{222,41}],
    materialTransform = [],
    suitIs = 1,
    allBonus = [{135,3951,0},{136,395,0},{137,395,0},{138,395,0},{139,395,0},{140,314,0},{141,221,0},{142,190,0},{143,160,0},{144,165,0},{145,237,0},{146,158,0},{160,111,0}],
    vfxLv = -1
    };
getRow(19)->
    #equipIntenLevelCfg {
    level = 19,
    bonus = [{135,12951,0},{136,1295,0},{137,1295,0},{138,1295,0},{139,1295,0},{140,1031,0},{141,726,0},{142,623,0},{143,527,0},{144,543,0},{145,777,0},{146,518,0},{160,364,0}],
    materialCost = [{222,46}],
    materialTransform = [],
    suitIs = 0,
    allBonus = [{135,3951,0},{136,395,0},{137,395,0},{138,395,0},{139,395,0},{140,314,0},{141,221,0},{142,190,0},{143,160,0},{144,165,0},{145,237,0},{146,158,0},{160,111,0}],
    vfxLv = -1
    };
getRow(20)->
    #equipIntenLevelCfg {
    level = 20,
    bonus = [{135,14086,0},{136,1408,0},{137,1408,0},{138,1408,0},{139,1408,0},{140,1121,0},{141,790,0},{142,678,0},{143,573,0},{144,590,0},{145,845,0},{146,563,0},{160,396,0}],
    materialCost = [{222,51}],
    materialTransform = [],
    suitIs = 0,
    allBonus = [{135,3951,0},{136,395,0},{137,395,0},{138,395,0},{139,395,0},{140,314,0},{141,221,0},{142,190,0},{143,160,0},{144,165,0},{145,237,0},{146,158,0},{160,111,0}],
    vfxLv = -1
    };
getRow(21)->
    #equipIntenLevelCfg {
    level = 21,
    bonus = [{135,15258,0},{136,1525,0},{137,1525,0},{138,1525,0},{139,1525,0},{140,1215,0},{141,856,0},{142,734,0},{143,621,0},{144,639,0},{145,915,0},{146,610,0},{160,429,0}],
    materialCost = [{224,19}],
    materialTransform = [{222,3}],
    suitIs = 0,
    allBonus = [{135,3951,0},{136,395,0},{137,395,0},{138,395,0},{139,395,0},{140,314,0},{141,221,0},{142,190,0},{143,160,0},{144,165,0},{145,237,0},{146,158,0},{160,111,0}],
    vfxLv = -1
    };
getRow(22)->
    #equipIntenLevelCfg {
    level = 22,
    bonus = [{135,16466,0},{136,1646,0},{137,1646,0},{138,1646,0},{139,1646,0},{140,1311,0},{141,923,0},{142,792,0},{143,670,0},{144,690,0},{145,987,0},{146,658,0},{160,463,0}],
    materialCost = [{224,20}],
    materialTransform = [{222,3}],
    suitIs = 1,
    allBonus = [{135,5488,0},{136,548,0},{137,548,0},{138,548,0},{139,548,0},{140,437,0},{141,307,0},{142,264,0},{143,223,0},{144,230,0},{145,329,0},{146,219,0},{160,154,0}],
    vfxLv = -1
    };
getRow(23)->
    #equipIntenLevelCfg {
    level = 23,
    bonus = [{135,17709,0},{136,1770,0},{137,1770,0},{138,1770,0},{139,1770,0},{140,1410,0},{141,993,0},{142,852,0},{143,721,0},{144,742,0},{145,1062,0},{146,708,0},{160,498,0}],
    materialCost = [{224,22}],
    materialTransform = [{222,3}],
    suitIs = 0,
    allBonus = [{135,5488,0},{136,548,0},{137,548,0},{138,548,0},{139,548,0},{140,437,0},{141,307,0},{142,264,0},{143,223,0},{144,230,0},{145,329,0},{146,219,0},{160,154,0}],
    vfxLv = -1
    };
getRow(24)->
    #equipIntenLevelCfg {
    level = 24,
    bonus = [{135,18986,0},{136,1898,0},{137,1898,0},{138,1898,0},{139,1898,0},{140,1511,0},{141,1065,0},{142,914,0},{143,773,0},{144,796,0},{145,1139,0},{146,759,0},{160,534,0}],
    materialCost = [{224,24}],
    materialTransform = [{222,3}],
    suitIs = 0,
    allBonus = [{135,5488,0},{136,548,0},{137,548,0},{138,548,0},{139,548,0},{140,437,0},{141,307,0},{142,264,0},{143,223,0},{144,230,0},{145,329,0},{146,219,0},{160,154,0}],
    vfxLv = -1
    };
getRow(25)->
    #equipIntenLevelCfg {
    level = 25,
    bonus = [{135,20296,0},{136,2029,0},{137,2029,0},{138,2029,0},{139,2029,0},{140,1616,0},{141,1138,0},{142,977,0},{143,826,0},{144,851,0},{145,1217,0},{146,811,0},{160,571,0}],
    materialCost = [{224,25}],
    materialTransform = [{222,3}],
    suitIs = 1,
    allBonus = [{135,6765,0},{136,676,0},{137,676,0},{138,676,0},{139,676,0},{140,538,0},{141,379,0},{142,325,0},{143,275,0},{144,283,0},{145,405,0},{146,270,0},{160,190,0}],
    vfxLv = -1
    };
getRow(26)->
    #equipIntenLevelCfg {
    level = 26,
    bonus = [{135,21640,0},{136,2164,0},{137,2164,0},{138,2164,0},{139,2164,0},{140,1723,0},{141,1214,0},{142,1041,0},{143,881,0},{144,907,0},{145,1298,0},{146,865,0},{160,609,0}],
    materialCost = [{224,27}],
    materialTransform = [{222,3}],
    suitIs = 0,
    allBonus = [{135,6765,0},{136,676,0},{137,676,0},{138,676,0},{139,676,0},{140,538,0},{141,379,0},{142,325,0},{143,275,0},{144,283,0},{145,405,0},{146,270,0},{160,190,0}],
    vfxLv = -1
    };
getRow(27)->
    #equipIntenLevelCfg {
    level = 27,
    bonus = [{135,23017,0},{136,2301,0},{137,2301,0},{138,2301,0},{139,2301,0},{140,1832,0},{141,1291,0},{142,1108,0},{143,937,0},{144,965,0},{145,1381,0},{146,920,0},{160,647,0}],
    materialCost = [{224,29}],
    materialTransform = [{222,3}],
    suitIs = 0,
    allBonus = [{135,6765,0},{136,676,0},{137,676,0},{138,676,0},{139,676,0},{140,538,0},{141,379,0},{142,325,0},{143,275,0},{144,283,0},{145,405,0},{146,270,0},{160,190,0}],
    vfxLv = -1
    };
getRow(28)->
    #equipIntenLevelCfg {
    level = 28,
    bonus = [{135,24426,0},{136,2442,0},{137,2442,0},{138,2442,0},{139,2442,0},{140,1944,0},{141,1370,0},{142,1176,0},{143,995,0},{144,1024,0},{145,1465,0},{146,977,0},{160,687,0}],
    materialCost = [{224,30}],
    materialTransform = [{222,3}],
    suitIs = 1,
    allBonus = [{135,8142,0},{136,814,0},{137,814,0},{138,814,0},{139,814,0},{140,648,0},{141,456,0},{142,392,0},{143,331,0},{144,341,0},{145,488,0},{146,325,0},{160,229,0}],
    vfxLv = -1
    };
getRow(29)->
    #equipIntenLevelCfg {
    level = 29,
    bonus = [{135,25866,0},{136,2586,0},{137,2586,0},{138,2586,0},{139,2586,0},{140,2059,0},{141,1451,0},{142,1245,0},{143,1053,0},{144,1084,0},{145,1551,0},{146,1034,0},{160,728,0}],
    materialCost = [{224,32}],
    materialTransform = [{222,3}],
    suitIs = 0,
    allBonus = [{135,8142,0},{136,814,0},{137,814,0},{138,814,0},{139,814,0},{140,648,0},{141,456,0},{142,392,0},{143,331,0},{144,341,0},{145,488,0},{146,325,0},{160,229,0}],
    vfxLv = -1
    };
getRow(30)->
    #equipIntenLevelCfg {
    level = 30,
    bonus = [{135,27338,0},{136,2733,0},{137,2733,0},{138,2733,0},{139,2733,0},{140,2176,0},{141,1534,0},{142,1316,0},{143,1113,0},{144,1146,0},{145,1640,0},{146,1093,0},{160,769,0}],
    materialCost = [{224,34}],
    materialTransform = [{222,3}],
    suitIs = 1,
    allBonus = [{135,9112,0},{136,911,0},{137,911,0},{138,911,0},{139,911,0},{140,725,0},{141,511,0},{142,438,0},{143,371,0},{144,382,0},{145,546,0},{146,364,0},{160,256,0}],
    vfxLv = -1
    };
getRow(31)->
    #equipIntenLevelCfg {
    level = 31,
    bonus = [{135,28840,0},{136,2884,0},{137,2884,0},{138,2884,0},{139,2884,0},{140,2296,0},{141,1618,0},{142,1388,0},{143,1175,0},{144,1209,0},{145,1730,0},{146,1153,0},{160,811,0}],
    materialCost = [{224,36}],
    materialTransform = [{222,3}],
    suitIs = 0,
    allBonus = [{135,9112,0},{136,911,0},{137,911,0},{138,911,0},{139,911,0},{140,725,0},{141,511,0},{142,438,0},{143,371,0},{144,382,0},{145,546,0},{146,364,0},{160,256,0}],
    vfxLv = -1
    };
getRow(32)->
    #equipIntenLevelCfg {
    level = 32,
    bonus = [{135,30373,0},{136,3037,0},{137,3037,0},{138,3037,0},{139,3037,0},{140,2418,0},{141,1704,0},{142,1462,0},{143,1237,0},{144,1273,0},{145,1822,0},{146,1214,0},{160,854,0}],
    materialCost = [{224,38}],
    materialTransform = [{222,3}],
    suitIs = 1,
    allBonus = [{135,10124,0},{136,1012,0},{137,1012,0},{138,1012,0},{139,1012,0},{140,806,0},{141,568,0},{142,487,0},{143,412,0},{144,424,0},{145,607,0},{146,404,0},{160,284,0}],
    vfxLv = -1
    };
getRow(33)->
    #equipIntenLevelCfg {
    level = 33,
    bonus = [{135,31936,0},{136,3193,0},{137,3193,0},{138,3193,0},{139,3193,0},{140,2542,0},{141,1791,0},{142,1537,0},{143,1301,0},{144,1339,0},{145,1916,0},{146,1277,0},{160,898,0}],
    materialCost = [{224,40}],
    materialTransform = [{222,3}],
    suitIs = 0,
    allBonus = [{135,10124,0},{136,1012,0},{137,1012,0},{138,1012,0},{139,1012,0},{140,806,0},{141,568,0},{142,487,0},{143,412,0},{144,424,0},{145,607,0},{146,404,0},{160,284,0}],
    vfxLv = -1
    };
getRow(34)->
    #equipIntenLevelCfg {
    level = 34,
    bonus = [{135,33528,0},{136,3352,0},{137,3352,0},{138,3352,0},{139,3352,0},{140,2669,0},{141,1881,0},{142,1614,0},{143,1366,0},{144,1405,0},{145,2011,0},{146,1341,0},{160,943,0}],
    materialCost = [{224,42}],
    materialTransform = [{222,3}],
    suitIs = 1,
    allBonus = [{135,11176,0},{136,1117,0},{137,1117,0},{138,1117,0},{139,1117,0},{140,889,0},{141,627,0},{142,538,0},{143,455,0},{144,468,0},{145,670,0},{146,447,0},{160,314,0}],
    vfxLv = -1
    };
getRow(35)->
    #equipIntenLevelCfg {
    level = 35,
    bonus = [{135,35149,0},{136,3514,0},{137,3514,0},{138,3514,0},{139,3514,0},{140,2798,0},{141,1972,0},{142,1692,0},{143,1432,0},{144,1473,0},{145,2108,0},{146,1405,0},{160,989,0}],
    materialCost = [{224,45}],
    materialTransform = [{222,3}],
    suitIs = 0,
    allBonus = [{135,11176,0},{136,1117,0},{137,1117,0},{138,1117,0},{139,1117,0},{140,889,0},{141,627,0},{142,538,0},{143,455,0},{144,468,0},{145,670,0},{146,447,0},{160,314,0}],
    vfxLv = -1
    };
getRow(36)->
    #equipIntenLevelCfg {
    level = 36,
    bonus = [{135,36800,0},{136,3680,0},{137,3680,0},{138,3680,0},{139,3680,0},{140,2930,0},{141,2064,0},{142,1771,0},{143,1499,0},{144,1543,0},{145,2208,0},{146,1472,0},{160,1035,0}],
    materialCost = [{224,47}],
    materialTransform = [{222,3}],
    suitIs = 1,
    allBonus = [{135,12266,0},{136,1226,0},{137,1226,0},{138,1226,0},{139,1226,0},{140,976,0},{141,688,0},{142,590,0},{143,499,0},{144,514,0},{145,736,0},{146,490,0},{160,345,0}],
    vfxLv = -1
    };
getRow(37)->
    #equipIntenLevelCfg {
    level = 37,
    bonus = [{135,38479,0},{136,3847,0},{137,3847,0},{138,3847,0},{139,3847,0},{140,3063,0},{141,2159,0},{142,1852,0},{143,1567,0},{144,1613,0},{145,2308,0},{146,1539,0},{160,1083,0}],
    materialCost = [{224,50}],
    materialTransform = [{222,3}],
    suitIs = 0,
    allBonus = [{135,12826,0},{136,1282,0},{137,1282,0},{138,1282,0},{139,1282,0},{140,1021,0},{141,719,0},{142,617,0},{143,522,0},{144,537,0},{145,769,0},{146,513,0},{160,361,0}],
    vfxLv = -1
    };
getRow(38)->
    #equipIntenLevelCfg {
    level = 38,
    bonus = [{135,40186,0},{136,4018,0},{137,4018,0},{138,4018,0},{139,4018,0},{140,3199,0},{141,2254,0},{142,1934,0},{143,1637,0},{144,1685,0},{145,2411,0},{146,1607,0},{160,1131,0}],
    materialCost = [{224,53}],
    materialTransform = [{222,3}],
    suitIs = 1,
    allBonus = [{135,13395,0},{136,1339,0},{137,1339,0},{138,1339,0},{139,1339,0},{140,1066,0},{141,751,0},{142,644,0},{143,545,0},{144,561,0},{145,803,0},{146,535,0},{160,377,0}],
    vfxLv = -1
    };
getRow(39)->
    #equipIntenLevelCfg {
    level = 39,
    bonus = [{135,41921,0},{136,4192,0},{137,4192,0},{138,4192,0},{139,4192,0},{140,3338,0},{141,2352,0},{142,2018,0},{143,1708,0},{144,1757,0},{145,2515,0},{146,1676,0},{160,1180,0}],
    materialCost = [{224,55}],
    materialTransform = [{222,3}],
    suitIs = 0,
    allBonus = [{135,13973,0},{136,1397,0},{137,1397,0},{138,1397,0},{139,1397,0},{140,1112,0},{141,784,0},{142,672,0},{143,569,0},{144,585,0},{145,838,0},{146,558,0},{160,393,0}],
    vfxLv = -1
    };
getRow(40)->
    #equipIntenLevelCfg {
    level = 40,
    bonus = [{135,43683,0},{136,4368,0},{137,4368,0},{138,4368,0},{139,4368,0},{140,3478,0},{141,2451,0},{142,2103,0},{143,1779,0},{144,1831,0},{145,2621,0},{146,1747,0},{160,1229,0}],
    materialCost = [{224,58}],
    materialTransform = [{222,3}],
    suitIs = 1,
    allBonus = [{135,14561,0},{136,1456,0},{137,1456,0},{138,1456,0},{139,1456,0},{140,1159,0},{141,817,0},{142,701,0},{143,593,0},{144,610,0},{145,873,0},{146,582,0},{160,409,0}],
    vfxLv = -1
    };
getRow(41)->
    #equipIntenLevelCfg {
    level = 41,
    bonus = [{135,45473,0},{136,4547,0},{137,4547,0},{138,4547,0},{139,4547,0},{140,3620,0},{141,2551,0},{142,2189,0},{143,1852,0},{144,1906,0},{145,2728,0},{146,1818,0},{160,1280,0}],
    materialCost = [{224,58}],
    materialTransform = [{222,3}],
    suitIs = 1,
    allBonus = [{135,14561,0},{136,1456,0},{137,1456,0},{138,1456,0},{139,1456,0},{140,1159,0},{141,817,0},{142,701,0},{143,593,0},{144,610,0},{145,873,0},{146,582,0},{160,409,0}],
    vfxLv = -1
    };
getRow(42)->
    #equipIntenLevelCfg {
    level = 42,
    bonus = [{135,47290,0},{136,4729,0},{137,4729,0},{138,4729,0},{139,4729,0},{140,3765,0},{141,2653,0},{142,2277,0},{143,1926,0},{144,1982,0},{145,2837,0},{146,1891,0},{160,1331,0}],
    materialCost = [{224,58}],
    materialTransform = [{222,3}],
    suitIs = 1,
    allBonus = [{135,15763,0},{136,1576,0},{137,1576,0},{138,1576,0},{139,1576,0},{140,1255,0},{141,884,0},{142,759,0},{143,642,0},{144,660,0},{145,945,0},{146,630,0},{160,443,0}],
    vfxLv = -1
    };
getRow(43)->
    #equipIntenLevelCfg {
    level = 43,
    bonus = [{135,49134,0},{136,4913,0},{137,4913,0},{138,4913,0},{139,4913,0},{140,3912,0},{141,2757,0},{142,2365,0},{143,2001,0},{144,2060,0},{145,2948,0},{146,1965,0},{160,1383,0}],
    materialCost = [{224,58}],
    materialTransform = [{222,3}],
    suitIs = 1,
    allBonus = [{135,15763,0},{136,1576,0},{137,1576,0},{138,1576,0},{139,1576,0},{140,1255,0},{141,884,0},{142,759,0},{143,642,0},{144,660,0},{145,945,0},{146,630,0},{160,443,0}],
    vfxLv = -1
    };
getRow(44)->
    #equipIntenLevelCfg {
    level = 44,
    bonus = [{135,51004,0},{136,5100,0},{137,5100,0},{138,5100,0},{139,5100,0},{140,4061,0},{141,2861,0},{142,2455,0},{143,2078,0},{144,2138,0},{145,3060,0},{146,2040,0},{160,1435,0}],
    materialCost = [{224,58}],
    materialTransform = [{222,3}],
    suitIs = 1,
    allBonus = [{135,17001,0},{136,1700,0},{137,1700,0},{138,1700,0},{139,1700,0},{140,1353,0},{141,953,0},{142,818,0},{143,692,0},{144,712,0},{145,1020,0},{146,680,0},{160,478,0}],
    vfxLv = -1
    };
getRow(45)->
    #equipIntenLevelCfg {
    level = 45,
    bonus = [{135,52901,0},{136,5290,0},{137,5290,0},{138,5290,0},{139,5290,0},{140,4212,0},{141,2968,0},{142,2547,0},{143,2155,0},{144,2218,0},{145,3174,0},{146,2116,0},{160,1489,0}],
    materialCost = [{224,58}],
    materialTransform = [{222,3}],
    suitIs = 1,
    allBonus = [{135,17001,0},{136,1700,0},{137,1700,0},{138,1700,0},{139,1700,0},{140,1353,0},{141,953,0},{142,818,0},{143,692,0},{144,712,0},{145,1020,0},{146,680,0},{160,478,0}],
    vfxLv = -1
    };
getRow(46)->
    #equipIntenLevelCfg {
    level = 46,
    bonus = [{135,54824,0},{136,5482,0},{137,5482,0},{138,5482,0},{139,5482,0},{140,4365,0},{141,3076,0},{142,2639,0},{143,2233,0},{144,2298,0},{145,3289,0},{146,2192,0},{160,1543,0}],
    materialCost = [{229,20}],
    materialTransform = [{224,3}],
    suitIs = 1,
    allBonus = [{135,18274,0},{136,1827,0},{137,1827,0},{138,1827,0},{139,1827,0},{140,1455,0},{141,1025,0},{142,879,0},{143,744,0},{144,766,0},{145,1096,0},{146,730,0},{160,514,0}],
    vfxLv = -1
    };
getRow(47)->
    #equipIntenLevelCfg {
    level = 47,
    bonus = [{135,56772,0},{136,5677,0},{137,5677,0},{138,5677,0},{139,5677,0},{140,4520,0},{141,3185,0},{142,2733,0},{143,2313,0},{144,2380,0},{145,3406,0},{146,2270,0},{160,1598,0}],
    materialCost = [{229,22}],
    materialTransform = [{224,3}],
    suitIs = 1,
    allBonus = [{135,18274,0},{136,1827,0},{137,1827,0},{138,1827,0},{139,1827,0},{140,1455,0},{141,1025,0},{142,879,0},{143,744,0},{144,766,0},{145,1096,0},{146,730,0},{160,514,0}],
    vfxLv = -1
    };
getRow(48)->
    #equipIntenLevelCfg {
    level = 48,
    bonus = [{135,58746,0},{136,5874,0},{137,5874,0},{138,5874,0},{139,5874,0},{140,4677,0},{141,3296,0},{142,2828,0},{143,2393,0},{144,2463,0},{145,3524,0},{146,2349,0},{160,1653,0}],
    materialCost = [{229,23}],
    materialTransform = [{224,3}],
    suitIs = 1,
    allBonus = [{135,19582,0},{136,1958,0},{137,1958,0},{138,1958,0},{139,1958,0},{140,1559,0},{141,1098,0},{142,942,0},{143,797,0},{144,821,0},{145,1174,0},{146,783,0},{160,551,0}],
    vfxLv = -1
    };
getRow(49)->
    #equipIntenLevelCfg {
    level = 49,
    bonus = [{135,60746,0},{136,6074,0},{137,6074,0},{138,6074,0},{139,6074,0},{140,4836,0},{141,3408,0},{142,2924,0},{143,2475,0},{144,2547,0},{145,3644,0},{146,2429,0},{160,1709,0}],
    materialCost = [{229,26}],
    materialTransform = [{224,3}],
    suitIs = 1,
    allBonus = [{135,19582,0},{136,1958,0},{137,1958,0},{138,1958,0},{139,1958,0},{140,1559,0},{141,1098,0},{142,942,0},{143,797,0},{144,821,0},{145,1174,0},{146,783,0},{160,551,0}],
    vfxLv = -1
    };
getRow(50)->
    #equipIntenLevelCfg {
    level = 50,
    bonus = [{135,62770,0},{136,6277,0},{137,6277,0},{138,6277,0},{139,6277,0},{140,4998,0},{141,3522,0},{142,3022,0},{143,2557,0},{144,2632,0},{145,3766,0},{146,2510,0},{160,1766,0}],
    materialCost = [{229,28}],
    materialTransform = [{224,3}],
    suitIs = 1,
    allBonus = [{135,20923,0},{136,2092,0},{137,2092,0},{138,2092,0},{139,2092,0},{140,1666,0},{141,1174,0},{142,1007,0},{143,852,0},{144,877,0},{145,1255,0},{146,836,0},{160,588,0}],
    vfxLv = -1
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
    {50}
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
    50
    ].

