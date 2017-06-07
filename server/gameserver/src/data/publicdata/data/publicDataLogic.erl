%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <雨墨>
%%% @doc
%%% ETS 初始化
%%% @end
%%% Created : 22. 九月 2016 17:50
%%%-------------------------------------------------------------------
-module(publicDataLogic).
-author("tiancheng").

-include("gsInc.hrl").

%% API
-export([
    initEts/0
]).

initEts() ->
    %% 全服有效角色关键信息表
    ets:new(ets_rolekeyinfo, [public, named_table, set, {keypos, #?RoleKeyRec.roleID}, {write_concurrency, true}, {read_concurrency, true}]),
    %% 排行榜，天梯等角色模型对象表
    ets:new(ets_recPlayerRankInfo, [public, named_table, set, {keypos, #recPlayerRankInfo.roleID}, {write_concurrency, true}, {read_concurrency, true}]),
    %% 竞技场
    ets:new(ets_rec_ladder_1v1, [public, named_table, set, {keypos, #rec_ladder_1v1.rankSort}, {write_concurrency, true}, {read_concurrency, true}]),

    %% 天梯1v1十连杀信息与终结信息
    ets:new(ets_recLadderLS, [public, named_table, duplicate_bag, {keypos, #recLadderLS.roleID}, {write_concurrency, true}, {read_concurrency, true}]),
    %% 天梯1v1比赛信息
    ets:new(ets_recLadderMatchInfo, [public, named_table, duplicate_bag, {keypos, #recLadderMatchInfo.roleID}, {write_concurrency, true}, {read_concurrency, true}]),
    %% 天梯1v1比赛状态信息
    ets:new(ets_recLadderMatchState, [public, named_table, duplicate_bag, {keypos, #recLadderMatchState.rank}, {write_concurrency, true}, {read_concurrency, true}]),
    ok.