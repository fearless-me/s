%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20170227
%%%-------------------------------------------------------------------
-module(acSpiritAreaLogic).
-author("meitianyang").

-include("acSpiritAreaPrivate.hrl").

%% 本进程调用的常规接口
-export([
	init/0,
	enter/2
]).

%% 本进程调用的系统接口
-export([
	activityMapMsg/2
]).

%% 定时器接口
-export([
	tick/0
]).

%%% ====================================================================
%%% API functions 常规接口
%%% ====================================================================

%%----------------------------------------------------------------------------------------------
%% 初始化
-spec init() -> ok.
init() ->
	?DEBUG_OUT("[DebugForSpiritArea] init"),
	case get('IsInit') of
		true ->
			skip;
		_ ->
			acSpiritAreaState:initMapInfoEts(),
			erlang:send_after(?HeartTickTime, self(), ?HeartTickMsg),
			put('IsInit', true)
	end,
	ok.

%%----------------------------------------------------------------------------------------------
%% 请求进入灵界活动
-spec enter(FromPid::pid(), {RoleID::uint64(), MapID::uint(), TeamID::uint64()}) -> ok.
enter(FromPid, {RoleID, MapID, TeamID}) ->
	case acSpiritAreaState:getMapInfoByRoleID(RoleID) of
		#recMapInfo{state = ?State_Creating} ->
			%% 地图正在被创建，忽略该请求
			?DEBUG_OUT("[DebugForSpiritArea] enter isCreateing RoleID:~p TeamID:~p", [RoleID, TeamID]),
			skip;
		#recMapInfo{state = ?State_End} ->
			%% 地图准备销毁，忽略该请求
			skip;
		#recMapInfo{} ->
			%% 地图已存在，可直接进入
			?DEBUG_OUT("[DebugForSpiritArea] enter allowed enter RoleID:~p TeamID:~p", [RoleID, TeamID]),
			psMgr:sendMsg2PS(FromPid, spiritArea_enterAck, MapID);
		_ ->
			%% 地图不存在，需要创建后进入
			?DEBUG_OUT("[DebugForSpiritArea] enter need create RoleID:~p TeamID:~p", [RoleID, TeamID]),
			%% 检查队伍状态
			#rec_base_role{level = LevelLeader} =
				core:queryBaseRoleByRoleID(RoleID),
			LevelLeaderID = acSpiritAreaState:configKey1ByLevel(LevelLeader),
			case LevelLeaderID =:= 0 of
				true ->
					?ERROR_CODE_Ex(RoleID, ?ErrorCode_CopyMapLevelLimit);
				_ ->
					ResultOfCheck =
						case teamInterface:getTeamInfoWithTeamID(TeamID) of
							#recTeamInfo{leaderID = LeaderID, memberList = ListMember} ->
								case LeaderID of
									RoleID ->
										FunCheckLevel =
											fun(#recTeamMemberInfo{name = Name, level = Level}, {_, Key1}) ->
												case acSpiritAreaState:configKey1ByLevel(Level) >= Key1 of
													true ->
														{false, Key1};
													_ ->
														{true, Name}
												end
											end,
										case misc:foldlEx(FunCheckLevel, {false, LevelLeaderID}, ListMember) of
											{true, Name} ->
												?ERROR_CODE_Ex(RoleID, ?ErrorCode_SpiritArea_LevelArea, [Name]),	%% 队员需要与队长在同一等级段
												false;
											_ ->
												true	%% 检查通过
										end;
									_ ->
										?ERROR_CODE_Ex(RoleID, ?ErrorCode_SpiritArea_NeedLeader),	%% 需要队长创建地图
										false
								end;
							_ ->
								true	%% 没有队伍
						end,
					%% 创建地图
					case ResultOfCheck of
						true ->
							OwnerID =
								case TeamID > 0 of
									true ->
										TeamID;
									_ ->
										{0, RoleID}
								end,
							MapInfo =
								#recMapInfo{
									ownerID			= OwnerID,
									deadlineTime	= acSpiritAreaState:configTimeAll(),
									time			= ?TimeForError,
									level			= LevelLeaderID
								},
							acSpiritAreaState:replaceMapInfo(MapInfo),
							psMgr:sendMsg2PS(FromPid, spiritArea_enterAck, MapID);
						_ ->
							skip
					end
			end
	end,
	ok.

%%% ====================================================================
%%% API functions 系统接口
%%% ====================================================================

%%----------------------------------------------------------------------------------------------
%% 活动地图的消息
-spec activityMapMsg(MsgType::uint(), Data::term()) -> ok.
%% 创建后的初始化消息
activityMapMsg(?ACMapMsg_CreateMap, {CreatorRoleID, _MapID, MapPid, PlayerEts, MonsterEts, _CollectEts, _NpcEts} = _Data) ->
	?DEBUG_OUT("[DebugForSpiritArea] activityMapMsg ?ACMapMsg_CreateMap ~p", [_Data]),
	case acSpiritAreaState:getMapInfoByRoleID(CreatorRoleID) of
		#recMapInfo{state = ?State_Creating} = MapInfo ->
			?DEBUG_OUT("[DebugForSpiritArea] state change from:~p to:~p", [?State_Creating, ?State_Created]),
			%% 地图创建成功，初始化地图数据
			acSpiritAreaState:replaceMapInfo(
				MapInfo#recMapInfo{
					mapPid		= MapPid,
					state		= ?State_Created,
					time		= ?TimeForError,
					playerEts	= PlayerEts,
					monsterEts	= MonsterEts
				}
			);
		_ ->
			?ERROR_OUT("activityMapMsg ACMapMsg_CreateMap map is not exists! ~p", [_Data])
	end,
	ok;
%% 销毁地图
activityMapMsg(?ACMapMsg_DestoryMap, MapPid) ->
	?DEBUG_OUT("[DebugForSpiritArea] activityMapMsg ?ACMapMsg_DestoryMap ~p", [MapPid]),
	acSpiritAreaState:deleteMapInfo(MapPid);
%% 杀死怪物
activityMapMsg(?ACMapMsg_KillMonster, {_MapID, MapPid, _AttackRoleID, _MonsterCode, MonsterID} = _Data) ->
	?DEBUG_OUT("[DebugForSpiritArea] activityMapMsg ?ACMapMsg_KillMonster ~p", [_Data]),
	case acSpiritAreaState:getMapInfoByMapPid(MapPid) of
		#recMapInfo{state = ?State_Going, count = Count} = MapInfo ->
			acSpiritAreaState:replaceMapInfo(
				MapInfo#recMapInfo{
					count = Count - 1
				}
			);
		%#recMapInfo{state = ?State_Going, monsterEts = MonsterEts, wave = Wave, level = Level, playerEts = PlayerEts, deadlineTime = TimeAll} = MapInfo ->
			%case getCfg:getCfgByKey(cfg_monster, MonsterID) of
			%	#monsterCfg{monsterSplit = [_|_]} ->
			%		%% 被杀死的怪物会分裂，忽略该消息
			%		?DEBUG_OUT("[DebugForSpiritArea] activityMapMsg ?ACMapMsg_KillMonster will split"),
			%		skip;
			%	_ ->
			%		%% 检查是否有怪存活
			%		case ets:info(MonsterEts, size) of
			%			0 ->
			%				%% 全部怪物死亡，切换状态
			%				?DEBUG_OUT("[DebugForSpiritArea] state change from:~p to:~p", [?State_Going, ?State_Wait]),
			%				TimeMin = erlang:min(TimeAll, acSpiritAreaState:configTimeWait()),
			%				acSpiritAreaState:replaceMapInfo(
			%					MapInfo#recMapInfo{
			%						state	= ?State_Wait,
			%						time	= TimeMin
			%					}
			%				),
			%				%% 发放波次奖励
			%				sendMsgToMapPlayer(PlayerEts, spiritArea_reward, {Level, Wave});
			%			_Count ->
			%				%% 战斗尚未结束，继续打
			%				?DEBUG_OUT("[DebugForSpiritArea] activityMapMsg ?ACMapMsg_KillMonster keep fight ~p", [_Count]),
			%				skip
			%		end
			%end;
		#recMapInfo{} = MapInfo ->
			?ERROR_OUT("activityMapMsg ACMapMsg_KillMonster MonsterID:~p MapInfo:~p", [MonsterID, MapInfo]);
		_ ->
			?ERROR_OUT("activityMapMsg ACMapMsg_KillMonster map is not exists! ~p", [_Data])
	end,
	ok;
%% 玩家进入
activityMapMsg(?ACMapMsg_PlayerEnter, {RoleID, MapPid, #recMapObject{} = _Data}) ->
	?DEBUG_OUT("[DebugForSpiritArea] activityMapMsg ?ACMapMsg_PlayerEnter ~p", [RoleID]),
	case acSpiritAreaState:getMapInfoByMapPid(MapPid) of
		#recMapInfo{state = ?State_Created} = MapInfo ->
			%% 第一角色进入地图，进入准备阶段
			?DEBUG_OUT("[DebugForSpiritArea] state change from:~p to:~p", [?State_Created, ?State_Ready]),
			acSpiritAreaState:replaceMapInfo(
				MapInfo#recMapInfo{
					state	= ?State_Ready,
					time	= acSpiritAreaState:configTimeReady()
				}
			);
		#recMapInfo{} ->
			skip;
		_ ->
			?ERROR_OUT("activityMapMsg ACMapMsg_PlayerEnter map is not exists! ~p", [_Data])
	end,
	ok;
%% 玩家离开
activityMapMsg(?ACMapMsg_PlayerLeave, {RoleID, MapPid, #recMapObject{pid = Pid}} = _Data) ->
	?DEBUG_OUT("[DebugForSpiritArea] activityMapMsg ?ACMapMsg_PlayerLeave ~p", [RoleID]),
	case acSpiritAreaState:getMapInfoByMapPid(MapPid) of
		#recMapInfo{state = ?State_End} ->
			skip;
		#recMapInfo{state = _State, playerEts = PlayerEts} = MapInfo ->
			%% 所有人都跑光了，销毁地图
			case ets:info(PlayerEts, size) of
				0 ->
					?DEBUG_OUT("[DebugForSpiritArea] state change from:~p to:~p", [_State, ?State_End]),
					acSpiritAreaState:replaceMapInfo(
						MapInfo#recMapInfo{
							state	= ?State_End,
							time	= 0
						}
					);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	keepWake_(false, [Pid]),
	ok;
%% 忽略其它消息
activityMapMsg(_, _) ->
	ok.

%%% ====================================================================
%%% API functions 定时器接口
%%% ====================================================================

%%----------------------------------------------------------------------------------------------
%% 心跳
-spec tick() -> ok.
tick() ->
	erlang:send_after(?HeartTickTime, self(), ?HeartTickMsg),
	allMapRun().

%%% ====================================================================
%%% Internal functions
%%% ====================================================================

%%----------------------------------------------------------------------------------------------
%% 向地图上的玩家发送网络消息
-spec sendNetMsgToMapPlayer(PlayerEts::etsTab(), Msg::term()) -> ok.
sendNetMsgToMapPlayer(PlayerEts, Msg) ->
	MatchSpec = ets:fun2ms(fun(Object) -> Object#recMapObject.netPid end),
	MapPlayerNetPidList = myEts:selectEts(PlayerEts, MatchSpec),
	lists:foreach(fun(NetPid) -> playerMsg:sendNetMsg(NetPid, Msg) end, MapPlayerNetPidList),
	ok.

%%----------------------------------------------------------------------------------------------
%% 向地图上的玩家发送进程消息
-spec sendMsgToMapPlayer(PlayerEts::etsTab(), MsgID::atom(), Msg::term()) -> ok.
sendMsgToMapPlayer(PlayerEts, MsgID, Msg) ->
	MatchSpec = ets:fun2ms(fun(Object) -> Object#recMapObject.pid end),
	MapPlayerNetPidList = myEts:selectEts(PlayerEts, MatchSpec),
	lists:foreach(fun(Pid) -> psMgr:sendMsg2PS(Pid, MsgID, Msg) end, MapPlayerNetPidList),
	ok.

%%----------------------------------------------------------------------------------------------
%% 同步消息
-spec syncInfo(MapInfo::#recMapInfo{}) -> ok.
syncInfo(#recMapInfo{state = ?State_End}) ->
	ok;
syncInfo(#recMapInfo{
	wave			= Wave,
	state			= State,
	time			= Time,
	deadlineTime	= DeadlineTime,
	playerEts		= PlayerEts
}) ->
	StateForNetMsg =
		case State of
			?State_Going ->
				?NetMsgState_Going;
			_ ->
				?NetMsgState_Wait
		end,
	Msg =
		#pk_GS2U_SpiritArea_Tick_Sync{
			time	= Time,
			timeAll	= DeadlineTime,
			wave	= Wave,
			state	= StateForNetMsg
		},
	%?DEBUG_OUT("[DebugForSpiritArea] syncInfo ~p", [Msg]),
	sendNetMsgToMapPlayer(PlayerEts, Msg).

%%----------------------------------------------------------------------------------------------
%% 处理所有地图的事件
-spec allMapRun() -> ok.
allMapRun() ->
	L = acSpiritAreaState:getMapInfoList(),
	allMapRun1(L),
	ok.
-spec allMapRun1(ListMapInfo::[#recMapInfo{}, ...]) -> ok.
allMapRun1([]) ->
	ok;
allMapRun1([MapInfo | L]) ->
	oneMapRun(MapInfo),
	allMapRun1(L).

%%----------------------------------------------------------------------------------------------
%% 处理单个地图的事件
-spec oneMapRun(MapInfo::#recMapInfo{}) -> ok.
%% 正在创建的地图
oneMapRun(#recMapInfo{state = ?State_Creating} = R) ->
	R0 = checkTimeAll(R),
	R1 = checkTimeReady(R0),
	acSpiritAreaState:replaceMapInfo(R1),
	ok;
%% 创建完毕
oneMapRun(#recMapInfo{state = ?State_Created} = R) ->
	R0 = checkTimeAll(R),
	R1 = checkTimeReady(R0),
	acSpiritAreaState:replaceMapInfo(R1);
%% 准备阶段
oneMapRun(#recMapInfo{state = ?State_Ready} = R) ->
	R0 = checkTimeAll(R),
	R1 = checkTimeNext(R0),
	acSpiritAreaState:replaceMapInfo(R1),
	syncInfo(R1);
%% 主玩法阶段
oneMapRun(#recMapInfo{state = ?State_Going, count = Count,
	deadlineTime = TimeAll, wave = Wave, level = Level,
	playerEts = PlayerEts, timeFMD = TimeFMD} = R) when Count < 1 ->
	%% 全部怪物死亡，切换状态
	case TimeFMD of
		0 ->
			acSpiritAreaState:replaceMapInfo(R#recMapInfo{timeFMD = 2});
		1 ->
			?DEBUG_OUT("[DebugForSpiritArea] state change from:~p to:~p", [?State_Going, ?State_Wait]),
			TimeMin = erlang:min(TimeAll, acSpiritAreaState:configTimeWait()),
			RNew =
				R#recMapInfo{
					state	= ?State_Wait,
					time	= TimeMin,
					timeFMD	= 0
				},
			acSpiritAreaState:replaceMapInfo(RNew),
			%% 发放波次奖励
			sendMsgToMapPlayer(PlayerEts, spiritArea_reward, {Level, Wave}),
			oneMapRun(RNew);
		_ ->
			acSpiritAreaState:replaceMapInfo(R#recMapInfo{timeFMD = TimeFMD - 1})
	end;
oneMapRun(#recMapInfo{state = ?State_Going} = R) ->
	keepWake(true, R),
	R0 = checkTimeAll(R),
	acSpiritAreaState:replaceMapInfo(R0),
	syncInfo(R0);
%% 波次结算
oneMapRun(#recMapInfo{state = ?State_Wait} = R) ->
	keepWake(true, R),
	R0 = checkTimeAll(R),
	R1 = checkTimeNext(R0),
	acSpiritAreaState:replaceMapInfo(R1),
	syncInfo(R1);
%% 销毁地图
oneMapRun(#recMapInfo{state = ?State_End, mapPid = MapPid} = R) ->
	?DEBUG_OUT("[DebugForSpiritArea] oneMapRun resetCopyMap", []),
	psMgr:sendMsg2PS(MapPid, resetCopyMap, {}),
	acSpiritAreaState:deleteMapInfo(R),
	ok.

%%----------------------------------------------------------------------------------------------
%% 刷新计时，检查是否最终超时
%% 需要将总时间与结算等待时间分开
checkTimeAll(#recMapInfo{deadlineTime = DeadlineTime, state = ?State_Going} = R) ->
	DeadlineTimeNew = erlang:max(DeadlineTime - 1, 0),
	StateNew =
		case DeadlineTimeNew of
			0 ->
				?DEBUG_OUT("[DebugForSpiritArea] state change from:~p to:~p", [?State_Going, ?State_End]),
				?State_End;
			_ ->
				?State_Going
		end,
	R#recMapInfo{
		deadlineTime = DeadlineTimeNew,
		state = StateNew
	};
checkTimeAll(#recMapInfo{time = Time} = R) ->
	R#recMapInfo{time = erlang:max(Time - 1, 0)}.

%%----------------------------------------------------------------------------------------------
%% 检查是否刷新下一波
checkTimeNext(#recMapInfo{state = ?State_End} = R) ->
	R;	%% 已经结束，放弃吧
checkTimeNext(#recMapInfo{
	mapPid = MapPid,
	state = _State,
	wave = Wave,
	time = 0,
	deadlineTime = DeadlineTime,
	level = Level
} = R) ->
	case acSpiritAreaState:configMonster(Level, Wave + 1, MapPid) of
		[] ->
			%% 没有下一波，游戏结束
			?DEBUG_OUT("[DebugForSpiritArea] state change from:~p to:~p Level:~p Wave:~p", [_State, ?State_End, Level, Wave]),
			R#recMapInfo{
				state = ?State_End
			};
		Msg ->
			%% 刷怪
			?DEBUG_OUT("[DebugForSpiritArea] state change from:~p to:~p Level:~p Wave:~p", [_State, ?State_Going, Level, Wave]),
			keepWake(true, R),
			Count = getMonsterCount(Msg, 0),
			erlang:send_after(1000, MapPid, {spawnObject, self(), Msg}),
			%psMgr:sendMsg2PS(MapPid, spawnObject, Msg),
			R#recMapInfo{
				wave = Wave + 1,
				time = DeadlineTime,
				state = ?State_Going,
				count = Count
			}
	end;
checkTimeNext(R) ->
	R.

%% 计算刷怪数量（包括将会分裂出的部分）
-spec getMonsterCount(Msg::[#recSpawnMonster{}, ...], CountAcc::uint()) -> Count::uint().
getMonsterCount([], CountAcc) ->
	CountAcc;
getMonsterCount([{#recSpawnMonster{id = ID}, _, _, _} | T], CountAcc) ->
	CountAccNew = getMonsterCountSp(ID, CountAcc),
	getMonsterCount(T, CountAccNew).
getMonsterCountSp(ID, CountAcc) ->
	#monsterCfg{monsterSplit = MonsterSplit} =
		getCfg:getCfgPStack(cfg_monster, ID),
	case MonsterSplit of
		[_|_] ->
			FunCount =
				fun({SpID, SpCount}, SpCountAcc) ->
					getMonsterCountSp(SpID, 0) * SpCount + SpCountAcc
				end,
			lists:foldl(FunCount, CountAcc, MonsterSplit) + 1;
		_ ->
			CountAcc + 1
	end.



%%----------------------------------------------------------------------------------------------
%% 检查是否准备超时
checkTimeReady(#recMapInfo{state = ?State_End} = R) ->
	R;	%% 已经结束，放弃吧
checkTimeReady(#recMapInfo{time = 0, state = _State} = R) ->
	?DEBUG_OUT("[DebugForSpiritArea] state change from:~p to:~p", [_State, ?State_End]),
	R#recMapInfo{
		state = ?State_End
	};
checkTimeReady(R) ->
	R.

%%-------------------------------------------------------------------
%% 保持觉醒
-spec keepWake(NeedWake::boolean(), MapInfo::#recMapInfo{}) -> ok.
keepWake(NeedWake, #recMapInfo{playerEts = PlayerEts}) ->
	ListPid =
		ets:foldl(
			fun(#recMapObject{pid = Pid}, R) ->
				[Pid | R]
			end,
			[],
			PlayerEts
		),
	keepWake_(NeedWake, ListPid),
	ok.

keepWake_(_, []) ->
	ok;
keepWake_(NeedWake, [H|T]) ->
	psMgr:sendMsg2PS(H, spiritArea_keepWake, NeedWake),
	keepWake_(NeedWake, T).
