%%: 实现
-module(cfg_wedding_type_flower_chs).
-compile(export_all).
-include("cfg_wedding_type_flower.hrl").
-include("logger.hrl").

getRow(1)->
    #wedding_type_flowerCfg {
    iD = 1,
    vFX_name = "ef_marry10"
    };
getRow(2)->
    #wedding_type_flowerCfg {
    iD = 2,
    vFX_name = "ef_marry09"
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2}
    ].

get1KeyList()->[
    1,
    2
    ].

