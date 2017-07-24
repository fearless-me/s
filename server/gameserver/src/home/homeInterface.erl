%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 家园接口
%%% @end
%%% Created : 18. 八月 2017 19:24
%%%-------------------------------------------------------------------
-module(homeInterface).
-author(tiancheng).

-include("gsInc.hrl").

%% API
-export([
	makeHomeID/4,
	parseHomeID/1,
	saveHome/1,
	queryHome/1,
	getAdminAreaID/1,
	isHomeMap/1,
	destroyHomeMap/2,
	queryHomeArea/1,
	makeHomeInfo/1,
	makeHomeBaseInfo/1,
	makeHomeAreaInfo/1,
	queryHomeMap/2,
	queryHomeRole/2,	%% 查询目标角色在目标家园中的身份
	queryHomePlant/1,	%% 查询目标作物的属性
	queryHomeMapForGM/1	%% 用于GM的家园地图信息查询
]).

-export([
	getNeighborLeftHome/1,
	getNeighborLeftRoleID/1,
	getNeighborLeftHomeID/1,
	getNeighborRightHome/1,
	getNeighborRightRoleID/1,
	getNeighborRightHomeID/1
]).

%% 获取家园所在行政区域ID
-spec getAdminAreaID(HomeID::uint64()) -> uint16().
getAdminAreaID(HomeID) ->
	{_DbID, AreaID, _ID1, _ID2} = parseHomeID(HomeID),
	AreaID.

-spec makeHomeID(DbID::uint16(), AreaID::uint16(), ID1::uint16(), ID2::uint16()) -> uint64().
makeHomeID(DbID, AreaID, ID1, ID2) ->
	<<HomeID:64>> = <<0:?HomeID_NONE, DbID:?HomeID_DBID, AreaID:?HomeID_AREA, ID1:?HomeID_ID1, ID2:?HomeID_ID2>>,
	HomeID.

%% 解析家园ID
-spec parseHomeID(HomeID::uint64()) -> {DbID::uint16(), AreaID::uint16(), ID1::uint16(), ID2::uint16()}.
parseHomeID(HomeID) ->
	<<0:?HomeID_NONE, DbID:?HomeID_DBID, AreaID:?HomeID_AREA, ID1:?HomeID_ID1, ID2:?HomeID_ID2>> = <<HomeID:64>>,
	{DbID, AreaID, ID1, ID2}.

saveHome(Data) ->
	gsSendMsg:sendMsg2DBServer(saveHome, 6, Data),
	ok.

%% 查询玩家的家园
-spec queryHome(RoleID::uint64()) -> #rec_home{} | false.
queryHome(0) ->
	false;
queryHome(RoleID) ->
	MS = ets:fun2ms(fun(Home) when Home#rec_home.roleID =:= RoleID -> Home end),
	case ets:select(?HomeEts, MS) of
		[#rec_home{} = Home] ->
			Home;
		_ ->
			false
	end.

%% 查询家园开放的区域
-spec queryHomeArea(HomeID::uint64()) -> [#rec_home_area{},...].
queryHomeArea(HomeID) ->
	MS = ets:fun2ms(
		fun(#rec_home_area{homeID = {HID, _}} = HomeArea) when HomeID =:= HID -> HomeArea end),
	ets:select(?HomeAreaEts, MS).

%% 是否是家园地图
-spec isHomeMap(MapID::uint32()) -> boolean().
isHomeMap(MapID) ->
	case getCfg:getCfgByKey(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeHome} ->
			true;
		#mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeCourtyard} ->
			true;
		_ ->
			0
	end.

destroyHomeMap(MapID, MapPID) ->
	case isHomeMap(MapID) of
		true ->
			case queryHomeMap(MapID, MapPID) of
				#rec_home_map{} = Home ->
					ets:delete_object(?HomeMapEts, Home),
					ok;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

queryHomeMap(MapID, MapPID) ->
	MS = ets:fun2ms(
		fun(HomeMap) when
			HomeMap#rec_home_map.mapID =:= MapID
				andalso HomeMap#rec_home_map.mapPID =:= MapPID ->
			HomeMap
		end
	),
	case ets:select(?HomeMapEts, MS) of
		[#rec_home_map{} = Home] ->
			Home;
		_ ->
			false
	end.

makeHomeBaseInfo(#rec_home{} = Home) ->
	#pk_GS2U_FreshHomeInfo{
		%% UInt64 家园ID，按位存储，10位DBID，10位地区ID，12位段ID，16位号ID
		homeID = Home#rec_home.homeID,
		%% String 为空则表示默认名字，由客户端自行拼接
		homeName = Home#rec_home.homeName,
		%% UInt32 华丽度
		stylish = Home#rec_home.stylish,
		%% UInt32 舒适度
		comfort = Home#rec_home.comfort,
		%% UInt32 家园等级
		homeLvl = Home#rec_home.homeLvl,
		%% UInt32 人气值
		popularity = Home#rec_home.popularity
	}.

makeHomeAreaInfo(#rec_home{homeID = HomeID}) ->
	%% 开放的区域
	L1 = queryHomeArea(HomeID),
	F =
		fun(#rec_home_area{homeID = {_HomeID, AreaID}, areaLvl = Lvl}) ->	% _HomeID与HomeID必然等价，此处加上_避免警告
			#pk_HomeArea{
				homeID = HomeID,
				areaID = AreaID,
				areaLvl = Lvl
			}
		end,
	L2 = lists:map(F, L1),
	#pk_GS2U_FreshHomeAreaInfo{
		homeID = HomeID,
		areas = L2
	}.

getNeighborLeftHome(HomeID) ->
	NeighborHomeID = getNeighborLeftHomeID(HomeID),
	case ets:lookup(?HomeEts, NeighborHomeID) of
		[#rec_home{} = Home] ->
			Home;
		_ ->
			false
	end.
getNeighborLeftRoleID(HomeID) ->
	case getNeighborLeftHome(HomeID) of
		#rec_home{roleID = RIDL} -> RIDL;
		_ -> 0
	end.
getNeighborLeftHomeID(HomeID) ->
	{DbID, AreaID, ID1, ID2} = parseHomeID(HomeID),
	ID2L = case ID2 of
			   1 -> ?HomeID2Max;
			   _ -> ID2 - 1
		   end,
	makeHomeID(DbID, AreaID, ID1, ID2L).

getNeighborRightHome(HomeID) ->
	NeighborHomeID = getNeighborRightHomeID(HomeID),
	case ets:lookup(?HomeEts, NeighborHomeID) of
		[#rec_home{} = Home] ->
			Home;
		_ ->
			false
	end.
getNeighborRightRoleID(HomeID) ->
	case getNeighborRightHome(HomeID) of
		#rec_home{roleID = RIDL} -> RIDL;
		_ -> 0
	end.
getNeighborRightHomeID(HomeID) ->
	{DbID, AreaID, ID1, ID2} = parseHomeID(HomeID),
	ID2R = case ID2 of
			   ?HomeID2Max -> 1;
			   _ -> ID2 + 1
		   end,
	makeHomeID(DbID, AreaID, ID1, ID2R).

makeHomeInfo(#rec_home{homeID = HomeID} = Home) ->
	%% 同居者
	MarriageID = marriageState:queryMarriageRoleID(Home#rec_home.roleID),

	%% 左邻
	RoleIDLeft = getNeighborLeftRoleID(HomeID),

	%% 右舍
	RoleIDRight = getNeighborRightRoleID(HomeID),

	%% 开放的区域
	L1 = queryHomeArea(HomeID),
	F =
		fun(#rec_home_area{homeID = {_HomeID, AreaID_}, areaLvl = Lvl}) ->
			#pk_HomeArea{
				homeID = HomeID,
				areaID = AreaID_,
				areaLvl = Lvl
			}
		end,
	L2 = lists:map(F, L1),

	#pk_GS2U_HomeInfo{
		%% UInt64 家园ID，按位存储，10位DBID，10位地区ID，12位段ID，16位号ID
		homeID = HomeID,
		%% String 为空则表示默认名字，由客户端自行拼接
		homeName = Home#rec_home.homeName,
		%% String 服务器名字
		serverName = Home#rec_home.serverName,
		%% UInt64 家园拥有者ID
		ownerID = Home#rec_home.roleID,
		%% String 名字
		ownerName = playerNameUID:getPlayerNameByUID(Home#rec_home.roleID),
		%% UInt64 同居者，配偶ID
		mateID = MarriageID,
		%% String 配偶名字
		mateName = playerNameUID:getPlayerNameByUID(MarriageID),
		%% UInt32 华丽度
		stylish = Home#rec_home.stylish,
		%% UInt32 舒适度
		comfort = Home#rec_home.comfort,
		%% UInt32 家园等级
		homeLvl = Home#rec_home.homeLvl,
		%% UInt32 人气值
		popularity = Home#rec_home.popularity,
		%% UInt64 左邻ID
		leftID = RoleIDLeft,
		%% String 名字
		leftName = playerNameUID:getPlayerNameByUID(RoleIDLeft),
		%% UInt64 右舍ID
		rightID = RoleIDRight,
		%% String 名字
		rightName = playerNameUID:getPlayerNameByUID(RoleIDRight),
		%% HomeArea 开放的区域
		areas = L2
	}.

%%%-------------------------------------------------------------------
% 查询目标角色在目标家园中的身份
-spec queryHomeRole(HomeID::uint64(), RoleID::uint64()) -> ?HomeRole_BEGIN .. ?HomeRole_END.
queryHomeRole(HomeID, RoleID) ->
	case ets:lookup(?HomeEts, HomeID) of
		[#rec_home{roleID = RoleID}] ->
			?HomeRole_Master;
		[#rec_home{roleID = MasterRoleID}] ->
			case marriageState:queryMarriageRoleID(MasterRoleID) of
				RoleID ->
					?HomeRole_Partner;
				_ ->
					?HomeRole_Guest
			end;
		_ ->
			?HomeRole_Guest
	end.

%%%-------------------------------------------------------------------
% 查询目标作物属性
-spec queryHomePlant(Key) -> #recHomePlant{}|false when
	Key :: {HomeID, AreaID, Pos},
	HomeID :: uint64(),
	AreaID :: uint8(),
	Pos :: uint8().
queryHomePlant(Key) ->
	case ets:lookup(?EtsHomePlant, Key) of
		[#recHomePlant{} = Plant] ->
			Plant;
		_ ->
			false
	end.

%%%-------------------------------------------------------------------
% 用于GM的家园地图信息查询
-spec queryHomeMapForGM(MapPid::pid()) -> {HomeID::uint64(), AreaID::uint8()}.
queryHomeMapForGM(MapPid) ->
	MS = ets:fun2ms(
		fun(HomeMap) when
			HomeMap#rec_home_map.mapPID =:= MapPid ->
			HomeMap
		end
	),
	case ets:select(?HomeMapEts, MS) of
		[#rec_home_map{homeID = {HomeID, Flag}}] ->
			{HomeID, Flag};
		_ ->
			{0, 0}
	end.


