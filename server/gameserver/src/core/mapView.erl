%%
%% @author zhongyunawei
%% @doc @todo 地图视图、周围信息，本模块可以供玩家进程、怪物进程以及地图进程访问


-module(mapView).
-author(zhongyuanwei).

-include("gsInc.hrl").
-include_lib("stdlib/include/ms_transform.hrl").

-define(MaxBroadcastNum,20).

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	isBlock/3,
	isBlock/6,

	sendMsg2NearPlayer/5,
	sendMsg2NearPlayerByPos/6,
	sendMsg2NearPlayerByView/5,
	sendMsgToNearPlayerByPosIncludeChangeMap/7,
	sendMsg2AllPlayer/4,

	getNearAllObjectIncludeChangeMap/4,

	getGridXYByPos/2,
	getChangedView/2,
	getSeeMeObject/5,
	getMutualObject/5,
	getNearRectByPos/2,
	getObjectDist/3,
	getObjectDist/2,
	getObjBodyR/2,
	getObjDist/6,
	getGroupObject/2,
	sendNetMsgToNetPid/2
]).

%%获取单个对象
-export([
	getMapObjectExcludeChangingMap/2,
	getMapObjectFromEts/2
]).

%%获取多个对象
-export([
	getNearPlayerPid/5,
	getNearAllObject/4,
	getNearViewObject/5
]).

%% 逻辑调用接口
-export([
	sendBroadcastDisapearMessage/3
]).

-export([
	maxGridCellRowNum/0,
	maxGridCellColNum/0
]).

-export([
	getGridMonsterAndCarrier/4
]).

-type point()::{uint(),uint()}.
-type area()::{point(),point()}.
-type view()::[area()|area()] | [area()].
-type map_view()::{view(),view(),view()}.


%%强制让其配置成正方形
maxGridCellRowNum() ->
	case getCfg:getCfgByArgs(cfg_globalsetup,maxgridcellnum) of
		#globalsetupCfg{setpara = [{MaxRow,MaxRow}]} ->
			MaxRow;
		_ ->
			?MaxGridCellRowNum
	end.
maxGridCellColNum() ->
	case getCfg:getCfgByArgs(cfg_globalsetup,maxgridcellnum) of
		#globalsetupCfg{setpara = [{MaxCol,MaxCol}]} ->
			MaxCol;
		_ ->
			?MaxGridCellColNum
	end.

%检测指定(X,Y)坐标点是否为阻挡，阻挡返回true，非阻挡返回false
-spec isBlock(FX :: float(), FY :: float(),ColCellNum,RowCellNum,CellSize,BlockBinary) -> boolean() when
	ColCellNum::uint(),RowCellNum::uint(),CellSize::float(),BlockBinary::binary().
isBlock(FX,FY,ColCellNum,RowCellNum,CellSize,BlockBinary) when erlang:is_float(FX), erlang:is_float(FY) ->
	case CellSize >= 1 of
		true ->
			X = erlang:trunc(FX / CellSize),
			Y = erlang:trunc(FY / CellSize),
			if
				Y >= RowCellNum orelse Y < 0 ->
					true;
				X >= ColCellNum orelse X < 0 ->
					true;
				true ->
					Pos = Y * ColCellNum + X,
					%阻挡信息中0是阻挡，1是非阻挡
					IsBlock = binary:at(BlockBinary, Pos),
					if
						IsBlock =:= 0 ->
							true;
						true ->
							false
					end
			end;
		_ ->
			true
	end.

%检测指定(X,Y)坐标点是否为阻挡，阻挡返回true，非阻挡返回false
-spec isBlock(MapID,FX,FY) -> boolean() when
	MapID::mapId(),FX :: float(), FY :: float().
isBlock(MapID,FX,FY) when erlang:is_float(FX), erlang:is_float(FY) ->
	case core:getMapCfg(MapID) of
		#recGameMapCfg{colCellNum = ColCellNum, rowCellNum = RowCellNum, cellSize = CellSize, block = BlockBin} ->
			isBlock(FX, FY, ColCellNum, RowCellNum, CellSize, BlockBin);
		_ ->
			true
	end.

%% 发送消息给指定玩家的周围玩家(能看见PlayerCode和PlayerCode能看见的玩家才有消息)
%% SelfNetPidOrBool为自己的网络进程Pid或者是一个boolean值
%% 如果是一个网络进程Pid，则直接向该进程发消息，否则会判断是否包括自己，再决定是否向自己所在玩家进程发消息让其转发
-spec sendMsg2NearPlayer(MapPid,PlayerEts,Msg,PlayerCode,SelfNetPidOrBool) -> [#recMapObject{},...] | [] when
	MapPid::pid(),PlayerEts::etsTab(),Msg::any(),PlayerCode::uint(),SelfNetPidOrBool::boolean() | pid().
sendMsg2NearPlayer(MapPid,PlayerEts,Msg,PlayerCode,SelfNetPidOrBool)
	when erlang:is_integer(PlayerCode) andalso (erlang:is_pid(SelfNetPidOrBool) orelse erlang:is_boolean(SelfNetPidOrBool)) ->
	IsIncludeSelf =
		case erlang:is_pid(SelfNetPidOrBool) of
			true ->
				sendNetMsgToNetPid(SelfNetPidOrBool, Msg),
				false;
			_ ->
				SelfNetPidOrBool
		end,
	IsHook = isHookMsg(Msg),
	case ets:lookup(PlayerEts, PlayerCode) of
		[#recMapObject{x = X,y = Y, groupID = PlayerGroupID, netPid = NetPid}] ->
			NearPlayerList = getMutualObject(MapPid,PlayerEts, ?ObjTypePlayer, {X,Y}, PlayerGroupID),
			Fun =
				fun(#recMapObject{pid = TargetPid, netPid = TargetNetPid}) ->
					case NetPid =/= TargetNetPid orelse IsIncludeSelf of
						true ->
							%%直接向远程玩家的网络进程发送消息，不再通过远程玩家进程转发
							isHookMsg(IsHook, TargetPid, TargetNetPid, Msg);
						_ ->
							skip
					end
				end,
			lists:foreach(Fun,NearPlayerList),
			NearPlayerList;
		_ ->
			[]
	end.

%% 发消息给地图上的所有玩家
-spec sendMsg2AllPlayer(MPID::pid(),PlayerEts::etsTab(),Msg::any(),SelfGroupID::uint64()) -> ok.
sendMsg2AllPlayer(MPID,PlayerEts,Msg,SelfGroupID) ->
	IsHook = isHookMsg(Msg),
	F =
		fun(#recMapObject{pid = Pid, netPid = NetPid, mapPid = MapPid, groupID = GID, actionStatus = AS}, _) ->
			case MapPid =:= MPID andalso GID =:= SelfGroupID andalso AS /= ?CreatureActionStatusChangeMap of
				true ->
					case erlang:is_list(Msg) of
						true ->
							[isHookMsg(IsHook, Pid, NetPid, MS) || MS <- Msg];
						_ ->
							isHookMsg(IsHook, Pid, NetPid, Msg)
					end;
				_ ->
					skip
			end
		end,
	ets:foldl(F, 0, PlayerEts),
	ok.

%发送消息给指定位置的周围玩家(发给能看见SelfGroupID的对象和SelfGroupID能看见的对象)
-spec sendMsg2NearPlayerByPos(MapPid,PlayerEts,Msg,X,Y,SelfGroupID) -> uint() when
	MapPid::pid(),PlayerEts::etsTab(),Msg::any(),X::float(),Y::float(),SelfGroupID::uint().
sendMsg2NearPlayerByPos(MapPid,PlayerEts,Msg,X,Y,SelfGroupID) when erlang:is_pid(MapPid), erlang:is_float(X), erlang:is_float(Y), erlang:is_integer(SelfGroupID) ->
	IsHook = isHookMsg(Msg),
	NearPlayerList = getMutualObject(MapPid, PlayerEts, ?ObjTypePlayer, {X, Y}, SelfGroupID),
	Fun =
		fun(#recMapObject{pid = Pid, netPid = NetPid}, N) ->
			isHookMsg(IsHook, Pid, NetPid, Msg),
			N + 1
		end,
	misc:mapAccList(NearPlayerList,0,Fun);
sendMsg2NearPlayerByPos(MapPid,PlayerEts,Msg,X,Y,SelfGroupID) ->
	?ERROR_OUT("sendMsg2NearPlayerByPos:~p,~p,~p,~p,~p,~p", [MapPid,PlayerEts,Msg,X,Y,SelfGroupID]),
	0.

%发送消息给指定位置的周围玩家(发给能看见SelfGroupID的对象和SelfGroupID能看见的对象)
-spec sendMsg2NearPlayerByView(MapPid,PlayerEts,Msg,View,SelfGroupID) -> uint() when
	MapPid::pid(),PlayerEts::etsTab(),Msg::any(),View::tuple(),SelfGroupID::uint().
sendMsg2NearPlayerByView(MapPid,PlayerEts,Msg, View, SelfGroupID) when erlang:is_pid(MapPid), erlang:is_integer(SelfGroupID) ->
	IsHook = isHookMsg(Msg),
	NearPlayerList = getMutualObject(MapPid, PlayerEts, ?ObjTypePlayer, View, SelfGroupID),
	Fun =
		fun(#recMapObject{pid = Pid, netPid = NetPid}, N) ->
			isHookMsg(IsHook, Pid, NetPid, Msg),
			N + 1
		end,
	misc:mapAccList(NearPlayerList,0,Fun);
sendMsg2NearPlayerByView(MapPid,PlayerEts,Msg,View,SelfGroupID) ->
	?ERROR_OUT("sendMsg2NearPlayerByPos:~p,~p,~p,~p,~p", [MapPid,PlayerEts,Msg,View,SelfGroupID]),
	0.

%发送消息给指定位置的周围玩家，不管玩家是否在切换地图中(发给能看见SelfGroupID的对象和SelfGroupID能看见的对象)
%%为了不影响现有代码，新加一个不管玩家是否在切换地图中，都向其发消息的函数
-spec sendMsgToNearPlayerByPosIncludeChangeMap(MapPid,PlayerEts,Msg,X,Y,SelfGroupID::uint(),ExcludeCode) -> ok when
	MapPid::pid(),PlayerEts::etsTab(),Msg::any(),X::float(),Y::float(),ExcludeCode::uint().
sendMsgToNearPlayerByPosIncludeChangeMap(MapPid,PlayerEts,Msg,X,Y,SelfGroupID,ExcludeCode) when erlang:is_pid(MapPid), erlang:is_float(X), erlang:is_float(Y), erlang:is_integer(SelfGroupID) ->
	{{Left,Top} ,{Right,Bottom}} = getNearRectByPos(X, Y),
	MatchSpec = ets:fun2ms(
		fun(Object) when
			Object#recMapObject.mapPid =:= MapPid,
			Object#recMapObject.type =:= ?ObjTypePlayer,
			Object#recMapObject.x >= Left,
			Object#recMapObject.x =< Right,
			Object#recMapObject.y =< Top,
			Object#recMapObject.y >= Bottom ->
			Object
		end),

	NearPlayerList =
		case myEts:selectEts(PlayerEts,MatchSpec) of
			List when List =/= [] ->
				%% 根据分组再次筛选能看见我的目标
				Fun =
					fun(#recMapObject{groupID = TargetGroupID}) ->
						groupBase:canSeeTarget(SelfGroupID, TargetGroupID) orelse groupBase:canSeeMe(SelfGroupID, TargetGroupID)
					end,
				lists:filter(Fun, List);
			[] ->
				[]
		end,

	IsHook = isHookMsg(Msg),
	Fun1 =
		fun(#recMapObject{pid = Pid, netPid = NetPid,code = Code},N) ->
			case ExcludeCode =/= Code of
				true ->
					isHookMsg(IsHook, Pid, NetPid, Msg);
				_ ->
					skip
			end,
			N + 1
		end,
	misc:mapAccList(NearPlayerList,0,Fun1),
	ok;
sendMsgToNearPlayerByPosIncludeChangeMap(MapPid,PlayerEts,Msg,X,Y,SelfGroupID,ExcludeCode) ->
	?ERROR_OUT("sendMsg2NearPlayerByPos:~p,~p,~p,~p,~p,~p,~p", [MapPid,PlayerEts,Msg,X,Y,SelfGroupID,ExcludeCode]),
	ok.

%获取九宫格内的一切目标（包括可视与不可视以及地图切换中的玩家）
-spec getNearAllObjectIncludeChangeMap(MapPid,ObjectEts, Type, View) -> [Match] when
	Top :: number(), Left :: number(), Right :: number(), Bottom :: number(), PosX::float(), PosY::float(),
	MapPid::pid(),ObjectEts :: etsTab(),
	Type :: obj_type(),
	View :: {{Left, Top},{Right, Bottom}} | {PosX, PosY},
	Match :: #recMapObject{}.
getNearAllObjectIncludeChangeMap(MapPid, ObjectEts, Type, {{Left, Top},{Right, Bottom}}) ->
	MatchSpec = ets:fun2ms(fun(Object) when
		Object#recMapObject.mapPid =:= MapPid,
		Object#recMapObject.type =:= Type,
		Object#recMapObject.x >= Left,
		Object#recMapObject.x =< Right,
		Object#recMapObject.y =< Top,
		Object#recMapObject.y >= Bottom ->
		Object
						   end),
	myEts:selectEts(ObjectEts,MatchSpec);
getNearAllObjectIncludeChangeMap(MapPid, ObjectEts, Type, {X, Y}) ->
	getNearAllObject(MapPid, ObjectEts, Type, getNearRectByPos(X,Y)).

%% 获取分组里的目标
-spec getGroupObject(ObjectEts::etsTab(), GroupID::uint()) -> [#recMapObject{},...] | [].
getGroupObject(ObjectEts, GroupID) ->
	MatchSpec = ets:fun2ms(fun(Object) when Object#recMapObject.groupID =:= GroupID andalso Object#recMapObject.actionStatus =/= ?CreatureActionStatusChangeMap ->
		Object
						   end),
	myEts:selectEts(ObjectEts,MatchSpec).

%获取九宫格内的一切目标（包括可视与不可视，但不包括地图切换中的玩家）
-spec getNearAllObject(MapPid,ObjectEts, Type, View) -> [Match] when
	Top :: number(), Left :: number(), Right :: number(), Bottom :: number(), PosX::float(), PosY::float(),
	MapPid::pid(),ObjectEts :: etsTab(),
	Type :: obj_type(),
	View :: {{Left, Top},{Right, Bottom}} | {PosX, PosY},
	Match :: #recMapObject{}.
getNearAllObject(MapPid, ObjectEts, Type, {{Left, Top},{Right, Bottom}}) ->
	case is_pid(MapPid) andalso  misc:is_process_alive(MapPid) of
		true ->
			MatchSpec = ets:fun2ms(fun(Object) when
				Object#recMapObject.mapPid =:= MapPid,
				Object#recMapObject.type =:= Type,
				Object#recMapObject.actionStatus =/= ?CreatureActionStatusChangeMap,
				Object#recMapObject.x >= Left,
				Object#recMapObject.x =< Right,
				Object#recMapObject.y =< Top,
				Object#recMapObject.y >= Bottom ->
				Object
								   end),
			myEts:selectEts(ObjectEts,MatchSpec);
		_ ->
			[]
	end;
getNearAllObject(MapPid, ObjectEts, Type, {X, Y}) ->
	getNearAllObject(MapPid, ObjectEts, Type, getNearRectByPos(X,Y)).

%% 同步专用
getGridMonsterAndCarrier(MapPid, ObjectEts, {{Left, Top},{Right, Bottom}}, GroupID) ->
	List =
		case is_pid(MapPid) andalso  misc:is_process_alive(MapPid) of
			true ->
				MatchSpec = ets:fun2ms(
					fun(Object) when
						Object#recMapObject.mapPid =:= MapPid,
						(Object#recMapObject.type =:= ?ObjTypeMonster orelse Object#recMapObject.type =:= ?ObjTypeCarrier),
						Object#recMapObject.actionStatus =/= ?CreatureActionStatusChangeMap,
						Object#recMapObject.x >= Left,
						Object#recMapObject.x =< Right,
						Object#recMapObject.y =< Top,
						Object#recMapObject.y >= Bottom ->
						Object
					end),
				myEts:selectEts(ObjectEts,MatchSpec);
			_ ->
				[]
		end,
	lists:filter(
		fun(#recMapObject{groupID = TargetGroupID}) ->
			groupBase:canSeeTarget(GroupID, TargetGroupID)
		end, List).


%获取九宫格内[我能看见]的目标
-spec getNearViewObject(MapPid, ObjectEts, Type, Param4, GroupID) -> Result when
	MapPid     :: pid(),
	ObjectEts   :: etsTab(),
	Type        :: obj_type(),
	Param4 :: {{Left,Top},{Right,Bottom}}|{PosX, PosY},Top::number(),Left::number(),Right::number(),Bottom::number(),PosX::float(), PosY::float(),
	GroupID :: uint(),
	Result :: [#recMapObject{}|_].
getNearViewObject(MapPid, ObjectEts, Type, {{Left, Top},{Right, Bottom}}, GroupID) ->
	case getNearAllObject(MapPid, ObjectEts, Type, {{Left, Top},{Right, Bottom}}) of
		List when List =/= [] ->
			%% 根据分组再次筛选我能看见的目标
			lists:filter(fun(#recMapObject{groupID = TargetGroupID}) ->
				groupBase:canSeeTarget(GroupID, TargetGroupID)
						 end, List);
		[] ->
			[]
	end;
getNearViewObject(MapPid, ObjectEts, Type, {X, Y}, GroupID) ->
	getNearViewObject(MapPid, ObjectEts, Type, getNearRectByPos(X, Y), GroupID).

%获取九宫格内[能看见我]的目标
-spec getSeeMeObject(MapPid, ObjectEts, Type, Param4, GroupID) -> Result when
	MapPid     :: pid(),
	ObjectEts   :: etsTab(),
	Type        :: obj_type(),
	Param4 :: {{Left,Top},{Right,Bottom}}|{PosX, PosY},Top::number(),Left::number(),Right::number(),Bottom::number(),PosX::float(), PosY::float(),
	GroupID :: uint(),
	Result :: [#recMapObject{},...] | [].
getSeeMeObject(MapPid, ObjectEts, Type, {{Left, Top},{Right, Bottom}}, GroupID) ->
	case getNearAllObject(MapPid, ObjectEts, Type, {{Left, Top},{Right, Bottom}}) of
		List when List =/= [] ->
			%% 根据分组再次筛选能看见我的目标
			lists:filter(fun(#recMapObject{groupID = TargetGroupID}) ->
				groupBase:canSeeMe(GroupID, TargetGroupID)
						 end, List);
		[] ->
			[]
	end;
getSeeMeObject(MapPid, ObjectEts, Type, {X, Y}, GroupID) ->
	getSeeMeObject(MapPid, ObjectEts, Type, getNearRectByPos(X, Y), GroupID).

%获取九宫格内[我能看见 且 能看见我]的目标
-spec getMutualObject(MapPid, ObjectEts, Type, Param4, GroupID) -> Result when
	MapPid     :: pid(),
	ObjectEts   :: etsTab(),
	Type        :: obj_type(),
	Param4 :: {{Left,Top},{Right,Bottom}}|{PosX, PosY},Top::number(),Left::number(),Right::number(),Bottom::number(),PosX::float(), PosY::float(),
	GroupID :: uint(),
	Result :: [#recMapObject{}|_].
getMutualObject(MapPid, ObjectEts, Type, {{Left, Top},{Right, Bottom}}, GroupID) ->
	case getNearAllObject(MapPid, ObjectEts, Type, {{Left, Top},{Right, Bottom}}) of
		List when List =/= [] ->
			%% 根据分组再次筛选能看见我的目标
			Fun = fun(#recMapObject{groupID = TargetGroupID}) ->
				groupBase:canSeeTarget(GroupID, TargetGroupID) orelse groupBase:canSeeMe(GroupID, TargetGroupID)
				  end,
			lists:filter(Fun, List);
		[] ->
			[]
	end;
getMutualObject(MapPid, ObjectEts, Type, {X, Y}, GroupID) ->
	getMutualObject(MapPid, ObjectEts, Type, getNearRectByPos(X, Y), GroupID).


%%获取指定点(X,Y)所在同一个地图同一个位面的 周围玩家进程ID
-spec getNearPlayerPid(X,Y,MapPid,GroupID,ObjectEts) -> [Match] when
	X::float(),Y::float(),MapPid::pid(),GroupID::integer(),ObjectEts::etsTab(),Match::term().
getNearPlayerPid(X,Y,MapPid,GroupID,ObjectEts) when erlang:is_pid(MapPid) ->
	{{Left,Top} ,{Right,Bottom}} = getNearRectByPos(X,Y),
	MatchSpec = ets:fun2ms(fun(Object)	when Object#recMapObject.type =:= ?ObjTypePlayer,
		Object#recMapObject.mapPid =:= MapPid,
		Object#recMapObject.groupID =:= GroupID,
		Object#recMapObject.x >= Left,
		Object#recMapObject.x =< Right,
		Object#recMapObject.y =< Top,
		Object#recMapObject.y >= Bottom,
		Object#recMapObject.actionStatus =/= ?CreatureActionStatusChangeMap ->
		Object#recMapObject.pid
						   end),
	myEts:selectEts(ObjectEts,MatchSpec).

%根据Cell位置获得格子坐标
-spec getGridXYByPos(FX :: float(), FY :: float()) -> {GridX,GridY} when GridX::uint(),GridY::uint().
getGridXYByPos(FX,FY) when erlang:is_float(FX), erlang:is_float(FY)->
	X = erlang:trunc(FX),
	Y = erlang:trunc(FY),
	GridX = X div mapView:maxGridCellColNum(),
	GridY = Y div mapView:maxGridCellRowNum(),
	{GridX, GridY}.

%%根据指定位置，获取周围的区域坐标点
-spec getNearRectByPos(FX,FY) -> {{Left,Top} ,{Right,Bottom}} when
	FX::float(),FY::float(),Left::int(),Top::int(),Right::int(),Bottom::int().
getNearRectByPos(FX,FY) when erlang:is_float(FX), erlang:is_float(FY) ->
	{GridX,GridY} = getGridXYByPos(FX,FY),
	LeftGrid = GridX - 1,
	RightGrid = GridX + 2,
	TopGrid = GridY + 2,
	BottomGrid = GridY - 1,
	Left = LeftGrid * mapView:maxGridCellColNum(),
	Right = RightGrid * mapView:maxGridCellColNum(),
	Top = TopGrid * mapView:maxGridCellRowNum(),
	Bottom = BottomGrid * mapView:maxGridCellRowNum(),
	%%下面一句检查代码过一段时间需要删除
	%%checkRectPt({Left,Top},{Right,Bottom},"getNearRectByPos"),
	{{Left,Top} ,{Right,Bottom}}.

%% checkRectPt({Left,Top},{Right,Bottom},Tips) ->
%% 	case Left =< Right andalso Top >= Bottom of
%% 		true ->
%% 			skip;
%% 		_ ->
%% 			?ERROR_OUT("~p Error Rect Pt{~p,~p} Pt{~p,~p}",[Tips,Left,Top,Right,Bottom])
%% 	end.

%% 获取对象的#recMapObject{}，没查到返回[]
-spec getMapObjectFromEts(Code::uint(), {PlayerEts::etsTab(), MonsterEts::etsTab(), PetEts::etsTab()}) -> #recMapObject{} | [].
getMapObjectFromEts(Code, {PlayerEts, MonsterEts, PetEts}) ->
	Ets = case codeMgr:getObjectTypeByCode(Code) of
			  ?ObjTypePlayer ->
				  PlayerEts;
			  ?ObjTypeMonster ->
				  MonsterEts;
			  ?ObjTypePet ->
				  PetEts;
			  ?ObjTypeCarrier ->
				  MonsterEts;
			  _ ->
				  false
		  end,
	case Ets =/= false of
		true ->
			case ets:lookup(Ets, Code) of
				[#recMapObject{} = Obj] ->
					Obj;
				_ ->
					[]
			end;
		_ ->
			[]
	end.

%%获取指定Code的对象，如果该对象是在切换地图则不能获取
-spec getMapObjectExcludeChangingMap(Ets,Code) -> [Object] | [] when
	Ets::etsTab(),Code::uint(),Object::#recMapObject{}.
getMapObjectExcludeChangingMap(Ets,Code) ->
	case ets:lookup(Ets, Code) of
		[#recMapObject{actionStatus = Status} = Obj] when Status =/= ?CreatureActionStatusChangeMap ->
			[Obj];
		_ ->
			[]
	end.

%%获取两个对象的距离
-spec getObjectDist(SrcObj,DstObj) -> {ok,Dist,SrcObj,DstObj} | error when
	SrcObj::#recMapObject{},DstObj::#recMapObject{},Dist::number().
getObjectDist(#recMapObject{type = SrcType,mapPid = SrcMapPID,id = SrcID,x = SrcX,y = SrcY,groupID = SrcGroupID} = SrcObj,
	#recMapObject{type = DstType,mapPid = DstMapPID,id = DstID,x = DstX,y = DstY,groupID = DstGroupID} = DstObj) ->
	case SrcMapPID =:= DstMapPID andalso SrcGroupID =:= DstGroupID of
		true ->
			SrcBodyR = getObjBodyR(SrcType,SrcID),
			DstBodyR = getObjBodyR(DstType,DstID),
			Dist = getObjDist(SrcX,SrcY,SrcBodyR,DstX,DstY,DstBodyR),
			{ok,Dist,SrcObj,DstObj};
		_ ->
			error
	end.

%%获取两个Code所表示的对象之间除开体型的距离，注意必须为同一张地图
-spec getObjectDist(EtsList,SrcCode,DstCode) -> {ok,Dist,Src,Dst} | error when
	EtsList::list(),SrcCode::uint(),DstCode::uint(),Dist::float(),Src::#recMapObject{},Dst::#recMapObject{}.
getObjectDist(EtsList,SrcCode,DstCode) when erlang:is_list(EtsList)->
	SrcList = [ets:lookup(Ets,SrcCode) || Ets <- EtsList],
	DstList = [ets:lookup(Ets,DstCode) || Ets <- EtsList],
	Pred =
		fun(Ele) ->
			case Ele of
				[#recMapObject{}] ->
					true;
				_ ->
					false
			end
		end,
	Src = lists:filter(Pred, SrcList),
	Dst = lists:filter(Pred, DstList),
	case Src of
		[[#recMapObject{} = SrcObj]] ->
			case Dst of
				[[#recMapObject{} = DstObj]] ->
					getObjectDist(SrcObj,DstObj);
				_ ->
					error
			end;
		_ ->
			error
	end.

%%获取对象的体型半径
-spec getObjBodyR(ObjType,ID) -> float() when
	ObjType::uint(),ID::uint().
getObjBodyR(?ObjTypeMonster,ID) ->
	#monsterCfg{radius = BodyR} = getCfg:getCfgPStack(cfg_monster, ID),
	erlang:float(BodyR);
getObjBodyR(?ObjTypePlayer,_) ->
	?CharModeRadius;
getObjBodyR(_,_ID) ->
	0.0.

%%获取两个对象间的距离
-spec getObjDist(SrcX,SrcY,SrcBodyR,DstX,DstY,DstBodyR) -> float() when
	SrcX::float(),SrcY::float(),SrcBodyR::float(),DstX::float(),DstY::float(),DstBodyR::float().
getObjDist(SrcX,SrcY,SrcBodyR,DstX,DstY,DstBodyR) ->
	DX = DstX - SrcX,
	DY = DstY - SrcY,
	Dist = math:sqrt(DX * DX + DY * DY),
	Dist - SrcBodyR - DstBodyR.

%% ====================================================================
%% Internal functions
%% ====================================================================
-spec sendNetMsgToNetPid(NetPid,Msg) -> ok when
	NetPid::pid(),Msg::term().
sendNetMsgToNetPid(NetPid,Msg) ->
	case erlang:is_pid(NetPid) of
		true ->
			gsSendMsg:sendNetMsg(NetPid, Msg);
		_ ->
			skip
	end,
	ok.

%% 获取角色视野变化
%% 坐标系与客户端一致，如下图所示：
%%	/|\
%%	 |	Y
%%   |
%%   |
%%	 |
%%	 |_______________\
%%					 / X	
-spec getChangedView(OldPos, NewPos) -> map_view() when
	OldPos :: {float(), float()}, NewPos :: {float(), float()}.
getChangedView({OldX, OldY} = _Old, {NewX, NewY} = _New) when
	erlang:is_float(OldX), erlang:is_float(OldY), erlang:is_float(NewX), erlang:is_float(NewY) ->
	{{OldLeft, OldTop},{OldRight, OldBottom}} = getNearRectByPos(OldX, OldY),
	{{NewLeft, NewTop},{NewRight, NewBottom}} = getNearRectByPos(NewX, NewY),
	FoundView =
		if
		%%左下
			NewRight < OldRight andalso NewTop < OldTop ->
				%%?WARN_OUT("左下 Old[~p],New:~p",[Old,New]),
				{
					%%新增区域
					[{{NewLeft,NewTop},{OldLeft,NewBottom}},{{OldLeft,OldBottom},{NewRight,NewBottom}}],
					%%需要去掉的区域
					[{{OldLeft,OldTop},{OldRight,NewTop}},{{NewRight,NewTop},{OldRight,OldBottom}}],
					%%没变化的区域
					[{{OldLeft, NewTop},{NewRight,OldBottom}}]
				};
		%%右下
			NewRight > OldRight andalso NewTop < OldTop ->
				%%?WARN_OUT("右下 Old[~p],New:~p",[Old,New]),
				{
					%%新增区域
					[{{NewLeft,OldBottom},{NewRight,NewBottom}},{{OldRight,NewTop},{NewRight,OldBottom}}],
					%%需要去掉的区域
					[{{OldLeft,OldTop},{NewLeft,OldBottom}},{{NewLeft,OldTop},{OldRight,NewTop}}],
					%%没变化的区域
					[{{NewLeft,NewTop},{OldRight,OldBottom}}]
				};
		%%左上
			NewRight < OldRight andalso NewBottom > OldBottom ->
				%%?WARN_OUT("左上 Old[~p],New:~p",[Old,New]),
				{
					%%新增区域
					[{{NewLeft,OldTop},{OldLeft,NewBottom}},{{NewLeft,NewTop},{NewRight,OldTop}}],
					%%需要去掉的区域
					[{{OldLeft,NewBottom},{OldRight,OldBottom}},{{NewRight,OldTop},{OldRight,NewBottom}}],
					%%没变化的区域
					[{{OldLeft,OldTop},{NewRight,NewBottom}}]
				};
		%%右上
			NewRight > OldRight andalso NewBottom > OldBottom ->
				%%?WARN_OUT("右上 Old[~p],New:~p",[Old,New]),
				{
					%%新增区域
					[{{NewLeft,NewTop},{NewRight,OldTop}},{{OldRight,OldTop},{NewRight,NewBottom}}],
					%%需要去掉的区域
					[{{OldLeft,OldTop},{NewLeft,NewBottom}},{{OldLeft,NewBottom},{OldRight,OldBottom}}],
					%%没变化的区域
					[{{NewLeft,OldTop},{OldRight,NewBottom}}]
				};
		%%下
			NewBottom < OldBottom ->
				%%?WARN_OUT("下 Old[~p],New:~p",[Old,New]),
				{
					%%新增区域
					[{{OldLeft,OldBottom},{NewRight,NewBottom}}],
					%%需要去掉的区域
					[{{OldLeft,OldTop},{NewRight,NewTop}}],
					%%没变化的区域
					[{{OldLeft,NewTop},{NewRight,OldBottom}}]
				};
		%%上
			NewBottom > OldBottom ->
				%%?WARN_OUT("上 Old[~p],New:~p",[Old,New]),
				{
					%%新增区域
					[{{NewLeft,NewTop},{NewRight,OldTop}}],
					%%需要去掉的区域
					[{{NewLeft,NewBottom},{OldRight,OldBottom}}],
					%%没变化的区域
					[{{OldLeft,OldTop},{NewRight,NewBottom}}]
				};
		%%左
			NewRight < OldRight ->
				%%?WARN_OUT("左 Old[~p],New:~p",[Old,New]),
				{
					%%新增区域
					[{{NewLeft,NewTop},{OldLeft,OldBottom}}],
					%%需要去掉的区域
					[{{NewRight,NewTop},{OldRight,OldBottom}}],
					%%没变化的区域
					[{{OldLeft,OldTop},{NewRight,NewBottom}}]
				};
		%%右
			NewRight > OldRight ->
				%%?WARN_OUT("右 Old[~p],New:~p",[Old,New]),
				{
					%%新增区域
					[{{OldRight,OldTop},{NewRight,NewBottom}}],
					%%需要去掉的区域
					[{{OldLeft,OldTop},{NewLeft,NewBottom}}],
					%%没变化的区域
					[{{NewLeft,NewTop},{OldRight,OldBottom}}]
				};
		%% 视野未变化
			true ->
				{[],[],[]}
		end,
	%%下面几句检查代码过一段时间需要删除
%% 	{NewRectList,OldRectList,NotChangeRectList} = FoundView,
%% 	Fun = fun({Pt1,Pt2},Tips) ->
%% 			checkRectPt(Pt1,Pt2,Tips)
%% 	end,
%% 	lists:foldl(Fun, "NewRectList", NewRectList),
%% 	lists:foldl(Fun, "OldRectList", OldRectList),
%% 	lists:foldl(Fun, "NotChangeRectList", NotChangeRectList),
	FoundView.

%%发送物件消失广播消息
sendBroadcastDisapearMessage(PlayerEts, TargetEts, TargetCode) ->
	Msg = #pk_GS2U_BroadcastDisapear{
		code = [TargetCode]
	},
	case myEts:lookUpEts(TargetEts, TargetCode) of
		[#recMapObject{x = X, y = Y, groupID = G, mapPid = MapPid}] ->
			sendMsg2NearPlayerByPos(MapPid, PlayerEts, Msg, X, Y, G);
		Other ->
			?ERROR_OUT("Ets:~p sendBroadcastDisapearMessage:~p,~p,~p", [TargetEts,TargetCode, codeMgr:getObjectTypeByCode(TargetCode), Other])
	end,
	ok.

%% 是否拦截消息
-spec isHookMsg(Msg::tuple()) -> boolean().
isHookMsg(Msg) ->
	case playerScreen:isHookMsg(Msg) of
		true -> playerScreen:isOpen();
		_ -> false
	end.

-spec isHookMsg(boolean(), PlayerPID::pid(), PlayerNetPID::pid(), Msg::tuple()) -> ok.
isHookMsg(false, _PlayerPID, PlayerNetPID, Msg) ->
	sendNetMsgToNetPid(PlayerNetPID, Msg);
isHookMsg(true, PlayerPID, _PlayerNetPID, Msg) ->
	psMgr:sendMsg2PS(PlayerPID, parkBroadcastMsg, Msg).