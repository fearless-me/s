%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 十一月 2016 15:36
%%%-------------------------------------------------------------------
-module(needForSpeedLogic).
-author("wenshaofei").

%% API
-export([init/0]).
-export([match/1, match/2, transform2ActiveMap/4, collideScoreLine/3, stateTickerCallBack/0, startStateTicker/0, cancelMatch/2, cancelMatch/1, exitCompetition/1]).
-export([get_competition_by_id/1, updateCompetitionInfo/2, syncCompetionState2Athlete/2, sendMsg2RolePid/3, getAwardInfo/2, isWin/1, flashCompletionInfo2Client/2]).
-include("needForSpeedPrivate.hrl").
-include("../../activityPrivate.hrl").

init() ->
  ets:new(need_for_speed_competition, [set, public, named_table, {keypos, #need_for_speed_competition.id}, {read_concurrency, true}]),
  ets:new(need_for_speed_athlete, [set, public, named_table, {keypos, #need_for_speed_athlete.role_id}, {read_concurrency, true}]),
  ets:new(need_for_speed_collider_road_box, [set, public, named_table, {keypos, #need_for_speed_collider_road_box.competition_and_box_cfg_id}, {read_concurrency, true}]),
  ets:new(?ETS_NEED_FOR_SPEED_COMPETITION_INDEX, [public, named_table]),
  ets:insert(?ETS_NEED_FOR_SPEED_COMPETITION_INDEX, {1, 1}),
  needForSpeedLogic:startStateTicker().

startStateTicker() ->
  erlang:send_after(500, self(), <<"state_ticker">>).
stateTickerCallBack() ->
  NeedForSpeedCompetitionList = ets:tab2list(need_for_speed_competition),
  NowSecond = calendar:datetime_to_gregorian_seconds(calendar:local_time()),
  lists:foreach(
    fun(Competition) ->
      ticker(Competition, NowSecond)
    end, NeedForSpeedCompetitionList).


%%匹配阶段，时间到了直接情况匹配数据
ticker(#need_for_speed_competition{
  id = CompetitionID,
  end_time = EndTime,
  state = ?NEED_FOR_SPEED_COPETITION_STATE_MATCHING}, NowSecond) when EndTime =< NowSecond ->
  ?DEBUG_OUT(" match over !!!!!!!"),
  deleteCompetion(CompetitionID);
%%准备开始阶段、倒计时结束切换成开始阶段
ticker(#need_for_speed_competition{
  id = CompetitionID,
  end_time = EndTime,
  state = ?NEED_FOR_SPEED_COPETITION_STATE_READY_BEGIN}, NowSecond) when EndTime =< NowSecond ->
  Begin2EndTime = globalCfg:getGlobalCfg(needForSpeedCompetitionBegin2EndTime),
  updateCompetitionInfo(CompetitionID, [{#need_for_speed_competition.state, ?NEED_FOR_SPEED_COPETITION_STATE_BEGIN},
    {#need_for_speed_competition.end_time, NowSecond + Begin2EndTime}]),
  ?DEBUG_OUT(" NEED_FOR_SPEED_COPETITION_STATE_BEGIN         !!!!!!!!!!!!!,CompetitionID=~p=", [CompetitionID]),
  flashCompletionInfo2Client(CompetitionID, false);
%%开始阶段时间用了，切换成奖励等待状态
ticker(#need_for_speed_competition{
  id = CompetitionID,
  end_time = EndTime,
  state = ?NEED_FOR_SPEED_COPETITION_STATE_BEGIN}, NowSecond) when EndTime =< NowSecond ->
  ReadyEndCountDownSec = globalCfg:getGlobalCfg(needForSpeedCompetitionReadyEndCountDownSec),
  updateCompetitionInfo(CompetitionID, [{#need_for_speed_competition.state, ?NEED_FOR_SPEED_COPETITION_STATE_AWARD_AND_END_INFO},
    {#need_for_speed_competition.end_time, NowSecond + ReadyEndCountDownSec}]),
  ?DEBUG_OUT(" NEED_FOR_SPEED_COPETITION_STATE_AWARD_AND_END_INFO         !!!!!!!,CompetitionID=~p=", [CompetitionID]),
  competitionSuccessAward(CompetitionID),
  flashCompletionEndInfo2Client(CompetitionID);
%%奖励阶段倒计时完成了，切换成结束状态
ticker(#need_for_speed_competition{
  id = CompetitionID,
  end_time = EndTime,
  state = ?NEED_FOR_SPEED_COPETITION_STATE_AWARD_AND_END_INFO}, NowSecond) when EndTime =< NowSecond ->
  updateCompetitionInfo(CompetitionID, [{#need_for_speed_competition.state, ?NEED_FOR_SPEED_COPETITION_STATE_OVER},
    {#need_for_speed_competition.end_time, NowSecond + ?NEED_FOR_SPEED_DELETE_COMPETITION_WAIT_TIME_SEC}]),
  ?DEBUG_OUT(" NEED_FOR_SPEED_COPETITION_STATE_OVER         ,CompetitionID=~p=", [CompetitionID]),
  competitionEnd(CompetitionID);
ticker(#need_for_speed_competition{
  id = CompetitionID,
  end_time = EndTime,
  state = ?NEED_FOR_SPEED_COPETITION_STATE_OVER}, NowSecond) when EndTime =< NowSecond ->
  ?DEBUG_OUT("NEED_FOR_SPEED_COPETITION_STATE_OVER====DELETE Data========~p~n", [CompetitionID]),
  deleteCompetion(CompetitionID);
ticker(_, _) ->
  ok.

%%双人坐骑进行匹配
match(SelfRoleID, PartnerID) ->
  match0(SelfRoleID,PartnerID),
  {ok, #need_for_speed_athlete{} = AthletePetDoubleMasterInfo} = needForSpeedAthlete:getAthleteInfo(SelfRoleID),
  needForSpeedAthlete:saveAthleteInfo(AthletePetDoubleMasterInfo#need_for_speed_athlete{role_id = SelfRoleID, partner_id = PartnerID, isPetdoubleMaster = true}),
  {ok, #need_for_speed_athlete{} = AthletePartnerInfo} = needForSpeedAthlete:getAthleteInfo(PartnerID),
  needForSpeedAthlete:saveAthleteInfo(AthletePartnerInfo#need_for_speed_athlete{partner_id = SelfRoleID}).

%%单人坐骑进行匹配
%%@return need_for_speed_competition_id
match(SelfRoleID)->
  case get_competition_by_state(?NEED_FOR_SPEED_COPETITION_STATE_MATCHING,1) of
    {ok, #need_for_speed_competition{id = CompetitionID}} ->
      match1(SelfRoleID, CompetitionID);
    {ok, none} ->
      {ok, #need_for_speed_competition{id = CompetitionID}} = createCompetitionInfo(),
      needForSpeedAthlete:saveAthleteInfo(#need_for_speed_athlete{competition_id = CompetitionID, role_id = SelfRoleID}),
      NewAthleteRoleList = [SelfRoleID],
      sendMathInfo2User(NewAthleteRoleList)
  end.
match0(SelfRoleID,PartnerID)->
  case get_competition_by_state(?NEED_FOR_SPEED_COPETITION_STATE_MATCHING,2) of
    {ok, #need_for_speed_competition{id = CompetitionID}} ->
      match1(SelfRoleID, CompetitionID),
      match1(PartnerID, CompetitionID);
    {ok, none} ->
      {ok, #need_for_speed_competition{id = CompetitionID}} = createCompetitionInfo(),
      needForSpeedAthlete:saveAthleteInfo(#need_for_speed_athlete{competition_id = CompetitionID, role_id = SelfRoleID}),
      NewAthleteRoleList = [SelfRoleID],
      sendMathInfo2User(NewAthleteRoleList),
      match1(PartnerID, CompetitionID)
  end.

%%取消匹配
cancelMatch(SelfRoleID, PartnerID) ->
  cancelMatch1(SelfRoleID),
  cancelMatch1(PartnerID).
cancelMatch(SelfRoleID) ->
  cancelMatch1(SelfRoleID).
cancelMatch1(SelfRoleID) ->
  case needForSpeedAthlete:getAthleteInfo(SelfRoleID) of
    {ok, #need_for_speed_athlete{competition_id = CompetitionID}} ->
      needForSpeedAthlete:delAthleteInfo(SelfRoleID),
      {ok, AthleteList} = needForSpeedAthlete:get_copetition_athletes(CompetitionID),
      AthleteRoleIDList = [TempAthlete#need_for_speed_athlete.role_id || TempAthlete <- AthleteList],
      if
        AthleteRoleIDList =:= [] ->
          deleteCompetion(CompetitionID);
        true ->
          sendMathInfo2User(AthleteRoleIDList)
      end;
    {ok, none} ->
      skip
  end,
  ok.

match1(SelfRoleID, CompetitionID) ->
  {ok, AthleteList} = needForSpeedAthlete:get_copetition_athletes(CompetitionID),
  AthleteRoleIDList = [TempAthlete#need_for_speed_athlete.role_id || TempAthlete <- AthleteList],
  NeedForSpeedAthleteMaxNumber = globalCfg:getGlobalCfg(needForSpeedAthleteMaxNumber),
  NeedForSpeedMatchCountDownSec = globalCfg:getGlobalCfg(needForSpeedMatchCountDownSec),
  NewAthleteRoleList = AthleteRoleIDList ++ [SelfRoleID],
  NowSecond = calendar:datetime_to_gregorian_seconds(calendar:local_time()),
  case length(NewAthleteRoleList) >= NeedForSpeedAthleteMaxNumber of
    true ->
      needForSpeedAthlete:saveAthleteInfo(#need_for_speed_athlete{competition_id = CompetitionID, role_id = SelfRoleID}),
      NeedForSpeedCompetitionReadyBeginCountDownSec = globalCfg:getGlobalCfg(needForSpeedCompetitionReadyBeginCountDownSec),
      updateCompetitionInfo(CompetitionID,
        [{#need_for_speed_competition.state, ?NEED_FOR_SPEED_COPETITION_STATE_READY_BEGIN},
          {#need_for_speed_competition.end_time, NeedForSpeedCompetitionReadyBeginCountDownSec + NowSecond}
        ]),
      ?DEBUG_OUT("==NEED_FOR_SPEED_COPETITION_STATE_READY_BEGIN================!!!!!!===~n", []),
      sendMathInfo2User(NewAthleteRoleList),
      createActiveMap(NewAthleteRoleList);
    _ ->
      ?DEBUG_OUT("==NeedForSpeedAthleteMaxNumber====================~p~n", [{NewAthleteRoleList, NeedForSpeedAthleteMaxNumber}]),
      needForSpeedAthlete:saveAthleteInfo(#need_for_speed_athlete{competition_id = CompetitionID, role_id = SelfRoleID}),
      updateCompetitionInfo(CompetitionID, [{#need_for_speed_competition.end_time, NeedForSpeedMatchCountDownSec + NowSecond}]),
      sendMathInfo2User(NewAthleteRoleList)
  end.
%%将匹配信息发送给客户端
sendMathInfo2User(RoleIDList) ->
  NeedForSpeedMatchCountDownSec = globalCfg:getGlobalCfg(needForSpeedMatchCountDownSec),
  ?DEBUG_OUT("==sendMathInfo2User====================~p~n", [{RoleIDList,NeedForSpeedMatchCountDownSec}]),
  sendMathInfo2User1(RoleIDList, length(RoleIDList), NeedForSpeedMatchCountDownSec).
sendMathInfo2User1([RoleID | T], CurrentRoleNumber, CountDownSec) ->
  ?DEBUG_OUT("==sendMathInfo2User====================~p~n", [{CurrentRoleNumber,CountDownSec}]),
  gsSendMsg:sendNetMsgByRoleID(RoleID, #pk_GS2U_NeedForSpeedMatchInfo{currentPlayerNumber = CurrentRoleNumber, countdownSec = CountDownSec}),
  sendMathInfo2User1(T, CurrentRoleNumber, CountDownSec);
sendMathInfo2User1([], _, _) ->
  ok.

exitCompetition(RoleID) when is_number(RoleID) ->
  case needForSpeedAthlete:getAthleteInfo(RoleID) of
    {ok, #need_for_speed_athlete{} = AthleteInfo} ->
      exitCompetition(AthleteInfo);
    {ok, none} ->
      skip
  end;
%%主位玩家退出比赛
exitCompetition(#need_for_speed_athlete{isPetdoubleMaster = true, partner_id = PartnerID} = MatsetAthleteInfo) ->
  case needForSpeedAthlete:getAthleteInfo(PartnerID) of
    {ok, PartnerAthleteInfo} ->
      %%  如果主驾驶位玩家要退出，先退出副驾驶位玩家，再退出主驾驶玩家
      exitCompetition1(PartnerAthleteInfo),
      gsSendMsg:sendRolePidMsgByRoleID(PartnerID, needForSpeedExitFromSence, []);
    _ -> skip
  end,
  exitCompetition1(MatsetAthleteInfo);
%%副位玩家退出竞赛
exitCompetition(#need_for_speed_athlete{isPetdoubleMaster = false, partner_id = PartnerID} = AthleteInfo) when PartnerID > 0 ->
  case needForSpeedAthlete:getAthleteInfo(PartnerID) of
    {ok, MatsetAthleteInfo} ->
      %%  如果是副驾驶玩家退出比赛，则清楚主驾驶玩家身上绑定的信息
      needForSpeedAthlete:saveAthleteInfo(MatsetAthleteInfo#need_for_speed_athlete{isPetdoubleMaster = false, partner_id = 0});
    _ -> skip
  end,
  exitCompetition1(AthleteInfo);
exitCompetition(#need_for_speed_athlete{} = AthleteInfo) ->
  exitCompetition1(AthleteInfo).
exitCompetition1(#need_for_speed_athlete{role_id = RoleID, competition_id = CompetitionID}) ->
  needForSpeedAthlete:delAthleteInfo(RoleID),
  case needForSpeedAthlete:get_copetition_athletes(CompetitionID) of
    {ok, []} ->
      deleteCompetion(CompetitionID);
    _ ->
      skip
  end.

%%创建活动地图
createActiveMap(RoleIDList) ->
  ?DEBUG_OUT("==createActiveMap===RoleIDList==~p~n", [RoleIDList]),
  MapInfoList = globalCfg:getGlobalCfgList(needForSpeedMapInfo),
  [[MapID | PosList]] = misc:randUniqueFromList(1, MapInfoList),
  NewRoleIDList = needForSpeedAthlete:deleteDoubblePetParterAthleteID(RoleIDList),
  core:sendMsgToMapMgr(MapID, createActivityMap, {MapID, 1, {NewRoleIDList, PosList}}).
%%将用户传送到活动地图
transform2ActiveMap([RoleID | RoleIDList], MapID, MapPid, [[X, Y] | Postions]) ->
  gsSendMsg:sendRolePidMsgByRoleID(RoleID, transfer2NeedForSpeedMap, [MapID, MapPid, X, Y]),
  transform2ActiveMap(RoleIDList, MapID, MapPid, Postions);
transform2ActiveMap([], _, _, _) ->
  ok.

%%通过赛场状态来获取赛场信息
%%@return {ok,none}|{ok,#need_for_speed_competition{}}
get_competition_by_state(CompetitionState, NeedSiteNumber) ->
  CompetitionList = ets:tab2list(need_for_speed_competition),
  get_competition_by_state(CompetitionState, lists:reverse(CompetitionList), NeedSiteNumber).
get_competition_by_state(CompetitionState, [#need_for_speed_competition{id = CompetionID, state = CompetitionState} = NeedForSpeedCompetition | CompetitionList], NeedSiteNumber) ->
  {ok, Anthletes} = needForSpeedAthlete:get_copetition_athletes(CompetionID),
  NeedForSpeedAthleteMaxNumber = globalCfg:getGlobalCfg(needForSpeedAthleteMaxNumber),
  ?DEBUG_OUT("get_competition_by_state===============~p~n",[{NeedForSpeedAthleteMaxNumber,length(Anthletes),NeedSiteNumber}]),
  case (NeedForSpeedAthleteMaxNumber - length(Anthletes)) >= NeedSiteNumber of
    true -> {ok, NeedForSpeedCompetition};
    _ ->
      get_competition_by_state(CompetitionState, CompetitionList, NeedSiteNumber)
  end;
get_competition_by_state(CompetitionState, [_H | CompetitionList], NeedSiteNumber) ->
  get_competition_by_state(CompetitionState, CompetitionList, NeedSiteNumber);
get_competition_by_state(_CompetitionState, [], _NeedSiteNumber) ->
  {ok, none}.
%%通过id来获取赛场信息
get_competition_by_id(CompetitionID) ->
  case ets:lookup(need_for_speed_competition, CompetitionID) of
    [] -> {ok, none};
    [CompetitionInfo] ->
      {ok, CompetitionInfo}
  end.

%%修改港口竞速状态
updateCompetitionInfo(CompetitionID, KeyValueList) ->
  ets:update_element(need_for_speed_competition, CompetitionID, KeyValueList).


%%获取竞技场新的索引
getNewID() ->
  ets:update_counter(?ETS_NEED_FOR_SPEED_COMPETITION_INDEX, 1, 1).

%%玩家撞到分数线
collideScoreLine(#need_for_speed_athlete{role_id = PlayerID, current_score_line_id = ScoreLineID} = AthleteInfo, _CurrentPos, CollideScoreLineID) ->
  #needForSpeedScoreLineCfg{isEndLine = IsEndLine
    %check_area_left_top = [LT_X, LT_Y], check_area_right_top = [RT_X, RT_Y],
    %check_area_right_bottom = [RB_X, RB_Y], check_area_left_bottom = [LB_X, LB_Y]
  } = getCfg:getCfgByArgs(cfg_needForSpeedScoreLine, CollideScoreLineID),


  ?DEBUG_OUT("===collideScoreLine======PlayerID==========~p~n", [PlayerID]),

  LastCollideScoreLineID = CollideScoreLineID - 1,
%%  IsInArea = misc:isInArea(CurrentPos, {LT_X, LT_Y}, {RT_X, RT_Y}, {RB_X, RB_Y}, {LB_X, LB_Y}),
  IsInArea = true,
  ?DEBUG_OUT("===collideScoreLine====~p~n", [{IsInArea, ScoreLineID, LastCollideScoreLineID}]),
  if
  %%撞到了路面上的分数线
    IsInArea and (LastCollideScoreLineID =:= ScoreLineID) ->
      collideScoreLine(AthleteInfo, IsEndLine);
    true ->
      skip
  end.
%%撞到了路面上的分数线
collideScoreLine(AthleteInfo, IsEndLine) ->
  NowMs = time:now_microseconds(),
  if
    IsEndLine =:= 1 ->
      #need_for_speed_athlete{competition_id = CompetitionID, current_circle = CurrentCircle} = AthleteInfo,
      NewAthleteInfo = AthleteInfo#need_for_speed_athlete{current_score_line_id = 0, current_circle = CurrentCircle + 1, collide_line_ms = NowMs};
    true ->
      #need_for_speed_athlete{competition_id = CompetitionID, current_score_line_id = CurrentLineID, current_circle = CurrentCircle} = AthleteInfo,
      NewAthleteInfo = AthleteInfo#need_for_speed_athlete{competition_id = CompetitionID, current_score_line_id = CurrentLineID + 1, collide_line_ms = NowMs, current_circle = CurrentCircle}
  end,
  LastIsWin = isWin(CompetitionID),
  ?DEBUG_OUT("===success one ==NewAthleteInfo=~p~n", [NewAthleteInfo]),
  needForSpeedAthlete:saveAthleteInfo(NewAthleteInfo),
  CurrentIsWin = isWin(CompetitionID),
  ?DEBUG_OUT("==LastIsWin======~p~n", [{LastIsWin, CurrentIsWin}]),
  if
    (LastIsWin =:= false) and (CurrentIsWin =:= true) ->
      %%玩家第一次获胜，尝试修改剩余时间
      NowSecond = calendar:datetime_to_gregorian_seconds(calendar:local_time()),
      {ok, #need_for_speed_competition{end_time = EndTime}} = get_competition_by_id(CompetitionID),
      %% 刚竞速有人第一次获胜之后，重置倒计时
      NewCountDownSec = globalCfg:getGlobalCfg(needForSpeedWinCountDownSec),
      if
        (EndTime - NowSecond) > NewCountDownSec ->
          updateCompetitionInfo(CompetitionID, [{#need_for_speed_competition.end_time, NowSecond + NewCountDownSec}]);
        true ->
          ok
      end,
      flashCompletionInfo2Client(CompetitionID, CurrentIsWin);
    true ->
      flashCompletionInfo2Client(CompetitionID, CurrentIsWin)
  end.
%%刷新比赛信息给客户端,当有玩家撞击到分数线时
flashCompletionInfo2Client(CompetitionID, IsWin) ->
%%  {ok, AthleteList} = needForSpeedAthlete:get_copetition_athletes(CompetitionID),
  {ok, #need_for_speed_competition{end_time = EndTime}} = get_competition_by_id(CompetitionID),
  NowSecond = calendar:datetime_to_gregorian_seconds(calendar:local_time()),
  LastTime = EndTime - NowSecond,
  {ok,SortAthleteList} = needForSpeedAthlete:get_copetition_athletes(CompetitionID),
  FilterSortAthleteList = needForSpeedAthlete:sortAthleteListRemoveDoublePet(CompetitionID),
  FilterSortAthleteRoleIDList = [TempROleID || #need_for_speed_athlete{role_id = TempROleID} <- FilterSortAthleteList],
  flashCompletionInfo2Client1(SortAthleteList, FilterSortAthleteRoleIDList, IsWin, LastTime),
  ok.
flashCompletionInfo2Client1([
  #need_for_speed_athlete{role_id = RoleID,
    competition_id = CompetitionID,
    current_circle = CurrentCircle,
    isPetdoubleMaster = false,
    partner_id = PartnerID} | SortAthleteList], FilterSortAthleteRoleIDList, IsWin, LastTime) when PartnerID > 0 ->
  [FirstRoleIDRoleID | _] = FilterSortAthleteRoleIDList,
  [#rec_base_role{roleName = FirstRoleName}] = ets:lookup(ets_rec_base_role, FirstRoleIDRoleID),
  ?DEBUG_OUT("flashCompletionInfo2Client1===============~p~n",[{RoleID,PartnerID,FilterSortAthleteRoleIDList}]),
  Index = misc:getListPos(PartnerID, FilterSortAthleteRoleIDList),
  %AllCircle = globalCfg:getGlobalCfg(needForSpeedMaxCircle),
  {ok, #need_for_speed_competition{state = CompletionState}} = get_competition_by_id(CompetitionID),
  NewClientMSg = #pk_GS2U_NeedForSpeedCompletionInfoList{
    completionState = CompletionState,
    selfIndex = Index,
    lastTime = LastTime,
    firstRoleName = FirstRoleName,
    firstIsWin = IsWin,
    currentCircle = CurrentCircle},
  gsSendMsg:sendNetMsgByRoleID(RoleID, NewClientMSg),
  flashCompletionInfo2Client1(SortAthleteList, FilterSortAthleteRoleIDList, IsWin, LastTime);
flashCompletionInfo2Client1([
  #need_for_speed_athlete{role_id = RoleID,
    competition_id = CompetitionID,
    current_circle = CurrentCircle} | SortAthleteList], FilterSortAthleteRoleIDList, IsWin, LastTime) ->
  [FirstRoleIDRoleID | _] = FilterSortAthleteRoleIDList,
  [#rec_base_role{roleName = FirstRoleName}] = ets:lookup(ets_rec_base_role, FirstRoleIDRoleID),
  Index = misc:getListPos(RoleID, FilterSortAthleteRoleIDList),
  {ok, #need_for_speed_competition{state = CompletionState}} = get_competition_by_id(CompetitionID),
  NewClientMSg = #pk_GS2U_NeedForSpeedCompletionInfoList{
    completionState = CompletionState,
    selfIndex = Index,
    lastTime = LastTime,
    firstRoleName = FirstRoleName,
    firstIsWin = IsWin,
    currentCircle = CurrentCircle},
  gsSendMsg:sendNetMsgByRoleID(RoleID, NewClientMSg),
  ?DEBUG_OUT("NewClientMSg==========111=====~p~n",[NewClientMSg]),
  flashCompletionInfo2Client1(SortAthleteList, FilterSortAthleteRoleIDList, IsWin, LastTime);
flashCompletionInfo2Client1([], _FilterSortAthleteRoleIDList, _IsWin, _LastTime) ->
  ok.

%%刷新比赛结束信息到客户端
flashCompletionEndInfo2Client(CompetitionID) ->
%%  {ok, AthleteList} = needForSpeedAthlete:get_copetition_athletes(CompetitionID),
  SortAthleteList = needForSpeedAthlete:sortAthleteList(CompetitionID),
  FilterSortAthleteList = needForSpeedAthlete:deleteDoubblePetParterAthlete(SortAthleteList),
  GetAthleteNames = fun(#need_for_speed_athlete{role_id = RoleID, partner_id = PartnerID1}) ->
    [#rec_base_role{roleName = MasterRoleName}] = ets:lookup(ets_rec_base_role, RoleID),
    if
      PartnerID1 > 0 ->
        [#rec_base_role{roleName = PartnerName}] = ets:lookup(ets_rec_base_role, PartnerID1),
        [MasterRoleName, PartnerName];
      true ->
        [MasterRoleName]
    end
                    end,
  case FilterSortAthleteList of
    [] ->
      FirstRoleNames = [],
      SecondRoleName = [],
      ThirdRoleName = [];
    [Athlete1] ->
      FirstRoleNames = GetAthleteNames(Athlete1),
      SecondRoleName = [],
      ThirdRoleName = [];
    [Athlete1, Athlete2] ->
      FirstRoleNames = GetAthleteNames(Athlete1),
      SecondRoleName = GetAthleteNames(Athlete2),
      ThirdRoleName = [];
    [Athlete1, Athlete2, Athlete3 | _] ->
      FirstRoleNames = GetAthleteNames(Athlete1),
      SecondRoleName = GetAthleteNames(Athlete2),
      ThirdRoleName = GetAthleteNames(Athlete3)
  end,
  ?DEBUG_OUT("========flashCompletionEndInfo2Client====SortAthleteList=======~p~n", [SortAthleteList]),
  ClientMSg = #pk_GS2U_NeedForSpeedCompletionEndInfoList{
    firstRoleNames = FirstRoleNames,
    secondRoleNames = SecondRoleName,
    thirdRoleNames = ThirdRoleName},
  flashCompletionEndInfo2Client2(ClientMSg, SortAthleteList).
flashCompletionEndInfo2Client2(ClientMSg, [#need_for_speed_athlete{role_id = RoleID} | SortAthleteList]) ->
  {ok, Index} = needForSpeedAthlete:getAthleteIndex(RoleID),
  ?DEBUG_OUT("============flashCompletionEndInfo2Client2=======~p~n", [{RoleID, ClientMSg#pk_GS2U_NeedForSpeedCompletionEndInfoList{selfIndex = Index}}]),
  gsSendMsg:sendNetMsgByRoleID(RoleID, ClientMSg#pk_GS2U_NeedForSpeedCompletionEndInfoList{selfIndex = Index}),
  flashCompletionEndInfo2Client2(ClientMSg, SortAthleteList);
flashCompletionEndInfo2Client2(_ClientMSg, []) ->
  ok.

%%是否有人获胜
isWin(CompetitionID) ->
  {ok, AthleteList} = needForSpeedAthlete:get_copetition_athletes(CompetitionID),
  AllCircle = globalCfg:getGlobalCfg(needForSpeedMaxCircle),
  FilterAthleteList = lists:filter(
    fun(#need_for_speed_athlete{current_circle = CurrentCricle}) ->
      AllCircle =:= CurrentCricle
    end, AthleteList),
  length(FilterAthleteList) > 0.

%%创建新的活动场景
createCompetitionInfo() ->
  NowSecond = calendar:datetime_to_gregorian_seconds(calendar:local_time()),
  NeedForSpeedMatchCountDownSec = globalCfg:getGlobalCfg(needForSpeedMatchCountDownSec),
  CompetitionID = getNewID(),
  CompetitionInfo = #need_for_speed_competition{
    id = CompetitionID,
    state = ?NEED_FOR_SPEED_COPETITION_STATE_MATCHING,
    end_time = NeedForSpeedMatchCountDownSec + NowSecond},
  ets:insert(need_for_speed_competition, CompetitionInfo),
  {ok, CompetitionInfo}.

%%删除掉比赛场景
deleteCompetion(CompetitionID) ->
  ets:delete(need_for_speed_competition, CompetitionID),
  needForSpeedAthlete:delCompetitionAllAthlete(CompetitionID).
%%同步赛场状态信息给参赛的玩家
syncCompetionState2Athlete(_CompetitionID, _State) ->
  ok.

%sendMsg2CompetitionRolesPid(CompetitionID, MsgHandle, MsgInfo) ->
%  {ok, AthleteList} = needForSpeedAthlete:get_copetition_athletes(CompetitionID),
%  lists:foreach(
%    fun(Athlete) ->
%      sendMsg2RolePid(Athlete#need_for_speed_athlete.role_id, MsgHandle, MsgInfo)
%    end, AthleteList).
sendMsg2RolePid(RoleID, MsgHandle, MsgInfo) ->
  ?DEBUG_OUT("=sendMsg2RolePid =RoleID==~p~n", [RoleID]),
  case ets:lookup(ets_rec_OnlinePlayer, RoleID) of
    [#rec_OnlinePlayer{pid = Pid}] ->
      psMgr:sendMsg2PS(Pid, MsgHandle, MsgInfo);
    _ ->
      skip
  end.
%% 根据名次发放大奖励,策划没时间做逻辑配置，这次写到代码里面了
competitionSuccessAward(CompetitionID) when is_number(CompetitionID) ->
  AthleteSortList = needForSpeedAthlete:sortAthleteListRemoveDoublePet(CompetitionID),
  competitionSuccessAward1(AthleteSortList).

competitionSuccessAward1([]) ->
  ok;
competitionSuccessAward1([#need_for_speed_athlete{role_id = RoleID} | T]) ->
  [#rec_base_role{} = BaseRole] = ets:lookup(ets_rec_base_role, RoleID),
  {ok, Index} = needForSpeedAthlete:getAthleteIndex(RoleID),
  ItemInfoArgu = getAwardInfo(BaseRole, Index),
  Argu2 = logicArguLib:getMailItemsArgu([], [Index], ItemInfoArgu),
  Argu = logicArguLib:getRoleBaseInfoArgu(BaseRole),
  R = logicLib:runLogicGroup(?LOGIC_GROUP_ID_NEED_FOR_SPEED_COMPATITION_END_AWARD, [Argu, Argu2]),
  ?DEBUG_OUT("=======competitionSuccessAward1===========RoleID=~p,R=~p~n", [RoleID, R]),
  competitionSuccessAward1(T).

%%活动结束
competitionEnd(CompetitionID) when is_number(CompetitionID) ->
  {ok, AthleteSortList} = needForSpeedAthlete:get_copetition_athletes(CompetitionID),
  competitionEnd1(AthleteSortList).

competitionEnd1([]) ->
  ok;
competitionEnd1([#need_for_speed_athlete{role_id = RoleID} | T]) ->
  gsSendMsg:sendRolePidMsgByRoleID(RoleID, needForSpeedCompetitionOver, []),
  competitionEnd1(T).

%%获取奖励信息
getAwardInfo(#rec_base_role{level = Lv}, Index) ->
  #needForSpeedRandomAwardCfg{awardInfo = AwardInfo} = getCfg:getCfgByArgs(cfg_needForSpeedRandomAward, Index),
  [{ItemID, ItemNumber, IsBind} || {MinLv, MaxLv, ItemNumber, ItemID, IsBind} <- AwardInfo, MinLv =< Lv, MaxLv >= Lv].