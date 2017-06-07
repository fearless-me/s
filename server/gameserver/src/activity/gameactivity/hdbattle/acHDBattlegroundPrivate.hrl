%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 混沌战场魔法定义
%%% @end
%%% Created : 13. 一月 2015 19:53
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(AcHDBattlegroundPrivate_hrl).
-define(AcHDBattlegroundPrivate_hrl, 1).

-include("gsInc.hrl").
-include("activityDef.hrl").

%% 混沌战场活动阶段
-define(HDPhase_Close, 1).   % 关闭阶段
-define(HDPhase_Start, 2).   % 开启阶段
-define(HDPhase_End, 3).   % 结束阶段，结束阶段完后，还有一个关闭阶段

%% 阻挡协议列表
-define(BlockIDMsg,
	#pk_GS2U_BlockStatusChange{
		changes = [
			#pk_BlockStatusChange{blockName = "d1", blockStatus = ?BlockNpc_Open},
			#pk_BlockStatusChange{blockName = "d2", blockStatus = ?BlockNpc_Open},
			#pk_BlockStatusChange{blockName = "d3", blockStatus = ?BlockNpc_Open},
			#pk_BlockStatusChange{blockName = "d4", blockStatus = ?BlockNpc_Open}
		]
	}
).

%% 处于战场中每次增加的荣誉值
-define(HDAddHonorGD, battle_add_value).	% 每十秒固定获得
-define(HDAddHonorKP, battle_kill_value).	% 杀一人获得
-define(HDAddHonorZ10, battle_up10).	% 连杀10人后 每击杀一人 额外增加2点
-define(HDAddHonorZ30, battle_up30).	% 连杀30人后 每击杀一人 额外增加4点
-define(HDAddHonorZ50, battle_up50).	% 连杀50人后 每击杀一人 额外增加8点
-define(HDAddHonorRank1, battle_1_honor).	% 第一名
-define(HDAddHonorRank2, battle_2_honor).	% 第二名
-define(HDAddHonorRank3T10, battle_3to10_honor).	% 第三至第十名
-define(HDAddHonorRank11, battle_11_honor).	% 十名以后
-define(HDAddHonorItem1, battle_1_item).	% 第一名道具
-define(HDAddHonorItem2, battle_2_item).	% 第二名道具
-define(HDAddHonorItem3T10, battle_3to10_item).	% 第三至第十名道具
-define(HDAddHonorItem11, battle_11_item).	% 十名以后道具

%% 混沌战场无人时，等待的分钟数
-define(HDBattleMapNpBodayWait, 10).

%% 参加混沌战场的等级
-define(HDJoinLevel, battle_play_level).
%% 混沌战场的玩家个数
-define(HDJoinNumber, battle_number).
%% 超级礼物（击杀混沌魔王的最高奖励）
-define(HDKillBOSSRewardID, battle_boss_item).

%% 活动开启前全服喊话的心跳
-define(HDPlayerReadStartBattle, 60000).
%% 把报名玩家送去参战的心跳
-define(HDPlayerWaitJoinBattle, 60000).
%% 刷怪刷宝箱刷boss统一心跳
-define(HDBattleFreshMonster, 3000).

%% 需要杀人数
-define(NeedKillPlayerNumber, battle_mb1).
%% 杀人完成的奖励
-define(KillPlayer_Reward, battle_jl1).
%% 需要采集数
-define(NeedGatherSuccessNumber, battle_mb2).
%% 采集完成的奖励
-define(GatherSuccess_Reward, battle_jl2).

%% 参加表(包含报名和正在战斗的)
-record(recHDApply, {
	roleID = 0,
	roleName = [],
	rolePID::pid(),
	roleNetPID::pid(),
	playerForce = 0,    % 玩家战力
	enterPos = {},  % {x,y}
	camp = 0,
	battlePID = undefined,	% 战场PID
	giveBossHurt = 0,	% 给混沌魔王（BOSS）造成的总伤害
	lXKillPlayerMax = 0,	% 连续击杀玩家最大数量
	lxKillPlayer = 0,	% 当前连续击杀玩家的数量，死亡一次，清零
	gatherNumber = 0,   % 完成的采集次数
	applyNumber = 0,    % 报名序号
	killPlayerAll = 0	% 总击杀玩家数
}).

%% 混沌战场时间减半
-define(FreshBossTime, 300000).
-define(FreshSettleTime, 615000).
-define(FreshEndTime, 630000).

%% 准备的战场表
-record(recHDBattlePrepare,{
	battlePID::pid(),
	startTime = 0	% 毫秒
}).

%% 开启的战场表
-record(recHDBattle, {
	battlePID::pid(),
	startTime = 0,	% 毫秒
	nextFreshMonsterTime = 10000,	% 10秒
	nextFreshCollectTime = 120000,	% 两分钟
	nextFreshBossTime = ?FreshBossTime,	% 十分钟
	settleRaward = ?FreshSettleTime,	% 20分30秒结算奖励
	endTime = ?FreshEndTime				% 21分
}).

-endif. %% AcHDBattlegroundPrivate_hrl