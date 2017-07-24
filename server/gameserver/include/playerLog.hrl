%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <公司>
%%% @doc
%%%
%%% @end
%%% Created : 02. 七月 2015 14:40
%%%-------------------------------------------------------------------

-author("tiancheng").

-ifndef(playerLog_hrl).
-define(playerLog_hrl,1).

-define(AddCoin, 0).  	%%增加
-define(DelCoin, 1).	%%减少

-record(recPLogTSMoney,
{
	target = 0,
	source = 0,
	reason = 0,
	param = 0
}).

-record(recPLogTSItem,
{
	old = 0,
	new = 0,
	change = 0,
	target = 0,
	source = 0,
	changReason = 0,
	reasonParam = 0,
	gold = 0,
	goldtype = 0
}).

% 玩家自身
-define(PLogTS_PlayerSelf, 1).
% 灵魂伙伴系统
-define(PLogTS_CompanionSystem, 2).
% 装备重铸
-define(PLogTS_EquipRecast, 3).
% 装备荣誉成长
-define(PLogTS_EquipHonor, 4).
% 装备分解
-define(PLogTS_EquipResolve, 5).
% 购买时装
-define(PLogTS_Fashion, 6).
% 成就系统
-define(PLogTS_AchieveSystem, 7).
% 普通副本奖励
-define(PLogTS_CopyMapReward, 8).
% 时空裂痕奖励
-define(PLogTS_RiftReward, 9).
% gm系统
-define(PLogTS_GMSystem, 10).
% 军团
-define(PLogTS_Guild, 11).
% 使用道具获得
-define(PLogTS_UseItem, 12).
% 扫荡
-define(PLogTS_Sweep, 13).
% 邮件
-define(PLogTS_Mail, 14).
% 商城
-define(PLogTS_Mall, 15).
% 活动-混沌战场
-define(PLogTS_Activity_HD, 16).
% 道具系统
-define(PLogTS_Item, 17).
% 冲值系统
-define(PLogTS_Recharge, 18).
% 商店系统
-define(PLogTS_Shop, 19).
% 任务系统
-define(PLogTS_Task, 20).
% 交易行系统
-define(PLogTS_Trade, 21).
% 觉醒系统
-define(PLogTS_GradeWake, 22).
% 铁血硬币
-define(PLogTS_Warrior, 23).
% 宝石系统
-define(PLogTS_GemEmbed, 24).
% 系统(初始化，给东西，某某之类的)
-define(PLogTS_System, 25).
% 物品掉落
-define(PLogTS_DropItem, 26).
% 资源兑换
-define(PLogTS_ResourceExchange, 27).
% 激活码
-define(PLogTS_ActiveCode, 28).
% 内部购买流程
-define(PLogTS_Buy4System, 29).
% 幸运币
-define(PLogTS_Luckcoin, 30).
% 活动-boss战
-define(PLogTS_Activity_Boss, 31).
% 排行榜
-define(PLogTS_Rank, 32).
% 签到
-define(PLogTS_SignIn, 33).
% vip 爵位
-define(PLogTS_Vip, 34).
% vip 藏宝图
-define(PLogTS_Treasure, 35).
% 宠物
-define(PLogTS_Pet, 36).
% 神秘商店
-define(PLogTS_MSShop, 37).
% 运营活动掉落
-define(PLogTS_OperateAc, 38).
%离线经验
-define(PLogTS_OfflineExp, 39).
%天梯1v1
-define(PLogTS_Ladder1v1, 40).
%小喇叭
-define(PLogTS_ConvenientBuy, 41).
%%更新资源
-define(PLogTS_UpdateResource, 42).
%%神器
-define(PLogTS_GodWeapon, 43).
%%王者战天下
-define(PLogTS_Item4KingBattleAll, 44).
%%玩家答题
-define(PLogTS_AnswerReward, 45).
%%运营兑换
-define(PLogTS_OperateExchange,46).
%%护送
-define(PLogTS_Escort, 47).
%%宠物远征
-define(PLogTS_PetPve, 48).
%%装备升星
-define(PLogTS_EquipUpStar, 49).
%%占卜
-define(PLogTS_Lottery, 50).
%%宠物争夺战
-define(PLogTS_PetPvp, 51).
%%黑暗之地
-define(PLogTS_Darkness, 52).
%%玩家红名
-define(PLogTS_RedName, 53).

%%活跃度
-define(PLogTS_Liveness,54).

%%玩家翅膀
-define(PLogTS_Wing, 55).

%%装备合成
-define(PLogTS_EqupmentCombin, 56).

%%日本评分后的奖励
-define(PLogTS_AwardGiveMark, 57).
%%军团驻地
-define(PLogTS_GuildHome, 58).

%%韩国扣回钻石、物品
-define(PLogTS_Revoke, 59).

%限时推送
-define(PLogTS_LimitSales,60).

%%成长礼包
-define(PLogTS_GrowUpForKorea,61).

%%平台直购
-define(PLogTS_BuyItem,62).

%%签到系统
-define(PLogTS_DailySignIn,63).

% 等级礼包
-define(PLogTS_PlayerLevelReward, 64).

% 玩家技能升级
-define(PLogTS_PlayerSkill, 65).

%%在线奖励
-define(PLogTS_OnlineReward, 66).

%% 资源找回
-define(PLogTS_FindRes, 67).

%%七日狂欢
-define(PLogTS_SevenDays, 68).

% 金宝塔
-define(PLogTS_LotteryForTower, 69).

% 符文熔炼
-define(PLogTS_RuneMelt, 70).
% 符文洗炼
-define(PLogTS_RuneCast, 71).
% 符文合成
-define(PLogTS_RuneCompound, 72).
% 职业奖励
-define(PLogTS_CareerReward, 73).
% 红包
-define(PLogTS_RedEnvelope, 74).

% 姻缘系统
-define(PLogTS_Marriage, 75).

% 宝藏(抽奖)系统
-define(PLogTS_LotterySys, 76).
% 乱世为王系统
-define(PLogTS_LSBattleField, 77).
%% 军团战
-define(PLogTS_GuildBattle, 78).
%% 灵界活动
-define(PLogTS_SpiritArea, 79).
%% 新版骑宠领地
-define(PLogTS_PetTerritory, 80).
%% 购买副本次数
-define(PLogTS_BuyActionCount, 81).
%% 雪人活动
-define(PLogTS_Snow, 82).
%% 七日目标
-define(PLogTS_SevenDayAim, 83).
%% 30日登录大奖
-define(PLogTS_ThirtyDayLoginGift, 84).

%% 点金手
-define(PLogTS_MoneyTree, 85).

%% 星月秘盒
-define(PLogTS_StarMoon, 86).

%% 赠礼
-define(PLogTS_GiveGift, 87).

%% 家族系统-碎片祈福
-define(PLogTS_GuildSupplication, 88).

%% 家园
-define(PLogTS_Home, 89).

%% 怪物图鉴
-define(PLogTS_MonsterBook, 90).


-endif.