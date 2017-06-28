%% coding: latin-1
%%: 实现
-module(cfg_pet_star_chs).
-compile(export_all).
-include("cfg_pet_star.hrl").
-include("logger.hrl").

getRow(1,0)->
    #pet_starCfg {
    petStar = 1,
    petQuality = 0,
    maxHP2 = 736,
    physicalAttack = 73,
    magicAttack = 73,
    physicalDefence = 73,
    magicDefence = 73
    };
getRow(1,1)->
    #pet_starCfg {
    petStar = 1,
    petQuality = 1,
    maxHP2 = 921,
    physicalAttack = 92,
    magicAttack = 92,
    physicalDefence = 92,
    magicDefence = 92
    };
getRow(1,2)->
    #pet_starCfg {
    petStar = 1,
    petQuality = 2,
    maxHP2 = 1152,
    physicalAttack = 115,
    magicAttack = 115,
    physicalDefence = 115,
    magicDefence = 115
    };
getRow(1,3)->
    #pet_starCfg {
    petStar = 1,
    petQuality = 3,
    maxHP2 = 1440,
    physicalAttack = 144,
    magicAttack = 144,
    physicalDefence = 144,
    magicDefence = 144
    };
getRow(1,4)->
    #pet_starCfg {
    petStar = 1,
    petQuality = 4,
    maxHP2 = 1800,
    physicalAttack = 180,
    magicAttack = 180,
    physicalDefence = 180,
    magicDefence = 180
    };
getRow(2,0)->
    #pet_starCfg {
    petStar = 2,
    petQuality = 0,
    maxHP2 = 1474,
    physicalAttack = 147,
    magicAttack = 147,
    physicalDefence = 147,
    magicDefence = 147
    };
getRow(2,1)->
    #pet_starCfg {
    petStar = 2,
    petQuality = 1,
    maxHP2 = 1843,
    physicalAttack = 184,
    magicAttack = 184,
    physicalDefence = 184,
    magicDefence = 184
    };
getRow(2,2)->
    #pet_starCfg {
    petStar = 2,
    petQuality = 2,
    maxHP2 = 2304,
    physicalAttack = 230,
    magicAttack = 230,
    physicalDefence = 230,
    magicDefence = 230
    };
getRow(2,3)->
    #pet_starCfg {
    petStar = 2,
    petQuality = 3,
    maxHP2 = 2880,
    physicalAttack = 288,
    magicAttack = 288,
    physicalDefence = 288,
    magicDefence = 288
    };
getRow(2,4)->
    #pet_starCfg {
    petStar = 2,
    petQuality = 4,
    maxHP2 = 3600,
    physicalAttack = 360,
    magicAttack = 360,
    physicalDefence = 360,
    magicDefence = 360
    };
getRow(3,0)->
    #pet_starCfg {
    petStar = 3,
    petQuality = 0,
    maxHP2 = 2211,
    physicalAttack = 220,
    magicAttack = 220,
    physicalDefence = 220,
    magicDefence = 220
    };
getRow(3,1)->
    #pet_starCfg {
    petStar = 3,
    petQuality = 1,
    maxHP2 = 2764,
    physicalAttack = 276,
    magicAttack = 276,
    physicalDefence = 276,
    magicDefence = 276
    };
getRow(3,2)->
    #pet_starCfg {
    petStar = 3,
    petQuality = 2,
    maxHP2 = 3456,
    physicalAttack = 345,
    magicAttack = 345,
    physicalDefence = 345,
    magicDefence = 345
    };
getRow(3,3)->
    #pet_starCfg {
    petStar = 3,
    petQuality = 3,
    maxHP2 = 4320,
    physicalAttack = 432,
    magicAttack = 432,
    physicalDefence = 432,
    magicDefence = 432
    };
getRow(3,4)->
    #pet_starCfg {
    petStar = 3,
    petQuality = 4,
    maxHP2 = 5400,
    physicalAttack = 540,
    magicAttack = 540,
    physicalDefence = 540,
    magicDefence = 540
    };
getRow(4,0)->
    #pet_starCfg {
    petStar = 4,
    petQuality = 0,
    maxHP2 = 2948,
    physicalAttack = 294,
    magicAttack = 294,
    physicalDefence = 294,
    magicDefence = 294
    };
getRow(4,1)->
    #pet_starCfg {
    petStar = 4,
    petQuality = 1,
    maxHP2 = 3686,
    physicalAttack = 368,
    magicAttack = 368,
    physicalDefence = 368,
    magicDefence = 368
    };
getRow(4,2)->
    #pet_starCfg {
    petStar = 4,
    petQuality = 2,
    maxHP2 = 4608,
    physicalAttack = 460,
    magicAttack = 460,
    physicalDefence = 460,
    magicDefence = 460
    };
getRow(4,3)->
    #pet_starCfg {
    petStar = 4,
    petQuality = 3,
    maxHP2 = 5760,
    physicalAttack = 576,
    magicAttack = 576,
    physicalDefence = 576,
    magicDefence = 576
    };
getRow(4,4)->
    #pet_starCfg {
    petStar = 4,
    petQuality = 4,
    maxHP2 = 7200,
    physicalAttack = 720,
    magicAttack = 720,
    physicalDefence = 720,
    magicDefence = 720
    };
getRow(5,0)->
    #pet_starCfg {
    petStar = 5,
    petQuality = 0,
    maxHP2 = 5160,
    physicalAttack = 515,
    magicAttack = 515,
    physicalDefence = 515,
    magicDefence = 515
    };
getRow(5,1)->
    #pet_starCfg {
    petStar = 5,
    petQuality = 1,
    maxHP2 = 6451,
    physicalAttack = 644,
    magicAttack = 644,
    physicalDefence = 644,
    magicDefence = 644
    };
getRow(5,2)->
    #pet_starCfg {
    petStar = 5,
    petQuality = 2,
    maxHP2 = 8064,
    physicalAttack = 806,
    magicAttack = 806,
    physicalDefence = 806,
    magicDefence = 806
    };
getRow(5,3)->
    #pet_starCfg {
    petStar = 5,
    petQuality = 3,
    maxHP2 = 10080,
    physicalAttack = 1008,
    magicAttack = 1008,
    physicalDefence = 1008,
    magicDefence = 1008
    };
getRow(5,4)->
    #pet_starCfg {
    petStar = 5,
    petQuality = 4,
    maxHP2 = 12600,
    physicalAttack = 1260,
    magicAttack = 1260,
    physicalDefence = 1260,
    magicDefence = 1260
    };
getRow(6,0)->
    #pet_starCfg {
    petStar = 6,
    petQuality = 0,
    maxHP2 = 6020,
    physicalAttack = 601,
    magicAttack = 601,
    physicalDefence = 601,
    magicDefence = 601
    };
getRow(6,1)->
    #pet_starCfg {
    petStar = 6,
    petQuality = 1,
    maxHP2 = 7526,
    physicalAttack = 752,
    magicAttack = 752,
    physicalDefence = 752,
    magicDefence = 752
    };
getRow(6,2)->
    #pet_starCfg {
    petStar = 6,
    petQuality = 2,
    maxHP2 = 9408,
    physicalAttack = 940,
    magicAttack = 940,
    physicalDefence = 940,
    magicDefence = 940
    };
getRow(6,3)->
    #pet_starCfg {
    petStar = 6,
    petQuality = 3,
    maxHP2 = 11760,
    physicalAttack = 1176,
    magicAttack = 1176,
    physicalDefence = 1176,
    magicDefence = 1176
    };
getRow(6,4)->
    #pet_starCfg {
    petStar = 6,
    petQuality = 4,
    maxHP2 = 14700,
    physicalAttack = 1470,
    magicAttack = 1470,
    physicalDefence = 1470,
    magicDefence = 1470
    };
getRow(7,0)->
    #pet_starCfg {
    petStar = 7,
    petQuality = 0,
    maxHP2 = 6840,
    physicalAttack = 683,
    magicAttack = 683,
    physicalDefence = 683,
    magicDefence = 683
    };
getRow(7,1)->
    #pet_starCfg {
    petStar = 7,
    petQuality = 1,
    maxHP2 = 8550,
    physicalAttack = 854,
    magicAttack = 854,
    physicalDefence = 854,
    magicDefence = 854
    };
getRow(7,2)->
    #pet_starCfg {
    petStar = 7,
    petQuality = 2,
    maxHP2 = 10688,
    physicalAttack = 1068,
    magicAttack = 1068,
    physicalDefence = 1068,
    magicDefence = 1068
    };
getRow(7,3)->
    #pet_starCfg {
    petStar = 7,
    petQuality = 3,
    maxHP2 = 13360,
    physicalAttack = 1336,
    magicAttack = 1336,
    physicalDefence = 1336,
    magicDefence = 1336
    };
getRow(7,4)->
    #pet_starCfg {
    petStar = 7,
    petQuality = 4,
    maxHP2 = 16700,
    physicalAttack = 1670,
    magicAttack = 1670,
    physicalDefence = 1670,
    magicDefence = 1670
    };
getRow(8,0)->
    #pet_starCfg {
    petStar = 8,
    petQuality = 0,
    maxHP2 = 7700,
    physicalAttack = 769,
    magicAttack = 769,
    physicalDefence = 769,
    magicDefence = 769
    };
getRow(8,1)->
    #pet_starCfg {
    petStar = 8,
    petQuality = 1,
    maxHP2 = 9625,
    physicalAttack = 962,
    magicAttack = 962,
    physicalDefence = 962,
    magicDefence = 962
    };
getRow(8,2)->
    #pet_starCfg {
    petStar = 8,
    petQuality = 2,
    maxHP2 = 12032,
    physicalAttack = 1203,
    magicAttack = 1203,
    physicalDefence = 1203,
    magicDefence = 1203
    };
getRow(8,3)->
    #pet_starCfg {
    petStar = 8,
    petQuality = 3,
    maxHP2 = 15040,
    physicalAttack = 1504,
    magicAttack = 1504,
    physicalDefence = 1504,
    magicDefence = 1504
    };
getRow(8,4)->
    #pet_starCfg {
    petStar = 8,
    petQuality = 4,
    maxHP2 = 18800,
    physicalAttack = 1880,
    magicAttack = 1880,
    physicalDefence = 1880,
    magicDefence = 1880
    };
getRow(9,0)->
    #pet_starCfg {
    petStar = 9,
    petQuality = 0,
    maxHP2 = 8519,
    physicalAttack = 851,
    magicAttack = 851,
    physicalDefence = 851,
    magicDefence = 851
    };
getRow(9,1)->
    #pet_starCfg {
    petStar = 9,
    petQuality = 1,
    maxHP2 = 10649,
    physicalAttack = 1064,
    magicAttack = 1064,
    physicalDefence = 1064,
    magicDefence = 1064
    };
getRow(9,2)->
    #pet_starCfg {
    petStar = 9,
    petQuality = 2,
    maxHP2 = 13312,
    physicalAttack = 1331,
    magicAttack = 1331,
    physicalDefence = 1331,
    magicDefence = 1331
    };
getRow(9,3)->
    #pet_starCfg {
    petStar = 9,
    petQuality = 3,
    maxHP2 = 16640,
    physicalAttack = 1664,
    magicAttack = 1664,
    physicalDefence = 1664,
    magicDefence = 1664
    };
getRow(9,4)->
    #pet_starCfg {
    petStar = 9,
    petQuality = 4,
    maxHP2 = 20800,
    physicalAttack = 2080,
    magicAttack = 2080,
    physicalDefence = 2080,
    magicDefence = 2080
    };
getRow(10,0)->
    #pet_starCfg {
    petStar = 10,
    petQuality = 0,
    maxHP2 = 13312,
    physicalAttack = 1331,
    magicAttack = 1331,
    physicalDefence = 1331,
    magicDefence = 1331
    };
getRow(10,1)->
    #pet_starCfg {
    petStar = 10,
    petQuality = 1,
    maxHP2 = 16640,
    physicalAttack = 1664,
    magicAttack = 1664,
    physicalDefence = 1664,
    magicDefence = 1664
    };
getRow(10,2)->
    #pet_starCfg {
    petStar = 10,
    petQuality = 2,
    maxHP2 = 20800,
    physicalAttack = 2080,
    magicAttack = 2080,
    physicalDefence = 2080,
    magicDefence = 2080
    };
getRow(10,3)->
    #pet_starCfg {
    petStar = 10,
    petQuality = 3,
    maxHP2 = 26000,
    physicalAttack = 2600,
    magicAttack = 2600,
    physicalDefence = 2600,
    magicDefence = 2600
    };
getRow(10,4)->
    #pet_starCfg {
    petStar = 10,
    petQuality = 4,
    maxHP2 = 32500,
    physicalAttack = 3250,
    magicAttack = 3250,
    physicalDefence = 3250,
    magicDefence = 3250
    };
getRow(11,0)->
    #pet_starCfg {
    petStar = 11,
    petQuality = 0,
    maxHP2 = 14294,
    physicalAttack = 1428,
    magicAttack = 1428,
    physicalDefence = 1428,
    magicDefence = 1428
    };
getRow(11,1)->
    #pet_starCfg {
    petStar = 11,
    petQuality = 1,
    maxHP2 = 17868,
    physicalAttack = 1786,
    magicAttack = 1786,
    physicalDefence = 1786,
    magicDefence = 1786
    };
getRow(11,2)->
    #pet_starCfg {
    petStar = 11,
    petQuality = 2,
    maxHP2 = 22336,
    physicalAttack = 2233,
    magicAttack = 2233,
    physicalDefence = 2233,
    magicDefence = 2233
    };
getRow(11,3)->
    #pet_starCfg {
    petStar = 11,
    petQuality = 3,
    maxHP2 = 27920,
    physicalAttack = 2792,
    magicAttack = 2792,
    physicalDefence = 2792,
    magicDefence = 2792
    };
getRow(11,4)->
    #pet_starCfg {
    petStar = 11,
    petQuality = 4,
    maxHP2 = 34900,
    physicalAttack = 3490,
    magicAttack = 3490,
    physicalDefence = 3490,
    magicDefence = 3490
    };
getRow(12,0)->
    #pet_starCfg {
    petStar = 12,
    petQuality = 0,
    maxHP2 = 15277,
    physicalAttack = 1527,
    magicAttack = 1527,
    physicalDefence = 1527,
    magicDefence = 1527
    };
getRow(12,1)->
    #pet_starCfg {
    petStar = 12,
    petQuality = 1,
    maxHP2 = 19097,
    physicalAttack = 1909,
    magicAttack = 1909,
    physicalDefence = 1909,
    magicDefence = 1909
    };
getRow(12,2)->
    #pet_starCfg {
    petStar = 12,
    petQuality = 2,
    maxHP2 = 23872,
    physicalAttack = 2387,
    magicAttack = 2387,
    physicalDefence = 2387,
    magicDefence = 2387
    };
getRow(12,3)->
    #pet_starCfg {
    petStar = 12,
    petQuality = 3,
    maxHP2 = 29840,
    physicalAttack = 2984,
    magicAttack = 2984,
    physicalDefence = 2984,
    magicDefence = 2984
    };
getRow(12,4)->
    #pet_starCfg {
    petStar = 12,
    petQuality = 4,
    maxHP2 = 37300,
    physicalAttack = 3730,
    magicAttack = 3730,
    physicalDefence = 3730,
    magicDefence = 3730
    };
getRow(13,0)->
    #pet_starCfg {
    petStar = 13,
    petQuality = 0,
    maxHP2 = 16260,
    physicalAttack = 1625,
    magicAttack = 1625,
    physicalDefence = 1625,
    magicDefence = 1625
    };
getRow(13,1)->
    #pet_starCfg {
    petStar = 13,
    petQuality = 1,
    maxHP2 = 20326,
    physicalAttack = 2032,
    magicAttack = 2032,
    physicalDefence = 2032,
    magicDefence = 2032
    };
getRow(13,2)->
    #pet_starCfg {
    petStar = 13,
    petQuality = 2,
    maxHP2 = 25408,
    physicalAttack = 2540,
    magicAttack = 2540,
    physicalDefence = 2540,
    magicDefence = 2540
    };
getRow(13,3)->
    #pet_starCfg {
    petStar = 13,
    petQuality = 3,
    maxHP2 = 31760,
    physicalAttack = 3176,
    magicAttack = 3176,
    physicalDefence = 3176,
    magicDefence = 3176
    };
getRow(13,4)->
    #pet_starCfg {
    petStar = 13,
    petQuality = 4,
    maxHP2 = 39700,
    physicalAttack = 3970,
    magicAttack = 3970,
    physicalDefence = 3970,
    magicDefence = 3970
    };
getRow(14,0)->
    #pet_starCfg {
    petStar = 14,
    petQuality = 0,
    maxHP2 = 17244,
    physicalAttack = 1724,
    magicAttack = 1724,
    physicalDefence = 1724,
    magicDefence = 1724
    };
getRow(14,1)->
    #pet_starCfg {
    petStar = 14,
    petQuality = 1,
    maxHP2 = 21555,
    physicalAttack = 2155,
    magicAttack = 2155,
    physicalDefence = 2155,
    magicDefence = 2155
    };
getRow(14,2)->
    #pet_starCfg {
    petStar = 14,
    petQuality = 2,
    maxHP2 = 26944,
    physicalAttack = 2694,
    magicAttack = 2694,
    physicalDefence = 2694,
    magicDefence = 2694
    };
getRow(14,3)->
    #pet_starCfg {
    petStar = 14,
    petQuality = 3,
    maxHP2 = 33680,
    physicalAttack = 3368,
    magicAttack = 3368,
    physicalDefence = 3368,
    magicDefence = 3368
    };
getRow(14,4)->
    #pet_starCfg {
    petStar = 14,
    petQuality = 4,
    maxHP2 = 42100,
    physicalAttack = 4210,
    magicAttack = 4210,
    physicalDefence = 4210,
    magicDefence = 4210
    };
getRow(15,0)->
    #pet_starCfg {
    petStar = 15,
    petQuality = 0,
    maxHP2 = 23183,
    physicalAttack = 2317,
    magicAttack = 2317,
    physicalDefence = 2317,
    magicDefence = 2317
    };
getRow(15,1)->
    #pet_starCfg {
    petStar = 15,
    petQuality = 1,
    maxHP2 = 28979,
    physicalAttack = 2897,
    magicAttack = 2897,
    physicalDefence = 2897,
    magicDefence = 2897
    };
getRow(15,2)->
    #pet_starCfg {
    petStar = 15,
    petQuality = 2,
    maxHP2 = 36224,
    physicalAttack = 3622,
    magicAttack = 3622,
    physicalDefence = 3622,
    magicDefence = 3622
    };
getRow(15,3)->
    #pet_starCfg {
    petStar = 15,
    petQuality = 3,
    maxHP2 = 45280,
    physicalAttack = 4528,
    magicAttack = 4528,
    physicalDefence = 4528,
    magicDefence = 4528
    };
getRow(15,4)->
    #pet_starCfg {
    petStar = 15,
    petQuality = 4,
    maxHP2 = 56600,
    physicalAttack = 5660,
    magicAttack = 5660,
    physicalDefence = 5660,
    magicDefence = 5660
    };
getRow(16,0)->
    #pet_starCfg {
    petStar = 16,
    petQuality = 0,
    maxHP2 = 24288,
    physicalAttack = 2428,
    magicAttack = 2428,
    physicalDefence = 2428,
    magicDefence = 2428
    };
getRow(16,1)->
    #pet_starCfg {
    petStar = 16,
    petQuality = 1,
    maxHP2 = 30361,
    physicalAttack = 3036,
    magicAttack = 3036,
    physicalDefence = 3036,
    magicDefence = 3036
    };
getRow(16,2)->
    #pet_starCfg {
    petStar = 16,
    petQuality = 2,
    maxHP2 = 37952,
    physicalAttack = 3795,
    magicAttack = 3795,
    physicalDefence = 3795,
    magicDefence = 3795
    };
getRow(16,3)->
    #pet_starCfg {
    petStar = 16,
    petQuality = 3,
    maxHP2 = 47440,
    physicalAttack = 4744,
    magicAttack = 4744,
    physicalDefence = 4744,
    magicDefence = 4744
    };
getRow(16,4)->
    #pet_starCfg {
    petStar = 16,
    petQuality = 4,
    maxHP2 = 59300,
    physicalAttack = 5930,
    magicAttack = 5930,
    physicalDefence = 5930,
    magicDefence = 5930
    };
getRow(17,0)->
    #pet_starCfg {
    petStar = 17,
    petQuality = 0,
    maxHP2 = 25436,
    physicalAttack = 2543,
    magicAttack = 2543,
    physicalDefence = 2543,
    magicDefence = 2543
    };
getRow(17,1)->
    #pet_starCfg {
    petStar = 17,
    petQuality = 1,
    maxHP2 = 31795,
    physicalAttack = 3179,
    magicAttack = 3179,
    physicalDefence = 3179,
    magicDefence = 3179
    };
getRow(17,2)->
    #pet_starCfg {
    petStar = 17,
    petQuality = 2,
    maxHP2 = 39744,
    physicalAttack = 3974,
    magicAttack = 3974,
    physicalDefence = 3974,
    magicDefence = 3974
    };
getRow(17,3)->
    #pet_starCfg {
    petStar = 17,
    petQuality = 3,
    maxHP2 = 49680,
    physicalAttack = 4968,
    magicAttack = 4968,
    physicalDefence = 4968,
    magicDefence = 4968
    };
getRow(17,4)->
    #pet_starCfg {
    petStar = 17,
    petQuality = 4,
    maxHP2 = 62100,
    physicalAttack = 6210,
    magicAttack = 6210,
    physicalDefence = 6210,
    magicDefence = 6210
    };
getRow(18,0)->
    #pet_starCfg {
    petStar = 18,
    petQuality = 0,
    maxHP2 = 26582,
    physicalAttack = 2657,
    magicAttack = 2657,
    physicalDefence = 2657,
    magicDefence = 2657
    };
getRow(18,1)->
    #pet_starCfg {
    petStar = 18,
    petQuality = 1,
    maxHP2 = 33228,
    physicalAttack = 3322,
    magicAttack = 3322,
    physicalDefence = 3322,
    magicDefence = 3322
    };
getRow(18,2)->
    #pet_starCfg {
    petStar = 18,
    petQuality = 2,
    maxHP2 = 41536,
    physicalAttack = 4153,
    magicAttack = 4153,
    physicalDefence = 4153,
    magicDefence = 4153
    };
getRow(18,3)->
    #pet_starCfg {
    petStar = 18,
    petQuality = 3,
    maxHP2 = 51920,
    physicalAttack = 5192,
    magicAttack = 5192,
    physicalDefence = 5192,
    magicDefence = 5192
    };
getRow(18,4)->
    #pet_starCfg {
    petStar = 18,
    petQuality = 4,
    maxHP2 = 64900,
    physicalAttack = 6490,
    magicAttack = 6490,
    physicalDefence = 6490,
    magicDefence = 6490
    };
getRow(19,0)->
    #pet_starCfg {
    petStar = 19,
    petQuality = 0,
    maxHP2 = 27729,
    physicalAttack = 2772,
    magicAttack = 2772,
    physicalDefence = 2772,
    magicDefence = 2772
    };
getRow(19,1)->
    #pet_starCfg {
    petStar = 19,
    petQuality = 1,
    maxHP2 = 34662,
    physicalAttack = 3465,
    magicAttack = 3465,
    physicalDefence = 3465,
    magicDefence = 3465
    };
getRow(19,2)->
    #pet_starCfg {
    petStar = 19,
    petQuality = 2,
    maxHP2 = 43328,
    physicalAttack = 4332,
    magicAttack = 4332,
    physicalDefence = 4332,
    magicDefence = 4332
    };
getRow(19,3)->
    #pet_starCfg {
    petStar = 19,
    petQuality = 3,
    maxHP2 = 54160,
    physicalAttack = 5416,
    magicAttack = 5416,
    physicalDefence = 5416,
    magicDefence = 5416
    };
getRow(19,4)->
    #pet_starCfg {
    petStar = 19,
    petQuality = 4,
    maxHP2 = 67700,
    physicalAttack = 6770,
    magicAttack = 6770,
    physicalDefence = 6770,
    magicDefence = 6770
    };
getRow(20,0)->
    #pet_starCfg {
    petStar = 20,
    petQuality = 0,
    maxHP2 = 34774,
    physicalAttack = 3476,
    magicAttack = 3476,
    physicalDefence = 3476,
    magicDefence = 3476
    };
getRow(20,1)->
    #pet_starCfg {
    petStar = 20,
    petQuality = 1,
    maxHP2 = 43468,
    physicalAttack = 4346,
    magicAttack = 4346,
    physicalDefence = 4346,
    magicDefence = 4346
    };
getRow(20,2)->
    #pet_starCfg {
    petStar = 20,
    petQuality = 2,
    maxHP2 = 54336,
    physicalAttack = 5433,
    magicAttack = 5433,
    physicalDefence = 5433,
    magicDefence = 5433
    };
getRow(20,3)->
    #pet_starCfg {
    petStar = 20,
    petQuality = 3,
    maxHP2 = 67920,
    physicalAttack = 6792,
    magicAttack = 6792,
    physicalDefence = 6792,
    magicDefence = 6792
    };
getRow(20,4)->
    #pet_starCfg {
    petStar = 20,
    petQuality = 4,
    maxHP2 = 84900,
    physicalAttack = 8490,
    magicAttack = 8490,
    physicalDefence = 8490,
    magicDefence = 8490
    };
getRow(21,0)->
    #pet_starCfg {
    petStar = 21,
    petQuality = 0,
    maxHP2 = 36003,
    physicalAttack = 3600,
    magicAttack = 3600,
    physicalDefence = 3600,
    magicDefence = 3600
    };
getRow(21,1)->
    #pet_starCfg {
    petStar = 21,
    petQuality = 1,
    maxHP2 = 45004,
    physicalAttack = 4500,
    magicAttack = 4500,
    physicalDefence = 4500,
    magicDefence = 4500
    };
getRow(21,2)->
    #pet_starCfg {
    petStar = 21,
    petQuality = 2,
    maxHP2 = 56256,
    physicalAttack = 5625,
    magicAttack = 5625,
    physicalDefence = 5625,
    magicDefence = 5625
    };
getRow(21,3)->
    #pet_starCfg {
    petStar = 21,
    petQuality = 3,
    maxHP2 = 70320,
    physicalAttack = 7032,
    magicAttack = 7032,
    physicalDefence = 7032,
    magicDefence = 7032
    };
getRow(21,4)->
    #pet_starCfg {
    petStar = 21,
    petQuality = 4,
    maxHP2 = 87900,
    physicalAttack = 8790,
    magicAttack = 8790,
    physicalDefence = 8790,
    magicDefence = 8790
    };
getRow(22,0)->
    #pet_starCfg {
    petStar = 22,
    petQuality = 0,
    maxHP2 = 37232,
    physicalAttack = 3722,
    magicAttack = 3722,
    physicalDefence = 3722,
    magicDefence = 3722
    };
getRow(22,1)->
    #pet_starCfg {
    petStar = 22,
    petQuality = 1,
    maxHP2 = 46540,
    physicalAttack = 4653,
    magicAttack = 4653,
    physicalDefence = 4653,
    magicDefence = 4653
    };
getRow(22,2)->
    #pet_starCfg {
    petStar = 22,
    petQuality = 2,
    maxHP2 = 58176,
    physicalAttack = 5817,
    magicAttack = 5817,
    physicalDefence = 5817,
    magicDefence = 5817
    };
getRow(22,3)->
    #pet_starCfg {
    petStar = 22,
    petQuality = 3,
    maxHP2 = 72720,
    physicalAttack = 7272,
    magicAttack = 7272,
    physicalDefence = 7272,
    magicDefence = 7272
    };
getRow(22,4)->
    #pet_starCfg {
    petStar = 22,
    petQuality = 4,
    maxHP2 = 90900,
    physicalAttack = 9090,
    magicAttack = 9090,
    physicalDefence = 9090,
    magicDefence = 9090
    };
getRow(23,0)->
    #pet_starCfg {
    petStar = 23,
    petQuality = 0,
    maxHP2 = 38460,
    physicalAttack = 3845,
    magicAttack = 3845,
    physicalDefence = 3845,
    magicDefence = 3845
    };
getRow(23,1)->
    #pet_starCfg {
    petStar = 23,
    petQuality = 1,
    maxHP2 = 48076,
    physicalAttack = 4807,
    magicAttack = 4807,
    physicalDefence = 4807,
    magicDefence = 4807
    };
getRow(23,2)->
    #pet_starCfg {
    petStar = 23,
    petQuality = 2,
    maxHP2 = 60096,
    physicalAttack = 6009,
    magicAttack = 6009,
    physicalDefence = 6009,
    magicDefence = 6009
    };
getRow(23,3)->
    #pet_starCfg {
    petStar = 23,
    petQuality = 3,
    maxHP2 = 75120,
    physicalAttack = 7512,
    magicAttack = 7512,
    physicalDefence = 7512,
    magicDefence = 7512
    };
getRow(23,4)->
    #pet_starCfg {
    petStar = 23,
    petQuality = 4,
    maxHP2 = 93900,
    physicalAttack = 9390,
    magicAttack = 9390,
    physicalDefence = 9390,
    magicDefence = 9390
    };
getRow(24,0)->
    #pet_starCfg {
    petStar = 24,
    petQuality = 0,
    maxHP2 = 39689,
    physicalAttack = 3968,
    magicAttack = 3968,
    physicalDefence = 3968,
    magicDefence = 3968
    };
getRow(24,1)->
    #pet_starCfg {
    petStar = 24,
    petQuality = 1,
    maxHP2 = 49612,
    physicalAttack = 4960,
    magicAttack = 4960,
    physicalDefence = 4960,
    magicDefence = 4960
    };
getRow(24,2)->
    #pet_starCfg {
    petStar = 24,
    petQuality = 2,
    maxHP2 = 62016,
    physicalAttack = 6201,
    magicAttack = 6201,
    physicalDefence = 6201,
    magicDefence = 6201
    };
getRow(24,3)->
    #pet_starCfg {
    petStar = 24,
    petQuality = 3,
    maxHP2 = 77520,
    physicalAttack = 7752,
    magicAttack = 7752,
    physicalDefence = 7752,
    magicDefence = 7752
    };
getRow(24,4)->
    #pet_starCfg {
    petStar = 24,
    petQuality = 4,
    maxHP2 = 96900,
    physicalAttack = 9690,
    magicAttack = 9690,
    physicalDefence = 9690,
    magicDefence = 9690
    };
getRow(25,0)->
    #pet_starCfg {
    petStar = 25,
    petQuality = 0,
    maxHP2 = 47840,
    physicalAttack = 4784,
    magicAttack = 4784,
    physicalDefence = 4784,
    magicDefence = 4784
    };
getRow(25,1)->
    #pet_starCfg {
    petStar = 25,
    petQuality = 1,
    maxHP2 = 59801,
    physicalAttack = 5980,
    magicAttack = 5980,
    physicalDefence = 5980,
    magicDefence = 5980
    };
getRow(25,2)->
    #pet_starCfg {
    petStar = 25,
    petQuality = 2,
    maxHP2 = 74752,
    physicalAttack = 7475,
    magicAttack = 7475,
    physicalDefence = 7475,
    magicDefence = 7475
    };
getRow(25,3)->
    #pet_starCfg {
    petStar = 25,
    petQuality = 3,
    maxHP2 = 93440,
    physicalAttack = 9344,
    magicAttack = 9344,
    physicalDefence = 9344,
    magicDefence = 9344
    };
getRow(25,4)->
    #pet_starCfg {
    petStar = 25,
    petQuality = 4,
    maxHP2 = 116800,
    physicalAttack = 11680,
    magicAttack = 11680,
    physicalDefence = 11680,
    magicDefence = 11680
    };
getRow(_,_)->[].

getKeyList()->[
    {1,0},
    {1,1},
    {1,2},
    {1,3},
    {1,4},
    {2,0},
    {2,1},
    {2,2},
    {2,3},
    {2,4},
    {3,0},
    {3,1},
    {3,2},
    {3,3},
    {3,4},
    {4,0},
    {4,1},
    {4,2},
    {4,3},
    {4,4},
    {5,0},
    {5,1},
    {5,2},
    {5,3},
    {5,4},
    {6,0},
    {6,1},
    {6,2},
    {6,3},
    {6,4},
    {7,0},
    {7,1},
    {7,2},
    {7,3},
    {7,4},
    {8,0},
    {8,1},
    {8,2},
    {8,3},
    {8,4},
    {9,0},
    {9,1},
    {9,2},
    {9,3},
    {9,4},
    {10,0},
    {10,1},
    {10,2},
    {10,3},
    {10,4},
    {11,0},
    {11,1},
    {11,2},
    {11,3},
    {11,4},
    {12,0},
    {12,1},
    {12,2},
    {12,3},
    {12,4},
    {13,0},
    {13,1},
    {13,2},
    {13,3},
    {13,4},
    {14,0},
    {14,1},
    {14,2},
    {14,3},
    {14,4},
    {15,0},
    {15,1},
    {15,2},
    {15,3},
    {15,4},
    {16,0},
    {16,1},
    {16,2},
    {16,3},
    {16,4},
    {17,0},
    {17,1},
    {17,2},
    {17,3},
    {17,4},
    {18,0},
    {18,1},
    {18,2},
    {18,3},
    {18,4},
    {19,0},
    {19,1},
    {19,2},
    {19,3},
    {19,4},
    {20,0},
    {20,1},
    {20,2},
    {20,3},
    {20,4},
    {21,0},
    {21,1},
    {21,2},
    {21,3},
    {21,4},
    {22,0},
    {22,1},
    {22,2},
    {22,3},
    {22,4},
    {23,0},
    {23,1},
    {23,2},
    {23,3},
    {23,4},
    {24,0},
    {24,1},
    {24,2},
    {24,3},
    {24,4},
    {25,0},
    {25,1},
    {25,2},
    {25,3},
    {25,4}
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
    25
    ].

get2KeyList(1)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(2)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(3)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(4)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(5)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(6)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(7)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(8)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(9)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(10)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(11)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(12)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(13)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(14)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(15)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(16)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(17)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(18)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(19)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(20)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(21)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(22)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(23)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(24)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(25)->[
    0,
    1,
    2,
    3,
    4
    ];
get2KeyList(_)->[].

