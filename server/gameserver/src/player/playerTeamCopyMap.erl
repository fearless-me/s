%% @author Administrator
%% @doc @todo Add description to playerTeamCopyMap.


-module(playerTeamCopyMap).

-include("gsInc.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	inviteMemberToCopyMap/3,
	changeTeamLeader/2
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
%%	case team2:getTeamInfoByTeamID(TeamID) of
%%		#rec_team{leaderID = LID, members = MembersList} ->
%%			case LID =:= RoleID of
%%				true ->
%%					?LOG_OUT("inviteMemberToCopyMap:roleid=~p,teamid=~p,mapid=~p",
%%						[RoleID,TeamID,CopyMapID]),
%%					%% 只有队长可以邀请
%%					[psMgr:sendMsg2PS(Pid, broadcast, #pk_GS2U_InvateEnterCopyMap{copyMapID = CopyMapID})
%%						|| #recTeamMemberInfo{roleID = MemberID, pid = Pid} <- MembersList, MemberID =/= RoleID];
%%				_ ->
%%					skip
%%			end;
%%		_ ->
%%			skip
%%	end,
	ok.

%% 队伍队长发生改变，不包括队伍解散
-spec changeTeamLeader(OldLeaderID::uint(), NewLeaderID::uint()) -> ok.
changeTeamLeader(OldLeaderID, NewLeaderID) ->
	core:sendMsgToMapMgr(playerState:getMapID(), changeTeamLeader, {OldLeaderID, NewLeaderID}),
	ok.
