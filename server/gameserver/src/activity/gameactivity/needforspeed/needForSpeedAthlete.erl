%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc港口竞速参赛者模块
%%%
%%% @end
%%% Created : 28. 十一月 2016 16:33
%%%-------------------------------------------------------------------
-module(needForSpeedAthlete).
-author("wenshaofei").
-include("needForSpeedPrivate.hrl").
-include("../../activityPrivate.hrl").
%% API
-export([get_copetition_athletes/1, getAthleteInfo/1, sortAthleteList/1, deleteDoubblePetParterAthlete/1, sortAthleteListRemoveDoublePet/1, getAthleteIndex/1, saveAthleteInfo/1, delAthleteInfo/1, delCompetitionAllAthlete/1,deleteDoubblePetParterAthleteID/1]).
-export([addItem/2, useItem/3,saveAthleteInfo/2]).

%%获取赛场内的参数选手
get_copetition_athletes(CompetitionID) ->
  Condition = ets:fun2ms(
    fun(Obj) when CompetitionID =:= Obj#need_for_speed_athlete.competition_id ->
      Obj
    end),
  AthleteList = ets:select(need_for_speed_athlete, Condition),
  {ok, AthleteList}.

%%获取参赛人员信息
getAthleteInfo(RoleID) ->
  case ets:lookup(need_for_speed_athlete, RoleID) of
    [] -> {ok, none};
    [AthleteInfo] -> {ok, AthleteInfo}
  end.
%%对玩家进行排序，排除双人骑宠副驾驶玩家
sortAthleteListRemoveDoublePet(CompetitionID) ->
  {ok, AthleteList} = get_copetition_athletes(CompetitionID),
  SortList = sortAthleteList0(AthleteList),
  deleteDoubblePetParterAthlete(SortList).

sortAthleteList(CompetitionID) ->
  {ok, AthleteList} = get_copetition_athletes(CompetitionID),
  sortAthleteList0(AthleteList).
%%对参赛人员列表进行排序,先根据分数进行排序，相同分数的根据撞击分数线时间进行排序
sortAthleteList0(AthleteList) ->
  ScoreList = [{RoleID, ?MAX_SCORE_LINE_NUMBER * CurrentCircle + ScoreLineID, CollideLineMs} || #need_for_speed_athlete{role_id = RoleID, current_circle = CurrentCircle, current_score_line_id = ScoreLineID, collide_line_ms = CollideLineMs} <- AthleteList],
  ScoreLineSortList = lists:reverse(lists:keysort(2, ScoreList)),
  NewSortList = sortAthleteList1(ScoreLineSortList, []),
  lists:map(
    fun({RoleID, _Score, _CollideLineMs}) ->
      lists:keyfind(RoleID, #need_for_speed_athlete.role_id, AthleteList)
    end, NewSortList).
sortAthleteList1([{_RoleID, Score, _CollideLineMs} | _] = ScoreLineSortList, NewSortList) ->
  SameScoreList = [{TempRoleID, TempScore, TempCollideLineMs} || {TempRoleID, TempScore, TempCollideLineMs} <- ScoreLineSortList, TempScore =:= Score],
  SortScoreList = lists:keysort(3, SameScoreList),
  LastAthleteList = [{TempRoleID, TempScore, TempCollideLineMs} || {TempRoleID, TempScore, TempCollideLineMs} <- ScoreLineSortList, TempScore =/= Score],
  sortAthleteList1(LastAthleteList, NewSortList ++ SortScoreList);
sortAthleteList1([], NewSortList) ->
  NewSortList.
%%获取参赛人员的名次
%%{ok,Index}|{error,none}
getAthleteIndex(RoleID) ->
  case getAthleteInfo(RoleID) of
    {ok, none} -> {error, none};
    {ok, #need_for_speed_athlete{competition_id = CompetitionID, isPetdoubleMaster = false, partner_id = PartnerID}} when PartnerID > 0 ->
      AthleteSortList = sortAthleteListRemoveDoublePet(CompetitionID),
      getAthleteIndex(PartnerID, AthleteSortList, 1);
    {ok, #need_for_speed_athlete{competition_id = CompetitionID}} ->
      AthleteSortList = sortAthleteListRemoveDoublePet(CompetitionID),
      getAthleteIndex(RoleID, AthleteSortList, 1)
  end.
getAthleteIndex(_RoleID, [], _N) ->
  {error, none};
getAthleteIndex(RoleID, [#need_for_speed_athlete{role_id = RoleID} | _T], N) ->
  {ok, N};
getAthleteIndex(RoleID, [#need_for_speed_athlete{} | T], N) ->
  getAthleteIndex(RoleID, T, N + 1).

%%移除掉双人坐骑，客人位参赛选手
deleteDoubblePetParterAthlete([#need_for_speed_athlete{}|_]=AthleteList) ->
  lists:filter(
    fun(#need_for_speed_athlete{isPetdoubleMaster = IsMater, partner_id = PartnerID}) ->
      if
        (PartnerID > 0) and (IsMater=:= true) ->
          true;
        PartnerID > 0 ->
          %%过滤掉双人坐骑旅客座位上的玩家，以此来计算出真实的，前三名玩家
          false;
        true ->
          true
      end
    end, AthleteList).
deleteDoubblePetParterAthleteID([TempRoleID | _] = RoleIDList) when is_integer(TempRoleID) ->
  AthleteList = lists:map(
    fun(RoleID) ->
      {ok, #need_for_speed_athlete{} = Info} = getAthleteInfo(RoleID),
      Info
    end, RoleIDList),
  FilterAnthleteList = deleteDoubblePetParterAthlete(AthleteList),
  [RoleID||#need_for_speed_athlete{role_id = RoleID} <-FilterAnthleteList].


%%保存参赛人员信息
saveAthleteInfo(NeedForSpeedInfo) ->
  ets:insert(need_for_speed_athlete, NeedForSpeedInfo).

%%保存参赛人员信息
saveAthleteInfo(RoleID,AttrInfo) ->
  ets:update_element(need_for_speed_athlete, RoleID,AttrInfo).

%%玩家获得道具
addItem(#need_for_speed_athlete{role_id = RoleID, item_list = ItemList} = AthleteData, ItemID) ->
  saveAthleteInfo(AthleteData#need_for_speed_athlete{item_list = ItemList ++ [ItemID]}),
  gsSendMsg:sendNetMsgByRoleID(RoleID, #pk_GS2U_NeedForSpeedCollideRoadBox{collideItemID = ItemID}).

%%给玩家使用道具
useItem(#need_for_speed_athlete{role_id = RoleID, item_list = ItemList} = AthleteData, ItemID, TargetRoleIDList) ->
  case ItemList -- [ItemID] of
    ItemList ->
      gsSendMsg:sendRolePidMsgByRoleID(RoleID, needForSPeedUseItemAct, {{error_code, ?ErrorCode_ActExchange_ItemNotEnough}, ItemID, TargetRoleIDList});
    NewItemList ->
      ?DEBUG_OUT("useItem===NewItemList====~p~n", [NewItemList]),
      saveAthleteInfo(AthleteData#need_for_speed_athlete{item_list = NewItemList}),
      gsSendMsg:sendNetMsgByRoleID(RoleID, #pk_GS2U_NeedForSpeedUseItem{roleID = RoleID, itemID = ItemID}),
      gsSendMsg:sendRolePidMsgByRoleID(RoleID, needForSPeedUseItemAct, {{ok, <<"success">>}, ItemID, TargetRoleIDList})
  end.


%%删除参赛人员信息
delAthleteInfo(RoleID) ->
  ets:delete(need_for_speed_athlete, RoleID).
%%删除赛场内所有的用户数据
delCompetitionAllAthlete(CompetitionID) ->
  Condition = ets:fun2ms(
    fun(#need_for_speed_athlete{role_id = RoleID, competition_id = TempCompetitionID}) ->
      CompetitionID =:=TempCompetitionID
    end),
  ets:select_delete(need_for_speed_athlete, Condition).
