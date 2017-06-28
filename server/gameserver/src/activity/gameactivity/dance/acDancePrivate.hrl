%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%%
%%% @end
%%% Created : 08. 六月 2017 19:42
%%%-------------------------------------------------------------------
-author(tiancheng).

-ifndef(Hrl_acDancePrivate__hrl___).
-define(Hrl_acDancePrivate__hrl___, 1).

-include("gsInc.hrl").
-include("activityDef.hrl").

-define(Dance_Tick, 1000).
-define(RandDanceIDNumber, 4).	% 随机舞蹈个数

-define(DancePhase_End, 0).
-define(DancePhase_Prepare, 1). % 准备
-define(DancePhase_Start, 2). % 跳舞

-define(DancePrepareTime, 10). % 准备时间
-define(DanceStartTime, 50). % 跳舞时间

-record(dance_apply, {
	roleID = 0,
	pid = undefined,
	netPid = undefined
}).

-record(dance_ing, {
	roleID = 0,
	pid = undefined,
	netPid = undefined,
	correct = false
}).


-endif. %% Hrl_acDancePrivate__hrl___