%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 29. 十二月 2014 17:25
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(ActivityPrivate_hrl).
-define(ActivityPrivate_hrl, 1).

-include("gsInc.hrl").
-include("activityDef.hrl").

%% 活动子进程前缀
-define(ActivityChildProcessPrefix, "activityChildProcessPrefix").

%% 活动数据ETS
-define(AcMgrEts, acMgrEts).
-define(AcEts, acEts).

-define(ActivityModuleTick, 1000).
-define(ActivityModuleTickMsg, activityModuleTickMsg).

%% 误差分钟数
-define(MarginMinuteMin, 0).
-define(MarginMinuteMax, 10).

%% 一小时的秒
-define(OneHourSec, 3600).
%% 一天的秒
-define(OneDaySec, 86400).
%% 一周的秒
-define(OneWeekSec, 604800).

-endif. %% ActivityPrivate_hrl