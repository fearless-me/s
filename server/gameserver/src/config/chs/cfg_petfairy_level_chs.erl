%% coding: latin-1
%%: 实现
-module(cfg_petfairy_level_chs).
-compile(export_all).
-include("cfg_petfairy_level.hrl").
-include("logger.hrl").

getRow(0)->
    #petfairy_levelCfg {
    lv = 0,
    point = 0,
    model_G = 1,
    effects_G = 1,
    modelY = 0,
    bouns = [],
    skill = [],
    skill1 = [{6000,1},{6001,10},{6002,20},{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(1)->
    #petfairy_levelCfg {
    lv = 1,
    point = 10,
    model_G = 1,
    effects_G = 1,
    modelY = 0,
    bouns = [{4,5,0}],
    skill = [6000],
    skill1 = [{6001,10},{6002,20},{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(2)->
    #petfairy_levelCfg {
    lv = 2,
    point = 16,
    model_G = 2,
    effects_G = 1,
    modelY = 0,
    bouns = [{4,8,0}],
    skill = [6000],
    skill1 = [{6001,10},{6002,20},{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(3)->
    #petfairy_levelCfg {
    lv = 3,
    point = 27,
    model_G = 3,
    effects_G = 0.8,
    modelY = -460,
    bouns = [{4,12,0}],
    skill = [6000],
    skill1 = [{6001,10},{6002,20},{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(4)->
    #petfairy_levelCfg {
    lv = 4,
    point = 44,
    model_G = 4,
    effects_G = 0.7,
    modelY = -420,
    bouns = [{4,18,0}],
    skill = [6000],
    skill1 = [{6001,10},{6002,20},{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(5)->
    #petfairy_levelCfg {
    lv = 5,
    point = 68,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,25,0}],
    skill = [6000],
    skill1 = [{6001,10},{6002,20},{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(6)->
    #petfairy_levelCfg {
    lv = 6,
    point = 100,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,34,0}],
    skill = [6000],
    skill1 = [{6001,10},{6002,20},{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(7)->
    #petfairy_levelCfg {
    lv = 7,
    point = 141,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,44,0}],
    skill = [6000],
    skill1 = [{6001,10},{6002,20},{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(8)->
    #petfairy_levelCfg {
    lv = 8,
    point = 192,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,56,0}],
    skill = [6000],
    skill1 = [{6001,10},{6002,20},{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(9)->
    #petfairy_levelCfg {
    lv = 9,
    point = 254,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,69,0}],
    skill = [6000],
    skill1 = [{6001,10},{6002,20},{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(10)->
    #petfairy_levelCfg {
    lv = 10,
    point = 328,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,84,0}],
    skill = [6000,6001],
    skill1 = [{6002,20},{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(11)->
    #petfairy_levelCfg {
    lv = 11,
    point = 415,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,100,0}],
    skill = [6000,6001],
    skill1 = [{6002,20},{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(12)->
    #petfairy_levelCfg {
    lv = 12,
    point = 516,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,118,0}],
    skill = [6000,6001],
    skill1 = [{6002,20},{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(13)->
    #petfairy_levelCfg {
    lv = 13,
    point = 632,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,137,0}],
    skill = [6000,6001],
    skill1 = [{6002,20},{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(14)->
    #petfairy_levelCfg {
    lv = 14,
    point = 764,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,158,0}],
    skill = [6000,6001],
    skill1 = [{6002,20},{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(15)->
    #petfairy_levelCfg {
    lv = 15,
    point = 913,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,180,0}],
    skill = [6000,6001],
    skill1 = [{6002,20},{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(16)->
    #petfairy_levelCfg {
    lv = 16,
    point = 1080,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,204,0}],
    skill = [6000,6001],
    skill1 = [{6002,20},{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(17)->
    #petfairy_levelCfg {
    lv = 17,
    point = 1266,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,229,0}],
    skill = [6000,6001],
    skill1 = [{6002,20},{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(18)->
    #petfairy_levelCfg {
    lv = 18,
    point = 1472,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,256,0}],
    skill = [6000,6001],
    skill1 = [{6002,20},{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(19)->
    #petfairy_levelCfg {
    lv = 19,
    point = 1699,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,284,0}],
    skill = [6000,6001],
    skill1 = [{6002,20},{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(20)->
    #petfairy_levelCfg {
    lv = 20,
    point = 1948,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,314,0}],
    skill = [6000,6001,6002],
    skill1 = [{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(21)->
    #petfairy_levelCfg {
    lv = 21,
    point = 2220,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,345,0}],
    skill = [6000,6001,6002],
    skill1 = [{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(22)->
    #petfairy_levelCfg {
    lv = 22,
    point = 2516,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,378,0}],
    skill = [6000,6001,6002],
    skill1 = [{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(23)->
    #petfairy_levelCfg {
    lv = 23,
    point = 2837,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,412,0}],
    skill = [6000,6001,6002],
    skill1 = [{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(24)->
    #petfairy_levelCfg {
    lv = 24,
    point = 3184,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,448,0}],
    skill = [6000,6001,6002],
    skill1 = [{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(25)->
    #petfairy_levelCfg {
    lv = 25,
    point = 3558,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,485,0}],
    skill = [6000,6001,6002],
    skill1 = [{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(26)->
    #petfairy_levelCfg {
    lv = 26,
    point = 3960,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,524,0}],
    skill = [6000,6001,6002],
    skill1 = [{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(27)->
    #petfairy_levelCfg {
    lv = 27,
    point = 4391,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,564,0}],
    skill = [6000,6001,6002],
    skill1 = [{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(28)->
    #petfairy_levelCfg {
    lv = 28,
    point = 4852,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,606,0}],
    skill = [6000,6001,6002],
    skill1 = [{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(29)->
    #petfairy_levelCfg {
    lv = 29,
    point = 5344,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,649,0}],
    skill = [6000,6001,6002],
    skill1 = [{6003,30},{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(30)->
    #petfairy_levelCfg {
    lv = 30,
    point = 5868,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,694,0}],
    skill = [6000,6001,6002,6003],
    skill1 = [{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(31)->
    #petfairy_levelCfg {
    lv = 31,
    point = 6425,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,740,0}],
    skill = [6000,6001,6002,6003],
    skill1 = [{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(32)->
    #petfairy_levelCfg {
    lv = 32,
    point = 7016,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,788,0}],
    skill = [6000,6001,6002,6003],
    skill1 = [{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(33)->
    #petfairy_levelCfg {
    lv = 33,
    point = 7642,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,837,0}],
    skill = [6000,6001,6002,6003],
    skill1 = [{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(34)->
    #petfairy_levelCfg {
    lv = 34,
    point = 8304,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,888,0}],
    skill = [6000,6001,6002,6003],
    skill1 = [{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(35)->
    #petfairy_levelCfg {
    lv = 35,
    point = 9003,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,940,0}],
    skill = [6000,6001,6002,6003],
    skill1 = [{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(36)->
    #petfairy_levelCfg {
    lv = 36,
    point = 9740,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,994,0}],
    skill = [6000,6001,6002,6003],
    skill1 = [{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(37)->
    #petfairy_levelCfg {
    lv = 37,
    point = 10516,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,1049,0}],
    skill = [6000,6001,6002,6003],
    skill1 = [{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(38)->
    #petfairy_levelCfg {
    lv = 38,
    point = 11332,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,1106,0}],
    skill = [6000,6001,6002,6003],
    skill1 = [{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(39)->
    #petfairy_levelCfg {
    lv = 39,
    point = 12189,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,1164,0}],
    skill = [6000,6001,6002,6003],
    skill1 = [{6004,40},{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(40)->
    #petfairy_levelCfg {
    lv = 40,
    point = 13088,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,1224,0}],
    skill = [6000,6001,6002,6003,6004],
    skill1 = [{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(41)->
    #petfairy_levelCfg {
    lv = 41,
    point = 14030,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,1285,0}],
    skill = [6000,6001,6002,6003,6004],
    skill1 = [{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(42)->
    #petfairy_levelCfg {
    lv = 42,
    point = 15016,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,1348,0}],
    skill = [6000,6001,6002,6003,6004],
    skill1 = [{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(43)->
    #petfairy_levelCfg {
    lv = 43,
    point = 16047,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,1412,0}],
    skill = [6000,6001,6002,6003,6004],
    skill1 = [{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(44)->
    #petfairy_levelCfg {
    lv = 44,
    point = 17124,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,1478,0}],
    skill = [6000,6001,6002,6003,6004],
    skill1 = [{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(45)->
    #petfairy_levelCfg {
    lv = 45,
    point = 18248,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,1545,0}],
    skill = [6000,6001,6002,6003,6004],
    skill1 = [{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(46)->
    #petfairy_levelCfg {
    lv = 46,
    point = 19420,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,1614,0}],
    skill = [6000,6001,6002,6003,6004],
    skill1 = [{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(47)->
    #petfairy_levelCfg {
    lv = 47,
    point = 20641,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,1684,0}],
    skill = [6000,6001,6002,6003,6004],
    skill1 = [{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(48)->
    #petfairy_levelCfg {
    lv = 48,
    point = 21912,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,1756,0}],
    skill = [6000,6001,6002,6003,6004],
    skill1 = [{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(49)->
    #petfairy_levelCfg {
    lv = 49,
    point = 23234,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,1829,0}],
    skill = [6000,6001,6002,6003,6004],
    skill1 = [{6005,50},{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(50)->
    #petfairy_levelCfg {
    lv = 50,
    point = 24608,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,1904,0}],
    skill = [6000,6001,6002,6003,6004,6005],
    skill1 = [{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(51)->
    #petfairy_levelCfg {
    lv = 51,
    point = 26035,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,1980,0}],
    skill = [6000,6001,6002,6003,6004,6005],
    skill1 = [{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(52)->
    #petfairy_levelCfg {
    lv = 52,
    point = 27516,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,2058,0}],
    skill = [6000,6001,6002,6003,6004,6005],
    skill1 = [{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(53)->
    #petfairy_levelCfg {
    lv = 53,
    point = 29052,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,2137,0}],
    skill = [6000,6001,6002,6003,6004,6005],
    skill1 = [{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(54)->
    #petfairy_levelCfg {
    lv = 54,
    point = 30644,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,2218,0}],
    skill = [6000,6001,6002,6003,6004,6005],
    skill1 = [{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(55)->
    #petfairy_levelCfg {
    lv = 55,
    point = 32293,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,2300,0}],
    skill = [6000,6001,6002,6003,6004,6005],
    skill1 = [{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(56)->
    #petfairy_levelCfg {
    lv = 56,
    point = 34000,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,2384,0}],
    skill = [6000,6001,6002,6003,6004,6005],
    skill1 = [{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(57)->
    #petfairy_levelCfg {
    lv = 57,
    point = 35766,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,2469,0}],
    skill = [6000,6001,6002,6003,6004,6005],
    skill1 = [{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(58)->
    #petfairy_levelCfg {
    lv = 58,
    point = 37592,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,2556,0}],
    skill = [6000,6001,6002,6003,6004,6005],
    skill1 = [{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(59)->
    #petfairy_levelCfg {
    lv = 59,
    point = 39479,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,2644,0}],
    skill = [6000,6001,6002,6003,6004,6005],
    skill1 = [{6006,60},{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(60)->
    #petfairy_levelCfg {
    lv = 60,
    point = 41428,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,2734,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006],
    skill1 = [{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(61)->
    #petfairy_levelCfg {
    lv = 61,
    point = 43440,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,2825,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006],
    skill1 = [{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(62)->
    #petfairy_levelCfg {
    lv = 62,
    point = 45516,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,2918,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006],
    skill1 = [{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(63)->
    #petfairy_levelCfg {
    lv = 63,
    point = 47657,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,3012,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006],
    skill1 = [{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(64)->
    #petfairy_levelCfg {
    lv = 64,
    point = 49864,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,3108,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006],
    skill1 = [{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(65)->
    #petfairy_levelCfg {
    lv = 65,
    point = 52138,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,3205,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006],
    skill1 = [{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(66)->
    #petfairy_levelCfg {
    lv = 66,
    point = 54480,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,3304,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006],
    skill1 = [{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(67)->
    #petfairy_levelCfg {
    lv = 67,
    point = 56891,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,3404,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006],
    skill1 = [{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(68)->
    #petfairy_levelCfg {
    lv = 68,
    point = 59372,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,3506,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006],
    skill1 = [{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(69)->
    #petfairy_levelCfg {
    lv = 69,
    point = 61924,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,3609,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006],
    skill1 = [{6007,70},{6008,80},{6009,90},{6010,100}]
    };
getRow(70)->
    #petfairy_levelCfg {
    lv = 70,
    point = 64548,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,3714,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007],
    skill1 = [{6008,80},{6009,90},{6010,100}]
    };
getRow(71)->
    #petfairy_levelCfg {
    lv = 71,
    point = 67245,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,3820,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007],
    skill1 = [{6008,80},{6009,90},{6010,100}]
    };
getRow(72)->
    #petfairy_levelCfg {
    lv = 72,
    point = 70016,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,3928,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007],
    skill1 = [{6008,80},{6009,90},{6010,100}]
    };
getRow(73)->
    #petfairy_levelCfg {
    lv = 73,
    point = 72862,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,4037,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007],
    skill1 = [{6008,80},{6009,90},{6010,100}]
    };
getRow(74)->
    #petfairy_levelCfg {
    lv = 74,
    point = 75784,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,4148,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007],
    skill1 = [{6008,80},{6009,90},{6010,100}]
    };
getRow(75)->
    #petfairy_levelCfg {
    lv = 75,
    point = 78783,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,4260,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007],
    skill1 = [{6008,80},{6009,90},{6010,100}]
    };
getRow(76)->
    #petfairy_levelCfg {
    lv = 76,
    point = 81860,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,4374,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007],
    skill1 = [{6008,80},{6009,90},{6010,100}]
    };
getRow(77)->
    #petfairy_levelCfg {
    lv = 77,
    point = 85016,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,4489,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007],
    skill1 = [{6008,80},{6009,90},{6010,100}]
    };
getRow(78)->
    #petfairy_levelCfg {
    lv = 78,
    point = 88252,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,4606,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007],
    skill1 = [{6008,80},{6009,90},{6010,100}]
    };
getRow(79)->
    #petfairy_levelCfg {
    lv = 79,
    point = 91569,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,4724,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007],
    skill1 = [{6008,80},{6009,90},{6010,100}]
    };
getRow(80)->
    #petfairy_levelCfg {
    lv = 80,
    point = 94968,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,4844,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008],
    skill1 = [{6009,90},{6010,100}]
    };
getRow(81)->
    #petfairy_levelCfg {
    lv = 81,
    point = 98450,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,4965,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008],
    skill1 = [{6009,90},{6010,100}]
    };
getRow(82)->
    #petfairy_levelCfg {
    lv = 82,
    point = 102016,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,5088,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008],
    skill1 = [{6009,90},{6010,100}]
    };
getRow(83)->
    #petfairy_levelCfg {
    lv = 83,
    point = 105667,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,5212,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008],
    skill1 = [{6009,90},{6010,100}]
    };
getRow(84)->
    #petfairy_levelCfg {
    lv = 84,
    point = 109404,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,5338,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008],
    skill1 = [{6009,90},{6010,100}]
    };
getRow(85)->
    #petfairy_levelCfg {
    lv = 85,
    point = 113228,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,5465,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008],
    skill1 = [{6009,90},{6010,100}]
    };
getRow(86)->
    #petfairy_levelCfg {
    lv = 86,
    point = 117140,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,5594,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008],
    skill1 = [{6009,90},{6010,100}]
    };
getRow(87)->
    #petfairy_levelCfg {
    lv = 87,
    point = 121141,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,5724,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008],
    skill1 = [{6009,90},{6010,100}]
    };
getRow(88)->
    #petfairy_levelCfg {
    lv = 88,
    point = 125232,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,5856,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008],
    skill1 = [{6009,90},{6010,100}]
    };
getRow(89)->
    #petfairy_levelCfg {
    lv = 89,
    point = 129414,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,5989,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008],
    skill1 = [{6009,90},{6010,100}]
    };
getRow(90)->
    #petfairy_levelCfg {
    lv = 90,
    point = 133688,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,6124,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008,6009],
    skill1 = [{6010,100}]
    };
getRow(91)->
    #petfairy_levelCfg {
    lv = 91,
    point = 138055,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,6260,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008,6009],
    skill1 = [{6010,100}]
    };
getRow(92)->
    #petfairy_levelCfg {
    lv = 92,
    point = 142516,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,6398,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008,6009],
    skill1 = [{6010,100}]
    };
getRow(93)->
    #petfairy_levelCfg {
    lv = 93,
    point = 147072,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,6537,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008,6009],
    skill1 = [{6010,100}]
    };
getRow(94)->
    #petfairy_levelCfg {
    lv = 94,
    point = 151724,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,6678,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008,6009],
    skill1 = [{6010,100}]
    };
getRow(95)->
    #petfairy_levelCfg {
    lv = 95,
    point = 156473,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,6820,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008,6009],
    skill1 = [{6010,100}]
    };
getRow(96)->
    #petfairy_levelCfg {
    lv = 96,
    point = 161320,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,6964,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008,6009],
    skill1 = [{6010,100}]
    };
getRow(97)->
    #petfairy_levelCfg {
    lv = 97,
    point = 166266,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,7109,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008,6009],
    skill1 = [{6010,100}]
    };
getRow(98)->
    #petfairy_levelCfg {
    lv = 98,
    point = 171312,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,7256,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008,6009],
    skill1 = [{6010,100}]
    };
getRow(99)->
    #petfairy_levelCfg {
    lv = 99,
    point = 176459,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,7404,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008,6009],
    skill1 = [{6010,100}]
    };
getRow(100)->
    #petfairy_levelCfg {
    lv = 100,
    point = 181708,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,7554,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(101)->
    #petfairy_levelCfg {
    lv = 101,
    point = 187060,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,7705,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(102)->
    #petfairy_levelCfg {
    lv = 102,
    point = 192516,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,7858,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(103)->
    #petfairy_levelCfg {
    lv = 103,
    point = 198077,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,8012,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(104)->
    #petfairy_levelCfg {
    lv = 104,
    point = 203744,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,8168,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(105)->
    #petfairy_levelCfg {
    lv = 105,
    point = 209518,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,8325,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(106)->
    #petfairy_levelCfg {
    lv = 106,
    point = 215400,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,8484,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(107)->
    #petfairy_levelCfg {
    lv = 107,
    point = 221391,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,8644,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(108)->
    #petfairy_levelCfg {
    lv = 108,
    point = 227492,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,8806,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(109)->
    #petfairy_levelCfg {
    lv = 109,
    point = 233704,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,8969,0}],
    skill = [6000,6001,6002,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(110)->
    #petfairy_levelCfg {
    lv = 110,
    point = 240028,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,9134,0}],
    skill = [6000,6011,6002,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(111)->
    #petfairy_levelCfg {
    lv = 111,
    point = 246465,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,9300,0}],
    skill = [6000,6011,6002,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(112)->
    #petfairy_levelCfg {
    lv = 112,
    point = 253016,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,9468,0}],
    skill = [6000,6011,6002,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(113)->
    #petfairy_levelCfg {
    lv = 113,
    point = 259682,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,9637,0}],
    skill = [6000,6011,6002,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(114)->
    #petfairy_levelCfg {
    lv = 114,
    point = 266464,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,9808,0}],
    skill = [6000,6011,6002,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(115)->
    #petfairy_levelCfg {
    lv = 115,
    point = 273363,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,9980,0}],
    skill = [6000,6011,6002,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(116)->
    #petfairy_levelCfg {
    lv = 116,
    point = 280380,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,10154,0}],
    skill = [6000,6011,6002,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(117)->
    #petfairy_levelCfg {
    lv = 117,
    point = 287516,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,10329,0}],
    skill = [6000,6011,6002,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(118)->
    #petfairy_levelCfg {
    lv = 118,
    point = 294772,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,10506,0}],
    skill = [6000,6011,6002,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(119)->
    #petfairy_levelCfg {
    lv = 119,
    point = 302149,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,10684,0}],
    skill = [6000,6011,6002,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(120)->
    #petfairy_levelCfg {
    lv = 120,
    point = 309648,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,10864,0}],
    skill = [6000,6011,6012,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(121)->
    #petfairy_levelCfg {
    lv = 121,
    point = 317270,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,11045,0}],
    skill = [6000,6011,6012,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(122)->
    #petfairy_levelCfg {
    lv = 122,
    point = 325016,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,11228,0}],
    skill = [6000,6011,6012,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(123)->
    #petfairy_levelCfg {
    lv = 123,
    point = 332887,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,11412,0}],
    skill = [6000,6011,6012,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(124)->
    #petfairy_levelCfg {
    lv = 124,
    point = 340884,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,11598,0}],
    skill = [6000,6011,6012,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(125)->
    #petfairy_levelCfg {
    lv = 125,
    point = 349008,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,11785,0}],
    skill = [6000,6011,6012,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(126)->
    #petfairy_levelCfg {
    lv = 126,
    point = 357260,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,11974,0}],
    skill = [6000,6011,6012,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(127)->
    #petfairy_levelCfg {
    lv = 127,
    point = 365641,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,12164,0}],
    skill = [6000,6011,6012,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(128)->
    #petfairy_levelCfg {
    lv = 128,
    point = 374152,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,12356,0}],
    skill = [6000,6011,6012,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(129)->
    #petfairy_levelCfg {
    lv = 129,
    point = 382794,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,12549,0}],
    skill = [6000,6011,6012,6003,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(130)->
    #petfairy_levelCfg {
    lv = 130,
    point = 391568,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,12744,0}],
    skill = [6000,6011,6012,6013,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(131)->
    #petfairy_levelCfg {
    lv = 131,
    point = 400475,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,12940,0}],
    skill = [6000,6011,6012,6013,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(132)->
    #petfairy_levelCfg {
    lv = 132,
    point = 409516,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,13138,0}],
    skill = [6000,6011,6012,6013,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(133)->
    #petfairy_levelCfg {
    lv = 133,
    point = 418692,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,13337,0}],
    skill = [6000,6011,6012,6013,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(134)->
    #petfairy_levelCfg {
    lv = 134,
    point = 428004,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,13538,0}],
    skill = [6000,6011,6012,6013,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(135)->
    #petfairy_levelCfg {
    lv = 135,
    point = 437453,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,13740,0}],
    skill = [6000,6011,6012,6013,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(136)->
    #petfairy_levelCfg {
    lv = 136,
    point = 447040,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,13944,0}],
    skill = [6000,6011,6012,6013,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(137)->
    #petfairy_levelCfg {
    lv = 137,
    point = 456766,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,14149,0}],
    skill = [6000,6011,6012,6013,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(138)->
    #petfairy_levelCfg {
    lv = 138,
    point = 466632,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,14356,0}],
    skill = [6000,6011,6012,6013,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(139)->
    #petfairy_levelCfg {
    lv = 139,
    point = 476639,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,14564,0}],
    skill = [6000,6011,6012,6013,6004,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(140)->
    #petfairy_levelCfg {
    lv = 140,
    point = 486788,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,14774,0}],
    skill = [6000,6011,6012,6013,6014,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(141)->
    #petfairy_levelCfg {
    lv = 141,
    point = 497080,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,14985,0}],
    skill = [6000,6011,6012,6013,6014,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(142)->
    #petfairy_levelCfg {
    lv = 142,
    point = 507516,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,15198,0}],
    skill = [6000,6011,6012,6013,6014,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(143)->
    #petfairy_levelCfg {
    lv = 143,
    point = 518097,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,15412,0}],
    skill = [6000,6011,6012,6013,6014,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(144)->
    #petfairy_levelCfg {
    lv = 144,
    point = 528824,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,15628,0}],
    skill = [6000,6011,6012,6013,6014,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(145)->
    #petfairy_levelCfg {
    lv = 145,
    point = 539698,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,15845,0}],
    skill = [6000,6011,6012,6013,6014,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(146)->
    #petfairy_levelCfg {
    lv = 146,
    point = 550720,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,16064,0}],
    skill = [6000,6011,6012,6013,6014,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(147)->
    #petfairy_levelCfg {
    lv = 147,
    point = 561891,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,16284,0}],
    skill = [6000,6011,6012,6013,6014,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(148)->
    #petfairy_levelCfg {
    lv = 148,
    point = 573212,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,16506,0}],
    skill = [6000,6011,6012,6013,6014,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(149)->
    #petfairy_levelCfg {
    lv = 149,
    point = 584684,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,16729,0}],
    skill = [6000,6011,6012,6013,6014,6005,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(150)->
    #petfairy_levelCfg {
    lv = 150,
    point = 602271,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,16954,0}],
    skill = [6000,6011,6012,6013,6014,6015,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(151)->
    #petfairy_levelCfg {
    lv = 151,
    point = 620246,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,17180,0}],
    skill = [6000,6011,6012,6013,6014,6015,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(152)->
    #petfairy_levelCfg {
    lv = 152,
    point = 638616,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,17408,0}],
    skill = [6000,6011,6012,6013,6014,6015,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(153)->
    #petfairy_levelCfg {
    lv = 153,
    point = 657386,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,17637,0}],
    skill = [6000,6011,6012,6013,6014,6015,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(154)->
    #petfairy_levelCfg {
    lv = 154,
    point = 676561,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,17868,0}],
    skill = [6000,6011,6012,6013,6014,6015,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(155)->
    #petfairy_levelCfg {
    lv = 155,
    point = 696147,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,18100,0}],
    skill = [6000,6011,6012,6013,6014,6015,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(156)->
    #petfairy_levelCfg {
    lv = 156,
    point = 716151,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,18334,0}],
    skill = [6000,6011,6012,6013,6014,6015,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(157)->
    #petfairy_levelCfg {
    lv = 157,
    point = 736577,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,18569,0}],
    skill = [6000,6011,6012,6013,6014,6015,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(158)->
    #petfairy_levelCfg {
    lv = 158,
    point = 757432,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,18806,0}],
    skill = [6000,6011,6012,6013,6014,6015,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(159)->
    #petfairy_levelCfg {
    lv = 159,
    point = 778721,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,19044,0}],
    skill = [6000,6011,6012,6013,6014,6015,6006,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(160)->
    #petfairy_levelCfg {
    lv = 160,
    point = 800452,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,19284,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(161)->
    #petfairy_levelCfg {
    lv = 161,
    point = 822628,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,19525,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(162)->
    #petfairy_levelCfg {
    lv = 162,
    point = 845258,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,19768,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(163)->
    #petfairy_levelCfg {
    lv = 163,
    point = 868345,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,20012,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(164)->
    #petfairy_levelCfg {
    lv = 164,
    point = 891898,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,20258,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(165)->
    #petfairy_levelCfg {
    lv = 165,
    point = 915922,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,20505,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(166)->
    #petfairy_levelCfg {
    lv = 166,
    point = 940422,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,20754,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(167)->
    #petfairy_levelCfg {
    lv = 167,
    point = 965406,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,21004,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(168)->
    #petfairy_levelCfg {
    lv = 168,
    point = 990879,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,21256,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(169)->
    #petfairy_levelCfg {
    lv = 169,
    point = 1016848,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,21509,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6007,6008,6009,6010],
    skill1 = [0]
    };
getRow(170)->
    #petfairy_levelCfg {
    lv = 170,
    point = 1043320,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,21764,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6008,6009,6010],
    skill1 = [0]
    };
getRow(171)->
    #petfairy_levelCfg {
    lv = 171,
    point = 1070299,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,22020,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6008,6009,6010],
    skill1 = [0]
    };
getRow(172)->
    #petfairy_levelCfg {
    lv = 172,
    point = 1097794,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,22278,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6008,6009,6010],
    skill1 = [0]
    };
getRow(173)->
    #petfairy_levelCfg {
    lv = 173,
    point = 1125810,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,22537,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6008,6009,6010],
    skill1 = [0]
    };
getRow(174)->
    #petfairy_levelCfg {
    lv = 174,
    point = 1154355,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,22798,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6008,6009,6010],
    skill1 = [0]
    };
getRow(175)->
    #petfairy_levelCfg {
    lv = 175,
    point = 1183433,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,23060,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6008,6009,6010],
    skill1 = [0]
    };
getRow(176)->
    #petfairy_levelCfg {
    lv = 176,
    point = 1213053,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,23324,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6008,6009,6010],
    skill1 = [0]
    };
getRow(177)->
    #petfairy_levelCfg {
    lv = 177,
    point = 1243220,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,23589,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6008,6009,6010],
    skill1 = [0]
    };
getRow(178)->
    #petfairy_levelCfg {
    lv = 178,
    point = 1273942,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,23856,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6008,6009,6010],
    skill1 = [0]
    };
getRow(179)->
    #petfairy_levelCfg {
    lv = 179,
    point = 1305224,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,24124,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6008,6009,6010],
    skill1 = [0]
    };
getRow(180)->
    #petfairy_levelCfg {
    lv = 180,
    point = 1337075,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,24394,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6018,6009,6010],
    skill1 = [0]
    };
getRow(181)->
    #petfairy_levelCfg {
    lv = 181,
    point = 1369500,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,24665,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6018,6009,6010],
    skill1 = [0]
    };
getRow(182)->
    #petfairy_levelCfg {
    lv = 182,
    point = 1402506,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,24938,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6018,6009,6010],
    skill1 = [0]
    };
getRow(183)->
    #petfairy_levelCfg {
    lv = 183,
    point = 1436100,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,25212,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6018,6009,6010],
    skill1 = [0]
    };
getRow(184)->
    #petfairy_levelCfg {
    lv = 184,
    point = 1470290,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,25488,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6018,6009,6010],
    skill1 = [0]
    };
getRow(185)->
    #petfairy_levelCfg {
    lv = 185,
    point = 1505082,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,25765,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6018,6009,6010],
    skill1 = [0]
    };
getRow(186)->
    #petfairy_levelCfg {
    lv = 186,
    point = 1540482,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,26044,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6018,6009,6010],
    skill1 = [0]
    };
getRow(187)->
    #petfairy_levelCfg {
    lv = 187,
    point = 1576499,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,26324,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6018,6009,6010],
    skill1 = [0]
    };
getRow(188)->
    #petfairy_levelCfg {
    lv = 188,
    point = 1613139,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,26606,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6018,6009,6010],
    skill1 = [0]
    };
getRow(189)->
    #petfairy_levelCfg {
    lv = 189,
    point = 1650409,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,26889,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6018,6009,6010],
    skill1 = [0]
    };
getRow(190)->
    #petfairy_levelCfg {
    lv = 190,
    point = 1688317,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,27174,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6018,6019,6010],
    skill1 = [0]
    };
getRow(191)->
    #petfairy_levelCfg {
    lv = 191,
    point = 1726869,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,27460,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6018,6019,6010],
    skill1 = [0]
    };
getRow(192)->
    #petfairy_levelCfg {
    lv = 192,
    point = 1766072,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,27748,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6018,6019,6010],
    skill1 = [0]
    };
getRow(193)->
    #petfairy_levelCfg {
    lv = 193,
    point = 1805935,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,28037,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6018,6019,6010],
    skill1 = [0]
    };
getRow(194)->
    #petfairy_levelCfg {
    lv = 194,
    point = 1846464,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,28328,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6018,6019,6010],
    skill1 = [0]
    };
getRow(195)->
    #petfairy_levelCfg {
    lv = 195,
    point = 1887667,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,28620,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6018,6019,6010],
    skill1 = [0]
    };
getRow(196)->
    #petfairy_levelCfg {
    lv = 196,
    point = 1929551,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,28914,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6018,6019,6010],
    skill1 = [0]
    };
getRow(197)->
    #petfairy_levelCfg {
    lv = 197,
    point = 1972123,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,29209,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6018,6019,6010],
    skill1 = [0]
    };
getRow(198)->
    #petfairy_levelCfg {
    lv = 198,
    point = 2015391,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,29506,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6018,6019,6010],
    skill1 = [0]
    };
getRow(199)->
    #petfairy_levelCfg {
    lv = 199,
    point = 2059363,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,29804,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6018,6019,6010],
    skill1 = [0]
    };
getRow(200)->
    #petfairy_levelCfg {
    lv = 200,
    point = 2104046,
    model_G = 5,
    effects_G = 0.7,
    modelY = -280,
    bouns = [{4,30104,0}],
    skill = [6000,6011,6012,6013,6014,6015,6016,6017,6018,6019,6020],
    skill1 = [0]
    };
getRow(_)->[].

getKeyList()->[
    {0},
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
    {27},
    {28},
    {29},
    {30},
    {31},
    {32},
    {33},
    {34},
    {35},
    {36},
    {37},
    {38},
    {39},
    {40},
    {41},
    {42},
    {43},
    {44},
    {45},
    {46},
    {47},
    {48},
    {49},
    {50},
    {51},
    {52},
    {53},
    {54},
    {55},
    {56},
    {57},
    {58},
    {59},
    {60},
    {61},
    {62},
    {63},
    {64},
    {65},
    {66},
    {67},
    {68},
    {69},
    {70},
    {71},
    {72},
    {73},
    {74},
    {75},
    {76},
    {77},
    {78},
    {79},
    {80},
    {81},
    {82},
    {83},
    {84},
    {85},
    {86},
    {87},
    {88},
    {89},
    {90},
    {91},
    {92},
    {93},
    {94},
    {95},
    {96},
    {97},
    {98},
    {99},
    {100},
    {101},
    {102},
    {103},
    {104},
    {105},
    {106},
    {107},
    {108},
    {109},
    {110},
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
    {128},
    {129},
    {130},
    {131},
    {132},
    {133},
    {134},
    {135},
    {136},
    {137},
    {138},
    {139},
    {140},
    {141},
    {142},
    {143},
    {144},
    {145},
    {146},
    {147},
    {148},
    {149},
    {150},
    {151},
    {152},
    {153},
    {154},
    {155},
    {156},
    {157},
    {158},
    {159},
    {160},
    {161},
    {162},
    {163},
    {164},
    {165},
    {166},
    {167},
    {168},
    {169},
    {170},
    {171},
    {172},
    {173},
    {174},
    {175},
    {176},
    {177},
    {178},
    {179},
    {180},
    {181},
    {182},
    {183},
    {184},
    {185},
    {186},
    {187},
    {188},
    {189},
    {190},
    {191},
    {192},
    {193},
    {194},
    {195},
    {196},
    {197},
    {198},
    {199},
    {200}
    ].

get1KeyList()->[
    0,
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
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    94,
    95,
    96,
    97,
    98,
    99,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
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
    128,
    129,
    130,
    131,
    132,
    133,
    134,
    135,
    136,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    147,
    148,
    149,
    150,
    151,
    152,
    153,
    154,
    155,
    156,
    157,
    158,
    159,
    160,
    161,
    162,
    163,
    164,
    165,
    166,
    167,
    168,
    169,
    170,
    171,
    172,
    173,
    174,
    175,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    187,
    188,
    189,
    190,
    191,
    192,
    193,
    194,
    195,
    196,
    197,
    198,
    199,
    200
    ].

