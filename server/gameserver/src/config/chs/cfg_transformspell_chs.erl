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
    fakeskill = [22100],
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
    fakeskill = [22190],
    start_level = 1,
    weapon = "equip_weapon/sabre_70",
    weapon_ex = "equip_weapon/sword_shield_70",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(1,112)->
    #transformspellCfg {
    lv = 1,
    career = 112,
    cardPoint = 1,
    exp = 0,
    skill = [14011],
    fakeskill = [22100],
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
    fakeskill = [22130],
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
    fakeskill = [22130],
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
    fakeskill = [22220],
    start_level = 1,
    weapon = "equip_weapon/wand_70",
    weapon_ex = "equip_weapon/wand_70_1",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(1,301)->
    #transformspellCfg {
    lv = 1,
    career = 301,
    cardPoint = 1,
    exp = 0,
    skill = [14071],
    fakeskill = [22160],
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
    fakeskill = [22250],
    start_level = 1,
    weapon = "equip_weapon/bow_70",
    weapon_location = [0.4,0.4,0.4,0,-2.084,0.05],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(1,312)->
    #transformspellCfg {
    lv = 1,
    career = 312,
    cardPoint = 1,
    exp = 0,
    skill = [14071],
    fakeskill = [22160],
    start_level = 1,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(2,101)->
    #transformspellCfg {
    lv = 2,
    career = 101,
    cardPoint = 6,
    exp = 6,
    skill = [14012],
    fakeskill = [22101],
    start_level = 1,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(2,111)->
    #transformspellCfg {
    lv = 2,
    career = 111,
    cardPoint = 6,
    exp = 6,
    skill = [14112],
    fakeskill = [22191],
    start_level = 1,
    weapon = "equip_weapon/sabre_70",
    weapon_ex = "equip_weapon/sword_shield_70",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(2,112)->
    #transformspellCfg {
    lv = 2,
    career = 112,
    cardPoint = 6,
    exp = 6,
    skill = [14012],
    fakeskill = [22101],
    start_level = 1,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(2,201)->
    #transformspellCfg {
    lv = 2,
    career = 201,
    cardPoint = 6,
    exp = 6,
    skill = [14042],
    fakeskill = [22131],
    start_level = 1,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(2,211)->
    #transformspellCfg {
    lv = 2,
    career = 211,
    cardPoint = 6,
    exp = 6,
    skill = [14042],
    fakeskill = [22131],
    start_level = 1,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(2,212)->
    #transformspellCfg {
    lv = 2,
    career = 212,
    cardPoint = 6,
    exp = 6,
    skill = [14142],
    fakeskill = [22221],
    start_level = 1,
    weapon = "equip_weapon/wand_70",
    weapon_ex = "equip_weapon/wand_70_1",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(2,301)->
    #transformspellCfg {
    lv = 2,
    career = 301,
    cardPoint = 6,
    exp = 6,
    skill = [14072],
    fakeskill = [22161],
    start_level = 1,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(2,311)->
    #transformspellCfg {
    lv = 2,
    career = 311,
    cardPoint = 6,
    exp = 6,
    skill = [14172],
    fakeskill = [22251],
    start_level = 1,
    weapon = "equip_weapon/bow_70",
    weapon_location = [0.4,0.4,0.4,0,-2.084,0.05],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(2,312)->
    #transformspellCfg {
    lv = 2,
    career = 312,
    cardPoint = 6,
    exp = 6,
    skill = [14072],
    fakeskill = [22161],
    start_level = 1,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(3,101)->
    #transformspellCfg {
    lv = 3,
    career = 101,
    cardPoint = 12,
    exp = 44,
    skill = [14013],
    fakeskill = [22102],
    start_level = 1,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(3,111)->
    #transformspellCfg {
    lv = 3,
    career = 111,
    cardPoint = 12,
    exp = 44,
    skill = [14113],
    fakeskill = [22192],
    start_level = 1,
    weapon = "equip_weapon/sabre_70",
    weapon_ex = "equip_weapon/sword_shield_70",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(3,112)->
    #transformspellCfg {
    lv = 3,
    career = 112,
    cardPoint = 12,
    exp = 44,
    skill = [14013],
    fakeskill = [22102],
    start_level = 1,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(3,201)->
    #transformspellCfg {
    lv = 3,
    career = 201,
    cardPoint = 12,
    exp = 44,
    skill = [14043],
    fakeskill = [22132],
    start_level = 1,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(3,211)->
    #transformspellCfg {
    lv = 3,
    career = 211,
    cardPoint = 12,
    exp = 44,
    skill = [14043],
    fakeskill = [22132],
    start_level = 1,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(3,212)->
    #transformspellCfg {
    lv = 3,
    career = 212,
    cardPoint = 12,
    exp = 44,
    skill = [14143],
    fakeskill = [22222],
    start_level = 1,
    weapon = "equip_weapon/wand_70",
    weapon_ex = "equip_weapon/wand_70_1",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(3,301)->
    #transformspellCfg {
    lv = 3,
    career = 301,
    cardPoint = 12,
    exp = 44,
    skill = [14073],
    fakeskill = [22162],
    start_level = 1,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(3,311)->
    #transformspellCfg {
    lv = 3,
    career = 311,
    cardPoint = 12,
    exp = 44,
    skill = [14173],
    fakeskill = [22252],
    start_level = 1,
    weapon = "equip_weapon/bow_70",
    weapon_location = [0.4,0.4,0.4,0,-2.084,0.05],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(3,312)->
    #transformspellCfg {
    lv = 3,
    career = 312,
    cardPoint = 12,
    exp = 44,
    skill = [14073],
    fakeskill = [22162],
    start_level = 1,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(4,101)->
    #transformspellCfg {
    lv = 4,
    career = 101,
    cardPoint = 24,
    exp = 122,
    skill = [14014],
    fakeskill = [22103],
    start_level = 1,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(4,111)->
    #transformspellCfg {
    lv = 4,
    career = 111,
    cardPoint = 24,
    exp = 122,
    skill = [14114],
    fakeskill = [22193],
    start_level = 1,
    weapon = "equip_weapon/sabre_70",
    weapon_ex = "equip_weapon/sword_shield_70",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(4,112)->
    #transformspellCfg {
    lv = 4,
    career = 112,
    cardPoint = 24,
    exp = 122,
    skill = [14014],
    fakeskill = [22103],
    start_level = 1,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(4,201)->
    #transformspellCfg {
    lv = 4,
    career = 201,
    cardPoint = 24,
    exp = 122,
    skill = [14044],
    fakeskill = [22133],
    start_level = 1,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(4,211)->
    #transformspellCfg {
    lv = 4,
    career = 211,
    cardPoint = 24,
    exp = 122,
    skill = [14044],
    fakeskill = [22133],
    start_level = 1,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(4,212)->
    #transformspellCfg {
    lv = 4,
    career = 212,
    cardPoint = 24,
    exp = 122,
    skill = [14144],
    fakeskill = [22223],
    start_level = 1,
    weapon = "equip_weapon/wand_70",
    weapon_ex = "equip_weapon/wand_70_1",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(4,301)->
    #transformspellCfg {
    lv = 4,
    career = 301,
    cardPoint = 24,
    exp = 122,
    skill = [14074],
    fakeskill = [22163],
    start_level = 1,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(4,311)->
    #transformspellCfg {
    lv = 4,
    career = 311,
    cardPoint = 24,
    exp = 122,
    skill = [14174],
    fakeskill = [22253],
    start_level = 1,
    weapon = "equip_weapon/bow_70",
    weapon_location = [0.4,0.4,0.4,0,-2.084,0.05],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(4,312)->
    #transformspellCfg {
    lv = 4,
    career = 312,
    cardPoint = 24,
    exp = 122,
    skill = [14074],
    fakeskill = [22163],
    start_level = 1,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(5,101)->
    #transformspellCfg {
    lv = 5,
    career = 101,
    cardPoint = 36,
    exp = 198,
    skill = [14015],
    fakeskill = [22104],
    start_level = 5,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(5,111)->
    #transformspellCfg {
    lv = 5,
    career = 111,
    cardPoint = 36,
    exp = 198,
    skill = [14115],
    fakeskill = [22194],
    start_level = 5,
    weapon = "equip_weapon/sabre_70",
    weapon_ex = "equip_weapon/sword_shield_70",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(5,112)->
    #transformspellCfg {
    lv = 5,
    career = 112,
    cardPoint = 36,
    exp = 198,
    skill = [14015],
    fakeskill = [22104],
    start_level = 5,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(5,201)->
    #transformspellCfg {
    lv = 5,
    career = 201,
    cardPoint = 36,
    exp = 198,
    skill = [14045],
    fakeskill = [22134],
    start_level = 5,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(5,211)->
    #transformspellCfg {
    lv = 5,
    career = 211,
    cardPoint = 36,
    exp = 198,
    skill = [14045],
    fakeskill = [22134],
    start_level = 5,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(5,212)->
    #transformspellCfg {
    lv = 5,
    career = 212,
    cardPoint = 36,
    exp = 198,
    skill = [14145],
    fakeskill = [22224],
    start_level = 5,
    weapon = "equip_weapon/wand_70",
    weapon_ex = "equip_weapon/wand_70_1",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(5,301)->
    #transformspellCfg {
    lv = 5,
    career = 301,
    cardPoint = 36,
    exp = 198,
    skill = [14075],
    fakeskill = [22164],
    start_level = 5,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(5,311)->
    #transformspellCfg {
    lv = 5,
    career = 311,
    cardPoint = 36,
    exp = 198,
    skill = [14175],
    fakeskill = [22254],
    start_level = 5,
    weapon = "equip_weapon/bow_70",
    weapon_location = [0.4,0.4,0.4,0,-2.084,0.05],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(5,312)->
    #transformspellCfg {
    lv = 5,
    career = 312,
    cardPoint = 36,
    exp = 198,
    skill = [14075],
    fakeskill = [22164],
    start_level = 5,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(6,101)->
    #transformspellCfg {
    lv = 6,
    career = 101,
    cardPoint = 51,
    exp = 276,
    skill = [14016],
    fakeskill = [22105],
    start_level = 5,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(6,111)->
    #transformspellCfg {
    lv = 6,
    career = 111,
    cardPoint = 51,
    exp = 276,
    skill = [14116],
    fakeskill = [22195],
    start_level = 5,
    weapon = "equip_weapon/sabre_70",
    weapon_ex = "equip_weapon/sword_shield_70",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(6,112)->
    #transformspellCfg {
    lv = 6,
    career = 112,
    cardPoint = 51,
    exp = 276,
    skill = [14016],
    fakeskill = [22105],
    start_level = 5,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(6,201)->
    #transformspellCfg {
    lv = 6,
    career = 201,
    cardPoint = 51,
    exp = 276,
    skill = [14046],
    fakeskill = [22135],
    start_level = 5,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(6,211)->
    #transformspellCfg {
    lv = 6,
    career = 211,
    cardPoint = 51,
    exp = 276,
    skill = [14046],
    fakeskill = [22135],
    start_level = 5,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(6,212)->
    #transformspellCfg {
    lv = 6,
    career = 212,
    cardPoint = 51,
    exp = 276,
    skill = [14146],
    fakeskill = [22225],
    start_level = 5,
    weapon = "equip_weapon/wand_70",
    weapon_ex = "equip_weapon/wand_70_1",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(6,301)->
    #transformspellCfg {
    lv = 6,
    career = 301,
    cardPoint = 51,
    exp = 276,
    skill = [14076],
    fakeskill = [22165],
    start_level = 5,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(6,311)->
    #transformspellCfg {
    lv = 6,
    career = 311,
    cardPoint = 51,
    exp = 276,
    skill = [14176],
    fakeskill = [22255],
    start_level = 5,
    weapon = "equip_weapon/bow_70",
    weapon_location = [0.4,0.4,0.4,0,-2.084,0.05],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(6,312)->
    #transformspellCfg {
    lv = 6,
    career = 312,
    cardPoint = 51,
    exp = 276,
    skill = [14076],
    fakeskill = [22165],
    start_level = 5,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(7,101)->
    #transformspellCfg {
    lv = 7,
    career = 101,
    cardPoint = 66,
    exp = 352,
    skill = [14017],
    fakeskill = [22106],
    start_level = 5,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(7,111)->
    #transformspellCfg {
    lv = 7,
    career = 111,
    cardPoint = 66,
    exp = 352,
    skill = [14117],
    fakeskill = [22196],
    start_level = 5,
    weapon = "equip_weapon/sabre_70",
    weapon_ex = "equip_weapon/sword_shield_70",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(7,112)->
    #transformspellCfg {
    lv = 7,
    career = 112,
    cardPoint = 66,
    exp = 352,
    skill = [14017],
    fakeskill = [22106],
    start_level = 5,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(7,201)->
    #transformspellCfg {
    lv = 7,
    career = 201,
    cardPoint = 66,
    exp = 352,
    skill = [14047],
    fakeskill = [22136],
    start_level = 5,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(7,211)->
    #transformspellCfg {
    lv = 7,
    career = 211,
    cardPoint = 66,
    exp = 352,
    skill = [14047],
    fakeskill = [22136],
    start_level = 5,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(7,212)->
    #transformspellCfg {
    lv = 7,
    career = 212,
    cardPoint = 66,
    exp = 352,
    skill = [14147],
    fakeskill = [22226],
    start_level = 5,
    weapon = "equip_weapon/wand_70",
    weapon_ex = "equip_weapon/wand_70_1",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(7,301)->
    #transformspellCfg {
    lv = 7,
    career = 301,
    cardPoint = 66,
    exp = 352,
    skill = [14077],
    fakeskill = [22166],
    start_level = 5,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(7,311)->
    #transformspellCfg {
    lv = 7,
    career = 311,
    cardPoint = 66,
    exp = 352,
    skill = [14177],
    fakeskill = [22256],
    start_level = 5,
    weapon = "equip_weapon/bow_70",
    weapon_location = [0.4,0.4,0.4,0,-2.084,0.05],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(7,312)->
    #transformspellCfg {
    lv = 7,
    career = 312,
    cardPoint = 66,
    exp = 352,
    skill = [14077],
    fakeskill = [22166],
    start_level = 5,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(8,101)->
    #transformspellCfg {
    lv = 8,
    career = 101,
    cardPoint = 84,
    exp = 430,
    skill = [14018],
    fakeskill = [22107],
    start_level = 5,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(8,111)->
    #transformspellCfg {
    lv = 8,
    career = 111,
    cardPoint = 84,
    exp = 430,
    skill = [14118],
    fakeskill = [22197],
    start_level = 5,
    weapon = "equip_weapon/sabre_70",
    weapon_ex = "equip_weapon/sword_shield_70",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(8,112)->
    #transformspellCfg {
    lv = 8,
    career = 112,
    cardPoint = 84,
    exp = 430,
    skill = [14018],
    fakeskill = [22107],
    start_level = 5,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(8,201)->
    #transformspellCfg {
    lv = 8,
    career = 201,
    cardPoint = 84,
    exp = 430,
    skill = [14048],
    fakeskill = [22137],
    start_level = 5,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(8,211)->
    #transformspellCfg {
    lv = 8,
    career = 211,
    cardPoint = 84,
    exp = 430,
    skill = [14048],
    fakeskill = [22137],
    start_level = 5,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(8,212)->
    #transformspellCfg {
    lv = 8,
    career = 212,
    cardPoint = 84,
    exp = 430,
    skill = [14148],
    fakeskill = [22227],
    start_level = 5,
    weapon = "equip_weapon/wand_70",
    weapon_ex = "equip_weapon/wand_70_1",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(8,301)->
    #transformspellCfg {
    lv = 8,
    career = 301,
    cardPoint = 84,
    exp = 430,
    skill = [14078],
    fakeskill = [22167],
    start_level = 5,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(8,311)->
    #transformspellCfg {
    lv = 8,
    career = 311,
    cardPoint = 84,
    exp = 430,
    skill = [14178],
    fakeskill = [22257],
    start_level = 5,
    weapon = "equip_weapon/bow_70",
    weapon_location = [0.4,0.4,0.4,0,-2.084,0.05],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(8,312)->
    #transformspellCfg {
    lv = 8,
    career = 312,
    cardPoint = 84,
    exp = 430,
    skill = [14078],
    fakeskill = [22167],
    start_level = 5,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(9,101)->
    #transformspellCfg {
    lv = 9,
    career = 101,
    cardPoint = 102,
    exp = 507,
    skill = [14019],
    fakeskill = [22108],
    start_level = 9,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(9,111)->
    #transformspellCfg {
    lv = 9,
    career = 111,
    cardPoint = 102,
    exp = 507,
    skill = [14119],
    fakeskill = [22198],
    start_level = 9,
    weapon = "equip_weapon/sabre_70",
    weapon_ex = "equip_weapon/sword_shield_70",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(9,112)->
    #transformspellCfg {
    lv = 9,
    career = 112,
    cardPoint = 102,
    exp = 507,
    skill = [14019],
    fakeskill = [22108],
    start_level = 9,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(9,201)->
    #transformspellCfg {
    lv = 9,
    career = 201,
    cardPoint = 102,
    exp = 507,
    skill = [14049],
    fakeskill = [22138],
    start_level = 9,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(9,211)->
    #transformspellCfg {
    lv = 9,
    career = 211,
    cardPoint = 102,
    exp = 507,
    skill = [14049],
    fakeskill = [22138],
    start_level = 9,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(9,212)->
    #transformspellCfg {
    lv = 9,
    career = 212,
    cardPoint = 102,
    exp = 507,
    skill = [14149],
    fakeskill = [22228],
    start_level = 9,
    weapon = "equip_weapon/wand_70",
    weapon_ex = "equip_weapon/wand_70_1",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(9,301)->
    #transformspellCfg {
    lv = 9,
    career = 301,
    cardPoint = 102,
    exp = 507,
    skill = [14079],
    fakeskill = [22168],
    start_level = 9,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(9,311)->
    #transformspellCfg {
    lv = 9,
    career = 311,
    cardPoint = 102,
    exp = 507,
    skill = [14179],
    fakeskill = [22258],
    start_level = 9,
    weapon = "equip_weapon/bow_70",
    weapon_location = [0.4,0.4,0.4,0,-2.084,0.05],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(9,312)->
    #transformspellCfg {
    lv = 9,
    career = 312,
    cardPoint = 102,
    exp = 507,
    skill = [14079],
    fakeskill = [22168],
    start_level = 9,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(10,101)->
    #transformspellCfg {
    lv = 10,
    career = 101,
    cardPoint = 120,
    exp = 584,
    skill = [14020],
    fakeskill = [22109],
    start_level = 9,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(10,111)->
    #transformspellCfg {
    lv = 10,
    career = 111,
    cardPoint = 120,
    exp = 584,
    skill = [14120],
    fakeskill = [22199],
    start_level = 9,
    weapon = "equip_weapon/sabre_70",
    weapon_ex = "equip_weapon/sword_shield_70",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(10,112)->
    #transformspellCfg {
    lv = 10,
    career = 112,
    cardPoint = 120,
    exp = 584,
    skill = [14020],
    fakeskill = [22109],
    start_level = 9,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(10,201)->
    #transformspellCfg {
    lv = 10,
    career = 201,
    cardPoint = 120,
    exp = 584,
    skill = [14050],
    fakeskill = [22139],
    start_level = 9,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(10,211)->
    #transformspellCfg {
    lv = 10,
    career = 211,
    cardPoint = 120,
    exp = 584,
    skill = [14050],
    fakeskill = [22139],
    start_level = 9,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(10,212)->
    #transformspellCfg {
    lv = 10,
    career = 212,
    cardPoint = 120,
    exp = 584,
    skill = [14150],
    fakeskill = [22229],
    start_level = 9,
    weapon = "equip_weapon/wand_70",
    weapon_ex = "equip_weapon/wand_70_1",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(10,301)->
    #transformspellCfg {
    lv = 10,
    career = 301,
    cardPoint = 120,
    exp = 584,
    skill = [14080],
    fakeskill = [22169],
    start_level = 9,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(10,311)->
    #transformspellCfg {
    lv = 10,
    career = 311,
    cardPoint = 120,
    exp = 584,
    skill = [14180],
    fakeskill = [22259],
    start_level = 9,
    weapon = "equip_weapon/bow_70",
    weapon_location = [0.4,0.4,0.4,0,-2.084,0.05],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(10,312)->
    #transformspellCfg {
    lv = 10,
    career = 312,
    cardPoint = 120,
    exp = 584,
    skill = [14080],
    fakeskill = [22169],
    start_level = 9,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(11,101)->
    #transformspellCfg {
    lv = 11,
    career = 101,
    cardPoint = 150,
    exp = 661,
    skill = [14021],
    fakeskill = [22110],
    start_level = 9,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(11,111)->
    #transformspellCfg {
    lv = 11,
    career = 111,
    cardPoint = 150,
    exp = 661,
    skill = [14121],
    fakeskill = [22200],
    start_level = 9,
    weapon = "equip_weapon/sabre_70",
    weapon_ex = "equip_weapon/sword_shield_70",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(11,112)->
    #transformspellCfg {
    lv = 11,
    career = 112,
    cardPoint = 150,
    exp = 661,
    skill = [14021],
    fakeskill = [22110],
    start_level = 9,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(11,201)->
    #transformspellCfg {
    lv = 11,
    career = 201,
    cardPoint = 150,
    exp = 661,
    skill = [14051],
    fakeskill = [22140],
    start_level = 9,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(11,211)->
    #transformspellCfg {
    lv = 11,
    career = 211,
    cardPoint = 150,
    exp = 661,
    skill = [14051],
    fakeskill = [22140],
    start_level = 9,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(11,212)->
    #transformspellCfg {
    lv = 11,
    career = 212,
    cardPoint = 150,
    exp = 661,
    skill = [14151],
    fakeskill = [22230],
    start_level = 9,
    weapon = "equip_weapon/wand_70",
    weapon_ex = "equip_weapon/wand_70_1",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(11,301)->
    #transformspellCfg {
    lv = 11,
    career = 301,
    cardPoint = 150,
    exp = 661,
    skill = [14081],
    fakeskill = [22170],
    start_level = 9,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(11,311)->
    #transformspellCfg {
    lv = 11,
    career = 311,
    cardPoint = 150,
    exp = 661,
    skill = [14181],
    fakeskill = [22260],
    start_level = 9,
    weapon = "equip_weapon/bow_70",
    weapon_location = [0.4,0.4,0.4,0,-2.084,0.05],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(11,312)->
    #transformspellCfg {
    lv = 11,
    career = 312,
    cardPoint = 150,
    exp = 661,
    skill = [14081],
    fakeskill = [22170],
    start_level = 9,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(12,101)->
    #transformspellCfg {
    lv = 12,
    career = 101,
    cardPoint = 180,
    exp = 737,
    skill = [14022],
    fakeskill = [22111],
    start_level = 9,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(12,111)->
    #transformspellCfg {
    lv = 12,
    career = 111,
    cardPoint = 180,
    exp = 737,
    skill = [14122],
    fakeskill = [22201],
    start_level = 9,
    weapon = "equip_weapon/sabre_70",
    weapon_ex = "equip_weapon/sword_shield_70",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(12,112)->
    #transformspellCfg {
    lv = 12,
    career = 112,
    cardPoint = 180,
    exp = 737,
    skill = [14022],
    fakeskill = [22111],
    start_level = 9,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(12,201)->
    #transformspellCfg {
    lv = 12,
    career = 201,
    cardPoint = 180,
    exp = 737,
    skill = [14052],
    fakeskill = [22141],
    start_level = 9,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(12,211)->
    #transformspellCfg {
    lv = 12,
    career = 211,
    cardPoint = 180,
    exp = 737,
    skill = [14052],
    fakeskill = [22141],
    start_level = 9,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(12,212)->
    #transformspellCfg {
    lv = 12,
    career = 212,
    cardPoint = 180,
    exp = 737,
    skill = [14152],
    fakeskill = [22231],
    start_level = 9,
    weapon = "equip_weapon/wand_70",
    weapon_ex = "equip_weapon/wand_70_1",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(12,301)->
    #transformspellCfg {
    lv = 12,
    career = 301,
    cardPoint = 180,
    exp = 737,
    skill = [14082],
    fakeskill = [22171],
    start_level = 9,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(12,311)->
    #transformspellCfg {
    lv = 12,
    career = 311,
    cardPoint = 180,
    exp = 737,
    skill = [14182],
    fakeskill = [22261],
    start_level = 9,
    weapon = "equip_weapon/bow_70",
    weapon_location = [0.4,0.4,0.4,0,-2.084,0.05],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(12,312)->
    #transformspellCfg {
    lv = 12,
    career = 312,
    cardPoint = 180,
    exp = 737,
    skill = [14082],
    fakeskill = [22171],
    start_level = 9,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(13,101)->
    #transformspellCfg {
    lv = 13,
    career = 101,
    cardPoint = 210,
    exp = 815,
    skill = [14023],
    fakeskill = [22112],
    start_level = 13,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(13,111)->
    #transformspellCfg {
    lv = 13,
    career = 111,
    cardPoint = 210,
    exp = 815,
    skill = [14123],
    fakeskill = [22202],
    start_level = 13,
    weapon = "equip_weapon/sabre_70",
    weapon_ex = "equip_weapon/sword_shield_70",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(13,112)->
    #transformspellCfg {
    lv = 13,
    career = 112,
    cardPoint = 210,
    exp = 815,
    skill = [14023],
    fakeskill = [22112],
    start_level = 13,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(13,201)->
    #transformspellCfg {
    lv = 13,
    career = 201,
    cardPoint = 210,
    exp = 815,
    skill = [14053],
    fakeskill = [22142],
    start_level = 13,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(13,211)->
    #transformspellCfg {
    lv = 13,
    career = 211,
    cardPoint = 210,
    exp = 815,
    skill = [14053],
    fakeskill = [22142],
    start_level = 13,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(13,212)->
    #transformspellCfg {
    lv = 13,
    career = 212,
    cardPoint = 210,
    exp = 815,
    skill = [14153],
    fakeskill = [22232],
    start_level = 13,
    weapon = "equip_weapon/wand_70",
    weapon_ex = "equip_weapon/wand_70_1",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(13,301)->
    #transformspellCfg {
    lv = 13,
    career = 301,
    cardPoint = 210,
    exp = 815,
    skill = [14083],
    fakeskill = [22172],
    start_level = 13,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(13,311)->
    #transformspellCfg {
    lv = 13,
    career = 311,
    cardPoint = 210,
    exp = 815,
    skill = [14183],
    fakeskill = [22262],
    start_level = 13,
    weapon = "equip_weapon/bow_70",
    weapon_location = [0.4,0.4,0.4,0,-2.084,0.05],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(13,312)->
    #transformspellCfg {
    lv = 13,
    career = 312,
    cardPoint = 210,
    exp = 815,
    skill = [14083],
    fakeskill = [22172],
    start_level = 13,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(14,101)->
    #transformspellCfg {
    lv = 14,
    career = 101,
    cardPoint = 240,
    exp = 892,
    skill = [14024],
    fakeskill = [22113],
    start_level = 13,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(14,111)->
    #transformspellCfg {
    lv = 14,
    career = 111,
    cardPoint = 240,
    exp = 892,
    skill = [14124],
    fakeskill = [22203],
    start_level = 13,
    weapon = "equip_weapon/sabre_70",
    weapon_ex = "equip_weapon/sword_shield_70",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(14,112)->
    #transformspellCfg {
    lv = 14,
    career = 112,
    cardPoint = 240,
    exp = 892,
    skill = [14024],
    fakeskill = [22113],
    start_level = 13,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(14,201)->
    #transformspellCfg {
    lv = 14,
    career = 201,
    cardPoint = 240,
    exp = 892,
    skill = [14054],
    fakeskill = [22143],
    start_level = 13,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(14,211)->
    #transformspellCfg {
    lv = 14,
    career = 211,
    cardPoint = 240,
    exp = 892,
    skill = [14054],
    fakeskill = [22143],
    start_level = 13,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(14,212)->
    #transformspellCfg {
    lv = 14,
    career = 212,
    cardPoint = 240,
    exp = 892,
    skill = [14154],
    fakeskill = [22233],
    start_level = 13,
    weapon = "equip_weapon/wand_70",
    weapon_ex = "equip_weapon/wand_70_1",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(14,301)->
    #transformspellCfg {
    lv = 14,
    career = 301,
    cardPoint = 240,
    exp = 892,
    skill = [14084],
    fakeskill = [22173],
    start_level = 13,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(14,311)->
    #transformspellCfg {
    lv = 14,
    career = 311,
    cardPoint = 240,
    exp = 892,
    skill = [14184],
    fakeskill = [22263],
    start_level = 13,
    weapon = "equip_weapon/bow_70",
    weapon_location = [0.4,0.4,0.4,0,-2.084,0.05],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(14,312)->
    #transformspellCfg {
    lv = 14,
    career = 312,
    cardPoint = 240,
    exp = 892,
    skill = [14084],
    fakeskill = [22173],
    start_level = 13,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(15,101)->
    #transformspellCfg {
    lv = 15,
    career = 101,
    cardPoint = 270,
    exp = 969,
    skill = [14025],
    fakeskill = [22114],
    start_level = 13,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(15,111)->
    #transformspellCfg {
    lv = 15,
    career = 111,
    cardPoint = 270,
    exp = 969,
    skill = [14125],
    fakeskill = [22204],
    start_level = 13,
    weapon = "equip_weapon/sabre_70",
    weapon_ex = "equip_weapon/sword_shield_70",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(15,112)->
    #transformspellCfg {
    lv = 15,
    career = 112,
    cardPoint = 270,
    exp = 969,
    skill = [14025],
    fakeskill = [22114],
    start_level = 13,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(15,201)->
    #transformspellCfg {
    lv = 15,
    career = 201,
    cardPoint = 270,
    exp = 969,
    skill = [14055],
    fakeskill = [22144],
    start_level = 13,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(15,211)->
    #transformspellCfg {
    lv = 15,
    career = 211,
    cardPoint = 270,
    exp = 969,
    skill = [14055],
    fakeskill = [22144],
    start_level = 13,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(15,212)->
    #transformspellCfg {
    lv = 15,
    career = 212,
    cardPoint = 270,
    exp = 969,
    skill = [14155],
    fakeskill = [22234],
    start_level = 13,
    weapon = "equip_weapon/wand_70",
    weapon_ex = "equip_weapon/wand_70_1",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(15,301)->
    #transformspellCfg {
    lv = 15,
    career = 301,
    cardPoint = 270,
    exp = 969,
    skill = [14085],
    fakeskill = [22174],
    start_level = 13,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(15,311)->
    #transformspellCfg {
    lv = 15,
    career = 311,
    cardPoint = 270,
    exp = 969,
    skill = [14185],
    fakeskill = [22264],
    start_level = 13,
    weapon = "equip_weapon/bow_70",
    weapon_location = [0.4,0.4,0.4,0,-2.084,0.05],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(15,312)->
    #transformspellCfg {
    lv = 15,
    career = 312,
    cardPoint = 270,
    exp = 969,
    skill = [14085],
    fakeskill = [22174],
    start_level = 13,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(16,101)->
    #transformspellCfg {
    lv = 16,
    career = 101,
    cardPoint = 300,
    exp = 1046,
    skill = [14026],
    fakeskill = [22115],
    start_level = 13,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(16,111)->
    #transformspellCfg {
    lv = 16,
    career = 111,
    cardPoint = 300,
    exp = 1046,
    skill = [14126],
    fakeskill = [22205],
    start_level = 13,
    weapon = "equip_weapon/sabre_70",
    weapon_ex = "equip_weapon/sword_shield_70",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(16,112)->
    #transformspellCfg {
    lv = 16,
    career = 112,
    cardPoint = 300,
    exp = 1046,
    skill = [14026],
    fakeskill = [22115],
    start_level = 13,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(16,201)->
    #transformspellCfg {
    lv = 16,
    career = 201,
    cardPoint = 300,
    exp = 1046,
    skill = [14056],
    fakeskill = [22145],
    start_level = 13,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(16,211)->
    #transformspellCfg {
    lv = 16,
    career = 211,
    cardPoint = 300,
    exp = 1046,
    skill = [14056],
    fakeskill = [22145],
    start_level = 13,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(16,212)->
    #transformspellCfg {
    lv = 16,
    career = 212,
    cardPoint = 300,
    exp = 1046,
    skill = [14156],
    fakeskill = [22235],
    start_level = 13,
    weapon = "equip_weapon/wand_70",
    weapon_ex = "equip_weapon/wand_70_1",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(16,301)->
    #transformspellCfg {
    lv = 16,
    career = 301,
    cardPoint = 300,
    exp = 1046,
    skill = [14086],
    fakeskill = [22175],
    start_level = 13,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(16,311)->
    #transformspellCfg {
    lv = 16,
    career = 311,
    cardPoint = 300,
    exp = 1046,
    skill = [14186],
    fakeskill = [22265],
    start_level = 13,
    weapon = "equip_weapon/bow_70",
    weapon_location = [0.4,0.4,0.4,0,-2.084,0.05],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(16,312)->
    #transformspellCfg {
    lv = 16,
    career = 312,
    cardPoint = 300,
    exp = 1046,
    skill = [14086],
    fakeskill = [22175],
    start_level = 13,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(17,101)->
    #transformspellCfg {
    lv = 17,
    career = 101,
    cardPoint = 330,
    exp = 1123,
    skill = [14027],
    fakeskill = [22116],
    start_level = 17,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(17,111)->
    #transformspellCfg {
    lv = 17,
    career = 111,
    cardPoint = 330,
    exp = 1123,
    skill = [14127],
    fakeskill = [22206],
    start_level = 17,
    weapon = "equip_weapon/sabre_70",
    weapon_ex = "equip_weapon/sword_shield_70",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(17,112)->
    #transformspellCfg {
    lv = 17,
    career = 112,
    cardPoint = 330,
    exp = 1123,
    skill = [14027],
    fakeskill = [22116],
    start_level = 17,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(17,201)->
    #transformspellCfg {
    lv = 17,
    career = 201,
    cardPoint = 330,
    exp = 1123,
    skill = [14057],
    fakeskill = [22146],
    start_level = 17,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(17,211)->
    #transformspellCfg {
    lv = 17,
    career = 211,
    cardPoint = 330,
    exp = 1123,
    skill = [14057],
    fakeskill = [22146],
    start_level = 17,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(17,212)->
    #transformspellCfg {
    lv = 17,
    career = 212,
    cardPoint = 330,
    exp = 1123,
    skill = [14157],
    fakeskill = [22236],
    start_level = 17,
    weapon = "equip_weapon/wand_70",
    weapon_ex = "equip_weapon/wand_70_1",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(17,301)->
    #transformspellCfg {
    lv = 17,
    career = 301,
    cardPoint = 330,
    exp = 1123,
    skill = [14087],
    fakeskill = [22176],
    start_level = 17,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(17,311)->
    #transformspellCfg {
    lv = 17,
    career = 311,
    cardPoint = 330,
    exp = 1123,
    skill = [14187],
    fakeskill = [22266],
    start_level = 17,
    weapon = "equip_weapon/bow_70",
    weapon_location = [0.4,0.4,0.4,0,-2.084,0.05],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(17,312)->
    #transformspellCfg {
    lv = 17,
    career = 312,
    cardPoint = 330,
    exp = 1123,
    skill = [14087],
    fakeskill = [22176],
    start_level = 17,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(18,101)->
    #transformspellCfg {
    lv = 18,
    career = 101,
    cardPoint = 360,
    exp = 1200,
    skill = [14028],
    fakeskill = [22117],
    start_level = 17,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(18,111)->
    #transformspellCfg {
    lv = 18,
    career = 111,
    cardPoint = 360,
    exp = 1200,
    skill = [14128],
    fakeskill = [22207],
    start_level = 17,
    weapon = "equip_weapon/sabre_70",
    weapon_ex = "equip_weapon/sword_shield_70",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(18,112)->
    #transformspellCfg {
    lv = 18,
    career = 112,
    cardPoint = 360,
    exp = 1200,
    skill = [14028],
    fakeskill = [22117],
    start_level = 17,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(18,201)->
    #transformspellCfg {
    lv = 18,
    career = 201,
    cardPoint = 360,
    exp = 1200,
    skill = [14058],
    fakeskill = [22147],
    start_level = 17,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(18,211)->
    #transformspellCfg {
    lv = 18,
    career = 211,
    cardPoint = 360,
    exp = 1200,
    skill = [14058],
    fakeskill = [22147],
    start_level = 17,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(18,212)->
    #transformspellCfg {
    lv = 18,
    career = 212,
    cardPoint = 360,
    exp = 1200,
    skill = [14158],
    fakeskill = [22237],
    start_level = 17,
    weapon = "equip_weapon/wand_70",
    weapon_ex = "equip_weapon/wand_70_1",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(18,301)->
    #transformspellCfg {
    lv = 18,
    career = 301,
    cardPoint = 360,
    exp = 1200,
    skill = [14088],
    fakeskill = [22177],
    start_level = 17,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(18,311)->
    #transformspellCfg {
    lv = 18,
    career = 311,
    cardPoint = 360,
    exp = 1200,
    skill = [14188],
    fakeskill = [22267],
    start_level = 17,
    weapon = "equip_weapon/bow_70",
    weapon_location = [0.4,0.4,0.4,0,-2.084,0.05],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(18,312)->
    #transformspellCfg {
    lv = 18,
    career = 312,
    cardPoint = 360,
    exp = 1200,
    skill = [14088],
    fakeskill = [22177],
    start_level = 17,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(19,101)->
    #transformspellCfg {
    lv = 19,
    career = 101,
    cardPoint = 390,
    exp = 1277,
    skill = [14029],
    fakeskill = [22118],
    start_level = 17,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(19,111)->
    #transformspellCfg {
    lv = 19,
    career = 111,
    cardPoint = 390,
    exp = 1277,
    skill = [14129],
    fakeskill = [22208],
    start_level = 17,
    weapon = "equip_weapon/sabre_70",
    weapon_ex = "equip_weapon/sword_shield_70",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(19,112)->
    #transformspellCfg {
    lv = 19,
    career = 112,
    cardPoint = 390,
    exp = 1277,
    skill = [14029],
    fakeskill = [22118],
    start_level = 17,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(19,201)->
    #transformspellCfg {
    lv = 19,
    career = 201,
    cardPoint = 390,
    exp = 1277,
    skill = [14059],
    fakeskill = [22148],
    start_level = 17,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(19,211)->
    #transformspellCfg {
    lv = 19,
    career = 211,
    cardPoint = 390,
    exp = 1277,
    skill = [14059],
    fakeskill = [22148],
    start_level = 17,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(19,212)->
    #transformspellCfg {
    lv = 19,
    career = 212,
    cardPoint = 390,
    exp = 1277,
    skill = [14159],
    fakeskill = [22238],
    start_level = 17,
    weapon = "equip_weapon/wand_70",
    weapon_ex = "equip_weapon/wand_70_1",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(19,301)->
    #transformspellCfg {
    lv = 19,
    career = 301,
    cardPoint = 390,
    exp = 1277,
    skill = [14089],
    fakeskill = [22178],
    start_level = 17,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(19,311)->
    #transformspellCfg {
    lv = 19,
    career = 311,
    cardPoint = 390,
    exp = 1277,
    skill = [14189],
    fakeskill = [22268],
    start_level = 17,
    weapon = "equip_weapon/bow_70",
    weapon_location = [0.4,0.4,0.4,0,-2.084,0.05],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(19,312)->
    #transformspellCfg {
    lv = 19,
    career = 312,
    cardPoint = 390,
    exp = 1277,
    skill = [14089],
    fakeskill = [22178],
    start_level = 17,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(20,101)->
    #transformspellCfg {
    lv = 20,
    career = 101,
    cardPoint = 420,
    exp = 1355,
    skill = [14030],
    fakeskill = [22119],
    start_level = 17,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(20,111)->
    #transformspellCfg {
    lv = 20,
    career = 111,
    cardPoint = 420,
    exp = 1355,
    skill = [14130],
    fakeskill = [22209],
    start_level = 17,
    weapon = "equip_weapon/sabre_70",
    weapon_ex = "equip_weapon/sword_shield_70",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(20,112)->
    #transformspellCfg {
    lv = 20,
    career = 112,
    cardPoint = 420,
    exp = 1355,
    skill = [14030],
    fakeskill = [22119],
    start_level = 17,
    weapon = "weapon/w_1005",
    weapon_location = [0.23,0.23,0.23,0.05,-2.084,-0.35],
    weapon_vfx = "weapon/vfx_23_5"
    };
getRow(20,201)->
    #transformspellCfg {
    lv = 20,
    career = 201,
    cardPoint = 420,
    exp = 1355,
    skill = [14060],
    fakeskill = [22149],
    start_level = 17,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(20,211)->
    #transformspellCfg {
    lv = 20,
    career = 211,
    cardPoint = 420,
    exp = 1355,
    skill = [14060],
    fakeskill = [22149],
    start_level = 17,
    weapon = "weapon/w_2005",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(20,212)->
    #transformspellCfg {
    lv = 20,
    career = 212,
    cardPoint = 420,
    exp = 1355,
    skill = [14160],
    fakeskill = [22239],
    start_level = 17,
    weapon = "equip_weapon/wand_70",
    weapon_ex = "equip_weapon/wand_70_1",
    weapon_location = [0.2,0.2,0.2,-0.02,-2.084,-0.15],
    weapon_vfx = "weapon/vfx_23_10"
    };
getRow(20,301)->
    #transformspellCfg {
    lv = 20,
    career = 301,
    cardPoint = 420,
    exp = 1355,
    skill = [14090],
    fakeskill = [22179],
    start_level = 17,
    weapon = "weapon/w_3005",
    weapon_ex = "weapon/w_3005",
    weapon_location = [0.4,0.4,0.4,0,-2.084,-0.13],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(20,311)->
    #transformspellCfg {
    lv = 20,
    career = 311,
    cardPoint = 420,
    exp = 1355,
    skill = [14190],
    fakeskill = [22269],
    start_level = 17,
    weapon = "equip_weapon/bow_70",
    weapon_location = [0.4,0.4,0.4,0,-2.084,0.05],
    weapon_vfx = "weapon/vfx_23_30"
    };
getRow(20,312)->
    #transformspellCfg {
    lv = 20,
    career = 312,
    cardPoint = 420,
    exp = 1355,
    skill = [14090],
    fakeskill = [22179],
    start_level = 17,
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
    {1,312},
    {2,101},
    {2,111},
    {2,112},
    {2,201},
    {2,211},
    {2,212},
    {2,301},
    {2,311},
    {2,312},
    {3,101},
    {3,111},
    {3,112},
    {3,201},
    {3,211},
    {3,212},
    {3,301},
    {3,311},
    {3,312},
    {4,101},
    {4,111},
    {4,112},
    {4,201},
    {4,211},
    {4,212},
    {4,301},
    {4,311},
    {4,312},
    {5,101},
    {5,111},
    {5,112},
    {5,201},
    {5,211},
    {5,212},
    {5,301},
    {5,311},
    {5,312},
    {6,101},
    {6,111},
    {6,112},
    {6,201},
    {6,211},
    {6,212},
    {6,301},
    {6,311},
    {6,312},
    {7,101},
    {7,111},
    {7,112},
    {7,201},
    {7,211},
    {7,212},
    {7,301},
    {7,311},
    {7,312},
    {8,101},
    {8,111},
    {8,112},
    {8,201},
    {8,211},
    {8,212},
    {8,301},
    {8,311},
    {8,312},
    {9,101},
    {9,111},
    {9,112},
    {9,201},
    {9,211},
    {9,212},
    {9,301},
    {9,311},
    {9,312},
    {10,101},
    {10,111},
    {10,112},
    {10,201},
    {10,211},
    {10,212},
    {10,301},
    {10,311},
    {10,312},
    {11,101},
    {11,111},
    {11,112},
    {11,201},
    {11,211},
    {11,212},
    {11,301},
    {11,311},
    {11,312},
    {12,101},
    {12,111},
    {12,112},
    {12,201},
    {12,211},
    {12,212},
    {12,301},
    {12,311},
    {12,312},
    {13,101},
    {13,111},
    {13,112},
    {13,201},
    {13,211},
    {13,212},
    {13,301},
    {13,311},
    {13,312},
    {14,101},
    {14,111},
    {14,112},
    {14,201},
    {14,211},
    {14,212},
    {14,301},
    {14,311},
    {14,312},
    {15,101},
    {15,111},
    {15,112},
    {15,201},
    {15,211},
    {15,212},
    {15,301},
    {15,311},
    {15,312},
    {16,101},
    {16,111},
    {16,112},
    {16,201},
    {16,211},
    {16,212},
    {16,301},
    {16,311},
    {16,312},
    {17,101},
    {17,111},
    {17,112},
    {17,201},
    {17,211},
    {17,212},
    {17,301},
    {17,311},
    {17,312},
    {18,101},
    {18,111},
    {18,112},
    {18,201},
    {18,211},
    {18,212},
    {18,301},
    {18,311},
    {18,312},
    {19,101},
    {19,111},
    {19,112},
    {19,201},
    {19,211},
    {19,212},
    {19,301},
    {19,311},
    {19,312},
    {20,101},
    {20,111},
    {20,112},
    {20,201},
    {20,211},
    {20,212},
    {20,301},
    {20,311},
    {20,312}
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
    19,
    20
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
get2KeyList(2)->[
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
get2KeyList(3)->[
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
get2KeyList(4)->[
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
get2KeyList(5)->[
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
get2KeyList(6)->[
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
get2KeyList(7)->[
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
get2KeyList(8)->[
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
get2KeyList(9)->[
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
get2KeyList(10)->[
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
get2KeyList(11)->[
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
get2KeyList(12)->[
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
get2KeyList(13)->[
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
get2KeyList(14)->[
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
get2KeyList(15)->[
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
get2KeyList(16)->[
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
get2KeyList(17)->[
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
get2KeyList(18)->[
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
get2KeyList(19)->[
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
get2KeyList(20)->[
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

