%% coding: latin-1
%%: 实现
-module(cfg_achievecollection_chs).
-compile(export_all).
-include("cfg_achievecollection.hrl").
-include("logger.hrl").

getRow(2)->
    #achievecollectionCfg {
    map = 2,
    describe = "洞穴迷宫1",
    title = "洞穴迷宫1徽章",
    rank = 1,
    pic = "badge_4",
    items = [5000,5001,5002,5003,5004,5005,5006,5007],
    newflag = 0,
    drop = 5000,
    achieveid = 401
    };
getRow(3)->
    #achievecollectionCfg {
    map = 3,
    describe = "洞穴迷宫2",
    title = "洞穴迷宫2徽章",
    rank = 2,
    pic = "badge_5",
    items = [5008,5009,5010,5011,5012,5013,5014,5015],
    newflag = 0,
    drop = 5000,
    achieveid = 402
    };
getRow(4)->
    #achievecollectionCfg {
    map = 4,
    describe = "洞穴迷宫6",
    title = "洞穴迷宫6徽章",
    rank = 3,
    pic = "badge_6",
    items = [5016,5017,5018,5019,5020,5021,5022,5023],
    newflag = 0,
    drop = 5000,
    achieveid = 403
    };
getRow(5)->
    #achievecollectionCfg {
    map = 5,
    describe = "阿克勒平原",
    title = "阿克勒平原徽章",
    rank = 4,
    pic = "badge_7",
    items = [5024,5025,5026,5027,5028,5029],
    newflag = 0,
    drop = 5000,
    achieveid = 404
    };
getRow(6)->
    #achievecollectionCfg {
    map = 6,
    describe = "苍空之塔",
    title = "苍空之塔徽章",
    rank = 5,
    pic = "badge_8",
    items = [5030,5031,5032,5033,5034,5035,5036,5037,5038],
    newflag = 0,
    drop = 5000,
    achieveid = 405
    };
getRow(7)->
    #achievecollectionCfg {
    map = 7,
    describe = "塔斯特林",
    title = "塔斯特林徽章",
    rank = 6,
    pic = "badge_9",
    items = [5039,5040,5041,5042,5043,5044,5045,5046,5047,5048],
    newflag = 0,
    drop = 5000,
    achieveid = 406
    };
getRow(8)->
    #achievecollectionCfg {
    map = 8,
    describe = "札坎蒂亚前哨基地",
    title = "札坎蒂亚前哨基地徽章",
    rank = 7,
    pic = "badge_10",
    items = [5049,5050,5051,5052,5053,5054,5055,5056,5057,5058],
    newflag = 0,
    drop = 5000,
    achieveid = 407
    };
getRow(_)->[].

getKeyList()->[
    {2},
    {3},
    {4},
    {5},
    {6},
    {7},
    {8}
    ].

get1KeyList()->[
    2,
    3,
    4,
    5,
    6,
    7,
    8
    ].

