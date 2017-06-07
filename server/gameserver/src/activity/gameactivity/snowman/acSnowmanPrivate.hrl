%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20170220
%%%-------------------------------------------------------------------
-author("meitianyang").
-ifndef(Hrl_acSnowmanPrivate__hrl___).
-define(Hrl_acSnowmanPrivate__hrl___, 1).

-include("gsInc.hrl").
-include("activityDef.hrl").
-include("../activityPhaseDefine.hrl").
-include("cfg_guildsnowman.hrl").
-include("cfg_guildsnoman_settle.hrl").

%%-------------------------------------------------------------------
%% 活动状态
-define(ActivityPhase_Ready, 	1).	%% 阶段1：准备
-define(ActivityPhase_Begin, 	2).	%% 阶段2：正式开始
-define(ActivityPhase_Stop, 	3).	%% 阶段3：停止收集材料
-define(ActivityPhase_Settle, 	4).	%% 阶段4：结算

%%-------------------------------------------------------------------
%% uint32的每一位
-define(ListBitOfUint32, [
	16#1,			16#2, 			16#4, 			16#8,
	16#10,			16#20,			16#40, 			16#80,
	16#100,			16#200,			16#400, 		16#800,
	16#1000,		16#2000,		16#4000, 		16#8000,
	16#10000,		16#20000,		16#40000, 		16#80000,
	16#100000,		16#200000,		16#400000, 		16#800000,
	16#1000000,		16#2000000,		16#4000000, 	16#8000000,
	16#10000000,	16#20000000,	16#40000000, 	16#80000000
]).
%% ?ListBitOfUint32取反
-define(ListNotBitOfUint32, [
	16#FFFFFFFE,	16#FFFFFFFD,	16#FFFFFFFB,	16#FFFFFFF7,
	16#FFFFFFEF,	16#FFFFFFDF,	16#FFFFFFBF,	16#FFFFFF7F,
	16#FFFFFEFF,	16#FFFFFDFF,	16#FFFFFBFF,	16#FFFFF7FF,
	16#FFFFEFFF,	16#FFFFDFFF,	16#FFFFBFFF,	16#FFFF7FFF,
	16#FFFEFFFF,	16#FFFDFFFF,	16#FFFBFFFF,	16#FFF7FFFF,
	16#FFEFFFFF,	16#FFDFFFFF,	16#FFBFFFFF,	16#FF7FFFFF,
	16#FEFFFFFF,	16#FDFFFFFF,	16#FBFFFFFF,	16#F7FFFFFF,
	16#EFFFFFFF,	16#DFFFFFFF,	16#BFFFFFFF, 	16#7FFFFFFF
]).

%%-------------------------------------------------------------------
%% 活动角色数据
-record(recMapPlayerInfo, {
	roleID		= 0		:: uint64(),		%% 角色ID作为键值
	count		= 0		:: uint32(),		%% 累计捐赠数量
	%contribute	= 0		:: uint32(),		%% 累计产生贡献
	%time		= 0		:: uint32(),		%% 最后产生贡献的时间，仅用于排序
	resource	= []	:: [uint32(), ...]	%% 角色携带的材料量，注意初始化为resZero/0
}).
%% 地图状态
-define(MapState_BEGIN,		0).		%% 状态开始
-define(MapState_Creating,	0).		%% 正在创建地图
-define(MapState_Sleep,		1).		%% 沉睡阶段，用于修正活动开始的时间，等价于活动阶段1
-define(MapState_Ready,		2).		%% 准备阶段，等价于活动阶段2
-define(MapState_Playing,	3).		%% 主玩法阶段，等价于活动阶段3
-define(MapState_Wait,		4).		%% 结算前等待阶段，等价于活动阶段4
-define(MapState_Settle,	5).		%% 结算阶段，等价于活动阶段5
-define(MapState_Complete,	6).		%% 已经结束（堆完雪人提前结束，占个位置不允许创建地图）
-define(MapState_END,		6).		%% 状态结束
-type type_MapState() :: ?MapState_BEGIN .. ?MapState_END.
%% 活动地图数据
-record(recMapInfo, {
	guildID			= 0						:: uint64(),					%% 公会ID作为键值
	mapPid			= undefined				:: pid() | undefined,			%% 地图进程
	etsPlayer		= undefined				:: etsTab() | undefined,		%% 玩家ETS
	etsMonster		= undefined				:: etsTab() | undefined,		%% 怪物ETS
	etsCollect		= undefined				:: etsTab() | undefined,		%% 采集物ETS
	state			= ?MapState_Creating	:: type_MapState(),				%% 地图状态
	subState		= 1						:: uint32(),					%% 新增子状态，对应guildsnowman.id，只在state=?MapState_Playing时有效
	snowmanCount	= 0						:: uint32(),					%% 已完成的雪人数量（该值加1表示正在建设的雪人序号，不能超过雪人最大数量）
	snowmanBuilding = []					:: [uint32(), ...],				%% 当前正在建设的雪人的材料进度，注意初始化为resZero/0
	listPlayerInfo	= []					:: [#recMapPlayerInfo{}, ...],	%% 活动角色数据集
	isGM			= false					:: boolean(),					%% 是否由GM创建（由GM创建的不受心跳驱动，便于调试）
	creatorID		= 0						:: uint64(),					%% 创建者角色ID用于优化创建流程
	guildLv			= 0						:: uint32()						%% 公会等级
}).
-define(EtsMapInfo, ets_snowman_recMapInfo).
%% 辅助查询活动地图数据的映射表
-record(recMapPid2MapInfo, {
	mapPid	= undefined	:: pid() | undefined,	%% 地图进程作为键值
	guildID	= 0			:: uint64()				%% 公会ID
}).
-define(EtsMapPid2MapInfo, ets_snowman_recMapPid2MapInfo).

%%-------------------------------------------------------------------
%% cfg_guildsnowman配置对象类型
-define(SrcType_Monster,	1).
-define(SrcType_Collect,	2).
-type type_Src() :: ?SrcType_Monster | ?SrcType_Collect.

%%-------------------------------------------------------------------
%% 心跳，用于驱动活动进程
-define(MsgTypeTimerTick, snowman_timerTick).	% 秒级心跳消息
-define(TimeTick, 1000).						% 心跳时间

-endif. %% Hrl_acSnowmanPrivate__hrl___
