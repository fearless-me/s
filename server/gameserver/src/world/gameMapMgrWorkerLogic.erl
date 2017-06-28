%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2017, <雨墨>
%%% @doc
%%% 工作者逻辑进程
%%% @end
%%% Created : 05. 五月 2017 15:28
%%%-------------------------------------------------------------------
-module(gameMapMgrWorkerLogic).
-author(tiancheng).

-include("mapPrivate.hrl").

%% API
-export([
	getCopyMapInfo/1,
	getCopyMapInfo/3,
	getCopyMapInfoByTeamID/2,
	playerEnterMapSuccess/5,
	playerLeaveMapNormal/4,
	resetCopyMap/3,
	prepareDestroy/2,
	destroyMap/2
]).

-export([
	getSingleID/2,
	parseSingleID/1
]).

getCopyMapInfo(MapPid) ->
	mapMgrState:getCopyMap(MapPid).

getCopyMapInfo(RoleID, TeamID, CopyMapID) ->
	case core:isSingleCopyMap(CopyMapID) of
		true ->
			KeyID = gameMapMgrWorkerLogic:getSingleID(RoleID, CopyMapID),
			getCopyMapInfoByTeamID(KeyID, CopyMapID);
		_ ->
			getCopyMapInfoByTeamID(TeamID, CopyMapID)
	end.

getCopyMapInfoByTeamID(TeamID, CopyMapID) when erlang:is_integer(TeamID) andalso TeamID > 0 ->
	MS = ets:fun2ms(
		fun(#recKeyValue{value = MapInfo})
			when MapInfo#recCopyMapInfo.teamID =:= TeamID andalso MapInfo#recCopyMapInfo.mapID =:= CopyMapID ->
			MapInfo
		end
	),
	ets:select(mapMgrState:getWorkInfoEts(),MS);
getCopyMapInfoByTeamID(TeamID, CopyMapID) ->
	?ERROR_OUT("getCopyMapInfoByTeamID teamID:~p, copymapID:~p trace:~p", [TeamID, CopyMapID, misc:getStackTrace()]),
	[].

%% 玩家进入地图成功了
-spec playerEnterMapSuccess(RoleID::uint(), RolePID::pid(), MapID::uint(), MapPid::pid(), Num::uint()) -> ok.
playerEnterMapSuccess(RoleID, _RolePID, _MapID, MapPid, Num) ->
	%% 设置地图的人数
	#recMapInfo{willEnterRoleIDList = List} = MapInfo = mapMgrState:getMapInfo(MapPid),
	mapMgrState:setMapInfo(MapPid, MapInfo#recMapInfo{totalPlayerNum = Num,willEnterRoleIDList = lists:delete(RoleID,List)}),
	ok.

%% 玩家普通方式离开地图
-spec playerLeaveMapNormal(RoleID::uint(), MapID::uint(), MapPid::pid(), PlayerNum::uint()) -> ok.
playerLeaveMapNormal(RoleID, MapID, MapPid, PlayerNum) ->
	case playerScene:getMapType(MapID) of
		?MapTypeCopyMap ->
			%% 离开副本
			?LOG_OUT("playerLeaveMapNormal:~p,~p,~p,~p", [RoleID, MapID, MapPid, PlayerNum]),

			case mapMgrState:getCopyMap(MapPid) of
				MapInfo = #recCopyMapInfo{enteredMemberIDList = EnterList} ->
					case lists:member(RoleID, EnterList) of
						true ->
							NList = lists:delete(RoleID, EnterList),
							mapMgrState:setCopyMap(MapInfo#recCopyMapInfo{enteredMemberIDList = NList});
						false ->
							?ERROR_OUT("playerLeaveMapNormal del self[~p] failed:MapID:~p,MapPid:~p,teamID:~p,isWaitDestory:~p EnterList:~w",
								[
									RoleID,
									MapInfo#recCopyMapInfo.mapID,
									MapInfo#recCopyMapInfo.mapPid,
									MapInfo#recCopyMapInfo.teamID,
									MapInfo#recCopyMapInfo.isWaitDestroy,
									MapInfo#recCopyMapInfo.enteredMemberIDList
								])
					end;
				_ -> skip
			end;
		_ ->
			skip
	end,

	%% 更新地图的人数
	MapInfo2  = mapMgrState:getMapInfo(MapPid),
	mapMgrState:setMapInfo(MapPid, MapInfo2#recMapInfo{totalPlayerNum = PlayerNum}),
	ok.

%% 重置副本
-spec resetCopyMap(RoleID::uint64(), TeamID::uint64(), CopyMapID::uint()) ->
	{true, CopyMapID} | {false, CopyMapID, uint()} when CopyMapID::uint().
resetCopyMap(RoleID, TeamID, CopyMapID) ->
	IsRest =
		case core:isSingleCopyMap(CopyMapID) of
			true ->
				true;
			false ->
				RoleID =:= teamInterface:getLeaderIDWithTeamID(TeamID)
		end,

	case IsRest of
		true ->
			case getCopyMapInfo(RoleID, TeamID, CopyMapID) of
				[#recCopyMapInfo{mapPid = MapPid}] ->
					psMgr:sendMsg2PS(MapPid, resetCopyMap, {}),
					{true, CopyMapID};
				_ ->
					{false, CopyMapID, ?ErrorCode_CopyMapNotFound}
			end;
		_ ->
			{false, CopyMapID, ?ErrorCode_CopyMapResetFailed}
	end.

%% 准备销毁地图
-spec prepareDestroy(MapID::uint(), MapPid::pid()) -> ok.
prepareDestroy(MapID, MapPid) ->
	?LOG_OUT("MapMgr prepareDestory:~p,~p", [MapID, MapPid]),

	%%如果是副本地图，还需要做额外的事情
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeCopyMap} ->

			case mapMgrState:getCopyMap(MapPid) of
				#recCopyMapInfo{mapID = MapID} = MapInfo ->
					mapMgrState:setCopyMap(MapInfo#recCopyMapInfo{isWaitDestroy = true});
				Error ->
					?ERROR_OUT("prepareDestroy copymapID not find:~p, mapPid:~p error:~p", [MapID, MapPid, Error]),
					skip
			end;
		_ ->
			skip
	end,

	case mapMgrState:getMapInfo(MapPid) of
		#recMapInfo{id = MapID} = MapInfo2 ->
			mapMgrState:setMapInfo(MapPid, MapInfo2#recMapInfo{isWaitDestroy = true});
		Error2 ->
			?ERROR_OUT("prepareDestroy mapID not find:~p, mapPid:~p error:~p", [MapID, MapPid, Error2]),
			skip
	end,
	ok.

%% 销毁地图
-spec destroyMap(MapID::uint(), MapPid::pid()) -> ok.
destroyMap(MapID, MapPid) ->
	?LOG_OUT("MapMgr want to destoryMap:~p,~p", [MapID, MapPid]),
	mapMgrState:deleteMapInfo(MapPid),

	mapMgrState:deleteCopyMap(MapPid),

	psMgr:sendMsg2PS(?PsNameOperateActivity, destoryMap, {MapID,MapPid}),

	case MapID of
		?CrosHdBattleMapID ->
			psMgr:sendMsg2PS(?PsNameCrosHd, destoryMap, {MapPid});
		_ ->
			skip
	end,
	ok.

getSingleID(RoleID, MapID) ->
	<<ID:80>> = <<RoleID:64,MapID:16>>,
	ID.

parseSingleID(ID) ->
	<<RoleID:64,MapID:16>> = <<ID:80>>,
	{RoleID, MapID}.