%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%% 玩家日常环任务模块，简称“环任务”，又称“轮-环任务”，旧称“环-击杀”任务
%%%-------------------------------------------------------------------
%%% fixme 该部分备注陈旧，仅做参考。现有日常任务归属于家族日常任务
%%%   该任务组为“轮-环”的结构，但习惯性称之为“环任务”。为了明确说明其子任务，下文称之为“环”或“单环”，注意区别
%%%   玩家接受“环任务”有等级限制，受globalsetup dailytask_levellimit控制
%%%   玩家每日最多可完成X轮“环任务”，每轮Y环
%%%     X（轮）的值受cfg_globalsetup->dailytask_number控制，记录于每日计数的?DailyType_LoopTaskNum
%%%       每日凌晨4点重置计数器，并重置任务状态
%%%     B（环）的值受宏?LoopTaskAcceptNum控制，记录于同步属性的?PriProp_LoopTaskProcess
%%%       每环根据玩家等级从cfg_dailytask中获取任务组ID，再以此从cfg_task_new中随机抽取任务ID
%%%   每环与每轮皆有任务奖励，自动发放
%%%   玩家可花费一定货币完成当前轮中的当前环，或直接完成当前轮中的剩余环
%%% 注意：
%%%   若cfg_dailytask、cfg_task_new改动导致单环任务ID的减少，可能会引起系统无法正常重置玩家的任务状态，需要转档处理
%%%   loopTask通常所指单环任务
%%%-------------------------------------------------------------------
%%% @end
%%% Created : 20160829
%%%-------------------------------------------------------------------
-module(playerLoopTask).
-author("meitianyang").

-include("playerPrivate.hrl").

%% 奖励类型宏定义以减少原子使用
-define(Reward_BEGIN,			1).
-define(Reward_Exp,				1).	%% 经验
-define(Reward_Gold,			2).	%% 金币（原绑金，后来取消了绑金的概念，合并入非绑金）
-define(Reward_Item,			3).	%% 道具
-define(Reward_GuildResource,	4).	%% 家族资金（从属于家族的资源）
-define(Reward_GuildContribute,	5). %% 家族贡献（从属于个人货币，类型12
-define(Reward_GuildLiveness,	6). %% 家族活跃（从属于家族的资源
-define(Reward_END,				6).
-type reward() :: ?Reward_BEGIN .. ?Reward_END.


%%% ====================================================================
%%% API functions
%%% ====================================================================


-export([
	isAccepted/0,         % 是否接受了“环任务”
	accept/0,             % 接受下一个单环任务
	onReset/2,            % 重置任务状态，可当作查询函数执行
	oneKeyCompleteAll/0,  % 一键完成
	oneKeyCompleteOne/0,  % 单次完成
	onTaskComplete/2
]).

%% just for playerTask
-export([
	isLoopTask/1,         % 是否是单环任务
	onCountLoopTask/2,     % 成功提交单环任务后调用该函数以计数，后续可能自动发奖、继续接受单环任务
	acceptLink/0
]).

%% just for gm
-export([
	accept_gm/0,          % 突破限制直接领取单环任务，可能具有破坏性，仅限GM使用
	oneKeyComplete_gm/1   % 忽略开销直接一键完成，仅限GM使用
]).


onTaskComplete(?TaskMainType_EveryDay, TaskID)->
	playerPropSync:setInt(?PriProp_LoopTaskProcess, playerPropSync:getProp(?PriProp_LoopTaskProcess)+1),
	Progress = playerPropSync:getProp(?PriProp_LoopTaskProcess),
	Level = playerState:getLevel(),
	case Progress >= ?LoopTaskAcceptNum  of
		true ->
			%% 完成一个环任务，主动接取引导任务
			onCountLoopTask([], 0);
		_ ->
			%% 尝试继续任务
			autoAccept()
	end,
	playerMsg:sendNetMsg(#pk_GS2U_AddNewCompleteLoopTasks{
		listLevel = [Level],
		listTaskID = [TaskID],
		result = 0,
		progress = Progress,
		allProgress = ?LoopTaskAcceptNum
	});
onTaskComplete(_TaskType, _TaskID)->
	skip.

-spec isAccepted() -> true|false.
isAccepted() ->
	ListLoopTaskID = getLoopTaskID(all),
	FunPair =
		fun(#rec_task{taskID = TaskID}, Result) ->
			case lists:member(TaskID, ListLoopTaskID) of
				true ->
					true;
				_ ->
					Result
			end
		end,
	lists:foldl(FunPair, false, playerState:getAcceptedTask()).

%% 获取领取环任务的等级限制
getLevelLimit()->
	case getCfg:getCfgByKey(cfg_globalsetup, dailytask_levellimit) of
		#globalsetupCfg{setpara = [LevelLimit_]} ->
			LevelLimit_;
		_ ->
			?ERROR_OUT("can not find key dailytask_levellimit from cfg_globalsetup", []),
			999 %% 无法找到相关配置，设置一个很大的值直接限制住
	end.


-spec accept() -> {ok, TaskID::uint()} | {error, ErrorCode::uint()}.
accept() ->
	%% LUN-4475 【协议测试】【家族任务】在角色未加入家族情况下，可以使用协议直接发送请求接收家族任务和完成家族任务
	case playerState:getGuildID() of
		0 ->
			{error, ?ErrorCode_GuildNotJoin};
		_ ->
			%% 01.等级限制
			LevelLimit = getLevelLimit(),
			Level = playerState:getLevel(),
			case Level >= LevelLimit of
				false ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_TaskFailed_Level),
					{error, ?ErrorCode_TaskFailed_Level};
				_ ->
					%% 02.接受状态
					case isAccepted() of
						true ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_TaskFailed_IsExit),
							{error, ?ErrorCode_TaskFailed_IsExit};
						_ ->
							%% 03.每日计数限制
							DailyCountMax = getDailyCountMax(),
							DailyCount = playerDaily:getDailyCounter(?DailyType_LoopTaskNum, 0),
							case DailyCount < DailyCountMax of
								false ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_TaskFailed_IsMax),
									{error, ?ErrorCode_TaskFailed_IsMax};
								true ->
									%% 04.随机抽取任务ID并接受
									case randTaskID(Level) of
										{ok, TaskID} ->
											case playerTask:acceptTask(TaskID, 0) of
												true ->
													%% 取消引导任务
													cancelLoopLindTask(),
													RoleID = playerState:getRoleID(),
													LoopCount = playerPropSync:getProp(?PriProp_LoopTaskProcess),
													?LOG_OUT("loopTask accept : ~p~nlv(~p),daiylyCount(~p),loopCount(~p),newTaskID(~p)", [RoleID, Level, DailyCount, LoopCount, TaskID]),
													playerLogAdd:addLogParticipatorInfo(?LogParticipator_PlayerLoopTaskID),
													{ok, TaskID};
												Err_acceptTask ->
													Err_acceptTask
											end;
										Err_randTaskID ->
											Err_randTaskID
									end
							end
					end
			end
	end.

%%主动接取环任务的引导链接任务
acceptLink() ->
	%% 01.等级限制
	LevelLimit =getLevelLimit(),
	Level = playerState:getLevel(),
	case Level >= LevelLimit of
		true ->
			%% 02.接受状态
			case isAccepted() of
				true ->
					skip;
				_ ->
					%% 03.每日计数限制
					acceptLoopLinkTask()
			end;
		_ ->
			skip
	end.

%% Type::0|1对应#pk_GS2U_AddNewCompleteLoopTasks.result的值
-spec getReward(TaskIDList::[uint(),...], Type::0|1) -> {ok, Level::uint()} | {error, ErrorCode::uint()}.
getReward(TaskIDList, Type) ->
	%% 仅验证单环进度
	LoopCount = playerPropSync:getProp(?PriProp_LoopTaskProcess),
	case LoopCount < ?LoopTaskAcceptNum of
		true ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_TaskFailed_LoopTaskFail, [?LoopTaskAcceptNum - LoopCount]),
			{error, ?ErrorCode_TaskFailed_LoopTaskFail};
		_ ->
			Level = playerState:getLevel(),
			Ret =
				case getCfg:getCfgByKey(cfg_dailytask, Level) of
					#dailytaskCfg{reward_exp = Exp, reward_item1 = Item1, reward_item2 = Item2,
						reward_money = BindGold, reward_guildresource = Res,
						reward_contribute = Ctb, reward_active = Liv} ->
						%% 发奖
						ExpForLog = getReward_(?Reward_Exp, Exp),
						BindGoldForLog = getReward_(?Reward_Gold, BindGold),
						Item1ForLog = getReward_(?Reward_Item, Item1),
						Item2ForLog = getReward_(?Reward_Item, Item2),
						ResForLog = getReward_(?Reward_GuildResource, Res),
						CtbForLog = getReward_(?Reward_GuildContribute, Ctb),
						LivForLog = getReward_(?Reward_GuildLiveness, Liv),
						RoleID = playerState:getRoleID(),
						DailyCount = playerDaily:getDailyCounter(?DailyType_LoopTaskNum, 0),
						?LOG_OUT("loopTask getReward : ~w~nlv(~w),dailyCount(~w),exp(~w),bindGold(~w),item1(~w),item2(~w),Res(~w),Ctb(~w),Liv(~w)",
							[RoleID, Level, DailyCount, ExpForLog, BindGoldForLog, Item1ForLog, Item2ForLog, ResForLog, CtbForLog, LivForLog]),
						{ok, Level};
					_ ->
						%% 配置异常时无法发奖，向客户端说明任务不存在
						?ERROR_OUT("can not find key ~p from cfg_dailytask", [Level]),
						%%playerMsg:sendErrorCodeMsg(?ErrorCode_TaskFailed_IsNotExit),
						{ok, Level}
				end,
			%% 无论是否领奖成功，依然算作完成任务
			?DEBUG_OUT("[looptask] complete some task ~p", [TaskIDList]),
			case Ret of
				{ok, _} ->
					playerMsg:sendNetMsg(#pk_GS2U_AddNewCompleteLoopTasks{
						listLevel = [Level],
						listTaskID = TaskIDList,
						result = Type,
						progress = ?LoopTaskAcceptNum,
						allProgress = ?LoopTaskAcceptNum
					});
				_ ->
					playerMsg:sendNetMsg(#pk_GS2U_AddNewCompleteLoopTasks{
						listLevel = [Level],
						listTaskID = TaskIDList,
						result = Type,
						progress = ?LoopTaskAcceptNum,
						allProgress = ?LoopTaskAcceptNum
					})
			end,
			playerPropSync:setInt(?PriProp_LoopTaskProcess, 0),               %% 重置单环进度
			playerDaily:incDailyCounter(?DailyType_LoopTaskNum, 0),           %% 累计每日计数
			playerliveness:onFinishLiveness(?LivenessLoopTask, 1),            %% 累计活跃度，受配置限制cfg_dailyActive(?LivenessLoopTask)->limit
			playerSevenDays:onMissionEvent(?SevenDayMission_Event_12, 1, 0),  %% 累计七日任务进度
			Ret
	end.


-spec onReset(Reason::any(), {IsCancelTask::true|false, IsResetLoopCount::true|false, IsResetDailyCount::true|false}) ->
	{TaskID::uint(), LoopCount::uint(), DailyCount::uint()}.
onReset(Reason, {IsCancelTask, IsResetLoopCount, IsResetDailyCount}) ->
	%% 记录旧值用于记录日志
	LoopCount_Old = playerPropSync:getProp(?PriProp_LoopTaskProcess),
	DailyCount_Old = playerDaily:getDailyCounter(?DailyType_LoopTaskNum, 0),
	%% 根据传参重置计数
	case IsResetLoopCount of
		true ->
			playerPropSync:setInt(?PriProp_LoopTaskProcess, 0);
		_ ->
			skip
	end,
	case IsResetDailyCount of
		true ->
			playerDaily:zeroDailyCount(?DailyType_LoopTaskNum, 0);
		_ ->
			skip
	end,
	%% 根据传参删除已领取的单环任务（如果发生系统错误可能有多个）
	ListLoopTaskID = getLoopTaskID(all),
	FunCancel =
		fun(#rec_task{taskID = TaskID}, Result) ->
			case lists:member(TaskID, ListLoopTaskID) of
				true ->
					case IsCancelTask of
						true ->
							playerTask:cancelTask(TaskID);
						_ ->
							skip
					end,
					[TaskID | Result];
				_ ->
					Result
			end
		end,
	ListCancelTaskID = lists:foldl(FunCancel, [], playerState:getAcceptedTask()),
	?LOG_OUT("loopTask reset : ~p~nReason:~p,oldLoopCount:~p,IsResetLoopCount:~p,oldDailyCount:~p,IsResetDailyCount:~p,IsCancelTask:~p,~nlistCancelTaskID:~p",
		[playerState:getRoleID(), Reason, LoopCount_Old, IsResetLoopCount, DailyCount_Old, IsResetDailyCount, IsCancelTask, ListCancelTaskID]),
	%% 返回值
	{_, TaskID_Now} = getAcceptedLoopTaskID(),
	{TaskID_Now, playerPropSync:getProp(?PriProp_LoopTaskProcess), playerDaily:getDailyCounter(?DailyType_LoopTaskNum, 0)}.


-spec oneKeyCompleteAll() -> {ok, Count::uint()} | {error, ErrorCode::uint()}.
oneKeyCompleteAll() ->
	%% LUN-4475 【协议测试】【家族任务】在角色未加入家族情况下，可以使用协议直接发送请求接收家族任务和完成家族任务
	case playerState:getGuildID() of
		0 ->
			{error, ?ErrorCode_GuildNotJoin};
		_ ->
			LevelLimit = getLevelLimit(),
			Level = playerState:getLevel(),
			case Level >= LevelLimit of
				false ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_TaskFailed_Level),
					{error, ?ErrorCode_TaskFailed_Level};
				_ ->
					Remainder1 = getRemainder(),
					Remainder2 = parseRemainder(Remainder1),
					case Remainder2 of
						{ok, ListTaskID1, NeedCompleteCount1} ->
							case decCoinForOneKeyComplete(NeedCompleteCount1) of
								{ok, _, _} ->
									submitTaskOneKeyComplete({ListTaskID1, NeedCompleteCount1});
								Err_dec1 ->
									Err_dec1
							end;
						{ok, ListTaskID2, NeedCompleteCount2, TaskID_Old} ->
							case decCoinForOneKeyComplete(NeedCompleteCount2) of
								{ok, _, _} ->
									playerTask:cancelTask(TaskID_Old),
									submitTaskOneKeyComplete({ListTaskID2, NeedCompleteCount2});
								Err_dec2 ->
									Err_dec2
							end;
						_ ->
							Remainder2
					end
			end
	end.


-spec oneKeyCompleteOne() -> {ok, Count::uint()} | {error, ErrorCode::uint()}.
oneKeyCompleteOne() ->
	%% LUN-4475 【协议测试】【家族任务】在角色未加入家族情况下，可以使用协议直接发送请求接收家族任务和完成家族任务
	case playerState:getGuildID() of
		0 ->
			{error, ?ErrorCode_GuildNotJoin};
		_ ->
			LevelLimit = getLevelLimit(),
			Level = playerState:getLevel(),
			case Level >= LevelLimit of
				false ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_TaskFailed_Level),
					{error, ?ErrorCode_TaskFailed_Level};
				_ ->
					Remainder1 = getRemainder(),
					Remainder2 = parseRemainder(Remainder1),
					case Remainder2 of
						{ok, ListTaskID1, NeedCompleteCount1} ->
							case NeedCompleteCount1 > 0 of
								true ->
									case decCoinForOneKeyComplete(1) of
										{ok, _, _} ->
											[H|_] = ListTaskID1,
											submitTaskOneKeyComplete({[H], 1});
										Err_dec1 ->
											Err_dec1
									end;
								_ ->
									?ERROR_OUT("invalid logic ~p~n~p", [Remainder2, misc:getStackTrace()]),
									playerMsg:sendErrorCodeMsg(?ErrorCode_TaskFailed_SubmitFail),
									{error, ?ErrorCode_TaskFailed_SubmitFail}
							end;
						{ok, _, NeedCompleteCount2, TaskID_Old} ->
							case NeedCompleteCount2 > 0 of
								true ->
									case decCoinForOneKeyComplete(1) of
										{ok, _, _} ->
											playerTask:cancelTask(TaskID_Old),
											submitTaskOneKeyComplete({[TaskID_Old], 1});
										Err_dec2 ->
											Err_dec2
									end;
								_ ->
									?ERROR_OUT("invalid logic ~p~n~p", [Remainder2, misc:getStackTrace()]),
									playerMsg:sendErrorCodeMsg(?ErrorCode_TaskFailed_SubmitFail),
									{error, ?ErrorCode_TaskFailed_SubmitFail}
							end;
						_ ->
							Remainder2
					end
			end
	end.



%%% ====================================================================
%%% API functions just for playerTask
%%% ====================================================================


-spec isLoopTask(TaskID::uint()) -> true | false.
isLoopTask(TaskID) ->
	ListLoopTask = getLoopTaskID(all),
	lists:member(TaskID, ListLoopTask).

%% Type::0|1对应#pk_GS2U_AddNewCompleteLoopTasks.result的值
-spec onCountLoopTask(TaskIDList::[uint(),...], Type::0|1) ->
	{continue, TaskID::uint()} | {complete, DailyCount::uint()} | {error, ErrorCode::uint()}.
onCountLoopTask(TaskIDList, Type) ->
	%% 进度
	Progress = erlang:length(TaskIDList)+playerPropSync:getProp(?PriProp_LoopTaskProcess),
	playerPropSync:setInt(?PriProp_LoopTaskProcess, Progress),
	%% 尝试领奖（十环）
	case Progress >= ?LoopTaskAcceptNum of
		true ->
			%% 完成一个环任务，主动接取引导任务
			getReward(TaskIDList, Type),
			acceptLink();
		_ ->
			%% 尝试继续任务
			autoAccept()
	end.

autoAccept()->
	DailyCountMax = getDailyCountMax(),
	DailyCount = playerDaily:getDailyCounter(?DailyType_LoopTaskNum, 0),
	case DailyCount < DailyCountMax of
		true ->
			accept();
		_ ->
			skip

	end.

%%% ====================================================================
%%% API functions just for gm
%%% ====================================================================


-spec accept_gm() -> {ok, TaskID::uint()} | {error, ErrorCode::uint()}.
accept_gm() ->
	%% 随机抽取任务ID并接受
	Level = erlang:min(playerState:getLevel(), getLevelLimit()),
	case randTaskID(Level) of
		{ok, TaskID} ->
			case playerTask:acceptTask(TaskID, 0) of
				true ->
					RoleID = playerState:getRoleID(),
					LoopCount = playerPropSync:getProp(?PriProp_LoopTaskProcess),
					DailyCount = playerDaily:getDailyCounter(?DailyType_LoopTaskNum, 0),
					?LOG_OUT("loopTask accept_gm : ~p~nlv(~p),daiylyCount(~p),loopCount(~p),newTaskID(~p)", [RoleID, Level, DailyCount, LoopCount, TaskID]),
					playerLogAdd:addLogParticipatorInfo(?LogParticipator_PlayerLoopTaskID),
					{ok, TaskID};
				Err_acceptTask ->
					Err_acceptTask
			end;
		Err_randTaskID ->
			Err_randTaskID
	end.



-spec oneKeyComplete_gm(WantCompleteCount::uint()) -> {ok, Count::uint()} | {error, ErrorCode::uint()}.
oneKeyComplete_gm(WantCompleteCount) ->
	Remainder1 = getRemainder(),
	Remainder2 = parseRemainder(Remainder1),
	FunGet =
		fun(ID, {Result, Count}) ->
			case Count of
				WantCompleteCount ->
					{Result, Count};
				_ ->
					{[ID | Result], Count + 1}
			end
		end,
	case Remainder2 of
		{ok, ListTaskID1, NeedCompleteCount1} ->
			case decCoinForOneKeyComplete(NeedCompleteCount1) of
				{ok, _, _} ->
					case WantCompleteCount of
						V when erlang:is_integer(V) andalso V >= 0 andalso V=< NeedCompleteCount1 ->
							ListTaskIDNew1 = lists:reverse(lists:foldl(FunGet, {[], 0}, ListTaskID1)),
							submitTaskOneKeyComplete({ListTaskIDNew1, WantCompleteCount});
						_ ->
							submitTaskOneKeyComplete({ListTaskID1, NeedCompleteCount1})
					end;
				Err_dec1 ->
					Err_dec1
			end;
		{ok, ListTaskID2, NeedCompleteCount2, TaskID_Old} ->
			case decCoinForOneKeyComplete(NeedCompleteCount2) of
				{ok, _, _} ->
					playerTask:cancelTask(TaskID_Old),
					case WantCompleteCount of
						V when erlang:is_integer(V) andalso V >= 0 andalso V=< NeedCompleteCount2 ->
							ListTaskIDNew2 = lists:reverse(lists:foldl(FunGet, {[], 0}, ListTaskID2)),
							submitTaskOneKeyComplete({ListTaskIDNew2, WantCompleteCount});
						_ ->
							submitTaskOneKeyComplete({ListTaskID2, NeedCompleteCount2})
					end;
				Err_dec2 ->
					Err_dec2
			end;
		_ ->
			Remainder2
	end.


%%% ====================================================================
%%% Internal functions
%%% ====================================================================

-spec getLoopTaskID(GroupID::uint()|all) -> [uint(),...].
getLoopTaskID(GroupID) when erlang:is_integer(GroupID) ->
	ListKeyTaskNew = getCfg:get1KeyList(cfg_task),
	FunGetTaskID =
		fun(Key, Result) ->
			case getCfg:getCfgByKey(cfg_task, Key) of
				#taskCfg{groupid = GroupID_} ->
					case GroupID_ =:= GroupID of
						true ->
							[Key | Result];
						_ ->
							Result
					end;
				_ ->
					?ERROR_OUT("can not find key ~p from cfg_task", [Key]),
					Result
			end
		end,
	lists:foldl(FunGetTaskID, [], ListKeyTaskNew);
getLoopTaskID(all) ->
	%% 获取不重复的任务组ID
	ListKeyDailyTask = getCfg:get1KeyList(cfg_dailytask),
	FunGetGroupID =
		fun(Key) ->
			#dailytaskCfg{group = GroupID} = getCfg:getCfgPStack(cfg_dailytask, Key),
			GroupID
		end,
	ListGroupID_A = lists:map(FunGetGroupID, ListKeyDailyTask),
	ListGroupID_B = lists:usort(ListGroupID_A),
	%% 根据任务组ID获取任务ID
	ListKeyTaskNew = getCfg:get1KeyList(cfg_task),
	FunGetTaskID =
		fun(Key, Result) ->
			case getCfg:getCfgByKey(cfg_task, Key) of
				#taskCfg{groupid = GroupID} ->
					case lists:member(GroupID, ListGroupID_B) of
						true ->
							[Key | Result];
						_ ->
							Result
					end;
				_ ->
					?ERROR_OUT("can not find key ~p from cfg_task", [Key]),
					Result
			end
		end,
	lists:foldl(FunGetTaskID, [], ListKeyTaskNew);
getLoopTaskID(_P) ->
	?ERROR_OUT("invalid param ~p~n~p", [_P, misc:getStackTrace()]).


-spec randTaskID(Level::uint()) -> {ok, TaskID::uint()} | {error, ErrorCode::uint()}.
randTaskID(Level) ->
	%% 获取不重复的任务组ID
	ListKeyDailyTask = getCfg:get1KeyList(cfg_dailytask),
	FunGetGroupID =
		fun(Key, Result) ->
			case getCfg:getCfgPStack(cfg_dailytask, Key) of
				#dailytaskCfg{group = GroupID, level = Level} ->	% 此处Level为匹配
					[GroupID | Result];
				_ ->
					Result
			end
		end,
	ListGroupID_A = lists:foldl(FunGetGroupID, [], ListKeyDailyTask),
	ListGroupID_B = lists:usort(ListGroupID_A),
	%% 根据任务组ID获取任务ID
	ListKeyTaskNew = getCfg:get1KeyList(cfg_task),
	FunGetTaskID =
		fun(Key, Result) ->
			case getCfg:getCfgByKey(cfg_task, Key) of
				#taskCfg{groupid = GroupID} ->
					case lists:member(GroupID, ListGroupID_B) of
						true ->
							[Key | Result];
						_ ->
							Result
					end;
				_ ->
					?ERROR_OUT("can not find key ~p from cfg_task", [Key]),
					Result
			end
		end,
	%% 非空则随机抽取任务ID
	case lists:foldl(FunGetTaskID, [], ListKeyTaskNew) of
		[] ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_TaskFailed_IsNotExit),
			{error, ?ErrorCode_TaskFailed_IsNotExit};
		ListTaskID ->
			Max = erlang:length(ListTaskID),
			Rand = misc:rand(1, Max),
			TaskID = lists:nth(Rand, ListTaskID),
			{ok, TaskID}
	end.

-spec getReward_(RewardType::reward(), RewardData::any()) ->
	{RewardDataForLog::any()}.
getReward_(?Reward_Exp, RewardData) ->
	case RewardData of
		Exp when erlang:is_integer(Exp) andalso Exp > 0 ->
			%% 合法的数值，正常奖励
			playerBase:addExp(Exp, ?ExpSourceTask, 0),
			Exp;
		_ ->
			%% 无法识别的格式
			RewardData
	end;
getReward_(?Reward_Gold, RewardData) ->
	case RewardData of
		BindGold when erlang:is_integer(BindGold) andalso BindGold > 0 ->
			%% 合法的数值，正常奖励
			playerMoney:addCoin(?CoinTypeGold, BindGold, #recPLogTSMoney{reason=?CoinSourceTask,param=0,target=?PLogTS_PlayerSelf,source=?PLogTS_Task}),
			BindGold;
		_ ->
			%% 无法识别的格式
			RewardData
	end;
getReward_(?Reward_Item, RewardData) ->
	case RewardData of
		[{ItemID, Count}|_] when erlang:is_integer(ItemID) andalso erlang:is_integer(Count) andalso Count > 0 ->
			%% 合法的数值，正常奖励
			Plog = #recPLogTSItem{
				old = 0,
				new = Count,
				change = Count,
				target = ?PLogTS_PlayerSelf,
				source = ?PLogTS_Task,
				gold = 0,
				goldtype = 0,
				changReason = ?ItemSourceTask,
				reasonParam = 0 %% 原任务奖励道具来源参数应为任务ID，但“环任务”为虚拟的概念，此处置零
			},
			playerPackage:addGoodsAndMail(ItemID, Count, true, 0, Plog),
			{ItemID, Count};
		_ ->
			%% 无法识别的格式
			RewardData
	end;
getReward_(?Reward_GuildResource, RewardData) ->
	case RewardData of
		Res when erlang:is_integer(Res) andalso Res > 0 ->
			%% 合法的数值，正常奖励
			case playerState:getGuildID() of
				0 ->
					0;
				GuildID ->
					playerGuild:addguildresource(GuildID, Res),
					Res
			end;
		_ ->
			%% 无法识别的格式
			RewardData
	end;
getReward_(?Reward_GuildContribute, RewardData) ->
	case RewardData of
		Ctb when erlang:is_integer(Ctb) andalso Ctb > 0 ->
			case playerState:getGuildID() of
				0 ->
					0;
				_GuildID ->
					playerMoney:addCoin(?CoinTypeGuildContribute, Ctb, #recPLogTSMoney{reason=?CoinSourceTask,param=0,target=?PLogTS_PlayerSelf,source=?PLogTS_Task}),
					Ctb
			end;
		_ ->
			%% 无法识别的格式
			RewardData
	end;
getReward_(?Reward_GuildLiveness, RewardData) ->
	case RewardData of
		Liv when erlang:is_integer(Liv) andalso Liv > 0 ->
			case playerState:getGuildID() of
				0 ->
					0;
				GuildID ->
					playerGuild:addguildliveness(GuildID, Liv),
					Liv
			end;
		_ ->
			%% 无法识别的格式
			RewardData
	end;
getReward_(PA, RewardData) ->
	?ERROR_OUT("invalid param ~p ~p~n~p", [PA, RewardData, misc:getStackTrace()]),
	{PA, RewardData}.


-spec getAcceptedLoopTaskID() -> {ok, TaskID::uint()} | {error, 0}.
getAcceptedLoopTaskID() ->
	ListLoopTaskID = getLoopTaskID(all),
	FunFind =
		fun(#rec_task{taskID = TaskID}, Result) ->
			case Result of
				{ok, _} ->
					Result;
				_ ->
					case lists:member(TaskID, ListLoopTaskID) of
						true ->
							{ok, TaskID};
						_ ->
							Result
					end
			end
		end,
	lists:foldl(FunFind, {error, 0}, playerState:getAcceptedTask()).


-spec getRemainder() -> {TaskID::uint()|0, NeedCompleteCount::uint()}.
getRemainder() ->
	case getAcceptedLoopTaskID() of
		{error, _} ->
			DailyCountMax = getDailyCountMax(),
			DailyCount = playerDaily:getDailyCounter(?DailyType_LoopTaskNum, 0),
			case DailyCount < DailyCountMax of
				true ->
					{0, ?LoopTaskAcceptNum};
				_ ->
					{0, 0}
			end;
		{ok, TaskID} ->
			LoopCount = playerPropSync:getProp(?PriProp_LoopTaskProcess),
			{TaskID, ?LoopTaskAcceptNum - LoopCount}
	end.


-spec parseRemainder({TaskID::uint()|0, NeedCompleteCount::uint()}) ->
	{ok, ListTaskID::uint(), NeedCompleteCount_New::uint()} | %% 正常情况
	{ok, ListTaskID::uint(), NeedCompleteCount_New::uint(), TaskID_Old::uint()} | %% 正常情况，需要取消指定任务
	{error, ErrorCode::uint()}.                               %% 异常情况
parseRemainder({TaskID, NeedCompleteCount}) ->
	Level = erlang:min(playerState:getLevel(), getLevelLimit()),
	FunRand =
		fun(_, Result) ->
			case randTaskID(Level) of
				{ok, TaskIDNew} ->
					[TaskIDNew | Result];
				_ ->
					%% 无法生成任务ID以继续后续流程（不应该有该分支，属于逻辑异常）
					?ERROR_OUT("~p can not rand taskid~n~p", [playerState:getRoleID(), misc:getStackTrace()]),
					Result
			end
		end,
	case {TaskID, NeedCompleteCount} of
		{0, 0} ->
			%% 没有接受任务的情况下，没有可完成的次数
			playerMsg:sendErrorCodeMsg(?ErrorCode_TaskFailed_AcceptFail),
			{error, ?ErrorCode_TaskFailed_AcceptFail};
		{_, 0} ->
			%% 接受了任务的情况下，没有可完成的次数（不应该有该分支，属于逻辑异常）
			?ERROR_OUT("~p not auto reward, need gm operate", [playerState:getRoleID()]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_TaskFailed_SubmitFail),
			{error, ?ErrorCode_TaskFailed_SubmitFail};
		{0, _} ->
			%% 没有接受任务的情况下，有可完成的次数，随机得到符合数目的任务ID列表
			ListTaskID_A = lists:foldl(FunRand, [], lists:seq(1, NeedCompleteCount)),
			{ok, ListTaskID_A, NeedCompleteCount};
		_ ->
			%% 剩下的情况为，接受了任务的情况下，有可完成的次数
			%% 随机得到符合数目-1的任务ID列表，再添加回原来的任务ID
			ListTaskID_B = lists:foldl(FunRand, [], lists:seq(1, NeedCompleteCount - 1)),
			{ok, [TaskID | ListTaskID_B], NeedCompleteCount , TaskID}
	end.


-spec decCoinForOneKeyComplete(NeedCompleteCount::uint()) ->
	{ok, CoinType::coinType(), CoinNum::uint()} | {error, ErrorCode::uint()}.
decCoinForOneKeyComplete(NeedCompleteCount) ->
	case NeedCompleteCount > 0 of
		true ->
			UnitPrice =
				case getCfg:getCfgByKey(cfg_globalsetup, datask_dianumber) of
					#globalsetupCfg{setpara = [UnitPrice_]} ->
						UnitPrice_;
					_ ->
						?ERROR_OUT("can not find key datask_dianumber from cfg_globalsetup", []),
						99999999  %% 找不到配置，默认使用一个很大的值
				end,
			CoinNum = UnitPrice * NeedCompleteCount,
			case playerMoney:canUseCoin(?CoinUseTypeDiamond, CoinNum) of
				true ->
					Plog =
						#recPLogTSMoney{
							reason = ?CoinUseLoopTask,
							param = [NeedCompleteCount],
							target = ?PLogTS_Task,
							source = ?PLogTS_PlayerSelf
						},
					ResultUseCoin = playerMoney:useCoin(?CoinUseTypeDiamond, CoinNum, Plog),
					case ResultUseCoin of
						true ->
							{ok, ?CoinTypeDiamond, CoinNum};
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_TaskFailed_NotEnoughCoinToOneKeyComplete, [CoinNum, NeedCompleteCount]),
							{error, ?ErrorCode_TaskFailed_NotEnoughCoinToOneKeyComplete}
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_TaskFailed_NotEnoughCoinToOneKeyComplete, [CoinNum, NeedCompleteCount]),
					{error, ?ErrorCode_TaskFailed_NotEnoughCoinToOneKeyComplete}
			end;
		_ ->
			?ERROR_OUT("invalid param ~p~n~p", [NeedCompleteCount, misc:getStackTrace()]),
			playerMsg:sendErrorCodeMsg(?ErrorCode_TaskFailed_SubmitFail),
			{error, ?ErrorCode_TaskFailed_SubmitFail}
	end.


%% 注意！！！
%% 该函数模拟任务的领取、提交流程，忽略其中向客户端发送的消息，最后将结果打包发送给客户端
%% 因此当playerTask相关流程有修改时，需要对该函数进行同步
%% 201609082018
%% 201703201759 同步
-spec submitTaskOneKeyComplete({TaskIDList::[uint(),...], NeedCompleteCount::uint()}) ->
	{ok, Count::uint()} | {error, ErrorCode::uint()}.
submitTaskOneKeyComplete({TaskIDList, _NeedCompleteCount}) ->
	FunSubmit =
		fun(TaskID) ->
			%% 模拟领取任务流程
			dbLog:sendSaveLogTask(playerState:getRoleID(), TaskID, playerState:getLevel(), ?TaskLogAccept),
			%% 模拟提交任务流程
			playerTask:giveTaskAwardForLoopTask(TaskID),	%% 单任务奖励
			playerAchieve:achieveEvent(?Achieve_Task, [1]), %% 成就计数
			dbLog:sendSaveLogTask(playerState:getRoleID(), TaskID, playerState:getLevel(), ?TaskLogSubmit),	%% 日志
			playerGuild:addPlayerContribute(?GuildSupplies_Task, TaskID)	%% 军团贡献
		end,
	lists:foreach(FunSubmit, TaskIDList),
	%% 处理十环的情况，并同步了消息
	onCountLoopTask(TaskIDList, 1),
	Level = playerState:getLevel(),
	Progress = playerPropSync:getProp(?PriProp_LoopTaskProcess),
	playerMsg:sendNetMsg(#pk_GS2U_AddNewCompleteLoopTasks{
		listLevel = [Level],
		listTaskID = TaskIDList,
		result = 1,
		progress = Progress,
		allProgress = ?LoopTaskAcceptNum
	}),
	{ok, erlang:length(TaskIDList)}.



%%
getDailyCountMax()->
	case getCfg:getCfgByKey(cfg_globalsetup, dailytask_number) of
		#globalsetupCfg{setpara = [DailyCountMax_]} ->
			DailyCountMax_;
		_ ->
			?ERROR_OUT("can not find key dailytask_number from cfg_globalsetup", []),
			0 %% 无法找到相关配置，设置一个很小的值直接限制住
	end.

cancelLoopLindTask()->
	case  playerTask:isAcceptedTaskByID(?LoopTaskLindID) of
		true ->
			playerTask:cancelTask(?LoopTaskLindID);
		_->
			skip
	end.

acceptLoopLinkTask()->
	DailyCountMax = getDailyCountMax(),
	DailyCount = playerDaily:getDailyCounter(?DailyType_LoopTaskNum, 0),
	case DailyCount < DailyCountMax of
		true ->
			case  playerTask:isAcceptedTaskByID(?LoopTaskLindID) of
				false ->
					playerTask:acceptTask(?LoopTaskLindID, 0);
				_ ->
					skip
			end;
		_ ->
			%% 取消引导任务
			cancelLoopLindTask()
	end.