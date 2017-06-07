%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. 九月 2016 11:55
%%%-------------------------------------------------------------------
-module(monsterTrigger).
-author("wenshaofei").
-include("../private_logic.hrl").
-include("../../world/mapPrivate.hrl").
%% API
-compile(export_all).

%%召唤怪兽，如果怪兽个数已达到预期则不再召唤。否则自动补全
%%抽空改写该方法，召唤怪兽的功能应该放到地图内部去实现，此处只需要发送一个消息过去
call_monster_not_exist(#triggerCfg{argu = [MapID, BossIDNumberPosList]} = Cfg, ProgramArgs, FromCondationArgu) ->
  MapList = mapMgrState:getMapInfoByMapID(MapID),
  MapMonsterInfoList = lists:map(
    fun(#recMapInfo{pid = MapPid}) ->
      case psMgr:call(MapPid, <<"getMapMonsterEts">>, [], 5000) of
        {ok, MapMonsterEts} ->
          {MapPid, MapMonsterEts};
        R ->
          ?ERROR_OUT("call_monster_not_exist error, error_info=~w,CfgTrigger=~w~n", [R, Cfg]),
          none
      end
    end, MapList),
  call_monster_not_exist1(MapMonsterInfoList, BossIDNumberPosList),
  triggerLib:getSuccessReturn(Cfg, ProgramArgs, FromCondationArgu).
call_monster_not_exist1([], _MonsterIDPosList) ->
  ok;
call_monster_not_exist1([{MapPid, MapMonsterEts} | T], BossIDNumberPosList) ->
  call_monster_not_exist2({MapPid, MapMonsterEts}, BossIDNumberPosList),
  call_monster_not_exist1(T, BossIDNumberPosList);
call_monster_not_exist1([_ | T], MonsterIDPosList) ->
  call_monster_not_exist1(T, MonsterIDPosList).
call_monster_not_exist2({_MapPid, _MapMonsterEts}, []) ->
  ok;
call_monster_not_exist2({MapPid, MapMonsterEts}, [[BossID, Number, X, Y] | BossIDNumberPosList]) ->
  MatchSpec = ets:fun2ms(
    fun(Object) when
      Object#recMapObject.id =:= BossID ->
      Object#recMapObject.code
    end),
  case myEts:selectEts(MapMonsterEts, MatchSpec) of
    [] ->
      psMgr:sendMsg2PS(MapPid, addMonsterToMap, {0, [{BossID, Number, X, Y}]});
    MonsterCodeList when length(MonsterCodeList) >= Number ->
      ok;
    MonsterCodeList ->
      psMgr:sendMsg2PS(MapPid, addMonsterToMap, {0, [{BossID, Number - length(MonsterCodeList), X, Y}]})
  end,
  call_monster_not_exist2({MapPid, MapMonsterEts}, BossIDNumberPosList).


%%强制将怪兽召唤出来
%%@param BossIDNumberPosList=[[BossID, Number, X, Y]]
call_monster_force(#triggerCfg{argu = [MapID, BossIDNumberPosList]} = Cfg, ProgramArgs, FromCondationArgu) ->
  MapList = mapMgrState:getMapInfoByMapID(MapID),
  lists:foreach(
    fun(#recMapInfo{pid = MapPid}) ->
      [psMgr:sendMsg2PS(MapPid, addMonsterToMap, {0, [{BossID, Number, X, Y}]}) || [BossID, Number, X, Y] <- BossIDNumberPosList]
    end, MapList),
  triggerLib:getSuccessReturn(Cfg, ProgramArgs, FromCondationArgu).

%%在当前玩家所在坐标点召唤怪物
call_monster_force_near_current_player_pos(#triggerCfg{argu = BossIDNumberPosList} = Cfg, ProgramArgs, FromCondationArgu) ->
  {ok, #rec_base_role{}} = logicLib:getLogicArguValue(?LK_CURRENT_ROLE_BASE, ProgramArgs),
  MapPid = playerState:getMapPid(),
  {X,Y}=playerState:getPos(),
  [psMgr:sendMsg2PS(MapPid, addMonsterToMap, {0, [{BossID, Number, X, Y}]}) || [BossID, Number] <- BossIDNumberPosList],
  triggerLib:getSuccessReturn(Cfg, ProgramArgs, FromCondationArgu).