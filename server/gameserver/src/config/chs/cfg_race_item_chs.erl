%% coding: latin-1
%%: 实现
-module(cfg_race_item_chs).
-compile(export_all).
-include("cfg_race_item.hrl").
-include("logger.hrl").

getRow(1)->
    #race_itemCfg {
    id = 1,
    type = 2,
    param1 = [63000,63001],
    param2 = [5,10],
    rand = [1000,1000,1000,1000,1000,1000,1000,1000,900,800,700,600,500,400]
    };
getRow(2)->
    #race_itemCfg {
    id = 2,
    type = 1,
    param1 = [63002,63003],
    rand = [1000,1000,1000,1000,1000,1000,1000,1000,900,800,700,600,500,400]
    };
getRow(3)->
    #race_itemCfg {
    id = 3,
    type = 3,
    param1 = [63004,63005],
    rand = [0,500,600,700,800,900,1000,1000,1000,1000,900,800,700,600]
    };
getRow(4)->
    #race_itemCfg {
    id = 4,
    type = 5,
    param1 = [16000,16001],
    param2 = [-5,0],
    rand = [1000,1000,1000,1000,1000,1000,1000,1000,900,800,700,600,500,400]
    };
getRow(5)->
    #race_itemCfg {
    id = 5,
    type = 2,
    param1 = [63008,63009],
    param2 = [5,10],
    rand = [1000,1000,1000,1000,1000,1000,1000,1000,900,800,700,600,500,400]
    };
getRow(6)->
    #race_itemCfg {
    id = 6,
    type = 1,
    param1 = [63010,63011],
    rand = [0,100,200,300,400,500,600,700,800,900,1000,1300,1600,1900]
    };
getRow(7)->
    #race_itemCfg {
    id = 7,
    type = 5,
    param1 = [16002,16003],
    param2 = [5,0],
    rand = [0,0,0,0,0,0,0,0,0,0,0,0,0,0]
    };
getRow(8)->
    #race_itemCfg {
    id = 8,
    type = 5,
    param1 = [16004,16005],
    param2 = [-5,0],
    rand = [1000,1000,1000,1000,1000,1000,1000,1000,900,800,700,600,500,400]
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
    {8}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8
    ].

