%%%-------------------------------------------------------------------
%%% @author Administrator
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. 十月 2016 17:30
%%%-------------------------------------------------------------------
-author("Administrator").

-include("gsInc.hrl").

-record(rcState,{}).
-define(RubbishCleanerTickTime, 30 * 1000).
-define(RubbishCleanerTickWorkLoopMax, 5).

-record(recRubbishCleaningProcess,{
	totalNum = 1,
	doing = 0,
	done = 0
}).