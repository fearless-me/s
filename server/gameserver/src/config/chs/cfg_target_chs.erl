%% coding: latin-1
%%: 实现
-module(cfg_target_chs).
-compile(export_all).
-include("cfg_target.hrl").
-include("logger.hrl").

getRow(1)->
    #targetCfg {
    id = 1,
    module = "playerTargetSelfEnv",
    method = "initSelf",
    argu = []
    };
getRow(2)->
    #targetCfg {
    id = 2,
    module = "playerTargetSelfEnv",
    method = "addSelf2Target",
    argu = []
    };
getRow(3)->
    #targetCfg {
    id = 3,
    module = "playerTargetSelfEnv",
    method = "getCircleRoleIDList",
    argu = [12]
    };
getRow(4)->
    #targetCfg {
    id = 4,
    module = "playerTargetSelfEnv",
    method = "filterTargetRoleIDByRange",
    argu = [12]
    };
getRow(5)->
    #targetCfg {
    id = 5,
    module = "needForSpeedPubTarget",
    method = "getRoleIDsByRankSpace",
    argu = [1,1]
    };
getRow(6)->
    #targetCfg {
    id = 6,
    module = "needForSpeedPubTarget",
    method = "addPetCopilot2Target",
    argu = []
    };
getRow(7)->
    #targetCfg {
    id = 7,
    module = "playerTargetSelfEnv",
    method = "removeSelfFromTargetRoleIDList",
    argu = []
    };
getRow(8)->
    #targetCfg {
    id = 8,
    module = "playerTargetSelfEnv",
    method = "addSelf2Target",
    argu = []
    };
getRow(9)->
    #targetCfg {
    id = 9,
    module = "needForSpeedPubTarget",
    method = "addCurrentMasterInTarget",
    argu = []
    };
getRow(10)->
    #targetCfg {
    id = 10,
    module = "needForSpeedPubTarget",
    method = "removeCurrentMasterInTarget",
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
    {10}
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
    10
    ].

