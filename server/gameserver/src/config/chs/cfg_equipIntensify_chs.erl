%% coding: latin-1
%%: 实现
-module(cfg_equipIntensify_chs).
-compile(export_all).
-include("cfg_equipIntensify.hrl").
-include("logger.hrl").

getRow(1,1)->
    #equipIntensifyCfg {
    iD = 1,
    level = 1,
    class = 1,
    baseBonus = 0,
    mainHandBonus = [{30,9,0},{31,9,0}],
    offHandBonus = [{4,17,0},{6,70,0}],
    chestBonus = [{4,17,0},{6,70,0}],
    bootBonus = [{26,35,0},{28,35,0}],
    ringBonus = [{1,14,0}],
    amuletBonus = [{1,14,0}],
    helmBonus = [{4,17,0},{6,70,0}],
    pantBonus = [{26,35,0},{28,35,0}],
    goldCost = 0,
    materialCost = [{222,10}]
    };
getRow(1,2)->
    #equipIntensifyCfg {
    iD = 21,
    level = 1,
    class = 2,
    baseBonus = 0,
    mainHandBonus = [{30,9,0},{31,9,0}],
    offHandBonus = [{4,17,0},{6,70,0}],
    chestBonus = [{4,17,0},{6,70,0}],
    bootBonus = [{26,35,0},{28,35,0}],
    ringBonus = [{3,14,0}],
    amuletBonus = [{3,14,0}],
    helmBonus = [{4,17,0},{6,70,0}],
    pantBonus = [{26,35,0},{28,35,0}],
    goldCost = 0,
    materialCost = [{222,10}]
    };
getRow(1,3)->
    #equipIntensifyCfg {
    iD = 41,
    level = 1,
    class = 3,
    baseBonus = 0,
    mainHandBonus = [{31,9,0},{33,9,0}],
    offHandBonus = [{4,17,0},{6,70,0}],
    chestBonus = [{4,17,0},{6,70,0}],
    bootBonus = [{26,35,0},{28,35,0}],
    ringBonus = [{2,14,0}],
    amuletBonus = [{2,14,0}],
    helmBonus = [{4,17,0},{6,70,0}],
    pantBonus = [{26,35,0},{28,35,0}],
    goldCost = 0,
    materialCost = [{222,10}]
    };
getRow(1,4)->
    #equipIntensifyCfg {
    iD = 61,
    level = 1,
    class = 4,
    baseBonus = 0,
    mainHandBonus = [{31,9,0},{32,9,0}],
    offHandBonus = [{4,17,0},{6,70,0}],
    chestBonus = [{4,17,0},{6,70,0}],
    bootBonus = [{26,35,0},{28,35,0}],
    ringBonus = [{1,14,0}],
    amuletBonus = [{1,14,0}],
    helmBonus = [{4,17,0},{6,70,0}],
    pantBonus = [{26,35,0},{28,35,0}],
    goldCost = 0,
    materialCost = [{222,10}]
    };
getRow(2,1)->
    #equipIntensifyCfg {
    iD = 2,
    level = 2,
    class = 1,
    baseBonus = 0,
    mainHandBonus = [{30,10,0},{31,10,0}],
    offHandBonus = [{4,20,0},{6,83,0}],
    chestBonus = [{4,20,0},{6,83,0}],
    bootBonus = [{26,41,0},{28,41,0}],
    ringBonus = [{1,16,0}],
    amuletBonus = [{1,16,0}],
    helmBonus = [{4,20,0},{6,83,0}],
    pantBonus = [{26,41,0},{28,41,0}],
    goldCost = 0,
    materialCost = [{222,15}]
    };
getRow(2,2)->
    #equipIntensifyCfg {
    iD = 22,
    level = 2,
    class = 2,
    baseBonus = 0,
    mainHandBonus = [{30,10,0},{31,10,0}],
    offHandBonus = [{4,20,0},{6,83,0}],
    chestBonus = [{4,20,0},{6,83,0}],
    bootBonus = [{26,41,0},{28,41,0}],
    ringBonus = [{3,16,0}],
    amuletBonus = [{3,16,0}],
    helmBonus = [{4,20,0},{6,83,0}],
    pantBonus = [{26,41,0},{28,41,0}],
    goldCost = 0,
    materialCost = [{222,15}]
    };
getRow(2,3)->
    #equipIntensifyCfg {
    iD = 42,
    level = 2,
    class = 3,
    baseBonus = 0,
    mainHandBonus = [{31,10,0},{33,10,0}],
    offHandBonus = [{4,20,0},{6,83,0}],
    chestBonus = [{4,20,0},{6,83,0}],
    bootBonus = [{26,41,0},{28,41,0}],
    ringBonus = [{2,16,0}],
    amuletBonus = [{2,16,0}],
    helmBonus = [{4,20,0},{6,83,0}],
    pantBonus = [{26,41,0},{28,41,0}],
    goldCost = 0,
    materialCost = [{222,15}]
    };
getRow(2,4)->
    #equipIntensifyCfg {
    iD = 62,
    level = 2,
    class = 4,
    baseBonus = 0,
    mainHandBonus = [{31,10,0},{32,10,0}],
    offHandBonus = [{4,20,0},{6,83,0}],
    chestBonus = [{4,20,0},{6,83,0}],
    bootBonus = [{26,41,0},{28,41,0}],
    ringBonus = [{1,16,0}],
    amuletBonus = [{1,16,0}],
    helmBonus = [{4,20,0},{6,83,0}],
    pantBonus = [{26,41,0},{28,41,0}],
    goldCost = 0,
    materialCost = [{222,15}]
    };
getRow(3,1)->
    #equipIntensifyCfg {
    iD = 3,
    level = 3,
    class = 1,
    baseBonus = 0,
    mainHandBonus = [{30,12,0},{31,12,0}],
    offHandBonus = [{4,24,0},{6,98,0}],
    chestBonus = [{4,24,0},{6,98,0}],
    bootBonus = [{26,48,0},{28,48,0}],
    ringBonus = [{1,19,0}],
    amuletBonus = [{1,19,0}],
    helmBonus = [{4,24,0},{6,98,0}],
    pantBonus = [{26,48,0},{28,48,0}],
    goldCost = 0,
    materialCost = [{222,25}]
    };
getRow(3,2)->
    #equipIntensifyCfg {
    iD = 23,
    level = 3,
    class = 2,
    baseBonus = 0,
    mainHandBonus = [{30,12,0},{31,12,0}],
    offHandBonus = [{4,24,0},{6,98,0}],
    chestBonus = [{4,24,0},{6,98,0}],
    bootBonus = [{26,48,0},{28,48,0}],
    ringBonus = [{3,19,0}],
    amuletBonus = [{3,19,0}],
    helmBonus = [{4,24,0},{6,98,0}],
    pantBonus = [{26,48,0},{28,48,0}],
    goldCost = 0,
    materialCost = [{222,25}]
    };
getRow(3,3)->
    #equipIntensifyCfg {
    iD = 43,
    level = 3,
    class = 3,
    baseBonus = 0,
    mainHandBonus = [{31,12,0},{33,12,0}],
    offHandBonus = [{4,24,0},{6,98,0}],
    chestBonus = [{4,24,0},{6,98,0}],
    bootBonus = [{26,48,0},{28,48,0}],
    ringBonus = [{2,19,0}],
    amuletBonus = [{2,19,0}],
    helmBonus = [{4,24,0},{6,98,0}],
    pantBonus = [{26,48,0},{28,48,0}],
    goldCost = 0,
    materialCost = [{222,25}]
    };
getRow(3,4)->
    #equipIntensifyCfg {
    iD = 63,
    level = 3,
    class = 4,
    baseBonus = 0,
    mainHandBonus = [{31,12,0},{32,12,0}],
    offHandBonus = [{4,24,0},{6,98,0}],
    chestBonus = [{4,24,0},{6,98,0}],
    bootBonus = [{26,48,0},{28,48,0}],
    ringBonus = [{1,19,0}],
    amuletBonus = [{1,19,0}],
    helmBonus = [{4,24,0},{6,98,0}],
    pantBonus = [{26,48,0},{28,48,0}],
    goldCost = 0,
    materialCost = [{222,25}]
    };
getRow(4,1)->
    #equipIntensifyCfg {
    iD = 4,
    level = 4,
    class = 1,
    baseBonus = 0,
    mainHandBonus = [{30,14,0},{31,14,0}],
    offHandBonus = [{4,28,0},{6,115,0}],
    chestBonus = [{4,28,0},{6,115,0}],
    bootBonus = [{26,57,0},{28,57,0}],
    ringBonus = [{1,22,0}],
    amuletBonus = [{1,22,0}],
    helmBonus = [{4,28,0},{6,115,0}],
    pantBonus = [{26,57,0},{28,57,0}],
    goldCost = 0,
    allBonus = [{1,20,0},{26,50,0},{28,50,0}],
    materialCost = [{222,50}],
    sfx_1 = "w1_1_1",
    sfx_2 = "w1_2_1",
    sfx_3 = "w1_3_1"
    };
getRow(4,2)->
    #equipIntensifyCfg {
    iD = 24,
    level = 4,
    class = 2,
    baseBonus = 0,
    mainHandBonus = [{30,14,0},{31,14,0}],
    offHandBonus = [{4,28,0},{6,115,0}],
    chestBonus = [{4,28,0},{6,115,0}],
    bootBonus = [{26,57,0},{28,57,0}],
    ringBonus = [{3,22,0}],
    amuletBonus = [{3,22,0}],
    helmBonus = [{4,28,0},{6,115,0}],
    pantBonus = [{26,57,0},{28,57,0}],
    goldCost = 0,
    allBonus = [{3,20,0},{26,50,0},{28,50,0}],
    materialCost = [{222,50}],
    sfx_1 = "w2_1_1",
    sfx_2 = "w2_2_1",
    sfx_3 = "w2_3_1"
    };
getRow(4,3)->
    #equipIntensifyCfg {
    iD = 44,
    level = 4,
    class = 3,
    baseBonus = 0,
    mainHandBonus = [{31,14,0},{33,14,0}],
    offHandBonus = [{4,28,0},{6,115,0}],
    chestBonus = [{4,28,0},{6,115,0}],
    bootBonus = [{26,57,0},{28,57,0}],
    ringBonus = [{2,22,0}],
    amuletBonus = [{2,22,0}],
    helmBonus = [{4,28,0},{6,115,0}],
    pantBonus = [{26,57,0},{28,57,0}],
    goldCost = 0,
    allBonus = [{2,20,0},{26,50,0},{28,50,0}],
    materialCost = [{222,50}],
    sfx_1 = "w3_1_1",
    sfx_2 = "w3_2_1",
    sfx_3 = "w3_3_1"
    };
getRow(4,4)->
    #equipIntensifyCfg {
    iD = 64,
    level = 4,
    class = 4,
    baseBonus = 0,
    mainHandBonus = [{31,14,0},{32,14,0}],
    offHandBonus = [{4,28,0},{6,115,0}],
    chestBonus = [{4,28,0},{6,115,0}],
    bootBonus = [{26,57,0},{28,57,0}],
    ringBonus = [{1,22,0}],
    amuletBonus = [{1,22,0}],
    helmBonus = [{4,28,0},{6,115,0}],
    pantBonus = [{26,57,0},{28,57,0}],
    goldCost = 0,
    allBonus = [{1,20,0},{26,50,0},{28,50,0}],
    materialCost = [{222,50}],
    sfx_1 = "w4_1_1",
    sfx_2 = "w4_2_1",
    sfx_3 = "w4_3_1"
    };
getRow(5,1)->
    #equipIntensifyCfg {
    iD = 5,
    level = 5,
    class = 1,
    baseBonus = 0,
    mainHandBonus = [{30,17,0},{31,17,0}],
    offHandBonus = [{4,34,0},{6,135,0}],
    chestBonus = [{4,34,0},{6,135,0}],
    bootBonus = [{26,67,0},{28,67,0}],
    ringBonus = [{1,26,0}],
    amuletBonus = [{1,26,0}],
    helmBonus = [{4,34,0},{6,135,0}],
    pantBonus = [{26,67,0},{28,67,0}],
    goldCost = 0,
    materialCost = [{222,70}],
    sfx_1 = "w1_1_1",
    sfx_2 = "w1_2_1",
    sfx_3 = "w1_3_1"
    };
getRow(5,2)->
    #equipIntensifyCfg {
    iD = 25,
    level = 5,
    class = 2,
    baseBonus = 0,
    mainHandBonus = [{30,17,0},{31,17,0}],
    offHandBonus = [{4,34,0},{6,135,0}],
    chestBonus = [{4,34,0},{6,135,0}],
    bootBonus = [{26,67,0},{28,67,0}],
    ringBonus = [{3,26,0}],
    amuletBonus = [{3,26,0}],
    helmBonus = [{4,34,0},{6,135,0}],
    pantBonus = [{26,67,0},{28,67,0}],
    goldCost = 0,
    materialCost = [{222,70}],
    sfx_1 = "w2_1_1",
    sfx_2 = "w2_2_1",
    sfx_3 = "w2_3_1"
    };
getRow(5,3)->
    #equipIntensifyCfg {
    iD = 45,
    level = 5,
    class = 3,
    baseBonus = 0,
    mainHandBonus = [{31,17,0},{33,17,0}],
    offHandBonus = [{4,34,0},{6,135,0}],
    chestBonus = [{4,34,0},{6,135,0}],
    bootBonus = [{26,67,0},{28,67,0}],
    ringBonus = [{2,26,0}],
    amuletBonus = [{2,26,0}],
    helmBonus = [{4,34,0},{6,135,0}],
    pantBonus = [{26,67,0},{28,67,0}],
    goldCost = 0,
    materialCost = [{222,70}],
    sfx_1 = "w3_1_1",
    sfx_2 = "w3_2_1",
    sfx_3 = "w3_3_1"
    };
getRow(5,4)->
    #equipIntensifyCfg {
    iD = 65,
    level = 5,
    class = 4,
    baseBonus = 0,
    mainHandBonus = [{31,17,0},{32,17,0}],
    offHandBonus = [{4,34,0},{6,135,0}],
    chestBonus = [{4,34,0},{6,135,0}],
    bootBonus = [{26,67,0},{28,67,0}],
    ringBonus = [{1,26,0}],
    amuletBonus = [{1,26,0}],
    helmBonus = [{4,34,0},{6,135,0}],
    pantBonus = [{26,67,0},{28,67,0}],
    goldCost = 0,
    materialCost = [{222,70}],
    sfx_1 = "w4_1_1",
    sfx_2 = "w4_2_1",
    sfx_3 = "w4_3_1"
    };
getRow(6,1)->
    #equipIntensifyCfg {
    iD = 6,
    level = 6,
    class = 1,
    baseBonus = 0,
    mainHandBonus = [{30,20,0},{31,20,0}],
    offHandBonus = [{4,40,0},{6,159,0}],
    chestBonus = [{4,40,0},{6,159,0}],
    bootBonus = [{26,78,0},{28,78,0}],
    ringBonus = [{1,31,0}],
    amuletBonus = [{1,31,0}],
    helmBonus = [{4,40,0},{6,159,0}],
    pantBonus = [{26,78,0},{28,78,0}],
    goldCost = 0,
    materialCost = [{222,90}],
    sfx_1 = "w1_1_1",
    sfx_2 = "w1_2_1",
    sfx_3 = "w1_3_1"
    };
getRow(6,2)->
    #equipIntensifyCfg {
    iD = 26,
    level = 6,
    class = 2,
    baseBonus = 0,
    mainHandBonus = [{30,20,0},{31,20,0}],
    offHandBonus = [{4,40,0},{6,159,0}],
    chestBonus = [{4,40,0},{6,159,0}],
    bootBonus = [{26,78,0},{28,78,0}],
    ringBonus = [{3,31,0}],
    amuletBonus = [{3,31,0}],
    helmBonus = [{4,40,0},{6,159,0}],
    pantBonus = [{26,78,0},{28,78,0}],
    goldCost = 0,
    materialCost = [{222,90}],
    sfx_1 = "w2_1_1",
    sfx_2 = "w2_2_1",
    sfx_3 = "w2_3_1"
    };
getRow(6,3)->
    #equipIntensifyCfg {
    iD = 46,
    level = 6,
    class = 3,
    baseBonus = 0,
    mainHandBonus = [{31,20,0},{33,20,0}],
    offHandBonus = [{4,40,0},{6,159,0}],
    chestBonus = [{4,40,0},{6,159,0}],
    bootBonus = [{26,78,0},{28,78,0}],
    ringBonus = [{2,31,0}],
    amuletBonus = [{2,31,0}],
    helmBonus = [{4,40,0},{6,159,0}],
    pantBonus = [{26,78,0},{28,78,0}],
    goldCost = 0,
    materialCost = [{222,90}],
    sfx_1 = "w3_1_1",
    sfx_2 = "w3_2_1",
    sfx_3 = "w3_3_1"
    };
getRow(6,4)->
    #equipIntensifyCfg {
    iD = 66,
    level = 6,
    class = 4,
    baseBonus = 0,
    mainHandBonus = [{31,20,0},{32,20,0}],
    offHandBonus = [{4,40,0},{6,159,0}],
    chestBonus = [{4,40,0},{6,159,0}],
    bootBonus = [{26,78,0},{28,78,0}],
    ringBonus = [{1,31,0}],
    amuletBonus = [{1,31,0}],
    helmBonus = [{4,40,0},{6,159,0}],
    pantBonus = [{26,78,0},{28,78,0}],
    goldCost = 0,
    materialCost = [{222,90}],
    sfx_1 = "w4_1_1",
    sfx_2 = "w4_2_1",
    sfx_3 = "w4_3_1"
    };
getRow(7,1)->
    #equipIntensifyCfg {
    iD = 7,
    level = 7,
    class = 1,
    baseBonus = 0,
    mainHandBonus = [{30,23,0},{31,23,0}],
    offHandBonus = [{4,46,0},{6,188,0}],
    chestBonus = [{4,46,0},{6,188,0}],
    bootBonus = [{26,92,0},{28,92,0}],
    ringBonus = [{1,36,0}],
    amuletBonus = [{1,36,0}],
    helmBonus = [{4,46,0},{6,188,0}],
    pantBonus = [{26,92,0},{28,92,0}],
    goldCost = 0,
    materialCost = [{222,120}],
    sfx_1 = "w1_1_1",
    sfx_2 = "w1_2_1",
    sfx_3 = "w1_3_1"
    };
getRow(7,2)->
    #equipIntensifyCfg {
    iD = 27,
    level = 7,
    class = 2,
    baseBonus = 0,
    mainHandBonus = [{30,23,0},{31,23,0}],
    offHandBonus = [{4,46,0},{6,188,0}],
    chestBonus = [{4,46,0},{6,188,0}],
    bootBonus = [{26,92,0},{28,92,0}],
    ringBonus = [{3,36,0}],
    amuletBonus = [{3,36,0}],
    helmBonus = [{4,46,0},{6,188,0}],
    pantBonus = [{26,92,0},{28,92,0}],
    goldCost = 0,
    materialCost = [{222,120}],
    sfx_1 = "w2_1_1",
    sfx_2 = "w2_2_1",
    sfx_3 = "w2_3_1"
    };
getRow(7,3)->
    #equipIntensifyCfg {
    iD = 47,
    level = 7,
    class = 3,
    baseBonus = 0,
    mainHandBonus = [{31,23,0},{33,23,0}],
    offHandBonus = [{4,46,0},{6,188,0}],
    chestBonus = [{4,46,0},{6,188,0}],
    bootBonus = [{26,92,0},{28,92,0}],
    ringBonus = [{2,36,0}],
    amuletBonus = [{2,36,0}],
    helmBonus = [{4,46,0},{6,188,0}],
    pantBonus = [{26,92,0},{28,92,0}],
    goldCost = 0,
    materialCost = [{222,120}],
    sfx_1 = "w3_1_1",
    sfx_2 = "w3_2_1",
    sfx_3 = "w3_3_1"
    };
getRow(7,4)->
    #equipIntensifyCfg {
    iD = 67,
    level = 7,
    class = 4,
    baseBonus = 0,
    mainHandBonus = [{31,23,0},{32,23,0}],
    offHandBonus = [{4,46,0},{6,188,0}],
    chestBonus = [{4,46,0},{6,188,0}],
    bootBonus = [{26,92,0},{28,92,0}],
    ringBonus = [{1,36,0}],
    amuletBonus = [{1,36,0}],
    helmBonus = [{4,46,0},{6,188,0}],
    pantBonus = [{26,92,0},{28,92,0}],
    goldCost = 0,
    materialCost = [{222,120}],
    sfx_1 = "w4_1_1",
    sfx_2 = "w4_2_1",
    sfx_3 = "w4_3_1"
    };
getRow(8,1)->
    #equipIntensifyCfg {
    iD = 8,
    level = 8,
    class = 1,
    baseBonus = 0,
    mainHandBonus = [{30,28,0},{31,28,0}],
    offHandBonus = [{4,55,0},{6,221,0}],
    chestBonus = [{4,55,0},{6,221,0}],
    bootBonus = [{26,109,0},{28,109,0}],
    ringBonus = [{1,42,0}],
    amuletBonus = [{1,42,0}],
    helmBonus = [{4,55,0},{6,221,0}],
    pantBonus = [{26,109,0},{28,109,0}],
    goldCost = 0,
    allBonus = [{1,40,0},{26,100,0},{28,100,0}],
    materialCost = [{222,150}],
    sfx_1 = "w1_1_2",
    sfx_2 = "w1_2_2",
    sfx_3 = "w1_3_2"
    };
getRow(8,2)->
    #equipIntensifyCfg {
    iD = 28,
    level = 8,
    class = 2,
    baseBonus = 0,
    mainHandBonus = [{30,28,0},{31,28,0}],
    offHandBonus = [{4,55,0},{6,221,0}],
    chestBonus = [{4,55,0},{6,221,0}],
    bootBonus = [{26,109,0},{28,109,0}],
    ringBonus = [{3,42,0}],
    amuletBonus = [{3,42,0}],
    helmBonus = [{4,55,0},{6,221,0}],
    pantBonus = [{26,109,0},{28,109,0}],
    goldCost = 0,
    allBonus = [{3,40,0},{26,100,0},{28,100,0}],
    materialCost = [{222,150}],
    sfx_1 = "w2_1_2",
    sfx_2 = "w2_2_2",
    sfx_3 = "w2_3_2"
    };
getRow(8,3)->
    #equipIntensifyCfg {
    iD = 48,
    level = 8,
    class = 3,
    baseBonus = 0,
    mainHandBonus = [{31,28,0},{33,28,0}],
    offHandBonus = [{4,55,0},{6,221,0}],
    chestBonus = [{4,55,0},{6,221,0}],
    bootBonus = [{26,109,0},{28,109,0}],
    ringBonus = [{2,42,0}],
    amuletBonus = [{2,42,0}],
    helmBonus = [{4,55,0},{6,221,0}],
    pantBonus = [{26,109,0},{28,109,0}],
    goldCost = 0,
    allBonus = [{2,40,0},{26,100,0},{28,100,0}],
    materialCost = [{222,150}],
    sfx_1 = "w3_1_2",
    sfx_2 = "w3_2_2",
    sfx_3 = "w3_3_2"
    };
getRow(8,4)->
    #equipIntensifyCfg {
    iD = 68,
    level = 8,
    class = 4,
    baseBonus = 0,
    mainHandBonus = [{31,28,0},{32,28,0}],
    offHandBonus = [{4,55,0},{6,221,0}],
    chestBonus = [{4,55,0},{6,221,0}],
    bootBonus = [{26,109,0},{28,109,0}],
    ringBonus = [{1,42,0}],
    amuletBonus = [{1,42,0}],
    helmBonus = [{4,55,0},{6,221,0}],
    pantBonus = [{26,109,0},{28,109,0}],
    goldCost = 0,
    allBonus = [{1,40,0},{26,100,0},{28,100,0}],
    materialCost = [{222,150}],
    sfx_1 = "w4_1_2",
    sfx_2 = "w4_2_2",
    sfx_3 = "w4_3_2"
    };
getRow(9,1)->
    #equipIntensifyCfg {
    iD = 9,
    level = 9,
    class = 1,
    baseBonus = 0,
    mainHandBonus = [{30,33,0},{31,33,0}],
    offHandBonus = [{4,65,0},{6,260,0}],
    chestBonus = [{4,65,0},{6,260,0}],
    bootBonus = [{26,128,0},{28,128,0}],
    ringBonus = [{1,50,0}],
    amuletBonus = [{1,50,0}],
    helmBonus = [{4,65,0},{6,260,0}],
    pantBonus = [{26,128,0},{28,128,0}],
    goldCost = 0,
    materialCost = [{222,180}],
    sfx_1 = "w1_1_2",
    sfx_2 = "w1_2_2",
    sfx_3 = "w1_3_2"
    };
getRow(9,2)->
    #equipIntensifyCfg {
    iD = 29,
    level = 9,
    class = 2,
    baseBonus = 0,
    mainHandBonus = [{30,33,0},{31,33,0}],
    offHandBonus = [{4,65,0},{6,260,0}],
    chestBonus = [{4,65,0},{6,260,0}],
    bootBonus = [{26,128,0},{28,128,0}],
    ringBonus = [{3,50,0}],
    amuletBonus = [{3,50,0}],
    helmBonus = [{4,65,0},{6,260,0}],
    pantBonus = [{26,128,0},{28,128,0}],
    goldCost = 0,
    materialCost = [{222,180}],
    sfx_1 = "w2_1_2",
    sfx_2 = "w2_2_2",
    sfx_3 = "w2_3_2"
    };
getRow(9,3)->
    #equipIntensifyCfg {
    iD = 49,
    level = 9,
    class = 3,
    baseBonus = 0,
    mainHandBonus = [{31,33,0},{33,33,0}],
    offHandBonus = [{4,65,0},{6,260,0}],
    chestBonus = [{4,65,0},{6,260,0}],
    bootBonus = [{26,128,0},{28,128,0}],
    ringBonus = [{2,50,0}],
    amuletBonus = [{2,50,0}],
    helmBonus = [{4,65,0},{6,260,0}],
    pantBonus = [{26,128,0},{28,128,0}],
    goldCost = 0,
    materialCost = [{222,180}],
    sfx_1 = "w3_1_2",
    sfx_2 = "w3_2_2",
    sfx_3 = "w3_3_2"
    };
getRow(9,4)->
    #equipIntensifyCfg {
    iD = 69,
    level = 9,
    class = 4,
    baseBonus = 0,
    mainHandBonus = [{31,33,0},{32,33,0}],
    offHandBonus = [{4,65,0},{6,260,0}],
    chestBonus = [{4,65,0},{6,260,0}],
    bootBonus = [{26,128,0},{28,128,0}],
    ringBonus = [{1,50,0}],
    amuletBonus = [{1,50,0}],
    helmBonus = [{4,65,0},{6,260,0}],
    pantBonus = [{26,128,0},{28,128,0}],
    goldCost = 0,
    materialCost = [{222,180}],
    sfx_1 = "w4_1_2",
    sfx_2 = "w4_2_2",
    sfx_3 = "w4_3_2"
    };
getRow(10,1)->
    #equipIntensifyCfg {
    iD = 10,
    level = 10,
    class = 1,
    baseBonus = 0,
    mainHandBonus = [{30,38,0},{31,38,0}],
    offHandBonus = [{4,76,0},{6,306,0}],
    chestBonus = [{4,76,0},{6,306,0}],
    bootBonus = [{26,150,0},{28,150,0}],
    ringBonus = [{1,59,0}],
    amuletBonus = [{1,59,0}],
    helmBonus = [{4,76,0},{6,306,0}],
    pantBonus = [{26,150,0},{28,150,0}],
    goldCost = 0,
    materialCost = [{222,210}],
    sfx_1 = "w1_1_2",
    sfx_2 = "w1_2_2",
    sfx_3 = "w1_3_2"
    };
getRow(10,2)->
    #equipIntensifyCfg {
    iD = 30,
    level = 10,
    class = 2,
    baseBonus = 0,
    mainHandBonus = [{30,38,0},{31,38,0}],
    offHandBonus = [{4,76,0},{6,306,0}],
    chestBonus = [{4,76,0},{6,306,0}],
    bootBonus = [{26,150,0},{28,150,0}],
    ringBonus = [{3,59,0}],
    amuletBonus = [{3,59,0}],
    helmBonus = [{4,76,0},{6,306,0}],
    pantBonus = [{26,150,0},{28,150,0}],
    goldCost = 0,
    materialCost = [{222,210}],
    sfx_1 = "w2_1_2",
    sfx_2 = "w2_2_2",
    sfx_3 = "w2_3_2"
    };
getRow(10,3)->
    #equipIntensifyCfg {
    iD = 50,
    level = 10,
    class = 3,
    baseBonus = 0,
    mainHandBonus = [{31,38,0},{33,38,0}],
    offHandBonus = [{4,76,0},{6,306,0}],
    chestBonus = [{4,76,0},{6,306,0}],
    bootBonus = [{26,150,0},{28,150,0}],
    ringBonus = [{2,59,0}],
    amuletBonus = [{2,59,0}],
    helmBonus = [{4,76,0},{6,306,0}],
    pantBonus = [{26,150,0},{28,150,0}],
    goldCost = 0,
    materialCost = [{222,210}],
    sfx_1 = "w3_1_2",
    sfx_2 = "w3_2_2",
    sfx_3 = "w3_3_2"
    };
getRow(10,4)->
    #equipIntensifyCfg {
    iD = 70,
    level = 10,
    class = 4,
    baseBonus = 0,
    mainHandBonus = [{31,38,0},{32,38,0}],
    offHandBonus = [{4,76,0},{6,306,0}],
    chestBonus = [{4,76,0},{6,306,0}],
    bootBonus = [{26,150,0},{28,150,0}],
    ringBonus = [{1,59,0}],
    amuletBonus = [{1,59,0}],
    helmBonus = [{4,76,0},{6,306,0}],
    pantBonus = [{26,150,0},{28,150,0}],
    goldCost = 0,
    materialCost = [{222,210}],
    sfx_1 = "w4_1_2",
    sfx_2 = "w4_2_2",
    sfx_3 = "w4_3_2"
    };
getRow(11,1)->
    #equipIntensifyCfg {
    iD = 11,
    level = 11,
    class = 1,
    baseBonus = 0,
    mainHandBonus = [{30,45,0},{31,45,0}],
    offHandBonus = [{4,90,0},{6,360,0}],
    chestBonus = [{4,90,0},{6,360,0}],
    bootBonus = [{26,177,0},{28,177,0}],
    ringBonus = [{1,69,0}],
    amuletBonus = [{1,69,0}],
    helmBonus = [{4,90,0},{6,360,0}],
    pantBonus = [{26,177,0},{28,177,0}],
    goldCost = 0,
    materialCost = [{224,80}],
    sfx_1 = "w1_1_2",
    sfx_2 = "w1_2_2",
    sfx_3 = "w1_3_2"
    };
getRow(11,2)->
    #equipIntensifyCfg {
    iD = 31,
    level = 11,
    class = 2,
    baseBonus = 0,
    mainHandBonus = [{30,45,0},{31,45,0}],
    offHandBonus = [{4,90,0},{6,360,0}],
    chestBonus = [{4,90,0},{6,360,0}],
    bootBonus = [{26,177,0},{28,177,0}],
    ringBonus = [{3,69,0}],
    amuletBonus = [{3,69,0}],
    helmBonus = [{4,90,0},{6,360,0}],
    pantBonus = [{26,177,0},{28,177,0}],
    goldCost = 0,
    materialCost = [{224,80}],
    sfx_1 = "w2_1_2",
    sfx_2 = "w2_2_2",
    sfx_3 = "w2_3_2"
    };
getRow(11,3)->
    #equipIntensifyCfg {
    iD = 51,
    level = 11,
    class = 3,
    baseBonus = 0,
    mainHandBonus = [{31,45,0},{33,45,0}],
    offHandBonus = [{4,90,0},{6,360,0}],
    chestBonus = [{4,90,0},{6,360,0}],
    bootBonus = [{26,177,0},{28,177,0}],
    ringBonus = [{2,69,0}],
    amuletBonus = [{2,69,0}],
    helmBonus = [{4,90,0},{6,360,0}],
    pantBonus = [{26,177,0},{28,177,0}],
    goldCost = 0,
    materialCost = [{224,80}],
    sfx_1 = "w3_1_2",
    sfx_2 = "w3_2_2",
    sfx_3 = "w3_3_2"
    };
getRow(11,4)->
    #equipIntensifyCfg {
    iD = 71,
    level = 11,
    class = 4,
    baseBonus = 0,
    mainHandBonus = [{31,45,0},{32,45,0}],
    offHandBonus = [{4,90,0},{6,360,0}],
    chestBonus = [{4,90,0},{6,360,0}],
    bootBonus = [{26,177,0},{28,177,0}],
    ringBonus = [{1,69,0}],
    amuletBonus = [{1,69,0}],
    helmBonus = [{4,90,0},{6,360,0}],
    pantBonus = [{26,177,0},{28,177,0}],
    goldCost = 0,
    materialCost = [{224,80}],
    sfx_1 = "w4_1_2",
    sfx_2 = "w4_2_2",
    sfx_3 = "w4_3_2"
    };
getRow(12,1)->
    #equipIntensifyCfg {
    iD = 12,
    level = 12,
    class = 1,
    baseBonus = 0,
    mainHandBonus = [{30,53,0},{31,53,0}],
    offHandBonus = [{4,106,0},{6,424,0}],
    chestBonus = [{4,106,0},{6,424,0}],
    bootBonus = [{26,208,0},{28,208,0}],
    ringBonus = [{1,81,0}],
    amuletBonus = [{1,81,0}],
    helmBonus = [{4,106,0},{6,424,0}],
    pantBonus = [{26,208,0},{28,208,0}],
    goldCost = 0,
    allBonus = [{1,60,0},{26,150,0},{28,150,0}],
    materialCost = [{224,100}],
    sfx_1 = "w1_1_3",
    sfx_2 = "w1_2_3",
    sfx_3 = "w1_3_3"
    };
getRow(12,2)->
    #equipIntensifyCfg {
    iD = 32,
    level = 12,
    class = 2,
    baseBonus = 0,
    mainHandBonus = [{30,53,0},{31,53,0}],
    offHandBonus = [{4,106,0},{6,424,0}],
    chestBonus = [{4,106,0},{6,424,0}],
    bootBonus = [{26,208,0},{28,208,0}],
    ringBonus = [{3,81,0}],
    amuletBonus = [{3,81,0}],
    helmBonus = [{4,106,0},{6,424,0}],
    pantBonus = [{26,208,0},{28,208,0}],
    goldCost = 0,
    allBonus = [{3,60,0},{26,150,0},{28,150,0}],
    materialCost = [{224,100}],
    sfx_1 = "w2_1_3",
    sfx_2 = "w2_2_3",
    sfx_3 = "w2_3_3"
    };
getRow(12,3)->
    #equipIntensifyCfg {
    iD = 52,
    level = 12,
    class = 3,
    baseBonus = 0,
    mainHandBonus = [{31,53,0},{33,53,0}],
    offHandBonus = [{4,106,0},{6,424,0}],
    chestBonus = [{4,106,0},{6,424,0}],
    bootBonus = [{26,208,0},{28,208,0}],
    ringBonus = [{2,81,0}],
    amuletBonus = [{2,81,0}],
    helmBonus = [{4,106,0},{6,424,0}],
    pantBonus = [{26,208,0},{28,208,0}],
    goldCost = 0,
    allBonus = [{2,60,0},{26,150,0},{28,150,0}],
    materialCost = [{224,100}],
    sfx_1 = "w3_1_3",
    sfx_2 = "w3_2_3",
    sfx_3 = "w3_3_3"
    };
getRow(12,4)->
    #equipIntensifyCfg {
    iD = 72,
    level = 12,
    class = 4,
    baseBonus = 0,
    mainHandBonus = [{31,53,0},{32,53,0}],
    offHandBonus = [{4,106,0},{6,424,0}],
    chestBonus = [{4,106,0},{6,424,0}],
    bootBonus = [{26,208,0},{28,208,0}],
    ringBonus = [{1,81,0}],
    amuletBonus = [{1,81,0}],
    helmBonus = [{4,106,0},{6,424,0}],
    pantBonus = [{26,208,0},{28,208,0}],
    goldCost = 0,
    allBonus = [{1,60,0},{26,150,0},{28,150,0}],
    materialCost = [{224,100}],
    sfx_1 = "w4_1_3",
    sfx_2 = "w4_2_3",
    sfx_3 = "w4_3_3"
    };
getRow(13,1)->
    #equipIntensifyCfg {
    iD = 13,
    level = 13,
    class = 1,
    baseBonus = 0,
    mainHandBonus = [{30,62,0},{31,62,0}],
    offHandBonus = [{4,124,0},{6,499,0}],
    chestBonus = [{4,124,0},{6,499,0}],
    bootBonus = [{26,245,0},{28,245,0}],
    ringBonus = [{1,96,0}],
    amuletBonus = [{1,96,0}],
    helmBonus = [{4,124,0},{6,499,0}],
    pantBonus = [{26,245,0},{28,245,0}],
    goldCost = 0,
    materialCost = [{224,110}],
    sfx_1 = "w1_1_3",
    sfx_2 = "w1_2_3",
    sfx_3 = "w1_3_3"
    };
getRow(13,2)->
    #equipIntensifyCfg {
    iD = 33,
    level = 13,
    class = 2,
    baseBonus = 0,
    mainHandBonus = [{30,62,0},{31,62,0}],
    offHandBonus = [{4,124,0},{6,499,0}],
    chestBonus = [{4,124,0},{6,499,0}],
    bootBonus = [{26,245,0},{28,245,0}],
    ringBonus = [{3,96,0}],
    amuletBonus = [{3,96,0}],
    helmBonus = [{4,124,0},{6,499,0}],
    pantBonus = [{26,245,0},{28,245,0}],
    goldCost = 0,
    materialCost = [{224,110}],
    sfx_1 = "w2_1_3",
    sfx_2 = "w2_2_3",
    sfx_3 = "w2_3_3"
    };
getRow(13,3)->
    #equipIntensifyCfg {
    iD = 53,
    level = 13,
    class = 3,
    baseBonus = 0,
    mainHandBonus = [{31,62,0},{33,62,0}],
    offHandBonus = [{4,124,0},{6,499,0}],
    chestBonus = [{4,124,0},{6,499,0}],
    bootBonus = [{26,245,0},{28,245,0}],
    ringBonus = [{2,96,0}],
    amuletBonus = [{2,96,0}],
    helmBonus = [{4,124,0},{6,499,0}],
    pantBonus = [{26,245,0},{28,245,0}],
    goldCost = 0,
    materialCost = [{224,110}],
    sfx_1 = "w3_1_3",
    sfx_2 = "w3_2_3",
    sfx_3 = "w3_3_3"
    };
getRow(13,4)->
    #equipIntensifyCfg {
    iD = 73,
    level = 13,
    class = 4,
    baseBonus = 0,
    mainHandBonus = [{31,62,0},{32,62,0}],
    offHandBonus = [{4,124,0},{6,499,0}],
    chestBonus = [{4,124,0},{6,499,0}],
    bootBonus = [{26,245,0},{28,245,0}],
    ringBonus = [{1,96,0}],
    amuletBonus = [{1,96,0}],
    helmBonus = [{4,124,0},{6,499,0}],
    pantBonus = [{26,245,0},{28,245,0}],
    goldCost = 0,
    materialCost = [{224,110}],
    sfx_1 = "w4_1_3",
    sfx_2 = "w4_2_3",
    sfx_3 = "w4_3_3"
    };
getRow(14,1)->
    #equipIntensifyCfg {
    iD = 14,
    level = 14,
    class = 1,
    baseBonus = 0,
    mainHandBonus = [{30,73,0},{31,73,0}],
    offHandBonus = [{4,146,0},{6,588,0}],
    chestBonus = [{4,146,0},{6,588,0}],
    bootBonus = [{26,289,0},{28,289,0}],
    ringBonus = [{1,113,0}],
    amuletBonus = [{1,113,0}],
    helmBonus = [{4,146,0},{6,588,0}],
    pantBonus = [{26,289,0},{28,289,0}],
    goldCost = 0,
    materialCost = [{224,120}],
    sfx_1 = "w1_1_3",
    sfx_2 = "w1_2_3",
    sfx_3 = "w1_3_3"
    };
getRow(14,2)->
    #equipIntensifyCfg {
    iD = 34,
    level = 14,
    class = 2,
    baseBonus = 0,
    mainHandBonus = [{30,73,0},{31,73,0}],
    offHandBonus = [{4,146,0},{6,588,0}],
    chestBonus = [{4,146,0},{6,588,0}],
    bootBonus = [{26,289,0},{28,289,0}],
    ringBonus = [{3,113,0}],
    amuletBonus = [{3,113,0}],
    helmBonus = [{4,146,0},{6,588,0}],
    pantBonus = [{26,289,0},{28,289,0}],
    goldCost = 0,
    materialCost = [{224,120}],
    sfx_1 = "w2_1_3",
    sfx_2 = "w2_2_3",
    sfx_3 = "w2_3_3"
    };
getRow(14,3)->
    #equipIntensifyCfg {
    iD = 54,
    level = 14,
    class = 3,
    baseBonus = 0,
    mainHandBonus = [{31,73,0},{33,73,0}],
    offHandBonus = [{4,146,0},{6,588,0}],
    chestBonus = [{4,146,0},{6,588,0}],
    bootBonus = [{26,289,0},{28,289,0}],
    ringBonus = [{2,113,0}],
    amuletBonus = [{2,113,0}],
    helmBonus = [{4,146,0},{6,588,0}],
    pantBonus = [{26,289,0},{28,289,0}],
    goldCost = 0,
    materialCost = [{224,120}],
    sfx_1 = "w3_1_3",
    sfx_2 = "w3_2_3",
    sfx_3 = "w3_3_3"
    };
getRow(14,4)->
    #equipIntensifyCfg {
    iD = 74,
    level = 14,
    class = 4,
    baseBonus = 0,
    mainHandBonus = [{31,73,0},{32,73,0}],
    offHandBonus = [{4,146,0},{6,588,0}],
    chestBonus = [{4,146,0},{6,588,0}],
    bootBonus = [{26,289,0},{28,289,0}],
    ringBonus = [{1,113,0}],
    amuletBonus = [{1,113,0}],
    helmBonus = [{4,146,0},{6,588,0}],
    pantBonus = [{26,289,0},{28,289,0}],
    goldCost = 0,
    materialCost = [{224,120}],
    sfx_1 = "w4_1_3",
    sfx_2 = "w4_2_3",
    sfx_3 = "w4_3_3"
    };
getRow(15,1)->
    #equipIntensifyCfg {
    iD = 15,
    level = 15,
    class = 1,
    baseBonus = 0,
    mainHandBonus = [{30,86,0},{31,86,0}],
    offHandBonus = [{4,172,0},{6,692,0}],
    chestBonus = [{4,172,0},{6,692,0}],
    bootBonus = [{26,340,0},{28,340,0}],
    ringBonus = [{1,133,0}],
    amuletBonus = [{1,133,0}],
    helmBonus = [{4,172,0},{6,692,0}],
    pantBonus = [{26,340,0},{28,340,0}],
    goldCost = 0,
    materialCost = [{224,130}],
    sfx_1 = "w1_1_3",
    sfx_2 = "w1_2_3",
    sfx_3 = "w1_3_3"
    };
getRow(15,2)->
    #equipIntensifyCfg {
    iD = 35,
    level = 15,
    class = 2,
    baseBonus = 0,
    mainHandBonus = [{30,86,0},{31,86,0}],
    offHandBonus = [{4,172,0},{6,692,0}],
    chestBonus = [{4,172,0},{6,692,0}],
    bootBonus = [{26,340,0},{28,340,0}],
    ringBonus = [{3,133,0}],
    amuletBonus = [{3,133,0}],
    helmBonus = [{4,172,0},{6,692,0}],
    pantBonus = [{26,340,0},{28,340,0}],
    goldCost = 0,
    materialCost = [{224,130}],
    sfx_1 = "w2_1_3",
    sfx_2 = "w2_2_3",
    sfx_3 = "w2_3_3"
    };
getRow(15,3)->
    #equipIntensifyCfg {
    iD = 55,
    level = 15,
    class = 3,
    baseBonus = 0,
    mainHandBonus = [{31,86,0},{33,86,0}],
    offHandBonus = [{4,172,0},{6,692,0}],
    chestBonus = [{4,172,0},{6,692,0}],
    bootBonus = [{26,340,0},{28,340,0}],
    ringBonus = [{2,133,0}],
    amuletBonus = [{2,133,0}],
    helmBonus = [{4,172,0},{6,692,0}],
    pantBonus = [{26,340,0},{28,340,0}],
    goldCost = 0,
    materialCost = [{224,130}],
    sfx_1 = "w3_1_3",
    sfx_2 = "w3_2_3",
    sfx_3 = "w3_3_3"
    };
getRow(15,4)->
    #equipIntensifyCfg {
    iD = 75,
    level = 15,
    class = 4,
    baseBonus = 0,
    mainHandBonus = [{31,86,0},{32,86,0}],
    offHandBonus = [{4,172,0},{6,692,0}],
    chestBonus = [{4,172,0},{6,692,0}],
    bootBonus = [{26,340,0},{28,340,0}],
    ringBonus = [{1,133,0}],
    amuletBonus = [{1,133,0}],
    helmBonus = [{4,172,0},{6,692,0}],
    pantBonus = [{26,340,0},{28,340,0}],
    goldCost = 0,
    materialCost = [{224,130}],
    sfx_1 = "w4_1_3",
    sfx_2 = "w4_2_3",
    sfx_3 = "w4_3_3"
    };
getRow(16,1)->
    #equipIntensifyCfg {
    iD = 16,
    level = 16,
    class = 1,
    baseBonus = 0,
    mainHandBonus = [{30,102,0},{31,102,0}],
    offHandBonus = [{4,203,0},{6,814,0}],
    chestBonus = [{4,203,0},{6,814,0}],
    bootBonus = [{26,400,0},{28,400,0}],
    ringBonus = [{1,156,0}],
    amuletBonus = [{1,156,0}],
    helmBonus = [{4,203,0},{6,814,0}],
    pantBonus = [{26,400,0},{28,400,0}],
    goldCost = 0,
    allBonus = [{1,80,0},{26,200,0},{28,200,0}],
    materialCost = [{224,150}],
    sfx_1 = "w1_1_4",
    sfx_2 = "w1_2_4",
    sfx_3 = "w1_3_4"
    };
getRow(16,2)->
    #equipIntensifyCfg {
    iD = 36,
    level = 16,
    class = 2,
    baseBonus = 0,
    mainHandBonus = [{30,102,0},{31,102,0}],
    offHandBonus = [{4,203,0},{6,814,0}],
    chestBonus = [{4,203,0},{6,814,0}],
    bootBonus = [{26,400,0},{28,400,0}],
    ringBonus = [{3,156,0}],
    amuletBonus = [{3,156,0}],
    helmBonus = [{4,203,0},{6,814,0}],
    pantBonus = [{26,400,0},{28,400,0}],
    goldCost = 0,
    allBonus = [{3,80,0},{26,200,0},{28,200,0}],
    materialCost = [{224,150}],
    sfx_1 = "w2_1_4",
    sfx_2 = "w2_2_4",
    sfx_3 = "w2_3_4"
    };
getRow(16,3)->
    #equipIntensifyCfg {
    iD = 56,
    level = 16,
    class = 3,
    baseBonus = 0,
    mainHandBonus = [{31,102,0},{33,102,0}],
    offHandBonus = [{4,203,0},{6,814,0}],
    chestBonus = [{4,203,0},{6,814,0}],
    bootBonus = [{26,400,0},{28,400,0}],
    ringBonus = [{2,156,0}],
    amuletBonus = [{2,156,0}],
    helmBonus = [{4,203,0},{6,814,0}],
    pantBonus = [{26,400,0},{28,400,0}],
    goldCost = 0,
    allBonus = [{2,80,0},{26,200,0},{28,200,0}],
    materialCost = [{224,150}],
    sfx_1 = "w3_1_4",
    sfx_2 = "w3_2_4",
    sfx_3 = "w3_3_4"
    };
getRow(16,4)->
    #equipIntensifyCfg {
    iD = 76,
    level = 16,
    class = 4,
    baseBonus = 0,
    mainHandBonus = [{31,102,0},{32,102,0}],
    offHandBonus = [{4,203,0},{6,814,0}],
    chestBonus = [{4,203,0},{6,814,0}],
    bootBonus = [{26,400,0},{28,400,0}],
    ringBonus = [{1,156,0}],
    amuletBonus = [{1,156,0}],
    helmBonus = [{4,203,0},{6,814,0}],
    pantBonus = [{26,400,0},{28,400,0}],
    goldCost = 0,
    allBonus = [{1,80,0},{26,200,0},{28,200,0}],
    materialCost = [{224,150}],
    sfx_1 = "w4_1_4",
    sfx_2 = "w4_2_4",
    sfx_3 = "w4_3_4"
    };
getRow(17,1)->
    #equipIntensifyCfg {
    iD = 17,
    level = 17,
    class = 1,
    baseBonus = 0,
    mainHandBonus = [{30,120,0},{31,120,0}],
    offHandBonus = [{4,239,0},{6,958,0}],
    chestBonus = [{4,239,0},{6,958,0}],
    bootBonus = [{26,471,0},{28,471,0}],
    ringBonus = [{1,184,0}],
    amuletBonus = [{1,184,0}],
    helmBonus = [{4,239,0},{6,958,0}],
    pantBonus = [{26,471,0},{28,471,0}],
    goldCost = 0,
    materialCost = [{224,160}],
    sfx_1 = "w1_1_4",
    sfx_2 = "w1_2_4",
    sfx_3 = "w1_3_4"
    };
getRow(17,2)->
    #equipIntensifyCfg {
    iD = 37,
    level = 17,
    class = 2,
    baseBonus = 0,
    mainHandBonus = [{30,120,0},{31,120,0}],
    offHandBonus = [{4,239,0},{6,958,0}],
    chestBonus = [{4,239,0},{6,958,0}],
    bootBonus = [{26,471,0},{28,471,0}],
    ringBonus = [{3,184,0}],
    amuletBonus = [{3,184,0}],
    helmBonus = [{4,239,0},{6,958,0}],
    pantBonus = [{26,471,0},{28,471,0}],
    goldCost = 0,
    materialCost = [{224,160}],
    sfx_1 = "w2_1_4",
    sfx_2 = "w2_2_4",
    sfx_3 = "w2_3_4"
    };
getRow(17,3)->
    #equipIntensifyCfg {
    iD = 57,
    level = 17,
    class = 3,
    baseBonus = 0,
    mainHandBonus = [{31,120,0},{33,120,0}],
    offHandBonus = [{4,239,0},{6,958,0}],
    chestBonus = [{4,239,0},{6,958,0}],
    bootBonus = [{26,471,0},{28,471,0}],
    ringBonus = [{2,184,0}],
    amuletBonus = [{2,184,0}],
    helmBonus = [{4,239,0},{6,958,0}],
    pantBonus = [{26,471,0},{28,471,0}],
    goldCost = 0,
    materialCost = [{224,160}],
    sfx_1 = "w3_1_4",
    sfx_2 = "w3_2_4",
    sfx_3 = "w3_3_4"
    };
getRow(17,4)->
    #equipIntensifyCfg {
    iD = 77,
    level = 17,
    class = 4,
    baseBonus = 0,
    mainHandBonus = [{31,120,0},{32,120,0}],
    offHandBonus = [{4,239,0},{6,958,0}],
    chestBonus = [{4,239,0},{6,958,0}],
    bootBonus = [{26,471,0},{28,471,0}],
    ringBonus = [{1,184,0}],
    amuletBonus = [{1,184,0}],
    helmBonus = [{4,239,0},{6,958,0}],
    pantBonus = [{26,471,0},{28,471,0}],
    goldCost = 0,
    materialCost = [{224,160}],
    sfx_1 = "w4_1_4",
    sfx_2 = "w4_2_4",
    sfx_3 = "w4_3_4"
    };
getRow(18,1)->
    #equipIntensifyCfg {
    iD = 18,
    level = 18,
    class = 1,
    baseBonus = 0,
    mainHandBonus = [{30,141,0},{31,141,0}],
    offHandBonus = [{4,282,0},{6,1128,0}],
    chestBonus = [{4,282,0},{6,1128,0}],
    bootBonus = [{26,554,0},{28,554,0}],
    ringBonus = [{1,217,0}],
    amuletBonus = [{1,217,0}],
    helmBonus = [{4,282,0},{6,1128,0}],
    pantBonus = [{26,554,0},{28,554,0}],
    goldCost = 0,
    materialCost = [{224,170}],
    sfx_1 = "w1_1_4",
    sfx_2 = "w1_2_4",
    sfx_3 = "w1_3_4"
    };
getRow(18,2)->
    #equipIntensifyCfg {
    iD = 38,
    level = 18,
    class = 2,
    baseBonus = 0,
    mainHandBonus = [{30,141,0},{31,141,0}],
    offHandBonus = [{4,282,0},{6,1128,0}],
    chestBonus = [{4,282,0},{6,1128,0}],
    bootBonus = [{26,554,0},{28,554,0}],
    ringBonus = [{3,217,0}],
    amuletBonus = [{3,217,0}],
    helmBonus = [{4,282,0},{6,1128,0}],
    pantBonus = [{26,554,0},{28,554,0}],
    goldCost = 0,
    materialCost = [{224,170}],
    sfx_1 = "w2_1_4",
    sfx_2 = "w2_2_4",
    sfx_3 = "w2_3_4"
    };
getRow(18,3)->
    #equipIntensifyCfg {
    iD = 58,
    level = 18,
    class = 3,
    baseBonus = 0,
    mainHandBonus = [{31,141,0},{33,141,0}],
    offHandBonus = [{4,282,0},{6,1128,0}],
    chestBonus = [{4,282,0},{6,1128,0}],
    bootBonus = [{26,554,0},{28,554,0}],
    ringBonus = [{2,217,0}],
    amuletBonus = [{2,217,0}],
    helmBonus = [{4,282,0},{6,1128,0}],
    pantBonus = [{26,554,0},{28,554,0}],
    goldCost = 0,
    materialCost = [{224,170}],
    sfx_1 = "w3_1_4",
    sfx_2 = "w3_2_4",
    sfx_3 = "w3_3_4"
    };
getRow(18,4)->
    #equipIntensifyCfg {
    iD = 78,
    level = 18,
    class = 4,
    baseBonus = 0,
    mainHandBonus = [{31,141,0},{32,141,0}],
    offHandBonus = [{4,282,0},{6,1128,0}],
    chestBonus = [{4,282,0},{6,1128,0}],
    bootBonus = [{26,554,0},{28,554,0}],
    ringBonus = [{1,217,0}],
    amuletBonus = [{1,217,0}],
    helmBonus = [{4,282,0},{6,1128,0}],
    pantBonus = [{26,554,0},{28,554,0}],
    goldCost = 0,
    materialCost = [{224,170}],
    sfx_1 = "w4_1_4",
    sfx_2 = "w4_2_4",
    sfx_3 = "w4_3_4"
    };
getRow(19,1)->
    #equipIntensifyCfg {
    iD = 19,
    level = 19,
    class = 1,
    baseBonus = 0,
    mainHandBonus = [{30,166,0},{31,166,0}],
    offHandBonus = [{4,332,0},{6,1328,0}],
    chestBonus = [{4,332,0},{6,1328,0}],
    bootBonus = [{26,652,0},{28,652,0}],
    ringBonus = [{1,255,0}],
    amuletBonus = [{1,255,0}],
    helmBonus = [{4,332,0},{6,1328,0}],
    pantBonus = [{26,652,0},{28,652,0}],
    goldCost = 0,
    materialCost = [{224,180}],
    sfx_1 = "w1_1_4",
    sfx_2 = "w1_2_4",
    sfx_3 = "w1_3_4"
    };
getRow(19,2)->
    #equipIntensifyCfg {
    iD = 39,
    level = 19,
    class = 2,
    baseBonus = 0,
    mainHandBonus = [{30,166,0},{31,166,0}],
    offHandBonus = [{4,332,0},{6,1328,0}],
    chestBonus = [{4,332,0},{6,1328,0}],
    bootBonus = [{26,652,0},{28,652,0}],
    ringBonus = [{3,255,0}],
    amuletBonus = [{3,255,0}],
    helmBonus = [{4,332,0},{6,1328,0}],
    pantBonus = [{26,652,0},{28,652,0}],
    goldCost = 0,
    materialCost = [{224,180}],
    sfx_1 = "w2_1_4",
    sfx_2 = "w2_2_4",
    sfx_3 = "w2_3_4"
    };
getRow(19,3)->
    #equipIntensifyCfg {
    iD = 59,
    level = 19,
    class = 3,
    baseBonus = 0,
    mainHandBonus = [{31,166,0},{33,166,0}],
    offHandBonus = [{4,332,0},{6,1328,0}],
    chestBonus = [{4,332,0},{6,1328,0}],
    bootBonus = [{26,652,0},{28,652,0}],
    ringBonus = [{2,255,0}],
    amuletBonus = [{2,255,0}],
    helmBonus = [{4,332,0},{6,1328,0}],
    pantBonus = [{26,652,0},{28,652,0}],
    goldCost = 0,
    materialCost = [{224,180}],
    sfx_1 = "w3_1_4",
    sfx_2 = "w3_2_4",
    sfx_3 = "w3_3_4"
    };
getRow(19,4)->
    #equipIntensifyCfg {
    iD = 79,
    level = 19,
    class = 4,
    baseBonus = 0,
    mainHandBonus = [{31,166,0},{32,166,0}],
    offHandBonus = [{4,332,0},{6,1328,0}],
    chestBonus = [{4,332,0},{6,1328,0}],
    bootBonus = [{26,652,0},{28,652,0}],
    ringBonus = [{1,255,0}],
    amuletBonus = [{1,255,0}],
    helmBonus = [{4,332,0},{6,1328,0}],
    pantBonus = [{26,652,0},{28,652,0}],
    goldCost = 0,
    materialCost = [{224,180}],
    sfx_1 = "w4_1_4",
    sfx_2 = "w4_2_4",
    sfx_3 = "w4_3_4"
    };
getRow(20,1)->
    #equipIntensifyCfg {
    iD = 20,
    level = 20,
    class = 1,
    baseBonus = 0,
    mainHandBonus = [{30,195,0},{31,195,0}],
    offHandBonus = [{4,390,0},{6,1562,0}],
    chestBonus = [{4,390,0},{6,1562,0}],
    bootBonus = [{26,768,0},{28,768,0}],
    ringBonus = [{1,300,0}],
    amuletBonus = [{1,300,0}],
    helmBonus = [{4,390,0},{6,1562,0}],
    pantBonus = [{26,768,0},{28,768,0}],
    goldCost = 0,
    allBonus = [{1,100,0},{26,250,0},{28,250,0}],
    materialCost = [{224,210}],
    sfx_1 = "w1_1_5",
    sfx_2 = "w1_2_5",
    sfx_3 = "w1_3_5"
    };
getRow(20,2)->
    #equipIntensifyCfg {
    iD = 40,
    level = 20,
    class = 2,
    baseBonus = 0,
    mainHandBonus = [{30,195,0},{31,195,0}],
    offHandBonus = [{4,390,0},{6,1562,0}],
    chestBonus = [{4,390,0},{6,1562,0}],
    bootBonus = [{26,768,0},{28,768,0}],
    ringBonus = [{3,300,0}],
    amuletBonus = [{3,300,0}],
    helmBonus = [{4,390,0},{6,1562,0}],
    pantBonus = [{26,768,0},{28,768,0}],
    goldCost = 0,
    allBonus = [{3,100,0},{26,250,0},{28,250,0}],
    materialCost = [{224,210}],
    sfx_1 = "w2_1_5",
    sfx_2 = "w2_2_5",
    sfx_3 = "w2_3_5"
    };
getRow(20,3)->
    #equipIntensifyCfg {
    iD = 60,
    level = 20,
    class = 3,
    baseBonus = 0,
    mainHandBonus = [{31,195,0},{33,195,0}],
    offHandBonus = [{4,390,0},{6,1562,0}],
    chestBonus = [{4,390,0},{6,1562,0}],
    bootBonus = [{26,768,0},{28,768,0}],
    ringBonus = [{2,300,0}],
    amuletBonus = [{2,300,0}],
    helmBonus = [{4,390,0},{6,1562,0}],
    pantBonus = [{26,768,0},{28,768,0}],
    goldCost = 0,
    allBonus = [{2,100,0},{26,250,0},{28,250,0}],
    materialCost = [{224,210}],
    sfx_1 = "w3_1_5",
    sfx_2 = "w3_2_5",
    sfx_3 = "w3_3_5"
    };
getRow(20,4)->
    #equipIntensifyCfg {
    iD = 80,
    level = 20,
    class = 4,
    baseBonus = 0,
    mainHandBonus = [{31,195,0},{32,195,0}],
    offHandBonus = [{4,390,0},{6,1562,0}],
    chestBonus = [{4,390,0},{6,1562,0}],
    bootBonus = [{26,768,0},{28,768,0}],
    ringBonus = [{1,300,0}],
    amuletBonus = [{1,300,0}],
    helmBonus = [{4,390,0},{6,1562,0}],
    pantBonus = [{26,768,0},{28,768,0}],
    goldCost = 0,
    allBonus = [{1,100,0},{26,250,0},{28,250,0}],
    materialCost = [{224,210}],
    sfx_1 = "w4_1_5",
    sfx_2 = "w4_2_5",
    sfx_3 = "w4_3_5"
    };
getRow(_,_)->[].

getKeyList()->[
    {1,1},
    {1,2},
    {1,3},
    {1,4},
    {2,1},
    {2,2},
    {2,3},
    {2,4},
    {3,1},
    {3,2},
    {3,3},
    {3,4},
    {4,1},
    {4,2},
    {4,3},
    {4,4},
    {5,1},
    {5,2},
    {5,3},
    {5,4},
    {6,1},
    {6,2},
    {6,3},
    {6,4},
    {7,1},
    {7,2},
    {7,3},
    {7,4},
    {8,1},
    {8,2},
    {8,3},
    {8,4},
    {9,1},
    {9,2},
    {9,3},
    {9,4},
    {10,1},
    {10,2},
    {10,3},
    {10,4},
    {11,1},
    {11,2},
    {11,3},
    {11,4},
    {12,1},
    {12,2},
    {12,3},
    {12,4},
    {13,1},
    {13,2},
    {13,3},
    {13,4},
    {14,1},
    {14,2},
    {14,3},
    {14,4},
    {15,1},
    {15,2},
    {15,3},
    {15,4},
    {16,1},
    {16,2},
    {16,3},
    {16,4},
    {17,1},
    {17,2},
    {17,3},
    {17,4},
    {18,1},
    {18,2},
    {18,3},
    {18,4},
    {19,1},
    {19,2},
    {19,3},
    {19,4},
    {20,1},
    {20,2},
    {20,3},
    {20,4}
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
    20
    ].

get2KeyList(1)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(2)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(3)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(4)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(5)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(6)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(7)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(8)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(9)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(10)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(11)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(12)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(13)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(14)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(15)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(16)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(17)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(18)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(19)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(20)->[
    1,
    2,
    3,
    4
    ];
get2KeyList(_)->[].

