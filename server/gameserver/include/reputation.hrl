%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 爵位系统定义
%%% @end
%%% Created : 20. 一月 2015 14:14
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(Reputation_hrl).
-define(Reputation_hrl, 1).

%% 特权定义(需要与vip_power.erl配置表powerid对应)
-define(Reputation_Start,			1).
-define(Reputation_Transfer,		1).		%% 千里之行
-define(Reputation_Shop,			2).		%% 商会证明
-define(Reputation_Decompose,		3).		%% 分解获利
-define(Reputation_CopyMapDouCoin,	4).		%% 双倍结算
-define(Reputation_RankReward,		5).		%% 天之俸禄
-define(Reputation_DropLuckly,		6).		%% 猎手凭证
-define(Reputation_Money,			7).		%% 富可敌国
-define(Reputation_Activity,		8).		%% 宝留万年
-define(Reputation_KillMonster,		9).		%% 千里叠云
-define(Reputation_MonutSpeed,		10).	%% 快马加鞭
-define(Reputation_CopyMapDouExp,	11).	%% 副本双倍经验
-define(Reputation_BattleWar,		12).	%% 百战不殆
-define(Reputation_TradeSellItem,	13).	%% 交易行上架个数（未使用爵位实现，占坑）
-define(Reputation_TradePrivateNum,	14).	%% 交易行指定交易人数（未使用爵位实现，占坑）
-define(Reputation_BuyYZItemNum,	15).	%% 额外增加购买宠物远征卷的次数
-define(Reputation_ChatCDTime,      16).    %% 最短聊天间隔
-define(Reputation_JumpPetBattle,   17).    %% 直接跳过宠物远征战斗过程
-define(Reputation_BuyLadderNum,    18).    %% 购买更多的竞技场次数
-define(Reputation_SpecificFaceS,	19).    %% 获得特有静态表情
-define(Reputation_SpecificFaceD,	20).    %% 获得特有动态表情
-define(Reputation_VipBuff,			21).    %% 专属BUFF
-define(Reputation_PetTerritory,	22).    %% 新版骑宠领地-额外提供领地数量
-define(Reputation_End,				22).
-type reputation() :: ?Reputation_Start .. ?Reputation_End.

%% 最大爵位声望值
-define(MaxReputation, 999999999).
%% 最大爵位等级
-define(VipMaxLevel,16).
%% 最小爵位等级
-define(VipMinLevel,0).

%% 特权执行事件(需要与vip_power.erl配置表powerType对应)
-define(RepEvent_CDTime, 1).		%% 1.飞行cd降低百分之多少
-define(RepEvent_BuyItem, 2).		%% 2.购买商店道具的费用降低百分之多少
-define(RepEvent_DecomposeItem, 3).	%% 3.分解获得精华加成
-define(RepEvent_CopyMapCoin, 4).	%% 4.通过副本结算获得金币增加百分之多少
-define(RepEvent_Luckly, 5).		%% 5.增加幸运值（具体值）
-define(RepEvent_CMTimes, 6).		%% 6.可额外进入副本；
-define(RepEvent_MonterExp, 7).		%% 7.打怪经验增加百分之多少；
-define(RepEvent_Mount, 8).			%% 8.坐骑状态下移动速度提升百分之多少；
-define(RepEvent_CopyMapExp, 9).	%% 9.副本结算奖励时，经验增加百分之多少
-define(RepEvent_Honor, 10).		%% 10.获取威望速度提升百分之多少；
-define(RepEvent_ChatCDTime, 12).   %% 12.Vip聊天CD减少
-define(RepEvent_BuyLadderNum, 13). %% 13.购买更多的竞技场次数

-endif. %% Reputation_hrl