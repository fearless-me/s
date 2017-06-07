%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 十二月 2016 14:12
%%%-------------------------------------------------------------------
-module(acMaterialState).
-author("Administrator").

-include("acMaterialPrivate.hrl").

%% API
%%-export([]).
-compile(export_all).

%%%-------------------------------------------------------------------
addMap(#materialMap{} = R)->
	L = getMapList(),
	setMapList([R | L]).

getMapList()->
	case get('materialMapList') of
		undefined -> [];
		V -> V
	end.

setMapList(L)->
	put('materialMapList', L).

updateMap(#materialMap{creator = Creator} = R)->
	L1 = lists:keystore(Creator,#materialMap.creator, getMapList(), R),
	setMapList(L1).

isCreatingMap(RoleID)->
	case lists:keyfind(RoleID, #materialMap.creator, getMapList()) of
		#materialMap{isCreating = true} = R ->
			R;
		_ ->
			false
	end.

%%%-------------------------------------------------------------------
addTickCount()->
	V = getTickCount(),
	put('TicCount', V + 1).

getTickCount()->
	case get('TicCount') of
		undefined ->
			0;
		V ->
			V
	end.
%%%-------------------------------------------------------------------