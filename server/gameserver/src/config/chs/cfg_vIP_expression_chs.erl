%% coding: latin-1
%%: 实现
-module(cfg_vIP_expression_chs).
-compile(export_all).
-include("cfg_vIP_expression.hrl").
-include("logger.hrl").

getRow(1)->
    #vIP_expressionCfg {
    vIP_LEVEL = 3,
    expression = "#51"
    };
getRow(2)->
    #vIP_expressionCfg {
    vIP_LEVEL = 3,
    expression = "#52"
    };
getRow(3)->
    #vIP_expressionCfg {
    vIP_LEVEL = 3,
    expression = "#53"
    };
getRow(4)->
    #vIP_expressionCfg {
    vIP_LEVEL = 3,
    expression = "#54"
    };
getRow(5)->
    #vIP_expressionCfg {
    vIP_LEVEL = 3,
    expression = "#56"
    };
getRow(6)->
    #vIP_expressionCfg {
    vIP_LEVEL = 3,
    expression = "#57"
    };
getRow(7)->
    #vIP_expressionCfg {
    vIP_LEVEL = 3,
    expression = "#58"
    };
getRow(8)->
    #vIP_expressionCfg {
    vIP_LEVEL = 3,
    expression = "#59"
    };
getRow(9)->
    #vIP_expressionCfg {
    vIP_LEVEL = 3,
    expression = "#60"
    };
getRow(10)->
    #vIP_expressionCfg {
    vIP_LEVEL = 8,
    expression = "&16"
    };
getRow(11)->
    #vIP_expressionCfg {
    vIP_LEVEL = 8,
    expression = "&17"
    };
getRow(12)->
    #vIP_expressionCfg {
    vIP_LEVEL = 8,
    expression = "&18"
    };
getRow(13)->
    #vIP_expressionCfg {
    vIP_LEVEL = 8,
    expression = "&19"
    };
getRow(14)->
    #vIP_expressionCfg {
    vIP_LEVEL = 8,
    expression = "&20"
    };
getRow(15)->
    #vIP_expressionCfg {
    vIP_LEVEL = 8,
    expression = "&21"
    };
getRow(16)->
    #vIP_expressionCfg {
    vIP_LEVEL = 8,
    expression = "&22"
    };
getRow(17)->
    #vIP_expressionCfg {
    vIP_LEVEL = 8,
    expression = "&23"
    };
getRow(18)->
    #vIP_expressionCfg {
    vIP_LEVEL = 8,
    expression = "&24"
    };
getRow(19)->
    #vIP_expressionCfg {
    vIP_LEVEL = 8,
    expression = "&25"
    };
getRow(_)->[].

getKeyList()->[
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
    {19}
    ].

get1KeyList()->[
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
    19
    ].

