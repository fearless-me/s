%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2017, raink
%%% @doc
%%% 跨服骑宠竞速_逻辑模块
%%% @end
%%% Created : 20170906
%%%-------------------------------------------------------------------
-module(cacRaceLogic).
-author("meitianyang").

-include("cacRacePrivate.hrl").

%% callback
-export([
	init/0,						%% 活动进程初始化
	tick/0,						%% 心跳响应
	activityChangeCallBack/1,	%% 活动状态改变回调
	createActivityMapAck/1,		%% 创建地图成功回调
	activityMapMsg/1,			%% 活动地图常用事件回调

	gather/1,					%% 采集
	item/1,						%% 使用道具
	giveUp/1,					%% 弃赛

	mail/1						%% 归属服收到来自跨服的邮件发奖消息
]).

%%%-------------------------------------------------------------------
% callback:本服收到来自跨服的邮件发奖消息
-spec mail({RoleID::uint64(), SortID::uint()}) -> no_return().
mail({RoleID, 0}) ->		%% 安慰奖
	#globalsetupCfg{setpara = [{ItemID, ItemCount}]} =
		getCfg:getCfgPStack(cfg_globalsetup, race_rewardB),
	MailItemList = playerMail:createMailGoods(ItemID, ItemCount, true, 0, RoleID, ?ItemSourceCrossRace),
	Title = stringCfg:getString(raceRewardBTitle),
	Content = stringCfg:getString(raceRewardBContent),
	mail:sendSystemMail(RoleID, Title, Content, MailItemList, "");
mail({RoleID, SortID}) ->	%% 名次奖
	#globalsetupCfg{setpara = ListReward} =
		getCfg:getCfgPStack(cfg_globalsetup, race_rewardA),
	{ItemID, ItemCount} = lists:nth(SortID, ListReward),
	MailItemList = playerMail:createMailGoods(ItemID, ItemCount, true, 0, RoleID, ?ItemSourceCrossRace),
	Title = stringCfg:getString(raceRewardATitle),
	Content = stringCfg:getString(raceRewardAContent, [SortID]),
	mail:sendSystemMail(RoleID, Title, Content, MailItemList, "").

%%%-------------------------------------------------------------------
% callback:活动进程初始化
-spec init() -> no_return().
init() ->
	case cacRaceState:getInit() of
		true ->
			skip;
		_ ->
			cacRaceState:resetMod(),	%% 这里是初始化
			ets:new(?EtsMapInfo, [named_table, private, set, {keypos, #recRace.id}]),
			erlang:send_after(?TickTime, self(), tick)
	end.

%%%-------------------------------------------------------------------
% callback:心跳响应
-spec tick() -> no_return().
tick() ->
	erlang:send_after(?TickTime, self(), tick),
	TimeNow = time:getSyncTimeFromDBS(),
	tick(ets:tab2list(?EtsMapInfo), TimeNow).
tick([], _TimeNow) ->
	ok;
tick([#recRace{time = TimeLine} = H | T], TimeNow) when TimeNow >= TimeLine ->
	timeout(H, TimeNow),
	tick(T, TimeNow);
tick([_H | T], TimeNow) ->
	tick(T, TimeNow).

%%%-------------------------------------------------------------------
% callback:采集
-spec gather({RoleID::uint64(), GatherID::uint16()}) -> no_return().
gather({RoleID, GatherID}) ->
	MapInfo = cacRaceState:queryMapInfoByRoleID(RoleID),
	gatherDo(MapInfo, RoleID, GatherID).

%%%-------------------------------------------------------------------
% callback:使用道具
-spec item({RoleID::uint64(), ItemID::uint8()}) -> no_return().
item({RoleID, ItemID}) ->
	MapInfo = cacRaceState:queryMapInfoByRoleID(RoleID),
	itemDo(MapInfo, RoleID, ItemID).

%%%-------------------------------------------------------------------
% callback:弃赛
-spec giveUp({RoleID::uint64(), Reason::uint()}) -> no_return().
giveUp({RoleID, Reason}) ->
	MapInfo = cacRaceState:queryMapInfoByRoleID(RoleID),
	giveUpDo(MapInfo, RoleID, Reason).

%%%-------------------------------------------------------------------
% callback:心跳响应
-spec activityChangeCallBack(Phase::uint()) -> no_return().
activityChangeCallBack(?ActivityPhase_Close) ->	%% 活动结束
	case cacRaceState:resetMod() of
		{true, Mod} ->
			%% 新的模式需要通知大家
			activityMgrLogicCross:crossBroadcastAllServerRole(race_mod, Mod);
		_ ->
			skip
	end;
activityChangeCallBack(?ActivityPhase_Apply) ->	%% 报名阶段开始
	skip;
activityChangeCallBack(?ActivityPhase_Race) ->	%% 报名截止，比赛开始
	cacRaceState:resetMilestoneMax(),	%% 重置最大里程碑
	cacRaceState:resetItemRand(),		%% 重置道具随机概率
	%% 缓存并通知活动管理者清除相关报名数据
	Match = ets:fun2ms(fun(#recCrossApply{activityType = ActivityType} = R) when ActivityType =:= ?ActivityType_CrossRace -> R end),
	ListApply = ets:select(?EtsCrossApply, Match),
	core:sendMsgToActivityMgrCross(cac_applyEnd, ?ActivityType_CrossRace),
	%% 匹配并创建地图，对未匹配成功的报名组需要特殊处理
	{ListMatch, ListSpecial} = activityMgrLogicCross:match(ListApply, ?ActivityType_CrossRace),
	TimeNow = time:getSyncTimeFromDBS(),
	createActivityMap(ListMatch, TimeNow),
	specialApply(ListSpecial).

%%%-------------------------------------------------------------------
% callback:创建地图成功（比?ACMapMsg_CreateMap更先收到）
-spec createActivityMapAck({MapID::uint(), ListMapPid::list(), ID::uint()}) -> no_return().
createActivityMapAck({?CrossRaceMapID, [MapPid], ID} = _Data) ->
	case cacRaceState:queryMapInfo(ID) of
		#recRace{state = ?State_Creating} = R ->
			%% 记录地图Pid，等待?ACMapMsg_CreateMap消息再切换状态
			cacRaceState:replaceMapInfo(R#recRace{mapPid = MapPid});
		_T ->
			%% 错误的创建，强制关闭
			?ERROR_OUT("createActivityMapAck map already is exists! will resetCopyMap _T:~w _Data:~w", [_T, _Data]),
			psMgr:sendMsg2PS(MapPid, resetCopyMap, {})
	end.

%%%-------------------------------------------------------------------
% callback:活动地图常用事件回调
-spec activityMapMsg({MsgType::uint(), Data::term()}) -> no_return().
% 创建地图后的初始化
activityMapMsg({?ACMapMsg_CreateMap, {_CreateRoleID, ?CrossRaceMapID, MapPid, PlayerEts, MonsterEts, CollectEts, NpcEts} = _Data}) ->
	case cacRaceState:queryMapInfoByMapPid(MapPid) of
		#recRace{state = ?State_Creating, teams = Teams} = R ->
			%% 完成初始化，切换地图状态，通知选手入场
			#globalsetupCfg{setpara = [ReadyTime, _WaitTime, _SettleTime]} =
				getCfg:getCfgPStack(cfg_globalsetup, race_time_wait),
			RNew = R#recRace{
				state = ?State_Ready,
				time = time:getSyncTimeFromDBS() + ReadyTime,
				playerEts = PlayerEts,
				monsterEts = MonsterEts,
				collectEts = CollectEts,
				npcEts = NpcEts
			},
			cacRaceState:replaceMapInfo(RNew),
			noticePlayerEnter(Teams, MapPid);
		_T ->
			%% 错误的创建，强制关闭
			?ERROR_OUT("activityMapMsg ?ACMapMsg_CreateMap map already is exists! will resetCopyMap _T:~w _Data:~w", [_T, _Data]),
			psMgr:sendMsg2PS(MapPid, resetCopyMap, {})
	end;
% 销毁地图后的通知
activityMapMsg({?ACMapMsg_DestoryMap, MapPid}) ->
	case cacRaceState:queryMapInfoByMapPid(MapPid) of
		#recRace{} = R ->
			cacRaceState:deleteMapInfo(R);
		_ ->
			skip
	end;
% 角色进入
activityMapMsg({?ACMapMsg_PlayerEnter, {RoleID, MapPid, #recMapObject{pid = Pid, netPid = NetPid}}}) ->
	case cacRaceState:queryMapInfoByMapPid(MapPid) of
		#recRace{state = ?State_Ready, time = Time, teams = Teams} ->
			%% 仅允许在准备倒计时阶段进入
			{Mod, _} = cacRaceState:getMod(),
			Msg = #pk_GS2U_RaceMapState_Sync{
				type = Mod,
				state = ?State_Ready,
				sec = Time - time:getSyncTimeFromDBS(),
				info = Teams
			},
			playerMsg:sendNetMsg(NetPid, Msg),
			%% 尝试上马
			case queryRoleFromTeam(Teams, RoleID) of
				{Team, _Role, IsLeader} ->
					tryMount(Team, Pid, IsLeader);
				_ ->
					skip
			end;
		#recRace{state = State} ->
			%% 其它情况很遗憾，只能退回普通服
			?ERROR_OUT("RoleID:~w want enter but State:~w", [RoleID, State]),
			psMgr:sendMsg2PS(Pid, backGS, 0);
		_ ->
			%% 其它情况很遗憾，只能退回普通服
			?ERROR_OUT("RoleID:~w want enter but can find map:~w", [RoleID, MapPid]),
			psMgr:sendMsg2PS(MapPid, resetCopyMap, {})
	end;
% 角色离开
activityMapMsg({?ACMapMsg_PlayerLeave, {RoleID, MapPid, #recMapObject{}}}) ->
	playerOfflineOrLeave(MapPid, RoleID, ?GiveUpReason_LeaveMap);
% 角色离线
activityMapMsg({?ACMapMsg_Offline, {RoleID, MapPid}}) ->
	playerOfflineOrLeave(MapPid, RoleID, ?GiveUpReason_Offline);
% 不应该有其它消息
activityMapMsg({ErrorType, ErrorData}) ->
	?ERROR_OUT("msg:~w,~w", [ErrorType, ErrorData]).

%%%-------------------------------------------------------------------
% internal:尝试上马
-spec tryMount(Team::#pk_RaceTeamEx{}, Pid::pid(), IsLeader::boolean()) -> no_return().
tryMount(#pk_RaceTeamEx{base = #pk_RaceTeamBase{members = Members, petID = PetID}}, Pid, IsLeader) ->
	psMgr:sendMsg2PS(Pid, race_tryMount, {IsLeader, PetID, [RoleID || #pk_CrossRoleBase{id = RoleID} <- Members], true}).

%%%-------------------------------------------------------------------
 %internal:通知地图上所有角色
-spec sendMsg2Role(EtsPlayer::etsTab(), MsgID::term(), Msg::term()) -> no_return().
sendMsg2Role(EtsPlayer, MsgID, Msg) ->
	FunSend =
		fun(#recMapObject{pid = Pid}, _) ->
			psMgr:sendMsg2PS(Pid, MsgID, Msg)
		end,
	ets:foldl(FunSend, 0, EtsPlayer).
-spec sendNetMsg2Role(EtsPlayer::etsTab(), Msg::term()) -> no_return().
sendNetMsg2Role(EtsPlayer, Msg) ->
	FunSend =
		fun(#recMapObject{netPid = NetPid}, _) ->
			playerMsg:sendNetMsg(NetPid, Msg)
		end,
	ets:foldl(FunSend, 0, EtsPlayer).

%%%-------------------------------------------------------------------
% internal:创建地图
-spec createActivityMap(ListMatch::[[#recCrossApply{}, ...], ...], TimeNow::uint32()) -> no_return().
createActivityMap([], _TimeNow) ->
	ok;
createActivityMap([H | T], TimeNow) ->
	ID = cacRaceState:newID(),
	MapInfo =
		#recRace{
			id = ID,
			teams = [crossApply2RaceTeamEx(R) || R <- H],
			time = TimeNow + ?WaitTime
		},
	cacRaceState:replaceMapInfo(MapInfo),
	core:sendMsgToMapMgr(?CrossRaceMapID, createActivityMap, {?CrossRaceMapID, 1, ID}),
	createActivityMap(T, TimeNow).

%%%-------------------------------------------------------------------
% internal:将报名组数据转换为参赛组数据
-spec crossApply2RaceTeamEx(#recCrossApply{}) -> #pk_RaceTeamEx{}.
crossApply2RaceTeamEx(#recCrossApply{
	id		= ApplyID,
	leader	= LeaderID,
	members	= Members,
	paramEx	= PetID
}) ->
	Base = #pk_RaceTeamBase{
		applyID = ApplyID,
		leaderID = LeaderID,
		members = Members,
		petID = PetID
	},
	Item = #pk_RaceTeamItem{
		listItemIDA = [0, 0],
		listItemIDB = [0, 0]
	},
	Sort = #pk_RaceTeamSort{
		laps = 0,
		milestone = 0,
		time = 0
	},
	#pk_RaceTeamEx{
		applyID = ApplyID,
		base = Base,
		item = Item,
		sort = Sort,
		giveUpID = 0
	}.

%%%-------------------------------------------------------------------
% internal:对未分配的报名组进行特殊处理
-spec specialApply([#recCrossApply{}, ...]) -> no_return().
specialApply([]) ->
	ok;
specialApply([H | T]) ->
	%% 该活动不应该有未分配的情况
	?ERROR_OUT("specialApply:~w", [H]),
	specialApply(T).

%%%-------------------------------------------------------------------
% internal:通知选手入场
-spec noticePlayerEnter([#pk_RaceTeamEx{}, ...], pid()) -> no_return().
noticePlayerEnter(Teams, MapPid) ->
	#globalsetupCfg{setpara = ListPos} =
		getCfg:getCfgPStack(cfg_globalsetup, race_pos),
	noticePlayerEnter(Teams, MapPid, ListPos).
noticePlayerEnter([], _MapPid, _ListPos) ->
	ok;
noticePlayerEnter([#pk_RaceTeamEx{base = #pk_RaceTeamBase{members = Members}} | TT], MapPid, [{X, Y} | TP]) ->
	activityMgrLogicCross:crossAckMsg2NormalRole(Members, race_enter, {MapPid, X, Y}),
	noticePlayerEnter(TT, MapPid, TP).

%%%-------------------------------------------------------------------
% internal:角色离开或者掉线的处理
-spec playerOfflineOrLeave(MapPid::pid(), RoleID::uint64(), Reason::uint()) -> no_return().
playerOfflineOrLeave(MapPid, RoleID, Reason) ->
	MapInfo = cacRaceState:queryMapInfoByMapPid(MapPid),
	giveUpDo(MapInfo, RoleID, Reason).

%%%-------------------------------------------------------------------
% internal:超时处理
-spec timeout(#recRace{}, uint32()) -> no_return().
% 创建地图超时，删除地图数据并打印错误日志
timeout(#recRace{id = ID, state = ?State_Creating, teams = Teams}, _TimeNow) ->
	cacRaceState:deleteMapInfo(ID),
	FunError =
		fun(#pk_RaceTeamEx{base = #pk_RaceTeamBase{members = Members}}) ->
			[?ERROR_OUT("create map timeout ~w", [RoleID]) || RoleID <- Members]
		end,
	lists:foreach(FunError, Teams);
% 准备倒计时超时
timeout(#recRace{state = ?State_Ready, playerEts = EtsPlayer} = R0, TimeNow) ->
	R1 = kickTeam(R0),	%% 除名未全部到场的队伍
	case kickTeam(R0) of
		#recRace{state = ?State_Settle} ->
			skip;	%% 全部队伍都没到齐
		R1 ->
			%% 通知在场角色，如果没有上马就可以弃赛了
			sendMsg2Role(EtsPlayer, race_tryGiveUp, 0),
			%% 改变状态开始比赛
			R2 = R1#recRace{
				state = ?State_Race,
				time = TimeNow + cfgRaceTime()
			},
			cacRaceState:replaceMapInfo(R2),
			noticeState(R2)
	end;
% 比赛阶段超时，进入结算
timeout(#recRace{state = ?State_Race} = R, TimeNow) ->
	settle(R, TimeNow);
% 等待阶段超时，进入结算
timeout(#recRace{state = ?State_Wait} = R, TimeNow) ->
	settle(R, TimeNow);
% 结算超时，关闭地图
timeout(#recRace{id = ID, mapPid = MapPid, state = ?State_Settle}, _TimeNow) ->
	cacRaceState:deleteMapInfo(ID),
	psMgr:sendMsg2PS(MapPid, resetCopyMap, {});
timeout(#recRace{state = State}, _TimeNow) ->
	?ERROR_OUT("invalid State:~w", [State]).

%%%-------------------------------------------------------------------
% internal:结算并通知普通服发奖
-spec settle(MapInfo::#recRace{}, TimeNow::uint()) -> MapInfoNew::#recRace{}.
settle(#recRace{} = R, TimeNow) ->
	%% 改变地图状态
	#globalsetupCfg{setpara = [_ReadyTime, _WaitTime, SettleTime]} =
		getCfg:getCfgPStack(cfg_globalsetup, race_time_wait),
	RNew = R#recRace{
		state = ?State_Settle,
		time = TimeNow + SettleTime
	},
	cacRaceState:replaceMapInfo(RNew),
	noticeState(RNew),	%% 此处状态改变已经通知客户端结算数据
	%% 排名
	TeamsSort = lists:sort(fun sortTeams/2, RNew#recRace.teams),
	ListRank = settle_sort(TeamsSort, {0, 0, []}, cfgLaps()),
	%% 通知发奖
	settle_mail(ListRank),
	RNew.

% 排名
settle_sort([], {_LastSort, _SortID, ListRank}, _LapsMax) ->
	ListRank;
settle_sort([#pk_RaceTeamEx{giveUpID = 0} = H | T], {LastSort, SortID, ListRank}, LapsMax) ->
	settle_sort(T, {LastSort, SortID, [{H, 0} | ListRank]}, LapsMax);		%% 弃赛没有名次
settle_sort([#pk_RaceTeamEx{sort = #pk_RaceTeamSort{laps = Laps}} = H | T], {LastSort, SortID, ListRank}, LapsMax) when Laps < LapsMax ->
	settle_sort(T, {LastSort, SortID, [{H, 0} | ListRank]}, Laps);			%%  没到跑完没有名次
settle_sort([#pk_RaceTeamEx{sort = LastSort} = H | T], {LastSort, SortID, ListRank}, LapsMax) ->
	settle_sort(T, {LastSort, SortID, [{H, SortID} | ListRank]}, LapsMax);	%% 并列，且排名不顺延
settle_sort([#pk_RaceTeamEx{sort = Sort} = H | T], {_LastSort, SortID, ListRank}, LapsMax) ->
	settle_sort(T, {Sort, SortID + 1, [{H, SortID + 1} | ListRank]}, LapsMax).

% 通知发奖
settle_mail([]) ->
	ok;
settle_mail([{#pk_RaceTeamEx{base = #pk_RaceTeamBase{members = Members}}, SortID} | T]) ->
	settle_mail(Members, SortID),
	settle_mail(T).
settle_mail([], _SortID) ->
	ok;
settle_mail([#pk_CrossRoleBase{id = RoleID} | T], SortID) ->
	DBID = core:getRealDBIDByUID(RoleID),
	gsSendMsg:sendMsg2OneSource(DBID, ?PsNameActivityMgr, cac_mail, {?ActivityType_CrossRace, {RoleID, SortID}}),
	settle_mail(T, SortID).

%%%-------------------------------------------------------------------
% internal:弃赛
-spec giveUpDo(MapInfo::#recRace{}, GiveUpRoleID::uint64(), Reason::uint()) -> MapInfoNew::#recRace{}.
giveUpDo(MapInfo, 0, _Reason) ->
	MapInfo;
giveUpDo(#recRace{state = State, teams = Teams} = R, GiveUpRoleID, Reason) when
	State =:= ?State_Race;
	State =:= ?State_Wait ->
	case queryRoleFromTeam(Teams, GiveUpRoleID) of
		{Team, Role, _IsLeader} ->
			case giveUpReal(Team, Role, Reason) of
				{true, #pk_RaceTeamEx{applyID = ApplyID} = TeamNew} ->
					TeamsNew = lists:keyreplace(ApplyID, #pk_RaceTeamEx.applyID, Teams, TeamNew),
					%% 如果所有队伍都弃赛了，则进入结算状态
					RNew = R#recRace{teams = TeamsNew},
					case giveUpCheck(Teams) of
						true ->
							settle(RNew, time:getSyncTimeFromDBS());
						_ ->
							cacRaceState:replaceMapInfo(RNew),
							RNew
					end;
				_ ->
					R	%% 已经处理过弃赛了，忽略更多的弃赛请求
			end;
		_ ->
			?WARN_OUT("RoleID:~w leave but not in team", [GiveUpRoleID]),
			R	%% 无关人员，可能是GM
	end;
giveUpDo(MapInfo, _GiveUpRoleID, _Reason) ->
	MapInfo.	%% 其它状态忽略弃赛消息

% 如果所有队伍都弃赛了，则进入结算状态
-spec giveUpCheck([#pk_RaceTeamEx{}, ...]) -> boolean().
giveUpCheck([]) ->
	true;
giveUpCheck([#pk_RaceTeamEx{giveUpID = 0} | _T]) ->
	false;
giveUpCheck([_H | T]) ->
	giveUpCheck(T).

% 执行弃赛并留下文件日志
-spec giveUpReal(TeamOrRace::#pk_RaceTeamEx{}, GiveUpRole::#pk_CrossRoleBase{}, Reason::uint()) -> {IsUpdate::boolean(), TeamNew::#pk_RaceTeamEx{}}.
giveUpReal(#pk_RaceTeamEx{base = #pk_RaceTeamBase{members = Members}, giveUpID = 0} = Team, #pk_CrossRoleBase{id = GiveUpRoleID} = GiveUpRole, Reason) ->
	ListRoleID = [RoleID || #pk_CrossRoleBase{id = RoleID} <- Members],
	IsComplete = isComplete(Team),
	?LOG_OUT("ListRoleID:~w wiil be kicked, because GieveUpRoleID:~w Reason:~w IsComplete:~w", [ListRoleID, GiveUpRole#pk_CrossRoleBase.id, Reason, IsComplete]),
	backGs(ListRoleID, GiveUpRole, Reason, IsComplete),
	{true, Team#pk_RaceTeamEx{giveUpID = GiveUpRoleID}};
giveUpReal(Team, _GiveUpRole, _Reason) ->
	{false, Team}.

% 延时踢出（为了正常显示）
-spec backGs(ListRoleID::[uint64(), ...], GiveUpRole::#pk_CrossRoleBase{}, Reason::uint(), IsComplete::boolean()) -> no_return().
backGs([], _GiveUpRole, _Reason, _IsComplete) ->
	ok;
backGs([H | T], #pk_CrossRoleBase{} = GiveUpRole, Reason, IsComplete) ->
	case core:queryOnLineRoleByRoleID(H) of
		#rec_OnlinePlayer{pid = Pid, netPid = NetPid} ->
			Msg = #pk_GS2U_RaceMapGiveUp_Sync{
				isComplete = IsComplete,
				reason = Reason,
				role = GiveUpRole
			},
			playerMsg:sendNetMsg(NetPid, Msg),
			erlang:send_after(?KickTime, Pid, {backGS, self(), 0});
		_ ->
			skip
	end,
	backGs(T, GiveUpRole, Reason, IsComplete).

%%%-------------------------------------------------------------------
% internal:除名未全部到场的队伍
-spec kickTeam(#recRace{}) -> #recRace{}.
kickTeam(#recRace{teams = Teams, playerEts = EtsPlayer} = R) ->
	ListPlayer = ets:tab2list(EtsPlayer),
	ListGiveUpRoleID = [checkTeamIsEnter(Team, ListPlayer) || Team <- Teams],
	FunKick =
		fun(RoleID, Acc) ->
			giveUpDo(Acc, RoleID, ?GiveUpReason_NotEnter)
		end,
	lists:foldl(FunKick, R, ListGiveUpRoleID).

% 检查该队伍是否全部入场
-spec checkTeamIsEnter(Team::#pk_RaceTeamEx{}, ListPlayer::[#recMapObject{}]) -> GiveUpRoleID::uint64()|0.
checkTeamIsEnter(#pk_RaceTeamEx{base = #pk_RaceTeamBase{members = Members}}, ListPlayer) ->
	FunCheck =
		fun(#pk_CrossRoleBase{id = RoleID}, Acc) ->
			case lists:keyfind(RoleID, #recMapObject.id, ListPlayer) of
				fasle ->
					{true, RoleID};
				_ ->
					Acc
			end
		end,
	{_, GiveUpRoleID} = misc:foldlEx(FunCheck, {false, 0}, Members),
	GiveUpRoleID.

%%%-------------------------------------------------------------------
% internal:查询角色所在队伍
-spec queryRoleFromTeam(Teams::[#pk_RaceTeamEx{}, ...], RoleID::uint64()) -> {Team::#pk_RaceTeamEx{}, Role::#pk_CrossRoleBase{}, IsLeader::boolean()} | 0.
queryRoleFromTeam([], _RoleID) ->
	0;
queryRoleFromTeam([#pk_RaceTeamEx{base = #pk_RaceTeamBase{leaderID = LeaderID, members = Members}} = H | T], RoleID) ->
	case lists:keyfind(RoleID, #pk_CrossRoleBase.id, Members) of
		false ->
			queryRoleFromTeam(T, RoleID);
		Role ->
			{H, Role, RoleID =:= LeaderID}
	end.

%%%-------------------------------------------------------------------
% internal:是否已经冲过终点
-spec isComplete(#pk_RaceTeamEx{}) -> boolean().
isComplete(#pk_RaceTeamEx{sort = #pk_RaceTeamSort{laps = Laps}}) ->
	Laps >= cfgLaps().

%%%-------------------------------------------------------------------
% internal:采集
-spec gatherDo(MapInfo::#recRace{}, RoleID::uint64(), GatherID::uint16()) -> MapInfoNew::#recRace{}.
gatherDo(MapInfo, 0, _GatherID) ->
	MapInfo;
gatherDo(#recRace{state = State, teams = Teams} = R, RoleID, GatherID) when
	State =:= ?State_Race;
	State =:= ?State_Wait ->
	case getCfg:getCfgPStack(cfg_object, GatherID) of
		#objectCfg{type = ?GatherType_Race} = Cfg ->
			case queryRoleFromTeam(Teams, RoleID) of
				{Team, _Role, IsLeader} ->
					gatherReal(R, Team, IsLeader, Cfg);
				_ ->
					R	%% 错误的角色
			end;
		_ ->
			R	%% 错误的采集物
	end;
gatherDo(MapInfo, _RoleID, _GatherID) ->
	MapInfo.

% 采集各种
-spec gatherReal(MapInfo::#recRace{}, Team::#pk_RaceTeamEx{}, IsLeader::boolean(), GatherCfg::#objectCfg{}) -> MapInfoNew::#recRace{}.
gatherReal(MapInfo, _Team, false, _Cfg) ->
	MapInfo;	%% 只能队长采集
gatherReal(MapInfo, #pk_RaceTeamEx{giveUpID = GiveUpID}, false, _Cfg) when GiveUpID > 0 ->
	MapInfo;	%% 该队已经弃赛
% 里程碑
gatherReal(
	#recRace{playerEts = EtsPlayer} = MapInfo,
	#pk_RaceTeamEx{applyID = ApplyID, sort = #pk_RaceTeamSort{laps = Laps, milestone = Milestone} = TeamSort} = TeamEx,
	_IsLeader, #objectCfg{param1 = ?OBT_Milestone, param2 = [ID]}
) ->
	MaxLaps = cfgLaps(),
	case Laps >= MaxLaps of
		true ->
			MapInfo;	%% 已经冲过终点你就不要来添乱了
		_ ->
			%% 碰触到的里程碑应该是“下一个”，否则无效
			case nextMilestone(Milestone, cacRaceState:getMilestoneMax()) of
				ID ->
					%% 碰触到的里程碑是终点则圈数+1
					LapsNew =
						case ID of
							0 ->
								Laps + 1;
							_ ->
								Laps
						end,
					TimeNew = time:getSyncTimeMSFromDBS(),	%% 毫秒
					TeamSortNew = TeamSort#pk_RaceTeamSort{laps = LapsNew, milestone = ID, time = TimeNew},
					TeamExNew = TeamEx#pk_RaceTeamEx{sort = TeamSortNew},
					Msg = #pk_GS2U_RaceMapMilestone_Sync{
						applyID = ApplyID,
						sort = TeamSortNew
					},
					sendNetMsg2Role(EtsPlayer, Msg),	%% 广播里程碑变化
					%% 圈数达标则可能产生第一名
					MapInfoNew =
						case LapsNew >= MaxLaps of
							true ->
								firstWinner(MapInfo#recRace{teams = TeamExNew});
							_ ->
								MapInfo#recRace{teams = TeamExNew}
						end,
					cacRaceState:replaceMapInfo(MapInfoNew),
					MapInfoNew;
				_ ->
					MapInfo	%% 无效的触发
			end
	end;
% 加速带
gatherReal(MapInfo, Team, _IsLeader, #objectCfg{param1 = ?OBT_SpeedUp, param2 = [BuffID]}) ->
	noticeAddBuff(Team, BuffID),
	MapInfo;
% 减速陷阱
gatherReal(MapInfo, Team, _IsLeader, #objectCfg{param1 = ?OBT_SpeedDown, param2 = [BuffID]}) ->
	noticeAddBuff(Team, BuffID),
	MapInfo;
% 强化型加速带
gatherReal(MapInfo, Team, _IsLeader, #objectCfg{param1 = ?OBT_SpeedUpEx, param2 = [BuffID]}) ->
	noticeAddBuff(Team, BuffID),
	MapInfo;
% 强化型减速陷阱
gatherReal(MapInfo, Team, _IsLeader, #objectCfg{param1 = ?OBT_SpeedDownEx, param2 = [BuffID]}) ->
	noticeAddBuff(Team, BuffID),
	MapInfo;
% 道具箱
gatherReal(
	#recRace{playerEts = EtsPlayer, teams = Teams} = MapInfo,
	#pk_RaceTeamEx{applyID = ApplyID} = Team,
	_IsLeader, #objectCfg{param1 = ?OBT_ItemBox}
) ->
	SortID = getSortID(Teams, ApplyID),
	Count = cfgItemCount(),
	TeamNew = lists:foldl(
		fun(_, Acc) -> getItem(Acc, EtsPlayer, SortID) end,
		Team,
		lists:seq(1, Count)
	),
	case TeamNew of
		Team ->
			MapInfo;
		_ ->
			TeamsNew = lists:keyreplace(ApplyID, #pk_RaceTeamEx.applyID, Teams, TeamNew),
			MapInfoNew = MapInfo#recRace{teams = TeamsNew},
			cacRaceState:replaceMapInfo(MapInfoNew),
			MapInfoNew
	end;
gatherReal(MapInfo, _Team, _IsLeader, InvalidCfg) ->
	?ERROR_OUT("invalidCfg:~w", [InvalidCfg]),
	MapInfo.

%%%-------------------------------------------------------------------
% internal:使用道具
-spec itemDo(MapInfo::#recRace{}, RoleID::uint64(), ItemID::uint8()) -> MapInfoNew::#recRace{}.
itemDo(MapInfo, 0, _ItemID) ->
	MapInfo;
itemDo(#recRace{state = State, teams = Teams, playerEts = EtsPlayer} = R, RoleID, ItemID) when
	State =:= ?State_Race;
	State =:= ?State_Wait ->
	case getCfg:getCfgPStack(cfg_race_item, ItemID) of
		#race_itemCfg{} = Cfg ->
			case queryRoleFromTeam(Teams, RoleID) of
				{#pk_RaceTeamEx{applyID = ApplyID, item = Item} = Team, _Role, IsLeader} ->
					case itemCost(Item, ItemID, IsLeader) of
						Item ->
							R;	%% 没有对应的道具
						ItemNew ->
							TeamNew = Team#pk_RaceTeamEx{item = ItemNew},
							TeamsNew = lists:keyreplace(ApplyID, #pk_RaceTeamEx.applyID, Teams, TeamNew),
							MapInfoNew = R#recRace{teams = TeamsNew},
							cacRaceState:replaceMapInfo(MapInfoNew),
							itemReal(R, Team, RoleID, Cfg),
							Msg = #pk_GS2U_RaceMapItem_Sync{
								applyID = ApplyID,
								roleID = RoleID,
								getOrUse = false,
								itemID = ItemID,
								item = ItemNew
							},
							sendNetMsg2Role(EtsPlayer, Msg),
							MapInfoNew
					end;
				_ ->
					R	%% 错误的角色
			end;
		_ ->
			R	%% 错误的道具
	end;
itemDo(MapInfo, _RoleID, _ItemID) ->
	MapInfo.

% 扣除道具
-spec itemCost(Item::#pk_RaceTeamItem{}, ItemID::uint8(), IsLeader::boolean()) -> TeamNew::#pk_RaceTeamEx{}.
itemCost(#pk_RaceTeamItem{listItemIDA = List} = Item, ItemID, true) ->
	ListNew = itemCost(List, ItemID),
	Item#pk_RaceTeamItem{listItemIDA = ListNew};
itemCost(#pk_RaceTeamItem{listItemIDB = List} = Item, ItemID, false) ->
	ListNew = itemCost(List, ItemID),
	Item#pk_RaceTeamItem{listItemIDB = ListNew}.
itemCost([], _ItemID) ->
	[];
itemCost([ItemID | T], ItemID) ->
	[0 | T];
itemCost([H | T], ItemID) ->
	[H | itemCost(T, ItemID)].

% 使用各种道具
-spec itemReal(MapInfo::#recRace{}, Team::#pk_RaceTeamEx{}, RoleID::uint64(), ItemCfg::#race_itemCfg{}) -> no_return().
itemReal(_MapInfo, #pk_RaceTeamEx{giveUpID = GiveUpID}, _RoleID, _Cfg) when GiveUpID > 0 ->
	skip;	%% 该队已经弃赛
% 给自己队加BUFF
itemReal(_MapInfo, Team, _RoleID, #race_itemCfg{type = ?VIT_SelfTeam, param1 = ListBuffID}) ->
	BuffID = itemEx(ListBuffID),
	noticeAddBuff(Team, BuffID);
% 给周围敌对角色加BUFF
itemReal(
	#recRace{playerEts = EtsPlayer},
	#pk_RaceTeamEx{base = #pk_RaceTeamBase{members = Members}},
	RoleID,
	#race_itemCfg{type = ?VIT_AroundEnemy, param1 = ListBuffID, param2 = ListRad}
) ->
	ListPlayerAll = ets:tab2list(EtsPlayer),
	ListPlayer = exclude(Members, ListPlayerAll),
	Rad = erlang:float(itemEx(ListRad)),
	Match = ets:fun2ms(fun(#recMapObject{id = RoleID_} = Process) when RoleID_ =:= RoleID -> Process end),
	[#recMapObject{x = X, y = Y}] = ets:select(EtsPlayer, Match),	%% 必然在线
	ListPid = searchRole(ListPlayer, Rad * Rad, X, Y, []),
	noticeAddBuff(ListPid, itemEx(ListBuffID));
% 给第一名队伍的角色加BUFF（如果是自己队则忽略
itemReal(
	#recRace{teams = Teams},
	#pk_RaceTeamEx{applyID = ApplyID},
	_RoleID,
	#race_itemCfg{type = ?VIT_FirstEnemy, param1 = ListBuffID}
) ->
	TeamsFirst = searchFirst(Teams),
	TeamsTarget = lists:keydelete(ApplyID, #pk_RaceTeamEx.applyID, TeamsFirst),
	noticeAddBuff(TeamsTarget, itemEx(ListBuffID));
% 创建采集物
itemReal(
	#recRace{mapPid = MapPid, playerEts = EtsPlayer},
	_Team,
	RoleID,
	#race_itemCfg{type = ?VIT_CreateGather, param1 = ListGatherID, param2 = [OffsetX, OffsetY]}
) ->
	Match = ets:fun2ms(fun(#recMapObject{id = RoleID_} = Process) when RoleID_ =:= RoleID -> Process end),
	[#recMapObject{x = X, y = Y}] = ets:select(EtsPlayer, Match),	%% 必然在线
	Arg = #recSpawnCollect{
		id      = itemEx(ListGatherID),
		x    	= X + OffsetX,
		y    	= Y + OffsetY,
		groupID = 0
	},
	psMgr:sendMsg2PS(MapPid, spawnObject, {Arg, 0, 0, 0});
% 创建载体
itemReal(
	#recRace{mapPid = MapPid, playerEts = EtsPlayer, monsterEts = EtsMonster},
	_Team,
	RoleID,
	#race_itemCfg{type = ?VIT_CreateCarrier, param1 = ListCarrierID, param2 = [OffsetX, OffsetY]}
) ->
	Match = ets:fun2ms(fun(#recMapObject{id = RoleID_} = Process) when RoleID_ =:= RoleID -> Process end),
	[#recMapObject{x = X, y = Y}] = ets:select(EtsPlayer, Match),	%% 必然在线
	CI = {
		?CampMonsterFriendly,
		#recCallCarrier{
			lifeTime = 3600	%% 超长时间表示永久
		}
	},
	SpawnMonsterArg = #recSpawnMonster{
		id = itemEx(ListCarrierID),
		mapPid = MapPid,
		mapID = ?CrossRaceMapID,
		x = X + OffsetX,
		y = Y + OffsetY,
		level = 1,
		camp = ?CampMonsterFriendly,
		playerEts = EtsPlayer,
		monsterEts = EtsMonster,
		other = CI,
		groupID = 0
	},
	psMgr:sendMsg2PS(MapPid, spawnCarrier, {SpawnMonsterArg});
itemReal(MapInfo, _Team, _RoleID, InvalidCfg) ->
	?ERROR_OUT("invalidCfg:~w", [InvalidCfg]),
	MapInfo.

%%%-------------------------------------------------------------------
% internal:名次排序
-spec sortTeams(#pk_RaceTeamEx{}, #pk_RaceTeamEx{}) -> boolean().
sortTeams(#pk_RaceTeamEx{giveUpID = 0}, #pk_RaceTeamEx{giveUpID = 0}) ->
	false;	%% 都弃赛了，不影响名次变化
sortTeams(#pk_RaceTeamEx{giveUpID = 0}, _) ->
	false;
sortTeams(_, #pk_RaceTeamEx{giveUpID = 0}) ->
	true;
sortTeams(
	#pk_RaceTeamEx{sort = #pk_RaceTeamSort{laps = LapsA, milestone = MilestoneA, time = TimeA}},
	#pk_RaceTeamEx{sort = #pk_RaceTeamSort{laps = LapsB, milestone = MilestoneB, time = TimeB}}
) ->
	case LapsA of
		LapsB ->
			case MilestoneA of
				MilestoneB ->
					case TimeA of
						TimeB ->
							false;
						_ ->
							TimeA < TimeB
					end;
				_ ->
					MilestoneA > MilestoneB
			end;
		_ ->
			LapsA > LapsB
	end.

%%%-------------------------------------------------------------------
% internal:查看目标是第几名
-spec getSortID(Teams::[#pk_RaceTeamEx{}, ...], ApplyID::uint64()) -> SortID::uint().
getSortID(Teams, ApplyID) ->
	TeamsSort1 = lists:sort(fun sortTeams/2, Teams),
	TeamsSort2 = getSortID_sort(TeamsSort1, {0, 0, []}),
	getSortID_find(TeamsSort2, ApplyID).
getSortID_sort([], {_LastSort, _SortID, ListRank}) ->
	ListRank;
getSortID_sort([#pk_RaceTeamEx{giveUpID = 0} = H | T], {LastSort, SortID, ListRank}) ->
	getSortID_sort(T, {LastSort, SortID, [{H, 0} | ListRank]});		%% 弃赛没有名次
getSortID_sort([#pk_RaceTeamEx{sort = LastSort} = H | T], {LastSort, SortID, ListRank}) ->
	getSortID_sort(T, {LastSort, SortID, [{H, SortID} | ListRank]});	%% 并列，且排名不顺延
getSortID_sort([#pk_RaceTeamEx{sort = Sort} = H | T], {_LastSort, SortID, ListRank}) ->
	getSortID_sort(T, {Sort, SortID + 1, [{H, SortID + 1} | ListRank]}).
getSortID_find([], _ApplyID) ->
	0;
getSortID_find([{#pk_RaceTeamEx{applyID = ApplyID}, SortID} | _T], ApplyID) ->
	SortID;
getSortID_find([_H | T], ApplyID) ->
	getSortID_find(T, ApplyID).

%%%-------------------------------------------------------------------
% internal:查找第一名队伍（可能有多个第一名）
-spec searchFirst(Teams::[#pk_RaceTeamEx{}, ...]) -> TeamsFirst::[#pk_RaceTeamEx{}, ...].
searchFirst(Teams) ->
	[#pk_RaceTeamEx{sort = Sort} = H | T] =
		lists:sort(fun sortTeams/2, Teams),
	[H | searchFirst(T, Sort, [])].
searchFirst([], _Sort, Acc) ->
	Acc;
searchFirst([#pk_RaceTeamEx{sort = Sort, giveUpID = 0} = H | T], Sort, Acc) ->
	searchFirst(T, Sort, [H | Acc]);
searchFirst([_H | _T], _Sort, Acc) ->
	Acc.	%% 已经排序过了，这里返回

%%%-------------------------------------------------------------------
% internal:排除自己队伍
-spec exclude([#pk_CrossRoleBase{}, ...], [#recMapObject{}, ...]) -> [#recMapObject{}, ...].
exclude([], Acc) ->
	Acc;
exclude([#pk_CrossRoleBase{id = RoleID} | T], Acc) ->
	AccNew = lists:keydelete(RoleID, #recMapObject.id, Acc),
	exclude(T, AccNew).

%%%-------------------------------------------------------------------
% internal:搜索范围内的角色
-spec searchRole(ListPlayer::[#recMapObject{}, ...], RadSquare::float(), X::float(), Y::float(), Acc::[pid(), ...]) -> ListRolePid::[pid(), ...].
searchRole([], _RadSquare, _X, _Y, Acc) ->
	Acc;
searchRole([#recMapObject{x = X_, y = Y_, pid = Pid} | T], RadSquare, X, Y, Acc) ->
	DistSquare = misc:calcDistSquare(X, Y, X_, Y_),
	case RadSquare >= DistSquare of
		true ->
			searchRole(T, RadSquare, X, Y, [Pid | Acc]);
		_ ->
			searchRole(T, RadSquare, X, Y, Acc)
	end.

%%%-------------------------------------------------------------------
% internal:获得道具
-spec getItem(Team::#pk_RaceTeamEx{}, EtsPlayer::etsTab(), SortID::uint()) -> TeamNew::#pk_RaceTeamEx{}.
getItem(#pk_RaceTeamEx{applyID = ApplyID, base = #pk_RaceTeamBase{members = Members},
	item = #pk_RaceTeamItem{listItemIDA = ListA, listItemIDB = ListB} = Item0} = Team,
	EtsPlayer, SortID) ->
	[RoleIDA, RoleIDB] = [RoleID || #pk_CrossRoleBase{id = RoleID} <- Members],
	ItemIDA = cacRaceState:randItem(SortID),
	Item1 =
		case getItemRand(ListA, ItemIDA) of
			ListA ->
				Item0;
			ListANew ->
				Item1_ = Item0#pk_RaceTeamItem{listItemIDA = ListANew},
				MsgA = #pk_GS2U_RaceMapItem_Sync{
					applyID = ApplyID,
					roleID = RoleIDA,
					getOrUse = true,
					itemID = ItemIDA,
					item = Item1_
				},
				sendNetMsg2Role(MsgA, EtsPlayer),
				Item1_
		end,
	ItemIDB = cacRaceState:randItem(SortID),
	Item2 =
		case getItemRand(ListB, ItemIDB) of
			ListB ->
				Item1;
			ListBNew ->
				Item2_ = Item1#pk_RaceTeamItem{listItemIDB = ListBNew},
				MsgB = #pk_GS2U_RaceMapItem_Sync{
					applyID = ApplyID,
					roleID = RoleIDB,
					getOrUse = true,
					itemID = ItemIDB,
					item = Item2_
				},
				sendNetMsg2Role(MsgB, EtsPlayer),
				Item2_
		end,
	Team#pk_RaceTeamEx{item = Item2}.
getItemRand([], _ItemID) ->
	[];
getItemRand([0 | T], ItemID) ->
	[ItemID | T];	%% 仅添加1次
getItemRand([H | T], ItemID) ->
	[H | getItemRand(T, ItemID)].


%%%-------------------------------------------------------------------
% internal:计算下一个里程碑
-spec nextMilestone(Milestone::uint(), Max::uint()) -> Next::uint().
nextMilestone(Max, Max) ->
	0;
nextMilestone(Milestone, _Max) ->
	Milestone + 1.

%%%-------------------------------------------------------------------
% internal:大部分切换地图状态时发送网络消息（?State_Creating不用处理，?State_Ready由角色进入事件代为处理）
-spec noticeState(#recRace{}) -> no_return().
noticeState(#recRace{state = State, time = Time, teams = Teams, playerEts = EtsPlayer}) ->
	{Mod, _} = cacRaceState:getMod(),
	Msg = #pk_GS2U_RaceMapState_Sync{
		type = Mod,
		state = State,
		sec = Time - time:getSyncTimeFromDBS(),
		info = Teams
	},
	sendNetMsg2Role(EtsPlayer, Msg).

%%%-------------------------------------------------------------------
% internal:第一名冲过终点
-spec firstWinner(#recRace{}) -> #recRace{}.
firstWinner(#recRace{state = ?State_Race, time = TimeMax} = MapInfo) ->	%% 仅在比赛阶段有效
	%% 第一名冲过终点后等待配置指定的时间，但不会超过游戏总时间
	#globalsetupCfg{setpara = [_ReadyTime, WaitTime, _SettleTime]} =
		getCfg:getCfgPStack(cfg_globalsetup, race_time_wait),
	MapInfoNew = MapInfo#recRace{
		state = ?State_Wait,
		time = erlang:min(TimeMax, time:getSyncTimeFromDBS() + WaitTime)
	},
	noticeState(MapInfoNew),
	MapInfoNew;
firstWinner(MapInfo) ->
	MapInfo.

%%%-------------------------------------------------------------------
% internal:通知指定角色添加BUFF
-spec noticeAddBuff(Target, BuffID::uint16()) -> no_return() when
	Target :: #pk_RaceTeamEx{} | [#pk_RaceTeamEx{}, ...] | [#pk_CrossRoleBase{}, ...] | [uint64(), ...].
noticeAddBuff(#pk_RaceTeamEx{base = #pk_RaceTeamBase{members = Members}}, BuffID) ->
	noticeAddBuff(Members, BuffID);
noticeAddBuff([], _BuffID) ->
	ok;
noticeAddBuff([#pk_RaceTeamEx{base = #pk_RaceTeamBase{members = Members}} | T], BuffID) ->
	noticeAddBuff(Members, BuffID),
	noticeAddBuff(T, BuffID);
noticeAddBuff([#pk_CrossRoleBase{id = RoleID} | T], BuffID) ->
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{pid = Pid} ->
			psMgr:sendMsg2PS(Pid, race_buff, BuffID);
		_ ->
			skip
	end,
	noticeAddBuff(T, BuffID);
noticeAddBuff([Pid | T], BuffID) when erlang:is_pid(Pid) ->
	psMgr:sendMsg2PS(Pid, race_buff, BuffID),
	noticeAddBuff(T, BuffID).

%%%-------------------------------------------------------------------
% internal:是否需要强化效果
-spec itemEx(ListID::[uint16(), ...]) -> ID::uint16().
itemEx([ID1, ID2]) ->
	case cacRaceState:getMod() of
		{?SubType_ItemEx, _} ->
			ID2;
		_ ->
			ID1
	end.

%%%-------------------------------------------------------------------
% internal,cfg:比赛圈数
-spec cfgLaps() -> Laps::uint().
cfgLaps() ->
	#globalsetupCfg{setpara = [Laps1, Laps2]} =
		getCfg:getCfgPStack(cfg_globalsetup, race_laps),
	case cacRaceState:getMod() of
		{?SubType_SpeedUp, _} ->
			Laps2;
		_ ->
			Laps1
	end.

%%%-------------------------------------------------------------------
% internal,cfg:一次性获得道具数量（双倍道具时一次性俩
-spec cfgItemCount() -> Count::uint().
cfgItemCount() ->
	case cacRaceState:getMod() of
		{?SubType_ItemDouble, _} ->
			2;
		_ ->
			1
	end.

%%%-------------------------------------------------------------------
% internal,cfg:比赛时间
-spec cfgRaceTime() -> Time::uint().
cfgRaceTime() ->
	#activityCfg{stage = [_, Time]} =
		getCfg:getCfgPStack(cfg_activity, ?ActivityType_CrossRace),
	#globalsetupCfg{setpara = [ReadyTime, _WaitTime, SettleTime]} =
		getCfg:getCfgPStack(cfg_globalsetup, race_time_wait),
	Time - ?WaitTime - ReadyTime - SettleTime.
