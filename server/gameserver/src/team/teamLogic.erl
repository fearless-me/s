%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%   先写入 Ets_RoleIDRefTeamID， 再写入 Ets_TeamList
%%%   先删除 Ets_TeamList， 再删除 Ets_RoleIDRefTeamID
%%%  fixme:队长下线是否转移队长；全队都离线是否删除队伍
%%% @end
%%% Created : 05. 五月 2017 14:42
%%%-------------------------------------------------------------------
-module(teamLogic).
-author("Administrator").

-include("setup.hrl").
-include("gsInc.hrl").

-export([
	tick/0,
	tickMsg/0
]).

%% API
-export([
	createNewTeam/1,
	dismissTeam/1,
	joinTeam/1,
	matchTeam/1,
	cancelMatchTeam/1,
	leaveTeam/1,
	leaveTeamAndEnter/1,
	changeLeader/1,
	leaderOffline/1,
	changeTargetMap/1,
	leaderStartCopyMap/1,
	memberStartCopyMapAck/1,
	kickMember/1,
	updateMemberInfo/1,
	setSearchFlag/1
]).

%%%-------------------------------------------------------------------
tickMsg() ->
	erlang:send_after(?TeamTickTime, self(), tick).

tick() ->
	tickMsg(),
	Now = time2:getTimestampMS(),
	L = myEts:getAllRecord(?Ets_RoleMatchTeam),
	tickMatch(Now, L, ?MatchTickControl),
	ok.

tickMatch(_Now, [], _N) ->
	ok;
tickMatch(_Now, _L, N) when N =< 0 ->
	ok;
tickMatch(
	Now
	, [#recRoleMatchTeam{roleID = RoleID, pid = Pid, queueTimeEndMs = QueueEndTime, mapList = ML} | L]
	, N
) ->
	case teamInterface:isInTeam(RoleID) of
		true ->
			myEts:deleteRecord(?Ets_RoleMatchTeam, RoleID);
		_ ->
			case misc:is_process_alive(Pid) of
				true ->
					case Now >= QueueEndTime of
						true ->
							myEts:deleteRecord(?Ets_RoleMatchTeam, RoleID),
							case core:queryNetPidByRoleID(RoleID) of
								NetPid when erlang:is_pid(NetPid) ->
									playerMsg:sendNetMsg(
										NetPid,
										#pk_GS2U_QuickTeamMatchAck{
											result = ?MatchState_TimeOut,
											startTime = 0
										}
									);
								_ ->
									skip
							end;
						_ ->
							psMgr:sendMsg2PS(Pid, fastMatchTeam, ML)
					end;
				_ ->
					myEts:deleteRecord(?Ets_RoleMatchTeam, RoleID)
			end
	end,
	tickMatch(Now, L, N - 1).

%%%-------------------------------------------------------------------
cancelMatchTeam({RoleID, NetPid, IsNotify}) ->
	myEts:deleteRecord(?Ets_RoleMatchTeam, RoleID),
	case IsNotify of
		true ->
			playerMsg:sendNetMsg(
				NetPid, #pk_GS2U_QuickTeamMatchAck{
					result = ?MatchState_NotIn,
					startTime = 0
				}
			);
		_ ->
			skip
	end,
	ok.

%%%-------------------------------------------------------------------
%%{TeamID, RoleID, playerState:getNetPid(), makeTeamMemberInfo(), MapList, Active}
matchTeam({RoleID, NetPid, MemberInfo, MapList, MCL, Active}) ->
	case canMatchTeam(RoleID) of
		{true, _} ->
			doMatchTeam(RoleID, NetPid, MemberInfo, MapList, MCL, Active);
		{false, ErrorCode} when Active ->
			playerMsg:sendErrorCodeMsg(NetPid, ErrorCode);
		_ ->
			skip
	end,
	ok.

canMatchTeam(RoleID) ->
	case teamInterface:isInTeam(RoleID) of
		false ->
			{true, 0};
		_ ->
			{false, ?ErrorCode_TeamHasTeam}
	end.

%%
doMatchTeam(RoleID, NetPid, MemberInfo, MapList, MCL, Active) ->
	TL = teamInterface:queryTeamList(MapList),
	case matchFast(true, TL) of
		#recTeamInfo{teamID = TeamID, copyMapID = CopyMapID} ->
			myEts:deleteRecord(?Ets_RoleMatchTeam, RoleID),
			joinTeam({TeamID, modifyCopyMapCount(CopyMapID,MemberInfo, MCL)});
		_ when Active ->
			doJoinSystemMatch(RoleID, NetPid, MemberInfo, MapList);
		_ ->
			skip
	end,
	ok.

modifyCopyMapCount(CopyMapID, MemberInfo, MCL)->
	case lists:keyfind(CopyMapID, 1, MCL) of
		{_, MC}->
			MemberInfo#recTeamMemberInfo{targetMapCount = MC};
		_ ->
			MemberInfo
	end.

doJoinSystemMatch(RoleID, NetPid, MemberInfo, MapList) ->
	playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_TeamSystemMatchTeamForU),
	Now = time:getSyncTimeFromDBS(),
	myEts:insertEts(
		?Ets_RoleMatchTeam,
		#recRoleMatchTeam{
			roleID = RoleID,
			pid = MemberInfo#recTeamMemberInfo.pid,
			startTime = Now,
			queueTimeEndMs = time2:getTimestampMS() + ?InQueueTime,
			mapList = MapList
		}),
	Msg = #pk_GS2U_QuickTeamMatchAck{ result = ?MatchState_InQueue, startTime = Now},
	playerMsg:sendNetMsg(NetPid, Msg),
	ok.

matchFast(false, _) ->
	false;
matchFast(R, []) ->
	R;
matchFast(true, [#recTeamInfo{} = R | L]) ->
	matchFast(R, L);
matchFast(#recTeamInfo{memberList = ML1} = R1, [#recTeamInfo{memberList = ML2} = R2 | L1]) ->
	LR1 = length(ML1),
	LR2 = length(ML2),
	{R, L2} =
		if
			LR1 =:= ?MAX_TeamMemberNum - 1 ->
				{R1, []};
			LR2 =:= ?MAX_TeamMemberNum - 1 ->
				{R2, []};
			true ->
				case LR2 > LR1 of
					true ->
						{R2, L1};
					_ ->
						{R1, L1}
				end
		end,
	matchFast(R, L2).


%%%-------------------------------------------------------------------
createNewTeam({CopyMapID, TargetRoleID, MemberInfo}) ->
	case canCreateTeam(CopyMapID, MemberInfo#recTeamMemberInfo.roleID) of
		{true, _} ->
			doCreateNewTeam(CopyMapID, TargetRoleID, MemberInfo);
		{_, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(MemberInfo#recTeamMemberInfo.netPid, ErrorCode)
	end.
canCreateTeam(0, _RoleID) ->
	{false, ?ErrorCode_TeamCantChangeMapZero};
canCreateTeam(_CopyMapID, RoleID) ->
	case teamInterface:getTeamID(RoleID) of
		TeamID when TeamID > 0 ->
			{false, ?ErrorCode_TeamHasTeam};
		_ ->
			{true, 0}
	end.

doCreateNewTeam(CopyMapID, TargetRoleID, #recTeamMemberInfo{
	netPid = NetPid,
	roleID = RoleID
} = MemberInfo) ->

	NewTeamID = uidMgr:makeTeamUID(),
	TeamInfo = #recTeamInfo{
		teamID = NewTeamID,
		copyMapID = CopyMapID,
		leaderID = RoleID,
		searchStartTime = time:getSyncTimeFromDBS(),
		memberList = [MemberInfo]
	},
	myEts:deleteRecord(?Ets_RoleMatchTeam, RoleID),
	true = myEts:insertEts(?Ets_RoleIDRefTeamID, #recRoleRefTeamID{roleID = RoleID, teamID = NewTeamID}),
	true = myEts:insertEts(?Ets_TeamList, TeamInfo),
	playerMsg:sendNetMsg(
		NetPid,
		teamInterface:makeTeamInfoMsg(TeamInfo)
	),
	fastInviteOther(TargetRoleID, RoleID, CopyMapID, MemberInfo),
	?DEBUG_OUT("[~p]create Team[~p] with[~p], leader[~p],targetMap[~p], member[~p]",
		[RoleID, NewTeamID, TargetRoleID, RoleID, CopyMapID, RoleID]),
	ok.

fastInviteOther(0, _LeaderID, _CopyMapID, _MemberInfo) ->
	ok;
fastInviteOther(TargetRoleID, LeaderID, CopyMapID,
	#recTeamMemberInfo{netPid = NetPid, name = Name, guildID = GuildID, guildName = GuildName}
) ->
	sendMsgToOnlineRole(
		TargetRoleID,
		otherInviteJoinTeam,
		{CopyMapID, NetPid, LeaderID, Name, GuildID, GuildName}
	).

%%%-------------------------------------------------------------------
dismissTeam({RoleID, NetPid}) ->
	case canDismissTeam(RoleID) of
		{true, _} ->
			doDismissTeam(RoleID, teamInterface:getTeamID(RoleID));
		{_, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(NetPid, ErrorCode)
	end,
	ok.

canDismissTeam(RoleID) ->
	{teamInterface:isTeamLeader(RoleID), ?ErrorCode_TeamOnlyLeaderCanOp}.

doDismissTeam(RoleID, 0) ->
	?ERROR_OUT("[~p]dismissTeam,but no team", [RoleID]);
doDismissTeam(RoleID, TeamID) ->
	ResetMsg = #pk_GS2U_TeamReset{},
	teamInterface:sendNetMsg2TeamWithRoleID(RoleID, ResetMsg, true),
	RoleIDList = teamInterface:getTeamMemberRoleIDListWithTeamID(TeamID),
	myEts:deleteRecord(?Ets_TeamList, TeamID),
	lists:foreach(
		fun(MemberRoleID) ->
			myEts:deleteRecord(?Ets_RoleIDRefTeamID, MemberRoleID)
		end, RoleIDList),
	?DEBUG_OUT("[~p]dismiss team[~p],memberList[~w]", [RoleID, TeamID, RoleIDList]),
	ok.

%%%-------------------------------------------------------------------
joinTeam({TeamID, #recTeamMemberInfo{
	roleID = RoleID,
	netPid = NetPid} = MemberInfo
}) ->
	case canJoinTeam(RoleID, TeamID) of
		{true, TeamInfo} ->
			doJoinTeam(TeamInfo, MemberInfo);
		{_, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(NetPid, ErrorCode)
	end.

canJoinTeam(RoleID, TeamID) ->
	case teamInterface:isInTeam(RoleID) of
		false ->
			case myEts:readRecord(?Ets_TeamList, TeamID) of
				#recTeamInfo{memberList = ML} = TeamInfo ->
					case length(ML) >= ?MAX_TeamMemberNum of
						true ->
							{false, ?ErrorCode_TeamMemberMax};
						_ ->
							{true, TeamInfo}
					end;
				_ ->
					{false, ?ErrorCode_TeamDissmissed}
			end;
		_ ->
			{false, ?ErrorCode_TeamHasTeam}
	end.

doJoinTeam(
	#recTeamInfo{teamID = TeamID, memberList = ML} = TeamInfo,
	#recTeamMemberInfo{roleID = RoleID, netPid = NetPid} = MemberInfo
) ->
	myEts:deleteRecord(?Ets_RoleMatchTeam, RoleID),
	true = myEts:insertEts(?Ets_RoleIDRefTeamID,
		#recRoleRefTeamID{roleID = RoleID, teamID = TeamID}),

	NewTeamInfo = TeamInfo#recTeamInfo{memberList = [MemberInfo | ML]},
	true = myEts:insertEts(?Ets_TeamList, NewTeamInfo),

	playerMsg:sendNetMsg(
		NetPid,
		teamInterface:makeTeamInfoMsg(NewTeamInfo)
	),

	ECMsg = playerMsg:getErrorCodeMsg(
		?ErrorCode_TeamSomeOneJoin
		, [MemberInfo#recTeamMemberInfo.name]
	),
	teamInterface:sendNetMsg2TeamWithRoleID(
		RoleID,
		ECMsg,
		false
	),

	NetMemberInfo = teamInterface:makeNetMemberInfo(MemberInfo),
	teamInterface:sendNetMsg2TeamWithRoleID(
		RoleID,
		#pk_GS2U_NewMemberJoin{info = NetMemberInfo},
		false
	),
	?DEBUG_OUT("[~p] join team[~p]", [RoleID, TeamID]),
	ok.

%%%-------------------------------------------------------------------
leaveTeamAndEnter({RoleID, Pid, NetPid, CopyMapID}) ->
	case canLeaveTeam(RoleID) of
		{true, TeamInfo} ->
			doLeaveTeamAndEnter(RoleID,Pid, NetPid, CopyMapID, TeamInfo);
		{_, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(NetPid, ErrorCode);
		_ ->
			skip
	end,
	ok.

doLeaveTeamAndEnter(RoleID, Pid, NetPid, CopyMapID, TeamInfo)->
	doLeaveTeam(RoleID, NetPid, TeamInfo),
	psMgr:sendMsg2PS(Pid,leaveTeamAndEnterAck, CopyMapID),
	ok.
%%%-------------------------------------------------------------------
leaveTeam({RoleID, NetPid, IsNotify}) ->
	case canLeaveTeam(RoleID) of
		{true, TeamInfo} ->
			doLeaveTeam(RoleID, NetPid, TeamInfo);
		{_, ErrorCode} when IsNotify ->
			playerMsg:sendErrorCodeMsg(NetPid, ErrorCode);
		_ ->
			skip
	end,
	ok.

canLeaveTeam(RoleID) ->
	case teamInterface:getTeamID(RoleID) of
		TeamID when TeamID > 0 ->
			{true, myEts:readRecord(?Ets_TeamList, TeamID)};
		_ ->
			{false, ?ErrorCode_TeamSelftNotInTeam}
	end.

doLeaveTeam(RoleID, NetPid,
	#recTeamInfo{teamID = TeamID, leaderID = LeaderID} = TeamInfo
) ->
%%	NewTeamInfo =
	playerMsg:sendNetMsg(NetPid, #pk_GS2U_TeamReset{}),
	onMemberLeaveTeam(RoleID, LeaderID, TeamInfo),
	myEts:deleteRecord(?Ets_RoleIDRefTeamID, RoleID),
	?DEBUG_OUT("[~p] leave team[~p],leadre[~p -> ~p]",
		[RoleID, TeamID, LeaderID, teamInterface:getLeaderIDWithTeamID(TeamID)]),
	ok.

%% 队长离队
onMemberLeaveTeam(LeaderID, LeaderID,
	#recTeamInfo{teamID = TeamID, memberList = ML} = TeamInfo
) ->
	NML = lists:keydelete(LeaderID, #recTeamMemberInfo.roleID, ML),
	NewLeaderID =
		case NML of
			[] ->
				0;
			[#recTeamMemberInfo{roleID = RoleID} | _] ->
				RoleID
		end,

	case NewLeaderID =:= 0 of
		true ->
			myEts:deleteRecord(?Ets_TeamList, TeamID);
		_ ->
			NewTeamInfo = TeamInfo#recTeamInfo{
				leaderID = NewLeaderID,
				memberList = lists:keydelete(LeaderID, #recTeamMemberInfo.roleID, ML)
			},
			myEts:insertEts(?Ets_TeamList, NewTeamInfo),
			teamInterface:sendNetMsg2TeamWithRoleID(
				LeaderID,
				#pk_GS2U_TeammateLeave{teammateID = LeaderID},
				false
			),

			teamInterface:sendNetMsg2TeamWithRoleID(
				LeaderID,
				#pk_GS2U_UpdateTeamInfo{
					base = teamInterface:makeNetTeamBaseInfo(NewTeamInfo)
				},
				false
			)
	end,
	onMemberCountDec(LeaderID, TeamID, NML),
	ok;
%% 普通成员离队
onMemberLeaveTeam(RoleID, _LeaderID,
	#recTeamInfo{teamID = TeamID, memberList = ML} = TeamInfo
) ->
	NML = lists:keydelete(RoleID, #recTeamMemberInfo.roleID, ML),
	case NML of
		[] ->
			myEts:deleteRecord(?Ets_TeamList, TeamID);
		_ ->
			NewTeamInfo = TeamInfo#recTeamInfo{
				memberList = lists:keydelete(RoleID, #recTeamMemberInfo.roleID, ML)
			},
			myEts:insertEts(?Ets_TeamList, NewTeamInfo),
			teamInterface:sendNetMsg2TeamWithRoleID(
				RoleID,
				#pk_GS2U_TeammateLeave{teammateID = RoleID},
				false)
	end,
	onMemberCountDec(RoleID, TeamID, NML),
	ok.
%%%-------------------------------------------------------------------
changeLeader({LeaderID, NetPid, NewLeaderID, MapPid, IsNotInCopy}) ->
	case canChangeLeader(LeaderID, NewLeaderID) of
		{true, TeamInfo} ->
			doChangeLeader(LeaderID, NewLeaderID, TeamInfo, MapPid, IsNotInCopy);
		{_, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(NetPid, ErrorCode)
	end,
	ok.

%%%-------------------------------------------------------------------
leaderOffline({LeaderID, MapPid, IsNotInCopy}) ->
	case teamInterface:getTeamInfoWithRoleID(LeaderID) of
		#recTeamInfo{leaderID = LeaderID} = TeamInfo ->
			doLeaderOffline(MapPid, IsNotInCopy, TeamInfo);
		_ ->
			skip
	end,
	ok.

doLeaderOffline(
	MapPid, IsNotInCopy,
	#recTeamInfo{leaderID = LeaderID, teamID = TeamID, memberList = ML} = TeamInfo
) ->
	OL = lists:foldl(
		fun(#recTeamMemberInfo{roleID = RoleID}, Acc) ->
			case core:queryOnLineRoleByRoleID(RoleID) of
				#rec_OnlinePlayer{} when RoleID =/= LeaderID ->
					[RoleID | Acc];
				_ ->
					Acc
			end
		end, [], ML),
	case OL of
		[] ->
			?LOG_OUT("[~p]offline, team[~p] all offline",
				[LeaderID, TeamID]);
		[NewLeaderID | _] ->
			doChangeLeader(
				LeaderID
				, NewLeaderID
				, TeamInfo
				, MapPid
				, IsNotInCopy
			);
		_ ->
			skip
	end,
	ok.

canChangeLeader(LeaderID, NewLeaderID) when LeaderID =< 0 orelse NewLeaderID =< 0 ->
	{false, ?ErrorCode_TeamChangeLeaderTargetNotInTeam};
canChangeLeader(LeaderID, LeaderID) ->
	{false, ?ErrorCode_TeamCantBeSelf};
canChangeLeader(LeaderID, NewLeaderID) ->
	case teamInterface:isTeamLeader(LeaderID) of
		true ->
			TeamInfo = teamInterface:getTeamInfoWithRoleID(LeaderID),
			LeaderTeamID = TeamInfo#recTeamInfo.teamID,
			NewLeaderTeamID = teamInterface:getTeamID(NewLeaderID),
			case lists:keyfind(NewLeaderID, #recTeamMemberInfo.roleID, TeamInfo#recTeamInfo.memberList) of
				#recTeamMemberInfo{} when LeaderTeamID =:= NewLeaderTeamID ->
					{true, TeamInfo};
				_ ->
					{false, ?ErrorCode_TeamChangeLeaderTargetNotInTeam}
			end;
		_ ->
			{false, ?ErrorCode_TeamOnlyLeaderCanOp}
	end.

doChangeLeader(
	LeaderID
	, NewLeaderID
	, #recTeamInfo{teamID = TeamID} = TeamInfo
	, MapPid
	, IsNotInCopy
) ->
	NewTeamInfo = TeamInfo#recTeamInfo{leaderID = NewLeaderID},
	myEts:insertEts(?Ets_TeamList, NewTeamInfo),
	teamInterface:sendNetMsg2TeamWithRoleID(
		NewLeaderID,
		#pk_GS2U_UpdateTeamInfo{
			base = teamInterface:makeNetTeamBaseInfo(NewTeamInfo)
		},
		true),
	case IsNotInCopy of
		false ->
			core:sendMsgToMapMgr(MapPid, changeTeamLeader, {LeaderID, NewLeaderID});
		_ ->
			skip
	end,
	?DEBUG_OUT("changeLeader,team[~p], leader[~p -> ~p]", [TeamID, LeaderID, NewLeaderID]),
	ok.
%%%-------------------------------------------------------------------
changeTargetMap({LeaderID, NetPid, NewMapID}) ->
	case canChangeTargetMap(LeaderID, NewMapID) of
		{true, TeamInfo} ->
			doChangeTargetMap(LeaderID, NewMapID, TeamInfo);
		{_, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(NetPid, ErrorCode)
	end,
	ok.

canChangeTargetMap(RoleID, _MapID) ->
	case teamInterface:isTeamLeader(RoleID) of
		true ->
			TeamInfo = teamInterface:getTeamInfoWithRoleID(RoleID),
			case TeamInfo of
				#recTeamInfo{} ->
					case teamInterface:isTeamStartCopyMapAcking(TeamInfo) of
						 false ->
							 {true, TeamInfo};
						_ ->
							{false, ?ErrorCode_TeamAreadyStartCopy}
					end;
				_ ->
					{false, ?ErrorCode_TeamDissmissed}
			end;
		_ ->
			{false, ?ErrorCode_TeamOnlyLeaderCanOp}
	end.

%% 这个需要检查是否在已经在副本里
%% 更需要更新队友的相关副本信息
doChangeTargetMap(RoleID, NewMapID, #recTeamInfo{teamID = TeamID} = TeamInfo) ->
	NewTeamInfo = TeamInfo#recTeamInfo{copyMapID = NewMapID},
	myEts:insertEts(?Ets_TeamList, NewTeamInfo),
	teamInterface:sendNetMsg2TeamWithRoleID(
		RoleID,
		#pk_GS2U_UpdateTeamInfo{
			base = teamInterface:makeNetTeamBaseInfo(NewTeamInfo)
		},
		true
	),
	teamInterface:sendMsg2TeamWithRoleID(
		RoleID,
		forceSychInfoToTeam,
		NewMapID,
		true
	),
	?DEBUG_OUT("[~p]cheangeTargetMap,team[~p],map[~p -> ~p]",
		[RoleID, TeamID, TeamInfo#recTeamInfo.copyMapID, NewMapID]),
	ok.
%%%-------------------------------------------------------------------
leaderStartCopyMap({LeaderID, NetPid}) ->
	case canLeaderStartCopyMap(LeaderID) of
		{true, TeamInfo} ->
			doLeaderStartCopyMap(LeaderID, TeamInfo);
		{_, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(NetPid, ErrorCode)
	end,
	ok.

canLeaderStartCopyMap(LeaderID) ->
	case teamInterface:isTeamLeader(LeaderID) of
		true ->
			TeamInfo = teamInterface:getTeamInfoWithRoleID(LeaderID),
			case TeamInfo of
				#recTeamInfo{memberList = ML} ->
					case teamInterface:isTeamStartCopyMapAcking(TeamInfo) of
						false ->
							MOL = [RoleID ||
								#recTeamMemberInfo{roleID = RoleID, code = Code} <- ML
								, Code =:= 0],
							case MOL of
								[] ->
									{true, TeamInfo};
								_ ->
									{false, ?ErrorCode_TeamSomeoneOffline}
							end;
						_ ->
							{false, ?ErrorCode_TeamAreadyStartCopy}
					end;
				_ ->
					{false, ?ErrorCode_TeamDissmissed}
			end;
		_ ->
			{false, ?ErrorCode_TeamOnlyLeaderCanOp}
	end.

doLeaderStartCopyMap(LeaderID,
	#recTeamInfo{memberList = ML, copyMapID = CopyMapID, teamID = TeamID} = TeamInfo
) ->
	NewTeamInfo = TeamInfo#recTeamInfo{
		ackStartCopyRoleList = [LeaderID],
		leaderStartCopyTime = time2:getTimestampSec()
	},
	myEts:insertEts(?Ets_TeamList, NewTeamInfo),
	case length(ML) of
		1 ->
			onMemberStartCopyAck(NewTeamInfo);
		_ ->
			teamInterface:sendMsg2TeamWithRoleID(
				LeaderID,
				leaderStartCopyMapNow,
				{LeaderID, CopyMapID},
				true
			)
	end,

	?DEBUG_OUT("[~p]LeaderStartCopyMap,team[~p],map[~p]",
		[LeaderID, TeamID, CopyMapID]),
	ok.

%%%-------------------------------------------------------------------
memberStartCopyMapAck({RoleID, _NetPid, Ack, Active}) ->
	case canMemberStartCopyMapAck(RoleID, Ack) of
		{true, TeamInfo} ->
			doMemberStartCopyMapAck(RoleID, Ack, Active, TeamInfo);
		{false, ErrorCode} when Active andalso Ack =:= 1 ->
			Msg = playerMsg:getErrorCodeMsg(ErrorCode, []),
			teamInterface:sendNetMsg2TeamWithRoleID(
				RoleID,
				Msg,
				true
			),
			ok;
		_ ->
			skip
	end,
	ok.
canMemberStartCopyMapAck(RoleID, 0) ->
	case teamInterface:getTeamInfoWithRoleID(RoleID) of
		#recTeamInfo{} = TeamInfo ->
			{true, TeamInfo};
		_ ->
			{false, ?ErrorCode_TeamDissmissed}
	end;
canMemberStartCopyMapAck(RoleID, _) ->
	case teamInterface:isInTeam(RoleID) of
		true ->
			TeamInfo = teamInterface:getTeamInfoWithRoleID(RoleID),
			case TeamInfo of
				%%至少有个队长
				#recTeamInfo{ackStartCopyRoleList = ACL} ->
					case teamInterface:isTeamStartCopyMapAcking(TeamInfo) of
						true ->
							case lists:member(RoleID, ACL) of
								true ->
									{false, ?ErrorCode_TeamAckStartCopyMapOk};
								_ ->
									{true, TeamInfo}
							end;
						_ ->
							{false, ?ErrorCode_TeamStartCopyMapCancel}
					end;
				_ ->
					{false, ?ErrorCode_TeamDissmissed}
			end;
		_ ->
			{false, ?ErrorCode_TeamDissmissed}
	end.

doMemberStartCopyMapAck(_RoleID, _Ack, _Active, #recTeamInfo{
	ackStartCopyRoleList = []
}) ->
	ok;
doMemberStartCopyMapAck(RoleID, Ack, _Active,
	#recTeamInfo{teamID = TeamID, ackStartCopyRoleList = ACL} = TeamInfo
) ->
	NewTeamInfo =
		case Ack of
			0 ->
				TeamInfo#recTeamInfo{
					leaderStartCopyTime = 0,
					ackStartCopyRoleList = []
				};
			_ ->
				TeamInfo#recTeamInfo{
					ackStartCopyRoleList = [RoleID | ACL]
				}
		end,
	myEts:insertEts(?Ets_TeamList, NewTeamInfo),

	Msg = #pk_GS2U_TeammateStartCopymapAck{playerID = RoleID, isAgree = Ack},
	teamInterface:sendNetMsg2TeamWithRoleID(RoleID, Msg, true),
	onMemberStartCopyAck(NewTeamInfo),
	?DEBUG_OUT("[~p]MemberStartCopyMapAck,team[~p],ack[~p]",
		[RoleID, TeamID, Ack]),
	ok.

onMemberStartCopyAck(#recTeamInfo{copyMapID = 0}) ->
	ok;
onMemberStartCopyAck(#recTeamInfo{ackStartCopyRoleList = []}) ->
	ok;
onMemberStartCopyAck(
	#recTeamInfo{
		leaderID = LeaderID
		, ackStartCopyRoleList = AL
		, memberList = ML
		, copyMapID = CopyMapID } = TeamInfo
) ->
	case length(ML) =:= length(AL) of
		true ->
			%%TODO 开始副本
			myEts:insertEts(
				?Ets_TeamList
				, TeamInfo#recTeamInfo{ackStartCopyRoleList = []}
			),
			sendMsgToOnlineRole(
				LeaderID
				, requestEnterCopyMap
				, CopyMapID
			);
		_ ->
			skip
	end,
	ok.
%%%-------------------------------------------------------------------
kickMember({LeaderID, NetPid, TargetID}) ->
	case canKickMember(LeaderID, TargetID) of
		{true, TeamInfo} ->
			doKickMember(TargetID, TeamInfo);
		{_, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(NetPid, ErrorCode)
	end,
	ok.

canKickMember(LeaderID, LeaderID) ->
	{false, ?ErrorCode_TeamCantBeSelf};
canKickMember(LeaderID, TargetID) ->
	case teamInterface:isTeamLeader(LeaderID) of
		true ->
			case teamInterface:isInSameTeam(LeaderID, TargetID) of
				true ->
					TeamInfo = teamInterface:getTeamInfoWithRoleID(LeaderID),
					case TeamInfo of
						#recTeamInfo{} ->
							case teamInterface:isTeamStartCopyMapAcking(TeamInfo) of
								false->
									{true, TeamInfo};
								_->
									{false, ?ErrorCode_TeamAreadyStartCopy}
							end;
						_ ->
							{false, ?ErrorCode_TeamDissmissed}
					end;
				_ ->
					{false, ?ErrorCode_TeamTargetNotInTeam}
			end;
		_ ->
			{false, ?ErrorCode_TeamOnlyLeaderCanOp}
	end.

doKickMember(RoleID,
	#recTeamInfo{leaderID = LeaderID, teamID = TeamID, memberList = ML} = TeamInfo
) ->
	case core:queryNetPidByRoleID(RoleID) of
		NetPid when erlang:is_pid(NetPid) ->
			playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_TeamLeaderKickU),
			playerMsg:sendNetMsg(NetPid, #pk_GS2U_TeamReset{});
		_ ->
			skip
	end,

	NewTeamInfo = TeamInfo#recTeamInfo{
		memberList = lists:keydelete(RoleID, #recTeamMemberInfo.roleID, ML)
	},
	myEts:insertEts(?Ets_TeamList, NewTeamInfo),
	teamInterface:sendNetMsg2TeamWithRoleID(
		RoleID,
		#pk_GS2U_TeammateLeave{teammateID = RoleID},
		false
	),
	onMemberCountDec(RoleID, TeamID, NewTeamInfo#recTeamInfo.memberList),
	myEts:deleteRecord(?Ets_RoleIDRefTeamID, RoleID),
	?DEBUG_OUT("[~p]KickMember,team[~p],target[~p]", [LeaderID, TeamID, RoleID]),
	ok.

%%%-------------------------------------------------------------------
updateMemberInfo(#recSyncMemberInfo{
	roleID = RoleID} = SyncInfo
) ->
	case teamInterface:getTeamInfoWithRoleID(RoleID) of
		#recTeamInfo{} = TeamInfo ->
			doUpdateMemberInfo(RoleID, TeamInfo, SyncInfo);
		_ ->
			skip
	end,
	ok.

doUpdateMemberInfo(
	RoleID,
	#recTeamInfo{teamID = TeamID, memberList = ML} = TeamInfo,
	#recSyncMemberInfo{
		roleID = RoleID,
		code = Code,
		pid = Pid,
		netPid = NetPid,
		level = Level,
		guildID = GuildID,
		guildName = GuildName,
		mapID = MapID,
		groupID = GroupID,
		mapPID = MapPid,
		posX = X,                %%X坐标
		posY = Y,                %%Y坐标
		force = Force,
		hpPc = HPC,
		actionPoint = AV,
		targetMapCount = TC}
) ->
	case lists:keyfind(RoleID, #recTeamMemberInfo.roleID, ML) of
		#recTeamMemberInfo{} = OldMember ->
			NewMember = OldMember#recTeamMemberInfo{
				code = Code,
				level = Level,
				guildID = GuildID,
				guildName = GuildName,
				pid = Pid,
				netPid = NetPid,
				mapID = MapID,
				groupID = GroupID,
				mapPid = MapPid,
				posX = X,
				posY = Y,
				fightingCapacity = Force,
				hpPc = HPC,
				actionPoint = AV,
				targetMapCount = TC
			},
			NML = lists:keystore(RoleID, #recTeamMemberInfo.roleID, ML, NewMember),
			NewTeamInfo = TeamInfo#recTeamInfo{memberList = NML},
			myEts:insertEts(?Ets_TeamList, NewTeamInfo),

			onUpdateMemberInfo(Code, RoleID, TeamID, NML),
			ok;
		_ ->
			skip
	end.
onUpdateMemberInfo(0, RoleID, TeamID, ML)->
	OL = filterOLRole(ML),
	case OL of
		[] ->
			?LOG_OUT("[~p]offline, all member offline will dismiss team[~p]",
				[RoleID, TeamID]),
			doDismissTeam(RoleID, TeamID);
		_ ->
			?DEBUG_OUT("team[~p],member[~p],offline",[TeamID, RoleID]),
			skip
	end;
onUpdateMemberInfo(_Code, _RoleID, _TeamID, _ML)->
	ok.

%%%-------------------------------------------------------------------
setSearchFlag({RoleID, NetPid, Flag}) ->
	case canSetSearchFlag(RoleID) of
		{true, TeamInfo} ->
			doSetSearchFlag(Flag, NetPid, TeamInfo);
		_ ->
			skip
	end,
	ok.
canSetSearchFlag(RoleID) ->
	case teamInterface:getTeamInfoWithRoleID(RoleID) of
		#recTeamInfo{leaderID = RoleID} = Info ->
			{true, Info};
		#recTeamInfo{} ->
			{false, ?ErrorCode_TeamOnlyLeaderCanOp};
		_ ->
			{false, ?ErrorCode_TeamDissmissed}
	end.

doSetSearchFlag(Flag, _NetPid,
	#recTeamInfo{leaderID = LeaderID, teamID = TeamID} = TeamInfo
) ->
	NewTeamInfo = TeamInfo#recTeamInfo{
		canBeSearch = Flag,
		searchStartTime = time:getSyncTimeFromDBS()
	},
	myEts:insertEts(?Ets_TeamList, NewTeamInfo),
	teamInterface:sendNetMsg2TeamWithRoleID(
		LeaderID
		, #pk_GS2U_UpdateTeamInfo{base = teamInterface:makeNetTeamBaseInfo(NewTeamInfo)}
		, true
	),
	?DEBUG_OUT("[~p]SetSearchFlag,team[~p],flag[~p]", [LeaderID, TeamID, Flag]),
	ok.
%%%-------------------------------------------------------------------
onMemberCountDec(RoleID, TeamID, ML)->
	OL = filterOLRole(ML),
	case OL of
		[] ->
			doDismissTeam(RoleID, TeamID);
		_ ->
			skip
	end,
	ok.


filterOLRole([]) ->
	[];
filterOLRole([#recTeamMemberInfo{} | _] = ML)->
	[ID || #recTeamMemberInfo{roleID = ID, code = MCode} <- ML
		, MCode =/= 0];
filterOLRole(_) ->
	[].

%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
sendMsgToOnlineRole(RoleID, MsgID, Msg) ->
	case core:queryPlayerPidByRoleID(RoleID) of
		Pid when is_pid(Pid) ->
			psMgr:sendMsg2PS(Pid, MsgID, Msg);
		_ ->
			offline
	end.