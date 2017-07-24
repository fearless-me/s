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
    setpara = [{722,1704},{723,604}]
    };
getRow(bossaward_sp)->
    #worldbossCfg {
    id = 6,
    settype = bossaward_sp,
    setpara = [{722,1705},{723,605}]
    };
getRow(bossaward1)->
    #worldbossCfg {
    id = 2,
    settype = bossaward1,
    setpara = [{722,1701},{723,601}]
    };
getRow(bossaward2)->
    #worldbossCfg {
    id = 3,
    settype = bossaward2,
    setpara = [{722,1702},{723,602}]
    };
getRow(bossaward3)->
    #worldbossCfg {
    id = 4,
    settype = bossaward3,
    setpara = [{722,1703},{723,603}]
    };
getRow(worldboss_buyattack)->
    #worldbossCfg {
    id = 7,
    settype = worldboss_buyattack,
    setpara = [{100,10000,5},{103,20,5}]
    };
getRow(worldboss_list)->
    #worldbossCfg {
    id = 1,
    settype = worldboss_list,
    setpara = [{722,324,320}]
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

