%% @author Administrator
%% @doc @todo Add description to playerTeamCopyMap.


-module(playerTeamCopyMap).

-include("gsInc.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	inviteMemberToCopyMap/3,
	leaveCopyMapInitiative/1,
	leaveTeamCopyMap/1,
	isAssistCopyMapByCopyMapID/2
]).

inviteMemberToCopyMap(_TeamID,RoleID,CopyMapID) ->
	case teamInterface:isTeamLeader(RoleID) of
		true ->
			teamInterface:sendMsg2TeamWithRoleID(
				RoleID,
				requestEnterCopyMap,
				CopyMapID,
				false
			);
		_ ->
			skip
	end,
	ok.

%% 主动离开副本，需要离开队伍
-spec leaveCopyMapInitiative(IsNotify::boolean()) -> boolean().
leaveCopyMapInitiative(IsNotify) ->
	MapID = playerState:getMapID(),
	case playerScene:getMapType(MapID) of
		?MapTypeCopyMap ->
			MapPid = playerState:getMapPid(),
			core:sendMsgToMapMgr(MapID, playerLeaveCopyMap, {playerState:getRoleID(), MapID, MapPid}),
			playerTeam:leaveTeam(IsNotify),
			true;
		_ ->
			false
	end.

%% 离开队伍，如果在副本中，需要离开副本
-spec leaveTeamCopyMap(IsNotify::boolean()) -> ok.
leaveTeamCopyMap(IsNotify) ->
	MapID = playerState:getMapID(),
	case playerScene:getMapType(MapID) of
		?MapTypeCopyMap ->
			%% 离开副本
			playerCopyMap:leaveCopyMap(),

			MapPid = playerState:getMapPid(),
			core:sendMsgToMapMgr(MapID, playerLeaveCopyMap, {playerState:getRoleID(), MapID, MapPid}),
			ok;
		_ ->
			skip
	end,
	%% 离开队伍
	playerTeam:leaveTeam(IsNotify),
	ok.

%% 用于第一次进入副本时，根据组队中助战地图ID来判断
-spec isAssistCopyMapByCopyMapID(RoleID::uint64(), CopyMapID::uint16()) -> boolean().
isAssistCopyMapByCopyMapID(RoleID, CopyMapID) ->
	case playerScene:getMapType(CopyMapID) of
		?MapTypeCopyMap ->
			case teamInterface:getTeamMemberInfoWithRoleID(RoleID) of
				#recTeamMemberInfo{assistMapID = CopyMapID} -> true;
				_ -> false
			end;
		_ ->
			false
	end.

