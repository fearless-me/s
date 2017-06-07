%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%港口竞速目标筛选,公用的无使用环境限制
%%% @end
%%% Created : 30. 十一月 2016 11:55
%%%-------------------------------------------------------------------
-module(needForSpeedPubTarget).
-author("wenshaofei").
-include("needForSpeedPrivate.hrl").
-include("../../activityPrivate.hrl").
-include("../activityPhaseDefine.hrl").
%%-include("gsInc.hrl").
%% API
-compile(export_all).


%%获取玩家自己，获取排名区间的用户id
getRoleIDsByRankSpace(#targetCfg{argu = [RankBegin, RankEnd]} = CfgTarget, ProgromArgu) ->
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, ProgromArgu),
  case needForSpeedAthlete:getAthleteInfo(RoleID) of
    {ok, none} ->
      targetLib:getSuccessReturn(CfgTarget, ProgromArgu);
    {ok, #need_for_speed_athlete{competition_id = CompetitionID}} ->
      SortList = needForSpeedAthlete:sortAthleteListRemoveDoublePet(CompetitionID),
      SubList =
        case length(SortList) >= RankBegin of
          true -> lists:sublist(SortList, RankBegin, RankEnd);
          false ->
            []
        end,
      RankTargetRoleIDs = [TargetRoleID || #need_for_speed_athlete{role_id = TargetRoleID} <- SubList],
      case logicLib:getLogicArguValue(?LK_TARGET_ROLE_ID_LIST, ProgromArgu) of
        {ok, TargetRoleIDList} ->
          TargetRoleIDList;
        _ ->
          TargetRoleIDList = []
      end,
      NewTargetRoleIDList = misc:takeRepeatMember(TargetRoleIDList, RankTargetRoleIDs),
      NewProgromArgu = logicLib:replaceLogicArgu(?LK_TARGET_ROLE_ID_LIST, NewTargetRoleIDList, ProgromArgu),
      targetLib:getSuccessReturn(CfgTarget, NewProgromArgu)
  end.


%%将港口竞速的副驾驶位玩家加入到目标列表
addPetCopilot2Target(#targetCfg{} = CfgTarget, ProgromArgu) ->
  case logicLib:getLogicArguValue(?LK_TARGET_ROLE_ID_LIST, ProgromArgu) of
    {ok, TargetRoleIDList} ->
      TargetRoleIDList;
    _ ->
      TargetRoleIDList = []
  end,
  NewTargetRoleIDList =
    lists:foldl(
      fun(RoleID, Acc) ->
        case needForSpeedAthlete:getAthleteInfo(RoleID) of
          {ok, #need_for_speed_athlete{isPetdoubleMaster = true, partner_id = PartnerID}} ->
            case lists:member(PartnerID, Acc) of
              true ->
                [RoleID | Acc];
              _ ->
                [RoleID, PartnerID | Acc]
            end;
          _ ->
            [RoleID | Acc]
        end
      end, [], TargetRoleIDList),
  NewProgromArgu = logicLib:replaceLogicArgu(?LK_TARGET_ROLE_ID_LIST, NewTargetRoleIDList, ProgromArgu),
  targetLib:getSuccessReturn(CfgTarget, NewProgromArgu).
%%将副驾驶玩家从目标列表内移除掉
removePetCopilotInTarget(#targetCfg{} = CfgTarget, ProgromArgu) ->
  case logicLib:getLogicArguValue(?LK_TARGET_ROLE_ID_LIST, ProgromArgu) of
    {ok, TargetRoleIDList} ->
      TargetRoleIDList;
    _ ->
      TargetRoleIDList = []
  end,
  DoublePetRoldIDList =
    lists:foldl(
      fun(RoleID, Acc) ->
        case needForSpeedAthlete:getAthleteInfo(RoleID) of
          {ok, #need_for_speed_athlete{isPetdoubleMaster = true}} ->
                [RoleID | Acc];
          _ ->
            Acc
        end
      end, [], TargetRoleIDList),
  NewTargetRoleIDList = misc:takeRepeatMember(TargetRoleIDList, DoublePetRoldIDList),
  NewProgromArgu = logicLib:replaceLogicArgu(?LK_TARGET_ROLE_ID_LIST, NewTargetRoleIDList, ProgromArgu),
  targetLib:getSuccessReturn(CfgTarget, NewProgromArgu).
%%当前操作玩家的主驾驶用户添加到目标列表
addCurrentMasterInTarget(#targetCfg{} = CfgTarget, ProgromArgu) ->
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, ProgromArgu),
  case logicLib:getLogicArguValue(?LK_TARGET_ROLE_ID_LIST, ProgromArgu) of
    {ok, TargetRoleIDList} ->
      TargetRoleIDList;
    _ ->
      TargetRoleIDList = []
  end,
  case needForSpeedAthlete:getAthleteInfo(RoleID) of
    #need_for_speed_athlete{partner_id =  PartnerID,isPetdoubleMaster = false}->
      NewTargetRoleIDList = misc:takeRepeatMember(TargetRoleIDList, [PartnerID]);
    _ ->
      NewTargetRoleIDList=TargetRoleIDList
  end,
  NewProgromArgu = logicLib:replaceLogicArgu(?LK_TARGET_ROLE_ID_LIST, NewTargetRoleIDList, ProgromArgu),
  targetLib:getSuccessReturn(CfgTarget, NewProgromArgu).
%%将当前用户的主驾驶用户从目标筛选器内移除掉
removeCurrentMasterInTarget(#targetCfg{} = CfgTarget, ProgromArgu) ->
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, ProgromArgu),
  case logicLib:getLogicArguValue(?LK_TARGET_ROLE_ID_LIST, ProgromArgu) of
    {ok, TargetRoleIDList} ->
      TargetRoleIDList;
    _ ->
      TargetRoleIDList = []
  end,
  case needForSpeedAthlete:getAthleteInfo(RoleID) of
    #need_for_speed_athlete{partner_id =  PartnerID,isPetdoubleMaster = false}->
      NewTargetRoleIDList = lists:delete(PartnerID,TargetRoleIDList);
    _ ->
      NewTargetRoleIDList=TargetRoleIDList
  end,
  NewProgromArgu = logicLib:replaceLogicArgu(?LK_TARGET_ROLE_ID_LIST, NewTargetRoleIDList, ProgromArgu),
  targetLib:getSuccessReturn(CfgTarget, NewProgromArgu).