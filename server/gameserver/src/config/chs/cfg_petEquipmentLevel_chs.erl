%% coding: latin-1
%%: 实现
-module(cfg_petEquipmentLevel_chs).
-compile(export_all).
-include("cfg_petEquipmentLevel.hrl").
-include("logger.hrl").

getRow(1)->
    #petEquipmentLevelCfg {
    level = 1,
    coin = [{100,1000}],
    propertyIndex = [{135,600,0},{136,60,0},{137,60,0},{138,60,0},{139,60,0}],
    item = []
    };
getRow(2)->
    #petEquipmentLevelCfg {
    level = 2,
    coin = [{100,1500}],
    propertyIndex = [{135,800,0},{136,80,0},{137,80,0},{138,80,0},{139,80,0}],
    item = []
    };
getRow(3)->
    #petEquipmentLevelCfg {
    level = 3,
    coin = [{100,2000}],
    propertyIndex = [{135,1200,0},{136,120,0},{137,120,0},{138,120,0},{139,120,0}],
    item = []
    };
getRow(4)->
    #petEquipmentLevelCfg {
    level = 4,
    coin = [{100,2500}],
    propertyIndex = [{135,1800,0},{136,180,0},{137,180,0},{138,180,0},{139,180,0}],
    item = []
    };
getRow(5)->
    #petEquipmentLevelCfg {
    level = 5,
    coin = [{100,3000}],
    propertyIndex = [{135,2400,0},{136,240,0},{137,240,0},{138,240,0},{139,240,0}],
    item = []
    };
getRow(6)->
    #petEquipmentLevelCfg {
    level = 6,
    coin = [{100,3500}],
    propertyIndex = [{135,3200,0},{136,320,0},{137,320,0},{138,320,0},{139,320,0}],
    item = []
    };
getRow(7)->
    #petEquipmentLevelCfg {
    level = 7,
    coin = [{100,4000}],
    propertyIndex = [{135,4000,0},{136,400,0},{137,400,0},{138,400,0},{139,400,0}],
    item = []
    };
getRow(8)->
    #petEquipmentLevelCfg {
    level = 8,
    coin = [{100,4500}],
    propertyIndex = [{135,4900,0},{136,490,0},{137,490,0},{138,490,0},{139,490,0}],
    item = []
    };
getRow(9)->
    #petEquipmentLevelCfg {
    level = 9,
    coin = [{100,5000}],
    propertyIndex = [{135,5800,0},{136,580,0},{137,580,0},{138,580,0},{139,580,0}],
    item = []
    };
getRow(10)->
    #petEquipmentLevelCfg {
    level = 10,
    coin = [{100,5500}],
    propertyIndex = [{135,6800,0},{136,680,0},{137,680,0},{138,680,0},{139,680,0}],
    item = []
    };
getRow(11)->
    #petEquipmentLevelCfg {
    level = 11,
    coin = [{100,6000}],
    propertyIndex = [{135,7900,0},{136,790,0},{137,790,0},{138,790,0},{139,790,0}],
    item = []
    };
getRow(12)->
    #petEquipmentLevelCfg {
    level = 12,
    coin = [{100,6500}],
    propertyIndex = [{135,9000,0},{136,900,0},{137,900,0},{138,900,0},{139,900,0}],
    item = []
    };
getRow(13)->
    #petEquipmentLevelCfg {
    level = 13,
    coin = [{100,7000}],
    propertyIndex = [{135,10200,0},{136,1020,0},{137,1020,0},{138,1020,0},{139,1020,0}],
    item = []
    };
getRow(14)->
    #petEquipmentLevelCfg {
    level = 14,
    coin = [{100,7500}],
    propertyIndex = [{135,11500,0},{136,1150,0},{137,1150,0},{138,1150,0},{139,1150,0}],
    item = []
    };
getRow(15)->
    #petEquipmentLevelCfg {
    level = 15,
    coin = [{100,8000}],
    propertyIndex = [{135,12700,0},{136,1270,0},{137,1270,0},{138,1270,0},{139,1270,0}],
    item = []
    };
getRow(16)->
    #petEquipmentLevelCfg {
    level = 16,
    coin = [{100,8500}],
    propertyIndex = [{135,14100,0},{136,1410,0},{137,1410,0},{138,1410,0},{139,1410,0}],
    item = []
    };
getRow(17)->
    #petEquipmentLevelCfg {
    level = 17,
    coin = [{100,9000}],
    propertyIndex = [{135,15400,0},{136,1540,0},{137,1540,0},{138,1540,0},{139,1540,0}],
    item = []
    };
getRow(18)->
    #petEquipmentLevelCfg {
    level = 18,
    coin = [{100,9500}],
    propertyIndex = [{135,16800,0},{136,1680,0},{137,1680,0},{138,1680,0},{139,1680,0}],
    item = []
    };
getRow(19)->
    #petEquipmentLevelCfg {
    level = 19,
    coin = [{100,10000}],
    propertyIndex = [{135,18300,0},{136,1830,0},{137,1830,0},{138,1830,0},{139,1830,0}],
    item = []
    };
getRow(20)->
    #petEquipmentLevelCfg {
    level = 20,
    coin = [{100,10500}],
    propertyIndex = [{135,100100,0},{136,10010,0},{137,10010,0},{138,10010,0},{139,10010,0}],
    item = []
    };
getRow(21)->
    #petEquipmentLevelCfg {
    level = 21,
    coin = [{100,11000}],
    propertyIndex = [{135,101600,0},{136,10160,0},{137,10160,0},{138,10160,0},{139,10160,0}],
    item = []
    };
getRow(22)->
    #petEquipmentLevelCfg {
    level = 22,
    coin = [{100,11500}],
    propertyIndex = [{135,103200,0},{136,10320,0},{137,10320,0},{138,10320,0},{139,10320,0}],
    item = []
    };
getRow(23)->
    #petEquipmentLevelCfg {
    level = 23,
    coin = [{100,12000}],
    propertyIndex = [{135,104800,0},{136,10480,0},{137,10480,0},{138,10480,0},{139,10480,0}],
    item = []
    };
getRow(24)->
    #petEquipmentLevelCfg {
    level = 24,
    coin = [{100,12500}],
    propertyIndex = [{135,106400,0},{136,10640,0},{137,10640,0},{138,10640,0},{139,10640,0}],
    item = []
    };
getRow(25)->
    #petEquipmentLevelCfg {
    level = 25,
    coin = [{100,13000}],
    propertyIndex = [{135,108100,0},{136,10810,0},{137,10810,0},{138,10810,0},{139,10810,0}],
    item = []
    };
getRow(26)->
    #petEquipmentLevelCfg {
    level = 26,
    coin = [{100,13500}],
    propertyIndex = [{135,109900,0},{136,10990,0},{137,10990,0},{138,10990,0},{139,10990,0}],
    item = []
    };
getRow(27)->
    #petEquipmentLevelCfg {
    level = 27,
    coin = [{100,14000}],
    propertyIndex = [{135,111600,0},{136,11160,0},{137,11160,0},{138,11160,0},{139,11160,0}],
    item = []
    };
getRow(28)->
    #petEquipmentLevelCfg {
    level = 28,
    coin = [{100,14500}],
    propertyIndex = [{135,113400,0},{136,11340,0},{137,11340,0},{138,11340,0},{139,11340,0}],
    item = []
    };
getRow(29)->
    #petEquipmentLevelCfg {
    level = 29,
    coin = [{100,15000}],
    propertyIndex = [{135,115200,0},{136,11520,0},{137,11520,0},{138,11520,0},{139,11520,0}],
    item = []
    };
getRow(30)->
    #petEquipmentLevelCfg {
    level = 30,
    coin = [{100,15500}],
    propertyIndex = [{135,117100,0},{136,11710,0},{137,11710,0},{138,11710,0},{139,11710,0}],
    item = []
    };
getRow(31)->
    #petEquipmentLevelCfg {
    level = 31,
    coin = [{100,16000}],
    propertyIndex = [{135,119000,0},{136,11900,0},{137,11900,0},{138,11900,0},{139,11900,0}],
    item = []
    };
getRow(32)->
    #petEquipmentLevelCfg {
    level = 32,
    coin = [{100,16500}],
    propertyIndex = [{135,120900,0},{136,12090,0},{137,12090,0},{138,12090,0},{139,12090,0}],
    item = []
    };
getRow(33)->
    #petEquipmentLevelCfg {
    level = 33,
    coin = [{100,17000}],
    propertyIndex = [{135,122900,0},{136,12290,0},{137,12290,0},{138,12290,0},{139,12290,0}],
    item = []
    };
getRow(34)->
    #petEquipmentLevelCfg {
    level = 34,
    coin = [{100,17500}],
    propertyIndex = [{135,124900,0},{136,12490,0},{137,12490,0},{138,12490,0},{139,12490,0}],
    item = []
    };
getRow(35)->
    #petEquipmentLevelCfg {
    level = 35,
    coin = [{100,18000}],
    propertyIndex = [{135,126900,0},{136,12690,0},{137,12690,0},{138,12690,0},{139,12690,0}],
    item = []
    };
getRow(36)->
    #petEquipmentLevelCfg {
    level = 36,
    coin = [{100,18500}],
    propertyIndex = [{135,128900,0},{136,12890,0},{137,12890,0},{138,12890,0},{139,12890,0}],
    item = []
    };
getRow(37)->
    #petEquipmentLevelCfg {
    level = 37,
    coin = [{100,19000}],
    propertyIndex = [{135,131000,0},{136,13100,0},{137,13100,0},{138,13100,0},{139,13100,0}],
    item = []
    };
getRow(38)->
    #petEquipmentLevelCfg {
    level = 38,
    coin = [{100,19500}],
    propertyIndex = [{135,133100,0},{136,13310,0},{137,13310,0},{138,13310,0},{139,13310,0}],
    item = []
    };
getRow(39)->
    #petEquipmentLevelCfg {
    level = 39,
    coin = [{100,20000}],
    propertyIndex = [{135,215500,0},{136,21550,0},{137,21550,0},{138,21550,0},{139,21550,0}],
    item = []
    };
getRow(40)->
    #petEquipmentLevelCfg {
    level = 40,
    coin = [{100,20500}],
    propertyIndex = [{135,217600,0},{136,21760,0},{137,21760,0},{138,21760,0},{139,21760,0}],
    item = []
    };
getRow(41)->
    #petEquipmentLevelCfg {
    level = 41,
    coin = [{100,21000}],
    propertyIndex = [{135,219800,0},{136,21980,0},{137,21980,0},{138,21980,0},{139,21980,0}],
    item = []
    };
getRow(42)->
    #petEquipmentLevelCfg {
    level = 42,
    coin = [{100,21500}],
    propertyIndex = [{135,222100,0},{136,22210,0},{137,22210,0},{138,22210,0},{139,22210,0}],
    item = []
    };
getRow(43)->
    #petEquipmentLevelCfg {
    level = 43,
    coin = [{100,22000}],
    propertyIndex = [{135,224300,0},{136,22430,0},{137,22430,0},{138,22430,0},{139,22430,0}],
    item = []
    };
getRow(44)->
    #petEquipmentLevelCfg {
    level = 44,
    coin = [{100,22500}],
    propertyIndex = [{135,226600,0},{136,22660,0},{137,22660,0},{138,22660,0},{139,22660,0}],
    item = []
    };
getRow(45)->
    #petEquipmentLevelCfg {
    level = 45,
    coin = [{100,23000}],
    propertyIndex = [{135,228900,0},{136,22890,0},{137,22890,0},{138,22890,0},{139,22890,0}],
    item = []
    };
getRow(46)->
    #petEquipmentLevelCfg {
    level = 46,
    coin = [{100,23500}],
    propertyIndex = [{135,231200,0},{136,23120,0},{137,23120,0},{138,23120,0},{139,23120,0}],
    item = []
    };
getRow(47)->
    #petEquipmentLevelCfg {
    level = 47,
    coin = [{100,24000}],
    propertyIndex = [{135,233500,0},{136,23350,0},{137,23350,0},{138,23350,0},{139,23350,0}],
    item = []
    };
getRow(48)->
    #petEquipmentLevelCfg {
    level = 48,
    coin = [{100,24500}],
    propertyIndex = [{135,235900,0},{136,23590,0},{137,23590,0},{138,23590,0},{139,23590,0}],
    item = []
    };
getRow(49)->
    #petEquipmentLevelCfg {
    level = 49,
    coin = [{100,25000}],
    propertyIndex = [{135,238300,0},{136,23830,0},{137,23830,0},{138,23830,0},{139,23830,0}],
    item = []
    };
getRow(50)->
    #petEquipmentLevelCfg {
    level = 50,
    coin = [{100,25500}],
    propertyIndex = [{135,240800,0},{136,24080,0},{137,24080,0},{138,24080,0},{139,24080,0}],
    item = []
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

