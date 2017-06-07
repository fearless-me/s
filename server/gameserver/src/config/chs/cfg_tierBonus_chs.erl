%% coding: latin-1
%%: 实现
-module(cfg_tierBonus_chs).
-compile(export_all).
-include("cfg_tierBonus.hrl").
-include("logger.hrl").

getRow(1,2)->
    #tierBonusCfg {
    iD = 1,
    tierBonusID = 1,
    tierName = "圣逗士的天命",
    count = 2,
    propType1 = 25,
    value1 = 10,
    mulityOrPlus1 = 0,
    propType2 = 26,
    value2 = 10,
    mulityOrPlus2 = 0,
    propType3 = 0,
    value3 = 0,
    mulityOrPlus3 = 0,
    propType4 = 0,
    value4 = 0,
    mulityOrPlus4 = 0,
    skill1 = 0,
    skill2 = 0,
    skill3 = 0,
    skill4 = 0
    };
getRow(1,3)->
    #tierBonusCfg {
    iD = 2,
    tierBonusID = 1,
    tierName = "圣逗士的天命",
    count = 3,
    propType1 = 27,
    value1 = 10,
    mulityOrPlus1 = 0,
    propType2 = 28,
    value2 = 10,
    mulityOrPlus2 = 0,
    propType3 = 0,
    value3 = 0,
    mulityOrPlus3 = 0,
    propType4 = 0,
    value4 = 0,
    mulityOrPlus4 = 0,
    skill1 = 0,
    skill2 = 0,
    skill3 = 0,
    skill4 = 0
    };
getRow(_,_)->[].

getKeyList()->[
    {1,2},
    {1,3}
    ].

get1KeyList()->[
    1
    ].

get2KeyList(1)->[
    2,
    3
    ];
get2KeyList(_)->[].

