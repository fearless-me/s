%%%-------------------------------------------------------------------
%%% @author chengxs
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. 十一月 2014 16:57
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(RankPrivate_hrl).
-define(RankPrivate_hrl, 1).

-include("gsInc.hrl").

-include("playerPropSyncDefine.hrl").

%% 排行榜最低等级限制(采用新的排行榜等级限制规则)
%%-define(LevelRankLimited, 20).

%% 排行榜判断刷新的心跳
-define(RankRefreshTick, 1000 * 60).
-define(RankRefreshErrorValue, 90). % 排行榜刷新误差时间
-define(RankRefreshTickAtom, rankRefreshTickAtom).

-define(ErrorRange, 5).			% 取排行榜误差范围（分钟）
-define(OneMinuteSec, 60).		% 一分钟
-define(OneHourSec, 3600).		% 一小时
-define(OneDaySec, 86400).		% 一天
-define(HalfDaySec, 43200).     % 半天

-endif. %% RolePrivate_hrl