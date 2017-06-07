%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 玩家护送
%%% @end
%%% Created : 24. 六月 2015 16:51
%%%-------------------------------------------------------------------
-module(playerEscort).
-author("tiancheng").

-include("playerPrivate.hrl").

-define(EscortType_Solo, 1).    % 单人护送
-define(EscortType_Team, 2).    % 多人护送
-define(EscortType_Rob, 3).     % 劫掠

%% call 活动进程超时时间
-define(EscortCallTiomOut, 2000).

%% MSG
-export([
	requestEscortSolo/0,
	requestEscortTeam/0,
	requestEscortRob/1,
	requestEscortTeamList/0,
	acceptTriggerEvent/0
]).

-export([
	canEnterEscortMap/1,
	onEnterEscortMapAck/1,
	sendEscortMsgToPlayer/1,
	onEnterMap/1,
	escortReviveAndConsume/1
]).

-spec escortReviveAndConsume(MapID::uint()) -> false | {Tx::float(), Ty::float()} | leaveEscortMap.
escortReviveAndConsume(MapID) ->
	case MapID =/= ?EscortMapID of
		true ->
			false;
		_ ->
			%% 在护送活动中复活
			RoleID = playerState:getRoleID(),
			PID = activityMgrLogic:getActivityChildProcessName(?ActivityType_EscortGoods),
			case psMgr:call(PID, requestRevive, RoleID, ?EscortCallTiomOut) of
				{_EscortType, true} ->
					%% 原地复活，无消耗
					playerState:getPos();
				{EscortType, false} ->
					%% 原地复活，有消耗
					#globalsetupCfg{setpara = [{ItemID, NeedItemNumber}]} = getCfg:getCfgPStack(cfg_globalsetup, robbery_revive_item),
					#globalsetupCfg{setpara = ReviveList} = getCfg:getCfgPStack(cfg_globalsetup, robbery_revive_site),
					%% 拥有道具个数
					HaveItemNumber = playerPackage:getItemNumByID(ItemID),

					%% 是否拥有足够的道具个数
					case HaveItemNumber >= NeedItemNumber of
						true ->
							deleteItem(ItemID, NeedItemNumber, EscortType),
							lists:nth(misc:rand(1, erlang:length(ReviveList)), ReviveList);
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_Escort_NoEnoughRobItemWaitLeaveMap),
							leaveEscortMap
					end;
				_ ->
					false
			end
	end.


onEnterMap(MapID) ->
	case MapID =:= ?EscortMapID of
		true ->
			skip;
		_ ->
			core:sendMsgToActivity(?ActivityType_EscortGoods, leaveEscortMap, playerState:getRoleID()),
			ok
	end,
	ok.

sendEscortMsgToPlayer({_EscortType, _IsEscort, {addbuff, {BuffID, _EventID}}}) ->
	case playerState:getMapID() =:= ?EscortMapID of
		true ->
			Level = playerState:getMapID(),
			playerBuff:addBuff(BuffID, Level),
			ok;
		_ ->
			skip
	end,
	ok;
sendEscortMsgToPlayer({_EscortType, _IsEscort, {eventResult, EventID}}) ->
%% 	?WARN_OUT("sendEscortMsgToPlayer:~ts, ~p,~p", [playerState:getName(),playerState:getRoleID(),EventID]),
	%% 通知客户端获得事件
	playerMsg:sendNetMsg(#pk_GS2U_TriggerEventResult{eventID = EventID}),
	ok;
sendEscortMsgToPlayer({_EscortType, _IsEscort, {reward_rob, RewardList}}) ->
	%% 劫掠玩家对马车造成了伤害，获得奖励
	addMoney(RewardList),
	ok;
sendEscortMsgToPlayer({EscortType, IsEscort, {reward, {Result, EndReason, RewardList,Earnnings,Damages}}}) ->
	%% 护送成功
	EarnningList0 = lists:map(fun({Name, Value}) -> #pk_EscortPlunderMoney{roleName = Name, plunderMoney = Value} end, Earnnings),
	EarnningList1 = lists:map(fun({Name, Value}) -> #pk_EscortPlunderMoney{roleName = Name, plunderMoney = (0 - Value)} end, Earnnings),
	case playerState:getMapID() =:= ?EscortMapID of
		true ->
			MoneyType = 
			case RewardList of
				[] -> 2;
				[{MType,_,_}|_] -> MType
			end,
			case IsEscort of
				true ->
					%% 护送结束，发奖，通知
					RL = addMoney(RewardList),
					%% 通知客户端
					playerMsg:sendNetMsg(
						#pk_GS2U_EscortResult{
							escortType = EscortType,
							endReason = EndReason,
							isSuccess = Result,
                            plunder =EarnningList1,
							rewards = RL});
				false ->
					%% 劫掠结束，仅通知
					R = #pk_EscortResultReward{moneyType = MoneyType, money = Damages, perValue = 0},
					playerMsg:sendNetMsg(
						#pk_GS2U_EscortResult{
							escortType = ?EscortType_Rob,
							endReason = EndReason,
							isSuccess = not Result,
                            plunder = EarnningList0,
							rewards = [R]})
			end;
		_ ->
			skip
	end,
	ok;
sendEscortMsgToPlayer(Data) ->
	?ERROR_OUT("sendEscortMsgToPlayer:roleID=~p,~p", [playerState:getRoleID(),Data]),
	ok.

addMoney(RewardList) ->
	Fun =
		fun({MoneyType,Value,PerValue}, AccList) ->
			case Value > 0 of
				true ->
					playerMoney:addCoin(
						MoneyType,
						Value,
						#recPLogTSMoney{
							reason = ?CoinSourceEscort,
							param = 1,
							target = ?PLogTS_PlayerSelf,
							source = ?PLogTS_Escort}),
					R = #pk_EscortResultReward{moneyType = MoneyType, money = Value, perValue = PerValue},
					[R | AccList];
				_ ->
					AccList
			end
		end,
	lists:foldl(Fun, [], RewardList).

onEnterEscortMapAck({EscortType, IsEscort}) ->
	%% 阵营
	case IsEscort of
		true ->
			%% 护送为蓝方
			playerState:setCamp(?CampBlueBattle, true),
%%			%活跃度
%%			playerliveness:onFinishLiveness(?LivenessConvoy,1),
			skip;
		false ->
			%% 劫掠为红方 LivenessHijack
			%活跃度
			playerliveness:onFinishLiveness(?LivenessHijack,1),
			playerState:setCamp(?CampRedBattle, true),
			skip
	end,

	%% 告诉客户端，当前是在干什么
	Type = case IsEscort of
			   true -> EscortType;
			   _ -> ?EscortType_Rob
	       end,
	Msg = #pk_GS2U_CurEscortType{escortType = Type},
	playerMsg:sendNetMsg(Msg),

	ok.

canEnterEscortMap({EscortType, MapPID}) ->
	playerScene:onRequestEnterActivityMap(?EscortMapID, MapPID),

	case EscortType of
		?EscortType_Team ->
			TeamID = playerState:getTeamID(),
			RoleID = playerState:getRoleID(),
			case erlang:is_integer(TeamID) andalso TeamID > 0 of
				true ->
					%% 通知队友，可以进入副本
					playerTeamCopyMap:inviteMemberToCopyMap(TeamID, RoleID, ?EscortMapID);
				_ ->
					skip
			end,
			ok;
		_ ->
			skip
	end,
	ok.

%% 请求单人护送
-spec requestEscortSolo() -> ok.
requestEscortSolo() ->
	#globalsetupCfg{setpara = [NeedLvl]} = getCfg:getCfgPStack(cfg_globalsetup, escort_singleplayer_level),
	case playerState:getLevel() >= NeedLvl of
		true ->
			case playerState:getMapID() =/= ?EscortMapID of
				true ->
					RoleID = playerState:getRoleID(),
					enterEscort(?EscortType_Solo, escort_singleplayer_num, escort_singleplayer_item, RoleID, RoleID);
				_ ->
					skip
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_Escort_EnterLevelLimit, [NeedLvl])
	end,
	ok.

%% 请求多人护送
-spec requestEscortTeam() -> ok.
requestEscortTeam() ->
	#globalsetupCfg{setpara = [NeedLvl]} = getCfg:getCfgPStack(cfg_globalsetup, escort_multiplayer_level),
	case playerState:getLevel() >= NeedLvl of
		true ->
			case playerState:getMapID() =/= ?EscortMapID of
				true ->
					TeamID = playerState:getTeamID(),
					case TeamID > 0 of
						true ->
							RoleID = playerState:getRoleID(),
							TeamLeaderID = teamInterface:getLeaderIDWithTeamID(TeamID),
							%%team2:getTeamLeaderID(TeamID),
							enterEscort(?EscortType_Team, escort_multiplayer_num, escort_multiplayer_item, RoleID, TeamLeaderID);
						_ ->
							%% 必须要是队伍才能进入
							playerMsg:sendErrorCodeMsg(?ErrorCode_Escort_EnterNeedTeam)
					end;
				_ ->
					skip
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_Escort_EnterLevelLimit, [NeedLvl])
	end,
	ok.

enterEscort(EscortType, JoinNumberKey, JoinItemKey, RoleID, TeamLeaderID) ->
	%% 检测次数
	#globalsetupCfg{setpara = [{NeedPlayerNumber, DayMaxNumber}]} = getCfg:getCfgPStack(cfg_globalsetup, JoinNumberKey),
	%% 检测道具
	#globalsetupCfg{setpara = [{ItemID, NeedItemNumber}]} = getCfg:getCfgPStack(cfg_globalsetup, JoinItemKey),
	%% 今日已经参加的次数
	CurNumber = case EscortType of
		            ?EscortType_Solo -> playerDaily:getDailyCounter(?DailyType_Everyday, ?PlayerEveryDay_Escort_Solo);
		            ?EscortType_Team -> playerDaily:getDailyCounter(?DailyType_Everyday, ?PlayerEveryDay_Escort_Team)
	            end,
	%% 拥有道具个数
	HaveItemNumber = playerPackage:getItemNumByID(ItemID),

	%% 是否拥有足够的道具个数
	IsHaveItem = (HaveItemNumber >= NeedItemNumber),
	%% 是否今日还拥有参加次数
	IsHaveDail = (CurNumber < DayMaxNumber),

	PID = activityMgrLogic:getActivityChildProcessName(?ActivityType_EscortGoods),
	Msg = {EscortType, RoleID, playerState:getLevel(),TeamLeaderID, IsHaveItem, IsHaveDail, NeedPlayerNumber},
	case psMgr:call(PID, requestEscort, Msg, ?EscortCallTiomOut) of
		MapPID when erlang:is_pid(MapPID) ->
			%% 直接进入
			playerScene:onRequestEnterActivityMap(?EscortMapID, MapPID);
		false ->
			%% 条件不满足
			if
				not IsHaveDail ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_Escort_NoEnoughDaily),
					ok;
				not IsHaveItem ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_Escort_NoEnoughItem),
					ok;
				true ->
					skip
			end;
		{false, EType} ->
			%% 当前已经在另外一种护送中
			case EType of
				?EscortType_Solo -> playerMsg:sendErrorCodeMsg(?ErrorCode_Escort_Already_Solo_Escort);
				?EscortType_Team -> playerMsg:sendErrorCodeMsg(?ErrorCode_Escort_Already_Team_Escort)
			end,
			skip;
		error ->
			%% 其它错误，理论上不可能出现
			playerMsg:sendErrorCodeMsg(?ErrorCode_Escort_UnKnow_Error),
			skip;
		waitleader ->
			%% 等待队长开启护送
			playerMsg:sendErrorCodeMsg(?ErrorCode_Escort_TeamLeaderOpenTeamEscort),
			skip;
		more ->
			%% 人数已经足够
			playerMsg:sendErrorCodeMsg(?ErrorCode_Escort_HaveMorePlayer_Team),
			ok;
		ok ->
			%% 之前已经报名，正在等待分配活动地图
			playerMsg:sendErrorCodeMsg(?ErrorCode_Escort_Wait_alloc_escortmap),
			ok;
		nostart ->
			%% 活动未开启
			playerMsg:sendErrorCodeMsg(?ErrorCode_Escort_activity_nostart),
			ok;
		true ->
			%% 报名成功，等待分配活动地图
			playerMsg:sendErrorCodeMsg(?ErrorCode_Escort_apply_Wait_alloc_escortmap),

			%% 多人护送时队长才扣凭证
			case EscortType of
				?EscortType_Solo ->
					%% 单人护送，不允许组队
%%					case playerState:getTeamID() > 0 of
%%						true -> playerTeam2:leaveTeam(?PlayerTeamTypeNormal);
%%						_ -> skip
%%					end,

					playerTeam:leaveTeam(false),
					deleteItem(ItemID, NeedItemNumber, EscortType);
				?EscortType_Team ->
					case RoleID =:= TeamLeaderID of
						true -> deleteItem(ItemID, NeedItemNumber, EscortType);
						_ -> skip
					end
			end,

			%% 记录参加次数
			case EscortType of
				?EscortType_Solo -> playerDaily:incDailyCounter(?DailyType_Everyday, ?PlayerEveryDay_Escort_Solo);
				?EscortType_Team -> playerDaily:incDailyCounter(?DailyType_Everyday, ?PlayerEveryDay_Escort_Team)
			end,
			%领取任务成功够就增加活跃度
			playerliveness:onFinishLiveness(?LivenessConvoy,1),
			ok;
		{true, MapPID} ->
			%% 多人护送时队长才扣凭证
			case EscortType of
				?EscortType_Solo -> deleteItem(ItemID, NeedItemNumber, EscortType);
				?EscortType_Team ->
					case RoleID =:= TeamLeaderID of
						true -> deleteItem(ItemID, NeedItemNumber, EscortType);
						_ -> skip
					end
			end,

			%% 记录参加次数
			case EscortType of
				?EscortType_Solo -> playerDaily:incDailyCounter(?DailyType_Everyday, ?PlayerEveryDay_Escort_Solo);
				?EscortType_Team -> playerDaily:incDailyCounter(?DailyType_Everyday, ?PlayerEveryDay_Escort_Team)
			end,
			%领取任务成功够就增加活跃度
			playerliveness:onFinishLiveness(?LivenessConvoy,1),
			case erlang:is_pid(MapPID) of
				true ->
					playerScene:onRequestEnterActivityMap(?EscortMapID, MapPID);
				_ ->
					%% 报名成功，等待分配活动地图
					playerMsg:sendErrorCodeMsg(?ErrorCode_Escort_apply_Wait_alloc_escortmap)
			end,
			ok;
		Error ->
			?ERROR_OUT("enterEscort:type=~p,roleid=~p,leader=~p,error=~p", [EscortType, RoleID, TeamLeaderID, Error]),
			skip
	end,
	ok.

%% 请求劫掠
-spec requestEscortRob(SequenceNumber::uint()) -> ok.
requestEscortRob(SequenceNumber) ->
	case playerState:getMapID() =/= ?EscortMapID of
		true ->
			#globalsetupCfg{setpara = [NeedLvl]} = getCfg:getCfgPStack(cfg_globalsetup, robbery_player_level),
			case playerState:getLevel() >= NeedLvl of
				true ->
					%% 检测道具
					#globalsetupCfg{setpara = [{ItemID, NeedItemNumber}]} = getCfg:getCfgPStack(cfg_globalsetup, robbery_item),

					%% 拥有道具个数
					HaveItemNumber = playerPackage:getItemNumByID(ItemID),

					%% 是否拥有足够的道具个数
					IsHaveItem = (HaveItemNumber >= NeedItemNumber),
					case IsHaveItem of
						true ->
							RoleID = playerState:getRoleID(),
							PID = activityMgrLogic:getActivityChildProcessName(?ActivityType_EscortGoods),
							Msg = {SequenceNumber, RoleID, playerState:getLevel(), playerState:getName(),IsHaveItem},
							case psMgr:call(PID, requestEscortRob, Msg, ?EscortCallTiomOut) of
								false ->
									%% 条件不满足
									playerMsg:sendErrorCodeMsg(?ErrorCode_Escort_NoEnoughRobItem),
									ok;
								{false, EscortType} ->
									%% 已经在其它护送中
									case EscortType of
										?EscortType_Solo -> playerMsg:sendErrorCodeMsg(?ErrorCode_Escort_Already_Solo_Escort);
										?EscortType_Team -> playerMsg:sendErrorCodeMsg(?ErrorCode_Escort_Already_Team_Escort)
									end,
									ok;
								{true, MapPID} ->
									%% 离开队伍
%%									case playerState:getTeamID() > 0 of
%%										true -> playerTeam2:leaveTeam(?PlayerTeamTypeNormal);
%%										_ -> skip
%%									end,
									playerTeam:leaveTeam(false),

									%% 扣除道具
									deleteItem(ItemID, NeedItemNumber, ?EscortType_Rob),
									#globalsetupCfg{setpara = ReviveList} = getCfg:getCfgPStack(cfg_globalsetup, robbery_revive_site),
									{TX,TY} = lists:nth(misc:rand(1, erlang:length(ReviveList)), ReviveList),
									playerScene:onRequestEnterActivityMap(?EscortMapID, MapPID,TX,TY),
									ok;
								error ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_Escort_request_rob_failed),
									ok;
								more ->
									%% 人数已经足够
									playerMsg:sendErrorCodeMsg(?ErrorCode_Escort_HaveMorePlayer_Rob),
									ok;
								nostart ->
									%% 活动未开启
									playerMsg:sendErrorCodeMsg(?ErrorCode_Escort_activity_nostart),
									ok;
								Error ->
									?ERROR_OUT("requestEscortRob:seq=~p,roleid=~p,error=~p", [SequenceNumber, RoleID, Error]),
									skip
							end;
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_Escort_NoEnoughRobItem)
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_Escort_EnterLevelLimit, [NeedLvl])
			end;
		_ ->
			skip
	end,
	ok.

deleteItem(ItemID, NeedItemNumber, Reason) ->
	%% 扣除道具
	Plog = #recPLogTSItem{
		old = NeedItemNumber,
		new = 0,
		change = -NeedItemNumber,
		target = ?PLogTS_Escort,
		source = ?PLogTS_PlayerSelf,
		gold = 0,
		goldtype = 0,
		changReason = ?ItemDeleteReasonEscort,
		reasonParam = Reason
	},
	playerPackage:delGoodsByID(?Item_Location_Bag, ItemID, NeedItemNumber, Plog),
	ok.

%% 请求多人护送列表
-spec requestEscortTeamList() -> ok.
requestEscortTeamList() ->
	core:sendMsgToActivity(?ActivityType_EscortGoods, requestEscortTeamList, playerState:getNetPid()),
	ok.

%% 接受触发事件
-spec acceptTriggerEvent() -> ok.
acceptTriggerEvent() ->
	case playerState:getMapID() =:= ?EscortMapID of
		true ->
			core:sendMsgToActivity(?ActivityType_EscortGoods, acceptTriggerEvent, playerState:getRoleID()),
			ok;
		_ ->
			skip
	end,
	ok.