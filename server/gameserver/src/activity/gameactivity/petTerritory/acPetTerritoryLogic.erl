%%%-------------------------------------------------------------------
%%% @author meitianyang
%%% @copyright (C) 2016, raink
%%% @doc
%%%
%%% @end
%%% Created : 20170303
%%%-------------------------------------------------------------------
-module(acPetTerritoryLogic).
-author("meitianyang").

-include("acPetTerritoryPrivate.hrl").

-export([
	settleLord/1,
	reward/1,
	search/1,
	plunder/1,
	exploit_add/1,
	exploit_test/1,
	dailyReset/0,

	createActivityMapAck/1,
	activityMapMsg/2,
	tick/0
]).

-export([
	checkTerritory_Settle/1,
	checkTerritory_Protect/2,
	settleLogic/3,
	checkAndNoticeOnlineLordOne/1
]).

%%% ====================================================================
%%% API functions
%%% ====================================================================

%%% --------------------------------------------------------------------
%% 领主请求结算领地
-spec settleLord({Pid::pid(), RoleID::uint64()}) -> ok.
settleLord({Pid, RoleID}) ->
	%?DEBUG_OUT("[DebugForPetTerritory] settleLord RoleID:~p", [RoleID]),
	ListTerritory = acPetTerritoryState:queryPlayer(RoleID),
	settleLogic(ListTerritory, [], []),
	psMgr:sendMsg2PS(Pid, petTerritory_settleAck, 0),
	ok.

%%% --------------------------------------------------------------------
%% 领主请求结算领地
-spec reward({Pid::pid(), RoleID::uint64()}) -> ok.
reward({Pid, RoleID}) ->
	%?DEBUG_OUT("[DebugForPetTerritory] reward RoleID:~p", [RoleID]),
	ListTerritory = acPetTerritoryState:queryPlayer(RoleID),
	FunFilter =
		fun(#rec_player_territory{timeFresh = TimeFresh, timeEnd = TimeEnd} = Rec, R) ->
			case TimeFresh >= TimeEnd of
				true ->
					[Rec | R];
				_ ->
					R
			end
		end,
	case lists:foldl(FunFilter, [], ListTerritory) of
		[] ->
			skip;
		Msg ->
			FunDelete =
				fun(Territory, ListR) ->
					ListP = acPetTerritoryState:deletePetByTerritory(Territory),	%% 清除领地骑宠信息
					T = {acPetTerritoryState:deletePlayer(Territory), Territory},	%% 清除领地信息
					[T | ListP ++ ListR]
				end,
			DBMsg = lists:foldl(FunDelete, [], Msg),
			gsSendMsg:sendMsg2DBWithDBOPT(petTerritory_dbsave, 0, DBMsg),
			psMgr:sendMsg2PS(Pid, petTerritory_rewardAck, Msg)
	end,
	ok.

%%% --------------------------------------------------------------------
%% 搜索领地
-spec search({Pid::pid(), {RoleID::uint64(), TargetRoleID::uint64()}}) -> ok.

%% 非针对性搜索
search({Pid, {RoleID, 0}}) ->
	%?DEBUG_OUT("[DebugForPetTerritory] search RoleID:~p", [RoleID]),
	%% 1.获取搜索者等级段
	ListCfgReward = search_checkReward(RoleID),
	%?DEBUG_OUT("[DebugForPetTerritory] search RoleID:~p ListCfgReward:~p", [RoleID, ListCfgReward]),
	%% 2.根据搜索者等级段随机选取匹配的领地
	TerritoryNew =
		case search_rand(RoleID, ListCfgReward, undefined) of
			undefined ->
				%% 最终没有找到领地
				case core:queryOnLineRoleByRoleID(RoleID) of
					#rec_OnlinePlayer{netPid = NetPid} ->
						playerMsg:sendNetMsg(NetPid, #pk_GS2U_FindTerritoryFailed_Ack{errorCode = ?ErrorCode_PetTerritory_Search_None});
					_ ->
						skip
				end,
				undefined;
			#rec_player_territory{} = Territory ->
				%% 找到了领地，记录搜索标记
				search_mark(RoleID, Territory)
		end,
	psMgr:sendMsg2PS(Pid, petTerritory_searchAck, {TerritoryNew, false}),
	ok;

%% 针对性搜索，用于反掠夺
search({_, {RoleID, RoleID}}) ->
	%% 不能针对自己进行搜索，忽略
	ok;
search({Pid, {RoleID, TargetRoleID}}) ->
	%?DEBUG_OUT("[DebugForPetTerritory] search RoleID:~p TargetRoleID:~p", [RoleID, TargetRoleID]),
	%% 1.筛选可掠夺的领地
	FunFilter =
		fun(Territory, R) ->
			case checkTerritory_Protect(RoleID, Territory) of
				?TerritoryProtectState_None ->
					[Territory | R];
				_ ->
					R
			end
		end,
	ListTerritoryFilter = lists:foldl(FunFilter, [], acPetTerritoryState:queryPlayer(TargetRoleID)),
	%% 2.排序
	FunSort =
		fun (
			#rec_player_territory{
				cfgTime = CfgTime_A,
				cfgLevel = CfgLevel_A,
				cfgForce = CfgForce_A,
				territoryID = TerritoryID_A
			},
			#rec_player_territory{
				cfgTime = CfgTime_B,
				cfgLevel = CfgLevel_B,
				cfgForce = CfgForce_B,
				territoryID = TerritoryID_B
			}
		) ->
			CfgSort_A = CfgTime_A * CfgLevel_A * CfgForce_A,
			CfgSort_B = CfgTime_B * CfgLevel_B * CfgForce_B,
			if
				CfgSort_A =:= CfgSort_B ->
					if
						TerritoryID_A =:= TerritoryID_B ->
							false;
						true ->
							TerritoryID_A < TerritoryID_B
					end;
				true ->
					CfgSort_A >= CfgSort_B
			end
		end,
	case lists:sort(FunSort, ListTerritoryFilter) of
		[] ->
			case core:queryOnLineRoleByRoleID(RoleID) of
				#rec_OnlinePlayer{netPid = NetPid} ->
					playerMsg:sendNetMsg(NetPid, #pk_GS2U_FindTerritoryFailed_Ack{errorCode = ?ErrorCode_PetTerritory_AntiSearch_None});
				_ ->
					skip
			end;
		[Territory | _] ->
			%% 找到了领地，记录搜索标记
			TerritoryNew = search_mark(RoleID, Territory),
			psMgr:sendMsg2PS(Pid, petTerritory_searchAck, {TerritoryNew, true})
	end,
	ok.

%%% --------------------------------------------------------------------
%% 掠夺
-spec plunder({Pid::pid(), {RoleID::uint64(), TargetRoleID::uint64(), TerritoryID::uint64(), ListPet::[#rec_player_territory_pet{}, ...]}}) -> ok.
plunder({_, {RoleID, RoleID, _, _}}) ->
	?ERROR_OUT("plunder invalid RoleID:~p", [RoleID]),	%% 不能掠夺自己
	ok;
plunder({Pid, {RoleID, TargetRoleID, TerritoryID, ListPet}}) when erlang:length(ListPet) > 0 ->
	%?DEBUG_OUT("[DebugForPetTerritory] plunder RoleID:~p TargetRoleID:~p TerritoryID:~p ListPet:~p", [RoleID, TargetRoleID, TerritoryID, ListPet]),
	%% 1.检查领地状态
	case plunder_check(RoleID, {TargetRoleID, TerritoryID}) of
		false ->
			?ERROR_CODE_Ex(RoleID, ?ErrorCode_PetTerritory_Plunder_Invalid);
		_ ->
			%% 2.检测战斗地图状态
			case acPetTerritoryState:queryBattleMap(RoleID) of
				#recBattleMap{state = ?BattleMapState_Creating} ->
					skip;		%% 地图创建中，忽略该请求
				#recBattleMap{state = ?BattleMapState_Settle} ->
					skip;		%% 结算中，忽略该请求
				#recBattleMap{mapPid = MapPid} ->
					psMgr:sendMsg2PS(Pid, petTerritory_plunderAck, MapPid);	%% 地图已存在，通知角色进入地图
				_ ->
					%% 地图不存在，需要创建地图
					%?DEBUG_OUT("[DebugForPetTerritory] plunder RoleID:~p", [RoleID]),
					TimeNow = time:getSyncTimeFromDBS(),
					#globalsetupCfg{setpara = [BattleCD]} =
						getCfg:getCfgPStack(cfg_globalsetup, petTerritory_battleCD),
					#globalsetupCfg{setpara = [TimeSettle]} =
						getCfg:getCfgPStack(cfg_globalsetup, petTerritory_timeSettle),
					#globalsetupCfg{setpara = [TimeReady]} =
						getCfg:getCfgPStack(cfg_globalsetup, petTerritory_timeReady),
					Map =
						#recBattleMap{
							roleID			= RoleID,
							targetRoleID	= TargetRoleID,
							territoryID		= TerritoryID,
							timeToFight		= TimeNow + TimeReady,
							timeToSettle	= TimeNow + BattleCD - TimeSettle,
							timeToEnd		= TimeNow + BattleCD,
							listPet			= ListPet
						},
					acPetTerritoryState:replaceBattleMap(Map),
					core:sendMsgToMapMgr(?PetTerritoryMapID, createActivityMap, {?PetTerritoryMapID, 1, RoleID})
			end
	end,
	ok.

%%% --------------------------------------------------------------------
%% 每日重置
-spec dailyReset() -> ok.
dailyReset() ->
	?LOG_OUT("dailyReset"),
	%% 1.清除当前时间点之前的记录
	TimeNow = time:getSyncTimeFromDBS(),
	#globalsetupCfg{setpara = [CleanCD_History]} =
		getCfg:getCfgPStack(cfg_globalsetup, petTerritory_cleanCD_history),
	TimeLine1 = TimeNow - CleanCD_History,
	acPetTerritoryState:deleteHistory(TimeLine1),
	%% 2.清除结束时间之后N秒的领地及其骑宠信息（数据清理）
	%% 2.1.找到超时的领地
	#globalsetupCfg{setpara = [CleanCD_Data]} =
		getCfg:getCfgPStack(cfg_globalsetup, petTerritory_cleanCD_data),
	TimeLine2 = TimeNow - CleanCD_Data,
	FunFilter =
		fun(#rec_player_territory{timeEnd = TimeEnd} = Rec, R) ->
			case TimeEnd < TimeLine2 of
				true ->
					[Rec | R];
				_ ->
					R
			end
		end,
	FunEts =
		fun(#recTerritoryData{value = List}, R) ->
			lists:foldl(FunFilter, R, List)
		end,
	ListNeedDeleteTerritory = ets:foldl(FunEts, [], ?EtsTerritoryPlayerData),
	%% 2.2.找到从属于超时领地的骑宠
	FunFindPet =
		fun(#rec_player_territory{roleID = RoleID, territoryID = TerritoryID}, R) ->
			acPetTerritoryState:queryPetByTerritoryID(RoleID, TerritoryID) ++ R
		end,
	ListNeedDeletePet = lists:foldl(FunFindPet, [], ListNeedDeleteTerritory),
	%% 2.3.从ETS删除
	DBMsgTerritory = [{acPetTerritoryState:deletePlayer(Territory), Territory} || Territory <- ListNeedDeleteTerritory],
	DBMsgPet = [{acPetTerritoryState:deletePet(Pet), Pet} || Pet <- ListNeedDeletePet],
	%% 3.通知数据库删除
	gsSendMsg:sendMsg2DBWithDBOPT(petTerritory_dbsave, 0, [{?DBOPT_DELETE, TimeLine1} | DBMsgTerritory ++ DBMsgPet]),
	ok.

%%% --------------------------------------------------------------------
%% 仅GM
%% 所有正在开采的领地奖励+1，便于搜索调试
-spec exploit_add(RoleID::uint64()) -> ok.
exploit_add(RoleID) ->
	?ERROR_OUT("exploit_add just for gm code territory_exploit_add! RoleID:~w", [RoleID]),
	TimeNow = time:getSyncTimeFromDBS(),
	FunFilter =
		fun(#rec_player_territory{timeEnd = TimeEnd, rewardCount1 = RC1, rewardCount2 = RC2} = Rec, R) ->
			case TimeEnd > TimeNow of
				true ->
					[Rec#rec_player_territory{rewardCount1 = RC1 + 1, rewardCount2 = RC2 + 1} | R];
				_ ->
					R
			end
		end,
	FunEts =
		fun(#recTerritoryData{value = List}, R) ->
			lists:foldl(FunFilter, R, List)
		end,
	ListR = ets:foldl(FunEts, [], ?EtsTerritoryPlayerData),
	DBMsg = [{acPetTerritoryState:replacePlayer(Territory), Territory} || Territory <- ListR],
	gsSendMsg:sendMsg2DBWithDBOPT(petTerritory_dbsave, 0, DBMsg),
	ok.

%%% --------------------------------------------------------------------
%% 仅GM
%% 仅对于自身正在开采的领地1，调整下次结算时间为5分钟后执行，以便客户端调试
-spec exploit_test({RoleID::uint64(), GMCode::uint()}) -> ok.
exploit_test({RoleID, 0}) ->
	?ERROR_OUT("exploit_test just for gm code territory_exploit_test! 0 RoleID:~w", [RoleID]),
	TimeNow = time:getSyncTimeFromDBS(),
	case acPetTerritoryState:queryPlayer(RoleID, 1) of
		#rec_player_territory{timeFresh = TimeFresh, timeEnd = TimeEnd} = Rec
			when TimeEnd > TimeFresh, TimeEnd > TimeNow ->
			TimeFreshNew = TimeNow - 55 * 60,		%% 设置为55分钟前结算过，那么5分钟后会再次结算
			TimeEndNew = TimeFreshNew + 2 * 3600,	%% 设置为新的刷新时间后两小时，保证再次结算时不是最终结算
			RecNew =
				Rec#rec_player_territory{
					timeFresh = TimeFreshNew,
					timeEnd = TimeEndNew
				},
			DBOPT = acPetTerritoryState:replacePlayer(RecNew),
			gsSendMsg:sendMsg2DBWithDBOPT(petTerritory_dbsave, 0, [{DBOPT, RecNew}]);
		_ ->
			skip
	end,
	ok;
exploit_test({RoleID, _}) ->
	?ERROR_OUT("exploit_test just for gm code territory_exploit_test! _ RoleID:~w", [RoleID]),
	TimeNow = time:getSyncTimeFromDBS(),
	case acPetTerritoryState:queryPlayer(RoleID, 1) of
		#rec_player_territory{timeFresh = TimeFresh, timeEnd = TimeEnd} = Rec
			when TimeEnd > TimeFresh, TimeEnd > TimeNow ->
			RecNew =
				Rec#rec_player_territory{
					timeFresh = TimeFresh - 48 * 3600,
					timeEnd = TimeEnd - 48 * 3600
				},
			DBOPT = acPetTerritoryState:replacePlayer(RecNew),
			gsSendMsg:sendMsg2DBWithDBOPT(petTerritory_dbsave, 0, [{DBOPT, RecNew}]);
		_ ->
			skip
	end,
	ok.

%%----------------------------------------------------------------------------------------------
%% 创建地图成功（比?ACMapMsg_CreateMap更先收到）
-spec createActivityMapAck({MapID::uint(), ListMapPid::list(), RoleID::uint64()}) -> ok.
createActivityMapAck({_MapID, [MapPid], RoleID} = _Data) ->
	%?DEBUG_OUT("[DebugForPetTerritory] createActivityMapAck RoleID:~p MapPid:~p", [RoleID, MapPid]),
	case acPetTerritoryState:queryBattleMap(RoleID) of
		#recBattleMap{state = ?BattleMapState_Creating} = MapInfoOld ->
			acPetTerritoryState:replaceBattleMap(MapInfoOld#recBattleMap{mapPid = MapPid});	%% 关联RoleID与MapPid
		_E ->
			?ERROR_OUT("createActivityMapAck RoleID:~p ~n~p", [RoleID, _E]),
			psMgr:sendMsg2PS(MapPid, resetCopyMap, {})	%% 错误的创建，强制关闭
	end,
	ok.

%%----------------------------------------------------------------------------------------------
%% 活动地图的消息
-spec activityMapMsg(MsgType::uint(), Data::term()) -> ok.
%% 创建后的初始化消息
activityMapMsg(?ACMapMsg_CreateMap, {_CreatorRoleID, _MapID, MapPid, _PlayerEts, MonsterEts, _CollectEts, _NpcEts} = _Data) ->
	%?DEBUG_OUT("[DebugForPetTerritory] activityMapMsg ?ACMapMsg_CreateMap ~p", [_Data]),
	RoleID = acPetTerritoryState:battleMap_MapPid2RoleID(MapPid),
	case acPetTerritoryState:queryBattleMap(RoleID) of
		#recBattleMap{state = ?BattleMapState_Creating} = MapInfoOld ->
			?DEBUG_OUT("[DebugForPetTerritory] RoleID:~p State{~p to ~p}", [RoleID, ?BattleMapState_Creating, ?BattleMapState_Wait]),
			%% 这里是创建地图后的重新刷新计时，防止创建地图时间延迟导致与展示效果严重不符的问题
			%% 顺便绑定了MonsterEts并更新了状态
			TimeNow = time:getSyncTimeFromDBS(),
			#globalsetupCfg{setpara = [BattleCD]} =
				getCfg:getCfgPStack(cfg_globalsetup, petTerritory_battleCD),
			#globalsetupCfg{setpara = [TimeSettle]} =
				getCfg:getCfgPStack(cfg_globalsetup, petTerritory_timeSettle),
			Map =
				MapInfoOld#recBattleMap{
					timeToSettle	= TimeNow + BattleCD - TimeSettle,
					timeToEnd		= TimeNow + BattleCD,
					state			= ?BattleMapState_Wait,
					monsterEts		= MonsterEts
				},
			acPetTerritoryState:replaceBattleMap(Map),
			%% 通知创建者进入
			case core:queryOnLineRoleByRoleID(RoleID) of
				#rec_OnlinePlayer{pid = Pid} ->
					psMgr:sendMsg2PS(Pid, petTerritory_plunderAck, MapPid);
				_ ->
					skip
			end;
		_E ->
			?ERROR_OUT("activityMapMsg ?ACMapMsg_CreateMap ~p", [_E]),
			psMgr:sendMsg2PS(MapPid, resetCopyMap, {})	%% 错误的创建，强制关闭
	end,
	ok;
%% 销毁地图
activityMapMsg(?ACMapMsg_DestoryMap, MapPid) ->
	%?DEBUG_OUT("[DebugForPetTerritory] activityMapMsg ?ACMapMsg_DestoryMap ~p", [MapPid]),
	acPetTerritoryState:deleteBattleMap(MapPid),
	ok;
%% 击杀怪物
activityMapMsg(?ACMapMsg_KillMonster, {_MapID, MapPid, _AttackRoleID, _MonsterCode, _MonsterID} = _Data) ->
	%?DEBUG_OUT("[DebugForPetTerritory] activityMapMsg ?ACMapMsg_KillMonster ~p", [_Data]),
	RoleID = acPetTerritoryState:battleMap_MapPid2RoleID(MapPid),
	case acPetTerritoryState:queryBattleMap(RoleID) of
		#recBattleMap{state = ?BattleMapState_Fighting} = Map ->
			checkIfWin(Map);
		_ ->
			skip
	end,
	ok;
%% 角色进入
activityMapMsg(?ACMapMsg_PlayerEnter,  {_RoleID, MapPid, _} = _Data) ->
	%?DEBUG_OUT("[DebugForPetTerritory] activityMapMsg ?ACMapMsg_PlayerEnter ~p", [_Data]),
	RoleID = acPetTerritoryState:battleMap_MapPid2RoleID(MapPid),	%% 进入的人可能是GM而不是创建者，不能使用函数传参
	case acPetTerritoryState:queryBattleMap(RoleID) of
		#recBattleMap{state = ?BattleMapState_Wait} = MapInfoOld ->
			?DEBUG_OUT("[DebugForPetTerritory] RoleID:~p State{~p to ~p}", [RoleID, ?BattleMapState_Wait, ?BattleMapState_Ready]),
			TimeNow = time:getSyncTimeFromDBS(),
			#globalsetupCfg{setpara = [TimeReady]} =
				getCfg:getCfgPStack(cfg_globalsetup, petTerritory_timeReady),
			MapInfoNew = MapInfoOld#recBattleMap{
				timeToFight = TimeNow + TimeReady,
				state = ?BattleMapState_Ready
			},
			acPetTerritoryState:replaceBattleMap(MapInfoNew),	%% 第一角色进入，进入战斗前准备阶段
			spawnMonster(MapInfoNew);							%% 刷怪
		#recBattleMap{} ->
			skip;		%% 其它状态忽略
		_E ->
			?ERROR_OUT("activityMapMsg ?ACMapMsg_PlayerEnter ~p", [_E]),
			psMgr:sendMsg2PS(MapPid, resetCopyMap, {})	%% 错误的创建，强制关闭
	end,
	ok;
%% 玩家离开
activityMapMsg(?ACMapMsg_PlayerLeave, {RoleID, MapPid, #recMapObject{}} = _Data) ->
	%?DEBUG_OUT("[DebugForPetTerritory] activityMapMsg ?ACMapMsg_PlayerLeave ~p", [_Data]),
	case acPetTerritoryState:battleMap_MapPid2RoleID(MapPid) of	%% 退出的人可能是GM而不是创建者，不能使用函数传参
		RoleID ->
			case acPetTerritoryState:queryBattleMap(RoleID) of
				#recBattleMap{state = State} = Map when State =:= ?BattleMapState_Ready; State =:= ?BattleMapState_Fighting ->
					%% 逃跑，侵略者失败
					%?DEBUG_OUT("[DebugForPetTerritory] activityMapMsg ?ACMapMsg_PlayerLeave fail"),
					settleMap(Map, false);
				_ ->
					skip	%% 忽略非准备非战斗状态
			end;
		_ ->
			skip	%% 忽略非创造者
	end,
	ok;
%% 忽略其它消息
activityMapMsg(_, _) ->
	ok.

%%% --------------------------------------------------------------------
%% 心跳
tick() ->
	erlang:send_after(?TimeTick, self(), ?MsgTypeTimerTick),
%%	ListMap = ets:foldl(fun(Rec, R) -> [Rec | R] end, [], ?EtsBattleMap),
	ListMap = ets:tab2list(?EtsBattleMap),
	tick1(ListMap, time:getSyncTimeFromDBS()),
	%% 20170323需求变更
	%% 服务端需要通知客户端是否存在开采结束的领地
	checkAndNoticeOnlineLordAll(),
	ok.

%%% ====================================================================
%%% Internal functions
%%% ====================================================================

%%% --------------------------------------------------------------------
%% 查看领地结算状态
-spec checkTerritory_Settle(Territory::#rec_player_territory{}) -> type_TSS().
checkTerritory_Settle(#rec_player_territory{timeEnd = 0}) ->
	%% 不允许对无效领地调用
	?ERROR_OUT("checkTerritory_Settle invalid territory~n~p", [misc:getStackTrace()]),
	?TerritorySettleState_None;
checkTerritory_Settle(#rec_player_territory{
	timeFresh = TimeFresh,
	timeEnd = TimeEnd
}) when TimeFresh >= TimeEnd ->
	?TerritorySettleState_None;	%% 已经结算过了，不需要结算
checkTerritory_Settle(#rec_player_territory{
	timeFresh = TimeFresh,
	timeEnd = TimeEnd
}) ->
	TimeNow =
		case time:getSyncTimeFromDBS() of
			TimeNow_ when TimeNow_ > TimeEnd ->
				TimeEnd;
			TimeNow_ ->
				TimeNow_
		end,
	case TimeNow >= TimeEnd of
		true ->
			?TerritorySettleState_Finally;	%% 超过了领地生命周期，需要最终结算
		_ ->
			case TimeNow - TimeFresh >= 3600 of
				true ->
					?TerritorySettleState_Temp;	%% 超过了1小时，需要中途结算
				_ ->
					?TerritorySettleState_None	%% 时间不足，不需要结算
			end
	end.

%%% --------------------------------------------------------------------
%% 查看领地保护状态
-spec checkTerritory_Protect(RoleID::uint64(), Territory::#rec_player_territory{}) -> type_TPS().
checkTerritory_Protect(RoleID, #rec_player_territory{timeEnd = 0}) ->
	%% 不允许对无效领地调用
	?ERROR_OUT("checkTerritory_Protect invalid territory RoleID:~p~n~p", [RoleID, misc:getStackTrace()]),
	?TerritoryProtectState_None;
checkTerritory_Protect(_, #rec_player_territory{timeFresh = TimeFresh, timeEnd = TimeEnd}) when TimeFresh >= TimeEnd ->
	?TerritoryProtectState_TooLate;	%% 事实上，这个领地已经不存在了，等待领主来领奖
checkTerritory_Protect(RoleID, #rec_player_territory{
	roleID = TargetRoleID,
	territoryID = TerritoryID,
	timeFresh = TimeFresh,
	timeEnd = TimeEnd,
	timeSafe = TimeSafe,
	timeSearch = TimeSearch,
	rewardCount1 = RewardCount1,
	rewardCount2 = RewardCount2
}) ->
	TimeNow = time:getSyncTimeFromDBS(),
	case TimeNow < TimeSafe of
		true ->
			?TerritoryProtectState_Safe;	%% 被打惨了或者使用了保护药，正处于保护期
		_ ->
			#globalsetupCfg{setpara = [BattleCD]} =
				getCfg:getCfgPStack(cfg_globalsetup, petTerritory_battleCD),
			case TimeNow < TimeSearch - BattleCD of
				true ->
					?TerritoryProtectState_Search;	%% 领地已被搜寻，处于专属搜寻者的状态
				_ ->
					case TimeNow < TimeSearch of
						true ->
							?TerritoryProtectState_Battle;	%% 领地已被搜寻，但是过了专属搜寻者的状态，处于战斗缓存区间
						_ ->
							case acPetTerritoryState:querySearchHistory(RoleID, {TargetRoleID, TerritoryID}) of
								true ->
									#globalsetupCfg{setpara = [SearchCD]} =
										getCfg:getCfgPStack(cfg_globalsetup, petTerritory_searchCD),
									case TimeNow + SearchCD + BattleCD >= TimeEnd of
										true ->
											?TerritoryProtectState_TooLate;	%% 剩余时间已不足一次掠夺，强制跳过
										_ ->
											case {RewardCount1, RewardCount2} of
												{0, 0} ->
													case TimeNow - TimeFresh < 3600 of
														true ->
															?TerritoryProtectState_Empty;	%% 没有资源可以被掠夺
														_ ->
															?TerritoryProtectState_None		%% 领地开放中，可以被搜寻（需要结算后才有资源）
													end;
												_ ->
													?TerritoryProtectState_None		%% 领地开放中，可以被搜寻
											end
									end;
								_ ->
									?TerritoryProtectState_CD	%% 短时间内已搜索到该领地，强制跳过
							end
					end
			end
	end.

%%% --------------------------------------------------------------------
%% 逻辑计算结算领地
-spec settleLogic(
	ListTerritory::[#rec_player_territory{}, ...],
	Acc::[#rec_player_territory{}, ...],
	DBMsg::[{type_dbopt(), #rec_player_territory{}}, ...]
) ->
	{
		[#rec_player_territory{}, ...],
		[{type_dbopt(), #rec_player_territory{}}, ...]
	}.
settleLogic([], Acc, DBMsg) ->
	gsSendMsg:sendMsg2DBWithDBOPT(petTerritory_dbsave, 0, DBMsg),
	Acc;
settleLogic([H | T], Acc, DBMsg) ->
	%?DEBUG_OUT("[DebugForPetTerritory] settleLogic H:~p", [H]),
	case checkTerritory_Settle(H) of
		?TerritorySettleState_None ->
			settleLogic(T, [H | Acc], DBMsg);
		_ ->
			HNew = settleLogic(H),
			DBOTP = acPetTerritoryState:replacePlayer(HNew),
			%?DEBUG_OUT("[DebugForPetTerritory] settleLogic DBOTP:~p HNew:~p", [DBOTP, HNew]),
			settleLogic(T, [HNew | Acc], [{DBOTP, HNew} | DBMsg])
	end.

%%% --------------------------------------------------------------------
%% 逻辑计算结算领地（计算奖励）
-spec settleLogic(Territory::#rec_player_territory{}) -> TerritoryNew::#rec_player_territory{}.
settleLogic(#rec_player_territory{
	cfgReward = CfgReward,
	cfgTime = CfgTime,
	cfgLevel = CfgLevel,
	cfgForce = CfgForce,
	timeFresh = TimeFresh,
	timeEnd = TimeEnd,
	rewardCount1 = RewardCount1,
	rewardCount2 = RewardCount2
} = Rec) ->
	TimeNow =
		case time:getSyncTimeFromDBS() of
			TimeNow_ when TimeNow_ > TimeEnd ->
				TimeEnd;
			TimeNow_ ->
				TimeNow_
		end,
	Count = (TimeNow - TimeFresh) div 3600,						%% 经过checkTerritory_Settle的检查，该值至少为1
	TimeFreshNew = TimeNow - ((TimeNow - TimeFresh) rem 3600),	%% 记录消耗的时间
	%% 根据配置计算新增的奖励
	#pet_territory_rewardCfg{reward = [{_, Count1}, {_, Count2}]} =
		getCfg:getCfgPStack(cfg_pet_territory_reward, CfgReward),
	#pet_territory_timeCfg{rate = Rate} =
		getCfg:getCfgPStack(cfg_pet_territory_time, CfgTime, CfgLevel),
	#pet_territory_forceCfg{rate = RateForce} =
		getCfg:getCfgPStack(cfg_pet_territory_force, CfgForce),
	RateAll = Rate * RateForce,
	FunReward =
		fun(_, {CountAcc1, CountAcc2}) ->
			{
				misc:ceil(Count1 * RateAll) + CountAcc1,
				misc:ceil(Count2 * RateAll) + CountAcc2
			}
		end,
	{CountNew1, CountNew2} = lists:foldl(FunReward, {RewardCount1, RewardCount2}, lists:seq(1, Count)),
	Rec#rec_player_territory{
		timeFresh = TimeFreshNew,
		rewardCount1 = CountNew1,
		rewardCount2 = CountNew2
	}.

%%% --------------------------------------------------------------------
%% 搜索领地_根据自身等级对应等级段决定搜索顺序
-spec search_checkReward(RoleID::uint64()) -> [CfgLevel::uint32(), ...].
search_checkReward(RoleID) ->
	#rec_base_role{level = RoleLevel} = core:queryBaseRoleByRoleID(RoleID),	%% 请求者必然在线，不可能没有这个数据，强制匹配
	List1KeyReward = getCfg:get1KeyList(cfg_pet_territory_reward),
	FunCheckReward =
		fun(Key, {_, Count}) ->
			case Key > RoleLevel of
				true ->
					{true, Count + 1};
				_ ->
					{false, Count + 1}
			end
		end,
	{_, Count} = misc:foldlEx(FunCheckReward, {false, 0}, List1KeyReward),
	%% 顺序为：优先匹配相同等级段，否则增加一个等级、减少一个等级、增加两个等级、减少两个等级……按递归优化为如下：
	{List1, List2} = lists:split(Count, List1KeyReward),
	search_checkReward(lists:reverse(List1), List2, [], true).

-spec search_checkReward(List1::[uint32(), ...], List2::[uint32(), ...], Acc::[uint32(), ...], LeftOrRight::boolean()) -> Result::[uint32(), ...].
search_checkReward([], [], Acc, _) ->
	lists:reverse(Acc);
search_checkReward([H1|T1], [], Acc, _) ->
	search_checkReward(T1, [], [H1|Acc], true);
search_checkReward([], [H2|T2], Acc, _) ->
	search_checkReward([], T2, [H2|Acc], true);
search_checkReward([H1|T1], List2, Acc, true) ->
	search_checkReward(T1, List2, [H1|Acc], false);
search_checkReward(List1, [H2|T2], Acc, false) ->
	search_checkReward(List1, T2, [H2|Acc], true).

%%% --------------------------------------------------------------------
%% 搜索领地_随机选取符合标准的领地
-spec search_rand(RoleID::uint64(), [CfgReward::uint32(), ...], Acc::#rec_player_territory{} | undefined) -> Result::#rec_player_territory{} | undefined.
search_rand(_, [], Acc) ->
	Acc;
search_rand(RoleID, [H|T], undefined) ->
	search_rand(RoleID, T, search_rand(RoleID, H));
search_rand(_, _, Acc) ->
	Acc.

-spec search_rand(RoleID::uint64(), CfgReward::uint32()) -> Result::#rec_player_territory{} | undefined.
search_rand(RoleID, CfgReward) ->
	%?DEBUG_OUT("[DebugForPetTerritory] search_rand RoleID:~p CfgReward:~p", [RoleID, CfgReward]),
	FunFilter =
		fun(#rec_player_territory{
			cfgReward = CfgReward_
			} = Rec, R) ->
			case CfgReward_ of
				CfgReward ->
					case checkTerritory_Protect(RoleID, Rec) of
						?TerritoryProtectState_None ->
							%?DEBUG_OUT("[DebugForPetTerritory] search_rand"),
							[Rec | R];
						_TPS ->
							%?DEBUG_OUT("[DebugForPetTerritory] search_rand _TPS:~p", [_TPS]),
							R	%% 因为这样那样的原因，目标领地不能被搜索到
					end;
				_CfgReward ->
					%?DEBUG_OUT("[DebugForPetTerritory] search_rand _CfgReward:~p", [_CfgReward]),
					R	%% 不能搜索到不符合配置的领地
			end
		end,
	FunEts =
		fun(#recTerritoryData{roleID = RoleID_, value = List}, R) ->
			case RoleID_ of
				RoleID ->
					R;	%% 不能搜索到自己的领地
				_ ->
					lists:foldl(FunFilter, R, List)
			end
		end,
	case ets:foldl(FunEts, [], ?EtsTerritoryPlayerData) of
		[] ->
			%?DEBUG_OUT("[DebugForPetTerritory] search_rand RoleID:~p CfgReward:~p undefined", [RoleID, CfgReward]),
			undefined;
		ListTerritory ->
			%?DEBUG_OUT("[DebugForPetTerritory] search_rand RoleID:~p CfgReward:~p ListTerritory:~p", [RoleID, CfgReward, ListTerritory]),
			[H|_] = misc:shuffle(ListTerritory),
			H
	end.

%%% --------------------------------------------------------------------
%% 搜索领地_找到领地后做下标记
-spec search_mark(RoleID::uint64(), Territory::#rec_player_territory{}) -> TerritoryNew::#rec_player_territory{}.
search_mark(RoleID, Territory) ->
	%% 领地可能需要结算
	[TerritoryNew0] = settleLogic([Territory], [], []),
	%% 记录搜索归属与搜索记录
	#rec_player_territory{
		roleID = TargetRoleID,
		territoryID = TerritoryID
	} = TerritoryNew0,
	acPetTerritoryState:replaceSearch(RoleID, {TargetRoleID, TerritoryID}),
	%% 刷新搜索时间
	#globalsetupCfg{setpara = [SearchCD]} =
		getCfg:getCfgPStack(cfg_globalsetup, petTerritory_searchCD),
	#globalsetupCfg{setpara = [BattleCD]} =
		getCfg:getCfgPStack(cfg_globalsetup, petTerritory_battleCD),
	TerritoryNew1 =
		TerritoryNew0#rec_player_territory{
			timeSearch = time:getSyncTimeFromDBS() + SearchCD + BattleCD
		},
	acPetTerritoryState:replacePlayer(TerritoryNew1),	%% 仅刷新timeFresh不需要写入DB
	TerritoryNew1.

%%% --------------------------------------------------------------------
%% 掠夺_检查领地是否有效
-spec plunder_check(RoleID::uint64(), {TargetRoleID::uint64(), TerritoryID::uint32()}) -> boolean().
plunder_check(RoleID, {TargetRoleID, TerritoryID} = Key) ->
	case acPetTerritoryState:queryPlayer(TargetRoleID, TerritoryID) of
		#rec_player_territory{} = Territory ->
			case checkTerritory_Protect(RoleID, Territory) of
				TPS when TPS =:= ?TerritoryProtectState_Search orelse TPS =:= ?TerritoryProtectState_CD ->
					case acPetTerritoryState:querySearchOwner(Key) of
						RoleID ->
							true;
						_ ->
							%?DEBUG_OUT("[DebugForPetTerritory] plunder_check"),
							%% 领地的搜索归属权不属于掠夺者
							false
					end;
				_TPS ->
					%?DEBUG_OUT("[DebugForPetTerritory] plunder_check _TPS:~p", [_TPS]),
					%% 领地不处于搜索专属状态，不可掠夺
					false
			end;
		_ ->
			%?DEBUG_OUT("[DebugForPetTerritory] plunder_check"),
			false
	end.

%%% --------------------------------------------------------------------
%% 心跳_遍历
-spec tick1(ListMap::[#recBattleMap{}, ...], Time::uint32()) -> ok.
tick1([], _) ->
	ok;
tick1([H|T], TimeNow) ->
	HNew = tick2(H, TimeNow),
	tick3_sync(tick3(HNew, TimeNow)),
	tick1(T, TimeNow).

%%% --------------------------------------------------------------------
%% 心跳_单个执行逻辑
-spec tick2(Map::#recBattleMap{}, Time::uint32()) -> MapNew::#recBattleMap{} | undefined.

%% 时间耗尽，销毁地图
tick2(#recBattleMap{mapPid = MapPid, timeToEnd = TimeToEnd}, TimeNow)
	when TimeNow >= TimeToEnd ->
	%?DEBUG_OUT("[DebugForPetTerritory] tick2 time out"),
	acPetTerritoryState:deleteBattleMap(MapPid),
	psMgr:sendMsg2PS(MapPid, resetCopyMap, {}),
	undefined;

%% 战斗状态中时间超过结算，需要结算
tick2(#recBattleMap{state = ?BattleMapState_Fighting, timeToSettle = TimeToSettle} = Map, TimeNow)
	when TimeNow >= TimeToSettle ->
	%?DEBUG_OUT("[DebugForPetTerritory] tick2 ?BattleMapState_Fighting will settle"),
	settleMap(Map, false);	%% 超时嘛，输了撒

%% 战斗中检测是否非超时战斗结束
tick2(#recBattleMap{state = ?BattleMapState_Fighting} = Map, _) ->
	checkIfWin(Map);

%% 结算等待
tick2(#recBattleMap{mapPid = MapPid, state = ?BattleMapState_Settle, timeRealSettle = TimeRealSettle} = Map, TimeNow) ->
	%?DEBUG_OUT("[DebugForPetTerritory] tick2 ?BattleMapState_Settle TimeRealSettle:~p TimeNow:~p", [TimeRealSettle, TimeNow]),
	#globalsetupCfg{setpara = [TimeSettle]} =
		getCfg:getCfgPStack(cfg_globalsetup, petTerritory_timeSettle),
	case TimeNow >= TimeRealSettle + TimeSettle of
		true ->
			%?DEBUG_OUT("[DebugForPetTerritory] tick2 ?BattleMapState_Settle will del"),
			acPetTerritoryState:deleteBattleMap(MapPid),
			psMgr:sendMsg2PS(MapPid, resetCopyMap, {}),
			undefined;
		_ ->
			Map
	end;

%% 战斗前准备阶段
tick2(#recBattleMap{roleID = _RoleID, state = ?BattleMapState_Ready, timeToFight = TimeToFight} = Map, TimeNow)
	when TimeNow >= TimeToFight ->
	%?DEBUG_OUT("[DebugForPetTerritory] tick2 ?BattleMapState_Ready will fight"),
	?DEBUG_OUT("[DebugForPetTerritory] _RoleID:~p State{~p to ~p}", [_RoleID, ?BattleMapState_Ready, ?BattleMapState_Fighting]),
	MapNew = Map#recBattleMap{state = ?BattleMapState_Fighting},
	acPetTerritoryState:replaceBattleMap(MapNew),	%% 进入战斗阶段
	MapNew;

%% 忽略其它状态
tick2(#recBattleMap{state = _State} = Map, _) ->
	%?DEBUG_OUT("[DebugForPetTerritory] tick2 Others _State:~p", [_State]),
	Map.

%%% --------------------------------------------------------------------
%% 心跳_向客户端同步心跳
-spec tick3(Map::#recBattleMap{}, Time::uint32()) -> {State::type_BMS(), Time1::uint32(), Time2::uint32(), Time3::uint32(), RoleID::uint64()} | undefined.
tick3(#recBattleMap{state = ?BattleMapState_Ready, timeToFight = Time2, timeToEnd = Time3, roleID = RoleID}, Time1) ->
	{?BattleMapState_Ready, Time1, Time2, Time3, RoleID};
tick3(#recBattleMap{state = ?BattleMapState_Fighting, timeToSettle = Time2, timeToEnd = Time3, roleID = RoleID}, Time1) ->
	{?BattleMapState_Fighting, Time1, Time2, Time3, RoleID};
tick3(#recBattleMap{state = ?BattleMapState_Settle, timeToEnd = Time2And3, roleID = RoleID, timeRealSettle = 0}, Time1) ->
	{?BattleMapState_Settle, Time1, Time2And3, Time2And3, RoleID};
tick3(#recBattleMap{state = ?BattleMapState_Settle, timeToEnd = Time2And3, roleID = RoleID, timeRealSettle = TimeRealSettle}, Time1) ->
	#globalsetupCfg{setpara = [TimeSettle]} =
		getCfg:getCfgPStack(cfg_globalsetup, petTerritory_timeSettle),
	TimeRealEnd = erlang:min(TimeRealSettle + TimeSettle, Time2And3),
	{?BattleMapState_Settle, Time1, TimeRealEnd, TimeRealEnd, RoleID};
tick3(_, _) ->
	undefined.
tick3_sync(undefined) ->
	ok;
tick3_sync({State, Time1, Time2, Time3, RoleID} = _Sync) ->
	%?DEBUG_OUT("[DebugForPetTerritory] tick3_sync ~p", [_Sync]),
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{netPid = NetPid} ->
			Msg =
				#pk_GS2U_TerritoryBattle_Tick_Sync{
					time = Time2 - Time1,
					timeAll = Time3 - Time1,
					state = State
				},
			playerMsg:sendNetMsg(NetPid, Msg);
		_ ->
			skip
	end,
	ok.

%%% --------------------------------------------------------------------
%% 刷怪
-spec spawnMonster(Map::#recBattleMap{}) -> ok.
spawnMonster(#recBattleMap{
	mapPid = MapPid,
	targetRoleID = TargetRoleID,
	territoryID = TerritoryID,
	listPet = ListPet
}) ->
	#globalsetupCfg{setpara = PosPetsP} =
		getCfg:getCfgPStack(cfg_globalsetup, petTerritory_posPetsP),
	#globalsetupCfg{setpara = PosPetsD} =
		getCfg:getCfgPStack(cfg_globalsetup, petTerritory_posPetsD),
	FunSpawn =
		fun(#rec_player_territory_pet{petID = PetID} = Pet, {Count, Msg, ListPos, RotW, Camp}) ->
			#petCfg{monsterID = MonsterID} = getCfg:getCfgPStack(cfg_pet, PetID),
			{X, Y} = lists:nth(Count, ListPos),
			Arg =
				#recSpawnMonster{
					id      = MonsterID,
					mapID   = ?PetTerritoryMapID,
					mapPid  = MapPid,
					x       = erlang:float(X),
					y       = erlang:float(Y),
					rotW	= RotW,
					camp	= Camp
				},
			{Count + 1, [{Arg, Pet} | Msg], ListPos, RotW, Camp}
		end,
	{_, Msg0, _, _, _} = lists:foldl(FunSpawn, {1, [], PosPetsP, 0.0, ?CampMonsterFriendly}, ListPet),
	{_, Msg1, _, _, _} = lists:foldl(FunSpawn, {1, Msg0, PosPetsD, 180.0, ?CampMonsterEnemies}, acPetTerritoryState:queryPetByTerritoryID(TargetRoleID, TerritoryID)),
	psMgr:sendMsg2PS(MapPid, spawnPetAsMonster, Msg1),
	ok.

%%% --------------------------------------------------------------------
%% 结算
-spec settleMap(Map::#recBattleMap{}, IsWin::boolean()) -> Map::#recBattleMap{}.
settleMap(#recBattleMap{
	roleID = RoleID,
	%mapPid = MapPid,
	targetRoleID = TargetRoleID,
	territoryID = TerritoryID,
	state = _State
} = MapInfo, IsWin) ->
	%?DEBUG_OUT("[DebugForPetTerritory] settleMap IsWin:~p", [IsWin]),
	%% 1.清理怪物
	%% 余淇星说结束时不清怪
	%%psMgr:sendMsg2PS(MapPid, clearAllObject, ?CodeTypeMonster),
	%% 2.仅获胜时发放奖励（玩家可能不在线）
	TimeNow = time:getSyncTimeFromDBS(),
	Territory0 = acPetTerritoryState:queryPlayer(TargetRoleID, TerritoryID),
	#rec_player_territory{cfgReward = CfgReward} = Territory0,
	{Count1ForNetMsg, Count2ForNetMsg} =
		case IsWin of
			true ->
				%% 先对领地本身的奖励积累进行一个可能的结算
				[
					#rec_player_territory{
						rewardCount1 = RewardCount1,
						rewardCount2 = RewardCount2
					} = Territory1
				] = settleLogic([Territory0], [], []),
				%% 计算掠夺记录
				#globalsetupCfg{setpara = [Rate]} =
					getCfg:getCfgPStack(cfg_globalsetup, petTerritory_plunderRate),
				#globalsetupCfg{setpara = [CD]} =
					getCfg:getCfgPStack(cfg_globalsetup, petTerritory_plunderCD),
				RewardCount1P = misc:ceil(RewardCount1 * Rate),
				RewardCount2P = misc:ceil(RewardCount2 * Rate),
				%%?DEBUG_OUT("[DebugForPetTerritory] settleMap RewardCount1P:~p RewardCount1:~p Rate:~p", [RewardCount1P, RewardCount1, Rate]),
				%%?DEBUG_OUT("[DebugForPetTerritory] settleMap RewardCount2P:~p RewardCount2:~p Rate:~p", [RewardCount2P, RewardCount2, Rate]),
				Territory2 =
					Territory1#rec_player_territory{
						rewardCount1 = RewardCount1 - RewardCount1P,
						rewardCount2 = RewardCount2 - RewardCount2P,
						timeSafe = TimeNow + CD
					},
				%% 生成攻防记录
				%% 20170323余淇星口头需求变更，掠夺只记录防守失败和掠夺成功的数据
				HistoryA =
					#rec_player_territory_history_a{
						roleID = RoleID,
						timeEvent = TimeNow,
						targetRoleID = TargetRoleID,
						territoryID = TerritoryID,
						cfgReward = CfgReward,
						count1 = RewardCount1P,
						count2 = RewardCount2P
					},
				HistoryD =
					#rec_player_territory_history_d{
						roleID = TargetRoleID,
						timeEvent = TimeNow,
						targetRoleID = RoleID,
						territoryID = TerritoryID,
						cfgReward = CfgReward,
						count1 = RewardCount1P,
						count2 = RewardCount2P
					},
				%% 写入内存与数据库
				DBMsg = [
					{acPetTerritoryState:replacePlayer(Territory2), Territory2},
					{acPetTerritoryState:replaceHistoryA(HistoryA), HistoryA},
					{acPetTerritoryState:replaceHistoryD(HistoryD), HistoryD}
				],
				gsSendMsg:sendMsg2DBWithDBOPT(petTerritory_dbsave, 0, DBMsg),
				%% 发放奖励，由于玩家可能不在线，使用邮件发放奖励
				Title = stringCfg:getString(petTerritory_plunder_title),
				Content = stringCfg:getString(petTerritory_plunder_content),
				#pet_territory_rewardCfg{reward = [{ItemID1, _}, {ItemID2, _}]} =
					getCfg:getCfgPStack(cfg_pet_territory_reward, CfgReward),
				case RewardCount1P > 0 of
					true ->
						Attachment1 = playerMail:createMailGoods(ItemID1, RewardCount1P, true, 0, RoleID, ?ItemSourcePetTerritoryPlunder),  %% 虽然是playerMail，但是可以被其它GS进程调用
						mail:sendSystemMail(RoleID, Title, Content, Attachment1, []);
					_ ->
						skip
				end,
				case RewardCount2P > 0 of
					true ->
						Attachment2 = playerMail:createMailGoods(ItemID2, RewardCount2P, true, 0, RoleID, ?ItemSourcePetTerritoryPlunder),  %% 虽然是playerMail，但是可以被其它GS进程调用
						mail:sendSystemMail(RoleID, Title, Content, Attachment2, []);
					_ ->
						skip
				end,
				{RewardCount1P, RewardCount2P};
			_ ->
				{0, 0}
		end,
	%% 3.取消搜索归属权，领地依然处于搜索保护，但不可被原搜索归属权拥有者再次掠夺
	acPetTerritoryState:deleteSearchByPlunder({TargetRoleID, TerritoryID}),
	%% 4.如果玩家在线则发送反馈
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{netPid = NetPid} ->
			NetMsg =
				#pk_GS2U_TerritoryPlunder_Ack{
					cfgReward = CfgReward,
					count1 = Count1ForNetMsg,
					count2 = Count2ForNetMsg
				},
			playerMsg:sendNetMsg(NetPid, NetMsg);
		_ ->
			skip
	end,
	%% 5.更新地图数据
	?DEBUG_OUT("[DebugForPetTerritory] RoleID:~p State{~p to ~p}", [RoleID, _State, ?BattleMapState_Settle]),
	MapInfoNew = MapInfo#recBattleMap{state = ?BattleMapState_Settle, timeRealSettle = TimeNow},
	acPetTerritoryState:replaceBattleMap(MapInfoNew),
	MapInfoNew.

%%% --------------------------------------------------------------------
%% 如果领主在线且存在开采完毕的领地，则通知领主（遍历所有领主）
-spec checkAndNoticeOnlineLordAll() -> ok.
checkAndNoticeOnlineLordAll() ->
	case acPetTerritoryState:countForCheck() of
		true ->
			ets:foldl(
				fun(V, _) ->
					checkAndNoticeOnlineLordOne(V)
				end,
				0,
				?EtsTerritoryPlayerData
			);
		_ ->
			skip
	end,
	ok.

%%% --------------------------------------------------------------------
%% 如果领主在线且存在开采完毕的领地，则通知领主（检测指定领主）
-spec checkAndNoticeOnlineLordOne(PlayerData::#recTerritoryData{}) -> ok | skip.
checkAndNoticeOnlineLordOne(#recTerritoryData{roleID = RoleID, value = List}) ->
	TimeNow = time:getSyncTimeFromDBS(),
	FunCheck =
		fun(#rec_player_territory{timeEnd = TimeEnd}) ->
			TimeNow >= TimeEnd
		end,
	case core:queryOnLineRoleByRoleID(RoleID) of
		#rec_OnlinePlayer{netPid = NetPid} ->
			case lists:any(FunCheck, List) of
				true ->
					playerMsg:sendNetMsg(NetPid, #pk_GS2U_TerritoryExploitEnd_Sync{}); %% 领主在线且有开采完毕的领地
				_ ->
					skip	%% 领主在线但没有开采完毕的领地
			end;
		_ ->
			skip	%% 领主不在线
	end.

-spec checkIfWin(#recBattleMap{}) -> #recBattleMap{}.
checkIfWin(#recBattleMap{state = ?BattleMapState_Fighting, monsterEts = MonsterEts} = Map) ->
	FunCheck =
		fun(#recMapObject{camp = Camp}, {CountA, CountB}) ->
			case Camp of
				?CampMonsterFriendly ->
					{CountA + 1, CountB};
				?CampMonsterEnemies ->
					{CountA, CountB + 1};
				_C ->
					?ERROR_OUT("invalid camp _C:~p", [_C]),
					{CountA, CountB}
			end
		end,
	case ets:foldl(FunCheck, {0, 0}, MonsterEts) of
		{_, 0} ->
			%% 侵略者胜利
			settleMap(Map, true);
		{0, _} ->
			%% 侵略者失败
			settleMap(Map, false);
		_ ->
			%% 战斗未结束
			Map
	end.
