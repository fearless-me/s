%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20161215
%%%-------------------------------------------------------------------
-module(acMoneyDungeonState).
-author("meitianyang").

-include("acMoneyDungeonPrivate.hrl").

%% API
-compile(export_all).

%%-------------------------------------------------------------------
%% 获取缓存的地图信息列表
-spec getMapInfoList() -> [#recMapInfo{}, ...].
getMapInfoList() ->
  case get('ListMapInfo') of
    undefined -> [];
    L -> L
  end.

%%-------------------------------------------------------------------
%% 查找指定的地图信息
-spec getMapInfoByRoleID(RoleID::uint64()) -> #recMapInfo{} | false.
getMapInfoByRoleID(RoleID) ->
  lists:keyfind(RoleID, #recMapInfo.creator, getMapInfoList()).
-spec getMapInfoByMapPid(MapPid::pid()) -> #recMapInfo{} | false.
getMapInfoByMapPid(MapPid) ->
  lists:keyfind(MapPid, #recMapInfo.mapPID, getMapInfoList()).

%%-------------------------------------------------------------------
%% 设置新的地图信息列表（可用于外部批量操作）
-spec setMapInfoList(ListMapInfoNew::[#recMapInfo{}, ...]) -> ListMapInfoOld :: [#recMapInfo{}, ...] | undefined.
setMapInfoList(ListMapInfoNew) ->
  put('ListMapInfo', ListMapInfoNew).

%%-------------------------------------------------------------------
%% 添加新的地图信息（需要外部逻辑保证无重复数据添加，否则可能覆盖正在使用的数据）
-spec addMapInfo(MapInfo::#recMapInfo{}) -> ListMapInfoOld :: [#recMapInfo{}, ...] | undefined.
addMapInfo(MapInfo) ->
  setMapInfoList([MapInfo | getMapInfoList()]).

%%-------------------------------------------------------------------
%% 更新指定的地图信息（可能会导致新的元素加入，用作添加时效率比addMap/1要低）
-spec updateMapInfo(MapInfo::#recMapInfo{}) -> ListMapInfoOld :: [#recMapInfo{}, ...] | undefined.
updateMapInfo(#recMapInfo{creator = Creator} = MapInfo) ->
  ListMapInfoNew = lists:keystore(Creator, #recMapInfo.creator, getMapInfoList(), MapInfo),
  setMapInfoList(ListMapInfoNew).

%%-------------------------------------------------------------------
%% 删除指定的地图信息
-spec deleteMapInfoByRoleID(RoleID::uint64()) -> ListMapInfoOld :: [#recMapInfo{}, ...] | undefined.
deleteMapInfoByRoleID(RoleID) ->
  ListMapInfoNew = lists:keydelete(RoleID, #recMapInfo.creator, getMapInfoList()),
  setMapInfoList(ListMapInfoNew).
-spec deleteMapInfoByMapPid(MapPid::pid()) -> ListMapInfoOld :: [#recMapInfo{}, ...] | undefined.
deleteMapInfoByMapPid(MapPid) ->
  ListMapInfoNew = lists:keydelete(MapPid, #recMapInfo.mapPID, getMapInfoList()),
  setMapInfoList(ListMapInfoNew).

%%%-------------------------------------------------------------------
%% 心跳计数，用于发送同步消息
addTickCount()->
  V = getTickCount(),
  put('TicCount', V + 1).
getTickCount()->
  case get('TicCount') of
    undefined ->
      0;
    V ->
      V
  end.
%%%-------------------------------------------------------------------