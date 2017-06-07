%%%
%%%-------------------------------------------------------------------
%%% @author 罗维
%%% @copyright (C) 2016, <haowan123>
%%% @doc
%%% 玩家跨服竞技场组队
%%% @end
%%% Created : 4. 一月 2016 15:33
%%%-------------------------------------------------------------------

-module(playerCrosTeam).

-include("playerPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================

-define(IsNotHeader, false).	%%不是队长
-define(IsHeader, true).		%%是队长

-define(IsNotReady, false).		%%未准备
-define(IsReady, true).			%%是准备

-define(Refuse,	0).	%%拒绝
-define(Agree,	1). %%同意

-define(ReadyState, 0). %%准备状态
-define(GameState,  1). %%游戏状态
-define(MatchState, 2). %%匹配状态

-define(IsNotStart, 0). %%未开始
-define(IsStart,	1). %%开始

-define(MaxMemberNum, 3). %%最大房间人数

-define(OneHourSec, 3600).	%%一个小时秒数


-define(ReviveTime, 6 * 60).

-define(SysHurtTickTime, 5).
-export([
	kick/2,
	ready/2,
	cancelMatch/0,
	readyMatch/0,
	startMatch/0,
	setIsGMMatch/1,
	modifyState/2,

	inviteAck/2,
	inviteFriend/1,
	beInviteAck/3,
	beInviteSuc/2,
	matchCancelReady/2,
	endBattleCancelReady/3
]).

-export([
	getCrosArenaReviveTime/0,
	sysHurtToCrosArena/1,
	onlineUpdateInte/0,
	offlineDelTeamMember/0,
	dealCrosAreadReward/4,
	dealCrossState/1
	]).

%%踢人
-spec kick(IsKick::boolean(), RoleID::uint()) -> ok.
kick(IsKick, RoleID) ->
	kick(playerState:getCrosTeamID(), IsKick, RoleID).
kick(0, _IsKick, _RoleID) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaHourseNull);
kick(TeamID, IsKick, RoleID) ->
	case ets:lookup(?TABLE_CrosTeam, TeamID) of
		[#recCrosTeam{member = Members, isStart = State} = OldTeam] ->
			case lists:keyfind(RoleID, #recCrosTeamInfo.roleID, Members) of
				false ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaReadyFail);
				#recCrosTeamInfo{pid = Pid, isHeader = Header} ->
					case IsKick of
						true ->
							case State of
								?MatchState ->
									psMgr:sendMsg2PS(?PsNameCrosArena, cancelMatch, {RoleID, TeamID, gsMainLogic:getDBID4GS()});
								_ ->
									skip
							end,
							playerState:setCrosTeamID(0),
							delTeamMember(TeamID, RoleID, OldTeam, Header),
							sendTeamerDelState(Members, IsKick, RoleID);
						_ ->
							case State of
								?GameState ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaAlreadyStart);
								?MatchState ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaMatchIng);
								_ ->	
									SelfID = playerState:getRoleID(),
									#recCrosTeamInfo{
										isHeader = Header1
									} = lists:keyfind(SelfID, #recCrosTeamInfo.roleID, Members),
									case Header1 of
										?IsNotHeader ->
											playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaKickFail);
										_ ->
											delTeamMember(TeamID, RoleID, OldTeam, Header),
											sendTeamerDelState(Members, IsKick, RoleID),
											psMgr:sendMsg2PS(Pid, crosKick, {})
									end
							end
					end
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaHourseNull)
	end,
	ok.

%%准备
-spec ready(IsReady::boolean(), RoleID::uint()) -> ok.
ready(IsReady, RoleID) ->
	ready(playerState:getCrosTeamID(), IsReady, RoleID).
ready(0, _IsReady, _RoleID) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaHourseNull);
ready(TeamID, IsReady, RoleID) ->
	ready(TeamID, IsReady, RoleID, ets:lookup(?TABLE_CrosTeam, TeamID)).
ready(_TeamID, _IsReady, _RoleID, [#recCrosTeam{isStart = ?GameState}]) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaAlreadyStart);
ready(_TeamID, _IsReady, _RoleID, [#recCrosTeam{isStart = ?MatchState}]) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaMatchIng);
ready(TeamID, IsReady, RoleID, [#recCrosTeam{member = Members} = OldTeam]) ->
	case lists:keyfind(RoleID, #recCrosTeamInfo.roleID, Members) of
		#recCrosTeamInfo{isHeader = ?IsNotHeader} = Member ->
			NewMember = Member#recCrosTeamInfo{isReady = IsReady},
			updateTeamMember(TeamID, NewMember, OldTeam),
			sendTeamerReadyState(Members, IsReady, RoleID);
		#recCrosTeamInfo{} -> 
			skip;
		_ ->
			?ERROR_OUT("this team:[~p] has not player:[~p]",[TeamID, RoleID])
	end,
	ok;
ready(_TeamID, _IsReady, _RoleID, _) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaHourseNull).


-spec matchCancelReady(RoleID::uint(), TeamID::uint()) -> ok.
matchCancelReady(RoleID, TeamID) ->
	case ets:lookup(?TABLE_CrosTeam, TeamID) of
		[#recCrosTeam{member = Members} = OldTeam] ->
			case lists:keyfind(RoleID, #recCrosTeamInfo.roleID, Members) of
				false ->
					playerState:setCrosTeamID(0),
					printCancelReadyLog(false, RoleID, TeamID);
				#recCrosTeamInfo{isHeader = ?IsNotHeader} = Member ->
					NewMember = Member#recCrosTeamInfo{isReady = false},
					updateTeamMember(TeamID, NewMember, OldTeam),
					modifyState(TeamID, ?ReadyState),
					sendTeamerReadyState(Members, false, RoleID);
				_ ->
					modifyState(TeamID, ?ReadyState)
			end;
		_ ->
			playerState:setCrosTeamID(0),
			printCancelReadyLog1(false, RoleID, TeamID)
	end,
	ok.

-spec endBattleCancelReady(ArenaVal::uint(), RoleID::uint(), TeamID::uint()) -> ok.
endBattleCancelReady(ArenaVal, RoleID, TeamID) ->
	case ets:lookup(?TABLE_CrosTeam, TeamID) of
		[#recCrosTeam{member = Members} = OldTeam] ->
			case lists:keyfind(RoleID, #recCrosTeamInfo.roleID, Members) of
				false ->
					playerState:setCrosTeamID(0),
					printCancelReadyLog(true, RoleID, TeamID);
				#recCrosTeamInfo{isHeader = ?IsNotHeader} = Member ->
					NewMember = Member#recCrosTeamInfo{
						isReady = false, 
						arenaVal = ArenaVal
					},
					updateTeamMember(TeamID, NewMember, OldTeam),
					
					modifyState(TeamID, ?ReadyState),
					sendInfoToTeam(NewMember, Members);
				#recCrosTeamInfo{} = Member ->
					NewMember = Member#recCrosTeamInfo{
						arenaVal = ArenaVal
					},
					updateTeamMember(TeamID, NewMember, OldTeam),
					sendInfoToTeam(NewMember, Members),
					modifyState(TeamID, ?ReadyState)
			end;
		_ ->
			playerState:setCrosTeamID(0),
			printCancelReadyLog1(true, RoleID, TeamID)
	end,
	ok.	

printCancelReadyLog(true, RoleID, TeamID) ->
	?ERROR_OUT("player [~p] quit cors arena, find team id [~p] fail",[RoleID, TeamID]);
printCancelReadyLog(false, RoleID, TeamID) ->
	?ERROR_OUT("player [~p] cancel match, find team id [~p] fail",[RoleID, TeamID]).
printCancelReadyLog1(true, RoleID, TeamID) ->
	?WARN_OUT("player [~p] quit cors arena, had quit team id [~p]",[RoleID, TeamID]);
printCancelReadyLog1(false, RoleID, TeamID) ->
	?WARN_OUT("player [~p] cancel match, had quit team id [~p]",[RoleID, TeamID]).

%%取消匹配
-spec cancelMatch() -> ok.
cancelMatch() ->
	DBID = gsMainLogic:getDBID4GS(),
	RoleID = playerState:getRoleID(),
	TeamID = playerState:getCrosTeamID(),
	?WARN_OUT("cancelMatch RoleID:~p,TeamID:~p",[RoleID,TeamID]),
	cancelMatch(DBID, RoleID, TeamID, ets:lookup(?TABLE_CrosTeam, TeamID)).
cancelMatch(_DBID, _RoleID, _TeamID, [#recCrosTeam{isStart = ?ReadyState}]) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaHasNoMatch);
cancelMatch(_DBID, _RoleID, _TeamID, [#recCrosTeam{isStart = ?GameState}]) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaAlreadyStart);
cancelMatch(DBID, RoleID, TeamID, [#recCrosTeam{}]) ->
	?DEBUG_OUT("player [~p] teamID [~p] send cancel match",[RoleID, TeamID]),
	case global:whereis_name(?PsNameCrosArena) of
		undefined ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaHasClose);
		Pid ->
			case misc:is_process_alive(Pid) of
				true ->
					psMgr:sendMsg2PS(?PsNameCrosArena, cancelMatch, {RoleID, TeamID, DBID});
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaHasClose)
			end
	end;
cancelMatch(_DBID,RoleID, TeamID, _) ->
	?ERROR_OUT("crosTeam cancelMatch roleid:~p teamID:~p",[RoleID,TeamID]),
%% 	psMgr:sendMsg2PS(?PsNameCrosArena, cancelMatch, {RoleID, TeamID, _DBID}),
	playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaHourseNull).

%%发送邀请
-spec inviteFriend(RoleID::uint()) -> ok.
inviteFriend(RoleID) ->
	inviteFriend(RoleID, playerState:getCrosTeamID()).
inviteFriend(_RoleID, 0) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaHourseNull);
inviteFriend(RoleID, TeamID) ->
	inviteFriend(RoleID, TeamID, ets:lookup(?TABLE_CrosTeam, TeamID)).
inviteFriend(_RoleID, _TeamID, [#recCrosTeam{isStart = ?GameState}]) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaAlreadyStart);
inviteFriend(_RoleID, _TeamID, [#recCrosTeam{isStart = ?MatchState}]) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaMatchIng);
inviteFriend(RoleID, _TeamID, [#recCrosTeam{}]) ->
	case core:queryRoleKeyInfoByRoleID(RoleID) of
		#?RoleKeyRec{level = Level} ->
			case Level >= globalCfg:getArenaInviteLv() of
				true ->
					InviteName = playerState:getName(),
					InviteID = playerState:getRoleID(),
					Msg = #pk_GS2U_AddArenaTeamMemberRequest
						  {
						   roleID = InviteID,
						   name = InviteName
						  },
                    case core:queryNetPidByRoleID(RoleID) of
                        NetPid when erlang:is_pid(NetPid) ->
                            playerMsg:sendNetMsg(NetPid, Msg);
                        _ ->
                            skip
                    end,
					playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaJoinSucc);
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaLevelNotEnougth)
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaPlayerNotOnline)
	end;
inviteFriend(_, _, _) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaHourseNull).

%%反馈邀请(判断玩家是否在跨服战场中)
-spec inviteAck(InviteID::uint(), Result::uint()) -> ok.
inviteAck(InviteID, Result) -> 
	BeTeamID = playerState:getCrosTeamID(),
	case ets:lookup(?TABLE_CrosTeam, BeTeamID) of
		[#recCrosTeam{isStart = ?GameState}] ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaAlreadyStart);
		[#recCrosTeam{isStart = ?MatchState}] ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaMatchIng);
		_ ->
			case core:queryPlayerPidByRoleID(InviteID) of
                Pid when erlang:is_pid(Pid) ->
					TeamInfo = #recCrosTeamInfo{
						pid = self(),
						code = playerState:getPlayerCode(),
						netPid = playerState:getNetPid(),
						roleID = playerState:getRoleID(),
						roleName = playerState:getName(),
						career = playerState:getCareer(),
						level = playerState:getLevel(),
						arenaVal = playerPropSync:getProp(?PriProp_CrosArenaInte),
						force = playerPropSync:getProp(?PriProp_PlayerForce) + playerPropSync:getProp(?PriProp_PetForce)
					},
					psMgr:sendMsg2PS(Pid, beInviteAck, {BeTeamID, Result, TeamInfo});
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaPlayerNotOnline)
			end
	end.
	

beInviteAck(_TeamInfo, _BeTeamID, ?Refuse) ->
	playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaRefuse);
beInviteAck(TeamInfo, BeTeamID, ?Agree) ->
	TeamID = playerState:getCrosTeamID(),
	beInviteAck1(TeamID, BeTeamID, TeamInfo).

beInviteAck1(0, _, #recCrosTeamInfo{netPid = NetPid}) ->
	playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_CrosArenaHourseNull);
beInviteAck1(TeamID, BeTeamID, TeamInfo) ->
	beInviteAck1(TeamID, BeTeamID, TeamInfo, ets:lookup(?TABLE_CrosTeam, TeamID)).

beInviteAck1(_TeamID, _, #recCrosTeamInfo{netPid = NetPid}, [#recCrosTeam{isStart = ?GameState}]) ->
	playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_CrosArenaAlreadyStart);
beInviteAck1(_TeamID, _, #recCrosTeamInfo{netPid = NetPid}, [#recCrosTeam{isStart = ?MatchState}]) ->
	playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_CrosArenaMatchIng);
beInviteAck1(_TeamID, _,  #recCrosTeamInfo{netPid = NetPid}, [#recCrosTeam{member = Member}]) when length(Member) >= 3 ->
	playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_CrosArenaAlreadyFull);
beInviteAck1(TeamID, BeTeamID, #recCrosTeamInfo{netPid = NetPid}, _) when TeamID =:= BeTeamID ->
	playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_CrosArenaAlreadyExist);
beInviteAck1(TeamID, BeTeamID, #recCrosTeamInfo{netPid = NetPid, roleID = RoleID} = TeamInfo, [#recCrosTeam{member = MemberList} = OldTeam]) ->
	%%如果有队伍先清理
	case ets:lookup(?TABLE_CrosTeam, BeTeamID) of
		[#recCrosTeam{isStart = ?GameState}] ->
			playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_CrosArenaAlreadyStart);
		[#recCrosTeam{isStart = ?MatchState}] ->
			playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_CrosArenaMatchIng);
		[#recCrosTeam{member = BeMembers} = OldBeTeam] ->
			case lists:keyfind(RoleID, #recCrosTeamInfo.roleID, BeMembers) of
				false ->
					skip;
				#recCrosTeamInfo{roleID = BeRoleID, isHeader = Header} ->
					delTeamMember(BeTeamID, BeRoleID, OldBeTeam, Header),
					sendTeamerDelState(BeMembers, true, BeRoleID)
			end,
			%%需要处理
			case lists:keyfind(RoleID, #recCrosTeamInfo.roleID, MemberList) of
				false ->
					NewTeamInfo = TeamInfo#recCrosTeamInfo{
														   isHeader = ?IsNotHeader,
														   isReady = ?IsNotReady
														  },
					addTeamMember(TeamID, NewTeamInfo, OldTeam),
					psMgr:sendMsg2PS(TeamInfo#recCrosTeamInfo.pid, crosJoinSuc, {TeamID, MemberList});
				#recCrosTeamInfo{netPid = NetPid} ->
					?ERROR_OUT("player exist multi team ~p,~p",[TeamID, BeTeamID])
			end;
		_ ->
			%%需要处理
			case lists:keyfind(RoleID, #recCrosTeamInfo.roleID, MemberList) of
				false ->
					NewTeamInfo = TeamInfo#recCrosTeamInfo{
														   isHeader = ?IsNotHeader,
														   isReady = ?IsNotReady
														  },
					addTeamMember(TeamID, NewTeamInfo, OldTeam),
					psMgr:sendMsg2PS(TeamInfo#recCrosTeamInfo.pid, crosJoinSuc, {TeamID, MemberList});
				#recCrosTeamInfo{netPid = NetPid} ->
					?ERROR_OUT("player exist multi team ~p,~p",[TeamID, BeTeamID])
			end
	end;
beInviteAck1(_, _, #recCrosTeamInfo{netPid = NetPid}, _) ->
	playerMsg:sendErrorCodeMsg(NetPid, ?ErrorCode_CrosArenaHourseNull).

-spec beInviteSuc(TeamID::uint(), MemberList::list()) -> ok.
beInviteSuc(TeamID, _MemberList) ->
	playerState:setCrosTeamID(TeamID).

%%准备匹配
-spec readyMatch() -> ok.
readyMatch() ->
	readyMatch(0).
readyMatch(0) ->
	TeamID = codeMgr:makeCode(?CodeTypeTeam),
	TeamInfo = #recCrosTeamInfo{
		code = playerState:getPlayerCode(),
		roleID = playerState:getRoleID(),
		roleName = playerState:getName(),
		career = playerState:getCareer(),
		netPid = playerState:getNetPid(),
		pid = self(),
		isReady = ?IsReady,
		isHeader = ?IsHeader,
		level = playerState:getLevel(),
		arenaVal = playerPropSync:getProp(?PriProp_CrosArenaInte),
		force = playerPropSync:getProp(?PriProp_PlayerForce) + playerPropSync:getProp(?PriProp_PetForce)
	},
	playerState:setCrosTeamID(TeamID),
	addTeamMember(TeamID, TeamInfo, []);
readyMatch(_) ->
	ok.

setIsGMMatch(B) ->
	case B of
		true ->
			put('IsGMMatch', B);
		_ ->
			erlang:erase('IsGMMatch')
	end.

getIsGMMatch() ->
	get('IsGMMatch').

%%开始匹配
-spec startMatch() -> ok.
startMatch() ->
	case checkMatch() of
		{Members, _Team} ->
			
			%%更新状态
			case global:whereis_name(?PsNameCrosArena) of
				undefined ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaHasClose);
				Pid ->
					case misc:is_process_alive(Pid) of
						true ->
							?DEBUG_OUT("start match....."),
							TeamID = playerState:getCrosTeamID(),
							modifyState(TeamID, ?MatchState),
							psMgr:sendMsg2PS(?PsNameCrosArena, requestMatch,
								{Members, gsMainLogic:getAreaName(), gsMainLogic:getDBID4GS(), TeamID, getIsGMMatch()});
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_CrosArenaHasClose)
					end
			end;
		Error ->
			playerMsg:sendErrorCodeMsg(Error)
	end,
	ok.

%%修改房间状态
-spec modifyState(TeamID::uint(), State::uint()) -> ok.
modifyState(TeamID, State) ->
	case ets:lookup(?TABLE_CrosTeam, TeamID) of
		[#recCrosTeam{isStart = OldState}] when OldState =:= State ->
			skip;
		[#recCrosTeam{member = Members}] ->
			ets:update_element(?TABLE_CrosTeam, TeamID, [{#recCrosTeam.isStart, State}]),
			sendTeamerMatchState(Members, State);
		_ ->
			?ERROR_OUT("modify state fail team id [~p] not exist state :[~p]",[TeamID, State])
	end.

%%检查匹配
-spec checkMatch() -> uint() | {list(), #recCrosTeamInfo{}}.
checkMatch() ->
	RoleID = playerState:getRoleID(),
	TeamID = playerState:getCrosTeamID(),
	Level = playerState:getLevel(),
	case Level < 45 of
		true ->
			?ErrorCode_BagEquipOnPlayerLevelNotMeet;
		_ ->
			checkMatch(RoleID, TeamID)
	end.
checkMatch(RoleID, TeamID) ->
	case checkIsExistMember(TeamID) of
		{Member, Team} when is_list(Member) ->
			case checkIsOpen(Team#recCrosTeam.isStart) of
				true ->
					?ErrorCode_CrosArenaAlreadyMatch;
				_ ->
					case checkIsHeader(RoleID, Member) of
						true ->
							case checkIsReady(Member) of
								true ->
									{Member, Team};
								_ ->
									?ErrorCode_CrosArenaNotReady
							end;
						_ ->
							?ErrorCode_CrosArenaNotHeader
					end
			end;
		_ ->
			?ErrorCode_CrosArenaTeamNull
	end.

%%检查队伍成员是否未空
-spec checkIsExistMember(TeamID::uint()) -> false | {list(), #recCrosTeam{}}.
checkIsExistMember(TeamID) ->
	case ets:lookup(?TABLE_CrosTeam, TeamID) of
		[#recCrosTeam{member = Member} = Team] when length(Member) >= 1 ->
			{Member, Team};
		_ ->
			false
	end.

%%检查房间是否已经开启
-spec checkIsOpen(IsState::uint()) -> boolean().
checkIsOpen(?GameState) ->
	true;
checkIsOpen(?MatchState) ->
	true;
checkIsOpen(_) ->
	false.

%%检查自己是否未队长
-spec checkIsHeader(RoleID::uint(), L::list()) -> boolean().
checkIsHeader(RoleID, L) ->
	case lists:keyfind(RoleID, #recCrosTeamInfo.roleID, L) of
		#recCrosTeamInfo{isHeader = ?IsHeader} ->
			true;
		_ ->
			false
	end.

%%检查队友是否准备
-spec checkIsReady(L::list()) -> boolean().
checkIsReady([]) ->
	true;
checkIsReady([#recCrosTeamInfo{isReady = ?IsReady} | L]) ->
	checkIsReady(L);
checkIsReady([_ | _L]) ->
	false.

%%更新队友
-spec updateTeamMember(TeamID::uint(), #recCrosTeamInfo{}, #recCrosTeam{}) -> true.
updateTeamMember(TeamID, #recCrosTeamInfo{roleID = RoleID} = TeamInfo, #recCrosTeam{member = Member}) ->
	NewMember = lists:keyreplace(RoleID, #recCrosTeamInfo.roleID, Member, TeamInfo),
	L = [{#recCrosTeam.member, NewMember}],
	ets:update_element(?TABLE_CrosTeam, TeamID, L).

%%增加队友
-spec addTeamMember(TeamID::uint(), #recCrosTeamInfo{}, #recCrosTeam{} | []) -> true.
addTeamMember(TeamID, #recCrosTeamInfo{} = TeamInfo, []) ->
	NewTeam = #recCrosTeam{
		teamID = TeamID,
		member = [TeamInfo]
	},
	sendTeamInfo([TeamInfo]),
	ets:insert(?TABLE_CrosTeam, NewTeam);
addTeamMember(TeamID, #recCrosTeamInfo{} = TeamInfo, #recCrosTeam{member = Member}) ->
	NewMember = [TeamInfo | Member],
	L = [{#recCrosTeam.member, NewMember}],
	sendTeamInfo(NewMember),
	ets:update_element(?TABLE_CrosTeam, TeamID, L).

%%踢出队友
-spec delTeamMember(TeamID::uint(), RoleID::uint(), #recCrosTeam{}, IsHeader::boolean()) -> true.
delTeamMember(TeamID, RoleID, #recCrosTeam{member = Member}, IsHeader) ->
	NewMember = lists:keydelete(RoleID, #recCrosTeamInfo.roleID, Member),
	case NewMember of
		[] ->
%%			codeMgr:reclaimCode(TeamID),
			ets:delete(?TABLE_CrosTeam, TeamID);
		_ ->
			case IsHeader of
				true ->
					[#recCrosTeamInfo{} = Info | NM] = NewMember,
					NewMember1 = [Info#recCrosTeamInfo{isHeader = ?IsHeader} | NM],
					L = [{#recCrosTeam.member, NewMember1}],
					sendTeamInfo(NewMember1),
					ets:update_element(?TABLE_CrosTeam, TeamID, L);
				_ ->
					L = [{#recCrosTeam.member, NewMember}],
					ets:update_element(?TABLE_CrosTeam, TeamID, L)
			end
	end.	

%%发送准备状态
-spec sendTeamerReadyState(MemberList::list(), Reay::boolean(), RoleID::uint()) -> ok.
sendTeamerReadyState(MemberList, Ready, RoleID) ->
	Msg = #pk_ArenaTeamMemberPrepare{id = RoleID, isPrepare = Ready},
	sendTeamerReadyState(MemberList, Msg).
sendTeamerReadyState([], _) ->
	ok;
sendTeamerReadyState([#recCrosTeamInfo{netPid = NetPid} | L], Msg) ->
	playerMsg:sendNetMsg(NetPid, Msg),
	sendTeamerReadyState(L, Msg).

%%发送玩家踢出状态
-spec sendTeamerDelState(MemberList::list(), RIsKickeay::boolean(), RoleID::uint()) -> ok.
sendTeamerDelState(MemberList, IsKick, RoleID) ->
	Msg = #pk_DeleteArenaTeamMember{id = RoleID, isMyself = IsKick},
	sendTeamerDelState(MemberList, Msg).
sendTeamerDelState([], _) ->
	ok;
sendTeamerDelState([#recCrosTeamInfo{netPid = NetPid} | L], Msg) ->
	playerMsg:sendNetMsg(NetPid, Msg),
	sendTeamerDelState(L, Msg).

%%发送匹配状态
-spec sendTeamerMatchState(MemberList::list(), State::boolean()) -> ok.
sendTeamerMatchState(MemberList, State) ->
	Ret = case State of
		?ReadyState ->
			false;
		_ ->
			true
	end,
	Msg = #pk_CrosArenaMatch{isMatch = Ret},
	?DEBUG_OUT("sendTeamerMatchState roleid:~p msg:~p",[playerState:getRoleID(),Msg]),
	sendTeamerMatchState(MemberList, State, Msg).
sendTeamerMatchState([], _State, _Msg) ->
	ok;
sendTeamerMatchState([#recCrosTeamInfo{netPid = NetPid} | L], State, Msg) ->
	playerMsg:sendNetMsg(NetPid, Msg),
	sendTeamerMatchState(L, State, Msg).

%%发送队友信息
-spec sendTeamInfo(MemberList::list()) -> ok.
sendTeamInfo(MemberList) ->
	Fun = fun(#recCrosTeamInfo{} = Member) ->
		#pk_ArenaTeamMemberInfo{
		 code = Member#recCrosTeamInfo.code,
		 id = Member#recCrosTeamInfo.roleID,
		 name = Member#recCrosTeamInfo.roleName ,
		 isLeader = Member#recCrosTeamInfo.isHeader,
		 isPrepare = Member#recCrosTeamInfo.isReady,
		 level = Member#recCrosTeamInfo.level,
		 career = Member#recCrosTeamInfo.career,
		 force = Member#recCrosTeamInfo.force,
		 arenaVal = Member#recCrosTeamInfo.arenaVal
		}
	end,
	L = lists:map(Fun, MemberList),
	Msg = #pk_GS2U_UpdateArenaTeamMember{teamMemberInfos = L},
	Fun1 = fun(#recCrosTeamInfo{netPid = NetPid}) ->
		playerMsg:sendNetMsg(NetPid, Msg)
	end,
	lists:foreach(Fun1, MemberList).

%%发送自己信息给队友
-spec sendInfoToTeam(Member::#recCrosTeamInfo{}, MemberList::list()) -> ok.
sendInfoToTeam(Member, MemberList) ->
	Info = #pk_ArenaTeamMemberInfo{
		 code = Member#recCrosTeamInfo.code,
		 id = Member#recCrosTeamInfo.roleID,
		 name = Member#recCrosTeamInfo.roleName ,
		 isLeader = Member#recCrosTeamInfo.isHeader,
		 isPrepare = Member#recCrosTeamInfo.isReady,
		 level = Member#recCrosTeamInfo.level,
		 career = Member#recCrosTeamInfo.career,
		 force = Member#recCrosTeamInfo.force,
		 arenaVal = Member#recCrosTeamInfo.arenaVal
	},
	Msg = #pk_GS2U_UpdateArenaTeamMember{teamMemberInfos = [Info]},
	[playerMsg:sendNetMsg(M#recCrosTeamInfo.netPid, Msg) || M <- MemberList],
	ok.

%%跨服战场复活时间
-spec getCrosArenaReviveTime() -> uint().
getCrosArenaReviveTime() ->
	ID = playerState:getMapID(),
	case lists:member(ID, ?CrosArenaMapIDList) of
		true ->
			?ReviveTime;
		_ ->
			0
	end.

%%同步伤害
-spec sysHurtToCrosArena(Now::uint()) -> ok.
sysHurtToCrosArena(Now) ->
	ID = playerState:getMapID(),
	RoleID = playerState:getRoleID(),
	MapPid = playerState:getMapPid(),
	case lists:member(ID, ?CrosArenaMapIDList) of
		true ->
			DiffSec2 = erlang:trunc((Now - playerPropSync:getProp(?SerProp_CrosArenaSyncHurt)) / 1000),
			case DiffSec2 >= ?SysHurtTickTime of
				true ->
					case playerState:getPlayerCopyMapStatHurt() of
						#rec_stat_hurt{petHurt = PetHurt, playerHurt = PlayerHurt} ->
							case PetHurt + PlayerHurt =/= 0 of
								true ->
									psMgr:sendMsg2PS(?PsNameCrosArena, sysHurt, {PetHurt + PlayerHurt, RoleID, MapPid});
								_ ->
									skip
							end;
						_ ->
							skip
							%%psMgr:sendMsg2PS(?PsNameCrosArena, sysHurt, {0, RoleID, MapPid})
					end,
					playerPropSync:setInt64(?SerProp_CrosArenaSyncHurt, Now);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%%下线处理
-spec offlineDelTeamMember() -> ok.
offlineDelTeamMember() ->
	?LOG_OUT("offlineDelTeamMember roleid:~p",[playerState:getRoleID()]),
	RoleID = playerState:getRoleID(),
	TeamID = playerState:getCrosTeamID(),
	offlineDelTeamMember(TeamID, RoleID).
offlineDelTeamMember(0, _) ->
	ok;
offlineDelTeamMember(TeamID, RoleID) ->
	case ets:lookup(?TABLE_CrosTeam, TeamID) of
		[#recCrosTeam{member = Members, isStart = IsState} = OldTeam] ->
			case lists:keyfind(RoleID, #recCrosTeamInfo.roleID, Members) of
				false ->
					playerState:setCrosCamp(0),
					?ERROR_OUT("player [~p] offline, team id [~p]",[RoleID, TeamID]),
					ok;
				#recCrosTeamInfo{isHeader = Header} ->
					case IsState of
						?MatchState ->
							psMgr:sendMsg2PS(?PsNameCrosArena, cancelMatch, {RoleID, TeamID, gsMainLogic:getDBID4GS()});
						_ ->
							skip
					end,
					delTeamMember(TeamID, RoleID, OldTeam, Header),
					sendTeamerDelState(Members, true, RoleID)
			end;
		_ ->
			playerState:setCrosCamp(0),
			?ERROR_OUT("player [~p] offline1, team id [~p]",[RoleID, TeamID]),
			ok
	end.

%%玩家上线重置积分
-spec onlineUpdateInte() -> ok.
onlineUpdateInte() ->
	Now = time:getLocalNowSec1970(),
	%%本周第一秒
	FirstSec = time:getWeekBeginSecondsByDay(time:getLocalNowDateTime1970()),
	
	%%本周一更新时间
	LocalWeek = FirstSec + 4 * ?OneHourSec,
	
	LastUpdateTime = playerPropSync:getProp(?SerProp_CrosArenaTickTime),
	
	if
		LastUpdateTime >= LocalWeek ->
			skip;
		Now >= LocalWeek ->
			%%重置
			playerPropSync:setProp(?PriProp_CrosArenaInte, 0),
			playerPropSync:setProp(?SerProp_CrosArenaTickTime, Now),
			?LOG_OUT("player [~ts] reset cros arena inte",[	playerState:getName()]);
		true ->
			skip
	end,	
	ok.

%%状态设备
-spec dealCrossState(ArenaVal::uint()) ->ok.
dealCrossState(ArenaVal) ->
	RoleID = playerState:getRoleID(),
	TeamID = playerState:getCrosTeamID(),

	?WARN_OUT("dealCrossState roleid:~p teamid:~p",[RoleID,TeamID]),
	%%更新段位
	CurArenaVal = playerPropSync:getProp(?PriProp_CrosArenaInte),
	playerPropSync:setProp(?PriProp_CrosArenaInte, CurArenaVal + ArenaVal),

	%%房间进入准备状态
	playerCrosTeam:endBattleCancelReady(CurArenaVal + ArenaVal, RoleID, TeamID),
	ok.

%%本场跨服竞技场结束奖励
-spec dealCrosAreadReward(BattleRes::term(), GoodsID::uint(), GoodsNum::uint(), ArenaVal::term()) ->ok.
dealCrosAreadReward(BattleRes, GoodsID, GoodsNum, ArenaVal) ->
	dealCrossState(ArenaVal),
	RoleID = playerState:getRoleID(),
	%%发送邮件
	MaxNumber = globalCfg:getArenaRewardNumber(),
	CurRewardNum = playerDaily:getDailyCounter(?DailyType_CrosRewardNum, 0),
	case CurRewardNum >= MaxNumber of
		false ->

			ML = case playerMail:createMailGoods(GoodsID, GoodsNum, true, 0, RoleID, ?ItemSourceCrosArenaReward) of
				     [#recMailItem{itemID = ItemID}|_] = MailItemList ->
					     case goods:getGoodsCfg(ItemID) of
						     #itemCfg{name = Name} ->
							     ItemName = Name;
						     _ ->
							     ItemName = ""
					     end,
					     MailItemList;
				     _ ->
					     ItemName = "",
					     []
			     end,
			case BattleRes of
				0 ->
					WinTitle = stringCfg:getString(arena_Win_MailTitle),
					WinContent = stringCfg:getString(arena_Win_MailContent, [ItemName, MaxNumber - CurRewardNum - 1]),
					mail:sendSystemMail(RoleID, WinTitle, WinContent, ML, "");
				_ ->
					FailTitle = stringCfg:getString(arena_Lose_MailTitle),
					FailContent = stringCfg:getString(arena_Lose_MailContent, [ItemName, MaxNumber - CurRewardNum - 1]),
					mail:sendSystemMail(RoleID, FailTitle, FailContent, ML, "")
			end,
			playerDaily:incDailyCounter(?DailyType_CrosRewardNum, 0);
		_ ->
			skip
	end,
	ok.
