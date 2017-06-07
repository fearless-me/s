%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 四月 2015 15:27
%%%-------------------------------------------------------------------
-module(acGuildBattleState).
-author("tiancheng").

-include("acGuildBattlePrivate.hrl").

%% API
%% -export([]).
-compile(export_all).

%% 基础配置
setBaseConfig(Data) ->
    put('BaseConfig', Data),
    ok.
%% [MaxPoint,RangeTime,AttackLCTimes,AddPoint,KillPlayerAddPoint]
getBaseConfig() ->
    get('BaseConfig').
getRangeTime() ->
    [_MaxPoint,RangeTime,_AttackLCTimes,_AddPoint,_KillPlayerAddPoint] = getBaseConfig(),
    RangeTime.
getAttackLCInfo() ->
    [_MaxPoint,_RangeTime,AttackLCTimes,AddPoint,_KillPlayerAddPoint] = getBaseConfig(),
    {AttackLCTimes,AddPoint}.
getMaxPoint() ->
    [MaxPoint,_RangeTime,_AttackLCTimes,_AddPoint,_KillPlayerAddPoint] = getBaseConfig(),
    MaxPoint.
getKillAddPoint() ->
    [_MaxPoint,_RangeTime,_AttackLCTimes,_AddPoint,KillPlayerAddPoint] = getBaseConfig(),
    KillPlayerAddPoint.

%% 采集点
setCollectIDs({G1, G2, G3}) ->
    put('CollectIDs', [G1, G2, G3]),
    ok.
getCollectIDs() ->
    get('CollectIDs').

%% 粮仓ID列表
setLCMonsterID(Data) ->
    put('LCMonsterID', Data).
getLCMonsterID() ->
    case get('LCMonsterID') of
        undefined -> [];
        L -> L
    end.

%% 是否在报名阶段
isApplyIng() ->
	case activityLogic:getActivePhase(?ActivityType_GuildBattle) of
		{ok, ?ActivityPhase_GuildBattle_1} -> true;
		_ -> false
	end.
isBattleIng() ->
	case activityLogic:getActivePhase(?ActivityType_GuildBattle) of
		{ok, ?ActivityPhase_GuildBattle_3} -> true;
		_ -> false
	end.

%% 战斗中的心跳
setGuildBattleTimerRef(TimerRef) ->
    put('GuildBattleTimerRef', TimerRef).
getGuildBattleTimerRef() ->
    get('GuildBattleTimerRef').

%% ETS
addMapPIDEts({MapPid, _PlayerEts, _MonsterEts, _CollectEts, _NpcEts} = Data) ->
    put({'MapPIDEts', MapPid}, Data),
    ok.
delMapPIDEts(MapPid) ->
    erlang:erase({'MapPIDEts', MapPid}).
getMapPlayerEts(MapPid) ->
    case get({'MapPIDEts', MapPid}) of
        {MapPid, PlayerEts, _MonsterEts, _CollectEts, _NpcEts} -> PlayerEts;
        _ -> undefined
    end.
getMapMonsterEts(MapPid) ->
    case get({'MapPIDEts', MapPid}) of
        {MapPid, _PlayerEts, MonsterEts, _CollectEts, _NpcEts} -> MonsterEts;
        _ -> undefined
    end.
getMapCollectEts(MapPid) ->
    case get({'MapPIDEts', MapPid}) of
        {MapPid, _PlayerEts, _MonsterEts, CollectEts, _NpcEts} -> CollectEts;
        _ -> undefined
    end.

%% %% 配对列表
delGuildPairs() ->
    erlang:erase('GuildPairs').
addGuildPairs(#battleGuildPair{guildID1 = GuildID} = Pair) ->
    L = getGuildPairs(),
    NL = lists:keystore(GuildID, #battleGuildPair.guildID1, L, Pair),
    setGuildPairs(NL),
    ok.
addGuildPairsPlayer(#enterGuildBattlePlayer{roleID = RoleID, guildID = GuildID, netPid = NetPID} = Player) ->
    Pair = #battleGuildPair{players1 = PlayerL1, players2 = PlayerL2} = getGuildPairsByGuildID(GuildID),
    if
        GuildID =:= Pair#battleGuildPair.guildID1 ->
            NL = case lists:keyfind(RoleID, #enterGuildBattlePlayer.roleID, PlayerL1) of
                     false -> [Player | PlayerL1];
                     #enterGuildBattlePlayer{} = P1 ->
                         %% 更新网络PID
                         lists:keystore(RoleID, #enterGuildBattlePlayer.roleID, PlayerL1, P1#enterGuildBattlePlayer{netPid = NetPID})
                 end,
            addGuildPairs(Pair#battleGuildPair{players1 = NL});
        GuildID =:= Pair#battleGuildPair.guildID2 ->
            NL2 = case lists:keyfind(RoleID, #enterGuildBattlePlayer.roleID, PlayerL2) of
                      false -> [Player | PlayerL2];
                      #enterGuildBattlePlayer{} = P2 ->
                          %% 更新网络PID
                          lists:keystore(RoleID, #enterGuildBattlePlayer.roleID, PlayerL2, P2#enterGuildBattlePlayer{netPid = NetPID})
                  end,
            addGuildPairs(Pair#battleGuildPair{players2 = NL2});
        true ->
            ?ERROR_OUT("addGuildPairsPlayer:~p,~p", [Player, Pair]),
            skip
    end,
    ok.
delGuildPairsPlayer(GuildID, RoleID) ->
    Pair = #battleGuildPair{players1 = PlayerL1, players2 = PlayerL2} = getGuildPairsByGuildID(GuildID),
    if
        GuildID =:= Pair#battleGuildPair.guildID1 ->
            NL = lists:keydelete(RoleID, #enterGuildBattlePlayer.roleID, PlayerL1),
            addGuildPairs(Pair#battleGuildPair{players1 = NL});
        GuildID =:= Pair#battleGuildPair.guildID2 ->
            NL2 = lists:keydelete(RoleID, #enterGuildBattlePlayer.roleID, PlayerL2),
            addGuildPairs(Pair#battleGuildPair{players2 = NL2});
        true ->
            ?ERROR_OUT("delGuildPairsPlayer:~p,~p,~p", [GuildID, RoleID, Pair]),
            skip
    end,
    ok.
getGuildPairs() ->
    case get('GuildPairs') of
        undefined -> [];
        L -> L
    end.
setGuildPairs(List) ->
    put('GuildPairs', List),
    List.
getGuildPairsByGuildID(GuildID) ->
    L = getGuildPairs(),
    case lists:keyfind(GuildID, #battleGuildPair.guildID1, L) of
        false ->
            lists:keyfind(GuildID, #battleGuildPair.guildID2, L);
        V ->
            V
    end.
getGuildPairsByMapPID(MapPID) ->
    L = getGuildPairs(),
    lists:keyfind(MapPID, #battleGuildPair.mapPID, L).