%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2017, ranink
%%% @doc
%%% 跨服骑宠竞速_内部定义
%%% @end
%%% Created : 20170707
%%%-------------------------------------------------------------------
-author("meitianyang").

-ifndef(Hrl_cacRacePrivate__hrl___).
-define(Hrl_cacRacePrivate__hrl___, 1).

-include("../../activity/activityPrivate.hrl").
-include("cfg_race_item.hrl").

%%%-------------------------------------------------------------------
% 活动阶段
-define(ActivityPhase_Apply, 	1).	%% 阶段1：报名
-define(ActivityPhase_Race, 	2).	%% 阶段2：比赛

%%%-------------------------------------------------------------------
% 子玩法模式
-define(SubType_BEGIN,			0).
-define(SubType_Normal,			0).	%% 普通模式
-define(SubType_ItemDouble,		1).	%% 双倍道具
-define(SubType_ItemEx,			2).	%% 强化道具
-define(SubType_SpeedUp,		3).	%% 加速模式
-define(SubType_Chaotic,		4).	%% 混乱模式
-define(SubType_END,			4).

%%%-------------------------------------------------------------------
% 专有采集物object.id=12
% 类型说明object.param1
-define(OBT_BEGIN,			0).
-define(OBT_None,			0).		%% 没有
-define(OBT_Milestone,		1).		%% 采集物：里程碑，触发特殊事件刷新名次
-define(OBT_SpeedUp,		2).		%% 采集物：加速带，触发获得BUFF
-define(OBT_SpeedDown,		3).		%% 采集物：减速陷阱，触发获得BUFF
-define(OBT_SpeedUpEx,		4).		%% 采集物：加速带（强化道具模式2下的加强型加速带，触发获得BUFF
-define(OBT_SpeedDownEx,	5).		%% 采集物：减速陷阱（强化道具模式2下的加强型减速陷阱，触发获得BUFF
-define(OBT_ItemBox,		6).		%% 采集物：道具箱，触发特殊事件获得虚拟道具
-define(OBT_END,			6).

%%%-------------------------------------------------------------------
% 虚拟道具类型 Virtual item type
-define(VIT_BEGIN,			0).
-define(VIT_None,			0).		%% 没有
-define(VIT_SelfTeam,		1).		%% 对自己及队友使用
-define(VIT_AroundEnemy,	2).		%% 对周围敌方使用
-define(VIT_FirstEnemy,		3).		%% 对第一名使用（如果是自己则仅消耗道具没有效果
-define(VIT_CreateGather,	4).		%% 创建采集物
-define(VIT_CreateCarrier,	5).		%% 创建载体
-define(VIT_END,			5).

%%%-------------------------------------------------------------------
% 写死的时间数值
-define(TickTime,	1000).	%% 单位毫秒（心跳最小为1秒
-define(WaitTime,	30).	%% 单位秒（创建地图等待时间
-define(KickTime,	5000).	%% 单位毫秒（角色放弃后，延时踢出相关角色

%%%-------------------------------------------------------------------
% 地图状态
-define(State_BEGIN,	0).
-define(State_Creating,	0).		%% 创建地图
-define(State_Ready,	1).		%% 准备倒计时
-define(State_Race,		2).		%% 比赛中
-define(State_Wait,		3).		%% 第一名产生
-define(State_Settle,	4).		%% 结算倒计时
-define(State_END,		4).
-type state() :: ?State_BEGIN .. ?State_END.
-record(recRace, {
	id			= 0					:: uint(),					%% 自增ID，由进程自增维护，用于创建地图时作为键值便于查询
	mapPid		= undefined			:: pid() | undefined,		%% 地图进程ID
	state		= ?State_Creating	:: state(),					%% 地图状态
	teams		= []				:: [#pk_RaceTeamEx{}, ...],	%% 参赛组
	time		= 0					:: uint32(),				%% 本状态剩余时间（秒）

	%% 地图常用ETS，先存到起，不用也没啥消耗
	playerEts	= undefined			:: etsTab() | undefined,	%% 角色ETS
	monsterEts	= undefined			:: etsTab() | undefined,	%% 怪物ETS
	collectEts	= undefined			:: etsTab() | undefined,	%% 采集物ETS
	npcEts		= undefined			:: etsTab() | undefined		%% NPC ETS
}).
-define(EtsMapInfo, recRace).

%%%-------------------------------------------------------------------
% 弃赛原因，用于文件日志避免纠纷
-define(GiveUpReason_BEGIN,		0).
-define(GiveUpReason_NotEnter,	0).	%% 没有入场，被除名
-define(GiveUpReason_LeaveMap,	1).	%% 离开地图
-define(GiveUpReason_Offline,	2).	%% 掉线
-define(GiveUpReason_Dismount,	3).	%% 下马
-define(GiveUpReason_END,		3).

-endif.	%% Hrl_cacRacePrivate__hrl___
