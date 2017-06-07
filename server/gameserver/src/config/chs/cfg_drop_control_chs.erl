%% coding: latin-1
%%: 实现
-module(cfg_drop_control_chs).
-compile(export_all).
-include("cfg_drop_control.hrl").
-include("logger.hrl").

getRow(1)->
    #drop_controlCfg {
    dropid = 1,
    trigger_cycle = 1,
    server_limits = 0,
    personal_limits = 10,
    drop_cd = 0
    };
getRow(2)->
    #drop_controlCfg {
    dropid = 2,
    trigger_cycle = 1,
    server_limits = 10,
    personal_limits = 5,
    drop_cd = 0
    };
getRow(3)->
    #drop_controlCfg {
    dropid = 3,
    trigger_cycle = 2,
    server_limits = 0,
    personal_limits = 10,
    drop_cd = 0
    };
getRow(4)->
    #drop_controlCfg {
    dropid = 4,
    trigger_cycle = 2,
    server_limits = 10,
    personal_limits = 5,
    drop_cd = 0
    };
getRow(5)->
    #drop_controlCfg {
    dropid = 5,
    trigger_cycle = 3,
    server_limits = 0,
    personal_limits = 10,
    drop_cd = 0
    };
getRow(6)->
    #drop_controlCfg {
    dropid = 6,
    trigger_cycle = 3,
    server_limits = 10,
    personal_limits = 5,
    drop_cd = 0
    };
getRow(3200)->
    #drop_controlCfg {
    dropid = 3200,
    trigger_cycle = 1,
    server_limits = 0,
    personal_limits = 24,
    drop_cd = 0
    };
getRow(3500)->
    #drop_controlCfg {
    dropid = 3500,
    trigger_cycle = 1,
    server_limits = 15,
    personal_limits = 10,
    drop_cd = 3600
    };
getRow(4400)->
    #drop_controlCfg {
    dropid = 4400,
    trigger_cycle = 1,
    server_limits = 10,
    personal_limits = 1,
    drop_cd = 3600
    };
getRow(4401)->
    #drop_controlCfg {
    dropid = 4401,
    trigger_cycle = 1,
    server_limits = 10,
    personal_limits = 1,
    drop_cd = 3600
    };
getRow(4410)->
    #drop_controlCfg {
    dropid = 4410,
    trigger_cycle = 1,
    server_limits = 10,
    personal_limits = 1,
    drop_cd = 3600
    };
getRow(4411)->
    #drop_controlCfg {
    dropid = 4411,
    trigger_cycle = 1,
    server_limits = 10,
    personal_limits = 1,
    drop_cd = 3600
    };
getRow(4420)->
    #drop_controlCfg {
    dropid = 4420,
    trigger_cycle = 1,
    server_limits = 10,
    personal_limits = 1,
    drop_cd = 3600
    };
getRow(4421)->
    #drop_controlCfg {
    dropid = 4421,
    trigger_cycle = 1,
    server_limits = 10,
    personal_limits = 1,
    drop_cd = 3600
    };
getRow(4430)->
    #drop_controlCfg {
    dropid = 4430,
    trigger_cycle = 1,
    server_limits = 10,
    personal_limits = 1,
    drop_cd = 3600
    };
getRow(4431)->
    #drop_controlCfg {
    dropid = 4431,
    trigger_cycle = 1,
    server_limits = 10,
    personal_limits = 1,
    drop_cd = 3600
    };
getRow(4440)->
    #drop_controlCfg {
    dropid = 4440,
    trigger_cycle = 1,
    server_limits = 10,
    personal_limits = 1,
    drop_cd = 3600
    };
getRow(4441)->
    #drop_controlCfg {
    dropid = 4441,
    trigger_cycle = 1,
    server_limits = 10,
    personal_limits = 1,
    drop_cd = 3600
    };
getRow(4500)->
    #drop_controlCfg {
    dropid = 4500,
    trigger_cycle = 1,
    server_limits = 10,
    personal_limits = 1,
    drop_cd = 3600
    };
getRow(4501)->
    #drop_controlCfg {
    dropid = 4501,
    trigger_cycle = 1,
    server_limits = 10,
    personal_limits = 1,
    drop_cd = 3600
    };
getRow(4510)->
    #drop_controlCfg {
    dropid = 4510,
    trigger_cycle = 1,
    server_limits = 10,
    personal_limits = 1,
    drop_cd = 3600
    };
getRow(4511)->
    #drop_controlCfg {
    dropid = 4511,
    trigger_cycle = 1,
    server_limits = 10,
    personal_limits = 1,
    drop_cd = 3600
    };
getRow(4520)->
    #drop_controlCfg {
    dropid = 4520,
    trigger_cycle = 1,
    server_limits = 10,
    personal_limits = 1,
    drop_cd = 3600
    };
getRow(4521)->
    #drop_controlCfg {
    dropid = 4521,
    trigger_cycle = 1,
    server_limits = 10,
    personal_limits = 1,
    drop_cd = 3600
    };
getRow(4530)->
    #drop_controlCfg {
    dropid = 4530,
    trigger_cycle = 1,
    server_limits = 10,
    personal_limits = 1,
    drop_cd = 3600
    };
getRow(4531)->
    #drop_controlCfg {
    dropid = 4531,
    trigger_cycle = 1,
    server_limits = 10,
    personal_limits = 1,
    drop_cd = 3600
    };
getRow(4540)->
    #drop_controlCfg {
    dropid = 4540,
    trigger_cycle = 1,
    server_limits = 10,
    personal_limits = 1,
    drop_cd = 3600
    };
getRow(4541)->
    #drop_controlCfg {
    dropid = 4541,
    trigger_cycle = 1,
    server_limits = 10,
    personal_limits = 1,
    drop_cd = 3600
    };
getRow(11000)->
    #drop_controlCfg {
    dropid = 11000,
    trigger_cycle = 1,
    server_limits = 10,
    personal_limits = 1,
    drop_cd = 3600
    };
getRow(11010)->
    #drop_controlCfg {
    dropid = 11010,
    trigger_cycle = 1,
    server_limits = 10,
    personal_limits = 1,
    drop_cd = 3600
    };
getRow(19999)->
    #drop_controlCfg {
    dropid = 19999,
    trigger_cycle = 1,
    server_limits = 0,
    personal_limits = 100,
    drop_cd = 10
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5},
    {6},
    {3200},
    {3500},
    {4400},
    {4401},
    {4410},
    {4411},
    {4420},
    {4421},
    {4430},
    {4431},
    {4440},
    {4441},
    {4500},
    {4501},
    {4510},
    {4511},
    {4520},
    {4521},
    {4530},
    {4531},
    {4540},
    {4541},
    {11000},
    {11010},
    {19999}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    3200,
    3500,
    4400,
    4401,
    4410,
    4411,
    4420,
    4421,
    4430,
    4431,
    4440,
    4441,
    4500,
    4501,
    4510,
    4511,
    4520,
    4521,
    4530,
    4531,
    4540,
    4541,
    11000,
    11010,
    19999
    ].

