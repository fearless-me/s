%% coding: latin-1
%%: 实现
-module(cfg_rechargeFirstAD_chs).
-compile(export_all).
-include("cfg_rechargeFirstAD.hrl").
-include("logger.hrl").

getRow(1)->
    #rechargeFirstADCfg {
    id = 1,
    item_1 = [{4300,1,0,1}],
    effect = 1,
    showequipment = 0
    };
getRow(2)->
    #rechargeFirstADCfg {
    id = 2,
    item_1 = [{31584,4,1,1},{31586,4,2,1},{31588,4,3,1},{31590,4,4,1},{50237,4,5,1}],
    effect = 1,
    showequipment = 0
    };
getRow(3)->
    #rechargeFirstADCfg {
    id = 3,
    item_1 = [{31576,4,1,1},{31578,4,2,1},{31580,4,3,1},{31582,4,4,1},{50236,4,5,1}],
    effect = 1,
    showequipment = 0
    };
getRow(4)->
    #rechargeFirstADCfg {
    id = 4,
    item_1 = [{31600,4,1,1},{31602,4,2,1},{31604,4,3,1},{31606,4,4,1},{50239,4,5,1}],
    effect = 0,
    showequipment = 0
    };
getRow(5)->
    #rechargeFirstADCfg {
    id = 5,
    item_1 = [{31592,4,1,1},{31594,4,2,1},{31596,4,3,1},{31598,4,4,1},{50238,4,5,1}],
    effect = 0,
    showequipment = 1
    };
getRow(6)->
    #rechargeFirstADCfg {
    id = 6,
    item_1 = [{31585,4,1,1},{31587,4,2,1},{31589,4,3,1},{31591,4,4,1},{50241,4,5,1}],
    effect = 0,
    showequipment = 1
    };
getRow(7)->
    #rechargeFirstADCfg {
    id = 7,
    item_1 = [{31577,4,1,1},{31579,4,2,1},{31581,4,3,1},{31583,4,4,1},{50240,4,5,1}],
    effect = 0,
    showequipment = 1
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ].

