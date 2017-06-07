%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20161215
%%%-------------------------------------------------------------------
-author("meitianyang").
-ifndef(Hrl_acMoneyDungeonPrivate__hrl___).
-define(Hrl_acMoneyDungeonPrivate__hrl___, 1).

-include("gsInc.hrl").
-include("activityDef.hrl").
-include("../activityPhaseDefine.hrl").

%%-------------------------------------------------------------------
%% 状态定义
-define(CHAPTER_0,        0).   %% 未开始
-define(CHAPTER_PREPARE,  1).   %% 准备
-define(CHAPTER_GOING,    2).   %% 进行中
-define(CHAPTER_FINISH,   3).   %% 完成
-define(CHAPTER_TIMEOUT,  4).   %% 超时
-define(CHAPTER_GIVEUP,   5).   %% 放弃
-define(CHAPTER_END,      6).   %% 结束（清场前的等待时间）
-define(CHAPTER_KICK,     7).   %% 清场
-type type_cpt() :: ?CHAPTER_0 .. ?CHAPTER_KICK.

%%-------------------------------------------------------------------
%% 除了游戏结束、清场之类的，游戏中怪物消除的原因
-define(DeleteMonsterReason_Run,    0).   %% 跑掉了
-define(DeleteMonsterReason_Kill,   1).   %% 杀掉了
-type type_dmr() :: ?DeleteMonsterReason_Run .. ?DeleteMonsterReason_Kill.

%%-------------------------------------------------------------------
%% 怪物记录
-record(monster, {
	monsterID   = 0   :: uint(),          %% 怪物ID
	countAll    = 0   :: uint(),          %% 当前需要刷出的数量
	countKill   = 0   :: uint(),          %% 杀掉的数量
	countRun    = 0   :: uint(),          %% 跑掉的数量
	listCode    = []  :: [uint64(), ...]  %% 对象码列表（长度为存在的数量）
}).

%%-------------------------------------------------------------------
%% 待刷怪缓存
-record(monsterWait, {
	curChapter  = 0   :: uint(),                  %% 当前刷怪波次
	listCount   = []  :: [{uint(), uint()}, ...], %% 计数，格式为[{怪物ID, 当前波次刷怪数量}, ...]
	listID      = []  :: [uint(), ...]            %% 对象码列表（长度为存在的数量）
}).

%%-------------------------------------------------------------------
%% 玩法内容
-record(chapter, {
	maxChapter        = 0     :: uint(),                  %% 最大刷怪波次，由配置初始化并固定
	curChapter        = 0     :: uint(),                  %% 当前刷怪波次
	isTurnWaiting     = false :: boolean(),               %% 是否处于波次间的等待中
	listMonstersLast  = []    :: [#monster{}, ...],       %% 上一波怪物记录
	listMonstersCur   = []    :: [#monster{}, ...],       %% 当前波怪物记录
	preMonsterTime    = 0     :: uint(),                  %% 上一次刷怪的时间
	listWillCreateAll = []    :: [#monsterWait{}, ...],   %% 缓存的待刷怪列表
	listKill          = []    :: [{uint(), uint()}, ...], %% 击杀统计，格式为[{怪物ID, 当前波次刷怪数量}, ...]
	msgCache          = #pk_GS2U_MoneyDungeonInfo{}       %% 消息缓存
}).

%%-------------------------------------------------------------------
%% 地图信息
-record(recMapInfo, {
	creator       = 0           :: uint64(),              %% 创建者角色ID
	isCreating    = false       :: boolean(),             %% 是否正在创建

	mapID         = 0           :: uint(),                %% 地图ID
	teamID        = 0           :: uint64(),              %% 队伍ID
	deadlineTime  = 0           :: uint(),                %% 活动不得不结束的时间（超时时间）

	mapPID        = undefined   :: pid() | undefined,     %% 地图进程ID
	playerEts     = undefined   :: etsTab() | undefined,  %% 玩家ETS表
	monsterEts    = undefined   :: etsTab() | undefined,  %% 怪物ETS表

	state         = ?CHAPTER_0  :: type_cpt(),            %% 活动状态
	timeState		= 0			:: uint(),					%% 当前状态起始时间
	finishTime    = 0           :: uint(),                %% 活动的实际结束时间（可能因为放弃导致提前结束）

	chapter       = #chapter{}  :: #chapter{}             %% 玩法内容
}).

%%-------------------------------------------------------------------
%% 活动进程心跳
-define(HeartTickTime, 200).
-define(HeartTickMsg, tick).

%%-------------------------------------------------------------------
%% 创建对象的反馈消息
-define(MsgTypeSpawnAck, moneyDungeon_SpawnAck).
-record(recSpawnAck, {
	myChapter = 0 :: uint(),  %% 波次
	monsterID = 0 :: uint()   %% 怪物ID
}).

%%-------------------------------------------------------------------
%% 创建地图超时时间
-define(TimeDelay, 30000).	% 30秒

-endif. %% Hrl_acMoneyDungeonPrivate__hrl___
