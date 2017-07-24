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
    maxHP2 = 600,
    physicalAttack = 60,
    magicAttack = 60,
    physicalDefence = 60,
    magicDefence = 60
    };
getRow(1,1)->
    #pet_starCfg {
    petStar = 1,
    petQuality = 1,
    maxHP2 = 660,
    physicalAttack = 66,
    magicAttack = 66,
    physicalDefence = 66,
    magicDefence = 66
    };
getRow(1,2)->
    #pet_starCfg {
    petStar = 1,
    petQuality = 2,
    maxHP2 = 720,
    physicalAttack = 72,
    magicAttack = 72,
    physicalDefence = 72,
    magicDefence = 72
    };
getRow(1,3)->
    #pet_starCfg {
    petStar = 1,
    petQuality = 3,
    maxHP2 = 960,
    physicalAttack = 96,
    magicAttack = 96,
    physicalDefence = 96,
    magicDefence = 96
    };
getRow(1,4)->
    #pet_starCfg {
    petStar = 1,
    petQuality = 4,
    maxHP2 = 1200,
    physicalAttack = 120,
    magicAttack = 120,
    physicalDefence = 120,
    magicDefence = 120
    };
getRow(2,0)->
    #pet_starCfg {
    petStar = 2,
    petQuality = 0,
    maxHP2 = 1200,
    physicalAttack = 120,
    magicAttack = 120,
    physicalDefence = 120,
    magicDefence = 120
    };
getRow(2,1)->
    #pet_starCfg {
    petStar = 2,
    petQuality = 1,
    maxHP2 = 1320,
    physicalAttack = 132,
    magicAttack = 132,
    physicalDefence = 132,
    magicDefence = 132
    };
getRow(2,2)->
    #pet_starCfg {
    petStar = 2,
    petQuality = 2,
    maxHP2 = 1440,
    physicalAttack = 144,
    magicAttack = 144,
    physicalDefence = 144,
    magicDefence = 144
    };
getRow(2,3)->
    #pet_starCfg {
    petStar = 2,
    petQuality = 3,
    maxHP2 = 1920,
    physicalAttack = 192,
    magicAttack = 192,
    physicalDefence = 192,
    magicDefence = 192
    };
getRow(2,4)->
    #pet_starCfg {
    petStar = 2,
    petQuality = 4,
    maxHP2 = 2400,
    physicalAttack = 240,
    magicAttack = 240,
    physicalDefence = 240,
    magicDefence = 240
    };
getRow(3,0)->
    #pet_starCfg {
    petStar = 3,
    petQuality = 0,
    maxHP2 = 1800,
    physicalAttack = 180,
    magicAttack = 180,
    physicalDefence = 180,
    magicDefence = 180
    };
getRow(3,1)->
    #pet_starCfg {
    petStar = 3,
    petQuality = 1,
    maxHP2 = 1980,
    physicalAttack = 198,
    magicAttack = 198,
    physicalDefence = 198,
    magicDefence = 198
    };
getRow(3,2)->
    #pet_starCfg {
    petStar = 3,
    petQuality = 2,
    maxHP2 = 2160,
    physicalAttack = 216,
    magicAttack = 216,
    physicalDefence = 216,
    magicDefence = 216
    };
getRow(3,3)->
    #pet_starCfg {
    petStar = 3,
    petQuality = 3,
    maxHP2 = 2880,
    physicalAttack = 288,
    magicAttack = 288,
    physicalDefence = 288,
    magicDefence = 288
    };
getRow(3,4)->
    #pet_starCfg {
    petStar = 3,
    petQuality = 4,
    maxHP2 = 3600,
    physicalAttack = 360,
    magicAttack = 360,
    physicalDefence = 360,
    magicDefence = 360
    };
getRow(4,0)->
    #pet_starCfg {
    petStar = 4,
    petQuality = 0,
    maxHP2 = 2400,
    physicalAttack = 240,
    magicAttack = 240,
    physicalDefence = 240,
    magicDefence = 240
    };
getRow(4,1)->
    #pet_starCfg {
    petStar = 4,
    petQuality = 1,
    maxHP2 = 2640,
    physicalAttack = 264,
    magicAttack = 264,
    physicalDefence = 264,
    magicDefence = 264
    };
getRow(4,2)->
    #pet_starCfg {
    petStar = 4,
    petQuality = 2,
    maxHP2 = 2880,
    physicalAttack = 288,
    magicAttack = 288,
    physicalDefence = 288,
    magicDefence = 288
    };
getRow(4,3)->
    #pet_starCfg {
    petStar = 4,
    petQuality = 3,
    maxHP2 = 3840,
    physicalAttack = 384,
    magicAttack = 384,
    physicalDefence = 384,
    magicDefence = 384
    };
getRow(4,4)->
    #pet_starCfg {
    petStar = 4,
    petQuality = 4,
    maxHP2 = 4800,
    physicalAttack = 480,
    magicAttack = 480,
    physicalDefence = 480,
    magicDefence = 480
    };
getRow(5,0)->
    #pet_starCfg {
    petStar = 5,
    petQuality = 0,
    maxHP2 = 4200,
    physicalAttack = 420,
    magicAttack = 420,
    physicalDefence = 420,
    magicDefence = 420
    };
getRow(5,1)->
    #pet_starCfg {
    petStar = 5,
    petQuality = 1,
    maxHP2 = 4620,
    physicalAttack = 462,
    magicAttack = 462,
    physicalDefence = 462,
    magicDefence = 462
    };
getRow(5,2)->
    #pet_starCfg {
    petStar = 5,
    petQuality = 2,
    maxHP2 = 5040,
    physicalAttack = 504,
    magicAttack = 504,
    physicalDefence = 504,
    magicDefence = 504
    };
getRow(5,3)->
    #pet_starCfg {
    petStar = 5,
    petQuality = 3,
    maxHP2 = 6720,
    physicalAttack = 672,
    magicAttack = 672,
    physicalDefence = 672,
    magicDefence = 672
    };
getRow(5,4)->
    #pet_starCfg {
    petStar = 5,
    petQuality = 4,
    maxHP2 = 8400,
    physicalAttack = 840,
    magicAttack = 840,
    physicalDefence = 840,
    magicDefence = 840
    };
getRow(6,0)->
    #pet_starCfg {
    petStar = 6,
    petQuality = 0,
    maxHP2 = 4900,
    physicalAttack = 490,
    magicAttack = 490,
    physicalDefence = 490,
    magicDefence = 490
    };
getRow(6,1)->
    #pet_starCfg {
    petStar = 6,
    petQuality = 1,
    maxHP2 = 5390,
    physicalAttack = 539,
    magicAttack = 539,
    physicalDefence = 539,
    magicDefence = 539
    };
getRow(6,2)->
    #pet_starCfg {
    petStar = 6,
    petQuality = 2,
    maxHP2 = 5880,
    physicalAttack = 588,
    magicAttack = 588,
    physicalDefence = 588,
    magicDefence = 588
    };
getRow(6,3)->
    #pet_starCfg {
    petStar = 6,
    petQuality = 3,
    maxHP2 = 7840,
    physicalAttack = 784,
    magicAttack = 784,
    physicalDefence = 784,
    magicDefence = 784
    };
getRow(6,4)->
    #pet_starCfg {
    petStar = 6,
    petQuality = 4,
    maxHP2 = 9800,
    physicalAttack = 980,
    magicAttack = 980,
    physicalDefence = 980,
    magicDefence = 980
    };
getRow(7,0)->
    #pet_starCfg {
    petStar = 7,
    petQuality = 0,
    maxHP2 = 5600,
    physicalAttack = 560,
    magicAttack = 560,
    physicalDefence = 560,
    magicDefence = 560
    };
getRow(7,1)->
    #pet_starCfg {
    petStar = 7,
    petQuality = 1,
    maxHP2 = 6160,
    physicalAttack = 616,
    magicAttack = 616,
    physicalDefence = 616,
    magicDefence = 616
    };
getRow(7,2)->
    #pet_starCfg {
    petStar = 7,
    petQuality = 2,
    maxHP2 = 6720,
    physicalAttack = 672,
    magicAttack = 672,
    physicalDefence = 672,
    magicDefence = 672
    };
getRow(7,3)->
    #pet_starCfg {
    petStar = 7,
    petQuality = 3,
    maxHP2 = 8960,
    physicalAttack = 896,
    magicAttack = 896,
    physicalDefence = 896,
    magicDefence = 896
    };
getRow(7,4)->
    #pet_starCfg {
    petStar = 7,
    petQuality = 4,
    maxHP2 = 11200,
    physicalAttack = 1120,
    magicAttack = 1120,
    physicalDefence = 1120,
    magicDefence = 1120
    };
getRow(8,0)->
    #pet_starCfg {
    petStar = 8,
    petQuality = 0,
    maxHP2 = 6250,
    physicalAttack = 625,
    magicAttack = 625,
    physicalDefence = 625,
    magicDefence = 625
    };
getRow(8,1)->
    #pet_starCfg {
    petStar = 8,
    petQuality = 1,
    maxHP2 = 6875,
    physicalAttack = 687.5,
    magicAttack = 687.5,
    physicalDefence = 687.5,
    magicDefence = 687.5
    };
getRow(8,2)->
    #pet_starCfg {
    petStar = 8,
    petQuality = 2,
    maxHP2 = 7500,
    physicalAttack = 750,
    magicAttack = 750,
    physicalDefence = 750,
    magicDefence = 750
    };
getRow(8,3)->
    #pet_starCfg {
    petStar = 8,
    petQuality = 3,
    maxHP2 = 10000,
    physicalAttack = 1000,
    magicAttack = 1000,
    physicalDefence = 1000,
    magicDefence = 1000
    };
getRow(8,4)->
    #pet_starCfg {
    petStar = 8,
    petQuality = 4,
    maxHP2 = 12500,
    physicalAttack = 1250,
    magicAttack = 1250,
    physicalDefence = 1250,
    magicDefence = 1250
    };
getRow(9,0)->
    #pet_starCfg {
    petStar = 9,
    petQuality = 0,
    maxHP2 = 6950,
    physicalAttack = 695,
    magicAttack = 695,
    physicalDefence = 695,
    magicDefence = 695
    };
getRow(9,1)->
    #pet_starCfg {
    petStar = 9,
    petQuality = 1,
    maxHP2 = 7645,
    physicalAttack = 764.5,
    magicAttack = 764.5,
    physicalDefence = 764.5,
    magicDefence = 764.5
    };
getRow(9,2)->
    #pet_starCfg {
    petStar = 9,
    petQuality = 2,
    maxHP2 = 8340,
    physicalAttack = 834,
    magicAttack = 834,
    physicalDefence = 834,
    magicDefence = 834
    };
getRow(9,3)->
    #pet_starCfg {
    petStar = 9,
    petQuality = 3,
    maxHP2 = 11120,
    physicalAttack = 1112,
    magicAttack = 1112,
    physicalDefence = 1112,
    magicDefence = 1112
    };
getRow(9,4)->
    #pet_starCfg {
    petStar = 9,
    petQuality = 4,
    maxHP2 = 13900,
    physicalAttack = 1390,
    magicAttack = 1390,
    physicalDefence = 1390,
    magicDefence = 1390
    };
getRow(10,0)->
    #pet_starCfg {
    petStar = 10,
    petQuality = 0,
    maxHP2 = 10850,
    physicalAttack = 1085,
    magicAttack = 1085,
    physicalDefence = 1085,
    magicDefence = 1085
    };
getRow(10,1)->
    #pet_starCfg {
    petStar = 10,
    petQuality = 1,
    maxHP2 = 11935,
    physicalAttack = 1193.5,
    magicAttack = 1193.5,
    physicalDefence = 1193.5,
    magicDefence = 1193.5
    };
getRow(10,2)->
    #pet_starCfg {
    petStar = 10,
    petQuality = 2,
    maxHP2 = 13020,
    physicalAttack = 1302,
    magicAttack = 1302,
    physicalDefence = 1302,
    magicDefence = 1302
    };
getRow(10,3)->
    #pet_starCfg {
    petStar = 10,
    petQuality = 3,
    maxHP2 = 17360,
    physicalAttack = 1736,
    magicAttack = 1736,
    physicalDefence = 1736,
    magicDefence = 1736
    };
getRow(10,4)->
    #pet_starCfg {
    petStar = 10,
    petQuality = 4,
    maxHP2 = 21700,
    physicalAttack = 2170,
    magicAttack = 2170,
    physicalDefence = 2170,
    magicDefence = 2170
    };
getRow(11,0)->
    #pet_starCfg {
    petStar = 11,
    petQuality = 0,
    maxHP2 = 11650,
    physicalAttack = 1165,
    magicAttack = 1165,
    physicalDefence = 1165,
    magicDefence = 1165
    };
getRow(11,1)->
    #pet_starCfg {
    petStar = 11,
    petQuality = 1,
    maxHP2 = 12815,
    physicalAttack = 1281.5,
    magicAttack = 1281.5,
    physicalDefence = 1281.5,
    magicDefence = 1281.5
    };
getRow(11,2)->
    #pet_starCfg {
    petStar = 11,
    petQuality = 2,
    maxHP2 = 13980,
    physicalAttack = 1398,
    magicAttack = 1398,
    physicalDefence = 1398,
    magicDefence = 1398
    };
getRow(11,3)->
    #pet_starCfg {
    petStar = 11,
    petQuality = 3,
    maxHP2 = 18640,
    physicalAttack = 1864,
    magicAttack = 1864,
    physicalDefence = 1864,
    magicDefence = 1864
    };
getRow(11,4)->
    #pet_starCfg {
    petStar = 11,
    petQuality = 4,
    maxHP2 = 23300,
    physicalAttack = 2330,
    magicAttack = 2330,
    physicalDefence = 2330,
    magicDefence = 2330
    };
getRow(12,0)->
    #pet_starCfg {
    petStar = 12,
    petQuality = 0,
    maxHP2 = 12450,
    physicalAttack = 1245,
    magicAttack = 1245,
    physicalDefence = 1245,
    magicDefence = 1245
    };
getRow(12,1)->
    #pet_starCfg {
    petStar = 12,
    petQuality = 1,
    maxHP2 = 13695,
    physicalAttack = 1369.5,
    magicAttack = 1369.5,
    physicalDefence = 1369.5,
    magicDefence = 1369.5
    };
getRow(12,2)->
    #pet_starCfg {
    petStar = 12,
    petQuality = 2,
    maxHP2 = 14940,
    physicalAttack = 1494,
    magicAttack = 1494,
    physicalDefence = 1494,
    magicDefence = 1494
    };
getRow(12,3)->
    #pet_starCfg {
    petStar = 12,
    petQuality = 3,
    maxHP2 = 19920,
    physicalAttack = 1992,
    magicAttack = 1992,
    physicalDefence = 1992,
    magicDefence = 1992
    };
getRow(12,4)->
    #pet_starCfg {
    petStar = 12,
    petQuality = 4,
    maxHP2 = 24900,
    physicalAttack = 2490,
    magicAttack = 2490,
    physicalDefence = 2490,
    magicDefence = 2490
    };
getRow(13,0)->
    #pet_starCfg {
    petStar = 13,
    petQuality = 0,
    maxHP2 = 13250,
    physicalAttack = 1325,
    magicAttack = 1325,
    physicalDefence = 1325,
    magicDefence = 1325
    };
getRow(13,1)->
    #pet_starCfg {
    petStar = 13,
    petQuality = 1,
    maxHP2 = 14575,
    physicalAttack = 1457.5,
    magicAttack = 1457.5,
    physicalDefence = 1457.5,
    magicDefence = 1457.5
    };
getRow(13,2)->
    #pet_starCfg {
    petStar = 13,
    petQuality = 2,
    maxHP2 = 15900,
    physicalAttack = 1590,
    magicAttack = 1590,
    physicalDefence = 1590,
    magicDefence = 1590
    };
getRow(13,3)->
    #pet_starCfg {
    petStar = 13,
    petQuality = 3,
    maxHP2 = 21200,
    physicalAttack = 2120,
    magicAttack = 2120,
    physicalDefence = 2120,
    magicDefence = 2120
    };
getRow(13,4)->
    #pet_starCfg {
    petStar = 13,
    petQuality = 4,
    maxHP2 = 26500,
    physicalAttack = 2650,
    magicAttack = 2650,
    physicalDefence = 2650,
    magicDefence = 2650
    };
getRow(14,0)->
    #pet_starCfg {
    petStar = 14,
    petQuality = 0,
    maxHP2 = 14050,
    physicalAttack = 1405,
    magicAttack = 1405,
    physicalDefence = 1405,
    magicDefence = 1405
    };
getRow(14,1)->
    #pet_starCfg {
    petStar = 14,
    petQuality = 1,
    maxHP2 = 15455,
    physicalAttack = 1545.5,
    magicAttack = 1545.5,
    physicalDefence = 1545.5,
    magicDefence = 1545.5
    };
getRow(14,2)->
    #pet_starCfg {
    petStar = 14,
    petQuality = 2,
    maxHP2 = 16860,
    physicalAttack = 1686,
    magicAttack = 1686,
    physicalDefence = 1686,
    magicDefence = 1686
    };
getRow(14,3)->
    #pet_starCfg {
    petStar = 14,
    petQuality = 3,
    maxHP2 = 22480,
    physicalAttack = 2248,
    magicAttack = 2248,
    physicalDefence = 2248,
    magicDefence = 2248
    };
getRow(14,4)->
    #pet_starCfg {
    petStar = 14,
    petQuality = 4,
    maxHP2 = 28100,
    physicalAttack = 2810,
    magicAttack = 2810,
    physicalDefence = 2810,
    magicDefence = 2810
    };
getRow(15,0)->
    #pet_starCfg {
    petStar = 15,
    petQuality = 0,
    maxHP2 = 18850,
    physicalAttack = 1885,
    magicAttack = 1885,
    physicalDefence = 1885,
    magicDefence = 1885
    };
getRow(15,1)->
    #pet_starCfg {
    petStar = 15,
    petQuality = 1,
    maxHP2 = 20735,
    physicalAttack = 2073.5,
    magicAttack = 2073.5,
    physicalDefence = 2073.5,
    magicDefence = 2073.5
    };
getRow(15,2)->
    #pet_starCfg {
    petStar = 15,
    petQuality = 2,
    maxHP2 = 22620,
    physicalAttack = 2262,
    magicAttack = 2262,
    physicalDefence = 2262,
    magicDefence = 2262
    };
getRow(15,3)->
    #pet_starCfg {
    petStar = 15,
    petQuality = 3,
    maxHP2 = 30160,
    physicalAttack = 3016,
    magicAttack = 3016,
    physicalDefence = 3016,
    magicDefence = 3016
    };
getRow(15,4)->
    #pet_starCfg {
    petStar = 15,
    petQuality = 4,
    maxHP2 = 37700,
    physicalAttack = 3770,
    magicAttack = 3770,
    physicalDefence = 3770,
    magicDefence = 3770
    };
getRow(16,0)->
    #pet_starCfg {
    petStar = 16,
    petQuality = 0,
    maxHP2 = 19800,
    physicalAttack = 1980,
    magicAttack = 1980,
    physicalDefence = 1980,
    magicDefence = 1980
    };
getRow(16,1)->
    #pet_starCfg {
    petStar = 16,
    petQuality = 1,
    maxHP2 = 21780,
    physicalAttack = 2178,
    magicAttack = 2178,
    physicalDefence = 2178,
    magicDefence = 2178
    };
getRow(16,2)->
    #pet_starCfg {
    petStar = 16,
    petQuality = 2,
    maxHP2 = 23760,
    physicalAttack = 2376,
    magicAttack = 2376,
    physicalDefence = 2376,
    magicDefence = 2376
    };
getRow(16,3)->
    #pet_starCfg {
    petStar = 16,
    petQuality = 3,
    maxHP2 = 31680,
    physicalAttack = 3168,
    magicAttack = 3168,
    physicalDefence = 3168,
    magicDefence = 3168
    };
getRow(16,4)->
    #pet_starCfg {
    petStar = 16,
    petQuality = 4,
    maxHP2 = 39600,
    physicalAttack = 3960,
    magicAttack = 3960,
    physicalDefence = 3960,
    magicDefence = 3960
    };
getRow(17,0)->
    #pet_starCfg {
    petStar = 17,
    petQuality = 0,
    maxHP2 = 20700,
    physicalAttack = 2070,
    magicAttack = 2070,
    physicalDefence = 2070,
    magicDefence = 2070
    };
getRow(17,1)->
    #pet_starCfg {
    petStar = 17,
    petQuality = 1,
    maxHP2 = 22770,
    physicalAttack = 2277,
    magicAttack = 2277,
    physicalDefence = 2277,
    magicDefence = 2277
    };
getRow(17,2)->
    #pet_starCfg {
    petStar = 17,
    petQuality = 2,
    maxHP2 = 24840,
    physicalAttack = 2484,
    magicAttack = 2484,
    physicalDefence = 2484,
    magicDefence = 2484
    };
getRow(17,3)->
    #pet_starCfg {
    petStar = 17,
    petQuality = 3,
    maxHP2 = 33120,
    physicalAttack = 3312,
    magicAttack = 3312,
    physicalDefence = 3312,
    magicDefence = 3312
    };
getRow(17,4)->
    #pet_starCfg {
    petStar = 17,
    petQuality = 4,
    maxHP2 = 41400,
    physicalAttack = 4140,
    magicAttack = 4140,
    physicalDefence = 4140,
    magicDefence = 4140
    };
getRow(18,0)->
    #pet_starCfg {
    petStar = 18,
    petQuality = 0,
    maxHP2 = 21650,
    physicalAttack = 2165,
    magicAttack = 2165,
    physicalDefence = 2165,
    magicDefence = 2165
    };
getRow(18,1)->
    #pet_starCfg {
    petStar = 18,
    petQuality = 1,
    maxHP2 = 23815,
    physicalAttack = 2381.5,
    magicAttack = 2381.5,
    physicalDefence = 2381.5,
    magicDefence = 2381.5
    };
getRow(18,2)->
    #pet_starCfg {
    petStar = 18,
    petQuality = 2,
    maxHP2 = 25980,
    physicalAttack = 2598,
    magicAttack = 2598,
    physicalDefence = 2598,
    magicDefence = 2598
    };
getRow(18,3)->
    #pet_starCfg {
    petStar = 18,
    petQuality = 3,
    maxHP2 = 34640,
    physicalAttack = 3464,
    magicAttack = 3464,
    physicalDefence = 3464,
    magicDefence = 3464
    };
getRow(18,4)->
    #pet_starCfg {
    petStar = 18,
    petQuality = 4,
    maxHP2 = 43300,
    physicalAttack = 4330,
    magicAttack = 4330,
    physicalDefence = 4330,
    magicDefence = 4330
    };
getRow(19,0)->
    #pet_starCfg {
    petStar = 19,
    petQuality = 0,
    maxHP2 = 22550,
    physicalAttack = 2255,
    magicAttack = 2255,
    physicalDefence = 2255,
    magicDefence = 2255
    };
getRow(19,1)->
    #pet_starCfg {
    petStar = 19,
    petQuality = 1,
    maxHP2 = 24805,
    physicalAttack = 2480.5,
    magicAttack = 2480.5,
    physicalDefence = 2480.5,
    magicDefence = 2480.5
    };
getRow(19,2)->
    #pet_starCfg {
    petStar = 19,
    petQuality = 2,
    maxHP2 = 27060,
    physicalAttack = 2706,
    magicAttack = 2706,
    physicalDefence = 2706,
    magicDefence = 2706
    };
getRow(19,3)->
    #pet_starCfg {
    petStar = 19,
    petQuality = 3,
    maxHP2 = 36080,
    physicalAttack = 3608,
    magicAttack = 3608,
    physicalDefence = 3608,
    magicDefence = 3608
    };
getRow(19,4)->
    #pet_starCfg {
    petStar = 19,
    petQuality = 4,
    maxHP2 = 45100,
    physicalAttack = 4510,
    magicAttack = 4510,
    physicalDefence = 4510,
    magicDefence = 4510
    };
getRow(20,0)->
    #pet_starCfg {
    petStar = 20,
    petQuality = 0,
    maxHP2 = 28300,
    physicalAttack = 2830,
    magicAttack = 2830,
    physicalDefence = 2830,
    magicDefence = 2830
    };
getRow(20,1)->
    #pet_starCfg {
    petStar = 20,
    petQuality = 1,
    maxHP2 = 31130,
    physicalAttack = 3113,
    magicAttack = 3113,
    physicalDefence = 3113,
    magicDefence = 3113
    };
getRow(20,2)->
    #pet_starCfg {
    petStar = 20,
    petQuality = 2,
    maxHP2 = 33960,
    physicalAttack = 3396,
    magicAttack = 3396,
    physicalDefence = 3396,
    magicDefence = 3396
    };
getRow(20,3)->
    #pet_starCfg {
    petStar = 20,
    petQuality = 3,
    maxHP2 = 45280,
    physicalAttack = 4528,
    magicAttack = 4528,
    physicalDefence = 4528,
    magicDefence = 4528
    };
getRow(20,4)->
    #pet_starCfg {
    petStar = 20,
    petQuality = 4,
    maxHP2 = 56600,
    physicalAttack = 5660,
    magicAttack = 5660,
    physicalDefence = 5660,
    magicDefence = 5660
    };
getRow(21,0)->
    #pet_starCfg {
    petStar = 21,
    petQuality = 0,
    maxHP2 = 29300,
    physicalAttack = 2930,
    magicAttack = 2930,
    physicalDefence = 2930,
    magicDefence = 2930
    };
getRow(21,1)->
    #pet_starCfg {
    petStar = 21,
    petQuality = 1,
    maxHP2 = 32230,
    physicalAttack = 3223,
    magicAttack = 3223,
    physicalDefence = 3223,
    magicDefence = 3223
    };
getRow(21,2)->
    #pet_starCfg {
    petStar = 21,
    petQuality = 2,
    maxHP2 = 35160,
    physicalAttack = 3516,
    magicAttack = 3516,
    physicalDefence = 3516,
    magicDefence = 3516
    };
getRow(21,3)->
    #pet_starCfg {
    petStar = 21,
    petQuality = 3,
    maxHP2 = 46880,
    physicalAttack = 4688,
    magicAttack = 4688,
    physicalDefence = 4688,
    magicDefence = 4688
    };
getRow(21,4)->
    #pet_starCfg {
    petStar = 21,
    petQuality = 4,
    maxHP2 = 58600,
    physicalAttack = 5860,
    magicAttack = 5860,
    physicalDefence = 5860,
    magicDefence = 5860
    };
getRow(22,0)->
    #pet_starCfg {
    petStar = 22,
    petQuality = 0,
    maxHP2 = 30300,
    physicalAttack = 3030,
    magicAttack = 3030,
    physicalDefence = 3030,
    magicDefence = 3030
    };
getRow(22,1)->
    #pet_starCfg {
    petStar = 22,
    petQuality = 1,
    maxHP2 = 33330,
    physicalAttack = 3333,
    magicAttack = 3333,
    physicalDefence = 3333,
    magicDefence = 3333
    };
getRow(22,2)->
    #pet_starCfg {
    petStar = 22,
    petQuality = 2,
    maxHP2 = 36360,
    physicalAttack = 3636,
    magicAttack = 3636,
    physicalDefence = 3636,
    magicDefence = 3636
    };
getRow(22,3)->
    #pet_starCfg {
    petStar = 22,
    petQuality = 3,
    maxHP2 = 48480,
    physicalAttack = 4848,
    magicAttack = 4848,
    physicalDefence = 4848,
    magicDefence = 4848
    };
getRow(22,4)->
    #pet_starCfg {
    petStar = 22,
    petQuality = 4,
    maxHP2 = 60600,
    physicalAttack = 6060,
    magicAttack = 6060,
    physicalDefence = 6060,
    magicDefence = 6060
    };
getRow(23,0)->
    #pet_starCfg {
    petStar = 23,
    petQuality = 0,
    maxHP2 = 31300,
    physicalAttack = 3130,
    magicAttack = 3130,
    physicalDefence = 3130,
    magicDefence = 3130
    };
getRow(23,1)->
    #pet_starCfg {
    petStar = 23,
    petQuality = 1,
    maxHP2 = 34430,
    physicalAttack = 3443,
    magicAttack = 3443,
    physicalDefence = 3443,
    magicDefence = 3443
    };
getRow(23,2)->
    #pet_starCfg {
    petStar = 23,
    petQuality = 2,
    maxHP2 = 37560,
    physicalAttack = 3756,
    magicAttack = 3756,
    physicalDefence = 3756,
    magicDefence = 3756
    };
getRow(23,3)->
    #pet_starCfg {
    petStar = 23,
    petQuality = 3,
    maxHP2 = 50080,
    physicalAttack = 5008,
    magicAttack = 5008,
    physicalDefence = 5008,
    magicDefence = 5008
    };
getRow(23,4)->
    #pet_starCfg {
    petStar = 23,
    petQuality = 4,
    maxHP2 = 62600,
    physicalAttack = 6260,
    magicAttack = 6260,
    physicalDefence = 6260,
    magicDefence = 6260
    };
getRow(24,0)->
    #pet_starCfg {
    petStar = 24,
    petQuality = 0,
    maxHP2 = 32300,
    physicalAttack = 3230,
    magicAttack = 3230,
    physicalDefence = 3230,
    magicDefence = 3230
    };
getRow(24,1)->
    #pet_starCfg {
    petStar = 24,
    petQuality = 1,
    maxHP2 = 35530,
    physicalAttack = 3553,
    magicAttack = 3553,
    physicalDefence = 3553,
    magicDefence = 3553
    };
getRow(24,2)->
    #pet_starCfg {
    petStar = 24,
    petQuality = 2,
    maxHP2 = 38760,
    physicalAttack = 3876,
    magicAttack = 3876,
    physicalDefence = 3876,
    magicDefence = 3876
    };
getRow(24,3)->
    #pet_starCfg {
    petStar = 24,
    petQuality = 3,
    maxHP2 = 51680,
    physicalAttack = 5168,
    magicAttack = 5168,
    physicalDefence = 5168,
    magicDefence = 5168
    };
getRow(24,4)->
    #pet_starCfg {
    petStar = 24,
    petQuality = 4,
    maxHP2 = 64600,
    physicalAttack = 6460,
    magicAttack = 6460,
    physicalDefence = 6460,
    magicDefence = 6460
    };
getRow(25,0)->
    #pet_starCfg {
    petStar = 25,
    petQuality = 0,
    maxHP2 = 38900,
    physicalAttack = 3890,
    magicAttack = 3890,
    physicalDefence = 3890,
    magicDefence = 3890
    };
getRow(25,1)->
    #pet_starCfg {
    petStar = 25,
    petQuality = 1,
    maxHP2 = 42790,
    physicalAttack = 4279,
    magicAttack = 4279,
    physicalDefence = 4279,
    magicDefence = 4279
    };
getRow(25,2)->
    #pet_starCfg {
    petStar = 25,
    petQuality = 2,
    maxHP2 = 46680,
    physicalAttack = 4668,
    magicAttack = 4668,
    physicalDefence = 4668,
    magicDefence = 4668
    };
getRow(25,3)->
    #pet_starCfg {
    petStar = 25,
    petQuality = 3,
    maxHP2 = 62240,
    physicalAttack = 6224,
    magicAttack = 6224,
    physicalDefence = 6224,
    magicDefence = 6224
    };
getRow(25,4)->
    #pet_starCfg {
    petStar = 25,
    petQuality = 4,
    maxHP2 = 77800,
    physicalAttack = 7780,
    magicAttack = 7780,
    physicalDefence = 7780,
    magicDefence = 7780
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

