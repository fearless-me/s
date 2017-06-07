%%%-------------------------------------------------------------------
%%% @author snail
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%% 活动相关定义
%%% @end
%%% Created : 29. 十二月 2014 16:56
%%%-------------------------------------------------------------------
-author("snail").

-ifndef(ActivityDef_hrl).
-define(ActivityDef_hrl, 1).

-include("setting.hrl").
-include("cfg_activity.hrl").

%% 活动类型定义
-define(ActivityType_Start, 1).
-define(ActivityType_HDBattle, 1).				%% 混沌战场
-define(ActivityType_CityMonster, 2).			%% 主城刷怪
-define(ActivityType_GiveIPad, 3).				%% 首领入侵
-define(ActivityType_GuildBattle, 4).           %% 军团战
-define(ActivityType_KingBattleAll, 5).         %% 王者战天下
-define(ActivityType_AnswerPlay, 6).            %% 幸运选择题
-define(ActivityType_EscortGoods, 7).           %% 护送玩法
-define(ActivityType_Darkness, 8).              %% 黑暗之地
-define(ActivityType_PetBattle,9).              %% 骑宠争夺战
-define(ActivityType_GuildWar,10).             %% 军团争霸赛
%% 跨服战场
%% 血腥角斗
-define(ActivityType_GuildExpedition,13).       %% 军团沙盘PVP

%%-define(ActivityType_WeddingSite,14).       %% 姻缘_婚礼现场（废弃，替换为约会地下城）
-define(ActivityType_Date,14).       %% 约会地下城

-define(ActivityType_LSBattleField,15).       %% 乱世为王
-define(ActivityType_NeedForSpeed,16).       %% 港口竞速
-define(ActivityType_MoneyDungeon,17).       %% 金币副本（惊天喵盗团）
-define(ActivityType_Material,18).       %% 材料副本
-define(ActivityType_Snowman,19).       %% 堆雪人
-define(ActivityType_SpiritArea,20).       %% 灵界活动
-define(ActivityType_PetTerritory,21).       %% 新版骑宠领地
-define(ActivityType_End, 21).
-type activityType() :: ?ActivityType_Start .. ?ActivityType_End.

%% 全局变量控制活动开启与关闭(该占位未设置值，表示活动开启)，每个全局开关，控制32种活动的开启与关闭
%% {全局开关宏, [{所占第几位bit，控制的活动ID},...]},
-define(ActivitySwitchList, [
	{
		?Setting_GlobalVar_Activity_Switch_1,
		[
			{1, ?ActivityType_HDBattle},
			{2, ?ActivityType_CityMonster},
			{3, ?ActivityType_GiveIPad},
			{4, ?ActivityType_GuildBattle},
			{5, ?ActivityType_KingBattleAll},
			{6, ?ActivityType_AnswerPlay},
			{7, ?ActivityType_EscortGoods},
			{8, ?ActivityType_Darkness},
			{9, ?ActivityType_PetBattle},
			{10, ?ActivityType_GuildWar},
			{13, ?ActivityType_GuildExpedition},
			{14, ?ActivityType_Date},
			{19, ?ActivityType_Snowman},
			{20, ?ActivityType_SpiritArea},
			{21, ?ActivityType_PetTerritory}
		]
	}
]).

%% 活动周期
-define(ActivityCycle_Start, 0).
-define(ActivityCycle_Close, 0).	% 关闭的活动
-define(ActivityCycle_Hour, 1).		% 小时
-define(ActivityCycle_Day, 2).		% 天
-define(ActivityCycle_Week, 3).		% 周
-define(ActivityCycle_Month, 4).	% 月
-define(ActivityCycle_Other, 5).	% 指定范围
-define(ActivityCycle_Forever, 6).	% 永久活动-忽略活动自身定时器
-define(ActivityCycle_End, 6).
-type activityCycle()::?ActivityCycle_Start .. ?ActivityCycle_End.

%% 活动状态
-define(ActivityPhase_Close, 0).	% 关闭状态，大于0表示开启状态

%% 活动地图的消息类型
-define(ACMapMsg_CreateMap, 1).			% 创建地图
-define(ACMapMsg_DestoryMap, 2).		% 销毁地图
-define(ACMapMsg_HurtMonster, 3).		% 伤害怪物
-define(ACMapMsg_KillMonster, 4).		% 击杀怪物
-define(ACMapMsg_PlayerEnter, 5).		% 玩家进入活动地图
-define(ACMapMsg_PlayerLeave, 6).		% 玩家离开活动地图
-define(ACMapMsg_KillPlayer, 7).		% 击杀玩家
-define(ACMapMsg_Offline, 8).				% 玩家离线
%% 活动刷对象的主类型
-define(ConfChaos_HDBattle, 1).		% 混沌战场
-define(ConfChaos_CityMonster, 2).	% 守卫碧空城
-define(ConfChaos_GuildHome, 3).	% 军团驻地守卫
-define(ConfChaos_GuildBattle, 4).	% 军团军团战

%% 动态刷的对象类型
-define(HDBattle_Type_Normal, 0).
-define(HDBattle_Type_Monster, 1).
-define(HDBattle_Type_Boss, 2).
-define(HDBattle_Type_Elite, 3).
-define(HDBattle_Type_Collect, 4).

%% 混沌战场的地图ID
-define(HDBattleMapID, 4000).
%% pve 竞技场天梯1v1比赛地图ID
-define(Ladder1v1MapID, 184).
%%护送玩法地图ID
-define(EscortMapID, 6001).
%%黑暗之地准备间地图ID
-define(DarknessPrepareMapID, 6010).
%%军团争霸比赛地图
-define(GuildWarMapID, 4010).
%% 家族系统-游乐场-地图ID
-define(GuildFairgroundMapID, 7001).
%% 家族系统-堆雪人活动-地图ID
-define(GuildSnowmanMapID, 7000).
%% 灵界活动
-define(SpiritAreaMapID, 550).
%% 灵界活动
-define(PetTerritoryMapID, 6000).
%%跨服战斗地图
-define(CrosHdBattleMapID, 6016).

%%跨服竞技场地图
-define(CrosArenaMapID1, 6018).
-define(CrosArenaMapID2, 6019).
-define(CrosArenaMapID3, 6020).
%%跨服竞技场地图
-define(CrosArenaMapIDList, [6018,6019,6020]).
%%港口竞速地图id
-define(NeedForSpeedMapID, 9001).
%%首领入侵地图id
-define(WorldBossMapID, 22).

%%王者战天下
-define(KingFightAllMapID, globalCfg:getGlobalCfg(fightall_map_id) ).

-define(GetActivityMapID(ActivityID), case getCfg:getCfgByKey(cfg_activity, ActivityID) of
										  #activityCfg{mapidlist = [MapID]} -> MapID;
										  _ -> 0
									  end).



-endif. %% ActivityDef_hrl