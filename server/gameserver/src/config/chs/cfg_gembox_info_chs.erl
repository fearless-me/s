%% coding: latin-1
%%: 实现
-module(cfg_gembox_info_chs).
-compile(export_all).
-include("cfg_gembox_info.hrl").
-include("logger.hrl").

getRow(0,1)->
    #gembox_infoCfg {
    type = 0,
    id = 1,
    quality = 0,
    color = 3
    };
getRow(0,2)->
    #gembox_infoCfg {
    type = 0,
    id = 2,
    quality = 0,
    color = 2
    };
getRow(0,3)->
    #gembox_infoCfg {
    type = 0,
    id = 3,
    quality = 3,
    color = 2
    };
getRow(1,1)->
    #gembox_infoCfg {
    type = 1,
    id = 1,
    quality = 0,
    color = 3
    };
getRow(1,2)->
    #gembox_infoCfg {
    type = 1,
    id = 2,
    quality = 0,
    color = 1
    };
getRow(1,3)->
    #gembox_infoCfg {
    type = 1,
    id = 3,
    quality = 3,
    color = 2
    };
getRow(2,1)->
    #gembox_infoCfg {
    type = 2,
    id = 1,
    quality = 0,
    color = 3
    };
getRow(2,2)->
    #gembox_infoCfg {
    type = 2,
    id = 2,
    quality = 0,
    color = 2
    };
getRow(2,3)->
    #gembox_infoCfg {
    type = 2,
    id = 3,
    quality = 3,
    color = 2
    };
getRow(3,1)->
    #gembox_infoCfg {
    type = 3,
    id = 1,
    quality = 0,
    color = 3
    };
getRow(3,2)->
    #gembox_infoCfg {
    type = 3,
    id = 2,
    quality = 0,
    color = 2
    };
getRow(3,3)->
    #gembox_infoCfg {
    type = 3,
    id = 3,
    quality = 3,
    color = 2
    };
getRow(4,1)->
    #gembox_infoCfg {
    type = 4,
    id = 1,
    quality = 0,
    color = 1
    };
getRow(4,2)->
    #gembox_infoCfg {
    type = 4,
    id = 2,
    quality = 0,
    color = 2
    };
getRow(4,3)->
    #gembox_infoCfg {
    type = 4,
    id = 3,
    quality = 3,
    color = 2
    };
getRow(5,1)->
    #gembox_infoCfg {
    type = 5,
    id = 1,
    quality = 0,
    color = 3
    };
getRow(5,2)->
    #gembox_infoCfg {
    type = 5,
    id = 2,
    quality = 0,
    color = 2
    };
getRow(5,3)->
    #gembox_infoCfg {
    type = 5,
    id = 3,
    quality = 3,
    color = 1
    };
getRow(6,1)->
    #gembox_infoCfg {
    type = 6,
    id = 1,
    quality = 0,
    color = 3
    };
getRow(6,2)->
    #gembox_infoCfg {
    type = 6,
    id = 2,
    quality = 0,
    color = 2
    };
getRow(6,3)->
    #gembox_infoCfg {
    type = 6,
    id = 3,
    quality = 3,
    color = 2
    };
getRow(7,1)->
    #gembox_infoCfg {
    type = 7,
    id = 1,
    quality = 0,
    color = 1
    };
getRow(7,2)->
    #gembox_infoCfg {
    type = 7,
    id = 2,
    quality = 0,
    color = 2
    };
getRow(7,3)->
    #gembox_infoCfg {
    type = 7,
    id = 3,
    quality = 3,
    color = 2
    };
getRow(_,_)->[].

getKeyList()->[
    {0,1},
    {0,2},
    {0,3},
    {1,1},
    {1,2},
    {1,3},
    {2,1},
    {2,2},
    {2,3},
    {3,1},
    {3,2},
    {3,3},
    {4,1},
    {4,2},
    {4,3},
    {5,1},
    {5,2},
    {5,3},
    {6,1},
    {6,2},
    {6,3},
    {7,1},
    {7,2},
    {7,3}
    ].

get1KeyList()->[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7
    ].

get2KeyList(0)->[
    1,
    2,
    3
    ];
get2KeyList(1)->[
    1,
    2,
    3
    ];
get2KeyList(2)->[
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
    1,
    2,
    3
    ];
get2KeyList(5)->[
    1,
    2,
    3
    ];
get2KeyList(6)->[
    1,
    2,
    3
    ];
get2KeyList(7)->[
    1,
    2,
    3
    ];
get2KeyList(_)->[].

