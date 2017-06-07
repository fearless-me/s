%% coding: latin-1
%%: 实现
-module(cfg_uiSoundCfg_chs).
-compile(export_all).
-include("cfg_uiSoundCfg.hrl").
-include("logger.hrl").

getRow(1)->
    #uiSoundCfgCfg {
    id = 1,
    sound = "ui_close",
    uiType = "Close"
    };
getRow(2)->
    #uiSoundCfgCfg {
    id = 2,
    uiType = "Skill"
    };
getRow(3)->
    #uiSoundCfgCfg {
    id = 3,
    uiType = "Normal"
    };
getRow(4)->
    #uiSoundCfgCfg {
    id = 4,
    sound = "ui_message",
    uiType = "Help"
    };
getRow(5)->
    #uiSoundCfgCfg {
    id = 5,
    sound = "ui_open",
    uiType = "Open"
    };
getRow(6)->
    #uiSoundCfgCfg {
    id = 6,
    sound = "ui_open",
    uiType = "Change"
    };
getRow(7)->
    #uiSoundCfgCfg {
    id = 7,
    sound = "ui_openbag",
    uiType = "OpenBag"
    };
getRow(8)->
    #uiSoundCfgCfg {
    id = 8,
    sound = "ui_add",
    uiType = "Add"
    };
getRow(9)->
    #uiSoundCfgCfg {
    id = 9,
    sound = "ui_dimix",
    uiType = "Dimax"
    };
getRow(10)->
    #uiSoundCfgCfg {
    id = 10,
    sound = "ui_buy",
    uiType = "Buy"
    };
getRow(11)->
    #uiSoundCfgCfg {
    id = 11,
    sound = "ui_sold",
    uiType = "Sold"
    };
getRow(12)->
    #uiSoundCfgCfg {
    id = 12,
    sound = "ui_diput",
    uiType = "Diput"
    };
getRow(13)->
    #uiSoundCfgCfg {
    id = 13,
    sound = "ui_itemselect",
    uiType = "ItemSelect"
    };
getRow(14)->
    #uiSoundCfgCfg {
    id = 14,
    sound = "ui_normal_click1",
    uiType = "ItemClick1"
    };
getRow(15)->
    #uiSoundCfgCfg {
    id = 15,
    sound = "ui_normal_click2",
    uiType = "ItemClick2"
    };
getRow(16)->
    #uiSoundCfgCfg {
    id = 16,
    sound = "ui_normal_click3",
    uiType = "ItemClick3"
    };
getRow(17)->
    #uiSoundCfgCfg {
    id = 17,
    sound = "ui_normal_click4",
    uiType = "ItemClick4"
    };
getRow(18)->
    #uiSoundCfgCfg {
    id = 18,
    sound = "ui_message",
    uiType = "Message"
    };
getRow(19)->
    #uiSoundCfgCfg {
    id = 19,
    sound = "ui_no",
    uiType = "No"
    };
getRow(20)->
    #uiSoundCfgCfg {
    id = 20,
    sound = "ui_yes",
    uiType = "Yes"
    };
getRow(21)->
    #uiSoundCfgCfg {
    id = 21,
    sound = "ui_changeclass",
    uiType = "changeclass"
    };
getRow(22)->
    #uiSoundCfgCfg {
    id = 22,
    sound = "ui_error",
    uiType = "error"
    };
getRow(23)->
    #uiSoundCfgCfg {
    id = 23,
    sound = "ui_mission_finish",
    uiType = "mission_finish"
    };
getRow(24)->
    #uiSoundCfgCfg {
    id = 24,
    sound = "ui_newmountget",
    uiType = "newmountget"
    };
getRow(25)->
    #uiSoundCfgCfg {
    id = 25,
    sound = "ui_newmountstar",
    uiType = "newmountstar"
    };
getRow(26)->
    #uiSoundCfgCfg {
    id = 26,
    sound = "ui_phase_finish",
    uiType = "phase_finish"
    };
getRow(27)->
    #uiSoundCfgCfg {
    id = 27,
    sound = "card_click",
    uiType = "cark_click"
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
    {19},
    {20},
    {21},
    {22},
    {23},
    {24},
    {25},
    {26},
    {27}
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
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27
    ].

