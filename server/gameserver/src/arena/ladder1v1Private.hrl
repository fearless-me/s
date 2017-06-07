%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 天梯1v1竞技场模块
%%% @end
%%% Created : 29. 五月 2015 11:37
%%%-------------------------------------------------------------------
-author("tiancheng").
-ifndef(Define_ladder1v1Private_hrl_____).
-define(Define_ladder1v1Private_hrl_____, 1).

-include("gsInc.hrl").
-include("rob.hrl").

-define(Battle_Prepare_Time, 3). % 准备时间3s

-define(Ladder1v1_Phase_Close, 0). % 关闭阶段
-define(Ladder1v1_Phase_Prepare, 1). % 准备阶段
-define(Ladder1v1_Phase_Battle, 2). % 比赛阶段
-define(Ladder1v1_Phase_End, 3). % 结束阶段

-define(Ladder1v1BattleEnd_Failed, 0). % 失败
-define(Ladder1v1BattleEnd_Victory, 1). % 胜利

%% 竞技场心跳，每秒tick一次
-define(Ladder1v1_Tick, 1000).

%% 天梯挑战状态保护时间s
-define(LadderMatchStateProtcetTime, 1500).

%% 比赛双方信息表
-record(recladder1v1match, {
	createRank = 0,
	createRoleID = 0,
	createPlayerPID,
	createPlayerNetPID,
	targetRank = 0,
	targetRoleCode = 0,
	targetRoleID = 0,
	targetPlayerPID,
	createPlayerCode = 0,
	battlemapPID,
	phase = ?Ladder1v1_Phase_Close,
	time = 0,
	prepareTime = 0,
	createTime = 0  % 创建时间，只在创建的时候记录，大于LadderMatchStateProtcetTime分钟的比赛则清理
}).

-endif. %% Define_ladder1v1Private_hrl_____