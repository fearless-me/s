%% coding: latin-1
%%: 实现
-module(cfg_petfightForce_chs).
-compile(export_all).
-include("cfg_petfightForce.hrl").
-include("logger.hrl").

getRow(1)->
    #petfightForceCfg {
    id = 1,
    hp = 0.23,
    prop_physicaldamage = 3,
    prop_MagicAttack = 0,
    prop_physicaldefence = 0.71,
    prop_MagicDefence = 0.71,
    prop_critical = 0,
    prop_criticalimmunity = 0,
    prop_CriticalDamageLevel = 0,
    prop_TenaciousLevel = 0,
    prop_hitratio = 0,
    prop_dodge = 0,
    prop_ArmorPenetrationLevel = 0,
    prop_firm = 0,
    prop_DgeAdd1 = 0,
    prop_DgeAdd2 = 0,
    prop_dgeCut = 0,
    prop_CD = 0
    };
getRow(2)->
    #petfightForceCfg {
    id = 2,
    hp = 0.23,
    prop_physicaldamage = 3,
    prop_MagicAttack = 0,
    prop_physicaldefence = 0.71,
    prop_MagicDefence = 0.71,
    prop_critical = 0,
    prop_criticalimmunity = 0,
    prop_CriticalDamageLevel = 0,
    prop_TenaciousLevel = 0,
    prop_hitratio = 0,
    prop_dodge = 0,
    prop_ArmorPenetrationLevel = 0,
    prop_firm = 0,
    prop_DgeAdd1 = 0,
    prop_DgeAdd2 = 0,
    prop_dgeCut = 0,
    prop_CD = 0
    };
getRow(3)->
    #petfightForceCfg {
    id = 3,
    hp = 0.23,
    prop_physicaldamage = 3,
    prop_MagicAttack = 0,
    prop_physicaldefence = 0.71,
    prop_MagicDefence = 0.71,
    prop_critical = 0,
    prop_criticalimmunity = 0,
    prop_CriticalDamageLevel = 0,
    prop_TenaciousLevel = 0,
    prop_hitratio = 0,
    prop_dodge = 0,
    prop_ArmorPenetrationLevel = 0,
    prop_firm = 0,
    prop_DgeAdd1 = 0,
    prop_DgeAdd2 = 0,
    prop_dgeCut = 0,
    prop_CD = 0
    };
getRow(4)->
    #petfightForceCfg {
    id = 4,
    hp = 0.23,
    prop_physicaldamage = 3,
    prop_MagicAttack = 0,
    prop_physicaldefence = 0.71,
    prop_MagicDefence = 0.71,
    prop_critical = 0,
    prop_criticalimmunity = 0,
    prop_CriticalDamageLevel = 0,
    prop_TenaciousLevel = 0,
    prop_hitratio = 0,
    prop_dodge = 0,
    prop_ArmorPenetrationLevel = 0,
    prop_firm = 0,
    prop_DgeAdd1 = 0,
    prop_DgeAdd2 = 0,
    prop_dgeCut = 0,
    prop_CD = 0
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4
    ].

