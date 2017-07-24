%%%-------------------------------------------------------------------
%%% @author bruce_chen
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%% 活动模块特殊玩法
%%%    之 寻找宝箱
%%% 约会地下城（活动）
%%% @end
%%% Created : 17. 八月 2017 15:36
%%%-------------------------------------------------------------------
-module(acDateActivity_FindeTreasure).
-author("bruce_chen").
-include("acDatePrivate.hrl").
%% API
-export([
	initAfterCreate/1,
	initAfterFirstEnter/1,
	playerEnterCheck/2,
	playerEnter/2,
	playerLeave/2,
	playerBreak/2,
	onTimerMain/2,
	onTimerTick/1,
	giveup/2,
	createNPC/1,
	monsterDead/2,
	spawnObjectAck/3

]).


%% 玩法状态定义
-define(ActiveState_Begin,              0).
-define(ActiveState_UnInit,             0).   %% 未收玩法逻辑影响的刚创建的状态
-define(ActiveState_BeforeFirstEnter,   1).   %% 等待玩家首次进入，等久了就走异常结算把自己结果了
-define(ActiveState_AfterFirstEnter,    2).   %% 玩家首次进入后的等待，主要是有个友好的倒计时准备时间
-define(ActiveState_FindeTreasure,      3).   %% 主玩法寻找宝箱
-define(ActiveState_Settle,             4).   %% 主玩法结束后的结算时间，仅用于结算框的展示
-define(ActiveState_End,                4).
-type type_as() :: ?ActiveState_Begin .. ?ActiveState_End.


-define(ObjectType_Monster, 1).   %% 对象类型：怪物
%% 结算原因定义
-define(SettleReason_ScoreMax,  0). %% 达到最大积分
-define(SettleReason_Timeout,   1). %% 时间结束
-define(SettleReason_Giveup,    2). %% 玩家放弃
-type type_sr() :: ?SettleReason_ScoreMax .. ?SettleReason_Giveup.


-record(recActiveFindTreasure, {

	state           = 0                      :: type_as(),       %% 玩法状态
	timeBegin       = 0                      :: uint32(),        %% 当前玩法状态开始的时间
	timeEnd        = 0                       :: uint32(),        %% 当前玩法状态计划结束的时间
	score          = 0                       :: uint16(),       %% 当前得分
	refreshNum     = 0                       :: uint32(),       %% 波数
	monsterNum     = 0                       ::uint16(),        %%怪物数量
	refreshTime    = 0                       ::uint32(),        %%刷新下一波的间隔时间
	playActionTime = 0                       ::uint32(),         %%NPC做动作的间隔时间
	syncMonsterPosTime = 0                   ::uint32(),         %%同步坐标
	isSync             = false               ::boolean(),        %%是否需要同步坐标
	listMonsterCode    = []                 :: [{uint16(),uint32()}, ...],
	transferTime   = 0                       ::uint32(),         %%传送时间
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
				activeID  = ?DateActiveID_FindTreasure,
				paramEx   = ?ActiveState_BeforeFirstEnter
			}
		),
		paramEx = #recActiveFindTreasure{
			state             = ?ActiveState_BeforeFirstEnter,  %% 初始化玩法状态
			timeBegin         = TimeNow,                        %% 更新玩法开始时间
			timeEnd           = TimeNow + TimeThisState
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
				activeID  = ?DateActiveID_FindTreasure,
				paramEx   = ?ActiveState_AfterFirstEnter
			}
		),
		paramEx = RecActive#recActiveFindTreasure{
			state             = ?ActiveState_AfterFirstEnter,   %% 更新玩法状态
			timeBegin         = TimeNow,                        %% 更新玩法开始时间
			timeEnd           = TimeNow + TimeThisState
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
		case RecActive#recActiveFindTreasure.state of
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
	#recActiveFindTreasure{
		state             = State,
		timeBegin         = _TimeBegin,
		timeEnd           = TimeEnd,
		score             = Score,
		listMonsterCode = ListMonsterCode
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
			?ActiveState_FindeTreasure ->
				{0, TimeEnd - TimeNow};
			?ActiveState_Settle ->
				{0, 0}
		end,
	NetMsg =
		#pk_GS2U_DateFindTreasure_Welcome_Sync{
			timeForBegin  = TimeForBegin,
			timeForEnd    = TimeForEnd,
			score         = Score
		},

	acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID, PlayerEts, NetMsg),

	AllPointList = configDate_hide_refresh(),
	Length =   erlang:length(ListMonsterCode),
	case Length>0 of
		 true ->
			 F3= fun({Value,Code},Arr)->
				 {X2,Y2} = lists:nth(Value,AllPointList),
				 [#pk_DateMonsterPos{code = Code,x = X2,z = Y2}|Arr]
			     end,
			 VecterList =  lists:foldl(F3, [],ListMonsterCode),

			 Msg = #pk_GS2U_MonsterMoveSync{monsterPosList = VecterList},
			 acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID, PlayerEts, Msg);
		 _->skip
    end,

	%?DEBUG_OUT("[DebugForDate] NetMsg~n~p~n~p~n~p", [TimeBeginForNetMsg, TimeEndForNetMsg, NetMsg#pk_GS2U_DateLink_Welcome_Sync.listGemMatrix]),
	MapInfoOld. %% 未发生数据变化

%% 概率刷怪
-spec createMonster(MapPid::pid(), MapID::uint(),  MonsterID::uint(), Index::uint()) -> ok.
createMonster(MapPid, MapID, MonsterID ,Index) ->
	%% 1.随机找个怪

	AllMonsterPointList =   configDate_hide_refresh(),

	{X2,Y2} = lists:nth(Index,AllMonsterPointList),
	case MonsterID > 0 of
		true ->

			Arg =
				#recSpawnMonster{
					id      = MonsterID,
					mapID   = MapID,
					mapPid  = MapPid,
					x       = X2,
					y       = Y2,
					groupID = 0
				},
			acDateLogic:spawnObject(MapPid, Arg ,#recAckData{activeID = ?DateActiveID_FindTreasure, paramEx = {?ObjectType_Monster, Index}});
		_ ->
			skip
	end,
	ok.



-spec spawnObjectAck(MapInfoOld::#recMapInfo{}, Code::uint64(), ParamEx::term()) -> MapInfoNew::#recMapInfo{}.
%% 创建怪物 返回
spawnObjectAck(#recMapInfo{paramEx = RecActive} = MapInfoOld, Code, {?ObjectType_Monster, Index}) ->
	#recActiveFindTreasure{

		listMonsterCode = ListMonsterCode
	} = RecActive,
	NewMonsterCodeList =  [{Index,Code}|ListMonsterCode],

	MapInfoNew = MapInfoOld#recMapInfo{
		paramEx = RecActive#recActiveFindTreasure{
			listMonsterCode = NewMonsterCodeList
		}
	},
	acDateState:replaceMapInfo(MapInfoNew),
	MapInfoNew.


%%% 创建npc
-spec createNPC(MapInfoOld::#recMapInfo{}) -> MapInfoNew::#recMapInfo{}.
createNPC(#recMapInfo{mapPID = MapPid,mapID = MapId, roleID_A = RoleID_A, roleID_B = RoleID_B, playerEts = PlayerEts, paramEx = RecActive} = MapInfoOld) ->
	case RecActive#recActiveFindTreasure.state of
		?ActiveState_FindeTreasure ->

			#recActiveFindTreasure{
				refreshNum = RefreshNum,
				monsterNum =  MonsterNum,
				listMonsterCode = ListMonsterCode
			} = RecActive,

			AllNumeberList =  configDate_hide_refreshnumber(),
			Length =  erlang:length(AllNumeberList),

			case RefreshNum >=  Length of
				  false ->
					  AllPointList = configDate_hide_refresh(),
					  NewRefreshNum = RefreshNum+1,

					  %%获取刷新怪物的 索引列表，不能重复
					  {MonstId,RefreshMonsterNum} = lists:nth(NewRefreshNum,AllNumeberList),
					  NewMonsterNum = MonsterNum + RefreshMonsterNum,
					  F1= fun({Value,_},{_,Index})->

						  case Value =:= Index of
							  true ->
								  {true,Value};
							  _->
								  {false,Value}

						  end
					      end,
					  F= fun({X,Y},{Index,L})->
						  {IsIn, Indx} =   misc:foldlEx(F1,{false,Index},ListMonsterCode),
						  case IsIn of
							  true ->
								  {Index+1,L};
							  _->
								  {Index+1,[Index|L]}

						  end
					     end,
					  {_,NPCIndexList} = lists:foldl(F, {1,[]}, AllPointList),

					  RandomNpcIndexList =  misc:randUniqueFromList(RefreshMonsterNum,NPCIndexList),

					  %%创建NPC
					  F2= fun(Value)->
						  createMonster(MapPid,MapId,MonstId,Value)
					      end,
					  lists:foreach(F2, RandomNpcIndexList),

					  TimeNow = time:getSyncUTCTimeFromDBS() +  configSwimmingparty_frequency(),
					  ActionTime = time:getSyncUTCTimeFromDBS() + (configDate_hide_transmittime() -configDate_hide_actiontime()-2),
					  TransferTime = time:getSyncUTCTimeFromDBS() +configDate_hide_transmittime(),
					  MapInfoNew = MapInfoOld#recMapInfo{
						  paramEx = RecActive#recActiveFindTreasure{
							  refreshNum = NewRefreshNum,
							  refreshTime = TimeNow,
							  playActionTime = ActionTime,
							  monsterNum = NewMonsterNum,
							  transferTime  = TransferTime,
							  isSync = true,
							  syncMonsterPosTime = time:getSyncUTCTimeFromDBS() +1
						  }
					  },
					  acDateState:replaceMapInfo(MapInfoNew),


					  NetMsg =
						  #pk_GS2U_Date_ResetFindTreasure_Sync{

						  },
					  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsg),
					  acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsg),
					  MapInfoNew;
				_->
					TimeNow = time:getSyncUTCTimeFromDBS() +  configSwimmingparty_frequency(),
					ActionTime = time:getSyncUTCTimeFromDBS() + (configDate_hide_transmittime() -configDate_hide_actiontime()-2),
					TransferTime = time:getSyncUTCTimeFromDBS() +configDate_hide_transmittime(),
					MapInfoNew = MapInfoOld#recMapInfo{
						paramEx = RecActive#recActiveFindTreasure{

							refreshTime = TimeNow,
							playActionTime = ActionTime,
							transferTime  = TransferTime
						}
					},
					acDateState:replaceMapInfo(MapInfoNew),
					MapInfoNew
			end;
		_->
			MapInfoOld
	end.

%%% 怪物死亡
-spec monsterDead(MapInfoOld::#recMapInfo{},Code::uint64()) -> MapInfoNew::#recMapInfo{}.
monsterDead(#recMapInfo{mapPID = MapPid, roleID_A = RoleID_A, roleID_B = RoleID_B, playerEts = PlayerEts, paramEx = RecActive} = MapInfoOld,Code) ->
	case RecActive#recActiveFindTreasure.state of
		?ActiveState_FindeTreasure ->

			#recActiveFindTreasure{
				monsterNum  = MonsterNum,
				listMonsterCode = ListMonsterCode,
				score = Score
			} = RecActive,


			AllPointList = configDate_hide_refresh(),
			F= fun({Idx,Cde},{L,Vecter})->

				case  Code =:=Cde  of
					  true->
						  {L,Vecter};
					_->
						{X2,Y2} = lists:nth(Idx,AllPointList),
						{[{Idx,Cde}|L],[#pk_DateMonsterPos{code = Cde ,x = X2,z = Y2}|Vecter]}
				end
			   end,

			{NewListMonsterCode,NewVecter} = lists:foldl(F, {[],[]}, ListMonsterCode),

			Msg = #pk_GS2U_MonsterMoveSync{monsterPosList = NewVecter},
			acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, Msg),
			acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, Msg),


			NewMonsterNum = MonsterNum-1,
			NewScore = Score+configSwimmingparty_addscorelist(),
			MapInfoNew = MapInfoOld#recMapInfo{
				paramEx = RecActive#recActiveFindTreasure{
					monsterNum = NewMonsterNum,
					score = NewScore,
					listMonsterCode = NewListMonsterCode

				}
			},

			MaxScore =  configDate_hide_scoreMax(),
			acDateState:replaceMapInfo(MapInfoNew),


			NetMsg =
				#pk_GS2U_Date_FindTreasure_Sync{
					score = NewScore
				},
			acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsg),
			acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsg),



			case  NewScore >= MaxScore of
				true->
					settle(MapInfoNew, ?SettleReason_ScoreMax, 0);
				_->
					case NewMonsterNum =< 0 of
						true->
							createNPC(MapInfoNew);
						_->
							MapInfoNew
					end
			end;

		_->
			MapInfoOld
	end.

%%% 创建npc
-spec resetMonsterPos(MapInfoOld::#recMapInfo{}) -> ok.
resetMonsterPos(#recMapInfo{mapPID = MapPid, roleID_A = RoleID_A, roleID_B = RoleID_B, playerEts = PlayerEts, monsterEts = MonsterEts, paramEx = RecActive} = MapInfoOld) ->
	#recActiveFindTreasure{
		listMonsterCode = ListMonsterCode
	} = RecActive,

	AllPointList = configDate_hide_refresh(),

	F1= fun({Value,_},{_, Index})->

		case Value =:= Index of
			true ->
				{true,Value};
			_->
				{false,Value}

		end
	    end,
	F= fun({X,Y},{Index,L})->
		{IsIn, Indx} =   misc:foldlEx(F1,{false,Index},ListMonsterCode),
		case IsIn of
			true ->
				{Index+1,L};
			_->
				{Index+1,[Index|L]}

		end
	   end,
	{_,NPCIndexList} = lists:foldl(F, {1,[]}, AllPointList),
	Count = erlang:length(ListMonsterCode),
	RandomNpcIndexList =  misc:randUniqueFromList(Count,NPCIndexList),
	?ERROR_OUT("resetMonsterPos  resetMonsterPos "),
	FunRestPos =
		fun(#recMapObject{pid = PlayerPid, mapPid = MPid, code =  Code,groupID = GroupID}, {[Value | RandomNpcIndexList],NewListCode,Vecter})  ->
			{X,Y} = lists:nth(Value,AllPointList),

			%% 更新NPC坐标
			myEts:updateEts(MonsterEts, Code, [{#recMapObject.x, X}, {#recMapObject.y, Y}]),
			psMgr:sendMsg2PS(MapPid, tickUpdateMonsterPos, {Code, X, Y}),
			%% 通知全图玩家，NPC移动了

			?ERROR_OUT("code  (~p)   X   (~p)   Y (~p)  resetMonsterPos " ,[Code,X,Y]),
			{RandomNpcIndexList,  [{Value,Code}|NewListCode],[#pk_DateMonsterPos{code = Code,x = X, z = Y}|Vecter]}
		end,
	{_,NewMonsterCodeList,NewVecterList} = lists:foldl(FunRestPos , {RandomNpcIndexList,[],[]}, ets:tab2list(MonsterEts)),

	Msg = #pk_GS2U_MonsterMoveSync{monsterPosList = NewVecterList},
	acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, Msg),
	acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, Msg),

	TimeNow = time:getSyncUTCTimeFromDBS(),
	TransTime =TimeNow + configDate_hide_transmittime(),
	Action_Time =TimeNow + (configDate_hide_transmittime() -configDate_hide_actiontime() -2),
	MapInfoNew = MapInfoOld#recMapInfo{
		paramEx = RecActive#recActiveFindTreasure{
			transferTime  = TransTime,
			playActionTime = Action_Time,
			listMonsterCode =NewMonsterCodeList
		}
	},
	acDateState:replaceMapInfo(MapInfoNew),

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


% 放弃游戏
-spec giveup(MapInfoOld::#recMapInfo{}, {RoleID::uint64(), IsSettle::boolean()}) -> MapInfoNew::#recMapInfo{}.
giveup(#recMapInfo{mapPID = MapPid, timerRefMain = TimerRefMain, paramEx = RecActive} = MapInfoOld, {RoleID, IsSettle}) ->
	%?DEBUG_OUT("[DebugForDate] gmSayItsEnd RoleID(~p) IsSettle(~p)", [RoleID, IsSettle]),
	case IsSettle of
		true ->
			%% 如果不是主游戏阶段，则忽略该消息
			case RecActive#recActiveFindTreasure.state of
				?ActiveState_FindeTreasure ->
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
				activeID  = ?DateActiveID_FindTreasure,
				paramEx   = ?ActiveState_FindeTreasure
			}
		),
		paramEx = RecActive#recActiveFindTreasure{
			state             = ?ActiveState_FindeTreasure,    %% 更新玩法状态
			timeBegin         = TimeNow,              %% 更新玩法开始时间
			timeEnd           = TimeNow + TimeThisState
		}
	},
	createNPC(MapInfoNew);
%% 游戏时间结束，进入结算流程
onTimerMain(MapInfoOld, ?ActiveState_FindeTreasure) ->
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
		#recActiveFindTreasure{
			state = ?ActiveState_FindeTreasure,
			refreshTime = RefreshTime,
			playActionTime = PlayActionTime,
			transferTime = TransferTime,
			syncMonsterPosTime = SyncMonsterPosTime,
			listMonsterCode = ListMonsterCode,
			isSync = IsSync
		} ->
			%% 只在正确初始化玩法后，在主玩法状态中响应，同步剩余时间
			TimeNow = time:getSyncUTCTimeFromDBS(),

			case IsSync =:= true andalso  TimeNow > SyncMonsterPosTime of
				  true ->
					  MapInfo = MapInfoOld#recMapInfo{
						  paramEx = RecActive#recActiveFindTreasure{
							  isSync = false
						  }
					  },
					  acDateState:replaceMapInfo(MapInfo),

					AllPointList = configDate_hide_refresh(),
					F= fun({Idx,Cde},Vecter)->
						{X2,Y2} = lists:nth(Idx,AllPointList),
						[#pk_DateMonsterPos{code = Cde ,x = X2,z = Y2}|Vecter]
			        end,
					NewVecter = lists:foldl(F, [], ListMonsterCode),
					Msg = #pk_GS2U_MonsterMoveSync{monsterPosList = NewVecter},
					acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, Msg),
					acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, Msg);
				   _->
					   skip
			end,

			case TimeNow >= TransferTime of
				true ->

					resetMonsterPos(MapInfoOld);
				_->
					skip

			end,
			case TimeNow > PlayActionTime of
				true ->

					NetMsg =
						#pk_GS2U_Date_PlayerAnimation_Sync{
						},
					acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_A, PlayerEts, NetMsg),
					acDateLogic:sendNetMsg2PlayerFromThisMap(RoleID_B, PlayerEts, NetMsg),
					ActionTime =TimeNow + (configDate_hide_transmittime() -configDate_hide_actiontime()-2),
					MapInfoNew1 = MapInfoOld#recMapInfo{
						paramEx = RecActive#recActiveFindTreasure{
							playActionTime = ActionTime
						}
					},
					acDateState:replaceMapInfo(MapInfoNew1);
				_->
					skip
			end,
			case TimeNow > RefreshTime of
				true->
					createNPC(MapInfoOld);
				_->
					skip
			end;
		_ ->
			skip
	end,
	MapInfoOld.


%% 进入结算流程
-spec settle(MapInfoOld::#recMapInfo{}, Reason::type_sr(), RoleID::uint64()) -> MapInfoNew::#recMapInfo{}.
settle(#recMapInfo{mapPID = MapPid,activeID = ActiveID, timerRefMain = TimerRefMain, roleID_A = RoleID_A, roleID_B = RoleID_B, playerEts = PlayerEts, paramEx = RecActive,roleA_enterCount  = RoleA_EnterCount,roleB_enterCount = RoleB_EnterCount} = MapInfoOld, Reason, _RoleID) ->
	%?DEBUG_OUT("[DebugForDate] settle Reason(~p) RoleID(~p)", [Reason, RoleID]),
	%% 0.清除可能存在的怪物
	acDateLogic:clearAllObject(MapPid, ?CodeTypeMonster),
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
				activeID  = ?DateActiveID_FindTreasure,
				paramEx   = ?ActiveState_Settle
			}
		),
		paramEx = RecActive#recActiveFindTreasure{
			state       = ?ActiveState_Settle,    %% 更新玩法状态
			timeBegin   = TimeNow,                %% 更新玩法开始时间
			timeEnd     = TimeNow + TimeThisState
		}
	},
	acDateState:replaceMapInfo(MapInfoNew),

	%% 2.判断进入次数来发放奖励
	#recActiveFindTreasure{score = Score} = RecActive,
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
	ListKey2 = getCfg:get2KeyList(cfg_appointment_reward, ?DateActiveID_FindTreasure),
	FunGetCfg =
		fun(Key2, {Mark, Result}) ->
			Cfg = getCfg:getCfgPStack(cfg_appointment_reward, ?DateActiveID_FindTreasure, Key2),
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

%%每波刷新的间隔时间
configSwimmingparty_frequency() ->
	#globalsetupCfg{setpara = [List]} =
		getCfg:getCfgPStack(cfg_globalsetup, date_hide_refreshtime),
	List.

%%积分
configSwimmingparty_addscorelist() ->
	#globalsetupCfg{setpara = [List]} =
		getCfg:getCfgPStack(cfg_globalsetup, date_hide_score),
	List.


%%传送时间
configDate_hide_transmittime() ->
	#globalsetupCfg{setpara = [List]} =
		getCfg:getCfgPStack(cfg_globalsetup, date_hide_transmittime),
	List.

%%传送时间
configDate_hide_scoreMax() ->
	#globalsetupCfg{setpara = [List]} =
		getCfg:getCfgPStack(cfg_globalsetup, date_hide_scoreMax),
	List.


%%美波数量ID
configDate_hide_refreshnumber() ->
	#globalsetupCfg{setpara = List} =
		getCfg:getCfgPStack(cfg_globalsetup, date_hide_refreshnumber),
	List.

%%做动作的间隔
configDate_hide_actiontime() ->
	#globalsetupCfg{setpara = [List]} =
		getCfg:getCfgPStack(cfg_globalsetup, date_hide_actiontime),
	List.

%%刷新的坐标点
configDate_hide_refresh() ->
	#globalsetupCfg{setpara = List} =
		getCfg:getCfgPStack(cfg_globalsetup, date_hide_refresh),
	List.


