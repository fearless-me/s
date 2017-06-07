%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, 好玩一二三
%%% @doc
%%%
%%% @end
%%% Created : 12. 九月 2014 11:31
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(Define_copyMapScheduleDefine_hrl_____).
-define(Define_copyMapScheduleDefine_hrl_____, 1).

-include("mapPrivate.hrl").

-define(DeadAddScore, 10).			% 死亡一次扣的分数
-define(IsListValid(List), erlang:is_list(List) andalso List =/= [] andalso List =/= [{}] andalso List =/= [0]).

%% 怪物
-define(CopyMapMonster, 1).
%% 采集物
-define(CopyMapCollect, 2).

%%完成副本条件
-define(CopyMapEndCond_Undefined, 0).       % 0未定义
-define(CopyMapEndCond_KillMonster, 1).     % 击杀怪物数量
-define(CopyMapEndCond_CollectItem, 2).     % 采集道具
-define(CopyMapEndCond_Time, 3).            % 倒计时
-define(CopyMapEndCond_CompleteTask, 4).    % 完成任务
-define(CopyMapEndCond_PlayAnimation, 5).   % 播放动画
-define(CopyMapEndCond_PlayCharacter, 6).   % 播放字幕

-type copyMapEndCond() :: 0 .. 5.

%% 杀怪或者采集计数表
-record(recKCcalc, {
	id          = 0,    % 怪物或者采集物的ID
	needNumber  = 0,    % 需求量
	curNumber   = 0     % 当前完成的数量
}).

%% 并行进度表
-record(recPSConf, {
	completeDo  = 0,        % 该进度完成做的操作
	isComplete  = false,    % 是否已经完成
	killMonster = []::[#recKCcalc{}|_],     % 杀怪列表[#recKCcalc{}|_]
	collectItem = []::[#recKCcalc{}, ...]   % 采集列表[{collectitemid, num}|_]
}).

-endif. %% Define_copyMapScheduleDefine_hrl_____