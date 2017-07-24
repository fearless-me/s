%% coding: latin-1
%%: 实现
-module(cfg_transformspell_chs).
-compile(export_all).
-include("cfg_transformspell.hrl").
-include("logger.hrl").

getRow(1,101)->
    #transformspellCfg {
    lv = 1,
    career = 101,
    cardPoint = 1,
    exp = 0,
    skill = [14011],
    fakeskill = [],
    start_level = 1,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(1,111)->
    #transformspellCfg {
    lv = 1,
    career = 111,
    cardPoint = 1,
    exp = 0,
    skill = [14111],
    fakeskill = [],
    start_level = 1,
    weapon = "equip_weapon/sabre_70",
    weapon_ex = "equip_weapon/sword_shield_70",
    weapon_location = [0.6,0.6,0.6,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(1,112)->
    #transformspellCfg {
    lv = 1,
    career = 112,
    cardPoint = 1,
    exp = 0,
    skill = [14011],
    fakeskill = [],
    start_level = 1,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(1,201)->
    #transformspellCfg {
    lv = 1,
    career = 201,
    cardPoint = 1,
    exp = 0,
    skill = [14041],
    fakeskill = [],
    start_level = 1,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(1,211)->
    #transformspellCfg {
    lv = 1,
    career = 211,
    cardPoint = 1,
    exp = 0,
    skill = [14041],
    fakeskill = [],
    start_level = 1,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(1,212)->
    #transformspellCfg {
    lv = 1,
    career = 212,
    cardPoint = 1,
    exp = 0,
    skill = [14141],
    fakeskill = [],
    start_level = 1,
    weapon = "equip_weapon/wand_70",
    weapon_ex = "equip_weapon/wand_70_1",
    weapon_location = [0.8,0.8,0.8,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(1,301)->
    #transformspellCfg {
    lv = 1,
    career = 301,
    cardPoint = 1,
    exp = 0,
    skill = [14071],
    fakeskill = [],
    start_level = 1,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(1,311)->
    #transformspellCfg {
    lv = 1,
    career = 311,
    cardPoint = 1,
    exp = 0,
    skill = [14171],
    fakeskill = [],
    start_level = 1,
    weapon = "equip_weapon/bow_70",
    weapon_location = [0.8,0.8,0.8,0,-2.084,0.05],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(1,312)->
    #transformspellCfg {
    lv = 1,
    career = 312,
    cardPoint = 1,
    exp = 0,
    skill = [14071],
    fakeskill = [],
    start_level = 1,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(_,_)->[].

getKeyList()->[
    {1,101},
    {1,111},
    {1,112},
    {1,201},
    {1,211},
    {1,212},
    {1,301},
    {1,311},
    {1,312}
    ].

get1KeyList()->[
    1
    ].

get2KeyList(1)->[
    101,
    111,
    112,
    201,
    211,
    212,
    301,
    311,
    312
    ];
get2KeyList(_)->[].

