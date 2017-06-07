%%
%%%-------------------------------------------------------------------
%%% @author ZhongYuanWei
%%% @copyright (C) 2014, 好玩一二三科技
%%% @doc
%%%
%%% @end
%%% Created : 08. 五月 2014 14:54
%%%-------------------------------------------------------------------
-module(mapMgrState).
-author("ZhongYuanWei").

-include("mapPrivate.hrl").

%% API
-compile(export_all).

%%获取某地图的最大线路号
-spec getMapMaxLine(MapID) -> undefined | uint() when
    MapID::uint().
getMapMaxLine(MapID) ->
    case getFromEts({maxLine,MapID}) of
		undefined ->
			0;
		N ->
			N
	end.

%%设置某地图的最大线路号
-spec setMapMaxLine(MapID,LineNum) -> ok when
    MapID::uint(),LineNum::uint().
setMapMaxLine(MapID,LineNum) ->
	setToEts({maxLine,MapID},LineNum),
    ok.

%%获取已经创建的地图信息
-spec getMapInfo(MapPid) -> #recMapInfo{} | undefined when
	MapPid::pid().
getMapInfo(MapPid) ->
    getFromEts({mapInfo,MapPid}).

%%设置已经创建的地图信息
-spec setMapInfo(MapPid,#recMapInfo{}) -> ok when
	MapPid::pid().
setMapInfo(MapPid,#recMapInfo{} = Info) ->
	setToEts({mapInfo,MapPid},Info),
    ok.

-spec getMapInfoByMapID(MapID) -> [#recMapInfo{},...] | [] when
	MapID::uint().
getMapInfoByMapID(MapID) ->
	MS = ets:fun2ms(fun(#recKeyValue{value = MapInfo}) when MapInfo#recMapInfo.id =:= MapID ->
		MapInfo
	end),
	myEts:selectEts(getWorkInfoEts(),MS).


-spec deleteMapInfo(MapPid) -> ok when
	MapPid::pid().
deleteMapInfo(MapPid) ->
	deleteFromEts({mapInfo,MapPid}),
	ok.

%%获取副本信息
-spec getCopyMap(MapPid) -> #recCopyMapInfo{} | [] when
	MapPid::pid().
getCopyMap(MapPid) ->
	case getFromEts({copyMap,MapPid}) of
		undefined ->
			[];
		V ->
			V
	end.

%%设置副本信息
-spec setCopyMap(#recCopyMapInfo{}) -> ok.
setCopyMap(#recCopyMapInfo{mapPid = MapPid} = V) ->
	setToEts({copyMap,MapPid}, V),
	ok.

deleteCopyMap(MapPid) ->
	deleteFromEts({copyMap,MapPid}),
	ok.

getFromEts(Key) ->
	case myEts:lookUpEts(getWorkInfoEts(),Key) of
		[#recKeyValue{value = V}] ->
			V;
		_ ->
			undefined
	end.

setToEts(Key,Value) ->
	ets:insert(getWorkInfoEts(),#recKeyValue{key = Key,value = Value}),
	ok.

deleteFromEts(Key) ->
	ets:delete(getWorkInfoEts(),Key),
	ok.

-spec getWorkInfoEts() -> atom().
getWorkInfoEts() ->
	?MapWorkInfoEts.

%% gm 动态控制地图进入人数限制
setSpecialMaxPlayerNumber(MapID, Number) ->
	put({'SpecialMaxPlayerNumber', MapID}, Number).

delSpecialMaxPlayerNumber(MapID) ->
	erlang:erase({'SpecialMaxPlayerNumber', MapID}).

getSpecialMaxPlayerNumber(MapID) ->
	get({'SpecialMaxPlayerNumber', MapID}).