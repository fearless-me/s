%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2014, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. 十二月 2014 14:36
%%%-------------------------------------------------------------------
-module(rankState).
-author("tiancheng").

-include("rankPrivate.hrl").

%% API
-compile(export_all).

%% 设置本排行榜发榜时间
-spec setRankCreateTime(RankType::playerRankType(), CreateTime::uint()) -> ok.
setRankCreateTime(RankType, CreateTime) ->
	put({'RankCreateTime', RankType}, CreateTime),
	ok.

-spec getRankCreateTime(RankType::playerRankType()) -> uint() | undefined.
getRankCreateTime(RankType) ->
	get({'RankCreateTime', RankType}).

setRankTickTimerRef(TimerRef) ->
	put('RankTickTimerRef', TimerRef).

getRankTickTimerRef() ->
	get('RankTickTimerRef').

%% 设置排行榜是否加载成功
getRankIsLoadSuccess() ->
	get('RankIsLoadSuccess').

setRankIsLoadSuccess(IsSuccess) ->
	put('RankIsLoadSuccess', IsSuccess).

%% 设置需要同步的GS列表
addNeedSyncGSPidToList(Pid) ->
	List = getNeedSyncGSPidToList(),
	case lists:member(Pid, List) of
		true -> List;
		false ->
			setNeedSyncGSPidToList([Pid | List])
	end.

getNeedSyncGSPidToList() ->
	case get('NeedSyncGSPidToList') of
		undefined -> [];
		List -> List
	end.

setNeedSyncGSPidToList(List) ->
	put('NeedSyncGSPidToList', List),
	List.