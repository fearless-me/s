%%%-------------------------------------------------------------------
%%% @author wenshaofei
%%% @copyright (C) 2016, <COMPANY>
%%% @doc 实现玩家数据条件校验的业务逻辑
%%%
%%% @end
%%% Created : 06. 九月 2016 10:41
%%%-------------------------------------------------------------------
-module(mapCondation).
-author("wenshaofei").
-include("../private_logic.hrl").
-include("../../world/mapPrivate.hrl").
%% API
-compile(export_all).
%%校验角色当前所在地图id是否在配置表内
currentMapIDInCfg(Args, #conditionCfg{argu = MapIdList} = Cfg) ->
    {ok, #logic_argu{value = CurrentMapID}} = logicLib:getLogicArgu(?LK_CURRENT_MAP_ID, Args),
    case lists:member(CurrentMapID, MapIdList) of
        true -> conditionLib:getSuccessReturn(Cfg);
        _ -> conditionLib:getFailReturn(Cfg)
    end.
%%校验mapID不在配置内
currentMapNotIDInCfg(Args, #conditionCfg{argu = MapIdList} = Cfg) ->
    {ok, #logic_argu{value = CurrentMapID}} = logicLib:getLogicArgu(?LK_CURRENT_MAP_ID, Args),
    case lists:member(CurrentMapID, MapIdList) of
        true ->
            conditionLib:getSuccessReturn(Cfg);
        _ ->
            conditionLib:getFailReturn(Cfg)
    end.

%%校验地图人数已满,此处仅仅配置地图线个数、地图的最大人数是在地图配置文件内配的
mapFull(Args, #conditionCfg{argu = [_MapID, _MaxlineNumber]} = Cfg) ->
    case mapNotFull(Args,Cfg) of
        {fail,_}->
            conditionLib:getSuccessReturn(Cfg);
        _->
            conditionLib:getFailReturn(Cfg)
    end.


%%校验地图人数是没有满,此处仅仅配置地图线个数、地图的最大人数是在地图配置文件内配的
mapNotFull(_Args, #conditionCfg{argu = [MapID, MaxlineNumber]} = Cfg) ->
    MapList= mapMgrState:getMapInfoByMapID(MapID),
    if
        length(MapList) < MaxlineNumber ->
            conditionLib:getSuccessReturn(Cfg);
        length(MapList) >= MaxlineNumber ->
            L = [IsMax || #recMapInfo{isReachMaxNum = IsMax} <- MapList, IsMax =:= false],
            if
                L =:= [] -> conditionLib:getFailReturn(Cfg);
                true ->
                    conditionLib:getSuccessReturn(Cfg)
            end;
        true ->
            conditionLib:getFailReturn(Cfg)
    end.