%% coding: latin-1
%%: 实现
-module(cfg_camera_setting_chs).
-compile(export_all).
-include("cfg_camera_setting.hrl").
-include("logger.hrl").

getRow(1)->
    #camera_settingCfg {
    type = 1,
    distance = [25,-1,-1],
    angle = [35,-1,-1],
    lens_following_sensitivity = [0.015,-1,-1]
    };
getRow(2)->
    #camera_settingCfg {
    type = 2,
    distance = [20,35,4],
    angle = [20,90,10],
    lens_following_sensitivity = [0.018,0.025,0.01],
    operation_sensitivity = [0.15,0.2,0.1]
    };
getRow(3)->
    #camera_settingCfg {
    type = 3,
    distance = [20,35,4],
    angle = [20,90,10],
    lens_following_sensitivity = [0.018,0.025,0.01],
    operation_sensitivity = [0.15,0.2,0.1]
    };
getRow(4)->
    #camera_settingCfg {
    type = 5,
    distance = [30,-1,-1],
    angle = [70,-1,-1]
    };
getRow(5)->
    #camera_settingCfg {
    type = 6,
    distance = [50,-1,-1],
    angle = [60,-1,-1]
    };
getRow(6)->
    #camera_settingCfg {
    type = 7,
    distance = [50,-1,-1],
    angle = [60,-1,-1]
    };
getRow(7)->
    #camera_settingCfg {
    type = 8,
    distance = [35,-1,-1],
    angle = [60,-1,-1]
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {7}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ].

