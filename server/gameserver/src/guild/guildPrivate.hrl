%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%%
%%% @end
%%% Created : 26. 八月 2014 16:58
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(Define_guildPrivate_hrl_____).
-define(Define_guildPrivate_hrl_____, 1).

-include("gsInc.hrl").
-include("guild.hrl").
%% -include_lib("stdlib/include/qlc.hrl").
%% -include_lib("stdlib/include/ms_transform.hrl").
-include("cfg_guild_ride.hrl").

%% -define(GuildEts, guild).

%% 公会心跳，1分钟跳一次
-define(GuildHeartBeat, 1000 * 60 * 1).

%% 主动解散军团
-define(DeleteGuildReason_ZD, 1).
%% 被动解散军团
-define(DeleteGuildReason_BD, 2).
-type deleteguild() :: ?DeleteGuildReason_ZD .. ?DeleteGuildReason_BD.

%% 军团城战最大参与数量
-define(GuildWarMaxNumber, 6).

%% 军团工资领取情况
-record(getGuildReward, {
	key = {0, 0}, % {GuildID, Power}
	number = 0
}).

%% 家族-游乐场
-export_type([
	typeRideState/0,
	typeRideUseType/0,
	typeRideType/0
]).

%% 游乐场设施类型定义
%%: 1旋转木马
%%: 2摩天轮
%%: 3海盗船
%%: 4飞椅
%%: 5青龙列车
%%: 6冰淇淋车(特殊处理，直接领取奖励)
-define(RideType_Start,			1).
-define(RideType_Whirligig,		1).
-define(RideType_FerrisWheel,	2).
-define(RideType_Corsair,		3).
-define(RideType_FlyChair,		4).
-define(RideType_Train,			5).
-define(RideType_IceCream,		6).
-define(RideType_End,			6).
-type typeRideType() :: ?RideType_Start .. ?RideType_End.
%% 设备状态
-define(RideState_BEGIN,	0).
-define(RideState_Maintain,	0).	%% 维护中
-define(RideState_Close,	1).	%% 未到开放时间
-define(RideState_Open,		2).	%% 正常开放
-define(RideState_END,		2).
-type typeRideState() :: ?RideState_BEGIN .. ?RideState_END.
%% 操作类型
-define(RideUseType_BEGIN,		0).
-define(RideUseType_Up,			1).	%% 乘坐
-define(RideUseType_Down,		2).	%% 取消乘坐
-define(RideUseType_Upgrade,	3).	%% 升级
-define(RideUseType_END,		3).
-type typeRideUseType() :: ?RideUseType_BEGIN .. ?RideUseType_END.
%% 操作消息结构及反馈消息结构
-record(recUseRide, {
	type :: typeRideUseType(),
	roleID :: uint64(),
	netPid :: pid(),
	pid :: pid(),
	mapPid :: pid(),
	guildID :: uint64(),
	rideID :: uint32(),
	exParam :: term()
}).
%% 设备ETS
-record(recGuildRide, {
	guildID = 0 :: uint64(),
	listRide = [] :: [#rec_guild_ride{}, ...]
}).
-define(EtsGuildRide, ets_recGuildRide).
%% 设备使用情况ETS
-record(recGuildRideUser, {
	roleID = 0 :: uint64(),
	role = undefined :: undefined | #pk_RideRole{},
	timeRef = undefined :: undefined | reference()
}).
-define(EtsGuildRideUser, ets_pk_RideRole).
%% 乘坐、取消乘坐操作时被频繁使用的参数们
-record(recGuildRideParam, {
	guildID :: uint64(),
	cfg :: #guild_rideCfg{},
	ride :: #rec_guild_ride{},
	listUser :: [#recGuildRideUser{}, ...]
}).

%% 碎片祈福内存记录表
-define(EtsSuppHistory, pk_SuppHistory).


-endif. %% Define_guildPrivate_hrl_____