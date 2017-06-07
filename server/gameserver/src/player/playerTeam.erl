%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 08. 五月 2017 9:32
%%%-------------------------------------------------------------------
-module(playerTeam).
-author("Administrator").

-include("playerPrivate.hrl").
%% 同步tick，只有这里用
-define(TeamSyncTick, 5).
%% API

-export([
	onPlayerChangeScene/1
]).

-export([
	sendInitTeamInfo/0,
	offline/0,
	syncInfo2Team/1,
	otherInviteU/1,
	leaveTeamAndEnterAck/1,
	fastMatchTeam/1,
	onReceivedLeaderStartCopyMap/1
]).

-export([
	teamOperate/3,
	leaveTeam/1,
	inviteOther/1,
	ackInviteMeJoin/2,
	fastJoinTeam/1,
	kickMember/1,
	changeLeader/1,
	leaderStartCopyMap/0,
	memberStartCopyMapAck/1,
	leaderChangeCopyMap/1
]).

-export([
	matchTeam/1,
	queryTeamList/1,
	queryRole/1,
	queryMatch/0
]).

onPlayerChangeScene(NewMapID) ->
	try
		case playerScene:getMapType(NewMapID) of
			?MapTypeNormal ->
				skip;
			?MapTypeBitplane ->
				skip;
			_ ->
				cancelMatch(true)
		end
	catch
		_ : _ -> skip
	end,
	ok.

%%%-------------------------------------------------------------------
sendInitTeamInfo() ->
	RoleID = playerState:getRoleID(),
	case teamInterface:getTeamInfoWithRoleID(RoleID) of
		#recTeamInfo{} = TeamInfo ->
			TeamMsg = teamInterface:makeTeamInfoMsg(TeamInfo),
			playerMsg:sendNetMsg(TeamMsg);
		_ ->
			playerMsg:sendNetMsg(#pk_GS2U_TeamReset{})
	end,
	syncInfo2Team(true),
	ok.

%%%-------------------------------------------------------------------
cancelMatch(IsNotify) ->
	RoleID = playerState:getRoleID(),
	psMgr:sendMsg2PS(
		?PsNameTeam,
		cancelMatchTeam,
		{RoleID, playerState:getNetPid(), IsNotify}
	),
	ok.

%%%-------------------------------------------------------------------
teamQuickInfo(Channel) ->
	RoleID = playerState:getRoleID(),
	case teamInterface:getTeamInfoWithRoleID(RoleID) of
		#recTeamInfo{teamID = TeamID, leaderID = RoleID, copyMapID = CopyMapID} ->
			doSendTeamQuickInfo(TeamID, CopyMapID, Channel);
		_ ->
			skip
	end,
	ok.

doSendTeamQuickInfo(TeamID, CopyMapID, Channel) ->
%%	StrRoleID = erlang:integer_to_list(playerState:getRoleID()),
	StrPlayerCode = erlang:integer_to_list(playerState:getPlayerCode()),
	PlayerName = playerState:getName(),
	%% <t=X> X的值参考客户端枚举TNodeType
	QuickTeamMsg =
%%		case getCfg:getCfgPStack(cfg_mapsetting, CopyMapID) of
%%			#mapsettingCfg{subtype = ?MapSubTypeSpiritArea} ->
%%				%% 不使用mapsetting.playerEnter_MinLevel
%%				%% 自定义许可区间
%%				{Min, Max} = getLevelLimit_SpiritArea(),
%%				"<t=10>"
%%				++ erlang:integer_to_list(CopyMapID)
%%					++ "_"
%%					++ erlang:integer_to_list(Min)
%%					++ "="
%%					++ erlang:integer_to_list(Max)
%%					++ ","
%%					++ StrRoleID ++ ","
%%					++ StrPlayerCode ++ "_" ++ PlayerName ++
%%					"</t>";
%%			_ ->
		"<t=8>"
					++ erlang:integer_to_list(CopyMapID) ++ ","
					++ erlang:integer_to_list(TeamID) ++ ","
					++ StrPlayerCode ++ "_" ++ PlayerName ++
		"</t>",
%%		end,
	playerChat:onChannelSystemChatMsg(Channel, QuickTeamMsg),
	playerMsg:sendErrorCodeMsg(?ErrorCode_TeamQuickInfoSendOk).

%%-spec getLevelLimit_SpiritArea() -> {LevelMin :: uint(), LevelMax :: uint()}.
%%getLevelLimit_SpiritArea() ->
%%	RoleLevel = playerState:getLevel(),
%%	ListKey1 = getCfg:get1KeyList(cfg_spiritArea),
%%	FunFind =
%%		fun(Key1, {_, {Min, _Max}}) ->
%%			case RoleLevel >= Key1 of
%%				true ->
%%					{false, {Key1, Key1}};
%%				_ ->
%%					{true, {Min, Key1}}
%%			end
%%		end,
%%	{_, R} = misc:foldlEx(FunFind, {false, {0, 99999}}, ListKey1),
%%	R.

%%%-------------------------------------------------------------------
fastMatchTeam(MapList) ->
	RoleID = playerState:getRoleID(),
	MapID = playerState:getMapID(),
	case canMatchTeam(RoleID, MapID, MapList) of
		{true, _} ->
			doMatchTeam(MapList, false);
		{_, ErrorCode} ->
			%%系统自动取消
			cancelMatch(true),
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok.
%%%-------------------------------------------------------------------
matchTeam(MapList) ->
	RoleID = playerState:getRoleID(),
	MapID = playerState:getMapID(),
	case canMatchTeam(RoleID, MapID, MapList) of
		{true, NewMapList} ->
			doMatchTeam(NewMapList, true);
		{_, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok.

canMatchTeam(RoleID, CurMapID, MapList) ->
	case teamInterface:isInTeam(RoleID) of
		false ->
			case canGoToMap(CurMapID) of
				true ->
					ML = [CopyMapID || CopyMapID <- MapList
						, playerCopyMap:canEnterCopyMap(CopyMapID, false) =:= true],
					case ML of
						[] ->
							{false, ?ErrorCode_TeamAllSelectedCopyMapCantIn};
						_ ->
							{true, ML}
					end;
				_ ->
					{false, ?ErrorCode_TeamCantMatchInCopyMap}
			end;
		_ ->
			{false, ?ErrorCode_TeamHasTeam}
	end.

%%checkCanEnterCopyMap(_, []) ->
%%	{true, 0};
%%checkCanEnterCopyMap(true, [CopyMapID | L]) ->
%%	Ret = playerCopyMap:canEnterCopyMap(CopyMapID),
%%	checkCanEnterCopyMap(Ret, L);
%%checkCanEnterCopyMap(false, _L) ->
%%	{false, -1};
%%checkCanEnterCopyMap(ErrorCode, _L) ->
%%	{false, ErrorCode}.

%% 要优化这个逻辑
doMatchTeam(MapList, Active) ->
	RoleID = playerState:getRoleID(),
	MCL = [ {CopyMapID,copyMapEnterCount(CopyMapID)} ||
		CopyMapID <- MapList],
	psMgr:sendMsg2PS(
		?PsNameTeam,
		matchTeam,
		{RoleID, playerState:getNetPid(), makeTeamMemberInfo(0), MapList, MCL, Active}
	),
	ok.

%%%-------------------------------------------------------------------
queryTeamList([]) ->
	ok;
queryTeamList(MapList) ->
	TL = teamInterface:queryTeamList(MapList),
	TSL = [makeTeamSnapshot(R) || R <- TL],
	playerMsg:sendNetMsg(#pk_GS2U_QueryTeamListAck{teamSnapshot = TSL}),
	ok.

makeTeamSnapshot(
	#recTeamInfo{memberList = ML} = TeamInfo
) ->
	TB = teamInterface:makeNetTeamBaseInfo(TeamInfo),
	TSL = lists:map(
		fun(R) ->
			teamInterface:makeNetMemberSnapshotInfo(R)
		end, ML),
	#pk_TeamSnapshot{base = TB, members = TSL}.
%%%-------------------------------------------------------------------
teamOperate(?TeamOP_Create, CopyMapID, _) ->
	createTeam(CopyMapID, 0);
teamOperate(?TeamOP_Invite, TargetRoleID, _) ->
	inviteOther(TargetRoleID);
teamOperate(?TeamOP_FastJoin, TeamID, _) ->
	fastJoinTeam(TeamID);
teamOperate(?TeamOP_Kick, TargetRoleID, _) ->
	kickMember(TargetRoleID);
teamOperate(?TeamOP_ChangeLeader, TargetRoleID, _) ->
	changeLeader(TargetRoleID);
teamOperate(?TeamOP_ChangeCopyMap, NewCopyMapID, _) ->
	leaderChangeCopyMap(NewCopyMapID);
teamOperate(?TeamOP_StartCopyMap, _, _) ->
	leaderStartCopyMap();
teamOperate(?TeamOP_LeaveTeam, _, _) ->
	leaveTeam(true);
teamOperate(?TeamOP_SetSearchFlag, Flag, _) ->
	setSearchFlag(Flag);
teamOperate(?TeamOP_Dismiss, _, _) ->
	dismissTeam();
teamOperate(?TeamOP_QueryMatchState, _, _) ->
	queryMatch();
teamOperate(?TeamOP_MemberAckStartCopyMap, Ack, _) ->
	memberStartCopyMapAck(Ack);
teamOperate(?TeamOP_CancelMatchTeam, _, _) ->
	cancelMatch(true);
teamOperate(?TeamOP_SendTeamQuickInfo, Channel, _) ->
	teamQuickInfo(Channel);
teamOperate(?TeamOP_FastCreate, TargetRoleID, CopyMapID) ->
	createTeam(CopyMapID, TargetRoleID);
teamOperate(?TeamOP_LeaveTeamAndEnterCopy, CopyMapID, _) ->
	leaveTeamAndEnterCopyMap(CopyMapID);
teamOperate(_, _, _) ->
	ok.
%%%-------------------------------------------------------------------
createTeam(CopyMapID, TargetRoleID) ->
	case canCreateTeam(CopyMapID) of
		{true, _} ->
			psMgr:sendMsg2PS(
				?PsNameTeam,
				createTeam,
				{CopyMapID, TargetRoleID, makeTeamMemberInfo(CopyMapID)}
			);
		{_, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok.

canCreateTeam(_CopyMapID) ->
	RoleID = playerState:getRoleID(),
	case teamInterface:isInTeam(RoleID) of
		false ->
%%			case playerCopyMap:canEnterCopyMap(CopyMapID, false) of
%%				true ->
			{true, 0};
%%				ErrorCode ->
%%					{false, ErrorCode}
%%			end;
		_ ->
			{false, ?ErrorCode_TeamHasTeam}
	end.
%%%-------------------------------------------------------------------
dismissTeam() ->
	case canDismissTeam() of
		{true, _} ->
			psMgr:sendMsg2PS(
				?PsNameTeam,
				dimissTeam,
				{playerState:getRoleID(), playerState:getNetPid()}
			);
		{_, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok.
canDismissTeam() ->
	RoleID = playerState:getRoleID(),
	MapID = playerState:getMapID(),
	case teamInterface:isTeamLeader(RoleID) of
		true ->
			case checkNotInCopyMap(MapID) of
				true ->
					case teamInterface:getTeamInfoWithRoleID(RoleID) of
						#recTeamInfo{} ->
							{true, 0};
						_ ->
							{false, ?ErrorCode_TeamDissmissed}
					end;
				_ ->
					{false, ?ErrorCode_TeamCantOpInCopyMap}
			end;
		_ ->
			{false, ?ErrorCode_TeamOnlyLeaderCanOp}
	end.
%%%-------------------------------------------------------------------
inviteOther(TargetRoleID) ->
	RoleID = playerState:getRoleID(),
	case canInviteOther(TargetRoleID) of
		{true, _} ->
			#recTeamInfo{copyMapID = CopyMapID} = teamInterface:getTeamInfoWithRoleID(RoleID),
			playerMsg:sendErrorCodeMsg(?ErrorCode_TeamInviteSomeOnOk, [queryName(TargetRoleID)]),
			sendMsgToOnlineRole(
				TargetRoleID,
				otherInviteJoinTeam,
				{CopyMapID, playerState:getNetPid(), RoleID, playerState:getName(), playerState:getGuildID(), playerState:getGuildName()}
			);
		{_, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok.

queryName(RoleID)->
	case core:queryBaseRoleByRoleID(RoleID) of
		#rec_base_role{roleName = Name}->
			Name;
		_ ->
			""
	end.

canInviteOther(TargetRoleID) ->
	RoleID = playerState:getRoleID(),
	case teamInterface:isInTeam(RoleID) of
		true ->
			case teamInterface:isInTeam(TargetRoleID) of
				true ->
					{false, ?ErrorCode_TeamTargetHasTeam};
				_ ->
					case core:queryOnLineRoleByRoleID(TargetRoleID) of
						#rec_OnlinePlayer{}->
							checkTeamInfo(RoleID);
						_ ->
							{false, ?ErrorCode_TeamInvitorOffline}
					end
			end;
		_ ->
			{false, ?ErrorCode_TeamSelftNotInTeam}
	end.
checkTeamInfo(RoleID) ->
	case teamInterface:getTeamInfoWithRoleID(RoleID) of
		#recTeamInfo{memberList = ML} = TeamInfo ->
			case length(ML) >= ?MAX_TeamMemberNum of
				true ->
					{false, ?ErrorCode_TeamMemberMax};
				_ ->
					case teamInterface:isTeamStartCopyMapAcking(TeamInfo) of
						false ->
							{true, TeamInfo};
						_ ->
							{false, ?ErrorCode_TeamAreadyStartCopy}
					end
			end;
		_ ->
			{false, ?ErrorCode_TeamOnlyLeaderCanOp}
	end.
%%%-------------------------------------------------------------------
otherInviteU({CopyMapID, _NetPid, InviteRoleID, InviteName, GuildID, GuildName}) ->
	RoleID = playerState:getRoleID(),
%%	case playerCopyMap:canEnterCopyMap(CopyMapID, false) of
%%		true ->
	case teamInterface:isInTeam(RoleID) of
		true ->
			skip;
		_ ->
			Msg = #pk_GS2U_InviteUJoinTeam{
				copyMapID = CopyMapID,
				inviterPlayerID = InviteRoleID,
				inviterPlayerName = InviteName,
				guildID = GuildID,
				guildName = GuildName,
				friendState = friendState(InviteRoleID, 9999)
			},
			playerMsg:sendNetMsg(Msg)
	end,
%%		_ ->
%%			skip
%%	end,
	ok.
%%%-------------------------------------------------------------------
leaveTeamAndEnterAck(CopyMapID) ->
	enterCopyMap(CopyMapID).

%%%-------------------------------------------------------------------
ackInviteMeJoin(_LeaderID, 0) ->
%%	sendNetMsgToOnlineRole(
%%		LeaderID,
%%		playerMsg:getErrorCodeMsg(?ErrorCode_TeamDisagreeInvitation)
%%	);
	ok;
ackInviteMeJoin(LeaderID, _Ack) ->
	RoleID = playerState:getRoleID(),
	case canJoinTeam(false, RoleID, LeaderID) of
		{true, TeamInfo} ->
			psMgr:sendMsg2PS(
				?PsNameTeam,
				joinTeam,
				{TeamInfo#recTeamInfo.teamID, makeTeamMemberInfo(TeamInfo#recTeamInfo.copyMapID)}
			);
		{_, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok.


canJoinTeam(true, LeaderID, LeaderID) ->
	{false, ?ErrorCode_TeamHasTeam};
canJoinTeam(_, LeaderID, LeaderID) ->
	{false, ?ErrorCode_TeamCantBeSelf};
canJoinTeam(_IsActive, RoleID, LeaderID) ->
	case teamInterface:isInTeam(RoleID) of
		false ->
			TeamInfo =  teamInterface:getTeamInfoWithRoleID(LeaderID),
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
			{false, ?ErrorCode_TeamHasTeam}
	end.
%%%-------------------------------------------------------------------
fastJoinTeam(TeamID) ->
	RoleID = playerState:getRoleID(),
	LeaderID = teamInterface:getLeaderIDWithTeamID(TeamID),
	case canJoinTeam(true, RoleID, LeaderID) of
		{true, TeamInfo} ->
			psMgr:sendMsg2PS(
				?PsNameTeam,
				joinTeam,
				{TeamInfo#recTeamInfo.teamID, makeTeamMemberInfo(TeamInfo#recTeamInfo.copyMapID)}
			);
		{_, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok.
%%%-------------------------------------------------------------------
kickMember(TarRoleID) ->
	RoleID = playerState:getRoleID(),
	case canKickMember(RoleID, TarRoleID) of
		{true, _} ->
			psMgr:sendMsg2PS(
				?PsNameTeam,
				kickMember,
				{RoleID, playerState:getNetPid(), TarRoleID}
			);
		{_, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok.

canKickMember(RoleID, RoleID) ->
	{false, ?ErrorCode_TeamCantBeSelf};
canKickMember(RoleID, TarRoleID) ->
	case teamInterface:isTeamLeader(RoleID) of
		true ->
			{teamInterface:isInSameTeam(RoleID, TarRoleID), ?ErrorCode_TeamTargetNotInTeam};
		_ ->
			{false, ?ErrorCode_TeamOnlyLeaderCanOp}
	end.
%%%-------------------------------------------------------------------
leaveTeam(IsNotify) ->
	RoleID = playerState:getRoleID(),
	case teamInterface:isInTeam(RoleID) of
		true ->
			psMgr:sendMsg2PS(
				?PsNameTeam,
				leaveTeam,
				{RoleID, playerState:getNetPid(), IsNotify}
			);
		_ ->
			skip
	end,
	ok.

%%%-------------------------------------------------------------------
leaveTeamAndEnterCopyMap(CopyMapID) ->
	RoleID = playerState:getRoleID(),
	case teamInterface:isInTeam(RoleID) of
		true ->
			psMgr:sendMsg2PS(
				?PsNameTeam,
				leaveTeamAndEnter,
				{RoleID, self(), playerState:getNetPid(), CopyMapID}
			);
		_ ->
			enterCopyMap(CopyMapID)
	end,
	ok.

enterCopyMap(CopyMapID) ->
	case playerCopyMap:canEnterCopyMap(CopyMapID) of
		true ->
			playerCopyMap:enterCopyMap(CopyMapID);
		ErrorCode ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end.
%%%-------------------------------------------------------------------
changeLeader(TarRoleID) ->
	RoleID = playerState:getRoleID(),
	MapID = playerState:getMapID(),
	MapPid = playerState:getMapPid(),
	IsNotInCopy = checkNotInCopyMap(MapID),
	case canChangeLeader(RoleID, TarRoleID) of
		{true, _} ->
			psMgr:sendMsg2PS(
				?PsNameTeam,
				changeLeader,
				{RoleID, playerState:getNetPid(), TarRoleID, MapPid, IsNotInCopy}
			);
		{_, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok.

canChangeLeader(LeaderID, LeaderID) ->
	{false, -1};
canChangeLeader(LeaderID, NewLeaderID) ->
	case teamInterface:isTeamLeader(LeaderID) of
		true ->
			case teamInterface:isInSameTeam(LeaderID, NewLeaderID) of
				true ->
					{true, 0};
				_ ->
					{false, ?ErrorCode_TeamTargetNotInTeam}
			end;
		_ ->
			{false, ?ErrorCode_TeamOnlyLeaderCanOp}
	end.
%%%-------------------------------------------------------------------
leaderChangeCopyMap(NewCopyMapID) ->
	RoleID = playerState:getRoleID(),
	case canLeaderChangeCopyMap(NewCopyMapID) of
		{true, _} ->
			psMgr:sendMsg2PS(
				?PsNameTeam,
				changeTargetMapID,
				{RoleID, playerState:getNetPid(), NewCopyMapID}
			);
		{_, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok.

canLeaderChangeCopyMap(0) ->
	{false, ?ErrorCode_TeamCantChangeMapZero};
canLeaderChangeCopyMap(_NewCopyMapID) ->
	RoleID = playerState:getRoleID(),
	case teamInterface:isTeamLeader(RoleID) of
		true ->
%%			case playerCopyMap:canEnterCopyMap(NewCopyMapID, false) of
%%				true ->
			{true, 0};
%%				ErrorCode ->
%%					{false, ErrorCode}
%%			end;
		_ ->
			{false, ?ErrorCode_TeamOnlyLeaderCanOp}
	end.

%%%-------------------------------------------------------------------
leaderStartCopyMap() ->
	RoleID = playerState:getRoleID(),
	case teamInterface:getTeamInfoWithRoleID(RoleID) of
		#recTeamInfo{leaderID = RoleID, copyMapID = CopyMapID} ->
			MapID = playerState:getMapID(),
			case canGoToMap(MapID) of
				true ->
					case playerCopyMap:canEnterCopyMap(CopyMapID, true) of
						true ->
							psMgr:sendMsg2PS(
								?PsNameTeam,
								leaderStartCopymap,
								{RoleID, playerState:getNetPid()}
							);
						ErrorCode ->
							playerMsg:sendErrorCodeMsg(ErrorCode)
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_TeamCantOpInCopyMap)
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_TeamOnlyLeaderCanOp)
	end.

%%%-------------------------------------------------------------------
onReceivedLeaderStartCopyMap({LeaderID, CopyMapID}) ->
	RoleID = playerState:getRoleID(),
	case checkMeCanEnterCopyMap(CopyMapID) of
		{true, _} ->
			playerMsg:sendNetMsg(#pk_GS2U_TeamLeaderStartCopymap{
				copyMapID = CopyMapID
			});
		{false, _ErrorCode} when RoleID =/= LeaderID ->
			Msg = playerMsg:getErrorCodeMsg(
				?ErrorCode_TeamSomeOneCantInCopyMap,
				[playerState:getName()]
			),
			teamInterface:sendNetMsg2TeamWithRoleID(RoleID, Msg, false),
			%% 主动拒绝
			psMgr:sendMsg2PS(
				?PsNameTeam,
				memberStartCopymapAck,
				{RoleID, playerState:getNetPid(), 0, false}
			);
		_ ->
			skop
	end,
	ok.
%%%-------------------------------------------------------------------
memberStartCopyMapAck(Ack) ->
	RoleID = playerState:getRoleID(),
	case teamInterface:isInTeam(RoleID) of
		true ->
			case teamInterface:isTeamLeader(RoleID) of
				false ->
					case teamInterface:getTeamInfoWithRoleID(RoleID) of
						#recTeamInfo{copyMapID = 0} ->
							skip;
						#recTeamInfo{copyMapID = CopyMapID} ->
							doMemberStartCopyMapAck(Ack, RoleID, CopyMapID);
						_ ->
							playerMsg:getErrorCodeMsg(?ErrorCode_TeamDissmissed)
					end;
				_ ->
					skip
			end;
		_ ->
			playerMsg:getErrorCodeMsg(?ErrorCode_TeamSelftNotInTeam)
	end.
doMemberStartCopyMapAck(0, RoleID, _CopyMapID) ->
	psMgr:sendMsg2PS(
		?PsNameTeam,
		memberStartCopymapAck,
		{RoleID, playerState:getNetPid(), 0, true}
	);
doMemberStartCopyMapAck(Ack, RoleID, CopyMapID) ->
	case checkMeCanEnterCopyMap(CopyMapID) of
		{true, _} ->
			psMgr:sendMsg2PS(
				?PsNameTeam,
				memberStartCopymapAck,
				{RoleID, playerState:getNetPid(), Ack, true}
			);
		{_, ErrorCode} ->
			playerMsg:sendErrorCodeMsg(ErrorCode),
			psMgr:sendMsg2PS(
				?PsNameTeam,
				memberStartCopymapAck,
				{RoleID, playerState:getNetPid(), 0, false}
			),
			Msg = playerMsg:getErrorCodeMsg(
				?ErrorCode_TeamSomeOneCantInCopyMap,
				[playerState:getName()]
			),
			teamInterface:sendNetMsg2TeamWithRoleID(
				RoleID,
				Msg,
				false
			)
	end.
%%	MapID = playerState:getMapID(),
%%	case playerCopyMap:canEnterCopyMap(CopyMapID, true) of
%%		true ->
%%			case checkNotInCopyMap(MapID) of
%%				true ->
%%					psMgr:sendMsg2PS(
%%						?PsNameTeam,
%%						memberStartCopymapAck,
%%						{RoleID, playerState:getNetPid(), Ack}
%%					);
%%				_ ->
%%					playerMsg:getErrorCodeMsg(?ErrorCode_TeamCantOpInCopyMap)
%%			end;
%%		ErrorCode ->
%%			playerMsg:sendErrorCodeMsg(ErrorCode),
%%			psMgr:sendMsg2PS(
%%				?PsNameTeam,
%%				memberStartCopymapAck,
%%				{RoleID, playerState:getNetPid(), 0}
%%			),
%%			Msg = playerMsg:getErrorCodeMsg(
%%				?ErrorCode_TeamSomeOneCantInCopyMap,
%%				[playerState:getName()]
%%			),
%%			teamInterface:sendNetMsg2TeamWithRoleID(
%%				RoleID,
%%				Msg,
%%				false
%%			)
%%	end.

checkMeCanEnterCopyMap(CopyMapID) ->
	MapID = playerState:getMapID(),
	case playerCopyMap:canEnterCopyMap(CopyMapID, true) of
		true ->
			case canGoToMap(MapID) of
				true ->
					{true, 0};
				_ ->
					{false, ?ErrorCode_TeamCantOpInCopyMap}
			end;
		ErrorCode ->
			{false, ErrorCode}
	end.

%%%-------------------------------------------------------------------
setSearchFlag(Flag) ->
	RoleID = playerState:getRoleID(),
	case teamInterface:isTeamLeader(RoleID) of
		true ->
			psMgr:sendMsg2PS(
				?PsNameTeam,
				setSearchFlag,
				{RoleID, playerState:getNetPid(), Flag}
			);
		_ ->
			playerMsg:getErrorCodeMsg(?ErrorCode_TeamOnlyLeaderCanOp)
	end,
	ok.

%%%-------------------------------------------------------------------
offline() ->
	RoleID = playerState:getRoleID(),
	IsLeader = teamInterface:isTeamLeader(RoleID),
	autoChangeLeader(IsLeader),
	syncInfo2TeamOffline(),
	ok.

syncInfo2TeamOffline() ->
	RoleID = playerState:getRoleID(),
	TeamInfo = teamInterface:getTeamInfoWithRoleID(RoleID),
	doSyncInfo2Team(TeamInfo, 0),
	cancelMatch(false),
	ok.

autoChangeLeader(false) ->
	ok;
autoChangeLeader(_) ->
	RoleID = playerState:getRoleID(),
	MapID = playerState:getMapID(),
	MapPid = playerState:getMapPid(),
	IsNotInCopy = checkNotInCopyMap(MapID),
	psMgr:sendMsg2PS(
		?PsNameTeam,
		leaderOffline,
		{RoleID, MapPid, IsNotInCopy}
	),
	ok.


%%%-------------------------------------------------------------------
syncInfo2Team(Force) ->
	case canSyncPlayerInfo(Force) of
		true ->
			RoleID = playerState:getRoleID(),
			doSyncInfo2Team(
				teamInterface:getTeamInfoWithRoleID(RoleID),
				playerState:getPlayerCode()
			);
		_ ->
			skip
	end,
	ok.

doSyncInfo2Team(#recTeamInfo{copyMapID = CopyMapID}, Code) ->
	{X, Y} = case playerState:getPos() of
		         {X1, Y1} ->
			         {X1, Y1};
		         _ ->
			         {float(0), float(0)}
	         end,
	[_, AV] = playerPropSync:getProp(?SerProp_ActionPoint),
	CopyMapEnterCount = copyMapEnterCount(CopyMapID),
	NetPid = playerState:getNetPid(),
	Info = #recSyncMemberInfo{
		roleID = playerState:getRoleID(),
		code = Code,
		pid = self(),
		netPid = NetPid,
		level = playerState:getLevel(),
		guildID = playerState:getGuildID(),
		guildName = playerState:getGuildName(),
		mapID = playerState:getMapID(),
		groupID = playerState:getGroupID(),
		mapPID = playerState:getMapPid(),
		posX = X,
		posY = Y,
		targetMapCount = CopyMapEnterCount,
		actionPoint = AV,
		force = playerPropSync:getProp(?PriProp_PlayerForce) + playerPropSync:getProp(?PriProp_PetForce),
		hpPc = getPlayerHpPc()
	},
	psMgr:sendMsg2PS(?PsNameTeam, updateMemberInfo, Info),

	%%放在这里用通知队友
	Msg = #pk_GS2U_UpdateMemberExInfo{
		infoEx = #pk_TeamMemberInfoEx{
			code = Code,
			playerID = Info#recSyncMemberInfo.roleID,
			level = Info#recSyncMemberInfo.level,
			hpPercent = Info#recSyncMemberInfo.hpPc,
			mapID = Info#recSyncMemberInfo.mapID,
			groupID = Info#recSyncMemberInfo.groupID,
			mapInstanceID = misc:pid_to_integer(Info#recSyncMemberInfo.mapPID),
			copyMapLeftCount = CopyMapEnterCount,
			actionPoint = AV,
			force = Info#recSyncMemberInfo.force,
			x = X,
			y = Y
		}},
	teamInterface:sendNetMsg2TeamWithRoleID(
		Info#recSyncMemberInfo.roleID,
		Msg,
		true
	),
	ok;
doSyncInfo2Team(_Info, _Code) ->
	ok.

canSyncPlayerInfo(true) ->
	true;
canSyncPlayerInfo(_) ->
	case get('SyncSelfInfo2Team') of
		undefined ->
			put('SyncSelfInfo2Team', 1),
			true;
		V ->
			case V + 1 >= ?TeamSyncTick of
				true ->
					put('SyncSelfInfo2Team', 0),
					true;
				_ ->
					put('SyncSelfInfo2Team', V + 1),
					false
			end
	end.

copyMapEnterCount(0) ->
	0;
copyMapEnterCount(CopyMapID) ->
	playerCopyMap:getEnterCopyMapCount(CopyMapID).

%%%-------------------------------------------------------------------
queryRole(Type) ->
	L1 =
		case catch doQueryRole(Type) of
			{'EXIT', Err} ->
				?ERROR_OUT("queryRole(~p),err[~p]",[Type, Err]),
				[];
			L0 ->
				L0
		end,
	playerMsg:sendNetMsg(#pk_GS2U_QueryRoleListAck{
		queryType = Type,
		playerList = L1
	}).

%%%-------------------------------------------------------------------
doQueryRole(?Search_Nearby) ->
	Me = playerState:getRoleID(),
	PlayerEts = playerState:getMapPlayerEts(),
	%%
	Q = ets:fun2ms(fun(Obj) when Obj#recMapObject.id =/= Me -> Obj#recMapObject.id end),
	RoleIDList1 = ets:select(PlayerEts, Q),
	%%
	RoleIDList2 = [RoleID || RoleID <- RoleIDList1
		, teamInterface:isInTeam(RoleID) =:= false],

	%%
	RoleIDList3 =
		case length(RoleIDList2) > ?SearchList_Max of
			true ->
				misc:shuffle(RoleIDList2);
			_ ->
				RoleIDList2
		end,
	%%
	RoleIDList4 = lists:sublist(RoleIDList3, ?SearchList_Max),
	makeOnlineRoleSnapshot(RoleIDList4, ?Search_Nearby);
%%
doQueryRole(?Search_Friend) ->
	RoleID = playerState:getRoleID(),
	%%
	#recFriend2Data{relations = FL} = friend2State:queryFriend2Data(RoleID),
	FRoleIDList1 = [FriendID ||
		#rec_friend2_relation{targetRoleID = FriendID, relation = Relation} <- FL
		, Relation =:= ?RELATION_FORMAL
		, teamInterface:isInTeam(FriendID) =:= false
		, core:queryPlayerPidByRoleID(FriendID) =/= offline],
	%%
	FRoleIDList2 = lists:sublist(FRoleIDList1, ?SearchList_Max),
	makeOnlineRoleSnapshot(FRoleIDList2, ?Search_Friend);
%%
doQueryRole(?Search_Guild) ->
	RoleID = playerState:getRoleID(),
	L1 = queryGuildMemberList(RoleID),
	L2 = [ID || ID <- L1
		, RoleID =/= ID
		, teamInterface:isInTeam(ID) =:= false
		, core:queryPlayerPidByRoleID(ID) =/= offline],
	makeOnlineRoleSnapshot(L2, ?Search_Guild);
%%
doQueryRole(_) ->
	Me = playerState:getRoleID(),
	MinLevel = getMyTeamCopyMinLevel(Me),
	QS = ets:fun2ms(fun(Obj) when Obj#rec_OnlinePlayer.roleID =/= Me -> Obj#rec_OnlinePlayer.roleID end),
	L1 = ets:select(ets_rec_OnlinePlayer, QS),
	LL = erlang:length(L1),
	L2 =
		case LL =< ?SearchRange_Max of
			true ->
				L1;
			_ ->
				LS =
					case random:uniform(2) of
						1 ->
							misc:shuffle(lists:reverse(L1));
						_ ->
							misc:shuffle(L1)
					end,
				lists:sublist(LS, ?SearchRange_Max)
		end,

	L3 = lists:foldl(
		fun(RoleID, ACC) ->
			case core:queryBaseRoleByRoleID(RoleID) of
				#rec_base_role{level = LV} ->
					IsInTeam = teamInterface:isInTeam(RoleID),
					case LV >= MinLevel andalso RoleID =/= Me andalso IsInTeam =:= false of
						true ->
							[RoleID | ACC];
						_ ->
							ACC
					end;
				_ ->
					ACC
			end
		end, [], L2),

	L4 = lists:sublist(L3, ?SearchList_Max),
	makeOnlineRoleSnapshot(L4, ?Search_Online).
%%%-------------------------------------------------------------------
makeOnlineRoleSnapshot([], _Type) ->
	[];
makeOnlineRoleSnapshot(RoleIDList, Type) ->
	lists:foldl(
		fun(RoleID, ACC) ->
%%			case teamInterface:isInTeam(RoleID) of
%%				true ->
%%					ACC;
%%				_ ->
			case marshallOnlineRoleSnapshot(RoleID, Type) of
				#pk_OnlineMemberSnapshot{} = Rec ->
					[Rec | ACC];
				_ ->
					ACC
			end
%%			end
		end, [], RoleIDList).
marshallOnlineRoleSnapshot(RoleID, Type) ->
	case core:queryRoleKeyInfoByRoleID(RoleID) of
		#?RoleKeyRec{
			roleID = ID,
			roleName = Name,
			level = Level,
			career = Career,
			race = Race,
			sex = Sex,
			head = Head,
			playerForce = PF
		} ->
			{GuildID, GuildName} = queryRoleGuildIDAndName(ID),
			#pk_OnlineMemberSnapshot{
				playerID = ID,
				playerName = Name,
				guildName = GuildName,
				guildID = GuildID,
				code = 0,
				level = Level,
				friendState = friendState(RoleID, Type),
				career = Career,
				race = Race,
				sex = Sex,
				head = Head,
				force = PF
			};
		_ ->
			undefined
	end.

friendState(_TargetID, ?Search_Friend) ->
	1;
friendState(TargetID, _) ->
	MeId = playerState:getRoleID(),
	Result = friend2State:isFriend(MeId, TargetID),
	misc:convertBool2Int(Result).

%%%-------------------------------------------------------------------
queryMatch() ->
	RoleID = playerState:getRoleID(),
	State = teamInterface:queryMatchState(RoleID),
	playerMsg:sendNetMsg(#pk_GS2U_QuickTeamMatchAck{result = State}).
%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
canGoToMap(MapID) ->
	MapType = playerScene:getMapType(MapID),
	MapType =:= ?MapTypeNormal andalso playerState:getGroupID() =:= 0.

checkNotInCopyMap(MapID) ->
	MapType = playerScene:getMapType(MapID),
	MapType =/= ?MapTypeCopyMap.


%%%-------------------------------------------------------------------
makeTeamMemberInfo(CopyMapID) ->
	[_, AV] = playerPropSync:getProp(?SerProp_ActionPoint),
	CopyMapEnterCount = copyMapEnterCount(CopyMapID),
	{X, Y} = case playerState:getPos() of
		         {X1, Y1} ->
			         {X1, Y1};
		         _ ->
			         {float(0), float(0)}
	         end,
	#recTeamMemberInfo{
		roleID = playerState:getRoleID(),
		code = playerState:getPlayerCode(),
		name = playerState:getName(),
		guildID = playerState:getGuildID(),
		guildName = playerState:getGuildName(),
		career = playerState:getCareer(),
		race = playerState:getRace(),
		sex = playerState:getSex(),
		head = playerState:getHead(),
		level = playerState:getLevel(),
		pid = self(),
		netPid = playerState:getNetPid(),
		mapID = playerState:getMapID(),
		groupID = playerState:getGroupID(),
		posX = X,
		posY = Y,
		mapPid = playerState:getMapPid(),
		hpPc = getPlayerHpPc(),
		targetMapCount = CopyMapEnterCount,
		actionPoint = AV,
		fightingCapacity = playerPropSync:getProp(?PriProp_PlayerForce) + playerPropSync:getProp(?PriProp_PetForce)
	}.

-spec getPlayerHpPc() -> integer().
getPlayerHpPc() ->
	CurHp = playerState:getCurHp(),
	MaxHp = playerState:getMaxHp(),
	skill:getPercent(CurHp, MaxHp).

%%sendNetMsgToOnlineRole(RoleID, Msg) ->
%%	case core:queryNetPidByRoleID(RoleID) of
%%		NetPid when is_pid(NetPid) ->
%%			playerMsg:sendNetMsg(NetPid, Msg);
%%		_ ->
%%			offline
%%	end.

sendMsgToOnlineRole(RoleID, MsgID, Msg) ->
	case core:queryPlayerPidByRoleID(RoleID) of
		Pid when is_pid(Pid) ->
			psMgr:sendMsg2PS(Pid, MsgID, Msg);
		_ ->
			offline
	end.

%%
getMyTeamCopyMinLevel(RoleID) ->
	case teamInterface:getTeamInfoWithRoleID(RoleID) of
		#recTeamInfo{copyMapID = CopyMapID} when CopyMapID > 0 ->
			case getCfg:getCfgByArgs(cfg_mapsetting, CopyMapID) of
				#mapsettingCfg{type = ?MapTypeCopyMap, playerEnter_MinLevel = EnterMinLevel} ->
					EnterMinLevel;
				_ ->
					playerState:getLevel()
			end;
		_ ->
			playerState:getLevel()
	end.

%%
queryRoleGuildIDAndName(RoleID) ->
	case myEts:readRecord(rec_guild_member, RoleID) of
		#rec_guild_member{guildID = GuildID} ->
			{GuildID, guildLogic:getGuildName(GuildID)};
		_ ->
			{0, ""}
	end.

queryGuildMemberList(RoleID) ->
	ML =
		case myEts:readRecord(rec_guild_member, RoleID) of
			#rec_guild_member{guildID = GuildID} ->
				guildLogic:getGuildMember(GuildID);
			_ ->
				[]
		end,
	[ID || #rec_guild_member{roleID = ID, power = Power} <- ML, Power =/= ?GuildMemLevel_Request].