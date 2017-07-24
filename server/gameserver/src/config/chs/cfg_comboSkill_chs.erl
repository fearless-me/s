%% coding: latin-1
%%: 实现
-module(cfg_comboSkill_chs).
-compile(export_all).
-include("cfg_comboSkill.hrl").
-include("logger.hrl").

getRow(101)->
    #comboSkillCfg {
    iD = 101,
    skills = [101000,101001,101002,101013]
    };
getRow(102)->
    #comboSkillCfg {
    iD = 102,
    skills = [201000,201002,201007]
    };
getRow(103)->
    #comboSkillCfg {
    iD = 103,
    skills = [301000,301001,301002,301007]
    };
getRow(104)->
    #comboSkillCfg {
    iD = 104,
    skills = [111000,111001,111002,111009]
    };
getRow(105)->
    #comboSkillCfg {
    iD = 105,
    skills = [112000,112001,112002,112009]
    };
getRow(106)->
    #comboSkillCfg {
    iD = 106,
    skills = [211000,211001,211002]
    };
getRow(107)->
    #comboSkillCfg {
    iD = 107,
    skills = [212000,212001,212002]
    };
getRow(108)->
    #comboSkillCfg {
    iD = 108,
    skills = [311000,311001,311002]
    };
getRow(109)->
    #comboSkillCfg {
    iD = 109,
    skills = [312000,312001,312002,312009]
    };
getRow(111)->
    #comboSkillCfg {
    iD = 111,
    skills = [101010,101011,101012,101014]
    };
getRow(112)->
    #comboSkillCfg {
    iD = 112,
    skills = [201010,201011,201012]
    };
getRow(113)->
    #comboSkillCfg {
    iD = 113,
    skills = [301010,301011,301012]
    };
getRow(114)->
    #comboSkillCfg {
    iD = 114,
    skills = [111010,111011,111012,111013]
    };
getRow(115)->
    #comboSkillCfg {
    iD = 115,
    skills = [112010,112011,112012,112013]
    };
getRow(116)->
    #comboSkillCfg {
    iD = 116,
    skills = [211010,211011,211012]
    };
getRow(117)->
    #comboSkillCfg {
    iD = 117,
    skills = [212010,212011,212012]
    };
getRow(118)->
    #comboSkillCfg {
    iD = 118,
    skills = [311010,311011,311012]
    };
getRow(119)->
    #comboSkillCfg {
    iD = 119,
    skills = [312010,312011,312012,312013]
    };
getRow(120)->
    #comboSkillCfg {
    iD = 120,
    skills = [121000,121001,121002]
    };
getRow(121)->
    #comboSkillCfg {
    iD = 121,
    skills = [122000,122001,122002]
    };
getRow(122)->
    #comboSkillCfg {
    iD = 122,
    skills = [123000,123001,123002]
    };
getRow(123)->
    #comboSkillCfg {
    iD = 123,
    skills = [221000,221001,221002]
    };
getRow(124)->
    #comboSkillCfg {
    iD = 124,
    skills = [222000,222001,222002]
    };
getRow(125)->
    #comboSkillCfg {
    iD = 125,
    skills = [223000,223001,223002]
    };
getRow(126)->
    #comboSkillCfg {
    iD = 126,
    skills = [321000,321001,321002]
    };
getRow(127)->
    #comboSkillCfg {
    iD = 127,
    skills = [322000,322001,322002]
    };
getRow(128)->
    #comboSkillCfg {
    iD = 128,
    skills = [323000,323001,323002]
    };
getRow(_)->[].

getKeyList()->[
    {101},
    {102},
    {103},
    {104},
    {105},
    {106},
    {107},
    {108},
    {109},
    {111},
    {112},
    {113},
    {114},
    {115},
    {116},
    {117},
    {118},
    {119},
    {120},
    {121},
    {122},
    {123},
    {124},
    {125},
    {126},
    {127},
    {128}
    ].

get1KeyList()->[
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119,
    120,
    121,
    122,
    123,
    124,
    125,
    126,
    127,
    128
    ].

