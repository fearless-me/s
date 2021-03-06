%% coding: latin-1
%%: 实现
-module(cfg_gem_level_chs).
-compile(export_all).
-include("cfg_gem_level.hrl").
-include("logger.hrl").

getRow(6)->
    #gem_levelCfg {
    level = 6,
    warrior = [{144,168,0},{145,240,0},{146,160,0},{160,112,0}],
    mage = [{144,168,0},{145,240,0},{146,160,0},{160,112,0}],
    assassin = [{144,168,0},{145,240,0},{146,160,0},{160,112,0}]
    };
getRow(12)->
    #gem_levelCfg {
    level = 12,
    warrior = [{144,209,0},{145,300,0},{146,200,0},{160,140,0}],
    mage = [{144,209,0},{145,300,0},{146,200,0},{160,140,0}],
    assassin = [{144,209,0},{145,300,0},{146,200,0},{160,140,0}]
    };
getRow(18)->
    #gem_levelCfg {
    level = 18,
    warrior = [{144,285,0},{145,408,0},{146,272,0},{160,191,0}],
    mage = [{144,285,0},{145,408,0},{146,272,0},{160,191,0}],
    assassin = [{144,285,0},{145,408,0},{146,272,0},{160,191,0}]
    };
getRow(24)->
    #gem_levelCfg {
    level = 24,
    warrior = [{144,383,0},{145,549,0},{146,366,0},{160,257,0}],
    mage = [{144,383,0},{145,549,0},{146,366,0},{160,257,0}],
    assassin = [{144,383,0},{145,549,0},{146,366,0},{160,257,0}]
    };
getRow(30)->
    #gem_levelCfg {
    level = 30,
    warrior = [{144,500,0},{145,715,0},{146,477,0},{160,335,0}],
    mage = [{144,500,0},{145,715,0},{146,477,0},{160,335,0}],
    assassin = [{144,500,0},{145,715,0},{146,477,0},{160,335,0}]
    };
getRow(36)->
    #gem_levelCfg {
    level = 36,
    warrior = [{144,632,0},{145,904,0},{146,603,0},{160,424,0}],
    mage = [{144,632,0},{145,904,0},{146,603,0},{160,424,0}],
    assassin = [{144,632,0},{145,904,0},{146,603,0},{160,424,0}]
    };
getRow(42)->
    #gem_levelCfg {
    level = 42,
    warrior = [{144,778,0},{145,1113,0},{146,742,0},{160,522,0}],
    mage = [{144,778,0},{145,1113,0},{146,742,0},{160,522,0}],
    assassin = [{144,778,0},{145,1113,0},{146,742,0},{160,522,0}]
    };
getRow(48)->
    #gem_levelCfg {
    level = 48,
    warrior = [{144,936,0},{145,1340,0},{146,893,0},{160,628,0}],
    mage = [{144,936,0},{145,1340,0},{146,893,0},{160,628,0}],
    assassin = [{144,936,0},{145,1340,0},{146,893,0},{160,628,0}]
    };
getRow(54)->
    #gem_levelCfg {
    level = 54,
    warrior = [{144,1107,0},{145,1584,0},{146,1056,0},{160,743,0}],
    mage = [{144,1107,0},{145,1584,0},{146,1056,0},{160,743,0}],
    assassin = [{144,1107,0},{145,1584,0},{146,1056,0},{160,743,0}]
    };
getRow(60)->
    #gem_levelCfg {
    level = 60,
    warrior = [{144,1288,0},{145,1844,0},{146,1229,0},{160,865,0}],
    mage = [{144,1288,0},{145,1844,0},{146,1229,0},{160,865,0}],
    assassin = [{144,1288,0},{145,1844,0},{146,1229,0},{160,865,0}]
    };
getRow(66)->
    #gem_levelCfg {
    level = 66,
    warrior = [{144,1480,0},{145,2118,0},{146,1412,0},{160,994,0}],
    mage = [{144,1480,0},{145,2118,0},{146,1412,0},{160,994,0}],
    assassin = [{144,1480,0},{145,2118,0},{146,1412,0},{160,994,0}]
    };
getRow(72)->
    #gem_levelCfg {
    level = 72,
    warrior = [{144,1682,0},{145,2407,0},{146,1605,0},{160,1129,0}],
    mage = [{144,1682,0},{145,2407,0},{146,1605,0},{160,1129,0}],
    assassin = [{144,1682,0},{145,2407,0},{146,1605,0},{160,1129,0}]
    };
getRow(_)->[].

getKeyList()->[
    {6},
    {12},
    {18},
    {24},
    {30},
    {36},
    {42},
    {48},
    {54},
    {60},
    {66},
    {72}
    ].

get1KeyList()->[
    6,
    12,
    18,
    24,
    30,
    36,
    42,
    48,
    54,
    60,
    66,
    72
    ].

