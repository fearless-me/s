%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 天梯1v1竞技场模块
%%% @end
%%% Created : 29. 五月 2015 11:37
%%%-------------------------------------------------------------------
-module(ladder1v1State).
-author("tiancheng").

-include("ladder1v1Private.hrl").

%% API
%% -export([]).
-compile(export_all).

%% 设置等待分配战场的列表
setWaitAllocBattleMapList(PidList) ->
	put('WaitAllocBattleMapList', PidList).

getWaitAllocBattleMapList() ->
	case get('WaitAllocBattleMapList') of
		undefined -> [];
		L -> L
	end.

addWaitAllocBattleMapList(Pid) ->
	OL = getWaitAllocBattleMapList(),
	case lists:member(Pid, OL) of
		false ->
			setWaitAllocBattleMapList(OL ++ [Pid]);
		_ ->
			?ERROR_OUT("addWaitAllocBattleMapList, pid is have:~p", [Pid])
	end.

-spec getFirstWaitAllocBattleMapList() -> pid() | false.
getFirstWaitAllocBattleMapList() ->
	case getWaitAllocBattleMapList() of
		[Pid|_List] ->
			Pid;
		_ ->
			?ERROR_OUT("getFirstWaitAllocBattleMapList"),
			false
	end.

delWaitAllocBattleMapListFirst() ->
	case getWaitAllocBattleMapList() of
		[_Pid|List] ->
			setWaitAllocBattleMapList(List);
		_ ->
			?ERROR_OUT("delWaitAllocBattleMapListFirst")
	end.

%% 设置比赛双方的对象信息
setLadderGameMatchList([]) ->
	put('LadderGameMatchList', []);
setLadderGameMatchList([#recladder1v1match{}|_] = List) ->
	put('LadderGameMatchList', List).

getLadderGameMatchList() ->
	case get('LadderGameMatchList') of
		undefined -> [];
		L -> L
	end.

addLadderGameMatchList(#recladder1v1match{} = Rec) ->
	OL = getLadderGameMatchList(),
	setLadderGameMatchList([Rec | OL]).

delLadderGameMatchList(#recladder1v1match{} = Rec) ->
	OL = getLadderGameMatchList(),
	NL = lists:delete(Rec, OL),
	setLadderGameMatchList(NL).

%% 上一次结算天梯排行榜时间
setLadder1v1RankRewardTime(Time) ->
	put('Ladder1v1RankRewardTime', Time).

getLadder1v1RankRewardTime() ->
	case get('Ladder1v1RankRewardTime') of
		undefined -> 0;
		V -> V
	end.

%% 战斗配置时间
setLadder1v1BattleTime(Time) ->
	put('Ladder1v1BattleTime', Time).

getLadder1v1BattleTime() ->
	case get('Ladder1v1BattleTime') of
		undefined -> 300;
		T -> T
	end.