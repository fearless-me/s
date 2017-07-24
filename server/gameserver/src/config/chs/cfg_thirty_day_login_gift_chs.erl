%% coding: latin-1
%%: 实现
-module(cfg_thirty_day_login_gift_chs).
-compile(export_all).
-include("cfg_thirty_day_login_gift.hrl").
-include("logger.hrl").

getRow(100)->
    #thirty_day_login_giftCfg {
    id = 100,
    name = "蓝色武器",
    type = 1,
    value = 10,
    title = "优质武器",
    text = "战力飙升↗主人你值得拥有",
    rewardstype = 1,
    rewards = [{101,31009},{201,31057},{301,31105}],
    modelType = 0,
    display = 2,
    tabIcon = [1002,2002,3002],
    model = [{101,31009},{201,31057},{301,31105}]
    };
getRow(101)->
    #thirty_day_login_giftCfg {
    id = 101,
    name = "粉红独角兽",
    type = 1,
    value = 20,
    title = "时尚骑宠",
    text = "宠爱★粉色与彩虹",
    rewardstype = 3,
    rewards = [{1836,1}],
    modelType = 1,
    display = 2,
    tabIcon = [1003],
    model = [{53006}]
    };
getRow(102)->
    #thirty_day_login_giftCfg {
    id = 102,
    name = "星空之翼礼包",
    type = 1,
    value = 25,
    title = "翅膀强化",
    text = "点亮星空翅膀★十二星座闪亮",
    rewardstype = 3,
    rewards = [{4303,8},{4304,4},{4305,1}],
    modelType = 2,
    display = 1,
    tabIcon = [98],
    model = [{4005}]
    };
getRow(103)->
    #thirty_day_login_giftCfg {
    id = 103,
    name = "萌萌兔(服饰)",
    type = 2,
    value = 2,
    title = "COSPLAY",
    text = "主人✿穿上我会越来越可爱哦",
    rewardstype = 2,
    rewards = [{0,27010},{1,27011}],
    modelType = 3,
    display = 2,
    tabIcon = [2011,2012],
    model = [{0,18},{1,19}]
    };
getRow(104)->
    #thirty_day_login_giftCfg {
    id = 104,
    name = "萌萌兔(头饰)",
    type = 1,
    value = 32,
    title = "COSPLAY",
    text = "主人✿戴上我会越来越可爱哦",
    rewardstype = 2,
    rewards = [{0,27008},{1,27009}],
    modelType = 3,
    display = 2,
    tabIcon = [2009,2010],
    model = [{0,16},{1,17}]
    };
getRow(105)->
    #thirty_day_login_giftCfg {
    id = 105,
    name = "紫色骑宠-翼狮",
    type = 2,
    value = 3,
    title = "时尚骑宠",
    text = "宠爱★英勇和睿智",
    rewardstype = 3,
    rewards = [{1853,1}],
    modelType = 1,
    display = 2,
    tabIcon = [1011],
    model = [{55003}]
    };
getRow(106)->
    #thirty_day_login_giftCfg {
    id = 106,
    name = "雷灵之心",
    type = 2,
    value = 3,
    title = "雷器灵解锁",
    text = "热烈欢迎器灵小雷的加入666",
    rewardstype = 3,
    rewards = [{2502,1}],
    modelType = 4,
    display = 2,
    tabIcon = [3002],
    model = [{1227}]
    };
getRow(107)->
    #thirty_day_login_giftCfg {
    id = 107,
    name = "强化大礼",
    type = 1,
    value = 35,
    title = "装备强化",
    text = "主人快成长↗提升装备战斗力",
    rewardstype = 3,
    rewards = [{222,100},{224,50},{225,50}],
    modelType = 2,
    display = 1,
    tabIcon = [22],
    model = [{4005}]
    };
getRow(108)->
    #thirty_day_login_giftCfg {
    id = 108,
    name = "钻石大礼",
    type = 2,
    value = 4,
    title = "钻石相赠",
    text = "我可比钻戒值钱＄拿去随便花",
    rewardstype = 3,
    rewards = [{907,1},{22007,1}],
    modelType = 2,
    display = 1,
    tabIcon = [4024],
    model = [{4005}]
    };
getRow(109)->
    #thirty_day_login_giftCfg {
    id = 109,
    name = "时装大礼",
    type = 2,
    value = 5,
    title = "COSPLAY",
    text = "每天都要美美的",
    rewardstype = 3,
    rewards = [{20,2000}],
    modelType = 2,
    display = 1,
    tabIcon = [4005],
    model = [{4005}]
    };
getRow(110)->
    #thirty_day_login_giftCfg {
    id = 110,
    name = "西瓜鲨",
    type = 2,
    value = 6,
    title = "时尚骑宠",
    text = "宠爱★休闲和娱乐",
    rewardstype = 3,
    rewards = [{1847,1}],
    modelType = 1,
    display = 2,
    tabIcon = [1034],
    model = [{54007}]
    };
getRow(111)->
    #thirty_day_login_giftCfg {
    id = 111,
    name = "钻石豪礼",
    type = 2,
    value = 7,
    title = "钻石相赠",
    text = "体会富有的感觉吧",
    rewardstype = 3,
    rewards = [{907,10}],
    modelType = 2,
    display = 1,
    tabIcon = [4024],
    model = [{4005}]
    };
getRow(_)->[].

getKeyList()->[
    {100},
    {101},
    {102},
    {103},
    {104},
    {105},
    {106},
    {107},
    {108},
    {109},
    {110},
    {111}
    ].

get1KeyList()->[
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111
    ].

