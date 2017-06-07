%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2016, <雨墨>
%%% @doc
%%% 竞技场数据
%%% @end
%%% Created : 08. 十月 2016 10:22
%%%-------------------------------------------------------------------
-module(publicDataMgrLadder1v1).
-author("tiancheng").

-include("gsInc.hrl").

%% API
-export([
    ladder1v1DataIsNull/0,
    loadLadder1v1InfoAck/1,
    saveladder1v1data/1
]).

loadLadder1v1InfoAck([]) ->
    ok;
loadLadder1v1InfoAck(List) ->
    ets:insert(ets_rec_ladder_1v1, List),

    %% 修正检查竞技场数据
    checkLadderDelRoleData(List),
    ok.

checkLadderDelRoleData(List) ->
    %% 检查竞技场的角色，如果删掉了，直接处理掉
    [{S,E}|_] = lists:reverse(getCfg:getKeyList(cfg_ladder_1v1)),
    #ladder_1v1Cfg{monsterID = [MonsterID|_]} = getCfg:getCfgPStack(cfg_ladder_1v1, S, E),

    F =
        fun(#rec_ladder_1v1{rankSort = Rank, roleID = RoleID} = Ladder) ->
            case uidMgr:checkUID(RoleID) of
                true ->
                    case core:queryRoleKeyInfoByRoleID(RoleID) of
                        #?RoleKeyRec{} ->
                            %% 保留
                            skip;
                        _ ->
                            %% 这条天梯数据需要被处理
                            NRec = #rec_ladder_1v1{
                                rankSort = Rank,			%%排名 smallint(6)
                                roleID = MonsterID,			%%角色ID bigint(20) unsigned
                                exploit = 0,				%%总功勋 int(10) unsigned
                                cur_win = 0,				%%当前连胜 smallint(5) unsigned
                                max_win = 0,				%%最大连胜 smallint(5) unsigned
                                win_times = 0,				%%累计胜利 smallint(5) unsigned
                                worship_times = 0			%%被膜拜总次数 smallint(5) unsigned
                            },
                            ?LOG_OUT("player is del,but in ladder:~p -> ~p", [Ladder, NRec]),
                            ets:insert(ets_rec_ladder_1v1, NRec),
                            saveladder1v1data({update, NRec}),
                            ok
                    end;
                _ ->
					%% 检测怪物是否存在
					case getCfg:getCfgByKey(cfg_monster, RoleID) of
						#monsterCfg{} -> skip;
						_ ->
							NewID = getLadderMonsterID(Rank, MonsterID),

							%% 这条天梯数据需要被处理
							NRec = Ladder#rec_ladder_1v1{roleID = NewID},
							?LOG_OUT("monster is del,but in ladder rank:~p monsterID:~p -> ~p", [Rank, RoleID, NewID]),
							ets:insert(ets_rec_ladder_1v1, NRec),
							saveladder1v1data({update, NRec}),
							ok
					end
            end
        end,
    lists:foreach(F, List).

getLadderMonsterID(Rank, DefaultMonsterID) ->
	KeyList = getCfg:getKeyList(cfg_ladder_1v1),
	Fun =
		fun({Start, End}, {_, ID}) ->
			case Rank >= Start andalso Rank =< End of
				true ->
					#ladder_1v1Cfg{monsterID = MonsterIds} = getCfg:getCfgByArgs(cfg_ladder_1v1, Start, End),
					[RandomMonsterID|_] = misc:randUniqueFromList(1, MonsterIds),
					{true, RandomMonsterID};
				_ ->
					{false, ID}
			end
		end,
	{_, ID} = misc:foldlEx(Fun, {false, DefaultMonsterID}, KeyList),
	ID.

%% 竞技场数据为空，需要初始化
ladder1v1DataIsNull() ->
    ?LOG_OUT("init ladder1v1 data..."),

    %% 内存数据为空，初始化基础数据
    ?LOG_OUT("freshLadder1v1MatchData: data is null,init"),
    List = getCfg:getKeyList(cfg_ladder_1v1),
    Fun =
        fun({Start, End}) ->
            #ladder_1v1Cfg{monsterID = MonsterIds} = getCfg:getCfgByArgs(cfg_ladder_1v1, Start, End),
            L = lists:seq(Start, End),
            lists:foreach(
                fun(Index) ->
                    [RandomMonsterID | _] = misc:randUniqueFromList(1, MonsterIds),
                    insertToMemCahce(Index, RandomMonsterID)
                end, L),
            ok
        end,
    lists:foreach(Fun, List),

    %% 发给DBS保存
    L = ets:tab2list(ets_rec_ladder_1v1),
    saveladder1v1data({insert, L}),
    ok.

insertToMemCahce(Index, MonsterID) ->
    R = #rec_ladder_1v1{
        rankSort = Index,
        roleID = MonsterID
    },
    ets:insert(ets_rec_ladder_1v1, R),
    ok.

saveladder1v1data({OP, Data}) ->
    Legal = case OP of
                insert -> true;
                update -> true;
                delete -> true;
                _ -> false
            end,
    case Legal of
        true ->
            gsSendMsg:sendMsg2DBServer(saveladder1v1data, 9, {OP, Data}),
            ok;
        _ ->
            ?ERROR_OUT("saveladder1v1data:~p,~p", [OP, Data]),
            skip
    end,
    ok.