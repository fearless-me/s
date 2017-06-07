%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 四月 2015 15:09
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(Hrl_acGuildBattlePrivate__hrl___).
-define(Hrl_acGuildBattlePrivate__hrl___, 1).

-include("gsInc.hrl").
-include("activityDef.hrl").
-include("../../activityPrivate.hrl").
-include("../activityPhaseDefine.hrl").

-define(GuildBattleNoStart, 1).		% 未开始
-define(GuildBattleIng, 2).			% 比赛中
-define(GuildBattleEnd, 3).			% 结束

%% 进入军团战的玩家
-record(enterGuildBattlePlayer, {
    roleID = 0,
    guildID = 0,
    roleName = "",
    netPid = undefined,
    point = 0
}).

-record(battleGuildPair, {
    mapPID = undefined,

    isEnd = false,  %% 是否已经结束

    guildID1 = 0,
    guild1LCBeAttackTimes = 0,  %% 粮仓被攻击次数
    lc1MonsterCode = 0,
    players1 = []::[#enterGuildBattlePlayer{},...],
    lastNoticeTime1 = 0,

    guildID2 = 0,
    guild2LCBeAttackTimes = 0,  %% 粮仓被攻击次数
    lc2MonsterCode = 0,
    players2 = []::[#enterGuildBattlePlayer{},...],
    lastNoticeTime2 = 0,

    collect1GuildID = 0,    %% 占据主采集物的军团ID
    collect1LastRewardTime = 0,

    collect2GuildID = 0,    %% 占据次采集物1的军团ID
    collect2LastRewardTime = 0,

    collect3GuildID = 0,    %% 占据次采集物2的军团ID
    collect3LastRewardTime = 0,

    normalCollectLastFreshTime = 0, %% 最近一次刷新采集物的时间

    ok
}).

-endif. %% Hrl_acGuildBattlePrivate__hrl___