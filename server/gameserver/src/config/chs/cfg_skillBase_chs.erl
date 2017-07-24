%% coding: latin-1
%%: 实现
-module(cfg_skillBase_chs).
-compile(export_all).
-include("cfg_skillBase.hrl").
-include("logger.hrl").

getRow(breakRange)->
    #skillBaseCfg {
    id = 3,
    settype = breakRange,
    descStr = "破甲范围",
    setpara = [0,0.2,0]
    };
getRow(critdamRange)->
    #skillBaseCfg {
    id = 4,
    settype = critdamRange,
    descStr = "爆伤范围",
    setpara = [0,1,1.5]
    };
getRow(critRange)->
    #skillBaseCfg {
    id = 1,
    settype = critRange,
    descStr = "暴击范围",
    setpara = [0.05,0.6,0]
    };
getRow(dodgeRange)->
    #skillBaseCfg {
    id = 2,
    settype = dodgeRange,
    descStr = "闪避范围",
    setpara = [0,0.4,0]
    };
getRow(hitRange)->
    #skillBaseCfg {
    id = 5,
    settype = hitRange,
    descStr = "命中范围",
    setpara = [0,1,0]
    };
getRow(magAtkParam)->
    #skillBaseCfg {
    id = 7,
    settype = magAtkParam,
    descStr = "法攻系数",
    setpara = [1]
    };
getRow(magDefMax)->
    #skillBaseCfg {
    id = 9,
    settype = magDefMax,
    descStr = "法免最大系数",
    setpara = [0.6]
    };
getRow(phyAtkParam)->
    #skillBaseCfg {
    id = 6,
    settype = phyAtkParam,
    descStr = "物攻系数",
    setpara = [1]
    };
getRow(phyDefMax)->
    #skillBaseCfg {
    id = 8,
    settype = phyDefMax,
    descStr = "物免最大系数",
    setpara = [0.6]
    };
getRow(player_monster_battlevalue)->
    #skillBaseCfg {
    id = 10,
    settype = player_monster_battlevalue,
    descStr = "人打怪怪打人伤害系数",
    setpara = [1]
    };
getRow(player_player_battlevalue)->
    #skillBaseCfg {
    id = 11,
    settype = player_player_battlevalue,
    descStr = "人打人伤害系数",
    setpara = [0.3]
    };
getRow(_)->[].

getKeyList()->[
    {breakRange},
    {critdamRange},
    {critRange},
    {dodgeRange},
    {hitRange},
    {magAtkParam},
    {magDefMax},
    {phyAtkParam},
    {phyDefMax},
    {player_monster_battlevalue},
    {player_player_battlevalue}
    ].

get1KeyList()->[
    breakRange,
    critdamRange,
    critRange,
    dodgeRange,
    hitRange,
    magAtkParam,
    magDefMax,
    phyAtkParam,
    phyDefMax,
    player_monster_battlevalue,
    player_player_battlevalue
    ].

