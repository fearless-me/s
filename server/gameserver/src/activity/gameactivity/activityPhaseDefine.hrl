%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 所有活动阶段定义
%%% @end
%%% Created : 24. 六月 2015 14:08
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(ActivityPhaseDefine_hrl).
-define(ActivityPhaseDefine_hrl, 1).

%% 例子 ActivityType_Example
-define(ActivityPhase_Example_1, 1). % 第一个阶段

%% 答题活动 ActivityType_AnswerPlay
-define(ActivityPhase_AnswerPlay_1, 1). % 进入整点时间
-define(ActivityPhase_AnswerPlay_2, 2). % 准备开始
-define(ActivityPhase_AnswerPlay_3, 3). % 开始

%% 守卫碧空城 ActivityType_CityMonster
-define(ActivityPhase_CityMonster_1, 1). % 进入整点时间
-define(ActivityPhase_CityMonster_2, 2). % 跑马灯第一次公告
-define(ActivityPhase_CityMonster_3, 3). % 跑马灯第二次公告
-define(ActivityPhase_CityMonster_4, 4). % 正式开始

%% 军团pvp ActivityType_GuildBattle
-define(ActivityPhase_GuildBattle_1, 1). % 进入整点时间，开始报名
-define(ActivityPhase_GuildBattle_2, 2). % 报名结束，分配对手
-define(ActivityPhase_GuildBattle_3, 3). % 正式开始

%% 混沌战场 ActivityType_HDBattle
-define(ActivityPhase_HDBattle_1, 1). % 活动准备开启，开启世界喊话，让大家准备
-define(ActivityPhase_HDBattle_2, 2). % 正式开启

%% 王者战天下 ActivityType_KingBattleAll
-define(ActivityPhase_KingBattleAll_1, 1). % wait start1
-define(ActivityPhase_KingBattleAll_2, 2). % wait start2
-define(ActivityPhase_KingBattleAll_3, 3). % wait start3
-define(ActivityPhase_KingBattleAll_4, 4). % wait start4
-define(ActivityPhase_KingBattleAll_5, 5). % start
-define(ActivityPhase_KingBattleAll_6, 6). % 活动关闭

%% 护送 ActivityType_EscortGoods
-define(ActivityPhase_EscortGoods_1, 1). % 整点时间到
-define(ActivityPhase_EscortGoods_2, 2). % 十分钟之后开启

%% 黑暗之地 ActivityType_Darkness
-define(ActivityPhase_Darkness_1, 1).   % 正式开始

%% 军团争霸
-define(ActivityType_GuildWar_1, 1).    % 什么也不做
-define(ActivityType_GuildWar_2, 2).    % 初赛准备公告
-define(ActivityType_GuildWar_3, 3).    % 初赛正式开始
-define(ActivityType_GuildWar_4, 4).    % 初赛结束(同时，提示决赛准备)
-define(ActivityType_GuildWar_5, 5).    % 决赛正式开始

%% 军团沙盘
-define(ActivityType_GuildExpedition_1, 1).% 正式开始
-define(ActivityType_GuildExpedition_2, 2).% 结算阶段

%% 姻缘_结婚现场（婚宴场地） ActivityType_WeddingSite
-define(ActivityType_WeddingSite_1, 1).   % 正式开始

%% 广场舞
-define(ActivityType_Dance_1, 1).	%% 到达开时整点时间
-define(ActivityType_Dance_2, 2).	%% 五分钟后开始
-define(ActivityType_Dance_3, 3).	%% 三分钟后开始
-define(ActivityType_Dance_4, 4).	%% 一分钟后开始
-define(ActivityType_Dance_5, 5).	%% 正式开始

-endif. %% ActivityPhaseDefine_hrl