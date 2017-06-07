%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20170303
%%%-------------------------------------------------------------------
-author("meitianyang").
-ifndef(Hrl_acPetTerritoryPrivate__hrl___).
-define(Hrl_acPetTerritoryPrivate__hrl___, 1).

-include("gsInc.hrl").
-include("activityDef.hrl").
-include("../activityPhaseDefine.hrl").

%%%-------------------------------------------------------------------
%% 内存中标记领地的搜索归属权，搜索保护时间内有效
-record(recSearchOwner, {
	key		= {0, 0}	:: {uint64(), uint32()},	%% {目标角色ID, 目标领地ID}
	ownerID	= 0			:: uint64()					%% 归属者角色ID
}).
-define(EtsSearchOwner, ets_recSearchOwner).

%%%-------------------------------------------------------------------
%% 内存中记录最近搜索到的领地，短时间内无法对同一领地再次搜索
-record(recSearchHistory, {
	roleID	= 0		:: uint64(),								%% 搜索者角色ID
	history	= []	:: [{{uint64(), uint32()}, uint32()}, ...]	%% [{{目标角色ID, 目标领地ID}, 搜索时间}, ...]
}).
-define(EtsSearchHistory, ets_recSearchHistory).

%%%-------------------------------------------------------------------
%% 内存中记录已开始的战斗（需要创建地图）
-define(BattleMapState_Begin,		0).
-define(BattleMapState_Creating,	0).	%% 正在创建地图
-define(BattleMapState_Wait,		1).	%% 等待角色进入
-define(BattleMapState_Ready,		2).	%% 战斗前等待
-define(BattleMapState_Fighting,	3).	%% 战斗
-define(BattleMapState_Settle,		4).	%% 结算等待
-define(BattleMapState_End,			4).
-type type_BMS() :: ?BattleMapState_Begin .. ?BattleMapState_End.
-record(recBattleMap, {
	roleID			= 0			:: uint64(),				%% 掠夺者角色ID
	targetRoleID	= 0			:: uint64(),				%% 领主角色ID
	territoryID		= 0			:: uint32(),				%% 领地ID
	mapPid			= undefined :: pid() | undefined,		%% 地图进程ID
	timeToFight		= 0			:: uint32(),				%% 第一次到达该时间时正式开始战斗
	timeToSettle	= 0			:: uint32(),				%% 第一次到达该时间时结算
	timeToEnd		= 0 		:: uint32(),				%% 第一次到达改时间时销毁地图
	timeRealSettle	= 0			:: uint32(),				%% 真正的结算开始时间
	monsterEts		= undefined	:: etsTab() | undefined,	%% 怪物ETS
	listPet			= []		:: [#rec_player_territory_pet{}, ...],
	state			= ?BattleMapState_Creating :: type_BMS()
}).
-define(EtsBattleMap, ets_recBattleMap).

%%%-------------------------------------------------------------------
%% 领地结算状态
-define(TerritorySettleState_Begin,		0).
-define(TerritorySettleState_None,		0).	%% 不需要结算
-define(TerritorySettleState_Temp,		1).	%% 距离上次结算至少过了1个小时，但领地仍然存在，需要临时结算
-define(TerritorySettleState_Finally,	2).	%% 超过了领地存在的时间，需要最终结算
-define(TerritorySettleState_End,		2).
-type type_TSS() :: ?TerritorySettleState_Begin .. ?TerritorySettleState_End.

%%%-------------------------------------------------------------------
%% 领地保护状态
-define(TerritoryProtectState_Begin,	0).
-define(TerritoryProtectState_None,		0).	%% 领地不受保护，可以攻打
-define(TerritoryProtectState_Safe,		1).	%% 领地被攻击后或者使用了保护药，受保护中
-define(TerritoryProtectState_Search,	2).	%% 领地已被搜寻，处于专属搜寻者的状态
-define(TerritoryProtectState_Battle,	3).	%% 领地已被搜寻，但过了专属搜寻者的状态，这是留给战斗的缓冲时间
-define(TerritoryProtectState_CD,		4).	%% 领地已被自己搜寻过，短时间不能再次命中
-define(TerritoryProtectState_TooLate,	5).	%% 剩余时间已不足一次掠夺，强制跳过
-define(TerritoryProtectState_Empty,	6).	%% 没有资源可以掠夺，强制跳过
-define(TerritoryProtectState_End,		6).
-type type_TPS() :: ?TerritoryProtectState_Begin .. ?TerritoryProtectState_End.

%%-------------------------------------------------------------------
%% 心跳，用于驱动地图状态
-define(MsgTypeTimerTick, petTerritory_timerTick).	% 秒级心跳消息
-define(TimeTick, 1000).							% 心跳时间
-define(NoticeCount, 60).							% 每N次主心跳执行一次通知

%%-------------------------------------------------------------------
%% 每个领地最多派驻5个骑宠，也只能派遣5个骑宠去掠夺
-define(CountPetMaxOfTerritory,	5).

-endif. %% Hrl_acPetTerritoryPrivate__hrl___
