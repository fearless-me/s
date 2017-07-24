%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%%
%%% @end
%%% Created : 17. 八月 2017 21:16
%%%-------------------------------------------------------------------
-module(homeState).
-author(tiancheng).

-include("gsInc.hrl").

%% API
-compile(export_all).

setHomeAreaID1Index(AreaID, Index) ->
	put({'HomeAreaID1Index', AreaID}, Index).
getHomeAreaID1Index(AreaID) ->
	case get({'HomeAreaID1Index', AreaID}) of
		undefined -> 1;
		Index -> Index
	end.

setHomeAreaID2Index(AreaID, Index) ->
	put({'HomeAreaID2Index', AreaID}, Index).
getHomeAreaID2Index(AreaID) ->
	case get({'HomeAreaID2Index', AreaID}) of
		undefined -> 1;
		Index -> Index
	end.

getWaitCreateHomeMapList() ->
	case get('WaitCreateHomeMapList') of
		undefined -> [];
		L -> L
	end.
setWaitCreateHomeMapList(L) ->
	put('WaitCreateHomeMapList', L).
addWaitCreateHomeMap(HomeID, Flag) ->
	L = getWaitCreateHomeMapList(),
	setWaitCreateHomeMapList([{HomeID, Flag} | L]).
delWaitCreateHomeMap(HomeID, Flag) ->
	L = getWaitCreateHomeMapList(),
	setWaitCreateHomeMapList(lists:delete({HomeID, Flag}, L)).
isHaveWaitCreateHomeMap(HomeID, Flag) ->
	L = getWaitCreateHomeMapList(),
	lists:member({HomeID, Flag}, L).

getWaitEnterHomeRoleList() ->
	case get('WaitEnterHomeRoleList') of
		undefined -> [];
		L -> L
	end.
setWaitEnterHomeRoleList(L) ->
	put('WaitEnterHomeRoleList', L).
updateWaitEnterHomeRole(RoleID, HomeID, Flag, Pid) ->
	L = getWaitEnterHomeRoleList(),
	setWaitEnterHomeRoleList(lists:keystore(RoleID, 1, L, {RoleID, HomeID, Flag, Pid})).