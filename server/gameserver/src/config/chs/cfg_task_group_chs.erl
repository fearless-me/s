%% coding: latin-1
%%: 实现
-module(cfg_task_group_chs).
-compile(export_all).
-include("cfg_task_group.hrl").
-include("logger.hrl").

getRow(1)->
    #task_groupCfg {
    id = 1,
    groupname = "魔族入侵事件",
    groupmap = "阿克勒港口",
    groupcontent = "阿克勒港口的村民原本在这过着安宁快乐的生活，直到魔族入侵后打破了港口的平静。港口的勇士们不甘臣服魔族，悄悄的聚在一起商议着对抗魔族的计划。"
    };
getRow(2)->
    #task_groupCfg {
    id = 2,
    groupname = "东城郊瘟疫事件",
    groupmap = "阿克勒东城郊",
    groupcontent = "东城郊区是进入阿克勒主城的交界地带，魔族入侵后，城主大人派出卫兵严守此地。但是近日里东城郊一旦还是出现了很多魔族，他们的到来令驻守在这里的卫兵感到十分头疼。"
    };
getRow(3)->
    #task_groupCfg {
    id = 3,
    groupname = "荒野魔族事件",
    groupmap = "阿克勒平原",
    groupcontent = "魔族散播瘟疫以后，没有人愿意再进入阿克勒平原了，为此东城郊的卫兵们感到深深的愤怒。但是面对可怕的瘟疫，大家还是选择了忍耐，卫兵队长无比希望城主大人早日能派来勇敢的年轻人进入阿克勒平原，为大家敢走散播瘟疫的魔族。"
    };
getRow(4)->
    #task_groupCfg {
    id = 4,
    groupname = "苍空塔盗宝事件",
    groupmap = "苍空之塔",
    groupcontent = "苍空之塔常年被厚重的积雪包围，寒冷的天气并没有征服生活在这里的居民。但是随着魔族入侵令这片原本安宁的小镇增添了恐怖的色彩，在罗宾城主的带领下，城民们勇敢的拿出自己的武器来对抗可怕的魔族。"
    };
getRow(5)->
    #task_groupCfg {
    id = 5,
    groupname = "出逃的公主事件",
    groupmap = "海洋之心",
    groupcontent = "贝尔公主失踪后令爱德华国王非常难过，为了寻回爱女，国王发布悬赏征集勇敢的年轻人找回自己心爱的女儿，殊不知在贝尔公主失踪的背后隐藏了与生命石有关的巨大阴谋。"
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

