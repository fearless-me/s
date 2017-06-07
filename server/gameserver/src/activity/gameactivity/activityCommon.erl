%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, 好玩一二三
%%% @doc
%%% 活动相关的通用函数
%%% @end
%%% Created : 09. 二月 2015 19:30
%%%-------------------------------------------------------------------
-module(activityCommon).
-author("tiancheng").

-include("../activityPrivate.hrl").
-include("activityDef.hrl").

%% API
-export([
	getMonsterOrCollectList/2,
	getAllocList/2,
	getFreshIntervalTime/2,
	getValue/1,
	sendBroadcastNotice/1,
	getCompleteValue/1
]).

%% 获取怪物或者采集物列表
getMonsterOrCollectList(FreshType, MonsterType) ->
	L = getCfg:get1KeyList(cfg_chaos),
	Fun = fun(K, {IL, PL}) ->
		case getCfg:getCfgPStack(cfg_chaos, K) of
			%% 类型1表示混沌战场刷的对象
			#chaosCfg{type = FreshType, monsterType = MonsterType,
				monsterIdList = IDList, posList = POSList} ->
				{IDList ++ IL, POSList ++ PL};
			_ ->
				{IL, PL}
		end
		  end,
	{L1, L2} = lists:foldl(Fun, {[],[]}, L),
	case L1 =:= [] orelse L2 =:= [] of
		true ->
%% 			?ERROR_OUT("getMonsterOrCollectList:~p,~p,~p", [FreshType, MonsterType, L]),
			{[],[]};
		_ ->
			[_ID|_] = L1,
			[{_X,_Y}|_] = L2,
			{L1, L2}
	end.

%% 获取怪物或者采集物对应的坐标列表
getAllocList(_IDList, []) ->
	[];
getAllocList([], _PosList) ->
	[];
getAllocList(IDList, PosList) ->
	Fun = fun(ID, {AccPosList, AccList}) ->
		L = case AccPosList =:= [] of
				true ->
					PosList;
				_ ->
					AccPosList
			end,
		Pos = {X, Y} = lists:nth(misc:rand(1, erlang:length(L)), L),
		{lists:delete(Pos, L), [{ID, 1, X, Y} | AccList]}
		  end,
	{_, LL} = lists:foldl(Fun, {PosList, []}, IDList),
	LL.

%% 获取怪物与宝箱的刷新间隔时间
getFreshIntervalTime(FreshType, Type) ->
	L = getCfg:get1KeyList(cfg_chaos),
	Fun = fun(K, Time) ->
		case getCfg:getCfgPStack(cfg_chaos, K) of
			#chaosCfg{type = FreshType, monsterType = Type, time = FreshTime} ->
				case Time > 0 of
					true ->
						Time;
					_ ->
						FreshTime
				end;
			_ ->
				Time
		end
		  end,
	lists:foldl(Fun, 0, L).

getValue(Key) ->
	case getCfg:getCfgPStack(cfg_globalsetup, Key) of
		#globalsetupCfg{setpara = [V]} ->
			V;
		_ ->
			?ERROR_OUT("~p getValue:~p", [?MODULE, Key]),
			0
	end.

getCompleteValue(Key) ->
	case getCfg:getCfgPStack(cfg_worldboss, Key) of
		#worldbossCfg{setpara = V} ->
			V;
		_ ->
			?ERROR_OUT("~p getCompleteValue:~p", [?MODULE, Key]),
			[]
	end.

%% 全服通告
-spec sendBroadcastNotice(Content::list()) -> ok.
sendBroadcastNotice(Content) ->
	core:sendBroadcastNotice(Content).