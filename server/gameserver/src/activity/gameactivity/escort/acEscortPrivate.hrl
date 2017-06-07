%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, 好玩一二三
%%% @doc
%%% 护送活动模块
%%% @end
%%% Created : 06. 二月 2015 14:29
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(Hrl_acEscortPrivate__hrl___).
-define(Hrl_acEscortPrivate__hrl___, 1).

-include("gsInc.hrl").
-include("activityDef.hrl").

-define(ResetEscortMapTick, 10000).  % 重置活动地图
-define(EscortTick, 1000).  % tick
-define(GharryID_Solo, 1104).  % 单人护送马车ID
-define(GharryID_Team, 1122).  % 多人护送马车ID

-define(EscortType_Solo, 1).    % 单人护送
-define(EscortType_Team, 2).    % 多人护送
-define(EscortType_Rob, 3).     % 劫掠

-define(EscortEndReason_GharryEnd, 1). % 马车到达终点，护送胜利
-define(EscortEndReason_GharryDead, 2).% 马车死亡，护送失败
-define(EscortEndReason_TimeEnd, 3).   % 活动时间到

%% 玩家触发事件后，可接受的时间范围,s
-define(PlayerEventAcceptCDTime, 11).

%% 玩家事件，奖励增益
-define(EscortPlayerEvent_AddReward, 1).
%% 马车BUFF
-define(EscortPlayerEvent_GharryBuff, 2).
%% 护送玩家BUFF
-define(EscortPlayerEvent_PBuff, 3).
%% 劫掠玩家BUFF
-define(EscortPlayerEvent_RobBuff, 4).
%% 额外增加怪物
-define(EscortPlayerEvent_AddMonster, 5).

%% 护送活动参与玩家列表
-record(recEscortJoin,
{
	roleID = 0,         % 角色ID
	roleLevel = 0,      % 角色等级
	roleName = "",		% 角色名字
	sequenceNumber = 0, % 参加序列(递增)
	mapPID = undefined, % 活动地图PID
	escortType = 0,     % 护送类型
	eventTime = 0,      % 本次事件触发时间
	eventID = 0,        % 本次可以获得的事件ID
	isCreater = true,   % false表示是队员(由队长创建，邀请进入的)
	isEscort = true     % true表示护送，false表示劫掠
}).

-record(recEscortEarnings,
{
 		sequenceNumber = 0, % 参加序列(递增)
		targeID = 0,		% 角色ID
        targeName = "",		% 角色名字
		roleEarnings = 0,   % 劫掠玩家收益
		gharryMxpHp = 0		% 马车最大血量
}).

-record(recEscortEvent,
{
	eventID = 0,
	getNumber = 0
}).

%% 地图与马车表
-record(recEscortMap,
{
	sequenceNumber = 0, % 参加序列
	escortType = ?EscortType_Solo,      % 护送类型
	createRoleID = 0,
	createRoleLevel = 0,
	mapPID,             % 活动地图PID
	monsterEts,         % 怪物ETS
	playerEts,          % 玩家ETS
	nextMEventID = [],  % 剩余的触发的怪物事件列表
	nextPEventID = [],  % 剩余的触发的玩家事件列表
	eventIDList = [],   % 已经获得益事件列表[#recEscortEvent{},...]
	gharryCode = 0      % 马车code,0表示还没创建，-1表示等待创建，其它表示马车的code
}).

-endif. %% Hrl_acEscortPrivate__hrl___