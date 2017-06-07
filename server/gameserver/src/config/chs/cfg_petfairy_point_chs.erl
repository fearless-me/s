%% coding: latin-1
%%: 实现
-module(cfg_petfairy_point_chs).
-compile(export_all).
-include("cfg_petfairy_point.hrl").
-include("logger.hrl").

getRow(1)->
    #petfairy_pointCfg {
    id = 1,
    order = 0,
    brkthrough = 0,
    enhan_point = [1,2,4,8,20],
    reborn_point = [2,4,8,16,40],
    enhance_material = [],
    reborn_material = []
    };
getRow(2)->
    #petfairy_pointCfg {
    id = 2,
    order = 0,
    brkthrough = 0,
    enhan_point = [2,4,8,16,40],
    reborn_point = [4,8,16,32,80],
    enhance_material = [],
    reborn_material = []
    };
getRow(3)->
    #petfairy_pointCfg {
    id = 3,
    order = 0,
    brkthrough = 0,
    enhan_point = [2,4,8,16,40],
    reborn_point = [4,8,16,32,80],
    enhance_material = [],
    reborn_material = []
    };
getRow(4)->
    #petfairy_pointCfg {
    id = 4,
    order = 0,
    brkthrough = 0,
    enhan_point = [2,4,8,16,40],
    reborn_point = [4,8,16,32,80],
    enhance_material = [],
    reborn_material = []
    };
getRow(5)->
    #petfairy_pointCfg {
    id = 5,
    order = 0,
    brkthrough = 0,
    enhan_point = [2,4,8,16,40],
    reborn_point = [4,8,16,32,80],
    enhance_material = [],
    reborn_material = []
    };
getRow(6)->
    #petfairy_pointCfg {
    id = 6,
    order = 0,
    brkthrough = 0,
    enhan_point = [4,8,16,32,80],
    reborn_point = [8,16,32,64,160],
    enhance_material = [],
    reborn_material = []
    };
getRow(7)->
    #petfairy_pointCfg {
    id = 7,
    order = 0,
    brkthrough = 0,
    enhan_point = [4,8,16,32,80],
    reborn_point = [8,16,32,64,160],
    enhance_material = [],
    reborn_material = []
    };
getRow(8)->
    #petfairy_pointCfg {
    id = 8,
    order = 0,
    brkthrough = 0,
    enhan_point = [4,8,16,32,80],
    reborn_point = [8,16,32,64,160],
    enhance_material = [],
    reborn_material = []
    };
getRow(9)->
    #petfairy_pointCfg {
    id = 9,
    order = 0,
    brkthrough = 0,
    enhan_point = [4,8,16,32,80],
    reborn_point = [8,16,32,64,160],
    enhance_material = [],
    reborn_material = []
    };
getRow(10)->
    #petfairy_pointCfg {
    id = 10,
    order = 0,
    brkthrough = 0,
    enhan_point = [4,8,16,32,80],
    reborn_point = [8,16,32,64,160],
    enhance_material = [],
    reborn_material = []
    };
getRow(11)->
    #petfairy_pointCfg {
    id = 11,
    order = 1,
    brkthrough = 1,
    enhan_point = [106,212,424,848,2120],
    reborn_point = [212,424,848,1696,4240],
    enhance_material = [{11000,2}],
    reborn_material = [{11010,1}]
    };
getRow(12)->
    #petfairy_pointCfg {
    id = 12,
    order = 0,
    brkthrough = 0,
    enhan_point = [6,12,24,48,120],
    reborn_point = [12,24,48,96,240],
    enhance_material = [],
    reborn_material = []
    };
getRow(13)->
    #petfairy_pointCfg {
    id = 13,
    order = 0,
    brkthrough = 0,
    enhan_point = [6,12,24,48,120],
    reborn_point = [12,24,48,96,240],
    enhance_material = [],
    reborn_material = []
    };
getRow(14)->
    #petfairy_pointCfg {
    id = 14,
    order = 0,
    brkthrough = 0,
    enhan_point = [6,12,24,48,120],
    reborn_point = [12,24,48,96,240],
    enhance_material = [],
    reborn_material = []
    };
getRow(15)->
    #petfairy_pointCfg {
    id = 15,
    order = 0,
    brkthrough = 0,
    enhan_point = [6,12,24,48,120],
    reborn_point = [12,24,48,96,240],
    enhance_material = [],
    reborn_material = []
    };
getRow(16)->
    #petfairy_pointCfg {
    id = 16,
    order = 0,
    brkthrough = 0,
    enhan_point = [8,16,32,64,160],
    reborn_point = [16,32,64,128,320],
    enhance_material = [],
    reborn_material = []
    };
getRow(17)->
    #petfairy_pointCfg {
    id = 17,
    order = 0,
    brkthrough = 0,
    enhan_point = [8,16,32,64,160],
    reborn_point = [16,32,64,128,320],
    enhance_material = [],
    reborn_material = []
    };
getRow(18)->
    #petfairy_pointCfg {
    id = 18,
    order = 0,
    brkthrough = 0,
    enhan_point = [8,16,32,64,160],
    reborn_point = [16,32,64,128,320],
    enhance_material = [],
    reborn_material = []
    };
getRow(19)->
    #petfairy_pointCfg {
    id = 19,
    order = 0,
    brkthrough = 0,
    enhan_point = [8,16,32,64,160],
    reborn_point = [16,32,64,128,320],
    enhance_material = [],
    reborn_material = []
    };
getRow(20)->
    #petfairy_pointCfg {
    id = 20,
    order = 0,
    brkthrough = 0,
    enhan_point = [8,16,32,64,160],
    reborn_point = [16,32,64,128,320],
    enhance_material = [],
    reborn_material = []
    };
getRow(21)->
    #petfairy_pointCfg {
    id = 21,
    order = 0,
    brkthrough = 0,
    enhan_point = [10,20,40,80,200],
    reborn_point = [20,40,80,160,400],
    enhance_material = [],
    reborn_material = []
    };
getRow(22)->
    #petfairy_pointCfg {
    id = 22,
    order = 1,
    brkthrough = 1,
    enhan_point = [10,20,40,80,200],
    reborn_point = [420,840,1680,3360,8400],
    enhance_material = [{11000,3}],
    reborn_material = [{11010,2}]
    };
getRow(23)->
    #petfairy_pointCfg {
    id = 23,
    order = 0,
    brkthrough = 0,
    enhan_point = [10,20,40,80,200],
    reborn_point = [20,40,80,160,400],
    enhance_material = [],
    reborn_material = []
    };
getRow(24)->
    #petfairy_pointCfg {
    id = 24,
    order = 0,
    brkthrough = 0,
    enhan_point = [10,20,40,80,200],
    reborn_point = [20,40,80,160,400],
    enhance_material = [],
    reborn_material = []
    };
getRow(25)->
    #petfairy_pointCfg {
    id = 25,
    order = 0,
    brkthrough = 0,
    enhan_point = [10,20,40,80,200],
    reborn_point = [20,40,80,160,400],
    enhance_material = [],
    reborn_material = []
    };
getRow(26)->
    #petfairy_pointCfg {
    id = 26,
    order = 0,
    brkthrough = 0,
    enhan_point = [12,24,48,96,240],
    reborn_point = [24,48,96,192,480],
    enhance_material = [],
    reborn_material = []
    };
getRow(27)->
    #petfairy_pointCfg {
    id = 27,
    order = 0,
    brkthrough = 0,
    enhan_point = [12,24,48,96,240],
    reborn_point = [24,48,96,192,480],
    enhance_material = [],
    reborn_material = []
    };
getRow(28)->
    #petfairy_pointCfg {
    id = 28,
    order = 0,
    brkthrough = 0,
    enhan_point = [12,24,48,96,240],
    reborn_point = [24,48,96,192,480],
    enhance_material = [],
    reborn_material = []
    };
getRow(29)->
    #petfairy_pointCfg {
    id = 29,
    order = 0,
    brkthrough = 0,
    enhan_point = [12,24,48,96,240],
    reborn_point = [24,48,96,192,480],
    enhance_material = [],
    reborn_material = []
    };
getRow(30)->
    #petfairy_pointCfg {
    id = 30,
    order = 0,
    brkthrough = 0,
    enhan_point = [12,24,48,96,240],
    reborn_point = [24,48,96,192,480],
    enhance_material = [],
    reborn_material = []
    };
getRow(31)->
    #petfairy_pointCfg {
    id = 31,
    order = 0,
    brkthrough = 0,
    enhan_point = [14,28,56,112,280],
    reborn_point = [28,56,112,224,560],
    enhance_material = [],
    reborn_material = []
    };
getRow(32)->
    #petfairy_pointCfg {
    id = 32,
    order = 0,
    brkthrough = 0,
    enhan_point = [14,28,56,112,280],
    reborn_point = [28,56,112,224,560],
    enhance_material = [],
    reborn_material = []
    };
getRow(33)->
    #petfairy_pointCfg {
    id = 33,
    order = 1,
    brkthrough = 1,
    enhan_point = [314,628,1256,2512,6280],
    reborn_point = [628,1256,2512,5024,12560],
    enhance_material = [{11001,1}],
    reborn_material = [{11010,3}]
    };
getRow(34)->
    #petfairy_pointCfg {
    id = 34,
    order = 0,
    brkthrough = 0,
    enhan_point = [14,28,56,112,280],
    reborn_point = [28,56,112,224,560],
    enhance_material = [],
    reborn_material = []
    };
getRow(35)->
    #petfairy_pointCfg {
    id = 35,
    order = 0,
    brkthrough = 0,
    enhan_point = [14,28,56,112,280],
    reborn_point = [28,56,112,224,560],
    enhance_material = [],
    reborn_material = []
    };
getRow(36)->
    #petfairy_pointCfg {
    id = 36,
    order = 0,
    brkthrough = 0,
    enhan_point = [16,32,64,128,320],
    reborn_point = [32,64,128,256,640],
    enhance_material = [],
    reborn_material = []
    };
getRow(37)->
    #petfairy_pointCfg {
    id = 37,
    order = 0,
    brkthrough = 0,
    enhan_point = [16,32,64,128,320],
    reborn_point = [32,64,128,256,640],
    enhance_material = [],
    reborn_material = []
    };
getRow(38)->
    #petfairy_pointCfg {
    id = 38,
    order = 0,
    brkthrough = 0,
    enhan_point = [16,32,64,128,320],
    reborn_point = [32,64,128,256,640],
    enhance_material = [],
    reborn_material = []
    };
getRow(39)->
    #petfairy_pointCfg {
    id = 39,
    order = 0,
    brkthrough = 0,
    enhan_point = [16,32,64,128,320],
    reborn_point = [32,64,128,256,640],
    enhance_material = [],
    reborn_material = []
    };
getRow(40)->
    #petfairy_pointCfg {
    id = 40,
    order = 0,
    brkthrough = 0,
    enhan_point = [16,32,64,128,320],
    reborn_point = [32,64,128,256,640],
    enhance_material = [],
    reborn_material = []
    };
getRow(41)->
    #petfairy_pointCfg {
    id = 41,
    order = 0,
    brkthrough = 0,
    enhan_point = [18,36,72,144,360],
    reborn_point = [36,72,144,288,720],
    enhance_material = [],
    reborn_material = []
    };
getRow(42)->
    #petfairy_pointCfg {
    id = 42,
    order = 0,
    brkthrough = 0,
    enhan_point = [18,36,72,144,360],
    reborn_point = [36,72,144,288,720],
    enhance_material = [],
    reborn_material = []
    };
getRow(43)->
    #petfairy_pointCfg {
    id = 43,
    order = 0,
    brkthrough = 0,
    enhan_point = [18,36,72,144,360],
    reborn_point = [36,72,144,288,720],
    enhance_material = [],
    reborn_material = []
    };
getRow(44)->
    #petfairy_pointCfg {
    id = 44,
    order = 1,
    brkthrough = 1,
    enhan_point = [18,36,72,144,360],
    reborn_point = [836,1672,3344,6688,16720],
    enhance_material = [{11002,1}],
    reborn_material = [{11010,4}]
    };
getRow(45)->
    #petfairy_pointCfg {
    id = 45,
    order = 0,
    brkthrough = 0,
    enhan_point = [18,36,72,144,360],
    reborn_point = [36,72,144,288,720],
    enhance_material = [],
    reborn_material = []
    };
getRow(46)->
    #petfairy_pointCfg {
    id = 46,
    order = 0,
    brkthrough = 0,
    enhan_point = [20,40,80,160,400],
    reborn_point = [40,80,160,320,800],
    enhance_material = [],
    reborn_material = []
    };
getRow(47)->
    #petfairy_pointCfg {
    id = 47,
    order = 0,
    brkthrough = 0,
    enhan_point = [20,40,80,160,400],
    reborn_point = [40,80,160,320,800],
    enhance_material = [],
    reborn_material = []
    };
getRow(48)->
    #petfairy_pointCfg {
    id = 48,
    order = 0,
    brkthrough = 0,
    enhan_point = [20,40,80,160,400],
    reborn_point = [40,80,160,320,800],
    enhance_material = [],
    reborn_material = []
    };
getRow(49)->
    #petfairy_pointCfg {
    id = 49,
    order = 0,
    brkthrough = 0,
    enhan_point = [20,40,80,160,400],
    reborn_point = [40,80,160,320,800],
    enhance_material = [],
    reborn_material = []
    };
getRow(50)->
    #petfairy_pointCfg {
    id = 50,
    order = 0,
    brkthrough = 0,
    enhan_point = [20,40,80,160,400],
    reborn_point = [40,80,160,320,800],
    enhance_material = [],
    reborn_material = []
    };
getRow(51)->
    #petfairy_pointCfg {
    id = 51,
    order = 0,
    brkthrough = 0,
    enhan_point = [22,44,88,196,440],
    reborn_point = [44,88,176,352,880],
    enhance_material = [],
    reborn_material = []
    };
getRow(52)->
    #petfairy_pointCfg {
    id = 52,
    order = 0,
    brkthrough = 0,
    enhan_point = [22,44,88,196,440],
    reborn_point = [44,88,176,352,880],
    enhance_material = [],
    reborn_material = []
    };
getRow(53)->
    #petfairy_pointCfg {
    id = 53,
    order = 0,
    brkthrough = 0,
    enhan_point = [22,44,88,196,440],
    reborn_point = [44,88,176,352,880],
    enhance_material = [],
    reborn_material = []
    };
getRow(54)->
    #petfairy_pointCfg {
    id = 54,
    order = 0,
    brkthrough = 0,
    enhan_point = [22,44,88,196,440],
    reborn_point = [44,88,176,352,880],
    enhance_material = [],
    reborn_material = []
    };
getRow(55)->
    #petfairy_pointCfg {
    id = 55,
    order = 1,
    brkthrough = 1,
    enhan_point = [22,44,88,196,440],
    reborn_point = [1044,2088,4176,8352,20880],
    enhance_material = [{11003,1}],
    reborn_material = [{11010,5}]
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
    {55}
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
    55
    ].

