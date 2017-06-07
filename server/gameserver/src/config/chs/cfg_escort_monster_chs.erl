%% coding: latin-1
%%: 实现
-module(cfg_escort_monster_chs).
-compile(export_all).
-include("cfg_escort_monster.hrl").
-include("logger.hrl").

getRow(1)->
    #escort_monsterCfg {
    id = 1,
    monster = [{1110,4},{1113,2},{1111,1},{1112,4}]
    };
getRow(2)->
    #escort_monsterCfg {
    id = 2,
    monster = [{1110,6},{1113,4},{1112,6}]
    };
getRow(3)->
    #escort_monsterCfg {
    id = 3,
    monster = [{1114,4},{1117,2},{1115,1},{1116,4}]
    };
getRow(4)->
    #escort_monsterCfg {
    id = 4,
    monster = [{1114,6},{1117,4},{1116,6}]
    };
getRow(5)->
    #escort_monsterCfg {
    id = 5,
    monster = [{1118,4},{1121,2},{1119,1},{1120,4}]
    };
getRow(6)->
    #escort_monsterCfg {
    id = 6,
    monster = [{1118,6},{1121,4},{1120,6}]
    };
getRow(7)->
    #escort_monsterCfg {
    id = 7,
    monster = [{1111,1},{1115,1},{1114,2}]
    };
getRow(8)->
    #escort_monsterCfg {
    id = 8,
    monster = [{1119,1},{1115,1},{1118,2}]
    };
getRow(9)->
    #escort_monsterCfg {
    id = 9,
    monster = [{1110,4},{1114,4},{1118,4}]
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
    {9}
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
    9
    ].

