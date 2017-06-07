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
    titleid = [0,0,807,0,0,0,0,0],
    goal_kill = [0]
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
    reward = [[50,10,30],[100,10,50],[200,10,100],[300,10,150],[400,10,200]],
    goal_kill = [0]
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
    reward = [[5,5,5],[10,10,10],[20,15,15],[30,20,20],[40,25,25],[50,30,30],[60,40,35]],
    goal_kill = [0]
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
    reward = [[5,5,5],[10,10,10],[20,15,15],[30,20,20],[40,25,25],[50,30,30],[60,40,35]],
    goal_kill = [0]
    };
getRow(107)->
    #achievementCfg {
    id = 107,
    type = 1,
    subtype = 5,
    open = 1,
    name = "首次更新",
    describe = "首次更新游戏资源",
    show = "第[0]次更新游戏资源",
    limit = 0,
    reward = [[1,20,30]],
    goal_kill = [0]
    };
getRow(108)->
    #achievementCfg {
    id = 108,
    type = 1,
    subtype = 6,
    open = 0,
    name = "累计签到",
    describe = "累积签到1/5/10/15/20/30次数",
    show = "累积签到[0]次",
    limit = 0,
    reward = [[1,5,10],[5,25,15],[10,50,20],[15,75,25],[20,100,30],[30,150,35]],
    goal_kill = [0]
    };
getRow(109)->
    #achievementCfg {
    id = 109,
    type = 1,
    subtype = 7,
    open = 0,
    name = "守护女神",
    describe = "参加守护女神",
    show = "参加守护女神",
    limit = 0,
    reward = [[1,5,20]],
    goal_kill = [0]
    };
getRow(110)->
    #achievementCfg {
    id = 110,
    type = 1,
    subtype = 8,
    open = 1,
    name = "首领入侵",
    describe = "初探首领入侵",
    show = "初探首领入侵",
    limit = 0,
    reward = [[1,5,20]],
    goal_kill = [0]
    };
getRow(120)->
    #achievementCfg {
    id = 120,
    type = 1,
    subtype = 9,
    open = 1,
    name = "深红熔渊一",
    describe = "初探深红熔渊一层",
    show = "初探深红熔渊一层",
    limit = 0,
    reward = [[-1,5,5]],
    goal_kill = [0]
    };
getRow(121)->
    #achievementCfg {
    id = 121,
    type = 1,
    subtype = 10,
    open = 1,
    name = "深红熔渊二",
    describe = "初探深红熔渊二层",
    show = "初探深红熔渊二层",
    limit = 0,
    reward = [[-1,5,5]],
    goal_kill = [0]
    };
getRow(122)->
    #achievementCfg {
    id = 122,
    type = 1,
    subtype = 11,
    open = 1,
    name = "深红熔渊三",
    describe = "初探深红熔渊三层",
    show = "初探深红熔渊三层",
    limit = 0,
    reward = [[-1,5,5]],
    goal_kill = [0]
    };
getRow(123)->
    #achievementCfg {
    id = 123,
    type = 1,
    subtype = 12,
    open = 1,
    name = "深红熔渊四",
    describe = "初探深红熔渊四层",
    show = "初探深红熔渊四层",
    limit = 0,
    reward = [[-1,5,5]],
    goal_kill = [0]
    };
getRow(124)->
    #achievementCfg {
    id = 124,
    type = 1,
    subtype = 13,
    open = 1,
    name = "深红熔渊五",
    describe = "初探深红熔渊五层",
    show = "初探深红熔渊五层",
    limit = 0,
    reward = [[-1,5,5]],
    goal_kill = [0]
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
    reward = [[1000000,10,50],[5000000,20,100],[50000000,30,150],[100000000,40,200]],
    goal_kill = [0]
    };
getRow(204)->
    #achievementCfg {
    id = 204,
    type = 2,
    subtype = 2,
    open = 1,
    name = "绑定金币累计",
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
    subtype = 3,
    open = 0,
    name = "宠物数量",
    describe = "收集骑宠1/5/10/15/20只",
    show = "收集骑宠[0]只",
    limit = 0,
    reward = [[1,10,50],[5,50,100],[10,100,150],[15,200,200],[20,300,300]],
    titleid = [0,808,0,0,0],
    goal_kill = [0]
    };
getRow(207)->
    #achievementCfg {
    id = 207,
    type = 2,
    subtype = 4,
    open = 0,
    name = "兑换",
    describe = "累积资源兑换5/100/200/500/1K件",
    show = "累积资源兑换[0]个",
    limit = 0,
    reward = [[5,5,10],[100,5,20],[200,5,40],[500,5,60],[1000,5,80]],
    goal_kill = [0]
    };
getRow(208)->
    #achievementCfg {
    id = 208,
    type = 2,
    subtype = 5,
    open = 0,
    name = "装备分解次数",
    describe = "分解装备20/200/500/1K/2K件",
    show = "分解[0]件装备",
    limit = 0,
    reward = [[20,5,20],[200,5,30],[500,5,40],[1000,5,60],[2000,5,100]],
    goal_kill = [0]
    };
getRow(209)->
    #achievementCfg {
    id = 209,
    type = 2,
    subtype = 6,
    open = 0,
    name = "时装收集",
    describe = "收集时装3/6/9个",
    show = "收集时装[0]个",
    limit = 0,
    reward = [[3,100,50],[6,200,80],[9,300,100]],
    goal_kill = [0]
    };
getRow(210)->
    #achievementCfg {
    id = 210,
    type = 2,
    subtype = 7,
    open = 0,
    name = "骑宠升星",
    describe = "骑宠升级为2/3/4/5星",
    show = "骑宠升级为[0]星",
    limit = 1,
    reward = [[1,10,20],[2,20,40],[3,30,60],[4,40,100]],
    titleid = [0,0,0,0,0,813],
    goal_kill = [0]
    };
getRow(301)->
    #achievementCfg {
    id = 301,
    type = 3,
    subtype = 1,
    open = 0,
    name = "全身精炼",
    describe = "全身装备整体精练2/4/6/8/10",
    show = "全身装备整体精练[0]",
    limit = 0,
    reward = [[2,10,30],[4,30,50],[6,50,80],[8,100,100],[10,200,150]],
    goal_kill = [0]
    };
getRow(302)->
    #achievementCfg {
    id = 302,
    type = 3,
    subtype = 2,
    open = 0,
    name = "装备精炼",
    describe = "精练装备30/40/50/60/70/80次",
    show = "精练装备[0]次",
    limit = 0,
    reward = [[30,50,30],[40,50,50],[50,50,80],[60,50,100],[70,50,150],[80,50,200]],
    goal_kill = [0]
    };
getRow(303)->
    #achievementCfg {
    id = 303,
    type = 3,
    subtype = 3,
    open = 0,
    name = "纹章镶嵌",
    describe = "镶嵌纹章2/3/4/5/6/7/8/9/10级",
    show = "成功镶嵌[0]级纹章",
    limit = 0,
    reward = [[-2,5,30],[-2,10,50],[-2,20,70],[-2,30,100],[-2,50,120],[-2,60,150],[-2,70,200],[-2,80,250],[-2,90,300]],
    goal_kill = [[2,1],[3,1],[4,1],[5,1],[6,1],[7,1],[8,1],[9,1],[10,1]]
    };
getRow(305)->
    #achievementCfg {
    id = 305,
    type = 3,
    subtype = 4,
    open = 1,
    name = "装备重铸",
    describe = "装备重铸10/50/80/100次",
    show = "装备重铸[0]次",
    limit = 0,
    reward = [[10,5,5],[50,15,5],[80,30,5],[100,50,5]],
    goal_kill = [0]
    };
getRow(306)->
    #achievementCfg {
    id = 306,
    type = 3,
    subtype = 5,
    open = 0,
    name = "纹章合成",
    describe = "纹章合成1/10/50/100次",
    show = "纹章合成[0]次",
    limit = 0,
    reward = [[1,5,50],[5,10,80],[50,15,120],[100,30,150]],
    goal_kill = [0]
    };
getRow(307)->
    #achievementCfg {
    id = 307,
    type = 3,
    subtype = 6,
    open = 1,
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
    subtype = 7,
    open = 0,
    name = "怪物猎人",
    describe = "累积消灭怪1K/1W/10W/30W/50W/100W/500W只",
    show = "累积消灭怪物[0]只",
    limit = 0,
    reward = [[1000,50,50],[10000,50,100],[100000,50,150],[300000,50,200],[500000,50,250],[1000000,50,300],[5000000,50,400]],
    goal_kill = [0]
    };
getRow(310)->
    #achievementCfg {
    id = 310,
    type = 3,
    subtype = 8,
    open = 0,
    name = "副本通关",
    describe = "副本通关3/50/100/300/500/1K/2K次",
    show = "副本通关[0]次",
    limit = 0,
    reward = [[3,5,30],[50,10,50],[100,15,70],[300,25,100],[500,30,120],[1000,40,150],[2000,50,200]],
    goal_kill = [0]
    };
getRow(311)->
    #achievementCfg {
    id = 311,
    type = 3,
    subtype = 9,
    open = 0,
    name = "成就点",
    describe = "累积获得总成就点100/200/300",
    show = "累积获得总成就点[0]",
    limit = 0,
    reward = [[100,5,50],[200,5,100],[300,100,150]],
    goal_kill = [0]
    };
getRow(317)->
    #achievementCfg {
    id = 317,
    type = 3,
    subtype = 10,
    open = 1,
    name = "深红熔渊首领",
    describe = "累积消灭深红熔渊boss1/5/10/20/30/50/100次",
    show = "累积消灭深红熔渊boss[0]只",
    limit = 0,
    reward = [[-1,1,10],[-1,5,50],[-1,10,100],[-1,20,150],[-1,30,200],[-1,40,250],[-1,50,300]],
    goal_kill = [[3100,3101,3102,3103,3104,1],[3100,3101,3102,3103,3104,5],[3100,3101,3102,3103,3104,10],[3100,3101,3102,3103,3104,20],[3100,3101,3102,3103,3104,30],[3100,3101,3102,3103,3104,50],[3100,3101,3102,3103,3104,100]]
    };
getRow(501)->
    #achievementCfg {
    id = 501,
    type = 4,
    subtype = 1,
    open = 1,
    name = "上传照片",
    describe = "上传一张照片",
    show = "个性设置中上传一张照片",
    limit = 0,
    reward = [[1,20,50]],
    goal_kill = [0]
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
    reward = [[1,10,50]],
    goal_kill = [0]
    };
getRow(504)->
    #achievementCfg {
    id = 504,
    type = 4,
    subtype = 3,
    open = 1,
    name = "千里传音",
    describe = "使用一次喇叭频道",
    show = "使用一次喇叭频道",
    limit = 0,
    reward = [[1,10,50]],
    goal_kill = [0]
    };
getRow(505)->
    #achievementCfg {
    id = 505,
    type = 4,
    subtype = 4,
    open = 1,
    name = "加入军团",
    describe = "加入任何军团",
    show = "成功加入军团",
    limit = 0,
    reward = [[1,10,50]],
    goal_kill = [0]
    };
getRow(508)->
    #achievementCfg {
    id = 508,
    type = 4,
    subtype = 5,
    open = 0,
    name = "好友成群",
    describe = "拥有5/10/20位好友",
    show = "好友总数有[0]位",
    limit = 0,
    reward = [[5,10,50],[10,10,80],[20,10,100]],
    goal_kill = [0]
    };
getRow(700)->
    #achievementCfg {
    id = 700,
    type = 3,
    subtype = 12,
    open = 0,
    name = "女神激活",
    describe = "激活第1/2/3/4位女神",
    show = "激活[0]女神",
    limit = 0,
    reward = [[1,5,20],[2,10,40],[3,15,60],[4,25,80]],
    goal_kill = [0]
    };
getRow(704)->
    #achievementCfg {
    id = 704,
    type = 3,
    subtype = 16,
    open = 0,
    name = "女神等级",
    describe = "提升4/20/40/80/100次女神等级",
    show = "提升[0]次女神等级",
    limit = 0,
    reward = [[4,5,20],[20,10,40],[40,15,60],[80,25,80],[100,30,100]],
    goal_kill = [0]
    };
getRow(705)->
    #achievementCfg {
    id = 705,
    type = 3,
    subtype = 17,
    open = 0,
    name = "火器灵激活",
    describe = "激活第1位器灵",
    show = "激活火器灵",
    limit = 0,
    reward = [[1,10,30]],
    goal_kill = [0]
    };
getRow(706)->
    #achievementCfg {
    id = 706,
    type = 3,
    subtype = 18,
    open = 0,
    name = "冰器灵激活",
    describe = "激活第2位器灵",
    show = "激活冰器灵",
    limit = 0,
    reward = [[1,10,30]],
    goal_kill = [0]
    };
getRow(707)->
    #achievementCfg {
    id = 707,
    type = 3,
    subtype = 19,
    open = 0,
    name = "雷器灵激活",
    describe = "激活第3位器灵",
    show = "激活雷器灵",
    limit = 0,
    reward = [[1,10,30]],
    goal_kill = [0]
    };
getRow(708)->
    #achievementCfg {
    id = 708,
    type = 3,
    subtype = 20,
    open = 0,
    name = "风器灵激活",
    describe = "激活第4位器灵",
    show = "激活风器灵",
    limit = 0,
    reward = [[1,10,30]],
    goal_kill = [0]
    };
getRow(709)->
    #achievementCfg {
    id = 709,
    type = 3,
    subtype = 21,
    open = 0,
    name = "光器灵激活",
    describe = "激活第5位器灵",
    show = "激活光器灵",
    limit = 0,
    reward = [[1,10,30]],
    goal_kill = [0]
    };
getRow(710)->
    #achievementCfg {
    id = 710,
    type = 3,
    subtype = 22,
    open = 0,
    name = "暗器灵激活",
    describe = "激活第6位器灵",
    show = "激活暗器灵",
    limit = 0,
    reward = [[1,10,30]],
    goal_kill = [0]
    };
getRow(711)->
    #achievementCfg {
    id = 711,
    type = 3,
    subtype = 23,
    open = 0,
    name = "器灵等级",
    describe = "提升12/30/60/120/240次器灵等级",
    show = "提升[0]次器灵等级",
    limit = 0,
    reward = [[12,5,20],[30,10,40],[60,15,60],[120,25,80],[240,30,100]],
    goal_kill = [0]
    };
getRow(712)->
    #achievementCfg {
    id = 712,
    type = 3,
    subtype = 24,
    open = 0,
    name = "翅膀升阶",
    describe = "翅膀升到2/3/4/5阶",
    show = "翅膀升到[0]阶",
    limit = 0,
    reward = [[1,5,50],[2,10,80],[3,15,100],[4,25,120]],
    goal_kill = [0]
    };
getRow(713)->
    #achievementCfg {
    id = 713,
    type = 3,
    subtype = 25,
    open = 0,
    name = "骑宠转生",
    describe = "转生骑宠1/2/4/6/8次",
    show = "转生骑宠[0]次",
    limit = 0,
    reward = [[1,5,20],[2,10,40],[4,15,60],[6,25,80],[8,30,100]],
    goal_kill = [0]
    };
getRow(714)->
    #achievementCfg {
    id = 714,
    type = 3,
    subtype = 26,
    open = 0,
    name = "骑宠装备",
    describe = "提升8/20/40/80/120次骑宠装备",
    show = "提升[0]次骑宠装备",
    limit = 0,
    reward = [[8,5,20],[20,10,40],[40,15,60],[80,25,80],[120,30,100]],
    goal_kill = [0]
    };
getRow(715)->
    #achievementCfg {
    id = 715,
    type = 3,
    subtype = 27,
    open = 0,
    name = "装备品质",
    describe = "装备一件蓝色品质的装备",
    show = "装备一件蓝色品质的装备",
    limit = 0,
    reward = [[2,10,20]],
    goal_kill = [0]
    };
getRow(716)->
    #achievementCfg {
    id = 716,
    type = 1,
    subtype = 14,
    open = 0,
    name = "女神禁闭室",
    describe = "通关女神禁闭室第1/3/5/10/15/20/25/30层",
    show = "通关女神禁闭室第[0]层",
    limit = 0,
    reward = [[-2,5,20],[-2,10,40],[-2,15,60],[-2,25,80],[-2,30,100],[-2,40,120],[-2,50,150]],
    goal_kill = [[1,1],[3,1],[5,1],[10,1],[15,1],[20,1],[25,1],[30,1]]
    };
getRow(717)->
    #achievementCfg {
    id = 717,
    type = 1,
    subtype = 15,
    open = 0,
    name = "惊天喵盗团",
    describe = "完成惊天喵盗团1/5/10/20/50/100次",
    show = "完成惊天喵盗团[0]次",
    limit = 0,
    reward = [[1,5,20],[5,10,40],[10,15,60],[20,25,80],[50,30,100],[100,40,120]],
    goal_kill = [0]
    };
getRow(718)->
    #achievementCfg {
    id = 718,
    type = 1,
    subtype = 16,
    open = 0,
    name = "元素保卫战",
    describe = "完成元素保卫战1/5/10/20/50/100次",
    show = "完成元素保卫战[0]次",
    limit = 0,
    reward = [[1,5,20],[5,10,40],[10,15,60],[20,25,80],[50,30,100],[100,40,120]],
    goal_kill = [0]
    };
getRow(719)->
    #achievementCfg {
    id = 719,
    type = 1,
    subtype = 17,
    open = 0,
    name = "初入竞技场",
    describe = "获得一次竞技场胜利",
    show = "获得一次竞技场胜利",
    limit = 0,
    reward = [[1,10,20]],
    goal_kill = [0]
    };
getRow(720)->
    #achievementCfg {
    id = 720,
    type = 1,
    subtype = 18,
    open = 0,
    name = "竞技场胜利",
    describe = "竞技场胜利10/50/100/1000/10000次",
    show = "竞技场胜利[0]次",
    limit = 0,
    reward = [[10,5,50],[50,10,100],[100,15,150],[1000,25,200],[10000,30,250]],
    goal_kill = [0]
    };
getRow(721)->
    #achievementCfg {
    id = 721,
    type = 4,
    subtype = 6,
    open = 1,
    name = "军团建立",
    describe = "建立一个军团",
    show = "建立一个军团",
    limit = 0,
    reward = [[1,10,20]],
    goal_kill = [0]
    };
getRow(722)->
    #achievementCfg {
    id = 722,
    type = 4,
    subtype = 7,
    open = 0,
    name = "发送红包",
    describe = "发出1/5/10/100/5000个红包",
    show = "发出[0]个红包",
    limit = 0,
    reward = [[1,5,20],[5,10,50],[10,15,70],[100,25,150],[5000,30,300]],
    goal_kill = [0]
    };
getRow(723)->
    #achievementCfg {
    id = 723,
    type = 4,
    subtype = 8,
    open = 0,
    name = "初次死亡",
    describe = "死亡1次",
    show = "死亡1次",
    limit = 0,
    reward = [[1,10,20]],
    goal_kill = [0]
    };
getRow(724)->
    #achievementCfg {
    id = 724,
    type = 3,
    subtype = 28,
    open = 0,
    name = "装备品质",
    describe = "装备一件红色品质的装备",
    show = "装备一件红色品质的装备",
    limit = 0,
    reward = [[3,10,50]],
    goal_kill = [0]
    };
getRow(725)->
    #achievementCfg {
    id = 725,
    type = 3,
    subtype = 29,
    open = 0,
    name = "装备品质",
    describe = "装备一件紫色品质的装备",
    show = "装备一件紫色品质的装备",
    limit = 0,
    reward = [[4,10,100]],
    goal_kill = [0]
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

