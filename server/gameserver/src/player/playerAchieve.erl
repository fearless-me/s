%%%-------------------------------------------------------------------
%%% @author
%%% @copyright (C) 2014, <haowan123>
%%% @doc
%%% 玩家成就系统
%%% @end
%%% Created : 12. 一月 2015 17:30
%%%-------------------------------------------------------------------

-module(playerAchieve).
-author(tiancheng).


-include("playerPrivate.hrl").

-define(AchieveOpen, 0).	%% 成就开放
-define(AchieveClose, 1).	%% 成就未开放

-define(Condition1, -1). %%杀怪成就
-define(Condition2, -2). %%宝石镶嵌成就

-export([
	achieveEvent/1
]).

-export([
	initAchieve/0,
	achieveEvent/2,
	receiveAchieve/1,
	addAchieveValue/2,
	sendScheduleListToClient/1,
	saveAllAchieve/0,
	addFriendAchieve/0
]).

%%初始化成就
-spec initAchieve() -> ok.
initAchieve() ->
	AchieveList = playerState:getPlayerAchieveList(),
	%%addAchieveProp(playerPropSync:getProp(?PriProp_Achieve)),
	sendScheduleListToClient(AchieveList),
	addFriendAchieve(),
	ok.

%%领取成就值
-spec receiveAchieve(AchieveID::uint()) -> ok.
receiveAchieve(AchieveID) ->
	AchieveList = playerState:getPlayerAchieveList(),
	case canGetAchieve(AchieveID, AchieveList) of
		#recAchieve{
			aScheduleGetLevel = GetLevel
		} = Achieve ->
			NewAchieve = Achieve#recAchieve{ aScheduleGetLevel = GetLevel + 1 },
			NewAchieveList = lists:keyreplace(
				AchieveID, 
				#recAchieve.aID, 
				AchieveList, 
				NewAchieve
			),
			playerState:setPlayerAchieveList(NewAchieveList),
			addAchieveReward(AchieveID, GetLevel + 1),
			sendScheduleToClient(NewAchieve);
		Error ->
			playerMsg:sendErrorCodeMsg(Error)
	end.

%% 更新成就进度
-spec achieveEvent(MapID::uint()) -> ok.
achieveEvent(MapID) ->
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
	%%魔神地宫成就统计
		#mapsettingCfg{type = ?MapTypeCopyMap, subtype = ?MapSubTypeDemonBattle} ->
			achieveEvent(?Achieve_DevilHell, [1]);
		%#mapsettingCfg{type = ?MapTypeCopyMap, subtype = ?MapSubTypeMint} -> 废弃
		%	achieveEvent(?Achieve_MintFurnace, [1]);
		%#mapsettingCfg{type = ?MapTypeCopyMap, subtype = ?MapSubTypeBoot} -> 废弃
		%	achieveEvent(?Achieve_BootCamp, [1]);
		%#mapsettingCfg{type = ?MapTypeCopyMap, subtype = ?MapSubTypeStar} -> 废弃
		%	achieveEvent(?Achieve_StarTreasureHouse, [1]);
		%#mapsettingCfg{type = ?MapTypeCopyMap, subtype = ?MapSubTypeBooty} -> 废弃
		%	achieveEvent(?Achieve_BootyBay, [1]);
		%#mapsettingCfg{type = ?MapTypeCopyMap, subtype = ?MapSubTypeCompanion} -> 废弃
		%	achieveEvent(?Achieve_SoulPartner, [1]);
		%#mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeChaos} -> 废弃
		%	achieveEvent(?Achieve_ChaosBattlefield, [1]);
		#mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeDarkness} ->
			achieveEvent(?Achieve_DarkPlace1, [MapID, 1]),
			achieveEvent(?Achieve_DarkPlace2, [MapID, 1]),
			achieveEvent(?Achieve_DarkPlace3, [MapID, 1]),
			achieveEvent(?Achieve_DarkPlace4, [MapID, 1]),
			achieveEvent(?Achieve_DarkPlace5, [MapID, 1]);
		_ ->
			skip
	end,
	ok.

%%跟新成就进度
-spec achieveEvent(AchieveID::uint(), AchieveArg::list()) -> ok.
achieveEvent(AchieveID, AchieveArg) ->
	case isCompleteAchieve(AchieveID) of
		#achievementCfg{} = Cfg ->
			%% 成就未完成
			checkEvent(Cfg, AchieveID, AchieveArg);
		_ ->
			skip
	end.

%%勇者之路
-spec checkEvent(#achievementCfg{}, AchieveID::uint(), AchieveArg::list()) -> ok.
checkEvent(AchieveCfg, AchieveID, [_Param] = Arg) ->
	updateSchedule(AchieveCfg, AchieveID, Arg);
checkEvent(AchieveCfg, AchieveID, [_Param1, _Param2] = Arg) ->
	updateSchedule(AchieveCfg, AchieveID, Arg);
checkEvent(AchieveCfg, ErrorAchieveID, Arg) ->
	?ERROR_OUT("current achieveID [~p] error,AchieveCfg:[~p] Arg:[~p],", [ErrorAchieveID, AchieveCfg, Arg]),
	skip.

-spec checkCondition(#achievementCfg{}, AchieveID::uint(), AchieveList::list(), Arg::list()) -> boolean().
checkCondition(_, _, _, []) ->
	true;
checkCondition(_, _, _, [_Num]) ->
	true;
checkCondition(#achievementCfg{goal_kill = Goal, reward = Reward}, AchieveID, AchieveList, [ID, _]) ->
	case lists:keyfind(AchieveID, #recAchieve.aID, AchieveList)	of
		false ->
			[Condition, _, _] = lists:nth(1, Reward),
			case Condition of
				?Condition1 ->
					List = getConditionList(AchieveID, Goal, 1),
					lists:member(ID, List);
				?Condition2 ->
					List = getConditionList(AchieveID, Goal, 1),
					lists:member(ID, List);
				_ ->
					false
			end;
		#recAchieve{aScheduleLevel = Level} ->
			[Condition, _, _] = lists:nth(Level + 1, Reward),
			case Condition of
				?Condition1 ->
					List = getConditionList(AchieveID, Goal, 1),
					lists:member(ID, List);
				?Condition2 ->
					List = getConditionList(AchieveID, Goal, Level + 1),
					lists:member(ID, List);
				_ ->
					false
			end
	end;
checkCondition(_, _, _, _) ->
	false.

%% 成就是否完成
-spec isCompleteAchieve(AchieveID::uint()) -> boolean() | #achievementCfg{}.
isCompleteAchieve(AchieveID) ->
	case getCfg:getCfgByKey(cfg_achievement, AchieveID) of
		#achievementCfg{open = ?AchieveOpen, reward = ReWardList} = Cfg ->
			case lists:keyfind(AchieveID, #recAchieve.aID, playerState:getPlayerAchieveList()) of
				#recAchieve{aScheduleLevel = Level} ->
					case erlang:length(ReWardList) > Level of
						true ->
							%% 未完成，返回配置表
							Cfg;
						_ ->
							%% 已完成
							true
					end;
				_ ->
					%% 玩家还未开始做该成就，说明未完成
					Cfg
			end;
		_ ->
			%% 未找到成就项
			false
	end.

-spec canGetAchieve(AchieveID::uint(), AchieveList::[#recAchieve{},...]) -> uint() |#recAchieve{}.
canGetAchieve(AchieveID, AchieveList) ->
	case isExistAchieve(AchieveID, AchieveList) of
		#recAchieve{} = Achieve ->
			case isCanGetAchieve(Achieve) of
				true ->
					Achieve;
				Error ->
					Error
			end;
		Error1 ->
			Error1
	end.
	
-spec isExistAchieve(AchieveID::uint(), AchieveList::[#recAchieve{},...]) -> uint() | #recAchieve{}.
isExistAchieve(AchieveID, AchieveList) ->
	case lists:keyfind(AchieveID, #recAchieve.aID, AchieveList) of
		false ->
			?ErrorCode_AchieveErrorNotExist;
		#recAchieve{} = Achieve ->
			Achieve
	end.

-spec isCanGetAchieve(Achieve::#recAchieve{}) -> true | uint().
isCanGetAchieve(#recAchieve{
	aScheduleLevel = Level, 
	aScheduleGetLevel = GetLevel
	}) ->
	case Level > GetLevel of
		true ->
			true;
		_ ->
			?ErrorCode_AchieveErrorNotComplete
	end.

-spec updateSchedule(#achievementCfg{}, AchieveID::uint(),Arg::list()) -> ok.
updateSchedule(#achievementCfg{open = ?AchieveClose} = _AchieveCfg, _AchieveID, _Arg) ->
	%% 未开放
	ok;
updateSchedule(#achievementCfg{open = ?AchieveOpen, reward = RewardList} = AchieveCfg, AchieveID, Arg) ->
	AchieveList = playerState:getPlayerAchieveList(),
	case checkCondition(AchieveCfg, AchieveID, AchieveList, Arg) of
		true ->
			case lists:keyfind(AchieveID, #recAchieve.aID, AchieveList) of
				#recAchieve{} = Achieve ->
					NewAchieve = #recAchieve{} = updateRecAchieveArg(Achieve, RewardList, Arg),
					NewAchieveList = lists:keyreplace(
						AchieveID,
						#recAchieve.aID,
						AchieveList,
						NewAchieve
					);
				_ ->
					{CurNum, CurLevel, CurGetLevel} = initRecAchieveArg(AchieveID, RewardList, Arg),
					NewAchieve = #recAchieve{
						aID = AchieveID,
						aScheduleNum = CurNum,
						aScheduleLevel = CurLevel,
						aScheduleGetLevel = CurGetLevel
					},
					NewAchieveList = [NewAchieve | AchieveList]
			end,
			playerState:setPlayerAchieveList(NewAchieveList),
			sendScheduleToClient(NewAchieve);
		_ ->
			skip
	end,
	ok.

-spec initRecAchieveArg(AchieveID::uint(), RewardList::list(), Arg::list()) -> {uint(), uint(), uint()}.
initRecAchieveArg(AchieveID, [], _) ->
	?ERROR_OUT("achievementCfg [~p] error, no find rewardList", [AchieveID]),
	{0, 0, 0};
initRecAchieveArg(_AchieveID, _RewardList, []) ->
	{1, 1, 0};
initRecAchieveArg(AchieveID, RewardList, Arg) ->
	case Arg of
		[Num] ->
			{CurLevel, CurNum} = getSchedule(0, Num, 0, RewardList);
		[_ID, Num] ->
			{CurLevel, CurNum} = getSchedule(0, Num, 0, AchieveID, RewardList)
	end,
	{CurNum, CurLevel, 0}.

-spec updateRecAchieveArg(Achieve::#recAchieve{}, RewardList::list(), Arg::list()) -> #recAchieve{}.
updateRecAchieveArg(Achieve, [], _) ->
	?ERROR_OUT("achievementCfg [~p] error, no find rewardList", [Achieve#recAchieve.aID]),
	Achieve;
updateRecAchieveArg(Achieve, RewardList, Arg) ->
	#recAchieve{
		aID = AchieveID,
		aScheduleNum = ScheduleNum,
		aScheduleLevel = Level
	} = Achieve,
	case Arg of
		[Num] ->
			{CurLevel, CurNum} = getSchedule(Level, Num, ScheduleNum, RewardList);
		[_ID, Num] ->
			{CurLevel, CurNum} = getSchedule(Level, Num, ScheduleNum, AchieveID, RewardList)
	end,
	Achieve#recAchieve{
		aScheduleNum = CurNum,
		aScheduleLevel = CurLevel
	}.
	

getSchedule(CurLevel, CurNum, _ScheduleNum, RewardList) when CurLevel =:= length(RewardList) ->
	[MaxNum, _, _] = lists:nth(CurLevel, RewardList),
	case MaxNum > 0 of
		true ->
			{CurLevel, MaxNum};
		_ ->
			{CurLevel, CurNum}
	end;
getSchedule(CurLevel, CurNum, ScheduleNum, RewardList) ->
	[MaxNum, _, _] = lists:nth(CurLevel + 1, RewardList),
	case MaxNum > 0 of
		true ->
			case CurNum + ScheduleNum >= MaxNum of
				true ->
					getSchedule(CurLevel + 1, CurNum, ScheduleNum, RewardList);
				_ ->
					{CurLevel, CurNum + ScheduleNum}
			end;
		_ ->
			{CurLevel, CurNum}
	end.

getSchedule(CurLevel, _CurNum, _ScheduleNum, AchieveID, RewardList) when CurLevel =:= length(RewardList) ->
	[MaxNum, _, _] = lists:nth(CurLevel, RewardList),
	case MaxNum < 0 of
		true ->
			{CurLevel, getNextMaxNum(AchieveID, CurLevel)};
		_ ->
			{CurLevel, _CurNum}
	end;
getSchedule(CurLevel, CurNum, ScheduleNum, AchieveID, RewardList) ->
	[MaxNum, _, _] = lists:nth(CurLevel + 1, RewardList),
	case MaxNum of
		?Condition1 ->
			NewMaxNum = getNextMaxNum(AchieveID, CurLevel + 1),
			case CurNum + ScheduleNum >= NewMaxNum of
				true ->
					getSchedule(CurLevel + 1, CurNum, ScheduleNum, AchieveID, RewardList);
				_ ->
					{CurLevel, CurNum + ScheduleNum}
			end;
		?Condition2 ->
			NewMaxNum = getNextMaxNum(AchieveID, CurLevel + 1),
			case CurNum + ScheduleNum >= NewMaxNum of
				true ->
					{CurLevel + 1, 0};
				_ ->
					{CurLevel, CurNum + ScheduleNum}
			end;
		_ ->
			{CurLevel, CurNum}
	end.

-spec getNextMaxNum(AchieveID :: uint(), NewLevel :: uint()) -> uint().
getNextMaxNum(AchieveID, NewLevel) ->
	#achievementCfg{
		goal_kill = Goal
	} = getCfg:getCfgPStack(cfg_achievement, AchieveID),
	case Goal of
		[] ->
			?ERROR_OUT("achievementCfg [~p] error, goal_kill is not list", [AchieveID]),
			0;
		_ when is_list(Goal) ->
			GoalTuple = lists:nth(NewLevel, Goal),
			lists:last(GoalTuple);
		_ ->
			?ERROR_OUT("achievementCfg [~p] error, goal_kill is not list", [AchieveID]),
			0
	end.

-spec getConditionList(AchieveID :: uint(), Goal :: list(), NewLevel :: uint()) -> list().
getConditionList(AchieveID, Goal, NewLevel) ->
	case Goal of
		[] ->
			?ERROR_OUT("achievementCfg [~p] error, goal_kill is not list", [AchieveID]),
			[];
		_ when  is_list(Goal) ->
			List = lists:nth(NewLevel, Goal),
			case is_list(List) of
				true ->
					lists:sublist(List, 1, length(List) - 1);
				_ ->
					?ERROR_OUT("achievementCfg [~p] newlvel [~p] error, goal_kill is not list",
						[AchieveID,NewLevel]),
					[]
			end;
		_ ->
			?ERROR_OUT("achievementCfg [~p] error, goal_kill is not list", [AchieveID]),
			[]
	end.

-spec addAchieveReward(AchieveID :: uint(), GetLevel::uint()) -> boolean().
addAchieveReward(AchieveID, GetLevel) ->
	#achievementCfg{
				titleid = Titles,
				reward = ReWardList
	} = getCfg:getCfgPStack(cfg_achievement, AchieveID),


	[_, AchieveValue, DiamondValue] = lists:nth(GetLevel, ReWardList),
	addAchieveTitle(GetLevel, Titles),
	%%addAchieveProp(AchieveValue),
	addAchieveValue(AchieveID, AchieveValue),
	playerMoney:addCoin(?CoinTypeBindDiamond, DiamondValue,
		#recPLogTSMoney{reason = ?CoinSourceAchieve, param = AchieveID, target = ?PLogTS_PlayerSelf, source = ?PLogTS_AchieveSystem}).

-spec addAchieveTitle(Level::uint(), Titles::undefined | list()) -> ok.
addAchieveTitle(_, undefined) ->
	ok;
addAchieveTitle(_, []) ->
	ok;
addAchieveTitle(Level, Titles) ->
	ID = lists:nth(Level, Titles),
	case ID =/= 0 of
		true ->
			playerTitle:addTitle(ID, ?TitleSourceAchieve);
		_ ->
			skip
	end.
						
-spec addAchieveValue(AchieveID :: uint(), AchieveValue :: uint()) -> ok.
addAchieveValue(AchieveID, AchieveValue) ->
	OldValue = playerPropSync:getProp(?PriProp_Achieve),
	NewValue = OldValue + AchieveValue,
	achieveEvent(?Achieve_Achieve1, [AchieveValue]),
	%%achieveEvent(?Achieve_Achieve2, [AchieveValue]),
	playerPropSync:setInt(?PriProp_Achieve, NewValue),
	dbLog:sendSaveLogAchieveNum(playerState:getRoleID(), AchieveID, OldValue, AchieveValue, NewValue),
	ok.


addFriendAchieve()->

	AchieveList = playerState:getPlayerAchieveList(),
	Num =
		case isExistAchieve(?Achieve_Social_Event8,AchieveList) of
			#recAchieve{aScheduleNum = Num_} ->
				Num_;
			_ ->
				0
		end,
	#recFriend2Data{relations = Relations} = friend2State:queryFriend2Data(playerState:getRoleID()),
	ListFriend = friend2State:queryRelations(Relations, ?RELATION_FORMAL),
	Count = erlang:length(ListFriend),
	NewFriendCount =  Count - Num,
	case NewFriendCount > 0 of
		true ->
			playerAchieve:achieveEvent(?Achieve_Social_Event8, [NewFriendCount]);
		_ ->
			skip
	end,
	ok.


	
-spec sendScheduleToClient(Achieve::#recAchieve{}) -> ok.
sendScheduleToClient(#recAchieve{
		aScheduleLevel = NewLevel,
		aID = NewID,
		aScheduleNum = NewNum,
		aScheduleGetLevel = NewGetLevel
	} = _Achieve) ->
	Msg = #pk_GS2U_AchieveSchedule{
		achieveID = NewID,
		scheduleCompleteNum = NewNum,
		scheduleRewardID = NewGetLevel,
		scheduleCompleteID = NewLevel
	},
	playerMsg:sendNetMsg(Msg).

%%下线和定时保存所有成就
-spec saveAllAchieve() -> ok.
saveAllAchieve() ->
	case playerState:getIsPlayer() of
		true ->
			case playerState:getPlayerAchieveList() of
				List when erlang:is_list(List)->
					RoleID = playerState:getRoleID(),

					%% 与内存中的数据比较，有变化再存储
					Sql = qlc:q([
						#recAchieve{aID = AID, aScheduleLevel = ASID, aScheduleGetLevel = AGLvl, aScheduleNum  = ANum}
						|| #rec_achieve{roleID = {RID, AID}, achieveSID = ASID, achieveLevel = AGLvl, achieveSnum = ANum}
							<- mnesia:table(rec_achieve), RID =:= RoleID
					]),
					OldAchieveList = edb:selectRecord(Sql),

					%% 过滤掉没有改变的
					NeedSaveList = lists:filter(fun(DA) -> not lists:member(DA, OldAchieveList) end, List),

					%% 保存改变的
					[playerSave:saveAchieve(Achieve) || Achieve <- NeedSaveList],
					ok;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

-spec sendScheduleListToClient(AchieveList::[#recAchieve{},...]) -> ok.
sendScheduleListToClient(AchieveList) ->
	Fun = fun(#recAchieve{} = Achieve) ->
		#pk_AchieveSchedule{
			achieveID = Achieve#recAchieve.aID,
			scheduleCompleteNum = Achieve#recAchieve.aScheduleNum,
			scheduleCompleteID = Achieve#recAchieve.aScheduleLevel,
			scheduleRewardID  = Achieve#recAchieve.aScheduleGetLevel
		}
	end,
	ScheduleList = lists:map(Fun, AchieveList),
	Msg = #pk_GS2U_AchieveScheduleList{
		scheduleList = ScheduleList
	},
	playerMsg:sendNetMsg(Msg).
	
