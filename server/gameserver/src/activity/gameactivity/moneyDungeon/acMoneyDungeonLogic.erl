%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20161215
%%%-------------------------------------------------------------------
-module(acMoneyDungeonLogic).
-author("meitianyang").

-include("acMoneyDungeonPrivate.hrl").


%% 本进程调用的常规接口
-export([
	onEnterMap/2,
	onGiveup/2,
	onNext/2
]).

%% 本进程调用的系统接口
-export([
	activityMapMsg/2,
	spawnAck/2,
	monsterReachedEnd/1
]).

%% 定时器接口
-export([
	tick/0
]).

%% 外部可用配置接口
-export([
	configStartPointPlayer/0
]).

%%% ====================================================================
%%% API functions 常规接口
%%% ====================================================================

%%----------------------------------------------------------------------------------------------
%% 请求进入金币副本
-spec onEnterMap(FromPid::pid(), {RoleID::uint64(), MapID::uint(), TeamID::uint64()}) -> ok.
onEnterMap(FromPid, {RoleID, MapID, TeamID}) ->
	case acMoneyDungeonState:getMapInfoByRoleID(RoleID) of
		#recMapInfo{isCreating = true} ->
			%% 地图正在被创建，忽略该请求
			?DEBUG_OUT("[DebugForMoneyDungeon] onEnterMap isCreateing ~p",[RoleID]),
			skip;
		#recMapInfo{} ->
			%% 地图已存在，可直接进入
			?DEBUG_OUT("[DebugForMoneyDungeon] onEnterMap allowed enter ~p",[RoleID]),
			psMgr:sendMsg2PS(FromPid, moneyDungeon_EnterAck, MapID);
		_ ->
			%% 地图不存在，需要创建后进入
			?DEBUG_OUT("[DebugForMoneyDungeon] onEnterMap need create ~p",[RoleID]),
			Map = #recMapInfo{
				creator   	= RoleID,
				isCreating	= true,
				mapID     	= MapID,
				teamID    	= TeamID,
				timeState	= myNow()  %% 请求创建后经历了与结算时间相同的时间后没有正确初始化则需要回收
			},
			acMoneyDungeonState:addMapInfo(Map),
			psMgr:sendMsg2PS(FromPid, moneyDungeon_EnterAck, MapID)
	end,
	ok.

%%----------------------------------------------------------------------------------------------
%% 放弃游戏
-spec onGiveup(FromPid::pid(), RoleID::uint64()) -> ok.
onGiveup(_FromPid, RoleID) ->
	?DEBUG_OUT("[DebugForMoneyDungeon] onGiveup RoleID(~p)",[RoleID]),
	case acMoneyDungeonState:getMapInfoByRoleID(RoleID) of
		#recMapInfo{state = ?CHAPTER_GOING} = MapInfo ->
			%% 仅在主状态处理该消息
			acMoneyDungeonState:updateMapInfo(MapInfo#recMapInfo{state = ?CHAPTER_GIVEUP, timeState = myNow()});
		_ ->
			skip %% 忽略该消息
	end,
	ok.

%%----------------------------------------------------------------------------------------------
%% 下一波
-spec onNext(FromPid::pid(), RoleID::uint64()) -> ok.
onNext(FromPid, RoleID) ->
	?DEBUG_OUT("[DebugForMoneyDungeon] onNext RoleID(~p)",[RoleID]),
	case acMoneyDungeonState:getMapInfoByRoleID(RoleID) of
		#recMapInfo{state = ?CHAPTER_GOING, chapter = Chapter} = MapInfo ->
			#chapter{
				curChapter        = CurChapter,
				listMonstersLast  = ListMonstersLast,
				listMonstersCur   = ListMonstersCur,
				listWillCreateAll = ListWillCreateAll,
				isTurnWaiting     = IsTurnWaiting
			} = Chapter,
			case isNull(ListMonstersLast) of
				true ->
					case ListWillCreateAll of
						[] ->
							skip; %% 所有怪都已经刷完了，忽略该消息
						[#monsterWait{curChapter = MyChapter, listCount = ListCount} | _]
							when CurChapter =/= MyChapter orelse IsTurnWaiting =:= true ->
							%% 可以刷下一波
							FunReadyMonster =
								fun({ID, Count}, List) ->
									[
										#monster{
											monsterID = ID,
											countAll = Count
										} |
										List
									]
								end,
							ListMonstersCurNew = lists:foldl(FunReadyMonster, [], ListCount),
							CurChapterNew =
								case IsTurnWaiting of
									true ->
										CurChapter;
									_ ->
										CurChapter + 1
								end,
							MapInfoNew =
								MapInfo#recMapInfo{
									chapter = Chapter#chapter{
										curChapter        = CurChapterNew,
										listMonstersLast  = ListMonstersCur,    %% 将当前波刷怪记录挪到上一波刷怪记录
										listMonstersCur   = ListMonstersCurNew,
										preMonsterTime    = myNow() - configSpawnTime(),
										isTurnWaiting     = false
									}
								},
							acMoneyDungeonState:updateMapInfo(MapInfoNew),
							psMgr:sendMsg2PS(FromPid, moneyDungeon_error, {?ErrorCode_MoneyDungeon_NextIsComing, []});
						_ ->
							%% 当前波怪没刷完
							psMgr:sendMsg2PS(FromPid, moneyDungeon_error, {?ErrorCode_MoneyDungeon_NotSpawnComplete, []})
					end;
				_ ->
					%% 同时存在两波怪
					psMgr:sendMsg2PS(FromPid, moneyDungeon_error, {?ErrorCode_MoneyDungeon_AlreadyTwo, []})
			end;
		_ ->
			skip %% 不在主状态，忽略该消息
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
	?DEBUG_OUT("[DebugForMoneyDungeon] activityMapMsg ?ACMapMsg_CreateMap ~p", [_Data]),
	case acMoneyDungeonState:getMapInfoByRoleID(CreatorRoleID) of
		#recMapInfo{isCreating = true} = MapInfo ->
			{ListWillCreateAll, TimeMax} = configListMonster(CreatorRoleID),
			Chapter =
				#chapter{
					maxChapter        = erlang:length(ListWillCreateAll),
					listWillCreateAll = ListWillCreateAll
				},
			acMoneyDungeonState:updateMapInfo(
				MapInfo#recMapInfo{
					isCreating    = false,
					mapPID        = MapPid,
					playerEts     = PlayerEts,
					monsterEts    = MonsterEts,
					chapter       = Chapter,
					deadlineTime  = myNow() + TimeMax + configWaitTime()
				}
			);
		_ ->
			?ERROR_OUT("activityMapMsg ACMapMsg_CreateMap map is not exists! ~p", [_Data])
	end,
	ok;
%% 销毁地图
activityMapMsg(?ACMapMsg_DestoryMap, MapPid) ->
	?DEBUG_OUT("[DebugForMoneyDungeon] activityMapMsg ?ACMapMsg_DestoryMap ~p", [MapPid]),
	acMoneyDungeonState:deleteMapInfoByMapPid(MapPid);
%% 杀死怪物
activityMapMsg(?ACMapMsg_KillMonster, {_MapID, MapPid, _AttackRoleID, MonsterCode, MonsterID} = _Data) ->
	case acMoneyDungeonState:getMapInfoByMapPid(MapPid) of
		#recMapInfo{chapter = Chapter} = MapInfo ->
			#chapter{
				listMonstersLast  = ListMonstersLast, %% 上一波的刷怪记录
				listMonstersCur   = ListMonstersCur,  %% 当前波的刷怪记录
				listKill          = ListKill          %% 杀怪统计
			} = Chapter,
			{ListMonstersLastNew, ListMonstersCurNew} =
				case deleteMonsterByCode(MonsterCode, ListMonstersLast, ?DeleteMonsterReason_Kill) of
					{true, ListMonstersLastNew_} ->
						{ListMonstersLastNew_, ListMonstersCur};
					_ ->
						case deleteMonsterByCode(MonsterCode, ListMonstersCur, ?DeleteMonsterReason_Kill) of
							{true, ListMonstersCurNew_} ->
								{ListMonstersLast, ListMonstersCurNew_};
							_ ->
								?ERROR_OUT("activityMapMsg ?ACMapMsg_KillMonster some Monster is killed, but not cur and not last"),
								{ListMonstersLast, ListMonstersCur}
						end
				end,
			ListKillNew =
				case lists:keyfind(MonsterID, 1, ListKill) of
					{_, CountOld} ->
						lists:keystore(MonsterID, 1, ListKill, {MonsterID, CountOld + 1});
					_ ->
						lists:keystore(MonsterID, 1, ListKill, {MonsterID, 1})
				end,
			MapInfoNew =
				MapInfo#recMapInfo{
					chapter = Chapter#chapter{
						listMonstersLast  = ListMonstersLastNew,
						listMonstersCur   = ListMonstersCurNew,
						listKill          = ListKillNew
					}
				},
			acMoneyDungeonState:updateMapInfo(MapInfoNew);
		_ ->
			?ERROR_OUT("activityMapMsg ACMapMsg_KillMonster map is not exists! ~p", [_Data])
	end,
	ok;
%% 角色进入
activityMapMsg(?ACMapMsg_PlayerEnter,  {_RoleID, MapPid, _} = _Data) ->
	?DEBUG_OUT("[DebugForMoneyDungeon] activityMapMsg ?ACMapMsg_PlayerEnter ~p", [_Data]),
	case acMoneyDungeonState:getMapInfoByMapPid(MapPid) of
		#recMapInfo{state = ?CHAPTER_PREPARE} = R ->
			RNew = R#recMapInfo{state = ?CHAPTER_GOING, timeState = myNow()},
			acMoneyDungeonState:updateMapInfo(RNew);
		#recMapInfo{} ->
			skip;
		_E ->
			?ERROR_OUT("activityMapMsg ?ACMapMsg_PlayerEnter Invalid MapPid:~p ~n~p", [MapPid, _E]),
			psMgr:sendMsg2PS(MapPid, resetCopyMap, {})	%% 错误的地图数据，强制关闭
	end,
	ok;
%% 玩家离开
activityMapMsg(?ACMapMsg_PlayerLeave, {RoleID, MapPid, #recMapObject{pid = Pid}} = _Data) ->
	?DEBUG_OUT("[DebugForMoneyDungeon] activityMapMsg ?ACMapMsg_PlayerLeave ~p", [RoleID]),
	case acMoneyDungeonState:getMapInfoByMapPid(MapPid) of
		#recMapInfo{state = ?CHAPTER_GOING, playerEts = PlayerEts} = MapInfo ->
			%% 所有人都跑光了，销毁地图
			case ets:info(PlayerEts, size) of
				0 ->
					acMoneyDungeonState:updateMapInfo(
						MapInfo#recMapInfo{
							state = ?CHAPTER_GIVEUP,
							timeState = myNow()
						}
					);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok;
%% 忽略其它消息
activityMapMsg(_, _) ->
	ok.

%%----------------------------------------------------------------------------------------------
%% 创建物反馈消息
-spec spawnAck(MapPid::pid(), {Code::uint64(), ExParam::#recSpawnAck{}}) -> ok.
spawnAck(MapPid, {Code, #recSpawnAck{myChapter = MyChapter, monsterID = MonsterID}} = Msg) ->
	case acMoneyDungeonState:getMapInfoByMapPid(MapPid) of
		%% 需要将怪物的Code添加刷怪记录中，以便实现最多只能同时刷两波怪的功能
		#recMapInfo{chapter = Chapter} = MapInfo ->
			#chapter{
				curChapter        = CurChapter,       %% 当前波次
				listMonstersCur   = ListMonstersCur   %% 当前波的刷怪记录
			} = Chapter,
			ListMonstersCurNew =
				case MyChapter of
					CurChapter ->
						addMonsterByCode(MonsterID, Code, ListMonstersCur);
					_ ->
						%% 忽略非当前波的刷怪（应该是延迟）
						?ERROR_OUT("spawnAck Chapter(~p) Msg(~p)", [Chapter, Msg]),
						ListMonstersCur
				end,
			MapInfoNew =
				MapInfo#recMapInfo{
					chapter = Chapter#chapter{
						listMonstersCur = ListMonstersCurNew
					}
				},
			acMoneyDungeonState:updateMapInfo(MapInfoNew);
		_ ->
			?ERROR_OUT("spawnAck map is not exists! ~p", [{MapPid, Msg}])
	end,
	ok.

%%----------------------------------------------------------------------------------------------
%% 怪物走到了终点，需要回收
-spec monsterReachedEnd({MonsterID::uint(), Code::uint64(), MapID::uint(), MapPid::pid(), SX::float(), SY::float()}) -> ok.
monsterReachedEnd({_MonsterID, Code, _MapID, MapPid, _SX, _SY} = Msg)->
	case acMoneyDungeonState:getMapInfoByMapPid(MapPid) of
		#recMapInfo{chapter = Chapter} = MapInfo ->
			#chapter{
				listMonstersLast  = ListMonstersLast, %% 上一波的刷怪记录
				listMonstersCur   = ListMonstersCur   %% 当前波的刷怪记录
			} = Chapter,
			{ListMonstersLastNew, ListMonstersCurNew} =
				case deleteMonsterByCode(Code, ListMonstersLast, ?DeleteMonsterReason_Run) of
					{true, ListMonstersLastNew_} ->
						{ListMonstersLastNew_, ListMonstersCur};
					_ ->
						case deleteMonsterByCode(Code, ListMonstersCur, ?DeleteMonsterReason_Run) of
							{true, ListMonstersCurNew_} ->
								{ListMonstersLast, ListMonstersCurNew_};
							_ ->
								{ListMonstersLast, ListMonstersCur}
						end
				end,
			MapInfoNew =
				MapInfo#recMapInfo{
					chapter = Chapter#chapter{
						listMonstersLast  = ListMonstersLastNew,
						listMonstersCur   = ListMonstersCurNew
					}
				},
			acMoneyDungeonState:updateMapInfo(MapInfoNew),
			psMgr:sendMsg2PS(MapPid, clearObject, {?CodeTypeMonster, [Code]});
		_ ->
			?ERROR_OUT("monsterReachedEnd map is not exists! ~p", [{MapPid, Msg}])
	end,
	ok.

%%% ====================================================================
%%% API functions 定时器接口
%%% ====================================================================

%%----------------------------------------------------------------------------------------------
%% 心跳
-spec tick() -> ok.
tick() ->
	acMoneyDungeonState:addTickCount(),
	allMapRun().

%%% ====================================================================
%%% Internal functions
%%% ====================================================================

%%----------------------------------------------------------------------------------------------
%% 获取当前时间（毫秒级）
-spec myNow() -> uint().
myNow() -> time:getUTCNowMS().

%%----------------------------------------------------------------------------------------------
%% 同步消息
-spec syncInfo(MapInfo::#recMapInfo{}) -> #recMapInfo{}.
syncInfo(#recMapInfo{
	deadlineTime  = DeadlineTime,
	playerEts     = PlayerEts,
	chapter       = Chapter
} = MapInfo) ->
	#chapter{
		curChapter        = CurChapter,
		maxChapter        = MaxChapter,
		listMonstersCur   = ListMonstersCur,
		listWillCreateAll = ListWillCreateAll,
		msgCache          = MsgCache
	} = Chapter,
	LeftSeconds = erlang:trunc((DeadlineTime - myNow()) / 1000),
	FunMake1 =
		fun(#monster{monsterID = ID, countAll = CountAll, countKill = CountKill}, {ListID, ListALl, ListKill}) ->
			{[ID | ListID], [CountAll | ListALl], [CountKill | ListKill]}
		end,
	{ListID, ListALl, ListKill} = lists:foldl(FunMake1, {[], [], []}, ListMonstersCur),
	LeftCount =
		case ListWillCreateAll of
			[] ->
				0;
			[#monsterWait{listID = ListIDWait}|_] ->
				erlang:length(ListIDWait)
		end,
	Msg =
		#pk_GS2U_MoneyDungeonInfo{
			%% UInt32 结束时间(秒)
			leftSeconds = LeftSeconds,
			%% UInt16 最大关卡
			maxChapter = MaxChapter,
			%% UInt16 当前关卡（从1开始）
			curChapter = CurChapter,
			%% UInt16 当前关卡的怪物种类
			listMonsterID = ListID,
			%% Byte 对应listMonsterID的最大数量
			listMonsterCountMax = ListALl,
			%% Byte 对应listMonsterID的已杀掉的数量
			listMonsterCountKill = ListKill,
			%% Byte 当前关卡还有多少怪没刷出来
			curLeftCount = LeftCount
		},
	case (MsgCache#pk_GS2U_MoneyDungeonInfo.maxChapter =:= MaxChapter) andalso
		(MsgCache#pk_GS2U_MoneyDungeonInfo.curChapter =:= CurChapter) andalso
		(MsgCache#pk_GS2U_MoneyDungeonInfo.listMonsterID =:= ListID) andalso
		(MsgCache#pk_GS2U_MoneyDungeonInfo.listMonsterCountMax =:= ListALl) andalso
		(MsgCache#pk_GS2U_MoneyDungeonInfo.listMonsterCountKill =:= ListKill) of
		true ->
			skip;
		_ ->
			%% 内容有变化，发送
			sendNetMsgToMapPlayer(PlayerEts, Msg)
	end,
	MapInfo#recMapInfo{chapter = Chapter#chapter{msgCache = Msg}}.

%%----------------------------------------------------------------------------------------------
%% 向地图上的玩家发送进程消息
-spec sendMsgToMapPlayer(PlayerEts::etsTab(), MsgID::atom(), Msg::term()) -> ok.
sendMsgToMapPlayer(PlayerEts, MsgID, Msg) ->
	MatchSpec = ets:fun2ms(fun(Object) -> Object#recMapObject.pid end),
	MapPlayerNetPidList = myEts:selectEts(PlayerEts, MatchSpec),
	lists:foreach(fun(Pid) -> psMgr:sendMsg2PS(Pid, MsgID, Msg) end, MapPlayerNetPidList),
	ok.

%%----------------------------------------------------------------------------------------------
%% 向地图上的玩家发送网络消息
-spec sendNetMsgToMapPlayer(PlayerEts::etsTab(), Msg::term()) -> ok.
sendNetMsgToMapPlayer(PlayerEts, Msg) ->
	MatchSpec = ets:fun2ms(fun(Object) -> Object#recMapObject.netPid end),
	MapPlayerNetPidList = myEts:selectEts(PlayerEts, MatchSpec),
	lists:foreach(fun(NetPid) -> playerMsg:sendNetMsg(NetPid, Msg) end, MapPlayerNetPidList),
	ok.

%%----------------------------------------------------------------------------------------------
%% 根据状态匹配副本得分
-spec calcScore(State::type_cpt()) -> uint().
calcScore(?CHAPTER_TIMEOUT) -> 100;
calcScore(?CHAPTER_GIVEUP)  -> 0;
calcScore(?CHAPTER_FINISH)  -> 100.

%%----------------------------------------------------------------------------------------------
%% 刷怪记录列表的维护
-spec deleteMonsterByCode(Code::uint64(), List::[#monster{}, ...], Reason::type_dmr()) -> {true, [#monster{}, ...]} | false.
deleteMonsterByCode(Code, List, Reason) ->
	FunDelete1 =
		fun(E, {IsHit, R}) ->
			case E of
				Code ->
					{true, R};
				_ ->
					{IsHit, [E | R]}
			end
		end,
	FunDelete2 =
		fun(#monster{listCode = ListCode} = M, {IsHit, ListR}) ->
			case IsHit of
				false ->
					case lists:foldl(FunDelete1, {IsHit, []}, ListCode) of
						{true, ListCodeNew} ->
							MNew =
								case Reason of
									?DeleteMonsterReason_Kill ->
										M#monster{
											countKill = M#monster.countKill + 1,
											listCode  = ListCodeNew
										};
									?DeleteMonsterReason_Run ->
										M#monster{
											countRun = M#monster.countRun + 1,
											listCode  = ListCodeNew
										}
								end,
							{true, [MNew | ListR]};
						_ ->
							{IsHit, [M | ListR]}
					end;
				_ ->
					{IsHit, [M | ListR]}
			end
		end,
	case lists:foldl(FunDelete2, {false, []}, List) of
		{true, ListR} ->
			{true, lists:reverse(ListR)};
		_ ->
			false
	end.
-spec addMonsterByCode(ID::uint(), Code::uint64(), List::[#monster{}, ...]) -> ListNew::[#monster{}, ...].
addMonsterByCode(ID, Code, List) ->
	case lists:keyfind(ID, #monster.monsterID, List) of
		#monster{listCode = ListCode} = M ->
			lists:keystore(ID, #monster.monsterID, List, M#monster{listCode = [Code | ListCode]});
		_ ->
			?ERROR_OUT("addMonsterByCode ~p~n~p", [{ID, Code}, List]),
			List
	end.
-spec isNull(List::[#monster{}, ...]) -> boolean().
isNull(List) ->
	FunCheck =
		fun(#monster{listCode = ListCode}, {Mark, IsNull}) ->
			case ListCode of
				[] ->
					{Mark, IsNull};
				_ ->
					{true, false}
			end
		end,
	{_, IsNull} = misc:foldlEx(FunCheck, {false, true}, List),
	IsNull.

%%----------------------------------------------------------------------------------------------
%% 待刷怪列表的维护


%%----------------------------------------------------------------------------------------------
%% 处理所有地图的事件
-spec allMapRun() -> ok.
allMapRun() ->
	L1 = acMoneyDungeonState:getMapInfoList(),
	L2 = allMapRun1(L1, []),
	acMoneyDungeonState:setMapInfoList(L2),
	ok.
-spec allMapRun1(ListAccIn::[#recMapInfo{}, ...], ListAccOutOld::[#recMapInfo{}, ...]) -> ListAccOutNew::[#recMapInfo{}, ...].
allMapRun1([], Acc) ->
	Acc;
allMapRun1([MapInfo | L], Acc) ->
	NewAcc =
		case oneMapRun(MapInfo) of
			#recMapInfo{} = NewMapInfo ->
				[NewMapInfo | Acc];
			_ ->
				Acc
		end,
	allMapRun1(L, NewAcc).

%%----------------------------------------------------------------------------------------------
%% 处理单个地图的事件
-spec oneMapRun(MapInfo::#recMapInfo{}) -> MapInfoNew::#recMapInfo{} | term().
%% 检查是否需要从未开始状态转换为准备状态
oneMapRun(#recMapInfo{state = ?CHAPTER_0} = R) ->
	check(R);
%% 处理准备状态
oneMapRun(#recMapInfo{state = ?CHAPTER_PREPARE} = R) ->
	prepare(R);
%% 处理主游戏阶段
oneMapRun(#recMapInfo{state = ?CHAPTER_GOING} = R) ->
	working(R);
%% 超时前杀完了所有的怪
oneMapRun(#recMapInfo{state = ?CHAPTER_FINISH} = R) ->
	reward(R);
%% 超时
oneMapRun(#recMapInfo{state = ?CHAPTER_TIMEOUT} = R) ->
	reward(R);
%% 玩家主动放弃游戏
oneMapRun(#recMapInfo{state = ?CHAPTER_GIVEUP} = R) ->
	reward(R);
%% 结束游戏的等待时间
oneMapRun(#recMapInfo{state = ?CHAPTER_END} = R) ->
	waitDestroy(R);
%% 结束游戏后需要销毁地图
oneMapRun(#recMapInfo{state = ?CHAPTER_KICK, mapPID = MapPid}) ->
	?DEBUG_OUT("[DebugForMoneyDungeon] oneMapRun resetCopyMap", []),
	psMgr:sendMsg2PS(MapPid, resetCopyMap, {}),
	ok.

%%----------------------------------------------------------------------------------------------
%% 检查是否需要从未开始状态转换为准备状态
-spec check(MapInfo::#recMapInfo{}) -> MapInfoNew::#recMapInfo{} | false.
check(#recMapInfo{mapPID = MapPid, timeState = TimeState} = R) ->
	%% pid有效时表示地图已被正确创建，更改状态至准备
	case is_pid(MapPid) of
		true->
			?DEBUG_OUT("[DebugForMoneyDungeon] check next"),
			R#recMapInfo{state = ?CHAPTER_PREPARE, timeState = myNow()};
		_ ->
			%% 超时未被创建则被移除数据
			case myNow() - TimeState >= ?TimeDelay of
				true ->
					?DEBUG_OUT("[DebugForMoneyDungeon] check out time"),
					false;
				_ ->
					?DEBUG_OUT("[DebugForMoneyDungeon] check skip"),
					R
			end
	end.

%%----------------------------------------------------------------------------------------------
%% 处理准备状态
-spec prepare(MapInfo::#recMapInfo{}) -> MapInfoNew::#recMapInfo{}.
prepare(#recMapInfo{timeState = TimeState} = R) ->
	TimeNow = myNow(),
	case TimeNow > TimeState + ?TimeDelay of
		true ->
			%% 准备状态超时
			?DEBUG_OUT("[DebugForMoneyDungeon] prepare out time"),
			R#recMapInfo{state = ?CHAPTER_KICK, timeState = myNow()};
		_ ->
			R	%% 用户进入时更改状态
			%case ets:info(PlayerEts, size) of
			%	0 ->
			%		?DEBUG_OUT("[DebugForMoneyDungeon] prepare skip"),
			%		R;	%% 没超时，没人，略
			%	_ ->
			%		?DEBUG_OUT("[DebugForMoneyDungeon] prepare next"),
			%		R#recMapInfo{state = ?CHAPTER_GOING, timeState = myNow()}	%% 没超时，有人，开始
			%end
	end.

%%----------------------------------------------------------------------------------------------
%% 处理进行中状态（主状态）
-spec working(MapInfo::#recMapInfo{}) -> MapInfoNew::#recMapInfo{}.
working(R) ->
	MapInfoNew =
		case working_TimeOut(R) of
			{true, R_TimeOut} ->
				R_TimeOut;
			_ ->
				case working_Finish(R) of
					{true, R_Finitsh} ->
						R_Finitsh;
					_ ->
						working_Spwan(R)
				end
		end,
	syncInfo(MapInfoNew).


%%----------------------------------------------------------------------------------------------
%% 处理进行中状态（主状态） 判断是否超时以及超时状态的处理
working_TimeOut(#recMapInfo{deadlineTime  = DeadlineTime} = R) ->
	case myNow() > DeadlineTime of
		true ->
			{true, R#recMapInfo{state = ?CHAPTER_TIMEOUT, timeState = myNow()}};
		_ ->
			false
	end.

%%----------------------------------------------------------------------------------------------
%% 处理进行中状态（主状态） 判断是否完成以及完成状态的处理
working_Finish(#recMapInfo{chapter = Chapter, monsterEts = MonsterEts} = R) ->
	#chapter{
		listWillCreateAll = ListWillCreateAll
	} = Chapter,
	case ListWillCreateAll of
		[] -> %% 没有了待刷的怪
			case ets:info(MonsterEts, size) =:= 0 of
				true -> %% 没有了现存的怪
					{true, R#recMapInfo{state = ?CHAPTER_FINISH, timeState = myNow()}};
				_ ->
					false
			end;
		_ ->
			false
	end.

%%----------------------------------------------------------------------------------------------
%% 处理进行中状态（主状态） 尝试继续刷怪
working_Spwan(#recMapInfo{chapter = Chapter, mapID = MapID, mapPID = MapPid, monsterEts = MonsterEts} = R) ->
	#chapter{
		curChapter        = CurChapter,
		preMonsterTime    = PreMonsterTime,
		listWillCreateAll = ListWillCreateAll
	} = Chapter,
	TimeNow = myNow(),
	case ListWillCreateAll of
		[] -> %% 刷完了所有的怪，无怪可刷
			R;
		[#monsterWait{curChapter = CurChapterMW, listID = ListID} = MW | TMW]
			when CurChapter =:= CurChapterMW -> %% 当前波次有未刷的怪，尝试继续刷怪
			case TimeNow - PreMonsterTime >= configSpawnTime() of
				true ->
					?DEBUG_OUT("[DebugForMoneyDungeon] working_Spwan this"),
					[H | T] = ListID,
					{X, Y} = configStartPoint(),
					Arg =
						#recSpawnMonster{
							id      = H,
							mapID   = MapID,
							mapPid  = MapPid,
							x       = X,
							y       = Y
						},
					ExParam =
						#recSpawnAck{
							myChapter = CurChapter,
							monsterID = H
						},
					psMgr:sendMsg2PS(MapPid, spawnObject, {Arg, ?ActivityType_MoneyDungeon, ?MsgTypeSpawnAck, ExParam}),
					ListWillCreateAllNew =
						case T of
							[] ->
								TMW;
							_ ->
								[MW#monsterWait{listID = T} | TMW]
						end,
					R#recMapInfo{
						chapter = Chapter#chapter{
							preMonsterTime    = myNow(),
							listWillCreateAll = ListWillCreateAllNew,
							isTurnWaiting     = false
						}
					};
				_ ->
					R %% 波次内刷怪CD冷却中
			end;
		[#monsterWait{listCount = ListCount} | _] -> %% 当前波次没有未刷的怪，尝试刷下一波怪
			case TimeNow - PreMonsterTime >= configTurnTime() of
				true ->
					case ets:info(MonsterEts, size) =:= 0 of
						true -> %% 所有怪已经不存在了（被杀或者跑掉），准备刷下一波
							FunReadyMonster =
								fun({ID, Count}, List) ->
									[
										#monster{
											monsterID = ID,
											countAll = Count
										} |
										List
									]
								end,
							ListMonstersCurNew = lists:foldl(FunReadyMonster, [], ListCount),
							?DEBUG_OUT("[DebugForMoneyDungeon] working_Spwan next"),
							PreMonsterTimeNew =
								case CurChapter of
									0 ->
										myNow() + configWaitTime() - configSpawnTime(); %% 第一波刷怪
									_ ->
										myNow() + configTurnTime() - configSpawnTime()  %% 非第一波刷怪
								end,
							R#recMapInfo{
								chapter = Chapter#chapter{
									curChapter        = CurChapter + 1,
									listMonstersLast  = [],
									listMonstersCur   = ListMonstersCurNew,
									preMonsterTime    = PreMonsterTimeNew,
									isTurnWaiting     = true
								}
							};
						_ ->
							R %% 等待
					end;
				_ ->
					R %% 波次间刷怪CD冷却中
			end
	end.

%%----------------------------------------------------------------------------------------------
%% 各种原因结束的结算
-spec reward(MapInfo::#recMapInfo{}) -> MapInfoNew::#recMapInfo{}.
reward(#recMapInfo{
	chapter   = Chapter,
	mapID     = MapID,
	mapPID    = MapPid,
	state     = State,
	playerEts = PlayerEts
} = R) ->
	?DEBUG_OUT("[DebugForMoneyDungeon] reward because ~p", [State]),
	psMgr:sendMsg2PS(MapPid, clearAllObject, ?CodeTypeMonster),
	CurChapter =
		case State of
			?CHAPTER_FINISH ->
				Chapter#chapter.curChapter;
			_ ->
				Chapter#chapter.curChapter - 1
		end,
	sendMsgToMapPlayer(
		PlayerEts,
		moneyDungeon_End,
		{
			calcScore(State),
			MapID,
			Chapter#chapter.maxChapter,
			CurChapter,
			Chapter#chapter.listKill,
			?MapSubTypeMoneyDungeon
		}
	),
	RNew = syncInfo(R),
	RNew#recMapInfo{state = ?CHAPTER_END, finishTime = myNow(), timeState = myNow()}.

%%----------------------------------------------------------------------------------------------
%% 结算后一定时间后进入清场状态
-spec waitDestroy(MapInfo::#recMapInfo{}) -> MapInfoNew::#recMapInfo{}.
waitDestroy(#recMapInfo{finishTime = FT} = R)->
	case myNow() - FT >= configSettleTime() of
		true ->
			?DEBUG_OUT("[DebugForMoneyDungeon] waitDestroy destroy", []),
			R#recMapInfo{state = ?CHAPTER_KICK, timeState = myNow()};
		_ ->
			R
	end.

%%----------------------------------------------------------------------------------------------
%% 生成指定长度值相同的列表
-spec seqs(Length::uint(), Value::term()) -> list().
seqs(Length, Value) when erlang:is_integer(Length), Length > 0 ->
	seqs_(Length, Value, []).
seqs_(0, _, Acc) ->
	Acc;
seqs_(Length, Value, Acc) ->
	seqs_(Length - 1, Value, [Value | Acc]).

%%----------------------------------------------------------------------------------------------
%% 获取现存怪数量



%%% ====================================================================
%%% Internal functions configs
%%% ====================================================================

% 游戏时长由最大刷怪量决定，参考配置函数configListMonster/1
%%% 游戏时间（毫秒）
%configMainTime() ->
%  #globalsetupCfg{setpara = [Time]} =
%    getCfg:getCfgPStackWithDefaultValue(
%      cfg_globalsetup,
%      #globalsetupCfg{setpara = [Time]},
%      moneyDungeon_time_main
%    ),
%  Time*1000.  %% 配置中是秒

%% 第一波刷怪前等待时间（毫秒）
configWaitTime() ->
	#globalsetupCfg{setpara = [Time]} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = [5]},
			moneyDungeon_time_ready
		),
	Time*1000.  %% 配置中是秒

%% 结算等待时间（毫秒）
configSettleTime() ->
	#globalsetupCfg{setpara = [Time]} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = [5]},
			moneyDungeon_time_settle
		),
	Time*1000.  %% 配置中是秒

%% 刷怪间隔时间（毫秒）
configSpawnTime() ->
	#globalsetupCfg{setpara = [Time]} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = [1500]},
			moneyDungeon_time_spawn
		),
	Time. %% 配置中是毫秒

%% 波次间隔时间（毫秒）
configTurnTime() ->
	#globalsetupCfg{setpara = [Time]} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = [5]},
			moneyDungeon_time_turn
		),
	Time*1000.  %% 配置中是秒

%% 预计单个怪走完地图的时间（毫秒）
configMonsterTime() ->
	#globalsetupCfg{setpara = [Time]} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = [30]},
			moneyDungeon_time_monster
		),
	Time*1000.  %% 配置中是秒

%% 预计玩家杀死单个怪的时间（毫秒）
configKillTime() ->
	#globalsetupCfg{setpara = [Time]} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = [5]},
			moneyDungeon_time_kill
		),
	Time*1000.  %% 配置中是秒

%% 获得待刷新的怪物列表
configListMonster(RoleID) ->
	%% 1.获得当前角色等级
	Level =
		case core:queryBaseRoleByRoleID(RoleID) of
			#rec_base_role{level = Level_br} ->
				Level_br;
			_ ->
				case core:queryRoleKeyInfoByRoleID(RoleID) of
					#?RoleKeyRec{level = Level_rk} ->
						Level_rk;
					_ ->
						?ERROR_OUT("configListMonster can not find RoleID(~p) from core:queryRoleKeyInfoByRoleID/1", [RoleID]),
						0
				end
		end,
	%% 2.根据角色等级获得配置等级键值
	FunGetLevelKey =
		fun(Key, {Mark, Result}) ->
			case Level >= Key of
				true ->
					{Mark, Key};
				_ ->
					{true, Result}
			end
		end,
	{_, LevelKey} = misc:foldlEx(FunGetLevelKey, {false, 0}, getCfg:get1KeyList(cfg_goldDragon)),
	%% 3.根据等级键值获得并解析所有波次配置
	FunParseMonster =
		fun({ID, Min, Max}, {Result, CountMax}) ->
			Count = misc:rand(Min, Max),
			{[{ID, Count} | Result], CountMax + Count}
		end,
	FunCreateMonsterWait =
		fun({ID, Count}, {ListCount, ListID}) ->
			case lists:keyfind(ID, 1, ListCount) of
				false ->
					{[{ID, Count} | ListCount], seqs(Count, ID) ++ ListID};
				{_, CountOld} ->
					{lists:keystore(ID, 1, ListCount, {ID, Count + CountOld}), seqs(Count, ID) ++ ListID}
			end
		end,
	FunGetAndParseCfg =
		fun(TurnKey, {Result, CountMax, CountTurn}) ->
			%% 3.1 获取对应波次配置
			#goldDragonCfg{monster = ListMonster} =
				getCfg:getCfgByKey(cfg_goldDragon, LevelKey, TurnKey),
			%% 3.2 根据配置随机化怪物数量并计数
			{Monsters, Count} = lists:foldl(FunParseMonster, {[], 0}, ListMonster),
			%% 3.3 创建结构#monsterWait用于记录随机化的待刷怪
			{ListCount, ListID} = lists:foldl(FunCreateMonsterWait, {[], []}, Monsters),
			MonsterWait =
				#monsterWait{
					curChapter  = CountTurn + 1,
					listCount   = ListCount,
					listID      = misc:shuffle(ListID)
				},
			{[MonsterWait | Result], CountMax + Count, CountTurn + 1}
		end,
	{ListMonsterWaitR, CountMax, CountTurn} = lists:foldl(FunGetAndParseCfg, {[], 0, 0}, getCfg:get2KeyList(cfg_goldDragon, LevelKey)),
	%% 4.计算游戏时长（毫秒）
	%% 基础时间 + 最大刷怪数量 * 刷怪间隔 + 刷怪波次 * 波次间隔 + 最大刷怪数量 * 玩家单个怪的战斗时间
	TimeMax = configMonsterTime() + CountMax * configSpawnTime() + CountTurn * configTurnTime() + CountMax * configKillTime(),
	%% 返回值{[[{MonsterID ::uint(), MonsterCount::uint()}, ...], ...], TimeMax::uint()}
	?DEBUG_OUT("[DebugForMoneyDungeon] ~p~n~p", [TimeMax, ListMonsterWaitR]),
	{lists:reverse(ListMonsterWaitR), TimeMax}.

%% 怪物出生点
configStartPoint() ->
	#globalsetupCfg{setpara = [{X, Y}]} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = [{0, 0}]},
			moneyDungeon_StartPoint
		),
	{float(X), float(Y)}. %% 配置可能是整数，需要转换为浮点数

%% 角色出生点（忽略gamemapcfg中的配置）
configStartPointPlayer() ->
	#globalsetupCfg{setpara = [{X, Y}]} =
		getCfg:getCfgPStackWithDefaultValue(
			cfg_globalsetup,
			#globalsetupCfg{setpara = [{40, 108}]},
			moneyDungeon_StartPointPlayer
		),
	{float(X), float(Y)}. %% 配置可能是整数，需要转换为浮点数
