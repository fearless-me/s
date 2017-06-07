%% coding: latin-1
%%: 实现
-module(cfg_factionList_chs).
-compile(export_all).
-include("cfg_factionList.hrl").
-include("logger.hrl").

getRow(1)->
    #factionListCfg {
    id = 1,
    faction = "Player",
    player = 1,
    alliedMonster = 0,
    hostileMonster = 2,
    battleBlue = 0,
    battleRed = 0,
    teamMate = 0,
    nonTeamMate = 0,
    memberShip = 0,
    nonMemberShip = 0
    };
getRow(2)->
    #factionListCfg {
    id = 2,
    faction = "BattleRed",
    player = 0,
    alliedMonster = 0,
    hostileMonster = 2,
    battleBlue = 2,
    battleRed = 1,
    teamMate = 1,
    nonTeamMate = 1,
    memberShip = 0,
    nonMemberShip = 0
    };
getRow(3)->
    #factionListCfg {
    id = 3,
    faction = "BattleBlue",
    player = 0,
    alliedMonster = 0,
    hostileMonster = 2,
    battleBlue = 1,
    battleRed = 2,
    teamMate = 1,
    nonTeamMate = 1,
    memberShip = 0,
    nonMemberShip = 0
    };
getRow(4)->
    #factionListCfg {
    id = 4,
    faction = "AlliedMonster",
    player = 0,
    alliedMonster = 1,
    hostileMonster = 2,
    battleBlue = 0,
    battleRed = 0,
    teamMate = 0,
    nonTeamMate = 0,
    memberShip = 0,
    nonMemberShip = 0
    };
getRow(5)->
    #factionListCfg {
    id = 5,
    faction = "HostileMonster",
    player = 2,
    alliedMonster = 2,
    hostileMonster = 1,
    battleBlue = 2,
    battleRed = 2,
    teamMate = 0,
    nonTeamMate = 0,
    memberShip = 0,
    nonMemberShip = 0
    };
getRow(6)->
    #factionListCfg {
    id = 6,
    faction = "PeaceMode",
    player = 0,
    alliedMonster = 0,
    hostileMonster = 0,
    battleBlue = 0,
    battleRed = 0,
    teamMate = 1,
    nonTeamMate = 0,
    memberShip = 0,
    nonMemberShip = 0
    };
getRow(7)->
    #factionListCfg {
    id = 7,
    faction = "SoleMode",
    player = 0,
    alliedMonster = 0,
    hostileMonster = 0,
    battleBlue = 0,
    battleRed = 0,
    teamMate = 1,
    nonTeamMate = 2,
    memberShip = 0,
    nonMemberShip = 0
    };
getRow(8)->
    #factionListCfg {
    id = 8,
    faction = "BeastMode",
    player = 0,
    alliedMonster = 0,
    hostileMonster = 0,
    battleBlue = 0,
    battleRed = 0,
    teamMate = 1,
    nonTeamMate = 0,
    memberShip = 0,
    nonMemberShip = 2
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
    {8}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8
    ].

