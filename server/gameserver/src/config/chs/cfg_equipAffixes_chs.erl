%% coding: latin-1
%%: 实现
-module(cfg_equipAffixes_chs).
-compile(export_all).
-include("cfg_equipAffixes.hrl").
-include("logger.hrl").

getRow(1,1)->
    #equipAffixesCfg {
    iD = 1,
    affixID = 1,
    name = "力量",
    affixLevel = 1,
    affixType = 0,
    conflict = 1,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 5,
    max1 = 6,
    max2 = 7,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1,8)->
    #equipAffixesCfg {
    iD = 2,
    affixID = 1,
    name = "力量",
    affixLevel = 2,
    affixType = 0,
    conflict = 1,
    itemLevel = 8,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 8,
    max1 = 9,
    max2 = 10,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1,16)->
    #equipAffixesCfg {
    iD = 3,
    affixID = 1,
    name = "力量",
    affixLevel = 3,
    affixType = 0,
    conflict = 1,
    itemLevel = 16,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 12,
    max1 = 14,
    max2 = 15,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1,24)->
    #equipAffixesCfg {
    iD = 4,
    affixID = 1,
    name = "力量",
    affixLevel = 4,
    affixType = 0,
    conflict = 1,
    itemLevel = 24,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 19,
    max1 = 21,
    max2 = 23,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1,32)->
    #equipAffixesCfg {
    iD = 5,
    affixID = 1,
    name = "力量",
    affixLevel = 5,
    affixType = 0,
    conflict = 1,
    itemLevel = 32,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 29,
    max1 = 32,
    max2 = 35,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1,40)->
    #equipAffixesCfg {
    iD = 6,
    affixID = 1,
    name = "力量",
    affixLevel = 6,
    affixType = 0,
    conflict = 1,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 43,
    max1 = 48,
    max2 = 53,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1,44)->
    #equipAffixesCfg {
    iD = 7,
    affixID = 1,
    name = "力量",
    affixLevel = 7,
    affixType = 0,
    conflict = 1,
    itemLevel = 44,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 53,
    max1 = 59,
    max2 = 66,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1,48)->
    #equipAffixesCfg {
    iD = 8,
    affixID = 1,
    name = "力量",
    affixLevel = 8,
    affixType = 0,
    conflict = 1,
    itemLevel = 48,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 66,
    max1 = 73,
    max2 = 81,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1,52)->
    #equipAffixesCfg {
    iD = 9,
    affixID = 1,
    name = "力量",
    affixLevel = 9,
    affixType = 0,
    conflict = 1,
    itemLevel = 52,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 81,
    max1 = 90,
    max2 = 99,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1,56)->
    #equipAffixesCfg {
    iD = 10,
    affixID = 1,
    name = "力量",
    affixLevel = 10,
    affixType = 0,
    conflict = 1,
    itemLevel = 56,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 99,
    max1 = 110,
    max2 = 122,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1,60)->
    #equipAffixesCfg {
    iD = 11,
    affixID = 1,
    name = "力量",
    affixLevel = 11,
    affixType = 0,
    conflict = 1,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 122,
    max1 = 135,
    max2 = 150,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1,64)->
    #equipAffixesCfg {
    iD = 12,
    affixID = 1,
    name = "力量",
    affixLevel = 12,
    affixType = 0,
    conflict = 1,
    itemLevel = 64,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 150,
    max1 = 166,
    max2 = 184,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1,68)->
    #equipAffixesCfg {
    iD = 13,
    affixID = 1,
    name = "力量",
    affixLevel = 13,
    affixType = 0,
    conflict = 1,
    itemLevel = 68,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 184,
    max1 = 204,
    max2 = 226,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1,72)->
    #equipAffixesCfg {
    iD = 14,
    affixID = 1,
    name = "力量",
    affixLevel = 14,
    affixType = 0,
    conflict = 1,
    itemLevel = 72,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 226,
    max1 = 251,
    max2 = 278,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1,76)->
    #equipAffixesCfg {
    iD = 15,
    affixID = 1,
    name = "力量",
    affixLevel = 15,
    affixType = 0,
    conflict = 1,
    itemLevel = 76,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 278,
    max1 = 308,
    max2 = 341,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2,1)->
    #equipAffixesCfg {
    iD = 16,
    affixID = 2,
    name = "敏捷",
    affixLevel = 1,
    affixType = 0,
    conflict = 1,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 5,
    max1 = 6,
    max2 = 7,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2,8)->
    #equipAffixesCfg {
    iD = 17,
    affixID = 2,
    name = "敏捷",
    affixLevel = 2,
    affixType = 0,
    conflict = 1,
    itemLevel = 8,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 8,
    max1 = 9,
    max2 = 10,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2,16)->
    #equipAffixesCfg {
    iD = 18,
    affixID = 2,
    name = "敏捷",
    affixLevel = 3,
    affixType = 0,
    conflict = 1,
    itemLevel = 16,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 12,
    max1 = 14,
    max2 = 15,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2,24)->
    #equipAffixesCfg {
    iD = 19,
    affixID = 2,
    name = "敏捷",
    affixLevel = 4,
    affixType = 0,
    conflict = 1,
    itemLevel = 24,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 19,
    max1 = 21,
    max2 = 23,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2,32)->
    #equipAffixesCfg {
    iD = 20,
    affixID = 2,
    name = "敏捷",
    affixLevel = 5,
    affixType = 0,
    conflict = 1,
    itemLevel = 32,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 29,
    max1 = 32,
    max2 = 35,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2,40)->
    #equipAffixesCfg {
    iD = 21,
    affixID = 2,
    name = "敏捷",
    affixLevel = 6,
    affixType = 0,
    conflict = 1,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 43,
    max1 = 48,
    max2 = 53,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2,44)->
    #equipAffixesCfg {
    iD = 22,
    affixID = 2,
    name = "敏捷",
    affixLevel = 7,
    affixType = 0,
    conflict = 1,
    itemLevel = 44,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 53,
    max1 = 59,
    max2 = 66,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2,48)->
    #equipAffixesCfg {
    iD = 23,
    affixID = 2,
    name = "敏捷",
    affixLevel = 8,
    affixType = 0,
    conflict = 1,
    itemLevel = 48,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 66,
    max1 = 73,
    max2 = 81,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2,52)->
    #equipAffixesCfg {
    iD = 24,
    affixID = 2,
    name = "敏捷",
    affixLevel = 9,
    affixType = 0,
    conflict = 1,
    itemLevel = 52,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 81,
    max1 = 90,
    max2 = 99,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2,56)->
    #equipAffixesCfg {
    iD = 25,
    affixID = 2,
    name = "敏捷",
    affixLevel = 10,
    affixType = 0,
    conflict = 1,
    itemLevel = 56,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 99,
    max1 = 110,
    max2 = 122,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2,60)->
    #equipAffixesCfg {
    iD = 26,
    affixID = 2,
    name = "敏捷",
    affixLevel = 11,
    affixType = 0,
    conflict = 1,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 122,
    max1 = 135,
    max2 = 150,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2,64)->
    #equipAffixesCfg {
    iD = 27,
    affixID = 2,
    name = "敏捷",
    affixLevel = 12,
    affixType = 0,
    conflict = 1,
    itemLevel = 64,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 150,
    max1 = 166,
    max2 = 184,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2,68)->
    #equipAffixesCfg {
    iD = 28,
    affixID = 2,
    name = "敏捷",
    affixLevel = 13,
    affixType = 0,
    conflict = 1,
    itemLevel = 68,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 184,
    max1 = 204,
    max2 = 226,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2,72)->
    #equipAffixesCfg {
    iD = 29,
    affixID = 2,
    name = "敏捷",
    affixLevel = 14,
    affixType = 0,
    conflict = 1,
    itemLevel = 72,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 226,
    max1 = 251,
    max2 = 278,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2,76)->
    #equipAffixesCfg {
    iD = 30,
    affixID = 2,
    name = "敏捷",
    affixLevel = 15,
    affixType = 0,
    conflict = 1,
    itemLevel = 76,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 278,
    max1 = 308,
    max2 = 341,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3,1)->
    #equipAffixesCfg {
    iD = 31,
    affixID = 3,
    name = "智力",
    affixLevel = 1,
    affixType = 0,
    conflict = 1,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 5,
    max1 = 6,
    max2 = 7,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3,8)->
    #equipAffixesCfg {
    iD = 32,
    affixID = 3,
    name = "智力",
    affixLevel = 2,
    affixType = 0,
    conflict = 1,
    itemLevel = 8,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 8,
    max1 = 9,
    max2 = 10,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3,16)->
    #equipAffixesCfg {
    iD = 33,
    affixID = 3,
    name = "智力",
    affixLevel = 3,
    affixType = 0,
    conflict = 1,
    itemLevel = 16,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 12,
    max1 = 14,
    max2 = 15,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3,24)->
    #equipAffixesCfg {
    iD = 34,
    affixID = 3,
    name = "智力",
    affixLevel = 4,
    affixType = 0,
    conflict = 1,
    itemLevel = 24,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 19,
    max1 = 21,
    max2 = 23,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3,32)->
    #equipAffixesCfg {
    iD = 35,
    affixID = 3,
    name = "智力",
    affixLevel = 5,
    affixType = 0,
    conflict = 1,
    itemLevel = 32,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 29,
    max1 = 32,
    max2 = 35,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3,40)->
    #equipAffixesCfg {
    iD = 36,
    affixID = 3,
    name = "智力",
    affixLevel = 6,
    affixType = 0,
    conflict = 1,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 43,
    max1 = 48,
    max2 = 53,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3,44)->
    #equipAffixesCfg {
    iD = 37,
    affixID = 3,
    name = "智力",
    affixLevel = 7,
    affixType = 0,
    conflict = 1,
    itemLevel = 44,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 53,
    max1 = 59,
    max2 = 66,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3,48)->
    #equipAffixesCfg {
    iD = 38,
    affixID = 3,
    name = "智力",
    affixLevel = 8,
    affixType = 0,
    conflict = 1,
    itemLevel = 48,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 66,
    max1 = 73,
    max2 = 81,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3,52)->
    #equipAffixesCfg {
    iD = 39,
    affixID = 3,
    name = "智力",
    affixLevel = 9,
    affixType = 0,
    conflict = 1,
    itemLevel = 52,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 81,
    max1 = 90,
    max2 = 99,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3,56)->
    #equipAffixesCfg {
    iD = 40,
    affixID = 3,
    name = "智力",
    affixLevel = 10,
    affixType = 0,
    conflict = 1,
    itemLevel = 56,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 99,
    max1 = 110,
    max2 = 122,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3,60)->
    #equipAffixesCfg {
    iD = 41,
    affixID = 3,
    name = "智力",
    affixLevel = 11,
    affixType = 0,
    conflict = 1,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 122,
    max1 = 135,
    max2 = 150,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3,64)->
    #equipAffixesCfg {
    iD = 42,
    affixID = 3,
    name = "智力",
    affixLevel = 12,
    affixType = 0,
    conflict = 1,
    itemLevel = 64,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 150,
    max1 = 166,
    max2 = 184,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3,68)->
    #equipAffixesCfg {
    iD = 43,
    affixID = 3,
    name = "智力",
    affixLevel = 13,
    affixType = 0,
    conflict = 1,
    itemLevel = 68,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 184,
    max1 = 204,
    max2 = 226,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3,72)->
    #equipAffixesCfg {
    iD = 44,
    affixID = 3,
    name = "智力",
    affixLevel = 14,
    affixType = 0,
    conflict = 1,
    itemLevel = 72,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 226,
    max1 = 251,
    max2 = 278,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3,76)->
    #equipAffixesCfg {
    iD = 45,
    affixID = 3,
    name = "智力",
    affixLevel = 15,
    affixType = 0,
    conflict = 1,
    itemLevel = 76,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 278,
    max1 = 308,
    max2 = 341,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(4,1)->
    #equipAffixesCfg {
    iD = 46,
    affixID = 4,
    name = "体质",
    affixLevel = 1,
    affixType = 0,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 5,
    max1 = 5,
    max2 = 6,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(4,8)->
    #equipAffixesCfg {
    iD = 47,
    affixID = 4,
    name = "体质",
    affixLevel = 2,
    affixType = 0,
    conflict = 0,
    itemLevel = 8,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 7,
    max1 = 8,
    max2 = 9,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(4,16)->
    #equipAffixesCfg {
    iD = 48,
    affixID = 4,
    name = "体质",
    affixLevel = 3,
    affixType = 0,
    conflict = 0,
    itemLevel = 16,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 11,
    max1 = 12,
    max2 = 14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(4,24)->
    #equipAffixesCfg {
    iD = 49,
    affixID = 4,
    name = "体质",
    affixLevel = 4,
    affixType = 0,
    conflict = 0,
    itemLevel = 24,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 17,
    max1 = 19,
    max2 = 21,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(4,32)->
    #equipAffixesCfg {
    iD = 50,
    affixID = 4,
    name = "体质",
    affixLevel = 5,
    affixType = 0,
    conflict = 0,
    itemLevel = 32,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 26,
    max1 = 29,
    max2 = 32,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(4,40)->
    #equipAffixesCfg {
    iD = 51,
    affixID = 4,
    name = "体质",
    affixLevel = 6,
    affixType = 0,
    conflict = 0,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 39,
    max1 = 43,
    max2 = 48,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(4,44)->
    #equipAffixesCfg {
    iD = 52,
    affixID = 4,
    name = "体质",
    affixLevel = 7,
    affixType = 0,
    conflict = 0,
    itemLevel = 44,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 48,
    max1 = 53,
    max2 = 59,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(4,48)->
    #equipAffixesCfg {
    iD = 53,
    affixID = 4,
    name = "体质",
    affixLevel = 8,
    affixType = 0,
    conflict = 0,
    itemLevel = 48,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 59,
    max1 = 65,
    max2 = 73,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(4,52)->
    #equipAffixesCfg {
    iD = 54,
    affixID = 4,
    name = "体质",
    affixLevel = 9,
    affixType = 0,
    conflict = 0,
    itemLevel = 52,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 73,
    max1 = 81,
    max2 = 89,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(4,56)->
    #equipAffixesCfg {
    iD = 55,
    affixID = 4,
    name = "体质",
    affixLevel = 10,
    affixType = 0,
    conflict = 0,
    itemLevel = 56,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 89,
    max1 = 99,
    max2 = 110,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(4,60)->
    #equipAffixesCfg {
    iD = 56,
    affixID = 4,
    name = "体质",
    affixLevel = 11,
    affixType = 0,
    conflict = 0,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 110,
    max1 = 122,
    max2 = 135,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(4,64)->
    #equipAffixesCfg {
    iD = 57,
    affixID = 4,
    name = "体质",
    affixLevel = 12,
    affixType = 0,
    conflict = 0,
    itemLevel = 64,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 135,
    max1 = 149,
    max2 = 166,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(4,68)->
    #equipAffixesCfg {
    iD = 58,
    affixID = 4,
    name = "体质",
    affixLevel = 13,
    affixType = 0,
    conflict = 0,
    itemLevel = 68,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 166,
    max1 = 184,
    max2 = 203,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(4,72)->
    #equipAffixesCfg {
    iD = 59,
    affixID = 4,
    name = "体质",
    affixLevel = 14,
    affixType = 0,
    conflict = 0,
    itemLevel = 72,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 203,
    max1 = 225,
    max2 = 250,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(4,76)->
    #equipAffixesCfg {
    iD = 60,
    affixID = 4,
    name = "体质",
    affixLevel = 15,
    affixType = 0,
    conflict = 0,
    itemLevel = 76,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 250,
    max1 = 277,
    max2 = 307,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(5,1)->
    #equipAffixesCfg {
    iD = 121,
    affixID = 5,
    name = "击中回血",
    affixLevel = 1,
    affixType = 0,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 2,
    max1 = 3,
    max2 = 3,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(5,8)->
    #equipAffixesCfg {
    iD = 122,
    affixID = 5,
    name = "击中回血",
    affixLevel = 2,
    affixType = 0,
    conflict = 0,
    itemLevel = 8,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 4,
    max1 = 4,
    max2 = 5,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(5,16)->
    #equipAffixesCfg {
    iD = 123,
    affixID = 5,
    name = "击中回血",
    affixLevel = 3,
    affixType = 0,
    conflict = 0,
    itemLevel = 16,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 6,
    max1 = 6,
    max2 = 7,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(5,24)->
    #equipAffixesCfg {
    iD = 124,
    affixID = 5,
    name = "击中回血",
    affixLevel = 4,
    affixType = 0,
    conflict = 0,
    itemLevel = 24,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 9,
    max1 = 10,
    max2 = 11,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(5,32)->
    #equipAffixesCfg {
    iD = 125,
    affixID = 5,
    name = "击中回血",
    affixLevel = 5,
    affixType = 0,
    conflict = 0,
    itemLevel = 32,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 14,
    max1 = 15,
    max2 = 17,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(5,40)->
    #equipAffixesCfg {
    iD = 126,
    affixID = 5,
    name = "击中回血",
    affixLevel = 6,
    affixType = 0,
    conflict = 0,
    itemLevel = 40,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 21,
    max1 = 23,
    max2 = 26,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(5,44)->
    #equipAffixesCfg {
    iD = 127,
    affixID = 5,
    name = "击中回血",
    affixLevel = 7,
    affixType = 0,
    conflict = 0,
    itemLevel = 44,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 26,
    max1 = 29,
    max2 = 32,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(5,48)->
    #equipAffixesCfg {
    iD = 128,
    affixID = 5,
    name = "击中回血",
    affixLevel = 8,
    affixType = 0,
    conflict = 0,
    itemLevel = 48,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 32,
    max1 = 35,
    max2 = 39,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(5,52)->
    #equipAffixesCfg {
    iD = 129,
    affixID = 5,
    name = "击中回血",
    affixLevel = 9,
    affixType = 0,
    conflict = 0,
    itemLevel = 52,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 39,
    max1 = 43,
    max2 = 48,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(5,56)->
    #equipAffixesCfg {
    iD = 130,
    affixID = 5,
    name = "击中回血",
    affixLevel = 10,
    affixType = 0,
    conflict = 0,
    itemLevel = 56,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 48,
    max1 = 53,
    max2 = 59,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(5,60)->
    #equipAffixesCfg {
    iD = 131,
    affixID = 5,
    name = "击中回血",
    affixLevel = 11,
    affixType = 0,
    conflict = 0,
    itemLevel = 60,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 59,
    max1 = 65,
    max2 = 73,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(5,64)->
    #equipAffixesCfg {
    iD = 132,
    affixID = 5,
    name = "击中回血",
    affixLevel = 12,
    affixType = 0,
    conflict = 0,
    itemLevel = 64,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 73,
    max1 = 80,
    max2 = 89,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(5,68)->
    #equipAffixesCfg {
    iD = 133,
    affixID = 5,
    name = "击中回血",
    affixLevel = 13,
    affixType = 0,
    conflict = 0,
    itemLevel = 68,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 89,
    max1 = 99,
    max2 = 110,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(5,72)->
    #equipAffixesCfg {
    iD = 134,
    affixID = 5,
    name = "击中回血",
    affixLevel = 14,
    affixType = 0,
    conflict = 0,
    itemLevel = 72,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 110,
    max1 = 122,
    max2 = 135,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(5,76)->
    #equipAffixesCfg {
    iD = 135,
    affixID = 5,
    name = "击中回血",
    affixLevel = 15,
    affixType = 0,
    conflict = 0,
    itemLevel = 76,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 135,
    max1 = 149,
    max2 = 165,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(6,1)->
    #equipAffixesCfg {
    iD = 136,
    affixID = 6,
    name = "生命秒回",
    affixLevel = 1,
    affixType = 0,
    conflict = 0,
    itemLevel = 1,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 1,
    max1 = 2,
    max2 = 2,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(6,8)->
    #equipAffixesCfg {
    iD = 137,
    affixID = 6,
    name = "生命秒回",
    affixLevel = 2,
    affixType = 0,
    conflict = 0,
    itemLevel = 8,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 2,
    max1 = 3,
    max2 = 3,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(6,16)->
    #equipAffixesCfg {
    iD = 138,
    affixID = 6,
    name = "生命秒回",
    affixLevel = 3,
    affixType = 0,
    conflict = 0,
    itemLevel = 16,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 4,
    max1 = 4,
    max2 = 5,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(6,24)->
    #equipAffixesCfg {
    iD = 139,
    affixID = 6,
    name = "生命秒回",
    affixLevel = 4,
    affixType = 0,
    conflict = 0,
    itemLevel = 24,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 6,
    max1 = 6,
    max2 = 7,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(6,32)->
    #equipAffixesCfg {
    iD = 140,
    affixID = 6,
    name = "生命秒回",
    affixLevel = 5,
    affixType = 0,
    conflict = 0,
    itemLevel = 32,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 9,
    max1 = 10,
    max2 = 11,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(6,40)->
    #equipAffixesCfg {
    iD = 141,
    affixID = 6,
    name = "生命秒回",
    affixLevel = 6,
    affixType = 0,
    conflict = 0,
    itemLevel = 40,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 14,
    max1 = 15,
    max2 = 17,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(6,44)->
    #equipAffixesCfg {
    iD = 142,
    affixID = 6,
    name = "生命秒回",
    affixLevel = 7,
    affixType = 0,
    conflict = 0,
    itemLevel = 44,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 17,
    max1 = 19,
    max2 = 21,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(6,48)->
    #equipAffixesCfg {
    iD = 143,
    affixID = 6,
    name = "生命秒回",
    affixLevel = 8,
    affixType = 0,
    conflict = 0,
    itemLevel = 48,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 21,
    max1 = 23,
    max2 = 26,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(6,52)->
    #equipAffixesCfg {
    iD = 144,
    affixID = 6,
    name = "生命秒回",
    affixLevel = 9,
    affixType = 0,
    conflict = 0,
    itemLevel = 52,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 26,
    max1 = 29,
    max2 = 32,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(6,56)->
    #equipAffixesCfg {
    iD = 145,
    affixID = 6,
    name = "生命秒回",
    affixLevel = 10,
    affixType = 0,
    conflict = 0,
    itemLevel = 56,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 32,
    max1 = 35,
    max2 = 39,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(6,60)->
    #equipAffixesCfg {
    iD = 146,
    affixID = 6,
    name = "生命秒回",
    affixLevel = 11,
    affixType = 0,
    conflict = 0,
    itemLevel = 60,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 39,
    max1 = 43,
    max2 = 48,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(6,64)->
    #equipAffixesCfg {
    iD = 147,
    affixID = 6,
    name = "生命秒回",
    affixLevel = 12,
    affixType = 0,
    conflict = 0,
    itemLevel = 64,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 48,
    max1 = 53,
    max2 = 59,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(6,68)->
    #equipAffixesCfg {
    iD = 148,
    affixID = 6,
    name = "生命秒回",
    affixLevel = 13,
    affixType = 0,
    conflict = 0,
    itemLevel = 68,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 59,
    max1 = 66,
    max2 = 73,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(6,72)->
    #equipAffixesCfg {
    iD = 149,
    affixID = 6,
    name = "生命秒回",
    affixLevel = 14,
    affixType = 0,
    conflict = 0,
    itemLevel = 72,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 73,
    max1 = 81,
    max2 = 90,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(6,76)->
    #equipAffixesCfg {
    iD = 150,
    affixID = 6,
    name = "生命秒回",
    affixLevel = 15,
    affixType = 0,
    conflict = 0,
    itemLevel = 76,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 90,
    max1 = 99,
    max2 = 110,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(7,1)->
    #equipAffixesCfg {
    iD = 61,
    affixID = 7,
    name = "物理伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 2,
    itemLevel = 1,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 2,
    max1 = 2,
    max2 = 2,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(7,8)->
    #equipAffixesCfg {
    iD = 62,
    affixID = 7,
    name = "物理伤害",
    affixLevel = 2,
    affixType = 0,
    conflict = 2,
    itemLevel = 8,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 3,
    max1 = 3,
    max2 = 4,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(7,16)->
    #equipAffixesCfg {
    iD = 63,
    affixID = 7,
    name = "物理伤害",
    affixLevel = 3,
    affixType = 0,
    conflict = 2,
    itemLevel = 16,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 4,
    max1 = 5,
    max2 = 6,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(7,24)->
    #equipAffixesCfg {
    iD = 64,
    affixID = 7,
    name = "物理伤害",
    affixLevel = 4,
    affixType = 0,
    conflict = 2,
    itemLevel = 24,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 7,
    max1 = 8,
    max2 = 9,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(7,32)->
    #equipAffixesCfg {
    iD = 65,
    affixID = 7,
    name = "物理伤害",
    affixLevel = 5,
    affixType = 0,
    conflict = 2,
    itemLevel = 32,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 11,
    max1 = 12,
    max2 = 13,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(7,40)->
    #equipAffixesCfg {
    iD = 66,
    affixID = 7,
    name = "物理伤害",
    affixLevel = 6,
    affixType = 0,
    conflict = 2,
    itemLevel = 40,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 16,
    max1 = 18,
    max2 = 20,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(7,44)->
    #equipAffixesCfg {
    iD = 67,
    affixID = 7,
    name = "物理伤害",
    affixLevel = 7,
    affixType = 0,
    conflict = 2,
    itemLevel = 44,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 20,
    max1 = 22,
    max2 = 25,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(7,48)->
    #equipAffixesCfg {
    iD = 68,
    affixID = 7,
    name = "物理伤害",
    affixLevel = 8,
    affixType = 0,
    conflict = 2,
    itemLevel = 48,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 25,
    max1 = 28,
    max2 = 31,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(7,52)->
    #equipAffixesCfg {
    iD = 69,
    affixID = 7,
    name = "物理伤害",
    affixLevel = 9,
    affixType = 0,
    conflict = 2,
    itemLevel = 52,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 31,
    max1 = 34,
    max2 = 38,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(7,56)->
    #equipAffixesCfg {
    iD = 70,
    affixID = 7,
    name = "物理伤害",
    affixLevel = 10,
    affixType = 0,
    conflict = 2,
    itemLevel = 56,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 38,
    max1 = 42,
    max2 = 47,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(7,60)->
    #equipAffixesCfg {
    iD = 71,
    affixID = 7,
    name = "物理伤害",
    affixLevel = 11,
    affixType = 0,
    conflict = 2,
    itemLevel = 60,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 47,
    max1 = 52,
    max2 = 57,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(7,64)->
    #equipAffixesCfg {
    iD = 72,
    affixID = 7,
    name = "物理伤害",
    affixLevel = 12,
    affixType = 0,
    conflict = 2,
    itemLevel = 64,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 57,
    max1 = 63,
    max2 = 70,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(7,68)->
    #equipAffixesCfg {
    iD = 73,
    affixID = 7,
    name = "物理伤害",
    affixLevel = 13,
    affixType = 0,
    conflict = 2,
    itemLevel = 68,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 70,
    max1 = 78,
    max2 = 87,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(7,72)->
    #equipAffixesCfg {
    iD = 74,
    affixID = 7,
    name = "物理伤害",
    affixLevel = 14,
    affixType = 0,
    conflict = 2,
    itemLevel = 72,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 87,
    max1 = 96,
    max2 = 106,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(7,76)->
    #equipAffixesCfg {
    iD = 75,
    affixID = 7,
    name = "物理伤害",
    affixLevel = 15,
    affixType = 0,
    conflict = 2,
    itemLevel = 76,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 106,
    max1 = 118,
    max2 = 131,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(8,1)->
    #equipAffixesCfg {
    iD = 76,
    affixID = 8,
    name = "神圣伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 2,
    itemLevel = 1,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 2,
    max1 = 2,
    max2 = 2,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(8,8)->
    #equipAffixesCfg {
    iD = 77,
    affixID = 8,
    name = "神圣伤害",
    affixLevel = 2,
    affixType = 0,
    conflict = 2,
    itemLevel = 8,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 3,
    max1 = 3,
    max2 = 4,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(8,16)->
    #equipAffixesCfg {
    iD = 78,
    affixID = 8,
    name = "神圣伤害",
    affixLevel = 3,
    affixType = 0,
    conflict = 2,
    itemLevel = 16,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 4,
    max1 = 5,
    max2 = 6,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(8,24)->
    #equipAffixesCfg {
    iD = 79,
    affixID = 8,
    name = "神圣伤害",
    affixLevel = 4,
    affixType = 0,
    conflict = 2,
    itemLevel = 24,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 7,
    max1 = 8,
    max2 = 9,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(8,32)->
    #equipAffixesCfg {
    iD = 80,
    affixID = 8,
    name = "神圣伤害",
    affixLevel = 5,
    affixType = 0,
    conflict = 2,
    itemLevel = 32,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 11,
    max1 = 12,
    max2 = 13,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(8,40)->
    #equipAffixesCfg {
    iD = 81,
    affixID = 8,
    name = "神圣伤害",
    affixLevel = 6,
    affixType = 0,
    conflict = 2,
    itemLevel = 40,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 16,
    max1 = 18,
    max2 = 20,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(8,44)->
    #equipAffixesCfg {
    iD = 82,
    affixID = 8,
    name = "神圣伤害",
    affixLevel = 7,
    affixType = 0,
    conflict = 2,
    itemLevel = 44,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 20,
    max1 = 22,
    max2 = 25,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(8,48)->
    #equipAffixesCfg {
    iD = 83,
    affixID = 8,
    name = "神圣伤害",
    affixLevel = 8,
    affixType = 0,
    conflict = 2,
    itemLevel = 48,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 25,
    max1 = 28,
    max2 = 31,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(8,52)->
    #equipAffixesCfg {
    iD = 84,
    affixID = 8,
    name = "神圣伤害",
    affixLevel = 9,
    affixType = 0,
    conflict = 2,
    itemLevel = 52,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 31,
    max1 = 34,
    max2 = 38,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(8,56)->
    #equipAffixesCfg {
    iD = 85,
    affixID = 8,
    name = "神圣伤害",
    affixLevel = 10,
    affixType = 0,
    conflict = 2,
    itemLevel = 56,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 38,
    max1 = 42,
    max2 = 47,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(8,60)->
    #equipAffixesCfg {
    iD = 86,
    affixID = 8,
    name = "神圣伤害",
    affixLevel = 11,
    affixType = 0,
    conflict = 2,
    itemLevel = 60,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 47,
    max1 = 52,
    max2 = 57,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(8,64)->
    #equipAffixesCfg {
    iD = 87,
    affixID = 8,
    name = "神圣伤害",
    affixLevel = 12,
    affixType = 0,
    conflict = 2,
    itemLevel = 64,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 57,
    max1 = 63,
    max2 = 70,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(8,68)->
    #equipAffixesCfg {
    iD = 88,
    affixID = 8,
    name = "神圣伤害",
    affixLevel = 13,
    affixType = 0,
    conflict = 2,
    itemLevel = 68,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 70,
    max1 = 78,
    max2 = 87,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(8,72)->
    #equipAffixesCfg {
    iD = 89,
    affixID = 8,
    name = "神圣伤害",
    affixLevel = 14,
    affixType = 0,
    conflict = 2,
    itemLevel = 72,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 87,
    max1 = 96,
    max2 = 106,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(8,76)->
    #equipAffixesCfg {
    iD = 90,
    affixID = 8,
    name = "神圣伤害",
    affixLevel = 15,
    affixType = 0,
    conflict = 2,
    itemLevel = 76,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 106,
    max1 = 118,
    max2 = 131,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(9,1)->
    #equipAffixesCfg {
    iD = 91,
    affixID = 9,
    name = "暗影伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 2,
    itemLevel = 1,
    equipType = [0,4,5],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 2,
    max1 = 2,
    max2 = 2,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(9,8)->
    #equipAffixesCfg {
    iD = 92,
    affixID = 9,
    name = "暗影伤害",
    affixLevel = 2,
    affixType = 0,
    conflict = 2,
    itemLevel = 8,
    equipType = [0,4,5],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 3,
    max1 = 3,
    max2 = 4,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(9,16)->
    #equipAffixesCfg {
    iD = 93,
    affixID = 9,
    name = "暗影伤害",
    affixLevel = 3,
    affixType = 0,
    conflict = 2,
    itemLevel = 16,
    equipType = [0,4,5],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 4,
    max1 = 5,
    max2 = 6,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(9,24)->
    #equipAffixesCfg {
    iD = 94,
    affixID = 9,
    name = "暗影伤害",
    affixLevel = 4,
    affixType = 0,
    conflict = 2,
    itemLevel = 24,
    equipType = [0,4,5],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 7,
    max1 = 8,
    max2 = 9,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(9,32)->
    #equipAffixesCfg {
    iD = 95,
    affixID = 9,
    name = "暗影伤害",
    affixLevel = 5,
    affixType = 0,
    conflict = 2,
    itemLevel = 32,
    equipType = [0,4,5],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 11,
    max1 = 12,
    max2 = 13,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(9,40)->
    #equipAffixesCfg {
    iD = 96,
    affixID = 9,
    name = "暗影伤害",
    affixLevel = 6,
    affixType = 0,
    conflict = 2,
    itemLevel = 40,
    equipType = [0,4,5],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 16,
    max1 = 18,
    max2 = 20,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(9,44)->
    #equipAffixesCfg {
    iD = 97,
    affixID = 9,
    name = "暗影伤害",
    affixLevel = 7,
    affixType = 0,
    conflict = 2,
    itemLevel = 44,
    equipType = [0,4,5],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 20,
    max1 = 22,
    max2 = 25,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(9,48)->
    #equipAffixesCfg {
    iD = 98,
    affixID = 9,
    name = "暗影伤害",
    affixLevel = 8,
    affixType = 0,
    conflict = 2,
    itemLevel = 48,
    equipType = [0,4,5],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 25,
    max1 = 28,
    max2 = 31,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(9,52)->
    #equipAffixesCfg {
    iD = 99,
    affixID = 9,
    name = "暗影伤害",
    affixLevel = 9,
    affixType = 0,
    conflict = 2,
    itemLevel = 52,
    equipType = [0,4,5],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 31,
    max1 = 34,
    max2 = 38,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(9,56)->
    #equipAffixesCfg {
    iD = 100,
    affixID = 9,
    name = "暗影伤害",
    affixLevel = 10,
    affixType = 0,
    conflict = 2,
    itemLevel = 56,
    equipType = [0,4,5],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 38,
    max1 = 42,
    max2 = 47,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(9,60)->
    #equipAffixesCfg {
    iD = 101,
    affixID = 9,
    name = "暗影伤害",
    affixLevel = 11,
    affixType = 0,
    conflict = 2,
    itemLevel = 60,
    equipType = [0,4,5],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 47,
    max1 = 52,
    max2 = 57,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(9,64)->
    #equipAffixesCfg {
    iD = 102,
    affixID = 9,
    name = "暗影伤害",
    affixLevel = 12,
    affixType = 0,
    conflict = 2,
    itemLevel = 64,
    equipType = [0,4,5],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 57,
    max1 = 63,
    max2 = 70,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(9,68)->
    #equipAffixesCfg {
    iD = 103,
    affixID = 9,
    name = "暗影伤害",
    affixLevel = 13,
    affixType = 0,
    conflict = 2,
    itemLevel = 68,
    equipType = [0,4,5],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 70,
    max1 = 78,
    max2 = 87,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(9,72)->
    #equipAffixesCfg {
    iD = 104,
    affixID = 9,
    name = "暗影伤害",
    affixLevel = 14,
    affixType = 0,
    conflict = 2,
    itemLevel = 72,
    equipType = [0,4,5],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 87,
    max1 = 96,
    max2 = 106,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(9,76)->
    #equipAffixesCfg {
    iD = 105,
    affixID = 9,
    name = "暗影伤害",
    affixLevel = 15,
    affixType = 0,
    conflict = 2,
    itemLevel = 76,
    equipType = [0,4,5],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 106,
    max1 = 118,
    max2 = 131,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(10,1)->
    #equipAffixesCfg {
    iD = 106,
    affixID = 10,
    name = "元素伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 2,
    itemLevel = 1,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 2,
    max1 = 2,
    max2 = 2,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(10,8)->
    #equipAffixesCfg {
    iD = 107,
    affixID = 10,
    name = "元素伤害",
    affixLevel = 2,
    affixType = 0,
    conflict = 2,
    itemLevel = 8,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 3,
    max1 = 3,
    max2 = 4,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(10,16)->
    #equipAffixesCfg {
    iD = 108,
    affixID = 10,
    name = "元素伤害",
    affixLevel = 3,
    affixType = 0,
    conflict = 2,
    itemLevel = 16,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 4,
    max1 = 5,
    max2 = 6,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(10,24)->
    #equipAffixesCfg {
    iD = 109,
    affixID = 10,
    name = "元素伤害",
    affixLevel = 4,
    affixType = 0,
    conflict = 2,
    itemLevel = 24,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 7,
    max1 = 8,
    max2 = 9,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(10,32)->
    #equipAffixesCfg {
    iD = 110,
    affixID = 10,
    name = "元素伤害",
    affixLevel = 5,
    affixType = 0,
    conflict = 2,
    itemLevel = 32,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 11,
    max1 = 12,
    max2 = 13,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(10,40)->
    #equipAffixesCfg {
    iD = 111,
    affixID = 10,
    name = "元素伤害",
    affixLevel = 6,
    affixType = 0,
    conflict = 2,
    itemLevel = 40,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 16,
    max1 = 18,
    max2 = 20,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(10,44)->
    #equipAffixesCfg {
    iD = 112,
    affixID = 10,
    name = "元素伤害",
    affixLevel = 7,
    affixType = 0,
    conflict = 2,
    itemLevel = 44,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 20,
    max1 = 22,
    max2 = 25,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(10,48)->
    #equipAffixesCfg {
    iD = 113,
    affixID = 10,
    name = "元素伤害",
    affixLevel = 8,
    affixType = 0,
    conflict = 2,
    itemLevel = 48,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 25,
    max1 = 28,
    max2 = 31,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(10,52)->
    #equipAffixesCfg {
    iD = 114,
    affixID = 10,
    name = "元素伤害",
    affixLevel = 9,
    affixType = 0,
    conflict = 2,
    itemLevel = 52,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 31,
    max1 = 34,
    max2 = 38,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(10,56)->
    #equipAffixesCfg {
    iD = 115,
    affixID = 10,
    name = "元素伤害",
    affixLevel = 10,
    affixType = 0,
    conflict = 2,
    itemLevel = 56,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 38,
    max1 = 42,
    max2 = 47,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(10,60)->
    #equipAffixesCfg {
    iD = 116,
    affixID = 10,
    name = "元素伤害",
    affixLevel = 11,
    affixType = 0,
    conflict = 2,
    itemLevel = 60,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 47,
    max1 = 52,
    max2 = 57,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(10,64)->
    #equipAffixesCfg {
    iD = 117,
    affixID = 10,
    name = "元素伤害",
    affixLevel = 12,
    affixType = 0,
    conflict = 2,
    itemLevel = 64,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 57,
    max1 = 63,
    max2 = 70,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(10,68)->
    #equipAffixesCfg {
    iD = 118,
    affixID = 10,
    name = "元素伤害",
    affixLevel = 13,
    affixType = 0,
    conflict = 2,
    itemLevel = 68,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 70,
    max1 = 78,
    max2 = 87,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(10,72)->
    #equipAffixesCfg {
    iD = 119,
    affixID = 10,
    name = "元素伤害",
    affixLevel = 14,
    affixType = 0,
    conflict = 2,
    itemLevel = 72,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 87,
    max1 = 96,
    max2 = 106,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(10,76)->
    #equipAffixesCfg {
    iD = 120,
    affixID = 10,
    name = "元素伤害",
    affixLevel = 15,
    affixType = 0,
    conflict = 2,
    itemLevel = 76,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 106,
    max1 = 118,
    max2 = 131,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(11,1)->
    #equipAffixesCfg {
    iD = 211,
    affixID = 11,
    name = "攻击速度",
    affixLevel = 1,
    affixType = 0,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.005,
    max1 = 0.01,
    max2 = 0.015,
    mulityOrPlus = 0,
    weight = 100,
    dice = 2
    };
getRow(11,8)->
    #equipAffixesCfg {
    iD = 212,
    affixID = 11,
    name = "攻击速度",
    affixLevel = 2,
    affixType = 0,
    conflict = 0,
    itemLevel = 8,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.005,
    max1 = 0.01,
    max2 = 0.015,
    mulityOrPlus = 0,
    weight = 100,
    dice = 2
    };
getRow(11,16)->
    #equipAffixesCfg {
    iD = 213,
    affixID = 11,
    name = "攻击速度",
    affixLevel = 3,
    affixType = 0,
    conflict = 0,
    itemLevel = 16,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.005,
    max1 = 0.01,
    max2 = 0.015,
    mulityOrPlus = 0,
    weight = 100,
    dice = 2
    };
getRow(11,24)->
    #equipAffixesCfg {
    iD = 214,
    affixID = 11,
    name = "攻击速度",
    affixLevel = 4,
    affixType = 0,
    conflict = 0,
    itemLevel = 24,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.005,
    max1 = 0.015,
    max2 = 0.025,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(11,32)->
    #equipAffixesCfg {
    iD = 215,
    affixID = 11,
    name = "攻击速度",
    affixLevel = 5,
    affixType = 0,
    conflict = 0,
    itemLevel = 32,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.015,
    max1 = 0.025,
    max2 = 0.035,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(11,40)->
    #equipAffixesCfg {
    iD = 216,
    affixID = 11,
    name = "攻击速度",
    affixLevel = 6,
    affixType = 0,
    conflict = 0,
    itemLevel = 40,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.025,
    max1 = 0.035,
    max2 = 0.045,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(11,44)->
    #equipAffixesCfg {
    iD = 217,
    affixID = 11,
    name = "攻击速度",
    affixLevel = 7,
    affixType = 0,
    conflict = 0,
    itemLevel = 44,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.03,
    max1 = 0.04,
    max2 = 0.05,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(11,48)->
    #equipAffixesCfg {
    iD = 218,
    affixID = 11,
    name = "攻击速度",
    affixLevel = 8,
    affixType = 0,
    conflict = 0,
    itemLevel = 48,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.035,
    max1 = 0.045,
    max2 = 0.055,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(11,52)->
    #equipAffixesCfg {
    iD = 219,
    affixID = 11,
    name = "攻击速度",
    affixLevel = 9,
    affixType = 0,
    conflict = 0,
    itemLevel = 52,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.04,
    max1 = 0.05,
    max2 = 0.06,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(11,56)->
    #equipAffixesCfg {
    iD = 220,
    affixID = 11,
    name = "攻击速度",
    affixLevel = 10,
    affixType = 0,
    conflict = 0,
    itemLevel = 56,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.045,
    max1 = 0.055,
    max2 = 0.065,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(11,60)->
    #equipAffixesCfg {
    iD = 221,
    affixID = 11,
    name = "攻击速度",
    affixLevel = 11,
    affixType = 0,
    conflict = 0,
    itemLevel = 60,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.05,
    max1 = 0.06,
    max2 = 0.07,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(11,64)->
    #equipAffixesCfg {
    iD = 222,
    affixID = 11,
    name = "攻击速度",
    affixLevel = 12,
    affixType = 0,
    conflict = 0,
    itemLevel = 64,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.055,
    max1 = 0.065,
    max2 = 0.075,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(11,68)->
    #equipAffixesCfg {
    iD = 223,
    affixID = 11,
    name = "攻击速度",
    affixLevel = 13,
    affixType = 0,
    conflict = 0,
    itemLevel = 68,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.06,
    max1 = 0.07,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(11,72)->
    #equipAffixesCfg {
    iD = 224,
    affixID = 11,
    name = "攻击速度",
    affixLevel = 14,
    affixType = 0,
    conflict = 0,
    itemLevel = 72,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.065,
    max1 = 0.075,
    max2 = 0.085,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(11,76)->
    #equipAffixesCfg {
    iD = 225,
    affixID = 11,
    name = "攻击速度",
    affixLevel = 15,
    affixType = 0,
    conflict = 0,
    itemLevel = 76,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.07,
    max1 = 0.08,
    max2 = 0.09,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(12,1)->
    #equipAffixesCfg {
    iD = 151,
    affixID = 12,
    name = "全防御",
    affixLevel = 1,
    affixType = 0,
    conflict = 0,
    itemLevel = 1,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 20,
    max1 = 22,
    max2 = 24,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(12,8)->
    #equipAffixesCfg {
    iD = 152,
    affixID = 12,
    name = "全防御",
    affixLevel = 2,
    affixType = 0,
    conflict = 0,
    itemLevel = 8,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 29,
    max1 = 32,
    max2 = 35,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(12,16)->
    #equipAffixesCfg {
    iD = 153,
    affixID = 12,
    name = "全防御",
    affixLevel = 3,
    affixType = 0,
    conflict = 0,
    itemLevel = 16,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 43,
    max1 = 48,
    max2 = 53,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(12,24)->
    #equipAffixesCfg {
    iD = 154,
    affixID = 12,
    name = "全防御",
    affixLevel = 4,
    affixType = 0,
    conflict = 0,
    itemLevel = 24,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 65,
    max1 = 73,
    max2 = 80,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(12,32)->
    #equipAffixesCfg {
    iD = 155,
    affixID = 12,
    name = "全防御",
    affixLevel = 5,
    affixType = 0,
    conflict = 0,
    itemLevel = 32,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 99,
    max1 = 110,
    max2 = 122,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(12,40)->
    #equipAffixesCfg {
    iD = 156,
    affixID = 12,
    name = "全防御",
    affixLevel = 6,
    affixType = 0,
    conflict = 0,
    itemLevel = 40,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 149,
    max1 = 166,
    max2 = 183,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(12,44)->
    #equipAffixesCfg {
    iD = 157,
    affixID = 12,
    name = "全防御",
    affixLevel = 7,
    affixType = 0,
    conflict = 0,
    itemLevel = 44,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 183,
    max1 = 203,
    max2 = 225,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(12,48)->
    #equipAffixesCfg {
    iD = 158,
    affixID = 12,
    name = "全防御",
    affixLevel = 8,
    affixType = 0,
    conflict = 0,
    itemLevel = 48,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 225,
    max1 = 250,
    max2 = 277,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(12,52)->
    #equipAffixesCfg {
    iD = 159,
    affixID = 12,
    name = "全防御",
    affixLevel = 9,
    affixType = 0,
    conflict = 0,
    itemLevel = 52,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 277,
    max1 = 307,
    max2 = 340,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(12,56)->
    #equipAffixesCfg {
    iD = 160,
    affixID = 12,
    name = "全防御",
    affixLevel = 10,
    affixType = 0,
    conflict = 0,
    itemLevel = 56,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 340,
    max1 = 377,
    max2 = 417,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(12,60)->
    #equipAffixesCfg {
    iD = 161,
    affixID = 12,
    name = "全防御",
    affixLevel = 11,
    affixType = 0,
    conflict = 0,
    itemLevel = 60,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 417,
    max1 = 463,
    max2 = 513,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(12,64)->
    #equipAffixesCfg {
    iD = 162,
    affixID = 12,
    name = "全防御",
    affixLevel = 12,
    affixType = 0,
    conflict = 0,
    itemLevel = 64,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 513,
    max1 = 568,
    max2 = 629,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(12,68)->
    #equipAffixesCfg {
    iD = 163,
    affixID = 12,
    name = "全防御",
    affixLevel = 13,
    affixType = 0,
    conflict = 0,
    itemLevel = 68,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 629,
    max1 = 697,
    max2 = 773,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(12,72)->
    #equipAffixesCfg {
    iD = 164,
    affixID = 12,
    name = "全防御",
    affixLevel = 14,
    affixType = 0,
    conflict = 0,
    itemLevel = 72,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 773,
    max1 = 856,
    max2 = 949,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(12,76)->
    #equipAffixesCfg {
    iD = 165,
    affixID = 12,
    name = "全防御",
    affixLevel = 15,
    affixType = 0,
    conflict = 0,
    itemLevel = 76,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 949,
    max1 = 1052,
    max2 = 1165,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(15,1)->
    #equipAffixesCfg {
    iD = 166,
    affixID = 15,
    name = "生命上限",
    affixLevel = 1,
    affixType = 0,
    conflict = 4,
    itemLevel = 1,
    equipType = [2,3,7],
    equipClass = [0],
    propType = 18,
    min = 0.09025,
    max1 = 0.1,
    max2 = 0.110803324099723,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(15,4)->
    #equipAffixesCfg {
    iD = 167,
    affixID = 15,
    name = "生命上限",
    affixLevel = 2,
    affixType = 0,
    conflict = 4,
    itemLevel = 4,
    equipType = [2,3,7],
    equipClass = [0],
    propType = 18,
    min = 0.09025,
    max1 = 0.1,
    max2 = 0.110803324099723,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(15,8)->
    #equipAffixesCfg {
    iD = 168,
    affixID = 15,
    name = "生命上限",
    affixLevel = 3,
    affixType = 0,
    conflict = 4,
    itemLevel = 8,
    equipType = [2,3,7],
    equipClass = [0],
    propType = 18,
    min = 0.09025,
    max1 = 0.1,
    max2 = 0.110803324099723,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(15,16)->
    #equipAffixesCfg {
    iD = 169,
    affixID = 15,
    name = "生命上限",
    affixLevel = 4,
    affixType = 0,
    conflict = 4,
    itemLevel = 16,
    equipType = [2,3,7],
    equipClass = [0],
    propType = 18,
    min = 0.09025,
    max1 = 0.1,
    max2 = 0.110803324099723,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(15,24)->
    #equipAffixesCfg {
    iD = 170,
    affixID = 15,
    name = "生命上限",
    affixLevel = 5,
    affixType = 0,
    conflict = 4,
    itemLevel = 24,
    equipType = [2,3,7],
    equipClass = [0],
    propType = 18,
    min = 0.09025,
    max1 = 0.1,
    max2 = 0.110803324099723,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(15,32)->
    #equipAffixesCfg {
    iD = 171,
    affixID = 15,
    name = "生命上限",
    affixLevel = 6,
    affixType = 0,
    conflict = 4,
    itemLevel = 32,
    equipType = [2,3,7],
    equipClass = [0],
    propType = 18,
    min = 0.09025,
    max1 = 0.1,
    max2 = 0.110803324099723,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(15,40)->
    #equipAffixesCfg {
    iD = 172,
    affixID = 15,
    name = "生命上限",
    affixLevel = 7,
    affixType = 0,
    conflict = 4,
    itemLevel = 40,
    equipType = [2,3,7],
    equipClass = [0],
    propType = 18,
    min = 0.09025,
    max1 = 0.1,
    max2 = 0.110803324099723,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(15,48)->
    #equipAffixesCfg {
    iD = 173,
    affixID = 15,
    name = "生命上限",
    affixLevel = 8,
    affixType = 0,
    conflict = 4,
    itemLevel = 48,
    equipType = [2,3,7],
    equipClass = [0],
    propType = 18,
    min = 0.09025,
    max1 = 0.1,
    max2 = 0.110803324099723,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(15,56)->
    #equipAffixesCfg {
    iD = 174,
    affixID = 15,
    name = "生命上限",
    affixLevel = 9,
    affixType = 0,
    conflict = 4,
    itemLevel = 56,
    equipType = [2,3,7],
    equipClass = [0],
    propType = 18,
    min = 0.09025,
    max1 = 0.1,
    max2 = 0.110803324099723,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(15,60)->
    #equipAffixesCfg {
    iD = 175,
    affixID = 15,
    name = "生命上限",
    affixLevel = 10,
    affixType = 0,
    conflict = 4,
    itemLevel = 60,
    equipType = [2,3,7],
    equipClass = [0],
    propType = 18,
    min = 0.09025,
    max1 = 0.1,
    max2 = 0.110803324099723,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(16,1)->
    #equipAffixesCfg {
    iD = 176,
    affixID = 16,
    name = "暴击率",
    affixLevel = 1,
    affixType = 0,
    conflict = 5,
    itemLevel = 1,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.005,
    max1 = 0.01,
    max2 = 0.015,
    mulityOrPlus = 0,
    weight = 100,
    dice = 2
    };
getRow(16,8)->
    #equipAffixesCfg {
    iD = 177,
    affixID = 16,
    name = "暴击率",
    affixLevel = 2,
    affixType = 0,
    conflict = 5,
    itemLevel = 8,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.005,
    max1 = 0.01,
    max2 = 0.015,
    mulityOrPlus = 0,
    weight = 100,
    dice = 2
    };
getRow(16,16)->
    #equipAffixesCfg {
    iD = 178,
    affixID = 16,
    name = "暴击率",
    affixLevel = 3,
    affixType = 0,
    conflict = 5,
    itemLevel = 16,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.005,
    max1 = 0.01,
    max2 = 0.015,
    mulityOrPlus = 0,
    weight = 100,
    dice = 2
    };
getRow(16,24)->
    #equipAffixesCfg {
    iD = 179,
    affixID = 16,
    name = "暴击率",
    affixLevel = 4,
    affixType = 0,
    conflict = 5,
    itemLevel = 24,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.005,
    max1 = 0.015,
    max2 = 0.025,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(16,32)->
    #equipAffixesCfg {
    iD = 180,
    affixID = 16,
    name = "暴击率",
    affixLevel = 5,
    affixType = 0,
    conflict = 5,
    itemLevel = 32,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.015,
    max1 = 0.025,
    max2 = 0.035,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(16,40)->
    #equipAffixesCfg {
    iD = 181,
    affixID = 16,
    name = "暴击率",
    affixLevel = 6,
    affixType = 0,
    conflict = 5,
    itemLevel = 40,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.025,
    max1 = 0.035,
    max2 = 0.045,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(16,44)->
    #equipAffixesCfg {
    iD = 182,
    affixID = 16,
    name = "暴击率",
    affixLevel = 7,
    affixType = 0,
    conflict = 5,
    itemLevel = 44,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.03,
    max1 = 0.04,
    max2 = 0.05,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(16,48)->
    #equipAffixesCfg {
    iD = 183,
    affixID = 16,
    name = "暴击率",
    affixLevel = 8,
    affixType = 0,
    conflict = 5,
    itemLevel = 48,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.035,
    max1 = 0.045,
    max2 = 0.055,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(16,52)->
    #equipAffixesCfg {
    iD = 184,
    affixID = 16,
    name = "暴击率",
    affixLevel = 9,
    affixType = 0,
    conflict = 5,
    itemLevel = 52,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.04,
    max1 = 0.05,
    max2 = 0.06,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(16,56)->
    #equipAffixesCfg {
    iD = 185,
    affixID = 16,
    name = "暴击率",
    affixLevel = 10,
    affixType = 0,
    conflict = 5,
    itemLevel = 56,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.045,
    max1 = 0.055,
    max2 = 0.065,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(16,60)->
    #equipAffixesCfg {
    iD = 186,
    affixID = 16,
    name = "暴击率",
    affixLevel = 11,
    affixType = 0,
    conflict = 5,
    itemLevel = 60,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.05,
    max1 = 0.06,
    max2 = 0.07,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(16,64)->
    #equipAffixesCfg {
    iD = 187,
    affixID = 16,
    name = "暴击率",
    affixLevel = 12,
    affixType = 0,
    conflict = 5,
    itemLevel = 64,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.055,
    max1 = 0.065,
    max2 = 0.075,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(16,68)->
    #equipAffixesCfg {
    iD = 188,
    affixID = 16,
    name = "暴击率",
    affixLevel = 13,
    affixType = 0,
    conflict = 5,
    itemLevel = 68,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.06,
    max1 = 0.07,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(16,72)->
    #equipAffixesCfg {
    iD = 189,
    affixID = 16,
    name = "暴击率",
    affixLevel = 14,
    affixType = 0,
    conflict = 5,
    itemLevel = 72,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.065,
    max1 = 0.075,
    max2 = 0.085,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(16,76)->
    #equipAffixesCfg {
    iD = 190,
    affixID = 16,
    name = "暴击率",
    affixLevel = 15,
    affixType = 0,
    conflict = 5,
    itemLevel = 76,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.07,
    max1 = 0.08,
    max2 = 0.09,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(17,1)->
    #equipAffixesCfg {
    iD = 191,
    affixID = 17,
    name = "暴击率短刺",
    affixLevel = 1,
    affixType = 0,
    conflict = 5,
    itemLevel = 1,
    equipType = [1],
    equipClass = [3,5],
    propType = 35,
    min = 0.009025,
    max1 = 0.01,
    max2 = 0.0110803324099723,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(17,4)->
    #equipAffixesCfg {
    iD = 192,
    affixID = 17,
    name = "暴击率短刺",
    affixLevel = 2,
    affixType = 0,
    conflict = 5,
    itemLevel = 4,
    equipType = [1],
    equipClass = [3,5],
    propType = 35,
    min = 0.009025,
    max1 = 0.01,
    max2 = 0.0110803324099723,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(17,8)->
    #equipAffixesCfg {
    iD = 193,
    affixID = 17,
    name = "暴击率短刺",
    affixLevel = 3,
    affixType = 0,
    conflict = 5,
    itemLevel = 8,
    equipType = [1],
    equipClass = [3,5],
    propType = 35,
    min = 0.009025,
    max1 = 0.01,
    max2 = 0.0110803324099723,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(17,16)->
    #equipAffixesCfg {
    iD = 194,
    affixID = 17,
    name = "暴击率短刺",
    affixLevel = 4,
    affixType = 0,
    conflict = 5,
    itemLevel = 16,
    equipType = [1],
    equipClass = [3,5],
    propType = 35,
    min = 0.009025,
    max1 = 0.01,
    max2 = 0.0110803324099723,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(17,24)->
    #equipAffixesCfg {
    iD = 195,
    affixID = 17,
    name = "暴击率短刺",
    affixLevel = 5,
    affixType = 0,
    conflict = 5,
    itemLevel = 24,
    equipType = [1],
    equipClass = [3,5],
    propType = 35,
    min = 0.0135375,
    max1 = 0.015,
    max2 = 0.0166204986149584,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(17,32)->
    #equipAffixesCfg {
    iD = 196,
    affixID = 17,
    name = "暴击率短刺",
    affixLevel = 6,
    affixType = 0,
    conflict = 5,
    itemLevel = 32,
    equipType = [1],
    equipClass = [3,5],
    propType = 35,
    min = 0.0225625,
    max1 = 0.025,
    max2 = 0.0277008310249307,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(17,40)->
    #equipAffixesCfg {
    iD = 197,
    affixID = 17,
    name = "暴击率短刺",
    affixLevel = 7,
    affixType = 0,
    conflict = 5,
    itemLevel = 40,
    equipType = [1],
    equipClass = [3,5],
    propType = 35,
    min = 0.0315875,
    max1 = 0.035,
    max2 = 0.038781163434903,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(17,48)->
    #equipAffixesCfg {
    iD = 198,
    affixID = 17,
    name = "暴击率短刺",
    affixLevel = 8,
    affixType = 0,
    conflict = 5,
    itemLevel = 48,
    equipType = [1],
    equipClass = [3,5],
    propType = 35,
    min = 0.0406125,
    max1 = 0.045,
    max2 = 0.0498614958448753,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(17,56)->
    #equipAffixesCfg {
    iD = 199,
    affixID = 17,
    name = "暴击率短刺",
    affixLevel = 9,
    affixType = 0,
    conflict = 5,
    itemLevel = 56,
    equipType = [1],
    equipClass = [3,5],
    propType = 35,
    min = 0.0496375,
    max1 = 0.055,
    max2 = 0.0609418282548476,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(17,60)->
    #equipAffixesCfg {
    iD = 200,
    affixID = 17,
    name = "暴击率短刺",
    affixLevel = 10,
    affixType = 0,
    conflict = 5,
    itemLevel = 60,
    equipType = [1],
    equipClass = [3,5],
    propType = 35,
    min = 0.05415,
    max1 = 0.06,
    max2 = 0.0664819944598338,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(18,1)->
    #equipAffixesCfg {
    iD = 201,
    affixID = 18,
    name = "暴击伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1],
    equipClass = [0],
    propType = 36,
    min = 0.315875,
    max1 = 0.35,
    max2 = 0.38781163434903,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(18,4)->
    #equipAffixesCfg {
    iD = 202,
    affixID = 18,
    name = "暴击伤害",
    affixLevel = 2,
    affixType = 0,
    conflict = 0,
    itemLevel = 4,
    equipType = [0,1],
    equipClass = [0],
    propType = 36,
    min = 0.315875,
    max1 = 0.35,
    max2 = 0.38781163434903,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(18,8)->
    #equipAffixesCfg {
    iD = 203,
    affixID = 18,
    name = "暴击伤害",
    affixLevel = 3,
    affixType = 0,
    conflict = 0,
    itemLevel = 8,
    equipType = [0,1],
    equipClass = [0],
    propType = 36,
    min = 0.315875,
    max1 = 0.35,
    max2 = 0.38781163434903,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(18,16)->
    #equipAffixesCfg {
    iD = 204,
    affixID = 18,
    name = "暴击伤害",
    affixLevel = 4,
    affixType = 0,
    conflict = 0,
    itemLevel = 16,
    equipType = [0,1],
    equipClass = [0],
    propType = 36,
    min = 0.315875,
    max1 = 0.35,
    max2 = 0.38781163434903,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(18,24)->
    #equipAffixesCfg {
    iD = 205,
    affixID = 18,
    name = "暴击伤害",
    affixLevel = 5,
    affixType = 0,
    conflict = 0,
    itemLevel = 24,
    equipType = [0,1],
    equipClass = [0],
    propType = 36,
    min = 0.315875,
    max1 = 0.35,
    max2 = 0.38781163434903,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(18,32)->
    #equipAffixesCfg {
    iD = 206,
    affixID = 18,
    name = "暴击伤害",
    affixLevel = 6,
    affixType = 0,
    conflict = 0,
    itemLevel = 32,
    equipType = [0,1],
    equipClass = [0],
    propType = 36,
    min = 0.315875,
    max1 = 0.35,
    max2 = 0.38781163434903,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(18,40)->
    #equipAffixesCfg {
    iD = 207,
    affixID = 18,
    name = "暴击伤害",
    affixLevel = 7,
    affixType = 0,
    conflict = 0,
    itemLevel = 40,
    equipType = [0,1],
    equipClass = [0],
    propType = 36,
    min = 0.315875,
    max1 = 0.35,
    max2 = 0.38781163434903,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(18,48)->
    #equipAffixesCfg {
    iD = 208,
    affixID = 18,
    name = "暴击伤害",
    affixLevel = 8,
    affixType = 0,
    conflict = 0,
    itemLevel = 48,
    equipType = [0,1],
    equipClass = [0],
    propType = 36,
    min = 0.315875,
    max1 = 0.35,
    max2 = 0.38781163434903,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(18,56)->
    #equipAffixesCfg {
    iD = 209,
    affixID = 18,
    name = "暴击伤害",
    affixLevel = 9,
    affixType = 0,
    conflict = 0,
    itemLevel = 56,
    equipType = [0,1],
    equipClass = [0],
    propType = 36,
    min = 0.315875,
    max1 = 0.35,
    max2 = 0.38781163434903,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(18,60)->
    #equipAffixesCfg {
    iD = 210,
    affixID = 18,
    name = "暴击伤害",
    affixLevel = 10,
    affixType = 0,
    conflict = 0,
    itemLevel = 60,
    equipType = [0,1],
    equipClass = [0],
    propType = 36,
    min = 0.315875,
    max1 = 0.35,
    max2 = 0.38781163434903,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(20,1)->
    #equipAffixesCfg {
    iD = 226,
    affixID = 20,
    name = "节约能量",
    affixLevel = 1,
    affixType = 0,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.005,
    max1 = 0.01,
    max2 = 0.015,
    mulityOrPlus = 0,
    weight = 100,
    dice = 2
    };
getRow(20,8)->
    #equipAffixesCfg {
    iD = 227,
    affixID = 20,
    name = "节约能量",
    affixLevel = 2,
    affixType = 0,
    conflict = 0,
    itemLevel = 8,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.005,
    max1 = 0.01,
    max2 = 0.015,
    mulityOrPlus = 0,
    weight = 100,
    dice = 2
    };
getRow(20,16)->
    #equipAffixesCfg {
    iD = 228,
    affixID = 20,
    name = "节约能量",
    affixLevel = 3,
    affixType = 0,
    conflict = 0,
    itemLevel = 16,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.005,
    max1 = 0.015,
    max2 = 0.025,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(20,24)->
    #equipAffixesCfg {
    iD = 229,
    affixID = 20,
    name = "节约能量",
    affixLevel = 4,
    affixType = 0,
    conflict = 0,
    itemLevel = 24,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.015,
    max1 = 0.025,
    max2 = 0.035,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(20,32)->
    #equipAffixesCfg {
    iD = 230,
    affixID = 20,
    name = "节约能量",
    affixLevel = 5,
    affixType = 0,
    conflict = 0,
    itemLevel = 32,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.025,
    max1 = 0.035,
    max2 = 0.045,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(20,40)->
    #equipAffixesCfg {
    iD = 231,
    affixID = 20,
    name = "节约能量",
    affixLevel = 6,
    affixType = 0,
    conflict = 0,
    itemLevel = 40,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.035,
    max1 = 0.045,
    max2 = 0.055,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(20,44)->
    #equipAffixesCfg {
    iD = 232,
    affixID = 20,
    name = "节约能量",
    affixLevel = 7,
    affixType = 0,
    conflict = 0,
    itemLevel = 44,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.04,
    max1 = 0.05,
    max2 = 0.06,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(20,48)->
    #equipAffixesCfg {
    iD = 233,
    affixID = 20,
    name = "节约能量",
    affixLevel = 8,
    affixType = 0,
    conflict = 0,
    itemLevel = 48,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.045,
    max1 = 0.055,
    max2 = 0.065,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(20,52)->
    #equipAffixesCfg {
    iD = 234,
    affixID = 20,
    name = "节约能量",
    affixLevel = 9,
    affixType = 0,
    conflict = 0,
    itemLevel = 52,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.05,
    max1 = 0.06,
    max2 = 0.07,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(20,56)->
    #equipAffixesCfg {
    iD = 235,
    affixID = 20,
    name = "节约能量",
    affixLevel = 10,
    affixType = 0,
    conflict = 0,
    itemLevel = 56,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.055,
    max1 = 0.065,
    max2 = 0.075,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(20,60)->
    #equipAffixesCfg {
    iD = 236,
    affixID = 20,
    name = "节约能量",
    affixLevel = 11,
    affixType = 0,
    conflict = 0,
    itemLevel = 60,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.06,
    max1 = 0.07,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(20,64)->
    #equipAffixesCfg {
    iD = 237,
    affixID = 20,
    name = "节约能量",
    affixLevel = 12,
    affixType = 0,
    conflict = 0,
    itemLevel = 64,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.065,
    max1 = 0.075,
    max2 = 0.085,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(20,68)->
    #equipAffixesCfg {
    iD = 238,
    affixID = 20,
    name = "节约能量",
    affixLevel = 13,
    affixType = 0,
    conflict = 0,
    itemLevel = 68,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.07,
    max1 = 0.08,
    max2 = 0.09,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(20,72)->
    #equipAffixesCfg {
    iD = 239,
    affixID = 20,
    name = "节约能量",
    affixLevel = 14,
    affixType = 0,
    conflict = 0,
    itemLevel = 72,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.075,
    max1 = 0.085,
    max2 = 0.095,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(20,76)->
    #equipAffixesCfg {
    iD = 240,
    affixID = 20,
    name = "节约能量",
    affixLevel = 15,
    affixType = 0,
    conflict = 0,
    itemLevel = 76,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.08,
    max1 = 0.09,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(21,1)->
    #equipAffixesCfg {
    iD = 241,
    affixID = 21,
    name = "冷却速度",
    affixLevel = 1,
    affixType = 0,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.005,
    max1 = 0.01,
    max2 = 0.015,
    mulityOrPlus = 0,
    weight = 100,
    dice = 2
    };
getRow(21,8)->
    #equipAffixesCfg {
    iD = 242,
    affixID = 21,
    name = "冷却速度",
    affixLevel = 2,
    affixType = 0,
    conflict = 0,
    itemLevel = 8,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.005,
    max1 = 0.01,
    max2 = 0.015,
    mulityOrPlus = 0,
    weight = 100,
    dice = 2
    };
getRow(21,16)->
    #equipAffixesCfg {
    iD = 243,
    affixID = 21,
    name = "冷却速度",
    affixLevel = 3,
    affixType = 0,
    conflict = 0,
    itemLevel = 16,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.005,
    max1 = 0.015,
    max2 = 0.025,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(21,24)->
    #equipAffixesCfg {
    iD = 244,
    affixID = 21,
    name = "冷却速度",
    affixLevel = 4,
    affixType = 0,
    conflict = 0,
    itemLevel = 24,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.015,
    max1 = 0.025,
    max2 = 0.035,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(21,32)->
    #equipAffixesCfg {
    iD = 245,
    affixID = 21,
    name = "冷却速度",
    affixLevel = 5,
    affixType = 0,
    conflict = 0,
    itemLevel = 32,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.025,
    max1 = 0.035,
    max2 = 0.045,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(21,40)->
    #equipAffixesCfg {
    iD = 246,
    affixID = 21,
    name = "冷却速度",
    affixLevel = 6,
    affixType = 0,
    conflict = 0,
    itemLevel = 40,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.035,
    max1 = 0.045,
    max2 = 0.055,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(21,44)->
    #equipAffixesCfg {
    iD = 247,
    affixID = 21,
    name = "冷却速度",
    affixLevel = 7,
    affixType = 0,
    conflict = 0,
    itemLevel = 44,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.04,
    max1 = 0.05,
    max2 = 0.06,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(21,48)->
    #equipAffixesCfg {
    iD = 248,
    affixID = 21,
    name = "冷却速度",
    affixLevel = 8,
    affixType = 0,
    conflict = 0,
    itemLevel = 48,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.045,
    max1 = 0.055,
    max2 = 0.065,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(21,52)->
    #equipAffixesCfg {
    iD = 249,
    affixID = 21,
    name = "冷却速度",
    affixLevel = 9,
    affixType = 0,
    conflict = 0,
    itemLevel = 52,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.05,
    max1 = 0.06,
    max2 = 0.07,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(21,56)->
    #equipAffixesCfg {
    iD = 250,
    affixID = 21,
    name = "冷却速度",
    affixLevel = 10,
    affixType = 0,
    conflict = 0,
    itemLevel = 56,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.055,
    max1 = 0.065,
    max2 = 0.075,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(21,60)->
    #equipAffixesCfg {
    iD = 251,
    affixID = 21,
    name = "冷却速度",
    affixLevel = 11,
    affixType = 0,
    conflict = 0,
    itemLevel = 60,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.06,
    max1 = 0.07,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(21,64)->
    #equipAffixesCfg {
    iD = 252,
    affixID = 21,
    name = "冷却速度",
    affixLevel = 12,
    affixType = 0,
    conflict = 0,
    itemLevel = 64,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.065,
    max1 = 0.075,
    max2 = 0.085,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(21,68)->
    #equipAffixesCfg {
    iD = 253,
    affixID = 21,
    name = "冷却速度",
    affixLevel = 13,
    affixType = 0,
    conflict = 0,
    itemLevel = 68,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.07,
    max1 = 0.08,
    max2 = 0.09,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(21,72)->
    #equipAffixesCfg {
    iD = 254,
    affixID = 21,
    name = "冷却速度",
    affixLevel = 14,
    affixType = 0,
    conflict = 0,
    itemLevel = 72,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.075,
    max1 = 0.085,
    max2 = 0.095,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(21,76)->
    #equipAffixesCfg {
    iD = 255,
    affixID = 21,
    name = "冷却速度",
    affixLevel = 15,
    affixType = 0,
    conflict = 0,
    itemLevel = 76,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.08,
    max1 = 0.09,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(22,1)->
    #equipAffixesCfg {
    iD = 256,
    affixID = 22,
    name = "圣力恢复",
    affixLevel = 1,
    affixType = 1,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1],
    equipClass = [1],
    propType = 11,
    min = 1.4,
    max1 = 1.6,
    max2 = 1.8,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(23,1)->
    #equipAffixesCfg {
    iD = 257,
    affixID = 23,
    name = "秘法恢复",
    affixLevel = 1,
    affixType = 1,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1],
    equipClass = [2],
    propType = 13,
    min = 1.5,
    max1 = 1.5,
    max2 = 1.5,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(24,1)->
    #equipAffixesCfg {
    iD = 258,
    affixID = 24,
    name = "影力恢复",
    affixLevel = 1,
    affixType = 1,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1],
    equipClass = [3],
    propType = 17,
    min = 1.5,
    max1 = 1.5,
    max2 = 1.5,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(25,1)->
    #equipAffixesCfg {
    iD = 259,
    affixID = 25,
    name = "魔怒恢复",
    affixLevel = 1,
    affixType = 1,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1],
    equipClass = [4],
    propType = 15,
    min = 1,
    max1 = 1,
    max2 = 1,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(26,1)->
    #equipAffixesCfg {
    iD = 260,
    affixID = 26,
    name = "圣力上限",
    affixLevel = 1,
    affixType = 1,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1],
    equipClass = [1],
    propType = 10,
    min = 10,
    max1 = 10,
    max2 = 10,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(27,1)->
    #equipAffixesCfg {
    iD = 261,
    affixID = 27,
    name = "秘法上限",
    affixLevel = 1,
    affixType = 1,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1],
    equipClass = [2],
    propType = 12,
    min = 11,
    max1 = 13,
    max2 = 15,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(28,1)->
    #equipAffixesCfg {
    iD = 262,
    affixID = 28,
    name = "影力上限",
    affixLevel = 1,
    affixType = 1,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1],
    equipClass = [3],
    propType = 16,
    min = 11,
    max1 = 13,
    max2 = 15,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(29,1)->
    #equipAffixesCfg {
    iD = 263,
    affixID = 29,
    name = "魔怒上限",
    affixLevel = 1,
    affixType = 1,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1],
    equipClass = [4],
    propType = 14,
    min = 11,
    max1 = 13,
    max2 = 15,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(30,1)->
    #equipAffixesCfg {
    iD = 264,
    affixID = 30,
    name = "物理伤害抗性",
    affixLevel = 1,
    affixType = 1,
    conflict = 6,
    itemLevel = 1,
    equipType = [1,2,4,5],
    equipClass = [1,2,3,4,5],
    propType = 48,
    min = 0.04,
    max1 = 0.05,
    max2 = 0.06,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(31,1)->
    #equipAffixesCfg {
    iD = 265,
    affixID = 31,
    name = "神圣伤害抗性",
    affixLevel = 1,
    affixType = 1,
    conflict = 6,
    itemLevel = 1,
    equipType = [1,2,4,5],
    equipClass = [1,2,3,4,5],
    propType = 47,
    min = 0.04,
    max1 = 0.05,
    max2 = 0.06,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(32,1)->
    #equipAffixesCfg {
    iD = 266,
    affixID = 32,
    name = "暗影伤害抗性",
    affixLevel = 1,
    affixType = 1,
    conflict = 6,
    itemLevel = 1,
    equipType = [1,2,4,5],
    equipClass = [1,2,3,4,5],
    propType = 49,
    min = 0.04,
    max1 = 0.05,
    max2 = 0.06,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(33,1)->
    #equipAffixesCfg {
    iD = 267,
    affixID = 33,
    name = "元素伤害抗性",
    affixLevel = 1,
    affixType = 1,
    conflict = 6,
    itemLevel = 1,
    equipType = [1,2,4,5],
    equipClass = [1,2,3,4,5],
    propType = 50,
    min = 0.04,
    max1 = 0.05,
    max2 = 0.06,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(34,1)->
    #equipAffixesCfg {
    iD = 268,
    affixID = 34,
    name = "移动速度",
    affixLevel = 1,
    affixType = 1,
    conflict = 0,
    itemLevel = 1,
    equipType = [3],
    equipClass = [1,2,3,4,5],
    propType = 40,
    min = 0.75,
    max1 = 0.75,
    max2 = 0.75,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(35,1)->
    #equipAffixesCfg {
    iD = 269,
    affixID = 35,
    name = "对精英伤害",
    affixLevel = 1,
    affixType = 1,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1],
    equipClass = [1,2,3,4,5],
    propType = 8,
    min = 0.04,
    max1 = 0.05,
    max2 = 0.06,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(36,32)->
    #equipAffixesCfg {
    iD = 271,
    affixID = 36,
    name = "反弹伤害",
    affixLevel = 1,
    affixType = 1,
    conflict = 0,
    itemLevel = 32,
    equipType = [1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 26,
    max1 = 29,
    max2 = 32,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(36,40)->
    #equipAffixesCfg {
    iD = 272,
    affixID = 36,
    name = "反弹伤害",
    affixLevel = 2,
    affixType = 1,
    conflict = 0,
    itemLevel = 40,
    equipType = [1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 39,
    max1 = 43,
    max2 = 48,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(36,44)->
    #equipAffixesCfg {
    iD = 273,
    affixID = 36,
    name = "反弹伤害",
    affixLevel = 3,
    affixType = 1,
    conflict = 0,
    itemLevel = 44,
    equipType = [1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 48,
    max1 = 53,
    max2 = 59,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(36,48)->
    #equipAffixesCfg {
    iD = 274,
    affixID = 36,
    name = "反弹伤害",
    affixLevel = 4,
    affixType = 1,
    conflict = 0,
    itemLevel = 48,
    equipType = [1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 59,
    max1 = 65,
    max2 = 73,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(36,52)->
    #equipAffixesCfg {
    iD = 275,
    affixID = 36,
    name = "反弹伤害",
    affixLevel = 5,
    affixType = 1,
    conflict = 0,
    itemLevel = 52,
    equipType = [1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 73,
    max1 = 81,
    max2 = 89,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(36,56)->
    #equipAffixesCfg {
    iD = 276,
    affixID = 36,
    name = "反弹伤害",
    affixLevel = 6,
    affixType = 1,
    conflict = 0,
    itemLevel = 56,
    equipType = [1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 89,
    max1 = 99,
    max2 = 110,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(36,60)->
    #equipAffixesCfg {
    iD = 277,
    affixID = 36,
    name = "反弹伤害",
    affixLevel = 7,
    affixType = 1,
    conflict = 0,
    itemLevel = 60,
    equipType = [1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 110,
    max1 = 122,
    max2 = 135,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(36,64)->
    #equipAffixesCfg {
    iD = 278,
    affixID = 36,
    name = "反弹伤害",
    affixLevel = 8,
    affixType = 1,
    conflict = 0,
    itemLevel = 64,
    equipType = [1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 135,
    max1 = 149,
    max2 = 166,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(36,68)->
    #equipAffixesCfg {
    iD = 279,
    affixID = 36,
    name = "反弹伤害",
    affixLevel = 9,
    affixType = 1,
    conflict = 0,
    itemLevel = 68,
    equipType = [1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 166,
    max1 = 184,
    max2 = 203,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(36,72)->
    #equipAffixesCfg {
    iD = 280,
    affixID = 36,
    name = "反弹伤害",
    affixLevel = 10,
    affixType = 1,
    conflict = 0,
    itemLevel = 72,
    equipType = [1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 203,
    max1 = 225,
    max2 = 250,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(36,76)->
    #equipAffixesCfg {
    iD = 281,
    affixID = 36,
    name = "反弹伤害",
    affixLevel = 11,
    affixType = 1,
    conflict = 0,
    itemLevel = 76,
    equipType = [1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 250,
    max1 = 277,
    max2 = 307,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(37,1)->
    #equipAffixesCfg {
    iD = 282,
    affixID = 37,
    name = "强韧",
    affixLevel = 1,
    affixType = 1,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 52,
    min = 0.045125,
    max1 = 0.05,
    max2 = 0.0554016620498615,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(38,1)->
    #equipAffixesCfg {
    iD = 283,
    affixID = 38,
    name = "意志",
    affixLevel = 1,
    affixType = 1,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 53,
    min = 0.045125,
    max1 = 0.05,
    max2 = 0.0554016620498615,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(39,1)->
    #equipAffixesCfg {
    iD = 284,
    affixID = 39,
    name = "反射",
    affixLevel = 1,
    affixType = 1,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 54,
    min = 0.045125,
    max1 = 0.05,
    max2 = 0.0554016620498615,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(40,1)->
    #equipAffixesCfg {
    iD = 285,
    affixID = 40,
    name = "药水效果",
    affixLevel = 1,
    affixType = 1,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 12,
    max1 = 14,
    max2 = 15,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(40,8)->
    #equipAffixesCfg {
    iD = 286,
    affixID = 40,
    name = "药水效果",
    affixLevel = 2,
    affixType = 1,
    conflict = 0,
    itemLevel = 8,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 18,
    max1 = 20,
    max2 = 22,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(40,16)->
    #equipAffixesCfg {
    iD = 287,
    affixID = 40,
    name = "药水效果",
    affixLevel = 3,
    affixType = 1,
    conflict = 0,
    itemLevel = 16,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 27,
    max1 = 30,
    max2 = 33,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(40,24)->
    #equipAffixesCfg {
    iD = 288,
    affixID = 40,
    name = "药水效果",
    affixLevel = 4,
    affixType = 1,
    conflict = 0,
    itemLevel = 24,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 41,
    max1 = 46,
    max2 = 51,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(40,32)->
    #equipAffixesCfg {
    iD = 289,
    affixID = 40,
    name = "药水效果",
    affixLevel = 5,
    affixType = 1,
    conflict = 0,
    itemLevel = 32,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 62,
    max1 = 69,
    max2 = 77,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(40,40)->
    #equipAffixesCfg {
    iD = 290,
    affixID = 40,
    name = "药水效果",
    affixLevel = 6,
    affixType = 1,
    conflict = 0,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 94,
    max1 = 105,
    max2 = 116,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(40,44)->
    #equipAffixesCfg {
    iD = 291,
    affixID = 40,
    name = "药水效果",
    affixLevel = 7,
    affixType = 1,
    conflict = 0,
    itemLevel = 44,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 116,
    max1 = 128,
    max2 = 142,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(40,48)->
    #equipAffixesCfg {
    iD = 292,
    affixID = 40,
    name = "药水效果",
    affixLevel = 8,
    affixType = 1,
    conflict = 0,
    itemLevel = 48,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 142,
    max1 = 158,
    max2 = 175,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(40,52)->
    #equipAffixesCfg {
    iD = 293,
    affixID = 40,
    name = "药水效果",
    affixLevel = 9,
    affixType = 1,
    conflict = 0,
    itemLevel = 52,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 175,
    max1 = 194,
    max2 = 215,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(40,56)->
    #equipAffixesCfg {
    iD = 294,
    affixID = 40,
    name = "药水效果",
    affixLevel = 10,
    affixType = 1,
    conflict = 0,
    itemLevel = 56,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 215,
    max1 = 238,
    max2 = 264,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(40,60)->
    #equipAffixesCfg {
    iD = 295,
    affixID = 40,
    name = "药水效果",
    affixLevel = 11,
    affixType = 1,
    conflict = 0,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 264,
    max1 = 293,
    max2 = 324,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(40,64)->
    #equipAffixesCfg {
    iD = 296,
    affixID = 40,
    name = "药水效果",
    affixLevel = 12,
    affixType = 1,
    conflict = 0,
    itemLevel = 64,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 324,
    max1 = 359,
    max2 = 398,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(40,68)->
    #equipAffixesCfg {
    iD = 297,
    affixID = 40,
    name = "药水效果",
    affixLevel = 13,
    affixType = 1,
    conflict = 0,
    itemLevel = 68,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 398,
    max1 = 441,
    max2 = 489,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(40,72)->
    #equipAffixesCfg {
    iD = 298,
    affixID = 40,
    name = "药水效果",
    affixLevel = 14,
    affixType = 1,
    conflict = 0,
    itemLevel = 72,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 489,
    max1 = 542,
    max2 = 600,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(40,76)->
    #equipAffixesCfg {
    iD = 299,
    affixID = 40,
    name = "药水效果",
    affixLevel = 15,
    affixType = 1,
    conflict = 0,
    itemLevel = 76,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 600,
    max1 = 665,
    max2 = 737,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(41,1)->
    #equipAffixesCfg {
    iD = 300,
    affixID = 41,
    name = "盾牌猛击伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [1],
    propType = 63,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(42,1)->
    #equipAffixesCfg {
    iD = 301,
    affixID = 42,
    name = "净化冷却加速",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [1],
    propType = 64,
    min = 0.05,
    max1 = 0.06,
    max2 = 0.07,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(43,1)->
    #equipAffixesCfg {
    iD = 302,
    affixID = 43,
    name = "冲锋冷却加速",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [1],
    propType = 65,
    min = 0.05,
    max1 = 0.06,
    max2 = 0.07,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(44,1)->
    #equipAffixesCfg {
    iD = 303,
    affixID = 44,
    name = "永恒之光伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [1],
    propType = 66,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(45,1)->
    #equipAffixesCfg {
    iD = 304,
    affixID = 45,
    name = "忏悔伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [1],
    propType = 67,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(46,1)->
    #equipAffixesCfg {
    iD = 305,
    affixID = 46,
    name = "黎明之锤冷却加速",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [1],
    propType = 68,
    min = 0.05,
    max1 = 0.06,
    max2 = 0.07,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(47,1)->
    #equipAffixesCfg {
    iD = 306,
    affixID = 47,
    name = "火球术伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [2],
    propType = 70,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(48,1)->
    #equipAffixesCfg {
    iD = 307,
    affixID = 48,
    name = "陨石术伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [2],
    propType = 71,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(49,1)->
    #equipAffixesCfg {
    iD = 308,
    affixID = 49,
    name = "冰环术冷却加速",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [2],
    propType = 72,
    min = 0.05,
    max1 = 0.06,
    max2 = 0.07,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(50,1)->
    #equipAffixesCfg {
    iD = 309,
    affixID = 50,
    name = "冰环术伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [2],
    propType = 73,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(51,1)->
    #equipAffixesCfg {
    iD = 310,
    affixID = 51,
    name = "冰风暴伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [2],
    propType = 74,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(52,1)->
    #equipAffixesCfg {
    iD = 311,
    affixID = 52,
    name = "能量冲击伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [2],
    propType = 75,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(53,1)->
    #equipAffixesCfg {
    iD = 312,
    affixID = 53,
    name = "生命收割冷却",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [4],
    propType = 76,
    min = 0.05,
    max1 = 0.06,
    max2 = 0.07,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(54,1)->
    #equipAffixesCfg {
    iD = 313,
    affixID = 54,
    name = "远古恶魔冷却",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [4],
    propType = 97,
    min = 0.05,
    max1 = 0.06,
    max2 = 0.07,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(55,1)->
    #equipAffixesCfg {
    iD = 314,
    affixID = 55,
    name = "亵渎伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [4],
    propType = 78,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(56,1)->
    #equipAffixesCfg {
    iD = 315,
    affixID = 56,
    name = "末日决战伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [4],
    propType = 79,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(57,1)->
    #equipAffixesCfg {
    iD = 316,
    affixID = 57,
    name = "死亡风暴伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [4],
    propType = 81,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(58,1)->
    #equipAffixesCfg {
    iD = 317,
    affixID = 58,
    name = "死亡斩杀伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [4],
    propType = 82,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(59,1)->
    #equipAffixesCfg {
    iD = 318,
    affixID = 59,
    name = "烈风斩伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [3],
    propType = 83,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(60,1)->
    #equipAffixesCfg {
    iD = 319,
    affixID = 60,
    name = "致命投掷冷却加速",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [3],
    propType = 84,
    min = 0.05,
    max1 = 0.06,
    max2 = 0.07,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(61,1)->
    #equipAffixesCfg {
    iD = 320,
    affixID = 61,
    name = "缴械伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [3],
    propType = 85,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(62,1)->
    #equipAffixesCfg {
    iD = 321,
    affixID = 62,
    name = "灭寂伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [3],
    propType = 86,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(63,1)->
    #equipAffixesCfg {
    iD = 322,
    affixID = 63,
    name = "乱影击伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [3],
    propType = 87,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(64,1)->
    #equipAffixesCfg {
    iD = 323,
    affixID = 64,
    name = "致命投掷伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [3],
    propType = 88,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(65,1)->
    #equipAffixesCfg {
    iD = 324,
    affixID = 65,
    name = "影武冷却加速",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [3],
    propType = 89,
    min = 0.05,
    max1 = 0.06,
    max2 = 0.07,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(66,1)->
    #equipAffixesCfg {
    iD = 325,
    affixID = 66,
    name = "影袭伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [3],
    propType = 90,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(67,1)->
    #equipAffixesCfg {
    iD = 270,
    affixID = 67,
    name = "受精英伤害",
    affixLevel = 1,
    affixType = 1,
    conflict = 0,
    itemLevel = 1,
    equipType = [2],
    equipClass = [1,2,3,4,5],
    propType = 9,
    min = -0.04,
    max1 = -0.05,
    max2 = -0.06,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(68,1)->
    #equipAffixesCfg {
    iD = 326,
    affixID = 68,
    name = "物理防御",
    affixLevel = 1,
    affixType = 1,
    conflict = 12,
    itemLevel = 1,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 30,
    max1 = 33,
    max2 = 37,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(68,8)->
    #equipAffixesCfg {
    iD = 327,
    affixID = 68,
    name = "物理防御",
    affixLevel = 2,
    affixType = 1,
    conflict = 12,
    itemLevel = 8,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 43,
    max1 = 48,
    max2 = 53,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(68,16)->
    #equipAffixesCfg {
    iD = 328,
    affixID = 68,
    name = "物理防御",
    affixLevel = 3,
    affixType = 1,
    conflict = 12,
    itemLevel = 16,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 65,
    max1 = 72,
    max2 = 80,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(68,24)->
    #equipAffixesCfg {
    iD = 329,
    affixID = 68,
    name = "物理防御",
    affixLevel = 4,
    affixType = 1,
    conflict = 12,
    itemLevel = 24,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 98,
    max1 = 109,
    max2 = 121,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(68,32)->
    #equipAffixesCfg {
    iD = 330,
    affixID = 68,
    name = "物理防御",
    affixLevel = 5,
    affixType = 1,
    conflict = 12,
    itemLevel = 32,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 149,
    max1 = 165,
    max2 = 183,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(68,40)->
    #equipAffixesCfg {
    iD = 331,
    affixID = 68,
    name = "物理防御",
    affixLevel = 6,
    affixType = 1,
    conflict = 12,
    itemLevel = 40,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 224,
    max1 = 249,
    max2 = 275,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(68,44)->
    #equipAffixesCfg {
    iD = 332,
    affixID = 68,
    name = "物理防御",
    affixLevel = 7,
    affixType = 1,
    conflict = 12,
    itemLevel = 44,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 275,
    max1 = 305,
    max2 = 338,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(68,48)->
    #equipAffixesCfg {
    iD = 333,
    affixID = 68,
    name = "物理防御",
    affixLevel = 8,
    affixType = 1,
    conflict = 12,
    itemLevel = 48,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 338,
    max1 = 375,
    max2 = 415,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(68,52)->
    #equipAffixesCfg {
    iD = 334,
    affixID = 68,
    name = "物理防御",
    affixLevel = 9,
    affixType = 1,
    conflict = 12,
    itemLevel = 52,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 415,
    max1 = 460,
    max2 = 510,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(68,56)->
    #equipAffixesCfg {
    iD = 335,
    affixID = 68,
    name = "物理防御",
    affixLevel = 10,
    affixType = 1,
    conflict = 12,
    itemLevel = 56,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 510,
    max1 = 565,
    max2 = 626,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(68,60)->
    #equipAffixesCfg {
    iD = 336,
    affixID = 68,
    name = "物理防御",
    affixLevel = 11,
    affixType = 1,
    conflict = 12,
    itemLevel = 60,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 626,
    max1 = 694,
    max2 = 769,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(68,64)->
    #equipAffixesCfg {
    iD = 337,
    affixID = 68,
    name = "物理防御",
    affixLevel = 12,
    affixType = 1,
    conflict = 12,
    itemLevel = 64,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 769,
    max1 = 852,
    max2 = 944,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(68,68)->
    #equipAffixesCfg {
    iD = 338,
    affixID = 68,
    name = "物理防御",
    affixLevel = 13,
    affixType = 1,
    conflict = 12,
    itemLevel = 68,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 944,
    max1 = 1046,
    max2 = 1160,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(68,72)->
    #equipAffixesCfg {
    iD = 339,
    affixID = 68,
    name = "物理防御",
    affixLevel = 14,
    affixType = 1,
    conflict = 12,
    itemLevel = 72,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 1160,
    max1 = 1285,
    max2 = 1424,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(68,76)->
    #equipAffixesCfg {
    iD = 340,
    affixID = 68,
    name = "物理防御",
    affixLevel = 15,
    affixType = 1,
    conflict = 12,
    itemLevel = 76,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 1424,
    max1 = 1578,
    max2 = 1748,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(69,1)->
    #equipAffixesCfg {
    iD = 341,
    affixID = 69,
    name = "魔法防御",
    affixLevel = 1,
    affixType = 1,
    conflict = 12,
    itemLevel = 1,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 30,
    max1 = 33,
    max2 = 37,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(69,8)->
    #equipAffixesCfg {
    iD = 342,
    affixID = 69,
    name = "魔法防御",
    affixLevel = 2,
    affixType = 1,
    conflict = 12,
    itemLevel = 8,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 43,
    max1 = 48,
    max2 = 53,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(69,16)->
    #equipAffixesCfg {
    iD = 343,
    affixID = 69,
    name = "魔法防御",
    affixLevel = 3,
    affixType = 1,
    conflict = 12,
    itemLevel = 16,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 65,
    max1 = 72,
    max2 = 80,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(69,24)->
    #equipAffixesCfg {
    iD = 344,
    affixID = 69,
    name = "魔法防御",
    affixLevel = 4,
    affixType = 1,
    conflict = 12,
    itemLevel = 24,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 98,
    max1 = 109,
    max2 = 121,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(69,32)->
    #equipAffixesCfg {
    iD = 345,
    affixID = 69,
    name = "魔法防御",
    affixLevel = 5,
    affixType = 1,
    conflict = 12,
    itemLevel = 32,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 149,
    max1 = 165,
    max2 = 183,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(69,40)->
    #equipAffixesCfg {
    iD = 346,
    affixID = 69,
    name = "魔法防御",
    affixLevel = 6,
    affixType = 1,
    conflict = 12,
    itemLevel = 40,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 224,
    max1 = 249,
    max2 = 275,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(69,44)->
    #equipAffixesCfg {
    iD = 347,
    affixID = 69,
    name = "魔法防御",
    affixLevel = 7,
    affixType = 1,
    conflict = 12,
    itemLevel = 44,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 275,
    max1 = 305,
    max2 = 338,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(69,48)->
    #equipAffixesCfg {
    iD = 348,
    affixID = 69,
    name = "魔法防御",
    affixLevel = 8,
    affixType = 1,
    conflict = 12,
    itemLevel = 48,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 338,
    max1 = 375,
    max2 = 415,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(69,52)->
    #equipAffixesCfg {
    iD = 349,
    affixID = 69,
    name = "魔法防御",
    affixLevel = 9,
    affixType = 1,
    conflict = 12,
    itemLevel = 52,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 415,
    max1 = 460,
    max2 = 510,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(69,56)->
    #equipAffixesCfg {
    iD = 350,
    affixID = 69,
    name = "魔法防御",
    affixLevel = 10,
    affixType = 1,
    conflict = 12,
    itemLevel = 56,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 510,
    max1 = 565,
    max2 = 626,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(69,60)->
    #equipAffixesCfg {
    iD = 351,
    affixID = 69,
    name = "魔法防御",
    affixLevel = 11,
    affixType = 1,
    conflict = 12,
    itemLevel = 60,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 626,
    max1 = 694,
    max2 = 769,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(69,64)->
    #equipAffixesCfg {
    iD = 352,
    affixID = 69,
    name = "魔法防御",
    affixLevel = 12,
    affixType = 1,
    conflict = 12,
    itemLevel = 64,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 769,
    max1 = 852,
    max2 = 944,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(69,68)->
    #equipAffixesCfg {
    iD = 353,
    affixID = 69,
    name = "魔法防御",
    affixLevel = 13,
    affixType = 1,
    conflict = 12,
    itemLevel = 68,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 944,
    max1 = 1046,
    max2 = 1160,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(69,72)->
    #equipAffixesCfg {
    iD = 354,
    affixID = 69,
    name = "魔法防御",
    affixLevel = 14,
    affixType = 1,
    conflict = 12,
    itemLevel = 72,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 1160,
    max1 = 1285,
    max2 = 1424,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(69,76)->
    #equipAffixesCfg {
    iD = 355,
    affixID = 69,
    name = "魔法防御",
    affixLevel = 15,
    affixType = 1,
    conflict = 12,
    itemLevel = 76,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 1424,
    max1 = 1578,
    max2 = 1748,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1001,1)->
    #equipAffixesCfg {
    iD = 356,
    affixID = 1001,
    name = "力量",
    affixLevel = 1,
    affixType = 2,
    conflict = 1,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 6,
    max1 = 7,
    max2 = 8,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1001,8)->
    #equipAffixesCfg {
    iD = 357,
    affixID = 1001,
    name = "力量",
    affixLevel = 2,
    affixType = 2,
    conflict = 1,
    itemLevel = 8,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 9,
    max1 = 10,
    max2 = 11,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1001,16)->
    #equipAffixesCfg {
    iD = 358,
    affixID = 1001,
    name = "力量",
    affixLevel = 3,
    affixType = 2,
    conflict = 1,
    itemLevel = 16,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 14,
    max1 = 15,
    max2 = 17,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1001,24)->
    #equipAffixesCfg {
    iD = 359,
    affixID = 1001,
    name = "力量",
    affixLevel = 4,
    affixType = 2,
    conflict = 1,
    itemLevel = 24,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 21,
    max1 = 23,
    max2 = 26,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1001,32)->
    #equipAffixesCfg {
    iD = 360,
    affixID = 1001,
    name = "力量",
    affixLevel = 5,
    affixType = 2,
    conflict = 1,
    itemLevel = 32,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 32,
    max1 = 35,
    max2 = 39,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1001,40)->
    #equipAffixesCfg {
    iD = 361,
    affixID = 1001,
    name = "力量",
    affixLevel = 6,
    affixType = 2,
    conflict = 1,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 48,
    max1 = 53,
    max2 = 59,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1001,44)->
    #equipAffixesCfg {
    iD = 362,
    affixID = 1001,
    name = "力量",
    affixLevel = 7,
    affixType = 2,
    conflict = 1,
    itemLevel = 44,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 59,
    max1 = 66,
    max2 = 73,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1001,48)->
    #equipAffixesCfg {
    iD = 363,
    affixID = 1001,
    name = "力量",
    affixLevel = 8,
    affixType = 2,
    conflict = 1,
    itemLevel = 48,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 73,
    max1 = 81,
    max2 = 90,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1001,52)->
    #equipAffixesCfg {
    iD = 364,
    affixID = 1001,
    name = "力量",
    affixLevel = 9,
    affixType = 2,
    conflict = 1,
    itemLevel = 52,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 90,
    max1 = 99,
    max2 = 110,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1001,56)->
    #equipAffixesCfg {
    iD = 365,
    affixID = 1001,
    name = "力量",
    affixLevel = 10,
    affixType = 2,
    conflict = 1,
    itemLevel = 56,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 110,
    max1 = 122,
    max2 = 135,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1001,60)->
    #equipAffixesCfg {
    iD = 366,
    affixID = 1001,
    name = "力量",
    affixLevel = 11,
    affixType = 2,
    conflict = 1,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 135,
    max1 = 150,
    max2 = 166,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1001,64)->
    #equipAffixesCfg {
    iD = 367,
    affixID = 1001,
    name = "力量",
    affixLevel = 12,
    affixType = 2,
    conflict = 1,
    itemLevel = 64,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 166,
    max1 = 184,
    max2 = 204,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1001,68)->
    #equipAffixesCfg {
    iD = 368,
    affixID = 1001,
    name = "力量",
    affixLevel = 13,
    affixType = 2,
    conflict = 1,
    itemLevel = 68,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 204,
    max1 = 226,
    max2 = 251,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1001,72)->
    #equipAffixesCfg {
    iD = 369,
    affixID = 1001,
    name = "力量",
    affixLevel = 14,
    affixType = 2,
    conflict = 1,
    itemLevel = 72,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 251,
    max1 = 278,
    max2 = 308,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1001,76)->
    #equipAffixesCfg {
    iD = 370,
    affixID = 1001,
    name = "力量",
    affixLevel = 15,
    affixType = 2,
    conflict = 1,
    itemLevel = 76,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 308,
    max1 = 341,
    max2 = 378,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1002,1)->
    #equipAffixesCfg {
    iD = 371,
    affixID = 1002,
    name = "敏捷",
    affixLevel = 1,
    affixType = 2,
    conflict = 1,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 6,
    max1 = 7,
    max2 = 8,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1002,8)->
    #equipAffixesCfg {
    iD = 372,
    affixID = 1002,
    name = "敏捷",
    affixLevel = 2,
    affixType = 2,
    conflict = 1,
    itemLevel = 8,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 9,
    max1 = 10,
    max2 = 11,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1002,16)->
    #equipAffixesCfg {
    iD = 373,
    affixID = 1002,
    name = "敏捷",
    affixLevel = 3,
    affixType = 2,
    conflict = 1,
    itemLevel = 16,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 14,
    max1 = 15,
    max2 = 17,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1002,24)->
    #equipAffixesCfg {
    iD = 374,
    affixID = 1002,
    name = "敏捷",
    affixLevel = 4,
    affixType = 2,
    conflict = 1,
    itemLevel = 24,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 21,
    max1 = 23,
    max2 = 26,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1002,32)->
    #equipAffixesCfg {
    iD = 375,
    affixID = 1002,
    name = "敏捷",
    affixLevel = 5,
    affixType = 2,
    conflict = 1,
    itemLevel = 32,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 32,
    max1 = 35,
    max2 = 39,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1002,40)->
    #equipAffixesCfg {
    iD = 376,
    affixID = 1002,
    name = "敏捷",
    affixLevel = 6,
    affixType = 2,
    conflict = 1,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 48,
    max1 = 53,
    max2 = 59,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1002,44)->
    #equipAffixesCfg {
    iD = 377,
    affixID = 1002,
    name = "敏捷",
    affixLevel = 7,
    affixType = 2,
    conflict = 1,
    itemLevel = 44,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 59,
    max1 = 66,
    max2 = 73,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1002,48)->
    #equipAffixesCfg {
    iD = 378,
    affixID = 1002,
    name = "敏捷",
    affixLevel = 8,
    affixType = 2,
    conflict = 1,
    itemLevel = 48,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 73,
    max1 = 81,
    max2 = 90,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1002,52)->
    #equipAffixesCfg {
    iD = 379,
    affixID = 1002,
    name = "敏捷",
    affixLevel = 9,
    affixType = 2,
    conflict = 1,
    itemLevel = 52,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 90,
    max1 = 99,
    max2 = 110,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1002,56)->
    #equipAffixesCfg {
    iD = 380,
    affixID = 1002,
    name = "敏捷",
    affixLevel = 10,
    affixType = 2,
    conflict = 1,
    itemLevel = 56,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 110,
    max1 = 122,
    max2 = 135,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1002,60)->
    #equipAffixesCfg {
    iD = 381,
    affixID = 1002,
    name = "敏捷",
    affixLevel = 11,
    affixType = 2,
    conflict = 1,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 135,
    max1 = 150,
    max2 = 166,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1002,64)->
    #equipAffixesCfg {
    iD = 382,
    affixID = 1002,
    name = "敏捷",
    affixLevel = 12,
    affixType = 2,
    conflict = 1,
    itemLevel = 64,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 166,
    max1 = 184,
    max2 = 204,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1002,68)->
    #equipAffixesCfg {
    iD = 383,
    affixID = 1002,
    name = "敏捷",
    affixLevel = 13,
    affixType = 2,
    conflict = 1,
    itemLevel = 68,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 204,
    max1 = 226,
    max2 = 251,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1002,72)->
    #equipAffixesCfg {
    iD = 384,
    affixID = 1002,
    name = "敏捷",
    affixLevel = 14,
    affixType = 2,
    conflict = 1,
    itemLevel = 72,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 251,
    max1 = 278,
    max2 = 308,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1002,76)->
    #equipAffixesCfg {
    iD = 385,
    affixID = 1002,
    name = "敏捷",
    affixLevel = 15,
    affixType = 2,
    conflict = 1,
    itemLevel = 76,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 308,
    max1 = 341,
    max2 = 378,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1003,1)->
    #equipAffixesCfg {
    iD = 386,
    affixID = 1003,
    name = "智力",
    affixLevel = 1,
    affixType = 2,
    conflict = 1,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 6,
    max1 = 7,
    max2 = 8,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1003,8)->
    #equipAffixesCfg {
    iD = 387,
    affixID = 1003,
    name = "智力",
    affixLevel = 2,
    affixType = 2,
    conflict = 1,
    itemLevel = 8,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 9,
    max1 = 10,
    max2 = 11,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1003,16)->
    #equipAffixesCfg {
    iD = 388,
    affixID = 1003,
    name = "智力",
    affixLevel = 3,
    affixType = 2,
    conflict = 1,
    itemLevel = 16,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 14,
    max1 = 15,
    max2 = 17,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1003,24)->
    #equipAffixesCfg {
    iD = 389,
    affixID = 1003,
    name = "智力",
    affixLevel = 4,
    affixType = 2,
    conflict = 1,
    itemLevel = 24,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 21,
    max1 = 23,
    max2 = 26,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1003,32)->
    #equipAffixesCfg {
    iD = 390,
    affixID = 1003,
    name = "智力",
    affixLevel = 5,
    affixType = 2,
    conflict = 1,
    itemLevel = 32,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 32,
    max1 = 35,
    max2 = 39,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1003,40)->
    #equipAffixesCfg {
    iD = 391,
    affixID = 1003,
    name = "智力",
    affixLevel = 6,
    affixType = 2,
    conflict = 1,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 48,
    max1 = 53,
    max2 = 59,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1003,44)->
    #equipAffixesCfg {
    iD = 392,
    affixID = 1003,
    name = "智力",
    affixLevel = 7,
    affixType = 2,
    conflict = 1,
    itemLevel = 44,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 59,
    max1 = 66,
    max2 = 73,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1003,48)->
    #equipAffixesCfg {
    iD = 393,
    affixID = 1003,
    name = "智力",
    affixLevel = 8,
    affixType = 2,
    conflict = 1,
    itemLevel = 48,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 73,
    max1 = 81,
    max2 = 90,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1003,52)->
    #equipAffixesCfg {
    iD = 394,
    affixID = 1003,
    name = "智力",
    affixLevel = 9,
    affixType = 2,
    conflict = 1,
    itemLevel = 52,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 90,
    max1 = 99,
    max2 = 110,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1003,56)->
    #equipAffixesCfg {
    iD = 395,
    affixID = 1003,
    name = "智力",
    affixLevel = 10,
    affixType = 2,
    conflict = 1,
    itemLevel = 56,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 110,
    max1 = 122,
    max2 = 135,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1003,60)->
    #equipAffixesCfg {
    iD = 396,
    affixID = 1003,
    name = "智力",
    affixLevel = 11,
    affixType = 2,
    conflict = 1,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 135,
    max1 = 150,
    max2 = 166,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1003,64)->
    #equipAffixesCfg {
    iD = 397,
    affixID = 1003,
    name = "智力",
    affixLevel = 12,
    affixType = 2,
    conflict = 1,
    itemLevel = 64,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 166,
    max1 = 184,
    max2 = 204,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1003,68)->
    #equipAffixesCfg {
    iD = 398,
    affixID = 1003,
    name = "智力",
    affixLevel = 13,
    affixType = 2,
    conflict = 1,
    itemLevel = 68,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 204,
    max1 = 226,
    max2 = 251,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1003,72)->
    #equipAffixesCfg {
    iD = 399,
    affixID = 1003,
    name = "智力",
    affixLevel = 14,
    affixType = 2,
    conflict = 1,
    itemLevel = 72,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 251,
    max1 = 278,
    max2 = 308,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1003,76)->
    #equipAffixesCfg {
    iD = 400,
    affixID = 1003,
    name = "智力",
    affixLevel = 15,
    affixType = 2,
    conflict = 1,
    itemLevel = 76,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 308,
    max1 = 341,
    max2 = 378,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1004,1)->
    #equipAffixesCfg {
    iD = 401,
    affixID = 1004,
    name = "体质",
    affixLevel = 1,
    affixType = 2,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 5,
    max1 = 6,
    max2 = 7,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1004,8)->
    #equipAffixesCfg {
    iD = 402,
    affixID = 1004,
    name = "体质",
    affixLevel = 2,
    affixType = 2,
    conflict = 0,
    itemLevel = 8,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 8,
    max1 = 9,
    max2 = 10,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1004,16)->
    #equipAffixesCfg {
    iD = 403,
    affixID = 1004,
    name = "体质",
    affixLevel = 3,
    affixType = 2,
    conflict = 0,
    itemLevel = 16,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 12,
    max1 = 14,
    max2 = 15,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1004,24)->
    #equipAffixesCfg {
    iD = 404,
    affixID = 1004,
    name = "体质",
    affixLevel = 4,
    affixType = 2,
    conflict = 0,
    itemLevel = 24,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 19,
    max1 = 21,
    max2 = 23,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1004,32)->
    #equipAffixesCfg {
    iD = 405,
    affixID = 1004,
    name = "体质",
    affixLevel = 5,
    affixType = 2,
    conflict = 0,
    itemLevel = 32,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 29,
    max1 = 32,
    max2 = 35,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1004,40)->
    #equipAffixesCfg {
    iD = 406,
    affixID = 1004,
    name = "体质",
    affixLevel = 6,
    affixType = 2,
    conflict = 0,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 43,
    max1 = 48,
    max2 = 53,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1004,44)->
    #equipAffixesCfg {
    iD = 407,
    affixID = 1004,
    name = "体质",
    affixLevel = 7,
    affixType = 2,
    conflict = 0,
    itemLevel = 44,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 53,
    max1 = 59,
    max2 = 65,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1004,48)->
    #equipAffixesCfg {
    iD = 408,
    affixID = 1004,
    name = "体质",
    affixLevel = 8,
    affixType = 2,
    conflict = 0,
    itemLevel = 48,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 65,
    max1 = 73,
    max2 = 81,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1004,52)->
    #equipAffixesCfg {
    iD = 409,
    affixID = 1004,
    name = "体质",
    affixLevel = 9,
    affixType = 2,
    conflict = 0,
    itemLevel = 52,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 81,
    max1 = 89,
    max2 = 99,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1004,56)->
    #equipAffixesCfg {
    iD = 410,
    affixID = 1004,
    name = "体质",
    affixLevel = 10,
    affixType = 2,
    conflict = 0,
    itemLevel = 56,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 99,
    max1 = 110,
    max2 = 122,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1004,60)->
    #equipAffixesCfg {
    iD = 411,
    affixID = 1004,
    name = "体质",
    affixLevel = 11,
    affixType = 2,
    conflict = 0,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 122,
    max1 = 135,
    max2 = 149,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1004,64)->
    #equipAffixesCfg {
    iD = 412,
    affixID = 1004,
    name = "体质",
    affixLevel = 12,
    affixType = 2,
    conflict = 0,
    itemLevel = 64,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 149,
    max1 = 166,
    max2 = 184,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1004,68)->
    #equipAffixesCfg {
    iD = 413,
    affixID = 1004,
    name = "体质",
    affixLevel = 13,
    affixType = 2,
    conflict = 0,
    itemLevel = 68,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 184,
    max1 = 203,
    max2 = 225,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1004,72)->
    #equipAffixesCfg {
    iD = 414,
    affixID = 1004,
    name = "体质",
    affixLevel = 14,
    affixType = 2,
    conflict = 0,
    itemLevel = 72,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 225,
    max1 = 250,
    max2 = 277,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1004,76)->
    #equipAffixesCfg {
    iD = 415,
    affixID = 1004,
    name = "体质",
    affixLevel = 15,
    affixType = 2,
    conflict = 0,
    itemLevel = 76,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 277,
    max1 = 307,
    max2 = 340,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1005,1)->
    #equipAffixesCfg {
    iD = 476,
    affixID = 1005,
    name = "击中回血",
    affixLevel = 1,
    affixType = 2,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 3,
    max1 = 3,
    max2 = 3,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1005,8)->
    #equipAffixesCfg {
    iD = 477,
    affixID = 1005,
    name = "击中回血",
    affixLevel = 2,
    affixType = 2,
    conflict = 0,
    itemLevel = 8,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 4,
    max1 = 5,
    max2 = 5,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1005,16)->
    #equipAffixesCfg {
    iD = 478,
    affixID = 1005,
    name = "击中回血",
    affixLevel = 3,
    affixType = 2,
    conflict = 0,
    itemLevel = 16,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 6,
    max1 = 7,
    max2 = 8,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1005,24)->
    #equipAffixesCfg {
    iD = 479,
    affixID = 1005,
    name = "击中回血",
    affixLevel = 4,
    affixType = 2,
    conflict = 0,
    itemLevel = 24,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 10,
    max1 = 11,
    max2 = 12,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1005,32)->
    #equipAffixesCfg {
    iD = 480,
    affixID = 1005,
    name = "击中回血",
    affixLevel = 5,
    affixType = 2,
    conflict = 0,
    itemLevel = 32,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 15,
    max1 = 17,
    max2 = 19,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1005,40)->
    #equipAffixesCfg {
    iD = 481,
    affixID = 1005,
    name = "击中回血",
    affixLevel = 6,
    affixType = 2,
    conflict = 0,
    itemLevel = 40,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 23,
    max1 = 26,
    max2 = 29,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1005,44)->
    #equipAffixesCfg {
    iD = 482,
    affixID = 1005,
    name = "击中回血",
    affixLevel = 7,
    affixType = 2,
    conflict = 0,
    itemLevel = 44,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 29,
    max1 = 32,
    max2 = 35,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1005,48)->
    #equipAffixesCfg {
    iD = 483,
    affixID = 1005,
    name = "击中回血",
    affixLevel = 8,
    affixType = 2,
    conflict = 0,
    itemLevel = 48,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 35,
    max1 = 39,
    max2 = 43,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1005,52)->
    #equipAffixesCfg {
    iD = 484,
    affixID = 1005,
    name = "击中回血",
    affixLevel = 9,
    affixType = 2,
    conflict = 0,
    itemLevel = 52,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 43,
    max1 = 48,
    max2 = 53,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1005,56)->
    #equipAffixesCfg {
    iD = 485,
    affixID = 1005,
    name = "击中回血",
    affixLevel = 10,
    affixType = 2,
    conflict = 0,
    itemLevel = 56,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 53,
    max1 = 59,
    max2 = 65,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1005,60)->
    #equipAffixesCfg {
    iD = 486,
    affixID = 1005,
    name = "击中回血",
    affixLevel = 11,
    affixType = 2,
    conflict = 0,
    itemLevel = 60,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 65,
    max1 = 73,
    max2 = 80,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1005,64)->
    #equipAffixesCfg {
    iD = 487,
    affixID = 1005,
    name = "击中回血",
    affixLevel = 12,
    affixType = 2,
    conflict = 0,
    itemLevel = 64,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 80,
    max1 = 89,
    max2 = 99,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1005,68)->
    #equipAffixesCfg {
    iD = 488,
    affixID = 1005,
    name = "击中回血",
    affixLevel = 13,
    affixType = 2,
    conflict = 0,
    itemLevel = 68,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 99,
    max1 = 110,
    max2 = 122,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1005,72)->
    #equipAffixesCfg {
    iD = 489,
    affixID = 1005,
    name = "击中回血",
    affixLevel = 14,
    affixType = 2,
    conflict = 0,
    itemLevel = 72,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 122,
    max1 = 135,
    max2 = 149,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1005,76)->
    #equipAffixesCfg {
    iD = 490,
    affixID = 1005,
    name = "击中回血",
    affixLevel = 15,
    affixType = 2,
    conflict = 0,
    itemLevel = 76,
    equipType = [0,1,4,5],
    equipClass = [1,2,3,4,5],
    propType = 21,
    min = 149,
    max1 = 165,
    max2 = 183,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1006,1)->
    #equipAffixesCfg {
    iD = 491,
    affixID = 1006,
    name = "生命秒回",
    affixLevel = 1,
    affixType = 2,
    conflict = 0,
    itemLevel = 1,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 2,
    max1 = 2,
    max2 = 2,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1006,8)->
    #equipAffixesCfg {
    iD = 492,
    affixID = 1006,
    name = "生命秒回",
    affixLevel = 2,
    affixType = 2,
    conflict = 0,
    itemLevel = 8,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 3,
    max1 = 3,
    max2 = 3,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1006,16)->
    #equipAffixesCfg {
    iD = 493,
    affixID = 1006,
    name = "生命秒回",
    affixLevel = 3,
    affixType = 2,
    conflict = 0,
    itemLevel = 16,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 4,
    max1 = 5,
    max2 = 5,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1006,24)->
    #equipAffixesCfg {
    iD = 494,
    affixID = 1006,
    name = "生命秒回",
    affixLevel = 4,
    affixType = 2,
    conflict = 0,
    itemLevel = 24,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 6,
    max1 = 7,
    max2 = 8,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1006,32)->
    #equipAffixesCfg {
    iD = 495,
    affixID = 1006,
    name = "生命秒回",
    affixLevel = 5,
    affixType = 2,
    conflict = 0,
    itemLevel = 32,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 10,
    max1 = 11,
    max2 = 12,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1006,40)->
    #equipAffixesCfg {
    iD = 496,
    affixID = 1006,
    name = "生命秒回",
    affixLevel = 6,
    affixType = 2,
    conflict = 0,
    itemLevel = 40,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 15,
    max1 = 17,
    max2 = 19,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1006,44)->
    #equipAffixesCfg {
    iD = 497,
    affixID = 1006,
    name = "生命秒回",
    affixLevel = 7,
    affixType = 2,
    conflict = 0,
    itemLevel = 44,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 19,
    max1 = 21,
    max2 = 23,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1006,48)->
    #equipAffixesCfg {
    iD = 498,
    affixID = 1006,
    name = "生命秒回",
    affixLevel = 8,
    affixType = 2,
    conflict = 0,
    itemLevel = 48,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 23,
    max1 = 26,
    max2 = 29,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1006,52)->
    #equipAffixesCfg {
    iD = 499,
    affixID = 1006,
    name = "生命秒回",
    affixLevel = 9,
    affixType = 2,
    conflict = 0,
    itemLevel = 52,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 29,
    max1 = 32,
    max2 = 35,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1006,56)->
    #equipAffixesCfg {
    iD = 500,
    affixID = 1006,
    name = "生命秒回",
    affixLevel = 10,
    affixType = 2,
    conflict = 0,
    itemLevel = 56,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 35,
    max1 = 39,
    max2 = 43,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1006,60)->
    #equipAffixesCfg {
    iD = 501,
    affixID = 1006,
    name = "生命秒回",
    affixLevel = 11,
    affixType = 2,
    conflict = 0,
    itemLevel = 60,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 43,
    max1 = 48,
    max2 = 53,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1006,64)->
    #equipAffixesCfg {
    iD = 502,
    affixID = 1006,
    name = "生命秒回",
    affixLevel = 12,
    affixType = 2,
    conflict = 0,
    itemLevel = 64,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 53,
    max1 = 59,
    max2 = 66,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1006,68)->
    #equipAffixesCfg {
    iD = 503,
    affixID = 1006,
    name = "生命秒回",
    affixLevel = 13,
    affixType = 2,
    conflict = 0,
    itemLevel = 68,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 66,
    max1 = 73,
    max2 = 81,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1006,72)->
    #equipAffixesCfg {
    iD = 504,
    affixID = 1006,
    name = "生命秒回",
    affixLevel = 14,
    affixType = 2,
    conflict = 0,
    itemLevel = 72,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 81,
    max1 = 90,
    max2 = 99,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1006,76)->
    #equipAffixesCfg {
    iD = 505,
    affixID = 1006,
    name = "生命秒回",
    affixLevel = 15,
    affixType = 2,
    conflict = 0,
    itemLevel = 76,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 99,
    max1 = 110,
    max2 = 122,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1007,1)->
    #equipAffixesCfg {
    iD = 416,
    affixID = 1007,
    name = "物理伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 2,
    itemLevel = 1,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 2,
    max1 = 2,
    max2 = 3,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1007,8)->
    #equipAffixesCfg {
    iD = 417,
    affixID = 1007,
    name = "物理伤害",
    affixLevel = 2,
    affixType = 2,
    conflict = 2,
    itemLevel = 8,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 3,
    max1 = 4,
    max2 = 4,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1007,16)->
    #equipAffixesCfg {
    iD = 418,
    affixID = 1007,
    name = "物理伤害",
    affixLevel = 3,
    affixType = 2,
    conflict = 2,
    itemLevel = 16,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 5,
    max1 = 6,
    max2 = 6,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1007,24)->
    #equipAffixesCfg {
    iD = 419,
    affixID = 1007,
    name = "物理伤害",
    affixLevel = 4,
    affixType = 2,
    conflict = 2,
    itemLevel = 24,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 8,
    max1 = 9,
    max2 = 10,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1007,32)->
    #equipAffixesCfg {
    iD = 420,
    affixID = 1007,
    name = "物理伤害",
    affixLevel = 5,
    affixType = 2,
    conflict = 2,
    itemLevel = 32,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 12,
    max1 = 13,
    max2 = 15,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1007,40)->
    #equipAffixesCfg {
    iD = 421,
    affixID = 1007,
    name = "物理伤害",
    affixLevel = 6,
    affixType = 2,
    conflict = 2,
    itemLevel = 40,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 18,
    max1 = 20,
    max2 = 22,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1007,44)->
    #equipAffixesCfg {
    iD = 422,
    affixID = 1007,
    name = "物理伤害",
    affixLevel = 7,
    affixType = 2,
    conflict = 2,
    itemLevel = 44,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 22,
    max1 = 25,
    max2 = 28,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1007,48)->
    #equipAffixesCfg {
    iD = 423,
    affixID = 1007,
    name = "物理伤害",
    affixLevel = 8,
    affixType = 2,
    conflict = 2,
    itemLevel = 48,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 28,
    max1 = 31,
    max2 = 34,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1007,52)->
    #equipAffixesCfg {
    iD = 424,
    affixID = 1007,
    name = "物理伤害",
    affixLevel = 9,
    affixType = 2,
    conflict = 2,
    itemLevel = 52,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 34,
    max1 = 38,
    max2 = 42,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1007,56)->
    #equipAffixesCfg {
    iD = 425,
    affixID = 1007,
    name = "物理伤害",
    affixLevel = 10,
    affixType = 2,
    conflict = 2,
    itemLevel = 56,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 42,
    max1 = 47,
    max2 = 52,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1007,60)->
    #equipAffixesCfg {
    iD = 426,
    affixID = 1007,
    name = "物理伤害",
    affixLevel = 11,
    affixType = 2,
    conflict = 2,
    itemLevel = 60,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 52,
    max1 = 57,
    max2 = 63,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1007,64)->
    #equipAffixesCfg {
    iD = 427,
    affixID = 1007,
    name = "物理伤害",
    affixLevel = 12,
    affixType = 2,
    conflict = 2,
    itemLevel = 64,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 63,
    max1 = 70,
    max2 = 78,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1007,68)->
    #equipAffixesCfg {
    iD = 428,
    affixID = 1007,
    name = "物理伤害",
    affixLevel = 13,
    affixType = 2,
    conflict = 2,
    itemLevel = 68,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 78,
    max1 = 87,
    max2 = 96,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1007,72)->
    #equipAffixesCfg {
    iD = 429,
    affixID = 1007,
    name = "物理伤害",
    affixLevel = 14,
    affixType = 2,
    conflict = 2,
    itemLevel = 72,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 96,
    max1 = 106,
    max2 = 118,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1007,76)->
    #equipAffixesCfg {
    iD = 430,
    affixID = 1007,
    name = "物理伤害",
    affixLevel = 15,
    affixType = 2,
    conflict = 2,
    itemLevel = 76,
    equipType = [0,4,5],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 118,
    max1 = 131,
    max2 = 145,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1008,1)->
    #equipAffixesCfg {
    iD = 431,
    affixID = 1008,
    name = "神圣伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 2,
    itemLevel = 1,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 2,
    max1 = 2,
    max2 = 3,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1008,8)->
    #equipAffixesCfg {
    iD = 432,
    affixID = 1008,
    name = "神圣伤害",
    affixLevel = 2,
    affixType = 2,
    conflict = 2,
    itemLevel = 8,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 3,
    max1 = 4,
    max2 = 4,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1008,16)->
    #equipAffixesCfg {
    iD = 433,
    affixID = 1008,
    name = "神圣伤害",
    affixLevel = 3,
    affixType = 2,
    conflict = 2,
    itemLevel = 16,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 5,
    max1 = 6,
    max2 = 6,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1008,24)->
    #equipAffixesCfg {
    iD = 434,
    affixID = 1008,
    name = "神圣伤害",
    affixLevel = 4,
    affixType = 2,
    conflict = 2,
    itemLevel = 24,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 8,
    max1 = 9,
    max2 = 10,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1008,32)->
    #equipAffixesCfg {
    iD = 435,
    affixID = 1008,
    name = "神圣伤害",
    affixLevel = 5,
    affixType = 2,
    conflict = 2,
    itemLevel = 32,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 12,
    max1 = 13,
    max2 = 15,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1008,40)->
    #equipAffixesCfg {
    iD = 436,
    affixID = 1008,
    name = "神圣伤害",
    affixLevel = 6,
    affixType = 2,
    conflict = 2,
    itemLevel = 40,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 18,
    max1 = 20,
    max2 = 22,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1008,44)->
    #equipAffixesCfg {
    iD = 437,
    affixID = 1008,
    name = "神圣伤害",
    affixLevel = 7,
    affixType = 2,
    conflict = 2,
    itemLevel = 44,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 22,
    max1 = 25,
    max2 = 28,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1008,48)->
    #equipAffixesCfg {
    iD = 438,
    affixID = 1008,
    name = "神圣伤害",
    affixLevel = 8,
    affixType = 2,
    conflict = 2,
    itemLevel = 48,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 28,
    max1 = 31,
    max2 = 34,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1008,52)->
    #equipAffixesCfg {
    iD = 439,
    affixID = 1008,
    name = "神圣伤害",
    affixLevel = 9,
    affixType = 2,
    conflict = 2,
    itemLevel = 52,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 34,
    max1 = 38,
    max2 = 42,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1008,56)->
    #equipAffixesCfg {
    iD = 440,
    affixID = 1008,
    name = "神圣伤害",
    affixLevel = 10,
    affixType = 2,
    conflict = 2,
    itemLevel = 56,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 42,
    max1 = 47,
    max2 = 52,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1008,60)->
    #equipAffixesCfg {
    iD = 441,
    affixID = 1008,
    name = "神圣伤害",
    affixLevel = 11,
    affixType = 2,
    conflict = 2,
    itemLevel = 60,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 52,
    max1 = 57,
    max2 = 63,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1008,64)->
    #equipAffixesCfg {
    iD = 442,
    affixID = 1008,
    name = "神圣伤害",
    affixLevel = 12,
    affixType = 2,
    conflict = 2,
    itemLevel = 64,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 63,
    max1 = 70,
    max2 = 78,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1008,68)->
    #equipAffixesCfg {
    iD = 443,
    affixID = 1008,
    name = "神圣伤害",
    affixLevel = 13,
    affixType = 2,
    conflict = 2,
    itemLevel = 68,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 78,
    max1 = 87,
    max2 = 96,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1008,72)->
    #equipAffixesCfg {
    iD = 444,
    affixID = 1008,
    name = "神圣伤害",
    affixLevel = 14,
    affixType = 2,
    conflict = 2,
    itemLevel = 72,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 96,
    max1 = 106,
    max2 = 118,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1008,76)->
    #equipAffixesCfg {
    iD = 445,
    affixID = 1008,
    name = "神圣伤害",
    affixLevel = 15,
    affixType = 2,
    conflict = 2,
    itemLevel = 76,
    equipType = [0,4,5],
    equipClass = [1,2],
    propType = 30,
    min = 118,
    max1 = 131,
    max2 = 145,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1009,1)->
    #equipAffixesCfg {
    iD = 446,
    affixID = 1009,
    name = "暗影伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 2,
    itemLevel = 1,
    equipType = [0,4,5],
    equipClass = [2,3,4],
    propType = 32,
    min = 2,
    max1 = 2,
    max2 = 3,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1009,8)->
    #equipAffixesCfg {
    iD = 447,
    affixID = 1009,
    name = "暗影伤害",
    affixLevel = 2,
    affixType = 2,
    conflict = 2,
    itemLevel = 8,
    equipType = [0,4,5],
    equipClass = [2,3,4],
    propType = 32,
    min = 3,
    max1 = 4,
    max2 = 4,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1009,16)->
    #equipAffixesCfg {
    iD = 448,
    affixID = 1009,
    name = "暗影伤害",
    affixLevel = 3,
    affixType = 2,
    conflict = 2,
    itemLevel = 16,
    equipType = [0,4,5],
    equipClass = [2,3,4],
    propType = 32,
    min = 5,
    max1 = 6,
    max2 = 6,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1009,24)->
    #equipAffixesCfg {
    iD = 449,
    affixID = 1009,
    name = "暗影伤害",
    affixLevel = 4,
    affixType = 2,
    conflict = 2,
    itemLevel = 24,
    equipType = [0,4,5],
    equipClass = [2,3,4],
    propType = 32,
    min = 8,
    max1 = 9,
    max2 = 10,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1009,32)->
    #equipAffixesCfg {
    iD = 450,
    affixID = 1009,
    name = "暗影伤害",
    affixLevel = 5,
    affixType = 2,
    conflict = 2,
    itemLevel = 32,
    equipType = [0,4,5],
    equipClass = [2,3,4],
    propType = 32,
    min = 12,
    max1 = 13,
    max2 = 15,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1009,40)->
    #equipAffixesCfg {
    iD = 451,
    affixID = 1009,
    name = "暗影伤害",
    affixLevel = 6,
    affixType = 2,
    conflict = 2,
    itemLevel = 40,
    equipType = [0,4,5],
    equipClass = [2,3,4],
    propType = 32,
    min = 18,
    max1 = 20,
    max2 = 22,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1009,44)->
    #equipAffixesCfg {
    iD = 452,
    affixID = 1009,
    name = "暗影伤害",
    affixLevel = 7,
    affixType = 2,
    conflict = 2,
    itemLevel = 44,
    equipType = [0,4,5],
    equipClass = [2,3,4],
    propType = 32,
    min = 22,
    max1 = 25,
    max2 = 28,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1009,48)->
    #equipAffixesCfg {
    iD = 453,
    affixID = 1009,
    name = "暗影伤害",
    affixLevel = 8,
    affixType = 2,
    conflict = 2,
    itemLevel = 48,
    equipType = [0,4,5],
    equipClass = [2,3,4],
    propType = 32,
    min = 28,
    max1 = 31,
    max2 = 34,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1009,52)->
    #equipAffixesCfg {
    iD = 454,
    affixID = 1009,
    name = "暗影伤害",
    affixLevel = 9,
    affixType = 2,
    conflict = 2,
    itemLevel = 52,
    equipType = [0,4,5],
    equipClass = [2,3,4],
    propType = 32,
    min = 34,
    max1 = 38,
    max2 = 42,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1009,56)->
    #equipAffixesCfg {
    iD = 455,
    affixID = 1009,
    name = "暗影伤害",
    affixLevel = 10,
    affixType = 2,
    conflict = 2,
    itemLevel = 56,
    equipType = [0,4,5],
    equipClass = [2,3,4],
    propType = 32,
    min = 42,
    max1 = 47,
    max2 = 52,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1009,60)->
    #equipAffixesCfg {
    iD = 456,
    affixID = 1009,
    name = "暗影伤害",
    affixLevel = 11,
    affixType = 2,
    conflict = 2,
    itemLevel = 60,
    equipType = [0,4,5],
    equipClass = [2,3,4],
    propType = 32,
    min = 52,
    max1 = 57,
    max2 = 63,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1009,64)->
    #equipAffixesCfg {
    iD = 457,
    affixID = 1009,
    name = "暗影伤害",
    affixLevel = 12,
    affixType = 2,
    conflict = 2,
    itemLevel = 64,
    equipType = [0,4,5],
    equipClass = [2,3,4],
    propType = 32,
    min = 63,
    max1 = 70,
    max2 = 78,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1009,68)->
    #equipAffixesCfg {
    iD = 458,
    affixID = 1009,
    name = "暗影伤害",
    affixLevel = 13,
    affixType = 2,
    conflict = 2,
    itemLevel = 68,
    equipType = [0,4,5],
    equipClass = [2,3,4],
    propType = 32,
    min = 78,
    max1 = 87,
    max2 = 96,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1009,72)->
    #equipAffixesCfg {
    iD = 459,
    affixID = 1009,
    name = "暗影伤害",
    affixLevel = 14,
    affixType = 2,
    conflict = 2,
    itemLevel = 72,
    equipType = [0,4,5],
    equipClass = [2,3,4],
    propType = 32,
    min = 96,
    max1 = 106,
    max2 = 118,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1009,76)->
    #equipAffixesCfg {
    iD = 460,
    affixID = 1009,
    name = "暗影伤害",
    affixLevel = 15,
    affixType = 2,
    conflict = 2,
    itemLevel = 76,
    equipType = [0,4,5],
    equipClass = [2,3,4],
    propType = 32,
    min = 118,
    max1 = 131,
    max2 = 145,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1010,1)->
    #equipAffixesCfg {
    iD = 461,
    affixID = 1010,
    name = "元素伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 2,
    itemLevel = 1,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 2,
    max1 = 2,
    max2 = 3,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1010,8)->
    #equipAffixesCfg {
    iD = 462,
    affixID = 1010,
    name = "元素伤害",
    affixLevel = 2,
    affixType = 2,
    conflict = 2,
    itemLevel = 8,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 3,
    max1 = 4,
    max2 = 4,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1010,16)->
    #equipAffixesCfg {
    iD = 463,
    affixID = 1010,
    name = "元素伤害",
    affixLevel = 3,
    affixType = 2,
    conflict = 2,
    itemLevel = 16,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 5,
    max1 = 6,
    max2 = 6,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1010,24)->
    #equipAffixesCfg {
    iD = 464,
    affixID = 1010,
    name = "元素伤害",
    affixLevel = 4,
    affixType = 2,
    conflict = 2,
    itemLevel = 24,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 8,
    max1 = 9,
    max2 = 10,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1010,32)->
    #equipAffixesCfg {
    iD = 465,
    affixID = 1010,
    name = "元素伤害",
    affixLevel = 5,
    affixType = 2,
    conflict = 2,
    itemLevel = 32,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 12,
    max1 = 13,
    max2 = 15,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1010,40)->
    #equipAffixesCfg {
    iD = 466,
    affixID = 1010,
    name = "元素伤害",
    affixLevel = 6,
    affixType = 2,
    conflict = 2,
    itemLevel = 40,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 18,
    max1 = 20,
    max2 = 22,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1010,44)->
    #equipAffixesCfg {
    iD = 467,
    affixID = 1010,
    name = "元素伤害",
    affixLevel = 7,
    affixType = 2,
    conflict = 2,
    itemLevel = 44,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 22,
    max1 = 25,
    max2 = 28,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1010,48)->
    #equipAffixesCfg {
    iD = 468,
    affixID = 1010,
    name = "元素伤害",
    affixLevel = 8,
    affixType = 2,
    conflict = 2,
    itemLevel = 48,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 28,
    max1 = 31,
    max2 = 34,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1010,52)->
    #equipAffixesCfg {
    iD = 469,
    affixID = 1010,
    name = "元素伤害",
    affixLevel = 9,
    affixType = 2,
    conflict = 2,
    itemLevel = 52,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 34,
    max1 = 38,
    max2 = 42,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1010,56)->
    #equipAffixesCfg {
    iD = 470,
    affixID = 1010,
    name = "元素伤害",
    affixLevel = 10,
    affixType = 2,
    conflict = 2,
    itemLevel = 56,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 42,
    max1 = 47,
    max2 = 52,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1010,60)->
    #equipAffixesCfg {
    iD = 471,
    affixID = 1010,
    name = "元素伤害",
    affixLevel = 11,
    affixType = 2,
    conflict = 2,
    itemLevel = 60,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 52,
    max1 = 57,
    max2 = 63,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1010,64)->
    #equipAffixesCfg {
    iD = 472,
    affixID = 1010,
    name = "元素伤害",
    affixLevel = 12,
    affixType = 2,
    conflict = 2,
    itemLevel = 64,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 63,
    max1 = 70,
    max2 = 78,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1010,68)->
    #equipAffixesCfg {
    iD = 473,
    affixID = 1010,
    name = "元素伤害",
    affixLevel = 13,
    affixType = 2,
    conflict = 2,
    itemLevel = 68,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 78,
    max1 = 87,
    max2 = 96,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1010,72)->
    #equipAffixesCfg {
    iD = 474,
    affixID = 1010,
    name = "元素伤害",
    affixLevel = 14,
    affixType = 2,
    conflict = 2,
    itemLevel = 72,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 96,
    max1 = 106,
    max2 = 118,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1010,76)->
    #equipAffixesCfg {
    iD = 475,
    affixID = 1010,
    name = "元素伤害",
    affixLevel = 15,
    affixType = 2,
    conflict = 2,
    itemLevel = 76,
    equipType = [0,4,5],
    equipClass = [2,3],
    propType = 33,
    min = 118,
    max1 = 131,
    max2 = 145,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1011,1)->
    #equipAffixesCfg {
    iD = 566,
    affixID = 1011,
    name = "攻击速度",
    affixLevel = 1,
    affixType = 2,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.02,
    max1 = 0.03,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1011,8)->
    #equipAffixesCfg {
    iD = 567,
    affixID = 1011,
    name = "攻击速度",
    affixLevel = 2,
    affixType = 2,
    conflict = 0,
    itemLevel = 8,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.02,
    max1 = 0.03,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1011,16)->
    #equipAffixesCfg {
    iD = 568,
    affixID = 1011,
    name = "攻击速度",
    affixLevel = 3,
    affixType = 2,
    conflict = 0,
    itemLevel = 16,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.02,
    max1 = 0.03,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1011,24)->
    #equipAffixesCfg {
    iD = 569,
    affixID = 1011,
    name = "攻击速度",
    affixLevel = 4,
    affixType = 2,
    conflict = 0,
    itemLevel = 24,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.025,
    max1 = 0.035,
    max2 = 0.045,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1011,32)->
    #equipAffixesCfg {
    iD = 570,
    affixID = 1011,
    name = "攻击速度",
    affixLevel = 5,
    affixType = 2,
    conflict = 0,
    itemLevel = 32,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.035,
    max1 = 0.045,
    max2 = 0.055,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1011,40)->
    #equipAffixesCfg {
    iD = 571,
    affixID = 1011,
    name = "攻击速度",
    affixLevel = 6,
    affixType = 2,
    conflict = 0,
    itemLevel = 40,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.045,
    max1 = 0.055,
    max2 = 0.065,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1011,44)->
    #equipAffixesCfg {
    iD = 572,
    affixID = 1011,
    name = "攻击速度",
    affixLevel = 7,
    affixType = 2,
    conflict = 0,
    itemLevel = 44,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.05,
    max1 = 0.06,
    max2 = 0.07,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1011,48)->
    #equipAffixesCfg {
    iD = 573,
    affixID = 1011,
    name = "攻击速度",
    affixLevel = 8,
    affixType = 2,
    conflict = 0,
    itemLevel = 48,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.055,
    max1 = 0.065,
    max2 = 0.075,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1011,52)->
    #equipAffixesCfg {
    iD = 574,
    affixID = 1011,
    name = "攻击速度",
    affixLevel = 9,
    affixType = 2,
    conflict = 0,
    itemLevel = 52,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.06,
    max1 = 0.07,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1011,56)->
    #equipAffixesCfg {
    iD = 575,
    affixID = 1011,
    name = "攻击速度",
    affixLevel = 10,
    affixType = 2,
    conflict = 0,
    itemLevel = 56,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.065,
    max1 = 0.075,
    max2 = 0.085,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1011,60)->
    #equipAffixesCfg {
    iD = 576,
    affixID = 1011,
    name = "攻击速度",
    affixLevel = 11,
    affixType = 2,
    conflict = 0,
    itemLevel = 60,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.07,
    max1 = 0.08,
    max2 = 0.09,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1011,64)->
    #equipAffixesCfg {
    iD = 577,
    affixID = 1011,
    name = "攻击速度",
    affixLevel = 12,
    affixType = 2,
    conflict = 0,
    itemLevel = 64,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.075,
    max1 = 0.085,
    max2 = 0.095,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1011,68)->
    #equipAffixesCfg {
    iD = 578,
    affixID = 1011,
    name = "攻击速度",
    affixLevel = 13,
    affixType = 2,
    conflict = 0,
    itemLevel = 68,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.08,
    max1 = 0.09,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1011,72)->
    #equipAffixesCfg {
    iD = 579,
    affixID = 1011,
    name = "攻击速度",
    affixLevel = 14,
    affixType = 2,
    conflict = 0,
    itemLevel = 72,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.085,
    max1 = 0.095,
    max2 = 0.105,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1011,76)->
    #equipAffixesCfg {
    iD = 580,
    affixID = 1011,
    name = "攻击速度",
    affixLevel = 15,
    affixType = 2,
    conflict = 0,
    itemLevel = 76,
    equipType = [0,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.09,
    max1 = 0.1,
    max2 = 0.11,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1012,1)->
    #equipAffixesCfg {
    iD = 506,
    affixID = 1012,
    name = "全防御",
    affixLevel = 1,
    affixType = 2,
    conflict = 0,
    itemLevel = 1,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 22,
    max1 = 24,
    max2 = 27,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1012,8)->
    #equipAffixesCfg {
    iD = 507,
    affixID = 1012,
    name = "全防御",
    affixLevel = 2,
    affixType = 2,
    conflict = 0,
    itemLevel = 8,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 32,
    max1 = 35,
    max2 = 39,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1012,16)->
    #equipAffixesCfg {
    iD = 508,
    affixID = 1012,
    name = "全防御",
    affixLevel = 3,
    affixType = 2,
    conflict = 0,
    itemLevel = 16,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 48,
    max1 = 53,
    max2 = 59,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1012,24)->
    #equipAffixesCfg {
    iD = 509,
    affixID = 1012,
    name = "全防御",
    affixLevel = 4,
    affixType = 2,
    conflict = 0,
    itemLevel = 24,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 73,
    max1 = 80,
    max2 = 89,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1012,32)->
    #equipAffixesCfg {
    iD = 510,
    affixID = 1012,
    name = "全防御",
    affixLevel = 5,
    affixType = 2,
    conflict = 0,
    itemLevel = 32,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 110,
    max1 = 122,
    max2 = 135,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1012,40)->
    #equipAffixesCfg {
    iD = 511,
    affixID = 1012,
    name = "全防御",
    affixLevel = 6,
    affixType = 2,
    conflict = 0,
    itemLevel = 40,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 166,
    max1 = 183,
    max2 = 203,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1012,44)->
    #equipAffixesCfg {
    iD = 512,
    affixID = 1012,
    name = "全防御",
    affixLevel = 7,
    affixType = 2,
    conflict = 0,
    itemLevel = 44,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 203,
    max1 = 225,
    max2 = 250,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1012,48)->
    #equipAffixesCfg {
    iD = 513,
    affixID = 1012,
    name = "全防御",
    affixLevel = 8,
    affixType = 2,
    conflict = 0,
    itemLevel = 48,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 250,
    max1 = 277,
    max2 = 307,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1012,52)->
    #equipAffixesCfg {
    iD = 514,
    affixID = 1012,
    name = "全防御",
    affixLevel = 9,
    affixType = 2,
    conflict = 0,
    itemLevel = 52,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 307,
    max1 = 340,
    max2 = 377,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1012,56)->
    #equipAffixesCfg {
    iD = 515,
    affixID = 1012,
    name = "全防御",
    affixLevel = 10,
    affixType = 2,
    conflict = 0,
    itemLevel = 56,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 377,
    max1 = 417,
    max2 = 463,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1012,60)->
    #equipAffixesCfg {
    iD = 516,
    affixID = 1012,
    name = "全防御",
    affixLevel = 11,
    affixType = 2,
    conflict = 0,
    itemLevel = 60,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 463,
    max1 = 513,
    max2 = 568,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1012,64)->
    #equipAffixesCfg {
    iD = 517,
    affixID = 1012,
    name = "全防御",
    affixLevel = 12,
    affixType = 2,
    conflict = 0,
    itemLevel = 64,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 568,
    max1 = 629,
    max2 = 697,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1012,68)->
    #equipAffixesCfg {
    iD = 518,
    affixID = 1012,
    name = "全防御",
    affixLevel = 13,
    affixType = 2,
    conflict = 0,
    itemLevel = 68,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 697,
    max1 = 773,
    max2 = 856,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1012,72)->
    #equipAffixesCfg {
    iD = 519,
    affixID = 1012,
    name = "全防御",
    affixLevel = 14,
    affixType = 2,
    conflict = 0,
    itemLevel = 72,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 856,
    max1 = 949,
    max2 = 1052,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1012,76)->
    #equipAffixesCfg {
    iD = 520,
    affixID = 1012,
    name = "全防御",
    affixLevel = 15,
    affixType = 2,
    conflict = 0,
    itemLevel = 76,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 1052,
    max1 = 1165,
    max2 = 1291,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1015,1)->
    #equipAffixesCfg {
    iD = 521,
    affixID = 1015,
    name = "生命上限",
    affixLevel = 1,
    affixType = 2,
    conflict = 4,
    itemLevel = 1,
    equipType = [2,3,7],
    equipClass = [0],
    propType = 18,
    min = 0.1,
    max1 = 0.110803324099723,
    max2 = 0.122773766315483,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(1015,4)->
    #equipAffixesCfg {
    iD = 522,
    affixID = 1015,
    name = "生命上限",
    affixLevel = 2,
    affixType = 2,
    conflict = 4,
    itemLevel = 4,
    equipType = [2,3,7],
    equipClass = [0],
    propType = 18,
    min = 0.1,
    max1 = 0.110803324099723,
    max2 = 0.122773766315483,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(1015,8)->
    #equipAffixesCfg {
    iD = 523,
    affixID = 1015,
    name = "生命上限",
    affixLevel = 3,
    affixType = 2,
    conflict = 4,
    itemLevel = 8,
    equipType = [2,3,7],
    equipClass = [0],
    propType = 18,
    min = 0.1,
    max1 = 0.110803324099723,
    max2 = 0.122773766315483,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(1015,16)->
    #equipAffixesCfg {
    iD = 524,
    affixID = 1015,
    name = "生命上限",
    affixLevel = 4,
    affixType = 2,
    conflict = 4,
    itemLevel = 16,
    equipType = [2,3,7],
    equipClass = [0],
    propType = 18,
    min = 0.1,
    max1 = 0.110803324099723,
    max2 = 0.122773766315483,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(1015,24)->
    #equipAffixesCfg {
    iD = 525,
    affixID = 1015,
    name = "生命上限",
    affixLevel = 5,
    affixType = 2,
    conflict = 4,
    itemLevel = 24,
    equipType = [2,3,7],
    equipClass = [0],
    propType = 18,
    min = 0.1,
    max1 = 0.110803324099723,
    max2 = 0.122773766315483,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(1015,32)->
    #equipAffixesCfg {
    iD = 526,
    affixID = 1015,
    name = "生命上限",
    affixLevel = 6,
    affixType = 2,
    conflict = 4,
    itemLevel = 32,
    equipType = [2,3,7],
    equipClass = [0],
    propType = 18,
    min = 0.1,
    max1 = 0.110803324099723,
    max2 = 0.122773766315483,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(1015,40)->
    #equipAffixesCfg {
    iD = 527,
    affixID = 1015,
    name = "生命上限",
    affixLevel = 7,
    affixType = 2,
    conflict = 4,
    itemLevel = 40,
    equipType = [2,3,7],
    equipClass = [0],
    propType = 18,
    min = 0.1,
    max1 = 0.110803324099723,
    max2 = 0.122773766315483,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(1015,48)->
    #equipAffixesCfg {
    iD = 528,
    affixID = 1015,
    name = "生命上限",
    affixLevel = 8,
    affixType = 2,
    conflict = 4,
    itemLevel = 48,
    equipType = [2,3,7],
    equipClass = [0],
    propType = 18,
    min = 0.1,
    max1 = 0.110803324099723,
    max2 = 0.122773766315483,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(1015,56)->
    #equipAffixesCfg {
    iD = 529,
    affixID = 1015,
    name = "生命上限",
    affixLevel = 9,
    affixType = 2,
    conflict = 4,
    itemLevel = 56,
    equipType = [2,3,7],
    equipClass = [0],
    propType = 18,
    min = 0.1,
    max1 = 0.110803324099723,
    max2 = 0.122773766315483,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(1015,60)->
    #equipAffixesCfg {
    iD = 530,
    affixID = 1015,
    name = "生命上限",
    affixLevel = 10,
    affixType = 2,
    conflict = 4,
    itemLevel = 60,
    equipType = [2,3,7],
    equipClass = [0],
    propType = 18,
    min = 0.1,
    max1 = 0.110803324099723,
    max2 = 0.122773766315483,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(1016,1)->
    #equipAffixesCfg {
    iD = 531,
    affixID = 1016,
    name = "暴击率",
    affixLevel = 1,
    affixType = 2,
    conflict = 5,
    itemLevel = 1,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.02,
    max1 = 0.03,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1016,8)->
    #equipAffixesCfg {
    iD = 532,
    affixID = 1016,
    name = "暴击率",
    affixLevel = 2,
    affixType = 2,
    conflict = 5,
    itemLevel = 8,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.02,
    max1 = 0.03,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1016,16)->
    #equipAffixesCfg {
    iD = 533,
    affixID = 1016,
    name = "暴击率",
    affixLevel = 3,
    affixType = 2,
    conflict = 5,
    itemLevel = 16,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.02,
    max1 = 0.03,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1016,24)->
    #equipAffixesCfg {
    iD = 534,
    affixID = 1016,
    name = "暴击率",
    affixLevel = 4,
    affixType = 2,
    conflict = 5,
    itemLevel = 24,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.025,
    max1 = 0.035,
    max2 = 0.045,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1016,32)->
    #equipAffixesCfg {
    iD = 535,
    affixID = 1016,
    name = "暴击率",
    affixLevel = 5,
    affixType = 2,
    conflict = 5,
    itemLevel = 32,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.035,
    max1 = 0.045,
    max2 = 0.055,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1016,40)->
    #equipAffixesCfg {
    iD = 536,
    affixID = 1016,
    name = "暴击率",
    affixLevel = 6,
    affixType = 2,
    conflict = 5,
    itemLevel = 40,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.045,
    max1 = 0.055,
    max2 = 0.065,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1016,44)->
    #equipAffixesCfg {
    iD = 537,
    affixID = 1016,
    name = "暴击率",
    affixLevel = 7,
    affixType = 2,
    conflict = 5,
    itemLevel = 44,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.05,
    max1 = 0.06,
    max2 = 0.07,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1016,48)->
    #equipAffixesCfg {
    iD = 538,
    affixID = 1016,
    name = "暴击率",
    affixLevel = 8,
    affixType = 2,
    conflict = 5,
    itemLevel = 48,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.055,
    max1 = 0.065,
    max2 = 0.075,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1016,52)->
    #equipAffixesCfg {
    iD = 539,
    affixID = 1016,
    name = "暴击率",
    affixLevel = 9,
    affixType = 2,
    conflict = 5,
    itemLevel = 52,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.06,
    max1 = 0.07,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1016,56)->
    #equipAffixesCfg {
    iD = 540,
    affixID = 1016,
    name = "暴击率",
    affixLevel = 10,
    affixType = 2,
    conflict = 5,
    itemLevel = 56,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.065,
    max1 = 0.075,
    max2 = 0.085,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1016,60)->
    #equipAffixesCfg {
    iD = 541,
    affixID = 1016,
    name = "暴击率",
    affixLevel = 11,
    affixType = 2,
    conflict = 5,
    itemLevel = 60,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.07,
    max1 = 0.08,
    max2 = 0.09,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1016,64)->
    #equipAffixesCfg {
    iD = 542,
    affixID = 1016,
    name = "暴击率",
    affixLevel = 12,
    affixType = 2,
    conflict = 5,
    itemLevel = 64,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.075,
    max1 = 0.085,
    max2 = 0.095,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1016,68)->
    #equipAffixesCfg {
    iD = 543,
    affixID = 1016,
    name = "暴击率",
    affixLevel = 13,
    affixType = 2,
    conflict = 5,
    itemLevel = 68,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.08,
    max1 = 0.09,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1016,72)->
    #equipAffixesCfg {
    iD = 544,
    affixID = 1016,
    name = "暴击率",
    affixLevel = 14,
    affixType = 2,
    conflict = 5,
    itemLevel = 72,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.085,
    max1 = 0.095,
    max2 = 0.105,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1016,76)->
    #equipAffixesCfg {
    iD = 545,
    affixID = 1016,
    name = "暴击率",
    affixLevel = 15,
    affixType = 2,
    conflict = 5,
    itemLevel = 76,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.09,
    max1 = 0.1,
    max2 = 0.11,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1017,1)->
    #equipAffixesCfg {
    iD = 546,
    affixID = 1017,
    name = "暴击率短刺",
    affixLevel = 1,
    affixType = 2,
    conflict = 5,
    itemLevel = 1,
    equipType = [1],
    equipClass = [3,5],
    propType = 35,
    min = 0.01,
    max1 = 0.0110803324099723,
    max2 = 0.0122773766315483,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1017,4)->
    #equipAffixesCfg {
    iD = 547,
    affixID = 1017,
    name = "暴击率短刺",
    affixLevel = 2,
    affixType = 2,
    conflict = 5,
    itemLevel = 4,
    equipType = [1],
    equipClass = [3,5],
    propType = 35,
    min = 0.01,
    max1 = 0.0110803324099723,
    max2 = 0.0122773766315483,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1017,8)->
    #equipAffixesCfg {
    iD = 548,
    affixID = 1017,
    name = "暴击率短刺",
    affixLevel = 3,
    affixType = 2,
    conflict = 5,
    itemLevel = 8,
    equipType = [1],
    equipClass = [3,5],
    propType = 35,
    min = 0.01,
    max1 = 0.0110803324099723,
    max2 = 0.0122773766315483,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1017,16)->
    #equipAffixesCfg {
    iD = 549,
    affixID = 1017,
    name = "暴击率短刺",
    affixLevel = 4,
    affixType = 2,
    conflict = 5,
    itemLevel = 16,
    equipType = [1],
    equipClass = [3,5],
    propType = 35,
    min = 0.01,
    max1 = 0.0110803324099723,
    max2 = 0.0122773766315483,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1017,24)->
    #equipAffixesCfg {
    iD = 550,
    affixID = 1017,
    name = "暴击率短刺",
    affixLevel = 5,
    affixType = 2,
    conflict = 5,
    itemLevel = 24,
    equipType = [1],
    equipClass = [3,5],
    propType = 35,
    min = 0.015,
    max1 = 0.0166204986149584,
    max2 = 0.0184160649473224,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1017,32)->
    #equipAffixesCfg {
    iD = 551,
    affixID = 1017,
    name = "暴击率短刺",
    affixLevel = 6,
    affixType = 2,
    conflict = 5,
    itemLevel = 32,
    equipType = [1],
    equipClass = [3,5],
    propType = 35,
    min = 0.025,
    max1 = 0.0277008310249307,
    max2 = 0.0306934415788706,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1017,40)->
    #equipAffixesCfg {
    iD = 552,
    affixID = 1017,
    name = "暴击率短刺",
    affixLevel = 7,
    affixType = 2,
    conflict = 5,
    itemLevel = 40,
    equipType = [1],
    equipClass = [3,5],
    propType = 35,
    min = 0.035,
    max1 = 0.038781163434903,
    max2 = 0.0429708182104189,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1017,48)->
    #equipAffixesCfg {
    iD = 553,
    affixID = 1017,
    name = "暴击率短刺",
    affixLevel = 8,
    affixType = 2,
    conflict = 5,
    itemLevel = 48,
    equipType = [1],
    equipClass = [3,5],
    propType = 35,
    min = 0.045,
    max1 = 0.0498614958448753,
    max2 = 0.0552481948419671,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1017,56)->
    #equipAffixesCfg {
    iD = 554,
    affixID = 1017,
    name = "暴击率短刺",
    affixLevel = 9,
    affixType = 2,
    conflict = 5,
    itemLevel = 56,
    equipType = [1],
    equipClass = [3,5],
    propType = 35,
    min = 0.055,
    max1 = 0.0609418282548476,
    max2 = 0.0675255714735154,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1017,60)->
    #equipAffixesCfg {
    iD = 555,
    affixID = 1017,
    name = "暴击率短刺",
    affixLevel = 10,
    affixType = 2,
    conflict = 5,
    itemLevel = 60,
    equipType = [1],
    equipClass = [3,5],
    propType = 35,
    min = 0.06,
    max1 = 0.0664819944598338,
    max2 = 0.0736642597892895,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1018,1)->
    #equipAffixesCfg {
    iD = 556,
    affixID = 1018,
    name = "暴击伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1],
    equipClass = [0],
    propType = 36,
    min = 0.35,
    max1 = 0.38781163434903,
    max2 = 0.429708182104189,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1018,4)->
    #equipAffixesCfg {
    iD = 557,
    affixID = 1018,
    name = "暴击伤害",
    affixLevel = 2,
    affixType = 2,
    conflict = 0,
    itemLevel = 4,
    equipType = [0,1],
    equipClass = [0],
    propType = 36,
    min = 0.35,
    max1 = 0.38781163434903,
    max2 = 0.429708182104189,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1018,8)->
    #equipAffixesCfg {
    iD = 558,
    affixID = 1018,
    name = "暴击伤害",
    affixLevel = 3,
    affixType = 2,
    conflict = 0,
    itemLevel = 8,
    equipType = [0,1],
    equipClass = [0],
    propType = 36,
    min = 0.35,
    max1 = 0.38781163434903,
    max2 = 0.429708182104189,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1018,16)->
    #equipAffixesCfg {
    iD = 559,
    affixID = 1018,
    name = "暴击伤害",
    affixLevel = 4,
    affixType = 2,
    conflict = 0,
    itemLevel = 16,
    equipType = [0,1],
    equipClass = [0],
    propType = 36,
    min = 0.35,
    max1 = 0.38781163434903,
    max2 = 0.429708182104189,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1018,24)->
    #equipAffixesCfg {
    iD = 560,
    affixID = 1018,
    name = "暴击伤害",
    affixLevel = 5,
    affixType = 2,
    conflict = 0,
    itemLevel = 24,
    equipType = [0,1],
    equipClass = [0],
    propType = 36,
    min = 0.35,
    max1 = 0.38781163434903,
    max2 = 0.429708182104189,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1018,32)->
    #equipAffixesCfg {
    iD = 561,
    affixID = 1018,
    name = "暴击伤害",
    affixLevel = 6,
    affixType = 2,
    conflict = 0,
    itemLevel = 32,
    equipType = [0,1],
    equipClass = [0],
    propType = 36,
    min = 0.35,
    max1 = 0.38781163434903,
    max2 = 0.429708182104189,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1018,40)->
    #equipAffixesCfg {
    iD = 562,
    affixID = 1018,
    name = "暴击伤害",
    affixLevel = 7,
    affixType = 2,
    conflict = 0,
    itemLevel = 40,
    equipType = [0,1],
    equipClass = [0],
    propType = 36,
    min = 0.35,
    max1 = 0.38781163434903,
    max2 = 0.429708182104189,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1018,48)->
    #equipAffixesCfg {
    iD = 563,
    affixID = 1018,
    name = "暴击伤害",
    affixLevel = 8,
    affixType = 2,
    conflict = 0,
    itemLevel = 48,
    equipType = [0,1],
    equipClass = [0],
    propType = 36,
    min = 0.35,
    max1 = 0.38781163434903,
    max2 = 0.429708182104189,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1018,56)->
    #equipAffixesCfg {
    iD = 564,
    affixID = 1018,
    name = "暴击伤害",
    affixLevel = 9,
    affixType = 2,
    conflict = 0,
    itemLevel = 56,
    equipType = [0,1],
    equipClass = [0],
    propType = 36,
    min = 0.35,
    max1 = 0.38781163434903,
    max2 = 0.429708182104189,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1018,60)->
    #equipAffixesCfg {
    iD = 565,
    affixID = 1018,
    name = "暴击伤害",
    affixLevel = 10,
    affixType = 2,
    conflict = 0,
    itemLevel = 60,
    equipType = [0,1],
    equipClass = [0],
    propType = 36,
    min = 0.35,
    max1 = 0.38781163434903,
    max2 = 0.429708182104189,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1020,1)->
    #equipAffixesCfg {
    iD = 581,
    affixID = 1020,
    name = "节约能量",
    affixLevel = 1,
    affixType = 2,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.02,
    max1 = 0.03,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1020,8)->
    #equipAffixesCfg {
    iD = 582,
    affixID = 1020,
    name = "节约能量",
    affixLevel = 2,
    affixType = 2,
    conflict = 0,
    itemLevel = 8,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.02,
    max1 = 0.03,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1020,16)->
    #equipAffixesCfg {
    iD = 583,
    affixID = 1020,
    name = "节约能量",
    affixLevel = 3,
    affixType = 2,
    conflict = 0,
    itemLevel = 16,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.025,
    max1 = 0.035,
    max2 = 0.045,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1020,24)->
    #equipAffixesCfg {
    iD = 584,
    affixID = 1020,
    name = "节约能量",
    affixLevel = 4,
    affixType = 2,
    conflict = 0,
    itemLevel = 24,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.035,
    max1 = 0.045,
    max2 = 0.055,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1020,32)->
    #equipAffixesCfg {
    iD = 585,
    affixID = 1020,
    name = "节约能量",
    affixLevel = 5,
    affixType = 2,
    conflict = 0,
    itemLevel = 32,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.045,
    max1 = 0.055,
    max2 = 0.065,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1020,40)->
    #equipAffixesCfg {
    iD = 586,
    affixID = 1020,
    name = "节约能量",
    affixLevel = 6,
    affixType = 2,
    conflict = 0,
    itemLevel = 40,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.055,
    max1 = 0.065,
    max2 = 0.075,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1020,44)->
    #equipAffixesCfg {
    iD = 587,
    affixID = 1020,
    name = "节约能量",
    affixLevel = 7,
    affixType = 2,
    conflict = 0,
    itemLevel = 44,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.06,
    max1 = 0.07,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1020,48)->
    #equipAffixesCfg {
    iD = 588,
    affixID = 1020,
    name = "节约能量",
    affixLevel = 8,
    affixType = 2,
    conflict = 0,
    itemLevel = 48,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.065,
    max1 = 0.075,
    max2 = 0.085,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1020,52)->
    #equipAffixesCfg {
    iD = 589,
    affixID = 1020,
    name = "节约能量",
    affixLevel = 9,
    affixType = 2,
    conflict = 0,
    itemLevel = 52,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.07,
    max1 = 0.08,
    max2 = 0.09,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1020,56)->
    #equipAffixesCfg {
    iD = 590,
    affixID = 1020,
    name = "节约能量",
    affixLevel = 10,
    affixType = 2,
    conflict = 0,
    itemLevel = 56,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.075,
    max1 = 0.085,
    max2 = 0.095,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1020,60)->
    #equipAffixesCfg {
    iD = 591,
    affixID = 1020,
    name = "节约能量",
    affixLevel = 11,
    affixType = 2,
    conflict = 0,
    itemLevel = 60,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.08,
    max1 = 0.09,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1020,64)->
    #equipAffixesCfg {
    iD = 592,
    affixID = 1020,
    name = "节约能量",
    affixLevel = 12,
    affixType = 2,
    conflict = 0,
    itemLevel = 64,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.085,
    max1 = 0.095,
    max2 = 0.105,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1020,68)->
    #equipAffixesCfg {
    iD = 593,
    affixID = 1020,
    name = "节约能量",
    affixLevel = 13,
    affixType = 2,
    conflict = 0,
    itemLevel = 68,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.09,
    max1 = 0.1,
    max2 = 0.11,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1020,72)->
    #equipAffixesCfg {
    iD = 594,
    affixID = 1020,
    name = "节约能量",
    affixLevel = 14,
    affixType = 2,
    conflict = 0,
    itemLevel = 72,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.095,
    max1 = 0.105,
    max2 = 0.115,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1020,76)->
    #equipAffixesCfg {
    iD = 595,
    affixID = 1020,
    name = "节约能量",
    affixLevel = 15,
    affixType = 2,
    conflict = 0,
    itemLevel = 76,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.1,
    max1 = 0.11,
    max2 = 0.12,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1021,1)->
    #equipAffixesCfg {
    iD = 596,
    affixID = 1021,
    name = "冷却速度",
    affixLevel = 1,
    affixType = 2,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.02,
    max1 = 0.03,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1021,8)->
    #equipAffixesCfg {
    iD = 597,
    affixID = 1021,
    name = "冷却速度",
    affixLevel = 2,
    affixType = 2,
    conflict = 0,
    itemLevel = 8,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.02,
    max1 = 0.03,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1021,16)->
    #equipAffixesCfg {
    iD = 598,
    affixID = 1021,
    name = "冷却速度",
    affixLevel = 3,
    affixType = 2,
    conflict = 0,
    itemLevel = 16,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.025,
    max1 = 0.035,
    max2 = 0.045,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1021,24)->
    #equipAffixesCfg {
    iD = 599,
    affixID = 1021,
    name = "冷却速度",
    affixLevel = 4,
    affixType = 2,
    conflict = 0,
    itemLevel = 24,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.035,
    max1 = 0.045,
    max2 = 0.055,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1021,32)->
    #equipAffixesCfg {
    iD = 600,
    affixID = 1021,
    name = "冷却速度",
    affixLevel = 5,
    affixType = 2,
    conflict = 0,
    itemLevel = 32,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.045,
    max1 = 0.055,
    max2 = 0.065,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1021,40)->
    #equipAffixesCfg {
    iD = 601,
    affixID = 1021,
    name = "冷却速度",
    affixLevel = 6,
    affixType = 2,
    conflict = 0,
    itemLevel = 40,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.055,
    max1 = 0.065,
    max2 = 0.075,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1021,44)->
    #equipAffixesCfg {
    iD = 602,
    affixID = 1021,
    name = "冷却速度",
    affixLevel = 7,
    affixType = 2,
    conflict = 0,
    itemLevel = 44,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.06,
    max1 = 0.07,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1021,48)->
    #equipAffixesCfg {
    iD = 603,
    affixID = 1021,
    name = "冷却速度",
    affixLevel = 8,
    affixType = 2,
    conflict = 0,
    itemLevel = 48,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.065,
    max1 = 0.075,
    max2 = 0.085,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1021,52)->
    #equipAffixesCfg {
    iD = 604,
    affixID = 1021,
    name = "冷却速度",
    affixLevel = 9,
    affixType = 2,
    conflict = 0,
    itemLevel = 52,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.07,
    max1 = 0.08,
    max2 = 0.09,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1021,56)->
    #equipAffixesCfg {
    iD = 605,
    affixID = 1021,
    name = "冷却速度",
    affixLevel = 10,
    affixType = 2,
    conflict = 0,
    itemLevel = 56,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.075,
    max1 = 0.085,
    max2 = 0.095,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1021,60)->
    #equipAffixesCfg {
    iD = 606,
    affixID = 1021,
    name = "冷却速度",
    affixLevel = 11,
    affixType = 2,
    conflict = 0,
    itemLevel = 60,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.08,
    max1 = 0.09,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1021,64)->
    #equipAffixesCfg {
    iD = 607,
    affixID = 1021,
    name = "冷却速度",
    affixLevel = 12,
    affixType = 2,
    conflict = 0,
    itemLevel = 64,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.085,
    max1 = 0.095,
    max2 = 0.105,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1021,68)->
    #equipAffixesCfg {
    iD = 608,
    affixID = 1021,
    name = "冷却速度",
    affixLevel = 13,
    affixType = 2,
    conflict = 0,
    itemLevel = 68,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.09,
    max1 = 0.1,
    max2 = 0.11,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1021,72)->
    #equipAffixesCfg {
    iD = 609,
    affixID = 1021,
    name = "冷却速度",
    affixLevel = 14,
    affixType = 2,
    conflict = 0,
    itemLevel = 72,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.095,
    max1 = 0.105,
    max2 = 0.115,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1021,76)->
    #equipAffixesCfg {
    iD = 610,
    affixID = 1021,
    name = "冷却速度",
    affixLevel = 15,
    affixType = 2,
    conflict = 0,
    itemLevel = 76,
    equipType = [0,1,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.1,
    max1 = 0.11,
    max2 = 0.12,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1022,1)->
    #equipAffixesCfg {
    iD = 611,
    affixID = 1022,
    name = "圣力恢复",
    affixLevel = 1,
    affixType = 3,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1],
    equipClass = [1],
    propType = 11,
    min = 1.6,
    max1 = 1.8,
    max2 = 2,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1023,1)->
    #equipAffixesCfg {
    iD = 612,
    affixID = 1023,
    name = "秘法恢复",
    affixLevel = 1,
    affixType = 3,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1],
    equipClass = [2],
    propType = 13,
    min = 10,
    max1 = 10,
    max2 = 10,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1024,1)->
    #equipAffixesCfg {
    iD = 613,
    affixID = 1024,
    name = "影力恢复",
    affixLevel = 1,
    affixType = 3,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1],
    equipClass = [3],
    propType = 17,
    min = 10,
    max1 = 10,
    max2 = 10,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1025,1)->
    #equipAffixesCfg {
    iD = 614,
    affixID = 1025,
    name = "魔怒恢复",
    affixLevel = 1,
    affixType = 3,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1],
    equipClass = [4],
    propType = 15,
    min = 0.05,
    max1 = 0.0554016620498615,
    max2 = 0.0613868831577413,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1026,1)->
    #equipAffixesCfg {
    iD = 615,
    affixID = 1026,
    name = "圣力上限",
    affixLevel = 1,
    affixType = 3,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1],
    equipClass = [1],
    propType = 10,
    min = 0.05,
    max1 = 0.0554016620498615,
    max2 = 0.0613868831577413,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1027,1)->
    #equipAffixesCfg {
    iD = 616,
    affixID = 1027,
    name = "秘法上限",
    affixLevel = 1,
    affixType = 3,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1],
    equipClass = [2],
    propType = 12,
    min = 16,
    max1 = 18,
    max2 = 20,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1028,1)->
    #equipAffixesCfg {
    iD = 617,
    affixID = 1028,
    name = "影力上限",
    affixLevel = 1,
    affixType = 3,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1],
    equipClass = [3],
    propType = 16,
    min = 16,
    max1 = 18,
    max2 = 20,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1029,1)->
    #equipAffixesCfg {
    iD = 618,
    affixID = 1029,
    name = "魔怒上限",
    affixLevel = 1,
    affixType = 3,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1],
    equipClass = [4],
    propType = 14,
    min = 16,
    max1 = 18,
    max2 = 20,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1030,1)->
    #equipAffixesCfg {
    iD = 619,
    affixID = 1030,
    name = "物理伤害抗性",
    affixLevel = 1,
    affixType = 3,
    conflict = 6,
    itemLevel = 1,
    equipType = [1,2,4,5],
    equipClass = [1,2,3,4,5],
    propType = 48,
    min = 0.06,
    max1 = 0.07,
    max2 = 0.08,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(1031,1)->
    #equipAffixesCfg {
    iD = 620,
    affixID = 1031,
    name = "神圣伤害抗性",
    affixLevel = 1,
    affixType = 3,
    conflict = 6,
    itemLevel = 1,
    equipType = [1,2,4,5],
    equipClass = [1,2,3,4,5],
    propType = 47,
    min = 0.06,
    max1 = 0.07,
    max2 = 0.08,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(1032,1)->
    #equipAffixesCfg {
    iD = 621,
    affixID = 1032,
    name = "暗影伤害抗性",
    affixLevel = 1,
    affixType = 3,
    conflict = 6,
    itemLevel = 1,
    equipType = [1,2,4,5],
    equipClass = [1,2,3,4,5],
    propType = 49,
    min = 0.06,
    max1 = 0.07,
    max2 = 0.08,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(1033,1)->
    #equipAffixesCfg {
    iD = 622,
    affixID = 1033,
    name = "元素伤害抗性",
    affixLevel = 1,
    affixType = 3,
    conflict = 6,
    itemLevel = 1,
    equipType = [1,2,4,5],
    equipClass = [1,2,3,4,5],
    propType = 50,
    min = 0.06,
    max1 = 0.07,
    max2 = 0.08,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(1034,1)->
    #equipAffixesCfg {
    iD = 623,
    affixID = 1034,
    name = "移动速度",
    affixLevel = 1,
    affixType = 3,
    conflict = 0,
    itemLevel = 1,
    equipType = [3],
    equipClass = [1,2,3,4,5],
    propType = 40,
    min = 5,
    max1 = 6,
    max2 = 7,
    mulityOrPlus = 0,
    weight = 0,
    dice = 4
    };
getRow(1035,1)->
    #equipAffixesCfg {
    iD = 624,
    affixID = 1035,
    name = "对精英伤害",
    affixLevel = 1,
    affixType = 3,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1],
    equipClass = [1,2,3,4,5],
    propType = 8,
    min = 0.06,
    max1 = 0.07,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1036,32)->
    #equipAffixesCfg {
    iD = 626,
    affixID = 1036,
    name = "反弹伤害",
    affixLevel = 1,
    affixType = 3,
    conflict = 0,
    itemLevel = 32,
    equipType = [1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 29,
    max1 = 32,
    max2 = 35,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1036,40)->
    #equipAffixesCfg {
    iD = 627,
    affixID = 1036,
    name = "反弹伤害",
    affixLevel = 2,
    affixType = 3,
    conflict = 0,
    itemLevel = 40,
    equipType = [1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 43,
    max1 = 48,
    max2 = 53,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1036,44)->
    #equipAffixesCfg {
    iD = 628,
    affixID = 1036,
    name = "反弹伤害",
    affixLevel = 3,
    affixType = 3,
    conflict = 0,
    itemLevel = 44,
    equipType = [1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 53,
    max1 = 59,
    max2 = 65,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1036,48)->
    #equipAffixesCfg {
    iD = 629,
    affixID = 1036,
    name = "反弹伤害",
    affixLevel = 4,
    affixType = 3,
    conflict = 0,
    itemLevel = 48,
    equipType = [1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 65,
    max1 = 73,
    max2 = 81,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1036,52)->
    #equipAffixesCfg {
    iD = 630,
    affixID = 1036,
    name = "反弹伤害",
    affixLevel = 5,
    affixType = 3,
    conflict = 0,
    itemLevel = 52,
    equipType = [1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 81,
    max1 = 89,
    max2 = 99,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1036,56)->
    #equipAffixesCfg {
    iD = 631,
    affixID = 1036,
    name = "反弹伤害",
    affixLevel = 6,
    affixType = 3,
    conflict = 0,
    itemLevel = 56,
    equipType = [1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 99,
    max1 = 110,
    max2 = 122,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1036,60)->
    #equipAffixesCfg {
    iD = 632,
    affixID = 1036,
    name = "反弹伤害",
    affixLevel = 7,
    affixType = 3,
    conflict = 0,
    itemLevel = 60,
    equipType = [1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 122,
    max1 = 135,
    max2 = 149,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1036,64)->
    #equipAffixesCfg {
    iD = 633,
    affixID = 1036,
    name = "反弹伤害",
    affixLevel = 8,
    affixType = 3,
    conflict = 0,
    itemLevel = 64,
    equipType = [1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 149,
    max1 = 166,
    max2 = 184,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1036,68)->
    #equipAffixesCfg {
    iD = 634,
    affixID = 1036,
    name = "反弹伤害",
    affixLevel = 9,
    affixType = 3,
    conflict = 0,
    itemLevel = 68,
    equipType = [1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 184,
    max1 = 203,
    max2 = 225,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1036,72)->
    #equipAffixesCfg {
    iD = 635,
    affixID = 1036,
    name = "反弹伤害",
    affixLevel = 10,
    affixType = 3,
    conflict = 0,
    itemLevel = 72,
    equipType = [1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 225,
    max1 = 250,
    max2 = 277,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1036,76)->
    #equipAffixesCfg {
    iD = 636,
    affixID = 1036,
    name = "反弹伤害",
    affixLevel = 11,
    affixType = 3,
    conflict = 0,
    itemLevel = 76,
    equipType = [1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 277,
    max1 = 307,
    max2 = 340,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1037,1)->
    #equipAffixesCfg {
    iD = 637,
    affixID = 1037,
    name = "强韧",
    affixLevel = 1,
    affixType = 3,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 52,
    min = 14,
    max1 = 15,
    max2 = 17,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(1038,1)->
    #equipAffixesCfg {
    iD = 638,
    affixID = 1038,
    name = "意志",
    affixLevel = 1,
    affixType = 3,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 53,
    min = 14,
    max1 = 15,
    max2 = 17,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(1039,1)->
    #equipAffixesCfg {
    iD = 639,
    affixID = 1039,
    name = "反射",
    affixLevel = 1,
    affixType = 3,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 54,
    min = 14,
    max1 = 15,
    max2 = 17,
    mulityOrPlus = 1,
    weight = 0,
    dice = 4
    };
getRow(1040,1)->
    #equipAffixesCfg {
    iD = 640,
    affixID = 1040,
    name = "药水效果",
    affixLevel = 1,
    affixType = 3,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 14,
    max1 = 15,
    max2 = 17,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1040,8)->
    #equipAffixesCfg {
    iD = 641,
    affixID = 1040,
    name = "药水效果",
    affixLevel = 2,
    affixType = 3,
    conflict = 0,
    itemLevel = 8,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 20,
    max1 = 22,
    max2 = 24,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1040,16)->
    #equipAffixesCfg {
    iD = 642,
    affixID = 1040,
    name = "药水效果",
    affixLevel = 3,
    affixType = 3,
    conflict = 0,
    itemLevel = 16,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 30,
    max1 = 33,
    max2 = 37,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1040,24)->
    #equipAffixesCfg {
    iD = 643,
    affixID = 1040,
    name = "药水效果",
    affixLevel = 4,
    affixType = 3,
    conflict = 0,
    itemLevel = 24,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 46,
    max1 = 51,
    max2 = 56,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1040,32)->
    #equipAffixesCfg {
    iD = 644,
    affixID = 1040,
    name = "药水效果",
    affixLevel = 5,
    affixType = 3,
    conflict = 0,
    itemLevel = 32,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 69,
    max1 = 77,
    max2 = 85,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1040,40)->
    #equipAffixesCfg {
    iD = 645,
    affixID = 1040,
    name = "药水效果",
    affixLevel = 6,
    affixType = 3,
    conflict = 0,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 105,
    max1 = 116,
    max2 = 128,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1040,44)->
    #equipAffixesCfg {
    iD = 646,
    affixID = 1040,
    name = "药水效果",
    affixLevel = 7,
    affixType = 3,
    conflict = 0,
    itemLevel = 44,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 128,
    max1 = 142,
    max2 = 158,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1040,48)->
    #equipAffixesCfg {
    iD = 647,
    affixID = 1040,
    name = "药水效果",
    affixLevel = 8,
    affixType = 3,
    conflict = 0,
    itemLevel = 48,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 158,
    max1 = 175,
    max2 = 194,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1040,52)->
    #equipAffixesCfg {
    iD = 648,
    affixID = 1040,
    name = "药水效果",
    affixLevel = 9,
    affixType = 3,
    conflict = 0,
    itemLevel = 52,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 194,
    max1 = 215,
    max2 = 238,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1040,56)->
    #equipAffixesCfg {
    iD = 649,
    affixID = 1040,
    name = "药水效果",
    affixLevel = 10,
    affixType = 3,
    conflict = 0,
    itemLevel = 56,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 238,
    max1 = 264,
    max2 = 293,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1040,60)->
    #equipAffixesCfg {
    iD = 650,
    affixID = 1040,
    name = "药水效果",
    affixLevel = 11,
    affixType = 3,
    conflict = 0,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 293,
    max1 = 324,
    max2 = 359,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1040,64)->
    #equipAffixesCfg {
    iD = 651,
    affixID = 1040,
    name = "药水效果",
    affixLevel = 12,
    affixType = 3,
    conflict = 0,
    itemLevel = 64,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 359,
    max1 = 398,
    max2 = 441,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1040,68)->
    #equipAffixesCfg {
    iD = 652,
    affixID = 1040,
    name = "药水效果",
    affixLevel = 13,
    affixType = 3,
    conflict = 0,
    itemLevel = 68,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 441,
    max1 = 489,
    max2 = 542,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1040,72)->
    #equipAffixesCfg {
    iD = 653,
    affixID = 1040,
    name = "药水效果",
    affixLevel = 14,
    affixType = 3,
    conflict = 0,
    itemLevel = 72,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 542,
    max1 = 600,
    max2 = 665,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1040,76)->
    #equipAffixesCfg {
    iD = 654,
    affixID = 1040,
    name = "药水效果",
    affixLevel = 15,
    affixType = 3,
    conflict = 0,
    itemLevel = 76,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 665,
    max1 = 737,
    max2 = 817,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1041,1)->
    #equipAffixesCfg {
    iD = 655,
    affixID = 1041,
    name = "盾牌猛击伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [1],
    propType = 63,
    min = 0.12,
    max1 = 0.14,
    max2 = 0.16,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1042,1)->
    #equipAffixesCfg {
    iD = 656,
    affixID = 1042,
    name = "净化冷却加速",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [1],
    propType = 64,
    min = 0.06,
    max1 = 0.07,
    max2 = 0.08,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(1043,1)->
    #equipAffixesCfg {
    iD = 657,
    affixID = 1043,
    name = "冲锋冷却加速",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [1],
    propType = 65,
    min = 0.06,
    max1 = 0.07,
    max2 = 0.08,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(1044,1)->
    #equipAffixesCfg {
    iD = 658,
    affixID = 1044,
    name = "永恒之光伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [1],
    propType = 66,
    min = 0.12,
    max1 = 0.14,
    max2 = 0.16,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1045,1)->
    #equipAffixesCfg {
    iD = 659,
    affixID = 1045,
    name = "忏悔伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [1],
    propType = 67,
    min = 0.12,
    max1 = 0.14,
    max2 = 0.16,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1046,1)->
    #equipAffixesCfg {
    iD = 660,
    affixID = 1046,
    name = "黎明之锤冷却加速",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [1],
    propType = 68,
    min = 0.06,
    max1 = 0.07,
    max2 = 0.08,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(1047,1)->
    #equipAffixesCfg {
    iD = 661,
    affixID = 1047,
    name = "火球术伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [2],
    propType = 70,
    min = 0.12,
    max1 = 0.14,
    max2 = 0.16,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1048,1)->
    #equipAffixesCfg {
    iD = 662,
    affixID = 1048,
    name = "陨石术伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [2],
    propType = 71,
    min = 0.12,
    max1 = 0.14,
    max2 = 0.16,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1049,1)->
    #equipAffixesCfg {
    iD = 663,
    affixID = 1049,
    name = "冰环术冷却加速",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [2],
    propType = 72,
    min = 0.06,
    max1 = 0.07,
    max2 = 0.08,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(1050,1)->
    #equipAffixesCfg {
    iD = 664,
    affixID = 1050,
    name = "冰环术伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [2],
    propType = 73,
    min = 0.12,
    max1 = 0.14,
    max2 = 0.16,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1051,1)->
    #equipAffixesCfg {
    iD = 665,
    affixID = 1051,
    name = "冰风暴伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [2],
    propType = 74,
    min = 0.12,
    max1 = 0.14,
    max2 = 0.16,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1052,1)->
    #equipAffixesCfg {
    iD = 666,
    affixID = 1052,
    name = "能量冲击伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [2],
    propType = 75,
    min = 0.12,
    max1 = 0.14,
    max2 = 0.16,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1053,1)->
    #equipAffixesCfg {
    iD = 667,
    affixID = 1053,
    name = "生命收割冷却",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [4],
    propType = 76,
    min = 0.06,
    max1 = 0.07,
    max2 = 0.08,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(1054,1)->
    #equipAffixesCfg {
    iD = 668,
    affixID = 1054,
    name = "远古恶魔冷却",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [4],
    propType = 97,
    min = 0.06,
    max1 = 0.07,
    max2 = 0.08,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(1055,1)->
    #equipAffixesCfg {
    iD = 669,
    affixID = 1055,
    name = "亵渎伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [4],
    propType = 78,
    min = 0.12,
    max1 = 0.14,
    max2 = 0.16,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1056,1)->
    #equipAffixesCfg {
    iD = 670,
    affixID = 1056,
    name = "末日决战伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [4],
    propType = 79,
    min = 0.12,
    max1 = 0.14,
    max2 = 0.16,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1057,1)->
    #equipAffixesCfg {
    iD = 671,
    affixID = 1057,
    name = "死亡风暴伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [4],
    propType = 81,
    min = 0.12,
    max1 = 0.14,
    max2 = 0.16,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1058,1)->
    #equipAffixesCfg {
    iD = 672,
    affixID = 1058,
    name = "死亡斩杀伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [4],
    propType = 82,
    min = 0.12,
    max1 = 0.14,
    max2 = 0.16,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1059,1)->
    #equipAffixesCfg {
    iD = 673,
    affixID = 1059,
    name = "烈风斩伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [3],
    propType = 83,
    min = 0.12,
    max1 = 0.14,
    max2 = 0.16,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1060,1)->
    #equipAffixesCfg {
    iD = 674,
    affixID = 1060,
    name = "致命投掷冷却加速",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [3],
    propType = 84,
    min = 0.06,
    max1 = 0.07,
    max2 = 0.08,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(1061,1)->
    #equipAffixesCfg {
    iD = 675,
    affixID = 1061,
    name = "缴械伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [3],
    propType = 85,
    min = 0.12,
    max1 = 0.14,
    max2 = 0.16,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1062,1)->
    #equipAffixesCfg {
    iD = 676,
    affixID = 1062,
    name = "灭寂伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [3],
    propType = 86,
    min = 0.12,
    max1 = 0.14,
    max2 = 0.16,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1063,1)->
    #equipAffixesCfg {
    iD = 677,
    affixID = 1063,
    name = "乱影击伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [3],
    propType = 87,
    min = 0.12,
    max1 = 0.14,
    max2 = 0.16,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1064,1)->
    #equipAffixesCfg {
    iD = 678,
    affixID = 1064,
    name = "致命投掷伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [3],
    propType = 88,
    min = 0.12,
    max1 = 0.14,
    max2 = 0.16,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1065,1)->
    #equipAffixesCfg {
    iD = 679,
    affixID = 1065,
    name = "影武冷却加速",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [3],
    propType = 89,
    min = 0.06,
    max1 = 0.07,
    max2 = 0.08,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(1066,1)->
    #equipAffixesCfg {
    iD = 680,
    affixID = 1066,
    name = "影袭伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [3],
    propType = 90,
    min = 0.12,
    max1 = 0.14,
    max2 = 0.16,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1067,1)->
    #equipAffixesCfg {
    iD = 625,
    affixID = 1067,
    name = "受精英伤害",
    affixLevel = 1,
    affixType = 3,
    conflict = 0,
    itemLevel = 1,
    equipType = [2],
    equipClass = [1,2,3,4,5],
    propType = 9,
    min = -0.06,
    max1 = -0.07,
    max2 = -0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(1068,1)->
    #equipAffixesCfg {
    iD = 681,
    affixID = 1068,
    name = "物理防御",
    affixLevel = 1,
    affixType = 3,
    conflict = 12,
    itemLevel = 1,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 33,
    max1 = 37,
    max2 = 41,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1068,8)->
    #equipAffixesCfg {
    iD = 682,
    affixID = 1068,
    name = "物理防御",
    affixLevel = 2,
    affixType = 3,
    conflict = 12,
    itemLevel = 8,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 48,
    max1 = 53,
    max2 = 59,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1068,16)->
    #equipAffixesCfg {
    iD = 683,
    affixID = 1068,
    name = "物理防御",
    affixLevel = 3,
    affixType = 3,
    conflict = 12,
    itemLevel = 16,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 72,
    max1 = 80,
    max2 = 89,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1068,24)->
    #equipAffixesCfg {
    iD = 684,
    affixID = 1068,
    name = "物理防御",
    affixLevel = 4,
    affixType = 3,
    conflict = 12,
    itemLevel = 24,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 109,
    max1 = 121,
    max2 = 134,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1068,32)->
    #equipAffixesCfg {
    iD = 685,
    affixID = 1068,
    name = "物理防御",
    affixLevel = 5,
    affixType = 3,
    conflict = 12,
    itemLevel = 32,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 165,
    max1 = 183,
    max2 = 202,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1068,40)->
    #equipAffixesCfg {
    iD = 686,
    affixID = 1068,
    name = "物理防御",
    affixLevel = 6,
    affixType = 3,
    conflict = 12,
    itemLevel = 40,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 249,
    max1 = 275,
    max2 = 305,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1068,44)->
    #equipAffixesCfg {
    iD = 687,
    affixID = 1068,
    name = "物理防御",
    affixLevel = 7,
    affixType = 3,
    conflict = 12,
    itemLevel = 44,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 305,
    max1 = 338,
    max2 = 375,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1068,48)->
    #equipAffixesCfg {
    iD = 688,
    affixID = 1068,
    name = "物理防御",
    affixLevel = 8,
    affixType = 3,
    conflict = 12,
    itemLevel = 48,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 375,
    max1 = 415,
    max2 = 460,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1068,52)->
    #equipAffixesCfg {
    iD = 689,
    affixID = 1068,
    name = "物理防御",
    affixLevel = 9,
    affixType = 3,
    conflict = 12,
    itemLevel = 52,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 460,
    max1 = 510,
    max2 = 565,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1068,56)->
    #equipAffixesCfg {
    iD = 690,
    affixID = 1068,
    name = "物理防御",
    affixLevel = 10,
    affixType = 3,
    conflict = 12,
    itemLevel = 56,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 565,
    max1 = 626,
    max2 = 694,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1068,60)->
    #equipAffixesCfg {
    iD = 691,
    affixID = 1068,
    name = "物理防御",
    affixLevel = 11,
    affixType = 3,
    conflict = 12,
    itemLevel = 60,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 694,
    max1 = 769,
    max2 = 852,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1068,64)->
    #equipAffixesCfg {
    iD = 692,
    affixID = 1068,
    name = "物理防御",
    affixLevel = 12,
    affixType = 3,
    conflict = 12,
    itemLevel = 64,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 852,
    max1 = 944,
    max2 = 1046,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1068,68)->
    #equipAffixesCfg {
    iD = 693,
    affixID = 1068,
    name = "物理防御",
    affixLevel = 13,
    affixType = 3,
    conflict = 12,
    itemLevel = 68,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 1046,
    max1 = 1160,
    max2 = 1285,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1068,72)->
    #equipAffixesCfg {
    iD = 694,
    affixID = 1068,
    name = "物理防御",
    affixLevel = 14,
    affixType = 3,
    conflict = 12,
    itemLevel = 72,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 1285,
    max1 = 1424,
    max2 = 1578,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1068,76)->
    #equipAffixesCfg {
    iD = 695,
    affixID = 1068,
    name = "物理防御",
    affixLevel = 15,
    affixType = 3,
    conflict = 12,
    itemLevel = 76,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 1578,
    max1 = 1748,
    max2 = 1937,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1069,1)->
    #equipAffixesCfg {
    iD = 696,
    affixID = 1069,
    name = "魔法防御",
    affixLevel = 1,
    affixType = 3,
    conflict = 12,
    itemLevel = 1,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 33,
    max1 = 37,
    max2 = 41,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1069,8)->
    #equipAffixesCfg {
    iD = 697,
    affixID = 1069,
    name = "魔法防御",
    affixLevel = 2,
    affixType = 3,
    conflict = 12,
    itemLevel = 8,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 48,
    max1 = 53,
    max2 = 59,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1069,16)->
    #equipAffixesCfg {
    iD = 698,
    affixID = 1069,
    name = "魔法防御",
    affixLevel = 3,
    affixType = 3,
    conflict = 12,
    itemLevel = 16,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 72,
    max1 = 80,
    max2 = 89,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1069,24)->
    #equipAffixesCfg {
    iD = 699,
    affixID = 1069,
    name = "魔法防御",
    affixLevel = 4,
    affixType = 3,
    conflict = 12,
    itemLevel = 24,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 109,
    max1 = 121,
    max2 = 134,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1069,32)->
    #equipAffixesCfg {
    iD = 700,
    affixID = 1069,
    name = "魔法防御",
    affixLevel = 5,
    affixType = 3,
    conflict = 12,
    itemLevel = 32,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 165,
    max1 = 183,
    max2 = 202,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1069,40)->
    #equipAffixesCfg {
    iD = 701,
    affixID = 1069,
    name = "魔法防御",
    affixLevel = 6,
    affixType = 3,
    conflict = 12,
    itemLevel = 40,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 249,
    max1 = 275,
    max2 = 305,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1069,44)->
    #equipAffixesCfg {
    iD = 702,
    affixID = 1069,
    name = "魔法防御",
    affixLevel = 7,
    affixType = 3,
    conflict = 12,
    itemLevel = 44,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 305,
    max1 = 338,
    max2 = 375,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1069,48)->
    #equipAffixesCfg {
    iD = 703,
    affixID = 1069,
    name = "魔法防御",
    affixLevel = 8,
    affixType = 3,
    conflict = 12,
    itemLevel = 48,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 375,
    max1 = 415,
    max2 = 460,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1069,52)->
    #equipAffixesCfg {
    iD = 704,
    affixID = 1069,
    name = "魔法防御",
    affixLevel = 9,
    affixType = 3,
    conflict = 12,
    itemLevel = 52,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 460,
    max1 = 510,
    max2 = 565,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1069,56)->
    #equipAffixesCfg {
    iD = 705,
    affixID = 1069,
    name = "魔法防御",
    affixLevel = 10,
    affixType = 3,
    conflict = 12,
    itemLevel = 56,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 565,
    max1 = 626,
    max2 = 694,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1069,60)->
    #equipAffixesCfg {
    iD = 706,
    affixID = 1069,
    name = "魔法防御",
    affixLevel = 11,
    affixType = 3,
    conflict = 12,
    itemLevel = 60,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 694,
    max1 = 769,
    max2 = 852,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1069,64)->
    #equipAffixesCfg {
    iD = 707,
    affixID = 1069,
    name = "魔法防御",
    affixLevel = 12,
    affixType = 3,
    conflict = 12,
    itemLevel = 64,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 852,
    max1 = 944,
    max2 = 1046,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1069,68)->
    #equipAffixesCfg {
    iD = 708,
    affixID = 1069,
    name = "魔法防御",
    affixLevel = 13,
    affixType = 3,
    conflict = 12,
    itemLevel = 68,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 1046,
    max1 = 1160,
    max2 = 1285,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1069,72)->
    #equipAffixesCfg {
    iD = 709,
    affixID = 1069,
    name = "魔法防御",
    affixLevel = 14,
    affixType = 3,
    conflict = 12,
    itemLevel = 72,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 1285,
    max1 = 1424,
    max2 = 1578,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(1069,76)->
    #equipAffixesCfg {
    iD = 710,
    affixID = 1069,
    name = "魔法防御",
    affixLevel = 15,
    affixType = 3,
    conflict = 12,
    itemLevel = 76,
    equipType = [2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 1578,
    max1 = 1748,
    max2 = 1937,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2001,1)->
    #equipAffixesCfg {
    iD = 711,
    affixID = 2001,
    name = "定制暴击率lv<60",
    affixLevel = 1,
    affixType = 4,
    conflict = 5,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.07,
    max1 = 0.07,
    max2 = 0.07,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(2002,1)->
    #equipAffixesCfg {
    iD = 712,
    affixID = 2002,
    name = "定制暴击率lv=60",
    affixLevel = 1,
    affixType = 4,
    conflict = 5,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.09,
    max1 = 0.09,
    max2 = 0.09,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(2004,1)->
    #equipAffixesCfg {
    iD = 713,
    affixID = 2004,
    name = "定制攻速lv<60",
    affixLevel = 1,
    affixType = 4,
    conflict = 8,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.07,
    max1 = 0.07,
    max2 = 0.07,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2005,1)->
    #equipAffixesCfg {
    iD = 714,
    affixID = 2005,
    name = "定制攻速=60",
    affixLevel = 1,
    affixType = 4,
    conflict = 8,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 42,
    min = 0.09,
    max1 = 0.09,
    max2 = 0.09,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2006,1)->
    #equipAffixesCfg {
    iD = 715,
    affixID = 2006,
    name = "定制暗影抗性",
    affixLevel = 1,
    affixType = 5,
    conflict = 6,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 49,
    min = 0.35,
    max1 = 0.35,
    max2 = 0.35,
    mulityOrPlus = 1,
    weight = 1,
    dice = 4
    };
getRow(2007,1)->
    #equipAffixesCfg {
    iD = 716,
    affixID = 2007,
    name = "受精英伤害",
    affixLevel = 1,
    affixType = 5,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 9,
    min = -0.08,
    max1 = -0.08,
    max2 = -0.08,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2008,1)->
    #equipAffixesCfg {
    iD = 717,
    affixID = 2008,
    name = "物理伤害",
    affixLevel = 1,
    affixType = 4,
    conflict = 2,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 3,
    max1 = 3,
    max2 = 3,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2008,8)->
    #equipAffixesCfg {
    iD = 718,
    affixID = 2008,
    name = "物理伤害",
    affixLevel = 2,
    affixType = 4,
    conflict = 2,
    itemLevel = 8,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 4,
    max1 = 4,
    max2 = 4,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2008,16)->
    #equipAffixesCfg {
    iD = 719,
    affixID = 2008,
    name = "物理伤害",
    affixLevel = 3,
    affixType = 4,
    conflict = 2,
    itemLevel = 16,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 6,
    max1 = 6,
    max2 = 6,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2008,24)->
    #equipAffixesCfg {
    iD = 720,
    affixID = 2008,
    name = "物理伤害",
    affixLevel = 4,
    affixType = 4,
    conflict = 2,
    itemLevel = 24,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 10,
    max1 = 10,
    max2 = 10,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2008,32)->
    #equipAffixesCfg {
    iD = 721,
    affixID = 2008,
    name = "物理伤害",
    affixLevel = 5,
    affixType = 4,
    conflict = 2,
    itemLevel = 32,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 15,
    max1 = 15,
    max2 = 15,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2008,40)->
    #equipAffixesCfg {
    iD = 722,
    affixID = 2008,
    name = "物理伤害",
    affixLevel = 6,
    affixType = 4,
    conflict = 2,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 22,
    max1 = 22,
    max2 = 22,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2008,44)->
    #equipAffixesCfg {
    iD = 723,
    affixID = 2008,
    name = "物理伤害",
    affixLevel = 7,
    affixType = 4,
    conflict = 2,
    itemLevel = 44,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 28,
    max1 = 28,
    max2 = 28,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2008,48)->
    #equipAffixesCfg {
    iD = 724,
    affixID = 2008,
    name = "物理伤害",
    affixLevel = 8,
    affixType = 4,
    conflict = 2,
    itemLevel = 48,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 34,
    max1 = 34,
    max2 = 34,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2008,52)->
    #equipAffixesCfg {
    iD = 725,
    affixID = 2008,
    name = "物理伤害",
    affixLevel = 9,
    affixType = 4,
    conflict = 2,
    itemLevel = 52,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 42,
    max1 = 42,
    max2 = 42,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2008,56)->
    #equipAffixesCfg {
    iD = 726,
    affixID = 2008,
    name = "物理伤害",
    affixLevel = 10,
    affixType = 4,
    conflict = 2,
    itemLevel = 56,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 52,
    max1 = 52,
    max2 = 52,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2008,60)->
    #equipAffixesCfg {
    iD = 727,
    affixID = 2008,
    name = "物理伤害",
    affixLevel = 11,
    affixType = 4,
    conflict = 2,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 63,
    max1 = 63,
    max2 = 63,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2008,64)->
    #equipAffixesCfg {
    iD = 728,
    affixID = 2008,
    name = "物理伤害",
    affixLevel = 12,
    affixType = 4,
    conflict = 2,
    itemLevel = 64,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 78,
    max1 = 78,
    max2 = 78,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2008,68)->
    #equipAffixesCfg {
    iD = 729,
    affixID = 2008,
    name = "物理伤害",
    affixLevel = 13,
    affixType = 4,
    conflict = 2,
    itemLevel = 68,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 96,
    max1 = 96,
    max2 = 96,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2008,72)->
    #equipAffixesCfg {
    iD = 730,
    affixID = 2008,
    name = "物理伤害",
    affixLevel = 14,
    affixType = 4,
    conflict = 2,
    itemLevel = 72,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 118,
    max1 = 118,
    max2 = 118,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2008,76)->
    #equipAffixesCfg {
    iD = 731,
    affixID = 2008,
    name = "物理伤害",
    affixLevel = 15,
    affixType = 4,
    conflict = 2,
    itemLevel = 76,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 145,
    max1 = 145,
    max2 = 145,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2009,1)->
    #equipAffixesCfg {
    iD = 732,
    affixID = 2009,
    name = "神圣伤害",
    affixLevel = 1,
    affixType = 4,
    conflict = 2,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2],
    propType = 30,
    min = 3,
    max1 = 3,
    max2 = 3,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2009,8)->
    #equipAffixesCfg {
    iD = 733,
    affixID = 2009,
    name = "神圣伤害",
    affixLevel = 2,
    affixType = 4,
    conflict = 2,
    itemLevel = 8,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2],
    propType = 30,
    min = 4,
    max1 = 4,
    max2 = 4,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2009,16)->
    #equipAffixesCfg {
    iD = 734,
    affixID = 2009,
    name = "神圣伤害",
    affixLevel = 3,
    affixType = 4,
    conflict = 2,
    itemLevel = 16,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2],
    propType = 30,
    min = 6,
    max1 = 6,
    max2 = 6,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2009,24)->
    #equipAffixesCfg {
    iD = 735,
    affixID = 2009,
    name = "神圣伤害",
    affixLevel = 4,
    affixType = 4,
    conflict = 2,
    itemLevel = 24,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2],
    propType = 30,
    min = 10,
    max1 = 10,
    max2 = 10,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2009,32)->
    #equipAffixesCfg {
    iD = 736,
    affixID = 2009,
    name = "神圣伤害",
    affixLevel = 5,
    affixType = 4,
    conflict = 2,
    itemLevel = 32,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2],
    propType = 30,
    min = 15,
    max1 = 15,
    max2 = 15,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2009,40)->
    #equipAffixesCfg {
    iD = 737,
    affixID = 2009,
    name = "神圣伤害",
    affixLevel = 6,
    affixType = 4,
    conflict = 2,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2],
    propType = 30,
    min = 22,
    max1 = 22,
    max2 = 22,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2009,44)->
    #equipAffixesCfg {
    iD = 738,
    affixID = 2009,
    name = "神圣伤害",
    affixLevel = 7,
    affixType = 4,
    conflict = 2,
    itemLevel = 44,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2],
    propType = 30,
    min = 28,
    max1 = 28,
    max2 = 28,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2009,48)->
    #equipAffixesCfg {
    iD = 739,
    affixID = 2009,
    name = "神圣伤害",
    affixLevel = 8,
    affixType = 4,
    conflict = 2,
    itemLevel = 48,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2],
    propType = 30,
    min = 34,
    max1 = 34,
    max2 = 34,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2009,52)->
    #equipAffixesCfg {
    iD = 740,
    affixID = 2009,
    name = "神圣伤害",
    affixLevel = 9,
    affixType = 4,
    conflict = 2,
    itemLevel = 52,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2],
    propType = 30,
    min = 42,
    max1 = 42,
    max2 = 42,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2009,56)->
    #equipAffixesCfg {
    iD = 741,
    affixID = 2009,
    name = "神圣伤害",
    affixLevel = 10,
    affixType = 4,
    conflict = 2,
    itemLevel = 56,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2],
    propType = 30,
    min = 52,
    max1 = 52,
    max2 = 52,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2009,60)->
    #equipAffixesCfg {
    iD = 742,
    affixID = 2009,
    name = "神圣伤害",
    affixLevel = 11,
    affixType = 4,
    conflict = 2,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2],
    propType = 30,
    min = 63,
    max1 = 63,
    max2 = 63,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2009,64)->
    #equipAffixesCfg {
    iD = 743,
    affixID = 2009,
    name = "神圣伤害",
    affixLevel = 12,
    affixType = 4,
    conflict = 2,
    itemLevel = 64,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2],
    propType = 30,
    min = 78,
    max1 = 78,
    max2 = 78,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2009,68)->
    #equipAffixesCfg {
    iD = 744,
    affixID = 2009,
    name = "神圣伤害",
    affixLevel = 13,
    affixType = 4,
    conflict = 2,
    itemLevel = 68,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2],
    propType = 30,
    min = 96,
    max1 = 96,
    max2 = 96,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2009,72)->
    #equipAffixesCfg {
    iD = 745,
    affixID = 2009,
    name = "神圣伤害",
    affixLevel = 14,
    affixType = 4,
    conflict = 2,
    itemLevel = 72,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2],
    propType = 30,
    min = 118,
    max1 = 118,
    max2 = 118,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2009,76)->
    #equipAffixesCfg {
    iD = 746,
    affixID = 2009,
    name = "神圣伤害",
    affixLevel = 15,
    affixType = 4,
    conflict = 2,
    itemLevel = 76,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2],
    propType = 30,
    min = 145,
    max1 = 145,
    max2 = 145,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2010,1)->
    #equipAffixesCfg {
    iD = 747,
    affixID = 2010,
    name = "暗影伤害",
    affixLevel = 1,
    affixType = 4,
    conflict = 2,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 3,
    max1 = 3,
    max2 = 3,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2010,8)->
    #equipAffixesCfg {
    iD = 748,
    affixID = 2010,
    name = "暗影伤害",
    affixLevel = 2,
    affixType = 4,
    conflict = 2,
    itemLevel = 8,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 4,
    max1 = 4,
    max2 = 4,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2010,16)->
    #equipAffixesCfg {
    iD = 749,
    affixID = 2010,
    name = "暗影伤害",
    affixLevel = 3,
    affixType = 4,
    conflict = 2,
    itemLevel = 16,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 6,
    max1 = 6,
    max2 = 6,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2010,24)->
    #equipAffixesCfg {
    iD = 750,
    affixID = 2010,
    name = "暗影伤害",
    affixLevel = 4,
    affixType = 4,
    conflict = 2,
    itemLevel = 24,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 10,
    max1 = 10,
    max2 = 10,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2010,32)->
    #equipAffixesCfg {
    iD = 751,
    affixID = 2010,
    name = "暗影伤害",
    affixLevel = 5,
    affixType = 4,
    conflict = 2,
    itemLevel = 32,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 15,
    max1 = 15,
    max2 = 15,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2010,40)->
    #equipAffixesCfg {
    iD = 752,
    affixID = 2010,
    name = "暗影伤害",
    affixLevel = 6,
    affixType = 4,
    conflict = 2,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 22,
    max1 = 22,
    max2 = 22,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2010,44)->
    #equipAffixesCfg {
    iD = 753,
    affixID = 2010,
    name = "暗影伤害",
    affixLevel = 7,
    affixType = 4,
    conflict = 2,
    itemLevel = 44,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 28,
    max1 = 28,
    max2 = 28,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2010,48)->
    #equipAffixesCfg {
    iD = 754,
    affixID = 2010,
    name = "暗影伤害",
    affixLevel = 8,
    affixType = 4,
    conflict = 2,
    itemLevel = 48,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 34,
    max1 = 34,
    max2 = 34,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2010,52)->
    #equipAffixesCfg {
    iD = 755,
    affixID = 2010,
    name = "暗影伤害",
    affixLevel = 9,
    affixType = 4,
    conflict = 2,
    itemLevel = 52,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 42,
    max1 = 42,
    max2 = 42,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2010,56)->
    #equipAffixesCfg {
    iD = 756,
    affixID = 2010,
    name = "暗影伤害",
    affixLevel = 10,
    affixType = 4,
    conflict = 2,
    itemLevel = 56,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 52,
    max1 = 52,
    max2 = 52,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2010,60)->
    #equipAffixesCfg {
    iD = 757,
    affixID = 2010,
    name = "暗影伤害",
    affixLevel = 11,
    affixType = 4,
    conflict = 2,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 63,
    max1 = 63,
    max2 = 63,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2010,64)->
    #equipAffixesCfg {
    iD = 758,
    affixID = 2010,
    name = "暗影伤害",
    affixLevel = 12,
    affixType = 4,
    conflict = 2,
    itemLevel = 64,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 78,
    max1 = 78,
    max2 = 78,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2010,68)->
    #equipAffixesCfg {
    iD = 759,
    affixID = 2010,
    name = "暗影伤害",
    affixLevel = 13,
    affixType = 4,
    conflict = 2,
    itemLevel = 68,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 96,
    max1 = 96,
    max2 = 96,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2010,72)->
    #equipAffixesCfg {
    iD = 760,
    affixID = 2010,
    name = "暗影伤害",
    affixLevel = 14,
    affixType = 4,
    conflict = 2,
    itemLevel = 72,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 118,
    max1 = 118,
    max2 = 118,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2010,76)->
    #equipAffixesCfg {
    iD = 761,
    affixID = 2010,
    name = "暗影伤害",
    affixLevel = 15,
    affixType = 4,
    conflict = 2,
    itemLevel = 76,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3,4,5],
    propType = 32,
    min = 145,
    max1 = 145,
    max2 = 145,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2011,1)->
    #equipAffixesCfg {
    iD = 762,
    affixID = 2011,
    name = "元素伤害",
    affixLevel = 1,
    affixType = 4,
    conflict = 2,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3],
    propType = 33,
    min = 3,
    max1 = 3,
    max2 = 3,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2011,8)->
    #equipAffixesCfg {
    iD = 763,
    affixID = 2011,
    name = "元素伤害",
    affixLevel = 2,
    affixType = 4,
    conflict = 2,
    itemLevel = 8,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3],
    propType = 33,
    min = 4,
    max1 = 4,
    max2 = 4,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2011,16)->
    #equipAffixesCfg {
    iD = 764,
    affixID = 2011,
    name = "元素伤害",
    affixLevel = 3,
    affixType = 4,
    conflict = 2,
    itemLevel = 16,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3],
    propType = 33,
    min = 6,
    max1 = 6,
    max2 = 6,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2011,24)->
    #equipAffixesCfg {
    iD = 765,
    affixID = 2011,
    name = "元素伤害",
    affixLevel = 4,
    affixType = 4,
    conflict = 2,
    itemLevel = 24,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3],
    propType = 33,
    min = 10,
    max1 = 10,
    max2 = 10,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2011,32)->
    #equipAffixesCfg {
    iD = 766,
    affixID = 2011,
    name = "元素伤害",
    affixLevel = 5,
    affixType = 4,
    conflict = 2,
    itemLevel = 32,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3],
    propType = 33,
    min = 15,
    max1 = 15,
    max2 = 15,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2011,40)->
    #equipAffixesCfg {
    iD = 767,
    affixID = 2011,
    name = "元素伤害",
    affixLevel = 6,
    affixType = 4,
    conflict = 2,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3],
    propType = 33,
    min = 22,
    max1 = 22,
    max2 = 22,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2011,44)->
    #equipAffixesCfg {
    iD = 768,
    affixID = 2011,
    name = "元素伤害",
    affixLevel = 7,
    affixType = 4,
    conflict = 2,
    itemLevel = 44,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3],
    propType = 33,
    min = 28,
    max1 = 28,
    max2 = 28,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2011,48)->
    #equipAffixesCfg {
    iD = 769,
    affixID = 2011,
    name = "元素伤害",
    affixLevel = 8,
    affixType = 4,
    conflict = 2,
    itemLevel = 48,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3],
    propType = 33,
    min = 34,
    max1 = 34,
    max2 = 34,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2011,52)->
    #equipAffixesCfg {
    iD = 770,
    affixID = 2011,
    name = "元素伤害",
    affixLevel = 9,
    affixType = 4,
    conflict = 2,
    itemLevel = 52,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3],
    propType = 33,
    min = 42,
    max1 = 42,
    max2 = 42,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2011,56)->
    #equipAffixesCfg {
    iD = 771,
    affixID = 2011,
    name = "元素伤害",
    affixLevel = 10,
    affixType = 4,
    conflict = 2,
    itemLevel = 56,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3],
    propType = 33,
    min = 52,
    max1 = 52,
    max2 = 52,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2011,60)->
    #equipAffixesCfg {
    iD = 772,
    affixID = 2011,
    name = "元素伤害",
    affixLevel = 11,
    affixType = 4,
    conflict = 2,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3],
    propType = 33,
    min = 63,
    max1 = 63,
    max2 = 63,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2011,64)->
    #equipAffixesCfg {
    iD = 773,
    affixID = 2011,
    name = "元素伤害",
    affixLevel = 12,
    affixType = 4,
    conflict = 2,
    itemLevel = 64,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3],
    propType = 33,
    min = 78,
    max1 = 78,
    max2 = 78,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2011,68)->
    #equipAffixesCfg {
    iD = 774,
    affixID = 2011,
    name = "元素伤害",
    affixLevel = 13,
    affixType = 4,
    conflict = 2,
    itemLevel = 68,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3],
    propType = 33,
    min = 96,
    max1 = 96,
    max2 = 96,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2011,72)->
    #equipAffixesCfg {
    iD = 775,
    affixID = 2011,
    name = "元素伤害",
    affixLevel = 14,
    affixType = 4,
    conflict = 2,
    itemLevel = 72,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3],
    propType = 33,
    min = 118,
    max1 = 118,
    max2 = 118,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2011,76)->
    #equipAffixesCfg {
    iD = 776,
    affixID = 2011,
    name = "元素伤害",
    affixLevel = 15,
    affixType = 4,
    conflict = 2,
    itemLevel = 76,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2,3],
    propType = 33,
    min = 145,
    max1 = 145,
    max2 = 145,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2012,1)->
    #equipAffixesCfg {
    iD = 777,
    affixID = 2012,
    name = "生命秒回",
    affixLevel = 1,
    affixType = 5,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 2,
    max1 = 2,
    max2 = 2,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2012,8)->
    #equipAffixesCfg {
    iD = 778,
    affixID = 2012,
    name = "生命秒回",
    affixLevel = 2,
    affixType = 5,
    conflict = 0,
    itemLevel = 8,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 3,
    max1 = 3,
    max2 = 3,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2012,16)->
    #equipAffixesCfg {
    iD = 779,
    affixID = 2012,
    name = "生命秒回",
    affixLevel = 3,
    affixType = 5,
    conflict = 0,
    itemLevel = 16,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 5,
    max1 = 5,
    max2 = 5,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2012,24)->
    #equipAffixesCfg {
    iD = 780,
    affixID = 2012,
    name = "生命秒回",
    affixLevel = 4,
    affixType = 5,
    conflict = 0,
    itemLevel = 24,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 8,
    max1 = 8,
    max2 = 8,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2012,32)->
    #equipAffixesCfg {
    iD = 781,
    affixID = 2012,
    name = "生命秒回",
    affixLevel = 5,
    affixType = 5,
    conflict = 0,
    itemLevel = 32,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 12,
    max1 = 12,
    max2 = 12,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2012,40)->
    #equipAffixesCfg {
    iD = 782,
    affixID = 2012,
    name = "生命秒回",
    affixLevel = 6,
    affixType = 5,
    conflict = 0,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 19,
    max1 = 19,
    max2 = 19,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2012,44)->
    #equipAffixesCfg {
    iD = 783,
    affixID = 2012,
    name = "生命秒回",
    affixLevel = 7,
    affixType = 5,
    conflict = 0,
    itemLevel = 44,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 23,
    max1 = 23,
    max2 = 23,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2012,48)->
    #equipAffixesCfg {
    iD = 784,
    affixID = 2012,
    name = "生命秒回",
    affixLevel = 8,
    affixType = 5,
    conflict = 0,
    itemLevel = 48,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 29,
    max1 = 29,
    max2 = 29,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2012,52)->
    #equipAffixesCfg {
    iD = 785,
    affixID = 2012,
    name = "生命秒回",
    affixLevel = 9,
    affixType = 5,
    conflict = 0,
    itemLevel = 52,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 35,
    max1 = 35,
    max2 = 35,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2012,56)->
    #equipAffixesCfg {
    iD = 786,
    affixID = 2012,
    name = "生命秒回",
    affixLevel = 10,
    affixType = 5,
    conflict = 0,
    itemLevel = 56,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 43,
    max1 = 43,
    max2 = 43,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2012,60)->
    #equipAffixesCfg {
    iD = 787,
    affixID = 2012,
    name = "生命秒回",
    affixLevel = 11,
    affixType = 5,
    conflict = 0,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 53,
    max1 = 53,
    max2 = 53,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2012,64)->
    #equipAffixesCfg {
    iD = 788,
    affixID = 2012,
    name = "生命秒回",
    affixLevel = 12,
    affixType = 5,
    conflict = 0,
    itemLevel = 64,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 66,
    max1 = 66,
    max2 = 66,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2012,68)->
    #equipAffixesCfg {
    iD = 789,
    affixID = 2012,
    name = "生命秒回",
    affixLevel = 13,
    affixType = 5,
    conflict = 0,
    itemLevel = 68,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 81,
    max1 = 81,
    max2 = 81,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2012,72)->
    #equipAffixesCfg {
    iD = 790,
    affixID = 2012,
    name = "生命秒回",
    affixLevel = 14,
    affixType = 5,
    conflict = 0,
    itemLevel = 72,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 99,
    max1 = 99,
    max2 = 99,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2012,76)->
    #equipAffixesCfg {
    iD = 791,
    affixID = 2012,
    name = "生命秒回",
    affixLevel = 15,
    affixType = 5,
    conflict = 0,
    itemLevel = 76,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 19,
    min = 122,
    max1 = 122,
    max2 = 122,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2013,1)->
    #equipAffixesCfg {
    iD = 792,
    affixID = 2013,
    name = "定制冷却速度lv<60",
    affixLevel = 1,
    affixType = 4,
    conflict = 9,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2014,1)->
    #equipAffixesCfg {
    iD = 793,
    affixID = 2014,
    name = "定制冷却速度=60",
    affixLevel = 1,
    affixType = 4,
    conflict = 9,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.12,
    max1 = 0.12,
    max2 = 0.12,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2015,1)->
    #equipAffixesCfg {
    iD = 794,
    affixID = 2015,
    name = "暴击伤害",
    affixLevel = 1,
    affixType = 4,
    conflict = 10,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 36,
    min = 0.35,
    max1 = 0.35,
    max2 = 0.35,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2016,1)->
    #equipAffixesCfg {
    iD = 795,
    affixID = 2016,
    name = "生命上限",
    affixLevel = 1,
    affixType = 4,
    conflict = 4,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 18,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 1,
    weight = 1,
    dice = 4
    };
getRow(2017,1)->
    #equipAffixesCfg {
    iD = 796,
    affixID = 2017,
    name = "定制节约能量lv<60",
    affixLevel = 1,
    affixType = 4,
    conflict = 11,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2018,1)->
    #equipAffixesCfg {
    iD = 797,
    affixID = 2018,
    name = "定制节约能量=60",
    affixLevel = 1,
    affixType = 4,
    conflict = 11,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 43,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2019,1)->
    #equipAffixesCfg {
    iD = 798,
    affixID = 2019,
    name = "定制元素抗性",
    affixLevel = 1,
    affixType = 5,
    conflict = 6,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 50,
    min = 0.35,
    max1 = 0.35,
    max2 = 0.35,
    mulityOrPlus = 1,
    weight = 1,
    dice = 4
    };
getRow(2020,1)->
    #equipAffixesCfg {
    iD = 799,
    affixID = 2020,
    name = "力量",
    affixLevel = 1,
    affixType = 4,
    conflict = 1,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 8,
    max1 = 8,
    max2 = 8,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2020,8)->
    #equipAffixesCfg {
    iD = 800,
    affixID = 2020,
    name = "力量",
    affixLevel = 2,
    affixType = 4,
    conflict = 1,
    itemLevel = 8,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 11,
    max1 = 11,
    max2 = 11,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2020,16)->
    #equipAffixesCfg {
    iD = 801,
    affixID = 2020,
    name = "力量",
    affixLevel = 3,
    affixType = 4,
    conflict = 1,
    itemLevel = 16,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 17,
    max1 = 17,
    max2 = 17,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2020,24)->
    #equipAffixesCfg {
    iD = 802,
    affixID = 2020,
    name = "力量",
    affixLevel = 4,
    affixType = 4,
    conflict = 1,
    itemLevel = 24,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 26,
    max1 = 26,
    max2 = 26,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2020,32)->
    #equipAffixesCfg {
    iD = 803,
    affixID = 2020,
    name = "力量",
    affixLevel = 5,
    affixType = 4,
    conflict = 1,
    itemLevel = 32,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 39,
    max1 = 39,
    max2 = 39,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2020,40)->
    #equipAffixesCfg {
    iD = 804,
    affixID = 2020,
    name = "力量",
    affixLevel = 6,
    affixType = 4,
    conflict = 1,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 59,
    max1 = 59,
    max2 = 59,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2020,44)->
    #equipAffixesCfg {
    iD = 805,
    affixID = 2020,
    name = "力量",
    affixLevel = 7,
    affixType = 4,
    conflict = 1,
    itemLevel = 44,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 73,
    max1 = 73,
    max2 = 73,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2020,48)->
    #equipAffixesCfg {
    iD = 806,
    affixID = 2020,
    name = "力量",
    affixLevel = 8,
    affixType = 4,
    conflict = 1,
    itemLevel = 48,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 90,
    max1 = 90,
    max2 = 90,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2020,52)->
    #equipAffixesCfg {
    iD = 807,
    affixID = 2020,
    name = "力量",
    affixLevel = 9,
    affixType = 4,
    conflict = 1,
    itemLevel = 52,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 110,
    max1 = 110,
    max2 = 110,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2020,56)->
    #equipAffixesCfg {
    iD = 808,
    affixID = 2020,
    name = "力量",
    affixLevel = 10,
    affixType = 4,
    conflict = 1,
    itemLevel = 56,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 135,
    max1 = 135,
    max2 = 135,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2020,60)->
    #equipAffixesCfg {
    iD = 809,
    affixID = 2020,
    name = "力量",
    affixLevel = 11,
    affixType = 4,
    conflict = 1,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 166,
    max1 = 166,
    max2 = 166,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2020,64)->
    #equipAffixesCfg {
    iD = 810,
    affixID = 2020,
    name = "力量",
    affixLevel = 12,
    affixType = 4,
    conflict = 1,
    itemLevel = 64,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 204,
    max1 = 204,
    max2 = 204,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2020,68)->
    #equipAffixesCfg {
    iD = 811,
    affixID = 2020,
    name = "力量",
    affixLevel = 13,
    affixType = 4,
    conflict = 1,
    itemLevel = 68,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 251,
    max1 = 251,
    max2 = 251,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2020,72)->
    #equipAffixesCfg {
    iD = 812,
    affixID = 2020,
    name = "力量",
    affixLevel = 14,
    affixType = 4,
    conflict = 1,
    itemLevel = 72,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 308,
    max1 = 308,
    max2 = 308,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2020,76)->
    #equipAffixesCfg {
    iD = 813,
    affixID = 2020,
    name = "力量",
    affixLevel = 15,
    affixType = 4,
    conflict = 1,
    itemLevel = 76,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,4],
    propType = 1,
    min = 378,
    max1 = 378,
    max2 = 378,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2021,1)->
    #equipAffixesCfg {
    iD = 814,
    affixID = 2021,
    name = "敏捷",
    affixLevel = 1,
    affixType = 4,
    conflict = 1,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 8,
    max1 = 8,
    max2 = 8,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2021,8)->
    #equipAffixesCfg {
    iD = 815,
    affixID = 2021,
    name = "敏捷",
    affixLevel = 2,
    affixType = 4,
    conflict = 1,
    itemLevel = 8,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 11,
    max1 = 11,
    max2 = 11,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2021,16)->
    #equipAffixesCfg {
    iD = 816,
    affixID = 2021,
    name = "敏捷",
    affixLevel = 3,
    affixType = 4,
    conflict = 1,
    itemLevel = 16,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 17,
    max1 = 17,
    max2 = 17,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2021,24)->
    #equipAffixesCfg {
    iD = 817,
    affixID = 2021,
    name = "敏捷",
    affixLevel = 4,
    affixType = 4,
    conflict = 1,
    itemLevel = 24,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 26,
    max1 = 26,
    max2 = 26,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2021,32)->
    #equipAffixesCfg {
    iD = 818,
    affixID = 2021,
    name = "敏捷",
    affixLevel = 5,
    affixType = 4,
    conflict = 1,
    itemLevel = 32,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 39,
    max1 = 39,
    max2 = 39,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2021,40)->
    #equipAffixesCfg {
    iD = 819,
    affixID = 2021,
    name = "敏捷",
    affixLevel = 6,
    affixType = 4,
    conflict = 1,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 59,
    max1 = 59,
    max2 = 59,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2021,44)->
    #equipAffixesCfg {
    iD = 820,
    affixID = 2021,
    name = "敏捷",
    affixLevel = 7,
    affixType = 4,
    conflict = 1,
    itemLevel = 44,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 73,
    max1 = 73,
    max2 = 73,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2021,48)->
    #equipAffixesCfg {
    iD = 821,
    affixID = 2021,
    name = "敏捷",
    affixLevel = 8,
    affixType = 4,
    conflict = 1,
    itemLevel = 48,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 90,
    max1 = 90,
    max2 = 90,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2021,52)->
    #equipAffixesCfg {
    iD = 822,
    affixID = 2021,
    name = "敏捷",
    affixLevel = 9,
    affixType = 4,
    conflict = 1,
    itemLevel = 52,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 110,
    max1 = 110,
    max2 = 110,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2021,56)->
    #equipAffixesCfg {
    iD = 823,
    affixID = 2021,
    name = "敏捷",
    affixLevel = 10,
    affixType = 4,
    conflict = 1,
    itemLevel = 56,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 135,
    max1 = 135,
    max2 = 135,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2021,60)->
    #equipAffixesCfg {
    iD = 824,
    affixID = 2021,
    name = "敏捷",
    affixLevel = 11,
    affixType = 4,
    conflict = 1,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 166,
    max1 = 166,
    max2 = 166,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2021,64)->
    #equipAffixesCfg {
    iD = 825,
    affixID = 2021,
    name = "敏捷",
    affixLevel = 12,
    affixType = 4,
    conflict = 1,
    itemLevel = 64,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 204,
    max1 = 204,
    max2 = 204,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2021,68)->
    #equipAffixesCfg {
    iD = 826,
    affixID = 2021,
    name = "敏捷",
    affixLevel = 13,
    affixType = 4,
    conflict = 1,
    itemLevel = 68,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 251,
    max1 = 251,
    max2 = 251,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2021,72)->
    #equipAffixesCfg {
    iD = 827,
    affixID = 2021,
    name = "敏捷",
    affixLevel = 14,
    affixType = 4,
    conflict = 1,
    itemLevel = 72,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 308,
    max1 = 308,
    max2 = 308,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2021,76)->
    #equipAffixesCfg {
    iD = 828,
    affixID = 2021,
    name = "敏捷",
    affixLevel = 15,
    affixType = 4,
    conflict = 1,
    itemLevel = 76,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 2,
    min = 378,
    max1 = 378,
    max2 = 378,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2022,1)->
    #equipAffixesCfg {
    iD = 829,
    affixID = 2022,
    name = "智力",
    affixLevel = 1,
    affixType = 4,
    conflict = 1,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 8,
    max1 = 8,
    max2 = 8,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2022,8)->
    #equipAffixesCfg {
    iD = 830,
    affixID = 2022,
    name = "智力",
    affixLevel = 2,
    affixType = 4,
    conflict = 1,
    itemLevel = 8,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 11,
    max1 = 11,
    max2 = 11,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2022,16)->
    #equipAffixesCfg {
    iD = 831,
    affixID = 2022,
    name = "智力",
    affixLevel = 3,
    affixType = 4,
    conflict = 1,
    itemLevel = 16,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 17,
    max1 = 17,
    max2 = 17,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2022,24)->
    #equipAffixesCfg {
    iD = 832,
    affixID = 2022,
    name = "智力",
    affixLevel = 4,
    affixType = 4,
    conflict = 1,
    itemLevel = 24,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 26,
    max1 = 26,
    max2 = 26,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2022,32)->
    #equipAffixesCfg {
    iD = 833,
    affixID = 2022,
    name = "智力",
    affixLevel = 5,
    affixType = 4,
    conflict = 1,
    itemLevel = 32,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 39,
    max1 = 39,
    max2 = 39,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2022,40)->
    #equipAffixesCfg {
    iD = 834,
    affixID = 2022,
    name = "智力",
    affixLevel = 6,
    affixType = 4,
    conflict = 1,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 59,
    max1 = 59,
    max2 = 59,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2022,44)->
    #equipAffixesCfg {
    iD = 835,
    affixID = 2022,
    name = "智力",
    affixLevel = 7,
    affixType = 4,
    conflict = 1,
    itemLevel = 44,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 73,
    max1 = 73,
    max2 = 73,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2022,48)->
    #equipAffixesCfg {
    iD = 836,
    affixID = 2022,
    name = "智力",
    affixLevel = 8,
    affixType = 4,
    conflict = 1,
    itemLevel = 48,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 90,
    max1 = 90,
    max2 = 90,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2022,52)->
    #equipAffixesCfg {
    iD = 837,
    affixID = 2022,
    name = "智力",
    affixLevel = 9,
    affixType = 4,
    conflict = 1,
    itemLevel = 52,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 110,
    max1 = 110,
    max2 = 110,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2022,56)->
    #equipAffixesCfg {
    iD = 838,
    affixID = 2022,
    name = "智力",
    affixLevel = 10,
    affixType = 4,
    conflict = 1,
    itemLevel = 56,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 135,
    max1 = 135,
    max2 = 135,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2022,60)->
    #equipAffixesCfg {
    iD = 839,
    affixID = 2022,
    name = "智力",
    affixLevel = 6,
    affixType = 4,
    conflict = 1,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 166,
    max1 = 166,
    max2 = 166,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2022,64)->
    #equipAffixesCfg {
    iD = 840,
    affixID = 2022,
    name = "智力",
    affixLevel = 7,
    affixType = 4,
    conflict = 1,
    itemLevel = 64,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 204,
    max1 = 204,
    max2 = 204,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2022,68)->
    #equipAffixesCfg {
    iD = 841,
    affixID = 2022,
    name = "智力",
    affixLevel = 8,
    affixType = 4,
    conflict = 1,
    itemLevel = 68,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 251,
    max1 = 251,
    max2 = 251,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2022,72)->
    #equipAffixesCfg {
    iD = 842,
    affixID = 2022,
    name = "智力",
    affixLevel = 9,
    affixType = 4,
    conflict = 1,
    itemLevel = 72,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 308,
    max1 = 308,
    max2 = 308,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2022,76)->
    #equipAffixesCfg {
    iD = 843,
    affixID = 2022,
    name = "智力",
    affixLevel = 10,
    affixType = 4,
    conflict = 1,
    itemLevel = 76,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 3,
    min = 378,
    max1 = 378,
    max2 = 378,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2023,1)->
    #equipAffixesCfg {
    iD = 844,
    affixID = 2023,
    name = "体质",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 7,
    max1 = 7,
    max2 = 7,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2023,8)->
    #equipAffixesCfg {
    iD = 845,
    affixID = 2023,
    name = "体质",
    affixLevel = 2,
    affixType = 4,
    conflict = 0,
    itemLevel = 8,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 10,
    max1 = 10,
    max2 = 10,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2023,16)->
    #equipAffixesCfg {
    iD = 846,
    affixID = 2023,
    name = "体质",
    affixLevel = 3,
    affixType = 4,
    conflict = 0,
    itemLevel = 16,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 15,
    max1 = 15,
    max2 = 15,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2023,24)->
    #equipAffixesCfg {
    iD = 847,
    affixID = 2023,
    name = "体质",
    affixLevel = 4,
    affixType = 4,
    conflict = 0,
    itemLevel = 24,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 23,
    max1 = 23,
    max2 = 23,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2023,32)->
    #equipAffixesCfg {
    iD = 848,
    affixID = 2023,
    name = "体质",
    affixLevel = 5,
    affixType = 4,
    conflict = 0,
    itemLevel = 32,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 35,
    max1 = 35,
    max2 = 35,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2023,40)->
    #equipAffixesCfg {
    iD = 849,
    affixID = 2023,
    name = "体质",
    affixLevel = 6,
    affixType = 4,
    conflict = 0,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 53,
    max1 = 53,
    max2 = 53,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2023,44)->
    #equipAffixesCfg {
    iD = 850,
    affixID = 2023,
    name = "体质",
    affixLevel = 7,
    affixType = 4,
    conflict = 0,
    itemLevel = 44,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 65,
    max1 = 65,
    max2 = 65,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2023,48)->
    #equipAffixesCfg {
    iD = 851,
    affixID = 2023,
    name = "体质",
    affixLevel = 8,
    affixType = 4,
    conflict = 0,
    itemLevel = 48,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 81,
    max1 = 81,
    max2 = 81,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2023,52)->
    #equipAffixesCfg {
    iD = 852,
    affixID = 2023,
    name = "体质",
    affixLevel = 9,
    affixType = 4,
    conflict = 0,
    itemLevel = 52,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 99,
    max1 = 99,
    max2 = 99,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2023,56)->
    #equipAffixesCfg {
    iD = 853,
    affixID = 2023,
    name = "体质",
    affixLevel = 10,
    affixType = 4,
    conflict = 0,
    itemLevel = 56,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 122,
    max1 = 122,
    max2 = 122,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2023,60)->
    #equipAffixesCfg {
    iD = 854,
    affixID = 2023,
    name = "体质",
    affixLevel = 11,
    affixType = 4,
    conflict = 0,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 149,
    max1 = 149,
    max2 = 149,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2023,64)->
    #equipAffixesCfg {
    iD = 855,
    affixID = 2023,
    name = "体质",
    affixLevel = 12,
    affixType = 4,
    conflict = 0,
    itemLevel = 64,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 184,
    max1 = 184,
    max2 = 184,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2023,68)->
    #equipAffixesCfg {
    iD = 856,
    affixID = 2023,
    name = "体质",
    affixLevel = 13,
    affixType = 4,
    conflict = 0,
    itemLevel = 68,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 225,
    max1 = 225,
    max2 = 225,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2023,72)->
    #equipAffixesCfg {
    iD = 857,
    affixID = 2023,
    name = "体质",
    affixLevel = 14,
    affixType = 4,
    conflict = 0,
    itemLevel = 72,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 277,
    max1 = 277,
    max2 = 277,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2023,76)->
    #equipAffixesCfg {
    iD = 858,
    affixID = 2023,
    name = "体质",
    affixLevel = 15,
    affixType = 4,
    conflict = 0,
    itemLevel = 76,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 340,
    max1 = 340,
    max2 = 340,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2024,1)->
    #equipAffixesCfg {
    iD = 859,
    affixID = 2024,
    name = "暴击率",
    affixLevel = 1,
    affixType = 4,
    conflict = 5,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2024,8)->
    #equipAffixesCfg {
    iD = 860,
    affixID = 2024,
    name = "暴击率",
    affixLevel = 2,
    affixType = 4,
    conflict = 5,
    itemLevel = 8,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2024,16)->
    #equipAffixesCfg {
    iD = 861,
    affixID = 2024,
    name = "暴击率",
    affixLevel = 3,
    affixType = 4,
    conflict = 5,
    itemLevel = 16,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2024,24)->
    #equipAffixesCfg {
    iD = 862,
    affixID = 2024,
    name = "暴击率",
    affixLevel = 4,
    affixType = 4,
    conflict = 5,
    itemLevel = 24,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.045,
    max1 = 0.045,
    max2 = 0.045,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2024,32)->
    #equipAffixesCfg {
    iD = 863,
    affixID = 2024,
    name = "暴击率",
    affixLevel = 5,
    affixType = 4,
    conflict = 5,
    itemLevel = 32,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.055,
    max1 = 0.055,
    max2 = 0.055,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2024,40)->
    #equipAffixesCfg {
    iD = 864,
    affixID = 2024,
    name = "暴击率",
    affixLevel = 6,
    affixType = 4,
    conflict = 5,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.065,
    max1 = 0.065,
    max2 = 0.065,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2024,44)->
    #equipAffixesCfg {
    iD = 865,
    affixID = 2024,
    name = "暴击率",
    affixLevel = 7,
    affixType = 4,
    conflict = 5,
    itemLevel = 44,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.07,
    max1 = 0.07,
    max2 = 0.07,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2024,48)->
    #equipAffixesCfg {
    iD = 866,
    affixID = 2024,
    name = "暴击率",
    affixLevel = 8,
    affixType = 4,
    conflict = 5,
    itemLevel = 48,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.075,
    max1 = 0.075,
    max2 = 0.075,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2024,52)->
    #equipAffixesCfg {
    iD = 867,
    affixID = 2024,
    name = "暴击率",
    affixLevel = 9,
    affixType = 4,
    conflict = 5,
    itemLevel = 52,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2024,56)->
    #equipAffixesCfg {
    iD = 868,
    affixID = 2024,
    name = "暴击率",
    affixLevel = 10,
    affixType = 4,
    conflict = 5,
    itemLevel = 56,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.085,
    max1 = 0.085,
    max2 = 0.085,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2024,60)->
    #equipAffixesCfg {
    iD = 869,
    affixID = 2024,
    name = "暴击率",
    affixLevel = 11,
    affixType = 4,
    conflict = 5,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.09,
    max1 = 0.09,
    max2 = 0.09,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2024,64)->
    #equipAffixesCfg {
    iD = 870,
    affixID = 2024,
    name = "暴击率",
    affixLevel = 12,
    affixType = 4,
    conflict = 5,
    itemLevel = 64,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.095,
    max1 = 0.095,
    max2 = 0.095,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2024,68)->
    #equipAffixesCfg {
    iD = 871,
    affixID = 2024,
    name = "暴击率",
    affixLevel = 13,
    affixType = 4,
    conflict = 5,
    itemLevel = 68,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2024,72)->
    #equipAffixesCfg {
    iD = 872,
    affixID = 2024,
    name = "暴击率",
    affixLevel = 14,
    affixType = 4,
    conflict = 5,
    itemLevel = 72,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.105,
    max1 = 0.105,
    max2 = 0.105,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2024,76)->
    #equipAffixesCfg {
    iD = 873,
    affixID = 2024,
    name = "暴击率",
    affixLevel = 15,
    affixType = 4,
    conflict = 5,
    itemLevel = 76,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.11,
    max1 = 0.11,
    max2 = 0.11,
    mulityOrPlus = 0,
    weight = 1,
    dice = 4
    };
getRow(2025,1)->
    #equipAffixesCfg {
    iD = 874,
    affixID = 2025,
    name = "全防御_黄",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 27,
    max1 = 27,
    max2 = 27,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2025,8)->
    #equipAffixesCfg {
    iD = 875,
    affixID = 2025,
    name = "全防御_黄",
    affixLevel = 2,
    affixType = 4,
    conflict = 0,
    itemLevel = 8,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 39,
    max1 = 39,
    max2 = 39,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2025,16)->
    #equipAffixesCfg {
    iD = 876,
    affixID = 2025,
    name = "全防御_黄",
    affixLevel = 3,
    affixType = 4,
    conflict = 0,
    itemLevel = 16,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 59,
    max1 = 59,
    max2 = 59,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2025,24)->
    #equipAffixesCfg {
    iD = 877,
    affixID = 2025,
    name = "全防御_黄",
    affixLevel = 4,
    affixType = 4,
    conflict = 0,
    itemLevel = 24,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 89,
    max1 = 89,
    max2 = 89,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2025,32)->
    #equipAffixesCfg {
    iD = 878,
    affixID = 2025,
    name = "全防御_黄",
    affixLevel = 5,
    affixType = 4,
    conflict = 0,
    itemLevel = 32,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 135,
    max1 = 135,
    max2 = 135,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2025,40)->
    #equipAffixesCfg {
    iD = 879,
    affixID = 2025,
    name = "全防御_黄",
    affixLevel = 6,
    affixType = 4,
    conflict = 0,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 203,
    max1 = 203,
    max2 = 203,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2025,44)->
    #equipAffixesCfg {
    iD = 880,
    affixID = 2025,
    name = "全防御_黄",
    affixLevel = 7,
    affixType = 4,
    conflict = 0,
    itemLevel = 44,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 250,
    max1 = 250,
    max2 = 250,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2025,48)->
    #equipAffixesCfg {
    iD = 881,
    affixID = 2025,
    name = "全防御_黄",
    affixLevel = 8,
    affixType = 4,
    conflict = 0,
    itemLevel = 48,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 307,
    max1 = 307,
    max2 = 307,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2025,52)->
    #equipAffixesCfg {
    iD = 882,
    affixID = 2025,
    name = "全防御_黄",
    affixLevel = 9,
    affixType = 4,
    conflict = 0,
    itemLevel = 52,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 377,
    max1 = 377,
    max2 = 377,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2025,56)->
    #equipAffixesCfg {
    iD = 883,
    affixID = 2025,
    name = "全防御_黄",
    affixLevel = 10,
    affixType = 4,
    conflict = 0,
    itemLevel = 56,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 463,
    max1 = 463,
    max2 = 463,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2025,60)->
    #equipAffixesCfg {
    iD = 884,
    affixID = 2025,
    name = "全防御_黄",
    affixLevel = 11,
    affixType = 4,
    conflict = 0,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 568,
    max1 = 568,
    max2 = 568,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2025,64)->
    #equipAffixesCfg {
    iD = 885,
    affixID = 2025,
    name = "全防御_黄",
    affixLevel = 12,
    affixType = 4,
    conflict = 0,
    itemLevel = 64,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 697,
    max1 = 697,
    max2 = 697,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2025,68)->
    #equipAffixesCfg {
    iD = 886,
    affixID = 2025,
    name = "全防御_黄",
    affixLevel = 13,
    affixType = 4,
    conflict = 0,
    itemLevel = 68,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 856,
    max1 = 856,
    max2 = 856,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2025,72)->
    #equipAffixesCfg {
    iD = 887,
    affixID = 2025,
    name = "全防御_黄",
    affixLevel = 14,
    affixType = 4,
    conflict = 0,
    itemLevel = 72,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 1052,
    max1 = 1052,
    max2 = 1052,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2025,76)->
    #equipAffixesCfg {
    iD = 888,
    affixID = 2025,
    name = "全防御_黄",
    affixLevel = 15,
    affixType = 4,
    conflict = 0,
    itemLevel = 76,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 1291,
    max1 = 1291,
    max2 = 1291,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2026,1)->
    #equipAffixesCfg {
    iD = 889,
    affixID = 2026,
    name = "冷却速度_黄",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(2026,8)->
    #equipAffixesCfg {
    iD = 890,
    affixID = 2026,
    name = "冷却速度_黄",
    affixLevel = 2,
    affixType = 4,
    conflict = 0,
    itemLevel = 8,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(2026,16)->
    #equipAffixesCfg {
    iD = 891,
    affixID = 2026,
    name = "冷却速度_黄",
    affixLevel = 3,
    affixType = 4,
    conflict = 0,
    itemLevel = 16,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.045,
    max1 = 0.045,
    max2 = 0.045,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(2026,24)->
    #equipAffixesCfg {
    iD = 892,
    affixID = 2026,
    name = "冷却速度_黄",
    affixLevel = 4,
    affixType = 4,
    conflict = 0,
    itemLevel = 24,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.055,
    max1 = 0.055,
    max2 = 0.055,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(2026,32)->
    #equipAffixesCfg {
    iD = 893,
    affixID = 2026,
    name = "冷却速度_黄",
    affixLevel = 5,
    affixType = 4,
    conflict = 0,
    itemLevel = 32,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.065,
    max1 = 0.065,
    max2 = 0.065,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(2026,40)->
    #equipAffixesCfg {
    iD = 894,
    affixID = 2026,
    name = "冷却速度_黄",
    affixLevel = 6,
    affixType = 4,
    conflict = 0,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.075,
    max1 = 0.075,
    max2 = 0.075,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(2026,44)->
    #equipAffixesCfg {
    iD = 895,
    affixID = 2026,
    name = "冷却速度_黄",
    affixLevel = 7,
    affixType = 4,
    conflict = 0,
    itemLevel = 44,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(2026,48)->
    #equipAffixesCfg {
    iD = 896,
    affixID = 2026,
    name = "冷却速度_黄",
    affixLevel = 8,
    affixType = 4,
    conflict = 0,
    itemLevel = 48,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.085,
    max1 = 0.085,
    max2 = 0.085,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(2026,52)->
    #equipAffixesCfg {
    iD = 897,
    affixID = 2026,
    name = "冷却速度_黄",
    affixLevel = 9,
    affixType = 4,
    conflict = 0,
    itemLevel = 52,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.09,
    max1 = 0.09,
    max2 = 0.09,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(2026,56)->
    #equipAffixesCfg {
    iD = 898,
    affixID = 2026,
    name = "冷却速度_黄",
    affixLevel = 10,
    affixType = 4,
    conflict = 0,
    itemLevel = 56,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.095,
    max1 = 0.095,
    max2 = 0.095,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(2026,60)->
    #equipAffixesCfg {
    iD = 899,
    affixID = 2026,
    name = "冷却速度_黄",
    affixLevel = 11,
    affixType = 4,
    conflict = 0,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(2026,64)->
    #equipAffixesCfg {
    iD = 900,
    affixID = 2026,
    name = "冷却速度_黄",
    affixLevel = 12,
    affixType = 4,
    conflict = 0,
    itemLevel = 64,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.105,
    max1 = 0.105,
    max2 = 0.105,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(2026,68)->
    #equipAffixesCfg {
    iD = 901,
    affixID = 2026,
    name = "冷却速度_黄",
    affixLevel = 13,
    affixType = 4,
    conflict = 0,
    itemLevel = 68,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.11,
    max1 = 0.11,
    max2 = 0.11,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(2026,72)->
    #equipAffixesCfg {
    iD = 902,
    affixID = 2026,
    name = "冷却速度_黄",
    affixLevel = 14,
    affixType = 4,
    conflict = 0,
    itemLevel = 72,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.115,
    max1 = 0.115,
    max2 = 0.115,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(2026,76)->
    #equipAffixesCfg {
    iD = 903,
    affixID = 2026,
    name = "冷却速度_黄",
    affixLevel = 15,
    affixType = 4,
    conflict = 0,
    itemLevel = 76,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.12,
    max1 = 0.12,
    max2 = 0.12,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(2027,1)->
    #equipAffixesCfg {
    iD = 904,
    affixID = 2027,
    name = "药水效果_黄",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 17,
    max1 = 17,
    max2 = 17,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2027,8)->
    #equipAffixesCfg {
    iD = 905,
    affixID = 2027,
    name = "药水效果_黄",
    affixLevel = 2,
    affixType = 4,
    conflict = 0,
    itemLevel = 8,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 24,
    max1 = 24,
    max2 = 24,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2027,16)->
    #equipAffixesCfg {
    iD = 906,
    affixID = 2027,
    name = "药水效果_黄",
    affixLevel = 3,
    affixType = 4,
    conflict = 0,
    itemLevel = 16,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 37,
    max1 = 37,
    max2 = 37,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2027,24)->
    #equipAffixesCfg {
    iD = 907,
    affixID = 2027,
    name = "药水效果_黄",
    affixLevel = 4,
    affixType = 4,
    conflict = 0,
    itemLevel = 24,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 56,
    max1 = 56,
    max2 = 56,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2027,32)->
    #equipAffixesCfg {
    iD = 908,
    affixID = 2027,
    name = "药水效果_黄",
    affixLevel = 5,
    affixType = 4,
    conflict = 0,
    itemLevel = 32,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 85,
    max1 = 85,
    max2 = 85,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2027,40)->
    #equipAffixesCfg {
    iD = 909,
    affixID = 2027,
    name = "药水效果_黄",
    affixLevel = 6,
    affixType = 4,
    conflict = 0,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 128,
    max1 = 128,
    max2 = 128,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2027,44)->
    #equipAffixesCfg {
    iD = 910,
    affixID = 2027,
    name = "药水效果_黄",
    affixLevel = 7,
    affixType = 4,
    conflict = 0,
    itemLevel = 44,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 158,
    max1 = 158,
    max2 = 158,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2027,48)->
    #equipAffixesCfg {
    iD = 911,
    affixID = 2027,
    name = "药水效果_黄",
    affixLevel = 8,
    affixType = 4,
    conflict = 0,
    itemLevel = 48,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 194,
    max1 = 194,
    max2 = 194,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2027,52)->
    #equipAffixesCfg {
    iD = 912,
    affixID = 2027,
    name = "药水效果_黄",
    affixLevel = 9,
    affixType = 4,
    conflict = 0,
    itemLevel = 52,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 238,
    max1 = 238,
    max2 = 238,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2027,56)->
    #equipAffixesCfg {
    iD = 913,
    affixID = 2027,
    name = "药水效果_黄",
    affixLevel = 10,
    affixType = 4,
    conflict = 0,
    itemLevel = 56,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 293,
    max1 = 293,
    max2 = 293,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2027,60)->
    #equipAffixesCfg {
    iD = 914,
    affixID = 2027,
    name = "药水效果_黄",
    affixLevel = 11,
    affixType = 4,
    conflict = 0,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 359,
    max1 = 359,
    max2 = 359,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2027,64)->
    #equipAffixesCfg {
    iD = 915,
    affixID = 2027,
    name = "药水效果_黄",
    affixLevel = 12,
    affixType = 4,
    conflict = 0,
    itemLevel = 64,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 441,
    max1 = 441,
    max2 = 441,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2027,68)->
    #equipAffixesCfg {
    iD = 916,
    affixID = 2027,
    name = "药水效果_黄",
    affixLevel = 13,
    affixType = 4,
    conflict = 0,
    itemLevel = 68,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 542,
    max1 = 542,
    max2 = 542,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2027,72)->
    #equipAffixesCfg {
    iD = 917,
    affixID = 2027,
    name = "药水效果_黄",
    affixLevel = 14,
    affixType = 4,
    conflict = 0,
    itemLevel = 72,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 665,
    max1 = 665,
    max2 = 665,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2027,76)->
    #equipAffixesCfg {
    iD = 918,
    affixID = 2027,
    name = "药水效果_黄",
    affixLevel = 15,
    affixType = 4,
    conflict = 0,
    itemLevel = 76,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 6,
    min = 817,
    max1 = 817,
    max2 = 817,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2028,32)->
    #equipAffixesCfg {
    iD = 919,
    affixID = 2028,
    name = "反弹伤害",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 32,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 35,
    max1 = 35,
    max2 = 35,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2028,40)->
    #equipAffixesCfg {
    iD = 920,
    affixID = 2028,
    name = "反弹伤害",
    affixLevel = 2,
    affixType = 4,
    conflict = 0,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 53,
    max1 = 53,
    max2 = 53,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2028,44)->
    #equipAffixesCfg {
    iD = 921,
    affixID = 2028,
    name = "反弹伤害",
    affixLevel = 3,
    affixType = 4,
    conflict = 0,
    itemLevel = 44,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 65,
    max1 = 65,
    max2 = 65,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2028,48)->
    #equipAffixesCfg {
    iD = 922,
    affixID = 2028,
    name = "反弹伤害",
    affixLevel = 4,
    affixType = 4,
    conflict = 0,
    itemLevel = 48,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 81,
    max1 = 81,
    max2 = 81,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2028,52)->
    #equipAffixesCfg {
    iD = 923,
    affixID = 2028,
    name = "反弹伤害",
    affixLevel = 5,
    affixType = 4,
    conflict = 0,
    itemLevel = 52,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 99,
    max1 = 99,
    max2 = 99,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2028,56)->
    #equipAffixesCfg {
    iD = 924,
    affixID = 2028,
    name = "反弹伤害",
    affixLevel = 6,
    affixType = 4,
    conflict = 0,
    itemLevel = 56,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 122,
    max1 = 122,
    max2 = 122,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2028,60)->
    #equipAffixesCfg {
    iD = 925,
    affixID = 2028,
    name = "反弹伤害",
    affixLevel = 7,
    affixType = 4,
    conflict = 0,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 149,
    max1 = 149,
    max2 = 149,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2028,64)->
    #equipAffixesCfg {
    iD = 926,
    affixID = 2028,
    name = "反弹伤害",
    affixLevel = 8,
    affixType = 4,
    conflict = 0,
    itemLevel = 64,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 184,
    max1 = 184,
    max2 = 184,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2028,68)->
    #equipAffixesCfg {
    iD = 927,
    affixID = 2028,
    name = "反弹伤害",
    affixLevel = 9,
    affixType = 4,
    conflict = 0,
    itemLevel = 68,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 225,
    max1 = 225,
    max2 = 225,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2028,72)->
    #equipAffixesCfg {
    iD = 928,
    affixID = 2028,
    name = "反弹伤害",
    affixLevel = 10,
    affixType = 4,
    conflict = 0,
    itemLevel = 72,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 277,
    max1 = 277,
    max2 = 277,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(2028,76)->
    #equipAffixesCfg {
    iD = 929,
    affixID = 2028,
    name = "反弹伤害",
    affixLevel = 11,
    affixType = 4,
    conflict = 0,
    itemLevel = 76,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 41,
    min = 340,
    max1 = 340,
    max2 = 340,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3000,40)->
    #equipAffixesCfg {
    iD = 930,
    affixID = 3000,
    name = "觉醒持续时间",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 40,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 106,
    min = 0.02,
    max1 = 0.02,
    max2 = 0.02,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3000,50)->
    #equipAffixesCfg {
    iD = 931,
    affixID = 3000,
    name = "觉醒持续时间",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 50,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 106,
    min = 0.03,
    max1 = 0.03,
    max2 = 0.03,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3000,60)->
    #equipAffixesCfg {
    iD = 932,
    affixID = 3000,
    name = "觉醒持续时间",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 60,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 106,
    min = 0.05,
    max1 = 0.05,
    max2 = 0.05,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3001,1)->
    #equipAffixesCfg {
    iD = 933,
    affixID = 3001,
    name = "觉醒持续时间",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 106,
    min = 0.02,
    max1 = 0.02,
    max2 = 0.02,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3002,1)->
    #equipAffixesCfg {
    iD = 934,
    affixID = 3002,
    name = "觉醒持续时间",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 106,
    min = 0.03,
    max1 = 0.03,
    max2 = 0.03,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3003,1)->
    #equipAffixesCfg {
    iD = 935,
    affixID = 3003,
    name = "觉醒持续时间",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 106,
    min = 0.05,
    max1 = 0.05,
    max2 = 0.05,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3004,1)->
    #equipAffixesCfg {
    iD = 936,
    affixID = 3004,
    name = "觉醒持续时间",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 106,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3005,1)->
    #equipAffixesCfg {
    iD = 937,
    affixID = 3005,
    name = "觉醒持续时间",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 106,
    min = 0.15,
    max1 = 0.15,
    max2 = 0.15,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3006,1)->
    #equipAffixesCfg {
    iD = 938,
    affixID = 3006,
    name = "65级_力量_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 1,
    min = 300,
    max1 = 300,
    max2 = 300,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3007,1)->
    #equipAffixesCfg {
    iD = 939,
    affixID = 3007,
    name = "65级_体质_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 300,
    max1 = 300,
    max2 = 300,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3008,1)->
    #equipAffixesCfg {
    iD = 940,
    affixID = 3008,
    name = "65级_智力_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 3,
    min = 300,
    max1 = 300,
    max2 = 300,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3009,1)->
    #equipAffixesCfg {
    iD = 941,
    affixID = 3009,
    name = "65级_敏捷_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 2,
    min = 300,
    max1 = 300,
    max2 = 300,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3010,1)->
    #equipAffixesCfg {
    iD = 942,
    affixID = 3010,
    name = "65级_物理伤害_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 200,
    max1 = 200,
    max2 = 200,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3011,1)->
    #equipAffixesCfg {
    iD = 943,
    affixID = 3011,
    name = "65级_神圣伤害_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 30,
    min = 200,
    max1 = 200,
    max2 = 200,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3012,1)->
    #equipAffixesCfg {
    iD = 944,
    affixID = 3012,
    name = "65级_元素伤害_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 33,
    min = 200,
    max1 = 200,
    max2 = 200,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3013,1)->
    #equipAffixesCfg {
    iD = 945,
    affixID = 3013,
    name = "65级_暗影伤害_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 32,
    min = 200,
    max1 = 200,
    max2 = 200,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3014,1)->
    #equipAffixesCfg {
    iD = 946,
    affixID = 3014,
    name = "65级_全防御_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 800,
    max1 = 800,
    max2 = 800,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3015,1)->
    #equipAffixesCfg {
    iD = 947,
    affixID = 3015,
    name = "65级_物理防御_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 1200,
    max1 = 1200,
    max2 = 1200,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3016,1)->
    #equipAffixesCfg {
    iD = 948,
    affixID = 3016,
    name = "65级_魔法防御_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 1200,
    max1 = 1200,
    max2 = 1200,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3017,1)->
    #equipAffixesCfg {
    iD = 949,
    affixID = 3017,
    name = "65级_生命上限_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 18,
    min = 1000,
    max1 = 1000,
    max2 = 1000,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3018,1)->
    #equipAffixesCfg {
    iD = 950,
    affixID = 3018,
    name = "65级_绝对伤害_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 115,
    min = 300,
    max1 = 300,
    max2 = 300,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3019,1)->
    #equipAffixesCfg {
    iD = 951,
    affixID = 3019,
    name = "65级_绝对防御_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 116,
    min = 100,
    max1 = 100,
    max2 = 100,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3020,1)->
    #equipAffixesCfg {
    iD = 952,
    affixID = 3020,
    name = "65级_冷却速度_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.05,
    max1 = 0.05,
    max2 = 0.05,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3021,1)->
    #equipAffixesCfg {
    iD = 953,
    affixID = 3021,
    name = "65级_觉醒持续时间_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 106,
    min = 0.02,
    max1 = 0.02,
    max2 = 0.02,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3022,1)->
    #equipAffixesCfg {
    iD = 954,
    affixID = 3022,
    name = "65级_暴击率_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3023,1)->
    #equipAffixesCfg {
    iD = 955,
    affixID = 3023,
    name = "65级_暴击伤害_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 36,
    min = 0.35,
    max1 = 0.35,
    max2 = 0.35,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3024,1)->
    #equipAffixesCfg {
    iD = 956,
    affixID = 3024,
    name = "65级_暴击豁免_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 117,
    min = 0.01,
    max1 = 0.01,
    max2 = 0.01,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3025,1)->
    #equipAffixesCfg {
    iD = 957,
    affixID = 3025,
    name = "65级_暴伤减免_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 118,
    min = 0.05,
    max1 = 0.05,
    max2 = 0.05,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3026,1)->
    #equipAffixesCfg {
    iD = 958,
    affixID = 3026,
    name = "65级_眩晕豁免_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 119,
    min = 0.01,
    max1 = 0.01,
    max2 = 0.01,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3027,1)->
    #equipAffixesCfg {
    iD = 959,
    affixID = 3027,
    name = "65级_冰冻豁免_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 120,
    min = 0.01,
    max1 = 0.01,
    max2 = 0.01,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3028,1)->
    #equipAffixesCfg {
    iD = 960,
    affixID = 3028,
    name = "65级_减速豁免_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 121,
    min = 0.01,
    max1 = 0.01,
    max2 = 0.01,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3029,1)->
    #equipAffixesCfg {
    iD = 961,
    affixID = 3029,
    name = "65级_眩晕概率_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 122,
    min = 0.01,
    max1 = 0.01,
    max2 = 0.01,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3030,1)->
    #equipAffixesCfg {
    iD = 962,
    affixID = 3030,
    name = "65级_冰冻概率_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 123,
    min = 0.01,
    max1 = 0.01,
    max2 = 0.01,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3031,1)->
    #equipAffixesCfg {
    iD = 963,
    affixID = 3031,
    name = "65级_减速概率_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 124,
    min = 0.01,
    max1 = 0.01,
    max2 = 0.01,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3032,1)->
    #equipAffixesCfg {
    iD = 964,
    affixID = 3032,
    name = "65级_力量_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 1,
    min = 360,
    max1 = 360,
    max2 = 360,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3033,1)->
    #equipAffixesCfg {
    iD = 965,
    affixID = 3033,
    name = "65级_体质_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 360,
    max1 = 360,
    max2 = 360,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3034,1)->
    #equipAffixesCfg {
    iD = 966,
    affixID = 3034,
    name = "65级_智力_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 3,
    min = 360,
    max1 = 360,
    max2 = 360,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3035,1)->
    #equipAffixesCfg {
    iD = 967,
    affixID = 3035,
    name = "65级_敏捷_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 2,
    min = 360,
    max1 = 360,
    max2 = 360,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3036,1)->
    #equipAffixesCfg {
    iD = 968,
    affixID = 3036,
    name = "65级_物理伤害_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 240,
    max1 = 240,
    max2 = 240,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3037,1)->
    #equipAffixesCfg {
    iD = 969,
    affixID = 3037,
    name = "65级_神圣伤害_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 30,
    min = 240,
    max1 = 240,
    max2 = 240,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3038,1)->
    #equipAffixesCfg {
    iD = 970,
    affixID = 3038,
    name = "65级_元素伤害_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 33,
    min = 240,
    max1 = 240,
    max2 = 240,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3039,1)->
    #equipAffixesCfg {
    iD = 971,
    affixID = 3039,
    name = "65级_暗影伤害_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 32,
    min = 240,
    max1 = 240,
    max2 = 240,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3040,1)->
    #equipAffixesCfg {
    iD = 972,
    affixID = 3040,
    name = "65级_全防御_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 960,
    max1 = 960,
    max2 = 960,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3041,1)->
    #equipAffixesCfg {
    iD = 973,
    affixID = 3041,
    name = "65级_物理防御_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 1440,
    max1 = 1440,
    max2 = 1440,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3042,1)->
    #equipAffixesCfg {
    iD = 974,
    affixID = 3042,
    name = "65级_魔法防御_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 1440,
    max1 = 1440,
    max2 = 1440,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3043,1)->
    #equipAffixesCfg {
    iD = 975,
    affixID = 3043,
    name = "65级_生命上限_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 18,
    min = 1500,
    max1 = 1500,
    max2 = 1500,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3044,1)->
    #equipAffixesCfg {
    iD = 976,
    affixID = 3044,
    name = "65级_绝对伤害_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 115,
    min = 360,
    max1 = 360,
    max2 = 360,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3045,1)->
    #equipAffixesCfg {
    iD = 977,
    affixID = 3045,
    name = "65级_绝对防御_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 116,
    min = 120,
    max1 = 120,
    max2 = 120,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3046,1)->
    #equipAffixesCfg {
    iD = 978,
    affixID = 3046,
    name = "65级_冷却速度_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.07,
    max1 = 0.07,
    max2 = 0.07,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3047,1)->
    #equipAffixesCfg {
    iD = 979,
    affixID = 3047,
    name = "65级_觉醒持续时间_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 106,
    min = 0.05,
    max1 = 0.05,
    max2 = 0.05,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3048,1)->
    #equipAffixesCfg {
    iD = 980,
    affixID = 3048,
    name = "65级_暴击率_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3049,1)->
    #equipAffixesCfg {
    iD = 981,
    affixID = 3049,
    name = "65级_暴击伤害_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 36,
    min = 0.35,
    max1 = 0.35,
    max2 = 0.35,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3050,1)->
    #equipAffixesCfg {
    iD = 982,
    affixID = 3050,
    name = "65级_暴击豁免_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 117,
    min = 0.02,
    max1 = 0.02,
    max2 = 0.02,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3051,1)->
    #equipAffixesCfg {
    iD = 983,
    affixID = 3051,
    name = "65级_暴伤减免_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 118,
    min = 0.07,
    max1 = 0.07,
    max2 = 0.07,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3052,1)->
    #equipAffixesCfg {
    iD = 984,
    affixID = 3052,
    name = "65级_眩晕豁免_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 119,
    min = 0.02,
    max1 = 0.02,
    max2 = 0.02,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3053,1)->
    #equipAffixesCfg {
    iD = 985,
    affixID = 3053,
    name = "65级_冰冻豁免_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 120,
    min = 0.02,
    max1 = 0.02,
    max2 = 0.02,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3054,1)->
    #equipAffixesCfg {
    iD = 986,
    affixID = 3054,
    name = "65级_减速豁免_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 121,
    min = 0.02,
    max1 = 0.02,
    max2 = 0.02,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3055,1)->
    #equipAffixesCfg {
    iD = 987,
    affixID = 3055,
    name = "65级_眩晕概率_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 122,
    min = 0.02,
    max1 = 0.02,
    max2 = 0.02,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3056,1)->
    #equipAffixesCfg {
    iD = 988,
    affixID = 3056,
    name = "65级_冰冻概率_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 123,
    min = 0.02,
    max1 = 0.02,
    max2 = 0.02,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3057,1)->
    #equipAffixesCfg {
    iD = 989,
    affixID = 3057,
    name = "65级_减速概率_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 124,
    min = 0.02,
    max1 = 0.02,
    max2 = 0.02,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3058,1)->
    #equipAffixesCfg {
    iD = 990,
    affixID = 3058,
    name = "70级_力量_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 1,
    min = 432,
    max1 = 432,
    max2 = 432,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3059,1)->
    #equipAffixesCfg {
    iD = 991,
    affixID = 3059,
    name = "70级_体质_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 432,
    max1 = 432,
    max2 = 432,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3060,1)->
    #equipAffixesCfg {
    iD = 992,
    affixID = 3060,
    name = "70级_智力_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 3,
    min = 432,
    max1 = 432,
    max2 = 432,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3061,1)->
    #equipAffixesCfg {
    iD = 993,
    affixID = 3061,
    name = "70级_敏捷_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 2,
    min = 432,
    max1 = 432,
    max2 = 432,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3062,1)->
    #equipAffixesCfg {
    iD = 994,
    affixID = 3062,
    name = "70级_物理伤害_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 288,
    max1 = 288,
    max2 = 288,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3063,1)->
    #equipAffixesCfg {
    iD = 995,
    affixID = 3063,
    name = "70级_神圣伤害_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 30,
    min = 288,
    max1 = 288,
    max2 = 288,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3064,1)->
    #equipAffixesCfg {
    iD = 996,
    affixID = 3064,
    name = "70级_元素伤害_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 33,
    min = 288,
    max1 = 288,
    max2 = 288,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3065,1)->
    #equipAffixesCfg {
    iD = 997,
    affixID = 3065,
    name = "70级_暗影伤害_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 32,
    min = 288,
    max1 = 288,
    max2 = 288,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3066,1)->
    #equipAffixesCfg {
    iD = 998,
    affixID = 3066,
    name = "70级_全防御_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 1152,
    max1 = 1152,
    max2 = 1152,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3067,1)->
    #equipAffixesCfg {
    iD = 999,
    affixID = 3067,
    name = "70级_物理防御_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 1728,
    max1 = 1728,
    max2 = 1728,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3068,1)->
    #equipAffixesCfg {
    iD = 1000,
    affixID = 3068,
    name = "70级_魔法防御_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 1728,
    max1 = 1728,
    max2 = 1728,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3069,1)->
    #equipAffixesCfg {
    iD = 1001,
    affixID = 3069,
    name = "70级_生命上限_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 18,
    min = 2000,
    max1 = 2000,
    max2 = 2000,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3070,1)->
    #equipAffixesCfg {
    iD = 1002,
    affixID = 3070,
    name = "70级_绝对伤害_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 115,
    min = 432,
    max1 = 432,
    max2 = 432,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3071,1)->
    #equipAffixesCfg {
    iD = 1003,
    affixID = 3071,
    name = "70级_绝对防御_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 116,
    min = 144,
    max1 = 144,
    max2 = 144,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3072,1)->
    #equipAffixesCfg {
    iD = 1004,
    affixID = 3072,
    name = "70级_冷却速度_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.09,
    max1 = 0.09,
    max2 = 0.09,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3073,1)->
    #equipAffixesCfg {
    iD = 1005,
    affixID = 3073,
    name = "70级_觉醒持续时间_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 106,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3074,1)->
    #equipAffixesCfg {
    iD = 1006,
    affixID = 3074,
    name = "70级_暴击率_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3075,1)->
    #equipAffixesCfg {
    iD = 1007,
    affixID = 3075,
    name = "70级_暴击伤害_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 36,
    min = 0.35,
    max1 = 0.35,
    max2 = 0.35,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3076,1)->
    #equipAffixesCfg {
    iD = 1008,
    affixID = 3076,
    name = "70级_暴击豁免_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 117,
    min = 0.03,
    max1 = 0.03,
    max2 = 0.03,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3077,1)->
    #equipAffixesCfg {
    iD = 1009,
    affixID = 3077,
    name = "70级_暴伤减免_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 118,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3078,1)->
    #equipAffixesCfg {
    iD = 1010,
    affixID = 3078,
    name = "70级_眩晕豁免_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 119,
    min = 0.03,
    max1 = 0.03,
    max2 = 0.03,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3079,1)->
    #equipAffixesCfg {
    iD = 1011,
    affixID = 3079,
    name = "70级_冰冻豁免_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 120,
    min = 0.03,
    max1 = 0.03,
    max2 = 0.03,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3080,1)->
    #equipAffixesCfg {
    iD = 1012,
    affixID = 3080,
    name = "70级_减速豁免_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 121,
    min = 0.03,
    max1 = 0.03,
    max2 = 0.03,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3081,1)->
    #equipAffixesCfg {
    iD = 1013,
    affixID = 3081,
    name = "70级_眩晕概率_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 122,
    min = 0.03,
    max1 = 0.03,
    max2 = 0.03,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3082,1)->
    #equipAffixesCfg {
    iD = 1014,
    affixID = 3082,
    name = "70级_冰冻概率_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 123,
    min = 0.03,
    max1 = 0.03,
    max2 = 0.03,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3083,1)->
    #equipAffixesCfg {
    iD = 1015,
    affixID = 3083,
    name = "70级_减速概率_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 124,
    min = 0.03,
    max1 = 0.03,
    max2 = 0.03,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3084,1)->
    #equipAffixesCfg {
    iD = 1016,
    affixID = 3084,
    name = "70级_力量_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 1,
    min = 518,
    max1 = 518,
    max2 = 518,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3085,1)->
    #equipAffixesCfg {
    iD = 1017,
    affixID = 3085,
    name = "70级_体质_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 518,
    max1 = 518,
    max2 = 518,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3086,1)->
    #equipAffixesCfg {
    iD = 1018,
    affixID = 3086,
    name = "70级_智力_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 3,
    min = 518,
    max1 = 518,
    max2 = 518,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3087,1)->
    #equipAffixesCfg {
    iD = 1019,
    affixID = 3087,
    name = "70级_敏捷_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 2,
    min = 518,
    max1 = 518,
    max2 = 518,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3088,1)->
    #equipAffixesCfg {
    iD = 1020,
    affixID = 3088,
    name = "70级_物理伤害_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 345,
    max1 = 345,
    max2 = 345,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3089,1)->
    #equipAffixesCfg {
    iD = 1021,
    affixID = 3089,
    name = "70级_神圣伤害_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 30,
    min = 345,
    max1 = 345,
    max2 = 345,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3090,1)->
    #equipAffixesCfg {
    iD = 1022,
    affixID = 3090,
    name = "70级_元素伤害_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 33,
    min = 345,
    max1 = 345,
    max2 = 345,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3091,1)->
    #equipAffixesCfg {
    iD = 1023,
    affixID = 3091,
    name = "70级_暗影伤害_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 32,
    min = 345,
    max1 = 345,
    max2 = 345,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3092,1)->
    #equipAffixesCfg {
    iD = 1024,
    affixID = 3092,
    name = "70级_全防御_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 1382,
    max1 = 1382,
    max2 = 1382,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3093,1)->
    #equipAffixesCfg {
    iD = 1025,
    affixID = 3093,
    name = "70级_物理防御_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 2073,
    max1 = 2073,
    max2 = 2073,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3094,1)->
    #equipAffixesCfg {
    iD = 1026,
    affixID = 3094,
    name = "70级_魔法防御_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 2073,
    max1 = 2073,
    max2 = 2073,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3095,1)->
    #equipAffixesCfg {
    iD = 1027,
    affixID = 3095,
    name = "70级_生命上限_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 18,
    min = 3000,
    max1 = 3000,
    max2 = 3000,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3096,1)->
    #equipAffixesCfg {
    iD = 1028,
    affixID = 3096,
    name = "70级_绝对伤害_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 115,
    min = 518,
    max1 = 518,
    max2 = 518,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3097,1)->
    #equipAffixesCfg {
    iD = 1029,
    affixID = 3097,
    name = "70级_绝对防御_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 116,
    min = 172,
    max1 = 172,
    max2 = 172,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3098,1)->
    #equipAffixesCfg {
    iD = 1030,
    affixID = 3098,
    name = "70级_冷却速度_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3099,1)->
    #equipAffixesCfg {
    iD = 1031,
    affixID = 3099,
    name = "70级_觉醒持续时间_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 106,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3100,1)->
    #equipAffixesCfg {
    iD = 1032,
    affixID = 3100,
    name = "70级_暴击率_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3101,1)->
    #equipAffixesCfg {
    iD = 1033,
    affixID = 3101,
    name = "70级_暴击伤害_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 36,
    min = 0.35,
    max1 = 0.35,
    max2 = 0.35,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3102,1)->
    #equipAffixesCfg {
    iD = 1034,
    affixID = 3102,
    name = "70级_暴击豁免_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 117,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3103,1)->
    #equipAffixesCfg {
    iD = 1035,
    affixID = 3103,
    name = "70级_暴伤减免_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 118,
    min = 0.12,
    max1 = 0.12,
    max2 = 0.12,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3104,1)->
    #equipAffixesCfg {
    iD = 1036,
    affixID = 3104,
    name = "70级_眩晕豁免_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 119,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3105,1)->
    #equipAffixesCfg {
    iD = 1037,
    affixID = 3105,
    name = "70级_冰冻豁免_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 120,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3106,1)->
    #equipAffixesCfg {
    iD = 1038,
    affixID = 3106,
    name = "70级_减速豁免_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 121,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3107,1)->
    #equipAffixesCfg {
    iD = 1039,
    affixID = 3107,
    name = "70级_眩晕概率_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 122,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3108,1)->
    #equipAffixesCfg {
    iD = 1040,
    affixID = 3108,
    name = "70级_冰冻概率_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 123,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3109,1)->
    #equipAffixesCfg {
    iD = 1041,
    affixID = 3109,
    name = "70级_减速概率_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 124,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3110,1)->
    #equipAffixesCfg {
    iD = 1042,
    affixID = 3110,
    name = "70级_力量_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 1,
    min = 622,
    max1 = 622,
    max2 = 622,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3111,1)->
    #equipAffixesCfg {
    iD = 1043,
    affixID = 3111,
    name = "70级_体质_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 622,
    max1 = 622,
    max2 = 622,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3112,1)->
    #equipAffixesCfg {
    iD = 1044,
    affixID = 3112,
    name = "70级_智力_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 3,
    min = 622,
    max1 = 622,
    max2 = 622,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3113,1)->
    #equipAffixesCfg {
    iD = 1045,
    affixID = 3113,
    name = "70级_敏捷_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 2,
    min = 622,
    max1 = 622,
    max2 = 622,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3114,1)->
    #equipAffixesCfg {
    iD = 1046,
    affixID = 3114,
    name = "70级_物理伤害_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 414,
    max1 = 414,
    max2 = 414,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3115,1)->
    #equipAffixesCfg {
    iD = 1047,
    affixID = 3115,
    name = "70级_神圣伤害_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 30,
    min = 414,
    max1 = 414,
    max2 = 414,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3116,1)->
    #equipAffixesCfg {
    iD = 1048,
    affixID = 3116,
    name = "70级_元素伤害_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 33,
    min = 414,
    max1 = 414,
    max2 = 414,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3117,1)->
    #equipAffixesCfg {
    iD = 1049,
    affixID = 3117,
    name = "70级_暗影伤害_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 32,
    min = 414,
    max1 = 414,
    max2 = 414,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3118,1)->
    #equipAffixesCfg {
    iD = 1050,
    affixID = 3118,
    name = "70级_全防御_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 1658,
    max1 = 1658,
    max2 = 1658,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3119,1)->
    #equipAffixesCfg {
    iD = 1051,
    affixID = 3119,
    name = "70级_物理防御_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 2488,
    max1 = 2488,
    max2 = 2488,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3120,1)->
    #equipAffixesCfg {
    iD = 1052,
    affixID = 3120,
    name = "70级_魔法防御_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 2488,
    max1 = 2488,
    max2 = 2488,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3121,1)->
    #equipAffixesCfg {
    iD = 1053,
    affixID = 3121,
    name = "70级_生命上限_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 18,
    min = 5000,
    max1 = 5000,
    max2 = 5000,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3122,1)->
    #equipAffixesCfg {
    iD = 1054,
    affixID = 3122,
    name = "70级_绝对伤害_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 115,
    min = 622,
    max1 = 622,
    max2 = 622,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3123,1)->
    #equipAffixesCfg {
    iD = 1055,
    affixID = 3123,
    name = "70级_绝对防御_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 116,
    min = 207,
    max1 = 207,
    max2 = 207,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3124,1)->
    #equipAffixesCfg {
    iD = 1056,
    affixID = 3124,
    name = "70级_冷却速度_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.12,
    max1 = 0.12,
    max2 = 0.12,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3125,1)->
    #equipAffixesCfg {
    iD = 1057,
    affixID = 3125,
    name = "70级_觉醒持续时间_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 106,
    min = 0.15,
    max1 = 0.15,
    max2 = 0.15,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3126,1)->
    #equipAffixesCfg {
    iD = 1058,
    affixID = 3126,
    name = "70级_暴击率_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3127,1)->
    #equipAffixesCfg {
    iD = 1059,
    affixID = 3127,
    name = "70级_暴击伤害_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 36,
    min = 0.35,
    max1 = 0.35,
    max2 = 0.35,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3128,1)->
    #equipAffixesCfg {
    iD = 1060,
    affixID = 3128,
    name = "70级_暴击豁免_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 117,
    min = 0.05,
    max1 = 0.05,
    max2 = 0.05,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3129,1)->
    #equipAffixesCfg {
    iD = 1061,
    affixID = 3129,
    name = "70级_暴伤减免_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 118,
    min = 0.15,
    max1 = 0.15,
    max2 = 0.15,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3130,1)->
    #equipAffixesCfg {
    iD = 1062,
    affixID = 3130,
    name = "70级_眩晕豁免_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 119,
    min = 0.05,
    max1 = 0.05,
    max2 = 0.05,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3131,1)->
    #equipAffixesCfg {
    iD = 1063,
    affixID = 3131,
    name = "70级_冰冻豁免_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 120,
    min = 0.05,
    max1 = 0.05,
    max2 = 0.05,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3132,1)->
    #equipAffixesCfg {
    iD = 1064,
    affixID = 3132,
    name = "70级_减速豁免_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 121,
    min = 0.05,
    max1 = 0.05,
    max2 = 0.05,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3133,1)->
    #equipAffixesCfg {
    iD = 1065,
    affixID = 3133,
    name = "70级_眩晕概率_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 122,
    min = 0.05,
    max1 = 0.05,
    max2 = 0.05,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3134,1)->
    #equipAffixesCfg {
    iD = 1066,
    affixID = 3134,
    name = "70级_冰冻概率_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 123,
    min = 0.05,
    max1 = 0.05,
    max2 = 0.05,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3135,1)->
    #equipAffixesCfg {
    iD = 1067,
    affixID = 3135,
    name = "70级_减速概率_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 124,
    min = 0.05,
    max1 = 0.05,
    max2 = 0.05,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3136,1)->
    #equipAffixesCfg {
    iD = 1068,
    affixID = 3136,
    name = "70级_力量_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 1,
    min = 746,
    max1 = 746,
    max2 = 746,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3137,1)->
    #equipAffixesCfg {
    iD = 1069,
    affixID = 3137,
    name = "70级_体质_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 746,
    max1 = 746,
    max2 = 746,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3138,1)->
    #equipAffixesCfg {
    iD = 1070,
    affixID = 3138,
    name = "70级_智力_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 3,
    min = 746,
    max1 = 746,
    max2 = 746,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3139,1)->
    #equipAffixesCfg {
    iD = 1071,
    affixID = 3139,
    name = "70级_敏捷_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 2,
    min = 746,
    max1 = 746,
    max2 = 746,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3140,1)->
    #equipAffixesCfg {
    iD = 1072,
    affixID = 3140,
    name = "70级_物理伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 496,
    max1 = 496,
    max2 = 496,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3141,1)->
    #equipAffixesCfg {
    iD = 1073,
    affixID = 3141,
    name = "70级_神圣伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 30,
    min = 496,
    max1 = 496,
    max2 = 496,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3142,1)->
    #equipAffixesCfg {
    iD = 1074,
    affixID = 3142,
    name = "70级_元素伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 33,
    min = 496,
    max1 = 496,
    max2 = 496,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3143,1)->
    #equipAffixesCfg {
    iD = 1075,
    affixID = 3143,
    name = "70级_暗影伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 32,
    min = 496,
    max1 = 496,
    max2 = 496,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3144,1)->
    #equipAffixesCfg {
    iD = 1076,
    affixID = 3144,
    name = "70级_全防御_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 1989,
    max1 = 1989,
    max2 = 1989,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3145,1)->
    #equipAffixesCfg {
    iD = 1077,
    affixID = 3145,
    name = "70级_物理防御_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 2985,
    max1 = 2985,
    max2 = 2985,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3146,1)->
    #equipAffixesCfg {
    iD = 1078,
    affixID = 3146,
    name = "70级_魔法防御_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 2985,
    max1 = 2985,
    max2 = 2985,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3147,1)->
    #equipAffixesCfg {
    iD = 1079,
    affixID = 3147,
    name = "70级_生命上限_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 18,
    min = 6000,
    max1 = 6000,
    max2 = 6000,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3148,1)->
    #equipAffixesCfg {
    iD = 1080,
    affixID = 3148,
    name = "70级_绝对伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 115,
    min = 746,
    max1 = 746,
    max2 = 746,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3149,1)->
    #equipAffixesCfg {
    iD = 1081,
    affixID = 3149,
    name = "70级_绝对防御_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 116,
    min = 248,
    max1 = 248,
    max2 = 248,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3150,1)->
    #equipAffixesCfg {
    iD = 1082,
    affixID = 3150,
    name = "70级_冷却速度_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.14,
    max1 = 0.14,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3151,1)->
    #equipAffixesCfg {
    iD = 1083,
    affixID = 3151,
    name = "70级_觉醒持续时间_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 106,
    min = 0.2,
    max1 = 0.2,
    max2 = 0.2,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3152,1)->
    #equipAffixesCfg {
    iD = 1084,
    affixID = 3152,
    name = "70级_暴击率_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.05,
    max1 = 0.05,
    max2 = 0.05,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3153,1)->
    #equipAffixesCfg {
    iD = 1085,
    affixID = 3153,
    name = "70级_暴击伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 36,
    min = 0.5,
    max1 = 0.5,
    max2 = 0.5,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3154,1)->
    #equipAffixesCfg {
    iD = 1086,
    affixID = 3154,
    name = "70级_暴击豁免_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 117,
    min = 0.06,
    max1 = 0.06,
    max2 = 0.06,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3155,1)->
    #equipAffixesCfg {
    iD = 1087,
    affixID = 3155,
    name = "70级_暴伤减免_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 118,
    min = 0.2,
    max1 = 0.2,
    max2 = 0.2,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3156,1)->
    #equipAffixesCfg {
    iD = 1088,
    affixID = 3156,
    name = "70级_眩晕豁免_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 119,
    min = 0.06,
    max1 = 0.06,
    max2 = 0.06,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3157,1)->
    #equipAffixesCfg {
    iD = 1089,
    affixID = 3157,
    name = "70级_冰冻豁免_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 120,
    min = 0.06,
    max1 = 0.06,
    max2 = 0.06,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3158,1)->
    #equipAffixesCfg {
    iD = 1090,
    affixID = 3158,
    name = "70级_减速豁免_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 121,
    min = 0.06,
    max1 = 0.06,
    max2 = 0.06,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3159,1)->
    #equipAffixesCfg {
    iD = 1091,
    affixID = 3159,
    name = "70级_眩晕概率_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 122,
    min = 0.06,
    max1 = 0.06,
    max2 = 0.06,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3160,1)->
    #equipAffixesCfg {
    iD = 1092,
    affixID = 3160,
    name = "70级_冰冻概率_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 123,
    min = 0.06,
    max1 = 0.06,
    max2 = 0.06,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3161,1)->
    #equipAffixesCfg {
    iD = 1093,
    affixID = 3161,
    name = "70级_减速概率_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 124,
    min = 0.06,
    max1 = 0.06,
    max2 = 0.06,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3162,1)->
    #equipAffixesCfg {
    iD = 1094,
    affixID = 3162,
    name = "70级_盾牌猛击伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1],
    propType = 63,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3163,1)->
    #equipAffixesCfg {
    iD = 1095,
    affixID = 3163,
    name = "70级_净化冷却加速_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1],
    propType = 64,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(3164,1)->
    #equipAffixesCfg {
    iD = 1096,
    affixID = 3164,
    name = "70级_冲锋冷却加速_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1],
    propType = 65,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(3165,1)->
    #equipAffixesCfg {
    iD = 1097,
    affixID = 3165,
    name = "70级_永恒之光伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1],
    propType = 66,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3166,1)->
    #equipAffixesCfg {
    iD = 1098,
    affixID = 3166,
    name = "70级_忏悔伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1],
    propType = 67,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3167,1)->
    #equipAffixesCfg {
    iD = 1099,
    affixID = 3167,
    name = "70级_黎明之锤冷却_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1],
    propType = 68,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(3168,1)->
    #equipAffixesCfg {
    iD = 1100,
    affixID = 3168,
    name = "70级_火球术伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 70,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3169,1)->
    #equipAffixesCfg {
    iD = 1101,
    affixID = 3169,
    name = "70级_陨石术伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 71,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3170,1)->
    #equipAffixesCfg {
    iD = 1102,
    affixID = 3170,
    name = "70级_冰环术冷却_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 72,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(3171,1)->
    #equipAffixesCfg {
    iD = 1103,
    affixID = 3171,
    name = "70级_冰环术伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 73,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3172,1)->
    #equipAffixesCfg {
    iD = 1104,
    affixID = 3172,
    name = "70级_冰风暴伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 74,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3173,1)->
    #equipAffixesCfg {
    iD = 1105,
    affixID = 3173,
    name = "70级_能量冲击伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 75,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3174,1)->
    #equipAffixesCfg {
    iD = 1106,
    affixID = 3174,
    name = "70级_生命收割冷却_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [4],
    propType = 76,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(3175,1)->
    #equipAffixesCfg {
    iD = 1107,
    affixID = 3175,
    name = "70级_远古恶魔冷却_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [4],
    propType = 97,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(3176,1)->
    #equipAffixesCfg {
    iD = 1108,
    affixID = 3176,
    name = "70级_亵渎伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [4],
    propType = 78,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3177,1)->
    #equipAffixesCfg {
    iD = 1109,
    affixID = 3177,
    name = "70级_末日决战伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [4],
    propType = 79,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3178,1)->
    #equipAffixesCfg {
    iD = 1110,
    affixID = 3178,
    name = "70级_死亡风暴伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [4],
    propType = 81,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3179,1)->
    #equipAffixesCfg {
    iD = 1111,
    affixID = 3179,
    name = "70级_死亡斩杀伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [4],
    propType = 82,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3180,1)->
    #equipAffixesCfg {
    iD = 1112,
    affixID = 3180,
    name = "70级_烈风斩伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3],
    propType = 83,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3181,1)->
    #equipAffixesCfg {
    iD = 1113,
    affixID = 3181,
    name = "70级_致命投掷冷却_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3],
    propType = 84,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(3182,1)->
    #equipAffixesCfg {
    iD = 1114,
    affixID = 3182,
    name = "70级_缴械伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3],
    propType = 85,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3183,1)->
    #equipAffixesCfg {
    iD = 1115,
    affixID = 3183,
    name = "70级_灭寂伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3],
    propType = 86,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3184,1)->
    #equipAffixesCfg {
    iD = 1116,
    affixID = 3184,
    name = "70级_乱影击伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3],
    propType = 87,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3185,1)->
    #equipAffixesCfg {
    iD = 1117,
    affixID = 3185,
    name = "70级_致命投掷伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3],
    propType = 88,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3186,1)->
    #equipAffixesCfg {
    iD = 1118,
    affixID = 3186,
    name = "70级_影武冷却_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3],
    propType = 89,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(3187,1)->
    #equipAffixesCfg {
    iD = 1119,
    affixID = 3187,
    name = "70级_影袭伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3],
    propType = 90,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3188,1)->
    #equipAffixesCfg {
    iD = 1120,
    affixID = 3188,
    name = "70级_烈焰寒冰_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [5],
    propType = 128,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3189,1)->
    #equipAffixesCfg {
    iD = 1121,
    affixID = 3189,
    name = "70级_爆炎手雷_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [5],
    propType = 129,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3190,1)->
    #equipAffixesCfg {
    iD = 1122,
    affixID = 3190,
    name = "70级_火焰喷射_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [5],
    propType = 130,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3191,1)->
    #equipAffixesCfg {
    iD = 1123,
    affixID = 3191,
    name = "70级_激光射线_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [5],
    propType = 131,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3192,1)->
    #equipAffixesCfg {
    iD = 1124,
    affixID = 3192,
    name = "70级_重力炸弹_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [5],
    propType = 132,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3193,1)->
    #equipAffixesCfg {
    iD = 1125,
    affixID = 3193,
    name = "70级_击退_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [5],
    propType = 133,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3194,1)->
    #equipAffixesCfg {
    iD = 1126,
    affixID = 3194,
    name = "70级_散弹射击_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [5],
    propType = 134,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3195,1)->
    #equipAffixesCfg {
    iD = 1127,
    affixID = 3195,
    name = "烈焰寒冰伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [5],
    propType = 128,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3196,1)->
    #equipAffixesCfg {
    iD = 1128,
    affixID = 3196,
    name = "爆炎手雷伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [5],
    propType = 129,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3197,1)->
    #equipAffixesCfg {
    iD = 1129,
    affixID = 3197,
    name = "火焰喷射伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [5],
    propType = 130,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3198,1)->
    #equipAffixesCfg {
    iD = 1130,
    affixID = 3198,
    name = "激光射线伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [5],
    propType = 131,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3199,1)->
    #equipAffixesCfg {
    iD = 1131,
    affixID = 3199,
    name = "重力炸弹伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [5],
    propType = 132,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3200,1)->
    #equipAffixesCfg {
    iD = 1132,
    affixID = 3200,
    name = "击退伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [5],
    propType = 133,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3201,1)->
    #equipAffixesCfg {
    iD = 1133,
    affixID = 3201,
    name = "散弹射击伤害",
    affixLevel = 1,
    affixType = 0,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [5],
    propType = 134,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3202,1)->
    #equipAffixesCfg {
    iD = 1134,
    affixID = 3202,
    name = "烈焰寒冰伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [5],
    propType = 128,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3203,1)->
    #equipAffixesCfg {
    iD = 1135,
    affixID = 3203,
    name = "爆炎手雷伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [5],
    propType = 129,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3204,1)->
    #equipAffixesCfg {
    iD = 1136,
    affixID = 3204,
    name = "火焰喷射伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [5],
    propType = 130,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3205,1)->
    #equipAffixesCfg {
    iD = 1137,
    affixID = 3205,
    name = "激光射线伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [5],
    propType = 131,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3206,1)->
    #equipAffixesCfg {
    iD = 1138,
    affixID = 3206,
    name = "重力炸弹伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [5],
    propType = 132,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3207,1)->
    #equipAffixesCfg {
    iD = 1139,
    affixID = 3207,
    name = "击退伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [5],
    propType = 133,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3208,1)->
    #equipAffixesCfg {
    iD = 1140,
    affixID = 3208,
    name = "散弹射击伤害",
    affixLevel = 1,
    affixType = 2,
    conflict = 7,
    itemLevel = 1,
    equipType = [1,2,3,6,7],
    equipClass = [5],
    propType = 134,
    min = 0.1,
    max1 = 0.12,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3209,1)->
    #equipAffixesCfg {
    iD = 1141,
    affixID = 3209,
    name = "75级_力量_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 1,
    min = 518,
    max1 = 518,
    max2 = 518,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3210,1)->
    #equipAffixesCfg {
    iD = 1142,
    affixID = 3210,
    name = "75级_体质_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 518,
    max1 = 518,
    max2 = 518,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3211,1)->
    #equipAffixesCfg {
    iD = 1143,
    affixID = 3211,
    name = "75级_智力_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 3,
    min = 518,
    max1 = 518,
    max2 = 518,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3212,1)->
    #equipAffixesCfg {
    iD = 1144,
    affixID = 3212,
    name = "75级_敏捷_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 2,
    min = 518,
    max1 = 518,
    max2 = 518,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3213,1)->
    #equipAffixesCfg {
    iD = 1145,
    affixID = 3213,
    name = "75级_物理伤害_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 345,
    max1 = 345,
    max2 = 345,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3214,1)->
    #equipAffixesCfg {
    iD = 1146,
    affixID = 3214,
    name = "75级_神圣伤害_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 30,
    min = 345,
    max1 = 345,
    max2 = 345,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3215,1)->
    #equipAffixesCfg {
    iD = 1147,
    affixID = 3215,
    name = "75级_元素伤害_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 33,
    min = 345,
    max1 = 345,
    max2 = 345,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3216,1)->
    #equipAffixesCfg {
    iD = 1148,
    affixID = 3216,
    name = "75级_暗影伤害_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 32,
    min = 345,
    max1 = 345,
    max2 = 345,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3217,1)->
    #equipAffixesCfg {
    iD = 1149,
    affixID = 3217,
    name = "75级_全防御_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 1382,
    max1 = 1382,
    max2 = 1382,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3218,1)->
    #equipAffixesCfg {
    iD = 1150,
    affixID = 3218,
    name = "75级_物理防御_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 2073,
    max1 = 2073,
    max2 = 2073,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3219,1)->
    #equipAffixesCfg {
    iD = 1151,
    affixID = 3219,
    name = "75级_魔法防御_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 2073,
    max1 = 2073,
    max2 = 2073,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3220,1)->
    #equipAffixesCfg {
    iD = 1152,
    affixID = 3220,
    name = "75级_生命上限_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 18,
    min = 3000,
    max1 = 3000,
    max2 = 3000,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3221,1)->
    #equipAffixesCfg {
    iD = 1153,
    affixID = 3221,
    name = "75级_绝对伤害_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 115,
    min = 518,
    max1 = 518,
    max2 = 518,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3222,1)->
    #equipAffixesCfg {
    iD = 1154,
    affixID = 3222,
    name = "75级_绝对防御_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 116,
    min = 172,
    max1 = 172,
    max2 = 172,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3223,1)->
    #equipAffixesCfg {
    iD = 1155,
    affixID = 3223,
    name = "75级_冷却速度_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3224,1)->
    #equipAffixesCfg {
    iD = 1156,
    affixID = 3224,
    name = "75级_觉醒持续时间_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 106,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3225,1)->
    #equipAffixesCfg {
    iD = 1157,
    affixID = 3225,
    name = "75级_暴击率_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3226,1)->
    #equipAffixesCfg {
    iD = 1158,
    affixID = 3226,
    name = "75级_暴击伤害_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 36,
    min = 0.35,
    max1 = 0.35,
    max2 = 0.35,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3227,1)->
    #equipAffixesCfg {
    iD = 1159,
    affixID = 3227,
    name = "75级_暴击豁免_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 117,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3228,1)->
    #equipAffixesCfg {
    iD = 1160,
    affixID = 3228,
    name = "75级_暴伤减免_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 118,
    min = 0.12,
    max1 = 0.12,
    max2 = 0.12,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3229,1)->
    #equipAffixesCfg {
    iD = 1161,
    affixID = 3229,
    name = "75级_眩晕豁免_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 119,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3230,1)->
    #equipAffixesCfg {
    iD = 1162,
    affixID = 3230,
    name = "75级_冰冻豁免_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 120,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3231,1)->
    #equipAffixesCfg {
    iD = 1163,
    affixID = 3231,
    name = "75级_减速豁免_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 121,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3232,1)->
    #equipAffixesCfg {
    iD = 1164,
    affixID = 3232,
    name = "75级_眩晕概率_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 122,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3233,1)->
    #equipAffixesCfg {
    iD = 1165,
    affixID = 3233,
    name = "75级_冰冻概率_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 123,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3234,1)->
    #equipAffixesCfg {
    iD = 1166,
    affixID = 3234,
    name = "75级_减速概率_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 124,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3235,1)->
    #equipAffixesCfg {
    iD = 1167,
    affixID = 3235,
    name = "75级_命中率_紫",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 125,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3236,1)->
    #equipAffixesCfg {
    iD = 1168,
    affixID = 3236,
    name = "75级_力量_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 1,
    min = 596,
    max1 = 596,
    max2 = 596,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3237,1)->
    #equipAffixesCfg {
    iD = 1169,
    affixID = 3237,
    name = "75级_体质_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 596,
    max1 = 596,
    max2 = 596,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3238,1)->
    #equipAffixesCfg {
    iD = 1170,
    affixID = 3238,
    name = "75级_智力_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 3,
    min = 596,
    max1 = 596,
    max2 = 596,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3239,1)->
    #equipAffixesCfg {
    iD = 1171,
    affixID = 3239,
    name = "75级_敏捷_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 2,
    min = 596,
    max1 = 596,
    max2 = 596,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3240,1)->
    #equipAffixesCfg {
    iD = 1172,
    affixID = 3240,
    name = "75级_物理伤害_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 397,
    max1 = 397,
    max2 = 397,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3241,1)->
    #equipAffixesCfg {
    iD = 1173,
    affixID = 3241,
    name = "75级_神圣伤害_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 30,
    min = 397,
    max1 = 397,
    max2 = 397,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3242,1)->
    #equipAffixesCfg {
    iD = 1174,
    affixID = 3242,
    name = "75级_元素伤害_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 33,
    min = 397,
    max1 = 397,
    max2 = 397,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3243,1)->
    #equipAffixesCfg {
    iD = 1175,
    affixID = 3243,
    name = "75级_暗影伤害_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 32,
    min = 397,
    max1 = 397,
    max2 = 397,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3244,1)->
    #equipAffixesCfg {
    iD = 1176,
    affixID = 3244,
    name = "75级_全防御_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 1589,
    max1 = 1589,
    max2 = 1589,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3245,1)->
    #equipAffixesCfg {
    iD = 1177,
    affixID = 3245,
    name = "75级_物理防御_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 2384,
    max1 = 2384,
    max2 = 2384,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3246,1)->
    #equipAffixesCfg {
    iD = 1178,
    affixID = 3246,
    name = "75级_魔法防御_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 2384,
    max1 = 2384,
    max2 = 2384,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3247,1)->
    #equipAffixesCfg {
    iD = 1179,
    affixID = 3247,
    name = "75级_生命上限_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 18,
    min = 3450,
    max1 = 3450,
    max2 = 3450,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3248,1)->
    #equipAffixesCfg {
    iD = 1180,
    affixID = 3248,
    name = "75级_绝对伤害_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 115,
    min = 596,
    max1 = 596,
    max2 = 596,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3249,1)->
    #equipAffixesCfg {
    iD = 1181,
    affixID = 3249,
    name = "75级_绝对防御_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 116,
    min = 198,
    max1 = 198,
    max2 = 198,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3250,1)->
    #equipAffixesCfg {
    iD = 1182,
    affixID = 3250,
    name = "75级_冷却速度_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.12,
    max1 = 0.12,
    max2 = 0.12,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3251,1)->
    #equipAffixesCfg {
    iD = 1183,
    affixID = 3251,
    name = "75级_觉醒持续时间_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 106,
    min = 0.15,
    max1 = 0.15,
    max2 = 0.15,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3252,1)->
    #equipAffixesCfg {
    iD = 1184,
    affixID = 3252,
    name = "75级_暴击率_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.04,
    max1 = 0.04,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3253,1)->
    #equipAffixesCfg {
    iD = 1185,
    affixID = 3253,
    name = "75级_暴击伤害_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 36,
    min = 0.35,
    max1 = 0.35,
    max2 = 0.35,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3254,1)->
    #equipAffixesCfg {
    iD = 1186,
    affixID = 3254,
    name = "75级_暴击豁免_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 117,
    min = 0.05,
    max1 = 0.05,
    max2 = 0.05,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3255,1)->
    #equipAffixesCfg {
    iD = 1187,
    affixID = 3255,
    name = "75级_暴伤减免_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 118,
    min = 0.15,
    max1 = 0.15,
    max2 = 0.15,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3256,1)->
    #equipAffixesCfg {
    iD = 1188,
    affixID = 3256,
    name = "75级_眩晕豁免_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 119,
    min = 0.05,
    max1 = 0.05,
    max2 = 0.05,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3257,1)->
    #equipAffixesCfg {
    iD = 1189,
    affixID = 3257,
    name = "75级_冰冻豁免_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 120,
    min = 0.05,
    max1 = 0.05,
    max2 = 0.05,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3258,1)->
    #equipAffixesCfg {
    iD = 1190,
    affixID = 3258,
    name = "75级_减速豁免_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 121,
    min = 0.05,
    max1 = 0.05,
    max2 = 0.05,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3259,1)->
    #equipAffixesCfg {
    iD = 1191,
    affixID = 3259,
    name = "75级_眩晕概率_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 122,
    min = 0.05,
    max1 = 0.05,
    max2 = 0.05,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3260,1)->
    #equipAffixesCfg {
    iD = 1192,
    affixID = 3260,
    name = "75级_冰冻概率_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 123,
    min = 0.05,
    max1 = 0.05,
    max2 = 0.05,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3261,1)->
    #equipAffixesCfg {
    iD = 1193,
    affixID = 3261,
    name = "75级_减速概率_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 124,
    min = 0.05,
    max1 = 0.05,
    max2 = 0.05,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3262,1)->
    #equipAffixesCfg {
    iD = 1194,
    affixID = 3262,
    name = "75级_命中率_橙",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 125,
    min = 0.06,
    max1 = 0.06,
    max2 = 0.06,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3263,1)->
    #equipAffixesCfg {
    iD = 1195,
    affixID = 3263,
    name = "75级_力量_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 1,
    min = 715,
    max1 = 715,
    max2 = 715,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3264,1)->
    #equipAffixesCfg {
    iD = 1196,
    affixID = 3264,
    name = "75级_体质_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 715,
    max1 = 715,
    max2 = 715,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3265,1)->
    #equipAffixesCfg {
    iD = 1197,
    affixID = 3265,
    name = "75级_智力_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 3,
    min = 715,
    max1 = 715,
    max2 = 715,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3266,1)->
    #equipAffixesCfg {
    iD = 1198,
    affixID = 3266,
    name = "75级_敏捷_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 2,
    min = 715,
    max1 = 715,
    max2 = 715,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3267,1)->
    #equipAffixesCfg {
    iD = 1199,
    affixID = 3267,
    name = "75级_物理伤害_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 476,
    max1 = 476,
    max2 = 476,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3268,1)->
    #equipAffixesCfg {
    iD = 1200,
    affixID = 3268,
    name = "75级_神圣伤害_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 30,
    min = 476,
    max1 = 476,
    max2 = 476,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3269,1)->
    #equipAffixesCfg {
    iD = 1201,
    affixID = 3269,
    name = "75级_元素伤害_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 33,
    min = 476,
    max1 = 476,
    max2 = 476,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3270,1)->
    #equipAffixesCfg {
    iD = 1202,
    affixID = 3270,
    name = "75级_暗影伤害_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 32,
    min = 476,
    max1 = 476,
    max2 = 476,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3271,1)->
    #equipAffixesCfg {
    iD = 1203,
    affixID = 3271,
    name = "75级_全防御_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 1907,
    max1 = 1907,
    max2 = 1907,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3272,1)->
    #equipAffixesCfg {
    iD = 1204,
    affixID = 3272,
    name = "75级_物理防御_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 2861,
    max1 = 2861,
    max2 = 2861,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3273,1)->
    #equipAffixesCfg {
    iD = 1205,
    affixID = 3273,
    name = "75级_魔法防御_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 2861,
    max1 = 2861,
    max2 = 2861,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3274,1)->
    #equipAffixesCfg {
    iD = 1206,
    affixID = 3274,
    name = "75级_生命上限_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 18,
    min = 4140,
    max1 = 4140,
    max2 = 4140,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3275,1)->
    #equipAffixesCfg {
    iD = 1207,
    affixID = 3275,
    name = "75级_绝对伤害_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 115,
    min = 715,
    max1 = 715,
    max2 = 715,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3276,1)->
    #equipAffixesCfg {
    iD = 1208,
    affixID = 3276,
    name = "75级_绝对防御_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 116,
    min = 238,
    max1 = 238,
    max2 = 238,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3277,1)->
    #equipAffixesCfg {
    iD = 1209,
    affixID = 3277,
    name = "75级_冷却速度_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.14,
    max1 = 0.14,
    max2 = 0.14,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3278,1)->
    #equipAffixesCfg {
    iD = 1210,
    affixID = 3278,
    name = "75级_觉醒持续时间_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 106,
    min = 0.2,
    max1 = 0.2,
    max2 = 0.2,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3279,1)->
    #equipAffixesCfg {
    iD = 1211,
    affixID = 3279,
    name = "75级_暴击率_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.05,
    max1 = 0.05,
    max2 = 0.05,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3280,1)->
    #equipAffixesCfg {
    iD = 1212,
    affixID = 3280,
    name = "75级_暴击伤害_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 36,
    min = 0.5,
    max1 = 0.5,
    max2 = 0.5,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3281,1)->
    #equipAffixesCfg {
    iD = 1213,
    affixID = 3281,
    name = "75级_暴击豁免_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 117,
    min = 0.06,
    max1 = 0.06,
    max2 = 0.06,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3282,1)->
    #equipAffixesCfg {
    iD = 1214,
    affixID = 3282,
    name = "75级_暴伤减免_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 118,
    min = 0.2,
    max1 = 0.2,
    max2 = 0.2,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3283,1)->
    #equipAffixesCfg {
    iD = 1215,
    affixID = 3283,
    name = "75级_眩晕豁免_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 119,
    min = 0.06,
    max1 = 0.06,
    max2 = 0.06,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3284,1)->
    #equipAffixesCfg {
    iD = 1216,
    affixID = 3284,
    name = "75级_冰冻豁免_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 120,
    min = 0.06,
    max1 = 0.06,
    max2 = 0.06,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3285,1)->
    #equipAffixesCfg {
    iD = 1217,
    affixID = 3285,
    name = "75级_减速豁免_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 121,
    min = 0.06,
    max1 = 0.06,
    max2 = 0.06,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3286,1)->
    #equipAffixesCfg {
    iD = 1218,
    affixID = 3286,
    name = "75级_眩晕概率_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 122,
    min = 0.06,
    max1 = 0.06,
    max2 = 0.06,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3287,1)->
    #equipAffixesCfg {
    iD = 1219,
    affixID = 3287,
    name = "75级_冰冻概率_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 123,
    min = 0.06,
    max1 = 0.06,
    max2 = 0.06,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3288,1)->
    #equipAffixesCfg {
    iD = 1220,
    affixID = 3288,
    name = "75级_减速概率_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 124,
    min = 0.06,
    max1 = 0.06,
    max2 = 0.06,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3289,1)->
    #equipAffixesCfg {
    iD = 1221,
    affixID = 3289,
    name = "75级_命中率_红",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 125,
    min = 0.06,
    max1 = 0.06,
    max2 = 0.06,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3290,1)->
    #equipAffixesCfg {
    iD = 1222,
    affixID = 3290,
    name = "75级_力量_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 1,
    min = 894,
    max1 = 894,
    max2 = 894,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3291,1)->
    #equipAffixesCfg {
    iD = 1223,
    affixID = 3291,
    name = "75级_体质_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 4,
    min = 894,
    max1 = 894,
    max2 = 894,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3292,1)->
    #equipAffixesCfg {
    iD = 1224,
    affixID = 3292,
    name = "75级_智力_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 3,
    min = 894,
    max1 = 894,
    max2 = 894,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3293,1)->
    #equipAffixesCfg {
    iD = 1225,
    affixID = 3293,
    name = "75级_敏捷_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 2,
    min = 894,
    max1 = 894,
    max2 = 894,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3294,1)->
    #equipAffixesCfg {
    iD = 1226,
    affixID = 3294,
    name = "75级_物理伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 31,
    min = 595,
    max1 = 595,
    max2 = 595,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3295,1)->
    #equipAffixesCfg {
    iD = 1227,
    affixID = 3295,
    name = "75级_神圣伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 30,
    min = 595,
    max1 = 595,
    max2 = 595,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3296,1)->
    #equipAffixesCfg {
    iD = 1228,
    affixID = 3296,
    name = "75级_元素伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 33,
    min = 595,
    max1 = 595,
    max2 = 595,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3297,1)->
    #equipAffixesCfg {
    iD = 1229,
    affixID = 3297,
    name = "75级_暗影伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 32,
    min = 595,
    max1 = 595,
    max2 = 595,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3298,1)->
    #equipAffixesCfg {
    iD = 1230,
    affixID = 3298,
    name = "75级_全防御_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 60,
    min = 2384,
    max1 = 2384,
    max2 = 2384,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3299,1)->
    #equipAffixesCfg {
    iD = 1231,
    affixID = 3299,
    name = "75级_物理防御_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 26,
    min = 3576,
    max1 = 3576,
    max2 = 3576,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3300,1)->
    #equipAffixesCfg {
    iD = 1232,
    affixID = 3300,
    name = "75级_魔法防御_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 28,
    min = 3576,
    max1 = 3576,
    max2 = 3576,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3301,1)->
    #equipAffixesCfg {
    iD = 1233,
    affixID = 3301,
    name = "75级_生命上限_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 18,
    min = 5175,
    max1 = 5175,
    max2 = 5175,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3302,1)->
    #equipAffixesCfg {
    iD = 1234,
    affixID = 3302,
    name = "75级_绝对伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 115,
    min = 894,
    max1 = 894,
    max2 = 894,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3303,1)->
    #equipAffixesCfg {
    iD = 1235,
    affixID = 3303,
    name = "75级_绝对防御_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 116,
    min = 298,
    max1 = 298,
    max2 = 298,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3304,1)->
    #equipAffixesCfg {
    iD = 1236,
    affixID = 3304,
    name = "75级_冷却速度_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 44,
    min = 0.16,
    max1 = 0.16,
    max2 = 0.16,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3305,1)->
    #equipAffixesCfg {
    iD = 1237,
    affixID = 3305,
    name = "75级_觉醒持续时间_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 106,
    min = 0.23,
    max1 = 0.23,
    max2 = 0.23,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3306,1)->
    #equipAffixesCfg {
    iD = 1238,
    affixID = 3306,
    name = "75级_暴击率_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 35,
    min = 0.06,
    max1 = 0.06,
    max2 = 0.06,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3307,1)->
    #equipAffixesCfg {
    iD = 1239,
    affixID = 3307,
    name = "75级_暴击伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 36,
    min = 0.58,
    max1 = 0.58,
    max2 = 0.58,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3308,1)->
    #equipAffixesCfg {
    iD = 1240,
    affixID = 3308,
    name = "75级_暴击豁免_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 117,
    min = 0.07,
    max1 = 0.07,
    max2 = 0.07,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3309,1)->
    #equipAffixesCfg {
    iD = 1241,
    affixID = 3309,
    name = "75级_暴伤减免_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 118,
    min = 0.23,
    max1 = 0.23,
    max2 = 0.23,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3310,1)->
    #equipAffixesCfg {
    iD = 1242,
    affixID = 3310,
    name = "75级_眩晕豁免_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 119,
    min = 0.07,
    max1 = 0.07,
    max2 = 0.07,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3311,1)->
    #equipAffixesCfg {
    iD = 1243,
    affixID = 3311,
    name = "75级_冰冻豁免_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 120,
    min = 0.07,
    max1 = 0.07,
    max2 = 0.07,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3312,1)->
    #equipAffixesCfg {
    iD = 1244,
    affixID = 3312,
    name = "75级_减速豁免_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 121,
    min = 0.07,
    max1 = 0.07,
    max2 = 0.07,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3313,1)->
    #equipAffixesCfg {
    iD = 1245,
    affixID = 3313,
    name = "75级_眩晕概率_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 122,
    min = 0.07,
    max1 = 0.07,
    max2 = 0.07,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3314,1)->
    #equipAffixesCfg {
    iD = 1246,
    affixID = 3314,
    name = "75级_冰冻概率_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 123,
    min = 0.07,
    max1 = 0.07,
    max2 = 0.07,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3315,1)->
    #equipAffixesCfg {
    iD = 1247,
    affixID = 3315,
    name = "75级_减速概率_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 124,
    min = 0.07,
    max1 = 0.07,
    max2 = 0.07,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3316,1)->
    #equipAffixesCfg {
    iD = 1248,
    affixID = 3316,
    name = "75级_命中率_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1,2,3,4,5],
    propType = 125,
    min = 0.08,
    max1 = 0.08,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3317,1)->
    #equipAffixesCfg {
    iD = 1249,
    affixID = 3317,
    name = "75级_盾牌猛击伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1],
    propType = 63,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3318,1)->
    #equipAffixesCfg {
    iD = 1250,
    affixID = 3318,
    name = "75级_净化冷却加速_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1],
    propType = 64,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(3319,1)->
    #equipAffixesCfg {
    iD = 1251,
    affixID = 3319,
    name = "75级_冲锋冷却加速_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1],
    propType = 65,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(3320,1)->
    #equipAffixesCfg {
    iD = 1252,
    affixID = 3320,
    name = "75级_永恒之光伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1],
    propType = 66,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3321,1)->
    #equipAffixesCfg {
    iD = 1253,
    affixID = 3321,
    name = "75级_忏悔伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1],
    propType = 67,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3322,1)->
    #equipAffixesCfg {
    iD = 1254,
    affixID = 3322,
    name = "75级_黎明之锤冷却_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [1],
    propType = 68,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(3323,1)->
    #equipAffixesCfg {
    iD = 1255,
    affixID = 3323,
    name = "75级_火球术伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 70,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3324,1)->
    #equipAffixesCfg {
    iD = 1256,
    affixID = 3324,
    name = "75级_陨石术伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 71,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3325,1)->
    #equipAffixesCfg {
    iD = 1257,
    affixID = 3325,
    name = "75级_冰环术冷却_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 72,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(3326,1)->
    #equipAffixesCfg {
    iD = 1258,
    affixID = 3326,
    name = "75级_冰环术伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 73,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3327,1)->
    #equipAffixesCfg {
    iD = 1259,
    affixID = 3327,
    name = "75级_冰风暴伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 74,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3328,1)->
    #equipAffixesCfg {
    iD = 1260,
    affixID = 3328,
    name = "75级_能量冲击伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [2],
    propType = 75,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3329,1)->
    #equipAffixesCfg {
    iD = 1261,
    affixID = 3329,
    name = "75级_生命收割冷却_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [4],
    propType = 76,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(3330,1)->
    #equipAffixesCfg {
    iD = 1262,
    affixID = 3330,
    name = "75级_远古恶魔冷却_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [4],
    propType = 97,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(3331,1)->
    #equipAffixesCfg {
    iD = 1263,
    affixID = 3331,
    name = "75级_亵渎伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [4],
    propType = 78,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3332,1)->
    #equipAffixesCfg {
    iD = 1264,
    affixID = 3332,
    name = "75级_末日决战伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [4],
    propType = 79,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3333,1)->
    #equipAffixesCfg {
    iD = 1265,
    affixID = 3333,
    name = "75级_死亡风暴伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [4],
    propType = 81,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3334,1)->
    #equipAffixesCfg {
    iD = 1266,
    affixID = 3334,
    name = "75级_死亡斩杀伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [4],
    propType = 82,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3335,1)->
    #equipAffixesCfg {
    iD = 1267,
    affixID = 3335,
    name = "75级_烈风斩伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 83,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3336,1)->
    #equipAffixesCfg {
    iD = 1268,
    affixID = 3336,
    name = "75级_致命投掷冷却_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 84,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(3337,1)->
    #equipAffixesCfg {
    iD = 1269,
    affixID = 3337,
    name = "75级_缴械伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 85,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3338,1)->
    #equipAffixesCfg {
    iD = 1270,
    affixID = 3338,
    name = "75级_灭寂伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 86,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3339,1)->
    #equipAffixesCfg {
    iD = 1271,
    affixID = 3339,
    name = "75级_乱影击伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 87,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3340,1)->
    #equipAffixesCfg {
    iD = 1272,
    affixID = 3340,
    name = "75级_致命投掷伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 88,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3341,1)->
    #equipAffixesCfg {
    iD = 1273,
    affixID = 3341,
    name = "75级_影武冷却_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 89,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 1,
    weight = 100,
    dice = 4
    };
getRow(3342,1)->
    #equipAffixesCfg {
    iD = 1274,
    affixID = 3342,
    name = "75级_影袭伤害_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [3,5],
    propType = 90,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3343,1)->
    #equipAffixesCfg {
    iD = 1275,
    affixID = 3343,
    name = "75级_烈焰寒冰_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [5],
    propType = 128,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3344,1)->
    #equipAffixesCfg {
    iD = 1276,
    affixID = 3344,
    name = "75级_爆炎手雷_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [5],
    propType = 129,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3345,1)->
    #equipAffixesCfg {
    iD = 1277,
    affixID = 3345,
    name = "75级_火焰喷射_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [5],
    propType = 130,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3346,1)->
    #equipAffixesCfg {
    iD = 1278,
    affixID = 3346,
    name = "75级_激光射线_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [5],
    propType = 131,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3347,1)->
    #equipAffixesCfg {
    iD = 1279,
    affixID = 3347,
    name = "75级_重力炸弹_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [5],
    propType = 132,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3348,1)->
    #equipAffixesCfg {
    iD = 1280,
    affixID = 3348,
    name = "75级_击退_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [5],
    propType = 133,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3349,1)->
    #equipAffixesCfg {
    iD = 1281,
    affixID = 3349,
    name = "75级_散弹射击_神",
    affixLevel = 1,
    affixType = 4,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1,2,3,4,5,6,7],
    equipClass = [5],
    propType = 134,
    min = 0.1,
    max1 = 0.1,
    max2 = 0.1,
    mulityOrPlus = 0,
    weight = 100,
    dice = 4
    };
getRow(3350,1)->
    #equipAffixesCfg {
    iD = 1282,
    affixID = 3350,
    name = "火力上限",
    affixLevel = 1,
    affixType = 1,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1],
    equipClass = [5],
    propType = 126,
    min = 11,
    max1 = 13,
    max2 = 15,
    mulityOrPlus = 0,
    weight = 30,
    dice = 4
    };
getRow(3351,1)->
    #equipAffixesCfg {
    iD = 1283,
    affixID = 3351,
    name = "每秒火力恢复",
    affixLevel = 1,
    affixType = 1,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1],
    equipClass = [5],
    propType = 127,
    min = 1.5,
    max1 = 1.5,
    max2 = 1.5,
    mulityOrPlus = 0,
    weight = 30,
    dice = 4
    };
getRow(3352,1)->
    #equipAffixesCfg {
    iD = 1284,
    affixID = 3352,
    name = "火力上限",
    affixLevel = 1,
    affixType = 3,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1],
    equipClass = [5],
    propType = 126,
    min = 10,
    max1 = 10,
    max2 = 10,
    mulityOrPlus = 0,
    weight = 30,
    dice = 4
    };
getRow(3353,1)->
    #equipAffixesCfg {
    iD = 1285,
    affixID = 3353,
    name = "每秒火力恢复",
    affixLevel = 1,
    affixType = 3,
    conflict = 0,
    itemLevel = 1,
    equipType = [0,1],
    equipClass = [5],
    propType = 127,
    min = 1.6,
    max1 = 1.8,
    max2 = 2,
    mulityOrPlus = 0,
    weight = 30,
    dice = 4
    };
getRow(3354,1)->
    #equipAffixesCfg {
    iD = 1286,
    affixID = 3354,
    name = "命中率",
    affixLevel = 1,
    affixType = 2,
    conflict = 13,
    itemLevel = 1,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 125,
    min = 0.02,
    max1 = 0.03,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3354,8)->
    #equipAffixesCfg {
    iD = 1287,
    affixID = 3354,
    name = "命中率",
    affixLevel = 2,
    affixType = 2,
    conflict = 13,
    itemLevel = 8,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 125,
    min = 0.02,
    max1 = 0.03,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3354,16)->
    #equipAffixesCfg {
    iD = 1288,
    affixID = 3354,
    name = "命中率",
    affixLevel = 3,
    affixType = 2,
    conflict = 13,
    itemLevel = 16,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 125,
    min = 0.02,
    max1 = 0.03,
    max2 = 0.04,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3354,24)->
    #equipAffixesCfg {
    iD = 1289,
    affixID = 3354,
    name = "命中率",
    affixLevel = 4,
    affixType = 2,
    conflict = 13,
    itemLevel = 24,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 125,
    min = 0.025,
    max1 = 0.035,
    max2 = 0.045,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3354,32)->
    #equipAffixesCfg {
    iD = 1290,
    affixID = 3354,
    name = "命中率",
    affixLevel = 5,
    affixType = 2,
    conflict = 13,
    itemLevel = 32,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 125,
    min = 0.025,
    max1 = 0.035,
    max2 = 0.045,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3354,40)->
    #equipAffixesCfg {
    iD = 1291,
    affixID = 3354,
    name = "命中率",
    affixLevel = 6,
    affixType = 2,
    conflict = 13,
    itemLevel = 40,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 125,
    min = 0.03,
    max1 = 0.035,
    max2 = 0.045,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3354,44)->
    #equipAffixesCfg {
    iD = 1292,
    affixID = 3354,
    name = "命中率",
    affixLevel = 7,
    affixType = 2,
    conflict = 13,
    itemLevel = 44,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 125,
    min = 0.03,
    max1 = 0.035,
    max2 = 0.045,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3354,48)->
    #equipAffixesCfg {
    iD = 1293,
    affixID = 3354,
    name = "命中率",
    affixLevel = 8,
    affixType = 2,
    conflict = 13,
    itemLevel = 48,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 125,
    min = 0.03,
    max1 = 0.035,
    max2 = 0.045,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3354,52)->
    #equipAffixesCfg {
    iD = 1294,
    affixID = 3354,
    name = "命中率",
    affixLevel = 9,
    affixType = 2,
    conflict = 13,
    itemLevel = 52,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 125,
    min = 0.035,
    max1 = 0.045,
    max2 = 0.055,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3354,56)->
    #equipAffixesCfg {
    iD = 1295,
    affixID = 3354,
    name = "命中率",
    affixLevel = 10,
    affixType = 2,
    conflict = 13,
    itemLevel = 56,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 125,
    min = 0.035,
    max1 = 0.045,
    max2 = 0.055,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3354,60)->
    #equipAffixesCfg {
    iD = 1296,
    affixID = 3354,
    name = "命中率",
    affixLevel = 11,
    affixType = 2,
    conflict = 13,
    itemLevel = 60,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 125,
    min = 0.04,
    max1 = 0.055,
    max2 = 0.065,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3354,64)->
    #equipAffixesCfg {
    iD = 1297,
    affixID = 3354,
    name = "命中率",
    affixLevel = 12,
    affixType = 2,
    conflict = 13,
    itemLevel = 64,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 125,
    min = 0.04,
    max1 = 0.055,
    max2 = 0.065,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3354,68)->
    #equipAffixesCfg {
    iD = 1298,
    affixID = 3354,
    name = "命中率",
    affixLevel = 13,
    affixType = 2,
    conflict = 13,
    itemLevel = 68,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 125,
    min = 0.045,
    max1 = 0.06,
    max2 = 0.07,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3354,72)->
    #equipAffixesCfg {
    iD = 1299,
    affixID = 3354,
    name = "命中率",
    affixLevel = 14,
    affixType = 2,
    conflict = 13,
    itemLevel = 72,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 125,
    min = 0.045,
    max1 = 0.065,
    max2 = 0.075,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(3354,76)->
    #equipAffixesCfg {
    iD = 1300,
    affixID = 3354,
    name = "命中率",
    affixLevel = 15,
    affixType = 2,
    conflict = 13,
    itemLevel = 76,
    equipType = [1,4,5,6],
    equipClass = [1,2,3,4,5],
    propType = 125,
    min = 0.05,
    max1 = 0.07,
    max2 = 0.08,
    mulityOrPlus = 0,
    weight = 100,
    dice = 10
    };
getRow(_,_)->[].

getKeyList()->[
    {1,1},
    {1,8},
    {1,16},
    {1,24},
    {1,32},
    {1,40},
    {1,44},
    {1,48},
    {1,52},
    {1,56},
    {1,60},
    {1,64},
    {1,68},
    {1,72},
    {1,76},
    {2,1},
    {2,8},
    {2,16},
    {2,24},
    {2,32},
    {2,40},
    {2,44},
    {2,48},
    {2,52},
    {2,56},
    {2,60},
    {2,64},
    {2,68},
    {2,72},
    {2,76},
    {3,1},
    {3,8},
    {3,16},
    {3,24},
    {3,32},
    {3,40},
    {3,44},
    {3,48},
    {3,52},
    {3,56},
    {3,60},
    {3,64},
    {3,68},
    {3,72},
    {3,76},
    {4,1},
    {4,8},
    {4,16},
    {4,24},
    {4,32},
    {4,40},
    {4,44},
    {4,48},
    {4,52},
    {4,56},
    {4,60},
    {4,64},
    {4,68},
    {4,72},
    {4,76},
    {5,1},
    {5,8},
    {5,16},
    {5,24},
    {5,32},
    {5,40},
    {5,44},
    {5,48},
    {5,52},
    {5,56},
    {5,60},
    {5,64},
    {5,68},
    {5,72},
    {5,76},
    {6,1},
    {6,8},
    {6,16},
    {6,24},
    {6,32},
    {6,40},
    {6,44},
    {6,48},
    {6,52},
    {6,56},
    {6,60},
    {6,64},
    {6,68},
    {6,72},
    {6,76},
    {7,1},
    {7,8},
    {7,16},
    {7,24},
    {7,32},
    {7,40},
    {7,44},
    {7,48},
    {7,52},
    {7,56},
    {7,60},
    {7,64},
    {7,68},
    {7,72},
    {7,76},
    {8,1},
    {8,8},
    {8,16},
    {8,24},
    {8,32},
    {8,40},
    {8,44},
    {8,48},
    {8,52},
    {8,56},
    {8,60},
    {8,64},
    {8,68},
    {8,72},
    {8,76},
    {9,1},
    {9,8},
    {9,16},
    {9,24},
    {9,32},
    {9,40},
    {9,44},
    {9,48},
    {9,52},
    {9,56},
    {9,60},
    {9,64},
    {9,68},
    {9,72},
    {9,76},
    {10,1},
    {10,8},
    {10,16},
    {10,24},
    {10,32},
    {10,40},
    {10,44},
    {10,48},
    {10,52},
    {10,56},
    {10,60},
    {10,64},
    {10,68},
    {10,72},
    {10,76},
    {11,1},
    {11,8},
    {11,16},
    {11,24},
    {11,32},
    {11,40},
    {11,44},
    {11,48},
    {11,52},
    {11,56},
    {11,60},
    {11,64},
    {11,68},
    {11,72},
    {11,76},
    {12,1},
    {12,8},
    {12,16},
    {12,24},
    {12,32},
    {12,40},
    {12,44},
    {12,48},
    {12,52},
    {12,56},
    {12,60},
    {12,64},
    {12,68},
    {12,72},
    {12,76},
    {15,1},
    {15,4},
    {15,8},
    {15,16},
    {15,24},
    {15,32},
    {15,40},
    {15,48},
    {15,56},
    {15,60},
    {16,1},
    {16,8},
    {16,16},
    {16,24},
    {16,32},
    {16,40},
    {16,44},
    {16,48},
    {16,52},
    {16,56},
    {16,60},
    {16,64},
    {16,68},
    {16,72},
    {16,76},
    {17,1},
    {17,4},
    {17,8},
    {17,16},
    {17,24},
    {17,32},
    {17,40},
    {17,48},
    {17,56},
    {17,60},
    {18,1},
    {18,4},
    {18,8},
    {18,16},
    {18,24},
    {18,32},
    {18,40},
    {18,48},
    {18,56},
    {18,60},
    {20,1},
    {20,8},
    {20,16},
    {20,24},
    {20,32},
    {20,40},
    {20,44},
    {20,48},
    {20,52},
    {20,56},
    {20,60},
    {20,64},
    {20,68},
    {20,72},
    {20,76},
    {21,1},
    {21,8},
    {21,16},
    {21,24},
    {21,32},
    {21,40},
    {21,44},
    {21,48},
    {21,52},
    {21,56},
    {21,60},
    {21,64},
    {21,68},
    {21,72},
    {21,76},
    {22,1},
    {23,1},
    {24,1},
    {25,1},
    {26,1},
    {27,1},
    {28,1},
    {29,1},
    {30,1},
    {31,1},
    {32,1},
    {33,1},
    {34,1},
    {35,1},
    {36,32},
    {36,40},
    {36,44},
    {36,48},
    {36,52},
    {36,56},
    {36,60},
    {36,64},
    {36,68},
    {36,72},
    {36,76},
    {37,1},
    {38,1},
    {39,1},
    {40,1},
    {40,8},
    {40,16},
    {40,24},
    {40,32},
    {40,40},
    {40,44},
    {40,48},
    {40,52},
    {40,56},
    {40,60},
    {40,64},
    {40,68},
    {40,72},
    {40,76},
    {41,1},
    {42,1},
    {43,1},
    {44,1},
    {45,1},
    {46,1},
    {47,1},
    {48,1},
    {49,1},
    {50,1},
    {51,1},
    {52,1},
    {53,1},
    {54,1},
    {55,1},
    {56,1},
    {57,1},
    {58,1},
    {59,1},
    {60,1},
    {61,1},
    {62,1},
    {63,1},
    {64,1},
    {65,1},
    {66,1},
    {67,1},
    {68,1},
    {68,8},
    {68,16},
    {68,24},
    {68,32},
    {68,40},
    {68,44},
    {68,48},
    {68,52},
    {68,56},
    {68,60},
    {68,64},
    {68,68},
    {68,72},
    {68,76},
    {69,1},
    {69,8},
    {69,16},
    {69,24},
    {69,32},
    {69,40},
    {69,44},
    {69,48},
    {69,52},
    {69,56},
    {69,60},
    {69,64},
    {69,68},
    {69,72},
    {69,76},
    {1001,1},
    {1001,8},
    {1001,16},
    {1001,24},
    {1001,32},
    {1001,40},
    {1001,44},
    {1001,48},
    {1001,52},
    {1001,56},
    {1001,60},
    {1001,64},
    {1001,68},
    {1001,72},
    {1001,76},
    {1002,1},
    {1002,8},
    {1002,16},
    {1002,24},
    {1002,32},
    {1002,40},
    {1002,44},
    {1002,48},
    {1002,52},
    {1002,56},
    {1002,60},
    {1002,64},
    {1002,68},
    {1002,72},
    {1002,76},
    {1003,1},
    {1003,8},
    {1003,16},
    {1003,24},
    {1003,32},
    {1003,40},
    {1003,44},
    {1003,48},
    {1003,52},
    {1003,56},
    {1003,60},
    {1003,64},
    {1003,68},
    {1003,72},
    {1003,76},
    {1004,1},
    {1004,8},
    {1004,16},
    {1004,24},
    {1004,32},
    {1004,40},
    {1004,44},
    {1004,48},
    {1004,52},
    {1004,56},
    {1004,60},
    {1004,64},
    {1004,68},
    {1004,72},
    {1004,76},
    {1005,1},
    {1005,8},
    {1005,16},
    {1005,24},
    {1005,32},
    {1005,40},
    {1005,44},
    {1005,48},
    {1005,52},
    {1005,56},
    {1005,60},
    {1005,64},
    {1005,68},
    {1005,72},
    {1005,76},
    {1006,1},
    {1006,8},
    {1006,16},
    {1006,24},
    {1006,32},
    {1006,40},
    {1006,44},
    {1006,48},
    {1006,52},
    {1006,56},
    {1006,60},
    {1006,64},
    {1006,68},
    {1006,72},
    {1006,76},
    {1007,1},
    {1007,8},
    {1007,16},
    {1007,24},
    {1007,32},
    {1007,40},
    {1007,44},
    {1007,48},
    {1007,52},
    {1007,56},
    {1007,60},
    {1007,64},
    {1007,68},
    {1007,72},
    {1007,76},
    {1008,1},
    {1008,8},
    {1008,16},
    {1008,24},
    {1008,32},
    {1008,40},
    {1008,44},
    {1008,48},
    {1008,52},
    {1008,56},
    {1008,60},
    {1008,64},
    {1008,68},
    {1008,72},
    {1008,76},
    {1009,1},
    {1009,8},
    {1009,16},
    {1009,24},
    {1009,32},
    {1009,40},
    {1009,44},
    {1009,48},
    {1009,52},
    {1009,56},
    {1009,60},
    {1009,64},
    {1009,68},
    {1009,72},
    {1009,76},
    {1010,1},
    {1010,8},
    {1010,16},
    {1010,24},
    {1010,32},
    {1010,40},
    {1010,44},
    {1010,48},
    {1010,52},
    {1010,56},
    {1010,60},
    {1010,64},
    {1010,68},
    {1010,72},
    {1010,76},
    {1011,1},
    {1011,8},
    {1011,16},
    {1011,24},
    {1011,32},
    {1011,40},
    {1011,44},
    {1011,48},
    {1011,52},
    {1011,56},
    {1011,60},
    {1011,64},
    {1011,68},
    {1011,72},
    {1011,76},
    {1012,1},
    {1012,8},
    {1012,16},
    {1012,24},
    {1012,32},
    {1012,40},
    {1012,44},
    {1012,48},
    {1012,52},
    {1012,56},
    {1012,60},
    {1012,64},
    {1012,68},
    {1012,72},
    {1012,76},
    {1015,1},
    {1015,4},
    {1015,8},
    {1015,16},
    {1015,24},
    {1015,32},
    {1015,40},
    {1015,48},
    {1015,56},
    {1015,60},
    {1016,1},
    {1016,8},
    {1016,16},
    {1016,24},
    {1016,32},
    {1016,40},
    {1016,44},
    {1016,48},
    {1016,52},
    {1016,56},
    {1016,60},
    {1016,64},
    {1016,68},
    {1016,72},
    {1016,76},
    {1017,1},
    {1017,4},
    {1017,8},
    {1017,16},
    {1017,24},
    {1017,32},
    {1017,40},
    {1017,48},
    {1017,56},
    {1017,60},
    {1018,1},
    {1018,4},
    {1018,8},
    {1018,16},
    {1018,24},
    {1018,32},
    {1018,40},
    {1018,48},
    {1018,56},
    {1018,60},
    {1020,1},
    {1020,8},
    {1020,16},
    {1020,24},
    {1020,32},
    {1020,40},
    {1020,44},
    {1020,48},
    {1020,52},
    {1020,56},
    {1020,60},
    {1020,64},
    {1020,68},
    {1020,72},
    {1020,76},
    {1021,1},
    {1021,8},
    {1021,16},
    {1021,24},
    {1021,32},
    {1021,40},
    {1021,44},
    {1021,48},
    {1021,52},
    {1021,56},
    {1021,60},
    {1021,64},
    {1021,68},
    {1021,72},
    {1021,76},
    {1022,1},
    {1023,1},
    {1024,1},
    {1025,1},
    {1026,1},
    {1027,1},
    {1028,1},
    {1029,1},
    {1030,1},
    {1031,1},
    {1032,1},
    {1033,1},
    {1034,1},
    {1035,1},
    {1036,32},
    {1036,40},
    {1036,44},
    {1036,48},
    {1036,52},
    {1036,56},
    {1036,60},
    {1036,64},
    {1036,68},
    {1036,72},
    {1036,76},
    {1037,1},
    {1038,1},
    {1039,1},
    {1040,1},
    {1040,8},
    {1040,16},
    {1040,24},
    {1040,32},
    {1040,40},
    {1040,44},
    {1040,48},
    {1040,52},
    {1040,56},
    {1040,60},
    {1040,64},
    {1040,68},
    {1040,72},
    {1040,76},
    {1041,1},
    {1042,1},
    {1043,1},
    {1044,1},
    {1045,1},
    {1046,1},
    {1047,1},
    {1048,1},
    {1049,1},
    {1050,1},
    {1051,1},
    {1052,1},
    {1053,1},
    {1054,1},
    {1055,1},
    {1056,1},
    {1057,1},
    {1058,1},
    {1059,1},
    {1060,1},
    {1061,1},
    {1062,1},
    {1063,1},
    {1064,1},
    {1065,1},
    {1066,1},
    {1067,1},
    {1068,1},
    {1068,8},
    {1068,16},
    {1068,24},
    {1068,32},
    {1068,40},
    {1068,44},
    {1068,48},
    {1068,52},
    {1068,56},
    {1068,60},
    {1068,64},
    {1068,68},
    {1068,72},
    {1068,76},
    {1069,1},
    {1069,8},
    {1069,16},
    {1069,24},
    {1069,32},
    {1069,40},
    {1069,44},
    {1069,48},
    {1069,52},
    {1069,56},
    {1069,60},
    {1069,64},
    {1069,68},
    {1069,72},
    {1069,76},
    {2001,1},
    {2002,1},
    {2004,1},
    {2005,1},
    {2006,1},
    {2007,1},
    {2008,1},
    {2008,8},
    {2008,16},
    {2008,24},
    {2008,32},
    {2008,40},
    {2008,44},
    {2008,48},
    {2008,52},
    {2008,56},
    {2008,60},
    {2008,64},
    {2008,68},
    {2008,72},
    {2008,76},
    {2009,1},
    {2009,8},
    {2009,16},
    {2009,24},
    {2009,32},
    {2009,40},
    {2009,44},
    {2009,48},
    {2009,52},
    {2009,56},
    {2009,60},
    {2009,64},
    {2009,68},
    {2009,72},
    {2009,76},
    {2010,1},
    {2010,8},
    {2010,16},
    {2010,24},
    {2010,32},
    {2010,40},
    {2010,44},
    {2010,48},
    {2010,52},
    {2010,56},
    {2010,60},
    {2010,64},
    {2010,68},
    {2010,72},
    {2010,76},
    {2011,1},
    {2011,8},
    {2011,16},
    {2011,24},
    {2011,32},
    {2011,40},
    {2011,44},
    {2011,48},
    {2011,52},
    {2011,56},
    {2011,60},
    {2011,64},
    {2011,68},
    {2011,72},
    {2011,76},
    {2012,1},
    {2012,8},
    {2012,16},
    {2012,24},
    {2012,32},
    {2012,40},
    {2012,44},
    {2012,48},
    {2012,52},
    {2012,56},
    {2012,60},
    {2012,64},
    {2012,68},
    {2012,72},
    {2012,76},
    {2013,1},
    {2014,1},
    {2015,1},
    {2016,1},
    {2017,1},
    {2018,1},
    {2019,1},
    {2020,1},
    {2020,8},
    {2020,16},
    {2020,24},
    {2020,32},
    {2020,40},
    {2020,44},
    {2020,48},
    {2020,52},
    {2020,56},
    {2020,60},
    {2020,64},
    {2020,68},
    {2020,72},
    {2020,76},
    {2021,1},
    {2021,8},
    {2021,16},
    {2021,24},
    {2021,32},
    {2021,40},
    {2021,44},
    {2021,48},
    {2021,52},
    {2021,56},
    {2021,60},
    {2021,64},
    {2021,68},
    {2021,72},
    {2021,76},
    {2022,1},
    {2022,8},
    {2022,16},
    {2022,24},
    {2022,32},
    {2022,40},
    {2022,44},
    {2022,48},
    {2022,52},
    {2022,56},
    {2022,60},
    {2022,64},
    {2022,68},
    {2022,72},
    {2022,76},
    {2023,1},
    {2023,8},
    {2023,16},
    {2023,24},
    {2023,32},
    {2023,40},
    {2023,44},
    {2023,48},
    {2023,52},
    {2023,56},
    {2023,60},
    {2023,64},
    {2023,68},
    {2023,72},
    {2023,76},
    {2024,1},
    {2024,8},
    {2024,16},
    {2024,24},
    {2024,32},
    {2024,40},
    {2024,44},
    {2024,48},
    {2024,52},
    {2024,56},
    {2024,60},
    {2024,64},
    {2024,68},
    {2024,72},
    {2024,76},
    {2025,1},
    {2025,8},
    {2025,16},
    {2025,24},
    {2025,32},
    {2025,40},
    {2025,44},
    {2025,48},
    {2025,52},
    {2025,56},
    {2025,60},
    {2025,64},
    {2025,68},
    {2025,72},
    {2025,76},
    {2026,1},
    {2026,8},
    {2026,16},
    {2026,24},
    {2026,32},
    {2026,40},
    {2026,44},
    {2026,48},
    {2026,52},
    {2026,56},
    {2026,60},
    {2026,64},
    {2026,68},
    {2026,72},
    {2026,76},
    {2027,1},
    {2027,8},
    {2027,16},
    {2027,24},
    {2027,32},
    {2027,40},
    {2027,44},
    {2027,48},
    {2027,52},
    {2027,56},
    {2027,60},
    {2027,64},
    {2027,68},
    {2027,72},
    {2027,76},
    {2028,32},
    {2028,40},
    {2028,44},
    {2028,48},
    {2028,52},
    {2028,56},
    {2028,60},
    {2028,64},
    {2028,68},
    {2028,72},
    {2028,76},
    {3000,40},
    {3000,50},
    {3000,60},
    {3001,1},
    {3002,1},
    {3003,1},
    {3004,1},
    {3005,1},
    {3006,1},
    {3007,1},
    {3008,1},
    {3009,1},
    {3010,1},
    {3011,1},
    {3012,1},
    {3013,1},
    {3014,1},
    {3015,1},
    {3016,1},
    {3017,1},
    {3018,1},
    {3019,1},
    {3020,1},
    {3021,1},
    {3022,1},
    {3023,1},
    {3024,1},
    {3025,1},
    {3026,1},
    {3027,1},
    {3028,1},
    {3029,1},
    {3030,1},
    {3031,1},
    {3032,1},
    {3033,1},
    {3034,1},
    {3035,1},
    {3036,1},
    {3037,1},
    {3038,1},
    {3039,1},
    {3040,1},
    {3041,1},
    {3042,1},
    {3043,1},
    {3044,1},
    {3045,1},
    {3046,1},
    {3047,1},
    {3048,1},
    {3049,1},
    {3050,1},
    {3051,1},
    {3052,1},
    {3053,1},
    {3054,1},
    {3055,1},
    {3056,1},
    {3057,1},
    {3058,1},
    {3059,1},
    {3060,1},
    {3061,1},
    {3062,1},
    {3063,1},
    {3064,1},
    {3065,1},
    {3066,1},
    {3067,1},
    {3068,1},
    {3069,1},
    {3070,1},
    {3071,1},
    {3072,1},
    {3073,1},
    {3074,1},
    {3075,1},
    {3076,1},
    {3077,1},
    {3078,1},
    {3079,1},
    {3080,1},
    {3081,1},
    {3082,1},
    {3083,1},
    {3084,1},
    {3085,1},
    {3086,1},
    {3087,1},
    {3088,1},
    {3089,1},
    {3090,1},
    {3091,1},
    {3092,1},
    {3093,1},
    {3094,1},
    {3095,1},
    {3096,1},
    {3097,1},
    {3098,1},
    {3099,1},
    {3100,1},
    {3101,1},
    {3102,1},
    {3103,1},
    {3104,1},
    {3105,1},
    {3106,1},
    {3107,1},
    {3108,1},
    {3109,1},
    {3110,1},
    {3111,1},
    {3112,1},
    {3113,1},
    {3114,1},
    {3115,1},
    {3116,1},
    {3117,1},
    {3118,1},
    {3119,1},
    {3120,1},
    {3121,1},
    {3122,1},
    {3123,1},
    {3124,1},
    {3125,1},
    {3126,1},
    {3127,1},
    {3128,1},
    {3129,1},
    {3130,1},
    {3131,1},
    {3132,1},
    {3133,1},
    {3134,1},
    {3135,1},
    {3136,1},
    {3137,1},
    {3138,1},
    {3139,1},
    {3140,1},
    {3141,1},
    {3142,1},
    {3143,1},
    {3144,1},
    {3145,1},
    {3146,1},
    {3147,1},
    {3148,1},
    {3149,1},
    {3150,1},
    {3151,1},
    {3152,1},
    {3153,1},
    {3154,1},
    {3155,1},
    {3156,1},
    {3157,1},
    {3158,1},
    {3159,1},
    {3160,1},
    {3161,1},
    {3162,1},
    {3163,1},
    {3164,1},
    {3165,1},
    {3166,1},
    {3167,1},
    {3168,1},
    {3169,1},
    {3170,1},
    {3171,1},
    {3172,1},
    {3173,1},
    {3174,1},
    {3175,1},
    {3176,1},
    {3177,1},
    {3178,1},
    {3179,1},
    {3180,1},
    {3181,1},
    {3182,1},
    {3183,1},
    {3184,1},
    {3185,1},
    {3186,1},
    {3187,1},
    {3188,1},
    {3189,1},
    {3190,1},
    {3191,1},
    {3192,1},
    {3193,1},
    {3194,1},
    {3195,1},
    {3196,1},
    {3197,1},
    {3198,1},
    {3199,1},
    {3200,1},
    {3201,1},
    {3202,1},
    {3203,1},
    {3204,1},
    {3205,1},
    {3206,1},
    {3207,1},
    {3208,1},
    {3209,1},
    {3210,1},
    {3211,1},
    {3212,1},
    {3213,1},
    {3214,1},
    {3215,1},
    {3216,1},
    {3217,1},
    {3218,1},
    {3219,1},
    {3220,1},
    {3221,1},
    {3222,1},
    {3223,1},
    {3224,1},
    {3225,1},
    {3226,1},
    {3227,1},
    {3228,1},
    {3229,1},
    {3230,1},
    {3231,1},
    {3232,1},
    {3233,1},
    {3234,1},
    {3235,1},
    {3236,1},
    {3237,1},
    {3238,1},
    {3239,1},
    {3240,1},
    {3241,1},
    {3242,1},
    {3243,1},
    {3244,1},
    {3245,1},
    {3246,1},
    {3247,1},
    {3248,1},
    {3249,1},
    {3250,1},
    {3251,1},
    {3252,1},
    {3253,1},
    {3254,1},
    {3255,1},
    {3256,1},
    {3257,1},
    {3258,1},
    {3259,1},
    {3260,1},
    {3261,1},
    {3262,1},
    {3263,1},
    {3264,1},
    {3265,1},
    {3266,1},
    {3267,1},
    {3268,1},
    {3269,1},
    {3270,1},
    {3271,1},
    {3272,1},
    {3273,1},
    {3274,1},
    {3275,1},
    {3276,1},
    {3277,1},
    {3278,1},
    {3279,1},
    {3280,1},
    {3281,1},
    {3282,1},
    {3283,1},
    {3284,1},
    {3285,1},
    {3286,1},
    {3287,1},
    {3288,1},
    {3289,1},
    {3290,1},
    {3291,1},
    {3292,1},
    {3293,1},
    {3294,1},
    {3295,1},
    {3296,1},
    {3297,1},
    {3298,1},
    {3299,1},
    {3300,1},
    {3301,1},
    {3302,1},
    {3303,1},
    {3304,1},
    {3305,1},
    {3306,1},
    {3307,1},
    {3308,1},
    {3309,1},
    {3310,1},
    {3311,1},
    {3312,1},
    {3313,1},
    {3314,1},
    {3315,1},
    {3316,1},
    {3317,1},
    {3318,1},
    {3319,1},
    {3320,1},
    {3321,1},
    {3322,1},
    {3323,1},
    {3324,1},
    {3325,1},
    {3326,1},
    {3327,1},
    {3328,1},
    {3329,1},
    {3330,1},
    {3331,1},
    {3332,1},
    {3333,1},
    {3334,1},
    {3335,1},
    {3336,1},
    {3337,1},
    {3338,1},
    {3339,1},
    {3340,1},
    {3341,1},
    {3342,1},
    {3343,1},
    {3344,1},
    {3345,1},
    {3346,1},
    {3347,1},
    {3348,1},
    {3349,1},
    {3350,1},
    {3351,1},
    {3352,1},
    {3353,1},
    {3354,1},
    {3354,8},
    {3354,16},
    {3354,24},
    {3354,32},
    {3354,40},
    {3354,44},
    {3354,48},
    {3354,52},
    {3354,56},
    {3354,60},
    {3354,64},
    {3354,68},
    {3354,72},
    {3354,76}
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
    15,
    16,
    17,
    18,
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
    1015,
    1016,
    1017,
    1018,
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
    2001,
    2002,
    2004,
    2005,
    2006,
    2007,
    2008,
    2009,
    2010,
    2011,
    2012,
    2013,
    2014,
    2015,
    2016,
    2017,
    2018,
    2019,
    2020,
    2021,
    2022,
    2023,
    2024,
    2025,
    2026,
    2027,
    2028,
    3000,
    3001,
    3002,
    3003,
    3004,
    3005,
    3006,
    3007,
    3008,
    3009,
    3010,
    3011,
    3012,
    3013,
    3014,
    3015,
    3016,
    3017,
    3018,
    3019,
    3020,
    3021,
    3022,
    3023,
    3024,
    3025,
    3026,
    3027,
    3028,
    3029,
    3030,
    3031,
    3032,
    3033,
    3034,
    3035,
    3036,
    3037,
    3038,
    3039,
    3040,
    3041,
    3042,
    3043,
    3044,
    3045,
    3046,
    3047,
    3048,
    3049,
    3050,
    3051,
    3052,
    3053,
    3054,
    3055,
    3056,
    3057,
    3058,
    3059,
    3060,
    3061,
    3062,
    3063,
    3064,
    3065,
    3066,
    3067,
    3068,
    3069,
    3070,
    3071,
    3072,
    3073,
    3074,
    3075,
    3076,
    3077,
    3078,
    3079,
    3080,
    3081,
    3082,
    3083,
    3084,
    3085,
    3086,
    3087,
    3088,
    3089,
    3090,
    3091,
    3092,
    3093,
    3094,
    3095,
    3096,
    3097,
    3098,
    3099,
    3100,
    3101,
    3102,
    3103,
    3104,
    3105,
    3106,
    3107,
    3108,
    3109,
    3110,
    3111,
    3112,
    3113,
    3114,
    3115,
    3116,
    3117,
    3118,
    3119,
    3120,
    3121,
    3122,
    3123,
    3124,
    3125,
    3126,
    3127,
    3128,
    3129,
    3130,
    3131,
    3132,
    3133,
    3134,
    3135,
    3136,
    3137,
    3138,
    3139,
    3140,
    3141,
    3142,
    3143,
    3144,
    3145,
    3146,
    3147,
    3148,
    3149,
    3150,
    3151,
    3152,
    3153,
    3154,
    3155,
    3156,
    3157,
    3158,
    3159,
    3160,
    3161,
    3162,
    3163,
    3164,
    3165,
    3166,
    3167,
    3168,
    3169,
    3170,
    3171,
    3172,
    3173,
    3174,
    3175,
    3176,
    3177,
    3178,
    3179,
    3180,
    3181,
    3182,
    3183,
    3184,
    3185,
    3186,
    3187,
    3188,
    3189,
    3190,
    3191,
    3192,
    3193,
    3194,
    3195,
    3196,
    3197,
    3198,
    3199,
    3200,
    3201,
    3202,
    3203,
    3204,
    3205,
    3206,
    3207,
    3208,
    3209,
    3210,
    3211,
    3212,
    3213,
    3214,
    3215,
    3216,
    3217,
    3218,
    3219,
    3220,
    3221,
    3222,
    3223,
    3224,
    3225,
    3226,
    3227,
    3228,
    3229,
    3230,
    3231,
    3232,
    3233,
    3234,
    3235,
    3236,
    3237,
    3238,
    3239,
    3240,
    3241,
    3242,
    3243,
    3244,
    3245,
    3246,
    3247,
    3248,
    3249,
    3250,
    3251,
    3252,
    3253,
    3254,
    3255,
    3256,
    3257,
    3258,
    3259,
    3260,
    3261,
    3262,
    3263,
    3264,
    3265,
    3266,
    3267,
    3268,
    3269,
    3270,
    3271,
    3272,
    3273,
    3274,
    3275,
    3276,
    3277,
    3278,
    3279,
    3280,
    3281,
    3282,
    3283,
    3284,
    3285,
    3286,
    3287,
    3288,
    3289,
    3290,
    3291,
    3292,
    3293,
    3294,
    3295,
    3296,
    3297,
    3298,
    3299,
    3300,
    3301,
    3302,
    3303,
    3304,
    3305,
    3306,
    3307,
    3308,
    3309,
    3310,
    3311,
    3312,
    3313,
    3314,
    3315,
    3316,
    3317,
    3318,
    3319,
    3320,
    3321,
    3322,
    3323,
    3324,
    3325,
    3326,
    3327,
    3328,
    3329,
    3330,
    3331,
    3332,
    3333,
    3334,
    3335,
    3336,
    3337,
    3338,
    3339,
    3340,
    3341,
    3342,
    3343,
    3344,
    3345,
    3346,
    3347,
    3348,
    3349,
    3350,
    3351,
    3352,
    3353,
    3354
    ].

get2KeyList(1)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(2)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(3)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(4)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(5)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(6)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(7)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(8)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(9)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(10)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(11)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(12)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(15)->[
    1,
    4,
    8,
    16,
    24,
    32,
    40,
    48,
    56,
    60
    ];
get2KeyList(16)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(17)->[
    1,
    4,
    8,
    16,
    24,
    32,
    40,
    48,
    56,
    60
    ];
get2KeyList(18)->[
    1,
    4,
    8,
    16,
    24,
    32,
    40,
    48,
    56,
    60
    ];
get2KeyList(20)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(21)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(22)->[
    1
    ];
get2KeyList(23)->[
    1
    ];
get2KeyList(24)->[
    1
    ];
get2KeyList(25)->[
    1
    ];
get2KeyList(26)->[
    1
    ];
get2KeyList(27)->[
    1
    ];
get2KeyList(28)->[
    1
    ];
get2KeyList(29)->[
    1
    ];
get2KeyList(30)->[
    1
    ];
get2KeyList(31)->[
    1
    ];
get2KeyList(32)->[
    1
    ];
get2KeyList(33)->[
    1
    ];
get2KeyList(34)->[
    1
    ];
get2KeyList(35)->[
    1
    ];
get2KeyList(36)->[
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(37)->[
    1
    ];
get2KeyList(38)->[
    1
    ];
get2KeyList(39)->[
    1
    ];
get2KeyList(40)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(41)->[
    1
    ];
get2KeyList(42)->[
    1
    ];
get2KeyList(43)->[
    1
    ];
get2KeyList(44)->[
    1
    ];
get2KeyList(45)->[
    1
    ];
get2KeyList(46)->[
    1
    ];
get2KeyList(47)->[
    1
    ];
get2KeyList(48)->[
    1
    ];
get2KeyList(49)->[
    1
    ];
get2KeyList(50)->[
    1
    ];
get2KeyList(51)->[
    1
    ];
get2KeyList(52)->[
    1
    ];
get2KeyList(53)->[
    1
    ];
get2KeyList(54)->[
    1
    ];
get2KeyList(55)->[
    1
    ];
get2KeyList(56)->[
    1
    ];
get2KeyList(57)->[
    1
    ];
get2KeyList(58)->[
    1
    ];
get2KeyList(59)->[
    1
    ];
get2KeyList(60)->[
    1
    ];
get2KeyList(61)->[
    1
    ];
get2KeyList(62)->[
    1
    ];
get2KeyList(63)->[
    1
    ];
get2KeyList(64)->[
    1
    ];
get2KeyList(65)->[
    1
    ];
get2KeyList(66)->[
    1
    ];
get2KeyList(67)->[
    1
    ];
get2KeyList(68)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(69)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(1001)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(1002)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(1003)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(1004)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(1005)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(1006)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(1007)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(1008)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(1009)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(1010)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(1011)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(1012)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(1015)->[
    1,
    4,
    8,
    16,
    24,
    32,
    40,
    48,
    56,
    60
    ];
get2KeyList(1016)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(1017)->[
    1,
    4,
    8,
    16,
    24,
    32,
    40,
    48,
    56,
    60
    ];
get2KeyList(1018)->[
    1,
    4,
    8,
    16,
    24,
    32,
    40,
    48,
    56,
    60
    ];
get2KeyList(1020)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(1021)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(1022)->[
    1
    ];
get2KeyList(1023)->[
    1
    ];
get2KeyList(1024)->[
    1
    ];
get2KeyList(1025)->[
    1
    ];
get2KeyList(1026)->[
    1
    ];
get2KeyList(1027)->[
    1
    ];
get2KeyList(1028)->[
    1
    ];
get2KeyList(1029)->[
    1
    ];
get2KeyList(1030)->[
    1
    ];
get2KeyList(1031)->[
    1
    ];
get2KeyList(1032)->[
    1
    ];
get2KeyList(1033)->[
    1
    ];
get2KeyList(1034)->[
    1
    ];
get2KeyList(1035)->[
    1
    ];
get2KeyList(1036)->[
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(1037)->[
    1
    ];
get2KeyList(1038)->[
    1
    ];
get2KeyList(1039)->[
    1
    ];
get2KeyList(1040)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(1041)->[
    1
    ];
get2KeyList(1042)->[
    1
    ];
get2KeyList(1043)->[
    1
    ];
get2KeyList(1044)->[
    1
    ];
get2KeyList(1045)->[
    1
    ];
get2KeyList(1046)->[
    1
    ];
get2KeyList(1047)->[
    1
    ];
get2KeyList(1048)->[
    1
    ];
get2KeyList(1049)->[
    1
    ];
get2KeyList(1050)->[
    1
    ];
get2KeyList(1051)->[
    1
    ];
get2KeyList(1052)->[
    1
    ];
get2KeyList(1053)->[
    1
    ];
get2KeyList(1054)->[
    1
    ];
get2KeyList(1055)->[
    1
    ];
get2KeyList(1056)->[
    1
    ];
get2KeyList(1057)->[
    1
    ];
get2KeyList(1058)->[
    1
    ];
get2KeyList(1059)->[
    1
    ];
get2KeyList(1060)->[
    1
    ];
get2KeyList(1061)->[
    1
    ];
get2KeyList(1062)->[
    1
    ];
get2KeyList(1063)->[
    1
    ];
get2KeyList(1064)->[
    1
    ];
get2KeyList(1065)->[
    1
    ];
get2KeyList(1066)->[
    1
    ];
get2KeyList(1067)->[
    1
    ];
get2KeyList(1068)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(1069)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(2001)->[
    1
    ];
get2KeyList(2002)->[
    1
    ];
get2KeyList(2004)->[
    1
    ];
get2KeyList(2005)->[
    1
    ];
get2KeyList(2006)->[
    1
    ];
get2KeyList(2007)->[
    1
    ];
get2KeyList(2008)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(2009)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(2010)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(2011)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(2012)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(2013)->[
    1
    ];
get2KeyList(2014)->[
    1
    ];
get2KeyList(2015)->[
    1
    ];
get2KeyList(2016)->[
    1
    ];
get2KeyList(2017)->[
    1
    ];
get2KeyList(2018)->[
    1
    ];
get2KeyList(2019)->[
    1
    ];
get2KeyList(2020)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(2021)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(2022)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(2023)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(2024)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(2025)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(2026)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(2027)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(2028)->[
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(3000)->[
    40,
    50,
    60
    ];
get2KeyList(3001)->[
    1
    ];
get2KeyList(3002)->[
    1
    ];
get2KeyList(3003)->[
    1
    ];
get2KeyList(3004)->[
    1
    ];
get2KeyList(3005)->[
    1
    ];
get2KeyList(3006)->[
    1
    ];
get2KeyList(3007)->[
    1
    ];
get2KeyList(3008)->[
    1
    ];
get2KeyList(3009)->[
    1
    ];
get2KeyList(3010)->[
    1
    ];
get2KeyList(3011)->[
    1
    ];
get2KeyList(3012)->[
    1
    ];
get2KeyList(3013)->[
    1
    ];
get2KeyList(3014)->[
    1
    ];
get2KeyList(3015)->[
    1
    ];
get2KeyList(3016)->[
    1
    ];
get2KeyList(3017)->[
    1
    ];
get2KeyList(3018)->[
    1
    ];
get2KeyList(3019)->[
    1
    ];
get2KeyList(3020)->[
    1
    ];
get2KeyList(3021)->[
    1
    ];
get2KeyList(3022)->[
    1
    ];
get2KeyList(3023)->[
    1
    ];
get2KeyList(3024)->[
    1
    ];
get2KeyList(3025)->[
    1
    ];
get2KeyList(3026)->[
    1
    ];
get2KeyList(3027)->[
    1
    ];
get2KeyList(3028)->[
    1
    ];
get2KeyList(3029)->[
    1
    ];
get2KeyList(3030)->[
    1
    ];
get2KeyList(3031)->[
    1
    ];
get2KeyList(3032)->[
    1
    ];
get2KeyList(3033)->[
    1
    ];
get2KeyList(3034)->[
    1
    ];
get2KeyList(3035)->[
    1
    ];
get2KeyList(3036)->[
    1
    ];
get2KeyList(3037)->[
    1
    ];
get2KeyList(3038)->[
    1
    ];
get2KeyList(3039)->[
    1
    ];
get2KeyList(3040)->[
    1
    ];
get2KeyList(3041)->[
    1
    ];
get2KeyList(3042)->[
    1
    ];
get2KeyList(3043)->[
    1
    ];
get2KeyList(3044)->[
    1
    ];
get2KeyList(3045)->[
    1
    ];
get2KeyList(3046)->[
    1
    ];
get2KeyList(3047)->[
    1
    ];
get2KeyList(3048)->[
    1
    ];
get2KeyList(3049)->[
    1
    ];
get2KeyList(3050)->[
    1
    ];
get2KeyList(3051)->[
    1
    ];
get2KeyList(3052)->[
    1
    ];
get2KeyList(3053)->[
    1
    ];
get2KeyList(3054)->[
    1
    ];
get2KeyList(3055)->[
    1
    ];
get2KeyList(3056)->[
    1
    ];
get2KeyList(3057)->[
    1
    ];
get2KeyList(3058)->[
    1
    ];
get2KeyList(3059)->[
    1
    ];
get2KeyList(3060)->[
    1
    ];
get2KeyList(3061)->[
    1
    ];
get2KeyList(3062)->[
    1
    ];
get2KeyList(3063)->[
    1
    ];
get2KeyList(3064)->[
    1
    ];
get2KeyList(3065)->[
    1
    ];
get2KeyList(3066)->[
    1
    ];
get2KeyList(3067)->[
    1
    ];
get2KeyList(3068)->[
    1
    ];
get2KeyList(3069)->[
    1
    ];
get2KeyList(3070)->[
    1
    ];
get2KeyList(3071)->[
    1
    ];
get2KeyList(3072)->[
    1
    ];
get2KeyList(3073)->[
    1
    ];
get2KeyList(3074)->[
    1
    ];
get2KeyList(3075)->[
    1
    ];
get2KeyList(3076)->[
    1
    ];
get2KeyList(3077)->[
    1
    ];
get2KeyList(3078)->[
    1
    ];
get2KeyList(3079)->[
    1
    ];
get2KeyList(3080)->[
    1
    ];
get2KeyList(3081)->[
    1
    ];
get2KeyList(3082)->[
    1
    ];
get2KeyList(3083)->[
    1
    ];
get2KeyList(3084)->[
    1
    ];
get2KeyList(3085)->[
    1
    ];
get2KeyList(3086)->[
    1
    ];
get2KeyList(3087)->[
    1
    ];
get2KeyList(3088)->[
    1
    ];
get2KeyList(3089)->[
    1
    ];
get2KeyList(3090)->[
    1
    ];
get2KeyList(3091)->[
    1
    ];
get2KeyList(3092)->[
    1
    ];
get2KeyList(3093)->[
    1
    ];
get2KeyList(3094)->[
    1
    ];
get2KeyList(3095)->[
    1
    ];
get2KeyList(3096)->[
    1
    ];
get2KeyList(3097)->[
    1
    ];
get2KeyList(3098)->[
    1
    ];
get2KeyList(3099)->[
    1
    ];
get2KeyList(3100)->[
    1
    ];
get2KeyList(3101)->[
    1
    ];
get2KeyList(3102)->[
    1
    ];
get2KeyList(3103)->[
    1
    ];
get2KeyList(3104)->[
    1
    ];
get2KeyList(3105)->[
    1
    ];
get2KeyList(3106)->[
    1
    ];
get2KeyList(3107)->[
    1
    ];
get2KeyList(3108)->[
    1
    ];
get2KeyList(3109)->[
    1
    ];
get2KeyList(3110)->[
    1
    ];
get2KeyList(3111)->[
    1
    ];
get2KeyList(3112)->[
    1
    ];
get2KeyList(3113)->[
    1
    ];
get2KeyList(3114)->[
    1
    ];
get2KeyList(3115)->[
    1
    ];
get2KeyList(3116)->[
    1
    ];
get2KeyList(3117)->[
    1
    ];
get2KeyList(3118)->[
    1
    ];
get2KeyList(3119)->[
    1
    ];
get2KeyList(3120)->[
    1
    ];
get2KeyList(3121)->[
    1
    ];
get2KeyList(3122)->[
    1
    ];
get2KeyList(3123)->[
    1
    ];
get2KeyList(3124)->[
    1
    ];
get2KeyList(3125)->[
    1
    ];
get2KeyList(3126)->[
    1
    ];
get2KeyList(3127)->[
    1
    ];
get2KeyList(3128)->[
    1
    ];
get2KeyList(3129)->[
    1
    ];
get2KeyList(3130)->[
    1
    ];
get2KeyList(3131)->[
    1
    ];
get2KeyList(3132)->[
    1
    ];
get2KeyList(3133)->[
    1
    ];
get2KeyList(3134)->[
    1
    ];
get2KeyList(3135)->[
    1
    ];
get2KeyList(3136)->[
    1
    ];
get2KeyList(3137)->[
    1
    ];
get2KeyList(3138)->[
    1
    ];
get2KeyList(3139)->[
    1
    ];
get2KeyList(3140)->[
    1
    ];
get2KeyList(3141)->[
    1
    ];
get2KeyList(3142)->[
    1
    ];
get2KeyList(3143)->[
    1
    ];
get2KeyList(3144)->[
    1
    ];
get2KeyList(3145)->[
    1
    ];
get2KeyList(3146)->[
    1
    ];
get2KeyList(3147)->[
    1
    ];
get2KeyList(3148)->[
    1
    ];
get2KeyList(3149)->[
    1
    ];
get2KeyList(3150)->[
    1
    ];
get2KeyList(3151)->[
    1
    ];
get2KeyList(3152)->[
    1
    ];
get2KeyList(3153)->[
    1
    ];
get2KeyList(3154)->[
    1
    ];
get2KeyList(3155)->[
    1
    ];
get2KeyList(3156)->[
    1
    ];
get2KeyList(3157)->[
    1
    ];
get2KeyList(3158)->[
    1
    ];
get2KeyList(3159)->[
    1
    ];
get2KeyList(3160)->[
    1
    ];
get2KeyList(3161)->[
    1
    ];
get2KeyList(3162)->[
    1
    ];
get2KeyList(3163)->[
    1
    ];
get2KeyList(3164)->[
    1
    ];
get2KeyList(3165)->[
    1
    ];
get2KeyList(3166)->[
    1
    ];
get2KeyList(3167)->[
    1
    ];
get2KeyList(3168)->[
    1
    ];
get2KeyList(3169)->[
    1
    ];
get2KeyList(3170)->[
    1
    ];
get2KeyList(3171)->[
    1
    ];
get2KeyList(3172)->[
    1
    ];
get2KeyList(3173)->[
    1
    ];
get2KeyList(3174)->[
    1
    ];
get2KeyList(3175)->[
    1
    ];
get2KeyList(3176)->[
    1
    ];
get2KeyList(3177)->[
    1
    ];
get2KeyList(3178)->[
    1
    ];
get2KeyList(3179)->[
    1
    ];
get2KeyList(3180)->[
    1
    ];
get2KeyList(3181)->[
    1
    ];
get2KeyList(3182)->[
    1
    ];
get2KeyList(3183)->[
    1
    ];
get2KeyList(3184)->[
    1
    ];
get2KeyList(3185)->[
    1
    ];
get2KeyList(3186)->[
    1
    ];
get2KeyList(3187)->[
    1
    ];
get2KeyList(3188)->[
    1
    ];
get2KeyList(3189)->[
    1
    ];
get2KeyList(3190)->[
    1
    ];
get2KeyList(3191)->[
    1
    ];
get2KeyList(3192)->[
    1
    ];
get2KeyList(3193)->[
    1
    ];
get2KeyList(3194)->[
    1
    ];
get2KeyList(3195)->[
    1
    ];
get2KeyList(3196)->[
    1
    ];
get2KeyList(3197)->[
    1
    ];
get2KeyList(3198)->[
    1
    ];
get2KeyList(3199)->[
    1
    ];
get2KeyList(3200)->[
    1
    ];
get2KeyList(3201)->[
    1
    ];
get2KeyList(3202)->[
    1
    ];
get2KeyList(3203)->[
    1
    ];
get2KeyList(3204)->[
    1
    ];
get2KeyList(3205)->[
    1
    ];
get2KeyList(3206)->[
    1
    ];
get2KeyList(3207)->[
    1
    ];
get2KeyList(3208)->[
    1
    ];
get2KeyList(3209)->[
    1
    ];
get2KeyList(3210)->[
    1
    ];
get2KeyList(3211)->[
    1
    ];
get2KeyList(3212)->[
    1
    ];
get2KeyList(3213)->[
    1
    ];
get2KeyList(3214)->[
    1
    ];
get2KeyList(3215)->[
    1
    ];
get2KeyList(3216)->[
    1
    ];
get2KeyList(3217)->[
    1
    ];
get2KeyList(3218)->[
    1
    ];
get2KeyList(3219)->[
    1
    ];
get2KeyList(3220)->[
    1
    ];
get2KeyList(3221)->[
    1
    ];
get2KeyList(3222)->[
    1
    ];
get2KeyList(3223)->[
    1
    ];
get2KeyList(3224)->[
    1
    ];
get2KeyList(3225)->[
    1
    ];
get2KeyList(3226)->[
    1
    ];
get2KeyList(3227)->[
    1
    ];
get2KeyList(3228)->[
    1
    ];
get2KeyList(3229)->[
    1
    ];
get2KeyList(3230)->[
    1
    ];
get2KeyList(3231)->[
    1
    ];
get2KeyList(3232)->[
    1
    ];
get2KeyList(3233)->[
    1
    ];
get2KeyList(3234)->[
    1
    ];
get2KeyList(3235)->[
    1
    ];
get2KeyList(3236)->[
    1
    ];
get2KeyList(3237)->[
    1
    ];
get2KeyList(3238)->[
    1
    ];
get2KeyList(3239)->[
    1
    ];
get2KeyList(3240)->[
    1
    ];
get2KeyList(3241)->[
    1
    ];
get2KeyList(3242)->[
    1
    ];
get2KeyList(3243)->[
    1
    ];
get2KeyList(3244)->[
    1
    ];
get2KeyList(3245)->[
    1
    ];
get2KeyList(3246)->[
    1
    ];
get2KeyList(3247)->[
    1
    ];
get2KeyList(3248)->[
    1
    ];
get2KeyList(3249)->[
    1
    ];
get2KeyList(3250)->[
    1
    ];
get2KeyList(3251)->[
    1
    ];
get2KeyList(3252)->[
    1
    ];
get2KeyList(3253)->[
    1
    ];
get2KeyList(3254)->[
    1
    ];
get2KeyList(3255)->[
    1
    ];
get2KeyList(3256)->[
    1
    ];
get2KeyList(3257)->[
    1
    ];
get2KeyList(3258)->[
    1
    ];
get2KeyList(3259)->[
    1
    ];
get2KeyList(3260)->[
    1
    ];
get2KeyList(3261)->[
    1
    ];
get2KeyList(3262)->[
    1
    ];
get2KeyList(3263)->[
    1
    ];
get2KeyList(3264)->[
    1
    ];
get2KeyList(3265)->[
    1
    ];
get2KeyList(3266)->[
    1
    ];
get2KeyList(3267)->[
    1
    ];
get2KeyList(3268)->[
    1
    ];
get2KeyList(3269)->[
    1
    ];
get2KeyList(3270)->[
    1
    ];
get2KeyList(3271)->[
    1
    ];
get2KeyList(3272)->[
    1
    ];
get2KeyList(3273)->[
    1
    ];
get2KeyList(3274)->[
    1
    ];
get2KeyList(3275)->[
    1
    ];
get2KeyList(3276)->[
    1
    ];
get2KeyList(3277)->[
    1
    ];
get2KeyList(3278)->[
    1
    ];
get2KeyList(3279)->[
    1
    ];
get2KeyList(3280)->[
    1
    ];
get2KeyList(3281)->[
    1
    ];
get2KeyList(3282)->[
    1
    ];
get2KeyList(3283)->[
    1
    ];
get2KeyList(3284)->[
    1
    ];
get2KeyList(3285)->[
    1
    ];
get2KeyList(3286)->[
    1
    ];
get2KeyList(3287)->[
    1
    ];
get2KeyList(3288)->[
    1
    ];
get2KeyList(3289)->[
    1
    ];
get2KeyList(3290)->[
    1
    ];
get2KeyList(3291)->[
    1
    ];
get2KeyList(3292)->[
    1
    ];
get2KeyList(3293)->[
    1
    ];
get2KeyList(3294)->[
    1
    ];
get2KeyList(3295)->[
    1
    ];
get2KeyList(3296)->[
    1
    ];
get2KeyList(3297)->[
    1
    ];
get2KeyList(3298)->[
    1
    ];
get2KeyList(3299)->[
    1
    ];
get2KeyList(3300)->[
    1
    ];
get2KeyList(3301)->[
    1
    ];
get2KeyList(3302)->[
    1
    ];
get2KeyList(3303)->[
    1
    ];
get2KeyList(3304)->[
    1
    ];
get2KeyList(3305)->[
    1
    ];
get2KeyList(3306)->[
    1
    ];
get2KeyList(3307)->[
    1
    ];
get2KeyList(3308)->[
    1
    ];
get2KeyList(3309)->[
    1
    ];
get2KeyList(3310)->[
    1
    ];
get2KeyList(3311)->[
    1
    ];
get2KeyList(3312)->[
    1
    ];
get2KeyList(3313)->[
    1
    ];
get2KeyList(3314)->[
    1
    ];
get2KeyList(3315)->[
    1
    ];
get2KeyList(3316)->[
    1
    ];
get2KeyList(3317)->[
    1
    ];
get2KeyList(3318)->[
    1
    ];
get2KeyList(3319)->[
    1
    ];
get2KeyList(3320)->[
    1
    ];
get2KeyList(3321)->[
    1
    ];
get2KeyList(3322)->[
    1
    ];
get2KeyList(3323)->[
    1
    ];
get2KeyList(3324)->[
    1
    ];
get2KeyList(3325)->[
    1
    ];
get2KeyList(3326)->[
    1
    ];
get2KeyList(3327)->[
    1
    ];
get2KeyList(3328)->[
    1
    ];
get2KeyList(3329)->[
    1
    ];
get2KeyList(3330)->[
    1
    ];
get2KeyList(3331)->[
    1
    ];
get2KeyList(3332)->[
    1
    ];
get2KeyList(3333)->[
    1
    ];
get2KeyList(3334)->[
    1
    ];
get2KeyList(3335)->[
    1
    ];
get2KeyList(3336)->[
    1
    ];
get2KeyList(3337)->[
    1
    ];
get2KeyList(3338)->[
    1
    ];
get2KeyList(3339)->[
    1
    ];
get2KeyList(3340)->[
    1
    ];
get2KeyList(3341)->[
    1
    ];
get2KeyList(3342)->[
    1
    ];
get2KeyList(3343)->[
    1
    ];
get2KeyList(3344)->[
    1
    ];
get2KeyList(3345)->[
    1
    ];
get2KeyList(3346)->[
    1
    ];
get2KeyList(3347)->[
    1
    ];
get2KeyList(3348)->[
    1
    ];
get2KeyList(3349)->[
    1
    ];
get2KeyList(3350)->[
    1
    ];
get2KeyList(3351)->[
    1
    ];
get2KeyList(3352)->[
    1
    ];
get2KeyList(3353)->[
    1
    ];
get2KeyList(3354)->[
    1,
    8,
    16,
    24,
    32,
    40,
    44,
    48,
    52,
    56,
    60,
    64,
    68,
    72,
    76
    ];
get2KeyList(_)->[].

