%%%-------------------------------------------------------------------
%%% @author chenxiaolong
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%% 活动模块特殊玩法
%%%    之 推箱子
%%% 约会地下城（活动）
%%% @end
%%% Created : 09. 五月 2017 10:54
%%%-------------------------------------------------------------------
-module(acDateActivity_PushBox).
-author("chenxiaolong").

-include("acDatePrivate.hrl").

%% API
-export([
	initAfterCreate/1,
	initAfterFirstEnter/1,
	playerEnterCheck/2,
	onTimerMain/2,
	onTimerTick/1,
	createMatrix/2,
	giveup/2,
	playerLeave/2,
	playerBreak/2,
	playerDelete/2,
	spawnObjectAck/3,
	link/2,
	playerEnter/2
	]).

%% 玩法状态定义
-define(ActiveState_Begin,              0).
-define(ActiveState_UnInit,             0).   %% 未收玩法逻辑影响的刚创建的状态
-define(ActiveState_BeforeFirstEnter,   1).   %% 等待玩家首次进入，等久了就走异常结算把自己结果了
-define(ActiveState_AfterFirstEnter,    2).   %% 玩家首次进入后的等待，主要是有个友好的倒计时准备时间
-define(ActiveState_PushBox,            3).   %% 主玩法推箱子时间
-define(ActiveState_Settle,             4).   %% 主玩法结束后的结算时间，仅用于结算框的展示
-define(ActiveState_End,                4).
-type type_as() :: ?ActiveState_Begin .. ?ActiveState_End.

%% 结算原因定义
-define(SettleReason_ScoreMax,  0). %% 达到最大积分
-define(SettleReason_Timeout,   1). %% 时间结束
-define(SettleReason_Giveup,    2). %% 玩家放弃
-type type_sr() :: ?SettleReason_ScoreMax .. ?SettleReason_Giveup.


-define(ObjectType_PushBox,     101).   %% 对象类型：箱子

-record(recActiveBox, {

	state           = 0                      :: type_as(),       %% 玩法状态
	timeBegin       = 0                      :: uint32(),        %% 当前玩法状态开始的时间
	timeEnd        = 0                       :: uint32(),        %% 当前玩法状态计划结束的时间
	score          = 0                       :: uint16(),       %% 当前得分
	refreshNum     = 0                       :: uint32(),       %% 波数
	listBoxCode    = []                      :: [uint64(), ...], %% 宝石矩阵（值为Code，0时不存在）
	lastTimeReshuffle = 0                    :: uint32(),        %% 上次手动重置宝石矩阵的时间
	reshuffleCount    = 0                    :: uint8()        %% 剩余手动重置宝石矩阵的次数
}).


% 创建地图后的初始化
-spec initAfterCreate(MapInfoOld::#recMapInfo{}) -> MapInfoNew::#recMapInfo{}.
initAfterCreate(#recMapInfo{mapPID = MapPid, timerRefMain = TimerRefMain} = MapInfoOld) ->
	%?DEBUG_OUT("[DebugForDate] initAfterCreate"),
	%% 取消可能存在的旧有主计时器
	case erlang:is_reference(TimerRefMain) of
		true ->
			erlang:cancel_timer(TimerRefMain);
		_ ->
			skip
	end,
	%% 更新地图信息
	TimeNow = time:getSyncUTCTimeFromDBS(),
	TimeThisState = configTime_BeforeFirstEnter(),
	MapInfoNew = MapInfoOld#recMapInfo{
		%% 设置已初始化状态
		isInitAfterC = true,
		%% 设置当前玩法状态的主计时器
		timerRefMain = acDateLogic:setTimerMain(
			TimeThisState * 1000,
			MapPid,
			#recAckData{
				activeID  = ?DateActiveID_PushBox,
				paramEx   = ?ActiveState_BeforeFirstEnter
			}
		),
		paramEx = #recActiveBox{
			state             = ?ActiveState_BeforeFirstEnter,  %% 初始化玩法状态
			timeBegin         = TimeNow,                        %% 更新玩法开始时间
			timeEnd           = TimeNow + TimeThisState,
			listBoxCode       = []

			%%listNpcIDOfColor  = configGemNpcID(),               %% 初始化宝石Npc列表
			%%reshuffleCount    = configCountReshuffle()          %% 重置剩余手动重置宝石矩阵的次数
		}
	},
	acDateState:replaceMapInfo(MapInfoNew),
	MapInfoNew.

%% 用户首次进入后的初始化
-spec initAfterFirstEnter(MapInfoOld::#recMapInfo{}) -> MapInfoNew::#recMapInfo{}.
initAfterFirstEnter(#recMapInfo{mapPID = MapPid, timerRefMain = TimerRefMain, paramEx = RecActive} = MapInfoOld) ->
	%?DEBUG_OUT("[DebugForDate] initAfterFirstEnter"),
	%% 取消可能存在的旧有主计时器
	case erlang:is_reference(TimerRefMain) of
		true ->
			erlang:cancel_timer(TimerRefMain);
		_ ->
			skip
	end,
	%% 更新地图信息
	TimeNow = time:getSyncUTCTimeFromDBS(),
	TimeThisState = configTime_AfterFirstEnter(),

	MapInfoNew = MapInfoOld#recMapInfo{
		%% 设置已首次进入状态
		isInitAfterFE = true,
		%% 设置当前玩法状态的主计时器
		timerRefMain = acDateLogic:setTimerMain(
			TimeThisState * 1000,
			MapPid,
			#recAckData{
				activeID  = ?DateActiveID_PushBox,
				paramEx   = ?ActiveState_AfterFirstEnter
			}
		),
		paramEx = RecActive#recActiveBox{
			state             = ?ActiveState_AfterFirstEnter,   %% 更新玩法状态
			timeBegin         = TimeNow,                        %% 更新玩法开始时间
			timeEnd         = TimeNow + TimeThisState,
			score = 0
		}
	},
	acDateState:replaceMapInfo(MapInfoNew),
	MapInfoNew.
%% 用户进入检测
-spec playerEnterCheck(MapInfoOld::#recMapInfo{}, RoleID::uint64()) -> {MapInfoNew::#recMapInfo{}, IsAllowed::boolean()}.
playerEnterCheck(#recMapInfo{paramEx = RecActive} = MapInfoOld, RoleID) ->
	%?DEBUG_OUT("[DebugForDate] playerEnterCheck RoleID(~p)", [RoleID]),
	%% 不允许在结算状态进入
	IsAllowed =
		case RecActive#recActiveBox.state of
			?ActiveState_Settle ->
				case core:queryOnLineRoleByRoleID(RoleID) of
					#rec_OnlinePlayer{pid = Pid} ->
						psMgr:sendMsg2PS(Pid, date_error, {?ErrorCode_Date_Link_WaitDestroy, []});
					_ ->
						skip
				end,
				false;
			_ ->
				true
		end,
	{MapInfoOld, IsAllowed}.


%% 用户进入事件响应
-spec playerEnter(MapInfoOld::#recMapInfo{}, RoleID::uint64()) -> MapInfoNew::#recMapInfo{}.
playerEnter(#recMapInfo{roleID_A = RoleID_A, playerEts = PlayerEts, paramEx = RecActive} = MapInfoOld, RoleID) ->
	%?DEBUG_OUT("[DebugForDate] playerEnter RoleID(~p)", [RoleID]),
	%% 向角色同步当前玩法状态
	#recActiveBox{
		state             = State,
		timeBegin         = _TimeBegin,
		timeEnd           = TimeEnd,
		score             = Score
	} = RecActive,
	%% 根据玩法状态生成时间标记
	TimeNow = time:getSyncUTCTimeFromDBS(),

	{TimeForBegin, TimeForEnd} =
		case State of
			?ActiveState_UnInit ->
				?ERROR_OUT("playerEnter ActiveState_UnInit"),
				{0, 0};
			?ActiveState_BeforeFirstEnter ->
				?ERROR_OUT("playerEnter ActiveState_BeforeFirstEnter"),
				{0, 0};
			?ActiveState_AfterFirstEnter ->
				{TimeEnd - TimeNow, configTime_MainGame()};
			?ActiveState_PushBox ->

				{0, TimeEnd - TimeNow};
			?ActiveState_Settle ->
				{0, 0}
		end,

	NetMsg =
		#pk_GS2U_DatePushBox_Welcome_Sync{
			timeForBegin  = TimeForBegin,
			timeForEnd    = TimeForEnd,
			score         = Score,
			listGemMatrix = []
		},

	acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID, PlayerEts, NetMsg),
	%?DEBUG_OUT("[DebugForDate] NetMsg~n~p~n~p~n~p", [TimeBeginForNetMsg, TimeEndForNetMsg, NetMsg#pk_GS2U_DateLink_Welcome_Sync.listGemMatrix]),
	MapInfoOld. %% 未发生数据变化

%% 箱子区域的选中、取消选中操作，可能造成连接
-spec link(MapInfoOld::#recMapInfo{}, {RoleID::uint64(), term()}) -> MapInfoNew::#recMapInfo{}.
link(#recMapInfo{mapPID = MapPID,mapID = MapID,roleID_A = RoleID_A, roleID_B = RoleID_B, npcEts = NpcEts,playerEts = PlayerEts, paramEx = RecActive} = MapInfoOld, {RoleID, {Code, PosXY,IsDelete, GMMod}} = _Msg) ->
	%?DEBUG_OUT("[DebugForDate] link/2 a"),

	#recActiveBox{
		score             = Score,
		listBoxCode       = ListBoxCode
	} = RecActive,
	{X,Y} = PosXY,
	MaxSore =  configNScoreMax(),
	NewMapInfo =
	case  mapView:isBlock(MapID,X,Y) of
		  true->
			    MapInfoOld;
			_->
				Distance= configNboxInstance(),
				AddScore = configNboxscore(),

				case  myEts:lookUpEts(NpcEts, Code) of
					[#recMapObject{groupID = GroupID,id = ID,x = IX,y = IY}] ->
						DistanceX =  erlang:abs(X-IX),
						DistanceY =  erlang:abs(Y-IY),
						case DistanceX =< Distance andalso  DistanceY =< Distance of %%这里判断客服端发过来的移动的距离是否大于目标值，防止玩家作弊
							true ->
								case IsDelete of
									true ->

										%% 更新NPC坐标
										myEts:updateEts(NpcEts, Code, [{#recMapObject.x, X}, {#recMapObject.y, Y}]),
										%% 通知全图玩家，NPC移动了
										Msg = #pk_GS2U_NpcMomentMove{npcCode = Code, npcID = ID, tX = X, tY = Y},
										mapView:sendMsg2AllPlayer(MapInfoOld#recMapInfo.mapPID, PlayerEts, Msg, GroupID),

										NetMsgAddSocre =
											#pk_GS2U_DatePushBox_Succeed_Sync{
												isSucceed = true,
												score     =Score + AddScore,
												isDelete = true,
												code = Code,
												x = X,
												z = Y
											},

										NewListBoxcode = linkGood_ClearBox(ListBoxCode,Code,MapPID),
										acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsgAddSocre),
										acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsgAddSocre),
										MapInfoOld#recMapInfo{
											paramEx = RecActive#recActiveBox{
												score = Score+AddScore,
												listBoxCode =NewListBoxcode
											}
										};
									_->

										%% 更新NPC坐标
										myEts:updateEts(NpcEts, Code, [{#recMapObject.x, X}, {#recMapObject.y, Y}]),
										%% 通知全图玩家，NPC移动了
										Msg = #pk_GS2U_NpcMomentMove{npcCode = Code, npcID = ID, tX = X, tY = Y},
										mapView:sendMsg2AllPlayer(MapInfoOld#recMapInfo.mapPID, PlayerEts, Msg, GroupID),


										NetMsgAddSocre =
											#pk_GS2U_DatePushBox_Succeed_Sync{
												isSucceed = true,
												score = Score,
												isDelete = false,
												code = Code,
												x = X,
												z = Y
											},
										acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsgAddSocre),
										acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsgAddSocre),
										MapInfoOld
								end;
							_->
								?ERROR_OUT("cross the border"),
								MapInfoOld
						end;
					_->
						?ERROR_OUT("NPC  code is not find (~p)",[code]),
						MapInfoOld
				end

	end	,
	acDateState:replaceMapInfo(NewMapInfo),
	%% 6.如果达到最大积分则进入结算
	#recMapInfo{paramEx = #recActiveBox{score = ScoreNow ,listBoxCode = BoxCode}} = NewMapInfo,
	case ScoreNow >= MaxSore of
		true ->
			%?DEBUG_OUT("[DebugForDate] linkGood ScoreNow ~p ScoreMax ~p", [ScoreNow, ScoreMax]),
			settle(NewMapInfo, ?SettleReason_ScoreMax, 0);
		_ ->
			%% 7.如果所有宝都被消除则由系统刷新新的宝箱
			FunCheck =
				fun(Code, {_, 0}) ->
					{Code > 0, 0}
				end,
			Length =  erlang:length(BoxCode),
			{IsContinue, _} = misc:foldlEx(FunCheck, {false, 0}, BoxCode),


			case IsContinue == false orelse  Length =< 0 of
				true ->
					createMatrix(NewMapInfo, 0);
				_ ->
					NewMapInfo
			end
	end.

%% 创建箱子NPC
%% 创建对象成功的回执消息
-spec spawnObjectAck(MapInfoOld::#recMapInfo{}, Code::uint64(), ParamEx::term()) -> MapInfoNew::#recMapInfo{}.
spawnObjectAck(#recMapInfo{roleID_A = RoleID_A, roleID_B = RoleID_B,playerEts = PlayerEts, paramEx = RecActive} = MapInfoOld, Code, {?ObjectType_PushBox,X,Y}) ->

	#recActiveBox{
		listBoxCode     = ListCode
	} = RecActive,
	NewlistCode =  [Code|ListCode],
	%%{_, ListMatrixNewR} = lists:foldl(FunSet, {1, []}, RecActive#recActiveBox.listBoxCode),
	MapInfoNew =
		MapInfoOld#recMapInfo{
			paramEx = RecActive#recActiveBox{
				listBoxCode = lists:reverse(NewlistCode)
			}
		},

		NetMsg =
			#pk_GS2U_DatePushBox_GreateNPC_Sync{
				code = Code,
				x = X,
				z = Y
			},
		acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsg),
		acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsg),
	acDateState:replaceMapInfo(MapInfoNew),
	MapInfoNew.

%% 刷箱子
-spec createBox(MapPid::pid(),  PosXY::[{float(), float()}, ...]) -> ok.
createBox(MapPid, PosXY) ->
	%% 1.随机找个箱子
	ListBoxID = configNboxBoxnpcid(),
	FunLoadCfg =
		fun(ID, ListCfg) ->
			[getCfg:getCfgByKey(cfg_npc, ID) | ListCfg]
		end,
	ListCfg = lists:reverse(lists:foldl(FunLoadCfg, [], ListBoxID)),
	#npcCfg{
		id = ID,
		name = Name,
		ndirection = RotW
	} = lists:nth(1, ListCfg),
	%%Count = erlang:length(ListBoxID),
	FunCreateBox =
		fun({X,Y}) ->
			case ID > 0 of
				true ->
					Arg =
						#recSpawnNpc{
							name    = Name,
							id      = ID,
							x       = X,
							y       = Y,
							rotW    = RotW*1.0,
							groupID = 0
						},
					acDateLogic:spawnObject(MapPid, Arg, #recAckData{activeID = ?DateActiveID_PushBox, paramEx = {?ObjectType_PushBox,X,Y}});
				_ ->
					skip
			end
		end,
	lists:foreach(FunCreateBox,PosXY),
	ok.

% 创建箱子矩阵（重置）
-spec createMatrix(MapInfoOld::#recMapInfo{}, RoleID::uint64()) -> MapInfoNew::#recMapInfo{}.
createMatrix(#recMapInfo{mapPID = MapPid, roleID_A = RoleID_A, roleID_B = RoleID_B, playerEts = PlayerEts, paramEx = RecActive} = MapInfoOld, RoleID) ->
	%?DEBUG_OUT("[DebugForDate] createMatrix RoleID(~p) 0 is sys", [RoleID]),
	%% -2.如果不是主游戏阶段，则忽略该消息
	case RecActive#recActiveBox.state of
		?ActiveState_PushBox ->
			%?DEBUG_OUT("[DebugForDate] createMatrix RoleID(~p) 0 is sys", [RoleID]),
			%% -1.如果是用户操作需要重置宝石矩阵，需要验证剩余重置次数及间隔时间
			NeedCreate  = true,  %% createMatrix_ReshuffCheck(RecActive, RoleID, PlayerEts),

			#recActiveBox{
				refreshNum = RefreshNum
			} = RecActive,
			case NeedCreate of
				true ->
				%%	%% 0.清理可能存在的宝石NPC
				createMatrix_Clear(MapPid, RecActive),
				NewRefreshNum = 	RefreshNum +1,

				MapInfoNew = MapInfoOld#recMapInfo{
					paramEx = RecActive#recActiveBox{
						refreshNum = NewRefreshNum,
						listBoxCode = []
					}
				},
				acDateState:replaceMapInfo(MapInfoNew),
				BoxRefreshNumList  = 	configNboxrefresh(),
				BoxRefreshNumPoint = 	configNboxPointgroup(),
				BoxRefreshNum=	lists:nth(NewRefreshNum,BoxRefreshNumList),
				case BoxRefreshNum>0 of
					  true->
						RandomBoxPoint =  misc:randUniqueFromList(BoxRefreshNum,BoxRefreshNumPoint),
						createBox(MapPid,RandomBoxPoint);
					_->
					skip
				end,

				NetMsg =
					#pk_GS2U_Date_ResetBox_Sync{
						refreshNum =NewRefreshNum
					},
				acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsg),
				acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsg),


				%%linkGood_AddBoxValue(ListMatrixValueNew,MapPid,RandomBoxIndex),


				%%	%% 1.随机宝石顺序以对应分值
				%%	ListNpcIDOfColor = misc:shuffle(RecActiveNew_#recActiveBox.listNpcIDOfColor),
				%%	%% 2.根据宝石顺序调整宝石组数量，生成最初的宝石列表
				%%	ListMatrixTemp = createMatrix_Count(),
				%%	%% 3.随机调整宝石位置，相同宝石不能相邻
				%%	ListMatrixValue = ListMatrixTemp,%%misc:shuffle(ListMatrixTemp++ListMatrixTemp),  %%createMatrix_Shuffle(ListMatrixTemp),
				%%	%?DEBUG_OUT("[DebugForDate] createMatrix ~p", [ListMatrixValue]),  %% 检查算法耗时
				%%	%% 4.更新MapInfo
%%

				%%	%% 5.创建NPC
				%%	createMatrix_CreateNpc(MapPid, ListNpcIDOfColor, ListMatrixValue),
				%%	%% 6.通知玩家
				%%	TimeNow = time:getSyncUTCTimeFromDBS(),
				%%	ResetCD =
				%%		case configTime_Reshuffle() - (TimeNow - RecActiveNew_#recActiveBox.lastTimeReshuffle) of
				%%			CD when CD > 0 ->
				%%				CD;
				%%			_ ->
				%%				0
				%%		end,
				%%	NetMsg =
				%%		#pk_GS2U_DateLink_ResetGem_Sync{
				%%			listGem     = ListNpcIDOfColor,
				%%			resetCount  = RecActiveNew_#recActiveBox.reshuffleCount,  %% 该值自从步骤-1结束就没变化，所以从RecActiveNew_取用
				%%			resetCD     = ResetCD,
				%%			listGemMatrix =  ListMatrixValue
				%%		},
				%%	acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsg),
				%%	acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsg),
				%%	%% 7.重置玩家坐标
				%%	%%createMatrix_ResetPlayerPos(PlayerEts),
					MapInfoNew;
				_ ->
					%?DEBUG_OUT("[DebugForDate] createMatrix"),
					MapInfoOld
			end;
		_ ->
			MapInfoOld
	end.

%% 清除所有宝石
-spec createMatrix_Clear(MapPid::pid(), RecActive::#recActiveBox{}) -> ok.
createMatrix_Clear(MapPid, #recActiveBox{listBoxCode  = ListMatrixCode}) ->
	FunClear =
		fun(E, L) ->
			case E > 0 of
				true ->
					[E | L];
				_ ->
					L
			end
		end,
	CodeList = lists:foldl(FunClear, [], ListMatrixCode),
	%% 原接口向客户端发送的消息是GS2U_BroadcastDisapear，客户端会将待处理物放置队列中慢慢删除，造成了LUN-1239的问题
	%% 此处应当在服务端删除对象后，向客户端发送新的消息GS2U_BroadcastDisapearFast，需要客户端支持直接删除对象
	%%acDateLogic:clearObject(MapPid, {?CodeTypeNPC, CodeList}),
	acDateLogic:clearObjectFast(MapPid, {?CodeTypeNPC, CodeList}),
	ok.
%% 清除指定NPC
-spec linkGood_ClearBox(ListBoxCode::[uint64(), ...], NeedClearCode::uint64(), MapPid::pid()) -> ListMatrixCodeNew::[uint64(), ...].
linkGood_ClearBox(ListBoxCode, NeedClearCode,MapPid) ->
	%?DEBUG_OUT("[DebugForDate] linkGood_ClearNpc ~p", [{PosA, PosB, ListMatrixCode}]),
%%	FunClear =
%%		fun(Code) ->
%%			case lists:member(Code,ListBoxCode) of
%%				true ->
%%					lists:delete(Code,ListBoxCode)
%%			end
%%		end,
%%	lists:foreach(FunClear, NeedClearCode),
	NL = lists:delete(NeedClearCode,ListBoxCode ),
	%?DEBUG_OUT("[DebugForDate] link_afterCheck_ClearNpc ~p", [{PosA, PosB, ListMatrixCodeNewR}]),
	acDateLogic:clearObject(MapPid, {?CodeTypeNPC, [NeedClearCode]}),
	lists:reverse(NL).


%% 进入结算流程
-spec settle(MapInfoOld::#recMapInfo{}, Reason::type_sr(), RoleID::uint64()) -> MapInfoNew::#recMapInfo{}.
settle(#recMapInfo{mapPID = MapPid,activeID = ActiveID, timerRefMain = TimerRefMain, roleID_A = RoleID_A, roleID_B = RoleID_B, playerEts = PlayerEts, paramEx = RecActive,roleA_enterCount  = RoleA_EnterCount,roleB_enterCount = RoleB_EnterCount} = MapInfoOld, Reason, _RoleID) ->
	%?DEBUG_OUT("[DebugForDate] settle Reason(~p) RoleID(~p)", [Reason, RoleID]),
	%% 0.清除可能存在的怪物
	acDateLogic:clearAllObject(MapPid, ?CodeTypeNPC),
	%% 1.修改玩法状态
	%% 取消可能存在的旧有主计时器
	case erlang:is_reference(TimerRefMain) of
		true ->
			erlang:cancel_timer(TimerRefMain);
		_ ->
			skip
	end,
	%% 更新地图信息
	TimeNow = time:getSyncUTCTimeFromDBS(),
	TimeThisState = configTime_Settle(),
	MapInfoNew = MapInfoOld#recMapInfo{
		%% 设置当前玩法状态的主计时器
		timerRefMain = acDateLogic:setTimerMain(
			TimeThisState * 1000,
			MapPid,
			#recAckData{
				activeID  = ?DateActiveID_PushBox,
				paramEx   = ?ActiveState_Settle
			}
		),
		paramEx = RecActive#recActiveBox{
			state       = ?ActiveState_Settle,    %% 更新玩法状态
			timeBegin   = TimeNow,                %% 更新玩法开始时间
			timeEnd     = TimeNow + TimeThisState
		}
	},
	acDateState:replaceMapInfo(MapInfoNew),

	%% 2.判断进入次数来发放奖励
	#recActiveBox{score = Score} = RecActive,
	%% 2.根据得分发放玩家奖励
	DaliyMaxCount =
		case getCfg:getCfgByKey(cfg_appointment, ActiveID) of
			#appointmentCfg{daily_count  = Max} ->
				Max;
			_ ->
				?ERROR_OUT("checkLevelAndDailyCounter can not find DateActiveID(~p) from cfg_appointment", [ActiveID])
		end,



	%% 发送消息
	NetMsg =
		#pk_GS2U_DateLink_GameEnd_Sync{
			reason  = Reason,
			time    = TimeThisState,
			score   = Score,
			id      = ActiveID
		},
	if
		RoleA_EnterCount =< DaliyMaxCount andalso RoleB_EnterCount =< DaliyMaxCount->
			settle_Reward(Score, Reason, RoleID_A, RoleID_B, false),
			settle_Reward(Score, Reason, RoleID_B, RoleID_A, true),
			acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsg),
			acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsg);
		RoleA_EnterCount =< DaliyMaxCount->
			settle_Reward(Score, Reason, RoleID_A, RoleID_B, true),
			acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsg);
		RoleB_EnterCount =< DaliyMaxCount->
			settle_Reward(Score, Reason, RoleID_B, RoleID_A, true),
			acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsg);
		true ->
			skip
	end,


	MapInfoNew.


%% 发放奖励
-spec settle_Reward(Score::uint(), Reason::type_sr(), RoleID::uint64(), PartnerRoleID::uint64(), IsAddSingle::boolean()) -> ok.
settle_Reward(Score, _Reason, RoleID, PartnerRoleID, IsAddSingle) ->
	%% 0.忽略ID为0的用户，便于调试
	case RoleID of
		0 ->
			skip;
		_ ->
			%% 1.查找当前用户等级
			%% 优先从base_role查找实时数据
			Level =
				case core:queryBaseRoleByRoleID(RoleID) of
					#rec_base_role{level = Level_br} ->
						Level_br;
					_ ->
						%% 其次从?RoleKeyRec查找具有一定延时的数据
						case core:queryRoleKeyInfoByRoleID(RoleID) of
							#?RoleKeyRec{level = Level_rk} ->
								Level_rk;
							_ ->
								%% 该用户不存在，可能是已经被删除，无法继续发放奖励
								?ERROR_OUT("settle_Reward can not find RoleID(~p) from core:queryRoleKeyInfoByRoleID/1", [RoleID]),
								0
						end
				end,
			case Level > 0 of
				true ->
					%% 2.发放礼包奖励
					#appointment_rewardCfg{
						reward        = ListRewardAll,
						reward_friend = Friendness,
						reward_couple = Closeness
					} = configRewardCfg(Level),
					PartnerName = playerNameUID:getPlayerNameByUID(PartnerRoleID),
					case Score > 0 of
						false ->
							%% 基础奖励
							FunFindRewardA =
								fun({ScoreLimit, RewardID}) ->
									case Score >= ScoreLimit of
										true ->
											case playerMail:createMailGoods(RewardID, 1, true, 0, RoleID, ?ItemSourceACDate) of
												[#recMailItem{}|_] = MailItemList ->
													LastCloseness =
														case marriageState:queryRelation(RoleID) of
															#rec_marriage{targetRoleID = RoleID_B} when RoleID_B  == PartnerRoleID  ->
																Closeness;
															_->
																0
														end,
													Content = configMailContent(PartnerName, Score, Friendness, LastCloseness),
													Title = configMailTitle(),
													mail:sendSystemMail(RoleID, Title, Content, MailItemList, "");
												_ ->
													?ERROR_OUT("settle_Reward RewardID(~p) Level(~p) Score(~p)", [RewardID, Level, Score])
											end;
										_ ->
											skip
									end
								end,
							lists:foreach(FunFindRewardA, ListRewardAll);
						_ ->
							%% 非基础奖励
							FunFindRewardB =
								fun({ScoreLimit, RewardID}) ->
									case Score >= ScoreLimit andalso ScoreLimit > 0 of
										true ->
											case playerMail:createMailGoods(RewardID, 1, true, 0, RoleID, ?ItemSourceACDate) of
												[#recMailItem{}|_] = MailItemList ->

													LastCloseness =
														case marriageState:queryRelation(RoleID) of
															#rec_marriage{targetRoleID = RoleID_B} when RoleID_B  == PartnerRoleID  ->
																Closeness;
															_->
																0
														end,
													Content = configMailContent(PartnerName, Score, Friendness, LastCloseness),
													Title = configMailTitle(),
													mail:sendSystemMail(RoleID, Title, Content, MailItemList, "");
												_ ->
													?ERROR_OUT("settle_Reward RewardID(~p) Level(~p) Score(~p)", [RewardID, Level, Score])
											end;
										_ ->
											skip
									end
								end,
							lists:foreach(FunFindRewardB, ListRewardAll)
					end,
					%% 一组人只加一次关系值奖励
					case IsAddSingle of
						true ->


							%% 发放好友系统关系值奖励
							playerFriend2:closenessAdd(?ClosenessAddType_DateLink, RoleID, PartnerRoleID, Friendness),
							%% 发放姻缘系统关系值奖励
							playerMarriage:closenessAdd({RoleID, PartnerRoleID, Closeness, ?ClosenessSource_Date});
						_ ->
							skip
					end;
				_ ->
					skip
			end
	end,
	ok.

%% 用户解除关系事件响应
-spec playerBreak(MapInfoOld::#recMapInfo{}, RoleID::uint64()) -> MapInfoNew::#recMapInfo{}.
playerBreak(MapInfoOld, RoleID) ->
	%?DEBUG_OUT("[DebugForDate] playerBreak RoleID(~p)", [RoleID]),
	giveup(MapInfoOld, {RoleID, true}). %% 直接结算

%% 用户删除事件响应
-spec playerDelete(MapInfoOld::#recMapInfo{}, RoleID::uint64()) -> MapInfoNew::#recMapInfo{}.
playerDelete(MapInfoOld, RoleID) ->
	%?DEBUG_OUT("[DebugForDate] playerDelete RoleID(~p)", [RoleID]),
	giveup(MapInfoOld, {RoleID, true}). %% 直接结算
%% 用户离开事件响应（地图销毁造成的玩家离开无法在此处理）
-spec playerLeave(MapInfoOld::#recMapInfo{}, RoleID::uint64()) -> MapInfoNew::#recMapInfo{}.
playerLeave(#recMapInfo{roleID_A = RoleID_A, roleID_B = RoleID_B, paramEx = RecActive, playerEts = PlayerEts} = MapInfoOld, RoleID) ->
	%?DEBUG_OUT("[DebugForDate] playerLeave RoleID(~p)", [RoleID]),
	%% 离开的玩家自动取消选择
%%#recActiveBox{
%%	selectPosA = PosA,
%%	selectPosB = PosB
%%} = RecActive,
   {MapInfoNew, RoleID_Partner} =
	case RoleID of
	%%	RoleID_A when PosA > 0 ->
	%%		{link(MapInfoOld, {RoleID, {PosA, false, 0}}), RoleID_B};
	%%	RoleID_B when PosB > 0 ->
	%%		{link(MapInfoOld, {RoleID, {PosB, false, 0}}), RoleID_A};
		RoleID_A ->
			{MapInfoOld, RoleID_B};
		_ ->
			{MapInfoOld, RoleID_A}
	end,
	%% 两个人都离开地图时游戏结束
	FunCheck =
		fun(#recMapObject{id = ID}, IsGiveUp) ->
			case RoleID_Partner of
				ID ->
					false;
				_ ->
					IsGiveUp
			end
		end,
	case ets:foldl(FunCheck, true, PlayerEts) of
		true ->
			giveup(MapInfoNew, {RoleID, true});
		_ ->
			MapInfoNew
	end.
%% 放弃游戏
-spec giveup(MapInfoOld::#recMapInfo{}, {RoleID::uint64(), IsSettle::boolean()}) -> MapInfoNew::#recMapInfo{}.
giveup(#recMapInfo{mapPID = MapPid, timerRefMain = TimerRefMain, paramEx = RecActive} = MapInfoOld, {RoleID, IsSettle}) ->
	%?DEBUG_OUT("[DebugForDate] gmSayItsEnd RoleID(~p) IsSettle(~p)", [RoleID, IsSettle]),
	case IsSettle of
		true ->
			%% 如果不是主游戏阶段，则忽略该消息
			case RecActive#recActiveBox.state of
				?ActiveState_PushBox ->
					settle(MapInfoOld, ?SettleReason_Giveup, RoleID); %% 玩家放弃导致游戏结束
				_ ->
					MapInfoOld
			end;
		_ ->
			%% 取消可能存在的旧有主计时器
			case erlang:is_reference(TimerRefMain) of
				true ->
					erlang:cancel_timer(TimerRefMain);
				_ ->
					skip
			end,
			%% 销毁地图
			acDateState:deleteMapInfo(MapInfoOld),
			psMgr:sendMsg2PS(MapPid, resetCopyMap, {}),
			undefined
	end.


%% 响应主计时器消息
-spec onTimerMain(MapInfoOld::#recMapInfo{}, ParamEx::term()) -> MapInfoNew::#recMapInfo{} | undefined.
%% 首次进入前超时异常结算
onTimerMain(#recMapInfo{roleID_A = RoleID_A, roleID_B = RoleID_B, createMapTime = Time} = MapInfoOld, ?ActiveState_BeforeFirstEnter) ->
	?WARN_OUT("onTimerMain ?ActiveState_BeforeFirstEnter RoleID_A(~p) RoleID_B(~p) Time(~p)", [RoleID_A, RoleID_B, Time]),
	settle(MapInfoOld, ?SettleReason_Timeout, 0),
	MapInfoOld;
%% 首次进入后满足时间，正式开启游戏
onTimerMain(#recMapInfo{timerRefMain = TimerRefMain, mapPID = MapPid, paramEx = RecActive} = MapInfoOld, ?ActiveState_AfterFirstEnter) ->
	%?DEBUG_OUT("[DebugForDate] onTimerMain ?ActiveState_AfterFirstEnter"),
	%% 取消可能存在的旧有主计时器
	case erlang:is_reference(TimerRefMain) of
		true ->
			erlang:cancel_timer(TimerRefMain);
		_ ->
			skip
	end,
	%% 更新地图信息

	TimeNow = time:getSyncUTCTimeFromDBS(),
	TimeThisState = configTime_MainGame(),
	MapInfoNew = MapInfoOld#recMapInfo{
		%% 设置当前玩法状态的主计时器
		timerRefMain = acDateLogic:setTimerMain(
			TimeThisState * 1000,
			MapPid,
			#recAckData{
				activeID  = ?DateActiveID_PushBox,
				paramEx   = ?ActiveState_PushBox
			}
		),
		paramEx = RecActive#recActiveBox{
			state             = ?ActiveState_PushBox,    %% 更新玩法状态
			timeBegin         = TimeNow,              %% 更新玩法开始时间
			timeEnd           = TimeNow + TimeThisState
		}
	},

	createMatrix(MapInfoNew, 0);
%% 游戏时间结束，进入结算流程
onTimerMain(MapInfoOld, ?ActiveState_PushBox) ->
	%?DEBUG_OUT("[DebugForDate] onTimerMain ?ActiveState_Link"),
	settle(MapInfoOld, ?SettleReason_Timeout, 0); %% 超时导致游戏结束
%% 结算时间结束，销毁地图
onTimerMain(#recMapInfo{mapPID = MapPid, timerRefMain = TimerRefMain} = MapInfoOld, ?ActiveState_Settle) ->
	%?DEBUG_OUT("[DebugForDate] onTimerMain ?ActiveState_Settle"),
	%% 取消可能存在的旧有主计时器
	case erlang:is_reference(TimerRefMain) of
		true ->
			erlang:cancel_timer(TimerRefMain);
		_ ->
			skip
	end,
	%% 销毁地图
	acDateState:deleteMapInfo(MapInfoOld),
	psMgr:sendMsg2PS(MapPid, resetCopyMap, {}),
	undefined.


%% 响应秒级心跳
-spec onTimerTick(MapInfoOld::#recMapInfo{}) -> MapInfoNew::#recMapInfo{}.
onTimerTick(#recMapInfo{roleID_A = RoleID_A, roleID_B = RoleID_B, playerEts = PlayerEts, paramEx = RecActive} = MapInfoOld) ->
	case RecActive of
		#recActiveBox{
			state = ?ActiveState_PushBox,
			timeEnd= TimeEnd
		} ->
			%% 只在正确初始化玩法后，在主玩法状态中响应，同步剩余时间
			TimeNow = time:getSyncUTCTimeFromDBS(),
			TimeRemainder = TimeEnd - TimeNow,

			case TimeRemainder >= 0 of
				true ->
					NetMsg =
						#pk_GS2U_DateLink_MainTime_Sync{
							timeRemainder = TimeRemainder
						},
					acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsg),
					acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsg);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	MapInfoOld.

configTime_AfterFirstEnter() ->
	#globalsetupCfg{setpara = [Time]} =
		getCfg:getCfgPStack(cfg_globalsetup, date_link_time_afterFristEnter),
	Time.
configTime_BeforeFirstEnter() ->
	#globalsetupCfg{setpara = [Time]} =
		getCfg:getCfgPStack(cfg_globalsetup, date_link_time_beforeFristEnter),
	Time.
configMailContent(PartnerName, Score, Friendness, Closeness) ->
	stringCfg:getString(date_link_mail, [PartnerName, Score, Friendness, Closeness]).
configMailTitle() ->
	stringCfg:getString(date_link_mailtittle).
configRewardCfg(Level) ->
	ListKey2 = getCfg:get2KeyList(cfg_appointment_reward, ?DateActiveID_PushBox),
	FunGetCfg =
		fun(Key2, {Mark, Result}) ->
			Cfg = getCfg:getCfgPStack(cfg_appointment_reward, ?DateActiveID_PushBox, Key2),
			case Level >= Cfg#appointment_rewardCfg.level of
				true ->
					{Mark, Cfg};
				_ ->
					{true, Result}
			end
		end,
	{_, Cfg} = misc:foldlEx(FunGetCfg, {false, 0}, ListKey2),
	Cfg.
configTime_Settle() ->
	#globalsetupCfg{setpara = [Time]} =
		getCfg:getCfgPStack(cfg_globalsetup, date_link_time_settle),
	Time.
configTime_MainGame() ->
	#appointmentCfg{time = Time} =
		getCfg:getCfgPStack(cfg_appointment, ?DateActiveID_Link),
	Time.
configRandBoxID() ->
	#globalsetupCfg{setpara = List} =
		getCfg:getCfgPStack(cfg_globalsetup, date_link_box),
	List.

%%刷新箱子的个数
configNboxrefresh() ->
	#globalsetupCfg{setpara = List} =
		getCfg:getCfgPStack(cfg_globalsetup, date_nbox_refresh),
	List.

%%箱子的出生点
configNboxPointgroup() ->
	#globalsetupCfg{setpara = List} =
		getCfg:getCfgPStack(cfg_globalsetup, date_nbox_pointgroup),
	List.
%%箱子的结束点
configNboxEndpoint() ->
	#globalsetupCfg{setpara = List} =
		getCfg:getCfgPStack(cfg_globalsetup, date_nbox_endpoint),
	List.
%%箱子单次被推的距离
configNboxInstance() ->
	#globalsetupCfg{setpara =[List]} =
		getCfg:getCfgPStack(cfg_globalsetup, date_nbox_instance),
	List.

%%箱子NPCID
configNboxBoxnpcid() ->
	#globalsetupCfg{setpara = List} =
		getCfg:getCfgPStack(cfg_globalsetup, date_nbox_boxnpcid),
	List.

%%箱子最大积分
configNScoreMax() ->
	#globalsetupCfg{setpara = [List]} =
		getCfg:getCfgPStack(cfg_globalsetup, date_nbox_scoreMax),
	List.

%%箱子增加积分
configNboxscore() ->
	#globalsetupCfg{setpara = [List]} =
		getCfg:getCfgPStack(cfg_globalsetup, date_nbox_boxscore),
	List.
