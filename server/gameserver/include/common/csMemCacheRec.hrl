%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. 五月 2015 17:41
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(CS_MemCacheRec_hrl).
-define(CS_MemCacheRec_hrl, 1).

%% 天梯1v1十连杀信息与终结信息
-record(recLadderLS,
{
	roleID = 0, % 胜利者
	isTerminator = false, % 是否终结目标超神,true是
	ls_times = 0, % 连胜次数
	targetID = 0, % 失败者，目标
	time = 0,% 发生时间，毫秒
	targetMonsterName      %%挑战对象的名字、
}).

%% 天梯1v1比赛信息
-record(recLadderMatchInfo,
{
	roleID = 0, % 自己
	isChallenge = true, % true挑战者,false被挑战者
	isWin = true, % true胜利,false失败
	targetID = 0, % 目标
	rank1 = 0, % 挑战前排名
	rank2 = 0, % 挑战后排名
	time = 0, % 发生时间，毫秒
	targetMonsterName      %%挑战对象的名字、
}).

%% 天梯1v1比赛状态信息
-record(recLadderMatchState,
{
	rank = 0, % 当前排名
	roleID = 0, % 角色ID
	serverID = 0, % gsID
	time = 0 % 创建时间
}).

%% 助战表
-record(recAssistCopyMap, {
	roleID = 0,
	mapPID = undefined,
	mapID = 0
}).

-endif.