%% coding: latin-1
%%: 实现
-module(cfg_home_area_chs).
-compile(export_all).
-include("cfg_home_area.hrl").
-include("logger.hrl").

getRow(1,1)->
    #home_areaCfg {
    id = 1,
    type = 1,
    level = 1,
    name = "普通小屋",
    homelevel = 1,
    materials = [{3200,10},{3201,20}],
    coin_cost = [{1,2000},{3,200}],
    area_position = [{-28,23},{-30,42},{-4,47},{-1,28}],
    position_parm = 0
    };
getRow(1,2)->
    #home_areaCfg {
    id = 1,
    type = 1,
    level = 2,
    name = "精致小屋",
    homelevel = 2,
    materials = [{3200,10},{3201,21}],
    coin_cost = [{1,2000},{3,200}],
    area_position = [{-28,23},{-30,42},{-4,47},{-1,28}],
    position_parm = 0
    };
getRow(1,3)->
    #home_areaCfg {
    id = 1,
    type = 1,
    level = 3,
    name = "豪华小屋",
    homelevel = 3,
    area_position = [{-28,23},{-30,42},{-4,47},{-1,28}],
    position_parm = 0
    };
getRow(3,1)->
    #home_areaCfg {
    id = 3,
    type = 2,
    level = 1,
    name = "一级饲养区",
    homelevel = 1,
    materials = [{3200,10},{3201,23}],
    coin_cost = [{1,2000},{3,200}],
    area_position = [{-79,-13},{-87,-15},{-95,-3},{-96,12},{-69,21},{-60,8},{-61,-8}],
    position_parm = 0
    };
getRow(3,2)->
    #home_areaCfg {
    id = 3,
    type = 2,
    level = 2,
    name = "二级饲养区",
    homelevel = 3,
    materials = [{3200,10},{3201,23}],
    coin_cost = [{1,2000},{3,200}],
    area_position = [{-79,-13},{-87,-15},{-95,-3},{-96,12},{-69,21},{-60,8},{-61,-8}],
    position_parm = 0
    };
getRow(3,3)->
    #home_areaCfg {
    id = 3,
    type = 2,
    level = 3,
    name = "三级饲养区",
    homelevel = 4,
    coin_cost = [{1,2000},{3,200}],
    area_position = [{-79,-13},{-87,-15},{-95,-3},{-96,12},{-69,21},{-60,8},{-61,-8}],
    position_parm = 0
    };
getRow(4,1)->
    #home_areaCfg {
    id = 4,
    type = 3,
    level = 1,
    name = "农田A",
    homelevel = 1,
    area_position = [{67,48},{67,41},{67,34},{72,48},{72,41},{72,34}],
    position_parm = 1
    };
getRow(8,0)->
    #home_areaCfg {
    id = 8,
    type = 3,
    level = 0,
    name = "农田B",
    homelevel = 2,
    materials = [{3200,10},{3201,24}],
    coin_cost = [{1,2000},{2,207}],
    area_position = [{353,98},{352,93},{340,88},{353,101},{352,95},{340,91}],
    position_parm = 1
    };
getRow(8,1)->
    #home_areaCfg {
    id = 8,
    type = 3,
    level = 1,
    name = "农田B",
    homelevel = 2,
    area_position = [{353,98},{352,93},{340,88},{353,101},{352,95},{340,91}],
    position_parm = 1
    };
getRow(9,0)->
    #home_areaCfg {
    id = 9,
    type = 3,
    level = 0,
    name = "农田C",
    homelevel = 5,
    materials = [{3200,10},{3201,25}],
    coin_cost = [{1,2000},{2,207}],
    area_position = [{383,98},{352,93},{370,88},{383,101},{382,95},{370,91}],
    position_parm = 1
    };
getRow(9,1)->
    #home_areaCfg {
    id = 9,
    type = 3,
    level = 1,
    name = "农田C",
    homelevel = 5,
    area_position = [{383,98},{352,93},{370,88},{383,101},{382,95},{370,91}],
    position_parm = 1
    };
getRow(_,_)->[].

getKeyList()->[
    {1,1},
    {1,2},
    {1,3},
    {3,1},
    {3,2},
    {3,3},
    {4,1},
    {8,0},
    {8,1},
    {9,0},
    {9,1}
    ].

get1KeyList()->[
    1,
    3,
    4,
    8,
    9
    ].

get2KeyList(1)->[
    1,
    2,
    3
    ];
get2KeyList(3)->[
    1,
    2,
    3
    ];
get2KeyList(4)->[
    1
    ];
get2KeyList(8)->[
    0,
    1
    ];
get2KeyList(9)->[
    0,
    1
    ];
get2KeyList(_)->[].

