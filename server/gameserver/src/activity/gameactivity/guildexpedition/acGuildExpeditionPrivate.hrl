%%%-------------------------------------------------------------------
%%% @author mwh
%%% 帮会沙盘
%%%-------------------------------------------------------------------


-ifndef(Hrl_acGuildExpeditionPrivate__hrl___).
-define(Hrl_acGuildExpeditionPrivate__hrl___, 1).

-include("gsInc.hrl").
-include("activityDef.hrl").

%%  以下宏定义将会由策划来配置，保留此设置当作默认值

-define(GuildExpedition_Banner_Tick_Guild_Score, 30).
-define(GuildExpedition_Banner_Plannet_Guild_Score, 20).
-define(GuildExpedition_Banner_Plannet_Self_Score, 20).
-define(GuildExpedition_Kill_Guil_Score, 8).
-define(GuildExpedition_Kill_Self_Score, 8).
-define(GuildExpedition_Kill_Assist_Guil_Score, 5).
-define(GuildExpedition_Kill_Assist_Self_Score, 5).

-define(GuildExpedition_Reward_Self_ScoreMin, 500).
-define(GuildExpedition_BeKilled_Limit, 30).

-define(GuildExpedition_ScoreRate_15_Second, 10). % 分钟
-define(GuildExpedition_ScoreRate_20_Second, 20). % 分钟

%% 事件
-define(GuildExpedtion_Events_BannerTick, 1).
-define(GuildExpedtion_Events_BannerPlannet, 2).
-define(GuildExpedtion_Events_KillPlayer, 3).
-define(GuildExpedtion_Events_Assist, 4).

%% 采集物类型
-define(GuildExpedition_GatherType_None, 0).
-define(GuildExpedition_GatherType_Banner, 1).
-define(GuildExpedition_GatherType_Buff, 2).


%% 统一心跳
-define(GuildExpeditionTickTime, 60000).
-define(GuildExpedition_Banner_Tick, 30000). %30秒
-define(GuildExpedtion_Spawn_Tick, 5000). % 3秒




%% 地图创建时间大于这个值时，地图需要重置一下
-define(GuildExpeditionExistMaxTime, 3600).
%% 最近玩家待进入这个地图的时间，大于这个时间，可以重置
-define(GuildExpeditionPlayerEnterMaxTime, 300).
%% 玩家请求进入的时间，大于这个值，说明玩家太卡了，或者其它异常情况，要把这个待进入玩家给删掉
-define(GuildExpeditionWaitEnterPlayerMaxTime, 600).

-define(GuildExpeditio_TopN, 3).

%% 版本号
-define(GuildExpedition_Sundries_SubID_Version, 1).
%% [{mapID,#guildScoreInfo, [#playerScore]}, ...]
-define(GuildExpedition_Sundries_SubID_FinalData, 2).
-define(GuildExpedition_Sundries_SubID_FinishTime, 3).

%% 最大进入人数（减去一个保护值）
-define(GuildExpeditionEnterNumberDec, 8).

%% 待进列表
-record(waitingEnterPlayer, {
    roleID = 0,
    time = 0    % 请求进入时间
}).

%% 据点占领信息
-record(pointOwner, {
    pointIndex = 0, %据点索引1-3
    roleID = 0, % 占领该点的角色
    guildID = 0, %占领帮会
    guildName = ""
}).

-record(guildScoreInfo, {
    guildID = 0,
    guildScore = 0
}).

%% 地图
-record(guildExpeditionMap, {
    mapID = 0,
    mapPID = undefined, % 地图如果销毁，有玩家进入，需要重新创建地图
    playerEts = undefined,
    monsterEts = undefined,
    key = 0,    % 唯一ID
    isMapCreating = false,
    waitEnterPlayer = [], % [#waitEnterPlayer{},...]已经分配让其进入，但是还未真正进入场景，进入之后，将其删掉
    createMapTime = 0,  % 本地图创建时间
    playerEnterTime = 0,   % 最后一次分配玩家进入的时间
    pointOwner = [], % [pointOwner]
    guildDict = dict:new() % guildScoreInfo
}).


%% 排队列表
-record(applyPlayer, {
    roleID = 0,
    netPid = undefined,
    pid = undefined,
    tarPos = undefined, % 进入点坐标{X, Y}
    index = 0,  % 申请序列，一直递增
    mapID = 0  % 请求地图
}).

-record(playerScore,{
    mapID = 0,
    score = 0
}).

%% 玩家列表
-record(expeditionPlayer, {
    guildID = 0,
    roleID = 0,
%%    scoreList = [],   % [playerScore]
    totalScore = 0,
    beKill = 0,
    netPid = undefined,
    pid = undefined,
    mapID = 0,
    mapPID = undefined
}).

%%
-record(finalPlayer,{
    roleID = 0,
    score = 0
}).
-record(mapFinalInfo,{
    mapID = 0,
    occuGuildID = 0,
    playerList = [] %% [#finalPlayer, ...]
}).

%% 30秒刷新缓存用
-record(topGuildCacheInfo, {
    guildID = 0,
    guildName = "",
    guildScore = 0
}).
-record(topGuildCache,{
    mapID = 0,
    onlineNumber = 0,
    queueNumber = 0,
    topList = [] %topGuildCacheInfo
}).


%% 军团每日占领奖励领取情况
-record(guildEveryDayReward, {
    key = {0, 0, 0}, % {MapID, GuildID, Power}
    number = 0
}).


-endif. %% Hrl_acGuildExpeditionPrivate__hrl___