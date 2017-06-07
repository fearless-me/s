%% coding: latin-1
%%: 实现
-module(cfg_needForSpeedScoreLine_chs).
-compile(export_all).
-include("cfg_needForSpeedScoreLine.hrl").
-include("logger.hrl").

getRow(1)->
    #needForSpeedScoreLineCfg {
    id = 1,
    check_area_left_top = [150,177],
    check_area_right_top = [143,175],
    check_area_right_bottom = [140,191],
    check_area_left_bottom = [148,190],
    isEndLine = 0
    };
getRow(2)->
    #needForSpeedScoreLineCfg {
    id = 2,
    check_area_left_top = [140,172],
    check_area_right_top = [128,171],
    check_area_right_bottom = [127,190],
    check_area_left_bottom = [137,190],
    isEndLine = 0
    };
getRow(3)->
    #needForSpeedScoreLineCfg {
    id = 3,
    check_area_left_top = [125,172],
    check_area_right_top = [114,171],
    check_area_right_bottom = [109,200],
    check_area_left_bottom = [123,195],
    isEndLine = 0
    };
getRow(4)->
    #needForSpeedScoreLineCfg {
    id = 4,
    check_area_left_top = [108,172],
    check_area_right_top = [97,171],
    check_area_right_bottom = [92,200],
    check_area_left_bottom = [106,195],
    isEndLine = 0
    };
getRow(5)->
    #needForSpeedScoreLineCfg {
    id = 5,
    check_area_left_top = [90,172],
    check_area_right_top = [78,171],
    check_area_right_bottom = [73,200],
    check_area_left_bottom = [87,195],
    isEndLine = 0
    };
getRow(6)->
    #needForSpeedScoreLineCfg {
    id = 6,
    check_area_left_top = [75,172],
    check_area_right_top = [63,171],
    check_area_right_bottom = [58,200],
    check_area_left_bottom = [72,195],
    isEndLine = 0
    };
getRow(7)->
    #needForSpeedScoreLineCfg {
    id = 7,
    check_area_left_top = [58,169],
    check_area_right_top = [49,163],
    check_area_right_bottom = [19,200],
    check_area_left_bottom = [33,207],
    isEndLine = 0
    };
getRow(8)->
    #needForSpeedScoreLineCfg {
    id = 8,
    check_area_left_top = [49,158],
    check_area_right_top = [49,146],
    check_area_right_bottom = [20,160],
    check_area_left_bottom = [21,150],
    isEndLine = 0
    };
getRow(9)->
    #needForSpeedScoreLineCfg {
    id = 9,
    check_area_left_top = [49,143],
    check_area_right_top = [49,131],
    check_area_right_bottom = [20,145],
    check_area_left_bottom = [21,135],
    isEndLine = 0
    };
getRow(10)->
    #needForSpeedScoreLineCfg {
    id = 10,
    check_area_left_top = [49,125],
    check_area_right_top = [49,113],
    check_area_right_bottom = [20,127],
    check_area_left_bottom = [21,117],
    isEndLine = 0
    };
getRow(11)->
    #needForSpeedScoreLineCfg {
    id = 11,
    check_area_left_top = [49,107],
    check_area_right_top = [44,95],
    check_area_right_bottom = [26,109],
    check_area_left_bottom = [21,99],
    isEndLine = 0
    };
getRow(12)->
    #needForSpeedScoreLineCfg {
    id = 12,
    check_area_left_top = [40,89],
    check_area_right_top = [43,80],
    check_area_right_bottom = [17,74],
    check_area_left_bottom = [16,84],
    isEndLine = 0
    };
getRow(13)->
    #needForSpeedScoreLineCfg {
    id = 13,
    check_area_left_top = [42,74],
    check_area_right_top = [44,65],
    check_area_right_bottom = [19,60],
    check_area_left_bottom = [17,69],
    isEndLine = 0
    };
getRow(14)->
    #needForSpeedScoreLineCfg {
    id = 14,
    check_area_left_top = [42,59],
    check_area_right_top = [44,50],
    check_area_right_bottom = [19,45],
    check_area_left_bottom = [17,54],
    isEndLine = 0
    };
getRow(15)->
    #needForSpeedScoreLineCfg {
    id = 15,
    check_area_left_top = [42,44],
    check_area_right_top = [44,35],
    check_area_right_bottom = [19,29],
    check_area_left_bottom = [17,38],
    isEndLine = 0
    };
getRow(16)->
    #needForSpeedScoreLineCfg {
    id = 16,
    check_area_left_top = [45,22],
    check_area_right_top = [53,23],
    check_area_right_bottom = [53,35],
    check_area_left_bottom = [45,35],
    isEndLine = 0
    };
getRow(17)->
    #needForSpeedScoreLineCfg {
    id = 17,
    check_area_left_top = [57,23],
    check_area_right_top = [66,24],
    check_area_right_bottom = [66,36],
    check_area_left_bottom = [58,36],
    isEndLine = 0
    };
getRow(18)->
    #needForSpeedScoreLineCfg {
    id = 18,
    check_area_left_top = [69,24],
    check_area_right_top = [78,25],
    check_area_right_bottom = [78,37],
    check_area_left_bottom = [70,37],
    isEndLine = 0
    };
getRow(19)->
    #needForSpeedScoreLineCfg {
    id = 19,
    check_area_left_top = [81,22],
    check_area_right_top = [89,23],
    check_area_right_bottom = [90,35],
    check_area_left_bottom = [81,35],
    isEndLine = 0
    };
getRow(20)->
    #needForSpeedScoreLineCfg {
    id = 20,
    check_area_left_top = [91,19],
    check_area_right_top = [100,20],
    check_area_right_bottom = [100,32],
    check_area_left_bottom = [91,32],
    isEndLine = 0
    };
getRow(21)->
    #needForSpeedScoreLineCfg {
    id = 21,
    check_area_left_top = [101,19],
    check_area_right_top = [110,20],
    check_area_right_bottom = [110,32],
    check_area_left_bottom = [101,31],
    isEndLine = 0
    };
getRow(22)->
    #needForSpeedScoreLineCfg {
    id = 22,
    check_area_left_top = [111,20],
    check_area_right_top = [120,22],
    check_area_right_bottom = [120,33],
    check_area_left_bottom = [112,33],
    isEndLine = 0
    };
getRow(23)->
    #needForSpeedScoreLineCfg {
    id = 23,
    check_area_left_top = [124,24],
    check_area_right_top = [132,27],
    check_area_right_bottom = [127,41],
    check_area_left_bottom = [117,37],
    isEndLine = 0
    };
getRow(24)->
    #needForSpeedScoreLineCfg {
    id = 24,
    check_area_left_top = [142,17],
    check_area_right_top = [154,19],
    check_area_right_bottom = [141,53],
    check_area_left_bottom = [130,48],
    isEndLine = 0
    };
getRow(25)->
    #needForSpeedScoreLineCfg {
    id = 25,
    check_area_left_top = [162,29],
    check_area_right_top = [174,31],
    check_area_right_bottom = [161,64],
    check_area_left_bottom = [150,60],
    isEndLine = 0
    };
getRow(26)->
    #needForSpeedScoreLineCfg {
    id = 26,
    check_area_left_top = [179,34],
    check_area_right_top = [190,33],
    check_area_right_bottom = [168,95],
    check_area_left_bottom = [157,85],
    isEndLine = 0
    };
getRow(27)->
    #needForSpeedScoreLineCfg {
    id = 27,
    check_area_left_top = [195,32],
    check_area_right_top = [206,37],
    check_area_right_bottom = [173,102],
    check_area_left_bottom = [164,96],
    isEndLine = 0
    };
getRow(28)->
    #needForSpeedScoreLineCfg {
    id = 28,
    check_area_left_top = [207,98],
    check_area_right_top = [207,90],
    check_area_right_bottom = [186,109],
    check_area_left_bottom = [192,113],
    isEndLine = 0
    };
getRow(29)->
    #needForSpeedScoreLineCfg {
    id = 29,
    check_area_left_top = [220,132],
    check_area_right_top = [225,125],
    check_area_right_bottom = [197,119],
    check_area_left_bottom = [195,124],
    isEndLine = 0
    };
getRow(30)->
    #needForSpeedScoreLineCfg {
    id = 30,
    check_area_left_top = [194,159],
    check_area_right_top = [204,160],
    check_area_right_bottom = [199,127],
    check_area_left_bottom = [190,124],
    isEndLine = 0
    };
getRow(31)->
    #needForSpeedScoreLineCfg {
    id = 31,
    check_area_left_top = [178,151],
    check_area_right_top = [188,152],
    check_area_right_bottom = [184,119],
    check_area_left_bottom = [174,117],
    isEndLine = 0
    };
getRow(32)->
    #needForSpeedScoreLineCfg {
    id = 32,
    check_area_left_top = [172,151],
    check_area_right_top = [176,146],
    check_area_right_bottom = [159,133],
    check_area_left_bottom = [155,139],
    isEndLine = 0
    };
getRow(33)->
    #needForSpeedScoreLineCfg {
    id = 33,
    check_area_left_top = [166,160],
    check_area_right_top = [169,154],
    check_area_right_bottom = [152,146],
    check_area_left_bottom = [148,151],
    isEndLine = 0
    };
getRow(34)->
    #needForSpeedScoreLineCfg {
    id = 34,
    check_area_left_top = [170,168],
    check_area_right_top = [168,162],
    check_area_right_bottom = [159,173],
    check_area_left_bottom = [164,177],
    isEndLine = 0
    };
getRow(35)->
    #needForSpeedScoreLineCfg {
    id = 35,
    check_area_left_top = [181,176],
    check_area_right_top = [180,170],
    check_area_right_bottom = [170,181],
    check_area_left_bottom = [175,185],
    isEndLine = 0
    };
getRow(36)->
    #needForSpeedScoreLineCfg {
    id = 36,
    check_area_left_top = [192,181],
    check_area_right_top = [190,176],
    check_area_right_bottom = [181,187],
    check_area_left_bottom = [186,191],
    isEndLine = 0
    };
getRow(37)->
    #needForSpeedScoreLineCfg {
    id = 37,
    check_area_left_top = [205,184],
    check_area_right_top = [200,184],
    check_area_right_bottom = [192,194],
    check_area_left_bottom = [197,198],
    isEndLine = 0
    };
getRow(38)->
    #needForSpeedScoreLineCfg {
    id = 38,
    check_area_left_top = [199,200],
    check_area_right_top = [193,199],
    check_area_right_bottom = [186,210],
    check_area_left_bottom = [191,214],
    isEndLine = 0
    };
getRow(39)->
    #needForSpeedScoreLineCfg {
    id = 39,
    check_area_left_top = [179,54],
    check_area_right_top = [174,188],
    check_area_right_bottom = [166,198],
    check_area_left_bottom = [171,200],
    isEndLine = 0
    };
getRow(40)->
    #needForSpeedScoreLineCfg {
    id = 40,
    check_area_left_top = [171,183],
    check_area_right_top = [166,181],
    check_area_right_bottom = [160,195],
    check_area_left_bottom = [165,196],
    isEndLine = 1
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
    {40}
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
    40
    ].

