%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, 好玩一二三
%%% @doc
%%% 活动模块私有定义
%%% @end
%%% Created : 06. 二月 2015 14:29
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(Hrl_acDarknessPrivate__hrl___).
-define(Hrl_acDarknessPrivate__hrl___, 1).

-include("gsInc.hrl").
-include("activityDef.hrl").

%% 黑暗之地统一心跳(这个时间不能小于一分钟，谢谢！)
-define(DarknessTickTime, 60000).

%% 黑暗之地特殊玩法版本号类型
-define(Darkness_Sundries_SubID_Rank, 1).
-define(Darkness_Sundries_SubID_Reward, 2).

%% 黑暗之地最大进入人数（减去一个保护值）
-define(DarknessEnterNumberDec, 8).

%% 地图创建时间大于这个值时，地图需要重置一下
-define(DarknessExistMaxTime, 3600).
%% 最近玩家待进入这个地图的时间，大于这个时间，可以重置
-define(DarknessPlayerEnterMaxTime, 300).
%% 玩家请求进入的时间，大于这个值，说明玩家太卡了，或者其它异常情况，要把这个待进入玩家给删掉
-define(WaitEnterPlayerMaxTime, 600).

%% 黑暗之地入口个数
-define(DarknessEntranceNumber, 1).

%% 黑暗之地阵营
-define(DarknessCamp_TS, 1).    % 天使
-define(DarknessCamp_XE, 2).    % 邪恶

%% 死亡类型
-define(DeadType_Player, 1).
-define(DeadType_BOSS, 2).
-define(DeadType_Elite, 3).

%% 待进列表
-record(waitEnterPlayer,
{
	roleID = 0,
	time = 0    % 请求进入时间
}).

%% 地图
-record(darknessMap,
{
	mapID = 0,
	mapPID = undefined, % 地图如果销毁，有玩家进入，需要重新创建地图
	playerEts = undefined,
	monsterEts = undefined,
	npcEts = undefined,
	floor = 0,    % 层数
	entrance = 0,   % 线路
	key = 0,    % 唯一ID
	monsterlastFreshTime = 0,   % 本次刷新怪物时间
	bossNextFreshTime = 0, % 下次BOSS刷新时间

	deadMonsterIDList = [],   % 死亡的怪物ID列表
	isBossDead = true, % BOSS是否死亡

	isWaitAlloc = false,
	waitEnterPlayer = [], % [#waitEnterPlayer{},...]已经分配让其进入，但是还未真正进入场景，进入之后，将其删掉
	createMapTime = 0,  % 本地图创建时间
	playerEnterTime = 0   % 最后一次分配玩家进入的时间
}).

%% 排队列表
-record(darknessApply,
{
	roleID = 0,
	netPid = undefined,
	pid = undefined,
	index = 0,  % 申请序列，一直递增
	floor = 0,  % 请求的层数
	entrance = 0    % 请求的线路
}).

%% 进入过黑暗之地的玩家列表
-record(darknessPlayer,
{
	roleID = 0,
	pebble = 0, % 拥有魔能水晶
	integral = 0,   % 积分增加量
	killMonsterNumber = 0,  % 击杀普通怪物数量
	netPid = undefined,
	pid = undefined,
	mapID = 0,
	mapPID = undefined
}).

%% 特殊BOSS
-record(darknessSpecialBoss,
{
	freshTime = 0,
	bossID = 0,
	entrance = 0,
	floor = 0,
	mapID = 0,
	x = 0,
	y = 0,
	isJoinMap = false,
	noticeNumber = 0,   % 提示次数，1次为准备，1次为正式开始
	bossName = "",
	bossDrop = "",
	bossMaxHP = 0
}).

-endif. %% Hrl_acDarknessPrivate__hrl___