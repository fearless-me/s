%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 家园逻辑模块
%%% @end
%%% Created : 17. 八月 2017 21:14
%%%-------------------------------------------------------------------
-module(homeLogic).
-author(tiancheng).

-include("gsInc.hrl").

-export([
	loadHomeDataAck/1
]).

-export([
	createActivityMapAck/1
]).

-export([
	createHome/1,
	enterHome/2,
	addPopularity/1,
	addComfort/1,
	addStylish/1,
	upgradeHomeArea/1,
	changeHomeName/1
]).

upgradeHomeArea({HomeID, _RoleID, NetPid, AreaID, 0} = Data) ->
	%% 开垦
	case ets:lookup(?HomeAreaEts, {HomeID, AreaID}) of
		[] ->
			AreaList = [#rec_home_area{homeID = {HomeID, AreaID}, areaID = AreaID, areaLvl = 1, areaData = []}],
			ets:insert(?HomeAreaEts, AreaList),
			homeInterface:saveHome({insert, AreaList}),

			[#rec_home{} = Home] = ets:lookup(?HomeEts, HomeID),
			Msg = homeInterface:makeHomeAreaInfo(Home),
			gsSendMsg:sendNetMsg(NetPid, Msg),

			%% 开垦成功
			playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_HomeOpenSuccess);
		_ ->
			%% 开垦失败，但是钱已经扣了，记录日志
			?ERROR_OUT("upgradeHomeArea:~p", [Data]),
			playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_SystemErrorOpenFailed)
	end,
	ok;
upgradeHomeArea({HomeID, _RoleID, NetPid, AreaID, AreaLvl} = Data) ->
	%% 升级
	case ets:lookup(?HomeAreaEts, {HomeID, AreaID}) of
		[#rec_home_area{areaLvl = AreaLvl} = Area] ->
			NewAreaLvl = AreaLvl + 1,
			ets:update_element(?HomeAreaEts, {HomeID, AreaID}, {#rec_home_area.areaLvl, NewAreaLvl}),
			homeInterface:saveHome(Area#rec_home_area{areaLvl = NewAreaLvl}),

			[#rec_home{} = Home] = ets:lookup(?HomeEts, HomeID),
			Msg = homeInterface:makeHomeAreaInfo(Home),
			gsSendMsg:sendNetMsg(NetPid, Msg),

			%% 升级成功
			playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_HomeUpgradeSuccess);
		Error ->
			%% 升级失败，但是钱已经扣了，记录日志
			?ERROR_OUT("upgradeHomeArea:~p,~p", [Data, Error]),
			playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_SystemErrorUpgradeFailed)
	end,
	ok.

changeHomeName({HomeID, _RoleID, HomeName, NetPid} = Data) ->
	case ets:lookup(?HomeEts, HomeID) of
		[#rec_home{} = Home] ->
			ets:update_element(?HomeEts, HomeID, {#rec_home.homeName, HomeName}),
			homeInterface:saveHome(Home#rec_home{homeName = HomeName}),
			freshHomeBaseInfo(HomeID, NetPid);
		_ ->
			?ERROR_OUT("changeHomeName:~p", [Data]),
			playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_HomeNotExist)
	end,
	ok.

addPopularity({HomeID, Value, NetPid}) ->
	case addPopularity({HomeID, Value}) of
		true ->
			freshHomeBaseInfo(HomeID, NetPid);
		ErrorCode ->
			playerMsg:sendErrorCodeMsg(NetPid, ErrorCode)
	end,
	ok;
addPopularity({HomeID, Value}) ->
	case ets:lookup(?HomeEts, HomeID) of
		[#rec_home{popularity = Old} = Home] ->
			NewValue = Old + Value,
			ets:update_element(?HomeEts, HomeID, {#rec_home.popularity, NewValue}),

			NewHome = Home#rec_home{popularity = NewValue},
			homeInterface:saveHome(NewHome),

			homeUpgrade(NewHome),
			true;
		_ ->
			?ErrorCode_HomeNotExist
	end.

addComfort({HomeID, Value, NetPid}) ->
	case addComfort({HomeID, Value}) of
		true ->
			freshHomeBaseInfo(HomeID, NetPid);
		ErrorCode ->
			playerMsg:sendErrorCodeMsg(NetPid, ErrorCode)
	end,
	ok;
addComfort({HomeID, Value}) ->
	case ets:lookup(?HomeEts, HomeID) of
		[#rec_home{comfort = Old} = Home] ->
			NewValue = Old + Value,
			ets:update_element(?HomeEts, HomeID, {#rec_home.comfort, NewValue}),

			NewHome = Home#rec_home{comfort = NewValue},
			homeInterface:saveHome(NewHome),

			homeUpgrade(NewHome),
			true;
		_ ->
			?ErrorCode_HomeNotExist
	end.

addStylish({HomeID, Value, NetPid}) ->
	case addStylish({HomeID, Value}) of
		true ->
			freshHomeBaseInfo(HomeID, NetPid);
		ErrorCode ->
			playerMsg:sendErrorCodeMsg(NetPid, ErrorCode)
	end,
	ok;
addStylish({HomeID, Value}) ->
	case ets:lookup(?HomeEts, HomeID) of
		[#rec_home{stylish = Old} = Home] ->
			NewValue = Old + Value,
			ets:update_element(?HomeEts, HomeID, {#rec_home.stylish, NewValue}),

			NewHome = Home#rec_home{stylish = NewValue},
			homeInterface:saveHome(NewHome),

			homeUpgrade(NewHome),
			true;
		_ ->
			?ErrorCode_HomeNotExist
	end.

homeUpgrade(#rec_home{homeID = HomeID, homeLvl = Lvl, stylish = St, comfort = Co} = Home) ->
	case getCfg:getCfgByKey(cfg_home_level, Lvl) of
		#home_levelCfg{stylish = NeedSt, comfort = NeedCo} ->
			case St >= NeedSt andalso Co >= NeedCo of
				true ->
					NewLvl = case getCfg:getCfgByKey(cfg_home_level, Lvl + 1) of
								 #home_levelCfg{} -> Lvl + 1;
								 _ -> Lvl
							 end,
					case NewLvl /= Lvl of
						true ->
							ets:update_element(?HomeEts, HomeID, {#rec_home.homeLvl, NewLvl}),

							NewHome = Home#rec_home{homeLvl = NewLvl},
							homeInterface:saveHome(NewHome),

							?LOG_OUT("homeUpgrade:~p,~p -> ~p", [HomeID, Lvl, NewLvl]),

							%% 继续递归，判断能否升级
							homeUpgrade(NewHome);
						_ ->
							?WARN_OUT("homeUpgrade but not config:~p, ~p", [HomeID, NewLvl]),
							skip
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end;
homeUpgrade(HomeID) ->
	case ets:lookup(?HomeEts, HomeID) of
		[#rec_home{} = Home] ->
			homeUpgrade(Home);
		_ ->
			ok
	end.

freshHomeBaseInfo(HomeID, NetPid) ->
	case ets:lookup(?HomeEts, HomeID) of
		[#rec_home{} = Home] ->
			Info = homeInterface:makeHomeBaseInfo(Home),
			gsSendMsg:sendNetMsg(NetPid, Info);
		_ ->
			skip
	end.

enterHome(PidFrom, {HomeID, WantEnterRoleID, WantEnterFlag} = Data) ->
	%% 如果地图存在，则直接进入，否则，告诉公共进程
	case ets:lookup(?HomeAreaEts, {HomeID, WantEnterFlag}) of
		[#rec_home_area{areaLvl = Lvl}] ->
			case ets:lookup(?HomeMapEts, {HomeID, WantEnterFlag}) of
				[#rec_home_map{mapID = MapID, mapPID = MapPID}] ->
					%% 直接进入
					psMgr:sendMsg2PS(PidFrom, enterHomeAck, {WantEnterRoleID, MapID, MapPID});
				_ ->
					AdminAreaID = homeInterface:getAdminAreaID(HomeID),
					case getCfg:getCfgByKey(cfg_home, AdminAreaID) of
						#homeCfg{mapIDs = MapID1s, courtyardMapIDs = MapID2s} ->
							MapID = case WantEnterFlag of
										?Home_House -> getMapID(MapID1s, Lvl);
										?Home_Courtyard -> getMapID(MapID2s, Lvl)
									end,
							case homeInterface:isHomeMap(MapID) of
								true ->
									case homeState:isHaveWaitCreateHomeMap(HomeID, WantEnterFlag) of
										false ->
											%% 还没有创建
											homeState:addWaitCreateHomeMap(HomeID, WantEnterFlag),

											%% 告诉公共地图，创建活动进程
											core:sendMsgToMapMgr(MapID, createActivityMap, {MapID, 1, {HomeID, WantEnterFlag}}),
											ok;
										_ ->
											%% 已经在创建流程中了
											skip
									end,

									%% 玩家加入等待列表
									homeState:updateWaitEnterHomeRole(WantEnterRoleID, HomeID, WantEnterFlag, PidFrom),
									ok;
								_ ->
									?ERROR_OUT("map not home map:~p,~p", [Data, MapID])
							end;
						_ ->
							?ERROR_OUT("not found map:~p,~p", [Data, AdminAreaID])
					end
			end;
		Error1 ->
			?ERROR_OUT("error1:~p,~p", [Data, Error1])
	end,
	ok.

createActivityMapAck({MapID, [MapPID], {HomeID, WantEnterFlag}} = Data) ->
	?DEBUG_OUT("createActivityMapAck:~p", [Data]),
	Rec = #rec_home_map{
		homeID = {HomeID, WantEnterFlag},	%% {HomeID, Flag}
		flag = WantEnterFlag,	%% 房屋还是庭院
		mapID = MapID,
		mapPID = MapPID,
		createTime = time2:getTimestampSec()	%% 创建时间
	},
	ets:insert(?HomeMapEts, Rec),

	homeState:delWaitCreateHomeMap(HomeID, WantEnterFlag),

	%% 通知所有等待的玩家
	List = homeState:getWaitEnterHomeRoleList(),
	?DEBUG_OUT("homemapets:~p,~p", [Rec, List]),
	F =
		fun({RoleID, WantEnterHomeID, Flag, Pid} = Obj, AccList) ->
			case HomeID =:= WantEnterHomeID andalso Flag =:= WantEnterFlag of
				true ->
					psMgr:sendMsg2PS(Pid, enterHomeAck, {RoleID, MapID, MapPID}),
					lists:delete(Obj, AccList);
				_ ->
					AccList
			end
		end,
	List2 = lists:foldl(F, List, List),
	homeState:setWaitEnterHomeRoleList(List2),
	ok.

createHome({RoleID, AdminAreaID}) ->
	MS = ets:fun2ms(fun(Home) when Home#rec_home.roleID =:= RoleID -> Home end),
	case ets:select(?HomeEts, MS) of
		[#rec_home{} = Home] ->
			{false, Home};
		_ ->
			case makeHomeID(AdminAreaID) of
				0 ->
					{false, 0};
				HomeID ->
					HomeRec = #rec_home{
						homeID = HomeID,
						homeName = "",
						homeLvl = 1,
						roleID = RoleID,
						stylish = 0,
						comfort = 0,
						popularity = 0,
						serverName = globalSetup:getServerName(),
						createtime = time2:getTimestampSec()
					},
					%% 插入家园
					ets:insert(?HomeEts, HomeRec),
					homeInterface:saveHome({insert, HomeRec}),

					%% 开通默认区域
					A1 = #rec_home_area{homeID = {HomeID, ?Home_House}, areaID = ?Home_House, areaLvl = 1, areaData = []},
					A2 = #rec_home_area{homeID = {HomeID, ?Home_Courtyard}, areaID = ?Home_Courtyard, areaLvl = 1, areaData = []},
					A3 = #rec_home_area{homeID = {HomeID, ?Home_BreedArea}, areaID = ?Home_BreedArea, areaLvl = 1, areaData = []},
					A4 = #rec_home_area{homeID = {HomeID, ?Home_Plantation_A}, areaID = ?Home_Plantation_A, areaLvl = 1, areaData = []},
					AreaList = [A1, A2, A3, A4],
					ets:insert(?HomeAreaEts, AreaList),
					homeInterface:saveHome({insert, AreaList}),

					?LOG_OUT("createhome success:~p,~p,~p", [RoleID, AdminAreaID, HomeID]),
					{true, HomeRec}
			end
	end.

%% 家园ID，按位存储，10位DbID，10位地区ID，12位段ID，16位号ID
makeHomeID(AreaID) ->
	case getIDIndex(homeState:getHomeAreaID1Index(AreaID), homeState:getHomeAreaID2Index(AreaID)) of
		{ID1, ID2} when ID1 =< ?HomeID1Max andalso  ID2 =< ?HomeID2Max ->
			%% 保存新的ID
			homeState:setHomeAreaID1Index(AreaID, ID1),
			homeState:setHomeAreaID2Index(AreaID, ID2),

			makeHomeID(AreaID, ID1, ID2);
		_ ->
			0
	end.

getIDIndex(ID1, ID2) when ID1 > ?HomeID1Max orelse ID2 > ?HomeID2Max -> false;
getIDIndex(ID1, ID2) when ID1 =:= ?HomeID1Max andalso ID2 =:= ?HomeID2Max -> false;
getIDIndex(ID1, ID2) when ID2 =:= ?HomeID2Max -> getIDIndex(ID1 + 1, 0);
getIDIndex(ID1, ID2) -> {ID1, ID2 + 1}.

makeHomeID(AreaID, ID1, ID2) ->
	DbID = globalSetup:getDBID(),
	homeInterface:makeHomeID(DbID, AreaID, ID1, ID2).

loadHomeDataAck({Homes, HomeAreas}) ->
	DbID = globalSetup:getDBID(),
	F1 =
		fun(#rec_home{homeID = HID, homeName = HName, serverName = SName} = Home) ->
			Home2 = Home#rec_home{homeName = binary_to_list(HName), serverName = binary_to_list(SName)},
			ets:insert(?HomeEts, Home2),

			%% 修正最大ID序列
			case homeInterface:parseHomeID(HID) of
				{DbID, AreaID, ID1, ID2} ->
					case homeState:getHomeAreaID1Index(AreaID) < ID1 of
						true -> homeState:setHomeAreaID1Index(AreaID, ID1);
						_ -> skip
					end,

					case homeState:getHomeAreaID2Index(AreaID) < ID2 of
						true -> homeState:setHomeAreaID2Index(AreaID, ID2);
						_ -> skip
					end,
					ok;
				_ ->
					skip
			end
		end,
	lists:foreach(F1, Homes),

	F2 =
		fun(#rec_home_area{homeID = HomeID, areaID = AreaID, areaData = DataBin} = Area0, Acc) ->
			%% FIXME Data转档的时候需要转换成对应的数据结构
			Area1 = Area0#rec_home_area{homeID = {HomeID, AreaID}, areaData = binary_to_list(DataBin)},
			Ret0 = homePlantLogic:loadHomeDataAck(Area1),
			case Ret0 of
				Area1 ->
					[Area1 | Acc];
				Area2 ->
					homeInterface:saveHome(Area2),	%% 修复无效的数据，对应分支已有异常日志
					[Area2 | Acc]
			end
		end,
	HomeAreas2 = lists:foldl(F2, [], HomeAreas),
	ets:insert(?HomeAreaEts, HomeAreas2),

	?LOG_OUT("loadHomeDataAck home:~p, area:~p", [erlang:length(Homes), erlang:length(HomeAreas)]),
	ok.

getMapID(List, Lvl) ->
	case erlang:length(List) >= Lvl of
		true ->
			lists:nth(Lvl, List);
		_ ->
			[ID|_] = lists:reverse(List),
			ID
	end.
