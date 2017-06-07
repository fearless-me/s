%% coding: latin-1
%%: 实现
-module(cfg_acKingBattleBuyBuff_chs).
-compile(export_all).
-include("cfg_acKingBattleBuyBuff.hrl").
-include("logger.hrl").

getRow(1)->
    #acKingBattleBuyBuffCfg {
    id = 1,
    buffID = 50002,
    coin = 100,
    coinType = 103,
    nextCfgID = 12,
    oneKeyBuyCfgID = 16,
    oneKeyBuyCoin = 1200,
    oneKeyBuyCoinType = 105,
    floor = 0
    };
getRow(2)->
    #acKingBattleBuyBuffCfg {
    id = 2,
    buffID = 50001,
    coin = 100,
    coinType = 103,
    nextCfgID = 4,
    oneKeyBuyCfgID = 11,
    oneKeyBuyCoin = 2880,
    oneKeyBuyCoinType = 105,
    floor = 0
    };
getRow(3)->
    #acKingBattleBuyBuffCfg {
    id = 3,
    buffID = 50000,
    coin = 100,
    coinType = 103,
    nextCfgID = 4,
    oneKeyBuyCfgID = 11,
    oneKeyBuyCoin = 2880,
    oneKeyBuyCoinType = 105,
    floor = 0
    };
getRow(4)->
    #acKingBattleBuyBuffCfg {
    id = 4,
    buffID = 50003,
    coin = 200,
    coinType = 103,
    nextCfgID = 5,
    oneKeyBuyCfgID = 11,
    oneKeyBuyCoin = 2800,
    oneKeyBuyCoinType = 105,
    floor = 1
    };
getRow(5)->
    #acKingBattleBuyBuffCfg {
    id = 5,
    buffID = 50004,
    coin = 300,
    coinType = 103,
    nextCfgID = 6,
    oneKeyBuyCfgID = 11,
    oneKeyBuyCoin = 2640,
    oneKeyBuyCoinType = 105,
    floor = 2
    };
getRow(6)->
    #acKingBattleBuyBuffCfg {
    id = 6,
    buffID = 50005,
    coin = 400,
    coinType = 103,
    nextCfgID = 7,
    oneKeyBuyCfgID = 11,
    oneKeyBuyCoin = 2400,
    oneKeyBuyCoinType = 105,
    floor = 3
    };
getRow(7)->
    #acKingBattleBuyBuffCfg {
    id = 7,
    buffID = 50006,
    coin = 500,
    coinType = 103,
    nextCfgID = 8,
    oneKeyBuyCfgID = 11,
    oneKeyBuyCoin = 2080,
    oneKeyBuyCoinType = 105,
    floor = 4
    };
getRow(8)->
    #acKingBattleBuyBuffCfg {
    id = 8,
    buffID = 50007,
    coin = 600,
    coinType = 105,
    nextCfgID = 9,
    oneKeyBuyCfgID = 11,
    oneKeyBuyCoin = 1680,
    oneKeyBuyCoinType = 105,
    floor = 5
    };
getRow(9)->
    #acKingBattleBuyBuffCfg {
    id = 9,
    buffID = 50008,
    coin = 700,
    coinType = 105,
    nextCfgID = 10,
    oneKeyBuyCfgID = 11,
    oneKeyBuyCoin = 1200,
    oneKeyBuyCoinType = 105,
    floor = 6
    };
getRow(10)->
    #acKingBattleBuyBuffCfg {
    id = 10,
    buffID = 50009,
    coin = 800,
    coinType = 105,
    nextCfgID = 11,
    oneKeyBuyCfgID = 11,
    oneKeyBuyCoin = 640,
    oneKeyBuyCoinType = 105,
    floor = 7
    };
getRow(11)->
    #acKingBattleBuyBuffCfg {
    id = 11,
    buffID = 50010,
    coin = 0,
    coinType = 105,
    nextCfgID = -1,
    oneKeyBuyCfgID = -1,
    oneKeyBuyCoin = 0,
    oneKeyBuyCoinType = 105,
    floor = 8
    };
getRow(12)->
    #acKingBattleBuyBuffCfg {
    id = 12,
    buffID = 50003,
    coin = 200,
    coinType = 103,
    nextCfgID = 13,
    oneKeyBuyCfgID = 16,
    oneKeyBuyCoin = 1120,
    oneKeyBuyCoinType = 105,
    floor = 1
    };
getRow(13)->
    #acKingBattleBuyBuffCfg {
    id = 13,
    buffID = 50004,
    coin = 300,
    coinType = 103,
    nextCfgID = 14,
    oneKeyBuyCfgID = 16,
    oneKeyBuyCoin = 960,
    oneKeyBuyCoinType = 105,
    floor = 2
    };
getRow(14)->
    #acKingBattleBuyBuffCfg {
    id = 14,
    buffID = 50005,
    coin = 400,
    coinType = 103,
    nextCfgID = 15,
    oneKeyBuyCfgID = 16,
    oneKeyBuyCoin = 720,
    oneKeyBuyCoinType = 105,
    floor = 3
    };
getRow(15)->
    #acKingBattleBuyBuffCfg {
    id = 15,
    buffID = 50006,
    coin = 500,
    coinType = 103,
    nextCfgID = 16,
    oneKeyBuyCfgID = 16,
    oneKeyBuyCoin = 400,
    oneKeyBuyCoinType = 105,
    floor = 4
    };
getRow(16)->
    #acKingBattleBuyBuffCfg {
    id = 16,
    buffID = 50007,
    coin = 0,
    coinType = 105,
    nextCfgID = -1,
    oneKeyBuyCfgID = -1,
    oneKeyBuyCoin = 0,
    oneKeyBuyCoinType = 105,
    floor = 5
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
    {16}
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
    16
    ].

