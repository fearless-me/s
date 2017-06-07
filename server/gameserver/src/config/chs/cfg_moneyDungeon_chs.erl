%%: 实现
-module(cfg_moneyDungeon_chs).
-compile(export_all).
-include("cfg_moneyDungeon.hrl").
-include("logger.hrl").

getRow(520)->
    #moneyDungeonCfg {
    id = 520,
    boshu = 6,
    monster = [{771,2},{772,3},{773,4},{774,5}],
    time = 1,
    time_over = 300
    };
getRow(521)->
    #moneyDungeonCfg {
    id = 521,
    boshu = 6,
    monster = [{771,2},{772,3},{773,4},{774,5}],
    time = 1,
    time_over = 300
    };
getRow(522)->
    #moneyDungeonCfg {
    id = 522,
    boshu = 6,
    monster = [{771,2},{772,3},{773,4},{774,5}],
    time = 1,
    time_over = 300
    };
getRow(523)->
    #moneyDungeonCfg {
    id = 523,
    boshu = 6,
    monster = [{771,2},{772,3},{773,4},{774,5}],
    time = 1,
    time_over = 300
    };
getRow(524)->
    #moneyDungeonCfg {
    id = 524,
    boshu = 6,
    monster = [{771,2},{772,3},{773,4},{774,5}],
    time = 1,
    time_over = 300
    };
getRow(525)->
    #moneyDungeonCfg {
    id = 525,
    boshu = 6,
    monster = [{771,2},{772,3},{773,4},{774,5}],
    time = 1,
    time_over = 300
    };
getRow(_)->[].

getKeyList()->[
    {520},
    {521},
    {522},
    {523},
    {524},
    {525}
    ].

get1KeyList()->[
    520,
    521,
    522,
    523,
    524,
    525
    ].

