%% coding: latin-1
%%: 实现
-module(cfg_equipmentDisplay_chs).
-compile(export_all).
-include("cfg_equipmentDisplay.hrl").
-include("logger.hrl").

getRow(1)->
    #equipmentDisplayCfg {
    id = 1,
    name = "30级装备",
    occupation_ID = 1,
    weapon_id = 31576,
    deputy_ID = 31584,
    breastplate_ID = 31592,
    shoes_ID = 31276,
    ring_ID = 31608,
    necklace_ID = 31611,
    helmet_ID = 31600,
    pants_ID = 31252,
    level = 1,
    output_route = "30级的橙色装备，通过消耗金币兑换获得"
    };
getRow(2)->
    #equipmentDisplayCfg {
    id = 2,
    name = "40级装备",
    occupation_ID = 1,
    weapon_id = 31577,
    deputy_ID = 31585,
    breastplate_ID = 31593,
    shoes_ID = 31277,
    ring_ID = 31608,
    necklace_ID = 31611,
    helmet_ID = 31601,
    pants_ID = 31253,
    level = 30,
    output_route = "30级的橙色装备，通过消耗金币兑换获得"
    };
getRow(3)->
    #equipmentDisplayCfg {
    id = 3,
    name = "30级装备",
    occupation_ID = 2,
    weapon_id = 31578,
    deputy_ID = 31586,
    breastplate_ID = 31594,
    shoes_ID = 31278,
    ring_ID = 31608,
    necklace_ID = 31611,
    helmet_ID = 31602,
    pants_ID = 31254,
    level = 1,
    output_route = "30级的橙色装备，通过消耗金币兑换获得"
    };
getRow(4)->
    #equipmentDisplayCfg {
    id = 4,
    name = "40级装备",
    occupation_ID = 2,
    weapon_id = 31579,
    deputy_ID = 31587,
    breastplate_ID = 31595,
    shoes_ID = 31279,
    ring_ID = 31608,
    necklace_ID = 31611,
    helmet_ID = 31603,
    pants_ID = 31255,
    level = 30,
    output_route = "30级的橙色装备，通过消耗金币兑换获得"
    };
getRow(5)->
    #equipmentDisplayCfg {
    id = 5,
    name = "30级装备",
    occupation_ID = 3,
    weapon_id = 31580,
    deputy_ID = 31588,
    breastplate_ID = 31596,
    shoes_ID = 31280,
    ring_ID = 31608,
    necklace_ID = 31611,
    helmet_ID = 31604,
    pants_ID = 31256,
    level = 1,
    output_route = "30级的橙色装备，通过消耗金币兑换获得"
    };
getRow(6)->
    #equipmentDisplayCfg {
    id = 6,
    name = "40级装备",
    occupation_ID = 3,
    weapon_id = 31581,
    deputy_ID = 31589,
    breastplate_ID = 31597,
    shoes_ID = 31281,
    ring_ID = 31608,
    necklace_ID = 31611,
    helmet_ID = 31605,
    pants_ID = 31257,
    level = 30,
    output_route = "30级的橙色装备，通过消耗金币兑换获得"
    };
getRow(7)->
    #equipmentDisplayCfg {
    id = 7,
    name = "30级装备",
    occupation_ID = 4,
    weapon_id = 31582,
    deputy_ID = 31590,
    breastplate_ID = 31598,
    shoes_ID = 31282,
    ring_ID = 31608,
    necklace_ID = 31611,
    helmet_ID = 31606,
    pants_ID = 31258,
    level = 1,
    output_route = "30级的橙色装备，通过消耗金币兑换获得"
    };
getRow(8)->
    #equipmentDisplayCfg {
    id = 8,
    name = "40级装备",
    occupation_ID = 4,
    weapon_id = 31583,
    deputy_ID = 31591,
    breastplate_ID = 31599,
    shoes_ID = 31283,
    ring_ID = 31608,
    necklace_ID = 31611,
    helmet_ID = 31607,
    pants_ID = 31259,
    level = 30,
    output_route = "30级的橙色装备，通过消耗金币兑换获得"
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

