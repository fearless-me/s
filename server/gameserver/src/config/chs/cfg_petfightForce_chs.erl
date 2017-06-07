%% coding: latin-1
%%: 实现
-module(cfg_petfightForce_chs).
-compile(export_all).
-include("cfg_petfightForce.hrl").
-include("logger.hrl").

getRow(1)->
    #petfightForceCfg {
    id = 1,
    hp = 0.0454545454545455,
    prop_physicaldamage = 1,
    prop_MagicAttack = 1,
    prop_physicaldefence = 1,
    prop_MagicDefence = 1,
    prop_hitratio = 1,
    prop_critical = 1,
    prop_CriticalDamageLevel = 0,
    prop_ArmorPenetrationLevel = 0,
    prop_dodge = 0,
    prop_criticalimmunity = 0,
    prop_TenaciousLevel = 0
    };
getRow(2)->
    #petfightForceCfg {
    id = 2,
    hp = 0.0454545454545455,
    prop_physicaldamage = 1,
    prop_MagicAttack = 1,
    prop_physicaldefence = 1,
    prop_MagicDefence = 1,
    prop_hitratio = 1,
    prop_critical = 1,
    prop_CriticalDamageLevel = 0,
    prop_ArmorPenetrationLevel = 0,
    prop_dodge = 0,
    prop_criticalimmunity = 0,
    prop_TenaciousLevel = 0
    };
getRow(3)->
    #petfightForceCfg {
    id = 3,
    hp = 0.0454545454545455,
    prop_physicaldamage = 1,
    prop_MagicAttack = 1,
    prop_physicaldefence = 1,
    prop_MagicDefence = 1,
    prop_hitratio = 1,
    prop_critical = 1,
    prop_CriticalDamageLevel = 0,
    prop_ArmorPenetrationLevel = 0,
    prop_dodge = 0,
    prop_criticalimmunity = 0,
    prop_TenaciousLevel = 0
    };
getRow(4)->
    #petfightForceCfg {
    id = 4,
    hp = 0.0454545454545455,
    prop_physicaldamage = 1.2,
    prop_MagicAttack = 1.2,
    prop_physicaldefence = 1.2,
    prop_MagicDefence = 1.2,
    prop_hitratio = 1,
    prop_critical = 1,
    prop_CriticalDamageLevel = 0,
    prop_ArmorPenetrationLevel = 0,
    prop_dodge = 0,
    prop_criticalimmunity = 0,
    prop_TenaciousLevel = 0
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

