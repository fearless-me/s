%% coding: latin-1
%%: 实现
-module(cfg_demonBattleLoc_chs).
-compile(export_all).
-include("cfg_demonBattleLoc.hrl").
-include("logger.hrl").

getRow(1)->
    #demonBattleLocCfg {
    iD = 1,
    turns = 5,
    monsterLoc = [{35,48},{36,35},{38,22}],
    bossLoc = [50,34]
    };
getRow(2)->
    #demonBattleLocCfg {
    iD = 2,
    turns = 10,
    monsterLoc = [{29,47},{28,24},{43,48},{42,22}],
    bossLoc = [50,34]
    };
getRow(3)->
    #demonBattleLocCfg {
    iD = 3,
    turns = 15,
    monsterLoc = [{28,47},{27,23},{43,49},{41,21},{39,35}],
    bossLoc = [50,34]
    };
getRow(4)->
    #demonBattleLocCfg {
    iD = 4,
    turns = 20,
    monsterLoc = [{26,49},{28,36},{27,22},{41,50},{40,35},{41,22}],
    bossLoc = [50,34]
    };
getRow(5)->
    #demonBattleLocCfg {
    iD = 5,
    turns = 10000,
    monsterLoc = [{26,46},{26,24},{38,50},{38,35},{38,20},{48,46},{48,22}],
    bossLoc = [50,34]
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5
    ].

