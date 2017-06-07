%%%游戏地图文件读取模块
%%%此模块为地图管理进程调用

-module(mapReader).
-author(zhongyuanwei).

-include("mapPrivate.hrl").

-compile(nowarn_unused_vars).

%% ====================================================================
%% API functions
%% ====================================================================
-export([loadAllMaps/0]).

%读取所有地图信息
-spec loadAllMaps() -> {ok,array:array()} | {false,Why} when
		  Why :: string().
loadAllMaps() ->
	ArCfg = array:new(),
	put(mapsettingArCfg,ArCfg),
	case getCfg:getAllCfg(cfg_mapsetting) of
		[]->
			ok;
		MapSettingCfgList->
			Fun = fun(First)->
						  MapID = First#mapsettingCfg.id,
						  NewArCfg = readMap(MapID,First#mapsettingCfg.res1,get(mapsettingArCfg)),
						  RetArCfg = readMapInfo(MapID,First#mapsettingCfg.res2,NewArCfg),
						  put(mapsettingArCfg,RetArCfg)
				  end,
			lists:foreach(Fun, MapSettingCfgList),
			%%?LOG_OUT("MapSettingCfgList ~p",[MapSettingCfgList]),
			ok
	end,
	FinalArCfg = get(mapsettingArCfg),
	{ok,FinalArCfg}.

%% ====================================================================
%% Internal functions
%% ====================================================================

-spec readMap(MapID,FileName,ArCfg) -> array:array() when
	MapID::mapId(),FileName::string(),ArCfg::array:array().
readMap(MapID,FileName,ArCfg) when erlang:is_integer(MapID) andalso MapID > 0 andalso MapID =< 65535 ->
    Ret = loadMapFromFile(MapID,FileName),
    case Ret of
        {ok,#recGameMapCfg{} = Cfg} ->
            array:set(MapID, Cfg, ArCfg);
        Other ->
            throw(Other)
    end.

-spec readMapInfo(MapID,FileName,ArCfg) -> array:array() when
	MapID::mapId(),FileName::string(),ArCfg::array:array().
readMapInfo(MapID,FileName,ArCfg) when erlang:is_integer(MapID) andalso MapID > 0 andalso MapID =< 65535 ->
    RetInfo = loadMapInfoFromFile(MapID,FileName),
    case RetInfo of
        {ok,{MapID,Info}} ->
            MapCfg = array:get(MapID, ArCfg),
			WayPtList = array:get(?MapObjWayPt, Info),
			case erlang:length(WayPtList) =< 0 of
				true ->
					?ERROR_OUT("地图[~p]没有路点信息，无法设置地图初始点",[MapID]),
					throw("Map No Way Point, Can't Set Map Init Pos");
				_ ->
					skip
			end,
			[MapWayPt | _] = WayPtList,
			InitX = MapWayPt#recMapWayPt.x,
			InitY = MapWayPt#recMapWayPt.y,
			RelivePt = array:get(?MapObjRelivePt, Info),
			Trigger =  array:get(?MapObjTrigger, Info),
			Monster =  array:get(?MapObjMonster, Info),
			Npc = array:get(?MapObjNpc, Info),
			Collect = array:get(?MapObjCollect, Info),
			UseItem = array:get(?MapObjUseItem, Info),
            NewMapCfg = MapCfg#recGameMapCfg{
											 initX = InitX,
											 initY = InitY,
											 mapRelivePt = RelivePt,
											 mapTrigger = Trigger,
											 mapMonster = Monster,
											 mapNpc = Npc,
											 mapWayPt = WayPtList,
											 mapCollect = Collect,
											 mapUseItem = UseItem
											},
            array:set(MapID, NewMapCfg, ArCfg);
        OtherInfo ->
			?ERROR_OUT("Read MapID[~p] File[~p] Error~p",[MapID,FileName, OtherInfo]),
            throw(OtherInfo)
    end.

%%从指定文件中读取地图阻挡信息
-spec loadMapFromFile(MapID,Filename) -> {ok,#recGameMapCfg{}} | {error,Why} when
		  MapID :: integer(),
		  Filename :: string(),
		  Why :: term().
loadMapFromFile(MapID,Filename) when erlang:is_list(Filename)->
	?LOG_OUT("Load Map[ID:~p] File ~p",[MapID,Filename]),
	Ret = file:read_file(Filename),
	case Ret of
		{ok, Bin} ->
				Cfg = loadMapFromBinary(MapID,Bin),
				{ok,Cfg};
		Error ->
			?ERROR_OUT("Load Map[ID:~p] File[~ts] Failed",[MapID,Filename]),
			Error
	end.

%从指定文件中读取地图物件信息
-spec loadMapInfoFromFile(MapID,FileName) -> { ok, {MapID, array:array()} } | Error when
          MapID :: integer(),
          FileName :: string(),
          Error :: term().
loadMapInfoFromFile(MapID,FileName) when erlang:is_list(FileName) ->
	io:format("Load Map[ID:~p] Info From File[~p]",[MapID,FileName]),
	Ret = file:read_file(FileName),
	case Ret of
		{ok,Bin} ->
			Info = loadMapInfoFromBinary(Bin),
			{ok,{MapID,Info}};
		Error ->
			Error
	end.

%从二进制数据中根据版本号读取地图阻挡信息
-spec loadMapFromBinary(MapID,Bin) -> #recGameMapCfg{} | Error when
		  MapID :: non_neg_integer(),
		  Bin :: binary(),
		  Error :: string().
loadMapFromBinary(MapID,Bin) when erlang:is_integer(MapID) andalso MapID > 0 andalso erlang:is_binary(Bin)->
	?GameMapBinFile = Bin,
	case Tag of
		<<"PATH">> ->
			skip;
		_ ->
			%%文件不是PathGrid文件，策划配置填错了
			?ERROR_OUT("Error Cfg of Map[~p] PathFile",[MapID]),
			throw("Error Cfg of Map Path File")
	end,
    %检查文件大小
	BinSize = erlang:byte_size(Bin),
	case FileSize =:= BinSize of
		true->
			ok;
		false->
			throw("Error Map Data")
	end,
    
    %检查文件头大小
    RemainDataSize = erlang:byte_size(RemainData),
    case (FileSize - RemainDataSize) =:= HeaderSize of
        true ->
            ok;
        false ->
            throw("Error Map Data")
    end,
	
    %检查数据偏移
	Offset1 = BlockInfoOffset + BlockInfoLen,
	Offset2 = HeightInfoOffset + HeightInfoLen,
	Offset3 = BakedDataOffset + BakedDataLen,
	Offset4 = UserDataOffset + UserDataLen,
	Offset5 = WeightMergeDataOffset + MergeWeightDataLength,

	if
		Offset1 > BinSize ->
			throw("Map File Internal Error,Overflow!");
		Offset2 > BinSize ->
			throw("Map File Internal Error,Overflow!");
		Offset3 > BinSize ->
			throw("Map File Internal Error,Overflow!");
		Offset4 > BinSize ->
			throw("Map File Internal Error,Overflow!");
		Offset5 > BinSize ->
			throw("Map File Internal Error,Overflow!");
		true ->
			ok
	end,
	TotalCellNum = TotalColCellNum * TotalRowCellNum,
	if
		BlockInfoLen /= TotalCellNum ->
			throw("Map File Internal Logic Error");
		(HeightInfoLen / 4) /= TotalCellNum ->
			throw("Map File Internal Logic Error");
		true ->
			ok
	end,
	loadMapByVersion(Version,MapID,Bin,?GameMapBinFile).

%读取1号版本的地图阻挡信息
-spec loadMapByVersion(1,MapID,Bin,FileHeader) -> #recGameMapCfg{} when
          Bin :: binary(), MapID :: non_neg_integer(), FileHeader :: binary().
loadMapByVersion(1,MapID,Bin,?GameMapBinFile)->
	%阻挡信息
	<<BlockBin/binary>> = binary:part(Bin, BlockInfoOffset, BlockInfoLen),
	%高度信息
	<<HeightBin/binary>> = binary:part(Bin, HeightInfoOffset, HeightInfoLen),
	
	#recGameMapCfg{
				mapID = MapID,
				worldPos = {X,Y,Z},
				colCellNum = TotalColCellNum,
				rowCellNum = TotalRowCellNum,
				colGridNum = misc:ceil(TotalColCellNum / mapView:maxGridCellColNum()),
				rowGridNum = misc:ceil(TotalColCellNum / mapView:maxGridCellRowNum()),
				block = BlockBin,
				height = HeightBin
	}.

%从二进制数据中读取地图物件信息
-spec loadMapInfoFromBinary(Bin) -> array:array() when
          Bin :: binary().
loadMapInfoFromBinary(Bin) ->
	?GameMapInfoBinFile = Bin,
	case Tag of
		<<"SCEN">> ->
			skip;
		_ ->
			%%不是MapInfo文件，策划配置填错了
			?ERROR_OUT("Error Cfg of Map MapInfo File"),
			throw("Error Cfg of Map MapInfo File")
	end,
	%检查文件大小
    BinSize = erlang:byte_size(Bin),
    case  FileSize =:= BinSize of
        true->
            ok;
        false->
            throw("Error Map Info Data")
    end,
    
    %检查文件头大小
    RemainDataSize = erlang:byte_size(RemainData),
    case (FileSize - RemainDataSize) =:= HeaderSize of
        true ->
            ok;
        false ->
            throw("Error Map Info Data")
    end,

    %检查数据偏移
    Offset1 = TriggerOffset + TriggerDataLen,
    Offset2 = NpcOffset +  NpcDataLen,
    Offset3 = MonsterOffset + MonsterDataLen,
    Offset4 = RelivePtOffset + RelivePtDataLen,
    Offset5 = WayPtOffset + WayPtDataLen,
	Offset6 = CollectDataOffset + CollectDataLength,
	Offset7 = UseItemDataOffset + UseItemDataLength,
	EOFFlag = binary:part(Bin,BinSize - 4, 4),
	
    if
        Offset1 > BinSize ->
           throw("Map File Internal Error,Overflow!");
        Offset2 > BinSize ->
           throw("Map File Internal Error,Overflow!");
        Offset3 > BinSize ->
           throw("Map File Internal Error,Overflow!");
        Offset4 > BinSize ->
           throw("Map File Internal Error,Overflow!");
        Offset5 > BinSize ->
           throw("Map File Internal Error,Overflow!");
		Offset6 > BinSize ->
		   throw("Map File Internal Error,Overflow!");
		Offset7 > BinSize ->
		   throw("Map File Internal Error,Overflow!");
		<<"EOF",0>> /= EOFFlag ->
		   throw("Map File Error, No EOF Flag");
        true ->
            ok
    end,
    loadMapInfoByVersion(Version,Bin,?GameMapInfoBinFile).

%根据版本号读取地图物件信息
-spec loadMapInfoByVersion(1,Bin,FileHeader) -> array:array() when
          Bin :: binary(), FileHeader :: binary().
loadMapInfoByVersion(1,Bin,?GameMapInfoBinFile) ->
    Ar = array:new([{size,7},{fixed,true}]),
    
	%%触发器
	AllTriggerData = binary:part(Bin, TriggerOffset, TriggerDataLen),
    NewArTrigger = binaryReadTriggerData(AllTriggerData,[]),
    Ar1 = array:set(?MapObjTrigger, NewArTrigger, Ar),
    
	%%NPC
    NpcData = binary:part(Bin, NpcOffset,NpcDataLen),
    NpcList = loadMapStubData(NpcData,NpcNum),
    Ar2 = array:set(?MapObjNpc, NpcList, Ar1),
    
	%%怪物
    MonsterData = binary:part(Bin, MonsterOffset,MonsterDataLen),
    MonsterList = loadMapStubData(MonsterData,MonsterNum),
    Ar3 = array:set(?MapObjMonster, MonsterList, Ar2),
    
	%%复活点
    RelivePtData = binary:part(Bin, RelivePtOffset,RelivePtDataLen),
    RelivePtList = loadMapStubData(RelivePtData,RelivePtNum),
    Ar4 = array:set(?MapObjRelivePt, RelivePtList, Ar3),
    
	%%路点
    WayPtData = binary:part(Bin, WayPtOffset,WayPtDataLen),
    WayPtList = loadMapWayPtData(WayPtData,[],WayPtNum),
    Ar5 = array:set(?MapObjWayPt, WayPtList, Ar4),
	
	%%地图中的采集数据
	CollectData = binary:part(Bin, CollectDataOffset,CollectDataLength),
    CollectList = loadMapStubData(CollectData,CollectNum),
    Ar6 = array:set(?MapObjCollect, CollectList, Ar5),
	
	%%地图中的采集数据
	UseItemData = binary:part(Bin, UseItemDataOffset,UseItemDataLength),
    UseItemList = loadMapStubData(UseItemData,UseItemNum),
    Ar7 = array:set(?MapObjUseItem, UseItemList, Ar6),
	Ar7.

-spec loadMapWayPtData(Bin,List,Num) -> list() when
	Bin::binary(),List::list(),Num::uint().
loadMapWayPtData(<<>>,List,0) when erlang:is_list(List) ->
	lists:reverse(List);
loadMapWayPtData(Bin,List,Num) when erlang:is_list(List) ->
	?MapWayPtData = Bin,
	{NeighborIdList,Remain1} = loadNeighborIds(Remain,[],0,NeighborCount),
	{Remain2,_CostList} = loadMinCost(Remain1),
	LowerName = string:to_lower(erlang:binary_to_list(Name)),
	StrName = string:strip(LowerName,right,0),
	WayPt = #recMapWayPt{
						 x = MapX,
						 y = MapZ,
						 name = StrName,
						 id = ID,
						 neighborCount = NeighborCount,
						 neighborIds = NeighborIdList
						},
	loadMapWayPtData(Remain2,[WayPt | List],Num - 1).

-spec loadNeighborIds(Bin,Result,I,N) -> {Result,Bin} when
	Bin::binary(),Result::list(),I::uint(),N::uint().
loadNeighborIds(Bin,Result,N,N) ->
	{Result,Bin};
loadNeighborIds(Bin,Result,I,N) ->
	{ID,Remain} = netmsg:binary_read_int(Bin),
	loadNeighborIds(Remain,[ID | Result],I + 1,N).

-spec loadMinCost(Bin) -> {Bin,list()} when
	Bin::binary().
loadMinCost(Bin) ->
	<<MinCostCount:?S32,Remain/bytes>> = Bin,
	loadMinCost(MinCostCount,Remain,[]).

-spec loadMinCost(MinCostCount,Bin,Result) -> {Bin,list()} when
	MinCostCount::uint(),Bin::binary(),Result::list().
loadMinCost(0,Bin,Result) ->
	{Bin,lists:reverse(Result)};
loadMinCost(MinCostCount,Bin,Result) ->
	<<Cost:?S32,Remain/bytes>> = Bin,
	loadMinCost(MinCostCount - 1,Remain,[Cost | Result]).
	

-spec loadMapStubData(Bin,Num) -> list() when
          Bin :: binary(), Num :: non_neg_integer().
loadMapStubData(Bin,Num) ->
    binaryReadStubData(Bin,[],Num).

-spec binaryReadStubData(Bin,List,Num) -> list() when
	Bin::binary(),List::list(),Num::uint().
binaryReadStubData(<<>>,List,0) ->
	List;
binaryReadStubData(Bin,List,Num) when erlang:is_binary(Bin)->
	?MapStubData = Bin,
	Data = #recMapObjData{
		id = ID,                                   %ID
		name = Name,                               %名字
		mapX = MapX,                               %地图坐标X
		mapY = MapZ,                               %地图坐标Y
		rotW = RotW,
		groupID = 0 %% 默认把物件的分组ID设为0
	},
	binaryReadStubData(Left,[Data | List],Num - 1).

-spec binaryReadTriggerData(Bin,TriggerList) -> TriggerList when
	Bin::binary(),TriggerList::list().
binaryReadTriggerData(<<>>,TriggerList) ->
    TriggerList;
binaryReadTriggerData(Bin,TriggerList) when erlang:is_binary(Bin)->
	?MapTriggerBaseData = Bin,
	{InStrCount,R1} = netmsg:binary_read_int16(Left),
	{InArgs,Left1} = binaryReadTriggerStringList(InStrCount,[],R1),
	{OutStrCount,R2} = netmsg:binary_read_int16(Left1),
    {OutArgs,Left2} =  binaryReadTriggerStringList(OutStrCount,[],R2),
    TriggerArea = case VolumeType of
        1 ->
            ?MapTriggerVolumeBox = Left2,
            #recMapTriggerVolumeBox{
                                    centerX = CenterX,
                                    centerY = CenterZ,
                                    width = SizeX,
                                    height = SizeZ
                                   };
        2 ->
            ?MapTriggerVolumeSphere = Left2,
            #recMapTriggerVolumeSphere{
                                        centerX = CenterX,
                                        centerY = CenterZ,
                                        r = R
                                       };
        _ ->
            Remain = Left2,
            throw("Error VolumeType")
    end,
	Data = #recMapTriggerData{
                       mapX = MapX,                                 %地图坐标X
                       mapY = MapZ,                                 %地图坐标Y
                       name = Name,                                 %该触发数据的名字 
                       id = ID,                                     %该触发数据的ID
                       volumeType = VolumeType,                     %触发器区域形状，可能是box或者是sphere
                       inTriggerName = InTriggerName,               %走入触发区域调用的触发器名称
                       inTriggerArgFormat = InTriggerArgFormat,     %走入触发区域调用触发器的参数格式
                       outTriggerName = OutTriggerName,             %走出触发区域调用的触发器名称
                       outTriggerArgFormat = OutTriggerArgFormat,   %走出触发区域调用触发器的参数格式
                       inDelayTime = InDelayTime,                   %走入触发区域调用触发器的延迟时间
                       outDelayTime = OutDelayTime,                 %走出触发区域调用触发器的延迟时间
                       totalTriggerCount = TotalTriggerCount,       %总共可触发多少次
                       inArgs = InArgs,                             %走入触发区域调用触发器时的参数
                       outArgs = OutArgs,                           %走出触发区域调用触发器时的参数
                       triggerArea = TriggerArea                    %触发区域
                       },
    binaryReadTriggerData(Remain,[Data | TriggerList]).

-spec binaryReadTriggerStringList(StrCount,StringList,Bin) -> {list(),Bin} when
	StrCount::uint(),StringList::list(),Bin::binary().
binaryReadTriggerStringList(0,StringList,Bin) ->
	{lists:reverse(StringList),Bin};
binaryReadTriggerStringList(StrCount,StringList,Bin) ->
	{Args,Remain} = netmsg:binary_read_string(Bin),
	binaryReadTriggerStringList(StrCount - 1,[Args | StringList],Remain).

