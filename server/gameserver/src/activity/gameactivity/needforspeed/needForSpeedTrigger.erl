%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 21. 十一月 2016 15:37
%%%-------------------------------------------------------------------
-module(needForSpeedTrigger).
-author("wenshaofei").
-include("../../activityPrivate.hrl").
-include("../activityPhaseDefine.hrl").
-include("needForSpeedPrivate.hrl").
%% API
-compile(export_all).

%%%%进行比赛匹配，在玩家进程进行调用
match(#triggerCfg{} = Cfg, ProgramArgs, FromCondationArgu) ->
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, ProgramArgs),
  case playerPetDouble:getGuestRoleID() of
    {error, none} ->
      core:sendMsgToActivity(?ActivityType_NeedForSpeed, match, {RoleID});
    {ok, PartnerID} ->
      core:sendMsgToActivity(?ActivityType_NeedForSpeed, match, {RoleID, PartnerID})
  end,
  triggerLib:getSuccessReturn(Cfg, ProgramArgs, FromCondationArgu).

cancelMatch(#triggerCfg{} = Cfg, ProgramArgs, FromCondationArgu) ->
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, ProgramArgs),
  case playerPetDouble:getGuestRoleID() of
    {error, none} ->
      core:sendMsgToActivity(?ActivityType_NeedForSpeed, cancelMatch, {RoleID});
    {ok, PartnerID} ->
      core:sendMsgToActivity(?ActivityType_NeedForSpeed, cancelMatch, {RoleID, PartnerID})
  end,
  triggerLib:getSuccessReturn(Cfg, ProgramArgs, FromCondationArgu).

exitCompetition(#triggerCfg{} = Cfg, ProgramArgs, FromCondationArgu) ->
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, ProgramArgs),
   core:sendMsgToActivity(?ActivityType_NeedForSpeed, exitCompetition, RoleID),
  triggerLib:getSuccessReturn(Cfg, ProgramArgs, FromCondationArgu).
%%从玩家每日计数中同步奖励次数
sync_award_numberFromDailyCounter(#triggerCfg{} = Cfg, ProgramArgs, FromCondationArgu)->
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, ProgramArgs),
%%  CurrentNumber = gsSendMsg:callRolePidMsgByRoleID(RoleID,getDailyCount,{?DailyType_NeedForSpeedJoinNumber, 0}),
  CurrentNumber = playerDaily:getDailyCounter(?DailyType_NeedForSpeedJoinNumber, 0),
  needForSpeedAthlete:saveAthleteInfo(RoleID,[{#need_for_speed_athlete.effect_join_number,CurrentNumber}]),
  ?DEBUG_OUT("sync_award_numberFromDailyCounter===========1========~p~n",[CurrentNumber]),
  triggerLib:getSuccessReturn(Cfg, ProgramArgs, FromCondationArgu).

%%增加1次有效参与次数,
add_award_number_once(#triggerCfg{} = Cfg, ProgramArgs, FromCondationArgu)->
  playerDaily:incDailyCounter(?DailyType_NeedForSpeedJoinNumber, 0),
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, ProgramArgs),
  CurrentNumber=playerDaily:getDailyCounter(?DailyType_NeedForSpeedJoinNumber, 0),
  needForSpeedAthlete:saveAthleteInfo(RoleID,[{#need_for_speed_athlete.effect_join_number,CurrentNumber}]),
  ?DEBUG_OUT("add_award_number_once===================~p~n",[CurrentNumber]),
  triggerLib:getSuccessReturn(Cfg, ProgramArgs, FromCondationArgu).