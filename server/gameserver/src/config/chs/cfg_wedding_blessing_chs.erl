%%: 实现
-module(cfg_wedding_blessing_chs).
-compile(export_all).
-include("cfg_wedding_blessing.hrl").
-include("logger.hrl").

getRow(1)->
    #wedding_blessingCfg {
    id = 1,
    content = "希望新人永结同心，百年好合~"
    };
getRow(2)->
    #wedding_blessingCfg {
    id = 2,
    content = "恭喜你在游戏中找到心爱的伴侣。"
    };
getRow(3)->
    #wedding_blessingCfg {
    id = 3,
    content = "恭喜你们夫妻二人成功脱单！"
    };
getRow(4)->
    #wedding_blessingCfg {
    id = 4,
    content = "希望你们可以一直恩爱和睦！"
    };
getRow(5)->
    #wedding_blessingCfg {
    id = 5,
    content = "希望你们爱情甜蜜！"
    };
getRow(_)->[].

getKeyList()->[
    {1},
    {2},
    {3},
    {4},
    {5}
    ].

get1KeyList()->[
    1,
    2,
    3,
    4,
    5
    ].

