%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 特殊排行榜处理
%%% @end
%%% Created : 09. 十一月 2015 14:07
%%%-------------------------------------------------------------------
-module(rankSpecial).
-author("tiancheng").

-include("rankPrivate.hrl").

%% API
-export([
    refreshGuildWarRank/1
]).

refreshGuildWarRank(List) ->
    RankType = ?PlayerRankType_GuildWar,
    FreshTime = time:getSyncTime1970FromDBS(),

    ?LOG_OUT("refreshGuildWarRank:~p", [FreshTime]),

    %% 取排行榜需要的人数
    #rankCfg{player_number = Number} = getCfg:getCfgPStack(cfg_rank, RankType),
    RealNumber = erlang:min(Number, 100),

    %% 把老榜数据与新数据合并
    List2 = getMergeList(List, RankType),

    %% 生成新排行榜
    RankList = getGuildWarRank(List2, RankType, RealNumber, FreshTime),

    %% 清空老榜
    rankLogic:clearRankData(RankType),

    %% 保存新榜到内存
    rankLogic:getPlayerRankDataAck(RankType, RankList),

    %% 设置新榜刷新时间
    rankState:setRankCreateTime(RankType, FreshTime),

    %% 保存新榜到数据库
    FTime =
        fun(#recSaveRank{createTime = CTime} = Rank) ->
            TimeStr = case CTime > 0 of
                          true ->
                              time:convertSec2DateTimeStr(CTime);
                          _ ->
                              "1970-01-01 00:00:00"
                      end,
            Rank#recSaveRank{createTime = TimeStr}
        end,
    RankSqlList = lists:map(FTime, RankList),
    gSendMsg:sendMsg2DBServer(saveRankData, 0, {RankType, RankSqlList}),

    %% 广播给连接的GS
    RL = rankLogic:queryRankData(RankType),
%%    csSendMsg:sendMsg2AllGSServer(newPlayerRank, {RankType, RL}),
    rankFresh:refreshRank2Ets(RankType, RL),
    %% 记录日志
    rankLogic:saveRankLog(RankType, RankSqlList),
    ok.

getGuildWarRank(List, RankType, RealNumber, FreshTime) ->
    F1 =
        fun({_, K1, S1}, {_, K2, S2}) ->
            if
                K1 > K2 -> true;
                K1 =:= K2 andalso S1 > S2 -> true;
                true -> false
            end
        end,
    List2 = lists:sort(F1, List),
    List3 = lists:sublist(List2, RealNumber + 10),
    List4 = lists:filter(fun({RID, _, _}) -> core:queryRoleKeyInfoByRoleID(RID) /= {} end, List3),
    List5 = lists:sublist(List4, RealNumber),

    F2 =
        fun({RoleID, K, S}, {SortID, RList}) ->
            R = #recSaveRank{
                roleID = RoleID,
                rankType = RankType,
                rankSort = SortID,
                rankSortC = rankLogic:getRankSortC(RankType, RoleID, SortID),
                value1 = K,
                value2 = S,
                value3 = 0,
                createTime = FreshTime
            },
            {SortID + 1, [R | RList]}
        end,
    {_, RankList} = lists:foldl(F2, {1, []}, List5),
    RankList.

getMergeList(List, RankType) ->
    %% 把列表打印出来
    ?LOG_OUT("getMergeList:~p,~p", [RankType, List]),
    [MinLv, MaxLv] = rankLogic:getRankLVLimitCfg(),
    Sql = qlc:q([Rank || Rank = #recPlayerRank{} <- mnesia:table(recPlayerRank),
        Rank#recPlayerRank.rankType =:= RankType]),
    List2 = edb:selectRecord(Sql),
    FilterLv = fun(#recPlayerRank{roleID = RoleID}) ->
                    case core:queryRoleKeyInfoByRoleID(RoleID) of
                        #?RoleKeyRec{level = LV} when (MinLv =< LV) and (LV =< MaxLv) ->
                            true;
                        #?RoleKeyRec{} ->
                            false;
                        _ ->
                            ?ERROR_OUT("refreshGuildWarRank error ,Role ID not find in roleKeyInfo role_id:~p,module_info:~p", [RoleID, {?MODULE, ?LINE}]),
                            false
                    end
               end,
    List3=lists:filter(FilterLv,List2),
    F =
        fun(#recPlayerRank{roleID = RID, value1 = V1, value2 = V2}, AccList) ->
            case lists:keyfind(RID, 1, AccList) of
                {_, OV1, OV2} ->
                    lists:keystore(RID, 1, AccList, {RID, V1 + OV1, V2 + OV2});
                _ ->
                    [{RID, V1, V2} | AccList]
            end
        end,
    lists:foldl(F, List, List3).

