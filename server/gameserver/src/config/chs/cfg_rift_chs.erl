%% coding: latin-1
%%: 实现
-module(cfg_rift_chs).
-compile(export_all).
-include("cfg_rift.hrl").
-include("logger.hrl").

getRow(4)->
    #riftCfg {
    mapid = 4,
    desc1 = "霜封岭",
    desc2 = "map4初级",
    cd = 180,
    move_npc_list = [347],
    position = [{102,96},{102,81},{101,55},{91,63},{72,51},{53,47},{63,69},{52,93}]
    };
getRow(5)->
    #riftCfg {
    mapid = 5,
    desc1 = "护序者营地",
    desc2 = "map5初级",
    cd = 180,
    move_npc_list = [348],
    position = [{22,64},{13,62},{26,43},{21,17},{30,16},{52,29},{80,22},{50,61},{66,63}]
    };
getRow(6)->
    #riftCfg {
    mapid = 6,
    desc1 = "永生花园",
    desc2 = "map6中级",
    cd = 180,
    move_npc_list = [350],
    position = [{70,114},{120,163},{142,152},{118,100},{140,94},{135,83},{120,80},{125,170},{119,163},{125,147}]
    };
getRow(7)->
    #riftCfg {
    mapid = 7,
    desc1 = "亚夏英灵殿",
    desc2 = "map7中级",
    cd = 180,
    move_npc_list = [351],
    position = [{121,53},{104,33},{90,40},{87,53},{61,52},{47,26},{25,40},{58,37}]
    };
getRow(8)->
    #riftCfg {
    mapid = 8,
    desc1 = "世界之渊",
    desc2 = "map8初级",
    cd = 900,
    move_npc_list = [347],
    position = [{109,52}]
    };
getRow(9)->
    #riftCfg {
    mapid = 9,
    desc1 = "灰影城堡",
    desc2 = "map9初级",
    cd = 900,
    move_npc_list = [348],
    position = [{4,87}]
    };
getRow(10)->
    #riftCfg {
    mapid = 10,
    desc1 = "梅尔特尼恩高地",
    desc2 = "map10初级",
    cd = 900,
    move_npc_list = [349],
    position = [{106,54}]
    };
getRow(11)->
    #riftCfg {
    mapid = 11,
    desc1 = "暖风海滩",
    desc2 = "map11中级",
    cd = 900,
    move_npc_list = [350],
    position = [{83,73}]
    };
getRow(12)->
    #riftCfg {
    mapid = 12,
    desc1 = "上古荒原",
    desc2 = "map12中级",
    cd = 900,
    move_npc_list = [350],
    position = [{90,113}]
    };
getRow(13)->
    #riftCfg {
    mapid = 13,
    desc1 = "大草原",
    desc2 = "map13中级",
    cd = 900,
    move_npc_list = [350],
    position = [{42,110}]
    };
getRow(14)->
    #riftCfg {
    mapid = 14,
    desc1 = "可汗营地",
    desc2 = "map14中级",
    cd = 900,
    move_npc_list = [350],
    position = [{98,98}]
    };
getRow(15)->
    #riftCfg {
    mapid = 15,
    desc1 = "雄狮要塞",
    desc2 = "map15中级",
    cd = 900,
    move_npc_list = [350],
    position = [{124,17}]
    };
getRow(16)->
    #riftCfg {
    mapid = 16,
    desc1 = "走私者锚地",
    desc2 = "map16高级",
    cd = 900,
    move_npc_list = [354],
    position = [{90,5}]
    };
getRow(17)->
    #riftCfg {
    mapid = 17,
    desc1 = "帝都广场区",
    desc2 = "map17高级",
    cd = 900,
    move_npc_list = [354],
    position = [{59,2}]
    };
getRow(18)->
    #riftCfg {
    mapid = 18,
    desc1 = "帝都废城区",
    desc2 = "map18高级",
    cd = 900,
    move_npc_list = [354],
    position = [{67,3}]
    };
getRow(19)->
    #riftCfg {
    mapid = 19,
    desc1 = "阿玛革冬平原",
    desc2 = "map19高级",
    cd = 900,
    move_npc_list = [354],
    position = [{159,122}]
    };
getRow(_)->[].

getKeyList()->[
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
    {16},
    {17},
    {18},
    {19}
    ].

get1KeyList()->[
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
    16,
    17,
    18,
    19
    ].

