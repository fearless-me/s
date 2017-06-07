%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20170227
%%%-------------------------------------------------------------------
-author("meitianyang").
-ifndef(Hrl_acSpiritAreaPrivate__hrl___).
-define(Hrl_acSpiritAreaPrivate__hrl___, 1).

-include("gsInc.hrl").
-include("activityDef.hrl").
-include("../activityPhaseDefine.hrl").

%%-------------------------------------------------------------------
%% 状态定义
-define(State_Creating,		0).		%% 地图正在创建中……												：角色创建
-define(State_Created,		1).		%% 地图创建完毕，等待角色进入											：创建反馈
-define(State_Ready,		2).		%% 第一角色进入，准备倒计时（cfg_globalsetup.spiritArea_TimeReady）	：角色进入
-define(State_Going,		3).		%% 主玩法阶段，刷怪、战斗（cfg_spiritArea）							：?State_Ready、?State_Wait倒计时完毕
-define(State_Wait,			4).		%% 每波结算倒计时（cfg_globalsetup.spiritArea_TimeWait）			：?State_Going杀光所有怪
-define(State_End,			5).		%% 结束，销毁														：长超时、?State_Creating短超时、?State_Created短超时、全部角色退出
-type type_State() :: ?State_Creating .. ?State_End.

%%-------------------------------------------------------------------
%% 所有者类型
%% 多人模式下为队伍ID，单人模式下为{0, RoleID}
-type type_Owner() :: uint64() | {0, uint64()}.

%%-------------------------------------------------------------------
%% 地图信息
-record(recMapInfo, {
	%% 键值相关
	ownerID			= 0					:: type_Owner(),			%% 所有者ID（主键）
	mapPid			= undefined 		:: pid() | undefined,		%% 地图进程ID
	%% 流程控制
	wave			= 0					:: uint32(),				%% 波次（参考cfg_spiritArea.wave）
	state			= ?State_Creating	:: type_State(),			%% 状态
	time			= 0					:: uint32(),				%% 阶段内剩余时间
	deadlineTime	= 0					:: uint32(),				%% 整个活动的剩余时间（后改为战斗时间）
	%% 辅助变量
	playerEts		= undefined			:: etsTab() | undefined,  	%% 玩家ETS表
	monsterEts		= undefined			:: etsTab() | undefined,  	%% 怪物ETS表
	level			= 0					:: uint32(),				%% 暂存等级段

	count			= 0					:: uint32(),				%% 新增需要杀怪数量代替从MonsterEts中检测剩余怪物数量的方法，以期望规避分裂怪死亡分裂导致可能消息不同步导致的流程卡死问题）
	timeFMD			= 0					:: uint32()					%% 杀完怪等待2秒播放完死亡动画再结算
}).
-define(EtsMapInfo,	ets_spiritArea_recMapInfo).
%% 辅助查询活动地图数据的映射表
-record(recMapPid2MapInfo, {
	mapPid	= undefined	:: pid() | undefined,	%% 地图进程ID（主键）
	ownerID	= 0			:: type_Owner()			%% 所有者ID，多人模式下为队伍ID，单人模式下为{0, RoleID}
}).
-define(EtsMapPid2MapInfo, ets_spiritArea_recMapPid2MapInfo).

%%-------------------------------------------------------------------
%% 活动进程心跳
-define(HeartTickTime, 1000).
-define(HeartTickMsg, tick).

%%-------------------------------------------------------------------
%% GS2U_SpiritArea_Tick_Sync.state
-define(NetMsgState_Wait,	0).
-define(NetMsgState_Going,	1).

%%-------------------------------------------------------------------
%% 用于异常情况下回收地图资源的时间
-define(TimeForError,	30).	% 秒

-endif. %% Hrl_acSpiritAreaPrivate__hrl___
