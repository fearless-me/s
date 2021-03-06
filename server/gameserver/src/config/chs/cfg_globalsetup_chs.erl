%% coding: latin-1
%%: 实现
-module(cfg_globalsetup_chs).
-compile(export_all).
-include("cfg_globalsetup.hrl").
-include("logger.hrl").

getRow(achievement_level)->
    #globalsetupCfg {
    id = 509,
    settype = achievement_level,
    setpara = [1]
    };
getRow(action_buy)->
    #globalsetupCfg {
    id = 763,
    settype = action_buy,
    setpara = [{1,60},{2,70},{3,80}]
    };
getRow(action_buytime)->
    #globalsetupCfg {
    id = 764,
    settype = action_buytime,
    setpara = [3]
    };
getRow(action_point_buy)->
    #globalsetupCfg {
    id = 765,
    settype = action_point_buy,
    setpara = [120]
    };
getRow(action_point_increase_info)->
    #globalsetupCfg {
    id = 761,
    settype = action_point_increase_info,
    setpara = [360,1]
    };
getRow(active_leader)->
    #globalsetupCfg {
    id = 641,
    settype = active_leader,
    setpara = [100]
    };
getRow(active_member)->
    #globalsetupCfg {
    id = 642,
    settype = active_member,
    setpara = [80]
    };
getRow(active_money)->
    #globalsetupCfg {
    id = 640,
    settype = active_money,
    setpara = [10000]
    };
getRow(activereward)->
    #globalsetupCfg {
    id = 371,
    settype = activereward,
    setpara = [{20,1200},{40,1201},{60,1202},{80,1203},{100,1204}]
    };
getRow(activeSkill)->
    #globalsetupCfg {
    id = 46,
    settype = activeSkill,
    setpara = [{1,2},{2,4},{3,8},{4,12},{5,1000},{5,1000}]
    };
getRow(activity_ipad)->
    #globalsetupCfg {
    id = 884,
    settype = activity_ipad,
    setpara = [2211]
    };
getRow(aftercast)->
    #globalsetupCfg {
    id = 31,
    settype = aftercast,
    setpara = [500]
    };
getRow(allplayerquestion_activitytotaltime)->
    #globalsetupCfg {
    id = 977,
    settype = allplayerquestion_activitytotaltime,
    setpara = [300]
    };
getRow(allplayerquestion_integral)->
    #globalsetupCfg {
    id = 969,
    settype = allplayerquestion_integral,
    setpara = [{1,2,3},{2,5,2},{5,99999,1}]
    };
getRow(allplayerquestion_lv)->
    #globalsetupCfg {
    id = 966,
    settype = allplayerquestion_lv,
    setpara = [9]
    };
getRow(allplayerquestion_ratio)->
    #globalsetupCfg {
    id = 964,
    settype = allplayerquestion_ratio,
    setpara = [{1,2,3},{2,5,2},{5,99999,1}]
    };
getRow(allplayerquestion_reward)->
    #globalsetupCfg {
    id = 963,
    settype = allplayerquestion_reward,
    setpara = [{1,2,29000},{2,4,29001},{4,10,29002},{10,99999,29003}]
    };
getRow(allplayerquestion_time)->
    #globalsetupCfg {
    id = 965,
    settype = allplayerquestion_time,
    setpara = [30]
    };
getRow(arena_AddLevel)->
    #globalsetupCfg {
    id = 539,
    settype = arena_AddLevel,
    setpara = [45]
    };
getRow(arena_DanPoint_1)->
    #globalsetupCfg {
    id = 522,
    settype = arena_DanPoint_1,
    setpara = [0,200,40]
    };
getRow(arena_DanPoint_2)->
    #globalsetupCfg {
    id = 523,
    settype = arena_DanPoint_2,
    setpara = [1000,100,20]
    };
getRow(arena_DanPoint_3)->
    #globalsetupCfg {
    id = 524,
    settype = arena_DanPoint_3,
    setpara = [2000,50,10]
    };
getRow(arena_DanPoint_4)->
    #globalsetupCfg {
    id = 525,
    settype = arena_DanPoint_4,
    setpara = [3000,20,5]
    };
getRow(arena_DanPoint_5)->
    #globalsetupCfg {
    id = 526,
    settype = arena_DanPoint_5,
    setpara = [3500,10,1]
    };
getRow(arena_DanPoint_6)->
    #globalsetupCfg {
    id = 527,
    settype = arena_DanPoint_6,
    setpara = [3950,1,0]
    };
getRow(arena_Dapao)->
    #globalsetupCfg {
    id = 538,
    settype = arena_Dapao,
    setpara = [120]
    };
getRow(arena_LoseReward)->
    #globalsetupCfg {
    id = 529,
    settype = arena_LoseReward,
    setpara = [2451,1]
    };
getRow(arena_Match)->
    #globalsetupCfg {
    id = 519,
    settype = arena_Match,
    setpara = [500]
    };
getRow(arena_MaxMapLine)->
    #globalsetupCfg {
    id = 518,
    settype = arena_MaxMapLine,
    setpara = [100]
    };
getRow(arena_RewardNumber)->
    #globalsetupCfg {
    id = 521,
    settype = arena_RewardNumber,
    setpara = [5]
    };
getRow(arena_Time)->
    #globalsetupCfg {
    id = 520,
    settype = arena_Time,
    setpara = [300]
    };
getRow(arena_Title)->
    #globalsetupCfg {
    id = 537,
    settype = arena_Title,
    setpara = [{0,1},{1000,2},{2000,3},{3000,4},{3500,5},{3950,6}]
    };
getRow(arena_WeekRewardNo1)->
    #globalsetupCfg {
    id = 530,
    settype = arena_WeekRewardNo1,
    setpara = [{1,2453},{2,2453},{3,2453},{4,2453},{5,2453}]
    };
getRow(arena_WeekRewardNo2)->
    #globalsetupCfg {
    id = 531,
    settype = arena_WeekRewardNo2,
    setpara = [{1,2454},{2,2454},{3,2454},{4,2454},{5,2454}]
    };
getRow(arena_WeekRewardNo3)->
    #globalsetupCfg {
    id = 532,
    settype = arena_WeekRewardNo3,
    setpara = [{1,2455},{2,2455},{3,2455},{4,2455},{5,2455}]
    };
getRow(arena_WeekRewardNo4)->
    #globalsetupCfg {
    id = 533,
    settype = arena_WeekRewardNo4,
    setpara = [10,2456]
    };
getRow(arena_WeekRewardNo5)->
    #globalsetupCfg {
    id = 534,
    settype = arena_WeekRewardNo5,
    setpara = [20,2457]
    };
getRow(arena_WeekRewardNo6)->
    #globalsetupCfg {
    id = 535,
    settype = arena_WeekRewardNo6,
    setpara = [30,2458]
    };
getRow(arena_WeekRewardNo7)->
    #globalsetupCfg {
    id = 536,
    settype = arena_WeekRewardNo7,
    setpara = [50,2459]
    };
getRow(arena_WinReward)->
    #globalsetupCfg {
    id = 528,
    settype = arena_WinReward,
    setpara = [2450,1]
    };
getRow(assassincd)->
    #globalsetupCfg {
    id = 9,
    settype = assassincd,
    setpara = []
    };
getRow(assassincost)->
    #globalsetupCfg {
    id = 8,
    settype = assassincost,
    setpara = [25]
    };
getRow(assassinrange)->
    #globalsetupCfg {
    id = 7,
    settype = assassinrange,
    setpara = [7.5]
    };
getRow(auto_range)->
    #globalsetupCfg {
    id = 51,
    settype = auto_range,
    setpara = [8]
    };
getRow(awardGiveMarkItemID)->
    #globalsetupCfg {
    id = 881,
    settype = awardGiveMarkItemID,
    setpara = [904]
    };
getRow(awardGiveMarkItemNum)->
    #globalsetupCfg {
    id = 882,
    settype = awardGiveMarkItemNum,
    setpara = [1]
    };
getRow(awardGiveMarkLevel)->
    #globalsetupCfg {
    id = 880,
    settype = awardGiveMarkLevel,
    setpara = [15]
    };
getRow(awareofpetskill)->
    #globalsetupCfg {
    id = 165,
    settype = awareofpetskill,
    setpara = [3]
    };
getRow(azraelcd)->
    #globalsetupCfg {
    id = 12,
    settype = azraelcd,
    setpara = []
    };
getRow(azraelcost)->
    #globalsetupCfg {
    id = 11,
    settype = azraelcost,
    setpara = [33]
    };
getRow(azraelrange)->
    #globalsetupCfg {
    id = 10,
    settype = azraelrange,
    setpara = [7.5]
    };
getRow(back_city_level)->
    #globalsetupCfg {
    id = 78,
    settype = back_city_level,
    setpara = [20]
    };
getRow(badge_level)->
    #globalsetupCfg {
    id = 510,
    settype = badge_level,
    setpara = [20]
    };
getRow(ban_chat)->
    #globalsetupCfg {
    id = 483,
    settype = ban_chat,
    setpara = [30]
    };
getRow(ban_chatlevel)->
    #globalsetupCfg {
    id = 484,
    settype = ban_chatlevel,
    setpara = [30]
    };
getRow(banned)->
    #globalsetupCfg {
    id = 754,
    settype = banned,
    setpara = [24]
    };
getRow(battle_1_honor)->
    #globalsetupCfg {
    id = 554,
    settype = battle_1_honor,
    setpara = [500]
    };
getRow(battle_1_item)->
    #globalsetupCfg {
    id = 550,
    settype = battle_1_item,
    setpara = [1721]
    };
getRow(battle_11_honor)->
    #globalsetupCfg {
    id = 557,
    settype = battle_11_honor,
    setpara = [500]
    };
getRow(battle_11_item)->
    #globalsetupCfg {
    id = 553,
    settype = battle_11_item,
    setpara = [1724]
    };
getRow(battle_2_honor)->
    #globalsetupCfg {
    id = 555,
    settype = battle_2_honor,
    setpara = [500]
    };
getRow(battle_2_item)->
    #globalsetupCfg {
    id = 551,
    settype = battle_2_item,
    setpara = [1722]
    };
getRow(battle_3to10_honor)->
    #globalsetupCfg {
    id = 556,
    settype = battle_3to10_honor,
    setpara = [500]
    };
getRow(battle_3to10_item)->
    #globalsetupCfg {
    id = 552,
    settype = battle_3to10_item,
    setpara = [1723]
    };
getRow(battle_add_time)->
    #globalsetupCfg {
    id = 540,
    settype = battle_add_time,
    setpara = [10]
    };
getRow(battle_add_value)->
    #globalsetupCfg {
    id = 541,
    settype = battle_add_value,
    setpara = [4]
    };
getRow(battle_boss_item)->
    #globalsetupCfg {
    id = 549,
    settype = battle_boss_item,
    setpara = [263]
    };
getRow(battle_honor_max)->
    #globalsetupCfg {
    id = 547,
    settype = battle_honor_max,
    setpara = [4000]
    };
getRow(battle_jl1)->
    #globalsetupCfg {
    id = 608,
    settype = battle_jl1,
    setpara = [500]
    };
getRow(battle_jl2)->
    #globalsetupCfg {
    id = 609,
    settype = battle_jl2,
    setpara = [500]
    };
getRow(battle_kill_value)->
    #globalsetupCfg {
    id = 542,
    settype = battle_kill_value,
    setpara = [5]
    };
getRow(battle_mb1)->
    #globalsetupCfg {
    id = 606,
    settype = battle_mb1,
    setpara = [5]
    };
getRow(battle_mb2)->
    #globalsetupCfg {
    id = 607,
    settype = battle_mb2,
    setpara = [5]
    };
getRow(battle_number)->
    #globalsetupCfg {
    id = 546,
    settype = battle_number,
    setpara = [20]
    };
getRow(battle_play_level)->
    #globalsetupCfg {
    id = 548,
    settype = battle_play_level,
    setpara = [35]
    };
getRow(battle_point1)->
    #globalsetupCfg {
    id = 558,
    settype = battle_point1,
    setpara = [{96.0,94.0}]
    };
getRow(battle_point2)->
    #globalsetupCfg {
    id = 559,
    settype = battle_point2,
    setpara = [{27.0,95.0}]
    };
getRow(battle_time)->
    #globalsetupCfg {
    id = 560,
    settype = battle_time,
    setpara = [30]
    };
getRow(battle_up10)->
    #globalsetupCfg {
    id = 543,
    settype = battle_up10,
    setpara = [3]
    };
getRow(battle_up30)->
    #globalsetupCfg {
    id = 544,
    settype = battle_up30,
    setpara = [4]
    };
getRow(battle_up50)->
    #globalsetupCfg {
    id = 545,
    settype = battle_up50,
    setpara = [5]
    };
getRow(battle_war_AssKillExploit)->
    #globalsetupCfg {
    id = 577,
    settype = battle_war_AssKillExploit,
    setpara = [3]
    };
getRow(battle_war_attack)->
    #globalsetupCfg {
    id = 602,
    settype = battle_war_attack,
    setpara = [1]
    };
getRow(battle_war_Boss)->
    #globalsetupCfg {
    id = 604,
    settype = battle_war_Boss,
    setpara = [{5813,22.6,31.4},{5812,107.6,14.4}]
    };
getRow(battle_war_Carriage)->
    #globalsetupCfg {
    id = 598,
    settype = battle_war_Carriage,
    setpara = [5803,5804]
    };
getRow(battle_war_CarriageOverExploit)->
    #globalsetupCfg {
    id = 580,
    settype = battle_war_CarriageOverExploit,
    setpara = [60]
    };
getRow(battle_war_CrystalExploit)->
    #globalsetupCfg {
    id = 573,
    settype = battle_war_CrystalExploit,
    setpara = [10]
    };
getRow(battle_war_CrystalExploitSubsidy)->
    #globalsetupCfg {
    id = 574,
    settype = battle_war_CrystalExploitSubsidy,
    setpara = [5]
    };
getRow(battle_war_CrystalIntegral)->
    #globalsetupCfg {
    id = 570,
    settype = battle_war_CrystalIntegral,
    setpara = [15]
    };
getRow(battle_war_CrystalIntegralMax)->
    #globalsetupCfg {
    id = 569,
    settype = battle_war_CrystalIntegralMax,
    setpara = [50]
    };
getRow(battle_war_CrystalMaxExploit)->
    #globalsetupCfg {
    id = 571,
    settype = battle_war_CrystalMaxExploit,
    setpara = [30]
    };
getRow(battle_war_CrystalMaxExploitSubsidy)->
    #globalsetupCfg {
    id = 572,
    settype = battle_war_CrystalMaxExploitSubsidy,
    setpara = [15]
    };
getRow(battle_war_CrystalMaxIntegral)->
    #globalsetupCfg {
    id = 568,
    settype = battle_war_CrystalMaxIntegral,
    setpara = [100]
    };
getRow(battle_war_Guard)->
    #globalsetupCfg {
    id = 596,
    settype = battle_war_Guard,
    setpara = [5805,5806]
    };
getRow(battle_war_GuardCoordinate)->
    #globalsetupCfg {
    id = 597,
    settype = battle_war_GuardCoordinate,
    setpara = [{51.5,23.5},{53.7,14.8},{61.2,25.2},{64.8,17.4}]
    };
getRow(battle_war_GuardExploit)->
    #globalsetupCfg {
    id = 575,
    settype = battle_war_GuardExploit,
    setpara = [15]
    };
getRow(battle_war_GuardNum)->
    #globalsetupCfg {
    id = 581,
    settype = battle_war_GuardNum,
    setpara = [4]
    };
getRow(battle_war_HighMapLine)->
    #globalsetupCfg {
    id = 563,
    settype = battle_war_HighMapLine,
    setpara = [10]
    };
getRow(battle_war_KillExploit)->
    #globalsetupCfg {
    id = 576,
    settype = battle_war_KillExploit,
    setpara = [15]
    };
getRow(battle_war_KillMessage)->
    #globalsetupCfg {
    id = 601,
    settype = battle_war_KillMessage,
    setpara = [20]
    };
getRow(battle_war_LowMapAegis)->
    #globalsetupCfg {
    id = 603,
    settype = battle_war_LowMapAegis,
    setpara = [60]
    };
getRow(battle_war_LowMapLine)->
    #globalsetupCfg {
    id = 565,
    settype = battle_war_LowMapLine,
    setpara = [5]
    };
getRow(battle_war_MaxLinePlayer)->
    #globalsetupCfg {
    id = 562,
    settype = battle_war_MaxLinePlayer,
    setpara = [30]
    };
getRow(battle_war_MaxMapLine)->
    #globalsetupCfg {
    id = 561,
    settype = battle_war_MaxMapLine,
    setpara = [25]
    };
getRow(battle_war_MidMapForce)->
    #globalsetupCfg {
    id = 566,
    settype = battle_war_MidMapForce,
    setpara = [600000]
    };
getRow(battle_war_MidMapLine)->
    #globalsetupCfg {
    id = 564,
    settype = battle_war_MidMapLine,
    setpara = [10]
    };
getRow(battle_war_MinMapForce)->
    #globalsetupCfg {
    id = 567,
    settype = battle_war_MinMapForce,
    setpara = [300000]
    };
getRow(battle_war_Object)->
    #globalsetupCfg {
    id = 595,
    settype = battle_war_Object,
    setpara = [223,224]
    };
getRow(battle_war_ObjectCd)->
    #globalsetupCfg {
    id = 605,
    settype = battle_war_ObjectCd,
    setpara = [300]
    };
getRow(battle_war_ObjectExploit)->
    #globalsetupCfg {
    id = 578,
    settype = battle_war_ObjectExploit,
    setpara = [60]
    };
getRow(battle_war_ObjectExploitSubsidy)->
    #globalsetupCfg {
    id = 579,
    settype = battle_war_ObjectExploitSubsidy,
    setpara = [{0.9,30},{0.5,20},{0.1,10}]
    };
getRow(battle_war_Ore)->
    #globalsetupCfg {
    id = 600,
    settype = battle_war_Ore,
    setpara = []
    };
getRow(battle_war_OreMax)->
    #globalsetupCfg {
    id = 599,
    settype = battle_war_OreMax,
    setpara = [{60.9,20.1,5811,120}]
    };
getRow(battle_war_RefreshTime)->
    #globalsetupCfg {
    id = 582,
    settype = battle_war_RefreshTime,
    setpara = [120]
    };
getRow(battle_war_RewardNo1)->
    #globalsetupCfg {
    id = 583,
    settype = battle_war_RewardNo1,
    setpara = [1024,2309]
    };
getRow(battle_war_RewardNo2)->
    #globalsetupCfg {
    id = 584,
    settype = battle_war_RewardNo2,
    setpara = [640,2308]
    };
getRow(battle_war_RewardNo3)->
    #globalsetupCfg {
    id = 585,
    settype = battle_war_RewardNo3,
    setpara = [320,2307]
    };
getRow(battle_war_RewardNo4)->
    #globalsetupCfg {
    id = 586,
    settype = battle_war_RewardNo4,
    setpara = [160,2306]
    };
getRow(battle_war_RewardNo5)->
    #globalsetupCfg {
    id = 587,
    settype = battle_war_RewardNo5,
    setpara = [10,2305]
    };
getRow(battle_war_WeekRewardNo1)->
    #globalsetupCfg {
    id = 588,
    settype = battle_war_WeekRewardNo1,
    setpara = [{1,2310},{2,2313},{3,2316},{4,2319},{5,2340}]
    };
getRow(battle_war_WeekRewardNo2)->
    #globalsetupCfg {
    id = 589,
    settype = battle_war_WeekRewardNo2,
    setpara = [{1,2311},{2,2314},{3,2317},{4,2320},{5,2341}]
    };
getRow(battle_war_WeekRewardNo3)->
    #globalsetupCfg {
    id = 590,
    settype = battle_war_WeekRewardNo3,
    setpara = [{1,2312},{2,2315},{3,2318},{4,2321},{5,2342}]
    };
getRow(battle_war_WeekRewardNo4)->
    #globalsetupCfg {
    id = 591,
    settype = battle_war_WeekRewardNo4,
    setpara = [10,2322]
    };
getRow(battle_war_WeekRewardNo5)->
    #globalsetupCfg {
    id = 592,
    settype = battle_war_WeekRewardNo5,
    setpara = [20,2323]
    };
getRow(battle_war_WeekRewardNo6)->
    #globalsetupCfg {
    id = 593,
    settype = battle_war_WeekRewardNo6,
    setpara = [30,2324]
    };
getRow(battle_war_WeekRewardNo7)->
    #globalsetupCfg {
    id = 594,
    settype = battle_war_WeekRewardNo7,
    setpara = [50,2325]
    };
getRow(bidding)->
    #globalsetupCfg {
    id = 318,
    settype = bidding,
    setpara = [500]
    };
getRow(blood_colour)->
    #globalsetupCfg {
    id = 88,
    settype = blood_colour,
    setpara = [1,4,2,3]
    };
getRow(blood_colourSingle)->
    #globalsetupCfg {
    id = 89,
    settype = blood_colourSingle,
    setpara = [0,255,65]
    };
getRow(blueAffix)->
    #globalsetupCfg {
    id = 119,
    settype = blueAffix,
    setpara = [{1,1,50},{2,1,50}]
    };
getRow(blueFactor)->
    #globalsetupCfg {
    id = 112,
    settype = blueFactor,
    setpara = []
    };
getRow(bribery_cost_max)->
    #globalsetupCfg {
    id = 247,
    settype = bribery_cost_max,
    setpara = [10000]
    };
getRow(bribery_cost_min)->
    #globalsetupCfg {
    id = 246,
    settype = bribery_cost_min,
    setpara = [10]
    };
getRow(bribery_history)->
    #globalsetupCfg {
    id = 248,
    settype = bribery_history,
    setpara = [40]
    };
getRow(bribery_money_chs)->
    #globalsetupCfg {
    id = 234,
    settype = bribery_money_chs,
    setpara = [30]
    };
getRow(bribery_money_cht)->
    #globalsetupCfg {
    id = 239,
    settype = bribery_money_cht,
    setpara = [30]
    };
getRow(bribery_money_enu)->
    #globalsetupCfg {
    id = 238,
    settype = bribery_money_enu,
    setpara = [100]
    };
getRow(bribery_money_jpn)->
    #globalsetupCfg {
    id = 241,
    settype = bribery_money_jpn,
    setpara = [30]
    };
getRow(bribery_money_kor)->
    #globalsetupCfg {
    id = 240,
    settype = bribery_money_kor,
    setpara = [30]
    };
getRow(bribery_money_mljx)->
    #globalsetupCfg {
    id = 235,
    settype = bribery_money_mljx,
    setpara = [30]
    };
getRow(bribery_money_rus)->
    #globalsetupCfg {
    id = 242,
    settype = bribery_money_rus,
    setpara = [100]
    };
getRow(bribery_money_tha)->
    #globalsetupCfg {
    id = 237,
    settype = bribery_money_tha,
    setpara = [100]
    };
getRow(bribery_money_vietnam)->
    #globalsetupCfg {
    id = 243,
    settype = bribery_money_vietnam,
    setpara = [100]
    };
getRow(bribery_money_xmt)->
    #globalsetupCfg {
    id = 236,
    settype = bribery_money_xmt,
    setpara = [100]
    };
getRow(bribery_num_max)->
    #globalsetupCfg {
    id = 245,
    settype = bribery_num_max,
    setpara = [100]
    };
getRow(bribery_num_min)->
    #globalsetupCfg {
    id = 244,
    settype = bribery_num_min,
    setpara = [10]
    };
getRow(broadcase_self_cd)->
    #globalsetupCfg {
    id = 101,
    settype = broadcase_self_cd,
    setpara = [1800]
    };
getRow(broadcase_self_rank_sort)->
    #globalsetupCfg {
    id = 100,
    settype = broadcase_self_rank_sort,
    setpara = [3]
    };
getRow(bubbleExpressionIntervalTime)->
    #globalsetupCfg {
    id = 103,
    settype = bubbleExpressionIntervalTime,
    setpara = [5]
    };
getRow(buddy_fly)->
    #globalsetupCfg {
    id = 633,
    settype = buddy_fly,
    setpara = [120]
    };
getRow(buddy_invite)->
    #globalsetupCfg {
    id = 632,
    settype = buddy_invite,
    setpara = [20]
    };
getRow(buddyBonus1)->
    #globalsetupCfg {
    id = 629,
    settype = buddyBonus1,
    setpara = [{4,0.03,1}]
    };
getRow(buddyBonus2)->
    #globalsetupCfg {
    id = 630,
    settype = buddyBonus2,
    setpara = [{4,0.03,1},{26,0.03,1},{28,0.03,1}]
    };
getRow(buddyBonus3)->
    #globalsetupCfg {
    id = 631,
    settype = buddyBonus3,
    setpara = [{4,0.03,1},{26,0.03,1},{28,0.03,1},{30,0.03,1},{31,0.03,1},{32,0.03,1},{33,0.03,1}]
    };
getRow(candy_end_time)->
    #globalsetupCfg {
    id = 734,
    settype = candy_end_time,
    setpara = [[{2016,8,10},{23,59,59}]]
    };
getRow(candy_start_time)->
    #globalsetupCfg {
    id = 733,
    settype = candy_start_time,
    setpara = [[{2016,8,8},{1,0,0}]]
    };
getRow(candy_twice)->
    #globalsetupCfg {
    id = 735,
    settype = candy_twice,
    setpara = [2]
    };
getRow(cannon_cd)->
    #globalsetupCfg {
    id = 321,
    settype = cannon_cd,
    setpara = [60]
    };
getRow(cannon_kill)->
    #globalsetupCfg {
    id = 322,
    settype = cannon_kill,
    setpara = [1,3]
    };
getRow(cannon_xy)->
    #globalsetupCfg {
    id = 320,
    settype = cannon_xy,
    setpara = [{222,162.4,115.6},{222,107.5,116.2}]
    };
getRow(char_speed1)->
    #globalsetupCfg {
    id = 90,
    settype = char_speed1,
    setpara = [20]
    };
getRow(char_speed2)->
    #globalsetupCfg {
    id = 92,
    settype = char_speed2,
    setpara = [20]
    };
getRow(chat_cd_level)->
    #globalsetupCfg {
    id = 466,
    settype = chat_cd_level,
    setpara = [30]
    };
getRow(chat_cd1)->
    #globalsetupCfg {
    id = 464,
    settype = chat_cd1,
    setpara = [2,1,1,1]
    };
getRow(chat_cd2)->
    #globalsetupCfg {
    id = 465,
    settype = chat_cd2,
    setpara = [2,1,1,1]
    };
getRow(chat_counts)->
    #globalsetupCfg {
    id = 469,
    settype = chat_counts,
    setpara = [30,30]
    };
getRow(chat_level)->
    #globalsetupCfg {
    id = 467,
    settype = chat_level,
    setpara = [1]
    };
getRow(chat_task)->
    #globalsetupCfg {
    id = 468,
    settype = chat_task,
    setpara = []
    };
getRow(chatLimited_count)->
    #globalsetupCfg {
    id = 470,
    settype = chatLimited_count,
    setpara = [5]
    };
getRow(chatLimited_over)->
    #globalsetupCfg {
    id = 472,
    settype = chatLimited_over,
    setpara = [1800]
    };
getRow(chatLimited_Reset)->
    #globalsetupCfg {
    id = 474,
    settype = chatLimited_Reset,
    setpara = [600]
    };
getRow(chatLimited_time)->
    #globalsetupCfg {
    id = 471,
    settype = chatLimited_time,
    setpara = [300]
    };
getRow(chatLimited_words)->
    #globalsetupCfg {
    id = 473,
    settype = chatLimited_words,
    setpara = [15]
    };
getRow(chuansongpet1id)->
    #globalsetupCfg {
    id = 871,
    settype = chuansongpet1id,
    setpara = [50100]
    };
getRow(ck_nq)->
    #globalsetupCfg {
    id = 18,
    settype = ck_nq,
    setpara = []
    };
getRow(coinHand_box)->
    #globalsetupCfg {
    id = 919,
    settype = coinHand_box,
    setpara = [{6,1,50000},{15,1,100000},{25,1,200000}]
    };
getRow(coinHand_cd)->
    #globalsetupCfg {
    id = 921,
    settype = coinHand_cd,
    setpara = []
    };
getRow(coinHand_freetime)->
    #globalsetupCfg {
    id = 922,
    settype = coinHand_freetime,
    setpara = [1]
    };
getRow(coinHand_limit)->
    #globalsetupCfg {
    id = 920,
    settype = coinHand_limit,
    setpara = [30]
    };
getRow(coinHand_rate)->
    #globalsetupCfg {
    id = 918,
    settype = coinHand_rate,
    setpara = [{4500,1},{3000,2},{2000,3},{500,5}]
    };
getRow(combol_last)->
    #globalsetupCfg {
    id = 36,
    settype = combol_last,
    setpara = [3000]
    };
getRow(convoy_task_range_time)->
    #globalsetupCfg {
    id = 962,
    settype = convoy_task_range_time,
    setpara = [20,5]
    };
getRow(countdown)->
    #globalsetupCfg {
    id = 512,
    settype = countdown,
    setpara = [60]
    };
getRow(crystal_xy)->
    #globalsetupCfg {
    id = 319,
    settype = crystal_xy,
    setpara = [{2610,149.5,115.8},{2612,98.7,153.4},{2613,99.4,77.5},{2614,72.0,116.7}]
    };
getRow(dailyinterfacejjcopen)->
    #globalsetupCfg {
    id = 912,
    settype = dailyinterfacejjcopen,
    setpara = [16]
    };
getRow(dailytask_levellimit)->
    #globalsetupCfg {
    id = 837,
    settype = dailytask_levellimit,
    setpara = [31]
    };
getRow(dailytask_number)->
    #globalsetupCfg {
    id = 835,
    settype = dailytask_number,
    setpara = [2]
    };
getRow(dark_accumulate)->
    #globalsetupCfg {
    id = 847,
    settype = dark_accumulate,
    setpara = [36000]
    };
getRow(dark_buy)->
    #globalsetupCfg {
    id = 844,
    settype = dark_buy,
    setpara = [1800]
    };
getRow(dark_end)->
    #globalsetupCfg {
    id = 840,
    settype = dark_end,
    setpara = [24]
    };
getRow(dark_level)->
    #globalsetupCfg {
    id = 848,
    settype = dark_level,
    setpara = [38]
    };
getRow(dark_maximum)->
    #globalsetupCfg {
    id = 849,
    settype = dark_maximum,
    setpara = [2000]
    };
getRow(dark_monster)->
    #globalsetupCfg {
    id = 850,
    settype = dark_monster,
    setpara = [0.1]
    };
getRow(dark_player)->
    #globalsetupCfg {
    id = 851,
    settype = dark_player,
    setpara = [10,20]
    };
getRow(dark_population)->
    #globalsetupCfg {
    id = 841,
    settype = dark_population,
    setpara = [60]
    };
getRow(dark_price)->
    #globalsetupCfg {
    id = 846,
    settype = dark_price,
    setpara = [100]
    };
getRow(dark_refresh)->
    #globalsetupCfg {
    id = 842,
    settype = dark_refresh,
    setpara = [4]
    };
getRow(dark_start)->
    #globalsetupCfg {
    id = 839,
    settype = dark_start,
    setpara = [9]
    };
getRow(dark_time)->
    #globalsetupCfg {
    id = 843,
    settype = dark_time,
    setpara = [3600]
    };
getRow(dark_times)->
    #globalsetupCfg {
    id = 845,
    settype = dark_times,
    setpara = [2]
    };
getRow(darkcoinNum)->
    #globalsetupCfg {
    id = 863,
    settype = darkcoinNum,
    setpara = [5,10]
    };
getRow(darkkillNum)->
    #globalsetupCfg {
    id = 862,
    settype = darkkillNum,
    setpara = [5,10,20,30,40]
    };
getRow(darkness_basicgift)->
    #globalsetupCfg {
    id = 854,
    settype = darkness_basicgift,
    setpara = [{1000,2174,0},{700,2175,0},{400,2176,0},{200,2177,0}]
    };
getRow(darkness_bosscd)->
    #globalsetupCfg {
    id = 858,
    settype = darkness_bosscd,
    setpara = [10800,18000,25200]
    };
getRow(darkness_bossid)->
    #globalsetupCfg {
    id = 857,
    settype = darkness_bossid,
    setpara = [3154,3155,3156,3157]
    };
getRow(darkness_bosspoint)->
    #globalsetupCfg {
    id = 859,
    settype = darkness_bosspoint,
    setpara = [{501,380,207},{501,380,299},{501,380,390},{501,285,207},{501,285,390},{501,192,390},{501,192,299},{501,192,207},{502,380,207},{502,380,299},{502,380,390},{502,285,207},{502,285,390},{502,192,390},{502,192,299},{502,192,207},{503,380,207},{503,380,299},{503,380,390},{503,285,207},{503,285,390},{503,192,390},{503,192,299},{503,192,207},{504,380,207},{504,380,299},{504,380,390},{504,285,207},{504,285,390},{504,192,390},{504,192,299},{504,192,207},{505,192,207},{505,380,299},{505,285,390},{505,192,299}]
    };
getRow(darkness_buff)->
    #globalsetupCfg {
    id = 860,
    settype = darkness_buff,
    setpara = [{0,1,1},{1,5,1.2},{5,10,1.5},{10,20,2},{20,50,3},{50,1000000,5}]
    };
getRow(darkness_gift)->
    #globalsetupCfg {
    id = 853,
    settype = darkness_gift,
    setpara = [{1,3,2170,0},{4,10,2171,0},{11,20,2172,0},{21,30,2173,0}]
    };
getRow(darkness_killnumber)->
    #globalsetupCfg {
    id = 852,
    settype = darkness_killnumber,
    setpara = [1000]
    };
getRow(darkness_monstervalue)->
    #globalsetupCfg {
    id = 861,
    settype = darkness_monstervalue,
    setpara = [10]
    };
getRow(darkness_open)->
    #globalsetupCfg {
    id = 856,
    settype = darkness_open,
    setpara = [2,4,6]
    };
getRow(darkness_rerank)->
    #globalsetupCfg {
    id = 855,
    settype = darkness_rerank,
    setpara = [60]
    };
getRow(dash_soundlimit)->
    #globalsetupCfg {
    id = 43,
    settype = dash_soundlimit,
    setpara = [0.8]
    };
getRow(datask_dianumber)->
    #globalsetupCfg {
    id = 836,
    settype = datask_dianumber,
    setpara = [10]
    };
getRow(date_hide_actiontime)->
    #globalsetupCfg {
    id = 828,
    settype = date_hide_actiontime,
    setpara = [1]
    };
getRow(date_hide_refresh)->
    #globalsetupCfg {
    id = 831,
    settype = date_hide_refresh,
    setpara = [{75,55},{120,50},{120,70},{100,55},{85,75},{150,70},{150,140},{130,140},{140,150},{140,100},{145,90},{130,105},{110,150},{80,155},{51,154},{45,130},{48,110},{48,75},{50,53},{45,90},{80,140},{90,75},{120,100}]
    };
getRow(date_hide_refreshnumber)->
    #globalsetupCfg {
    id = 830,
    settype = date_hide_refreshnumber,
    setpara = [{1103,2},{1103,2},{1103,2},{1103,2},{1103,2}]
    };
getRow(date_hide_refreshtime)->
    #globalsetupCfg {
    id = 829,
    settype = date_hide_refreshtime,
    setpara = [140]
    };
getRow(date_hide_score)->
    #globalsetupCfg {
    id = 833,
    settype = date_hide_score,
    setpara = [10]
    };
getRow(date_hide_scoreMax)->
    #globalsetupCfg {
    id = 834,
    settype = date_hide_scoreMax,
    setpara = [100]
    };
getRow(date_hide_transmittime)->
    #globalsetupCfg {
    id = 832,
    settype = date_hide_transmittime,
    setpara = [15]
    };
getRow(date_link_addScore)->
    #globalsetupCfg {
    id = 803,
    settype = date_link_addScore,
    setpara = [10,10,10,10,10,10,20,20,20,30]
    };
getRow(date_link_box)->
    #globalsetupCfg {
    id = 812,
    settype = date_link_box,
    setpara = [4005]
    };
getRow(date_link_boxrefresh)->
    #globalsetupCfg {
    id = 813,
    settype = date_link_boxrefresh,
    setpara = [{4,1},{10,1},{17,1},{25,2},{34,2},{44,2}]
    };
getRow(date_link_buffID_addscore)->
    #globalsetupCfg {
    id = 793,
    settype = date_link_buffID_addscore,
    setpara = [51004]
    };
getRow(date_link_buffID_addtime)->
    #globalsetupCfg {
    id = 795,
    settype = date_link_buffID_addtime,
    setpara = [51006]
    };
getRow(date_link_buffID_multscore)->
    #globalsetupCfg {
    id = 794,
    settype = date_link_buffID_multscore,
    setpara = [51005]
    };
getRow(date_link_buffID_speedUp)->
    #globalsetupCfg {
    id = 790,
    settype = date_link_buffID_speedUp,
    setpara = [51003]
    };
getRow(date_link_combina)->
    #globalsetupCfg {
    id = 808,
    settype = date_link_combina,
    setpara = [{4001,2},{4002,3},{4003,4}]
    };
getRow(date_link_combo_buff)->
    #globalsetupCfg {
    id = 789,
    settype = date_link_combo_buff,
    setpara = [0]
    };
getRow(date_link_count_reshuffle)->
    #globalsetupCfg {
    id = 810,
    settype = date_link_count_reshuffle,
    setpara = [1]
    };
getRow(date_link_debuffID_dizzy)->
    #globalsetupCfg {
    id = 792,
    settype = date_link_debuffID_dizzy,
    setpara = [51002]
    };
getRow(date_link_debuffID_slowDown)->
    #globalsetupCfg {
    id = 791,
    settype = date_link_debuffID_slowDown,
    setpara = [51001]
    };
getRow(date_link_distXY)->
    #globalsetupCfg {
    id = 787,
    settype = date_link_distXY,
    setpara = [0,0]
    };
getRow(date_link_gemNpcID)->
    #globalsetupCfg {
    id = 807,
    settype = date_link_gemNpcID,
    setpara = [4001,4002,4003]
    };
getRow(date_link_monsterID)->
    #globalsetupCfg {
    id = 788,
    settype = date_link_monsterID,
    setpara = [1104,0,0,0,0,0,0,0,0,0]
    };
getRow(date_link_posXY)->
    #globalsetupCfg {
    id = 785,
    settype = date_link_posXY,
    setpara = [197.5,197.5]
    };
getRow(date_link_power)->
    #globalsetupCfg {
    id = 801,
    settype = date_link_power,
    setpara = [2,2,2,2,3]
    };
getRow(date_link_randbuff)->
    #globalsetupCfg {
    id = 814,
    settype = date_link_randbuff,
    setpara = [1,1,1,1,1,1,2,2,2,2]
    };
getRow(date_link_randBuffType)->
    #globalsetupCfg {
    id = 804,
    settype = date_link_randBuffType,
    setpara = [1,2,2,3,3,4,4]
    };
getRow(date_link_randDebuffType)->
    #globalsetupCfg {
    id = 805,
    settype = date_link_randDebuffType,
    setpara = [0,0,0,1]
    };
getRow(date_link_scorelist)->
    #globalsetupCfg {
    id = 806,
    settype = date_link_scorelist,
    setpara = [5,3,1]
    };
getRow(date_link_scoreMax)->
    #globalsetupCfg {
    id = 811,
    settype = date_link_scoreMax,
    setpara = [100]
    };
getRow(date_link_sizeXY)->
    #globalsetupCfg {
    id = 786,
    settype = date_link_sizeXY,
    setpara = [5,5]
    };
getRow(date_link_time_afterFristEnter)->
    #globalsetupCfg {
    id = 797,
    settype = date_link_time_afterFristEnter,
    setpara = [5]
    };
getRow(date_link_time_beforeFristEnter)->
    #globalsetupCfg {
    id = 796,
    settype = date_link_time_beforeFristEnter,
    setpara = [300]
    };
getRow(date_link_time_combo)->
    #globalsetupCfg {
    id = 798,
    settype = date_link_time_combo,
    setpara = [0]
    };
getRow(date_link_time_linkAdd)->
    #globalsetupCfg {
    id = 799,
    settype = date_link_time_linkAdd,
    setpara = [5,5,5,5,5,5,10,10,10,20]
    };
getRow(date_link_time_linkPower)->
    #globalsetupCfg {
    id = 800,
    settype = date_link_time_linkPower,
    setpara = [5,5,5,5,10,10,10,10,20]
    };
getRow(date_link_time_reshuffle)->
    #globalsetupCfg {
    id = 809,
    settype = date_link_time_reshuffle,
    setpara = [0]
    };
getRow(date_link_time_settle)->
    #globalsetupCfg {
    id = 802,
    settype = date_link_time_settle,
    setpara = [6]
    };
getRow(date_nbox_boxnpcid)->
    #globalsetupCfg {
    id = 818,
    settype = date_nbox_boxnpcid,
    setpara = [4011]
    };
getRow(date_nbox_boxscore)->
    #globalsetupCfg {
    id = 820,
    settype = date_nbox_boxscore,
    setpara = [10]
    };
getRow(date_nbox_endpoint)->
    #globalsetupCfg {
    id = 819,
    settype = date_nbox_endpoint,
    setpara = [206,128,18]
    };
getRow(date_nbox_instance)->
    #globalsetupCfg {
    id = 817,
    settype = date_nbox_instance,
    setpara = [6]
    };
getRow(date_nbox_pointgroup)->
    #globalsetupCfg {
    id = 816,
    settype = date_nbox_pointgroup,
    setpara = [{212,50},{206,62},{200,56},{200,50},{188,62},{182,56},{176,62},{170,56},{158,164},{146,158},{116,164},{128,158},{140,98},{116,92},{98,122},{92,104},{62,152},{56,134},{50,158},{62,122},{68,104},{56,92},{50,110},{62,80},{68,56},{92,68},{98,56},{110,68},{122,62},{56,50},{134,62}]
    };
getRow(date_nbox_refresh)->
    #globalsetupCfg {
    id = 815,
    settype = date_nbox_refresh,
    setpara = [2,2,2,2,2]
    };
getRow(date_nbox_scoreMax)->
    #globalsetupCfg {
    id = 821,
    settype = date_nbox_scoreMax,
    setpara = [100]
    };
getRow(date_swimmingparty_addscorelist)->
    #globalsetupCfg {
    id = 826,
    settype = date_swimmingparty_addscorelist,
    setpara = [1,2,10]
    };
getRow(date_swimmingparty_frequency)->
    #globalsetupCfg {
    id = 825,
    settype = date_swimmingparty_frequency,
    setpara = [10]
    };
getRow(date_swimmingparty_pointgroup)->
    #globalsetupCfg {
    id = 823,
    settype = date_swimmingparty_pointgroup,
    setpara = [{226,188,226,230},{220,188,220,230},{214,188,214,230},{208,188,208,230},{202,188,202,230},{196,188,196,230},{190,188,190,230},{184,188,184,230},{223,230,223,188},{217,230,217,188},{211,230,211,188},{205,230,205,188},{199,230,199,188},{193,230,193,188},{187,230,187,188},{232,194,178,194},{232,200,178,200},{232,206,178,206},{232,212,178,212},{232,218,178,218},{232,224,178,224},{178,197,232,197},{178,203,232,203},{178,209,232,209},{178,215,232,215},{178,221,232,221}]
    };
getRow(date_swimmingparty_radius)->
    #globalsetupCfg {
    id = 824,
    settype = date_swimmingparty_radius,
    setpara = [3]
    };
getRow(date_swimmingparty_refresh)->
    #globalsetupCfg {
    id = 822,
    settype = date_swimmingparty_refresh,
    setpara = [4,4,4,4,6,6,6,6,8,8,8,8,10,10,10,10,12,12,12,12,12,12,12,12,12,12,12,12,12,12]
    };
getRow(date_swimmingparty_scoreMax)->
    #globalsetupCfg {
    id = 827,
    settype = date_swimmingparty_scoreMax,
    setpara = [100]
    };
getRow(day_night)->
    #globalsetupCfg {
    id = 104,
    settype = day_night,
    setpara = [10800]
    };
getRow(day_night_interval)->
    #globalsetupCfg {
    id = 105,
    settype = day_night_interval,
    setpara = [60]
    };
getRow(deadline)->
    #globalsetupCfg {
    id = 515,
    settype = deadline,
    setpara = [5]
    };
getRow(default_box)->
    #globalsetupCfg {
    id = 718,
    settype = default_box,
    setpara = [40]
    };
getRow(defendcity_boss)->
    #globalsetupCfg {
    id = 638,
    settype = defendcity_boss,
    setpara = [9]
    };
getRow(defendcity_chest)->
    #globalsetupCfg {
    id = 639,
    settype = defendcity_chest,
    setpara = [10]
    };
getRow(defendcity_chest_time)->
    #globalsetupCfg {
    id = 636,
    settype = defendcity_chest_time,
    setpara = [3600]
    };
getRow(defendcity_kill_num)->
    #globalsetupCfg {
    id = 634,
    settype = defendcity_kill_num,
    setpara = [20]
    };
getRow(defendcity_level)->
    #globalsetupCfg {
    id = 635,
    settype = defendcity_level,
    setpara = [20]
    };
getRow(defendcity_monster)->
    #globalsetupCfg {
    id = 637,
    settype = defendcity_monster,
    setpara = [4,5,6,7,8]
    };
getRow(distortion_big_and_small)->
    #globalsetupCfg {
    id = 957,
    settype = distortion_big_and_small,
    setpara = [60009,60010]
    };
getRow(divine_change)->
    #globalsetupCfg {
    id = 424,
    settype = divine_change,
    setpara = [8]
    };
getRow(divine_cost)->
    #globalsetupCfg {
    id = 421,
    settype = divine_cost,
    setpara = [{1,10000,90000},{3,98,900}]
    };
getRow(divine_diamondcd)->
    #globalsetupCfg {
    id = 429,
    settype = divine_diamondcd,
    setpara = [172800]
    };
getRow(divine_diamondlimit)->
    #globalsetupCfg {
    id = 427,
    settype = divine_diamondlimit,
    setpara = [100]
    };
getRow(divine_freediamondlimit)->
    #globalsetupCfg {
    id = 431,
    settype = divine_freediamondlimit,
    setpara = [10]
    };
getRow(divine_freegoldlimit)->
    #globalsetupCfg {
    id = 430,
    settype = divine_freegoldlimit,
    setpara = [5]
    };
getRow(divine_goldcd)->
    #globalsetupCfg {
    id = 428,
    settype = divine_goldcd,
    setpara = [300]
    };
getRow(divine_goldlimit)->
    #globalsetupCfg {
    id = 426,
    settype = divine_goldlimit,
    setpara = [100]
    };
getRow(divine_pool_diamond)->
    #globalsetupCfg {
    id = 420,
    settype = divine_pool_diamond,
    setpara = [6,0.5]
    };
getRow(divine_pool_gold)->
    #globalsetupCfg {
    id = 419,
    settype = divine_pool_gold,
    setpara = [2,0.5]
    };
getRow(divine_pool_high)->
    #globalsetupCfg {
    id = 423,
    settype = divine_pool_high,
    setpara = [8]
    };
getRow(divine_thenine)->
    #globalsetupCfg {
    id = 422,
    settype = divine_thenine,
    setpara = [10]
    };
getRow(divine_winernumbers)->
    #globalsetupCfg {
    id = 425,
    settype = divine_winernumbers,
    setpara = [20]
    };
getRow(drop_level)->
    #globalsetupCfg {
    id = 758,
    settype = drop_level,
    setpara = [1]
    };
getRow(english_randomname)->
    #globalsetupCfg {
    id = 487,
    settype = english_randomname,
    setpara = [14]
    };
getRow(engsavefactor)->
    #globalsetupCfg {
    id = 27,
    settype = engsavefactor,
    setpara = [1]
    };
getRow(equip_enchantmoney)->
    #globalsetupCfg {
    id = 150,
    settype = equip_enchantmoney,
    setpara = [2]
    };
getRow(equip_recheck_q)->
    #globalsetupCfg {
    id = 76,
    settype = equip_recheck_q,
    setpara = [3]
    };
getRow(equipinten_worldtext_limit)->
    #globalsetupCfg {
    id = 941,
    settype = equipinten_worldtext_limit,
    setpara = [10,15,20,25,30]
    };
getRow(equipRecastpropcast)->
    #globalsetupCfg {
    id = 889,
    settype = equipRecastpropcast,
    setpara = [222,1]
    };
getRow(equipRecastrunecast0)->
    #globalsetupCfg {
    id = 890,
    settype = equipRecastrunecast0,
    setpara = [222,1]
    };
getRow(equipRecastrunecast1)->
    #globalsetupCfg {
    id = 891,
    settype = equipRecastrunecast1,
    setpara = [222,2]
    };
getRow(equipRecastrunecast2)->
    #globalsetupCfg {
    id = 892,
    settype = equipRecastrunecast2,
    setpara = [222,3]
    };
getRow(equipstar_worldtext_limit)->
    #globalsetupCfg {
    id = 940,
    settype = equipstar_worldtext_limit,
    setpara = [5,8,10,12,15]
    };
getRow(escort_multiplayer_buf)->
    #globalsetupCfg {
    id = 659,
    settype = escort_multiplayer_buf,
    setpara = [{2,3,4,5}]
    };
getRow(escort_multiplayer_event)->
    #globalsetupCfg {
    id = 657,
    settype = escort_multiplayer_event,
    setpara = [{5,1,11},{12,1,11},{15,1,11}]
    };
getRow(escort_multiplayer_item)->
    #globalsetupCfg {
    id = 648,
    settype = escort_multiplayer_item,
    setpara = [{2214,1}]
    };
getRow(escort_multiplayer_level)->
    #globalsetupCfg {
    id = 662,
    settype = escort_multiplayer_level,
    setpara = [40]
    };
getRow(escort_multiplayer_num)->
    #globalsetupCfg {
    id = 650,
    settype = escort_multiplayer_num,
    setpara = [{3,3}]
    };
getRow(escort_multiplayer_reward)->
    #globalsetupCfg {
    id = 646,
    settype = escort_multiplayer_reward,
    setpara = [{1,5000000}]
    };
getRow(escort_singleplayer_buf)->
    #globalsetupCfg {
    id = 658,
    settype = escort_singleplayer_buf,
    setpara = [{2,3,4,5}]
    };
getRow(escort_singleplayer_event)->
    #globalsetupCfg {
    id = 656,
    settype = escort_singleplayer_event,
    setpara = [{4,1,9},{9,1,9},{14,1,9}]
    };
getRow(escort_singleplayer_item)->
    #globalsetupCfg {
    id = 647,
    settype = escort_singleplayer_item,
    setpara = [{2213,1}]
    };
getRow(escort_singleplayer_level)->
    #globalsetupCfg {
    id = 661,
    settype = escort_singleplayer_level,
    setpara = [40]
    };
getRow(escort_singleplayer_monster)->
    #globalsetupCfg {
    id = 655,
    settype = escort_singleplayer_monster,
    setpara = [{4,0,5},{9,0,5},{14,0,5},{19,0,5}]
    };
getRow(escort_singleplayer_num)->
    #globalsetupCfg {
    id = 649,
    settype = escort_singleplayer_num,
    setpara = [{1,3}]
    };
getRow(escort_singleplayer_reward)->
    #globalsetupCfg {
    id = 645,
    settype = escort_singleplayer_reward,
    setpara = [{2,200000}]
    };
getRow(evil_threshold)->
    #globalsetupCfg {
    id = 63,
    settype = evil_threshold,
    setpara = [100]
    };
getRow(evilkill_effect)->
    #globalsetupCfg {
    id = 968,
    settype = evilkill_effect,
    setpara = [{100,62008},{130,62009},{160,62010},{190,62011}]
    };
getRow(evilkill_level)->
    #globalsetupCfg {
    id = 967,
    settype = evilkill_level,
    setpara = [5,5,10]
    };
getRow(exp_2_item_info)->
    #globalsetupCfg {
    id = 699,
    settype = exp_2_item_info,
    setpara = [[101,5000,1], [102,50,1]]
    };
getRow(exp_autoget)->
    #globalsetupCfg {
    id = 971,
    settype = exp_autoget,
    setpara = [3000]
    };
getRow(exp_max)->
    #globalsetupCfg {
    id = 505,
    settype = exp_max,
    setpara = [24]
    };
getRow(expfuben_revivedtime)->
    #globalsetupCfg {
    id = 867,
    settype = expfuben_revivedtime,
    setpara = [5]
    };
getRow(expmaptime)->
    #globalsetupCfg {
    id = 838,
    settype = expmaptime,
    setpara = [1800]
    };
getRow(fable_challengetime)->
    #globalsetupCfg {
    id = 612,
    settype = fable_challengetime,
    setpara = [300]
    };
getRow(fable_die)->
    #globalsetupCfg {
    id = 610,
    settype = fable_die,
    setpara = [15]
    };
getRow(fable_number)->
    #globalsetupCfg {
    id = 613,
    settype = fable_number,
    setpara = [40]
    };
getRow(fable_preparetime)->
    #globalsetupCfg {
    id = 611,
    settype = fable_preparetime,
    setpara = [10]
    };
getRow(fashion_fixtime)->
    #globalsetupCfg {
    id = 756,
    settype = fashion_fixtime,
    setpara = [180]
    };
getRow(fashion_forever)->
    #globalsetupCfg {
    id = 755,
    settype = fashion_forever,
    setpara = [99999]
    };
getRow(fightall_attack)->
    #globalsetupCfg {
    id = 683,
    settype = fightall_attack,
    setpara = [{304,94},{37,94}]
    };
getRow(fightall_attacker)->
    #globalsetupCfg {
    id = 686,
    settype = fightall_attacker,
    setpara = [{99},{6,7}]
    };
getRow(fightall_defend)->
    #globalsetupCfg {
    id = 684,
    settype = fightall_defend,
    setpara = [{170,226},{170,226}]
    };
getRow(fightall_defender)->
    #globalsetupCfg {
    id = 685,
    settype = fightall_defender,
    setpara = [{1},{2,8,4,5}]
    };
getRow(fightall_InjuryStatistics)->
    #globalsetupCfg {
    id = 698,
    settype = fightall_InjuryStatistics,
    setpara = [25]
    };
getRow(fightall_lost)->
    #globalsetupCfg {
    id = 693,
    settype = fightall_lost,
    setpara = [2302]
    };
getRow(fightall_map_id)->
    #globalsetupCfg {
    id = 690,
    settype = fightall_map_id,
    setpara = [8001]
    };
getRow(fightall_mirror_armor)->
    #globalsetupCfg {
    id = 951,
    settype = fightall_mirror_armor,
    setpara = [0.007]
    };
getRow(fightall_mirror_atk)->
    #globalsetupCfg {
    id = 943,
    settype = fightall_mirror_atk,
    setpara = [0.001]
    };
getRow(fightall_mirror_crit)->
    #globalsetupCfg {
    id = 945,
    settype = fightall_mirror_crit,
    setpara = [0.016]
    };
getRow(fightall_mirror_critdamage)->
    #globalsetupCfg {
    id = 947,
    settype = fightall_mirror_critdamage,
    setpara = [0.011]
    };
getRow(fightall_mirror_def)->
    #globalsetupCfg {
    id = 944,
    settype = fightall_mirror_def,
    setpara = [0.045]
    };
getRow(fightall_mirror_dodge)->
    #globalsetupCfg {
    id = 950,
    settype = fightall_mirror_dodge,
    setpara = [0.004]
    };
getRow(fightall_mirror_hit)->
    #globalsetupCfg {
    id = 949,
    settype = fightall_mirror_hit,
    setpara = [0.007]
    };
getRow(fightall_mirror_HP)->
    #globalsetupCfg {
    id = 942,
    settype = fightall_mirror_HP,
    setpara = [10]
    };
getRow(fightall_mirror_redef)->
    #globalsetupCfg {
    id = 946,
    settype = fightall_mirror_redef,
    setpara = [0.004]
    };
getRow(fightall_mirror_toughness)->
    #globalsetupCfg {
    id = 948,
    settype = fightall_mirror_toughness,
    setpara = [0.007]
    };
getRow(fightall_open_count)->
    #globalsetupCfg {
    id = 697,
    settype = fightall_open_count,
    setpara = [1]
    };
getRow(fightall_open_level)->
    #globalsetupCfg {
    id = 696,
    settype = fightall_open_level,
    setpara = [40]
    };
getRow(fightall_statue)->
    #globalsetupCfg {
    id = 694,
    settype = fightall_statue,
    setpara = [{399,93.5,125.1,180},{398,93.5,125.1,180},{400,93.5,125.1,180},{401,93.5,125.1,180},{440,93.5,125.1,180}]
    };
getRow(fightall_win)->
    #globalsetupCfg {
    id = 692,
    settype = fightall_win,
    setpara = [2301]
    };
getRow(fightbossactivity)->
    #globalsetupCfg {
    id = 626,
    settype = fightbossactivity,
    setpara = [3,224,1]
    };
getRow(filed_exp_decline)->
    #globalsetupCfg {
    id = 970,
    settype = filed_exp_decline,
    setpara = [0.05]
    };
getRow(first_buy_pet)->
    #globalsetupCfg {
    id = 877,
    settype = first_buy_pet,
    setpara = [51006]
    };
getRow(firstbloodmonster)->
    #globalsetupCfg {
    id = 106,
    settype = firstbloodmonster,
    setpara = [2610,2611,2612,2613,2614,3154,3155,3156,3157,5807,5808,5809,5810,5811,3400,3401,3402,3403,3450,3451,3452,1103,1104]
    };
getRow(fistplanes)->
    #globalsetupCfg {
    id = 73,
    settype = fistplanes,
    setpara = [13000]
    };
getRow(flowers)->
    #globalsetupCfg {
    id = 689,
    settype = flowers,
    setpara = [2300]
    };
getRow(found_level)->
    #globalsetupCfg {
    id = 372,
    settype = found_level,
    setpara = [30]
    };
getRow(free_weddingitem_num)->
    #globalsetupCfg {
    id = 732,
    settype = free_weddingitem_num,
    setpara = [1]
    };
getRow(friend_action_point_every_gain)->
    #globalsetupCfg {
    id = 374,
    settype = friend_action_point_every_gain,
    setpara = [2]
    };
getRow(friend_avoid_harassment)->
    #globalsetupCfg {
    id = 380,
    settype = friend_avoid_harassment,
    setpara = [0,1,2,3,4,5,6]
    };
getRow(friend_closeness_give_ap)->
    #globalsetupCfg {
    id = 373,
    settype = friend_closeness_give_ap,
    setpara = [1]
    };
getRow(friend_count_blacklist_max)->
    #globalsetupCfg {
    id = 378,
    settype = friend_count_blacklist_max,
    setpara = [100]
    };
getRow(friend_count_blacklist_threshold)->
    #globalsetupCfg {
    id = 377,
    settype = friend_count_blacklist_threshold,
    setpara = [30]
    };
getRow(friend_count_friendlist_max)->
    #globalsetupCfg {
    id = 379,
    settype = friend_count_friendlist_max,
    setpara = [200]
    };
getRow(friend_count_gain_ap_max)->
    #globalsetupCfg {
    id = 376,
    settype = friend_count_gain_ap_max,
    setpara = [10]
    };
getRow(friend_count_give_ap_max)->
    #globalsetupCfg {
    id = 375,
    settype = friend_count_give_ap_max,
    setpara = [20]
    };
getRow(friend_count_mapmate)->
    #globalsetupCfg {
    id = 382,
    settype = friend_count_mapmate,
    setpara = [50]
    };
getRow(friend_count_teammate)->
    #globalsetupCfg {
    id = 381,
    settype = friend_count_teammate,
    setpara = [5]
    };
getRow(friend_timelimit_query_mtb)->
    #globalsetupCfg {
    id = 383,
    settype = friend_timelimit_query_mtb,
    setpara = [30]
    };
getRow(friend_timelimit_query_r)->
    #globalsetupCfg {
    id = 384,
    settype = friend_timelimit_query_r,
    setpara = [1]
    };
getRow(friend2_add_applicant_count)->
    #globalsetupCfg {
    id = 386,
    settype = friend2_add_applicant_count,
    setpara = [20]
    };
getRow(friend2_add_applicant_life)->
    #globalsetupCfg {
    id = 387,
    settype = friend2_add_applicant_life,
    setpara = [259200]
    };
getRow(friend2_add_applicant_page_count)->
    #globalsetupCfg {
    id = 388,
    settype = friend2_add_applicant_page_count,
    setpara = [8]
    };
getRow(friend2_add_applicant_sync_cd)->
    #globalsetupCfg {
    id = 390,
    settype = friend2_add_applicant_sync_cd,
    setpara = [30]
    };
getRow(friend2_add_cd)->
    #globalsetupCfg {
    id = 385,
    settype = friend2_add_cd,
    setpara = [300]
    };
getRow(friend2_black_ban)->
    #globalsetupCfg {
    id = 401,
    settype = friend2_black_ban,
    setpara = [20,40]
    };
getRow(friend2_black_count)->
    #globalsetupCfg {
    id = 399,
    settype = friend2_black_count,
    setpara = [200]
    };
getRow(friend2_black_page_count)->
    #globalsetupCfg {
    id = 400,
    settype = friend2_black_page_count,
    setpara = [8]
    };
getRow(friend2_black_silent)->
    #globalsetupCfg {
    id = 394,
    settype = friend2_black_silent,
    setpara = [30,30]
    };
getRow(friend2_ChatWordLimit)->
    #globalsetupCfg {
    id = 414,
    settype = friend2_ChatWordLimit,
    setpara = [50]
    };
getRow(friend2_ExpressionLimit)->
    #globalsetupCfg {
    id = 415,
    settype = friend2_ExpressionLimit,
    setpara = [3]
    };
getRow(friend2_formal_closeness_count)->
    #globalsetupCfg {
    id = 403,
    settype = friend2_formal_closeness_count,
    setpara = [99999]
    };
getRow(friend2_formal_count)->
    #globalsetupCfg {
    id = 389,
    settype = friend2_formal_count,
    setpara = [200]
    };
getRow(friend2_formal_gain_ap_count)->
    #globalsetupCfg {
    id = 405,
    settype = friend2_formal_gain_ap_count,
    setpara = [10]
    };
getRow(friend2_formal_gain_ap_value)->
    #globalsetupCfg {
    id = 406,
    settype = friend2_formal_gain_ap_value,
    setpara = [2]
    };
getRow(friend2_formal_give_ap_count)->
    #globalsetupCfg {
    id = 404,
    settype = friend2_formal_give_ap_count,
    setpara = [10]
    };
getRow(friend2_formal_like_count)->
    #globalsetupCfg {
    id = 402,
    settype = friend2_formal_like_count,
    setpara = [10]
    };
getRow(friend2_formal_page_count)->
    #globalsetupCfg {
    id = 391,
    settype = friend2_formal_page_count,
    setpara = [20]
    };
getRow(friend2_formal_sort)->
    #globalsetupCfg {
    id = 392,
    settype = friend2_formal_sort,
    setpara = [9,8,7,6]
    };
getRow(friend2_formal_sync_cd)->
    #globalsetupCfg {
    id = 393,
    settype = friend2_formal_sync_cd,
    setpara = [300]
    };
getRow(friend2_formal_transmit_cd)->
    #globalsetupCfg {
    id = 407,
    settype = friend2_formal_transmit_cd,
    setpara = [15]
    };
getRow(friend2_ItemLimit)->
    #globalsetupCfg {
    id = 416,
    settype = friend2_ItemLimit,
    setpara = [3]
    };
getRow(friend2_recommend_cd)->
    #globalsetupCfg {
    id = 409,
    settype = friend2_recommend_cd,
    setpara = [5]
    };
getRow(friend2_recommend_count)->
    #globalsetupCfg {
    id = 410,
    settype = friend2_recommend_count,
    setpara = [20]
    };
getRow(friend2_recommend_filter)->
    #globalsetupCfg {
    id = 411,
    settype = friend2_recommend_filter,
    setpara = [1,1]
    };
getRow(friend2_recommend_filter_count)->
    #globalsetupCfg {
    id = 412,
    settype = friend2_recommend_filter_count,
    setpara = [5]
    };
getRow(friend2_search_cd)->
    #globalsetupCfg {
    id = 408,
    settype = friend2_search_cd,
    setpara = [1]
    };
getRow(friend2_temp_count)->
    #globalsetupCfg {
    id = 396,
    settype = friend2_temp_count,
    setpara = [100]
    };
getRow(friend2_temp_page_count)->
    #globalsetupCfg {
    id = 397,
    settype = friend2_temp_page_count,
    setpara = [20]
    };
getRow(friend2_temp_sort)->
    #globalsetupCfg {
    id = 395,
    settype = friend2_temp_sort,
    setpara = [9,8,3,1,2]
    };
getRow(friend2_temp_sync_cd)->
    #globalsetupCfg {
    id = 398,
    settype = friend2_temp_sync_cd,
    setpara = [300]
    };
getRow(friend2_Transmit)->
    #globalsetupCfg {
    id = 413,
    settype = friend2_Transmit,
    setpara = [1,15]
    };
getRow(friendlinessFromRedEnvelopeLimit)->
    #globalsetupCfg {
    id = 417,
    settype = friendlinessFromRedEnvelopeLimit,
    setpara = [5]
    };
getRow(friends_crossapplycd)->
    #globalsetupCfg {
    id = 961,
    settype = friends_crossapplycd,
    setpara = [1]
    };
getRow(friends_crossapplycount)->
    #globalsetupCfg {
    id = 960,
    settype = friends_crossapplycount,
    setpara = [10]
    };
getRow(friends_crosscount)->
    #globalsetupCfg {
    id = 959,
    settype = friends_crosscount,
    setpara = [80]
    };
getRow(friends_listconfine)->
    #globalsetupCfg {
    id = 976,
    settype = friends_listconfine,
    setpara = [50]
    };
getRow(friends_pushlevelmax)->
    #globalsetupCfg {
    id = 975,
    settype = friends_pushlevelmax,
    setpara = [9,32]
    };
getRow(friends_pushnum)->
    #globalsetupCfg {
    id = 974,
    settype = friends_pushnum,
    setpara = [2,5]
    };
getRow(friends_pushtime)->
    #globalsetupCfg {
    id = 973,
    settype = friends_pushtime,
    setpara = [0,10,30,60]
    };
getRow(fs_nq)->
    #globalsetupCfg {
    id = 17,
    settype = fs_nq,
    setpara = []
    };
getRow(gem_equippart_color)->
    #globalsetupCfg {
    id = 952,
    settype = gem_equippart_color,
    setpara = [{0,1,2},{0,2,1},{1,0,2},{1,1,2},{2,1,2},{0,2,2},{0,1,0},{0,1,1}]
    };
getRow(gem_mixcost1)->
    #globalsetupCfg {
    id = 445,
    settype = gem_mixcost1,
    setpara = [1000]
    };
getRow(gem_mixcost2)->
    #globalsetupCfg {
    id = 446,
    settype = gem_mixcost2,
    setpara = [3000]
    };
getRow(gem_mixcost3)->
    #globalsetupCfg {
    id = 447,
    settype = gem_mixcost3,
    setpara = [8000]
    };
getRow(gem_mixcost4)->
    #globalsetupCfg {
    id = 448,
    settype = gem_mixcost4,
    setpara = [15000]
    };
getRow(gem_mixcost5)->
    #globalsetupCfg {
    id = 449,
    settype = gem_mixcost5,
    setpara = [30000]
    };
getRow(gem_mixcost6)->
    #globalsetupCfg {
    id = 450,
    settype = gem_mixcost6,
    setpara = [50000]
    };
getRow(gem_mixcost7)->
    #globalsetupCfg {
    id = 451,
    settype = gem_mixcost7,
    setpara = [50000]
    };
getRow(gem_mixcost8)->
    #globalsetupCfg {
    id = 452,
    settype = gem_mixcost8,
    setpara = [50000]
    };
getRow(gem_mixcost9)->
    #globalsetupCfg {
    id = 453,
    settype = gem_mixcost9,
    setpara = [50000]
    };
getRow(gem_value1)->
    #globalsetupCfg {
    id = 454,
    settype = gem_value1,
    setpara = [1]
    };
getRow(gem_value10)->
    #globalsetupCfg {
    id = 463,
    settype = gem_value10,
    setpara = [512]
    };
getRow(gem_value2)->
    #globalsetupCfg {
    id = 455,
    settype = gem_value2,
    setpara = [2]
    };
getRow(gem_value3)->
    #globalsetupCfg {
    id = 456,
    settype = gem_value3,
    setpara = [4]
    };
getRow(gem_value4)->
    #globalsetupCfg {
    id = 457,
    settype = gem_value4,
    setpara = [8]
    };
getRow(gem_value5)->
    #globalsetupCfg {
    id = 458,
    settype = gem_value5,
    setpara = [16]
    };
getRow(gem_value6)->
    #globalsetupCfg {
    id = 459,
    settype = gem_value6,
    setpara = [32]
    };
getRow(gem_value7)->
    #globalsetupCfg {
    id = 460,
    settype = gem_value7,
    setpara = [64]
    };
getRow(gem_value8)->
    #globalsetupCfg {
    id = 461,
    settype = gem_value8,
    setpara = [128]
    };
getRow(gem_value9)->
    #globalsetupCfg {
    id = 462,
    settype = gem_value9,
    setpara = [256]
    };
getRow(giveGiftLevel)->
    #globalsetupCfg {
    id = 972,
    settype = giveGiftLevel,
    setpara = [25]
    };
getRow(giveGiftString)->
    #globalsetupCfg {
    id = 979,
    settype = giveGiftString,
    setpara = [1,9,66,99]
    };
getRow(giveGiftVIP)->
    #globalsetupCfg {
    id = 980,
    settype = giveGiftVIP,
    setpara = [66]
    };
getRow(global_in)->
    #globalsetupCfg {
    id = 149,
    settype = global_in,
    setpara = [1.05]
    };
getRow(goblin_first_lotterydraw)->
    #globalsetupCfg {
    id = 909,
    settype = goblin_first_lotterydraw,
    setpara = [{101,1811,1},{201,1811,1},{301,1811,1}]
    };
getRow(goblin_free_counts)->
    #globalsetupCfg {
    id = 432,
    settype = goblin_free_counts,
    setpara = [2]
    };
getRow(goblin_once_gift)->
    #globalsetupCfg {
    id = 924,
    settype = goblin_once_gift,
    setpara = [{2160,5}]
    };
getRow(goblin_onceandten_money)->
    #globalsetupCfg {
    id = 433,
    settype = goblin_onceandten_money,
    setpara = [100,900]
    };
getRow(goblin_ten_gift)->
    #globalsetupCfg {
    id = 925,
    settype = goblin_ten_gift,
    setpara = [{2160,50}]
    };
getRow(goddess)->
    #globalsetupCfg {
    id = 872,
    settype = goddess,
    setpara = [{190,690},{191,691},{192,692},{193,693},{194,694}]
    };
getRow(goddess_lamb)->
    #globalsetupCfg {
    id = 873,
    settype = goddess_lamb,
    setpara = [0.1]
    };
getRow(goddess_textures)->
    #globalsetupCfg {
    id = 958,
    settype = goddess_textures,
    setpara = [1,1,1,1,1,1]
    };
getRow(gold_exchange)->
    #globalsetupCfg {
    id = 492,
    settype = gold_exchange,
    setpara = [10000]
    };
getRow(greenAffix)->
    #globalsetupCfg {
    id = 118,
    settype = greenAffix,
    setpara = [{1,0,50},{1,1,50}]
    };
getRow(greenFactor)->
    #globalsetupCfg {
    id = 111,
    settype = greenFactor,
    setpara = []
    };
getRow(gripSpeed)->
    #globalsetupCfg {
    id = 28,
    settype = gripSpeed,
    setpara = [50]
    };
getRow(guaji_stay_time)->
    #globalsetupCfg {
    id = 52,
    settype = guaji_stay_time,
    setpara = [500]
    };
getRow(guild_apply_cd)->
    #globalsetupCfg {
    id = 362,
    settype = guild_apply_cd,
    setpara = [120]
    };
getRow(guild_apply_maxcount)->
    #globalsetupCfg {
    id = 361,
    settype = guild_apply_maxcount,
    setpara = [10]
    };
getRow(guild_apply_pro)->
    #globalsetupCfg {
    id = 305,
    settype = guild_apply_pro,
    setpara = [3500,2500,2000,1500,500]
    };
getRow(guild_battle_addpoint)->
    #globalsetupCfg {
    id = 300,
    settype = guild_battle_addpoint,
    setpara = [5]
    };
getRow(guild_battle_applyminlvl)->
    #globalsetupCfg {
    id = 306,
    settype = guild_battle_applyminlvl,
    setpara = [2]
    };
getRow(guild_battle_calcrange)->
    #globalsetupCfg {
    id = 301,
    settype = guild_battle_calcrange,
    setpara = [103,89, 5]
    };
getRow(guild_battle_reward1)->
    #globalsetupCfg {
    id = 302,
    settype = guild_battle_reward1,
    setpara = [1730]
    };
getRow(guild_battle_reward2)->
    #globalsetupCfg {
    id = 303,
    settype = guild_battle_reward2,
    setpara = [1732]
    };
getRow(guild_battle_reward3)->
    #globalsetupCfg {
    id = 304,
    settype = guild_battle_reward3,
    setpara = [1731]
    };
getRow(guild_boss1)->
    #globalsetupCfg {
    id = 269,
    settype = guild_boss1,
    setpara = [2041]
    };
getRow(guild_boss2)->
    #globalsetupCfg {
    id = 270,
    settype = guild_boss2,
    setpara = [2042]
    };
getRow(guild_boss3)->
    #globalsetupCfg {
    id = 271,
    settype = guild_boss3,
    setpara = [2043]
    };
getRow(guild_boss4)->
    #globalsetupCfg {
    id = 272,
    settype = guild_boss4,
    setpara = [2044]
    };
getRow(guild_boss5)->
    #globalsetupCfg {
    id = 273,
    settype = guild_boss5,
    setpara = [2045]
    };
getRow(guild_cd)->
    #globalsetupCfg {
    id = 342,
    settype = guild_cd,
    setpara = [3600]
    };
getRow(guild_cd_master)->
    #globalsetupCfg {
    id = 364,
    settype = guild_cd_master,
    setpara = [60]
    };
getRow(guild_contribute_max)->
    #globalsetupCfg {
    id = 360,
    settype = guild_contribute_max,
    setpara = [100000]
    };
getRow(guild_conversion_currency)->
    #globalsetupCfg {
    id = 935,
    settype = guild_conversion_currency,
    setpara = [12,24,1,9999]
    };
getRow(guild_conversion_item)->
    #globalsetupCfg {
    id = 936,
    settype = guild_conversion_item,
    setpara = [222,1,9999]
    };
getRow(guild_createCost)->
    #globalsetupCfg {
    id = 341,
    settype = guild_createCost,
    setpara = [288]
    };
getRow(guild_dia_onetime)->
    #globalsetupCfg {
    id = 314,
    settype = guild_dia_onetime,
    setpara = [100]
    };
getRow(guild_diamax_day)->
    #globalsetupCfg {
    id = 312,
    settype = guild_diamax_day,
    setpara = [5]
    };
getRow(guild_exchange_limit)->
    #globalsetupCfg {
    id = 353,
    settype = guild_exchange_limit,
    setpara = [1]
    };
getRow(guild_exp_add)->
    #globalsetupCfg {
    id = 317,
    settype = guild_exp_add,
    setpara = [100]
    };
getRow(guild_fairground_free)->
    #globalsetupCfg {
    id = 923,
    settype = guild_fairground_free,
    setpara = [1]
    };
getRow(guild_godbless_limit)->
    #globalsetupCfg {
    id = 350,
    settype = guild_godbless_limit,
    setpara = [1,7200]
    };
getRow(guild_godbless_param)->
    #globalsetupCfg {
    id = 351,
    settype = guild_godbless_param,
    setpara = [5000,200000]
    };
getRow(guild_gold_onetime)->
    #globalsetupCfg {
    id = 313,
    settype = guild_gold_onetime,
    setpara = [100000]
    };
getRow(guild_goldmax_day)->
    #globalsetupCfg {
    id = 311,
    settype = guild_goldmax_day,
    setpara = [5]
    };
getRow(guild_gx_add)->
    #globalsetupCfg {
    id = 315,
    settype = guild_gx_add,
    setpara = [100]
    };
getRow(guild_impeach_activitytime)->
    #globalsetupCfg {
    id = 338,
    settype = guild_impeach_activitytime,
    setpara = [3600]
    };
getRow(guild_impeach_money)->
    #globalsetupCfg {
    id = 336,
    settype = guild_impeach_money,
    setpara = [3,100]
    };
getRow(guild_impeach_num)->
    #globalsetupCfg {
    id = 335,
    settype = guild_impeach_num,
    setpara = [3]
    };
getRow(guild_impeach_offline)->
    #globalsetupCfg {
    id = 337,
    settype = guild_impeach_offline,
    setpara = [604800]
    };
getRow(guild_join_level)->
    #globalsetupCfg {
    id = 340,
    settype = guild_join_level,
    setpara = [24]
    };
getRow(guild_member_latelylogintime)->
    #globalsetupCfg {
    id = 363,
    settype = guild_member_latelylogintime,
    setpara = [259200]
    };
getRow(guild_modifyname)->
    #globalsetupCfg {
    id = 310,
    settype = guild_modifyname,
    setpara = [2700]
    };
getRow(guild_name_max_length)->
    #globalsetupCfg {
    id = 339,
    settype = guild_name_max_length,
    setpara = [12]
    };
getRow(guild_overskill)->
    #globalsetupCfg {
    id = 309,
    settype = guild_overskill,
    setpara = [0.8]
    };
getRow(guild_request_notice_cd)->
    #globalsetupCfg {
    id = 365,
    settype = guild_request_notice_cd,
    setpara = [3600]
    };
getRow(guild_request_time)->
    #globalsetupCfg {
    id = 366,
    settype = guild_request_time,
    setpara = [60]
    };
getRow(guild_scene)->
    #globalsetupCfg {
    id = 299,
    settype = guild_scene,
    setpara = [{1,386},{2,387},{3,388},{4,389},{5,390}]
    };
getRow(guild_selecttime)->
    #globalsetupCfg {
    id = 367,
    settype = guild_selecttime,
    setpara = [30]
    };
getRow(guild_shop_conver)->
    #globalsetupCfg {
    id = 359,
    settype = guild_shop_conver,
    setpara = [100,1000]
    };
getRow(guild_shop_level_ID)->
    #globalsetupCfg {
    id = 343,
    settype = guild_shop_level_ID,
    setpara = [{1,100},{2,101}]
    };
getRow(guild_shop_limit)->
    #globalsetupCfg {
    id = 352,
    settype = guild_shop_limit,
    setpara = [1]
    };
getRow(guild_snowman_contribute)->
    #globalsetupCfg {
    id = 355,
    settype = guild_snowman_contribute,
    setpara = [1]
    };
getRow(guild_snowman_exp)->
    #globalsetupCfg {
    id = 354,
    settype = guild_snowman_exp,
    setpara = [50, 1000]
    };
getRow(guild_snowman_gift)->
    #globalsetupCfg {
    id = 356,
    settype = guild_snowman_gift,
    setpara = [102]
    };
getRow(guild_snowman_npcID)->
    #globalsetupCfg {
    id = 357,
    settype = guild_snowman_npcID,
    setpara = [30000,30001,30002,30003,30004]
    };
getRow(guild_snowman_settle)->
    #globalsetupCfg {
    id = 358,
    settype = guild_snowman_settle,
    setpara = [100, 10000]
    };
getRow(guild_suppliesAll)->
    #globalsetupCfg {
    id = 307,
    settype = guild_suppliesAll,
    setpara = [99999999]
    };
getRow(guild_suppliesOwn)->
    #globalsetupCfg {
    id = 308,
    settype = guild_suppliesOwn,
    setpara = [5000]
    };
getRow(guild_sw_add)->
    #globalsetupCfg {
    id = 316,
    settype = guild_sw_add,
    setpara = [100]
    };
getRow(guild_wish_confine)->
    #globalsetupCfg {
    id = 978,
    settype = guild_wish_confine,
    setpara = [{0,5,12,20},{1,4,12,30},{2,3,12,50},{3,2,12,100},{4,1,12,300}]
    };
getRow(guildbattleapplyres)->
    #globalsetupCfg {
    id = 344,
    settype = guildbattleapplyres,
    setpara = [800]
    };
getRow(guildbattleBaseConfig)->
    #globalsetupCfg {
    id = 348,
    settype = guildbattleBaseConfig,
    setpara = [2000,10,2,1,5]
    };
getRow(guildbattlecollectids)->
    #globalsetupCfg {
    id = 346,
    settype = guildbattlecollectids,
    setpara = [{11000,20},{11001,10},{11002,10},{11003,2}]
    };
getRow(guildbattleDefendBoss)->
    #globalsetupCfg {
    id = 347,
    settype = guildbattleDefendBoss,
    setpara = [{3400,178,262}, {3402,110,265}, {3401,473,255}, {3403,550,265}]
    };
getRow(guildbattlerevivepos)->
    #globalsetupCfg {
    id = 345,
    settype = guildbattlerevivepos,
    setpara = [{112,297},{595,248}]
    };
getRow(guildbattleReward)->
    #globalsetupCfg {
    id = 349,
    settype = guildbattleReward,
    setpara = [{10000,1500,0,50000,5000},{5000,1000,0,30000,2500}]
    };
getRow(guildhome_guild)->
    #globalsetupCfg {
    id = 265,
    settype = guildhome_guild,
    setpara = [4]
    };
getRow(guildhome_homexy)->
    #globalsetupCfg {
    id = 267,
    settype = guildhome_homexy,
    setpara = [{66,89},{89,88}]
    };
getRow(guildhome_monsternum)->
    #globalsetupCfg {
    id = 264,
    settype = guildhome_monsternum,
    setpara = [3]
    };
getRow(guildhome_monstertime)->
    #globalsetupCfg {
    id = 263,
    settype = guildhome_monstertime,
    setpara = [10]
    };
getRow(guildhome_monsterxy)->
    #globalsetupCfg {
    id = 266,
    settype = guildhome_monsterxy,
    setpara = [7032,78,78]
    };
getRow(guildhome_ourxy)->
    #globalsetupCfg {
    id = 268,
    settype = guildhome_ourxy,
    setpara = [{65,22},{85,21}]
    };
getRow(guildhome_task1)->
    #globalsetupCfg {
    id = 258,
    settype = guildhome_task1,
    setpara = [2]
    };
getRow(guildhome_task2)->
    #globalsetupCfg {
    id = 259,
    settype = guildhome_task2,
    setpara = [3]
    };
getRow(guildhome_taskcd)->
    #globalsetupCfg {
    id = 262,
    settype = guildhome_taskcd,
    setpara = [180]
    };
getRow(guildhome_taskmax)->
    #globalsetupCfg {
    id = 260,
    settype = guildhome_taskmax,
    setpara = [5]
    };
getRow(guildhome_tasktime)->
    #globalsetupCfg {
    id = 261,
    settype = guildhome_tasktime,
    setpara = [{12,12},{18,18}]
    };
getRow(hero_time)->
    #globalsetupCfg {
    id = 782,
    settype = hero_time,
    setpara = [1.1]
    };
getRow(hero_trigger1)->
    #globalsetupCfg {
    id = 780,
    settype = hero_trigger1,
    setpara = [9999]
    };
getRow(hero_trigger2)->
    #globalsetupCfg {
    id = 781,
    settype = hero_trigger2,
    setpara = [9999]
    };
getRow(hit_base)->
    #globalsetupCfg {
    id = 915,
    settype = hit_base,
    setpara = [0.98]
    };
getRow(hitaway_range)->
    #globalsetupCfg {
    id = 33,
    settype = hitaway_range,
    setpara = [4]
    };
getRow(hitaway_spdown)->
    #globalsetupCfg {
    id = 35,
    settype = hitaway_spdown,
    setpara = [25]
    };
getRow(hitaway_speed)->
    #globalsetupCfg {
    id = 32,
    settype = hitaway_speed,
    setpara = [20]
    };
getRow(hitaway_var)->
    #globalsetupCfg {
    id = 34,
    settype = hitaway_var,
    setpara = [0.2]
    };
getRow(home_namefix)->
    #globalsetupCfg {
    id = 982,
    settype = home_namefix,
    setpara = [3,200]
    };
getRow(honor_open)->
    #globalsetupCfg {
    id = 511,
    settype = honor_open,
    setpara = [1,35]
    };
getRow(horn_diamond)->
    #globalsetupCfg {
    id = 94,
    settype = horn_diamond,
    setpara = [10]
    };
getRow(horn_item)->
    #globalsetupCfg {
    id = 99,
    settype = horn_item,
    setpara = [72]
    };
getRow(horn_level)->
    #globalsetupCfg {
    id = 95,
    settype = horn_level,
    setpara = [30]
    };
getRow(horn_num)->
    #globalsetupCfg {
    id = 96,
    settype = horn_num,
    setpara = [3]
    };
getRow(horn_seetime)->
    #globalsetupCfg {
    id = 98,
    settype = horn_seetime,
    setpara = [5]
    };
getRow(horn_words)->
    #globalsetupCfg {
    id = 97,
    settype = horn_words,
    setpara = [40]
    };
getRow(identity_age_limit)->
    #globalsetupCfg {
    id = 749,
    settype = identity_age_limit,
    setpara = [0, 120]
    };
getRow(identity_pic_count)->
    #globalsetupCfg {
    id = 751,
    settype = identity_pic_count,
    setpara = [3]
    };
getRow(identity_sign_count)->
    #globalsetupCfg {
    id = 752,
    settype = identity_sign_count,
    setpara = [74]
    };
getRow(identity_tag_count)->
    #globalsetupCfg {
    id = 750,
    settype = identity_tag_count,
    setpara = [10]
    };
getRow(instance_level)->
    #globalsetupCfg {
    id = 516,
    settype = instance_level,
    setpara = [5]
    };
getRow(integral)->
    #globalsetupCfg {
    id = 326,
    settype = integral,
    setpara = [200,20,20,5,5]
    };
getRow(intensify_lv0)->
    #globalsetupCfg {
    id = 127,
    settype = intensify_lv0,
    setpara = []
    };
getRow(intensify_lv1)->
    #globalsetupCfg {
    id = 128,
    settype = intensify_lv1,
    setpara = [1]
    };
getRow(intensify_lv10)->
    #globalsetupCfg {
    id = 137,
    settype = intensify_lv10,
    setpara = [10]
    };
getRow(intensify_lv11)->
    #globalsetupCfg {
    id = 138,
    settype = intensify_lv11,
    setpara = [11]
    };
getRow(intensify_lv12)->
    #globalsetupCfg {
    id = 139,
    settype = intensify_lv12,
    setpara = [12]
    };
getRow(intensify_lv13)->
    #globalsetupCfg {
    id = 140,
    settype = intensify_lv13,
    setpara = [13]
    };
getRow(intensify_lv14)->
    #globalsetupCfg {
    id = 141,
    settype = intensify_lv14,
    setpara = [14]
    };
getRow(intensify_lv15)->
    #globalsetupCfg {
    id = 142,
    settype = intensify_lv15,
    setpara = [15]
    };
getRow(intensify_lv16)->
    #globalsetupCfg {
    id = 143,
    settype = intensify_lv16,
    setpara = [16]
    };
getRow(intensify_lv17)->
    #globalsetupCfg {
    id = 144,
    settype = intensify_lv17,
    setpara = [17]
    };
getRow(intensify_lv18)->
    #globalsetupCfg {
    id = 145,
    settype = intensify_lv18,
    setpara = [18]
    };
getRow(intensify_lv19)->
    #globalsetupCfg {
    id = 146,
    settype = intensify_lv19,
    setpara = [19]
    };
getRow(intensify_lv2)->
    #globalsetupCfg {
    id = 129,
    settype = intensify_lv2,
    setpara = [2]
    };
getRow(intensify_lv20)->
    #globalsetupCfg {
    id = 147,
    settype = intensify_lv20,
    setpara = [20]
    };
getRow(intensify_lv3)->
    #globalsetupCfg {
    id = 130,
    settype = intensify_lv3,
    setpara = [3]
    };
getRow(intensify_lv4)->
    #globalsetupCfg {
    id = 131,
    settype = intensify_lv4,
    setpara = [4]
    };
getRow(intensify_lv5)->
    #globalsetupCfg {
    id = 132,
    settype = intensify_lv5,
    setpara = [5]
    };
getRow(intensify_lv6)->
    #globalsetupCfg {
    id = 133,
    settype = intensify_lv6,
    setpara = [6]
    };
getRow(intensify_lv7)->
    #globalsetupCfg {
    id = 134,
    settype = intensify_lv7,
    setpara = [7]
    };
getRow(intensify_lv8)->
    #globalsetupCfg {
    id = 135,
    settype = intensify_lv8,
    setpara = [8]
    };
getRow(intensify_lv9)->
    #globalsetupCfg {
    id = 136,
    settype = intensify_lv9,
    setpara = [9]
    };
getRow(jjc_1v1_freetimes)->
    #globalsetupCfg {
    id = 771,
    settype = jjc_1v1_freetimes,
    setpara = [5]
    };
getRow(jjc_1v1_rewardtime)->
    #globalsetupCfg {
    id = 772,
    settype = jjc_1v1_rewardtime,
    setpara = [21]
    };
getRow(jjc_attack)->
    #globalsetupCfg {
    id = 773,
    settype = jjc_attack,
    setpara = [200,220]
    };
getRow(jjc_defend)->
    #globalsetupCfg {
    id = 774,
    settype = jjc_defend,
    setpara = [200,180]
    };
getRow(jjc_item)->
    #globalsetupCfg {
    id = 776,
    settype = jjc_item,
    setpara = [{1,33,104},{34,41,105},{42,49,106},{50,57,107},{58,60,109}]
    };
getRow(jjc_lose)->
    #globalsetupCfg {
    id = 778,
    settype = jjc_lose,
    setpara = [200]
    };
getRow(jjc_money)->
    #globalsetupCfg {
    id = 779,
    settype = jjc_money,
    setpara = [{6,10},{6,10},{6,10},{6,20},{6,20},{6,20},{6,30},{6,30},{6,40},{6,50}]
    };
getRow(jjc_objectdirection)->
    #globalsetupCfg {
    id = 770,
    settype = jjc_objectdirection,
    setpara = []
    };
getRow(jjc_open)->
    #globalsetupCfg {
    id = 767,
    settype = jjc_open,
    setpara = [22]
    };
getRow(jjc_plus)->
    #globalsetupCfg {
    id = 766,
    settype = jjc_plus,
    setpara = [{5000,10000,[{4,0.05},{26,0.05},{28,0.05},{30,0.05},{31,0.05},{32,0.05},{33,0.05},{59,0.05}]},{10001,20000,[{4,0.1},{26,0.1},{28,0.1},{30,0.1},{31,0.1},{32,0.1},{33,0.1},{59,0.1}]},{20001,1000000,[{4,0.15},{26,0.15},{28,0.15},{30,0.15},{31,0.15},{32,0.15},{33,0.15},{59,0.15}]}]
    };
getRow(jjc_time)->
    #globalsetupCfg {
    id = 775,
    settype = jjc_time,
    setpara = [180]
    };
getRow(jjc_win)->
    #globalsetupCfg {
    id = 777,
    settype = jjc_win,
    setpara = [500]
    };
getRow(jjc_worship)->
    #globalsetupCfg {
    id = 768,
    settype = jjc_worship,
    setpara = [20]
    };
getRow(jjs_createreward)->
    #globalsetupCfg {
    id = 888,
    settype = jjs_createreward,
    setpara = [27015,1]
    };
getRow(jjs_nq)->
    #globalsetupCfg {
    id = 20,
    settype = jjs_nq,
    setpara = []
    };
getRow(killing_broadcast)->
    #globalsetupCfg {
    id = 61,
    settype = killing_broadcast,
    setpara = [300]
    };
getRow(killing_cost)->
    #globalsetupCfg {
    id = 60,
    settype = killing_cost,
    setpara = [10000]
    };
getRow(killing_die)->
    #globalsetupCfg {
    id = 62,
    settype = killing_die,
    setpara = [100]
    };
getRow(killing_firstvalue)->
    #globalsetupCfg {
    id = 56,
    settype = killing_firstvalue,
    setpara = [5]
    };
getRow(killing_punishment)->
    #globalsetupCfg {
    id = 59,
    settype = killing_punishment,
    setpara = [100]
    };
getRow(killing_punishmentbuff)->
    #globalsetupCfg {
    id = 58,
    settype = killing_punishmentbuff,
    setpara = [91]
    };
getRow(killing_time)->
    #globalsetupCfg {
    id = 55,
    settype = killing_time,
    setpara = [300,1]
    };
getRow(killing_value)->
    #globalsetupCfg {
    id = 57,
    settype = killing_value,
    setpara = [10]
    };
getRow(king_battle_award_rank_number)->
    #globalsetupCfg {
    id = 702,
    settype = king_battle_award_rank_number,
    setpara = [10]
    };
getRow(king_battle_defender_item_info)->
    #globalsetupCfg {
    id = 701,
    settype = king_battle_defender_item_info,
    setpara = [[[2600,30,1]]]
    };
getRow(king_battle_rank_item_info)->
    #globalsetupCfg {
    id = 700,
    settype = king_battle_rank_item_info,
    setpara = [[[2600,30,1],[2600,28,1],[2600,26,1],[2600,24,1],[2600,22,1],[2600,20,1],[2600,18,1],[2600,16,1],[2600,14,1],[2600,10,1]]]
    };
getRow(kingBattleRepairMirrorCfg)->
    #globalsetupCfg {
    id = 703,
    settype = kingBattleRepairMirrorCfg,
    setpara = [{3, 500}]
    };
getRow(kmaxchar)->
    #globalsetupCfg {
    id = 476,
    settype = kmaxchar,
    setpara = [30]
    };
getRow(kmaxchar_enu)->
    #globalsetupCfg {
    id = 480,
    settype = kmaxchar_enu,
    setpara = [200]
    };
getRow(kmaxchar_private)->
    #globalsetupCfg {
    id = 477,
    settype = kmaxchar_private,
    setpara = [70]
    };
getRow(kmaxchar_private_enu)->
    #globalsetupCfg {
    id = 481,
    settype = kmaxchar_private_enu,
    setpara = [200]
    };
getRow(kmaxhistorymsg)->
    #globalsetupCfg {
    id = 479,
    settype = kmaxhistorymsg,
    setpara = [5]
    };
getRow(kmaxinsertitems)->
    #globalsetupCfg {
    id = 475,
    settype = kmaxinsertitems,
    setpara = [3]
    };
getRow(kmaxmsg)->
    #globalsetupCfg {
    id = 478,
    settype = kmaxmsg,
    setpara = [30]
    };
getRow(knightcd)->
    #globalsetupCfg {
    id = 3,
    settype = knightcd,
    setpara = []
    };
getRow(knightcost)->
    #globalsetupCfg {
    id = 2,
    settype = knightcost,
    setpara = [33]
    };
getRow(knightrange)->
    #globalsetupCfg {
    id = 1,
    settype = knightrange,
    setpara = [7.5]
    };
getRow(koreangift_coin)->
    #globalsetupCfg {
    id = 879,
    settype = koreangift_coin,
    setpara = [12000]
    };
getRow(ladder1v1FistBattleAward)->
    #globalsetupCfg {
    id = 769,
    settype = ladder1v1FistBattleAward,
    setpara = [6,50]
    };
getRow(league_gift_1)->
    #globalsetupCfg {
    id = 332,
    settype = league_gift_1,
    setpara = [{20,2002,51032},{30,2002,51032},{40,2002,51034},{50,2002,51036},{60,2002,51038},{70,2002,51038},{80,2002,51038}]
    };
getRow(league_gift_2)->
    #globalsetupCfg {
    id = 333,
    settype = league_gift_2,
    setpara = [{20,2002,51032},{30,2002,51032},{40,2002,51034},{50,2002,51036},{60,2002,51038},{70,2002,51038},{80,2002,51038}]
    };
getRow(league_gift_3)->
    #globalsetupCfg {
    id = 334,
    settype = league_gift_3,
    setpara = [{20,2002,51033},{30,2002,51033},{40,2002,51035},{50,2002,51037},{60,2002,51039},{70,2002,51039},{80,2002,51039}]
    };
getRow(league_kill)->
    #globalsetupCfg {
    id = 331,
    settype = league_kill,
    setpara = [3,5,7,10,12,15]
    };
getRow(league_lost1)->
    #globalsetupCfg {
    id = 327,
    settype = league_lost1,
    setpara = [{20,2090,1,50000},{30,2090,1,50000},{40,2091,1,200000},{50,2092,1,500000},{60,2093,1,800000},{70,2094,1,800000},{100,2094,1,800000}]
    };
getRow(league_lost2)->
    #globalsetupCfg {
    id = 329,
    settype = league_lost2,
    setpara = [{20,2090,1,200000},{30,2090,1,200000},{40,2091,1,500000},{50,2092,1,800000},{60,2093,1,1000000},{70,2094,1,1000000},{100,2094,1,1000000}]
    };
getRow(league_reborn)->
    #globalsetupCfg {
    id = 323,
    settype = league_reborn,
    setpara = [{58.4,165.1},{60.5,62.4},{47.8,116.5}]
    };
getRow(league_win1)->
    #globalsetupCfg {
    id = 328,
    settype = league_win1,
    setpara = [{20,2090,1,100000},{30,2090,1,100000},{40,2091,1,500000},{50,2092,1,800000},{60,2093,1,1000000},{70,2094,1,1000000},{100,2094,1,1000000}]
    };
getRow(league_win2)->
    #globalsetupCfg {
    id = 330,
    settype = league_win2,
    setpara = [{20,2090,1,300000},{30,2090,1,300000},{40,2091,1,700000},{50,2092,1,1000000},{60,2093,1,1500000},{70,2094,1,1500000},{100,2094,1,1500000}]
    };
getRow(liehen_reduce)->
    #globalsetupCfg {
    id = 627,
    settype = liehen_reduce,
    setpara = [1]
    };
getRow(llc_nq)->
    #globalsetupCfg {
    id = 21,
    settype = llc_nq,
    setpara = []
    };
getRow(llcs_nq)->
    #globalsetupCfg {
    id = 22,
    settype = llcs_nq,
    setpara = []
    };
getRow(loading_image_x)->
    #globalsetupCfg {
    id = 75,
    settype = loading_image_x,
    setpara = [4]
    };
getRow(lotteryForTowerShow)->
    #globalsetupCfg {
    id = 418,
    settype = lotteryForTowerShow,
    setpara = [50]
    };
getRow(luckydraw_odds)->
    #globalsetupCfg {
    id = 644,
    settype = luckydraw_odds,
    setpara = [6000]
    };
getRow(magecd)->
    #globalsetupCfg {
    id = 6,
    settype = magecd,
    setpara = []
    };
getRow(magecost)->
    #globalsetupCfg {
    id = 5,
    settype = magecost,
    setpara = [25]
    };
getRow(magerange)->
    #globalsetupCfg {
    id = 4,
    settype = magerange,
    setpara = [7.5]
    };
getRow(mail_content_max_length_chs)->
    #globalsetupCfg {
    id = 486,
    settype = mail_content_max_length_chs,
    setpara = [300]
    };
getRow(mail_content_max_length_enu)->
    #globalsetupCfg {
    id = 485,
    settype = mail_content_max_length_enu,
    setpara = [500]
    };
getRow(main_city)->
    #globalsetupCfg {
    id = 74,
    settype = main_city,
    setpara = [20]
    };
getRow(main_map_id)->
    #globalsetupCfg {
    id = 691,
    settype = main_map_id,
    setpara = [20]
    };
getRow(map_convey)->
    #globalsetupCfg {
    id = 79,
    settype = map_convey,
    setpara = [300]
    };
getRow(marriage_BreakCost)->
    #globalsetupCfg {
    id = 738,
    settype = marriage_BreakCost,
    setpara = [500000]
    };
getRow(marriage_ClosenessLimitEveryday)->
    #globalsetupCfg {
    id = 744,
    settype = marriage_ClosenessLimitEveryday,
    setpara = [9999999,100,9999999]
    };
getRow(marriage_ferescale)->
    #globalsetupCfg {
    id = 745,
    settype = marriage_ferescale,
    setpara = [0.3]
    };
getRow(marriage_FriendlinessDownWithoutTeam)->
    #globalsetupCfg {
    id = 742,
    settype = marriage_FriendlinessDownWithoutTeam,
    setpara = [1]
    };
getRow(marriage_FriendlinessDownWithTeam)->
    #globalsetupCfg {
    id = 741,
    settype = marriage_FriendlinessDownWithTeam,
    setpara = [100]
    };
getRow(marriage_FriendlinessLimit)->
    #globalsetupCfg {
    id = 740,
    settype = marriage_FriendlinessLimit,
    setpara = [200]
    };
getRow(marriage_iscouplesame)->
    #globalsetupCfg {
    id = 747,
    settype = marriage_iscouplesame,
    setpara = [1]
    };
getRow(marriage_KillMonsterGetCloseness)->
    #globalsetupCfg {
    id = 743,
    settype = marriage_KillMonsterGetCloseness,
    setpara = [1]
    };
getRow(marriage_RingItemList)->
    #globalsetupCfg {
    id = 739,
    settype = marriage_RingItemList,
    setpara = [26000,26001,26002]
    };
getRow(marriage_task_number)->
    #globalsetupCfg {
    id = 748,
    settype = marriage_task_number,
    setpara = [1]
    };
getRow(marriage_taskFidlist)->
    #globalsetupCfg {
    id = 746,
    settype = marriage_taskFidlist,
    setpara = [3002,3011]
    };
getRow(marriage_TimeOut)->
    #globalsetupCfg {
    id = 737,
    settype = marriage_TimeOut,
    setpara = [300]
    };
getRow(materialCopyMapID)->
    #globalsetupCfg {
    id = 704,
    settype = materialCopyMapID,
    setpara = [528,529,530,531]
    };
getRow(max1Chance)->
    #globalsetupCfg {
    id = 117,
    settype = max1Chance,
    setpara = []
    };
getRow(maxDamage)->
    #globalsetupCfg {
    id = 38,
    settype = maxDamage,
    setpara = [1]
    };
getRow(maxenchance)->
    #globalsetupCfg {
    id = 163,
    settype = maxenchance,
    setpara = [25]
    };
getRow(maxgridcellnum)->
    #globalsetupCfg {
    id = 869,
    settype = maxgridcellnum,
    setpara = [{35,35}]
    };
getRow(maxreborn)->
    #globalsetupCfg {
    id = 162,
    settype = maxreborn,
    setpara = [5]
    };
getRow(mechaniccd)->
    #globalsetupCfg {
    id = 15,
    settype = mechaniccd,
    setpara = []
    };
getRow(mechaniccost)->
    #globalsetupCfg {
    id = 14,
    settype = mechaniccost,
    setpara = [33]
    };
getRow(mechanicrange)->
    #globalsetupCfg {
    id = 13,
    settype = mechanicrange,
    setpara = [7.5]
    };
getRow(minDamage)->
    #globalsetupCfg {
    id = 37,
    settype = minDamage,
    setpara = [1]
    };
getRow(mirroring)->
    #globalsetupCfg {
    id = 682,
    settype = mirroring,
    setpara = [{{101,1,1},{3350,170,78}},{{101,0,1},{3351,170,78}},{{201,1,1},{3352,170,78}},{{201,0,1},{3353,170,78}},{{301,1,1},{3354,170,78}},{{301,0,1},{3355,170,78}},{{101,1,2},{3356,170,78}},{{101,0,2},{3357,170,78}},{{201,1,2},{3358,170,78}},{{201,0,2},{3359,170,78}},{{301,1,2},{3360,170,78}},{{301,0,2},{3361,170,78}}]
    };
getRow(mirroring_minHp)->
    #globalsetupCfg {
    id = 695,
    settype = mirroring_minHp,
    setpara = [0.01]
    };
getRow(mirroring_restore)->
    #globalsetupCfg {
    id = 687,
    settype = mirroring_restore,
    setpara = []
    };
getRow(mirroring_weak)->
    #globalsetupCfg {
    id = 688,
    settype = mirroring_weak,
    setpara = []
    };
getRow(mn_nq)->
    #globalsetupCfg {
    id = 19,
    settype = mn_nq,
    setpara = []
    };
getRow(moneyDungeon_StartPoint)->
    #globalsetupCfg {
    id = 709,
    settype = moneyDungeon_StartPoint,
    setpara = [{131,160}]
    };
getRow(moneyDungeon_StartPointPlayer)->
    #globalsetupCfg {
    id = 710,
    settype = moneyDungeon_StartPointPlayer,
    setpara = [{135,145}]
    };
getRow(moneyDungeon_time_kill)->
    #globalsetupCfg {
    id = 714,
    settype = moneyDungeon_time_kill,
    setpara = [5]
    };
getRow(moneyDungeon_time_monster)->
    #globalsetupCfg {
    id = 713,
    settype = moneyDungeon_time_monster,
    setpara = [60]
    };
getRow(moneyDungeon_time_ready)->
    #globalsetupCfg {
    id = 716,
    settype = moneyDungeon_time_ready,
    setpara = [4]
    };
getRow(moneyDungeon_time_settle)->
    #globalsetupCfg {
    id = 711,
    settype = moneyDungeon_time_settle,
    setpara = [8]
    };
getRow(moneyDungeon_time_spawn)->
    #globalsetupCfg {
    id = 715,
    settype = moneyDungeon_time_spawn,
    setpara = [2000]
    };
getRow(moneyDungeon_time_turn)->
    #globalsetupCfg {
    id = 712,
    settype = moneyDungeon_time_turn,
    setpara = [1]
    };
getRow(monsterbox_cooldown)->
    #globalsetupCfg {
    id = 717,
    settype = monsterbox_cooldown,
    setpara = [5]
    };
getRow(mount_level_per_rank)->
    #globalsetupCfg {
    id = 233,
    settype = mount_level_per_rank,
    setpara = [5]
    };
getRow(mount_up_distance)->
    #globalsetupCfg {
    id = 229,
    settype = mount_up_distance,
    setpara = [10]
    };
getRow(mountfood)->
    #globalsetupCfg {
    id = 230,
    settype = mountfood,
    setpara = [200]
    };
getRow(mountsta)->
    #globalsetupCfg {
    id = 231,
    settype = mountsta,
    setpara = [5]
    };
getRow(mountup_min_level)->
    #globalsetupCfg {
    id = 232,
    settype = mountup_min_level,
    setpara = [5]
    };
getRow(need_equiplv)->
    #globalsetupCfg {
    id = 77,
    settype = need_equiplv,
    setpara = [5]
    };
getRow(needForSpeedAthleteMaxNumber)->
    #globalsetupCfg {
    id = 670,
    settype = needForSpeedAthleteMaxNumber,
    setpara = [2]
    };
getRow(needForSpeedcameracontrol)->
    #globalsetupCfg {
    id = 673,
    settype = needForSpeedcameracontrol,
    setpara = [0.024]
    };
getRow(needForSpeedcheckboxradius)->
    #globalsetupCfg {
    id = 678,
    settype = needForSpeedcheckboxradius,
    setpara = [2]
    };
getRow(needForSpeedcheckwaypointradius)->
    #globalsetupCfg {
    id = 679,
    settype = needForSpeedcheckwaypointradius,
    setpara = [20]
    };
getRow(needForSpeedCompetitionBegin2EndTime)->
    #globalsetupCfg {
    id = 675,
    settype = needForSpeedCompetitionBegin2EndTime,
    setpara = [300]
    };
getRow(needForSpeedCompetitionCountDownSec)->
    #globalsetupCfg {
    id = 668,
    settype = needForSpeedCompetitionCountDownSec,
    setpara = [3000]
    };
getRow(needForSpeedCompetitionReadyBeginCountDownSec)->
    #globalsetupCfg {
    id = 667,
    settype = needForSpeedCompetitionReadyBeginCountDownSec,
    setpara = [25]
    };
getRow(needForSpeedCompetitionReadyEndCountDownSec)->
    #globalsetupCfg {
    id = 676,
    settype = needForSpeedCompetitionReadyEndCountDownSec,
    setpara = [25]
    };
getRow(needForSpeedCompetitionrewardmax)->
    #globalsetupCfg {
    id = 677,
    settype = needForSpeedCompetitionrewardmax,
    setpara = [3]
    };
getRow(needForSpeedMapInfo)->
    #globalsetupCfg {
    id = 672,
    settype = needForSpeedMapInfo,
    setpara = [[9001,[153.4,183.1],[153.1,185.1],[152.7,187.1],[154.7,187.1],[155.1,185.1],[155.2,183.3],[157.2,182.9],[156.9,185.1],[156.9,186.8],[156.2,188.7]]]
    };
getRow(needForSpeedMatchCountDownSec)->
    #globalsetupCfg {
    id = 669,
    settype = needForSpeedMatchCountDownSec,
    setpara = [30]
    };
getRow(needForSpeedmatchopen)->
    #globalsetupCfg {
    id = 680,
    settype = needForSpeedmatchopen,
    setpara = [40]
    };
getRow(needForSpeedMaxCircle)->
    #globalsetupCfg {
    id = 671,
    settype = needForSpeedMaxCircle,
    setpara = [3]
    };
getRow(needForSpeedWinCountDownSec)->
    #globalsetupCfg {
    id = 681,
    settype = needForSpeedWinCountDownSec,
    setpara = [30]
    };
getRow(newplayeritem)->
    #globalsetupCfg {
    id = 875,
    settype = newplayeritem,
    setpara = [2900]
    };
getRow(newplayerworldLevel)->
    #globalsetupCfg {
    id = 874,
    settype = newplayerworldLevel,
    setpara = [50]
    };
getRow(newyeargameID)->
    #globalsetupCfg {
    id = 624,
    settype = newyeargameID,
    setpara = [60040,60043,60045,60048,60051]
    };
getRow(newyeargametime)->
    #globalsetupCfg {
    id = 625,
    settype = newyeargametime,
    setpara = [{{2016,2,1},{4,0,0}},{{2016,2,15},{4,0,0}}]
    };
getRow(newyearminlevel)->
    #globalsetupCfg {
    id = 623,
    settype = newyearminlevel,
    setpara = [20]
    };
getRow(normal_sellnum)->
    #globalsetupCfg {
    id = 493,
    settype = normal_sellnum,
    setpara = [6]
    };
getRow(normalcameracontrol)->
    #globalsetupCfg {
    id = 674,
    settype = normalcameracontrol,
    setpara = [0.01]
    };
getRow(nPC_Shop_ID)->
    #globalsetupCfg {
    id = 910,
    settype = nPC_Shop_ID,
    setpara = [3]
    };
getRow(npc_soundplay_time)->
    #globalsetupCfg {
    id = 83,
    settype = npc_soundplay_time,
    setpara = [20]
    };
getRow(npc_soundrange_load)->
    #globalsetupCfg {
    id = 81,
    settype = npc_soundrange_load,
    setpara = [18]
    };
getRow(npc_soundrange_play)->
    #globalsetupCfg {
    id = 82,
    settype = npc_soundrange_play,
    setpara = [3]
    };
getRow(offline_exptime)->
    #globalsetupCfg {
    id = 504,
    settype = offline_exptime,
    setpara = [10]
    };
getRow(offlineexp_openlevel)->
    #globalsetupCfg {
    id = 503,
    settype = offlineexp_openlevel,
    setpara = [26]
    };
getRow(openTabLevel)->
    #globalsetupCfg {
    id = 50,
    settype = openTabLevel,
    setpara = [4]
    };
getRow(orangeFactor)->
    #globalsetupCfg {
    id = 115,
    settype = orangeFactor,
    setpara = []
    };
getRow(oraRed1Affix)->
    #globalsetupCfg {
    id = 121,
    settype = oraRed1Affix,
    setpara = [{1,0,50},{0,1,50}]
    };
getRow(oraRed2Affix)->
    #globalsetupCfg {
    id = 122,
    settype = oraRed2Affix,
    setpara = [{1,1,100}]
    };
getRow(oraRed3Affix)->
    #globalsetupCfg {
    id = 123,
    settype = oraRed3Affix,
    setpara = [{2,1,100}]
    };
getRow(oraRed4Affix)->
    #globalsetupCfg {
    id = 124,
    settype = oraRed4Affix,
    setpara = [{2,2,90},{3,1,10}]
    };
getRow(oraRed5Affix)->
    #globalsetupCfg {
    id = 125,
    settype = oraRed5Affix,
    setpara = [{3,2,90},{4,1,10}]
    };
getRow(oraRed6Affix)->
    #globalsetupCfg {
    id = 126,
    settype = oraRed6Affix,
    setpara = [{3,3,90},{4,2,10}]
    };
getRow(order_sellnum)->
    #globalsetupCfg {
    id = 495,
    settype = order_sellnum,
    setpara = [3]
    };
getRow(partner_timeol)->
    #globalsetupCfg {
    id = 643,
    settype = partner_timeol,
    setpara = [10]
    };
getRow(passiveSkill)->
    #globalsetupCfg {
    id = 47,
    settype = passiveSkill,
    setpara = [{51,15},{52,35},{53,55},{54,1000},{55,1000}]
    };
getRow(percentage_agent)->
    #globalsetupCfg {
    id = 84,
    settype = percentage_agent,
    setpara = [101]
    };
getRow(percentage_agent_openlevel)->
    #globalsetupCfg {
    id = 85,
    settype = percentage_agent_openlevel,
    setpara = [30]
    };
getRow(pet_atkshow)->
    #globalsetupCfg {
    id = 227,
    settype = pet_atkshow,
    setpara = [10]
    };
getRow(pet_equipment)->
    #globalsetupCfg {
    id = 212,
    settype = pet_equipment,
    setpara = [1,6,11,16]
    };
getRow(pet_name)->
    #globalsetupCfg {
    id = 217,
    settype = pet_name,
    setpara = [2164,1]
    };
getRow(pet_recycle_cost)->
    #globalsetupCfg {
    id = 953,
    settype = pet_recycle_cost,
    setpara = [1000]
    };
getRow(pet_recycle_open)->
    #globalsetupCfg {
    id = 954,
    settype = pet_recycle_open,
    setpara = [40]
    };
getRow(pet_skill)->
    #globalsetupCfg {
    id = 194,
    settype = pet_skill,
    setpara = [201,1]
    };
getRow(pet_stronger)->
    #globalsetupCfg {
    id = 169,
    settype = pet_stronger,
    setpara = [{201,6}]
    };
getRow(pet_warspeed)->
    #globalsetupCfg {
    id = 228,
    settype = pet_warspeed,
    setpara = [2]
    };
getRow(petAssist)->
    #globalsetupCfg {
    id = 213,
    settype = petAssist,
    setpara = [0.45]
    };
getRow(petbattledef)->
    #globalsetupCfg {
    id = 192,
    settype = petbattledef,
    setpara = [1280]
    };
getRow(petbattleequip)->
    #globalsetupCfg {
    id = 191,
    settype = petbattleequip,
    setpara = [0.2]
    };
getRow(petbreak_reborn)->
    #globalsetupCfg {
    id = 168,
    settype = petbreak_reborn,
    setpara = [11]
    };
getRow(petbreak_star)->
    #globalsetupCfg {
    id = 167,
    settype = petbreak_star,
    setpara = [11]
    };
getRow(petEnh0)->
    #globalsetupCfg {
    id = 200,
    settype = petEnh0,
    setpara = [1]
    };
getRow(petEnh1)->
    #globalsetupCfg {
    id = 201,
    settype = petEnh1,
    setpara = [1.11]
    };
getRow(petEnh10)->
    #globalsetupCfg {
    id = 210,
    settype = petEnh10,
    setpara = [2.79]
    };
getRow(petEnh2)->
    #globalsetupCfg {
    id = 202,
    settype = petEnh2,
    setpara = [1.23]
    };
getRow(petEnh3)->
    #globalsetupCfg {
    id = 203,
    settype = petEnh3,
    setpara = [1.36]
    };
getRow(petEnh4)->
    #globalsetupCfg {
    id = 204,
    settype = petEnh4,
    setpara = [1.51]
    };
getRow(petEnh5)->
    #globalsetupCfg {
    id = 205,
    settype = petEnh5,
    setpara = [1.67]
    };
getRow(petEnh6)->
    #globalsetupCfg {
    id = 206,
    settype = petEnh6,
    setpara = [1.85]
    };
getRow(petEnh7)->
    #globalsetupCfg {
    id = 207,
    settype = petEnh7,
    setpara = [2.05]
    };
getRow(petEnh8)->
    #globalsetupCfg {
    id = 208,
    settype = petEnh8,
    setpara = [2.27]
    };
getRow(petEnh9)->
    #globalsetupCfg {
    id = 209,
    settype = petEnh9,
    setpara = [2.52]
    };
getRow(petEquipFactorA)->
    #globalsetupCfg {
    id = 215,
    settype = petEquipFactorA,
    setpara = []
    };
getRow(petEquipFactorB)->
    #globalsetupCfg {
    id = 216,
    settype = petEquipFactorB,
    setpara = []
    };
getRow(petleader_for_lord)->
    #globalsetupCfg {
    id = 164,
    settype = petleader_for_lord,
    setpara = [0.2]
    };
getRow(petMaxAssist)->
    #globalsetupCfg {
    id = 214,
    settype = petMaxAssist,
    setpara = [{12,2},{25,3},{30,4},{40,5}]
    };
getRow(petmoon)->
    #globalsetupCfg {
    id = 161,
    settype = petmoon,
    setpara = [10]
    };
getRow(petpvp_cd)->
    #globalsetupCfg {
    id = 172,
    settype = petpvp_cd,
    setpara = [3600]
    };
getRow(petpvp_duringTime)->
    #globalsetupCfg {
    id = 178,
    settype = petpvp_duringTime,
    setpara = [36000,79230]
    };
getRow(petpvp_money)->
    #globalsetupCfg {
    id = 174,
    settype = petpvp_money,
    setpara = [{6,5},{6,10},{6,30},{6,50},{6,100}]
    };
getRow(petpvp_pro)->
    #globalsetupCfg {
    id = 170,
    settype = petpvp_pro,
    setpara = [300]
    };
getRow(petpvp_rank)->
    #globalsetupCfg {
    id = 173,
    settype = petpvp_rank,
    setpara = [10]
    };
getRow(petpvp_refresh)->
    #globalsetupCfg {
    id = 177,
    settype = petpvp_refresh,
    setpara = [5]
    };
getRow(petpvp_time)->
    #globalsetupCfg {
    id = 176,
    settype = petpvp_time,
    setpara = [15]
    };
getRow(petpvp_token)->
    #globalsetupCfg {
    id = 171,
    settype = petpvp_token,
    setpara = [5]
    };
getRow(petpvp_win)->
    #globalsetupCfg {
    id = 175,
    settype = petpvp_win,
    setpara = [{10,5000,500},{20,10000,1000},{35,15000,2000},{40,20000,3000},{45,25000,4000},{50,30000,5000}]
    };
getRow(petQuality0)->
    #globalsetupCfg {
    id = 195,
    settype = petQuality0,
    setpara = [1]
    };
getRow(petQuality1)->
    #globalsetupCfg {
    id = 196,
    settype = petQuality1,
    setpara = [1]
    };
getRow(petQuality2)->
    #globalsetupCfg {
    id = 197,
    settype = petQuality2,
    setpara = [1]
    };
getRow(petQuality3)->
    #globalsetupCfg {
    id = 198,
    settype = petQuality3,
    setpara = [1]
    };
getRow(petQuality4)->
    #globalsetupCfg {
    id = 199,
    settype = petQuality4,
    setpara = [1]
    };
getRow(petReBorn0)->
    #globalsetupCfg {
    id = 180,
    settype = petReBorn0,
    setpara = [1]
    };
getRow(petReBorn1)->
    #globalsetupCfg {
    id = 181,
    settype = petReBorn1,
    setpara = [1.2]
    };
getRow(petReBorn10)->
    #globalsetupCfg {
    id = 190,
    settype = petReBorn10,
    setpara = [3]
    };
getRow(petReBorn2)->
    #globalsetupCfg {
    id = 182,
    settype = petReBorn2,
    setpara = [1.4]
    };
getRow(petReBorn3)->
    #globalsetupCfg {
    id = 183,
    settype = petReBorn3,
    setpara = [1.6]
    };
getRow(petReBorn4)->
    #globalsetupCfg {
    id = 184,
    settype = petReBorn4,
    setpara = [1.8]
    };
getRow(petReBorn5)->
    #globalsetupCfg {
    id = 185,
    settype = petReBorn5,
    setpara = [2]
    };
getRow(petReBorn6)->
    #globalsetupCfg {
    id = 186,
    settype = petReBorn6,
    setpara = [2.2]
    };
getRow(petReBorn7)->
    #globalsetupCfg {
    id = 187,
    settype = petReBorn7,
    setpara = [2.4]
    };
getRow(petReBorn8)->
    #globalsetupCfg {
    id = 188,
    settype = petReBorn8,
    setpara = [2.6]
    };
getRow(petReBorn9)->
    #globalsetupCfg {
    id = 189,
    settype = petReBorn9,
    setpara = [2.8]
    };
getRow(petskillpw_blue)->
    #globalsetupCfg {
    id = 220,
    settype = petskillpw_blue,
    setpara = [1152]
    };
getRow(petskillpw_green)->
    #globalsetupCfg {
    id = 219,
    settype = petskillpw_green,
    setpara = [768]
    };
getRow(petskillpw_orange)->
    #globalsetupCfg {
    id = 222,
    settype = petskillpw_orange,
    setpara = [2592]
    };
getRow(petskillpw_purple)->
    #globalsetupCfg {
    id = 221,
    settype = petskillpw_purple,
    setpara = [1728]
    };
getRow(petskillpw_red)->
    #globalsetupCfg {
    id = 223,
    settype = petskillpw_red,
    setpara = [3888]
    };
getRow(petskillpw_white)->
    #globalsetupCfg {
    id = 218,
    settype = petskillpw_white,
    setpara = [512]
    };
getRow(petskillroll)->
    #globalsetupCfg {
    id = 211,
    settype = petskillroll,
    setpara = [300]
    };
getRow(petstronger_num)->
    #globalsetupCfg {
    id = 179,
    settype = petstronger_num,
    setpara = [{1,0.07},{2,0.2},{3,0.5},{4,0.2},{5,0.03}]
    };
getRow(petsun)->
    #globalsetupCfg {
    id = 160,
    settype = petsun,
    setpara = [55]
    };
getRow(petTerritory_battleCD)->
    #globalsetupCfg {
    id = 900,
    settype = petTerritory_battleCD,
    setpara = [360]
    };
getRow(petTerritory_cleanCD_data)->
    #globalsetupCfg {
    id = 905,
    settype = petTerritory_cleanCD_data,
    setpara = [259200]
    };
getRow(petTerritory_cleanCD_history)->
    #globalsetupCfg {
    id = 906,
    settype = petTerritory_cleanCD_history,
    setpara = [604800]
    };
getRow(petTerritory_count)->
    #globalsetupCfg {
    id = 894,
    settype = petTerritory_count,
    setpara = [2]
    };
getRow(petTerritory_plunderCD)->
    #globalsetupCfg {
    id = 895,
    settype = petTerritory_plunderCD,
    setpara = [25200]
    };
getRow(petTerritory_plunderRate)->
    #globalsetupCfg {
    id = 893,
    settype = petTerritory_plunderRate,
    setpara = [0.2]
    };
getRow(petTerritory_posPetsD)->
    #globalsetupCfg {
    id = 904,
    settype = petTerritory_posPetsD,
    setpara = [{34,43},{34,54},{33,51},{33,46},{32,49}]
    };
getRow(petTerritory_posPetsP)->
    #globalsetupCfg {
    id = 903,
    settype = petTerritory_posPetsP,
    setpara = [{43,49},{42,46},{42,52},{41,55},{41,43}]
    };
getRow(petTerritory_sameCD)->
    #globalsetupCfg {
    id = 901,
    settype = petTerritory_sameCD,
    setpara = [120]
    };
getRow(petTerritory_searchCD)->
    #globalsetupCfg {
    id = 899,
    settype = petTerritory_searchCD,
    setpara = [90]
    };
getRow(petTerritory_timeReady)->
    #globalsetupCfg {
    id = 907,
    settype = petTerritory_timeReady,
    setpara = [5]
    };
getRow(petTerritory_timeSettle)->
    #globalsetupCfg {
    id = 902,
    settype = petTerritory_timeSettle,
    setpara = [10]
    };
getRow(petTerritory_vigorCost)->
    #globalsetupCfg {
    id = 898,
    settype = petTerritory_vigorCost,
    setpara = [6]
    };
getRow(petTerritory_vigorMax)->
    #globalsetupCfg {
    id = 896,
    settype = petTerritory_vigorMax,
    setpara = [24]
    };
getRow(petTerritory_vigorRecover)->
    #globalsetupCfg {
    id = 897,
    settype = petTerritory_vigorRecover,
    setpara = [1,3600]
    };
getRow(petwar_add)->
    #globalsetupCfg {
    id = 225,
    settype = petwar_add,
    setpara = [{0,5},{1,10},{2,10},{3,15},{4,15},{5,20},{6,20},{7,25},{8,25},{9,30},{10,30},{11,35},{12,35},{13,40},{14,40},{15,45}]
    };
getRow(petwar_addgold)->
    #globalsetupCfg {
    id = 226,
    settype = petwar_addgold,
    setpara = [50,50,186.0,224.0,186.0,224.0,186.0,224.0,186.0,224.0,150,150,150,150,150,200,200,200,200,200,250,250,250,250,250,300,300,300,300,300,350,350,350,350,350,400,400,400,400,400,450,450,450,450,450,500,500,500,500,500]
    };
getRow(petwar_replystrength)->
    #globalsetupCfg {
    id = 224,
    settype = petwar_replystrength,
    setpara = [300000]
    };
getRow(petwar_stargift)->
    #globalsetupCfg {
    id = 193,
    settype = petwar_stargift,
    setpara = [{30,50},{60,50},{90,50},{120,50},{150,100},{180,200},{210,300},{240,400},{270,500},{300,600},{330,700},{360,800}]
    };
getRow(pk_forbidden_end)->
    #globalsetupCfg {
    id = 66,
    settype = pk_forbidden_end,
    setpara = [60*60*8]
    };
getRow(pk_forbidden_start)->
    #globalsetupCfg {
    id = 65,
    settype = pk_forbidden_start,
    setpara = [60*60*23]
    };
getRow(pk_time)->
    #globalsetupCfg {
    id = 64,
    settype = pk_time,
    setpara = [900]
    };
getRow(plant_clearpestis)->
    #globalsetupCfg {
    id = 984,
    settype = plant_clearpestis,
    setpara = [10]
    };
getRow(plant_composttimes)->
    #globalsetupCfg {
    id = 985,
    settype = plant_composttimes,
    setpara = [1,0]
    };
getRow(plant_heathStatus)->
    #globalsetupCfg {
    id = 986,
    settype = plant_heathStatus,
    setpara = [10,40,70]
    };
getRow(plant_helpbonus)->
    #globalsetupCfg {
    id = 987,
    settype = plant_helpbonus,
    setpara = [20]
    };
getRow(plant_helptimes)->
    #globalsetupCfg {
    id = 988,
    settype = plant_helptimes,
    setpara = [10]
    };
getRow(plant_watering)->
    #globalsetupCfg {
    id = 983,
    settype = plant_watering,
    setpara = [5,2,0]
    };
getRow(player_action_point_max)->
    #globalsetupCfg {
    id = 762,
    settype = player_action_point_max,
    setpara = [500]
    };
getRow(player_action_point_reset_max)->
    #globalsetupCfg {
    id = 760,
    settype = player_action_point_reset_max,
    setpara = [120]
    };
getRow(player_atksound)->
    #globalsetupCfg {
    id = 44,
    settype = player_atksound,
    setpara = [0.2]
    };
getRow(player_hitsound)->
    #globalsetupCfg {
    id = 45,
    settype = player_hitsound,
    setpara = [0.4]
    };
getRow(player_maxlevel)->
    #globalsetupCfg {
    id = 72,
    settype = player_maxlevel,
    setpara = [50]
    };
getRow(playertof)->
    #globalsetupCfg {
    id = 42,
    settype = playertof,
    setpara = [25]
    };
getRow(pre_recharge)->
    #globalsetupCfg {
    id = 883,
    settype = pre_recharge,
    setpara = [4301]
    };
getRow(propToDam)->
    #globalsetupCfg {
    id = 39,
    settype = propToDam,
    setpara = [0.002]
    };
getRow(purpleAffix)->
    #globalsetupCfg {
    id = 120,
    settype = purpleAffix,
    setpara = [{2,2,45},{3,1,45},{3,2,3},{2,3,3},{4,1,2},{1,4,2}]
    };
getRow(purpleFactor)->
    #globalsetupCfg {
    id = 114,
    settype = purpleFactor,
    setpara = []
    };
getRow(push_buylevel)->
    #globalsetupCfg {
    id = 878,
    settype = push_buylevel,
    setpara = [20]
    };
getRow(qa_prepare_time)->
    #globalsetupCfg {
    id = 618,
    settype = qa_prepare_time,
    setpara = [300]
    };
getRow(qa_time)->
    #globalsetupCfg {
    id = 619,
    settype = qa_time,
    setpara = [300]
    };
getRow(qixi_show_end_time)->
    #globalsetupCfg {
    id = 621,
    settype = qixi_show_end_time,
    setpara = [{2016,8,10},{23,59,0}]
    };
getRow(qixi_show_start_time)->
    #globalsetupCfg {
    id = 620,
    settype = qixi_show_start_time,
    setpara = [{2016,8,8},{00,01,0}]
    };
getRow(qixi_showVFX_position)->
    #globalsetupCfg {
    id = 622,
    settype = qixi_showVFX_position,
    setpara = [{91,50,37},{92,50,101},{92,50,85},{35,50,92},{156,50,89}]
    };
getRow(qs_nq)->
    #globalsetupCfg {
    id = 16,
    settype = qs_nq,
    setpara = []
    };
getRow(question_gift_n1)->
    #globalsetupCfg {
    id = 616,
    settype = question_gift_n1,
    setpara = [2304]
    };
getRow(question_num)->
    #globalsetupCfg {
    id = 615,
    settype = question_num,
    setpara = [{1,5}]
    };
getRow(question_quantity)->
    #globalsetupCfg {
    id = 617,
    settype = question_quantity,
    setpara = [10]
    };
getRow(question_time)->
    #globalsetupCfg {
    id = 614,
    settype = question_time,
    setpara = [{10,20}]
    };
getRow(race_apply_map)->
    #globalsetupCfg {
    id = 989,
    settype = race_apply_map,
    setpara = [6]
    };
getRow(race_invincible)->
    #globalsetupCfg {
    id = 996,
    settype = race_invincible,
    setpara = [60000]
    };
getRow(race_laps)->
    #globalsetupCfg {
    id = 995,
    settype = race_laps,
    setpara = [2,3]
    };
getRow(race_mod)->
    #globalsetupCfg {
    id = 994,
    settype = race_mod,
    setpara = [3]
    };
getRow(race_pos)->
    #globalsetupCfg {
    id = 993,
    settype = race_pos,
    setpara = [{325,362},{325,362},{325,362},{325,362},{325,362},{325,362},{325,362},{325,362},{325,362},{325,362},{325,362},{325,362},{325,362},{325,362}]
    };
getRow(race_rewardA)->
    #globalsetupCfg {
    id = 990,
    settype = race_rewardA,
    setpara = [{601,1},{601,2},{601,3},{601,4},{601,5},{601,6},{601,7},{601,8},{601,9},{601,10},{601,10},{601,10},{601,10},{601,10}]
    };
getRow(race_rewardB)->
    #globalsetupCfg {
    id = 991,
    settype = race_rewardB,
    setpara = [{602,1}]
    };
getRow(race_time_wait)->
    #globalsetupCfg {
    id = 992,
    settype = race_time_wait,
    setpara = [20,60,15]
    };
getRow(randomshop_Diamonds)->
    #globalsetupCfg {
    id = 107,
    settype = randomshop_Diamonds,
    setpara = [50,50,50,50]
    };
getRow(randomshop_limit)->
    #globalsetupCfg {
    id = 108,
    settype = randomshop_limit,
    setpara = [3]
    };
getRow(ranklevel_limit)->
    #globalsetupCfg {
    id = 102,
    settype = ranklevel_limit,
    setpara = [22,100]
    };
getRow(real_drop)->
    #globalsetupCfg {
    id = 517,
    settype = real_drop,
    setpara = [{0.3,1},{0.1,0.5},{0,0.3}]
    };
getRow(redEnvelope_FriendRemainTime)->
    #globalsetupCfg {
    id = 251,
    settype = redEnvelope_FriendRemainTime,
    setpara = [24]
    };
getRow(redEnvelope_LevelLimit)->
    #globalsetupCfg {
    id = 253,
    settype = redEnvelope_LevelLimit,
    setpara = [9]
    };
getRow(redEnvelope_PacketAmountMax)->
    #globalsetupCfg {
    id = 257,
    settype = redEnvelope_PacketAmountMax,
    setpara = [100]
    };
getRow(redEnvelope_PacketAmountMin)->
    #globalsetupCfg {
    id = 256,
    settype = redEnvelope_PacketAmountMin,
    setpara = [1]
    };
getRow(redEnvelope_PacketMax)->
    #globalsetupCfg {
    id = 255,
    settype = redEnvelope_PacketMax,
    setpara = [2000]
    };
getRow(redEnvelope_PacketMin)->
    #globalsetupCfg {
    id = 254,
    settype = redEnvelope_PacketMin,
    setpara = [100]
    };
getRow(redEnvelope_WorldAnnouncementAmount)->
    #globalsetupCfg {
    id = 252,
    settype = redEnvelope_WorldAnnouncementAmount,
    setpara = [1000]
    };
getRow(redEnvelope_WorldReceiveAmount)->
    #globalsetupCfg {
    id = 249,
    settype = redEnvelope_WorldReceiveAmount,
    setpara = [5]
    };
getRow(redEnvelope_WorldRemainTime)->
    #globalsetupCfg {
    id = 250,
    settype = redEnvelope_WorldRemainTime,
    setpara = [60]
    };
getRow(redFactor)->
    #globalsetupCfg {
    id = 113,
    settype = redFactor,
    setpara = []
    };
getRow(refush)->
    #globalsetupCfg {
    id = 53,
    settype = refush,
    setpara = [1]
    };
getRow(relive_cost)->
    #globalsetupCfg {
    id = 69,
    settype = relive_cost,
    setpara = [5,10,10,15,15,20,20,20,30]
    };
getRow(relive_cost_hp)->
    #globalsetupCfg {
    id = 67,
    settype = relive_cost_hp,
    setpara = [100]
    };
getRow(relive_hp)->
    #globalsetupCfg {
    id = 70,
    settype = relive_hp,
    setpara = [100]
    };
getRow(relive_time)->
    #globalsetupCfg {
    id = 68,
    settype = relive_time,
    setpara = [5,8,12,17,23]
    };
getRow(repelSpeed)->
    #globalsetupCfg {
    id = 29,
    settype = repelSpeed,
    setpara = [50]
    };
getRow(report)->
    #globalsetupCfg {
    id = 753,
    settype = report,
    setpara = [20]
    };
getRow(resetPosToRevivePtCDTime)->
    #globalsetupCfg {
    id = 80,
    settype = resetPosToRevivePtCDTime,
    setpara = [30]
    };
getRow(resurrection)->
    #globalsetupCfg {
    id = 324,
    settype = resurrection,
    setpara = [1]
    };
getRow(resurrection_tozero)->
    #globalsetupCfg {
    id = 325,
    settype = resurrection_tozero,
    setpara = [300]
    };
getRow(rift_cd)->
    #globalsetupCfg {
    id = 628,
    settype = rift_cd,
    setpara = [30]
    };
getRow(ring_item)->
    #globalsetupCfg {
    id = 731,
    settype = ring_item,
    setpara = [1191]
    };
getRow(robbery_item)->
    #globalsetupCfg {
    id = 652,
    settype = robbery_item,
    setpara = [{2215,1}]
    };
getRow(robbery_player_buf)->
    #globalsetupCfg {
    id = 660,
    settype = robbery_player_buf,
    setpara = [{6,7}]
    };
getRow(robbery_player_level)->
    #globalsetupCfg {
    id = 663,
    settype = robbery_player_level,
    setpara = [40]
    };
getRow(robbery_player_num)->
    #globalsetupCfg {
    id = 651,
    settype = robbery_player_num,
    setpara = [12]
    };
getRow(robbery_revive_item)->
    #globalsetupCfg {
    id = 653,
    settype = robbery_revive_item,
    setpara = [{2215,2}]
    };
getRow(robbery_revive_site)->
    #globalsetupCfg {
    id = 654,
    settype = robbery_revive_site,
    setpara = [{81.0,18.4},{83.8,54.9},{51.9,84.0}]
    };
getRow(rollspeed)->
    #globalsetupCfg {
    id = 30,
    settype = rollspeed,
    setpara = [35]
    };
getRow(rune_boardcast)->
    #globalsetupCfg {
    id = 441,
    settype = rune_boardcast,
    setpara = [4]
    };
getRow(rune_maxsmelt)->
    #globalsetupCfg {
    id = 444,
    settype = rune_maxsmelt,
    setpara = [40]
    };
getRow(rune_openlv_mount)->
    #globalsetupCfg {
    id = 437,
    settype = rune_openlv_mount,
    setpara = [{0,60},{1,60},{2,60},{3,60},{4,60}]
    };
getRow(rune_openlv_player)->
    #globalsetupCfg {
    id = 436,
    settype = rune_openlv_player,
    setpara = [{0,0,60},{1,0,60},{2,0,60},{3,0,60},{4,0,60},{5,0,60}]
    };
getRow(rune_regain)->
    #globalsetupCfg {
    id = 438,
    settype = rune_regain,
    setpara = [2]
    };
getRow(rune_weightfornum)->
    #globalsetupCfg {
    id = 442,
    settype = rune_weightfornum,
    setpara = [{0,10000},{1,8000},{2,6000},{3,4000},{4,2000},{5,1000},{6,500},{7,250},{8,125},{9,60},{10,30}]
    };
getRow(rune_weightforpro)->
    #globalsetupCfg {
    id = 443,
    settype = rune_weightforpro,
    setpara = [{10000,0,0.3},{8000,0.31,0.5},{6000,0.51,0.6},{4000,0.61,0.7},{2000,0.71,0.8},{1000,0.81,0.9},{500,0.91,0.95},{250,0.96,1}]
    };
getRow(runecolor)->
    #globalsetupCfg {
    id = 439,
    settype = runecolor,
    setpara = [3]
    };
getRow(runecolorchange)->
    #globalsetupCfg {
    id = 440,
    settype = runecolorchange,
    setpara = [0.7]
    };
getRow(search_radius)->
    #globalsetupCfg {
    id = 41,
    settype = search_radius,
    setpara = [110]
    };
getRow(selfChance)->
    #globalsetupCfg {
    id = 116,
    settype = selfChance,
    setpara = [0.8]
    };
getRow(sellcost12)->
    #globalsetupCfg {
    id = 488,
    settype = sellcost12,
    setpara = [0.01]
    };
getRow(sellcost24)->
    #globalsetupCfg {
    id = 489,
    settype = sellcost24,
    setpara = [0.02]
    };
getRow(sellcost48)->
    #globalsetupCfg {
    id = 490,
    settype = sellcost48,
    setpara = [0.04]
    };
getRow(selloff)->
    #globalsetupCfg {
    id = 148,
    settype = selloff,
    setpara = [0.05]
    };
getRow(selltax)->
    #globalsetupCfg {
    id = 491,
    settype = selltax,
    setpara = [0.03]
    };
getRow(sen_time1)->
    #globalsetupCfg {
    id = 91,
    settype = sen_time1,
    setpara = [1]
    };
getRow(sen_time2)->
    #globalsetupCfg {
    id = 93,
    settype = sen_time2,
    setpara = [1]
    };
getRow(server_list_area_sort_type)->
    #globalsetupCfg {
    id = 87,
    settype = server_list_area_sort_type,
    setpara = []
    };
getRow(server_list_sort_type)->
    #globalsetupCfg {
    id = 86,
    settype = server_list_sort_type,
    setpara = []
    };
getRow(shieldeledr)->
    #globalsetupCfg {
    id = 26,
    settype = shieldeledr,
    setpara = []
    };
getRow(shieldholydr)->
    #globalsetupCfg {
    id = 24,
    settype = shieldholydr,
    setpara = [0.4]
    };
getRow(shieldphydr)->
    #globalsetupCfg {
    id = 23,
    settype = shieldphydr,
    setpara = [0.5]
    };
getRow(shieldshadowdr)->
    #globalsetupCfg {
    id = 25,
    settype = shieldshadowdr,
    setpara = [0.2]
    };
getRow(shilianjiangli)->
    #globalsetupCfg {
    id = 783,
    settype = shilianjiangli
    };
getRow(shop_time)->
    #globalsetupCfg {
    id = 109,
    settype = shop_time,
    setpara = [4,12,20]
    };
getRow(signInCost)->
    #globalsetupCfg {
    id = 876,
    settype = signInCost,
    setpara = [20]
    };
getRow(sixwar_assistspoint)->
    #globalsetupCfg {
    id = 278,
    settype = sixwar_assistspoint,
    setpara = [5]
    };
getRow(sixwar_banner)->
    #globalsetupCfg {
    id = 281,
    settype = sixwar_banner,
    setpara = [827,828,829]
    };
getRow(sixwar_bannerABC)->
    #globalsetupCfg {
    id = 283,
    settype = sixwar_bannerABC,
    setpara = [{[6030,6033],[{98,39,180},{161,78.8,180},{35,78,180}]},{[6031,6034],[{70,74,180},{24,72,180},{15,30,180}]},{[6032,6035],[{154,50,180},{40,30,180},{91,86,180}]}]
    };
getRow(sixwar_bannerPresent)->
    #globalsetupCfg {
    id = 282,
    settype = sixwar_bannerPresent,
    setpara = [{[6030,6033],[{108,146,180},{108,145,180},{108,147,180}]},{[6031,6034],[{186.0,224.0,180},{100,101,180},{100,102,180}]},{[6032,6035],[{77,3,180},{77,2,180},{77,4,180}]}]
    };
getRow(sixwar_buffid)->
    #globalsetupCfg {
    id = 286,
    settype = sixwar_buffid,
    setpara = [20013]
    };
getRow(sixwar_buffob)->
    #globalsetupCfg {
    id = 285,
    settype = sixwar_buffob,
    setpara = [830]
    };
getRow(sixwar_holdpoint)->
    #globalsetupCfg {
    id = 275,
    settype = sixwar_holdpoint,
    setpara = [30]
    };
getRow(sixwar_holdtime)->
    #globalsetupCfg {
    id = 276,
    settype = sixwar_holdtime,
    setpara = [30000]
    };
getRow(sixwar_killpoint)->
    #globalsetupCfg {
    id = 277,
    settype = sixwar_killpoint,
    setpara = [8]
    };
getRow(sixwar_mapid)->
    #globalsetupCfg {
    id = 280,
    settype = sixwar_mapid,
    setpara = [6030,6031,6032,6033,6034,6035]
    };
getRow(sixwar_mapmax)->
    #globalsetupCfg {
    id = 274,
    settype = sixwar_mapmax,
    setpara = [60]
    };
getRow(sixwar_maxkillnum)->
    #globalsetupCfg {
    id = 297,
    settype = sixwar_maxkillnum,
    setpara = [50]
    };
getRow(sixwar_monster_cd)->
    #globalsetupCfg {
    id = 295,
    settype = sixwar_monster_cd,
    setpara = [4000]
    };
getRow(sixwar_npcid)->
    #globalsetupCfg {
    id = 288,
    settype = sixwar_npcid,
    setpara = [442,441,443,444,445]
    };
getRow(sixwar_npcxy)->
    #globalsetupCfg {
    id = 287,
    settype = sixwar_npcxy,
    setpara = [{[6030,6033],[{97.64,91.76,1},{91.41,91.76,1},{103.84,91.76,1}]},{[6031,6034],[{52,83,180},{56.5,83,180},{61.5,83,180}]},{[6032,6035],[{95,71,1},{90,71,1},{100,71,1}]}]
    };
getRow(sixwar_ratetime)->
    #globalsetupCfg {
    id = 279,
    settype = sixwar_ratetime,
    setpara = [{0,1},{10,1.5},{20,2}]
    };
getRow(sixwar_relive)->
    #globalsetupCfg {
    id = 284,
    settype = sixwar_relive,
    setpara = [{[6030,6033],[{78,96,180},{116,96,180},{98,60,180}]},{[6031,6034],[{45,52,180},{45,20,180},{47,96,180}]},{[6032,6035],[{154,144,180},{90,123,180},{42,143,180}]}]
    };
getRow(sixwar_reward_base)->
    #globalsetupCfg {
    id = 289,
    settype = sixwar_reward_base,
    setpara = [500]
    };
getRow(sixwar_reward_basegift)->
    #globalsetupCfg {
    id = 290,
    settype = sixwar_reward_basegift,
    setpara = [{27150,1}]
    };
getRow(sixwar_reward_crowd)->
    #globalsetupCfg {
    id = 294,
    settype = sixwar_reward_crowd,
    setpara = [{1,27102,1},{40,27105,1},{60,27108,1},{70,27111,1},{100,27111,1}]
    };
getRow(sixwar_reward_elite)->
    #globalsetupCfg {
    id = 293,
    settype = sixwar_reward_elite,
    setpara = [{1,27101,1},{40,27104,1},{60,27107,1},{70,27110,1},{100,27110,1}]
    };
getRow(sixwar_reward_head)->
    #globalsetupCfg {
    id = 292,
    settype = sixwar_reward_head,
    setpara = [{1,27100,1},{40,27103,1},{60,27106,1},{70,27109,1},{100,27109,1}]
    };
getRow(sixwar_reward_item)->
    #globalsetupCfg {
    id = 291,
    settype = sixwar_reward_item,
    setpara = [{27151,1}]
    };
getRow(sixwar_tocd)->
    #globalsetupCfg {
    id = 296,
    settype = sixwar_tocd,
    setpara = [30000]
    };
getRow(sixwar_uiaotocd)->
    #globalsetupCfg {
    id = 298,
    settype = sixwar_uiaotocd,
    setpara = [3000]
    };
getRow(skillpoints_reset)->
    #globalsetupCfg {
    id = 937,
    settype = skillpoints_reset,
    setpara = [10,40,100]
    };
getRow(sl_open)->
    #globalsetupCfg {
    id = 784,
    settype = sl_open,
    setpara = [21]
    };
getRow(snowman_notice)->
    #globalsetupCfg {
    id = 911,
    settype = snowman_notice,
    setpara = [20]
    };
getRow(soulactivity_skillopposite)->
    #globalsetupCfg {
    id = 868,
    settype = soulactivity_skillopposite,
    setpara = [{14011,22100},{14012,22101},{14013,22102},{14014,22103},{14015,22104},{14016,22105},{14017,22106},{14018,22107},{14019,22108},{14020,22109},{14021,22110},{14022,22111},{14023,22112},{14024,22113},{14025,22114},{14026,22115},{14027,22116},{14028,22117},{14029,22118},{14030,22119},{14041,22130},{14042,22131},{14043,22132},{14044,22133},{14045,22134},{14046,22135},{14047,22136},{14048,22137},{14049,22138},{14050,22139},{14051,22140},{14052,22141},{14053,22142},{14054,22143},{14055,22144},{14056,22145},{14057,22146},{14058,22147},{14059,22148},{14060,22149},{14071,22160},{14072,22161},{14073,22162},{14074,22163},{14075,22164},{14076,22165},{14077,22166},{14078,22167},{14079,22168},{14080,22169},{14081,22170},{14082,22171},{14083,22172},{14084,22173},{14085,22174},{14086,22175},{14087,22176},{14088,22177},{14089,22178},{14090,22179},{14111,22190},{14112,22191},{14113,22192},{14114,22193},{14115,22194},{14116,22195},{14117,22196},{14118,22197},{14119,22198},{14120,22199},{14121,22200},{14122,22201},{14123,22202},{14124,22203},{14125,22204},{14126,22205},{14127,22206},{14128,22207},{14129,22208},{14130,22209},{14141,22220},{14142,22221},{14143,22222},{14144,22223},{14145,22224},{14146,22225},{14147,22226},{14148,22227},{14149,22228},{14150,22229},{14151,22230},{14152,22231},{14153,22232},{14154,22233},{14155,22234},{14156,22235},{14157,22236},{14158,22237},{14159,22238},{14160,22239},{14171,22250},{14172,22251},{14173,22252},{14174,22253},{14175,22254},{14176,22255},{14177,22256},{14178,22257},{14179,22258},{14180,22259},{14181,22260},{14182,22261},{14183,22262},{14184,22263},{14185,22264},{14186,22265},{14187,22266},{14188,22267},{14189,22268},{14190,22269}]
    };
getRow(specialinstancehealth)->
    #globalsetupCfg {
    id = 708,
    settype = specialinstancehealth,
    setpara = [20]
    };
getRow(specialinstancemoney)->
    #globalsetupCfg {
    id = 706,
    settype = specialinstancemoney,
    setpara = [10,10,10,10,12,12,12]
    };
getRow(specialinstancestartmoney)->
    #globalsetupCfg {
    id = 707,
    settype = specialinstancestartmoney,
    setpara = [100]
    };
getRow(specialinstancewaypoint)->
    #globalsetupCfg {
    id = 705,
    settype = specialinstancewaypoint,
    setpara = [{77,74},{84,89},{96,75}]
    };
getRow(spiritArea_TimeAll)->
    #globalsetupCfg {
    id = 866,
    settype = spiritArea_TimeAll,
    setpara = [600]
    };
getRow(spiritArea_TimeReady)->
    #globalsetupCfg {
    id = 864,
    settype = spiritArea_TimeReady,
    setpara = [5]
    };
getRow(spiritArea_TimeWait)->
    #globalsetupCfg {
    id = 865,
    settype = spiritArea_TimeWait,
    setpara = [10]
    };
getRow(square_dancing_1)->
    #globalsetupCfg {
    id = 928,
    settype = square_dancing_1,
    setpara = [76,76,76,82,82,82,82,100,100,102,102,102,102,102,102,102]
    };
getRow(square_dancing_2)->
    #globalsetupCfg {
    id = 929,
    settype = square_dancing_2,
    setpara = [10]
    };
getRow(square_dancing_3)->
    #globalsetupCfg {
    id = 930,
    settype = square_dancing_3,
    setpara = [61400]
    };
getRow(square_dancing_4)->
    #globalsetupCfg {
    id = 931,
    settype = square_dancing_4,
    setpara = [50]
    };
getRow(square_dancing_5)->
    #globalsetupCfg {
    id = 932,
    settype = square_dancing_5,
    setpara = []
    };
getRow(square_dancing_6)->
    #globalsetupCfg {
    id = 933,
    settype = square_dancing_6,
    setpara = []
    };
getRow(square_dancing_7)->
    #globalsetupCfg {
    id = 934,
    settype = square_dancing_7,
    setpara = []
    };
getRow(starmoonbox_cost)->
    #globalsetupCfg {
    id = 955,
    settype = starmoonbox_cost,
    setpara = [{23001,1}]
    };
getRow(starmoonbox_model)->
    #globalsetupCfg {
    id = 956,
    settype = starmoonbox_model,
    setpara = [{30,32,31,33},{37,39,38,40},{44,46,45,47}]
    };
getRow(startmap)->
    #globalsetupCfg {
    id = 71,
    settype = startmap,
    setpara = [2]
    };
getRow(sweep_level)->
    #globalsetupCfg {
    id = 757,
    settype = sweep_level,
    setpara = []
    };
getRow(sweeplv)->
    #globalsetupCfg {
    id = 759,
    settype = sweeplv,
    setpara = [1]
    };
getRow(talentOpenPlayerLevelLimit)->
    #globalsetupCfg {
    id = 49,
    settype = talentOpenPlayerLevelLimit,
    setpara = [60]
    };
getRow(tasktype_11)->
    #globalsetupCfg {
    id = 151,
    settype = tasktype_11,
    setpara = [1]
    };
getRow(tasktype_12)->
    #globalsetupCfg {
    id = 152,
    settype = tasktype_12,
    setpara = [4]
    };
getRow(tasktype_13)->
    #globalsetupCfg {
    id = 153,
    settype = tasktype_13,
    setpara = [3]
    };
getRow(tasktype_14)->
    #globalsetupCfg {
    id = 154,
    settype = tasktype_14,
    setpara = [1]
    };
getRow(tasktype_15)->
    #globalsetupCfg {
    id = 155,
    settype = tasktype_15,
    setpara = [3]
    };
getRow(tasktype_16)->
    #globalsetupCfg {
    id = 156,
    settype = tasktype_16,
    setpara = [2]
    };
getRow(tasktype_17)->
    #globalsetupCfg {
    id = 157,
    settype = tasktype_17,
    setpara = [2]
    };
getRow(tasktype_18)->
    #globalsetupCfg {
    id = 158,
    settype = tasktype_18,
    setpara = [2]
    };
getRow(tasktype_19)->
    #globalsetupCfg {
    id = 159,
    settype = tasktype_19,
    setpara = [2]
    };
getRow(team_bonus_familys)->
    #globalsetupCfg {
    id = 914,
    settype = team_bonus_familys,
    setpara = [5]
    };
getRow(team_bonus_friends)->
    #globalsetupCfg {
    id = 913,
    settype = team_bonus_friends,
    setpara = [5]
    };
getRow(team_buff_familys)->
    #globalsetupCfg {
    id = 917,
    settype = team_buff_familys,
    setpara = [452]
    };
getRow(team_buff_friends)->
    #globalsetupCfg {
    id = 916,
    settype = team_buff_friends,
    setpara = [451]
    };
getRow(teamExpFactor)->
    #globalsetupCfg {
    id = 54,
    settype = teamExpFactor,
    setpara = [0.5]
    };
getRow(teamtalk_interval)->
    #globalsetupCfg {
    id = 514,
    settype = teamtalk_interval,
    setpara = [30]
    };
getRow(teamtalklv)->
    #globalsetupCfg {
    id = 513,
    settype = teamtalklv,
    setpara = [1]
    };
getRow(temporary_pet_taskid)->
    #globalsetupCfg {
    id = 939,
    settype = temporary_pet_taskid,
    setpara = [{8,1,55013},{8,1,55013},{12,2,55013}]
    };
getRow(timemount_power)->
    #globalsetupCfg {
    id = 166,
    settype = timemount_power,
    setpara = []
    };
getRow(trans_add)->
    #globalsetupCfg {
    id = 502,
    settype = trans_add,
    setpara = [1]
    };
getRow(trans_modelscale)->
    #globalsetupCfg {
    id = 501,
    settype = trans_modelscale,
    setpara = [{1,0.95,0},{2,1.2,0},{3,1,0},{4,1.2,50}]
    };
getRow(trans_shake_add)->
    #globalsetupCfg {
    id = 499,
    settype = trans_shake_add,
    setpara = [1.8]
    };
getRow(trans_shake_id)->
    #globalsetupCfg {
    id = 500,
    settype = trans_shake_id,
    setpara = [20]
    };
getRow(transfiguration)->
    #globalsetupCfg {
    id = 48,
    settype = transfiguration,
    setpara = [{101,1},{102,1000},{103,1000},{104,1000},{105,1000}]
    };
getRow(transform)->
    #globalsetupCfg {
    id = 497,
    settype = transform,
    setpara = [21125]
    };
getRow(transform_normal)->
    #globalsetupCfg {
    id = 498,
    settype = transform_normal,
    setpara = [21126]
    };
getRow(transformopenfirstdesc)->
    #globalsetupCfg {
    id = 370,
    settype = transformopenfirstdesc,
    setpara = [{32111,32211,32311},{32411,32511,32611},{32711,32811,32911},{33011,33111,33211}]
    };
getRow(transformopenid)->
    #globalsetupCfg {
    id = 369,
    settype = transformopenid,
    setpara = [{101,1},{201,5},{301,9}]
    };
getRow(transformopenlevel)->
    #globalsetupCfg {
    id = 368,
    settype = transformopenlevel,
    setpara = [5]
    };
getRow(treasure_free_counts)->
    #globalsetupCfg {
    id = 434,
    settype = treasure_free_counts,
    setpara = []
    };
getRow(treasure_once_gift)->
    #globalsetupCfg {
    id = 926,
    settype = treasure_once_gift,
    setpara = [{2160,5},{201,5}]
    };
getRow(treasure_onceandten_money)->
    #globalsetupCfg {
    id = 435,
    settype = treasure_onceandten_money,
    setpara = [300,2700]
    };
getRow(treasure_ten_gift)->
    #globalsetupCfg {
    id = 927,
    settype = treasure_ten_gift,
    setpara = [{2160,50},{201,50}]
    };
getRow(turn_speed)->
    #globalsetupCfg {
    id = 40,
    settype = turn_speed,
    setpara = [2]
    };
getRow(updategift_1)->
    #globalsetupCfg {
    id = 885,
    settype = updategift_1,
    setpara = [{615,10},{222,5},{2160,5}]
    };
getRow(updategift_2)->
    #globalsetupCfg {
    id = 886,
    settype = updategift_2,
    setpara = [{616,10},{222,10},{2160,10}]
    };
getRow(updategift_3)->
    #globalsetupCfg {
    id = 887,
    settype = updategift_3,
    setpara = []
    };
getRow(vip_sellnum)->
    #globalsetupCfg {
    id = 494,
    settype = vip_sellnum,
    setpara = [10]
    };
getRow(viporder_sellnum)->
    #globalsetupCfg {
    id = 496,
    settype = viporder_sellnum,
    setpara = [5]
    };
getRow(voice_anchorname)->
    #globalsetupCfg {
    id = 870,
    settype = voice_anchorname,
    setpara = [{1800,1859,1},{1900,1959,2},{2000,2059,3}]
    };
getRow(voicechat_cd)->
    #globalsetupCfg {
    id = 482,
    settype = voicechat_cd,
    setpara = [10]
    };
getRow(wedding_couple_type_ff)->
    #globalsetupCfg {
    id = 728,
    settype = wedding_couple_type_ff,
    setpara = [1]
    };
getRow(wedding_couple_type_mf)->
    #globalsetupCfg {
    id = 726,
    settype = wedding_couple_type_mf,
    setpara = [1]
    };
getRow(wedding_couple_type_mm)->
    #globalsetupCfg {
    id = 727,
    settype = wedding_couple_type_mm,
    setpara = [1]
    };
getRow(wedding_divorce_cost)->
    #globalsetupCfg {
    id = 722,
    settype = wedding_divorce_cost,
    setpara = [30]
    };
getRow(wedding_divorce_lvdown)->
    #globalsetupCfg {
    id = 724,
    settype = wedding_divorce_lvdown,
    setpara = [1]
    };
getRow(wedding_divorce_time)->
    #globalsetupCfg {
    id = 723,
    settype = wedding_divorce_time,
    setpara = [12]
    };
getRow(wedding_level_limit)->
    #globalsetupCfg {
    id = 725,
    settype = wedding_level_limit,
    setpara = [40]
    };
getRow(wedding_num)->
    #globalsetupCfg {
    id = 736,
    settype = wedding_num,
    setpara = [12,20]
    };
getRow(wedding_order_time_min)->
    #globalsetupCfg {
    id = 729,
    settype = wedding_order_time_min,
    setpara = [5]
    };
getRow(wedding_teleportation_cooldown)->
    #globalsetupCfg {
    id = 730,
    settype = wedding_teleportation_cooldown,
    setpara = [60]
    };
getRow(whiteFactor)->
    #globalsetupCfg {
    id = 110,
    settype = whiteFactor,
    setpara = []
    };
getRow(wildboss_times)->
    #globalsetupCfg {
    id = 664,
    settype = wildboss_times,
    setpara = [3]
    };
getRow(wildboss_times_lucky)->
    #globalsetupCfg {
    id = 665,
    settype = wildboss_times_lucky,
    setpara = [1]
    };
getRow(wildboss_times_must)->
    #globalsetupCfg {
    id = 666,
    settype = wildboss_times_must,
    setpara = [3]
    };
getRow(wildpk_openlevel)->
    #globalsetupCfg {
    id = 908,
    settype = wildpk_openlevel,
    setpara = [23]
    };
getRow(wing_interval)->
    #globalsetupCfg {
    id = 721,
    settype = wing_interval,
    setpara = [0.2]
    };
getRow(wing_open_level)->
    #globalsetupCfg {
    id = 719,
    settype = wing_open_level,
    setpara = [1,1000]
    };
getRow(wing_regeneratio)->
    #globalsetupCfg {
    id = 720,
    settype = wing_regeneratio
    };
getRow(world_guardian_one)->
    #globalsetupCfg {
    id = 938,
    settype = world_guardian_one,
    setpara = [100]
    };
getRow(worldlevel_base)->
    #globalsetupCfg {
    id = 507,
    settype = worldlevel_base,
    setpara = [40]
    };
getRow(worldlevel_exp)->
    #globalsetupCfg {
    id = 506,
    settype = worldlevel_exp,
    setpara = [40]
    };
getRow(worldlevel_num)->
    #globalsetupCfg {
    id = 508,
    settype = worldlevel_num,
    setpara = [30]
    };
getRow(zoo_food2bonnus)->
    #globalsetupCfg {
    id = 981,
    settype = zoo_food2bonnus,
    setpara = [{3200,3201,5,10},{3202,3220,1,3}]
    };
getRow(_)->[].

getKeyList()->[
    {achievement_level},
    {action_buy},
    {action_buytime},
    {action_point_buy},
    {action_point_increase_info},
    {active_leader},
    {active_member},
    {active_money},
    {activereward},
    {activeSkill},
    {activity_ipad},
    {aftercast},
    {allplayerquestion_activitytotaltime},
    {allplayerquestion_integral},
    {allplayerquestion_lv},
    {allplayerquestion_ratio},
    {allplayerquestion_reward},
    {allplayerquestion_time},
    {arena_AddLevel},
    {arena_DanPoint_1},
    {arena_DanPoint_2},
    {arena_DanPoint_3},
    {arena_DanPoint_4},
    {arena_DanPoint_5},
    {arena_DanPoint_6},
    {arena_Dapao},
    {arena_LoseReward},
    {arena_Match},
    {arena_MaxMapLine},
    {arena_RewardNumber},
    {arena_Time},
    {arena_Title},
    {arena_WeekRewardNo1},
    {arena_WeekRewardNo2},
    {arena_WeekRewardNo3},
    {arena_WeekRewardNo4},
    {arena_WeekRewardNo5},
    {arena_WeekRewardNo6},
    {arena_WeekRewardNo7},
    {arena_WinReward},
    {assassincd},
    {assassincost},
    {assassinrange},
    {auto_range},
    {awardGiveMarkItemID},
    {awardGiveMarkItemNum},
    {awardGiveMarkLevel},
    {awareofpetskill},
    {azraelcd},
    {azraelcost},
    {azraelrange},
    {back_city_level},
    {badge_level},
    {ban_chat},
    {ban_chatlevel},
    {banned},
    {battle_1_honor},
    {battle_1_item},
    {battle_11_honor},
    {battle_11_item},
    {battle_2_honor},
    {battle_2_item},
    {battle_3to10_honor},
    {battle_3to10_item},
    {battle_add_time},
    {battle_add_value},
    {battle_boss_item},
    {battle_honor_max},
    {battle_jl1},
    {battle_jl2},
    {battle_kill_value},
    {battle_mb1},
    {battle_mb2},
    {battle_number},
    {battle_play_level},
    {battle_point1},
    {battle_point2},
    {battle_time},
    {battle_up10},
    {battle_up30},
    {battle_up50},
    {battle_war_AssKillExploit},
    {battle_war_attack},
    {battle_war_Boss},
    {battle_war_Carriage},
    {battle_war_CarriageOverExploit},
    {battle_war_CrystalExploit},
    {battle_war_CrystalExploitSubsidy},
    {battle_war_CrystalIntegral},
    {battle_war_CrystalIntegralMax},
    {battle_war_CrystalMaxExploit},
    {battle_war_CrystalMaxExploitSubsidy},
    {battle_war_CrystalMaxIntegral},
    {battle_war_Guard},
    {battle_war_GuardCoordinate},
    {battle_war_GuardExploit},
    {battle_war_GuardNum},
    {battle_war_HighMapLine},
    {battle_war_KillExploit},
    {battle_war_KillMessage},
    {battle_war_LowMapAegis},
    {battle_war_LowMapLine},
    {battle_war_MaxLinePlayer},
    {battle_war_MaxMapLine},
    {battle_war_MidMapForce},
    {battle_war_MidMapLine},
    {battle_war_MinMapForce},
    {battle_war_Object},
    {battle_war_ObjectCd},
    {battle_war_ObjectExploit},
    {battle_war_ObjectExploitSubsidy},
    {battle_war_Ore},
    {battle_war_OreMax},
    {battle_war_RefreshTime},
    {battle_war_RewardNo1},
    {battle_war_RewardNo2},
    {battle_war_RewardNo3},
    {battle_war_RewardNo4},
    {battle_war_RewardNo5},
    {battle_war_WeekRewardNo1},
    {battle_war_WeekRewardNo2},
    {battle_war_WeekRewardNo3},
    {battle_war_WeekRewardNo4},
    {battle_war_WeekRewardNo5},
    {battle_war_WeekRewardNo6},
    {battle_war_WeekRewardNo7},
    {bidding},
    {blood_colour},
    {blood_colourSingle},
    {blueAffix},
    {blueFactor},
    {bribery_cost_max},
    {bribery_cost_min},
    {bribery_history},
    {bribery_money_chs},
    {bribery_money_cht},
    {bribery_money_enu},
    {bribery_money_jpn},
    {bribery_money_kor},
    {bribery_money_mljx},
    {bribery_money_rus},
    {bribery_money_tha},
    {bribery_money_vietnam},
    {bribery_money_xmt},
    {bribery_num_max},
    {bribery_num_min},
    {broadcase_self_cd},
    {broadcase_self_rank_sort},
    {bubbleExpressionIntervalTime},
    {buddy_fly},
    {buddy_invite},
    {buddyBonus1},
    {buddyBonus2},
    {buddyBonus3},
    {candy_end_time},
    {candy_start_time},
    {candy_twice},
    {cannon_cd},
    {cannon_kill},
    {cannon_xy},
    {char_speed1},
    {char_speed2},
    {chat_cd_level},
    {chat_cd1},
    {chat_cd2},
    {chat_counts},
    {chat_level},
    {chat_task},
    {chatLimited_count},
    {chatLimited_over},
    {chatLimited_Reset},
    {chatLimited_time},
    {chatLimited_words},
    {chuansongpet1id},
    {ck_nq},
    {coinHand_box},
    {coinHand_cd},
    {coinHand_freetime},
    {coinHand_limit},
    {coinHand_rate},
    {combol_last},
    {convoy_task_range_time},
    {countdown},
    {crystal_xy},
    {dailyinterfacejjcopen},
    {dailytask_levellimit},
    {dailytask_number},
    {dark_accumulate},
    {dark_buy},
    {dark_end},
    {dark_level},
    {dark_maximum},
    {dark_monster},
    {dark_player},
    {dark_population},
    {dark_price},
    {dark_refresh},
    {dark_start},
    {dark_time},
    {dark_times},
    {darkcoinNum},
    {darkkillNum},
    {darkness_basicgift},
    {darkness_bosscd},
    {darkness_bossid},
    {darkness_bosspoint},
    {darkness_buff},
    {darkness_gift},
    {darkness_killnumber},
    {darkness_monstervalue},
    {darkness_open},
    {darkness_rerank},
    {dash_soundlimit},
    {datask_dianumber},
    {date_hide_actiontime},
    {date_hide_refresh},
    {date_hide_refreshnumber},
    {date_hide_refreshtime},
    {date_hide_score},
    {date_hide_scoreMax},
    {date_hide_transmittime},
    {date_link_addScore},
    {date_link_box},
    {date_link_boxrefresh},
    {date_link_buffID_addscore},
    {date_link_buffID_addtime},
    {date_link_buffID_multscore},
    {date_link_buffID_speedUp},
    {date_link_combina},
    {date_link_combo_buff},
    {date_link_count_reshuffle},
    {date_link_debuffID_dizzy},
    {date_link_debuffID_slowDown},
    {date_link_distXY},
    {date_link_gemNpcID},
    {date_link_monsterID},
    {date_link_posXY},
    {date_link_power},
    {date_link_randbuff},
    {date_link_randBuffType},
    {date_link_randDebuffType},
    {date_link_scorelist},
    {date_link_scoreMax},
    {date_link_sizeXY},
    {date_link_time_afterFristEnter},
    {date_link_time_beforeFristEnter},
    {date_link_time_combo},
    {date_link_time_linkAdd},
    {date_link_time_linkPower},
    {date_link_time_reshuffle},
    {date_link_time_settle},
    {date_nbox_boxnpcid},
    {date_nbox_boxscore},
    {date_nbox_endpoint},
    {date_nbox_instance},
    {date_nbox_pointgroup},
    {date_nbox_refresh},
    {date_nbox_scoreMax},
    {date_swimmingparty_addscorelist},
    {date_swimmingparty_frequency},
    {date_swimmingparty_pointgroup},
    {date_swimmingparty_radius},
    {date_swimmingparty_refresh},
    {date_swimmingparty_scoreMax},
    {day_night},
    {day_night_interval},
    {deadline},
    {default_box},
    {defendcity_boss},
    {defendcity_chest},
    {defendcity_chest_time},
    {defendcity_kill_num},
    {defendcity_level},
    {defendcity_monster},
    {distortion_big_and_small},
    {divine_change},
    {divine_cost},
    {divine_diamondcd},
    {divine_diamondlimit},
    {divine_freediamondlimit},
    {divine_freegoldlimit},
    {divine_goldcd},
    {divine_goldlimit},
    {divine_pool_diamond},
    {divine_pool_gold},
    {divine_pool_high},
    {divine_thenine},
    {divine_winernumbers},
    {drop_level},
    {english_randomname},
    {engsavefactor},
    {equip_enchantmoney},
    {equip_recheck_q},
    {equipinten_worldtext_limit},
    {equipRecastpropcast},
    {equipRecastrunecast0},
    {equipRecastrunecast1},
    {equipRecastrunecast2},
    {equipstar_worldtext_limit},
    {escort_multiplayer_buf},
    {escort_multiplayer_event},
    {escort_multiplayer_item},
    {escort_multiplayer_level},
    {escort_multiplayer_num},
    {escort_multiplayer_reward},
    {escort_singleplayer_buf},
    {escort_singleplayer_event},
    {escort_singleplayer_item},
    {escort_singleplayer_level},
    {escort_singleplayer_monster},
    {escort_singleplayer_num},
    {escort_singleplayer_reward},
    {evil_threshold},
    {evilkill_effect},
    {evilkill_level},
    {exp_2_item_info},
    {exp_autoget},
    {exp_max},
    {expfuben_revivedtime},
    {expmaptime},
    {fable_challengetime},
    {fable_die},
    {fable_number},
    {fable_preparetime},
    {fashion_fixtime},
    {fashion_forever},
    {fightall_attack},
    {fightall_attacker},
    {fightall_defend},
    {fightall_defender},
    {fightall_InjuryStatistics},
    {fightall_lost},
    {fightall_map_id},
    {fightall_mirror_armor},
    {fightall_mirror_atk},
    {fightall_mirror_crit},
    {fightall_mirror_critdamage},
    {fightall_mirror_def},
    {fightall_mirror_dodge},
    {fightall_mirror_hit},
    {fightall_mirror_HP},
    {fightall_mirror_redef},
    {fightall_mirror_toughness},
    {fightall_open_count},
    {fightall_open_level},
    {fightall_statue},
    {fightall_win},
    {fightbossactivity},
    {filed_exp_decline},
    {first_buy_pet},
    {firstbloodmonster},
    {fistplanes},
    {flowers},
    {found_level},
    {free_weddingitem_num},
    {friend_action_point_every_gain},
    {friend_avoid_harassment},
    {friend_closeness_give_ap},
    {friend_count_blacklist_max},
    {friend_count_blacklist_threshold},
    {friend_count_friendlist_max},
    {friend_count_gain_ap_max},
    {friend_count_give_ap_max},
    {friend_count_mapmate},
    {friend_count_teammate},
    {friend_timelimit_query_mtb},
    {friend_timelimit_query_r},
    {friend2_add_applicant_count},
    {friend2_add_applicant_life},
    {friend2_add_applicant_page_count},
    {friend2_add_applicant_sync_cd},
    {friend2_add_cd},
    {friend2_black_ban},
    {friend2_black_count},
    {friend2_black_page_count},
    {friend2_black_silent},
    {friend2_ChatWordLimit},
    {friend2_ExpressionLimit},
    {friend2_formal_closeness_count},
    {friend2_formal_count},
    {friend2_formal_gain_ap_count},
    {friend2_formal_gain_ap_value},
    {friend2_formal_give_ap_count},
    {friend2_formal_like_count},
    {friend2_formal_page_count},
    {friend2_formal_sort},
    {friend2_formal_sync_cd},
    {friend2_formal_transmit_cd},
    {friend2_ItemLimit},
    {friend2_recommend_cd},
    {friend2_recommend_count},
    {friend2_recommend_filter},
    {friend2_recommend_filter_count},
    {friend2_search_cd},
    {friend2_temp_count},
    {friend2_temp_page_count},
    {friend2_temp_sort},
    {friend2_temp_sync_cd},
    {friend2_Transmit},
    {friendlinessFromRedEnvelopeLimit},
    {friends_crossapplycd},
    {friends_crossapplycount},
    {friends_crosscount},
    {friends_listconfine},
    {friends_pushlevelmax},
    {friends_pushnum},
    {friends_pushtime},
    {fs_nq},
    {gem_equippart_color},
    {gem_mixcost1},
    {gem_mixcost2},
    {gem_mixcost3},
    {gem_mixcost4},
    {gem_mixcost5},
    {gem_mixcost6},
    {gem_mixcost7},
    {gem_mixcost8},
    {gem_mixcost9},
    {gem_value1},
    {gem_value10},
    {gem_value2},
    {gem_value3},
    {gem_value4},
    {gem_value5},
    {gem_value6},
    {gem_value7},
    {gem_value8},
    {gem_value9},
    {giveGiftLevel},
    {giveGiftString},
    {giveGiftVIP},
    {global_in},
    {goblin_first_lotterydraw},
    {goblin_free_counts},
    {goblin_once_gift},
    {goblin_onceandten_money},
    {goblin_ten_gift},
    {goddess},
    {goddess_lamb},
    {goddess_textures},
    {gold_exchange},
    {greenAffix},
    {greenFactor},
    {gripSpeed},
    {guaji_stay_time},
    {guild_apply_cd},
    {guild_apply_maxcount},
    {guild_apply_pro},
    {guild_battle_addpoint},
    {guild_battle_applyminlvl},
    {guild_battle_calcrange},
    {guild_battle_reward1},
    {guild_battle_reward2},
    {guild_battle_reward3},
    {guild_boss1},
    {guild_boss2},
    {guild_boss3},
    {guild_boss4},
    {guild_boss5},
    {guild_cd},
    {guild_cd_master},
    {guild_contribute_max},
    {guild_conversion_currency},
    {guild_conversion_item},
    {guild_createCost},
    {guild_dia_onetime},
    {guild_diamax_day},
    {guild_exchange_limit},
    {guild_exp_add},
    {guild_fairground_free},
    {guild_godbless_limit},
    {guild_godbless_param},
    {guild_gold_onetime},
    {guild_goldmax_day},
    {guild_gx_add},
    {guild_impeach_activitytime},
    {guild_impeach_money},
    {guild_impeach_num},
    {guild_impeach_offline},
    {guild_join_level},
    {guild_member_latelylogintime},
    {guild_modifyname},
    {guild_name_max_length},
    {guild_overskill},
    {guild_request_notice_cd},
    {guild_request_time},
    {guild_scene},
    {guild_selecttime},
    {guild_shop_conver},
    {guild_shop_level_ID},
    {guild_shop_limit},
    {guild_snowman_contribute},
    {guild_snowman_exp},
    {guild_snowman_gift},
    {guild_snowman_npcID},
    {guild_snowman_settle},
    {guild_suppliesAll},
    {guild_suppliesOwn},
    {guild_sw_add},
    {guild_wish_confine},
    {guildbattleapplyres},
    {guildbattleBaseConfig},
    {guildbattlecollectids},
    {guildbattleDefendBoss},
    {guildbattlerevivepos},
    {guildbattleReward},
    {guildhome_guild},
    {guildhome_homexy},
    {guildhome_monsternum},
    {guildhome_monstertime},
    {guildhome_monsterxy},
    {guildhome_ourxy},
    {guildhome_task1},
    {guildhome_task2},
    {guildhome_taskcd},
    {guildhome_taskmax},
    {guildhome_tasktime},
    {hero_time},
    {hero_trigger1},
    {hero_trigger2},
    {hit_base},
    {hitaway_range},
    {hitaway_spdown},
    {hitaway_speed},
    {hitaway_var},
    {home_namefix},
    {honor_open},
    {horn_diamond},
    {horn_item},
    {horn_level},
    {horn_num},
    {horn_seetime},
    {horn_words},
    {identity_age_limit},
    {identity_pic_count},
    {identity_sign_count},
    {identity_tag_count},
    {instance_level},
    {integral},
    {intensify_lv0},
    {intensify_lv1},
    {intensify_lv10},
    {intensify_lv11},
    {intensify_lv12},
    {intensify_lv13},
    {intensify_lv14},
    {intensify_lv15},
    {intensify_lv16},
    {intensify_lv17},
    {intensify_lv18},
    {intensify_lv19},
    {intensify_lv2},
    {intensify_lv20},
    {intensify_lv3},
    {intensify_lv4},
    {intensify_lv5},
    {intensify_lv6},
    {intensify_lv7},
    {intensify_lv8},
    {intensify_lv9},
    {jjc_1v1_freetimes},
    {jjc_1v1_rewardtime},
    {jjc_attack},
    {jjc_defend},
    {jjc_item},
    {jjc_lose},
    {jjc_money},
    {jjc_objectdirection},
    {jjc_open},
    {jjc_plus},
    {jjc_time},
    {jjc_win},
    {jjc_worship},
    {jjs_createreward},
    {jjs_nq},
    {killing_broadcast},
    {killing_cost},
    {killing_die},
    {killing_firstvalue},
    {killing_punishment},
    {killing_punishmentbuff},
    {killing_time},
    {killing_value},
    {king_battle_award_rank_number},
    {king_battle_defender_item_info},
    {king_battle_rank_item_info},
    {kingBattleRepairMirrorCfg},
    {kmaxchar},
    {kmaxchar_enu},
    {kmaxchar_private},
    {kmaxchar_private_enu},
    {kmaxhistorymsg},
    {kmaxinsertitems},
    {kmaxmsg},
    {knightcd},
    {knightcost},
    {knightrange},
    {koreangift_coin},
    {ladder1v1FistBattleAward},
    {league_gift_1},
    {league_gift_2},
    {league_gift_3},
    {league_kill},
    {league_lost1},
    {league_lost2},
    {league_reborn},
    {league_win1},
    {league_win2},
    {liehen_reduce},
    {llc_nq},
    {llcs_nq},
    {loading_image_x},
    {lotteryForTowerShow},
    {luckydraw_odds},
    {magecd},
    {magecost},
    {magerange},
    {mail_content_max_length_chs},
    {mail_content_max_length_enu},
    {main_city},
    {main_map_id},
    {map_convey},
    {marriage_BreakCost},
    {marriage_ClosenessLimitEveryday},
    {marriage_ferescale},
    {marriage_FriendlinessDownWithoutTeam},
    {marriage_FriendlinessDownWithTeam},
    {marriage_FriendlinessLimit},
    {marriage_iscouplesame},
    {marriage_KillMonsterGetCloseness},
    {marriage_RingItemList},
    {marriage_task_number},
    {marriage_taskFidlist},
    {marriage_TimeOut},
    {materialCopyMapID},
    {max1Chance},
    {maxDamage},
    {maxenchance},
    {maxgridcellnum},
    {maxreborn},
    {mechaniccd},
    {mechaniccost},
    {mechanicrange},
    {minDamage},
    {mirroring},
    {mirroring_minHp},
    {mirroring_restore},
    {mirroring_weak},
    {mn_nq},
    {moneyDungeon_StartPoint},
    {moneyDungeon_StartPointPlayer},
    {moneyDungeon_time_kill},
    {moneyDungeon_time_monster},
    {moneyDungeon_time_ready},
    {moneyDungeon_time_settle},
    {moneyDungeon_time_spawn},
    {moneyDungeon_time_turn},
    {monsterbox_cooldown},
    {mount_level_per_rank},
    {mount_up_distance},
    {mountfood},
    {mountsta},
    {mountup_min_level},
    {need_equiplv},
    {needForSpeedAthleteMaxNumber},
    {needForSpeedcameracontrol},
    {needForSpeedcheckboxradius},
    {needForSpeedcheckwaypointradius},
    {needForSpeedCompetitionBegin2EndTime},
    {needForSpeedCompetitionCountDownSec},
    {needForSpeedCompetitionReadyBeginCountDownSec},
    {needForSpeedCompetitionReadyEndCountDownSec},
    {needForSpeedCompetitionrewardmax},
    {needForSpeedMapInfo},
    {needForSpeedMatchCountDownSec},
    {needForSpeedmatchopen},
    {needForSpeedMaxCircle},
    {needForSpeedWinCountDownSec},
    {newplayeritem},
    {newplayerworldLevel},
    {newyeargameID},
    {newyeargametime},
    {newyearminlevel},
    {normal_sellnum},
    {normalcameracontrol},
    {nPC_Shop_ID},
    {npc_soundplay_time},
    {npc_soundrange_load},
    {npc_soundrange_play},
    {offline_exptime},
    {offlineexp_openlevel},
    {openTabLevel},
    {orangeFactor},
    {oraRed1Affix},
    {oraRed2Affix},
    {oraRed3Affix},
    {oraRed4Affix},
    {oraRed5Affix},
    {oraRed6Affix},
    {order_sellnum},
    {partner_timeol},
    {passiveSkill},
    {percentage_agent},
    {percentage_agent_openlevel},
    {pet_atkshow},
    {pet_equipment},
    {pet_name},
    {pet_recycle_cost},
    {pet_recycle_open},
    {pet_skill},
    {pet_stronger},
    {pet_warspeed},
    {petAssist},
    {petbattledef},
    {petbattleequip},
    {petbreak_reborn},
    {petbreak_star},
    {petEnh0},
    {petEnh1},
    {petEnh10},
    {petEnh2},
    {petEnh3},
    {petEnh4},
    {petEnh5},
    {petEnh6},
    {petEnh7},
    {petEnh8},
    {petEnh9},
    {petEquipFactorA},
    {petEquipFactorB},
    {petleader_for_lord},
    {petMaxAssist},
    {petmoon},
    {petpvp_cd},
    {petpvp_duringTime},
    {petpvp_money},
    {petpvp_pro},
    {petpvp_rank},
    {petpvp_refresh},
    {petpvp_time},
    {petpvp_token},
    {petpvp_win},
    {petQuality0},
    {petQuality1},
    {petQuality2},
    {petQuality3},
    {petQuality4},
    {petReBorn0},
    {petReBorn1},
    {petReBorn10},
    {petReBorn2},
    {petReBorn3},
    {petReBorn4},
    {petReBorn5},
    {petReBorn6},
    {petReBorn7},
    {petReBorn8},
    {petReBorn9},
    {petskillpw_blue},
    {petskillpw_green},
    {petskillpw_orange},
    {petskillpw_purple},
    {petskillpw_red},
    {petskillpw_white},
    {petskillroll},
    {petstronger_num},
    {petsun},
    {petTerritory_battleCD},
    {petTerritory_cleanCD_data},
    {petTerritory_cleanCD_history},
    {petTerritory_count},
    {petTerritory_plunderCD},
    {petTerritory_plunderRate},
    {petTerritory_posPetsD},
    {petTerritory_posPetsP},
    {petTerritory_sameCD},
    {petTerritory_searchCD},
    {petTerritory_timeReady},
    {petTerritory_timeSettle},
    {petTerritory_vigorCost},
    {petTerritory_vigorMax},
    {petTerritory_vigorRecover},
    {petwar_add},
    {petwar_addgold},
    {petwar_replystrength},
    {petwar_stargift},
    {pk_forbidden_end},
    {pk_forbidden_start},
    {pk_time},
    {plant_clearpestis},
    {plant_composttimes},
    {plant_heathStatus},
    {plant_helpbonus},
    {plant_helptimes},
    {plant_watering},
    {player_action_point_max},
    {player_action_point_reset_max},
    {player_atksound},
    {player_hitsound},
    {player_maxlevel},
    {playertof},
    {pre_recharge},
    {propToDam},
    {purpleAffix},
    {purpleFactor},
    {push_buylevel},
    {qa_prepare_time},
    {qa_time},
    {qixi_show_end_time},
    {qixi_show_start_time},
    {qixi_showVFX_position},
    {qs_nq},
    {question_gift_n1},
    {question_num},
    {question_quantity},
    {question_time},
    {race_apply_map},
    {race_invincible},
    {race_laps},
    {race_mod},
    {race_pos},
    {race_rewardA},
    {race_rewardB},
    {race_time_wait},
    {randomshop_Diamonds},
    {randomshop_limit},
    {ranklevel_limit},
    {real_drop},
    {redEnvelope_FriendRemainTime},
    {redEnvelope_LevelLimit},
    {redEnvelope_PacketAmountMax},
    {redEnvelope_PacketAmountMin},
    {redEnvelope_PacketMax},
    {redEnvelope_PacketMin},
    {redEnvelope_WorldAnnouncementAmount},
    {redEnvelope_WorldReceiveAmount},
    {redEnvelope_WorldRemainTime},
    {redFactor},
    {refush},
    {relive_cost},
    {relive_cost_hp},
    {relive_hp},
    {relive_time},
    {repelSpeed},
    {report},
    {resetPosToRevivePtCDTime},
    {resurrection},
    {resurrection_tozero},
    {rift_cd},
    {ring_item},
    {robbery_item},
    {robbery_player_buf},
    {robbery_player_level},
    {robbery_player_num},
    {robbery_revive_item},
    {robbery_revive_site},
    {rollspeed},
    {rune_boardcast},
    {rune_maxsmelt},
    {rune_openlv_mount},
    {rune_openlv_player},
    {rune_regain},
    {rune_weightfornum},
    {rune_weightforpro},
    {runecolor},
    {runecolorchange},
    {search_radius},
    {selfChance},
    {sellcost12},
    {sellcost24},
    {sellcost48},
    {selloff},
    {selltax},
    {sen_time1},
    {sen_time2},
    {server_list_area_sort_type},
    {server_list_sort_type},
    {shieldeledr},
    {shieldholydr},
    {shieldphydr},
    {shieldshadowdr},
    {shilianjiangli},
    {shop_time},
    {signInCost},
    {sixwar_assistspoint},
    {sixwar_banner},
    {sixwar_bannerABC},
    {sixwar_bannerPresent},
    {sixwar_buffid},
    {sixwar_buffob},
    {sixwar_holdpoint},
    {sixwar_holdtime},
    {sixwar_killpoint},
    {sixwar_mapid},
    {sixwar_mapmax},
    {sixwar_maxkillnum},
    {sixwar_monster_cd},
    {sixwar_npcid},
    {sixwar_npcxy},
    {sixwar_ratetime},
    {sixwar_relive},
    {sixwar_reward_base},
    {sixwar_reward_basegift},
    {sixwar_reward_crowd},
    {sixwar_reward_elite},
    {sixwar_reward_head},
    {sixwar_reward_item},
    {sixwar_tocd},
    {sixwar_uiaotocd},
    {skillpoints_reset},
    {sl_open},
    {snowman_notice},
    {soulactivity_skillopposite},
    {specialinstancehealth},
    {specialinstancemoney},
    {specialinstancestartmoney},
    {specialinstancewaypoint},
    {spiritArea_TimeAll},
    {spiritArea_TimeReady},
    {spiritArea_TimeWait},
    {square_dancing_1},
    {square_dancing_2},
    {square_dancing_3},
    {square_dancing_4},
    {square_dancing_5},
    {square_dancing_6},
    {square_dancing_7},
    {starmoonbox_cost},
    {starmoonbox_model},
    {startmap},
    {sweep_level},
    {sweeplv},
    {talentOpenPlayerLevelLimit},
    {tasktype_11},
    {tasktype_12},
    {tasktype_13},
    {tasktype_14},
    {tasktype_15},
    {tasktype_16},
    {tasktype_17},
    {tasktype_18},
    {tasktype_19},
    {team_bonus_familys},
    {team_bonus_friends},
    {team_buff_familys},
    {team_buff_friends},
    {teamExpFactor},
    {teamtalk_interval},
    {teamtalklv},
    {temporary_pet_taskid},
    {timemount_power},
    {trans_add},
    {trans_modelscale},
    {trans_shake_add},
    {trans_shake_id},
    {transfiguration},
    {transform},
    {transform_normal},
    {transformopenfirstdesc},
    {transformopenid},
    {transformopenlevel},
    {treasure_free_counts},
    {treasure_once_gift},
    {treasure_onceandten_money},
    {treasure_ten_gift},
    {turn_speed},
    {updategift_1},
    {updategift_2},
    {updategift_3},
    {vip_sellnum},
    {viporder_sellnum},
    {voice_anchorname},
    {voicechat_cd},
    {wedding_couple_type_ff},
    {wedding_couple_type_mf},
    {wedding_couple_type_mm},
    {wedding_divorce_cost},
    {wedding_divorce_lvdown},
    {wedding_divorce_time},
    {wedding_level_limit},
    {wedding_num},
    {wedding_order_time_min},
    {wedding_teleportation_cooldown},
    {whiteFactor},
    {wildboss_times},
    {wildboss_times_lucky},
    {wildboss_times_must},
    {wildpk_openlevel},
    {wing_interval},
    {wing_open_level},
    {wing_regeneratio},
    {world_guardian_one},
    {worldlevel_base},
    {worldlevel_exp},
    {worldlevel_num},
    {zoo_food2bonnus}
    ].

get1KeyList()->[
    achievement_level,
    action_buy,
    action_buytime,
    action_point_buy,
    action_point_increase_info,
    active_leader,
    active_member,
    active_money,
    activereward,
    activeSkill,
    activity_ipad,
    aftercast,
    allplayerquestion_activitytotaltime,
    allplayerquestion_integral,
    allplayerquestion_lv,
    allplayerquestion_ratio,
    allplayerquestion_reward,
    allplayerquestion_time,
    arena_AddLevel,
    arena_DanPoint_1,
    arena_DanPoint_2,
    arena_DanPoint_3,
    arena_DanPoint_4,
    arena_DanPoint_5,
    arena_DanPoint_6,
    arena_Dapao,
    arena_LoseReward,
    arena_Match,
    arena_MaxMapLine,
    arena_RewardNumber,
    arena_Time,
    arena_Title,
    arena_WeekRewardNo1,
    arena_WeekRewardNo2,
    arena_WeekRewardNo3,
    arena_WeekRewardNo4,
    arena_WeekRewardNo5,
    arena_WeekRewardNo6,
    arena_WeekRewardNo7,
    arena_WinReward,
    assassincd,
    assassincost,
    assassinrange,
    auto_range,
    awardGiveMarkItemID,
    awardGiveMarkItemNum,
    awardGiveMarkLevel,
    awareofpetskill,
    azraelcd,
    azraelcost,
    azraelrange,
    back_city_level,
    badge_level,
    ban_chat,
    ban_chatlevel,
    banned,
    battle_1_honor,
    battle_1_item,
    battle_11_honor,
    battle_11_item,
    battle_2_honor,
    battle_2_item,
    battle_3to10_honor,
    battle_3to10_item,
    battle_add_time,
    battle_add_value,
    battle_boss_item,
    battle_honor_max,
    battle_jl1,
    battle_jl2,
    battle_kill_value,
    battle_mb1,
    battle_mb2,
    battle_number,
    battle_play_level,
    battle_point1,
    battle_point2,
    battle_time,
    battle_up10,
    battle_up30,
    battle_up50,
    battle_war_AssKillExploit,
    battle_war_attack,
    battle_war_Boss,
    battle_war_Carriage,
    battle_war_CarriageOverExploit,
    battle_war_CrystalExploit,
    battle_war_CrystalExploitSubsidy,
    battle_war_CrystalIntegral,
    battle_war_CrystalIntegralMax,
    battle_war_CrystalMaxExploit,
    battle_war_CrystalMaxExploitSubsidy,
    battle_war_CrystalMaxIntegral,
    battle_war_Guard,
    battle_war_GuardCoordinate,
    battle_war_GuardExploit,
    battle_war_GuardNum,
    battle_war_HighMapLine,
    battle_war_KillExploit,
    battle_war_KillMessage,
    battle_war_LowMapAegis,
    battle_war_LowMapLine,
    battle_war_MaxLinePlayer,
    battle_war_MaxMapLine,
    battle_war_MidMapForce,
    battle_war_MidMapLine,
    battle_war_MinMapForce,
    battle_war_Object,
    battle_war_ObjectCd,
    battle_war_ObjectExploit,
    battle_war_ObjectExploitSubsidy,
    battle_war_Ore,
    battle_war_OreMax,
    battle_war_RefreshTime,
    battle_war_RewardNo1,
    battle_war_RewardNo2,
    battle_war_RewardNo3,
    battle_war_RewardNo4,
    battle_war_RewardNo5,
    battle_war_WeekRewardNo1,
    battle_war_WeekRewardNo2,
    battle_war_WeekRewardNo3,
    battle_war_WeekRewardNo4,
    battle_war_WeekRewardNo5,
    battle_war_WeekRewardNo6,
    battle_war_WeekRewardNo7,
    bidding,
    blood_colour,
    blood_colourSingle,
    blueAffix,
    blueFactor,
    bribery_cost_max,
    bribery_cost_min,
    bribery_history,
    bribery_money_chs,
    bribery_money_cht,
    bribery_money_enu,
    bribery_money_jpn,
    bribery_money_kor,
    bribery_money_mljx,
    bribery_money_rus,
    bribery_money_tha,
    bribery_money_vietnam,
    bribery_money_xmt,
    bribery_num_max,
    bribery_num_min,
    broadcase_self_cd,
    broadcase_self_rank_sort,
    bubbleExpressionIntervalTime,
    buddy_fly,
    buddy_invite,
    buddyBonus1,
    buddyBonus2,
    buddyBonus3,
    candy_end_time,
    candy_start_time,
    candy_twice,
    cannon_cd,
    cannon_kill,
    cannon_xy,
    char_speed1,
    char_speed2,
    chat_cd_level,
    chat_cd1,
    chat_cd2,
    chat_counts,
    chat_level,
    chat_task,
    chatLimited_count,
    chatLimited_over,
    chatLimited_Reset,
    chatLimited_time,
    chatLimited_words,
    chuansongpet1id,
    ck_nq,
    coinHand_box,
    coinHand_cd,
    coinHand_freetime,
    coinHand_limit,
    coinHand_rate,
    combol_last,
    convoy_task_range_time,
    countdown,
    crystal_xy,
    dailyinterfacejjcopen,
    dailytask_levellimit,
    dailytask_number,
    dark_accumulate,
    dark_buy,
    dark_end,
    dark_level,
    dark_maximum,
    dark_monster,
    dark_player,
    dark_population,
    dark_price,
    dark_refresh,
    dark_start,
    dark_time,
    dark_times,
    darkcoinNum,
    darkkillNum,
    darkness_basicgift,
    darkness_bosscd,
    darkness_bossid,
    darkness_bosspoint,
    darkness_buff,
    darkness_gift,
    darkness_killnumber,
    darkness_monstervalue,
    darkness_open,
    darkness_rerank,
    dash_soundlimit,
    datask_dianumber,
    date_hide_actiontime,
    date_hide_refresh,
    date_hide_refreshnumber,
    date_hide_refreshtime,
    date_hide_score,
    date_hide_scoreMax,
    date_hide_transmittime,
    date_link_addScore,
    date_link_box,
    date_link_boxrefresh,
    date_link_buffID_addscore,
    date_link_buffID_addtime,
    date_link_buffID_multscore,
    date_link_buffID_speedUp,
    date_link_combina,
    date_link_combo_buff,
    date_link_count_reshuffle,
    date_link_debuffID_dizzy,
    date_link_debuffID_slowDown,
    date_link_distXY,
    date_link_gemNpcID,
    date_link_monsterID,
    date_link_posXY,
    date_link_power,
    date_link_randbuff,
    date_link_randBuffType,
    date_link_randDebuffType,
    date_link_scorelist,
    date_link_scoreMax,
    date_link_sizeXY,
    date_link_time_afterFristEnter,
    date_link_time_beforeFristEnter,
    date_link_time_combo,
    date_link_time_linkAdd,
    date_link_time_linkPower,
    date_link_time_reshuffle,
    date_link_time_settle,
    date_nbox_boxnpcid,
    date_nbox_boxscore,
    date_nbox_endpoint,
    date_nbox_instance,
    date_nbox_pointgroup,
    date_nbox_refresh,
    date_nbox_scoreMax,
    date_swimmingparty_addscorelist,
    date_swimmingparty_frequency,
    date_swimmingparty_pointgroup,
    date_swimmingparty_radius,
    date_swimmingparty_refresh,
    date_swimmingparty_scoreMax,
    day_night,
    day_night_interval,
    deadline,
    default_box,
    defendcity_boss,
    defendcity_chest,
    defendcity_chest_time,
    defendcity_kill_num,
    defendcity_level,
    defendcity_monster,
    distortion_big_and_small,
    divine_change,
    divine_cost,
    divine_diamondcd,
    divine_diamondlimit,
    divine_freediamondlimit,
    divine_freegoldlimit,
    divine_goldcd,
    divine_goldlimit,
    divine_pool_diamond,
    divine_pool_gold,
    divine_pool_high,
    divine_thenine,
    divine_winernumbers,
    drop_level,
    english_randomname,
    engsavefactor,
    equip_enchantmoney,
    equip_recheck_q,
    equipinten_worldtext_limit,
    equipRecastpropcast,
    equipRecastrunecast0,
    equipRecastrunecast1,
    equipRecastrunecast2,
    equipstar_worldtext_limit,
    escort_multiplayer_buf,
    escort_multiplayer_event,
    escort_multiplayer_item,
    escort_multiplayer_level,
    escort_multiplayer_num,
    escort_multiplayer_reward,
    escort_singleplayer_buf,
    escort_singleplayer_event,
    escort_singleplayer_item,
    escort_singleplayer_level,
    escort_singleplayer_monster,
    escort_singleplayer_num,
    escort_singleplayer_reward,
    evil_threshold,
    evilkill_effect,
    evilkill_level,
    exp_2_item_info,
    exp_autoget,
    exp_max,
    expfuben_revivedtime,
    expmaptime,
    fable_challengetime,
    fable_die,
    fable_number,
    fable_preparetime,
    fashion_fixtime,
    fashion_forever,
    fightall_attack,
    fightall_attacker,
    fightall_defend,
    fightall_defender,
    fightall_InjuryStatistics,
    fightall_lost,
    fightall_map_id,
    fightall_mirror_armor,
    fightall_mirror_atk,
    fightall_mirror_crit,
    fightall_mirror_critdamage,
    fightall_mirror_def,
    fightall_mirror_dodge,
    fightall_mirror_hit,
    fightall_mirror_HP,
    fightall_mirror_redef,
    fightall_mirror_toughness,
    fightall_open_count,
    fightall_open_level,
    fightall_statue,
    fightall_win,
    fightbossactivity,
    filed_exp_decline,
    first_buy_pet,
    firstbloodmonster,
    fistplanes,
    flowers,
    found_level,
    free_weddingitem_num,
    friend_action_point_every_gain,
    friend_avoid_harassment,
    friend_closeness_give_ap,
    friend_count_blacklist_max,
    friend_count_blacklist_threshold,
    friend_count_friendlist_max,
    friend_count_gain_ap_max,
    friend_count_give_ap_max,
    friend_count_mapmate,
    friend_count_teammate,
    friend_timelimit_query_mtb,
    friend_timelimit_query_r,
    friend2_add_applicant_count,
    friend2_add_applicant_life,
    friend2_add_applicant_page_count,
    friend2_add_applicant_sync_cd,
    friend2_add_cd,
    friend2_black_ban,
    friend2_black_count,
    friend2_black_page_count,
    friend2_black_silent,
    friend2_ChatWordLimit,
    friend2_ExpressionLimit,
    friend2_formal_closeness_count,
    friend2_formal_count,
    friend2_formal_gain_ap_count,
    friend2_formal_gain_ap_value,
    friend2_formal_give_ap_count,
    friend2_formal_like_count,
    friend2_formal_page_count,
    friend2_formal_sort,
    friend2_formal_sync_cd,
    friend2_formal_transmit_cd,
    friend2_ItemLimit,
    friend2_recommend_cd,
    friend2_recommend_count,
    friend2_recommend_filter,
    friend2_recommend_filter_count,
    friend2_search_cd,
    friend2_temp_count,
    friend2_temp_page_count,
    friend2_temp_sort,
    friend2_temp_sync_cd,
    friend2_Transmit,
    friendlinessFromRedEnvelopeLimit,
    friends_crossapplycd,
    friends_crossapplycount,
    friends_crosscount,
    friends_listconfine,
    friends_pushlevelmax,
    friends_pushnum,
    friends_pushtime,
    fs_nq,
    gem_equippart_color,
    gem_mixcost1,
    gem_mixcost2,
    gem_mixcost3,
    gem_mixcost4,
    gem_mixcost5,
    gem_mixcost6,
    gem_mixcost7,
    gem_mixcost8,
    gem_mixcost9,
    gem_value1,
    gem_value10,
    gem_value2,
    gem_value3,
    gem_value4,
    gem_value5,
    gem_value6,
    gem_value7,
    gem_value8,
    gem_value9,
    giveGiftLevel,
    giveGiftString,
    giveGiftVIP,
    global_in,
    goblin_first_lotterydraw,
    goblin_free_counts,
    goblin_once_gift,
    goblin_onceandten_money,
    goblin_ten_gift,
    goddess,
    goddess_lamb,
    goddess_textures,
    gold_exchange,
    greenAffix,
    greenFactor,
    gripSpeed,
    guaji_stay_time,
    guild_apply_cd,
    guild_apply_maxcount,
    guild_apply_pro,
    guild_battle_addpoint,
    guild_battle_applyminlvl,
    guild_battle_calcrange,
    guild_battle_reward1,
    guild_battle_reward2,
    guild_battle_reward3,
    guild_boss1,
    guild_boss2,
    guild_boss3,
    guild_boss4,
    guild_boss5,
    guild_cd,
    guild_cd_master,
    guild_contribute_max,
    guild_conversion_currency,
    guild_conversion_item,
    guild_createCost,
    guild_dia_onetime,
    guild_diamax_day,
    guild_exchange_limit,
    guild_exp_add,
    guild_fairground_free,
    guild_godbless_limit,
    guild_godbless_param,
    guild_gold_onetime,
    guild_goldmax_day,
    guild_gx_add,
    guild_impeach_activitytime,
    guild_impeach_money,
    guild_impeach_num,
    guild_impeach_offline,
    guild_join_level,
    guild_member_latelylogintime,
    guild_modifyname,
    guild_name_max_length,
    guild_overskill,
    guild_request_notice_cd,
    guild_request_time,
    guild_scene,
    guild_selecttime,
    guild_shop_conver,
    guild_shop_level_ID,
    guild_shop_limit,
    guild_snowman_contribute,
    guild_snowman_exp,
    guild_snowman_gift,
    guild_snowman_npcID,
    guild_snowman_settle,
    guild_suppliesAll,
    guild_suppliesOwn,
    guild_sw_add,
    guild_wish_confine,
    guildbattleapplyres,
    guildbattleBaseConfig,
    guildbattlecollectids,
    guildbattleDefendBoss,
    guildbattlerevivepos,
    guildbattleReward,
    guildhome_guild,
    guildhome_homexy,
    guildhome_monsternum,
    guildhome_monstertime,
    guildhome_monsterxy,
    guildhome_ourxy,
    guildhome_task1,
    guildhome_task2,
    guildhome_taskcd,
    guildhome_taskmax,
    guildhome_tasktime,
    hero_time,
    hero_trigger1,
    hero_trigger2,
    hit_base,
    hitaway_range,
    hitaway_spdown,
    hitaway_speed,
    hitaway_var,
    home_namefix,
    honor_open,
    horn_diamond,
    horn_item,
    horn_level,
    horn_num,
    horn_seetime,
    horn_words,
    identity_age_limit,
    identity_pic_count,
    identity_sign_count,
    identity_tag_count,
    instance_level,
    integral,
    intensify_lv0,
    intensify_lv1,
    intensify_lv10,
    intensify_lv11,
    intensify_lv12,
    intensify_lv13,
    intensify_lv14,
    intensify_lv15,
    intensify_lv16,
    intensify_lv17,
    intensify_lv18,
    intensify_lv19,
    intensify_lv2,
    intensify_lv20,
    intensify_lv3,
    intensify_lv4,
    intensify_lv5,
    intensify_lv6,
    intensify_lv7,
    intensify_lv8,
    intensify_lv9,
    jjc_1v1_freetimes,
    jjc_1v1_rewardtime,
    jjc_attack,
    jjc_defend,
    jjc_item,
    jjc_lose,
    jjc_money,
    jjc_objectdirection,
    jjc_open,
    jjc_plus,
    jjc_time,
    jjc_win,
    jjc_worship,
    jjs_createreward,
    jjs_nq,
    killing_broadcast,
    killing_cost,
    killing_die,
    killing_firstvalue,
    killing_punishment,
    killing_punishmentbuff,
    killing_time,
    killing_value,
    king_battle_award_rank_number,
    king_battle_defender_item_info,
    king_battle_rank_item_info,
    kingBattleRepairMirrorCfg,
    kmaxchar,
    kmaxchar_enu,
    kmaxchar_private,
    kmaxchar_private_enu,
    kmaxhistorymsg,
    kmaxinsertitems,
    kmaxmsg,
    knightcd,
    knightcost,
    knightrange,
    koreangift_coin,
    ladder1v1FistBattleAward,
    league_gift_1,
    league_gift_2,
    league_gift_3,
    league_kill,
    league_lost1,
    league_lost2,
    league_reborn,
    league_win1,
    league_win2,
    liehen_reduce,
    llc_nq,
    llcs_nq,
    loading_image_x,
    lotteryForTowerShow,
    luckydraw_odds,
    magecd,
    magecost,
    magerange,
    mail_content_max_length_chs,
    mail_content_max_length_enu,
    main_city,
    main_map_id,
    map_convey,
    marriage_BreakCost,
    marriage_ClosenessLimitEveryday,
    marriage_ferescale,
    marriage_FriendlinessDownWithoutTeam,
    marriage_FriendlinessDownWithTeam,
    marriage_FriendlinessLimit,
    marriage_iscouplesame,
    marriage_KillMonsterGetCloseness,
    marriage_RingItemList,
    marriage_task_number,
    marriage_taskFidlist,
    marriage_TimeOut,
    materialCopyMapID,
    max1Chance,
    maxDamage,
    maxenchance,
    maxgridcellnum,
    maxreborn,
    mechaniccd,
    mechaniccost,
    mechanicrange,
    minDamage,
    mirroring,
    mirroring_minHp,
    mirroring_restore,
    mirroring_weak,
    mn_nq,
    moneyDungeon_StartPoint,
    moneyDungeon_StartPointPlayer,
    moneyDungeon_time_kill,
    moneyDungeon_time_monster,
    moneyDungeon_time_ready,
    moneyDungeon_time_settle,
    moneyDungeon_time_spawn,
    moneyDungeon_time_turn,
    monsterbox_cooldown,
    mount_level_per_rank,
    mount_up_distance,
    mountfood,
    mountsta,
    mountup_min_level,
    need_equiplv,
    needForSpeedAthleteMaxNumber,
    needForSpeedcameracontrol,
    needForSpeedcheckboxradius,
    needForSpeedcheckwaypointradius,
    needForSpeedCompetitionBegin2EndTime,
    needForSpeedCompetitionCountDownSec,
    needForSpeedCompetitionReadyBeginCountDownSec,
    needForSpeedCompetitionReadyEndCountDownSec,
    needForSpeedCompetitionrewardmax,
    needForSpeedMapInfo,
    needForSpeedMatchCountDownSec,
    needForSpeedmatchopen,
    needForSpeedMaxCircle,
    needForSpeedWinCountDownSec,
    newplayeritem,
    newplayerworldLevel,
    newyeargameID,
    newyeargametime,
    newyearminlevel,
    normal_sellnum,
    normalcameracontrol,
    nPC_Shop_ID,
    npc_soundplay_time,
    npc_soundrange_load,
    npc_soundrange_play,
    offline_exptime,
    offlineexp_openlevel,
    openTabLevel,
    orangeFactor,
    oraRed1Affix,
    oraRed2Affix,
    oraRed3Affix,
    oraRed4Affix,
    oraRed5Affix,
    oraRed6Affix,
    order_sellnum,
    partner_timeol,
    passiveSkill,
    percentage_agent,
    percentage_agent_openlevel,
    pet_atkshow,
    pet_equipment,
    pet_name,
    pet_recycle_cost,
    pet_recycle_open,
    pet_skill,
    pet_stronger,
    pet_warspeed,
    petAssist,
    petbattledef,
    petbattleequip,
    petbreak_reborn,
    petbreak_star,
    petEnh0,
    petEnh1,
    petEnh10,
    petEnh2,
    petEnh3,
    petEnh4,
    petEnh5,
    petEnh6,
    petEnh7,
    petEnh8,
    petEnh9,
    petEquipFactorA,
    petEquipFactorB,
    petleader_for_lord,
    petMaxAssist,
    petmoon,
    petpvp_cd,
    petpvp_duringTime,
    petpvp_money,
    petpvp_pro,
    petpvp_rank,
    petpvp_refresh,
    petpvp_time,
    petpvp_token,
    petpvp_win,
    petQuality0,
    petQuality1,
    petQuality2,
    petQuality3,
    petQuality4,
    petReBorn0,
    petReBorn1,
    petReBorn10,
    petReBorn2,
    petReBorn3,
    petReBorn4,
    petReBorn5,
    petReBorn6,
    petReBorn7,
    petReBorn8,
    petReBorn9,
    petskillpw_blue,
    petskillpw_green,
    petskillpw_orange,
    petskillpw_purple,
    petskillpw_red,
    petskillpw_white,
    petskillroll,
    petstronger_num,
    petsun,
    petTerritory_battleCD,
    petTerritory_cleanCD_data,
    petTerritory_cleanCD_history,
    petTerritory_count,
    petTerritory_plunderCD,
    petTerritory_plunderRate,
    petTerritory_posPetsD,
    petTerritory_posPetsP,
    petTerritory_sameCD,
    petTerritory_searchCD,
    petTerritory_timeReady,
    petTerritory_timeSettle,
    petTerritory_vigorCost,
    petTerritory_vigorMax,
    petTerritory_vigorRecover,
    petwar_add,
    petwar_addgold,
    petwar_replystrength,
    petwar_stargift,
    pk_forbidden_end,
    pk_forbidden_start,
    pk_time,
    plant_clearpestis,
    plant_composttimes,
    plant_heathStatus,
    plant_helpbonus,
    plant_helptimes,
    plant_watering,
    player_action_point_max,
    player_action_point_reset_max,
    player_atksound,
    player_hitsound,
    player_maxlevel,
    playertof,
    pre_recharge,
    propToDam,
    purpleAffix,
    purpleFactor,
    push_buylevel,
    qa_prepare_time,
    qa_time,
    qixi_show_end_time,
    qixi_show_start_time,
    qixi_showVFX_position,
    qs_nq,
    question_gift_n1,
    question_num,
    question_quantity,
    question_time,
    race_apply_map,
    race_invincible,
    race_laps,
    race_mod,
    race_pos,
    race_rewardA,
    race_rewardB,
    race_time_wait,
    randomshop_Diamonds,
    randomshop_limit,
    ranklevel_limit,
    real_drop,
    redEnvelope_FriendRemainTime,
    redEnvelope_LevelLimit,
    redEnvelope_PacketAmountMax,
    redEnvelope_PacketAmountMin,
    redEnvelope_PacketMax,
    redEnvelope_PacketMin,
    redEnvelope_WorldAnnouncementAmount,
    redEnvelope_WorldReceiveAmount,
    redEnvelope_WorldRemainTime,
    redFactor,
    refush,
    relive_cost,
    relive_cost_hp,
    relive_hp,
    relive_time,
    repelSpeed,
    report,
    resetPosToRevivePtCDTime,
    resurrection,
    resurrection_tozero,
    rift_cd,
    ring_item,
    robbery_item,
    robbery_player_buf,
    robbery_player_level,
    robbery_player_num,
    robbery_revive_item,
    robbery_revive_site,
    rollspeed,
    rune_boardcast,
    rune_maxsmelt,
    rune_openlv_mount,
    rune_openlv_player,
    rune_regain,
    rune_weightfornum,
    rune_weightforpro,
    runecolor,
    runecolorchange,
    search_radius,
    selfChance,
    sellcost12,
    sellcost24,
    sellcost48,
    selloff,
    selltax,
    sen_time1,
    sen_time2,
    server_list_area_sort_type,
    server_list_sort_type,
    shieldeledr,
    shieldholydr,
    shieldphydr,
    shieldshadowdr,
    shilianjiangli,
    shop_time,
    signInCost,
    sixwar_assistspoint,
    sixwar_banner,
    sixwar_bannerABC,
    sixwar_bannerPresent,
    sixwar_buffid,
    sixwar_buffob,
    sixwar_holdpoint,
    sixwar_holdtime,
    sixwar_killpoint,
    sixwar_mapid,
    sixwar_mapmax,
    sixwar_maxkillnum,
    sixwar_monster_cd,
    sixwar_npcid,
    sixwar_npcxy,
    sixwar_ratetime,
    sixwar_relive,
    sixwar_reward_base,
    sixwar_reward_basegift,
    sixwar_reward_crowd,
    sixwar_reward_elite,
    sixwar_reward_head,
    sixwar_reward_item,
    sixwar_tocd,
    sixwar_uiaotocd,
    skillpoints_reset,
    sl_open,
    snowman_notice,
    soulactivity_skillopposite,
    specialinstancehealth,
    specialinstancemoney,
    specialinstancestartmoney,
    specialinstancewaypoint,
    spiritArea_TimeAll,
    spiritArea_TimeReady,
    spiritArea_TimeWait,
    square_dancing_1,
    square_dancing_2,
    square_dancing_3,
    square_dancing_4,
    square_dancing_5,
    square_dancing_6,
    square_dancing_7,
    starmoonbox_cost,
    starmoonbox_model,
    startmap,
    sweep_level,
    sweeplv,
    talentOpenPlayerLevelLimit,
    tasktype_11,
    tasktype_12,
    tasktype_13,
    tasktype_14,
    tasktype_15,
    tasktype_16,
    tasktype_17,
    tasktype_18,
    tasktype_19,
    team_bonus_familys,
    team_bonus_friends,
    team_buff_familys,
    team_buff_friends,
    teamExpFactor,
    teamtalk_interval,
    teamtalklv,
    temporary_pet_taskid,
    timemount_power,
    trans_add,
    trans_modelscale,
    trans_shake_add,
    trans_shake_id,
    transfiguration,
    transform,
    transform_normal,
    transformopenfirstdesc,
    transformopenid,
    transformopenlevel,
    treasure_free_counts,
    treasure_once_gift,
    treasure_onceandten_money,
    treasure_ten_gift,
    turn_speed,
    updategift_1,
    updategift_2,
    updategift_3,
    vip_sellnum,
    viporder_sellnum,
    voice_anchorname,
    voicechat_cd,
    wedding_couple_type_ff,
    wedding_couple_type_mf,
    wedding_couple_type_mm,
    wedding_divorce_cost,
    wedding_divorce_lvdown,
    wedding_divorce_time,
    wedding_level_limit,
    wedding_num,
    wedding_order_time_min,
    wedding_teleportation_cooldown,
    whiteFactor,
    wildboss_times,
    wildboss_times_lucky,
    wildboss_times_must,
    wildpk_openlevel,
    wing_interval,
    wing_open_level,
    wing_regeneratio,
    world_guardian_one,
    worldlevel_base,
    worldlevel_exp,
    worldlevel_num,
    zoo_food2bonnus
    ].

