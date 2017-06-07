%% coding: latin-1
%%: 实现
-module(cfg_goblin_chs).
-compile(export_all).
-include("cfg_goblin.hrl").
-include("logger.hrl").

getRow(3)->
    #goblinCfg {
    mapid = 3,
    refreshtime = [0],
    monsterid = 979,
    refreshpos = [{136,37},{137,40},{142,35},{143,37},{141,42},{125,50},{128,48},{127,50},{102,65},{102,69},{100,60},{103,109},{106,105},{133,123},{131,121},{137,136}],
    bossid = 980,
    bossrefreshpos = [{77,127}]
    };
getRow(6)->
    #goblinCfg {
    mapid = 6,
    refreshtime = [6],
    monsterid = 979,
    refreshpos = [{142,153},{147,152},{142,150},{119,165},{119,163},{120,168},{125,145},{133,93},{138,86},{120,81},{80,116},{78,110},{74,116},{65,111},{70,104},{61,53},{53,40}],
    bossid = 980,
    bossrefreshpos = [{100,98}]
    };
getRow(8)->
    #goblinCfg {
    mapid = 8,
    refreshtime = [11],
    monsterid = 979,
    refreshpos = [{74,82},{69,84},{72,87},{8,69},{8,63},{7,57},{9,33},{55,12},{71,11},{86,13},{72,50},{70,42},{59,46},{42,51},{11,8},{17,15}],
    bossid = 980,
    bossrefreshpos = [{72,49}]
    };
getRow(9)->
    #goblinCfg {
    mapid = 9,
    refreshtime = [17],
    monsterid = 979,
    refreshpos = [{37,26},{29,25},{21,25},{23,50},{27,54},{36,48},{42,64},{47,61},{51,50},{70,58},{68,62},{68,47},{65,21},{24,39}],
    bossid = 980,
    bossrefreshpos = [{20,48}]
    };
getRow(10)->
    #goblinCfg {
    mapid = 10,
    refreshtime = [23],
    monsterid = 979,
    refreshpos = [{60,17},{49,20},{38,17},{26,20},{27,25},{15,32},{20,35},{18,44},{10,46},{23,73},{32,73},{50,53},{60,55},{36,57},{70,56},{60,76}],
    bossid = 980,
    bossrefreshpos = [{57,50}]
    };
getRow(11)->
    #goblinCfg {
    mapid = 11,
    refreshtime = [18],
    monsterid = 979,
    refreshpos = [{28,25},{33,23},{30,28},{39,30},{45,21},{49,20},{42,40},{48,53},{49,58},{51,67},{30,53},{24,47},{25,60},{30,54}],
    bossid = 980,
    bossrefreshpos = [{63,22}]
    };
getRow(_)->[].

getKeyList()->[
    {3},
    {6},
    {8},
    {9},
    {10},
    {11}
    ].

get1KeyList()->[
    3,
    6,
    8,
    9,
    10,
    11
    ].

