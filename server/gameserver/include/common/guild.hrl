%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%% 公会-帮派-军团-公共定义
%%% @end
%%% Created : 26. 八月 2014 16:54
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(Define_guild_hrl_____).
-define(Define_guild_hrl_____, 1).

-include("commonDef.hrl").

%% 工会成员权限
-define(GuildMemLevel_Request, 0).      % 请求加入

-define(GuildMemLevel_Normal, 1).       % 普通成员
-define(GuildMemLevel_Admin, 2).        % 管理员，普通军官
-define(GuildMemLevel_ViceLeader, 3).   % 副军团长
-define(GuildMemLevel_Leader, 9).       % 军团长(最高长官)

%% 所有正式成员，不包含正在申请的
-define(AllGuildMemberPower, [?GuildMemLevel_Normal, ?GuildMemLevel_Admin, ?GuildMemLevel_ViceLeader, ?GuildMemLevel_Leader]).

%% 军团领地占开始报名时间
-define(GuildBattleApplyStartHour, ?ResetTimeHour).
%% 军团领地占结束报名时间
-define(GuildBattleApplyEndHour, 18).

%%军团申请表
-record(rec_guild_apply, {
    roleID = 0,				%%玩家角色唯一ID bigint(20) unsigned
    guildID = 0,				%%军团唯一ID bigint(20) unsigned
    applyTime = 0				%%申请时间 bigint(20) unsigned
}).

-record(rec_guildBattle, {
	guildID = 0,
    targetGuildID = 0,
    winGuildID = 0,
    mapID = 0,
    mapPID = undefined,
    revivepos = {},
    allpoint = 0,
    waitEnterPlayerIDs = [], %% 等待进入的名单
    isReward = false,
    isStart = false, %% 战斗是否正式开始
    isEnd = true %% 是否结束
}).

%% 碎片祈福用于客户端刷新的失败类型#pk_GS2U_Guild_SupplicateGiveF_Ack.type
-define(SuppGiveFailedType_NotJoinGuild,	1).
-define(SuppGiveFailedType_InvalidTarget,	2).
-define(SuppGiveFailedType_Enough,			3).

-endif. %% Define_guild_hrl_____