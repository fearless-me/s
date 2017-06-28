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
%% 需要杀死所有怪
-define(CopyMapKillAllMonster, 3).

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

%% show2优化 LUNA-2725
%% 原show2相关事件服务端不作处理，仅客户端显示对话，但同时包含了show2事件的进度可能已经刷怪，导致玩家被迫死亡
%% 针对上述情况，策划并不希望将show2事件配置为单独的进度，防止副本进度计数方面的不统一
%% 因此，服务端将会在show2事件有效时，延迟初始化其它内容，这里定义的结构就暂存了初始化其它内容所需的参数
%% 注：只支持mapsetting.scheduleConf，mapsetting.parallelScheduleConf
-record(copyMapScheduleInit, {
	groupID		= 0	:: uint(),
	scheduleID	= 0	:: uint(),
	configID	= 0	:: uint(),
	show2ID		= 0	:: uint()
}).

-endif. %% Define_copyMapScheduleDefine_hrl_____