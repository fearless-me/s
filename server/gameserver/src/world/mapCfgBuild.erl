-module(mapCfgBuild).
-include("gameMap.hrl").

-export([main/0]).
%% ====================================================================
%% API functions
%% ====================================================================

main() ->
 	{ok, Array} = mapReader:loadAllMaps(),
  	writeInfoToFile(Array).
	
%% ====================================================================
%% Internal functions
%% ====================================================================
-spec writeInfoToFile(ArCfg) -> term() when
	ArCfg :: array:array().
writeInfoToFile(ArCfg) ->
	MapID = getCfg:get1KeyList(cfg_mapsetting),
		Fun = fun(Mapid) ->
					 	case Mapid > 0 of
							  true ->
								MapCfgs = array:get(Mapid, ArCfg),
								NewList = writeToFile(MapCfgs),
								fileAddHead(NewList, Mapid)
						 end	
			  end,
			lists:foreach(Fun, MapID).
			
-spec fileAddHead(FileList, Mapid) -> ok | {error, Reason} when 
		  FileList :: list(), Mapid :: uint(), Reason :: term().
fileAddHead(FileList, Mapid) ->
	Filename =  io_lib:format("../src/mapcfgs/cfg_gamemapcfg~p.erl", [Mapid]),
	Mod = io_lib:format("-module(cfg_gamemapcfg~p).\n", [Mapid]),
	Com = "-export([getRow/1]).\n",
	Head = "-include(\"gameMap.hrl\").\n\n",
	MapCfgList = Mod ++ Com ++ Head ++ FileList,
	checkFileContent(Filename, MapCfgList).

-spec writeToFile(MapCfg) -> list() when
		  MapCfg :: term().   
writeToFile(MapCfg) ->
 	MapId = MapCfg#recGameMapCfg.mapID,
	MaxPlayerNum = MapCfg#recGameMapCfg.maxPlayerNum,
	WorldPos = MapCfg#recGameMapCfg.worldPos,
	ColCellNum = MapCfg#recGameMapCfg.colCellNum,
	RowCellNum = MapCfg#recGameMapCfg.rowCellNum,
	ColGridNum = MapCfg#recGameMapCfg.colGridNum,
	RowGridNum = MapCfg#recGameMapCfg.rowGridNum,
	InitX = MapCfg#recGameMapCfg.initX,
	InitY = MapCfg#recGameMapCfg.initY,
 	Block= MapCfg#recGameMapCfg.block,
 	DropInfo = MapCfg#recGameMapCfg.dropInfo,
	
	
	MapObjRelivePt1 =MapCfg#recGameMapCfg.mapRelivePt,
	MapObjTrigger1 = MapCfg#recGameMapCfg.mapTrigger,
	MapObjMonster1 = MapCfg#recGameMapCfg.mapMonster,
	MapObjNpc1 = MapCfg#recGameMapCfg.mapNpc,
	MapObjWayPt1 = MapCfg#recGameMapCfg.mapWayPt,
	MapObjCollect1 = MapCfg#recGameMapCfg.mapCollect,
	MapObjUseItem1 = MapCfg#recGameMapCfg.mapUseItem,

	Str = io_lib:format("getRow(~p) ->
		#recGameMapCfg{
		mapID = ~p,
		maxPlayerNum = ~p,
		worldPos = ~p,
		colCellNum = ~p,
		rowCellNum = ~p,
		colGridNum = ~p,
		rowGridNum = ~p,
		initX = ~p,
		initY = ~p,
		block = ~p,
		dropInfo = ~p,
		mapRelivePt = ~p,
		mapTrigger = ~p,
		mapMonster = ~p,
		mapNpc = ~p,
		mapWayPt = ~p,
		mapCollect = ~p,
		mapUseItem = ~p
		}.\n\n",	[MapId, MapId, MaxPlayerNum, WorldPos, ColCellNum, RowCellNum, ColGridNum, RowGridNum,
				 InitX, InitY, Block, DropInfo, MapObjRelivePt1, MapObjTrigger1, MapObjMonster1,
				 MapObjNpc1, MapObjWayPt1, MapObjCollect1, MapObjUseItem1]),
	Str.

checkFileContent(FileName,Content) ->
	Bin = erlang:list_to_binary(Content),
	case file:read_file(FileName) of
		{ok,Bin} ->
			io:format("...~s未检测到修改~n", [FileName]);
		_Other ->
			case file:write_file(FileName, Bin) of
				ok ->
					io:format("Write File:~s OK~n",[FileName]);
				{error,Reason} ->
					io:format("Write File:~s Failed by:~s~n",[FileName,Reason])
			end
	end,
	ok.
