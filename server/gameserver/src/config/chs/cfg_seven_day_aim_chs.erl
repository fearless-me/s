%% coding: latin-1
%%: 实现
-module(cfg_seven_day_aim_chs).
-compile(export_all).
-include("cfg_seven_day_aim.hrl").
-include("logger.hrl").

getRow(1)->
    #seven_day_aimCfg {
    id = 1,
    day = 1,
    type = 1,
    name = "每日福利",
    show = "第1天登录奖励",
    preview = 1,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,100}]
    };
getRow(2)->
    #seven_day_aimCfg {
    id = 2,
    day = 1,
    type = 1,
    name = "每日福利",
    show = "主角到达18级",
    preview = 2,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [18],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,10000}]
    };
getRow(3)->
    #seven_day_aimCfg {
    id = 3,
    day = 1,
    type = 1,
    name = "每日福利",
    show = "主角到达28级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [28],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,20000}]
    };
getRow(4)->
    #seven_day_aimCfg {
    id = 4,
    day = 1,
    type = 2,
    name = "大冒险",
    show = "通关10级普通副本",
    preview = 3,
    subType1 = 1,
    args1 = [101],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{9100,2}]
    };
getRow(5)->
    #seven_day_aimCfg {
    id = 5,
    day = 1,
    type = 2,
    name = "大冒险",
    show = "通关20级普通副本",
    preview = 0,
    subType1 = 1,
    args1 = [102],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{9101,2}]
    };
getRow(6)->
    #seven_day_aimCfg {
    id = 6,
    day = 1,
    type = 2,
    name = "大冒险",
    show = "通关30级普通副本",
    preview = 0,
    subType1 = 1,
    args1 = [103],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{9102,2}]
    };
getRow(7)->
    #seven_day_aimCfg {
    id = 7,
    day = 1,
    type = 2,
    name = "大冒险",
    show = "通关20级英雄副本",
    preview = 0,
    subType1 = 1,
    args1 = [201],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{9100,5}]
    };
getRow(8)->
    #seven_day_aimCfg {
    id = 8,
    day = 1,
    type = 2,
    name = "大冒险",
    show = "通关30级英雄副本",
    preview = 0,
    subType1 = 1,
    args1 = [202],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{9101,5}]
    };
getRow(9)->
    #seven_day_aimCfg {
    id = 9,
    day = 1,
    type = 3,
    name = "装备精炼",
    show = "2件装备精炼到+10",
    preview = 4,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [10,2],
    rewardItem = [{222,10}]
    };
getRow(10)->
    #seven_day_aimCfg {
    id = 10,
    day = 1,
    type = 3,
    name = "装备精炼",
    show = "6件装备精炼到+10",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [10,6],
    rewardItem = [{222,20}]
    };
getRow(11)->
    #seven_day_aimCfg {
    id = 11,
    day = 1,
    type = 3,
    name = "装备精炼",
    show = "4件装备精炼到+15",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [15,4],
    rewardItem = [{222,30}]
    };
getRow(12)->
    #seven_day_aimCfg {
    id = 12,
    day = 1,
    type = 3,
    name = "装备精炼",
    show = "8件装备精炼到+15",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [15,8],
    rewardItem = [{222,40}]
    };
getRow(13)->
    #seven_day_aimCfg {
    id = 13,
    day = 1,
    type = 3,
    name = "装备精炼",
    show = "6件装备精炼到+18",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [18,6],
    rewardItem = [{222,50}]
    };
getRow(14)->
    #seven_day_aimCfg {
    id = 14,
    day = 1,
    type = 3,
    name = "装备精炼",
    show = "8件装备精炼到+18",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [18,8],
    rewardItem = [{222,60}]
    };
getRow(15)->
    #seven_day_aimCfg {
    id = 15,
    day = 1,
    type = 3,
    name = "装备精炼",
    show = "6件装备精炼到+25",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [25,6],
    rewardItem = [{222,70}]
    };
getRow(16)->
    #seven_day_aimCfg {
    id = 16,
    day = 1,
    type = 3,
    name = "装备精炼",
    show = "8件装备精炼到+25",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [25,8],
    rewardItem = [{222,80}]
    };
getRow(17)->
    #seven_day_aimCfg {
    id = 17,
    day = 1,
    type = 3,
    name = "装备精炼",
    show = "8件装备精炼到+30",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [30,8],
    rewardItem = [{222,90}]
    };
getRow(18)->
    #seven_day_aimCfg {
    id = 18,
    day = 1,
    type = 3,
    name = "装备精炼",
    show = "8件装备精炼到+35",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [35,8],
    rewardItem = [{222,100}]
    };
getRow(19)->
    #seven_day_aimCfg {
    id = 19,
    day = 1,
    type = 3,
    name = "装备精炼",
    show = "8件装备精炼到+40",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 202,
    args3 = [40,8],
    rewardItem = [{222,120}]
    };
getRow(20)->
    #seven_day_aimCfg {
    id = 20,
    day = 2,
    type = 1,
    name = "每日福利",
    show = "第2天登录奖励",
    preview = 1,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,200}]
    };
getRow(21)->
    #seven_day_aimCfg {
    id = 21,
    day = 2,
    type = 1,
    name = "每日福利",
    show = "主角到达30级",
    preview = 2,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [30],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,30000}]
    };
getRow(22)->
    #seven_day_aimCfg {
    id = 22,
    day = 2,
    type = 1,
    name = "每日福利",
    show = "主角到达32级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [32],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,40000}]
    };
getRow(23)->
    #seven_day_aimCfg {
    id = 23,
    day = 2,
    type = 2,
    name = "竞技场",
    show = "竞技场排名达到2000",
    preview = 3,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [2000],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2002,500}]
    };
getRow(24)->
    #seven_day_aimCfg {
    id = 24,
    day = 2,
    type = 2,
    name = "竞技场",
    show = "竞技场排名达到1500",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [1500],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2002,600}]
    };
getRow(25)->
    #seven_day_aimCfg {
    id = 25,
    day = 2,
    type = 2,
    name = "竞技场",
    show = "竞技场排名达到1000",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [1000],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2002,700}]
    };
getRow(26)->
    #seven_day_aimCfg {
    id = 26,
    day = 2,
    type = 2,
    name = "竞技场",
    show = "竞技场排名达到500",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [500],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2002,1000}]
    };
getRow(27)->
    #seven_day_aimCfg {
    id = 27,
    day = 2,
    type = 2,
    name = "竞技场",
    show = "竞技场排名达到200",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [200],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2002,1300}]
    };
getRow(28)->
    #seven_day_aimCfg {
    id = 28,
    day = 2,
    type = 2,
    name = "竞技场",
    show = "竞技场排名达到100",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [100],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2002,1400}]
    };
getRow(29)->
    #seven_day_aimCfg {
    id = 29,
    day = 2,
    type = 2,
    name = "竞技场",
    show = "竞技场排名达到50",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [50],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2002,1600}]
    };
getRow(30)->
    #seven_day_aimCfg {
    id = 30,
    day = 2,
    type = 2,
    name = "竞技场",
    show = "竞技场排名达到30",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [30],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2002,1700}]
    };
getRow(31)->
    #seven_day_aimCfg {
    id = 31,
    day = 2,
    type = 2,
    name = "竞技场",
    show = "竞技场排名达到10",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [10],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2002,1900}]
    };
getRow(32)->
    #seven_day_aimCfg {
    id = 32,
    day = 2,
    type = 2,
    name = "竞技场",
    show = "竞技场排名达到5",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [5],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2002,2000}]
    };
getRow(33)->
    #seven_day_aimCfg {
    id = 33,
    day = 2,
    type = 2,
    name = "竞技场",
    show = "竞技场排名达到1",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 105,
    args2 = [1],
    subType3 = 0,
    args3 = [],
    rewardItem = [{2002,2500}]
    };
getRow(34)->
    #seven_day_aimCfg {
    id = 34,
    day = 2,
    type = 3,
    name = "骑宠升星",
    show = "1只骑宠升星到1星",
    preview = 4,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [1,1],
    rewardItem = [{240,30}]
    };
getRow(35)->
    #seven_day_aimCfg {
    id = 35,
    day = 2,
    type = 3,
    name = "骑宠升星",
    show = "1只骑宠升星到3星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [3,1],
    rewardItem = [{240,50}]
    };
getRow(36)->
    #seven_day_aimCfg {
    id = 36,
    day = 2,
    type = 3,
    name = "骑宠升星",
    show = "1只骑宠升星到5星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [5,1],
    rewardItem = [{240,70}]
    };
getRow(37)->
    #seven_day_aimCfg {
    id = 37,
    day = 2,
    type = 3,
    name = "骑宠升星",
    show = "1只骑宠升星到15星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [15,1],
    rewardItem = [{240,90}]
    };
getRow(38)->
    #seven_day_aimCfg {
    id = 38,
    day = 2,
    type = 3,
    name = "骑宠升星",
    show = "1只骑宠升星到25星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [25,1],
    rewardItem = [{240,110}]
    };
getRow(39)->
    #seven_day_aimCfg {
    id = 39,
    day = 2,
    type = 3,
    name = "骑宠升星",
    show = "3只骑宠升星到5星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [5,3],
    rewardItem = [{240,130}]
    };
getRow(40)->
    #seven_day_aimCfg {
    id = 40,
    day = 2,
    type = 3,
    name = "骑宠升星",
    show = "3只骑宠升星到10星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [10,3],
    rewardItem = [{240,150}]
    };
getRow(41)->
    #seven_day_aimCfg {
    id = 41,
    day = 2,
    type = 3,
    name = "骑宠升星",
    show = "3只骑宠升星到15星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [15,3],
    rewardItem = [{240,170}]
    };
getRow(42)->
    #seven_day_aimCfg {
    id = 42,
    day = 2,
    type = 3,
    name = "骑宠升星",
    show = "5只骑宠升星到5星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [5,5],
    rewardItem = [{240,190}]
    };
getRow(43)->
    #seven_day_aimCfg {
    id = 43,
    day = 2,
    type = 3,
    name = "骑宠升星",
    show = "5只骑宠升星到10星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [10,5],
    rewardItem = [{240,210}]
    };
getRow(44)->
    #seven_day_aimCfg {
    id = 44,
    day = 2,
    type = 3,
    name = "骑宠升星",
    show = "5只骑宠升星到15星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [15,5],
    rewardItem = [{240,230}]
    };
getRow(45)->
    #seven_day_aimCfg {
    id = 45,
    day = 2,
    type = 3,
    name = "骑宠升星",
    show = "5只骑宠升星到20星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 207,
    args3 = [20,5],
    rewardItem = [{240,250}]
    };
getRow(46)->
    #seven_day_aimCfg {
    id = 46,
    day = 3,
    type = 1,
    name = "每日福利",
    show = "第3天登录奖励",
    preview = 1,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,300}]
    };
getRow(47)->
    #seven_day_aimCfg {
    id = 47,
    day = 3,
    type = 1,
    name = "每日福利",
    show = "主角到达33级",
    preview = 2,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [33],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,50000}]
    };
getRow(48)->
    #seven_day_aimCfg {
    id = 48,
    day = 3,
    type = 1,
    name = "每日福利",
    show = "主角到达34级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [34],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,60000}]
    };
getRow(49)->
    #seven_day_aimCfg {
    id = 49,
    day = 3,
    type = 2,
    name = "女神禁闭室",
    show = "通关禁闭室1层",
    preview = 3,
    subType1 = 2,
    args1 = [1],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{7,800}]
    };
getRow(50)->
    #seven_day_aimCfg {
    id = 50,
    day = 3,
    type = 2,
    name = "女神禁闭室",
    show = "通关禁闭室2层",
    preview = 0,
    subType1 = 2,
    args1 = [2],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{7,1000}]
    };
getRow(51)->
    #seven_day_aimCfg {
    id = 51,
    day = 3,
    type = 2,
    name = "女神禁闭室",
    show = "通关禁闭室3层",
    preview = 0,
    subType1 = 2,
    args1 = [3],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{7,1200}]
    };
getRow(52)->
    #seven_day_aimCfg {
    id = 52,
    day = 3,
    type = 2,
    name = "女神禁闭室",
    show = "通关禁闭室4层",
    preview = 0,
    subType1 = 2,
    args1 = [4],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{7,1400}]
    };
getRow(53)->
    #seven_day_aimCfg {
    id = 53,
    day = 3,
    type = 2,
    name = "女神禁闭室",
    show = "通关禁闭室5层",
    preview = 0,
    subType1 = 2,
    args1 = [5],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{7,1600}]
    };
getRow(54)->
    #seven_day_aimCfg {
    id = 54,
    day = 3,
    type = 2,
    name = "女神禁闭室",
    show = "通关禁闭室6层",
    preview = 0,
    subType1 = 2,
    args1 = [6],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{7,1800}]
    };
getRow(55)->
    #seven_day_aimCfg {
    id = 55,
    day = 3,
    type = 2,
    name = "女神禁闭室",
    show = "通关禁闭室7层",
    preview = 0,
    subType1 = 2,
    args1 = [7],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{7,2000}]
    };
getRow(56)->
    #seven_day_aimCfg {
    id = 56,
    day = 3,
    type = 2,
    name = "女神禁闭室",
    show = "通关禁闭室8层",
    preview = 0,
    subType1 = 2,
    args1 = [8],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{7,2200}]
    };
getRow(57)->
    #seven_day_aimCfg {
    id = 57,
    day = 3,
    type = 2,
    name = "女神禁闭室",
    show = "通关禁闭室9层",
    preview = 0,
    subType1 = 2,
    args1 = [9],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{7,2400}]
    };
getRow(58)->
    #seven_day_aimCfg {
    id = 58,
    day = 3,
    type = 3,
    name = "翅膀升级",
    show = "翅膀等级+1",
    preview = 4,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{4303,15}]
    };
getRow(59)->
    #seven_day_aimCfg {
    id = 59,
    day = 3,
    type = 3,
    name = "翅膀升级",
    show = "翅膀等级+2",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{4303,20}]
    };
getRow(60)->
    #seven_day_aimCfg {
    id = 60,
    day = 3,
    type = 3,
    name = "翅膀升级",
    show = "翅膀等级+3",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{4304,20}]
    };
getRow(61)->
    #seven_day_aimCfg {
    id = 61,
    day = 3,
    type = 3,
    name = "翅膀升级",
    show = "翅膀等级+4",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{4304,25}]
    };
getRow(62)->
    #seven_day_aimCfg {
    id = 62,
    day = 3,
    type = 3,
    name = "翅膀升级",
    show = "翅膀等级+5",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{4305,20}]
    };
getRow(63)->
    #seven_day_aimCfg {
    id = 63,
    day = 4,
    type = 1,
    name = "每日福利",
    show = "第4天登录奖励",
    preview = 1,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,400}]
    };
getRow(64)->
    #seven_day_aimCfg {
    id = 64,
    day = 4,
    type = 1,
    name = "每日福利",
    show = "主角到达35级",
    preview = 2,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [35],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,70000}]
    };
getRow(65)->
    #seven_day_aimCfg {
    id = 65,
    day = 4,
    type = 1,
    name = "每日福利",
    show = "主角到达36级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [36],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,80000}]
    };
getRow(66)->
    #seven_day_aimCfg {
    id = 66,
    day = 4,
    type = 2,
    name = "守护女神",
    show = "守护女神第1波",
    preview = 3,
    subType1 = 3,
    args1 = [1],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1801,10}]
    };
getRow(67)->
    #seven_day_aimCfg {
    id = 67,
    day = 4,
    type = 2,
    name = "守护女神",
    show = "守护女神第2波",
    preview = 0,
    subType1 = 3,
    args1 = [2],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1801,15}]
    };
getRow(68)->
    #seven_day_aimCfg {
    id = 68,
    day = 4,
    type = 2,
    name = "守护女神",
    show = "守护女神第3波",
    preview = 0,
    subType1 = 3,
    args1 = [3],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1801,20}]
    };
getRow(69)->
    #seven_day_aimCfg {
    id = 69,
    day = 4,
    type = 2,
    name = "守护女神",
    show = "守护女神第4波",
    preview = 0,
    subType1 = 3,
    args1 = [4],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1800,10}]
    };
getRow(70)->
    #seven_day_aimCfg {
    id = 70,
    day = 4,
    type = 2,
    name = "守护女神",
    show = "守护女神第5波",
    preview = 0,
    subType1 = 3,
    args1 = [5],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1800,15}]
    };
getRow(71)->
    #seven_day_aimCfg {
    id = 71,
    day = 4,
    type = 2,
    name = "守护女神",
    show = "守护女神第6波",
    preview = 0,
    subType1 = 3,
    args1 = [6],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1800,20}]
    };
getRow(72)->
    #seven_day_aimCfg {
    id = 72,
    day = 4,
    type = 2,
    name = "守护女神",
    show = "守护女神第7波",
    preview = 0,
    subType1 = 3,
    args1 = [7],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1800,25}]
    };
getRow(73)->
    #seven_day_aimCfg {
    id = 73,
    day = 4,
    type = 2,
    name = "守护女神",
    show = "守护女神第8波",
    preview = 0,
    subType1 = 3,
    args1 = [8],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1800,30}]
    };
getRow(74)->
    #seven_day_aimCfg {
    id = 74,
    day = 4,
    type = 2,
    name = "守护女神",
    show = "守护女神第9波",
    preview = 0,
    subType1 = 3,
    args1 = [9],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1800,35}]
    };
getRow(75)->
    #seven_day_aimCfg {
    id = 75,
    day = 4,
    type = 2,
    name = "守护女神",
    show = "守护女神第10波",
    preview = 0,
    subType1 = 3,
    args1 = [10],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1800,40}]
    };
getRow(76)->
    #seven_day_aimCfg {
    id = 76,
    day = 4,
    type = 2,
    name = "守护女神",
    show = "守护女神第11波",
    preview = 0,
    subType1 = 3,
    args1 = [11],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1800,50}]
    };
getRow(77)->
    #seven_day_aimCfg {
    id = 77,
    day = 4,
    type = 3,
    name = "时装收集",
    show = "拥有时装第1件",
    preview = 4,
    subType1 = 0,
    args1 = [],
    subType2 = 103,
    args2 = [1],
    subType3 = 0,
    args3 = [],
    rewardItem = [{20,30}]
    };
getRow(78)->
    #seven_day_aimCfg {
    id = 78,
    day = 4,
    type = 3,
    name = "时装收集",
    show = "拥有时装第2件",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 103,
    args2 = [2],
    subType3 = 0,
    args3 = [],
    rewardItem = [{20,50}]
    };
getRow(79)->
    #seven_day_aimCfg {
    id = 79,
    day = 4,
    type = 3,
    name = "时装收集",
    show = "拥有时装第3件",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 103,
    args2 = [3],
    subType3 = 0,
    args3 = [],
    rewardItem = [{20,70}]
    };
getRow(80)->
    #seven_day_aimCfg {
    id = 80,
    day = 4,
    type = 3,
    name = "时装收集",
    show = "拥有时装第4件",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 103,
    args2 = [4],
    subType3 = 0,
    args3 = [],
    rewardItem = [{20,90}]
    };
getRow(81)->
    #seven_day_aimCfg {
    id = 81,
    day = 4,
    type = 3,
    name = "时装收集",
    show = "拥有时装第5件",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 103,
    args2 = [5],
    subType3 = 0,
    args3 = [],
    rewardItem = [{20,110}]
    };
getRow(82)->
    #seven_day_aimCfg {
    id = 82,
    day = 4,
    type = 3,
    name = "时装收集",
    show = "拥有时装第6件",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 103,
    args2 = [6],
    subType3 = 0,
    args3 = [],
    rewardItem = [{20,150}]
    };
getRow(83)->
    #seven_day_aimCfg {
    id = 83,
    day = 5,
    type = 1,
    name = "每日福利",
    show = "第5天登录奖励",
    preview = 1,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,500}]
    };
getRow(84)->
    #seven_day_aimCfg {
    id = 84,
    day = 5,
    type = 1,
    name = "每日福利",
    show = "主角到达37级",
    preview = 2,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [37],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,90000}]
    };
getRow(85)->
    #seven_day_aimCfg {
    id = 85,
    day = 5,
    type = 1,
    name = "每日福利",
    show = "主角到达38级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [38],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,100000}]
    };
getRow(86)->
    #seven_day_aimCfg {
    id = 86,
    day = 5,
    type = 2,
    name = "元素保卫战",
    show = "通关元素保卫战第1关",
    preview = 3,
    subType1 = 1,
    args1 = [528],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{225,30}]
    };
getRow(87)->
    #seven_day_aimCfg {
    id = 87,
    day = 5,
    type = 2,
    name = "元素保卫战",
    show = "通关元素保卫战第2关",
    preview = 0,
    subType1 = 1,
    args1 = [529],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{225,50}]
    };
getRow(88)->
    #seven_day_aimCfg {
    id = 88,
    day = 5,
    type = 2,
    name = "元素保卫战",
    show = "通关元素保卫战第3关",
    preview = 0,
    subType1 = 1,
    args1 = [530],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{225,80}]
    };
getRow(89)->
    #seven_day_aimCfg {
    id = 89,
    day = 5,
    type = 2,
    name = "元素保卫战",
    show = "通关元素保卫战第4关",
    preview = 0,
    subType1 = 1,
    args1 = [531],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{225,100}]
    };
getRow(90)->
    #seven_day_aimCfg {
    id = 90,
    day = 5,
    type = 2,
    name = "宠物转生",
    show = "3个骑宠转生到3转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1801,5}]
    };
getRow(91)->
    #seven_day_aimCfg {
    id = 91,
    day = 5,
    type = 2,
    name = "宠物转生",
    show = "6个骑宠转生到3转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1801,10}]
    };
getRow(92)->
    #seven_day_aimCfg {
    id = 92,
    day = 5,
    type = 2,
    name = "宠物转生",
    show = "10个骑宠转生到3转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1800,10}]
    };
getRow(93)->
    #seven_day_aimCfg {
    id = 93,
    day = 5,
    type = 2,
    name = "宠物转生",
    show = "2个骑宠转生到4转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1801,10}]
    };
getRow(94)->
    #seven_day_aimCfg {
    id = 94,
    day = 5,
    type = 2,
    name = "宠物转生",
    show = "3个骑宠转生到4转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1801,15}]
    };
getRow(95)->
    #seven_day_aimCfg {
    id = 95,
    day = 5,
    type = 2,
    name = "宠物转生",
    show = "5个骑宠转生到4转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1800,15}]
    };
getRow(96)->
    #seven_day_aimCfg {
    id = 96,
    day = 5,
    type = 2,
    name = "宠物转生",
    show = "1个骑宠转生到5转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1800,20}]
    };
getRow(97)->
    #seven_day_aimCfg {
    id = 97,
    day = 5,
    type = 2,
    name = "宠物转生",
    show = "2个骑宠转生到5转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1800,30}]
    };
getRow(98)->
    #seven_day_aimCfg {
    id = 98,
    day = 5,
    type = 2,
    name = "宠物转生",
    show = "3个骑宠转生到5转",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1800,50}]
    };
getRow(99)->
    #seven_day_aimCfg {
    id = 99,
    day = 6,
    type = 1,
    name = "每日福利",
    show = "第6天登录奖励",
    preview = 1,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,600}]
    };
getRow(100)->
    #seven_day_aimCfg {
    id = 100,
    day = 6,
    type = 1,
    name = "每日福利",
    show = "主角到达39级",
    preview = 2,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [39],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,110000}]
    };
getRow(101)->
    #seven_day_aimCfg {
    id = 101,
    day = 6,
    type = 1,
    name = "每日福利",
    show = "主角到达40级",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 101,
    args2 = [40],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,120000}]
    };
getRow(102)->
    #seven_day_aimCfg {
    id = 102,
    day = 6,
    type = 2,
    name = "装备升星",
    show = "8件装备升星到1星",
    preview = 3,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 201,
    args3 = [1,8],
    rewardItem = [{225,30}]
    };
getRow(103)->
    #seven_day_aimCfg {
    id = 103,
    day = 6,
    type = 2,
    name = "装备升星",
    show = "6件装备升星到2星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 201,
    args3 = [2,6],
    rewardItem = [{225,70}]
    };
getRow(104)->
    #seven_day_aimCfg {
    id = 104,
    day = 6,
    type = 2,
    name = "装备升星",
    show = "8件装备升星到3星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 201,
    args3 = [3,8],
    rewardItem = [{225,80}]
    };
getRow(105)->
    #seven_day_aimCfg {
    id = 105,
    day = 6,
    type = 2,
    name = "装备升星",
    show = "8件装备升星到5星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 201,
    args3 = [5,8],
    rewardItem = [{225,90}]
    };
getRow(106)->
    #seven_day_aimCfg {
    id = 106,
    day = 6,
    type = 2,
    name = "装备升星",
    show = "8件装备升星到8星",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 201,
    args3 = [8,8],
    rewardItem = [{225,100}]
    };
getRow(107)->
    #seven_day_aimCfg {
    id = 107,
    day = 6,
    type = 3,
    name = "骑宠提升",
    show = "1只骑宠提升5次",
    preview = 4,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [5,1],
    rewardItem = [{201,20}]
    };
getRow(108)->
    #seven_day_aimCfg {
    id = 108,
    day = 6,
    type = 3,
    name = "骑宠提升",
    show = "1只骑宠提升10次",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [10,1],
    rewardItem = [{201,30}]
    };
getRow(109)->
    #seven_day_aimCfg {
    id = 109,
    day = 6,
    type = 3,
    name = "骑宠提升",
    show = "1只骑宠提升15次",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [15,1],
    rewardItem = [{201,40}]
    };
getRow(110)->
    #seven_day_aimCfg {
    id = 110,
    day = 6,
    type = 3,
    name = "骑宠提升",
    show = "3只骑宠提升5次",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [5,3],
    rewardItem = [{201,50}]
    };
getRow(111)->
    #seven_day_aimCfg {
    id = 111,
    day = 6,
    type = 3,
    name = "骑宠提升",
    show = "3只骑宠提升8次",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [8,3],
    rewardItem = [{201,60}]
    };
getRow(112)->
    #seven_day_aimCfg {
    id = 112,
    day = 6,
    type = 3,
    name = "骑宠提升",
    show = "3只骑宠提升10次",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [10,3],
    rewardItem = [{201,70}]
    };
getRow(113)->
    #seven_day_aimCfg {
    id = 113,
    day = 6,
    type = 3,
    name = "骑宠提升",
    show = "5只骑宠提升10次",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [10,5],
    rewardItem = [{201,80}]
    };
getRow(114)->
    #seven_day_aimCfg {
    id = 114,
    day = 6,
    type = 3,
    name = "骑宠提升",
    show = "5只骑宠提升15次",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 208,
    args3 = [15,5],
    rewardItem = [{201,100}]
    };
getRow(115)->
    #seven_day_aimCfg {
    id = 115,
    day = 7,
    type = 1,
    name = "每日福利",
    show = "第7天登录奖励",
    preview = 1,
    subType1 = 0,
    args1 = [],
    subType2 = 0,
    args2 = [],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{6,700}]
    };
getRow(116)->
    #seven_day_aimCfg {
    id = 116,
    day = 7,
    type = 1,
    name = "每日福利",
    show = "战斗力达到300000",
    preview = 2,
    subType1 = 0,
    args1 = [],
    subType2 = 104,
    args2 = [300000],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,150000}]
    };
getRow(117)->
    #seven_day_aimCfg {
    id = 117,
    day = 7,
    type = 1,
    name = "每日福利",
    show = "战斗力达到500000",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 104,
    args2 = [500000],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{1,200000}]
    };
getRow(118)->
    #seven_day_aimCfg {
    id = 118,
    day = 7,
    type = 3,
    name = "宠物大联盟",
    show = "拥有宠物数量达到8个",
    preview = 4,
    subType1 = 0,
    args1 = [],
    subType2 = 102,
    args2 = [-1,8],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1800,20}]
    };
getRow(119)->
    #seven_day_aimCfg {
    id = 119,
    day = 7,
    type = 3,
    name = "宠物大联盟",
    show = "拥有宠物数量达到12个",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 102,
    args2 = [-1,12],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1800,20}]
    };
getRow(120)->
    #seven_day_aimCfg {
    id = 120,
    day = 7,
    type = 3,
    name = "宠物大联盟",
    show = "拥有宠物数量达到16个",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 102,
    args2 = [-1,16],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1800,25}]
    };
getRow(121)->
    #seven_day_aimCfg {
    id = 121,
    day = 7,
    type = 3,
    name = "宠物大联盟",
    show = "拥有宠物数量达到20个",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 102,
    args2 = [-1,20],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1800,25}]
    };
getRow(122)->
    #seven_day_aimCfg {
    id = 122,
    day = 7,
    type = 3,
    name = "宠物大联盟",
    show = "拥有5个红色品质以上宠物",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 102,
    args2 = [3,5],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1800,30}]
    };
getRow(123)->
    #seven_day_aimCfg {
    id = 123,
    day = 7,
    type = 3,
    name = "宠物大联盟",
    show = "拥有8个红色品质以上宠物",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 102,
    args2 = [3,8],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1800,30}]
    };
getRow(124)->
    #seven_day_aimCfg {
    id = 124,
    day = 7,
    type = 3,
    name = "宠物大联盟",
    show = "拥有12个红色品质以上宠物",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 102,
    args2 = [3,12],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1800,40}]
    };
getRow(125)->
    #seven_day_aimCfg {
    id = 125,
    day = 7,
    type = 3,
    name = "宠物大联盟",
    show = "拥有15个红色品质以上宠物",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 102,
    args2 = [3,15],
    subType3 = 0,
    args3 = [],
    rewardItem = [{1800,50}]
    };
getRow(126)->
    #seven_day_aimCfg {
    id = 126,
    day = 7,
    type = 3,
    name = "拥有装备",
    show = "拥有蓝色品质以上装备6件",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 106,
    args2 = [2,6],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{7,3000}]
    };
getRow(127)->
    #seven_day_aimCfg {
    id = 127,
    day = 7,
    type = 3,
    name = "拥有装备",
    show = "拥有蓝色品质以上装备8件",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 106,
    args2 = [2,8],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{7,4000}]
    };
getRow(128)->
    #seven_day_aimCfg {
    id = 128,
    day = 7,
    type = 3,
    name = "拥有装备",
    show = "拥有红色品质以上装备4件",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 106,
    args2 = [3,4],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{7,5000}]
    };
getRow(129)->
    #seven_day_aimCfg {
    id = 129,
    day = 7,
    type = 3,
    name = "拥有装备",
    show = "拥有红色品质以上装备6件",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 106,
    args2 = [3,6],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{7,6000}]
    };
getRow(130)->
    #seven_day_aimCfg {
    id = 130,
    day = 7,
    type = 3,
    name = "拥有装备",
    show = "拥有红色品质以上装备8件",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 106,
    args2 = [3,8],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{7,7000}]
    };
getRow(131)->
    #seven_day_aimCfg {
    id = 131,
    day = 7,
    type = 3,
    name = "拥有装备",
    show = "拥有紫色品质以上装备4件",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 106,
    args2 = [4,4],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{7,8000}]
    };
getRow(132)->
    #seven_day_aimCfg {
    id = 132,
    day = 7,
    type = 3,
    name = "拥有装备",
    show = "拥有紫色品质以上装备8件",
    preview = 0,
    subType1 = 0,
    args1 = [],
    subType2 = 106,
    args2 = [4,8],
    subType3 = 0,
    args3 = [],
    rewardCoin = [{7,10000}]
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
    {78},
    {79},
    {80},
    {81},
    {82},
    {83},
    {84},
    {85},
    {86},
    {87},
    {88},
    {89},
    {90},
    {91},
    {92},
    {93},
    {94},
    {95},
    {96},
    {97},
    {98},
    {99},
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
    {111},
    {112},
    {113},
    {114},
    {115},
    {116},
    {117},
    {118},
    {119},
    {120},
    {121},
    {122},
    {123},
    {124},
    {125},
    {126},
    {127},
    {128},
    {129},
    {130},
    {131},
    {132}
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
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    94,
    95,
    96,
    97,
    98,
    99,
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
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119,
    120,
    121,
    122,
    123,
    124,
    125,
    126,
    127,
    128,
    129,
    130,
    131,
    132
    ].

