%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%% 活动模块私有定义
%%% 约会地下城（活动）
%%% @end
%%% Created : 20161202
%%%-------------------------------------------------------------------
-author("meitianyang").

-ifndef(Hrl_acDatePrivate__hrl___).
-define(Hrl_acDatePrivate__hrl___, 1).

-include("gsInc.hrl").
-include("activityDef.hrl").
-include("../activityPhaseDefine.hrl").

%% 玩法ID
-define(DateActiveID_Min,   1).
-define(DateActiveID_Link,  1).
-define(DateActiveID_PushBox,  2).
-define(DateActiveID_PoolParty,  3).
-define(DateActiveID_FindTreasure,  4).
-define(DateActiveID_Max,   4).
-type type_daid() :: ?DateActiveID_Min .%.. ?DateActiveID_Max.%% 元素量太少，新增至值10002后放开

%% 本活动所有玩法通用地图信息
-record(recMapInfo, {
	mapPID          = undefined :: pid() | undefined,       % 地图进程ID
	mapID           = 0         :: uint(),                  % 地图ID
	activeID        = 0         :: type_daid(),             % 玩法ID
	roleID_A        = 0         :: uint64(),                % 较小角色ID
	roleID_B        = 0         :: uint64(),                % 较大角色ID
	playerEts       = undefined :: etsTab() | undefined,    % 玩家ETS表
	collectEts      = undefined :: etsTab() | undefined,    % 采集物ETS表
	monsterEts      = undefined :: etsTab() | undefined,    % 怪物ETS表
	npcEts          = undefined :: etsTab() | undefined,    % NPCETS表
	createMapTime   = 0         :: uint32(),                % 本地图创建时间 time:getSyncUTCTimeFromDBS()
	timerRefMain    = undefined :: term() | undefined,      % 主计时器引用
	isInitAfterC    = false     :: boolean(),               % 玩法逻辑是否执行了创建地图后的初始化
	isInitAfterFE   = false     :: boolean(),               % 玩法逻辑是否执行了玩家首次进入后的初始化
	roleA_enterCount      = 0         :: uint(),                  % 进入地图次数
	roleB_enterCount      = 0         :: uint(),                  % 进入地图次数
	paramEx         = undefined :: term()                   % 各玩法自定义扩展数据
}).
-define(EtsMapInfo, ets_recMapInfo).

%% 为了便于查找，以角色ID为键值存放的其它关键信息
-record(recKeyInfo, {
	anotherRoleID   = 0         :: uint64(),                % 另一个角色ID
	activeID        = 0         :: type_daid(),             % 玩法ID
	mapID           = 0         :: uint(),                  % 地图ID
	mapPID          = undefined :: pid() | undefined        % 地图进程ID
}).
-record(recMapInfoHelper, {
	roleID          = 0         :: uint64(),                % 指定角色ID
	value           = []        :: [#recKeyInfo{}, ...]     % 关键信息
}).
-define(EtsMapInfoHelper, ets_recMapInfoHelper).

%% 各种回执消息结构
-record(recAckData, {
	activeID        = 0         :: type_daid(),             % 玩法ID
	paramEx         = undefined :: term()                   % 各玩法自定义扩展数据
}).
-define(MsgTypeSpawnAck, date_spawnAck).                  % 创建对象的回执消息类型
-define(MsgTypeTimerMain, date_timerMain).                % 主计时器消息
-define(MsgTypeTimerTick, date_timerTick).                % 秒级心跳消息
-define(TimeTick, 1000).                                  % 心跳时间





-endif. %% Hrl_acDatePrivate__hrl___
