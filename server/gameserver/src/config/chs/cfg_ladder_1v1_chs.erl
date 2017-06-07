%% coding: latin-1
%%: 实现
-module(cfg_ladder_1v1_chs).
-compile(export_all).
-include("cfg_ladder_1v1.hrl").
-include("logger.hrl").

getRow(1,1)->
    #ladder_1v1Cfg {
    rank_start = 1,
    rank_end = 1,
    monsterID = [9144,9145,9146,9147,9148,9149,9150,9151,9152,9153,9154,9155],
    fc_value = [120000,130000]
    };
getRow(2,2)->
    #ladder_1v1Cfg {
    rank_start = 2,
    rank_end = 2,
    monsterID = [9132,9133,9134,9135,9136,9137,9138,9139,9140,9141,9142,9143],
    fc_value = [110000,119999]
    };
getRow(3,3)->
    #ladder_1v1Cfg {
    rank_start = 3,
    rank_end = 3,
    monsterID = [9120,9121,9122,9123,9124,9125,9126,9127,9128,9129,9130,9131],
    fc_value = [100000,109999]
    };
getRow(4,4)->
    #ladder_1v1Cfg {
    rank_start = 4,
    rank_end = 4,
    monsterID = [9108,9109,9110,9111,9112,9113,9114,9115,9116,9117,9118,9119],
    fc_value = [90000,99999]
    };
getRow(5,5)->
    #ladder_1v1Cfg {
    rank_start = 5,
    rank_end = 5,
    monsterID = [9096,9097,9098,9099,9100,9101,9102,9103,9104,9105,9106,9107],
    fc_value = [80000,89999]
    };
getRow(6,10)->
    #ladder_1v1Cfg {
    rank_start = 6,
    rank_end = 10,
    monsterID = [9084,9085,9086,9087,9088,9089,9090,9091,9092,9093,9094,9095],
    fc_value = [70000,79999]
    };
getRow(11,50)->
    #ladder_1v1Cfg {
    rank_start = 11,
    rank_end = 50,
    monsterID = [9072,9073,9074,9075,9076,9077,9078,9079,9080,9081,9082,9083],
    fc_value = [60000,69999]
    };
getRow(51,100)->
    #ladder_1v1Cfg {
    rank_start = 51,
    rank_end = 100,
    monsterID = [9060,9061,9062,9063,9064,9065,9066,9067,9068,9069,9070,9071],
    fc_value = [50000,59999]
    };
getRow(101,400)->
    #ladder_1v1Cfg {
    rank_start = 101,
    rank_end = 400,
    monsterID = [9048,9049,9050,9051,9052,9053,9054,9055,9056,9057,9058,9059],
    fc_value = [40000,49999]
    };
getRow(401,800)->
    #ladder_1v1Cfg {
    rank_start = 401,
    rank_end = 800,
    monsterID = [9036,9037,9038,9039,9040,9041,9042,9043,9044,9045,9046,9047],
    fc_value = [30000,39999]
    };
getRow(801,1300)->
    #ladder_1v1Cfg {
    rank_start = 801,
    rank_end = 1300,
    monsterID = [9024,9025,9026,9027,9028,9029,9030,9031,9032,9033,9034,9035],
    fc_value = [20000,29999]
    };
getRow(1301,2000)->
    #ladder_1v1Cfg {
    rank_start = 1301,
    rank_end = 2000,
    monsterID = [9012,9013,9014,9015,9016,9017,9018,9019,9020,9021,9022,9023],
    fc_value = [10000,19999]
    };
getRow(2001,3000)->
    #ladder_1v1Cfg {
    rank_start = 2001,
    rank_end = 3000,
    monsterID = [9000,9001,9002,9003,9004,9005,9006,9007,9008,9009,9010,9011],
    fc_value = [5000,9999]
    };
getRow(_,_)->[].

getKeyList()->[
    {1,1},
    {2,2},
    {3,3},
    {4,4},
    {5,5},
    {6,10},
    {11,50},
    {51,100},
    {101,400},
    {401,800},
    {801,1300},
    {1301,2000},
    {2001,3000}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5,
    6,
    11,
    51,
    101,
    401,
    801,
    1301,
    2001
    ].

get2KeyList(1)->[
    1
    ];
get2KeyList(2)->[
    2
    ];
get2KeyList(3)->[
    3
    ];
get2KeyList(4)->[
    4
    ];
get2KeyList(5)->[
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
get2KeyList(_)->[].

