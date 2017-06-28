%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%% 注意这个取ETS的，可能会存在一定的不准确性
%%% 如果要取得准确信息，需要通过teamotp返回
%%% 这个模块导出的所有函数可被多进程调用
%%% @end
%%% Created : 05. 五月 2017 14:42
%%%-------------------------------------------------------------------
-module(teamInterface).
-author("Administrator").

-include("setup.hrl").
-include("gsInc.hrl").

%% API
-export([
	%% 是否是队长
	isTeamLeader/1,
	%% 是否有队伍
	isInTeam/1,
	%% 两个角色是否是队友
	isInSameTeam/2,
	%% 队伍是否满员，如果队伍不存在返回false
	isTeamFullWithTeamID/1
]).

-export([
	%% 获取队伍ID
	getTeamID/1,
	%% 取得队伍的队长ID（使用队伍ID)
	getLeaderIDWithTeamID/1,
	%% 取得队伍的队长ID（使用角色ID)
	getLeaderIDWithRoleID/1,
	%% 取得队伍信息（使用角色ID)
	getTeamInfoWithRoleID/1,
	%% 取得队伍信息（使用队伍ID)
	getTeamInfoWithTeamID/1,
	getTeamMemberInfoListWithRoleID/1,
	getTeamMemberInfoListWithTeamID/1,
	%% 获取队伍人数
	getTeamMemberCountWithRoleID/1,
	getTeamMemberCountWithRoleID/2,
	getTeamMemberCountWithTeamID/1,
	%% 队伍成员RoleID列表
	getTeamMemberRoleIDListWithTeamID/1,
	getTeamMemberRoleIDListWithRoleID/1,
	getTeamMemberRoleIDListInSameMapWithRoleID/3,
	%% 队伍成员NetPid列表
	getTeamMemberNetPidListWithTeamID/1,
	getTeamMemberNetPidListWithRoleID/1,
	%% 队伍成员Pid列表
	getTeamMemberPidListWithTeamID/1,
	getTeamMemberPidListWithRoleID/1,
	getTeamMemberPidListInSameMapWithRoleID/3
]).

-export([
	%% 查询自己自动匹配状态
	queryMatchState/1,
	%% 查询能被匹配的队伍列表
	queryTeamList/1
]).

-export([
	%% 给队友的进程发送消息 （使用角色ID)
	sendMsg2TeamWithRoleID/4,
	%% 对队员发送网络消息 （使用角色ID)
	sendNetMsg2TeamWithRoleID/3,
	%% 给同一地图队员的进程发送消息 （使用角色ID)
	sendMsg2TeamInSameMapWithRoleID/5,
	%% 对同一地图队员发送网络消息 （使用角色ID)
	sendNetMsg2TeamInSameMapWithRoleID/4
]).

%% 打包信息
-export([
	makeTeamInfoMsg/1,
	makeNetTeamBaseInfo/1,
	makeNetMemberInfo/1,
	makeNetMemberSnapshotInfo/1,
	isTeamStartCopyMapAcking/1
]).

%% 查询自己自动匹配状态
queryMatchState(RoleID) ->
	case teamInterface:isInTeam(RoleID) of
		true ->
			?MatchState_NotIn;
		_ ->
			case myEts:readRecord(?Ets_RoleMatchTeam, RoleID) of
				#recRoleMatchTeam{startTime = StartTime} ->
					{?MatchState_InQueue, StartTime};
				_ ->
					{?MatchState_NotIn, 0}
			end
	end.
%% 根据队伍ID匹配队伍数量
queryTeamList([]) ->
	[];
queryTeamList(MapIDList) ->
	List = ets:tab2list(?Ets_TeamList),
	[R || #recTeamInfo{
		canBeSearch = SearchFlag,
		copyMapID = CopyMapID,
		memberList = ML,
		ackStartCopyRoleList = AL
	} = R <- List
		, CopyMapID =/= 0
		, SearchFlag =/= 0
		, lists:member(CopyMapID, MapIDList)
		, length(ML) < ?MAX_TeamMemberNum
		, length(AL) =:= 0].

%% 是否是队长
isTeamLeader(RoleID) ->
	case read_team_info_by_role(RoleID) of
		#recTeamInfo{leaderID = RoleID} ->
			true;
		_ ->
			false
	end.

%% 是否有队伍
isInTeam(RoleID) ->
	read_team_id_by_role(RoleID) =/= 0.

%% 两个人是否在同一个队伍
isInSameTeam(RoleID, TargetRoleID) ->
	TID1 = read_team_id_by_role(RoleID),
	TID2 = read_team_id_by_role(TargetRoleID),
	TID1 =:= TID2 andalso TID1 > 0.

%%
isTeamFullWithTeamID(TeamID)->
	case read_team_info_by_tid(TeamID) of
		#recTeamInfo{memberList = ML}->
			erlang:length(ML) >= ?MAX_TeamMemberNum;
		_ ->
			false
	end.

%% 队伍ID
getTeamID(RoleID) ->
	read_team_id_by_role(RoleID).

%% 取得队伍的队长
getLeaderIDWithTeamID(TeamID) ->
	case read_team_info_by_tid(TeamID) of
		#recTeamInfo{leaderID = Leader} ->
			Leader;
		_ ->
			0
	end.

%% 取得队伍的队长
getLeaderIDWithRoleID(RoleID) ->
	case read_team_info_by_role(RoleID) of
		#recTeamInfo{leaderID = Leader} ->
			Leader;
		_ ->
			0
	end.

%% 返回队伍信息
getTeamInfoWithRoleID(RoleID) ->
	read_team_info_by_role(RoleID).

getTeamInfoWithTeamID(TeamID) ->
	read_team_info_by_tid(TeamID).

getTeamMemberInfoListWithRoleID(RoleID) ->
	case read_team_info_by_role(RoleID) of
		#recTeamInfo{memberList = ML} ->
			ML;
		_ ->
			[]
	end.

getTeamMemberInfoListWithTeamID(TeamID) ->
	case read_team_info_by_tid(TeamID) of
		#recTeamInfo{memberList = ML} ->
			ML;
		_ ->
			[]
	end.

%% 返回成员数量
getTeamMemberCountWithRoleID(RoleID) ->
	case read_team_info_by_role(RoleID) of
		#recTeamInfo{memberList = ML} ->
			erlang:length(ML);
		_ ->
			0
	end.

getTeamMemberCountWithTeamID(TeamID) ->
	case read_team_info_by_tid(TeamID) of
		#recTeamInfo{memberList = ML} ->
			erlang:length(ML);
		_ ->
			0
	end.

getTeamMemberCountWithRoleID(RoleID, IncludeSelf) ->
	case read_team_info_by_role(RoleID) of
		#recTeamInfo{memberList = ML} when IncludeSelf ->
			erlang:length(ML);
		#recTeamInfo{memberList = ML} ->
			erlang:length(ML) - 1;
		_ ->
			0
	end.

%%%-------------------------------------------------------------------
%% 给所有队员的进程发消息
sendMsg2TeamWithRoleID(RoleID, MsgID, Info, IncludeSelf) ->
	TID = read_team_id_by_role(RoleID),
	PIDList = read_team_member_pid_by_tid(TID, RoleID, IncludeSelf),
	lists:foreach(
		fun(Pid) ->
			psMgr:sendMsg2PS(Pid, MsgID, Info)
		end, PIDList),
	ok.

%% 给所有队员发送网络消息
sendNetMsg2TeamWithRoleID(RoleID, NetMsg, IncludeSelf) ->
	TID = read_team_id_by_role(RoleID),
	NetPidList = read_team_member_net_pid_by_tid(TID, RoleID, IncludeSelf),
	lists:foreach(
		fun(NetPid) ->
			playerMsg:sendNetMsg(NetPid, NetMsg)
		end, NetPidList),
	ok.

%% 给同一地图的队员进程发消息
sendMsg2TeamInSameMapWithRoleID(_RoleID, undefined, _MsgID, _Info, _IncludeSelf) ->
	skip;
sendMsg2TeamInSameMapWithRoleID(RoleID, PlayerEts, MsgID, Info, IncludeSelf) ->
	TID = read_team_id_by_role(RoleID),
	CodeList =  read_team_member_code_by_tid(TID, RoleID, IncludeSelf),
	lists:foreach(
		fun(Code) ->
			case myEts:readRecord(PlayerEts, Code) of
				#recMapObject{pid = Pid} ->
					psMgr:sendMsg2PS(Pid, MsgID, Info);
				_ ->
					skip
			end
		end, CodeList),
	ok.

%% 给同一地图的队员进程发网络消息
sendNetMsg2TeamInSameMapWithRoleID(_RoleID, undefined, _NetMsg, _IncludeSelf) ->
	skip;
sendNetMsg2TeamInSameMapWithRoleID(RoleID, PlayerEts, NetMsg, IncludeSelf) ->
	TID = read_team_id_by_role(RoleID),
	CodeList = read_team_member_code_by_tid(TID, RoleID, IncludeSelf),
	lists:foreach(
		fun(Code) ->
			case myEts:readRecord(PlayerEts, Code) of
				#recMapObject{netPid = NetPid} ->
					playerMsg:sendNetMsg(NetPid, NetMsg);
				_ ->
					skip
			end
		end, CodeList),
	ok.

%% 所有队员的NetPID
getTeamMemberNetPidListWithTeamID(TeamID) ->
	read_team_member_net_pid_by_tid(TeamID, 0).

getTeamMemberNetPidListWithRoleID(RoleID) ->
	TeamID = read_team_id_by_role(RoleID),
	read_team_member_net_pid_by_tid(TeamID, 0).

%% 所哟队员的PID
getTeamMemberPidListWithTeamID(TeamID) ->
	read_team_member_pid_by_tid(TeamID, 0).

getTeamMemberPidListWithRoleID(RoleID) ->
	TeamID = read_team_id_by_role(RoleID),
	read_team_member_pid_by_tid(TeamID, 0).

getTeamMemberPidListInSameMapWithRoleID(_RoleID, undefined, _IncludeSelf)->
	[];
getTeamMemberPidListInSameMapWithRoleID(RoleID, PlayerEts, IncludeSelf)->
	TID = read_team_id_by_role(RoleID),
	CodeList = read_team_member_code_by_tid(TID, RoleID, IncludeSelf),
	lists:foldl(
		fun(Code, ACC) ->
			case myEts:readRecord(PlayerEts, Code) of
				#recMapObject{pid = Pid} ->
					[Pid | ACC];
				_ ->
					ACC
			end
		end, [], CodeList).

%% 所有队员的RoleID
getTeamMemberRoleIDListWithTeamID(TeamID) ->
	ML = read_member_list_by_tid(TeamID),
	[RoleID || #recTeamMemberInfo{roleID = RoleID} <- ML].

getTeamMemberRoleIDListWithRoleID(RoleID) ->
	ML = read_member_list_by_role(RoleID),
	[MemberID || #recTeamMemberInfo{roleID = MemberID} <- ML].


getTeamMemberRoleIDListInSameMapWithRoleID(_RoleID, undefined, _IncludeSelf)->
	[];
getTeamMemberRoleIDListInSameMapWithRoleID(RoleID, PlayerEts, IncludeSelf)->
	TID = read_team_id_by_role(RoleID),
	CodeList =
		case IncludeSelf of
			true ->
				read_team_member_code_by_tid(TID, 0);
			_ ->
				read_team_member_code_by_tid(TID, RoleID)
		end,
	lists:foldl(
		fun(Code, ACC) ->
			case myEts:readRecord(PlayerEts, Code) of
				#recMapObject{id = ID} ->
					[ID | ACC];
				_ ->
					ACC
			end
		end, [], CodeList).

%% 组装信息
makeTeamInfoMsg(#recTeamInfo{
	memberList = MemberList
} = TeamInfo) ->
	#pk_GS2U_MyTeamInfo{
		base = makeNetTeamBaseInfo(TeamInfo),
		infos = memberListToNetMemberList(MemberList)
	}.

memberListToNetMemberList(List) ->
	[makeNetMemberInfo(Info) || Info <- List].

makeNetMemberInfo(#recTeamMemberInfo{
	roleID = RoleID,
	name = Name,
	guildID = GuildID,
	guildName = GuildName,
	code = Code,
	fightingCapacity = Force,
	career = Career,
	race = Race,
	sex = Sex,
	head = Head,
	level = Level,
	hpPc = HpPc,
	mapID = MapID,
	groupID = GroupID,
	mapPid = MapPid,
	posX = X,
	posY = Y,
	actionPoint = AV,
	targetMapCount = EnterCount,
	customInfo = CustomInfo
}) ->
	#pk_TeamMemberInfo{                                                                                           
		playerID = RoleID,
		code = Code,
		playerName = Name,
		guildID = GuildID,
		guildName = GuildName,
		force = Force,
		level = Level,
		career = Career,
		race = Race,
		sex = Sex,
		head = Head,
		hpPercent = HpPc,
		mapID = MapID,
		groupID = GroupID,
		mapInstanceID = misc:pid_to_integer(MapPid),
		x = X,
		y = Y,
		customInfo = CustomInfo,
		copyMapLeftCount = EnterCount,
		actionPoint = AV
	}.

makeNetMemberSnapshotInfo(#recTeamMemberInfo{
	roleID = RoleID,
	code = Code,
	name = Name,
	level = Level,
	career = Career,
	race = Race,
	sex = Sex,
	head = Head
}) ->
	#pk_TeamMemberSnapshot{
		playerID = RoleID,
		code = Code,
		playerName = Name,
		career = Career,
		level = Level,
		race = Race,
		sex = Sex,
		head = Head,
		force = 0
	}.

makeNetTeamBaseInfo(#recTeamInfo{
	teamID = TeamID,
	copyMapID = CopyMapID,
	leaderID = LeaderID,
	canBeSearch = CanBeSearch,
	searchStartTime = SearchStartTime
}) ->
	#pk_TeamBaseInfo{
		teamID = TeamID,
		copyMapID = CopyMapID,
		leaderID = LeaderID,
		canBeSearched = CanBeSearch,
		searchStartTime = SearchStartTime
	}.

isTeamStartCopyMapAcking(#recTeamInfo{ackStartCopyRoleList = []})->
	false;
isTeamStartCopyMapAcking(#recTeamInfo{leaderStartCopyTime = ST})->
	time2:getTimestampSec() < ST + ?AckStartCopyMapTimeOut;
isTeamStartCopyMapAcking(_)->
	false.

%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
%%% 下面的函数不要导出
read_team_member_pid_by_tid(TeamID, _FilterRole, true)->
	read_team_member_pid_by_tid(TeamID, 0);
read_team_member_pid_by_tid(TeamID, FilterRole,_IncludeSelf)->
	read_team_member_pid_by_tid(TeamID, FilterRole).

read_team_member_pid_by_tid(0, _FilterRole) ->
	[];
read_team_member_pid_by_tid(TeamID, FilterRole) ->
	ML = read_member_list_by_tid(TeamID),
	[Pid || #recTeamMemberInfo{pid = Pid, roleID = RoleID} <- ML
		, is_pid(Pid)
		, misc:is_process_alive(Pid)
		, RoleID =/= FilterRole].
%%%-------------------------------------------------------------------

read_team_member_net_pid_by_tid(TeamID, _FilterRole, true) ->
	read_team_member_net_pid_by_tid(TeamID, 0);
read_team_member_net_pid_by_tid(TeamID, FilterRole, _IncludeSelf) ->
	read_team_member_net_pid_by_tid(TeamID, FilterRole).

read_team_member_net_pid_by_tid(0, _FilterRole) ->
	[];
read_team_member_net_pid_by_tid(TeamID, FilterRole) ->
	ML = read_member_list_by_tid(TeamID),
	[NetPid || #recTeamMemberInfo{netPid = NetPid, roleID = RoleID} <- ML
		, is_pid(NetPid)
		, misc:is_process_alive(NetPid)
		, RoleID =/= FilterRole].

%%%-------------------------------------------------------------------
read_team_member_code_by_tid(TeamID, _FilterRole, true) ->
	read_team_member_code_by_tid(TeamID, 0);
read_team_member_code_by_tid(TeamID, FilterRole, _IncludeSelf) ->
	read_team_member_code_by_tid(TeamID, FilterRole).

read_team_member_code_by_tid(0, _FilterRole) ->
	[];
read_team_member_code_by_tid(TeamID, FilterRole) ->
	ML = read_member_list_by_tid(TeamID),
	[Code || #recTeamMemberInfo{code = Code, roleID = RoleID} <- ML
		, RoleID =/= FilterRole].

%%%-------------------------------------------------------------------
read_member_list_by_tid(0) ->
	[];
read_member_list_by_tid(TeamID) ->
	case read_team_info_by_tid(TeamID) of
		#recTeamInfo{memberList = ML} ->
			ML;
		_ ->
			[]
	end.

%%%-------------------------------------------------------------------
read_member_list_by_role(0) ->
	[];
read_member_list_by_role(RoleID) ->
	case read_team_info_by_role(RoleID) of
		#recTeamInfo{memberList = ML} ->
			ML;
		_ ->
			[]
	end.

%%%-------------------------------------------------------------------
read_team_id_by_role(0) ->
	0;
read_team_id_by_role(RoleID) ->
	case catch myEts:readRecord(?Ets_RoleIDRefTeamID, RoleID) of
		#recRoleRefTeamID{teamID = TeamID} ->
			TeamID;
		_ ->
			0
	end.

%%%-------------------------------------------------------------------
read_team_info_by_tid(0) ->
	undefined;
read_team_info_by_tid(TeamID) ->
	case catch myEts:readRecord(?Ets_TeamList, TeamID) of
		#recTeamInfo{} = TeamInfo ->
			TeamInfo;
		_ ->
			undefined
	end.
%%%-------------------------------------------------------------------
read_team_info_by_role(0) ->
	undefined;
read_team_info_by_role(RoleID) ->
	TID = read_team_id_by_role(RoleID),
	read_team_info_by_tid(TID).








