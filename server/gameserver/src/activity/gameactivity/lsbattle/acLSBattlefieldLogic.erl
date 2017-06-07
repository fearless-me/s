%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc乱世为王战场逻辑模块
%%%
%%% @end
%%% Created : 21. 九月 2016 11:00
%%%-------------------------------------------------------------------
-module(acLSBattlefieldLogic).
-author("wenshaofei").

-include("acLSBattlefieldPrivate.hrl").
-include("../../activityPrivate.hrl").
-include("../../../world/mapPrivate.hrl").

%% API
-export([
  init/0,
  addScore/2,
  getScoreByRoleID/1,
  joinActive/1,
  leaveActive/1,
  addKillPlayerNumber/2,
  getKillPlayerNumber/1,
  getDisposableKillNumber/1,
  changeActiveState/1,
  startAddExpTicker/0,
  startCallMonsterTicker/0,
  startRankTicker/0,
  startActiveStateTicket/0,
  getRankByRoleID/1,
  getLSRoleData/1,
  addRevenge/2,
  removeFromRevenge/2
]).


%% 初始化
-spec init() -> ok.
init() ->
  ets:new(recLSMemberInfo, [set, public, named_table, {keypos, #recLSMemberInfo.roleID}, {read_concurrency, true}]),
  ticker_begin(),
  ok.


%%加分
addScore(PlayerID, AddValue) ->
  {ok, #recLSMemberInfo{score = OldScore}} = getLSRoleData(PlayerID),
%%  NewRec = Rec#recLSMemberInfo{score = AddValue + OldScore},
  updateLSRoleData(PlayerID, #recLSMemberInfo.score, AddValue + OldScore).
%%增加复仇列表
addRevenge(SelfPlayerID, RevengePlayerID) ->
  updateLSRoleData(SelfPlayerID, [{#recLSMemberInfo.revenge_list, [RevengePlayerID]},{#recLSMemberInfo.disposableKillNumber, 0}]).

removeFromRevenge(SelfPlayerID, RevengePlayerID) ->
  case  getLSRoleData(SelfPlayerID) of
    {ok, #recLSMemberInfo{revenge_list =[RevengePlayerID] }}->
      updateLSRoleData(SelfPlayerID, [{#recLSMemberInfo.revenge_list, []},{#recLSMemberInfo.disposableKillNumber, 0}]);
    _ ->
      skip
  end.

%%增加杀人次数
addKillPlayerNumber(PlayerID, AddValue) ->
  {ok, #recLSMemberInfo{killPlayerNumber = OldValue, disposableKillNumber = OldDisposableKillNumber}} = getLSRoleData(PlayerID),
  updateLSRoleData(PlayerID, [{#recLSMemberInfo.killPlayerNumber, AddValue + OldValue}, {#recLSMemberInfo.disposableKillNumber, AddValue + OldDisposableKillNumber}]).
%%获取杀人个数
getKillPlayerNumber(PlayerID) ->
  case getLSRoleData(PlayerID) of
    {ok, #recLSMemberInfo{killPlayerNumber = Value}} ->
      Value;
    _ ->
      Value = 0
  end,
  Value.

%%获取连续杀人个数
getDisposableKillNumber(PlayerID) ->
  case getLSRoleData(PlayerID) of
    {ok, #recLSMemberInfo{disposableKillNumber = Value}} ->
      Value;
    _ ->
      Value = 0
  end,
  Value.
%%加入活动,仅仅负责数据初始化操作，当玩家进入到活动地图内之后进行初始化
joinActive(RoleID) ->
  case getLSRoleData(RoleID) of
    {ok, _Rec} ->
      updateLSRoleData(RoleID, [{#recLSMemberInfo.isInActive, true}]);
    _ ->
      saveLSRoleData(#recLSMemberInfo{roleID = RoleID, isInActive = true})
  end,
  ok.
leaveActive(RoleID) ->
  ?DEBUG_OUT(" leave active RoleID==~w~n", [RoleID]),
  updateLSRoleData(RoleID, [{#recLSMemberInfo.isInActive, false}]).

%%通过角色id来获取分数
getScoreByRoleID(RoleID) ->
  case getLSRoleData(RoleID) of
    {ok, #recLSMemberInfo{score = Score}} ->
      {ok, Score};
    _ ->
      {ok, 0}
  end.

%%通过角色id来获取排名
getRankByRoleID(RoleID) ->
  case getLSRoleData(RoleID) of
    {ok, #recLSMemberInfo{rank = Rank}} ->
      {ok, Rank};
    _ ->
      {ok, 0}
  end.
%%修改活动状态
changeActiveState(?AC_LS_STATE_BEGIN_READY = State) ->
  ets:delete_all_objects(recLSMemberInfo),
  changeActiveState1(State);
changeActiveState(?AC_LS_STATE_BEGIN = State) ->
  send_msg2LsBattleFiledAllPlayersPid(ls_battleField_change_pk_state,[]),
  changeActiveState1(State);
changeActiveState(?AC_LS_STATE_END_READY = State) ->
  changeActiveState1(State);
changeActiveState(?AC_LS_STATE_END = State) ->
  changeActiveState1(State),
  case  ets:tab2list(recLSMemberInfo) of
    []-> skip;
    DataList->
      [#recLSMemberInfo{roleID = TopFirstRoleID} | _] = lists:reverse(lists:keysort(#recLSMemberInfo.score, DataList)),
      [#rec_base_role{roleName = TopFirstRoleName}] = ets:lookup(ets_rec_base_role, TopFirstRoleID),
      MsgArgu = logicArguLib:getPaoMaDengFormatArgu([TopFirstRoleName]),
      RoleArgu = logicArguLib:getRoleBaseInfoArgu(TopFirstRoleID),
      R=logicLib:runLogicGroup(?LOGIC_GROUP_ID_LS_BATTLEFIELD_OVER, [MsgArgu, RoleArgu]),
	    ?DEBUG_OUT("==========~p~n",[R]),
      send_msg2LsBattleFiledAllPlayersPid(ls_battleField_transfrom_player_out, [])
  end,
  ok;
changeActiveState(?AC_LS_STATE_END_KICK_PLAYER_OUT = State) ->
  changeActiveState1(State),
  send_msg2LsBattleFiledAllPlayersPid(ls_battleField_transfrom_player_out, []);
changeActiveState( 0) ->
  changeActiveState1(0);
changeActiveState(State) ->
  changeActiveState1(State).
%%
%%修改活动状态
changeActiveState1(State) ->
  ?DEBUG_OUT("!!!!!!!!!!!!!!!!!!!!!!!!!!!!1changeActiveState1 active state change State:~w~n", [State]),
  activityLogic:setActivePhase(?ActivityType_LSBattleField, State),
  core:boardcastAllGSNetMsg(#pk_GS2U_synch_lsbattlefield_state{state = State}),
  ok.

%%获取乱世为王用户信息
getLSRoleData(RoleID) ->
  case ets:lookup(recLSMemberInfo, RoleID) of
    [] ->
      {error, none};
    [#recLSMemberInfo{} = Rec] ->
      {ok, Rec}
  end.
saveLSRoleData(#recLSMemberInfo{} = Rec) ->
  ets:insert(recLSMemberInfo, Rec).
updateLSRoleData(RoleID, KeyValueList) ->
    ets:update_element(recLSMemberInfo, RoleID, KeyValueList).
updateLSRoleData(RoleID, AttrIndex, NewValue) ->
    ets:update_element(recLSMemberInfo, RoleID, {AttrIndex, NewValue}).

%%开启定时器
ticker_begin() ->
  startAddExpTicker(),
  startCallMonsterTicker(),
  startRankTicker(),
  startActiveStateTicket(),
  ?DEBUG_OUT("===============ticker_begin=============================="),
  ok.
%%
startAddExpTicker() ->
  case is_end() of
    true -> skip;
    _ ->
      erlang:send_after(?TICKER_ADD_EXP_TIME, self(), ?MSG_KEY_MAP_ADD_EXP_TICKER),
      send_msg2LsBattleFiledAllPlayersPid(ls_battleField_add_exp, [])
  end,
  ok.
%%
startCallMonsterTicker() ->
  case is_end() of
    true -> skip;
    _ ->
      erlang:send_after(?TICKER_CALL_MONSTER_TIME, self(), ?MSG_KEY_CALL_MONSTER_TICKER),
      MapList = mapMgrState:getMapInfoByMapID(?LS_BATTLE_FIELD_MAP_ID),
      MapPidList = [MapPid || #recMapInfo{pid = MapPid} <- MapList],
      Arug = logicArguLib:getNoticeInMapArgu(MapPidList, []),
      logicLib:runLogicGroup(?LOGIC_GROUP_ID_LS_BATTLEFIELD_RESET_BOSS, [Arug])
  end,
  ok.

startActiveStateTicket() ->
  logicLib:runLogicGroup(?LOGIC_GROUP_ID_CHANGE_LS_BATTLEFIELD_STATE, []),
%%  ?DEBUG_OUT("===============current state=====~p",[activityLogic:getActivePhase(?ActivityType_LSBattleField)]),
%%  ?DEBUG_OUT("===============startActiveStateTicket===============~p=",[R]),
  erlang:send_after(?TICKER_ACTIVE_STATE_CHANGE_TIME, self(), ?MSG_KEY_ACTIVE_STATE_CHANGE_TICKER),
%%  erlang:send_after(500, self(), ?MSG_KEY_ACTIVE_STATE_CHANGE_TICKER),
  ok.
%%关闭定时器
is_end() ->
  case activityLogic:getActivePhase(?ActivityType_LSBattleField) of
	  {ok, 0} -> true;
	  _ -> false
  end.
%%进行排名,因为数据量最多才几千和因此排序时间非常快，该函数可以快速执行，每间隔1秒刷新一次
startRankTicker() ->
  case is_end() of
    true -> skip;
    _ ->
      DataList = ets:tab2list(recLSMemberInfo),
      SortList = lists:reverse(lists:keysort(#recLSMemberInfo.score, DataList)),
      rank1(SortList, 1),
      erlang:send_after(?TICKER_RANK_TIME, self(), ?MSG_KEY_RANK_TICKER),
      TopThreeRoleLSList = getTopThreeRoleLSInfo(SortList, []),
      TopThreeRankList = lists:map(
        fun(#recLSMemberInfo{roleID = TempRoleID, score = Score, rank = RankIndex}) ->
          [#rec_base_role{roleName = RoleName}] = ets:lookup(ets_rec_base_role, TempRoleID),
          #pk_lsbattlefield_rank{score = Score, index = RankIndex, roleName = RoleName}
        end, TopThreeRoleLSList),
      lists:foreach(
        fun(#recLSMemberInfo{roleID = RoleID, score = Score, rank = RankIndex,isInActive=IsInActive}) ->
          case ets:lookup(ets_rec_OnlinePlayer, RoleID) of
            [#rec_OnlinePlayer{netPid = Pid}] when IsInActive =:= true ->
              erlang:spawn(
                fun() ->
                  case lists:keyfind(RoleID, #recLSMemberInfo.roleID, TopThreeRoleLSList) of
                    false ->
                      [#rec_base_role{roleName = RoleName}] = ets:lookup(ets_rec_base_role, RoleID),
                      SelfInfo = #pk_lsbattlefield_rank{score = Score, index = RankIndex, roleName = RoleName},
                      Notify = #pk_GS2U_lsbattlefield_rank_list{rank_list = TopThreeRankList ++ [SelfInfo]};
                    _ ->
                      Notify = #pk_GS2U_lsbattlefield_rank_list{rank_list = TopThreeRankList}
                  end,
                  gsSendMsg:sendNetMsg(Pid, Notify)
                end);
            _ ->
              ok
          end
        end, SortList)
  end,
  ok.
rank1([], _Index) ->
  ok;
rank1([#recLSMemberInfo{roleID = RoleID} | T], Index) ->
  updateLSRoleData(RoleID, #recLSMemberInfo.rank, Index),
  rank1(T, Index + 1).
%%获取前三名用户id
getTopThreeRoleLSInfo([], InfoList) ->
  lists:reverse(InfoList);
getTopThreeRoleLSInfo(_, InfoList) when length(InfoList) =:= 3 ->
  lists:reverse(InfoList);
getTopThreeRoleLSInfo([#recLSMemberInfo{} = Info | T], InfoList) ->
  getTopThreeRoleLSInfo(T, [Info | InfoList]).

send_msg2LsBattleFiledAllPlayersPid(MsgKey, Date) ->
  AllLSMemebrs = ets:tab2list(recLSMemberInfo),
  lists:foreach(
    fun(#recLSMemberInfo{roleID = RoleID,isInActive = IsInActive}) ->
      case ets:lookup(ets_rec_OnlinePlayer, RoleID) of
        [#rec_OnlinePlayer{pid = Pid}] when IsInActive =:= true-> 
          psMgr:sendMsg2PS(Pid, MsgKey, Date);
        _ ->
          ok
      end
    end, AllLSMemebrs).