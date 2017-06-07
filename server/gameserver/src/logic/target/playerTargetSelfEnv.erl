%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc 用户玩家进程环境查找模块，该模块只能用在玩家进行内
%%%
%%% @end
%%% Created : 30. 十一月 2016 9:44
%%%-------------------------------------------------------------------
-module(playerTargetSelfEnv).
-author("wenshaofei").
-include("gsInc.hrl").
%% API
-compile(export_all).
%%获取玩家自己，如果成行传递过来的参数包含了玩家自己数据，则忽略该函数的执行，
%% 如果没有包含则在当前线程内进行查询，如果当前线程内没有找到数据则报错
initSelf(#targetCfg{} = CfgTarget, ProgromArgu) ->
  case logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, ProgromArgu) of
    {ok, #rec_base_role{}} ->
      targetLib:getSuccessReturn(CfgTarget, ProgromArgu);
    _ ->
      case playerState:getRobRoleID() of
        0 ->
          %%只能在玩家进程执行该函数，如果不是玩家进去请手动将参数添加进来
          targetLib:getFailReturn(CfgTarget, <<"error please add it by progrom">>);
        PlayerID ->
          Argu1 = logicArguLib:getRoleBaseInfoArgu(PlayerID),
          targetLib:getSuccessReturn(CfgTarget, [Argu1 | ProgromArgu])
      end
  end.
%%将当前玩家添加到作用目标内
addSelf2Target(#targetCfg{} = CfgTarget, ProgromArgu) ->
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, ProgromArgu),
  case logicLib:getLogicArguValue(?LK_TARGET_ROLE_ID_LIST, ProgromArgu) of
    {ok, TargetRoleIDList} ->
      TargetRoleIDList;
    _ ->
      TargetRoleIDList = []
  end,
  case lists:member(RoleID, TargetRoleIDList) of
    true ->
      NewTargetRoleIDList = TargetRoleIDList;
    _ ->
      NewTargetRoleIDList = [RoleID | TargetRoleIDList]
  end,
  NewProgromArgu = logicLib:replaceLogicArgu(?LK_TARGET_ROLE_ID_LIST, NewTargetRoleIDList, ProgromArgu),
  targetLib:getSuccessReturn(CfgTarget, NewProgromArgu).

%%获取半径内的角色列表
getCircleRoleIDList(#targetCfg{argu = [AoeRange]} = CfgTarget, ProgromArgu) ->
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, ProgromArgu),
  case logicLib:getLogicArguValue(?LK_TARGET_ROLE_ID_LIST, ProgromArgu) of
    {ok, TargetRoleIDList} ->
      TargetRoleIDList;
    _ ->
      TargetRoleIDList = []
  end,
%%  该目标查找功能只能在玩家进行调用
  PList = mapView:getNearViewObject(playerState:getMapPid(), playerState:getMapPlayerEts(), ?ObjTypePlayer, playerState:getPos(), playerState:getGroupID()),
  Target = lists:keyfind(RoleID,#recMapObject.id,PList),
  Fun =
    fun(#recMapObject{id = TempRoleID} = Obj, Acc) ->
      case lists:member(TempRoleID, Acc) of
        true -> Acc;
        _ ->
          case mapView:getObjectDist(Target, Obj) of
            {ok, Dist, _, _} ->
              case Dist =< AoeRange of
                true ->
                  [TempRoleID | Acc];
                _ ->
                  Acc
              end;
            _ ->
              Acc
          end
      end
    end,
  NewTargetRoleIDList = lists:foldl(Fun, TargetRoleIDList, PList),
  NewProgromArgu = logicLib:replaceLogicArgu(?LK_TARGET_ROLE_ID_LIST, NewTargetRoleIDList, ProgromArgu),
  targetLib:getSuccessReturn(CfgTarget, NewProgromArgu).
filterTargetRoleIDByRange(#targetCfg{argu = [AoeRange]} = CfgTarget, ProgromArgu) ->
  filterTargetRoleIDByRange(CfgTarget#targetCfg{argu = [AoeRange, 20]} , ProgromArgu);
%%该功能用于战斗场景，客户端将筛选出来的角色发送到服务器之后，服务器进行校验
%%过滤区域内的角色id,该区域必须在玩家的可视区域范围内，
filterTargetRoleIDByRange(#targetCfg{argu = [AoeRange, _MaxUserNumber]} = CfgTarget, ProgromArgu) ->
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, ProgromArgu),
  {ok, TargetRoleIDList} = logicLib:getLogicArguValue(?LK_TARGET_ROLE_ID_LIST, ProgromArgu),
%%  该目标查找功能只能在玩家进行调用
  PList = mapView:getNearViewObject(playerState:getMapPid(), playerState:getMapPlayerEts(), ?ObjTypePlayer, playerState:getPos(), playerState:getGroupID()),
  Target = lists:keyfind(RoleID,#recMapObject.id,PList),
  Fun =
    fun(#recMapObject{id = TempRoleID} = Obj, Acc) ->
      case lists:member(TempRoleID, TargetRoleIDList) of
        true ->
          case mapView:getObjectDist(Target, Obj) of
                  {ok, Dist, _, _} ->
                    case Dist =< AoeRange of
                      true ->
                        [TempRoleID | Acc];
                      _ ->
                        Acc
                    end;
                  _ ->
                    Acc
                end;
        _ ->
          Acc
      end
    end,
  NewTargetRoleIDList = lists:foldl(Fun, [], PList),
  NewProgromArgu = logicLib:replaceLogicArgu(?LK_TARGET_ROLE_ID_LIST, NewTargetRoleIDList, ProgromArgu),
  targetLib:getSuccessReturn(CfgTarget, NewProgromArgu).
%% 将玩家自己从作用目标中移除掉
removeSelfFromTargetRoleIDList(#targetCfg{} = CfgTarget, ProgromArgu) ->
  {ok, #rec_base_role{roleID = RoleID}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, ProgromArgu),
  {ok, TargetRoleIDList} = logicLib:getLogicArguValue(?LK_TARGET_ROLE_ID_LIST, ProgromArgu),	
  NewProgromArgu = logicLib:replaceLogicArgu(?LK_TARGET_ROLE_ID_LIST, TargetRoleIDList -- [RoleID], ProgromArgu),
  targetLib:getSuccessReturn(CfgTarget, NewProgromArgu).
