%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%% 首领入侵
%%% @end
%%% Created : 31. 五月 2017 17:07
%%%-------------------------------------------------------------------
-module(acWorldBossState).
-include("gsInc.hrl").
-include("activityDef.hrl").
-include("acWorldBossPrivate.hrl").
-author("ly").

%% API
-compile(export_all).

setState(S)->
	put(wb_state, S).

getState()->
	case get(wb_state) of
		undefined ->
			?ActivityPhase_Close;
		State ->
			State
	end.

setBossList(L)->
	put(wb_bosslist, L).

getBossList()->
	case get(wb_bosslist) of
		undefined ->
			[];
		L ->
			L
	end.


setMapList(L)->
	put(wb_maplist, L).

getMapList()->
	case get(wb_maplist) of
		undefined ->
			[];
		L ->
			L
	end.


