%% coding: latin-1
%%: 实现
-module(cfg_ladder_1v1_rand_chs).
-compile(export_all).
-include("cfg_ladder_1v1_rand.hrl").
-include("logger.hrl").

getRow(1,5)->
    #ladder_1v1_randCfg {
    rank_start = 1,
    rank_end = 5,
    back_1 = [1,3],
    back_2 = [3,5],
    front_1 = [1,1],
    front_2 = [1,1],
    front_3 = [1,1],
    front_4 = [1,1]
    };
getRow(6,10)->
    #ladder_1v1_randCfg {
    rank_start = 6,
    rank_end = 10,
    back_1 = [1,30],
    back_2 = [30,50],
    front_1 = [1,3],
    front_2 = [1,3],
    front_3 = [1,3],
    front_4 = [1,1]
    };
getRow(11,50)->
    #ladder_1v1_randCfg {
    rank_start = 11,
    rank_end = 50,
    back_1 = [1,30],
    back_2 = [30,50],
    front_1 = [15,23],
    front_2 = [15,23],
    front_3 = [15,23],
    front_4 = [1,1]
    };
getRow(51,100)->
    #ladder_1v1_randCfg {
    rank_start = 51,
    rank_end = 100,
    back_1 = [1,30],
    back_2 = [30,50],
    front_1 = [20,30],
    front_2 = [20,30],
    front_3 = [20,30],
    front_4 = [1,1]
    };
getRow(101,400)->
    #ladder_1v1_randCfg {
    rank_start = 101,
    rank_end = 400,
    back_1 = [1,30],
    back_2 = [30,50],
    front_1 = [50,150],
    front_2 = [50,150],
    front_3 = [50,150],
    front_4 = [1,1]
    };
getRow(401,800)->
    #ladder_1v1_randCfg {
    rank_start = 401,
    rank_end = 800,
    back_1 = [1,30],
    back_2 = [30,50],
    front_1 = [150,250],
    front_2 = [150,250],
    front_3 = [150,250],
    front_4 = [1,2]
    };
getRow(801,1300)->
    #ladder_1v1_randCfg {
    rank_start = 801,
    rank_end = 1300,
    back_1 = [1,30],
    back_2 = [30,50],
    front_1 = [100,200],
    front_2 = [100,200],
    front_3 = [100,200],
    front_4 = [1,2]
    };
getRow(1301,2000)->
    #ladder_1v1_randCfg {
    rank_start = 1301,
    rank_end = 2000,
    back_1 = [1,30],
    back_2 = [30,50],
    front_1 = [400,500],
    front_2 = [650,700],
    front_3 = [650,700],
    front_4 = [1,2]
    };
getRow(2001,3000)->
    #ladder_1v1_randCfg {
    rank_start = 2001,
    rank_end = 3000,
    back_1 = [1,30],
    back_2 = [30,50],
    front_1 = [600,700],
    front_2 = [1100,1300],
    front_3 = [1100,1300],
    front_4 = [1,2]
    };
getRow(3001,10000)->
    #ladder_1v1_randCfg {
    rank_start = 3001,
    rank_end = 10000,
    back_1 = [1,30],
    back_2 = [30,50],
    front_1 = [800,900],
    front_2 = [1100,1300],
    front_3 = [1100,1300],
    front_4 = [1,2]
    };
getRow(10001,1000000000)->
    #ladder_1v1_randCfg {
    rank_start = 10001,
    rank_end = 1000000000,
    back_1 = [1,30],
    back_2 = [30,50],
    front_1 = [1000,1500],
    front_2 = [1000,1500],
    front_3 = [1000,1500],
    front_4 = [1,2]
    };
getRow(_,_)->[].

getKeyList()->[
    {1,5},
    {6,10},
    {11,50},
    {51,100},
    {101,400},
    {401,800},
    {801,1300},
    {1301,2000},
    {2001,3000},
    {3001,10000},
    {10001,1000000000}
    ].

get1KeyList()->[
    1,
    6,
    11,
    51,
    101,
    401,
    801,
    1301,
    2001,
    3001,
    10001
    ].

get2KeyList(1)->[
    5
    ];
get2KeyList(6)->[
    10
    ];
get2KeyList(11)->[
    50
    ];
get2KeyList(51)->[
    100
    ];
get2KeyList(101)->[
    400
    ];
get2KeyList(401)->[
    800
    ];
get2KeyList(801)->[
    1300
    ];
get2KeyList(1301)->[
    2000
    ];
get2KeyList(2001)->[
    3000
    ];
get2KeyList(3001)->[
    10000
    ];
get2KeyList(10001)->[
    1000000000
    ];
get2KeyList(_)->[].

