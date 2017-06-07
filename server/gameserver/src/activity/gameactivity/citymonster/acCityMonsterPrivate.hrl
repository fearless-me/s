%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, 好玩一二三
%%% @doc
%%% 主城刷怪活动定义
%%% @end
%%% Created : 06. 二月 2015 14:29
%%%-------------------------------------------------------------------
-author("tiancheng").

-ifndef(Hrl_acCityMonsterPrivate__hrl___).
-define(Hrl_acCityMonsterPrivate__hrl___, 1).

-include("gsInc.hrl").
-include("activityDef.hrl").

-define(KillMonsterNum, defendcity_kill_num).		% 每波需要击杀的小怪个数
-define(BossChaosID, defendcity_boss).				% 刷boss的id
-define(CollectChaosID, defendcity_chest).			% 刷宝箱的id
-define(MonsterChaosID, defendcity_monster).		% 刷小怪的idlist
-define(CollectChaosID_Time, defendcity_chest_time).% 宝箱存在时间


-endif. %% Hrl_acCityMonsterPrivate__hrl___