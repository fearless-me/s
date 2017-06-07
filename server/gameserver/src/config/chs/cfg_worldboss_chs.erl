%% coding: latin-1
%%: 实现
-module(cfg_worldboss_chs).
-compile(export_all).
-include("cfg_worldboss.hrl").
-include("logger.hrl").

getRow(bossaward_normal)->
    #worldbossCfg {
    id = 5,
    settype = bossaward_normal,
    setpara = [1704]
    };
getRow(bossaward_sp)->
    #worldbossCfg {
    id = 6,
    settype = bossaward_sp,
    setpara = [1705]
    };
getRow(bossaward1)->
    #worldbossCfg {
    id = 2,
    settype = bossaward1,
    setpara = [1701]
    };
getRow(bossaward2)->
    #worldbossCfg {
    id = 3,
    settype = bossaward2,
    setpara = [1702]
    };
getRow(bossaward3)->
    #worldbossCfg {
    id = 4,
    settype = bossaward3,
    setpara = [1703]
    };
getRow(worldboss_buyattack)->
    #worldbossCfg {
    id = 7,
    settype = worldboss_buyattack,
    setpara = [{100,10000,5},{103,50,5}]
    };
getRow(worldboss_list)->
    #worldbossCfg {
    id = 1,
    settype = worldboss_list,
    setpara = [{722,79,94}]
    };
getRow(_)->[].

getKeyList()->[
    {bossaward_normal},
    {bossaward_sp},
    {bossaward1},
    {bossaward2},
    {bossaward3},
    {worldboss_buyattack},
    {worldboss_list}
    ].

get1KeyList()->[
    bossaward_normal,
    bossaward_sp,
    bossaward1,
    bossaward2,
    bossaward3,
    worldboss_buyattack,
    worldboss_list
    ].

