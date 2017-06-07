%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%% 双角色相关的每日计数
%%% 私有头定义
%%% @end
%%% Created : 20161205
%%%-------------------------------------------------------------------
-author("meitianyang").

-ifndef(Hrl_daily2Private__hrl___).
-define(Hrl_daily2Private__hrl___, 1).

-include("gsInc.hrl").

%% 默认值
-define(DefaultValueOfDaily2(A,B,C),
	#rec_player_daily2{
		roleID_A = A,
		roleID_B = B,
		daily2Type = C,
		lastUpdateTime = 0,
		counter = 0
	}
).

-endif. %% Hrl_daily2Private__hrl___
