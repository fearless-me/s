%% coding: latin-1
%%: 实现
-module(cfg_petenhance_chs).
-compile(export_all).
-include("cfg_petenhance.hrl").
-include("logger.hrl").

getRow(1,1)->
    #petenhanceCfg {
    artifact = 1,
    level = 1,
    exp = 100,
    p1 = 18,
    p1value = 0.015,
    p1type = 1,
    p2 = 19,
    p2value = 0.015,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,2)->
    #petenhanceCfg {
    artifact = 1,
    level = 2,
    exp = 200,
    p1 = 18,
    p1value = 0.03,
    p1type = 1,
    p2 = 19,
    p2value = 0.03,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,3)->
    #petenhanceCfg {
    artifact = 1,
    level = 3,
    exp = 300,
    p1 = 18,
    p1value = 0.045,
    p1type = 1,
    p2 = 19,
    p2value = 0.045,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,4)->
    #petenhanceCfg {
    artifact = 1,
    level = 4,
    exp = 400,
    p1 = 18,
    p1value = 0.06,
    p1type = 1,
    p2 = 19,
    p2value = 0.06,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,5)->
    #petenhanceCfg {
    artifact = 1,
    level = 5,
    exp = 500,
    p1 = 18,
    p1value = 0.075,
    p1type = 1,
    p2 = 19,
    p2value = 0.075,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,6)->
    #petenhanceCfg {
    artifact = 1,
    level = 6,
    exp = 600,
    p1 = 18,
    p1value = 0.09,
    p1type = 1,
    p2 = 19,
    p2value = 0.09,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,7)->
    #petenhanceCfg {
    artifact = 1,
    level = 7,
    exp = 700,
    p1 = 18,
    p1value = 0.105,
    p1type = 1,
    p2 = 19,
    p2value = 0.105,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,8)->
    #petenhanceCfg {
    artifact = 1,
    level = 8,
    exp = 800,
    p1 = 18,
    p1value = 0.12,
    p1type = 1,
    p2 = 19,
    p2value = 0.12,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,9)->
    #petenhanceCfg {
    artifact = 1,
    level = 9,
    exp = 900,
    p1 = 18,
    p1value = 0.135,
    p1type = 1,
    p2 = 19,
    p2value = 0.135,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,10)->
    #petenhanceCfg {
    artifact = 1,
    level = 10,
    exp = 1000,
    p1 = 18,
    p1value = 0.15,
    p1type = 1,
    p2 = 19,
    p2value = 0.15,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,11)->
    #petenhanceCfg {
    artifact = 1,
    level = 11,
    exp = 1100,
    p1 = 18,
    p1value = 0.165,
    p1type = 1,
    p2 = 19,
    p2value = 0.165,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,12)->
    #petenhanceCfg {
    artifact = 1,
    level = 12,
    exp = 1200,
    p1 = 18,
    p1value = 0.18,
    p1type = 1,
    p2 = 19,
    p2value = 0.18,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,13)->
    #petenhanceCfg {
    artifact = 1,
    level = 13,
    exp = 1300,
    p1 = 18,
    p1value = 0.195,
    p1type = 1,
    p2 = 19,
    p2value = 0.195,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,14)->
    #petenhanceCfg {
    artifact = 1,
    level = 14,
    exp = 1400,
    p1 = 18,
    p1value = 0.21,
    p1type = 1,
    p2 = 19,
    p2value = 0.21,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,15)->
    #petenhanceCfg {
    artifact = 1,
    level = 15,
    exp = 1500,
    p1 = 18,
    p1value = 0.225,
    p1type = 1,
    p2 = 19,
    p2value = 0.225,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,16)->
    #petenhanceCfg {
    artifact = 1,
    level = 16,
    exp = 1600,
    p1 = 18,
    p1value = 0.24,
    p1type = 1,
    p2 = 19,
    p2value = 0.24,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,17)->
    #petenhanceCfg {
    artifact = 1,
    level = 17,
    exp = 1700,
    p1 = 18,
    p1value = 0.255,
    p1type = 1,
    p2 = 19,
    p2value = 0.255,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,18)->
    #petenhanceCfg {
    artifact = 1,
    level = 18,
    exp = 1800,
    p1 = 18,
    p1value = 0.27,
    p1type = 1,
    p2 = 19,
    p2value = 0.27,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,19)->
    #petenhanceCfg {
    artifact = 1,
    level = 19,
    exp = 1900,
    p1 = 18,
    p1value = 0.285,
    p1type = 1,
    p2 = 19,
    p2value = 0.285,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,20)->
    #petenhanceCfg {
    artifact = 1,
    level = 20,
    exp = 2000,
    p1 = 18,
    p1value = 0.3,
    p1type = 1,
    p2 = 19,
    p2value = 0.3,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,21)->
    #petenhanceCfg {
    artifact = 1,
    level = 21,
    exp = 2100,
    p1 = 18,
    p1value = 0.315,
    p1type = 1,
    p2 = 19,
    p2value = 0.315,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,22)->
    #petenhanceCfg {
    artifact = 1,
    level = 22,
    exp = 2200,
    p1 = 18,
    p1value = 0.33,
    p1type = 1,
    p2 = 19,
    p2value = 0.33,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,23)->
    #petenhanceCfg {
    artifact = 1,
    level = 23,
    exp = 2300,
    p1 = 18,
    p1value = 0.345,
    p1type = 1,
    p2 = 19,
    p2value = 0.345,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,24)->
    #petenhanceCfg {
    artifact = 1,
    level = 24,
    exp = 2400,
    p1 = 18,
    p1value = 0.36,
    p1type = 1,
    p2 = 19,
    p2value = 0.36,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,25)->
    #petenhanceCfg {
    artifact = 1,
    level = 25,
    exp = 2500,
    p1 = 18,
    p1value = 0.375,
    p1type = 1,
    p2 = 19,
    p2value = 0.375,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,26)->
    #petenhanceCfg {
    artifact = 1,
    level = 26,
    exp = 2600,
    p1 = 18,
    p1value = 0.39,
    p1type = 1,
    p2 = 19,
    p2value = 0.39,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,27)->
    #petenhanceCfg {
    artifact = 1,
    level = 27,
    exp = 2700,
    p1 = 18,
    p1value = 0.405,
    p1type = 1,
    p2 = 19,
    p2value = 0.405,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,28)->
    #petenhanceCfg {
    artifact = 1,
    level = 28,
    exp = 2800,
    p1 = 18,
    p1value = 0.42,
    p1type = 1,
    p2 = 19,
    p2value = 0.42,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,29)->
    #petenhanceCfg {
    artifact = 1,
    level = 29,
    exp = 2900,
    p1 = 18,
    p1value = 0.435,
    p1type = 1,
    p2 = 19,
    p2value = 0.435,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,30)->
    #petenhanceCfg {
    artifact = 1,
    level = 30,
    exp = 3000,
    p1 = 18,
    p1value = 0.45,
    p1type = 1,
    p2 = 19,
    p2value = 0.45,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,31)->
    #petenhanceCfg {
    artifact = 1,
    level = 31,
    exp = 3100,
    p1 = 18,
    p1value = 0.465,
    p1type = 1,
    p2 = 19,
    p2value = 0.465,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,32)->
    #petenhanceCfg {
    artifact = 1,
    level = 32,
    exp = 3200,
    p1 = 18,
    p1value = 0.48,
    p1type = 1,
    p2 = 19,
    p2value = 0.48,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,33)->
    #petenhanceCfg {
    artifact = 1,
    level = 33,
    exp = 3300,
    p1 = 18,
    p1value = 0.495,
    p1type = 1,
    p2 = 19,
    p2value = 0.495,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,34)->
    #petenhanceCfg {
    artifact = 1,
    level = 34,
    exp = 3400,
    p1 = 18,
    p1value = 0.51,
    p1type = 1,
    p2 = 19,
    p2value = 0.51,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,35)->
    #petenhanceCfg {
    artifact = 1,
    level = 35,
    exp = 3500,
    p1 = 18,
    p1value = 0.525,
    p1type = 1,
    p2 = 19,
    p2value = 0.525,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,36)->
    #petenhanceCfg {
    artifact = 1,
    level = 36,
    exp = 3600,
    p1 = 18,
    p1value = 0.54,
    p1type = 1,
    p2 = 19,
    p2value = 0.54,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,37)->
    #petenhanceCfg {
    artifact = 1,
    level = 37,
    exp = 3700,
    p1 = 18,
    p1value = 0.555,
    p1type = 1,
    p2 = 19,
    p2value = 0.555,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,38)->
    #petenhanceCfg {
    artifact = 1,
    level = 38,
    exp = 3800,
    p1 = 18,
    p1value = 0.57,
    p1type = 1,
    p2 = 19,
    p2value = 0.57,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,39)->
    #petenhanceCfg {
    artifact = 1,
    level = 39,
    exp = 3900,
    p1 = 18,
    p1value = 0.585,
    p1type = 1,
    p2 = 19,
    p2value = 0.585,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,40)->
    #petenhanceCfg {
    artifact = 1,
    level = 40,
    exp = 4000,
    p1 = 18,
    p1value = 0.6,
    p1type = 1,
    p2 = 19,
    p2value = 0.6,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,41)->
    #petenhanceCfg {
    artifact = 1,
    level = 41,
    exp = 4100,
    p1 = 18,
    p1value = 0.615,
    p1type = 1,
    p2 = 19,
    p2value = 0.615,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,42)->
    #petenhanceCfg {
    artifact = 1,
    level = 42,
    exp = 4200,
    p1 = 18,
    p1value = 0.63,
    p1type = 1,
    p2 = 19,
    p2value = 0.63,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,43)->
    #petenhanceCfg {
    artifact = 1,
    level = 43,
    exp = 4300,
    p1 = 18,
    p1value = 0.645,
    p1type = 1,
    p2 = 19,
    p2value = 0.645,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,44)->
    #petenhanceCfg {
    artifact = 1,
    level = 44,
    exp = 4400,
    p1 = 18,
    p1value = 0.66,
    p1type = 1,
    p2 = 19,
    p2value = 0.66,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,45)->
    #petenhanceCfg {
    artifact = 1,
    level = 45,
    exp = 4500,
    p1 = 18,
    p1value = 0.675,
    p1type = 1,
    p2 = 19,
    p2value = 0.675,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,46)->
    #petenhanceCfg {
    artifact = 1,
    level = 46,
    exp = 4600,
    p1 = 18,
    p1value = 0.69,
    p1type = 1,
    p2 = 19,
    p2value = 0.69,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,47)->
    #petenhanceCfg {
    artifact = 1,
    level = 47,
    exp = 4700,
    p1 = 18,
    p1value = 0.705,
    p1type = 1,
    p2 = 19,
    p2value = 0.705,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,48)->
    #petenhanceCfg {
    artifact = 1,
    level = 48,
    exp = 4800,
    p1 = 18,
    p1value = 0.72,
    p1type = 1,
    p2 = 19,
    p2value = 0.72,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,49)->
    #petenhanceCfg {
    artifact = 1,
    level = 49,
    exp = 4900,
    p1 = 18,
    p1value = 0.735,
    p1type = 1,
    p2 = 19,
    p2value = 0.735,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,50)->
    #petenhanceCfg {
    artifact = 1,
    level = 50,
    exp = 5000,
    p1 = 18,
    p1value = 0.75,
    p1type = 1,
    p2 = 19,
    p2value = 0.75,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,51)->
    #petenhanceCfg {
    artifact = 1,
    level = 51,
    exp = 5100,
    p1 = 18,
    p1value = 0.765,
    p1type = 1,
    p2 = 19,
    p2value = 0.765,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,52)->
    #petenhanceCfg {
    artifact = 1,
    level = 52,
    exp = 5200,
    p1 = 18,
    p1value = 0.78,
    p1type = 1,
    p2 = 19,
    p2value = 0.78,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,53)->
    #petenhanceCfg {
    artifact = 1,
    level = 53,
    exp = 5300,
    p1 = 18,
    p1value = 0.795,
    p1type = 1,
    p2 = 19,
    p2value = 0.795,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,54)->
    #petenhanceCfg {
    artifact = 1,
    level = 54,
    exp = 5400,
    p1 = 18,
    p1value = 0.81,
    p1type = 1,
    p2 = 19,
    p2value = 0.81,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,55)->
    #petenhanceCfg {
    artifact = 1,
    level = 55,
    exp = 5500,
    p1 = 18,
    p1value = 0.825,
    p1type = 1,
    p2 = 19,
    p2value = 0.825,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,56)->
    #petenhanceCfg {
    artifact = 1,
    level = 56,
    exp = 5600,
    p1 = 18,
    p1value = 0.84,
    p1type = 1,
    p2 = 19,
    p2value = 0.84,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,57)->
    #petenhanceCfg {
    artifact = 1,
    level = 57,
    exp = 5700,
    p1 = 18,
    p1value = 0.855,
    p1type = 1,
    p2 = 19,
    p2value = 0.855,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,58)->
    #petenhanceCfg {
    artifact = 1,
    level = 58,
    exp = 5800,
    p1 = 18,
    p1value = 0.87,
    p1type = 1,
    p2 = 19,
    p2value = 0.87,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,59)->
    #petenhanceCfg {
    artifact = 1,
    level = 59,
    exp = 5900,
    p1 = 18,
    p1value = 0.885,
    p1type = 1,
    p2 = 19,
    p2value = 0.885,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(1,60)->
    #petenhanceCfg {
    artifact = 1,
    level = 60,
    exp = 0,
    p1 = 18,
    p1value = 0.9,
    p1type = 1,
    p2 = 19,
    p2value = 0.9,
    p2type = 1,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,1)->
    #petenhanceCfg {
    artifact = 2,
    level = 1,
    exp = 100,
    p1 = 35,
    p1value = 0.0075,
    p1type = 0,
    p2 = 36,
    p2value = 0.015,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,2)->
    #petenhanceCfg {
    artifact = 2,
    level = 2,
    exp = 200,
    p1 = 35,
    p1value = 0.015,
    p1type = 0,
    p2 = 36,
    p2value = 0.03,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,3)->
    #petenhanceCfg {
    artifact = 2,
    level = 3,
    exp = 300,
    p1 = 35,
    p1value = 0.0225,
    p1type = 0,
    p2 = 36,
    p2value = 0.045,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,4)->
    #petenhanceCfg {
    artifact = 2,
    level = 4,
    exp = 400,
    p1 = 35,
    p1value = 0.03,
    p1type = 0,
    p2 = 36,
    p2value = 0.06,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,5)->
    #petenhanceCfg {
    artifact = 2,
    level = 5,
    exp = 500,
    p1 = 35,
    p1value = 0.0375,
    p1type = 0,
    p2 = 36,
    p2value = 0.075,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,6)->
    #petenhanceCfg {
    artifact = 2,
    level = 6,
    exp = 600,
    p1 = 35,
    p1value = 0.045,
    p1type = 0,
    p2 = 36,
    p2value = 0.09,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,7)->
    #petenhanceCfg {
    artifact = 2,
    level = 7,
    exp = 700,
    p1 = 35,
    p1value = 0.0525,
    p1type = 0,
    p2 = 36,
    p2value = 0.105,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,8)->
    #petenhanceCfg {
    artifact = 2,
    level = 8,
    exp = 800,
    p1 = 35,
    p1value = 0.06,
    p1type = 0,
    p2 = 36,
    p2value = 0.12,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,9)->
    #petenhanceCfg {
    artifact = 2,
    level = 9,
    exp = 900,
    p1 = 35,
    p1value = 0.0675,
    p1type = 0,
    p2 = 36,
    p2value = 0.135,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,10)->
    #petenhanceCfg {
    artifact = 2,
    level = 10,
    exp = 1000,
    p1 = 35,
    p1value = 0.075,
    p1type = 0,
    p2 = 36,
    p2value = 0.15,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,11)->
    #petenhanceCfg {
    artifact = 2,
    level = 11,
    exp = 1100,
    p1 = 35,
    p1value = 0.0825,
    p1type = 0,
    p2 = 36,
    p2value = 0.165,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,12)->
    #petenhanceCfg {
    artifact = 2,
    level = 12,
    exp = 1200,
    p1 = 35,
    p1value = 0.09,
    p1type = 0,
    p2 = 36,
    p2value = 0.18,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,13)->
    #petenhanceCfg {
    artifact = 2,
    level = 13,
    exp = 1300,
    p1 = 35,
    p1value = 0.0975,
    p1type = 0,
    p2 = 36,
    p2value = 0.195,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,14)->
    #petenhanceCfg {
    artifact = 2,
    level = 14,
    exp = 1400,
    p1 = 35,
    p1value = 0.105,
    p1type = 0,
    p2 = 36,
    p2value = 0.21,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,15)->
    #petenhanceCfg {
    artifact = 2,
    level = 15,
    exp = 1500,
    p1 = 35,
    p1value = 0.1125,
    p1type = 0,
    p2 = 36,
    p2value = 0.225,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,16)->
    #petenhanceCfg {
    artifact = 2,
    level = 16,
    exp = 1600,
    p1 = 35,
    p1value = 0.12,
    p1type = 0,
    p2 = 36,
    p2value = 0.24,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,17)->
    #petenhanceCfg {
    artifact = 2,
    level = 17,
    exp = 1700,
    p1 = 35,
    p1value = 0.1275,
    p1type = 0,
    p2 = 36,
    p2value = 0.255,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,18)->
    #petenhanceCfg {
    artifact = 2,
    level = 18,
    exp = 1800,
    p1 = 35,
    p1value = 0.135,
    p1type = 0,
    p2 = 36,
    p2value = 0.27,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,19)->
    #petenhanceCfg {
    artifact = 2,
    level = 19,
    exp = 1900,
    p1 = 35,
    p1value = 0.1425,
    p1type = 0,
    p2 = 36,
    p2value = 0.285,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,20)->
    #petenhanceCfg {
    artifact = 2,
    level = 20,
    exp = 2000,
    p1 = 35,
    p1value = 0.15,
    p1type = 0,
    p2 = 36,
    p2value = 0.3,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,21)->
    #petenhanceCfg {
    artifact = 2,
    level = 21,
    exp = 2100,
    p1 = 35,
    p1value = 0.1575,
    p1type = 0,
    p2 = 36,
    p2value = 0.315,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,22)->
    #petenhanceCfg {
    artifact = 2,
    level = 22,
    exp = 2200,
    p1 = 35,
    p1value = 0.165,
    p1type = 0,
    p2 = 36,
    p2value = 0.33,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,23)->
    #petenhanceCfg {
    artifact = 2,
    level = 23,
    exp = 2300,
    p1 = 35,
    p1value = 0.1725,
    p1type = 0,
    p2 = 36,
    p2value = 0.345,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,24)->
    #petenhanceCfg {
    artifact = 2,
    level = 24,
    exp = 2400,
    p1 = 35,
    p1value = 0.18,
    p1type = 0,
    p2 = 36,
    p2value = 0.36,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,25)->
    #petenhanceCfg {
    artifact = 2,
    level = 25,
    exp = 2500,
    p1 = 35,
    p1value = 0.1875,
    p1type = 0,
    p2 = 36,
    p2value = 0.375,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,26)->
    #petenhanceCfg {
    artifact = 2,
    level = 26,
    exp = 2600,
    p1 = 35,
    p1value = 0.195,
    p1type = 0,
    p2 = 36,
    p2value = 0.39,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,27)->
    #petenhanceCfg {
    artifact = 2,
    level = 27,
    exp = 2700,
    p1 = 35,
    p1value = 0.2025,
    p1type = 0,
    p2 = 36,
    p2value = 0.405,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,28)->
    #petenhanceCfg {
    artifact = 2,
    level = 28,
    exp = 2800,
    p1 = 35,
    p1value = 0.21,
    p1type = 0,
    p2 = 36,
    p2value = 0.42,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,29)->
    #petenhanceCfg {
    artifact = 2,
    level = 29,
    exp = 2900,
    p1 = 35,
    p1value = 0.2175,
    p1type = 0,
    p2 = 36,
    p2value = 0.435,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,30)->
    #petenhanceCfg {
    artifact = 2,
    level = 30,
    exp = 3000,
    p1 = 35,
    p1value = 0.225,
    p1type = 0,
    p2 = 36,
    p2value = 0.45,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,31)->
    #petenhanceCfg {
    artifact = 2,
    level = 31,
    exp = 3100,
    p1 = 35,
    p1value = 0.2325,
    p1type = 0,
    p2 = 36,
    p2value = 0.465,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,32)->
    #petenhanceCfg {
    artifact = 2,
    level = 32,
    exp = 3200,
    p1 = 35,
    p1value = 0.24,
    p1type = 0,
    p2 = 36,
    p2value = 0.48,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,33)->
    #petenhanceCfg {
    artifact = 2,
    level = 33,
    exp = 3300,
    p1 = 35,
    p1value = 0.2475,
    p1type = 0,
    p2 = 36,
    p2value = 0.495,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,34)->
    #petenhanceCfg {
    artifact = 2,
    level = 34,
    exp = 3400,
    p1 = 35,
    p1value = 0.255,
    p1type = 0,
    p2 = 36,
    p2value = 0.51,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,35)->
    #petenhanceCfg {
    artifact = 2,
    level = 35,
    exp = 3500,
    p1 = 35,
    p1value = 0.2625,
    p1type = 0,
    p2 = 36,
    p2value = 0.525,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,36)->
    #petenhanceCfg {
    artifact = 2,
    level = 36,
    exp = 3600,
    p1 = 35,
    p1value = 0.27,
    p1type = 0,
    p2 = 36,
    p2value = 0.54,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,37)->
    #petenhanceCfg {
    artifact = 2,
    level = 37,
    exp = 3700,
    p1 = 35,
    p1value = 0.2775,
    p1type = 0,
    p2 = 36,
    p2value = 0.555,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,38)->
    #petenhanceCfg {
    artifact = 2,
    level = 38,
    exp = 3800,
    p1 = 35,
    p1value = 0.285,
    p1type = 0,
    p2 = 36,
    p2value = 0.57,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,39)->
    #petenhanceCfg {
    artifact = 2,
    level = 39,
    exp = 3900,
    p1 = 35,
    p1value = 0.2925,
    p1type = 0,
    p2 = 36,
    p2value = 0.585,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,40)->
    #petenhanceCfg {
    artifact = 2,
    level = 40,
    exp = 4000,
    p1 = 35,
    p1value = 0.3,
    p1type = 0,
    p2 = 36,
    p2value = 0.6,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,41)->
    #petenhanceCfg {
    artifact = 2,
    level = 41,
    exp = 4100,
    p1 = 35,
    p1value = 0.3075,
    p1type = 0,
    p2 = 36,
    p2value = 0.615,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,42)->
    #petenhanceCfg {
    artifact = 2,
    level = 42,
    exp = 4200,
    p1 = 35,
    p1value = 0.315,
    p1type = 0,
    p2 = 36,
    p2value = 0.63,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,43)->
    #petenhanceCfg {
    artifact = 2,
    level = 43,
    exp = 4300,
    p1 = 35,
    p1value = 0.3225,
    p1type = 0,
    p2 = 36,
    p2value = 0.645,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,44)->
    #petenhanceCfg {
    artifact = 2,
    level = 44,
    exp = 4400,
    p1 = 35,
    p1value = 0.33,
    p1type = 0,
    p2 = 36,
    p2value = 0.66,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,45)->
    #petenhanceCfg {
    artifact = 2,
    level = 45,
    exp = 4500,
    p1 = 35,
    p1value = 0.3375,
    p1type = 0,
    p2 = 36,
    p2value = 0.675,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,46)->
    #petenhanceCfg {
    artifact = 2,
    level = 46,
    exp = 4600,
    p1 = 35,
    p1value = 0.345,
    p1type = 0,
    p2 = 36,
    p2value = 0.69,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,47)->
    #petenhanceCfg {
    artifact = 2,
    level = 47,
    exp = 4700,
    p1 = 35,
    p1value = 0.3525,
    p1type = 0,
    p2 = 36,
    p2value = 0.705,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,48)->
    #petenhanceCfg {
    artifact = 2,
    level = 48,
    exp = 4800,
    p1 = 35,
    p1value = 0.36,
    p1type = 0,
    p2 = 36,
    p2value = 0.72,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,49)->
    #petenhanceCfg {
    artifact = 2,
    level = 49,
    exp = 4900,
    p1 = 35,
    p1value = 0.3675,
    p1type = 0,
    p2 = 36,
    p2value = 0.735,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,50)->
    #petenhanceCfg {
    artifact = 2,
    level = 50,
    exp = 5000,
    p1 = 35,
    p1value = 0.375,
    p1type = 0,
    p2 = 36,
    p2value = 0.75,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,51)->
    #petenhanceCfg {
    artifact = 2,
    level = 51,
    exp = 5100,
    p1 = 35,
    p1value = 0.3825,
    p1type = 0,
    p2 = 36,
    p2value = 0.765,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,52)->
    #petenhanceCfg {
    artifact = 2,
    level = 52,
    exp = 5200,
    p1 = 35,
    p1value = 0.39,
    p1type = 0,
    p2 = 36,
    p2value = 0.78,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,53)->
    #petenhanceCfg {
    artifact = 2,
    level = 53,
    exp = 5300,
    p1 = 35,
    p1value = 0.3975,
    p1type = 0,
    p2 = 36,
    p2value = 0.795,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,54)->
    #petenhanceCfg {
    artifact = 2,
    level = 54,
    exp = 5400,
    p1 = 35,
    p1value = 0.405,
    p1type = 0,
    p2 = 36,
    p2value = 0.81,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,55)->
    #petenhanceCfg {
    artifact = 2,
    level = 55,
    exp = 5500,
    p1 = 35,
    p1value = 0.4125,
    p1type = 0,
    p2 = 36,
    p2value = 0.825,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,56)->
    #petenhanceCfg {
    artifact = 2,
    level = 56,
    exp = 5600,
    p1 = 35,
    p1value = 0.42,
    p1type = 0,
    p2 = 36,
    p2value = 0.84,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,57)->
    #petenhanceCfg {
    artifact = 2,
    level = 57,
    exp = 5700,
    p1 = 35,
    p1value = 0.4275,
    p1type = 0,
    p2 = 36,
    p2value = 0.855,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,58)->
    #petenhanceCfg {
    artifact = 2,
    level = 58,
    exp = 5800,
    p1 = 35,
    p1value = 0.435,
    p1type = 0,
    p2 = 36,
    p2value = 0.87,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,59)->
    #petenhanceCfg {
    artifact = 2,
    level = 59,
    exp = 5900,
    p1 = 35,
    p1value = 0.4425,
    p1type = 0,
    p2 = 36,
    p2value = 0.885,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(2,60)->
    #petenhanceCfg {
    artifact = 2,
    level = 60,
    exp = 0,
    p1 = 35,
    p1value = 0.45,
    p1type = 0,
    p2 = 36,
    p2value = 0.9,
    p2type = 0,
    p3 = 0,
    p3value = 0,
    p3type = 0,
    p4 = 0,
    p4value = 0,
    p4type = 0
    };
getRow(3,1)->
    #petenhanceCfg {
    artifact = 3,
    level = 1,
    exp = 100,
    p1 = 47,
    p1value = 0.0075,
    p1type = 1,
    p2 = 48,
    p2value = 0.0075,
    p2type = 1,
    p3 = 49,
    p3value = 0.0075,
    p3type = 1,
    p4 = 50,
    p4value = 0.0075,
    p4type = 1
    };
getRow(3,2)->
    #petenhanceCfg {
    artifact = 3,
    level = 2,
    exp = 200,
    p1 = 47,
    p1value = 0.015,
    p1type = 1,
    p2 = 48,
    p2value = 0.015,
    p2type = 1,
    p3 = 49,
    p3value = 0.015,
    p3type = 1,
    p4 = 50,
    p4value = 0.015,
    p4type = 1
    };
getRow(3,3)->
    #petenhanceCfg {
    artifact = 3,
    level = 3,
    exp = 300,
    p1 = 47,
    p1value = 0.0225,
    p1type = 1,
    p2 = 48,
    p2value = 0.0225,
    p2type = 1,
    p3 = 49,
    p3value = 0.0225,
    p3type = 1,
    p4 = 50,
    p4value = 0.0225,
    p4type = 1
    };
getRow(3,4)->
    #petenhanceCfg {
    artifact = 3,
    level = 4,
    exp = 400,
    p1 = 47,
    p1value = 0.03,
    p1type = 1,
    p2 = 48,
    p2value = 0.03,
    p2type = 1,
    p3 = 49,
    p3value = 0.03,
    p3type = 1,
    p4 = 50,
    p4value = 0.03,
    p4type = 1
    };
getRow(3,5)->
    #petenhanceCfg {
    artifact = 3,
    level = 5,
    exp = 500,
    p1 = 47,
    p1value = 0.0375,
    p1type = 1,
    p2 = 48,
    p2value = 0.0375,
    p2type = 1,
    p3 = 49,
    p3value = 0.0375,
    p3type = 1,
    p4 = 50,
    p4value = 0.0375,
    p4type = 1
    };
getRow(3,6)->
    #petenhanceCfg {
    artifact = 3,
    level = 6,
    exp = 600,
    p1 = 47,
    p1value = 0.045,
    p1type = 1,
    p2 = 48,
    p2value = 0.045,
    p2type = 1,
    p3 = 49,
    p3value = 0.045,
    p3type = 1,
    p4 = 50,
    p4value = 0.045,
    p4type = 1
    };
getRow(3,7)->
    #petenhanceCfg {
    artifact = 3,
    level = 7,
    exp = 700,
    p1 = 47,
    p1value = 0.0525,
    p1type = 1,
    p2 = 48,
    p2value = 0.0525,
    p2type = 1,
    p3 = 49,
    p3value = 0.0525,
    p3type = 1,
    p4 = 50,
    p4value = 0.0525,
    p4type = 1
    };
getRow(3,8)->
    #petenhanceCfg {
    artifact = 3,
    level = 8,
    exp = 800,
    p1 = 47,
    p1value = 0.06,
    p1type = 1,
    p2 = 48,
    p2value = 0.06,
    p2type = 1,
    p3 = 49,
    p3value = 0.06,
    p3type = 1,
    p4 = 50,
    p4value = 0.06,
    p4type = 1
    };
getRow(3,9)->
    #petenhanceCfg {
    artifact = 3,
    level = 9,
    exp = 900,
    p1 = 47,
    p1value = 0.0675,
    p1type = 1,
    p2 = 48,
    p2value = 0.0675,
    p2type = 1,
    p3 = 49,
    p3value = 0.0675,
    p3type = 1,
    p4 = 50,
    p4value = 0.0675,
    p4type = 1
    };
getRow(3,10)->
    #petenhanceCfg {
    artifact = 3,
    level = 10,
    exp = 1000,
    p1 = 47,
    p1value = 0.075,
    p1type = 1,
    p2 = 48,
    p2value = 0.075,
    p2type = 1,
    p3 = 49,
    p3value = 0.075,
    p3type = 1,
    p4 = 50,
    p4value = 0.075,
    p4type = 1
    };
getRow(3,11)->
    #petenhanceCfg {
    artifact = 3,
    level = 11,
    exp = 1100,
    p1 = 47,
    p1value = 0.0825,
    p1type = 1,
    p2 = 48,
    p2value = 0.0825,
    p2type = 1,
    p3 = 49,
    p3value = 0.0825,
    p3type = 1,
    p4 = 50,
    p4value = 0.0825,
    p4type = 1
    };
getRow(3,12)->
    #petenhanceCfg {
    artifact = 3,
    level = 12,
    exp = 1200,
    p1 = 47,
    p1value = 0.09,
    p1type = 1,
    p2 = 48,
    p2value = 0.09,
    p2type = 1,
    p3 = 49,
    p3value = 0.09,
    p3type = 1,
    p4 = 50,
    p4value = 0.09,
    p4type = 1
    };
getRow(3,13)->
    #petenhanceCfg {
    artifact = 3,
    level = 13,
    exp = 1300,
    p1 = 47,
    p1value = 0.0975,
    p1type = 1,
    p2 = 48,
    p2value = 0.0975,
    p2type = 1,
    p3 = 49,
    p3value = 0.0975,
    p3type = 1,
    p4 = 50,
    p4value = 0.0975,
    p4type = 1
    };
getRow(3,14)->
    #petenhanceCfg {
    artifact = 3,
    level = 14,
    exp = 1400,
    p1 = 47,
    p1value = 0.105,
    p1type = 1,
    p2 = 48,
    p2value = 0.105,
    p2type = 1,
    p3 = 49,
    p3value = 0.105,
    p3type = 1,
    p4 = 50,
    p4value = 0.105,
    p4type = 1
    };
getRow(3,15)->
    #petenhanceCfg {
    artifact = 3,
    level = 15,
    exp = 1500,
    p1 = 47,
    p1value = 0.1125,
    p1type = 1,
    p2 = 48,
    p2value = 0.1125,
    p2type = 1,
    p3 = 49,
    p3value = 0.1125,
    p3type = 1,
    p4 = 50,
    p4value = 0.1125,
    p4type = 1
    };
getRow(3,16)->
    #petenhanceCfg {
    artifact = 3,
    level = 16,
    exp = 1600,
    p1 = 47,
    p1value = 0.12,
    p1type = 1,
    p2 = 48,
    p2value = 0.12,
    p2type = 1,
    p3 = 49,
    p3value = 0.12,
    p3type = 1,
    p4 = 50,
    p4value = 0.12,
    p4type = 1
    };
getRow(3,17)->
    #petenhanceCfg {
    artifact = 3,
    level = 17,
    exp = 1700,
    p1 = 47,
    p1value = 0.1275,
    p1type = 1,
    p2 = 48,
    p2value = 0.1275,
    p2type = 1,
    p3 = 49,
    p3value = 0.1275,
    p3type = 1,
    p4 = 50,
    p4value = 0.1275,
    p4type = 1
    };
getRow(3,18)->
    #petenhanceCfg {
    artifact = 3,
    level = 18,
    exp = 1800,
    p1 = 47,
    p1value = 0.135,
    p1type = 1,
    p2 = 48,
    p2value = 0.135,
    p2type = 1,
    p3 = 49,
    p3value = 0.135,
    p3type = 1,
    p4 = 50,
    p4value = 0.135,
    p4type = 1
    };
getRow(3,19)->
    #petenhanceCfg {
    artifact = 3,
    level = 19,
    exp = 1900,
    p1 = 47,
    p1value = 0.1425,
    p1type = 1,
    p2 = 48,
    p2value = 0.1425,
    p2type = 1,
    p3 = 49,
    p3value = 0.1425,
    p3type = 1,
    p4 = 50,
    p4value = 0.1425,
    p4type = 1
    };
getRow(3,20)->
    #petenhanceCfg {
    artifact = 3,
    level = 20,
    exp = 2000,
    p1 = 47,
    p1value = 0.15,
    p1type = 1,
    p2 = 48,
    p2value = 0.15,
    p2type = 1,
    p3 = 49,
    p3value = 0.15,
    p3type = 1,
    p4 = 50,
    p4value = 0.15,
    p4type = 1
    };
getRow(3,21)->
    #petenhanceCfg {
    artifact = 3,
    level = 21,
    exp = 2100,
    p1 = 47,
    p1value = 0.1575,
    p1type = 1,
    p2 = 48,
    p2value = 0.1575,
    p2type = 1,
    p3 = 49,
    p3value = 0.1575,
    p3type = 1,
    p4 = 50,
    p4value = 0.1575,
    p4type = 1
    };
getRow(3,22)->
    #petenhanceCfg {
    artifact = 3,
    level = 22,
    exp = 2200,
    p1 = 47,
    p1value = 0.165,
    p1type = 1,
    p2 = 48,
    p2value = 0.165,
    p2type = 1,
    p3 = 49,
    p3value = 0.165,
    p3type = 1,
    p4 = 50,
    p4value = 0.165,
    p4type = 1
    };
getRow(3,23)->
    #petenhanceCfg {
    artifact = 3,
    level = 23,
    exp = 2300,
    p1 = 47,
    p1value = 0.1725,
    p1type = 1,
    p2 = 48,
    p2value = 0.1725,
    p2type = 1,
    p3 = 49,
    p3value = 0.1725,
    p3type = 1,
    p4 = 50,
    p4value = 0.1725,
    p4type = 1
    };
getRow(3,24)->
    #petenhanceCfg {
    artifact = 3,
    level = 24,
    exp = 2400,
    p1 = 47,
    p1value = 0.18,
    p1type = 1,
    p2 = 48,
    p2value = 0.18,
    p2type = 1,
    p3 = 49,
    p3value = 0.18,
    p3type = 1,
    p4 = 50,
    p4value = 0.18,
    p4type = 1
    };
getRow(3,25)->
    #petenhanceCfg {
    artifact = 3,
    level = 25,
    exp = 2500,
    p1 = 47,
    p1value = 0.1875,
    p1type = 1,
    p2 = 48,
    p2value = 0.1875,
    p2type = 1,
    p3 = 49,
    p3value = 0.1875,
    p3type = 1,
    p4 = 50,
    p4value = 0.1875,
    p4type = 1
    };
getRow(3,26)->
    #petenhanceCfg {
    artifact = 3,
    level = 26,
    exp = 2600,
    p1 = 47,
    p1value = 0.195,
    p1type = 1,
    p2 = 48,
    p2value = 0.195,
    p2type = 1,
    p3 = 49,
    p3value = 0.195,
    p3type = 1,
    p4 = 50,
    p4value = 0.195,
    p4type = 1
    };
getRow(3,27)->
    #petenhanceCfg {
    artifact = 3,
    level = 27,
    exp = 2700,
    p1 = 47,
    p1value = 0.2025,
    p1type = 1,
    p2 = 48,
    p2value = 0.2025,
    p2type = 1,
    p3 = 49,
    p3value = 0.2025,
    p3type = 1,
    p4 = 50,
    p4value = 0.2025,
    p4type = 1
    };
getRow(3,28)->
    #petenhanceCfg {
    artifact = 3,
    level = 28,
    exp = 2800,
    p1 = 47,
    p1value = 0.21,
    p1type = 1,
    p2 = 48,
    p2value = 0.21,
    p2type = 1,
    p3 = 49,
    p3value = 0.21,
    p3type = 1,
    p4 = 50,
    p4value = 0.21,
    p4type = 1
    };
getRow(3,29)->
    #petenhanceCfg {
    artifact = 3,
    level = 29,
    exp = 2900,
    p1 = 47,
    p1value = 0.2175,
    p1type = 1,
    p2 = 48,
    p2value = 0.2175,
    p2type = 1,
    p3 = 49,
    p3value = 0.2175,
    p3type = 1,
    p4 = 50,
    p4value = 0.2175,
    p4type = 1
    };
getRow(3,30)->
    #petenhanceCfg {
    artifact = 3,
    level = 30,
    exp = 3000,
    p1 = 47,
    p1value = 0.225,
    p1type = 1,
    p2 = 48,
    p2value = 0.225,
    p2type = 1,
    p3 = 49,
    p3value = 0.225,
    p3type = 1,
    p4 = 50,
    p4value = 0.225,
    p4type = 1
    };
getRow(3,31)->
    #petenhanceCfg {
    artifact = 3,
    level = 31,
    exp = 3100,
    p1 = 47,
    p1value = 0.2325,
    p1type = 1,
    p2 = 48,
    p2value = 0.2325,
    p2type = 1,
    p3 = 49,
    p3value = 0.2325,
    p3type = 1,
    p4 = 50,
    p4value = 0.2325,
    p4type = 1
    };
getRow(3,32)->
    #petenhanceCfg {
    artifact = 3,
    level = 32,
    exp = 3200,
    p1 = 47,
    p1value = 0.24,
    p1type = 1,
    p2 = 48,
    p2value = 0.24,
    p2type = 1,
    p3 = 49,
    p3value = 0.24,
    p3type = 1,
    p4 = 50,
    p4value = 0.24,
    p4type = 1
    };
getRow(3,33)->
    #petenhanceCfg {
    artifact = 3,
    level = 33,
    exp = 3300,
    p1 = 47,
    p1value = 0.2475,
    p1type = 1,
    p2 = 48,
    p2value = 0.2475,
    p2type = 1,
    p3 = 49,
    p3value = 0.2475,
    p3type = 1,
    p4 = 50,
    p4value = 0.2475,
    p4type = 1
    };
getRow(3,34)->
    #petenhanceCfg {
    artifact = 3,
    level = 34,
    exp = 3400,
    p1 = 47,
    p1value = 0.255,
    p1type = 1,
    p2 = 48,
    p2value = 0.255,
    p2type = 1,
    p3 = 49,
    p3value = 0.255,
    p3type = 1,
    p4 = 50,
    p4value = 0.255,
    p4type = 1
    };
getRow(3,35)->
    #petenhanceCfg {
    artifact = 3,
    level = 35,
    exp = 3500,
    p1 = 47,
    p1value = 0.2625,
    p1type = 1,
    p2 = 48,
    p2value = 0.2625,
    p2type = 1,
    p3 = 49,
    p3value = 0.2625,
    p3type = 1,
    p4 = 50,
    p4value = 0.2625,
    p4type = 1
    };
getRow(3,36)->
    #petenhanceCfg {
    artifact = 3,
    level = 36,
    exp = 3600,
    p1 = 47,
    p1value = 0.27,
    p1type = 1,
    p2 = 48,
    p2value = 0.27,
    p2type = 1,
    p3 = 49,
    p3value = 0.27,
    p3type = 1,
    p4 = 50,
    p4value = 0.27,
    p4type = 1
    };
getRow(3,37)->
    #petenhanceCfg {
    artifact = 3,
    level = 37,
    exp = 3700,
    p1 = 47,
    p1value = 0.2775,
    p1type = 1,
    p2 = 48,
    p2value = 0.2775,
    p2type = 1,
    p3 = 49,
    p3value = 0.2775,
    p3type = 1,
    p4 = 50,
    p4value = 0.2775,
    p4type = 1
    };
getRow(3,38)->
    #petenhanceCfg {
    artifact = 3,
    level = 38,
    exp = 3800,
    p1 = 47,
    p1value = 0.285,
    p1type = 1,
    p2 = 48,
    p2value = 0.285,
    p2type = 1,
    p3 = 49,
    p3value = 0.285,
    p3type = 1,
    p4 = 50,
    p4value = 0.285,
    p4type = 1
    };
getRow(3,39)->
    #petenhanceCfg {
    artifact = 3,
    level = 39,
    exp = 3900,
    p1 = 47,
    p1value = 0.2925,
    p1type = 1,
    p2 = 48,
    p2value = 0.2925,
    p2type = 1,
    p3 = 49,
    p3value = 0.2925,
    p3type = 1,
    p4 = 50,
    p4value = 0.2925,
    p4type = 1
    };
getRow(3,40)->
    #petenhanceCfg {
    artifact = 3,
    level = 40,
    exp = 4000,
    p1 = 47,
    p1value = 0.3,
    p1type = 1,
    p2 = 48,
    p2value = 0.3,
    p2type = 1,
    p3 = 49,
    p3value = 0.3,
    p3type = 1,
    p4 = 50,
    p4value = 0.3,
    p4type = 1
    };
getRow(3,41)->
    #petenhanceCfg {
    artifact = 3,
    level = 41,
    exp = 4100,
    p1 = 47,
    p1value = 0.3075,
    p1type = 1,
    p2 = 48,
    p2value = 0.3075,
    p2type = 1,
    p3 = 49,
    p3value = 0.3075,
    p3type = 1,
    p4 = 50,
    p4value = 0.3075,
    p4type = 1
    };
getRow(3,42)->
    #petenhanceCfg {
    artifact = 3,
    level = 42,
    exp = 4200,
    p1 = 47,
    p1value = 0.315,
    p1type = 1,
    p2 = 48,
    p2value = 0.315,
    p2type = 1,
    p3 = 49,
    p3value = 0.315,
    p3type = 1,
    p4 = 50,
    p4value = 0.315,
    p4type = 1
    };
getRow(3,43)->
    #petenhanceCfg {
    artifact = 3,
    level = 43,
    exp = 4300,
    p1 = 47,
    p1value = 0.3225,
    p1type = 1,
    p2 = 48,
    p2value = 0.3225,
    p2type = 1,
    p3 = 49,
    p3value = 0.3225,
    p3type = 1,
    p4 = 50,
    p4value = 0.3225,
    p4type = 1
    };
getRow(3,44)->
    #petenhanceCfg {
    artifact = 3,
    level = 44,
    exp = 4400,
    p1 = 47,
    p1value = 0.33,
    p1type = 1,
    p2 = 48,
    p2value = 0.33,
    p2type = 1,
    p3 = 49,
    p3value = 0.33,
    p3type = 1,
    p4 = 50,
    p4value = 0.33,
    p4type = 1
    };
getRow(3,45)->
    #petenhanceCfg {
    artifact = 3,
    level = 45,
    exp = 4500,
    p1 = 47,
    p1value = 0.3375,
    p1type = 1,
    p2 = 48,
    p2value = 0.3375,
    p2type = 1,
    p3 = 49,
    p3value = 0.3375,
    p3type = 1,
    p4 = 50,
    p4value = 0.3375,
    p4type = 1
    };
getRow(3,46)->
    #petenhanceCfg {
    artifact = 3,
    level = 46,
    exp = 4600,
    p1 = 47,
    p1value = 0.345,
    p1type = 1,
    p2 = 48,
    p2value = 0.345,
    p2type = 1,
    p3 = 49,
    p3value = 0.345,
    p3type = 1,
    p4 = 50,
    p4value = 0.345,
    p4type = 1
    };
getRow(3,47)->
    #petenhanceCfg {
    artifact = 3,
    level = 47,
    exp = 4700,
    p1 = 47,
    p1value = 0.3525,
    p1type = 1,
    p2 = 48,
    p2value = 0.3525,
    p2type = 1,
    p3 = 49,
    p3value = 0.3525,
    p3type = 1,
    p4 = 50,
    p4value = 0.3525,
    p4type = 1
    };
getRow(3,48)->
    #petenhanceCfg {
    artifact = 3,
    level = 48,
    exp = 4800,
    p1 = 47,
    p1value = 0.36,
    p1type = 1,
    p2 = 48,
    p2value = 0.36,
    p2type = 1,
    p3 = 49,
    p3value = 0.36,
    p3type = 1,
    p4 = 50,
    p4value = 0.36,
    p4type = 1
    };
getRow(3,49)->
    #petenhanceCfg {
    artifact = 3,
    level = 49,
    exp = 4900,
    p1 = 47,
    p1value = 0.3675,
    p1type = 1,
    p2 = 48,
    p2value = 0.3675,
    p2type = 1,
    p3 = 49,
    p3value = 0.3675,
    p3type = 1,
    p4 = 50,
    p4value = 0.3675,
    p4type = 1
    };
getRow(3,50)->
    #petenhanceCfg {
    artifact = 3,
    level = 50,
    exp = 5000,
    p1 = 47,
    p1value = 0.375,
    p1type = 1,
    p2 = 48,
    p2value = 0.375,
    p2type = 1,
    p3 = 49,
    p3value = 0.375,
    p3type = 1,
    p4 = 50,
    p4value = 0.375,
    p4type = 1
    };
getRow(3,51)->
    #petenhanceCfg {
    artifact = 3,
    level = 51,
    exp = 5100,
    p1 = 47,
    p1value = 0.3825,
    p1type = 1,
    p2 = 48,
    p2value = 0.3825,
    p2type = 1,
    p3 = 49,
    p3value = 0.3825,
    p3type = 1,
    p4 = 50,
    p4value = 0.3825,
    p4type = 1
    };
getRow(3,52)->
    #petenhanceCfg {
    artifact = 3,
    level = 52,
    exp = 5200,
    p1 = 47,
    p1value = 0.39,
    p1type = 1,
    p2 = 48,
    p2value = 0.39,
    p2type = 1,
    p3 = 49,
    p3value = 0.39,
    p3type = 1,
    p4 = 50,
    p4value = 0.39,
    p4type = 1
    };
getRow(3,53)->
    #petenhanceCfg {
    artifact = 3,
    level = 53,
    exp = 5300,
    p1 = 47,
    p1value = 0.3975,
    p1type = 1,
    p2 = 48,
    p2value = 0.3975,
    p2type = 1,
    p3 = 49,
    p3value = 0.3975,
    p3type = 1,
    p4 = 50,
    p4value = 0.3975,
    p4type = 1
    };
getRow(3,54)->
    #petenhanceCfg {
    artifact = 3,
    level = 54,
    exp = 5400,
    p1 = 47,
    p1value = 0.405,
    p1type = 1,
    p2 = 48,
    p2value = 0.405,
    p2type = 1,
    p3 = 49,
    p3value = 0.405,
    p3type = 1,
    p4 = 50,
    p4value = 0.405,
    p4type = 1
    };
getRow(3,55)->
    #petenhanceCfg {
    artifact = 3,
    level = 55,
    exp = 5500,
    p1 = 47,
    p1value = 0.4125,
    p1type = 1,
    p2 = 48,
    p2value = 0.4125,
    p2type = 1,
    p3 = 49,
    p3value = 0.4125,
    p3type = 1,
    p4 = 50,
    p4value = 0.4125,
    p4type = 1
    };
getRow(3,56)->
    #petenhanceCfg {
    artifact = 3,
    level = 56,
    exp = 5600,
    p1 = 47,
    p1value = 0.42,
    p1type = 1,
    p2 = 48,
    p2value = 0.42,
    p2type = 1,
    p3 = 49,
    p3value = 0.42,
    p3type = 1,
    p4 = 50,
    p4value = 0.42,
    p4type = 1
    };
getRow(3,57)->
    #petenhanceCfg {
    artifact = 3,
    level = 57,
    exp = 5700,
    p1 = 47,
    p1value = 0.4275,
    p1type = 1,
    p2 = 48,
    p2value = 0.4275,
    p2type = 1,
    p3 = 49,
    p3value = 0.4275,
    p3type = 1,
    p4 = 50,
    p4value = 0.4275,
    p4type = 1
    };
getRow(3,58)->
    #petenhanceCfg {
    artifact = 3,
    level = 58,
    exp = 5800,
    p1 = 47,
    p1value = 0.435,
    p1type = 1,
    p2 = 48,
    p2value = 0.435,
    p2type = 1,
    p3 = 49,
    p3value = 0.435,
    p3type = 1,
    p4 = 50,
    p4value = 0.435,
    p4type = 1
    };
getRow(3,59)->
    #petenhanceCfg {
    artifact = 3,
    level = 59,
    exp = 5900,
    p1 = 47,
    p1value = 0.4425,
    p1type = 1,
    p2 = 48,
    p2value = 0.4425,
    p2type = 1,
    p3 = 49,
    p3value = 0.4425,
    p3type = 1,
    p4 = 50,
    p4value = 0.4425,
    p4type = 1
    };
getRow(3,60)->
    #petenhanceCfg {
    artifact = 3,
    level = 60,
    exp = 0,
    p1 = 47,
    p1value = 0.45,
    p1type = 1,
    p2 = 48,
    p2value = 0.45,
    p2type = 1,
    p3 = 49,
    p3value = 0.45,
    p3type = 1,
    p4 = 50,
    p4value = 0.45,
    p4type = 1
    };
getRow(4,1)->
    #petenhanceCfg {
    artifact = 4,
    level = 1,
    exp = 100,
    p1 = 30,
    p1value = 0.015,
    p1type = 1,
    p2 = 31,
    p2value = 0.015,
    p2type = 1,
    p3 = 32,
    p3value = 0.015,
    p3type = 1,
    p4 = 33,
    p4value = 0.015,
    p4type = 1
    };
getRow(4,2)->
    #petenhanceCfg {
    artifact = 4,
    level = 2,
    exp = 200,
    p1 = 30,
    p1value = 0.03,
    p1type = 1,
    p2 = 31,
    p2value = 0.03,
    p2type = 1,
    p3 = 32,
    p3value = 0.03,
    p3type = 1,
    p4 = 33,
    p4value = 0.03,
    p4type = 1
    };
getRow(4,3)->
    #petenhanceCfg {
    artifact = 4,
    level = 3,
    exp = 300,
    p1 = 30,
    p1value = 0.045,
    p1type = 1,
    p2 = 31,
    p2value = 0.045,
    p2type = 1,
    p3 = 32,
    p3value = 0.045,
    p3type = 1,
    p4 = 33,
    p4value = 0.045,
    p4type = 1
    };
getRow(4,4)->
    #petenhanceCfg {
    artifact = 4,
    level = 4,
    exp = 400,
    p1 = 30,
    p1value = 0.06,
    p1type = 1,
    p2 = 31,
    p2value = 0.06,
    p2type = 1,
    p3 = 32,
    p3value = 0.06,
    p3type = 1,
    p4 = 33,
    p4value = 0.06,
    p4type = 1
    };
getRow(4,5)->
    #petenhanceCfg {
    artifact = 4,
    level = 5,
    exp = 500,
    p1 = 30,
    p1value = 0.075,
    p1type = 1,
    p2 = 31,
    p2value = 0.075,
    p2type = 1,
    p3 = 32,
    p3value = 0.075,
    p3type = 1,
    p4 = 33,
    p4value = 0.075,
    p4type = 1
    };
getRow(4,6)->
    #petenhanceCfg {
    artifact = 4,
    level = 6,
    exp = 600,
    p1 = 30,
    p1value = 0.09,
    p1type = 1,
    p2 = 31,
    p2value = 0.09,
    p2type = 1,
    p3 = 32,
    p3value = 0.09,
    p3type = 1,
    p4 = 33,
    p4value = 0.09,
    p4type = 1
    };
getRow(4,7)->
    #petenhanceCfg {
    artifact = 4,
    level = 7,
    exp = 700,
    p1 = 30,
    p1value = 0.105,
    p1type = 1,
    p2 = 31,
    p2value = 0.105,
    p2type = 1,
    p3 = 32,
    p3value = 0.105,
    p3type = 1,
    p4 = 33,
    p4value = 0.105,
    p4type = 1
    };
getRow(4,8)->
    #petenhanceCfg {
    artifact = 4,
    level = 8,
    exp = 800,
    p1 = 30,
    p1value = 0.12,
    p1type = 1,
    p2 = 31,
    p2value = 0.12,
    p2type = 1,
    p3 = 32,
    p3value = 0.12,
    p3type = 1,
    p4 = 33,
    p4value = 0.12,
    p4type = 1
    };
getRow(4,9)->
    #petenhanceCfg {
    artifact = 4,
    level = 9,
    exp = 900,
    p1 = 30,
    p1value = 0.135,
    p1type = 1,
    p2 = 31,
    p2value = 0.135,
    p2type = 1,
    p3 = 32,
    p3value = 0.135,
    p3type = 1,
    p4 = 33,
    p4value = 0.135,
    p4type = 1
    };
getRow(4,10)->
    #petenhanceCfg {
    artifact = 4,
    level = 10,
    exp = 1000,
    p1 = 30,
    p1value = 0.15,
    p1type = 1,
    p2 = 31,
    p2value = 0.15,
    p2type = 1,
    p3 = 32,
    p3value = 0.15,
    p3type = 1,
    p4 = 33,
    p4value = 0.15,
    p4type = 1
    };
getRow(4,11)->
    #petenhanceCfg {
    artifact = 4,
    level = 11,
    exp = 1100,
    p1 = 30,
    p1value = 0.165,
    p1type = 1,
    p2 = 31,
    p2value = 0.165,
    p2type = 1,
    p3 = 32,
    p3value = 0.165,
    p3type = 1,
    p4 = 33,
    p4value = 0.165,
    p4type = 1
    };
getRow(4,12)->
    #petenhanceCfg {
    artifact = 4,
    level = 12,
    exp = 1200,
    p1 = 30,
    p1value = 0.18,
    p1type = 1,
    p2 = 31,
    p2value = 0.18,
    p2type = 1,
    p3 = 32,
    p3value = 0.18,
    p3type = 1,
    p4 = 33,
    p4value = 0.18,
    p4type = 1
    };
getRow(4,13)->
    #petenhanceCfg {
    artifact = 4,
    level = 13,
    exp = 1300,
    p1 = 30,
    p1value = 0.195,
    p1type = 1,
    p2 = 31,
    p2value = 0.195,
    p2type = 1,
    p3 = 32,
    p3value = 0.195,
    p3type = 1,
    p4 = 33,
    p4value = 0.195,
    p4type = 1
    };
getRow(4,14)->
    #petenhanceCfg {
    artifact = 4,
    level = 14,
    exp = 1400,
    p1 = 30,
    p1value = 0.21,
    p1type = 1,
    p2 = 31,
    p2value = 0.21,
    p2type = 1,
    p3 = 32,
    p3value = 0.21,
    p3type = 1,
    p4 = 33,
    p4value = 0.21,
    p4type = 1
    };
getRow(4,15)->
    #petenhanceCfg {
    artifact = 4,
    level = 15,
    exp = 1500,
    p1 = 30,
    p1value = 0.225,
    p1type = 1,
    p2 = 31,
    p2value = 0.225,
    p2type = 1,
    p3 = 32,
    p3value = 0.225,
    p3type = 1,
    p4 = 33,
    p4value = 0.225,
    p4type = 1
    };
getRow(4,16)->
    #petenhanceCfg {
    artifact = 4,
    level = 16,
    exp = 1600,
    p1 = 30,
    p1value = 0.24,
    p1type = 1,
    p2 = 31,
    p2value = 0.24,
    p2type = 1,
    p3 = 32,
    p3value = 0.24,
    p3type = 1,
    p4 = 33,
    p4value = 0.24,
    p4type = 1
    };
getRow(4,17)->
    #petenhanceCfg {
    artifact = 4,
    level = 17,
    exp = 1700,
    p1 = 30,
    p1value = 0.255,
    p1type = 1,
    p2 = 31,
    p2value = 0.255,
    p2type = 1,
    p3 = 32,
    p3value = 0.255,
    p3type = 1,
    p4 = 33,
    p4value = 0.255,
    p4type = 1
    };
getRow(4,18)->
    #petenhanceCfg {
    artifact = 4,
    level = 18,
    exp = 1800,
    p1 = 30,
    p1value = 0.27,
    p1type = 1,
    p2 = 31,
    p2value = 0.27,
    p2type = 1,
    p3 = 32,
    p3value = 0.27,
    p3type = 1,
    p4 = 33,
    p4value = 0.27,
    p4type = 1
    };
getRow(4,19)->
    #petenhanceCfg {
    artifact = 4,
    level = 19,
    exp = 1900,
    p1 = 30,
    p1value = 0.285,
    p1type = 1,
    p2 = 31,
    p2value = 0.285,
    p2type = 1,
    p3 = 32,
    p3value = 0.285,
    p3type = 1,
    p4 = 33,
    p4value = 0.285,
    p4type = 1
    };
getRow(4,20)->
    #petenhanceCfg {
    artifact = 4,
    level = 20,
    exp = 2000,
    p1 = 30,
    p1value = 0.3,
    p1type = 1,
    p2 = 31,
    p2value = 0.3,
    p2type = 1,
    p3 = 32,
    p3value = 0.3,
    p3type = 1,
    p4 = 33,
    p4value = 0.3,
    p4type = 1
    };
getRow(4,21)->
    #petenhanceCfg {
    artifact = 4,
    level = 21,
    exp = 2100,
    p1 = 30,
    p1value = 0.315,
    p1type = 1,
    p2 = 31,
    p2value = 0.315,
    p2type = 1,
    p3 = 32,
    p3value = 0.315,
    p3type = 1,
    p4 = 33,
    p4value = 0.315,
    p4type = 1
    };
getRow(4,22)->
    #petenhanceCfg {
    artifact = 4,
    level = 22,
    exp = 2200,
    p1 = 30,
    p1value = 0.33,
    p1type = 1,
    p2 = 31,
    p2value = 0.33,
    p2type = 1,
    p3 = 32,
    p3value = 0.33,
    p3type = 1,
    p4 = 33,
    p4value = 0.33,
    p4type = 1
    };
getRow(4,23)->
    #petenhanceCfg {
    artifact = 4,
    level = 23,
    exp = 2300,
    p1 = 30,
    p1value = 0.345,
    p1type = 1,
    p2 = 31,
    p2value = 0.345,
    p2type = 1,
    p3 = 32,
    p3value = 0.345,
    p3type = 1,
    p4 = 33,
    p4value = 0.345,
    p4type = 1
    };
getRow(4,24)->
    #petenhanceCfg {
    artifact = 4,
    level = 24,
    exp = 2400,
    p1 = 30,
    p1value = 0.36,
    p1type = 1,
    p2 = 31,
    p2value = 0.36,
    p2type = 1,
    p3 = 32,
    p3value = 0.36,
    p3type = 1,
    p4 = 33,
    p4value = 0.36,
    p4type = 1
    };
getRow(4,25)->
    #petenhanceCfg {
    artifact = 4,
    level = 25,
    exp = 2500,
    p1 = 30,
    p1value = 0.375,
    p1type = 1,
    p2 = 31,
    p2value = 0.375,
    p2type = 1,
    p3 = 32,
    p3value = 0.375,
    p3type = 1,
    p4 = 33,
    p4value = 0.375,
    p4type = 1
    };
getRow(4,26)->
    #petenhanceCfg {
    artifact = 4,
    level = 26,
    exp = 2600,
    p1 = 30,
    p1value = 0.39,
    p1type = 1,
    p2 = 31,
    p2value = 0.39,
    p2type = 1,
    p3 = 32,
    p3value = 0.39,
    p3type = 1,
    p4 = 33,
    p4value = 0.39,
    p4type = 1
    };
getRow(4,27)->
    #petenhanceCfg {
    artifact = 4,
    level = 27,
    exp = 2700,
    p1 = 30,
    p1value = 0.405,
    p1type = 1,
    p2 = 31,
    p2value = 0.405,
    p2type = 1,
    p3 = 32,
    p3value = 0.405,
    p3type = 1,
    p4 = 33,
    p4value = 0.405,
    p4type = 1
    };
getRow(4,28)->
    #petenhanceCfg {
    artifact = 4,
    level = 28,
    exp = 2800,
    p1 = 30,
    p1value = 0.42,
    p1type = 1,
    p2 = 31,
    p2value = 0.42,
    p2type = 1,
    p3 = 32,
    p3value = 0.42,
    p3type = 1,
    p4 = 33,
    p4value = 0.42,
    p4type = 1
    };
getRow(4,29)->
    #petenhanceCfg {
    artifact = 4,
    level = 29,
    exp = 2900,
    p1 = 30,
    p1value = 0.435,
    p1type = 1,
    p2 = 31,
    p2value = 0.435,
    p2type = 1,
    p3 = 32,
    p3value = 0.435,
    p3type = 1,
    p4 = 33,
    p4value = 0.435,
    p4type = 1
    };
getRow(4,30)->
    #petenhanceCfg {
    artifact = 4,
    level = 30,
    exp = 3000,
    p1 = 30,
    p1value = 0.45,
    p1type = 1,
    p2 = 31,
    p2value = 0.45,
    p2type = 1,
    p3 = 32,
    p3value = 0.45,
    p3type = 1,
    p4 = 33,
    p4value = 0.45,
    p4type = 1
    };
getRow(4,31)->
    #petenhanceCfg {
    artifact = 4,
    level = 31,
    exp = 3100,
    p1 = 30,
    p1value = 0.465,
    p1type = 1,
    p2 = 31,
    p2value = 0.465,
    p2type = 1,
    p3 = 32,
    p3value = 0.465,
    p3type = 1,
    p4 = 33,
    p4value = 0.465,
    p4type = 1
    };
getRow(4,32)->
    #petenhanceCfg {
    artifact = 4,
    level = 32,
    exp = 3200,
    p1 = 30,
    p1value = 0.48,
    p1type = 1,
    p2 = 31,
    p2value = 0.48,
    p2type = 1,
    p3 = 32,
    p3value = 0.48,
    p3type = 1,
    p4 = 33,
    p4value = 0.48,
    p4type = 1
    };
getRow(4,33)->
    #petenhanceCfg {
    artifact = 4,
    level = 33,
    exp = 3300,
    p1 = 30,
    p1value = 0.495,
    p1type = 1,
    p2 = 31,
    p2value = 0.495,
    p2type = 1,
    p3 = 32,
    p3value = 0.495,
    p3type = 1,
    p4 = 33,
    p4value = 0.495,
    p4type = 1
    };
getRow(4,34)->
    #petenhanceCfg {
    artifact = 4,
    level = 34,
    exp = 3400,
    p1 = 30,
    p1value = 0.51,
    p1type = 1,
    p2 = 31,
    p2value = 0.51,
    p2type = 1,
    p3 = 32,
    p3value = 0.51,
    p3type = 1,
    p4 = 33,
    p4value = 0.51,
    p4type = 1
    };
getRow(4,35)->
    #petenhanceCfg {
    artifact = 4,
    level = 35,
    exp = 3500,
    p1 = 30,
    p1value = 0.525,
    p1type = 1,
    p2 = 31,
    p2value = 0.525,
    p2type = 1,
    p3 = 32,
    p3value = 0.525,
    p3type = 1,
    p4 = 33,
    p4value = 0.525,
    p4type = 1
    };
getRow(4,36)->
    #petenhanceCfg {
    artifact = 4,
    level = 36,
    exp = 3600,
    p1 = 30,
    p1value = 0.54,
    p1type = 1,
    p2 = 31,
    p2value = 0.54,
    p2type = 1,
    p3 = 32,
    p3value = 0.54,
    p3type = 1,
    p4 = 33,
    p4value = 0.54,
    p4type = 1
    };
getRow(4,37)->
    #petenhanceCfg {
    artifact = 4,
    level = 37,
    exp = 3700,
    p1 = 30,
    p1value = 0.555,
    p1type = 1,
    p2 = 31,
    p2value = 0.555,
    p2type = 1,
    p3 = 32,
    p3value = 0.555,
    p3type = 1,
    p4 = 33,
    p4value = 0.555,
    p4type = 1
    };
getRow(4,38)->
    #petenhanceCfg {
    artifact = 4,
    level = 38,
    exp = 3800,
    p1 = 30,
    p1value = 0.57,
    p1type = 1,
    p2 = 31,
    p2value = 0.57,
    p2type = 1,
    p3 = 32,
    p3value = 0.57,
    p3type = 1,
    p4 = 33,
    p4value = 0.57,
    p4type = 1
    };
getRow(4,39)->
    #petenhanceCfg {
    artifact = 4,
    level = 39,
    exp = 3900,
    p1 = 30,
    p1value = 0.585,
    p1type = 1,
    p2 = 31,
    p2value = 0.585,
    p2type = 1,
    p3 = 32,
    p3value = 0.585,
    p3type = 1,
    p4 = 33,
    p4value = 0.585,
    p4type = 1
    };
getRow(4,40)->
    #petenhanceCfg {
    artifact = 4,
    level = 40,
    exp = 4000,
    p1 = 30,
    p1value = 0.6,
    p1type = 1,
    p2 = 31,
    p2value = 0.6,
    p2type = 1,
    p3 = 32,
    p3value = 0.6,
    p3type = 1,
    p4 = 33,
    p4value = 0.6,
    p4type = 1
    };
getRow(4,41)->
    #petenhanceCfg {
    artifact = 4,
    level = 41,
    exp = 4100,
    p1 = 30,
    p1value = 0.615,
    p1type = 1,
    p2 = 31,
    p2value = 0.615,
    p2type = 1,
    p3 = 32,
    p3value = 0.615,
    p3type = 1,
    p4 = 33,
    p4value = 0.615,
    p4type = 1
    };
getRow(4,42)->
    #petenhanceCfg {
    artifact = 4,
    level = 42,
    exp = 4200,
    p1 = 30,
    p1value = 0.63,
    p1type = 1,
    p2 = 31,
    p2value = 0.63,
    p2type = 1,
    p3 = 32,
    p3value = 0.63,
    p3type = 1,
    p4 = 33,
    p4value = 0.63,
    p4type = 1
    };
getRow(4,43)->
    #petenhanceCfg {
    artifact = 4,
    level = 43,
    exp = 4300,
    p1 = 30,
    p1value = 0.645,
    p1type = 1,
    p2 = 31,
    p2value = 0.645,
    p2type = 1,
    p3 = 32,
    p3value = 0.645,
    p3type = 1,
    p4 = 33,
    p4value = 0.645,
    p4type = 1
    };
getRow(4,44)->
    #petenhanceCfg {
    artifact = 4,
    level = 44,
    exp = 4400,
    p1 = 30,
    p1value = 0.66,
    p1type = 1,
    p2 = 31,
    p2value = 0.66,
    p2type = 1,
    p3 = 32,
    p3value = 0.66,
    p3type = 1,
    p4 = 33,
    p4value = 0.66,
    p4type = 1
    };
getRow(4,45)->
    #petenhanceCfg {
    artifact = 4,
    level = 45,
    exp = 4500,
    p1 = 30,
    p1value = 0.675,
    p1type = 1,
    p2 = 31,
    p2value = 0.675,
    p2type = 1,
    p3 = 32,
    p3value = 0.675,
    p3type = 1,
    p4 = 33,
    p4value = 0.675,
    p4type = 1
    };
getRow(4,46)->
    #petenhanceCfg {
    artifact = 4,
    level = 46,
    exp = 4600,
    p1 = 30,
    p1value = 0.69,
    p1type = 1,
    p2 = 31,
    p2value = 0.69,
    p2type = 1,
    p3 = 32,
    p3value = 0.69,
    p3type = 1,
    p4 = 33,
    p4value = 0.69,
    p4type = 1
    };
getRow(4,47)->
    #petenhanceCfg {
    artifact = 4,
    level = 47,
    exp = 4700,
    p1 = 30,
    p1value = 0.705,
    p1type = 1,
    p2 = 31,
    p2value = 0.705,
    p2type = 1,
    p3 = 32,
    p3value = 0.705,
    p3type = 1,
    p4 = 33,
    p4value = 0.705,
    p4type = 1
    };
getRow(4,48)->
    #petenhanceCfg {
    artifact = 4,
    level = 48,
    exp = 4800,
    p1 = 30,
    p1value = 0.72,
    p1type = 1,
    p2 = 31,
    p2value = 0.72,
    p2type = 1,
    p3 = 32,
    p3value = 0.72,
    p3type = 1,
    p4 = 33,
    p4value = 0.72,
    p4type = 1
    };
getRow(4,49)->
    #petenhanceCfg {
    artifact = 4,
    level = 49,
    exp = 4900,
    p1 = 30,
    p1value = 0.735,
    p1type = 1,
    p2 = 31,
    p2value = 0.735,
    p2type = 1,
    p3 = 32,
    p3value = 0.735,
    p3type = 1,
    p4 = 33,
    p4value = 0.735,
    p4type = 1
    };
getRow(4,50)->
    #petenhanceCfg {
    artifact = 4,
    level = 50,
    exp = 5000,
    p1 = 30,
    p1value = 0.75,
    p1type = 1,
    p2 = 31,
    p2value = 0.75,
    p2type = 1,
    p3 = 32,
    p3value = 0.75,
    p3type = 1,
    p4 = 33,
    p4value = 0.75,
    p4type = 1
    };
getRow(4,51)->
    #petenhanceCfg {
    artifact = 4,
    level = 51,
    exp = 5100,
    p1 = 30,
    p1value = 0.765,
    p1type = 1,
    p2 = 31,
    p2value = 0.765,
    p2type = 1,
    p3 = 32,
    p3value = 0.765,
    p3type = 1,
    p4 = 33,
    p4value = 0.765,
    p4type = 1
    };
getRow(4,52)->
    #petenhanceCfg {
    artifact = 4,
    level = 52,
    exp = 5200,
    p1 = 30,
    p1value = 0.78,
    p1type = 1,
    p2 = 31,
    p2value = 0.78,
    p2type = 1,
    p3 = 32,
    p3value = 0.78,
    p3type = 1,
    p4 = 33,
    p4value = 0.78,
    p4type = 1
    };
getRow(4,53)->
    #petenhanceCfg {
    artifact = 4,
    level = 53,
    exp = 5300,
    p1 = 30,
    p1value = 0.795,
    p1type = 1,
    p2 = 31,
    p2value = 0.795,
    p2type = 1,
    p3 = 32,
    p3value = 0.795,
    p3type = 1,
    p4 = 33,
    p4value = 0.795,
    p4type = 1
    };
getRow(4,54)->
    #petenhanceCfg {
    artifact = 4,
    level = 54,
    exp = 5400,
    p1 = 30,
    p1value = 0.81,
    p1type = 1,
    p2 = 31,
    p2value = 0.81,
    p2type = 1,
    p3 = 32,
    p3value = 0.81,
    p3type = 1,
    p4 = 33,
    p4value = 0.81,
    p4type = 1
    };
getRow(4,55)->
    #petenhanceCfg {
    artifact = 4,
    level = 55,
    exp = 5500,
    p1 = 30,
    p1value = 0.825,
    p1type = 1,
    p2 = 31,
    p2value = 0.825,
    p2type = 1,
    p3 = 32,
    p3value = 0.825,
    p3type = 1,
    p4 = 33,
    p4value = 0.825,
    p4type = 1
    };
getRow(4,56)->
    #petenhanceCfg {
    artifact = 4,
    level = 56,
    exp = 5600,
    p1 = 30,
    p1value = 0.84,
    p1type = 1,
    p2 = 31,
    p2value = 0.84,
    p2type = 1,
    p3 = 32,
    p3value = 0.84,
    p3type = 1,
    p4 = 33,
    p4value = 0.84,
    p4type = 1
    };
getRow(4,57)->
    #petenhanceCfg {
    artifact = 4,
    level = 57,
    exp = 5700,
    p1 = 30,
    p1value = 0.855,
    p1type = 1,
    p2 = 31,
    p2value = 0.855,
    p2type = 1,
    p3 = 32,
    p3value = 0.855,
    p3type = 1,
    p4 = 33,
    p4value = 0.855,
    p4type = 1
    };
getRow(4,58)->
    #petenhanceCfg {
    artifact = 4,
    level = 58,
    exp = 5800,
    p1 = 30,
    p1value = 0.87,
    p1type = 1,
    p2 = 31,
    p2value = 0.87,
    p2type = 1,
    p3 = 32,
    p3value = 0.87,
    p3type = 1,
    p4 = 33,
    p4value = 0.87,
    p4type = 1
    };
getRow(4,59)->
    #petenhanceCfg {
    artifact = 4,
    level = 59,
    exp = 5900,
    p1 = 30,
    p1value = 0.885,
    p1type = 1,
    p2 = 31,
    p2value = 0.885,
    p2type = 1,
    p3 = 32,
    p3value = 0.885,
    p3type = 1,
    p4 = 33,
    p4value = 0.885,
    p4type = 1
    };
getRow(4,60)->
    #petenhanceCfg {
    artifact = 4,
    level = 60,
    exp = 0,
    p1 = 30,
    p1value = 0.9,
    p1type = 1,
    p2 = 31,
    p2value = 0.9,
    p2type = 1,
    p3 = 32,
    p3value = 0.9,
    p3type = 1,
    p4 = 33,
    p4value = 0.9,
    p4type = 1
    };
getRow(_,_)->[].

getKeyList()->[
    {1,1},
    {1,2},
    {1,3},
    {1,4},
    {1,5},
    {1,6},
    {1,7},
    {1,8},
    {1,9},
    {1,10},
    {1,11},
    {1,12},
    {1,13},
    {1,14},
    {1,15},
    {1,16},
    {1,17},
    {1,18},
    {1,19},
    {1,20},
    {1,21},
    {1,22},
    {1,23},
    {1,24},
    {1,25},
    {1,26},
    {1,27},
    {1,28},
    {1,29},
    {1,30},
    {1,31},
    {1,32},
    {1,33},
    {1,34},
    {1,35},
    {1,36},
    {1,37},
    {1,38},
    {1,39},
    {1,40},
    {1,41},
    {1,42},
    {1,43},
    {1,44},
    {1,45},
    {1,46},
    {1,47},
    {1,48},
    {1,49},
    {1,50},
    {1,51},
    {1,52},
    {1,53},
    {1,54},
    {1,55},
    {1,56},
    {1,57},
    {1,58},
    {1,59},
    {1,60},
    {2,1},
    {2,2},
    {2,3},
    {2,4},
    {2,5},
    {2,6},
    {2,7},
    {2,8},
    {2,9},
    {2,10},
    {2,11},
    {2,12},
    {2,13},
    {2,14},
    {2,15},
    {2,16},
    {2,17},
    {2,18},
    {2,19},
    {2,20},
    {2,21},
    {2,22},
    {2,23},
    {2,24},
    {2,25},
    {2,26},
    {2,27},
    {2,28},
    {2,29},
    {2,30},
    {2,31},
    {2,32},
    {2,33},
    {2,34},
    {2,35},
    {2,36},
    {2,37},
    {2,38},
    {2,39},
    {2,40},
    {2,41},
    {2,42},
    {2,43},
    {2,44},
    {2,45},
    {2,46},
    {2,47},
    {2,48},
    {2,49},
    {2,50},
    {2,51},
    {2,52},
    {2,53},
    {2,54},
    {2,55},
    {2,56},
    {2,57},
    {2,58},
    {2,59},
    {2,60},
    {3,1},
    {3,2},
    {3,3},
    {3,4},
    {3,5},
    {3,6},
    {3,7},
    {3,8},
    {3,9},
    {3,10},
    {3,11},
    {3,12},
    {3,13},
    {3,14},
    {3,15},
    {3,16},
    {3,17},
    {3,18},
    {3,19},
    {3,20},
    {3,21},
    {3,22},
    {3,23},
    {3,24},
    {3,25},
    {3,26},
    {3,27},
    {3,28},
    {3,29},
    {3,30},
    {3,31},
    {3,32},
    {3,33},
    {3,34},
    {3,35},
    {3,36},
    {3,37},
    {3,38},
    {3,39},
    {3,40},
    {3,41},
    {3,42},
    {3,43},
    {3,44},
    {3,45},
    {3,46},
    {3,47},
    {3,48},
    {3,49},
    {3,50},
    {3,51},
    {3,52},
    {3,53},
    {3,54},
    {3,55},
    {3,56},
    {3,57},
    {3,58},
    {3,59},
    {3,60},
    {4,1},
    {4,2},
    {4,3},
    {4,4},
    {4,5},
    {4,6},
    {4,7},
    {4,8},
    {4,9},
    {4,10},
    {4,11},
    {4,12},
    {4,13},
    {4,14},
    {4,15},
    {4,16},
    {4,17},
    {4,18},
    {4,19},
    {4,20},
    {4,21},
    {4,22},
    {4,23},
    {4,24},
    {4,25},
    {4,26},
    {4,27},
    {4,28},
    {4,29},
    {4,30},
    {4,31},
    {4,32},
    {4,33},
    {4,34},
    {4,35},
    {4,36},
    {4,37},
    {4,38},
    {4,39},
    {4,40},
    {4,41},
    {4,42},
    {4,43},
    {4,44},
    {4,45},
    {4,46},
    {4,47},
    {4,48},
    {4,49},
    {4,50},
    {4,51},
    {4,52},
    {4,53},
    {4,54},
    {4,55},
    {4,56},
    {4,57},
    {4,58},
    {4,59},
    {4,60}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4
    ].

get2KeyList(1)->[
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
    60
    ];
get2KeyList(2)->[
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
    60
    ];
get2KeyList(3)->[
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
    60
    ];
get2KeyList(4)->[
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
    60
    ];
get2KeyList(_)->[].

