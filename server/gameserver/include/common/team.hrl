-ifndef(TEAM_HRL).
-define(TEAM_HRL,1).

-define(CreateTeamCaptain, 1).		%% 
-define(CreateTeamMember, 2).		%%

%% 邀请入队
-define(InviteTeamTypeInviteJoin, 1).
%% 申请入队
-define(InviteTeamTypeRequestJoin, 2).
%% T人
-define(KickTeamMember, 3).
%% 给予队长
-define(GiveLeaderToMember, 4).

%% 队伍最大人数
-define(MAX_TeamMemberNum, 4).

-define(TeamDisAgree, 0).
-define(TeamAgree, 1).

-define(NearRequestCD, 3).
-define(NearDistance, 32).
%%服务器队伍的类型，决定队伍的属性
-define(TeamTypeNormal, 0).%%普通队伍（五分钟没有人就会删除，可以任意换队长）
-define(TeamTypeSystem, 1).%%系统队伍（服务器逻辑去删除和创建,只在服务器内部使用，不可换队长）
-define(TeamTypePlayLogic, 2).%%灵魂伙伴玩法队伍（玩家去删除和创建，不可换队长）

%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
%% 队员点击同意开始副本的时间
-define(AckStartCopyMapTimeOut, 15).
%% 系统自动匹配tick时间
-define(TeamTickTime, 5000).
-define(InQueueTime, 30*1000).

-define(Ets_TeamList, teamEts_).
-define(Ets_RoleIDRefTeamID, roleIDRefTeamIDEts_).
-define(Ets_RoleMatchTeam, roleMatchTeamEts_).

%% 每个tick处理自动匹配30个人
-define(MatchTickControl, 30).

-define(MatchState_NotIn, 0).
-define(MatchState_TimeOut, 1).
-define(MatchState_InQueue, 2).

%%% 队伍操作
%%% 1(创建, 副本ID);2(邀请加入,目标角色ID); 3(快速入队,队伍ID)
%%% 4(T人，队员ID);5(转移队长,队员ID);6(队长改变副本ID,副本ID)
%%% 7(开始副本,*);8(离队,*);9(队伍是否能被别人搜索到 0|1) 默认1表示能被别人搜索
%%% 10(解散队伍,*); 11(查询系统是否在自动为我匹配队伍, *)
%%% 12(响应队长开始副本, 0|1) 1表示同意
%%% 13(取消系统自动为我匹配队伍, *)
%%% 14(发送组队链接消息, 聊天频道)
%%% 15(快速组队, 目标角色ID, 副本ID)
-define(TeamOP_Create, 1).
-define(TeamOP_Invite, 2).
-define(TeamOP_FastJoin, 3).
-define(TeamOP_Kick, 4).
-define(TeamOP_ChangeLeader, 5).
-define(TeamOP_ChangeCopyMap, 6).
-define(TeamOP_StartCopyMap, 7).
-define(TeamOP_LeaveTeam, 8).
-define(TeamOP_SetSearchFlag, 9).
-define(TeamOP_Dismiss, 10).
-define(TeamOP_QueryMatchState, 11).
-define(TeamOP_MemberAckStartCopyMap, 12).
-define(TeamOP_CancelMatchTeam, 13).
-define(TeamOP_SendTeamQuickInfo, 14).
-define(TeamOP_FastCreate, 15).
-define(TeamOP_LeaveTeamAndEnterCopy, 16).

%% 附近的人
-define(Search_Online, 1).
-define(Search_Nearby, 2).
-define(Search_Friend, 3).
-define(Search_Guild, 4).

-define(SearchList_Max, 20).
-define(SearchRange_Max, 300).

%%%-------------------------------------------------------------------
%%%-------------------------------------------------------------------
-record(recTeamMemberInfo, {
	roleID = 0, 			%%角色ID
	code = 0,				%%角色流水号
	name = "", 				%%角色名
	guildID = 0,            %%帮会ID
	guildName = "",         %%帮会名字
	career = 0, 			%%职业
    race = 0,               %%种族
    sex = 0,                %%性别
	head = 0,               %%头
	level = 0, 				%%等级
	pid = 0,				%%进程ID
	netPid = 0,				%%其网络进程的ID
	mapID = 0,				%%当前所在地图ID
	groupID = 0,            %%组ID
	posX = 0,				%%X坐标
	posY = 0,				%%Y坐标
	mapPid = 0,				%%当头所在地图的PID
	hpPc = 100,             %%当前血量百分比
%%	petInfo = [],			%%宠物信息 [{petCode, petPid} | _]
	customInfo = "",		%%扩展消息
%%	isLeader = false,      %%是队长
%%	teamID = 0,             %%队伍id
	targetMapCount = 0,     %%目标副本次数
	actionPoint = 0,        %%体力值
	fightingCapacity = 0	%%战斗力
}).

-record(recTeamInfo,{
	teamID = 0,
	copyMapID = 0,
	leaderID = 0,
	leaderStartCopyTime = 0,
	canBeSearch = 1, %% 默认可以被搜索
	searchStartTime = 0,
	ackStartCopyRoleList = [],
	memberList = []
}).

-record(recSyncMemberInfo,{
	roleID = 0,
	code = 0,
	pid = undefined,
	netPid = undefined,
	level = 0,
	guildID = 0,
	guildName = "",
	mapID = 0,
	groupID = 0,            %%组ID
	mapPID = undefined,
	posX = 0,				%%X坐标
	posY = 0,				%%Y坐标
	hpPc = 0,
	force = 0,
	actionPoint = 0,
	targetMapCount = 0
}).

-record(recRoleRefTeamID,{
	roleID = 0,
	teamID = 0
}).

-record(recRoleMatchTeam,{
	roleID = 0,
	pid = undefined,
	startTime = 0,
	queueTimeEndMs = 0,
	mapList = []
}).


-endif.
