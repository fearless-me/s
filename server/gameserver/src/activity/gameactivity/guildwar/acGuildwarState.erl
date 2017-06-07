%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 活动模块字典
%%% @end
%%% Created : 08. 四月 2015 15:27
%%%-------------------------------------------------------------------
-module(acGuildwarState).
-author("tiancheng").

-include("acGuildwarPrivate.hrl").

%% API
%% -export([]).
-compile(export_all).

%% 设置争霸是否开户
setGuildWarState(B) ->
	put('GuildWarState', B).

getGuildWarState() ->
	case get('GuildWarState') of
		undefined -> false;
		B -> B
	end.

%% 设置本阶段的持续时间
setWaitStartTime(Time) ->
	put('WaitStartTime', Time).

getWaitStartTime() ->
	case get('WaitStartTime') of
		undefined -> 0;
		Time -> Time
	end.

%% 比赛的地图列表
saveGuildWarMap(#recGuildWar{key = Key} = War) ->
	L = getGuildWarMapList(),
	NL = lists:keystore(Key, #recGuildWar.key, L, War),
	setGuildWarMapList(NL).

setGuildWarMapList(L) ->
	put('GuildWarMap', L).

getGuildWarMapList() ->
	case get('GuildWarMap') of
		undefined -> [];
		L -> L
	end.

getGuildWarMapListStage(Stage) ->
	L = getGuildWarMapList(),
	[Rec || Rec = #recGuildWar{stage = S} <- L, S =:= Stage].

delGuildWarMapList() ->
	erlang:erase('GuildWarMap').

%% 地图ETS缓存
getMapEtsCacheList() ->
	case get('MapEtsCacheList') of
		undefined -> [];
		L -> L
	end.

delMapEtsCacheList() ->
	erlang:erase('MapEtsCacheList').

addMapEtsCache({MapPID, _PE, _ME, _CE, _NE} = Data) ->
	L = getMapEtsCacheList(),
	NL = lists:keystore(MapPID, 1, L, Data),
	put('MapEtsCacheList', NL),
	ok.

getMapEtsCache(MapPID) ->
	L = getMapEtsCacheList(),
	lists:keyfind(MapPID, 1, L).

delMapEtsCache(MapPID) ->
	L = getMapEtsCacheList(),
	NL =
		case lists:keymember(MapPID, 1, L) of
			true -> lists:keydelete(MapPID, 1, L);
			_ -> L
		end,
	put('MapEtsCacheList', NL).

delMapEtsCache() ->
	erlang:erase('MapEtsCacheList').