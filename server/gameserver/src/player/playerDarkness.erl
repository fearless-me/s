%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 玩家黑暗之地
%%% @end
%%% Created : 27. 八月 2015 16:06
%%%-------------------------------------------------------------------
-module(playerDarkness).
-author("tiancheng").

-include("playerPrivate.hrl").

%% 点击请求加入黑暗之地的CD
-define(RequestEnterDarknessCD, 6).

%% Msg
-export([
	requestDarknessInfo/0,
	requestEntrance/0,
	requestEnterDarkness/1,
	selfDarkness/0,
	openSelectCamp/0,
	selectCamp/1,
	darknessRank/0
]).

%% API
-export([
	playerEnterMap/1,
	playerEnterMapReal/0,
	playerLeaveMap/1,
	requestEnterDarknessMap/1,
	requestEnterDarknessPrepareMap/1,
	playerDead/2,
	addDarknessPebble/1,
	updatePlayerPebble/0,
	syncClientToMe/2,
	syncMeToClient/1,
	getMeToClient/0,
	canUseDarknessItem/1,
	getRevivePos/1,
	deleteRole/1,
	addDarknessPointToTeam/2
]).

selfDarkness() ->
	core:sendMsgToActivity(?ActivityType_Darkness, darkness_selfDarkness,
		{playerState:getRoleID(), playerState:getNetPid()}),
	ok.

openSelectCamp() ->
	core:sendMsgToActivity(?ActivityType_Darkness, darkness_openSelectCamp,
		{playerState:getRoleID(), playerState:getNetPid()}),
	ok.

selectCamp(Camp) ->
	#globalsetupCfg{setpara = [NeedLevel]} = getCfg:getCfgPStack(cfg_globalsetup, dark_level),
	case playerState:getLevel() >= NeedLevel of
		true ->
			core:sendMsgToActivity(?ActivityType_Darkness, darkness_selectCamp,
				{playerState:getRoleID(), playerState:getNetPid(), Camp}),
			ok;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_Darkness_PlayerLevel_Low, [NeedLevel])
	end,
	ok.

darknessRank() ->
	core:sendMsgToActivity(?ActivityType_Darkness, darkness_darknessRank,
		{playerState:getRoleID(), playerState:getNetPid()}),
	ok.

deleteRole(RoleID) ->
	core:sendMsgToActivity(?ActivityType_Darkness, playerdeleteRole, RoleID),
	ok.

addDarknessPointToTeam(PidFromAC, StandPoint) ->
	SelfRoleID = playerState:getRoleID(),
	PlayerEts = playerState:getMapPlayerEts(),
	TeamRoleIDList = teamInterface:getTeamMemberRoleIDListInSameMapWithRoleID(
		SelfRoleID,
		PlayerEts,
		false
	),
%%		case playerTeam2:getTeamInfo() of
%%			#rec_team{members = MembersList}  when erlang:is_list(MembersList) ->
%%				FunPid =
%%					fun(#recTeamMemberInfo{roleID = RoleID}, RoleIDList)->
%%						case SelfRoleID /= RoleID of
%%							true->
%%								%% 判断是否在我所在的ETS中
%%								MatchSpec = ets:fun2ms(fun(PlayerObj) when PlayerObj#recMapObject.id  =:= RoleID -> PlayerObj end),
%%								case myEts:selectEts(PlayerEts, MatchSpec) of
%%									[#recMapObject{}|_] ->
%%										[RoleID | RoleIDList];
%%									_ ->
%%										RoleIDList
%%								end;
%%							_->
%%								RoleIDList
%%						end
%%					end,
%%				lists:foldl(FunPid, [], MembersList);
%%			_ ->
%%				[]
%%		end,
	case TeamRoleIDList of
		[] ->
			skip;
		_ ->
			psMgr:sendMsg2PS(PidFromAC, addDarknessPointToTeamAck, {StandPoint, TeamRoleIDList})
	end,
	ok.

%% 能否使用黑暗之地传送道具
-spec canUseDarknessItem(Floor::uint()) -> true | uint().
canUseDarknessItem(Floor) ->
	MapID = playerState:getMapID(),
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = MapType, subtype = SubType} ->
			case MapType of
				?MapTypeActivity ->
					case SubType of
						?MapSubTypeDarkness ->
							#activityCfg{mapidlist = MapIDList} = getCfg:getCfgPStack(cfg_activity, ?ActivityType_Darkness),
							Len = erlang:length(MapIDList),
							Pos = misc:getListPos(MapID, MapIDList),
							if
								Floor < 0 orelse Floor > Len -> ?ErrorCode_System_Error_Unknow;
								Pos =:= 0 -> ?ErrorCode_Darkness_Not_UseItem;
								Pos =:= Floor ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_Darkness_Already_In_Floor, [Floor]),
									?ErrorCode_Darkness_Already_In_Floor;
								true ->
									callDarknessOtp(Pos, Floor)
							end;
						?MapSubTypeDarknessReady ->
							case Floor > 0 of
								true ->
									callDarknessOtp(0, Floor);
								_ ->
									playerMsg:sendErrorCodeMsg(?ErrorCode_Darkness_Already_In_Floor, [0]),
									?ErrorCode_Darkness_Already_In_Floor
							end;
						_ ->
							?ErrorCode_Darkness_Not_UseItem
					end;
				_ ->
					?ErrorCode_Darkness_Not_UseItem
			end;
		_ ->
			?ErrorCode_Darkness_Not_UseItem
	end.

callDarknessOtp(_NowFloor, 0) ->
	true;
callDarknessOtp(NowFloor, TargetFloor) when NowFloor =:= TargetFloor ->
	?ErrorCode_System_Error_Unknow;
callDarknessOtp(NowFloor, TargetFloor) ->
	PID = activityMgrLogic:getActivityChildProcessName(?ActivityType_Darkness),
	RoleID = playerState:getRoleID(),
	MapPID = playerState:getMapPid(),
	NetPID = playerState:getNetPid(),
	Msg = {RoleID, self(), NetPID, MapPID, NowFloor, TargetFloor},
	case psMgr:call(PID, useDarknessItemTransfer, Msg, 1000) of
		true ->
			true;
		{false, Floor} ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_Darkness_Transform_Failed_BOSS, [Floor]),
			?ErrorCode_Darkness_Transform_Failed_BOSS;
		ErrorCode ->
			ErrorCode
	end.

addDarknessPebble({_RoleID, _OldValue, 0, _DeadRoleID}) ->
	ok;
addDarknessPebble({RoleID, OldValue, Value, DeadRoleID}) ->
	RID = playerState:getRoleID(),
	case RID =:= RoleID of
		true ->
			case getRealAddValueAndAdd(Value) of
				0 ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_Darkness_AddPebble_AddMax);
				AddValue ->
					Coin = playerState:getCoin(?CoinTypePebble),
					case Coin =:= OldValue of
						true ->
							skip;
						false ->
							?ERROR_OUT("changeDarknessPebble:roleID=~p,pebble=~p,real=~p,add=~p", [RoleID, OldValue, Coin, AddValue])
					end,

					if
						AddValue > 0 ->
							case uidMgr:checkUID(?UID_TYPE_Role, DeadRoleID) of
								true ->
									Msg = #pk_GS2U_DarknessKillOrBeKill{
										targetName = playerNameUID:getPlayerNameByUID(DeadRoleID),
										isSuccess = true,
										changePebble = AddValue
									},
									playerMsg:sendNetMsg(Msg);
								_ ->
									skip
							end,

							%% 增加计数
							NowDaily = playerDaily:getDailyCounter(?DailyType_Everyday, ?PlayerEveryDay_Pebble),
							playerDaily:incCounter(?DailyType_Everyday, ?PlayerEveryDay_Pebble, NowDaily + AddValue),

							%% 增加
							playerMoney:addCoin(?CoinTypePebble, AddValue,
								#recPLogTSMoney{
									reason = ?CoinSourceDarkness,
									param = DeadRoleID,
									target = ?PLogTS_PlayerSelf,
									source = ?PLogTS_Darkness});
						true ->
							skip
					end
			end;
		_ ->
			?ERROR_OUT("changeDarknessPebble msg error:roleID=~p,realRoleID=~p,~p,~p,deadroleID",
				[RoleID, RID, OldValue, Value, DeadRoleID])
	end,
	ok.

%% 更新魔能水晶
-spec updatePlayerPebble() -> ok.
updatePlayerPebble() ->
	case isInDarkness() of
		true ->
			core:sendMsgToActivity(
				?ActivityType_Darkness,
				updatePlayerPebble,
				{playerState:getRoleID(), playerState:getCoin(?CoinTypePebble)}),

			%% 同步
			syncMeToRound();
		_ ->
			skip
	end,
	ok.

getRevivePos(MapID) ->
	#activityCfg{mapidlist = MapIDList} = getCfg:getCfgPStack(cfg_activity, ?ActivityType_Darkness),
	Pos = misc:getListPos(MapID, MapIDList),
	case Pos > 0 of
		true ->
			case getCfg:getCfgPStack(cfg_darkness, Pos) of
				#darknessCfg{relive = ReviveList} ->
					Len = erlang:length(ReviveList),
					Rand = misc:rand(1, Len),
					lists:nth(Rand, ReviveList);
				_ ->
					false
			end;
		_ ->
			false
	end.

%% 玩家死亡
-spec playerDead(AttackerCode::uint(), AttackRoleID::uint64()) -> {boolean(), [#pk_MoneyInit{}]}.
playerDead(_AttackerCode, 0) ->
%% 	?ERROR_OUT("playerDead but not find attack,attackcode=~p,selfroleid=~p", [AttackerCode, playerState:getRoleID()]),
	{false, []};
playerDead(_AttackerCode, AttackRoleID) ->
	case isInDarknessBattle() of
		true ->
			%% 先扣钱
			DecMoney =
				case uidMgr:checkUID(?UID_TYPE_Role, AttackRoleID) of
					true ->
						%% 死于玩家
						#globalsetupCfg{setpara = [Min, Max]} = getCfg:getCfgPStack(cfg_globalsetup, dark_player),
						DropNumPer = misc:rand(Min, Max),
						beKill_Player(AttackRoleID, DropNumPer);
					false ->
						%% 死于怪物
						#globalsetupCfg{setpara = [DropNumPer]} = getCfg:getCfgPStack(cfg_globalsetup, dark_monster),
						beKill_Monster(AttackRoleID, DropNumPer)
				end,

			{true, [#pk_MoneyInit{moneyType = ?CoinTypePebble, value = DecMoney}]};
		_ ->
			{false, []}
	end.

beKill_Player(AttackRoleID, DropPer) ->
	Dec = decPebble(AttackRoleID, DropPer),
	case Dec > 0 of
		true ->
			%% 告诉活动进程，谁把我杀了，我掉了多少钱
			core:sendMsgToActivity(?ActivityType_Darkness, playerDeadInDarkness, {playerState:getRoleID(), AttackRoleID, Dec, 0, 1});
		_ ->
			%% 如果=<0，则也不需要告诉对方减了
			skip
	end,
	Dec.

beKill_Monster(AttackRoleID, DropPer) ->
	decPebble(AttackRoleID, DropPer).

%% 玩家离开地图
-spec playerLeaveMap(MapID::uint()) -> ok.
playerLeaveMap(MapID) ->
	case isInDarkness(MapID) of
		true ->
			core:sendMsgToActivity(
				?ActivityType_Darkness,
				playerleaveDarkness,
				{playerState:getRoleID(), playerState:getNetPid(), playerState:getMapID(), playerState:getMapPid()});
		_ ->
			skip
	end,
	ok.

%% 玩家进入地图
-spec playerEnterMap(MapID::uint()) -> ok.
playerEnterMap(MapID) ->
	case isInDarkness(MapID) of
		true ->
			core:sendMsgToActivity(
				?ActivityType_Darkness,
				playerEnterDarkness,
				{playerState:getRoleID(), playerState:getNetPid(), playerState:getMapID(), playerState:getMapPid(), playerState:getCoin(?CoinTypePebble)}),
			ok;
		_ ->
			%% 玩家进入非黑暗之地地图，把该值改为0
			playerPropSync:setInt(?PubProp_DarknessCamp, 0),
			skip
	end,
	ok.

%% 玩家在客户端表现进入地图
-spec playerEnterMapReal() -> ok.
playerEnterMapReal() ->
	case isInDarkness() of
		true ->
%%			case isInDarknessBattle() of
%%				true ->
%%					%% 切换为个人杀戮
%%					playerPk:tranState(?PlayerMutiKillStatus);
%%				_ ->
%%					skip
%%			end,

			syncMeToRound(),

			%% 发消息同步周围的给我
			core:sendMsgToActivity(
				?ActivityType_Darkness,
				playerEnterDarknessReal,
				{playerState:getPlayerCode(), playerState:getRoleID(), playerState:getNetPid(), playerState:getMapPid(), playerState:getMapPlayerEts()}),
			ok;
		_ ->
			skip
	end,
	ok.

%% 同步我的水晶信息给指定玩家
-spec syncMeToClient(TargetNetPid::pid()) -> ok.
syncMeToClient(TargetNetPid) ->
	case isInDarkness() of
		true ->
			PlayerCode = playerState:getPlayerCode(),
			Money = #pk_MoneyChanges{
				code = PlayerCode,
				moneys = [#pk_MoneyInit{moneyType = ?CoinTypePebble, value = playerState:getCoin(?CoinTypePebble)}]
			},
			playerMsg:sendNetMsg(TargetNetPid, #pk_GS2U_MoneyChanges{changes = [Money]}),
			ok;
		_ ->
			skip
	end,
	ok.

%% 获取我的黑暗币
-spec getMeToClient() -> #pk_GS2U_MoneyChanges{} | {}.
getMeToClient() ->
	case isInDarkness() of
		true ->
			PlayerCode = playerState:getPlayerCode(),
			Money = #pk_MoneyChanges{
				code = PlayerCode,
				moneys = [#pk_MoneyInit{moneyType = ?CoinTypePebble, value = playerState:getCoin(?CoinTypePebble)}]
			},
			#pk_GS2U_MoneyChanges{changes = [Money]};
		_ ->
			{}
	end.

%% 同步对方的水晶信息给我
-spec syncClientToMe(TargetRoleID::uint64(), TargetCode::uint()) -> ok.
syncClientToMe(TargetRoleID, TargetCode) ->
	case isInDarkness() of
		true ->
			core:sendMsgToActivity(
				?ActivityType_Darkness,
				syncClientToMe,
				{playerState:getRoleID(), playerState:getNetPid(), TargetRoleID, TargetCode}),
			ok;
		_ ->
			skip
	end,
	ok.

syncMeToRound() ->
	PlayerEts = playerState:getMapPlayerEts(),
	case playerState:getMapPlayerEts() of
		undefined ->
			skip;
		PlayerEts ->
			PlayerCode = playerState:getPlayerCode(),
			SelfNetPid = playerState:getNetPid(),
			MapPid = playerState:getMapPid(),

			Money = #pk_MoneyChanges{
				code = PlayerCode,
				moneys = [#pk_MoneyInit{moneyType = ?CoinTypePebble, value = playerState:getCoin(?CoinTypePebble)}]
			},
			Msg = #pk_GS2U_MoneyChanges{changes = [Money]},

			%% 给RP玩家同步
			case ets:lookup(PlayerEts, PlayerCode) of
				[#recMapObject{x = X, y = Y, groupID = GroupID}] ->
					%% 获取能看见我和我能看见的所有玩家
					NearPlayerList = mapView:getMutualObject(MapPid, PlayerEts, ?ObjTypePlayer, {X, Y}, GroupID),
					Fun =
						fun(#recMapObject{netPid = NearPid}) ->
							case SelfNetPid =/= NearPid of
								true ->
									%% 直接向远程玩家的网络进程发送消息，不再通过远程玩家进程转发
									mapView:sendNetMsgToNetPid(NearPid, Msg);
								_ ->
									skip
							end
						end,
					lists:foreach(Fun, NearPlayerList);
				_ ->
					skip
			end
	end,
	ok.

%% 请求黑暗之地初始信息(打开界面)
-spec requestDarknessInfo() -> ok.
requestDarknessInfo() ->
	Time = #pk_DarknessState{remainTime = 0},
	playerMsg:sendNetMsg(#pk_GS2U_DarknessInfo{state = Time, buyMoney = -1, buyMoneyType = ?CoinTypeGold}),
	ok.

%% 请求入口列表
-spec requestEntrance() -> ok.
requestEntrance() ->
	core:sendMsgToActivity(
		?ActivityType_Darkness,
		requestEntrance,
		{playerState:getRoleID(), playerState:getNetPid()}),
	ok.

%% 进入黑暗之地第一层(进入失败，自动加入排队)
-spec requestEnterDarkness(Entrance::uint()) -> ok.
requestEnterDarkness(Entrance) ->
%% 	?ERROR_OUT("requestEnterDarkness roleID=~p, roleName=~ts, Entrance=~p",
%% 		[playerState:getRoleID(), playerState:getName(), Entrance]),
	case playerState:getCurHp() > 0 of
		true ->
			#globalsetupCfg{setpara = [NeedLevel]} = getCfg:getCfgPStack(cfg_globalsetup, dark_level),
			case playerState:getLevel() >= NeedLevel of
				true ->
					NowTime = time:getSyncTime1970FromDBS(),
					LastTime = playerPropSync:getProp(?SerProp_PRequestDarkness),
					case NowTime - LastTime >= ?RequestEnterDarknessCD of
						true ->
							core:sendMsgToActivity(
								?ActivityType_Darkness,
								requestEnterDarkness,
								{playerState:getRoleID(), playerState:getNetPid(), Entrance, 1}),

							playerPropSync:setInt64(?SerProp_PRequestDarkness, NowTime);
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_Darkness_EnterCDTime)
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_Darkness_PlayerLevel_Low, [NeedLevel])
			end;
		_ ->
			skip
	end,
	ok.

%% 请求进入黑暗之地地图(进入失败，给提示，并加入队列)
-spec requestEnterDarknessPrepareMap(TargetMapID::uint()) -> ok.
requestEnterDarknessPrepareMap(TargetMapID) ->
%%	?DEBUG_OUT("requestEnterDarknessPrepareMap:~p", [TargetMapID]),
	case playerState:getCurHp() > 0 of
		true ->
			#globalsetupCfg{setpara = [NeedLevel]} = getCfg:getCfgPStack(cfg_globalsetup, dark_level),
			case playerState:getLevel() >= NeedLevel of
				true ->
					core:sendMsgToActivity(
						?ActivityType_Darkness,
						requestEnterDarkness_prepare,
						{playerState:getRoleID(), playerState:getNetPid(), TargetMapID});
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_Darkness_PlayerLevel_Low, [NeedLevel])
			end;
		_ ->
			skip
	end,
	ok.

%% 请求进入黑暗之地地图(进入失败，给提示，并加入队列)
-spec requestEnterDarknessMap(TargetMapID::uint()) -> ok.
requestEnterDarknessMap(TargetMapID) ->
	case playerState:getCurHp() > 0 of
		true ->
			#globalsetupCfg{setpara = [NeedLevel]} = getCfg:getCfgPStack(cfg_globalsetup, dark_level),
			case playerState:getLevel() >= NeedLevel of
				true ->
					NowTime = time:getSyncTime1970FromDBS(),
					LastTime = playerPropSync:getProp(?SerProp_PRequestDarkness),
					case NowTime - LastTime >= ?RequestEnterDarknessCD of
						true ->
							core:sendMsgToActivity(
								?ActivityType_Darkness,
								requestEnterDarkness2,
								{playerState:getRoleID(), playerState:getNetPid(), playerState:getMapID(), playerState:getMapPid(), TargetMapID}),

							playerPropSync:setInt64(?SerProp_PRequestDarkness, NowTime);
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_Darkness_EnterCDTime)
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_Darkness_PlayerLevel_Low, [NeedLevel])
			end;
		_ ->
			skip
	end,
	ok.

isInDarkness() ->
	isInDarkness(playerState:getMapID()).
isInDarkness(MapID) when erlang:is_integer(MapID) andalso MapID > 0 ->
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = MapType, subtype = SubType} ->
			case MapType of
				?MapTypeActivity ->
					case SubType of
						?MapSubTypeDarkness ->
							isInDarknessBattle();
						?MapSubTypeDarknessReady -> true;
						_ -> false
					end;
				_ -> false
			end;
		_ -> false
	end;
isInDarkness(_MapID) -> false.

isInDarknessBattle() ->
	isInDarknessBattle(playerState:getMapID()).
isInDarknessBattle(MapID) ->
	#activityCfg{mapidlist = MapIDList} = getCfg:getCfgPStack(cfg_activity, ?ActivityType_Darkness),
	lists:member(MapID, MapIDList).

decPebble(AttackRoleID, DropPer) ->
	case playerState:getCoin(?CoinTypePebble) of
		0 ->
			0;
		OldCoin ->
			Dec1 = misc:ceil(OldCoin * DropPer / 100),
			Dec2 =
				case OldCoin >= Dec1 of
					true ->
						Dec1;
					_ ->
						OldCoin
				end,
			case Dec2 > 0 of
				true ->
					playerMoney:decCoin(?CoinTypePebble, Dec2,
						#recPLogTSMoney{
							reason = ?CoinUseDarkness,
							param = AttackRoleID,
							target = ?PLogTS_Darkness,
							source = ?PLogTS_PlayerSelf}),
					Dec2;
				_ ->
					0
			end
	end.

getRealAddValueAndAdd(0) -> 0;
getRealAddValueAndAdd(Value) when erlang:is_integer(Value) andalso Value > 0 ->
	#globalsetupCfg{setpara = [Max]} = getCfg:getCfgPStack(cfg_globalsetup, dark_maximum),
	Now = playerDaily:getDailyCounter(?DailyType_Everyday, ?PlayerEveryDay_Pebble),
	RealValue =
		case Now + Value =< Max of
			true -> Value;
			_ -> Max - Now
		end,
	case RealValue > 0 of
		true ->
			RealValue;
		_ ->
			0
	end;
getRealAddValueAndAdd(Value) ->
	?ERROR_OUT("getRealAddValueAndAdd:~p,~p,~p",
		[playerState:getRoleID(),Value,misc:getStackTrace()]),
	Value.