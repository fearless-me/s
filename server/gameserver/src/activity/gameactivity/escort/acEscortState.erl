%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 护送
%%% @end
%%% Created : 08. 四月 2015 15:27
%%%-------------------------------------------------------------------
-module(acEscortState).
-author("tiancheng").

-include("acEscortPrivate.hrl").

%% API
%% -export([]).
-compile(export_all).

%% 活动状态
getEscortStart() ->
	case get('EscortStart') of
		undefined -> false;
		V -> V
	end.

setEscortStart(V) ->
	put('EscortStart', V).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 护送活动地图列表
setEscortMapList(List) ->
	put('EscortMapList', List).

getEscortMapList() ->
	case get('EscortMapList') of
		undefined -> [];
		V -> V
	end.

%% 如果地图创建的消息先传过来，则先存入进程字典
setEscortMapList_Ets({MapPID, PlayerEts, MonsterEts}) ->
	put({'EscortMapList_Ets', MapPID}, {PlayerEts, MonsterEts}).

getEscortMapList_Ets(MapPID) ->
	get({'EscortMapList_Ets', MapPID}).

delEscortMapList_Ets(MapPID) ->
	erlang:erase({'EscortMapList_Ets', MapPID}).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 护送活动参加人员list
setEscortJoinPlayerList(List) ->
	put('EscortJoinPlayerList', List).

getEscortJoinPlayerList() ->
	case get('EscortJoinPlayerList') of
		undefined -> [];
		List -> List
	end.

%% 护送参与序号
getEscortSequenceNumber() ->
	Value =
		case get('EscortSequenceNumber') of
			undefined -> 1;
			V -> V + 1
		end,
	put('EscortSequenceNumber', Value),
	Value.

clearEscortSequenceNumber() ->
	put('EscortSequenceNumber', 0).

setEscortEarningsList(List) ->
	put('EscortEarningsList', List).

getEscortEarningsList() ->
	case get('EscortEarningsList') of
		undefined -> [];
		List -> List
	end.