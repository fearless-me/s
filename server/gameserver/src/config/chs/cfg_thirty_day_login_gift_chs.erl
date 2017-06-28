%% coding: latin-1
%%: 实现
-module(cfg_thirty_day_login_gift_chs).
-compile(export_all).
-include("cfg_thirty_day_login_gift.hrl").
-include("logger.hrl").

getRow(100)->
    #thirty_day_login_giftCfg {
    id = 100,
    name = "蓝色武器",
    type = 1,
    value = 10,
    title = "优质武器",
    text = "战力飙升  主人你值得拥有",
    rewardstype = 1,
    rewards = [{101,31009},{201,31057},{301,31105}],
    modelType = 0,
    display = [2],
    tabIcon = [1002,2002,3002],
    model = [{101,31009},{201,31057},{301,31105}]
    };
getRow(101)->
    #thirty_day_login_giftCfg {
    id = 101,
    name = "绵羊国王",
    type = 1,
    value = 20,
    title = "时尚骑宠",
    text = "我的发型很酷哦  你看得到我的眼睛嘛",
    rewardstype = 3,
    rewards = [{1834,1}],
    modelType = 1,
    display = [2],
    tabIcon = [1025],
    model = [{53004}]
    };
getRow(102)->
    #thirty_day_login_giftCfg {
    id = 102,
    name = "星空之翼礼包",
    type = 1,
    value = 25,
    title = "翅膀强化",
    text = "点亮星空的翅膀  十二星座闪闪发光",
    rewardstype = 3,
    rewards = [{4303,10},{4304,10},{4305,10}],
    modelType = 2,
    display = [1],
    tabIcon = [4023],
    model = [{4005}]
    };
getRow(103)->
    #thirty_day_login_giftCfg {
    id = 103,
    name = "萌萌兔（头部）",
    type = 2,
    value = 2,
    title = "COSPLAY",
    text = "主人  戴上我你会越来越可爱哦",
    rewardstype = 2,
    rewards = [{0,27008},{1,27009}],
    modelType = 3,
    display = [2],
    tabIcon = [2009,2010],
    model = [{0,16},{1,17}]
    };
getRow(104)->
    #thirty_day_login_giftCfg {
    id = 104,
    name = "强化大礼",
    type = 1,
    value = 32,
    title = "装备强化",
    text = "主人快快成长  提升装备的战斗力",
    rewardstype = 3,
    rewards = [{222,10},{224,10},{225,10}],
    modelType = 2,
    display = [1],
    tabIcon = [4024],
    model = [{4005}]
    };
getRow(105)->
    #thirty_day_login_giftCfg {
    id = 105,
    name = "雷灵之心",
    type = 2,
    value = 3,
    title = "雷器灵解锁",
    text = "热烈欢迎器灵小雷的加入  666",
    rewardstype = 3,
    rewards = [{2502,1}],
    modelType = 4,
    display = [2],
    tabIcon = [3002],
    model = [{1227}]
    };
getRow(106)->
    #thirty_day_login_giftCfg {
    id = 106,
    name = "纹章大礼",
    type = 1,
    value = 35,
    title = "纹章礼盒装",
    text = "叮  听那宝石的声音",
    rewardstype = 3,
    rewards = [{21001,1},{21051,1},{21101,1}],
    modelType = 2,
    display = [1],
    tabIcon = [4023],
    model = [{4005}]
    };
getRow(107)->
    #thirty_day_login_giftCfg {
    id = 107,
    name = "钻石大礼",
    type = 2,
    value = 4,
    title = "钻石相赠",
    text = "我可比钻戒值钱  拿去随便花",
    rewardstype = 3,
    rewards = [{3,1000},{22007,1}],
    modelType = 2,
    display = [2],
    tabIcon = [4024],
    model = [{4005}]
    };
getRow(108)->
    #thirty_day_login_giftCfg {
    id = 108,
    name = "骑宠大礼",
    type = 2,
    value = 5,
    title = "骑宠强化",
    text = "骑宠小伙伴也要和主人一样强大",
    rewardstype = 3,
    rewards = [{2160,50},{2161,20},{201,10}],
    modelType = 2,
    display = [2],
    tabIcon = [4025],
    model = [{4005}]
    };
getRow(109)->
    #thirty_day_login_giftCfg {
    id = 109,
    name = "蔷薇之灵（衣服）",
    type = 2,
    value = 6,
    title = "化妆舞会",
    text = "来来来  让我们一起跳华尔兹吧",
    rewardstype = 2,
    rewards = [{0,27054},{1,27055}],
    modelType = 3,
    display = [1],
    tabIcon = [2051,2052],
    model = [{0,88},{1,89}]
    };
getRow(110)->
    #thirty_day_login_giftCfg {
    id = 110,
    name = "红色武器",
    type = 2,
    value = 7,
    title = "稀有武器",
    text = "不骗你  这武器真的很稀有",
    rewardstype = 1,
    rewards = [{101,31028},{201,31076},{301,31124}],
    modelType = 0,
    display = [1],
    tabIcon = [1005,2005,3005],
    model = [{101,31028},{201,31076},{301,31124}]
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
    {110}
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
    110
    ].

