%% coding: latin-1
%%: 实现
-module(cfg_equipdrop_chs).
-compile(export_all).
-include("cfg_equipdrop.hrl").
-include("logger.hrl").

getRow(1)->
    #equipdropCfg {
    equipdropId = 1,
    dropDes = "位面地图普通掉落",
    dropType = 1,
    dropSource = [1],
    times = 1,
    noDrop = 0.99,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 50,
    quality1 = 50,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(2)->
    #equipdropCfg {
    equipdropId = 2,
    dropDes = "测试地图指定掉落1",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 1,
    equipID = 31000,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(3)->
    #equipdropCfg {
    equipdropId = 3,
    dropDes = "测试地图指定掉落2",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 1,
    equipID = 31000,
    equipQuality = 4,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(4)->
    #equipdropCfg {
    equipdropId = 4,
    dropDes = "30以内副本boss必掉蓝色+",
    dropType = 1,
    dropSource = [1,3],
    times = 1,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 0,
    quality1 = 0,
    quality2 = 9750,
    quality3 = 200,
    quality4 = 50,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(5)->
    #equipdropCfg {
    equipdropId = 5,
    dropDes = "30以内副本boss2次掉落",
    dropType = 1,
    dropSource = [1,3],
    times = 1,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 5000,
    quality1 = 2500,
    quality2 = 2250,
    quality3 = 200,
    quality4 = 50,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(6)->
    #equipdropCfg {
    equipdropId = 6,
    dropDes = "30以内副本boss 测试",
    dropType = 1,
    dropSource = [1,3],
    times = 1,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 2,
    dropLevel = 1,
    quality0 = 10000,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(7)->
    #equipdropCfg {
    equipdropId = 7,
    dropDes = "礼包测试随机掉落1",
    dropType = 1,
    dropSource = [1,3],
    times = 1,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 2,
    dropLevel = 1,
    quality0 = 3000,
    quality1 = 3000,
    quality2 = 3000,
    quality3 = 1000,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(8)->
    #equipdropCfg {
    equipdropId = 8,
    dropDes = "礼包测试指定掉落1",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 30037,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(9)->
    #equipdropCfg {
    equipdropId = 9,
    dropDes = "运营等级段礼包（蓝色）",
    dropType = 1,
    dropSource = [1],
    times = 1,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 0,
    quality1 = 0,
    quality2 = 10000,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(10)->
    #equipdropCfg {
    equipdropId = 10,
    dropDes = "副本结算装备包",
    dropType = 1,
    dropSource = [1],
    times = 1,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 0,
    quality1 = 0,
    quality2 = 10000,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(11)->
    #equipdropCfg {
    equipdropId = 11,
    dropDes = "副本结算高级装备包（暂时）",
    dropType = 1,
    dropSource = [1],
    times = 1,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 0,
    quality1 = 0,
    quality2 = 5000,
    quality3 = 5000,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(12)->
    #equipdropCfg {
    equipdropId = 12,
    dropDes = "副本地图普通掉落",
    dropType = 1,
    dropSource = [1],
    times = 1,
    noDrop = 0.98,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 50,
    quality1 = 50,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(13)->
    #equipdropCfg {
    equipdropId = 13,
    dropDes = "野外地图普通掉落",
    dropType = 1,
    dropSource = [1],
    times = 1,
    noDrop = 0.99,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 50,
    quality1 = 50,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(14)->
    #equipdropCfg {
    equipdropId = 14,
    dropDes = "20级后精英必掉绿色+",
    dropType = 1,
    dropSource = [1],
    times = 1,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 0,
    quality1 = 49,
    quality2 = 49,
    quality3 = 2,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(15)->
    #equipdropCfg {
    equipdropId = 15,
    dropDes = "30以上副本boss必掉蓝色+",
    dropType = 1,
    dropSource = [1,3],
    times = 1,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 0,
    quality1 = 0,
    quality2 = 9750,
    quality3 = 200,
    quality4 = 50,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(16)->
    #equipdropCfg {
    equipdropId = 16,
    dropDes = "30以上副本boss2次掉落",
    dropType = 1,
    dropSource = [1,3],
    times = 1,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 5000,
    quality1 = 2500,
    quality2 = 2250,
    quality3 = 200,
    quality4 = 50,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(17)->
    #equipdropCfg {
    equipdropId = 17,
    dropDes = "30以上副本boss 测试",
    dropType = 1,
    dropSource = [1,3],
    times = 1,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 2,
    dropLevel = 1,
    quality0 = 10000,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(18)->
    #equipdropCfg {
    equipdropId = 18,
    dropDes = "张龙掉装备测试",
    dropType = 1,
    dropSource = [1,3],
    times = 10,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 2,
    dropLevel = 1,
    quality0 = 3000,
    quality1 = 3000,
    quality2 = 3000,
    quality3 = 1000,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(19)->
    #equipdropCfg {
    equipdropId = 19,
    dropDes = "张龙掉装备测试2",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31000,
    equipQuality = 1,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(20)->
    #equipdropCfg {
    equipdropId = 20,
    dropDes = "张龙掉装备测试3",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31148,
    equipQuality = 1,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(21)->
    #equipdropCfg {
    equipdropId = 21,
    dropDes = "张龙掉装备测试4",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31338,
    equipQuality = 1,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(22)->
    #equipdropCfg {
    equipdropId = 22,
    dropDes = "张龙掉装备测试（不绑定）",
    dropType = 1,
    dropSource = [1,3],
    times = 10,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 2,
    dropLevel = 1,
    quality0 = 0,
    quality1 = 3000,
    quality2 = 3000,
    quality3 = 3000,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(23)->
    #equipdropCfg {
    equipdropId = 23,
    dropDes = "指定传奇掉落测试",
    dropType = 2,
    dropSource = [0],
    times = 3,
    noDrop = 0,
    equipID = 31409,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(24)->
    #equipdropCfg {
    equipdropId = 24,
    dropDes = "英雄副本最终boss必掉蓝色+",
    dropType = 1,
    dropSource = [1,3,4],
    times = 1,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 0,
    quality1 = 0,
    quality2 = 9750,
    quality3 = 200,
    quality4 = 50,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 1
    };
getRow(25)->
    #equipdropCfg {
    equipdropId = 25,
    dropDes = "英雄副本最终boss2次掉落",
    dropType = 1,
    dropSource = [1,3,4],
    times = 1,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 5000,
    quality1 = 2500,
    quality2 = 2250,
    quality3 = 200,
    quality4 = 50,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 1
    };
getRow(26)->
    #equipdropCfg {
    equipdropId = 26,
    dropDes = "英雄副本小boss必掉蓝色+",
    dropType = 1,
    dropSource = [1,3,4],
    times = 1,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 0,
    quality1 = 0,
    quality2 = 9750,
    quality3 = 200,
    quality4 = 50,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 1
    };
getRow(27)->
    #equipdropCfg {
    equipdropId = 27,
    dropDes = "英雄副本小boss2次掉落",
    dropType = 1,
    dropSource = [1,3,4],
    times = 1,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 5000,
    quality1 = 2500,
    quality2 = 2250,
    quality3 = 200,
    quality4 = 50,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 1
    };
getRow(28)->
    #equipdropCfg {
    equipdropId = 28,
    dropDes = "英雄黑暗深渊1最终boss必掉蓝色+",
    dropType = 1,
    dropSource = [1,3,4],
    times = 1,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 0,
    quality1 = 0,
    quality2 = 9750,
    quality3 = 200,
    quality4 = 50,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 1
    };
getRow(29)->
    #equipdropCfg {
    equipdropId = 29,
    dropDes = "英雄黑暗深渊1最终boss2次掉落",
    dropType = 1,
    dropSource = [1,3,4],
    times = 2,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 5000,
    quality1 = 2500,
    quality2 = 2250,
    quality3 = 200,
    quality4 = 50,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 1
    };
getRow(30)->
    #equipdropCfg {
    equipdropId = 30,
    dropDes = "英雄黑暗深渊2最终boss必掉蓝色+",
    dropType = 1,
    dropSource = [1,3,4],
    times = 1,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 0,
    quality1 = 0,
    quality2 = 9750,
    quality3 = 200,
    quality4 = 50,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 1
    };
getRow(31)->
    #equipdropCfg {
    equipdropId = 31,
    dropDes = "英雄黑暗深渊2最终boss2次掉落",
    dropType = 1,
    dropSource = [1,3,4],
    times = 2,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 5000,
    quality1 = 2500,
    quality2 = 2250,
    quality3 = 200,
    quality4 = 50,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 1
    };
getRow(32)->
    #equipdropCfg {
    equipdropId = 32,
    dropDes = "英雄副本小boss必掉蓝色+",
    dropType = 1,
    dropSource = [1,3,4],
    times = 1,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 0,
    quality1 = 0,
    quality2 = 9750,
    quality3 = 200,
    quality4 = 50,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 1
    };
getRow(33)->
    #equipdropCfg {
    equipdropId = 33,
    dropDes = "英雄副本小boss2次掉落",
    dropType = 1,
    dropSource = [1,3,4],
    times = 2,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 5000,
    quality1 = 2500,
    quality2 = 2250,
    quality3 = 200,
    quality4 = 50,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 1
    };
getRow(34)->
    #equipdropCfg {
    equipdropId = 34,
    dropDes = "运营等级段礼包（紫色）",
    dropType = 1,
    dropSource = [1],
    times = 1,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 10000,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(35)->
    #equipdropCfg {
    equipdropId = 35,
    dropDes = "42级橙装戒指",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31608,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(36)->
    #equipdropCfg {
    equipdropId = 36,
    dropDes = "50级橙装戒指",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31609,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(37)->
    #equipdropCfg {
    equipdropId = 37,
    dropDes = "58级橙装戒指",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31610,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(38)->
    #equipdropCfg {
    equipdropId = 38,
    dropDes = "42级橙装项链",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31611,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(39)->
    #equipdropCfg {
    equipdropId = 39,
    dropDes = "50级橙装项链",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31612,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(40)->
    #equipdropCfg {
    equipdropId = 40,
    dropDes = "58级橙装项链",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31613,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(41)->
    #equipdropCfg {
    equipdropId = 41,
    dropDes = "装备礼盒",
    dropType = 1,
    dropSource = [1],
    times = 1,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 9500,
    quality4 = 500,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(42)->
    #equipdropCfg {
    equipdropId = 42,
    dropDes = "张龙掉紫色装备测试（不绑定）",
    dropType = 1,
    dropSource = [1,3],
    times = 10,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 2,
    dropLevel = 1,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 10000,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(43)->
    #equipdropCfg {
    equipdropId = 43,
    dropDes = "张龙掉橙色装备测试（不绑定）",
    dropType = 1,
    dropSource = [4],
    times = 10,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 2,
    dropLevel = 1,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 10000,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(44)->
    #equipdropCfg {
    equipdropId = 44,
    dropDes = "国庆橙色戒指",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32181,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(45)->
    #equipdropCfg {
    equipdropId = 45,
    dropDes = "国庆红色戒指",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32182,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(46)->
    #equipdropCfg {
    equipdropId = 46,
    dropDes = "国庆红色戒指",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 34000,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(47)->
    #equipdropCfg {
    equipdropId = 47,
    dropDes = "国庆红色戒指",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 34001,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(48)->
    #equipdropCfg {
    equipdropId = 48,
    dropDes = "国庆红色戒指",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 34002,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(49)->
    #equipdropCfg {
    equipdropId = 49,
    dropDes = "国庆红色戒指",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 34003,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(50)->
    #equipdropCfg {
    equipdropId = 50,
    dropDes = "辉煌之剑·神",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35372,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(51)->
    #equipdropCfg {
    equipdropId = 51,
    dropDes = "辉煌之剑·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35373,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(52)->
    #equipdropCfg {
    equipdropId = 52,
    dropDes = "辉煌之剑·人",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35374,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(53)->
    #equipdropCfg {
    equipdropId = 53,
    dropDes = "辉煌之杖·神",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35375,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(54)->
    #equipdropCfg {
    equipdropId = 54,
    dropDes = "辉煌之杖·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35376,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(55)->
    #equipdropCfg {
    equipdropId = 55,
    dropDes = "辉煌之杖·人",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35377,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(56)->
    #equipdropCfg {
    equipdropId = 56,
    dropDes = "辉煌之刃·神",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35378,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(57)->
    #equipdropCfg {
    equipdropId = 57,
    dropDes = "辉煌之刃·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35379,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(58)->
    #equipdropCfg {
    equipdropId = 58,
    dropDes = "辉煌之刃·人",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35380,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(59)->
    #equipdropCfg {
    equipdropId = 59,
    dropDes = "辉煌之镰·神",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35381,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(60)->
    #equipdropCfg {
    equipdropId = 60,
    dropDes = "辉煌之镰·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35382,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(61)->
    #equipdropCfg {
    equipdropId = 61,
    dropDes = "辉煌之镰·人",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35383,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(62)->
    #equipdropCfg {
    equipdropId = 62,
    dropDes = "守望者护腿_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32183,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(63)->
    #equipdropCfg {
    equipdropId = 63,
    dropDes = "守望者鞋子_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32184,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(64)->
    #equipdropCfg {
    equipdropId = 64,
    dropDes = "守望者羽毛帽_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32185,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(65)->
    #equipdropCfg {
    equipdropId = 65,
    dropDes = "红宝石项链_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32186,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(66)->
    #equipdropCfg {
    equipdropId = 66,
    dropDes = "红宝石戒指_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32187,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(67)->
    #equipdropCfg {
    equipdropId = 67,
    dropDes = "守望者护腿_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32188,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(68)->
    #equipdropCfg {
    equipdropId = 68,
    dropDes = "守望者鞋子_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32189,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(69)->
    #equipdropCfg {
    equipdropId = 69,
    dropDes = "守望者羽毛帽_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32190,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(70)->
    #equipdropCfg {
    equipdropId = 70,
    dropDes = "红宝石项链_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32191,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(71)->
    #equipdropCfg {
    equipdropId = 71,
    dropDes = "红宝石戒指_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32192,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(72)->
    #equipdropCfg {
    equipdropId = 72,
    dropDes = "守望者护腿_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32193,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(73)->
    #equipdropCfg {
    equipdropId = 73,
    dropDes = "守望者鞋子_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32194,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(74)->
    #equipdropCfg {
    equipdropId = 74,
    dropDes = "守望者羽毛帽_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32195,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(75)->
    #equipdropCfg {
    equipdropId = 75,
    dropDes = "红宝石项链_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32196,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(76)->
    #equipdropCfg {
    equipdropId = 76,
    dropDes = "红宝石戒指_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32197,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(77)->
    #equipdropCfg {
    equipdropId = 77,
    dropDes = "守望者护腿",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32198,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(78)->
    #equipdropCfg {
    equipdropId = 78,
    dropDes = "守望者鞋子",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32199,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(79)->
    #equipdropCfg {
    equipdropId = 79,
    dropDes = "守望者羽毛帽",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32200,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(80)->
    #equipdropCfg {
    equipdropId = 80,
    dropDes = "红宝石项链",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32201,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(81)->
    #equipdropCfg {
    equipdropId = 81,
    dropDes = "红宝石戒指",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32202,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(82)->
    #equipdropCfg {
    equipdropId = 82,
    dropDes = "勇气腿甲_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32203,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(83)->
    #equipdropCfg {
    equipdropId = 83,
    dropDes = "勇气鞋子_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32204,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(84)->
    #equipdropCfg {
    equipdropId = 84,
    dropDes = "勇气头盔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32205,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(85)->
    #equipdropCfg {
    equipdropId = 85,
    dropDes = "勇气项链_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32206,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(86)->
    #equipdropCfg {
    equipdropId = 86,
    dropDes = "勇气戒指_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32207,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(87)->
    #equipdropCfg {
    equipdropId = 87,
    dropDes = "智慧腿甲_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32208,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(88)->
    #equipdropCfg {
    equipdropId = 88,
    dropDes = "智慧鞋子_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32209,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(89)->
    #equipdropCfg {
    equipdropId = 89,
    dropDes = "智慧头盔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32210,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(90)->
    #equipdropCfg {
    equipdropId = 90,
    dropDes = "智慧项链_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32211,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(91)->
    #equipdropCfg {
    equipdropId = 91,
    dropDes = "智慧戒指_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32212,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(92)->
    #equipdropCfg {
    equipdropId = 92,
    dropDes = "狡诈腿甲_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32213,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(93)->
    #equipdropCfg {
    equipdropId = 93,
    dropDes = "狡诈鞋子_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32214,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(94)->
    #equipdropCfg {
    equipdropId = 94,
    dropDes = "狡诈头盔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32215,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(95)->
    #equipdropCfg {
    equipdropId = 95,
    dropDes = "狡诈项链_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32216,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(96)->
    #equipdropCfg {
    equipdropId = 96,
    dropDes = "狡诈戒指_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32217,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(97)->
    #equipdropCfg {
    equipdropId = 97,
    dropDes = "邪意腿甲_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32218,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(98)->
    #equipdropCfg {
    equipdropId = 98,
    dropDes = "邪意鞋子_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32219,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(99)->
    #equipdropCfg {
    equipdropId = 99,
    dropDes = "邪意帽子_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32220,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(100)->
    #equipdropCfg {
    equipdropId = 100,
    dropDes = "邪意项链_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32221,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(101)->
    #equipdropCfg {
    equipdropId = 101,
    dropDes = "邪意戒指_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32222,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(102)->
    #equipdropCfg {
    equipdropId = 102,
    dropDes = "亚瑟王腿铠_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32161,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(103)->
    #equipdropCfg {
    equipdropId = 103,
    dropDes = "亚瑟王重靴_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32162,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(104)->
    #equipdropCfg {
    equipdropId = 104,
    dropDes = "亚瑟王重盔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32163,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(105)->
    #equipdropCfg {
    equipdropId = 105,
    dropDes = "亚瑟王戒指_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32164,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(106)->
    #equipdropCfg {
    equipdropId = 106,
    dropDes = "亚瑟王项链_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32165,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(107)->
    #equipdropCfg {
    equipdropId = 107,
    dropDes = "魔龙护腿_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32166,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(108)->
    #equipdropCfg {
    equipdropId = 108,
    dropDes = "魔龙之爪_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32167,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(109)->
    #equipdropCfg {
    equipdropId = 109,
    dropDes = "魔龙之角_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32168,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(110)->
    #equipdropCfg {
    equipdropId = 110,
    dropDes = "魔龙之心_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32169,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(111)->
    #equipdropCfg {
    equipdropId = 111,
    dropDes = "魔龙之眼_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32170,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(112)->
    #equipdropCfg {
    equipdropId = 112,
    dropDes = "暗影护腿_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32171,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(113)->
    #equipdropCfg {
    equipdropId = 113,
    dropDes = "暗影鞋子_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32172,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(114)->
    #equipdropCfg {
    equipdropId = 114,
    dropDes = "暗影之眼_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32173,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(115)->
    #equipdropCfg {
    equipdropId = 115,
    dropDes = "暗影之心_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32174,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(116)->
    #equipdropCfg {
    equipdropId = 116,
    dropDes = "暗影之力_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32175,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(117)->
    #equipdropCfg {
    equipdropId = 117,
    dropDes = "魅魔皮裤_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32176,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(118)->
    #equipdropCfg {
    equipdropId = 118,
    dropDes = "魅魔鞋子_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32177,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(119)->
    #equipdropCfg {
    equipdropId = 119,
    dropDes = "魅魔头饰_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32178,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(120)->
    #equipdropCfg {
    equipdropId = 120,
    dropDes = "魅魔的谎言_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32179,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(121)->
    #equipdropCfg {
    equipdropId = 121,
    dropDes = "魅魔的诱惑_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32180,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(122)->
    #equipdropCfg {
    equipdropId = 122,
    dropDes = "审判之剑·魔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35276,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(123)->
    #equipdropCfg {
    equipdropId = 123,
    dropDes = "审判之盾·魔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35277,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(124)->
    #equipdropCfg {
    equipdropId = 124,
    dropDes = "审判盔甲·魔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35278,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(125)->
    #equipdropCfg {
    equipdropId = 125,
    dropDes = "审判护腿·魔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35279,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(126)->
    #equipdropCfg {
    equipdropId = 126,
    dropDes = "审判重靴·魔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35280,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(127)->
    #equipdropCfg {
    equipdropId = 127,
    dropDes = "审判重盔·魔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35281,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(128)->
    #equipdropCfg {
    equipdropId = 128,
    dropDes = "审判项链·魔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35282,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(129)->
    #equipdropCfg {
    equipdropId = 129,
    dropDes = "审判戒指·魔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35283,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(130)->
    #equipdropCfg {
    equipdropId = 130,
    dropDes = "冰与火法杖·魔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35284,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(131)->
    #equipdropCfg {
    equipdropId = 131,
    dropDes = "冰与火之心·魔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35285,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(132)->
    #equipdropCfg {
    equipdropId = 132,
    dropDes = "冰与火法袍·魔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35286,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(133)->
    #equipdropCfg {
    equipdropId = 133,
    dropDes = "冰与火护腿·魔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35287,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(134)->
    #equipdropCfg {
    equipdropId = 134,
    dropDes = "冰与火鞋子·魔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35288,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(135)->
    #equipdropCfg {
    equipdropId = 135,
    dropDes = "冰与火发饰·魔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35289,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(136)->
    #equipdropCfg {
    equipdropId = 136,
    dropDes = "冰与火项链·魔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35290,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(137)->
    #equipdropCfg {
    equipdropId = 137,
    dropDes = "冰与火戒指·魔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35291,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(138)->
    #equipdropCfg {
    equipdropId = 138,
    dropDes = "影之心匕首·魔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35292,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(139)->
    #equipdropCfg {
    equipdropId = 139,
    dropDes = "影之心刺刃·魔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35293,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(140)->
    #equipdropCfg {
    equipdropId = 140,
    dropDes = "影之心魔皮·魔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35294,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(141)->
    #equipdropCfg {
    equipdropId = 141,
    dropDes = "影之心护腿·魔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35295,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(142)->
    #equipdropCfg {
    equipdropId = 142,
    dropDes = "影之心软鞋·魔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35296,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(143)->
    #equipdropCfg {
    equipdropId = 143,
    dropDes = "影之心发髻·魔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35297,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(144)->
    #equipdropCfg {
    equipdropId = 144,
    dropDes = "影之心项链·魔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35298,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(145)->
    #equipdropCfg {
    equipdropId = 145,
    dropDes = "影之心戒指·魔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35299,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(146)->
    #equipdropCfg {
    equipdropId = 146,
    dropDes = "魔界巨镰·魔_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35300,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(147)->
    #equipdropCfg {
    equipdropId = 147,
    dropDes = "魔界魂魄·魔_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35301,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(148)->
    #equipdropCfg {
    equipdropId = 148,
    dropDes = "魔界紫裙·魔_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35302,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(149)->
    #equipdropCfg {
    equipdropId = 149,
    dropDes = "魔界护腿·魔_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35303,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(150)->
    #equipdropCfg {
    equipdropId = 150,
    dropDes = "魔界战靴·魔_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35304,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(151)->
    #equipdropCfg {
    equipdropId = 151,
    dropDes = "魔界发饰·魔_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35305,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(152)->
    #equipdropCfg {
    equipdropId = 152,
    dropDes = "魔界项链·魔_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35306,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(153)->
    #equipdropCfg {
    equipdropId = 153,
    dropDes = "魔界戒指·魔_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35307,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(154)->
    #equipdropCfg {
    equipdropId = 154,
    dropDes = "月骑士之剑·魔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35308,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(155)->
    #equipdropCfg {
    equipdropId = 155,
    dropDes = "月骑士之盾·魔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35309,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(156)->
    #equipdropCfg {
    equipdropId = 156,
    dropDes = "月骑士盔甲·魔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35310,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(157)->
    #equipdropCfg {
    equipdropId = 157,
    dropDes = "月骑士护腿·魔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35311,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(158)->
    #equipdropCfg {
    equipdropId = 158,
    dropDes = "月骑士重靴·魔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35312,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(159)->
    #equipdropCfg {
    equipdropId = 159,
    dropDes = "月骑士重盔·魔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35313,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(160)->
    #equipdropCfg {
    equipdropId = 160,
    dropDes = "月骑士项链·魔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35314,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(161)->
    #equipdropCfg {
    equipdropId = 161,
    dropDes = "月骑士戒指·魔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35315,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(162)->
    #equipdropCfg {
    equipdropId = 162,
    dropDes = "炎魔法杖·魔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35316,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(163)->
    #equipdropCfg {
    equipdropId = 163,
    dropDes = "炎魔之心·魔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35317,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(164)->
    #equipdropCfg {
    equipdropId = 164,
    dropDes = "炎魔法袍·魔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35318,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(165)->
    #equipdropCfg {
    equipdropId = 165,
    dropDes = "炎魔护腿·魔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35319,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(166)->
    #equipdropCfg {
    equipdropId = 166,
    dropDes = "炎魔鞋子·魔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35320,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(167)->
    #equipdropCfg {
    equipdropId = 167,
    dropDes = "炎魔发饰·魔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35321,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(168)->
    #equipdropCfg {
    equipdropId = 168,
    dropDes = "炎魔项链·魔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35322,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(169)->
    #equipdropCfg {
    equipdropId = 169,
    dropDes = "炎魔戒指·魔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35323,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(170)->
    #equipdropCfg {
    equipdropId = 170,
    dropDes = "影魔之牙·魔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35324,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(171)->
    #equipdropCfg {
    equipdropId = 171,
    dropDes = "影魔之爪·魔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35325,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(172)->
    #equipdropCfg {
    equipdropId = 172,
    dropDes = "影魔魔皮·魔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35326,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(173)->
    #equipdropCfg {
    equipdropId = 173,
    dropDes = "影魔护腿·魔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35327,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(174)->
    #equipdropCfg {
    equipdropId = 174,
    dropDes = "影魔软鞋·魔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35328,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(175)->
    #equipdropCfg {
    equipdropId = 175,
    dropDes = "影魔发髻·魔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35329,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(176)->
    #equipdropCfg {
    equipdropId = 176,
    dropDes = "影魔项链·魔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35330,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(177)->
    #equipdropCfg {
    equipdropId = 177,
    dropDes = "影魔戒指·魔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35331,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(178)->
    #equipdropCfg {
    equipdropId = 178,
    dropDes = "魔龙巨镰·魔_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35332,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(179)->
    #equipdropCfg {
    equipdropId = 179,
    dropDes = "魔龙魂魄·魔_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35333,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(180)->
    #equipdropCfg {
    equipdropId = 180,
    dropDes = "魔龙紫裙·魔_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35334,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(181)->
    #equipdropCfg {
    equipdropId = 181,
    dropDes = "魔龙护腿·魔_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35335,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(182)->
    #equipdropCfg {
    equipdropId = 182,
    dropDes = "魔龙战靴·魔_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35336,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(183)->
    #equipdropCfg {
    equipdropId = 183,
    dropDes = "魔龙发饰·魔_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35337,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(184)->
    #equipdropCfg {
    equipdropId = 184,
    dropDes = "魔龙项链·魔_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35338,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(185)->
    #equipdropCfg {
    equipdropId = 185,
    dropDes = "魔龙戒指·魔_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35339,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(186)->
    #equipdropCfg {
    equipdropId = 186,
    dropDes = "上古君王之剑·魔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35340,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(187)->
    #equipdropCfg {
    equipdropId = 187,
    dropDes = "上古君王之盾·魔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35341,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(188)->
    #equipdropCfg {
    equipdropId = 188,
    dropDes = "上古君王铠甲·魔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35342,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(189)->
    #equipdropCfg {
    equipdropId = 189,
    dropDes = "上古君王护腿·魔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35343,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(190)->
    #equipdropCfg {
    equipdropId = 190,
    dropDes = "上古君王战靴·魔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35344,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(191)->
    #equipdropCfg {
    equipdropId = 191,
    dropDes = "上古君王战盔·魔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35345,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(192)->
    #equipdropCfg {
    equipdropId = 192,
    dropDes = "上古君王项链·魔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35346,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(193)->
    #equipdropCfg {
    equipdropId = 193,
    dropDes = "上古君王戒指·魔_骑士",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35347,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(194)->
    #equipdropCfg {
    equipdropId = 194,
    dropDes = "元素领主之杖·魔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35348,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(195)->
    #equipdropCfg {
    equipdropId = 195,
    dropDes = "元素领主之匙·魔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35349,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(196)->
    #equipdropCfg {
    equipdropId = 196,
    dropDes = "元素领主法衣·魔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35350,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(197)->
    #equipdropCfg {
    equipdropId = 197,
    dropDes = "元素领主裙摆·魔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35351,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(198)->
    #equipdropCfg {
    equipdropId = 198,
    dropDes = "元素领主之靴·魔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35352,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(199)->
    #equipdropCfg {
    equipdropId = 199,
    dropDes = "元素领主之冠·魔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35353,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(200)->
    #equipdropCfg {
    equipdropId = 200,
    dropDes = "元素领主项链·魔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35354,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(201)->
    #equipdropCfg {
    equipdropId = 201,
    dropDes = "元素领主戒指·魔_法师",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35355,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(202)->
    #equipdropCfg {
    equipdropId = 202,
    dropDes = "阴影龙牙·魔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35356,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(203)->
    #equipdropCfg {
    equipdropId = 203,
    dropDes = "阴影龙爪·魔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35357,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(204)->
    #equipdropCfg {
    equipdropId = 204,
    dropDes = "阴影龙鳞铠·魔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35358,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(205)->
    #equipdropCfg {
    equipdropId = 205,
    dropDes = "阴影龙皮腿·魔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35359,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(206)->
    #equipdropCfg {
    equipdropId = 206,
    dropDes = "阴影龙爪鞋·魔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35360,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(207)->
    #equipdropCfg {
    equipdropId = 207,
    dropDes = "阴影龙角冠·魔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35361,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(208)->
    #equipdropCfg {
    equipdropId = 208,
    dropDes = "阴影龙邪眼·魔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35362,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(209)->
    #equipdropCfg {
    equipdropId = 209,
    dropDes = "阴影龙恶意·魔_刺客",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35363,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(210)->
    #equipdropCfg {
    equipdropId = 210,
    dropDes = "大恶魔之镰·魔_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35364,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(211)->
    #equipdropCfg {
    equipdropId = 211,
    dropDes = "大恶魔之魂·魔_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35365,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(212)->
    #equipdropCfg {
    equipdropId = 212,
    dropDes = "大恶魔铠甲·魔_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35366,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(213)->
    #equipdropCfg {
    equipdropId = 213,
    dropDes = "大恶魔护腿·魔_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35367,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(214)->
    #equipdropCfg {
    equipdropId = 214,
    dropDes = "大恶魔软鞋·魔_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35368,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(215)->
    #equipdropCfg {
    equipdropId = 215,
    dropDes = "大恶魔角盔·魔_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35369,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(216)->
    #equipdropCfg {
    equipdropId = 216,
    dropDes = "大恶魔项链·魔_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35370,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(217)->
    #equipdropCfg {
    equipdropId = 217,
    dropDes = "大恶魔戒指·魔_魔女",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35371,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(218)->
    #equipdropCfg {
    equipdropId = 218,
    dropDes = "冰焰火枪·魔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50201,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(219)->
    #equipdropCfg {
    equipdropId = 219,
    dropDes = "冰焰手雷·魔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50202,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(220)->
    #equipdropCfg {
    equipdropId = 220,
    dropDes = "冰焰战衣·魔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50203,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(221)->
    #equipdropCfg {
    equipdropId = 221,
    dropDes = "冰焰战腿·魔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50204,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(222)->
    #equipdropCfg {
    equipdropId = 222,
    dropDes = "冰焰战靴·魔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50205,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(223)->
    #equipdropCfg {
    equipdropId = 223,
    dropDes = "冰焰战盔·魔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50206,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(224)->
    #equipdropCfg {
    equipdropId = 224,
    dropDes = "冰焰项链·魔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50207,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(225)->
    #equipdropCfg {
    equipdropId = 225,
    dropDes = "冰焰戒指·魔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50208,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(226)->
    #equipdropCfg {
    equipdropId = 226,
    dropDes = "风雷火枪·魔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50209,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(227)->
    #equipdropCfg {
    equipdropId = 227,
    dropDes = "风雷手雷·魔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50210,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(228)->
    #equipdropCfg {
    equipdropId = 228,
    dropDes = "风雷战衣·魔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50211,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(229)->
    #equipdropCfg {
    equipdropId = 229,
    dropDes = "风雷战腿·魔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50212,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(230)->
    #equipdropCfg {
    equipdropId = 230,
    dropDes = "风雷战靴·魔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50213,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(231)->
    #equipdropCfg {
    equipdropId = 231,
    dropDes = "风雷战盔·魔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50214,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(232)->
    #equipdropCfg {
    equipdropId = 232,
    dropDes = "风雷项链·魔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50215,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(233)->
    #equipdropCfg {
    equipdropId = 233,
    dropDes = "风雷戒指·魔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50216,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(234)->
    #equipdropCfg {
    equipdropId = 234,
    dropDes = "神影火枪·魔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50217,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(235)->
    #equipdropCfg {
    equipdropId = 235,
    dropDes = "神影手雷·魔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50218,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(236)->
    #equipdropCfg {
    equipdropId = 236,
    dropDes = "神影战衣·魔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50219,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(237)->
    #equipdropCfg {
    equipdropId = 237,
    dropDes = "神影战腿·魔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50220,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(238)->
    #equipdropCfg {
    equipdropId = 238,
    dropDes = "神影战靴·魔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50221,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(239)->
    #equipdropCfg {
    equipdropId = 239,
    dropDes = "神影战盔·魔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50222,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(240)->
    #equipdropCfg {
    equipdropId = 240,
    dropDes = "神影项链·魔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50223,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(241)->
    #equipdropCfg {
    equipdropId = 241,
    dropDes = "神影戒指·魔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50224,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(242)->
    #equipdropCfg {
    equipdropId = 242,
    dropDes = "守望者护腿_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50244,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(243)->
    #equipdropCfg {
    equipdropId = 243,
    dropDes = "守望者鞋子_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50245,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(244)->
    #equipdropCfg {
    equipdropId = 244,
    dropDes = "守望者羽毛帽_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50246,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(245)->
    #equipdropCfg {
    equipdropId = 245,
    dropDes = "红宝石项链_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50247,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(246)->
    #equipdropCfg {
    equipdropId = 246,
    dropDes = "红宝石戒指_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50248,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(247)->
    #equipdropCfg {
    equipdropId = 247,
    dropDes = "雷霆腿甲_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50249,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(248)->
    #equipdropCfg {
    equipdropId = 248,
    dropDes = "雷霆鞋子_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50250,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(249)->
    #equipdropCfg {
    equipdropId = 249,
    dropDes = "雷霆头盔_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50251,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(250)->
    #equipdropCfg {
    equipdropId = 250,
    dropDes = "雷霆项链_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50252,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(251)->
    #equipdropCfg {
    equipdropId = 251,
    dropDes = "雷霆戒指_枪械",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50253,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(252)->
    #equipdropCfg {
    equipdropId = 252,
    dropDes = "辉煌火枪·神",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50225,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(253)->
    #equipdropCfg {
    equipdropId = 253,
    dropDes = "辉煌火枪·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50226,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(254)->
    #equipdropCfg {
    equipdropId = 254,
    dropDes = "辉煌火枪·人",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 50227,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(255)->
    #equipdropCfg {
    equipdropId = 255,
    dropDes = "灵魂骑士之剑·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35790,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(256)->
    #equipdropCfg {
    equipdropId = 256,
    dropDes = "灵魂骑士之盾·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35791,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(257)->
    #equipdropCfg {
    equipdropId = 257,
    dropDes = "灵魂骑士盔甲·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35792,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(258)->
    #equipdropCfg {
    equipdropId = 258,
    dropDes = "灵魂骑士护腿·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35793,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(259)->
    #equipdropCfg {
    equipdropId = 259,
    dropDes = "灵魂骑士重靴·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35794,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(260)->
    #equipdropCfg {
    equipdropId = 260,
    dropDes = "灵魂骑士重盔·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35795,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(261)->
    #equipdropCfg {
    equipdropId = 261,
    dropDes = "灵魂骑士项链·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35796,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(262)->
    #equipdropCfg {
    equipdropId = 262,
    dropDes = "灵魂骑士戒指·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35797,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(263)->
    #equipdropCfg {
    equipdropId = 263,
    dropDes = "祈魔者法杖·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35798,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(264)->
    #equipdropCfg {
    equipdropId = 264,
    dropDes = "祈魔者之心·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35799,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(265)->
    #equipdropCfg {
    equipdropId = 265,
    dropDes = "祈魔者法袍·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35800,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(266)->
    #equipdropCfg {
    equipdropId = 266,
    dropDes = "祈魔者护腿·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35801,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(267)->
    #equipdropCfg {
    equipdropId = 267,
    dropDes = "祈魔者鞋子·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35802,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(268)->
    #equipdropCfg {
    equipdropId = 268,
    dropDes = "祈魔者发饰·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35803,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(269)->
    #equipdropCfg {
    equipdropId = 269,
    dropDes = "祈魔者项链·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35804,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(270)->
    #equipdropCfg {
    equipdropId = 270,
    dropDes = "祈魔者戒指·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35805,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(271)->
    #equipdropCfg {
    equipdropId = 271,
    dropDes = "暗天使双刃·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35806,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(272)->
    #equipdropCfg {
    equipdropId = 272,
    dropDes = "暗天使短剑·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35807,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(273)->
    #equipdropCfg {
    equipdropId = 273,
    dropDes = "暗天使战衣·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35808,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(274)->
    #equipdropCfg {
    equipdropId = 274,
    dropDes = "暗天使护腿·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35809,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(275)->
    #equipdropCfg {
    equipdropId = 275,
    dropDes = "暗天使战靴·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35810,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(276)->
    #equipdropCfg {
    equipdropId = 276,
    dropDes = "暗天使头盔·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35811,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(277)->
    #equipdropCfg {
    equipdropId = 277,
    dropDes = "暗天使项链·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35812,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(278)->
    #equipdropCfg {
    equipdropId = 278,
    dropDes = "暗天使戒指·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35813,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(279)->
    #equipdropCfg {
    equipdropId = 279,
    dropDes = "天坠之心巨镰·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35814,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(280)->
    #equipdropCfg {
    equipdropId = 280,
    dropDes = "天坠之心魂魄·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35815,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(281)->
    #equipdropCfg {
    equipdropId = 281,
    dropDes = "天坠之心战裙·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35816,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(282)->
    #equipdropCfg {
    equipdropId = 282,
    dropDes = "天坠之心护腿·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35817,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(283)->
    #equipdropCfg {
    equipdropId = 283,
    dropDes = "天坠之心战靴·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35818,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(284)->
    #equipdropCfg {
    equipdropId = 284,
    dropDes = "天坠之心发饰·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35819,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(285)->
    #equipdropCfg {
    equipdropId = 285,
    dropDes = "天坠之心项链·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35820,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(286)->
    #equipdropCfg {
    equipdropId = 286,
    dropDes = "天坠之心戒指·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35821,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(287)->
    #equipdropCfg {
    equipdropId = 287,
    dropDes = "神威火枪·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35822,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(288)->
    #equipdropCfg {
    equipdropId = 288,
    dropDes = "神威手雷·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35823,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(289)->
    #equipdropCfg {
    equipdropId = 289,
    dropDes = "神威战衣·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35824,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(290)->
    #equipdropCfg {
    equipdropId = 290,
    dropDes = "神威战腿·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35825,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(291)->
    #equipdropCfg {
    equipdropId = 291,
    dropDes = "神威战靴·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35826,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(292)->
    #equipdropCfg {
    equipdropId = 292,
    dropDes = "神威战盔·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35827,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(293)->
    #equipdropCfg {
    equipdropId = 293,
    dropDes = "神威项链·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35828,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(294)->
    #equipdropCfg {
    equipdropId = 294,
    dropDes = "神威戒指·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35829,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(295)->
    #equipdropCfg {
    equipdropId = 295,
    dropDes = "契约主宰之剑·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35830,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(296)->
    #equipdropCfg {
    equipdropId = 296,
    dropDes = "契约主宰之盾·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35831,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(297)->
    #equipdropCfg {
    equipdropId = 297,
    dropDes = "契约主宰铠甲·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35832,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(298)->
    #equipdropCfg {
    equipdropId = 298,
    dropDes = "契约主宰护腿·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35833,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(299)->
    #equipdropCfg {
    equipdropId = 299,
    dropDes = "契约主宰战靴·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35834,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(300)->
    #equipdropCfg {
    equipdropId = 300,
    dropDes = "契约主宰战盔·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35835,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(301)->
    #equipdropCfg {
    equipdropId = 301,
    dropDes = "契约主宰项链·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35836,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(302)->
    #equipdropCfg {
    equipdropId = 302,
    dropDes = "契约主宰戒指·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35837,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(303)->
    #equipdropCfg {
    equipdropId = 303,
    dropDes = "圣魔导师之杖·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35838,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(304)->
    #equipdropCfg {
    equipdropId = 304,
    dropDes = "圣魔导师奥秘·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35839,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(305)->
    #equipdropCfg {
    equipdropId = 305,
    dropDes = "圣魔导师法衣·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35840,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(306)->
    #equipdropCfg {
    equipdropId = 306,
    dropDes = "圣魔导师裙摆·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35841,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(307)->
    #equipdropCfg {
    equipdropId = 307,
    dropDes = "圣魔导师之靴·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35842,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(308)->
    #equipdropCfg {
    equipdropId = 308,
    dropDes = "圣魔导师之冠·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35843,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(309)->
    #equipdropCfg {
    equipdropId = 309,
    dropDes = "圣魔导师项链·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35844,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(310)->
    #equipdropCfg {
    equipdropId = 310,
    dropDes = "圣魔导师戒指·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35845,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(311)->
    #equipdropCfg {
    equipdropId = 311,
    dropDes = "原暗地狱之炎·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35846,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(312)->
    #equipdropCfg {
    equipdropId = 312,
    dropDes = "原暗地狱之剑·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35847,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(313)->
    #equipdropCfg {
    equipdropId = 313,
    dropDes = "原暗地狱战铠·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35848,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(314)->
    #equipdropCfg {
    equipdropId = 314,
    dropDes = "原暗地狱皮腿·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35849,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(315)->
    #equipdropCfg {
    equipdropId = 315,
    dropDes = "原暗地狱战靴·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35850,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(316)->
    #equipdropCfg {
    equipdropId = 316,
    dropDes = "原暗地狱怒火·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35851,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(317)->
    #equipdropCfg {
    equipdropId = 317,
    dropDes = "原暗地狱项链·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35852,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(318)->
    #equipdropCfg {
    equipdropId = 318,
    dropDes = "原暗地狱戒指·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35853,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(319)->
    #equipdropCfg {
    equipdropId = 319,
    dropDes = "永恶天灵之镰·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35854,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(320)->
    #equipdropCfg {
    equipdropId = 320,
    dropDes = "永恶天灵之魂·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35855,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(321)->
    #equipdropCfg {
    equipdropId = 321,
    dropDes = "永恶天灵铠甲·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35856,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(322)->
    #equipdropCfg {
    equipdropId = 322,
    dropDes = "永恶天灵护腿·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35857,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(323)->
    #equipdropCfg {
    equipdropId = 323,
    dropDes = "永恶天灵软鞋·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35858,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(324)->
    #equipdropCfg {
    equipdropId = 324,
    dropDes = "永恶天灵角盔·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35859,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(325)->
    #equipdropCfg {
    equipdropId = 325,
    dropDes = "永恶天灵项链·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35860,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(326)->
    #equipdropCfg {
    equipdropId = 326,
    dropDes = "永恶天灵戒指·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35861,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(327)->
    #equipdropCfg {
    equipdropId = 327,
    dropDes = "神灭火枪·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35862,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(328)->
    #equipdropCfg {
    equipdropId = 328,
    dropDes = "神灭手雷·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35863,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(329)->
    #equipdropCfg {
    equipdropId = 329,
    dropDes = "神灭战衣·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35864,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(330)->
    #equipdropCfg {
    equipdropId = 330,
    dropDes = "神灭战腿·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35865,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(331)->
    #equipdropCfg {
    equipdropId = 331,
    dropDes = "神灭战靴·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35866,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(332)->
    #equipdropCfg {
    equipdropId = 332,
    dropDes = "神灭战盔·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35867,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(333)->
    #equipdropCfg {
    equipdropId = 333,
    dropDes = "神灭项链·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35868,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(334)->
    #equipdropCfg {
    equipdropId = 334,
    dropDes = "神灭戒指·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35869,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(335)->
    #equipdropCfg {
    equipdropId = 335,
    dropDes = "天界荣耀之剑·神",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35870,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(336)->
    #equipdropCfg {
    equipdropId = 336,
    dropDes = "天界荣耀之剑·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35871,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(337)->
    #equipdropCfg {
    equipdropId = 337,
    dropDes = "天界荣耀之剑·人",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35872,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(338)->
    #equipdropCfg {
    equipdropId = 338,
    dropDes = "天界荣耀之杖·神",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35873,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(339)->
    #equipdropCfg {
    equipdropId = 339,
    dropDes = "天界荣耀之杖·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35874,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(340)->
    #equipdropCfg {
    equipdropId = 340,
    dropDes = "天界荣耀之杖·人",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35875,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(341)->
    #equipdropCfg {
    equipdropId = 341,
    dropDes = "天界荣耀之刃·神",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35876,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(342)->
    #equipdropCfg {
    equipdropId = 342,
    dropDes = "天界荣耀之刃·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35877,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(343)->
    #equipdropCfg {
    equipdropId = 343,
    dropDes = "天界荣耀之刃·人",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35878,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(344)->
    #equipdropCfg {
    equipdropId = 344,
    dropDes = "天界荣耀之镰·神",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35879,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(345)->
    #equipdropCfg {
    equipdropId = 345,
    dropDes = "天界荣耀之镰·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35880,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(346)->
    #equipdropCfg {
    equipdropId = 346,
    dropDes = "天界荣耀之镰·人",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35881,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(347)->
    #equipdropCfg {
    equipdropId = 347,
    dropDes = "天界荣耀火枪·神",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35882,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(348)->
    #equipdropCfg {
    equipdropId = 348,
    dropDes = "天界荣耀火枪·魔",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35883,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(349)->
    #equipdropCfg {
    equipdropId = 349,
    dropDes = "天界荣耀火枪·人",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35884,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(350)->
    #equipdropCfg {
    equipdropId = 500,
    dropDes = "韩国普通装备箱子",
    dropType = 1,
    dropSource = [1],
    times = 1,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 0,
    quality1 = 3000,
    quality2 = 3500,
    quality3 = 3450,
    quality4 = 50,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(351)->
    #equipdropCfg {
    equipdropId = 501,
    dropDes = "韩国超级装备箱子",
    dropType = 1,
    dropSource = [1],
    times = 1,
    noDrop = 0,
    equipID = 0,
    equipQuality = 0,
    minDiffcult = 1,
    maxDiffcult = 1,
    dropLevel = 1,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 10000,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(352)->
    #equipdropCfg {
    equipdropId = 1001,
    dropDes = "深红熔渊50战士紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31037,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(353)->
    #equipdropCfg {
    equipdropId = 1002,
    dropDes = "深红熔渊50战士紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32038,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(354)->
    #equipdropCfg {
    equipdropId = 1003,
    dropDes = "深红熔渊50战士紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 33038,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(355)->
    #equipdropCfg {
    equipdropId = 1004,
    dropDes = "深红熔渊50战士紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 34038,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(356)->
    #equipdropCfg {
    equipdropId = 1005,
    dropDes = "深红熔渊50战士紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35038,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(357)->
    #equipdropCfg {
    equipdropId = 1006,
    dropDes = "深红熔渊50战士紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 36038,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(358)->
    #equipdropCfg {
    equipdropId = 1007,
    dropDes = "深红熔渊50战士紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 37038,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(359)->
    #equipdropCfg {
    equipdropId = 1008,
    dropDes = "深红熔渊50战士紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 38038,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(360)->
    #equipdropCfg {
    equipdropId = 1009,
    dropDes = "深红熔渊50法师紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31085,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(361)->
    #equipdropCfg {
    equipdropId = 1010,
    dropDes = "深红熔渊50法师紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32086,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(362)->
    #equipdropCfg {
    equipdropId = 1011,
    dropDes = "深红熔渊50法师紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 33086,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(363)->
    #equipdropCfg {
    equipdropId = 1012,
    dropDes = "深红熔渊50法师紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 34086,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(364)->
    #equipdropCfg {
    equipdropId = 1013,
    dropDes = "深红熔渊50法师紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35086,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(365)->
    #equipdropCfg {
    equipdropId = 1014,
    dropDes = "深红熔渊50法师紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 36086,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(366)->
    #equipdropCfg {
    equipdropId = 1015,
    dropDes = "深红熔渊50法师紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 37086,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(367)->
    #equipdropCfg {
    equipdropId = 1016,
    dropDes = "深红熔渊50法师紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 38086,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(368)->
    #equipdropCfg {
    equipdropId = 1017,
    dropDes = "深红熔渊50游侠紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31133,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(369)->
    #equipdropCfg {
    equipdropId = 1018,
    dropDes = "深红熔渊50游侠紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32134,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(370)->
    #equipdropCfg {
    equipdropId = 1019,
    dropDes = "深红熔渊50游侠紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 33134,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(371)->
    #equipdropCfg {
    equipdropId = 1020,
    dropDes = "深红熔渊50游侠紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 34134,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(372)->
    #equipdropCfg {
    equipdropId = 1021,
    dropDes = "深红熔渊50游侠紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35134,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(373)->
    #equipdropCfg {
    equipdropId = 1022,
    dropDes = "深红熔渊50游侠紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 36134,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(374)->
    #equipdropCfg {
    equipdropId = 1023,
    dropDes = "深红熔渊50游侠紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 37134,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(375)->
    #equipdropCfg {
    equipdropId = 1024,
    dropDes = "深红熔渊50游侠紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 38134,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(376)->
    #equipdropCfg {
    equipdropId = 1025,
    dropDes = "深红熔渊60战士紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31134,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(377)->
    #equipdropCfg {
    equipdropId = 1026,
    dropDes = "深红熔渊60战士紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32135,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(378)->
    #equipdropCfg {
    equipdropId = 1027,
    dropDes = "深红熔渊60战士紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 33135,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(379)->
    #equipdropCfg {
    equipdropId = 1028,
    dropDes = "深红熔渊60战士紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 34135,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(380)->
    #equipdropCfg {
    equipdropId = 1029,
    dropDes = "深红熔渊60战士紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35135,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(381)->
    #equipdropCfg {
    equipdropId = 1030,
    dropDes = "深红熔渊60战士紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 36135,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(382)->
    #equipdropCfg {
    equipdropId = 1031,
    dropDes = "深红熔渊60战士紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 37135,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(383)->
    #equipdropCfg {
    equipdropId = 1032,
    dropDes = "深红熔渊60战士紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 38135,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(384)->
    #equipdropCfg {
    equipdropId = 1033,
    dropDes = "深红熔渊60法师紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31086,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(385)->
    #equipdropCfg {
    equipdropId = 1034,
    dropDes = "深红熔渊60法师紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32087,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(386)->
    #equipdropCfg {
    equipdropId = 1035,
    dropDes = "深红熔渊60法师紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 33088,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(387)->
    #equipdropCfg {
    equipdropId = 1036,
    dropDes = "深红熔渊60法师紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 34089,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(388)->
    #equipdropCfg {
    equipdropId = 1037,
    dropDes = "深红熔渊60法师紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35090,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(389)->
    #equipdropCfg {
    equipdropId = 1038,
    dropDes = "深红熔渊60法师紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 36091,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(390)->
    #equipdropCfg {
    equipdropId = 1039,
    dropDes = "深红熔渊60法师紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 37092,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(391)->
    #equipdropCfg {
    equipdropId = 1040,
    dropDes = "深红熔渊60法师紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 38093,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(392)->
    #equipdropCfg {
    equipdropId = 1041,
    dropDes = "深红熔渊60游侠紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31134,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(393)->
    #equipdropCfg {
    equipdropId = 1042,
    dropDes = "深红熔渊60游侠紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32135,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(394)->
    #equipdropCfg {
    equipdropId = 1043,
    dropDes = "深红熔渊60游侠紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 33135,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(395)->
    #equipdropCfg {
    equipdropId = 1044,
    dropDes = "深红熔渊60游侠紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 34135,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(396)->
    #equipdropCfg {
    equipdropId = 1045,
    dropDes = "深红熔渊60游侠紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35135,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(397)->
    #equipdropCfg {
    equipdropId = 1046,
    dropDes = "深红熔渊60游侠紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 36135,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(398)->
    #equipdropCfg {
    equipdropId = 1047,
    dropDes = "深红熔渊60游侠紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 37135,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(399)->
    #equipdropCfg {
    equipdropId = 1048,
    dropDes = "深红熔渊60游侠紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 38135,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(400)->
    #equipdropCfg {
    equipdropId = 1049,
    dropDes = "深红熔渊70战士紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31039,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(401)->
    #equipdropCfg {
    equipdropId = 1050,
    dropDes = "深红熔渊70战士紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32040,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(402)->
    #equipdropCfg {
    equipdropId = 1051,
    dropDes = "深红熔渊70战士紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 33040,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(403)->
    #equipdropCfg {
    equipdropId = 1052,
    dropDes = "深红熔渊70战士紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 34040,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(404)->
    #equipdropCfg {
    equipdropId = 1053,
    dropDes = "深红熔渊70战士紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35040,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(405)->
    #equipdropCfg {
    equipdropId = 1054,
    dropDes = "深红熔渊70战士紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 36040,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(406)->
    #equipdropCfg {
    equipdropId = 1055,
    dropDes = "深红熔渊70战士紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 37040,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(407)->
    #equipdropCfg {
    equipdropId = 1056,
    dropDes = "深红熔渊70战士紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 38040,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(408)->
    #equipdropCfg {
    equipdropId = 1057,
    dropDes = "深红熔渊70法师紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31087,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(409)->
    #equipdropCfg {
    equipdropId = 1058,
    dropDes = "深红熔渊70法师紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32088,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(410)->
    #equipdropCfg {
    equipdropId = 1059,
    dropDes = "深红熔渊70法师紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 33088,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(411)->
    #equipdropCfg {
    equipdropId = 1060,
    dropDes = "深红熔渊70法师紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 34088,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(412)->
    #equipdropCfg {
    equipdropId = 1061,
    dropDes = "深红熔渊70法师紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35088,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(413)->
    #equipdropCfg {
    equipdropId = 1062,
    dropDes = "深红熔渊70法师紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 36088,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(414)->
    #equipdropCfg {
    equipdropId = 1063,
    dropDes = "深红熔渊70法师紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 37088,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(415)->
    #equipdropCfg {
    equipdropId = 1064,
    dropDes = "深红熔渊70法师紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 38088,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(416)->
    #equipdropCfg {
    equipdropId = 1065,
    dropDes = "深红熔渊70游侠紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31135,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(417)->
    #equipdropCfg {
    equipdropId = 1066,
    dropDes = "深红熔渊70游侠紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 32136,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(418)->
    #equipdropCfg {
    equipdropId = 1067,
    dropDes = "深红熔渊70游侠紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 33136,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(419)->
    #equipdropCfg {
    equipdropId = 1068,
    dropDes = "深红熔渊70游侠紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 34136,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(420)->
    #equipdropCfg {
    equipdropId = 1069,
    dropDes = "深红熔渊70游侠紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 35136,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(421)->
    #equipdropCfg {
    equipdropId = 1070,
    dropDes = "深红熔渊70游侠紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 36136,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(422)->
    #equipdropCfg {
    equipdropId = 1071,
    dropDes = "深红熔渊70游侠紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 37136,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(423)->
    #equipdropCfg {
    equipdropId = 1072,
    dropDes = "深红熔渊70游侠紫色兑换箱",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 38136,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(424)->
    #equipdropCfg {
    equipdropId = 7200,
    dropDes = "守卫礼包",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31167,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(425)->
    #equipdropCfg {
    equipdropId = 7201,
    dropDes = "斗士礼包",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31026,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(426)->
    #equipdropCfg {
    equipdropId = 7202,
    dropDes = "修士礼包",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31074,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(427)->
    #equipdropCfg {
    equipdropId = 7203,
    dropDes = "巫师礼包",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31202,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(428)->
    #equipdropCfg {
    equipdropId = 7204,
    dropDes = "旅者礼包",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31237,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(429)->
    #equipdropCfg {
    equipdropId = 7205,
    dropDes = "流氓礼包",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31122,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(430)->
    #equipdropCfg {
    equipdropId = 7206,
    dropDes = "步兵礼包",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31169,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(431)->
    #equipdropCfg {
    equipdropId = 7207,
    dropDes = "剑士礼包",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31274,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(432)->
    #equipdropCfg {
    equipdropId = 7208,
    dropDes = "佣兵礼包",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31028,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(433)->
    #equipdropCfg {
    equipdropId = 7209,
    dropDes = "牧师礼包",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31076,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(434)->
    #equipdropCfg {
    equipdropId = 7210,
    dropDes = "术士礼包",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31204,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(435)->
    #equipdropCfg {
    equipdropId = 7211,
    dropDes = "僧侣礼包",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31076,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(436)->
    #equipdropCfg {
    equipdropId = 7212,
    dropDes = "弓箭手礼包",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31239,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(437)->
    #equipdropCfg {
    equipdropId = 7213,
    dropDes = "盗贼礼包",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31124,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(438)->
    #equipdropCfg {
    equipdropId = 7214,
    dropDes = "侦察兵礼包",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0,
    equipID = 31124,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 1,
    mapDiffcult = 0
    };
getRow(439)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31001,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(440)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31009,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(441)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31017,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(442)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31025,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(443)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31049,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(444)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31057,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(445)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31065,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(446)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31073,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(447)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31097,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(448)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31105,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(449)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31113,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(450)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31121,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(451)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32002,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(452)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32010,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(453)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32018,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(454)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32026,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(455)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32050,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(456)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32058,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(457)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32066,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(458)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32074,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(459)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32098,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(460)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32106,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(461)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32114,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(462)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32122,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(463)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33002,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(464)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33010,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(465)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33018,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(466)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33026,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(467)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33050,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(468)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33058,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(469)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33066,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(470)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33074,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(471)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33098,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(472)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33106,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(473)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33114,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(474)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33122,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(475)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34002,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(476)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34010,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(477)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34018,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(478)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34026,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(479)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34050,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(480)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34058,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(481)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34066,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(482)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34074,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(483)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34098,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(484)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34106,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(485)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34114,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(486)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34122,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(487)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35002,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(488)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35010,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(489)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35018,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(490)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35026,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(491)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35050,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(492)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35058,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(493)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35066,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(494)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35074,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(495)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35098,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(496)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35106,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(497)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35114,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(498)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35122,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(499)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36002,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(500)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36010,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(501)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36018,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(502)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36026,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(503)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36050,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(504)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36058,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(505)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36066,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(506)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36074,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(507)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36098,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(508)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36106,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(509)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36114,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(510)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36122,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(511)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37002,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(512)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37010,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(513)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37018,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(514)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37026,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(515)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37050,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(516)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37058,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(517)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37066,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(518)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37074,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(519)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37098,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(520)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37106,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(521)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37114,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(522)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37122,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(523)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38002,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(524)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38010,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(525)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38018,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(526)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38026,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(527)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38050,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(528)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38058,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(529)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38066,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(530)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38074,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(531)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38098,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(532)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38106,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(533)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38114,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(534)->
    #equipdropCfg {
    equipdropId = 100001,
    dropDes = "10级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38122,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(535)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31002,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(536)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31010,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(537)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31018,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(538)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31026,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(539)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31050,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(540)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31058,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(541)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31066,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(542)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31074,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(543)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31098,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(544)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31106,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(545)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31114,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(546)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31122,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(547)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32003,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(548)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32011,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(549)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32019,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(550)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32027,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(551)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32051,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(552)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32059,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(553)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32067,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(554)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32075,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(555)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32099,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(556)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32107,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(557)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32115,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(558)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32123,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(559)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33003,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(560)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33011,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(561)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33019,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(562)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33027,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(563)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33051,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(564)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33059,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(565)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33067,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(566)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33075,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(567)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33099,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(568)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33107,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(569)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33115,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(570)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33123,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(571)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34003,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(572)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34011,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(573)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34019,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(574)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34027,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(575)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34051,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(576)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34059,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(577)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34067,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(578)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34075,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(579)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34099,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(580)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34107,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(581)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34115,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(582)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34123,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(583)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35003,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(584)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35011,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(585)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35019,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(586)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35027,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(587)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35051,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(588)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35059,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(589)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35067,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(590)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35075,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(591)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35099,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(592)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35107,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(593)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35115,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(594)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35123,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(595)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36003,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(596)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36011,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(597)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36019,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(598)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36027,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(599)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36051,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(600)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36059,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(601)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36067,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(602)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36075,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(603)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36099,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(604)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36107,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(605)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36115,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(606)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36123,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(607)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37003,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(608)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37011,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(609)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37019,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(610)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37027,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(611)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37051,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(612)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37059,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(613)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37067,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(614)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37075,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(615)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37099,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(616)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37107,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(617)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37115,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(618)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37123,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(619)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38003,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(620)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38011,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(621)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38019,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(622)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38027,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(623)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38051,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(624)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38059,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(625)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38067,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(626)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38075,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(627)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38099,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(628)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38107,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(629)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38115,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(630)->
    #equipdropCfg {
    equipdropId = 100002,
    dropDes = "20级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38123,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(631)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31003,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(632)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31011,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(633)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31019,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(634)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31027,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(635)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31051,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(636)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31059,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(637)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31067,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(638)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31075,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(639)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31099,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(640)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31107,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(641)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31115,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(642)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31123,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(643)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32004,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(644)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32012,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(645)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32020,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(646)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32028,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(647)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32052,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(648)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32060,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(649)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32068,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(650)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32076,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(651)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32100,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(652)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32108,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(653)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32116,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(654)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32124,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(655)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33004,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(656)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33012,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(657)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33020,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(658)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33028,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(659)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33052,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(660)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33060,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(661)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33068,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(662)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33076,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(663)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33100,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(664)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33108,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(665)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33116,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(666)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33124,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(667)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34004,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(668)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34012,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(669)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34020,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(670)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34028,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(671)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34052,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(672)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34060,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(673)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34068,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(674)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34076,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(675)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34100,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(676)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34108,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(677)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34116,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(678)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34124,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(679)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35004,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(680)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35012,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(681)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35020,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(682)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35028,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(683)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35052,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(684)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35060,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(685)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35068,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(686)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35076,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(687)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35100,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(688)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35108,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(689)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35116,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(690)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35124,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(691)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36004,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(692)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36012,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(693)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36020,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(694)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36028,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(695)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36052,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(696)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36060,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(697)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36068,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(698)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36076,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(699)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36100,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(700)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36108,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(701)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36116,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(702)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36124,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(703)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37004,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(704)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37012,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(705)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37020,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(706)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37028,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(707)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37052,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(708)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37060,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(709)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37068,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(710)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37076,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(711)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37100,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(712)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37108,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(713)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37116,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(714)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37124,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(715)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38004,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(716)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38012,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(717)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38020,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(718)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38028,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(719)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38052,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(720)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38060,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(721)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38068,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(722)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38076,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(723)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38100,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(724)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38108,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(725)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38116,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(726)->
    #equipdropCfg {
    equipdropId = 100003,
    dropDes = "30级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38124,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(727)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31004,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(728)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31012,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(729)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31020,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(730)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31028,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(731)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31052,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(732)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31060,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(733)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31068,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(734)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31076,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(735)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31100,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(736)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31108,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(737)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31116,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(738)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31124,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(739)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32005,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(740)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32013,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(741)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32021,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(742)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32029,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(743)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32053,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(744)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32061,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(745)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32069,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(746)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32077,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(747)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32101,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(748)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32109,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(749)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32117,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(750)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32125,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(751)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33005,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(752)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33013,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(753)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33021,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(754)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33029,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(755)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33053,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(756)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33061,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(757)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33069,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(758)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33077,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(759)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33101,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(760)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33109,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(761)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33117,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(762)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33125,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(763)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34005,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(764)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34013,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(765)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34021,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(766)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34029,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(767)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34053,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(768)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34061,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(769)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34069,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(770)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34077,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(771)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34101,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(772)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34109,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(773)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34117,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(774)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34125,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(775)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35005,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(776)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35013,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(777)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35021,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(778)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35029,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(779)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35053,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(780)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35061,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(781)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35069,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(782)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35077,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(783)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35101,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(784)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35109,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(785)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35117,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(786)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35125,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(787)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36005,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(788)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36013,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(789)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36021,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(790)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36029,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(791)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36053,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(792)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36061,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(793)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36069,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(794)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36077,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(795)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36101,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(796)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36109,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(797)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36117,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(798)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36125,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(799)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37005,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(800)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37013,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(801)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37021,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(802)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37029,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(803)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37053,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(804)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37061,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(805)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37069,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(806)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37077,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(807)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37101,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(808)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37109,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(809)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37117,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(810)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37125,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(811)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38005,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(812)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38013,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(813)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38021,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(814)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38029,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(815)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38053,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(816)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38061,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(817)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38069,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(818)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38077,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(819)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38101,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(820)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38109,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(821)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38117,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(822)->
    #equipdropCfg {
    equipdropId = 100004,
    dropDes = "40级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38125,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(823)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31005,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(824)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31013,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(825)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31021,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(826)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31029,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(827)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31053,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(828)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31061,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(829)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31069,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(830)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31077,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(831)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31101,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(832)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31109,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(833)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31117,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(834)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 31125,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(835)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32006,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(836)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32014,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(837)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32022,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(838)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32030,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(839)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32054,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(840)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32062,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(841)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32070,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(842)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32078,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(843)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32102,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(844)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32110,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(845)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32118,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(846)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 32126,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(847)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33006,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(848)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33014,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(849)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33022,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(850)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33030,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(851)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33054,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(852)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33062,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(853)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33070,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(854)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33078,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(855)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33102,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(856)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33110,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(857)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33118,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(858)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 33126,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(859)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34006,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(860)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34014,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(861)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34022,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(862)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34030,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(863)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34054,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(864)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34062,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(865)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34070,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(866)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34078,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(867)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34102,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(868)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34110,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(869)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34118,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(870)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 34126,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(871)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35006,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(872)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35014,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(873)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35022,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(874)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35030,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(875)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35054,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(876)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35062,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(877)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35070,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(878)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35078,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(879)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35102,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(880)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35110,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(881)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35118,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(882)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 35126,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(883)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36006,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(884)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36014,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(885)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36022,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(886)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36030,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(887)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36054,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(888)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36062,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(889)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36070,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(890)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36078,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(891)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36102,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(892)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36110,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(893)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36118,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(894)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 36126,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(895)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37006,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(896)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37014,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(897)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37022,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(898)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37030,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(899)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37054,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(900)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37062,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(901)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37070,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(902)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37078,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(903)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37102,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(904)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37110,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(905)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37118,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(906)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 37126,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(907)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38006,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(908)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38014,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(909)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38022,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(910)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38030,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(911)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38054,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(912)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38062,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(913)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38070,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(914)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38078,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(915)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38102,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(916)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38110,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(917)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38118,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(918)->
    #equipdropCfg {
    equipdropId = 100005,
    dropDes = "50级装备",
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.986,
    equipID = 38126,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(919)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 31002,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(920)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 31010,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(921)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 31018,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(922)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 31026,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(923)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 31050,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(924)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 31058,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(925)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 31066,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(926)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 31074,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(927)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 31098,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(928)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 31106,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(929)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 31114,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(930)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 31122,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(931)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 32003,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(932)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 32011,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(933)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 32019,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(934)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 32027,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(935)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 32051,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(936)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 32059,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(937)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 32067,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(938)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 32075,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(939)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 32099,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(940)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 32107,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(941)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 32115,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(942)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 32123,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(943)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 33003,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(944)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 33011,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(945)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 33019,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(946)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 33027,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(947)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 33051,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(948)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 33059,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(949)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 33067,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(950)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 33075,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(951)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 33099,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(952)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 33107,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(953)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 33115,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(954)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 33123,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(955)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 34003,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(956)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 34011,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(957)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 34019,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(958)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 34027,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(959)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 34051,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(960)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 34059,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(961)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 34067,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(962)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 34075,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(963)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 34099,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(964)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 34107,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(965)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 34115,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(966)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 34123,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(967)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 35003,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(968)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 35011,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(969)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 35019,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(970)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 35027,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(971)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 35051,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(972)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 35059,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(973)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 35067,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(974)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 35075,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(975)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 35099,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(976)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 35107,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(977)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 35115,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(978)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 35123,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(979)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 36003,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(980)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 36011,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(981)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 36019,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(982)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 36027,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(983)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 36051,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(984)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 36059,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(985)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 36067,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(986)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 36075,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(987)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 36099,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(988)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 36107,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(989)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 36115,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(990)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 36123,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(991)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 37003,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(992)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 37011,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(993)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 37019,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(994)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 37027,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(995)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 37051,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(996)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 37059,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(997)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 37067,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(998)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 37075,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(999)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 37099,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1000)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 37107,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1001)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 37115,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1002)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 37123,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1003)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 38003,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1004)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 38011,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1005)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 38019,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1006)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 38027,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1007)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 38051,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1008)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 38059,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1009)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 38067,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1010)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 38075,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1011)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 38099,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1012)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 38107,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1013)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 38115,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1014)->
    #equipdropCfg {
    equipdropId = 200201,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 38123,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1015)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 31003,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1016)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 31011,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1017)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 31019,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1018)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 31027,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1019)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 31051,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1020)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 31059,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1021)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 31067,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1022)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 31075,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1023)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 31099,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1024)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 31107,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1025)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 31115,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1026)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 31123,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1027)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 32004,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1028)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 32012,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1029)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 32020,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1030)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 32028,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1031)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 32052,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1032)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 32060,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1033)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 32068,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1034)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 32076,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1035)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 32100,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1036)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 32108,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1037)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 32116,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1038)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 32124,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1039)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 33004,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1040)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 33012,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1041)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 33020,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1042)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 33028,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1043)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 33052,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1044)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 33060,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1045)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 33068,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1046)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 33076,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1047)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 33100,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1048)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 33108,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1049)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 33116,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1050)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 33124,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1051)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 34004,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1052)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 34012,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1053)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 34020,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1054)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 34028,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1055)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 34052,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1056)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 34060,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1057)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 34068,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1058)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 34076,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1059)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 34100,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1060)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 34108,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1061)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 34116,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1062)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 34124,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1063)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 35004,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1064)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 35012,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1065)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 35020,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1066)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 35028,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1067)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 35052,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1068)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 35060,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1069)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 35068,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1070)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 35076,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1071)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 35100,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1072)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 35108,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1073)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 35116,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1074)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 35124,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1075)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 36004,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1076)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 36012,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1077)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 36020,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1078)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 36028,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1079)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 36052,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1080)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 36060,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1081)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 36068,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1082)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 36076,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1083)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 36100,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1084)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 36108,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1085)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 36116,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1086)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 36124,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1087)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 37004,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1088)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 37012,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1089)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 37020,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1090)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 37028,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1091)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 37052,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1092)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 37060,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1093)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 37068,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1094)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 37076,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1095)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 37100,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1096)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 37108,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1097)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 37116,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1098)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 37124,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1099)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 38004,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1100)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 38012,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1101)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 38020,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1102)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 38028,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1103)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 38052,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1104)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 38060,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1105)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 38068,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1106)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 38076,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1107)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 38100,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1108)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 38108,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1109)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 38116,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1110)->
    #equipdropCfg {
    equipdropId = 200202,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.958,
    equipID = 38124,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1111)->
    #equipdropCfg {
    equipdropId = 200301,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.915,
    equipID = 31027,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1112)->
    #equipdropCfg {
    equipdropId = 200301,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.915,
    equipID = 31075,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1113)->
    #equipdropCfg {
    equipdropId = 200301,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.915,
    equipID = 31123,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1114)->
    #equipdropCfg {
    equipdropId = 200301,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.915,
    equipID = 32028,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1115)->
    #equipdropCfg {
    equipdropId = 200301,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.915,
    equipID = 32076,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1116)->
    #equipdropCfg {
    equipdropId = 200301,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.915,
    equipID = 32124,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1117)->
    #equipdropCfg {
    equipdropId = 200301,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.915,
    equipID = 33028,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1118)->
    #equipdropCfg {
    equipdropId = 200301,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.915,
    equipID = 33076,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1119)->
    #equipdropCfg {
    equipdropId = 200301,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.915,
    equipID = 33124,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1120)->
    #equipdropCfg {
    equipdropId = 200301,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.915,
    equipID = 34028,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1121)->
    #equipdropCfg {
    equipdropId = 200301,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.915,
    equipID = 34076,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1122)->
    #equipdropCfg {
    equipdropId = 200301,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.915,
    equipID = 34124,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1123)->
    #equipdropCfg {
    equipdropId = 200301,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.915,
    equipID = 35028,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1124)->
    #equipdropCfg {
    equipdropId = 200301,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.915,
    equipID = 35076,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1125)->
    #equipdropCfg {
    equipdropId = 200301,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.915,
    equipID = 35124,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1126)->
    #equipdropCfg {
    equipdropId = 200301,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.915,
    equipID = 36028,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1127)->
    #equipdropCfg {
    equipdropId = 200301,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.915,
    equipID = 36076,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1128)->
    #equipdropCfg {
    equipdropId = 200301,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.915,
    equipID = 36124,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1129)->
    #equipdropCfg {
    equipdropId = 200301,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.915,
    equipID = 37028,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1130)->
    #equipdropCfg {
    equipdropId = 200301,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.915,
    equipID = 37076,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1131)->
    #equipdropCfg {
    equipdropId = 200301,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.915,
    equipID = 37124,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1132)->
    #equipdropCfg {
    equipdropId = 200301,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.915,
    equipID = 38028,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1133)->
    #equipdropCfg {
    equipdropId = 200301,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.915,
    equipID = 38076,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
    };
getRow(1134)->
    #equipdropCfg {
    equipdropId = 200301,
    dropType = 2,
    dropSource = [0],
    times = 1,
    noDrop = 0.915,
    equipID = 38124,
    equipQuality = 0,
    minDiffcult = 0,
    maxDiffcult = 0,
    dropLevel = 0,
    quality0 = 0,
    quality1 = 0,
    quality2 = 0,
    quality3 = 0,
    quality4 = 0,
    quality5 = 0,
    isbind = 0,
    mapDiffcult = 0
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
    {1134}
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
    1134
    ].

getKey(1)->[
    1
    ];
getKey(2)->[
    2
    ];
getKey(3)->[
    3
    ];
getKey(4)->[
    4
    ];
getKey(5)->[
    5
    ];
getKey(6)->[
    6
    ];
getKey(7)->[
    7
    ];
getKey(8)->[
    8
    ];
getKey(9)->[
    9
    ];
getKey(10)->[
    10
    ];
getKey(11)->[
    11
    ];
getKey(12)->[
    12
    ];
getKey(13)->[
    13
    ];
getKey(14)->[
    14
    ];
getKey(15)->[
    15
    ];
getKey(16)->[
    16
    ];
getKey(17)->[
    17
    ];
getKey(18)->[
    18
    ];
getKey(19)->[
    19
    ];
getKey(20)->[
    20
    ];
getKey(21)->[
    21
    ];
getKey(22)->[
    22
    ];
getKey(23)->[
    23
    ];
getKey(24)->[
    24
    ];
getKey(25)->[
    25
    ];
getKey(26)->[
    26
    ];
getKey(27)->[
    27
    ];
getKey(28)->[
    28
    ];
getKey(29)->[
    29
    ];
getKey(30)->[
    30
    ];
getKey(31)->[
    31
    ];
getKey(32)->[
    32
    ];
getKey(33)->[
    33
    ];
getKey(34)->[
    34
    ];
getKey(35)->[
    35
    ];
getKey(36)->[
    36
    ];
getKey(37)->[
    37
    ];
getKey(38)->[
    38
    ];
getKey(39)->[
    39
    ];
getKey(40)->[
    40
    ];
getKey(41)->[
    41
    ];
getKey(42)->[
    42
    ];
getKey(43)->[
    43
    ];
getKey(44)->[
    44
    ];
getKey(45)->[
    45
    ];
getKey(46)->[
    46
    ];
getKey(47)->[
    47
    ];
getKey(48)->[
    48
    ];
getKey(49)->[
    49
    ];
getKey(50)->[
    50
    ];
getKey(51)->[
    51
    ];
getKey(52)->[
    52
    ];
getKey(53)->[
    53
    ];
getKey(54)->[
    54
    ];
getKey(55)->[
    55
    ];
getKey(56)->[
    56
    ];
getKey(57)->[
    57
    ];
getKey(58)->[
    58
    ];
getKey(59)->[
    59
    ];
getKey(60)->[
    60
    ];
getKey(61)->[
    61
    ];
getKey(62)->[
    62
    ];
getKey(63)->[
    63
    ];
getKey(64)->[
    64
    ];
getKey(65)->[
    65
    ];
getKey(66)->[
    66
    ];
getKey(67)->[
    67
    ];
getKey(68)->[
    68
    ];
getKey(69)->[
    69
    ];
getKey(70)->[
    70
    ];
getKey(71)->[
    71
    ];
getKey(72)->[
    72
    ];
getKey(73)->[
    73
    ];
getKey(74)->[
    74
    ];
getKey(75)->[
    75
    ];
getKey(76)->[
    76
    ];
getKey(77)->[
    77
    ];
getKey(78)->[
    78
    ];
getKey(79)->[
    79
    ];
getKey(80)->[
    80
    ];
getKey(81)->[
    81
    ];
getKey(82)->[
    82
    ];
getKey(83)->[
    83
    ];
getKey(84)->[
    84
    ];
getKey(85)->[
    85
    ];
getKey(86)->[
    86
    ];
getKey(87)->[
    87
    ];
getKey(88)->[
    88
    ];
getKey(89)->[
    89
    ];
getKey(90)->[
    90
    ];
getKey(91)->[
    91
    ];
getKey(92)->[
    92
    ];
getKey(93)->[
    93
    ];
getKey(94)->[
    94
    ];
getKey(95)->[
    95
    ];
getKey(96)->[
    96
    ];
getKey(97)->[
    97
    ];
getKey(98)->[
    98
    ];
getKey(99)->[
    99
    ];
getKey(100)->[
    100
    ];
getKey(101)->[
    101
    ];
getKey(102)->[
    102
    ];
getKey(103)->[
    103
    ];
getKey(104)->[
    104
    ];
getKey(105)->[
    105
    ];
getKey(106)->[
    106
    ];
getKey(107)->[
    107
    ];
getKey(108)->[
    108
    ];
getKey(109)->[
    109
    ];
getKey(110)->[
    110
    ];
getKey(111)->[
    111
    ];
getKey(112)->[
    112
    ];
getKey(113)->[
    113
    ];
getKey(114)->[
    114
    ];
getKey(115)->[
    115
    ];
getKey(116)->[
    116
    ];
getKey(117)->[
    117
    ];
getKey(118)->[
    118
    ];
getKey(119)->[
    119
    ];
getKey(120)->[
    120
    ];
getKey(121)->[
    121
    ];
getKey(122)->[
    122
    ];
getKey(123)->[
    123
    ];
getKey(124)->[
    124
    ];
getKey(125)->[
    125
    ];
getKey(126)->[
    126
    ];
getKey(127)->[
    127
    ];
getKey(128)->[
    128
    ];
getKey(129)->[
    129
    ];
getKey(130)->[
    130
    ];
getKey(131)->[
    131
    ];
getKey(132)->[
    132
    ];
getKey(133)->[
    133
    ];
getKey(134)->[
    134
    ];
getKey(135)->[
    135
    ];
getKey(136)->[
    136
    ];
getKey(137)->[
    137
    ];
getKey(138)->[
    138
    ];
getKey(139)->[
    139
    ];
getKey(140)->[
    140
    ];
getKey(141)->[
    141
    ];
getKey(142)->[
    142
    ];
getKey(143)->[
    143
    ];
getKey(144)->[
    144
    ];
getKey(145)->[
    145
    ];
getKey(146)->[
    146
    ];
getKey(147)->[
    147
    ];
getKey(148)->[
    148
    ];
getKey(149)->[
    149
    ];
getKey(150)->[
    150
    ];
getKey(151)->[
    151
    ];
getKey(152)->[
    152
    ];
getKey(153)->[
    153
    ];
getKey(154)->[
    154
    ];
getKey(155)->[
    155
    ];
getKey(156)->[
    156
    ];
getKey(157)->[
    157
    ];
getKey(158)->[
    158
    ];
getKey(159)->[
    159
    ];
getKey(160)->[
    160
    ];
getKey(161)->[
    161
    ];
getKey(162)->[
    162
    ];
getKey(163)->[
    163
    ];
getKey(164)->[
    164
    ];
getKey(165)->[
    165
    ];
getKey(166)->[
    166
    ];
getKey(167)->[
    167
    ];
getKey(168)->[
    168
    ];
getKey(169)->[
    169
    ];
getKey(170)->[
    170
    ];
getKey(171)->[
    171
    ];
getKey(172)->[
    172
    ];
getKey(173)->[
    173
    ];
getKey(174)->[
    174
    ];
getKey(175)->[
    175
    ];
getKey(176)->[
    176
    ];
getKey(177)->[
    177
    ];
getKey(178)->[
    178
    ];
getKey(179)->[
    179
    ];
getKey(180)->[
    180
    ];
getKey(181)->[
    181
    ];
getKey(182)->[
    182
    ];
getKey(183)->[
    183
    ];
getKey(184)->[
    184
    ];
getKey(185)->[
    185
    ];
getKey(186)->[
    186
    ];
getKey(187)->[
    187
    ];
getKey(188)->[
    188
    ];
getKey(189)->[
    189
    ];
getKey(190)->[
    190
    ];
getKey(191)->[
    191
    ];
getKey(192)->[
    192
    ];
getKey(193)->[
    193
    ];
getKey(194)->[
    194
    ];
getKey(195)->[
    195
    ];
getKey(196)->[
    196
    ];
getKey(197)->[
    197
    ];
getKey(198)->[
    198
    ];
getKey(199)->[
    199
    ];
getKey(200)->[
    200
    ];
getKey(201)->[
    201
    ];
getKey(202)->[
    202
    ];
getKey(203)->[
    203
    ];
getKey(204)->[
    204
    ];
getKey(205)->[
    205
    ];
getKey(206)->[
    206
    ];
getKey(207)->[
    207
    ];
getKey(208)->[
    208
    ];
getKey(209)->[
    209
    ];
getKey(210)->[
    210
    ];
getKey(211)->[
    211
    ];
getKey(212)->[
    212
    ];
getKey(213)->[
    213
    ];
getKey(214)->[
    214
    ];
getKey(215)->[
    215
    ];
getKey(216)->[
    216
    ];
getKey(217)->[
    217
    ];
getKey(218)->[
    218
    ];
getKey(219)->[
    219
    ];
getKey(220)->[
    220
    ];
getKey(221)->[
    221
    ];
getKey(222)->[
    222
    ];
getKey(223)->[
    223
    ];
getKey(224)->[
    224
    ];
getKey(225)->[
    225
    ];
getKey(226)->[
    226
    ];
getKey(227)->[
    227
    ];
getKey(228)->[
    228
    ];
getKey(229)->[
    229
    ];
getKey(230)->[
    230
    ];
getKey(231)->[
    231
    ];
getKey(232)->[
    232
    ];
getKey(233)->[
    233
    ];
getKey(234)->[
    234
    ];
getKey(235)->[
    235
    ];
getKey(236)->[
    236
    ];
getKey(237)->[
    237
    ];
getKey(238)->[
    238
    ];
getKey(239)->[
    239
    ];
getKey(240)->[
    240
    ];
getKey(241)->[
    241
    ];
getKey(242)->[
    242
    ];
getKey(243)->[
    243
    ];
getKey(244)->[
    244
    ];
getKey(245)->[
    245
    ];
getKey(246)->[
    246
    ];
getKey(247)->[
    247
    ];
getKey(248)->[
    248
    ];
getKey(249)->[
    249
    ];
getKey(250)->[
    250
    ];
getKey(251)->[
    251
    ];
getKey(252)->[
    252
    ];
getKey(253)->[
    253
    ];
getKey(254)->[
    254
    ];
getKey(255)->[
    255
    ];
getKey(256)->[
    256
    ];
getKey(257)->[
    257
    ];
getKey(258)->[
    258
    ];
getKey(259)->[
    259
    ];
getKey(260)->[
    260
    ];
getKey(261)->[
    261
    ];
getKey(262)->[
    262
    ];
getKey(263)->[
    263
    ];
getKey(264)->[
    264
    ];
getKey(265)->[
    265
    ];
getKey(266)->[
    266
    ];
getKey(267)->[
    267
    ];
getKey(268)->[
    268
    ];
getKey(269)->[
    269
    ];
getKey(270)->[
    270
    ];
getKey(271)->[
    271
    ];
getKey(272)->[
    272
    ];
getKey(273)->[
    273
    ];
getKey(274)->[
    274
    ];
getKey(275)->[
    275
    ];
getKey(276)->[
    276
    ];
getKey(277)->[
    277
    ];
getKey(278)->[
    278
    ];
getKey(279)->[
    279
    ];
getKey(280)->[
    280
    ];
getKey(281)->[
    281
    ];
getKey(282)->[
    282
    ];
getKey(283)->[
    283
    ];
getKey(284)->[
    284
    ];
getKey(285)->[
    285
    ];
getKey(286)->[
    286
    ];
getKey(287)->[
    287
    ];
getKey(288)->[
    288
    ];
getKey(289)->[
    289
    ];
getKey(290)->[
    290
    ];
getKey(291)->[
    291
    ];
getKey(292)->[
    292
    ];
getKey(293)->[
    293
    ];
getKey(294)->[
    294
    ];
getKey(295)->[
    295
    ];
getKey(296)->[
    296
    ];
getKey(297)->[
    297
    ];
getKey(298)->[
    298
    ];
getKey(299)->[
    299
    ];
getKey(300)->[
    300
    ];
getKey(301)->[
    301
    ];
getKey(302)->[
    302
    ];
getKey(303)->[
    303
    ];
getKey(304)->[
    304
    ];
getKey(305)->[
    305
    ];
getKey(306)->[
    306
    ];
getKey(307)->[
    307
    ];
getKey(308)->[
    308
    ];
getKey(309)->[
    309
    ];
getKey(310)->[
    310
    ];
getKey(311)->[
    311
    ];
getKey(312)->[
    312
    ];
getKey(313)->[
    313
    ];
getKey(314)->[
    314
    ];
getKey(315)->[
    315
    ];
getKey(316)->[
    316
    ];
getKey(317)->[
    317
    ];
getKey(318)->[
    318
    ];
getKey(319)->[
    319
    ];
getKey(320)->[
    320
    ];
getKey(321)->[
    321
    ];
getKey(322)->[
    322
    ];
getKey(323)->[
    323
    ];
getKey(324)->[
    324
    ];
getKey(325)->[
    325
    ];
getKey(326)->[
    326
    ];
getKey(327)->[
    327
    ];
getKey(328)->[
    328
    ];
getKey(329)->[
    329
    ];
getKey(330)->[
    330
    ];
getKey(331)->[
    331
    ];
getKey(332)->[
    332
    ];
getKey(333)->[
    333
    ];
getKey(334)->[
    334
    ];
getKey(335)->[
    335
    ];
getKey(336)->[
    336
    ];
getKey(337)->[
    337
    ];
getKey(338)->[
    338
    ];
getKey(339)->[
    339
    ];
getKey(340)->[
    340
    ];
getKey(341)->[
    341
    ];
getKey(342)->[
    342
    ];
getKey(343)->[
    343
    ];
getKey(344)->[
    344
    ];
getKey(345)->[
    345
    ];
getKey(346)->[
    346
    ];
getKey(347)->[
    347
    ];
getKey(348)->[
    348
    ];
getKey(349)->[
    349
    ];
getKey(500)->[
    350
    ];
getKey(501)->[
    351
    ];
getKey(1001)->[
    352
    ];
getKey(1002)->[
    353
    ];
getKey(1003)->[
    354
    ];
getKey(1004)->[
    355
    ];
getKey(1005)->[
    356
    ];
getKey(1006)->[
    357
    ];
getKey(1007)->[
    358
    ];
getKey(1008)->[
    359
    ];
getKey(1009)->[
    360
    ];
getKey(1010)->[
    361
    ];
getKey(1011)->[
    362
    ];
getKey(1012)->[
    363
    ];
getKey(1013)->[
    364
    ];
getKey(1014)->[
    365
    ];
getKey(1015)->[
    366
    ];
getKey(1016)->[
    367
    ];
getKey(1017)->[
    368
    ];
getKey(1018)->[
    369
    ];
getKey(1019)->[
    370
    ];
getKey(1020)->[
    371
    ];
getKey(1021)->[
    372
    ];
getKey(1022)->[
    373
    ];
getKey(1023)->[
    374
    ];
getKey(1024)->[
    375
    ];
getKey(1025)->[
    376
    ];
getKey(1026)->[
    377
    ];
getKey(1027)->[
    378
    ];
getKey(1028)->[
    379
    ];
getKey(1029)->[
    380
    ];
getKey(1030)->[
    381
    ];
getKey(1031)->[
    382
    ];
getKey(1032)->[
    383
    ];
getKey(1033)->[
    384
    ];
getKey(1034)->[
    385
    ];
getKey(1035)->[
    386
    ];
getKey(1036)->[
    387
    ];
getKey(1037)->[
    388
    ];
getKey(1038)->[
    389
    ];
getKey(1039)->[
    390
    ];
getKey(1040)->[
    391
    ];
getKey(1041)->[
    392
    ];
getKey(1042)->[
    393
    ];
getKey(1043)->[
    394
    ];
getKey(1044)->[
    395
    ];
getKey(1045)->[
    396
    ];
getKey(1046)->[
    397
    ];
getKey(1047)->[
    398
    ];
getKey(1048)->[
    399
    ];
getKey(1049)->[
    400
    ];
getKey(1050)->[
    401
    ];
getKey(1051)->[
    402
    ];
getKey(1052)->[
    403
    ];
getKey(1053)->[
    404
    ];
getKey(1054)->[
    405
    ];
getKey(1055)->[
    406
    ];
getKey(1056)->[
    407
    ];
getKey(1057)->[
    408
    ];
getKey(1058)->[
    409
    ];
getKey(1059)->[
    410
    ];
getKey(1060)->[
    411
    ];
getKey(1061)->[
    412
    ];
getKey(1062)->[
    413
    ];
getKey(1063)->[
    414
    ];
getKey(1064)->[
    415
    ];
getKey(1065)->[
    416
    ];
getKey(1066)->[
    417
    ];
getKey(1067)->[
    418
    ];
getKey(1068)->[
    419
    ];
getKey(1069)->[
    420
    ];
getKey(1070)->[
    421
    ];
getKey(1071)->[
    422
    ];
getKey(1072)->[
    423
    ];
getKey(7200)->[
    424
    ];
getKey(7201)->[
    425
    ];
getKey(7202)->[
    426
    ];
getKey(7203)->[
    427
    ];
getKey(7204)->[
    428
    ];
getKey(7205)->[
    429
    ];
getKey(7206)->[
    430
    ];
getKey(7207)->[
    431
    ];
getKey(7208)->[
    432
    ];
getKey(7209)->[
    433
    ];
getKey(7210)->[
    434
    ];
getKey(7211)->[
    435
    ];
getKey(7212)->[
    436
    ];
getKey(7213)->[
    437
    ];
getKey(7214)->[
    438
    ];
getKey(100001)->[
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
    534
    ];
getKey(100002)->[
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
    630
    ];
getKey(100003)->[
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
    726
    ];
getKey(100004)->[
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
    822
    ];
getKey(100005)->[
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
    918
    ];
getKey(200201)->[
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
    1014
    ];
getKey(200202)->[
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
    1110
    ];
getKey(200301)->[
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
    1134
    ];
getKey(_)->[].
