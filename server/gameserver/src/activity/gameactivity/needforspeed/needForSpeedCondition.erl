%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 十一月 2016 15:37
%%%-------------------------------------------------------------------
-module(needForSpeedCondition).
-author("wenshaofei").
-include("../../activityPrivate.hrl").
-include("../activityPhaseDefine.hrl").
-include("needForSpeedPrivate.hrl").
%% API
-compile(export_all).
%%港口竞速比赛状态是否在配置指定的状态内
needForSpeedCompetitionStateIn(ProgramArgs, #conditionCfg{argu = CfgStateList} = Cfg) ->
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, ProgramArgs),
  case needForSpeedAthlete:getAthleteInfo(RoleID) of
    {ok, none} ->
      conditionLib:getFailReturn(Cfg);
    {ok, #need_for_speed_athlete{competition_id = CompetitionID}} ->
      case needForSpeedLogic:get_competition_by_id(CompetitionID) of
        {ok, none} ->
          conditionLib:getFailReturn(Cfg);
        {ok, #need_for_speed_competition{state = State}} ->
          case lists:member(State, CfgStateList) of
            true ->
              conditionLib:getSuccessReturn(Cfg);
            _ ->
              conditionLib:getFailReturn(Cfg)
          end
      end
  end.
%%判断用户参加港口竞速活动
joinNeedForSpeedCompetition(ProgramArgs, #conditionCfg{} = Cfg) ->
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, ProgramArgs),
  ?DEBUG_OUT("==========~p~n",[{RoleID,needForSpeedAthlete:getAthleteInfo(RoleID)}]),
  case needForSpeedAthlete:getAthleteInfo(RoleID) of
    {ok, none} ->
      conditionLib:getFailReturn(Cfg);
    {ok, #need_for_speed_athlete{}} ->
      conditionLib:getSuccessReturn(Cfg)
  end.
%%判断用户没有参加港口竞速活动
notJoinNeedForSpeedCompetition(ProgramArgs, #conditionCfg{} = Cfg) ->
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, ProgramArgs),
  case needForSpeedAthlete:getAthleteInfo(RoleID) of
    {ok, none} ->
      conditionLib:getSuccessReturn(Cfg);
    {ok, #need_for_speed_athlete{}} ->
      conditionLib:getFailReturn(Cfg)
  end.
%%监测用户的名次在指定的名次小于等于
checkUserIndexLe(ProgramArgs, #conditionCfg{argu = [IndexCfg]} = Cfg) ->
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, ProgramArgs),
  case needForSpeedAthlete:getAthleteIndex(RoleID) of
    {ok, Index} when Index =< IndexCfg ->
      conditionLib:getSuccessReturn(Cfg);
    _ ->
      conditionLib:getFailReturn(Cfg)
  end.
%%监测用户的名次在指定的名次大于等于
checkUserIndexGe(ProgramArgs, #conditionCfg{argu = [IndexCfg]} = Cfg) ->
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, ProgramArgs),
  case needForSpeedAthlete:getAthleteIndex(RoleID) of
    {ok, Index} when Index >= IndexCfg ->
      conditionLib:getSuccessReturn(Cfg);
    _ ->
      conditionLib:getFailReturn(Cfg)
  end.
%%监测用户的名次在指定的名次于等于
checkUserIndexEq(ProgramArgs, #conditionCfg{argu = [IndexCfg]} = Cfg) ->
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, ProgramArgs),
  case needForSpeedAthlete:getAthleteIndex(RoleID) of
    {ok, IndexCfg}  ->
      conditionLib:getSuccessReturn(Cfg);
    _ ->
      conditionLib:getFailReturn(Cfg)
  end.

%%校验有效参与次数是否大于等于指定的值
effectJoinNumberG(Args, #conditionCfg{argu = [ MinValue]} = Cfg) ->
%%  CurrentNumber = playerDaily:getDailyCounter(DailyType, DailyID),
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
  {ok,#need_for_speed_athlete{effect_join_number = CurrentNumber}}=needForSpeedAthlete:getAthleteInfo(RoleID),
  ?DEBUG_OUT("====effectJoinNumberG==========~p~n",[{CurrentNumber,MinValue}]),
  if
    CurrentNumber > MinValue ->
      conditionLib:getSuccessReturn(Cfg);
    true ->
      conditionLib:getFailReturn(Cfg)
  end.

%%校验有效参与次数是否小于等于指定的值
effectJoinNumberLE(Args, #conditionCfg{argu = [ MaxValue]} = Cfg) ->
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
  {ok,#need_for_speed_athlete{effect_join_number = CurrentNumber}}=needForSpeedAthlete:getAthleteInfo(RoleID),
  ?DEBUG_OUT("====effectJoinNumberLE=======RoleID===~p~n",[{RoleID,CurrentNumber,MaxValue}]),
  if
    CurrentNumber =< MaxValue ->
      conditionLib:getSuccessReturn(Cfg);
    true ->
      conditionLib:getFailReturn(Cfg)
  end.

%%校验有效参与次数是否大于等于指定的值
effectJoinNumberGe(Args, #conditionCfg{argu = [ MinValue]} = Cfg) ->
%%  CurrentNumber = playerDaily:getDailyCounter(DailyType, DailyID),
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
  {ok,#need_for_speed_athlete{effect_join_number = CurrentNumber}}=needForSpeedAthlete:getAthleteInfo(RoleID),
  if
    CurrentNumber >= MinValue ->
      conditionLib:getSuccessReturn(Cfg);
    true ->
      conditionLib:getFailReturn(Cfg)
  end.

%%校验有效参与次数是否小于等于指定的值
effectJoinNumberL(Args, #conditionCfg{argu = [ MaxValue]} = Cfg) ->
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, Args),
  {ok,#need_for_speed_athlete{effect_join_number = CurrentNumber}}=needForSpeedAthlete:getAthleteInfo(RoleID),
  if
    CurrentNumber < MaxValue ->
      conditionLib:getSuccessReturn(Cfg);
    true ->
      conditionLib:getFailReturn(Cfg)
  end.