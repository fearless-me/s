%% coding: latin-1
%%: 实现
-module(cfg_achievement_chs).
-compile(export_all).
-include("cfg_achievement.hrl").
-include("logger.hrl").

getRow(101)->
    #achievementCfg {
    id = 101,
    type = 1,
    subtype = 1,
    open = 0,
    name = "等级",
    describe = "等级达到10/20/30/40/50级",
    show = "等级达到[0]级",
    limit = 0,
    reward = [[10,5,50],[20,10,150],[30,15,300],[40,20,500],[50,25,700]],
    titleid = [1,2,0,0,0],
    goal_kill = []
    };
getRow(104)->
    #achievementCfg {
    id = 104,
    type = 1,
    subtype = 2,
    open = 0,
    name = "任务完成数量",
    describe = "完成任务总数量50/100/200/300/400",
    show = "完成任务总数[0]个",
    limit = 0,
    reward = [[50,5,30],[100,10,50],[200,15,100],[300,20,150],[400,25,200]],
    goal_kill = []
    };
getRow(105)->
    #achievementCfg {
    id = 105,
    type = 1,
    subtype = 3,
    open = 0,
    name = "背包达人",
    describe = "累计开背包格5/10/20/30/40/50/60个",
    show = "开启背包格子数[0]个",
    limit = 0,
    reward = [[5,5,5],[10,10,10],[20,15,15],[30,20,20],[40,25,25],[50,30,30],[60,35,40]],
    goal_kill = []
    };
getRow(106)->
    #achievementCfg {
    id = 106,
    type = 1,
    subtype = 4,
    open = 0,
    name = "仓库达人",
    describe = "累计开仓库格5/10/20/30/40/50/60个",
    show = "开启仓库格子数[0]个",
    limit = 0,
    reward = [[5,5,5],[10,10,10],[20,15,15],[30,20,20],[40,25,25],[50,30,30],[60,35,40]],
    goal_kill = []
    };
getRow(107)->
    #achievementCfg {
    id = 107,
    type = 1,
    subtype = 14,
    open = 1,
    name = "首次更新",
    describe = "首次更新游戏资源",
    show = "第[0]次更新游戏资源",
    limit = 0,
    reward = [[1,20,30]],
    goal_kill = []
    };
getRow(108)->
    #achievementCfg {
    id = 108,
    type = 1,
    subtype = 5,
    open = 0,
    name = "累计签到",
    describe = "累积签到1/5/10/15/20/30次数",
    show = "累积签到[0]次",
    limit = 0,
    reward = [[1,5,10],[5,10,15],[10,15,20],[15,20,25],[20,25,30],[30,30,35]],
    titleid = [1000,0,0,0,0,0],
    goal_kill = []
    };
getRow(109)->
    #achievementCfg {
    id = 109,
    type = 3,
    subtype = 1,
    open = 0,
    name = "守护女神",
    describe = "参加守护女神",
    show = "参加守护女神",
    limit = 0,
    reward = [[1,5,20]],
    titleid = [18],
    goal_kill = []
    };
getRow(110)->
    #achievementCfg {
    id = 110,
    type = 3,
    subtype = 2,
    open = 0,
    name = "首领入侵",
    describe = "初探首领入侵",
    show = "初探首领入侵",
    limit = 0,
    reward = [[1,10,20]],
    goal_kill = []
    };
getRow(120)->
    #achievementCfg {
    id = 120,
    type = 3,
    subtype = 3,
    open = 0,
    name = "深红熔渊一",
    describe = "初探深红熔渊一层",
    show = "初探深红熔渊一层",
    limit = 0,
    reward = [[1,5,5]],
    goal_kill = []
    };
getRow(121)->
    #achievementCfg {
    id = 121,
    type = 3,
    subtype = 4,
    open = 0,
    name = "深红熔渊二",
    describe = "初探深红熔渊二层",
    show = "初探深红熔渊二层",
    limit = 0,
    reward = [[1,10,5]],
    goal_kill = []
    };
getRow(122)->
    #achievementCfg {
    id = 122,
    type = 3,
    subtype = 5,
    open = 0,
    name = "深红熔渊三",
    describe = "初探深红熔渊三层",
    show = "初探深红熔渊三层",
    limit = 0,
    reward = [[1,15,5]],
    goal_kill = []
    };
getRow(123)->
    #achievementCfg {
    id = 123,
    type = 3,
    subtype = 6,
    open = 0,
    name = "深红熔渊四",
    describe = "初探深红熔渊四层",
    show = "初探深红熔渊四层",
    limit = 0,
    reward = [[1,20,5]],
    goal_kill = []
    };
getRow(124)->
    #achievementCfg {
    id = 124,
    type = 3,
    subtype = 7,
    open = 0,
    name = "深红熔渊五",
    describe = "初探深红熔渊五层",
    show = "初探深红熔渊五层",
    limit = 0,
    reward = [[1,25,5]],
    goal_kill = []
    };
getRow(203)->
    #achievementCfg {
    id = 203,
    type = 2,
    subtype = 1,
    open = 0,
    name = "金币累计",
    describe = "金币累积100W/500W/5000W/10000W",
    show = "金币累积[0]",
    limit = 0,
    reward = [[100000,5,50],[500000,10,100],[2000000,15,150],[5000000,20,200]],
    goal_kill = []
    };
getRow(204)->
    #achievementCfg {
    id = 204,
    type = 2,
    subtype = 6,
    open = 1,
    name = "金币累计",
    describe = "绑定金币累积100W/500W/5000W/10000W",
    show = "绑定金币累积获得[0]",
    limit = 0,
    reward = [[1000000,10,50],[5000000,20,100],[50000000,30,150],[100000000,40,200]],
    goal_kill = [[2,1],[3,1],[4,1],[5,1],[6,1]]
    };
getRow(206)->
    #achievementCfg {
    id = 206,
    type = 2,
    subtype = 2,
    open = 0,
    name = "宠物数量",
    describe = "收集骑宠1/5/10/15/20只",
    show = "收集骑宠[0]只",
    limit = 0,
    reward = [[1,5,50],[5,10,100],[10,15,150],[15,20,200],[20,25,300]],
    goal_kill = []
    };
getRow(207)->
    #achievementCfg {
    id = 207,
    type = 2,
    subtype = 3,
    open = 0,
    name = "兑换资源",
    describe = "累积资源兑换5/100/200/500/1K件",
    show = "累积资源兑换[0]个",
    limit = 0,
    reward = [[5,5,10],[100,10,20],[200,15,40],[500,20,60],[1000,25,80]],
    titleid = [1001,0,0,0,0],
    goal_kill = []
    };
getRow(208)->
    #achievementCfg {
    id = 208,
    type = 2,
    subtype = 4,
    open = 0,
    name = "装备分解次数",
    describe = "分解装备20/200/500/1K/2K件",
    show = "分解[0]件装备",
    limit = 0,
    reward = [[20,5,20],[200,10,30],[500,15,40],[1000,20,60],[2000,25,100]],
    goal_kill = []
    };
getRow(209)->
    #achievementCfg {
    id = 209,
    type = 2,
    subtype = 5,
    open = 0,
    name = "时装收集",
    describe = "收集时装3/6/9个",
    show = "收集时装[0]个",
    limit = 0,
    reward = [[3,5,50],[6,10,80],[9,15,100]],
    titleid = [3,0,0],
    goal_kill = []
    };
getRow(210)->
    #achievementCfg {
    id = 210,
    type = 3,
    subtype = 8,
    open = 0,
    name = "骑宠升星",
    describe = "进行骑宠升星5/20/40/80次",
    show = "进行骑宠升星[0]次",
    limit = 0,
    reward = [[5,5,20],[20,10,40],[40,15,60],[80,20,100]],
    titleid = [4,0,0,0],
    goal_kill = []
    };
getRow(301)->
    #achievementCfg {
    id = 301,
    type = 3,
    subtype = 9,
    open = 0,
    name = "全身精炼",
    describe = "全身装备整体精练2/4/6/8/10",
    show = "全身装备整体精练[0]",
    limit = 0,
    reward = [[2,5,30],[4,10,50],[6,15,80],[8,20,100],[10,25,150]],
    titleid = [1002,0,0,0,0],
    goal_kill = []
    };
getRow(302)->
    #achievementCfg {
    id = 302,
    type = 3,
    subtype = 10,
    open = 0,
    name = "精炼装备",
    describe = "精练装备30/40/50/60/70/80次",
    show = "精练装备[0]次",
    limit = 0,
    reward = [[30,5,30],[40,10,50],[50,15,80],[60,20,100],[70,25,150],[80,30,200]],
    goal_kill = []
    };
getRow(303)->
    #achievementCfg {
    id = 303,
    type = 3,
    subtype = 11,
    open = 0,
    name = "镶嵌纹章",
    describe = "镶嵌纹章2/3/4/5/6/7/8/9/10级",
    show = "成功镶嵌[0]级纹章",
    limit = 0,
    reward = [[-2,5,30],[-2,10,50],[-2,15,70],[-2,20,100],[-2,25,120],[-2,30,150],[-2,35,200],[-2,40,250],[-2,45,300]],
    goal_kill = [[2,1],[3,1],[4,1],[5,1],[6,1],[7,1],[8,1],[9,1],[10,1]]
    };
getRow(305)->
    #achievementCfg {
    id = 305,
    type = 3,
    subtype = 30,
    open = 1,
    name = "装备重铸",
    describe = "装备重铸10/50/80/100次",
    show = "装备重铸[0]次",
    limit = 0,
    reward = [[10,5,5],[50,15,5],[80,30,5],[100,50,5]],
    goal_kill = []
    };
getRow(306)->
    #achievementCfg {
    id = 306,
    type = 3,
    subtype = 12,
    open = 0,
    name = "纹章合成",
    describe = "纹章合成1/10/50/100次",
    show = "纹章合成[0]次",
    limit = 0,
    reward = [[1,5,50],[10,10,80],[50,15,120],[100,20,150]],
    titleid = [1003,0,0,0],
    goal_kill = []
    };
getRow(307)->
    #achievementCfg {
    id = 307,
    type = 3,
    subtype = 13,
    open = 0,
    name = "世界首领",
    describe = "累积消灭世界首领1/10/20/30/50/100只",
    show = "累积消灭世界首领[0]只",
    limit = 0,
    reward = [[-1,5,50],[-1,10,100],[-1,15,150],[-1,20,200],[-1,25,250],[-1,30,300]],
    goal_kill = [[719,720,721,722,723,1],[719,720,721,722,723,10],[719,720,721,722,723,20],[719,720,721,722,723,30],[719,720,721,722,723,50],[719,720,721,722,723,100]]
    };
getRow(309)->
    #achievementCfg {
    id = 309,
    type = 3,
    subtype = 14,
    open = 0,
    name = "怪物猎人",
    describe = "累积消灭怪1K/1W/10W/30W/50W/100W/500W只",
    show = "累积消灭怪物[0]只",
    limit = 0,
    reward = [[1000,5,50],[10000,10,100],[100000,15,150],[300000,20,200],[500000,25,250],[1000000,30,300],[5000000,35,400]],
    titleid = [5,14,0,0,0,0,0],
    goal_kill = []
    };
getRow(310)->
    #achievementCfg {
    id = 310,
    type = 3,
    subtype = 15,
    open = 0,
    name = "副本通关",
    describe = "副本通关3/50/100/300/500/1K/2K次",
    show = "副本通关[0]次",
    limit = 0,
    reward = [[3,5,30],[50,10,50],[100,15,70],[300,20,100],[500,25,120],[1000,30,150],[2000,35,200]],
    titleid = [23,0,0,0,0,0,0],
    goal_kill = []
    };
getRow(311)->
    #achievementCfg {
    id = 311,
    type = 3,
    subtype = 16,
    open = 0,
    name = "成就点",
    describe = "累积获得总成就点100/200/300",
    show = "累积获得总成就点[0]",
    limit = 0,
    reward = [[100,5,50],[200,10,100],[300,15,150]],
    titleid = [1004,0,0],
    goal_kill = []
    };
getRow(317)->
    #achievementCfg {
    id = 317,
    type = 3,
    subtype = 17,
    open = 0,
    name = "深红熔渊首领",
    describe = "累积消灭深红熔渊boss1/5/10/20/30/50/100次",
    show = "累积消灭深红熔渊boss[0]只",
    limit = 0,
    reward = [[-1,5,10],[-1,10,50],[-1,15,100],[-1,20,150],[-1,25,200],[-1,30,250],[-1,35,300]],
    goal_kill = [[3100,3101,3102,3103,3104,1],[3100,3101,3102,3103,3104,5],[3100,3101,3102,3103,3104,10],[3100,3101,3102,3103,3104,20],[3100,3101,3102,3103,3104,30],[3100,3101,3102,3103,3104,50],[3100,3101,3102,3103,3104,100]]
    };
getRow(501)->
    #achievementCfg {
    id = 501,
    type = 4,
    subtype = 1,
    open = 0,
    name = "上传照片",
    describe = "上传一张照片",
    show = "个性设置中上传一张照片",
    limit = 0,
    reward = [[1,15,20]],
    titleid = [21],
    goal_kill = []
    };
getRow(502)->
    #achievementCfg {
    id = 502,
    type = 4,
    subtype = 2,
    open = 0,
    name = "插入表情",
    describe = "使用一次聊天气泡或动作",
    show = "使用一次聊天气泡或动作",
    limit = 0,
    reward = [[1,20,10]],
    titleid = [1005],
    goal_kill = []
    };
getRow(504)->
    #achievementCfg {
    id = 504,
    type = 4,
    subtype = 8,
    open = 1,
    name = "千里传音",
    describe = "使用一次喇叭频道",
    show = "使用一次喇叭频道",
    limit = 0,
    reward = [[1,10,50]],
    goal_kill = []
    };
getRow(505)->
    #achievementCfg {
    id = 505,
    type = 4,
    subtype = 3,
    open = 0,
    name = "加入家族",
    describe = "加入任何家族",
    show = "成功加入家族",
    limit = 0,
    reward = [[1,25,10]],
    titleid = [1006],
    goal_kill = []
    };
getRow(508)->
    #achievementCfg {
    id = 508,
    type = 4,
    subtype = 4,
    open = 0,
    name = "好友成群",
    describe = "拥有5/10/20位好友",
    show = "好友总数有[0]位",
    limit = 0,
    reward = [[5,5,50],[10,10,80],[20,15,100]],
    titleid = [6,7,0],
    goal_kill = []
    };
getRow(700)->
    #achievementCfg {
    id = 700,
    type = 1,
    subtype = 6,
    open = 1,
    name = "女神激活",
    describe = "激活第1/2/3/4位女神",
    show = "激活[0]女神",
    limit = 0,
    reward = [[1,5,20],[2,10,40],[3,15,60],[4,20,80]],
    titleid = [16,0,0,0],
    goal_kill = []
    };
getRow(704)->
    #achievementCfg {
    id = 704,
    type = 1,
    subtype = 7,
    open = 1,
    name = "女神等级",
    describe = "提升4/20/40/80/100次女神等级",
    show = "提升[0]次女神等级",
    limit = 0,
    reward = [[4,5,20],[20,10,40],[40,15,60],[80,20,80],[100,25,100]],
    goal_kill = []
    };
getRow(705)->
    #achievementCfg {
    id = 705,
    type = 1,
    subtype = 8,
    open = 1,
    name = "火器灵激活",
    describe = "激活第1位器灵",
    show = "激活火器灵",
    limit = 0,
    reward = [[1,5,30]],
    titleid = [19],
    goal_kill = []
    };
getRow(706)->
    #achievementCfg {
    id = 706,
    type = 1,
    subtype = 9,
    open = 1,
    name = "冰器灵激活",
    describe = "激活第2位器灵",
    show = "激活冰器灵",
    limit = 0,
    reward = [[1,10,30]],
    titleid = [17],
    goal_kill = []
    };
getRow(707)->
    #achievementCfg {
    id = 707,
    type = 1,
    subtype = 10,
    open = 1,
    name = "雷器灵激活",
    describe = "激活第3位器灵",
    show = "激活雷器灵",
    limit = 0,
    reward = [[1,15,30]],
    titleid = [1007],
    goal_kill = []
    };
getRow(708)->
    #achievementCfg {
    id = 708,
    type = 1,
    subtype = 11,
    open = 1,
    name = "风器灵激活",
    describe = "激活第4位器灵",
    show = "激活风器灵",
    limit = 0,
    reward = [[1,20,30]],
    goal_kill = []
    };
getRow(709)->
    #achievementCfg {
    id = 709,
    type = 1,
    subtype = 12,
    open = 1,
    name = "光器灵激活",
    describe = "激活第5位器灵",
    show = "激活光器灵",
    limit = 0,
    reward = [[1,25,30]],
    goal_kill = []
    };
getRow(710)->
    #achievementCfg {
    id = 710,
    type = 1,
    subtype = 13,
    open = 1,
    name = "暗器灵激活",
    describe = "激活第6位器灵",
    show = "激活暗器灵",
    limit = 0,
    reward = [[1,30,30]],
    goal_kill = []
    };
getRow(711)->
    #achievementCfg {
    id = 711,
    type = 3,
    subtype = 18,
    open = 1,
    name = "器灵等级",
    describe = "提升12/30/60/120/240次器灵等级",
    show = "提升[0]次器灵等级",
    limit = 0,
    reward = [[12,5,20],[30,10,40],[60,15,60],[120,20,80],[240,25,100]],
    goal_kill = []
    };
getRow(712)->
    #achievementCfg {
    id = 712,
    type = 3,
    subtype = 19,
    open = 1,
    name = "翅膀升阶",
    describe = "翅膀升到2/3/4/5阶",
    show = "翅膀升到[0]阶",
    limit = 0,
    reward = [[2,5,50],[3,10,80],[4,15,100],[5,20,120]],
    titleid = [8,0,0,0],
    goal_kill = []
    };
getRow(713)->
    #achievementCfg {
    id = 713,
    type = 3,
    subtype = 20,
    open = 0,
    name = "骑宠转生",
    describe = "转生骑宠1/2/4/6/8次",
    show = "转生骑宠[0]次",
    limit = 0,
    reward = [[1,5,20],[2,10,40],[4,15,60],[6,20,80],[8,25,100]],
    titleid = [9,0,0,0,0],
    goal_kill = []
    };
getRow(714)->
    #achievementCfg {
    id = 714,
    type = 3,
    subtype = 21,
    open = 0,
    name = "骑宠装备",
    describe = "提升8/20/40/80/120次骑宠装备",
    show = "提升[0]次骑宠装备",
    limit = 0,
    reward = [[8,5,20],[20,10,40],[40,15,60],[80,20,80],[120,25,100]],
    titleid = [18,0,0,0,0],
    goal_kill = []
    };
getRow(715)->
    #achievementCfg {
    id = 715,
    type = 3,
    subtype = 22,
    open = 0,
    name = "蓝色装备品质",
    describe = "装备一件蓝色品质的装备",
    show = "装备一件蓝色品质的装备",
    limit = 0,
    reward = [[2,5,20]],
    goal_kill = []
    };
getRow(716)->
    #achievementCfg {
    id = 716,
    type = 3,
    subtype = 23,
    open = 0,
    name = "女神禁闭室",
    describe = "通关女神禁闭室第1/3/5/10/15/20/25/30层",
    show = "通关女神禁闭室第[0]层",
    limit = 0,
    reward = [[-2,5,20],[-2,10,40],[-2,15,60],[-2,20,80],[-2,25,100],[-2,30,120],[-2,35,150],[-2,40,200]],
    titleid = [10,0,0,0,0,0,0,0],
    goal_kill = [[1,1],[3,1],[5,1],[10,1],[15,1],[20,1],[25,1],[30,1]]
    };
getRow(717)->
    #achievementCfg {
    id = 717,
    type = 3,
    subtype = 24,
    open = 0,
    name = "惊天喵盗团",
    describe = "完成惊天喵盗团1/5/10/20/50/100次",
    show = "完成惊天喵盗团[0]次",
    limit = 0,
    reward = [[1,5,20],[5,10,40],[10,15,60],[20,20,80],[50,25,100],[100,30,120]],
    titleid = [11,0,0,0,0,0],
    goal_kill = []
    };
getRow(718)->
    #achievementCfg {
    id = 718,
    type = 3,
    subtype = 25,
    open = 0,
    name = "元素保卫战",
    describe = "完成元素保卫战1/5/10/20/50/100次",
    show = "完成元素保卫战[0]次",
    limit = 0,
    reward = [[1,5,20],[5,10,40],[10,15,60],[20,20,80],[50,25,100],[100,30,120]],
    goal_kill = []
    };
getRow(719)->
    #achievementCfg {
    id = 719,
    type = 3,
    subtype = 26,
    open = 0,
    name = "初入竞技场",
    describe = "获得一次竞技场胜利",
    show = "获得一次竞技场胜利",
    limit = 0,
    reward = [[1,30,20]],
    titleid = [15],
    goal_kill = []
    };
getRow(720)->
    #achievementCfg {
    id = 720,
    type = 3,
    subtype = 27,
    open = 0,
    name = "竞技场胜利",
    describe = "竞技场胜利10/50/100/1000/10000次",
    show = "竞技场胜利[0]次",
    limit = 0,
    reward = [[10,5,50],[50,10,100],[100,15,150],[1000,20,200],[10000,25,250]],
    goal_kill = []
    };
getRow(721)->
    #achievementCfg {
    id = 721,
    type = 4,
    subtype = 5,
    open = 0,
    name = "家族建立",
    describe = "建立一个家族",
    show = "建立一个家族",
    limit = 0,
    reward = [[1,35,10]],
    goal_kill = []
    };
getRow(722)->
    #achievementCfg {
    id = 722,
    type = 4,
    subtype = 6,
    open = 0,
    name = "发送红包",
    describe = "发出1/5/10/100/5000个红包",
    show = "发出[0]个红包",
    limit = 0,
    reward = [[1,5,20],[5,10,50],[10,15,70],[100,20,150],[5000,25,300]],
    titleid = [12,0,0,0,0],
    goal_kill = []
    };
getRow(723)->
    #achievementCfg {
    id = 723,
    type = 4,
    subtype = 7,
    open = 0,
    name = "初次死亡",
    describe = "死亡1次",
    show = "死亡1次",
    limit = 0,
    reward = [[1,40,10]],
    goal_kill = []
    };
getRow(724)->
    #achievementCfg {
    id = 724,
    type = 3,
    subtype = 28,
    open = 0,
    name = "红色装备品质",
    describe = "装备一件红色品质的装备",
    show = "装备一件红色品质的装备",
    limit = 0,
    reward = [[3,10,50]],
    titleid = [13],
    goal_kill = []
    };
getRow(725)->
    #achievementCfg {
    id = 725,
    type = 3,
    subtype = 29,
    open = 0,
    name = "紫色装备品质",
    describe = "装备一件紫色品质的装备",
    show = "装备一件紫色品质的装备",
    limit = 0,
    reward = [[4,15,100]],
    goal_kill = []
    };
getRow(_)->[].

getKeyList()->[
    {101},
    {104},
    {105},
    {106},
    {107},
    {108},
    {109},
    {110},
    {120},
    {121},
    {122},
    {123},
    {124},
    {203},
    {204},
    {206},
    {207},
    {208},
    {209},
    {210},
    {301},
    {302},
    {303},
    {305},
    {306},
    {307},
    {309},
    {310},
    {311},
    {317},
    {501},
    {502},
    {504},
    {505},
    {508},
    {700},
    {704},
    {705},
    {706},
    {707},
    {708},
    {709},
    {710},
    {711},
    {712},
    {713},
    {714},
    {715},
    {716},
    {717},
    {718},
    {719},
    {720},
    {721},
    {722},
    {723},
    {724},
    {725}
    ].

get1KeyList()->[
    101,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    120,
    121,
    122,
    123,
    124,
    203,
    204,
    206,
    207,
    208,
    209,
    210,
    301,
    302,
    303,
    305,
    306,
    307,
    309,
    310,
    311,
    317,
    501,
    502,
    504,
    505,
    508,
    700,
    704,
    705,
    706,
    707,
    708,
    709,
    710,
    711,
    712,
    713,
    714,
    715,
    716,
    717,
    718,
    719,
    720,
    721,
    722,
    723,
    724,
    725
    ].

