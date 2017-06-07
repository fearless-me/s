%% coding: latin-1
%%: 实现
-module(cfg_trigger_chs).
-compile(export_all).
-include("cfg_trigger.hrl").
-include("logger.hrl").

getRow(1)->
    #triggerCfg {
    id = 1,
    module = "errorCodeTrigger",
    method = "send_error_code_from_condation_argu",
    argu = []
    };
getRow(2)->
    #triggerCfg {
    id = 2,
    module = "mapTrigger",
    method = "transferCurrentRoleToMap",
    argu = [507,[[194.0,186.0]]]
    };
getRow(3)->
    #triggerCfg {
    id = 3,
    module = "mapTrigger",
    method = "transferCurrentRoleToMap",
    argu = [508,[[194.0,186.0]]]
    };
getRow(4)->
    #triggerCfg {
    id = 4,
    module = "mapTrigger",
    method = "transferCurrentRoleToLastMap",
    argu = []
    };
getRow(5)->
    #triggerCfg {
    id = 5,
    module = "playerTrigger",
    method = "addPlayerDailyCountByProgram",
    argu = []
    };
getRow(6)->
    #triggerCfg {
    id = 6,
    module = "lotterySys",
    method = "t_onceLottery",
    argu = [92]
    };
getRow(7)->
    #triggerCfg {
    id = 7,
    module = "lotterySys",
    method = "t_onceLottery",
    argu = [20050]
    };
getRow(8)->
    #triggerCfg {
    id = 8,
    module = "playerTrigger",
    method = "useCoinByRuleFromConfig",
    argu = [103,100,10061,76]
    };
getRow(9)->
    #triggerCfg {
    id = 9,
    module = "playerTrigger",
    method = "useCoinByRuleFromConfig",
    argu = [103,900,10061,76]
    };
getRow(10)->
    #triggerCfg {
    id = 10,
    module = "lotterySys",
    method = "t_tenTimesLottery",
    argu = [20051]
    };
getRow(11)->
    #triggerCfg {
    id = 11,
    module = "lotterySys",
    method = "t_onceLottery",
    argu = [93]
    };
getRow(12)->
    #triggerCfg {
    id = 12,
    module = "lotterySys",
    method = "t_onceLottery",
    argu = [20052]
    };
getRow(13)->
    #triggerCfg {
    id = 13,
    module = "playerTrigger",
    method = "useCoinByRuleFromConfig",
    argu = [103,300,10062,76]
    };
getRow(14)->
    #triggerCfg {
    id = 14,
    module = "lotterySys",
    method = "t_tenTimesLottery",
    argu = [20053]
    };
getRow(15)->
    #triggerCfg {
    id = 15,
    module = "playerTrigger",
    method = "useCoinByRuleFromConfig",
    argu = [103,2700,10062,76]
    };
getRow(16)->
    #triggerCfg {
    id = 16,
    module = "playerTrigger",
    method = "addGoodsAndMailByProgram",
    argu = [69,84]
    };
getRow(17)->
    #triggerCfg {
    id = 17,
    module = "mapTrigger",
    method = "transferCurrentRoleToHotMap",
    argu = [8000,[[105,-8],[85,15],[100,33],[-24,-118],[42,-118],[164,33],[176,33],[128,33],[96,-116]]]
    };
getRow(18)->
    #triggerCfg {
    id = 18,
    module = "acLSBattlefieldTrigger",
    method = "changeActiveState",
    argu = [1]
    };
getRow(19)->
    #triggerCfg {
    id = 19,
    module = "acLSBattlefieldTrigger",
    method = "changeActiveState",
    argu = [2]
    };
getRow(20)->
    #triggerCfg {
    id = 20,
    module = "acLSBattlefieldTrigger",
    method = "changeActiveState",
    argu = [3]
    };
getRow(21)->
    #triggerCfg {
    id = 21,
    module = "acLSBattlefieldTrigger",
    method = "changeActiveState",
    argu = [4]
    };
getRow(22)->
    #triggerCfg {
    id = 22,
    module = "mapTrigger",
    method = "transferCurrentRoleToMap",
    argu = [1,[[99,63],[99,63],[99,63],[99,63]]]
    };
getRow(23)->
    #triggerCfg {
    id = 23,
    module = "acLSBattlefieldTrigger",
    method = "addScore",
    argu = [1]
    };
getRow(24)->
    #triggerCfg {
    id = 24,
    module = "acLSBattlefieldTrigger",
    method = "addScore",
    argu = [10]
    };
getRow(25)->
    #triggerCfg {
    id = 25,
    module = "acLSBattlefieldTrigger",
    method = "addScore",
    argu = [100]
    };
getRow(26)->
    #triggerCfg {
    id = 26,
    module = "acLSBattlefieldTrigger",
    method = "addKillPlayerNumber",
    argu = [1]
    };
getRow(27)->
    #triggerCfg {
    id = 27,
    module = "noticeTrigger",
    method = "broad_cast_map_notice_by_progrom",
    argu = [oneking_totalkill_10]
    };
getRow(28)->
    #triggerCfg {
    id = 28,
    module = "noticeTrigger",
    method = "broad_cast_map_notice_by_progrom",
    argu = [oneking_totalkill_20]
    };
getRow(29)->
    #triggerCfg {
    id = 29,
    module = "noticeTrigger",
    method = "broad_cast_server_pmd_notice",
    argu = [oneking_totalkill_50]
    };
getRow(30)->
    #triggerCfg {
    id = 30,
    module = "noticeTrigger",
    method = "broad_cast_server_pmd_notice",
    argu = [oneking_totalkill_100]
    };
getRow(31)->
    #triggerCfg {
    id = 31,
    module = "monsterTrigger",
    method = "call_monster_not_exist",
    argu = [8000,[[3301,1,81,145],[3301,1,162,87],[3301,1,176,163]]]
    };
getRow(32)->
    #triggerCfg {
    id = 32,
    module = "noticeTrigger",
    method = "broad_cast_map_notice_by_progrom",
    argu = [oneking_serialkill_5]
    };
getRow(33)->
    #triggerCfg {
    id = 33,
    module = "noticeTrigger",
    method = "broad_cast_map_notice_by_progrom",
    argu = [oneking_serialkill_10]
    };
getRow(34)->
    #triggerCfg {
    id = 34,
    module = "noticeTrigger",
    method = "broad_cast_server_pmd_notice",
    argu = [oneking_serialkill_20]
    };
getRow(35)->
    #triggerCfg {
    id = 35,
    module = "noticeTrigger",
    method = "broad_cast_server_pmd_notice",
    argu = [oneking_serialkill_50]
    };
getRow(36)->
    #triggerCfg {
    id = 36,
    module = "playerTrigger",
    method = "addExpCurrentRoleByProgrom",
    argu = []
    };
getRow(37)->
    #triggerCfg {
    id = 37,
    module = "playerTrigger",
    method = "addBuffCurrentRole",
    argu = [21]
    };
getRow(38)->
    #triggerCfg {
    id = 38,
    module = "noticeTrigger",
    method = "broad_cast_map_notice_by_progrom",
    argu = [oneking_bossborn]
    };
getRow(39)->
    #triggerCfg {
    id = 39,
    module = "noticeTrigger",
    method = "broad_cast_map_notice_by_progrom",
    argu = [oneking_bossdead]
    };
getRow(40)->
    #triggerCfg {
    id = 40,
    module = "noticeTrigger",
    method = "send_system_msg",
    argu = [oneking_revenge]
    };
getRow(41)->
    #triggerCfg {
    id = 41,
    module = "acLSBattlefieldTrigger",
    method = "removeFromRevengeList",
    argu = []
    };
getRow(42)->
    #triggerCfg {
    id = 42,
    module = "acLSBattlefieldTrigger",
    method = "sendRankAward",
    argu = [[[900,200000],[901,10000]],[1,1,5000,1,0],[2,2,5001,1,0],[3,3,5002,1,0],[4,10,5003,1,0],[11,50,5004,1,0],[51,200,5005,1,0],[201,3000,5006,1,0]]
    };
getRow(43)->
    #triggerCfg {
    id = 43,
    module = "noticeTrigger",
    method = "broad_cast_server_pmd_notice",
    argu = [oneking_rankfirst]
    };
getRow(44)->
    #triggerCfg {
    id = 44,
    module = "fightTrigger",
    method = "changePKState",
    argu = [0]
    };
getRow(45)->
    #triggerCfg {
    id = 45,
    module = "fightTrigger",
    method = "changePKState",
    argu = [1]
    };
getRow(46)->
    #triggerCfg {
    id = 46,
    module = "acLSBattlefieldTrigger",
    method = "changeActiveState",
    argu = [0]
    };
getRow(47)->
    #triggerCfg {
    id = 47,
    module = "playerActionPointTrigger",
    method = "addActionPoint",
    argu = [120]
    };
getRow(48)->
    #triggerCfg {
    id = 48,
    module = "playerTrigger",
    method = "addPlayerDailyCountByCfgArgu",
    argu = [97,0,1]
    };
getRow(49)->
    #triggerCfg {
    id = 49,
    module = "playerTrigger",
    method = "useCoinByRuleFromConfig",
    argu = [103,[{1,60},{2,80},{3,100}],10063,76]
    };
getRow(50)->
    #triggerCfg {
    id = 50,
    module = "acLSBattlefieldTrigger",
    method = "changeActiveState",
    argu = [5]
    };
getRow(51)->
    #triggerCfg {
    id = 51,
    module = "needForSpeedTrigger",
    method = "match",
    argu = []
    };
getRow(52)->
    #triggerCfg {
    id = 52,
    module = "needForSpeedTrigger",
    method = "cancelMatch",
    argu = []
    };
getRow(53)->
    #triggerCfg {
    id = 53,
    module = "needForSpeedTrigger",
    method = "exitCompetition",
    argu = []
    };
getRow(54)->
    #triggerCfg {
    id = 54,
    module = "playerTrigger",
    method = "addBuff2SelectTarget",
    argu = [22]
    };
getRow(55)->
    #triggerCfg {
    id = 55,
    module = "monsterTrigger",
    method = "call_monster_force_near_current_player_pos",
    argu = [[8999,1]]
    };
getRow(56)->
    #triggerCfg {
    id = 56,
    module = "playerTrigger",
    method = "addBuff2SelectTarget",
    argu = [5]
    };
getRow(57)->
    #triggerCfg {
    id = 57,
    module = "playerTrigger",
    method = "addBuff2SelectTarget",
    argu = [233]
    };
getRow(58)->
    #triggerCfg {
    id = 58,
    module = "playerTrigger",
    method = "addBuffCurrentRole",
    argu = [173]
    };
getRow(59)->
    #triggerCfg {
    id = 59,
    module = "playerTrigger",
    method = "addBuffCurrentRole",
    argu = [21]
    };
getRow(60)->
    #triggerCfg {
    id = 60,
    module = "playerTrigger",
    method = "addBuffCurrentRole",
    argu = [7]
    };
getRow(61)->
    #triggerCfg {
    id = 61,
    module = "playerTrigger",
    method = "addBuffCurrentRole",
    argu = [8]
    };
getRow(62)->
    #triggerCfg {
    id = 62,
    module = "mapTrigger",
    method = "transferCurrentRoleToLastMap",
    argu = []
    };
getRow(63)->
    #triggerCfg {
    id = 63,
    module = "playerTrigger",
    method = "sendGoodsMailByProgram",
    argu = [needForSpeedExitAwardTitle,needForSpeedExitAwardContext,88]
    };
getRow(64)->
    #triggerCfg {
    id = 64,
    module = "playerTrigger",
    method = "sendGoodsMailByProgram",
    argu = [needForSpeedAwardTitle,needForSpeedAwardContext,88]
    };
getRow(65)->
    #triggerCfg {
    id = 65,
    module = "needForSpeedTrigger",
    method = "add_award_number_once",
    argu = []
    };
getRow(66)->
    #triggerCfg {
    id = 66,
    module = "playerTrigger",
    method = "addBuffCurrentRole",
    argu = [20]
    };
getRow(67)->
    #triggerCfg {
    id = 67,
    module = "playerTrigger",
    method = "addBuffCurrentRole",
    argu = [174]
    };
getRow(68)->
    #triggerCfg {
    id = 68,
    module = "playerTrigger",
    method = "addBuffCurrentRole",
    argu = [6]
    };
getRow(69)->
    #triggerCfg {
    id = 69,
    module = "needForSpeedTrigger",
    method = "sync_award_numberFromDailyCounter",
    argu = []
    };
getRow(70)->
    #triggerCfg {
    id = 70,
    module = "playerTrigger",
    method = "addBuffCurrentRole",
    argu = [9]
    };
getRow(71)->
    #triggerCfg {
    id = 71,
    module = "acKingBattleTrigger",
    method = "addBuff2Defender",
    argu = []
    };
getRow(72)->
    #triggerCfg {
    id = 72,
    module = "acKingBattleTrigger",
    method = "addBuff2Attacker",
    argu = []
    };
getRow(73)->
    #triggerCfg {
    id = 73,
    module = "acKingBattleTrigger",
    method = "changeAttackerStateJoin",
    argu = []
    };
getRow(74)->
    #triggerCfg {
    id = 74,
    module = "acKingBattleTrigger",
    method = "changeAttackerStateLeave",
    argu = []
    };
getRow(75)->
    #triggerCfg {
    id = 75,
    module = "acKingBattleTrigger",
    method = "addBuff2mirror",
    argu = []
    };
getRow(76)->
    #triggerCfg {
    id = 76,
    module = "acKingBattleTrigger",
    method = "deductCoinWhenDeferderSelfByBuff",
    argu = []
    };
getRow(77)->
    #triggerCfg {
    id = 77,
    module = "acKingBattleTrigger",
    method = "deductCoinWhenMirrorByBuff",
    argu = []
    };
getRow(78)->
    #triggerCfg {
    id = 78,
    module = "acKingBattleTrigger",
    method = "deductCoinWhenAttackerByBuff",
    argu = []
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
    {78}
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
    78
    ].

