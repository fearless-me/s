%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 复活模块
%%% @end
%%% Created : 20. 七月 2015 16:38
%%%-------------------------------------------------------------------
-module(playerRevive).
-author("tiancheng").

-include("playerPrivate.hrl").

-define(ReviveProtectTime, 33).      %% 复活保护时间s，超过这个时间，玩家没有复活，则自动复活

-define(Revive_Normal, 1).          %% 普通复活
-define(Revive_Cost, 2).            %% 收费复活
-define(Revive_Unconditional, 3).   %% 无条件复活
-define(Revive_BattleLearn, 4).     %% 切磋复活

%% API
-export([
	onDead/3,
	requestRevive_Normal/0,
	requestRevive_Cost/0,
	requestRevive_Unconditional/0,
	requestRevive_BattleLearn/0,

	checkPlayerIsRevive/0,
	noticeTeam/3
]).

%% 请求普通营地复活
-spec requestRevive_Normal() -> ok.
requestRevive_Normal() ->
	?DEBUG_OUT("requestRevive_Normal:~p,~ts",[playerState:getRoleID(), playerState:getName()]),
	MapID = playerState:getMapIDGroup(),
	#mapsettingCfg{type = MapType} = getCfg:getCfgPStack(cfg_mapsetting, MapID),
	if
		MapType =:= ?MapTypeActivity ->
			%% 活动地图，目前都处理成直接复活
			requestRevive(?Revive_Normal);
		MapType =:= ?MapTypeCopyMap ->
			requestRevive_Normal2();
		MapType =:= ?MapTypeNormal ->
			requestRevive_Normal2();
		true ->
			requestRevive_Normal2()
	end,
	ok.

-spec requestRevive_Normal2() -> ok.
requestRevive_Normal2() ->
	NowTime = time:getSyncTime1970FromDBS(),
	LastTime = playerPropSync:getProp(?SerProp_PlayerDTime),
	ReviveTime = playerPropSync:getProp(?SerProp_PlayerRTime),
	case NowTime - LastTime >= ReviveTime of
		true ->
			%% 允许复活
			requestRevive(?Revive_Normal);
		_ ->
			?ERROR_OUT("requestRevive_Normal roleID=~p, roleName=~ts, nowdiff=~p, cd=~p",
				[playerState:getRoleID(),playerState:getName(), NowTime - LastTime, ReviveTime])
	end,
	ok.

%% 请求花钱原地复活
-spec requestRevive_Cost() -> ok.
requestRevive_Cost() ->
	?DEBUG_OUT("requestRevive_Cost:~p,~ts",[playerState:getRoleID(), playerState:getName()]),
	RoleID = playerState:getRoleID(),
	RoleName = playerState:getName(),
	{CPhase, _NPhase} = getCNPhase(),
	#globalsetupCfg{setpara = CostList} = getCfg:getCfgPStack(cfg_globalsetup, relive_cost),
	{MoneyType, Money} = getListObj(CostList, CPhase),
	{CanUse, ErrorCode} =
		case MoneyType of
			?CoinTypeGold -> {playerState:getCoin(MoneyType) >= Money, ?ErrorCode_TradeGold};
			?CoinTypeDiamond -> {playerState:getCoin(MoneyType) >= Money, ?ErrorCode_TradeDiamond};
			?CoinTypeBindDiamond -> {playerMoney:canUseCoin(?CoinUseTypeDiamond, Money), ?ErrorCode_TradeDiamond};
			_ ->
				?ERROR_OUT("requestRevive_Cost roleID=~p, roleName=~ts, config error:~p", [RoleID, RoleName, MoneyType]),
				{false, ?ErrorCode_SystemNotEnoughMoney}
		end,
	case CanUse of
		true ->
			case requestRevive(?Revive_Cost) of
				true ->
					%% 扣钱
					PLog = #recPLogTSMoney{reason = ?CoinUseRevive, param = CPhase, target = ?PLogTS_System, source = ?PLogTS_PlayerSelf},
					case MoneyType of
						?CoinTypeGold -> playerMoney:decCoin(MoneyType, Money, PLog);
						?CoinTypeDiamond -> playerMoney:decCoin(MoneyType, Money, PLog);
						?CoinTypeBindDiamond -> playerMoney:useCoin(?CoinUseTypeDiamond, Money, PLog)
					end,

					addCostPhase(1, erlang:length(CostList)),
%% 					?WARN_OUT("AAAAAAAAAAA:~ts, ~p -> ~p, ~p", [playerState:getName(),CPhase,getCNPhase(),Money]),
					ok;
				_ ->
					skip
			end;
		false ->
			playerMsg:sendErrorCodeMsg(ErrorCode)
	end,
	ok.

%% 无条件复活(营地复活)，服务器执行
-spec requestRevive_Unconditional() -> ok.
requestRevive_Unconditional() ->
	requestRevive(?Revive_Unconditional).

%% 切磋复活
-spec requestRevive_BattleLearn() -> ok.
requestRevive_BattleLearn() ->
	requestRevive(?Revive_BattleLearn).

%% 检查玩家是否需要强制复活
-spec checkPlayerIsRevive() -> ok.
checkPlayerIsRevive() ->
	case playerState:getCurHp() > 0 of
		false ->
			NowTime = time:getSyncTime1970FromDBS(),
			LastTime = playerPropSync:getProp(?SerProp_PlayerDTime),
			ReviveTime = playerPropSync:getProp(?SerProp_PlayerRTime),
			case NowTime - LastTime >= ReviveTime + ?ReviveProtectTime of
				true ->
					%% 复活
					?LOG_OUT("player[~p,~ts] dead, auto revive", [playerState:getRoleID(),playerState:getName()]),
					requestRevive_Normal();
				_ ->
					skip
			end,
			ok;
		_ ->
			skip
	end,
	ok.

-spec requestRevive(Type::uint()) -> boolean().
requestRevive(Type) ->
	RoleID = playerState:getRoleID(),
	RoleName = playerState:getName(),
	?LOG_OUT("player[~p,~ts,type=~p] requestRevive", [RoleID,RoleName,Type]),
	case playerState:getCurHp() =< 0 of
		true ->
			requestRevive2(Type),
			?LOG_OUT("player[~p,~ts,type=~p] dead,revive success",[RoleID,RoleName,Type]),

			%% 复活后的处理
			reviveCallBack(Type),
			true;
		_ ->
			?ERROR_OUT("player[~p,~ts,type=~p] onRevive but hp > 0",[RoleID,RoleName,Type]),
			false
	end.

%% 复活处理函数
-spec requestRevive2(Type::uint()) -> boolean().
requestRevive2(?Revive_BattleLearn) ->
	%% 切磋复活
	MapID = playerState:getMapIDGroup(),
	requestRevive4(MapID),
	true;
requestRevive2(Type) ->
	%% 普通复活血量百分比
	#globalsetupCfg{setpara = [HPPer_Normal]} = getCfg:getCfgPStack(cfg_globalsetup, relive_hp),
	%% 收费复活血量百分比
	#globalsetupCfg{setpara = [HPPer_Cost]} = getCfg:getCfgPStack(cfg_globalsetup, relive_cost_hp),

	MapID = playerState:getMapIDGroup(),

	{Sx, Sy} = playerState:getPos(),
	{Normal_Tx, Normal_Ty} =
		case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
			#mapsettingCfg{type = ?MapTypeBitplane} ->
				%% 如果是位面，直接改为原地复活
				{Sx, Sy};
			_ ->
				case playerMap:getMapRevivePt(MapID) of
					{X, Y} ->
						{X, Y};
					_ ->
						?ERROR_OUT("player[~p,~ts,type=~p] Error MapID[~p],not cfg",
							[playerState:getRoleID(),playerState:getName(),Type,MapID]),
						{Sx, Sy}
				end
		end,

	case Type of
		?Revive_Unconditional ->
			%% 无条件复活，不执行其它操作
			requestRevive3(MapID, Normal_Tx, Normal_Ty, HPPer_Normal);
		?Revive_Cost ->
			%% 原地复活
			requestRevive3(MapID, Sx, Sy, HPPer_Cost);
		_ ->
			%% 运镖
			Condition1 = playerEscort:escortReviveAndConsume(MapID),
			case Condition1 of
				{Tx, Ty} -> requestRevive3(MapID, Tx, Ty, HPPer_Normal);
				leaveEscortMap ->
					requestRevive3(MapID, Normal_Tx, Normal_Ty, HPPer_Normal),
					timer:sleep(800),
					playerCopyMap:leaveCopyMap();
				_ ->
					%% 巅峰对决
					Condition2 = playerGuildWar:getRevivePos(MapID),
					case Condition2 of
						{TTX, TTY} ->
							requestRevive3(MapID, TTX, TTY, HPPer_Normal);
						_ ->
							%% 黑暗之地
							Condition3 = playerDarkness:getRevivePos(MapID),
							case Condition3 of
								{TTTX, TTTY} ->
									requestRevive3(MapID, TTTX, TTTY, HPPer_Normal);
								_ ->
									%%% 军团驻地
									%Condition4 = playerGuildHome:getRevivePos(MapID),
									%case Condition4 of
									%	{TTTTX, TTTTY} ->
									%		requestRevive3(MapID, erlang:float(TTTTX), erlang:float(TTTTY), HPPer_Normal);
									%	_ ->
											requestRevive3(MapID, Normal_Tx, Normal_Ty, HPPer_Normal)
									%end
							end
					end
			end
	end,
	true.

%% 其它统一复活
requestRevive3(MapID, X, Y, Percent) ->
	RX = erlang:float(X),
	RY = erlang:float(Y),

	MaxHp = playerState:getMaxHp(),
	CurHp = erlang:round(MaxHp * Percent),
	playerState:setRebornHp(CurHp),

	%% 设置位置，这里会通知周围人自己的变化，同时将周围的变化发给自己
	playerState:setPos(RX, RY),

	%% 清除当前能量值
	playerBase:setSpecBattlePropPower(0.0),

	%% 清除当前体力值
	playerState:setCurPhys(0),

	%% 复活增加PK保护
%% 	case playerScene:getMapType(MapID) of
%% 		?MapTypeActivity -> skip;
%% 		_ -> playerBuff:addSpecBuff(?PkBuff, playerState:getLevel())
%% 	end,
	playerBuff:addSpecBuff(?PkBuff, playerState:getLevel()),
	%% 宠物复活
	case playerPet:getPetBattle() of
		#recPetInfo{pet_status = Status} = Pet when Status =:= ?PetState_Battle_Show -> playerPet:callPet(Pet);
		_ -> skip
	end,

	SelfMsg = #pk_GS2U_PlayerRevive{
		mapId = MapID,
		x = RX,
		y = RY,
		curHp = CurHp,
		maxHp = MaxHp,
		curPower = 0,
		curPhys = 0
	},
	noticeOtherObject(MapID, RX, RY, erlang:trunc(Percent * 100), SelfMsg),

	%% 先复活，再离开位面(这里不判断是不是无条件复活，因为是离开位置，请不要在这里再加其它逻辑)
	case playerState:getGroupID() > groupBase:getMinGroupID() of
		true ->
			%% 这里只是离开位置，不是切换地图
			playerCopyMap:leaveCopyMap();
		_ ->
			skip
	end,
	ok.

%% 切磋自动复活
-spec requestRevive4(MapID::uint()) -> ok.
requestRevive4(MapID) ->
	HP = playerPropSync:getProp(?SerProp_BattleLearnHP),
	playerPropSync:setInt(?SerProp_BattleLearnHP, 0),

	playerState:setRebornHp(HP),
	{RX, RY} = playerState:getPos(),

	MaxHp = playerState:getMaxHp(),
	CurHp = playerState:getCurHp(),
	PC = skill:getPercent(CurHp, MaxHp),

	SelfMsg = #pk_GS2U_PlayerRevive{
		mapId = MapID,
		x = RX,
		y = RY,
		curHp = HP,
		maxHp = MaxHp,
		curPower = trunc(playerBase:getSpecBattlePropPower()),
		curPhys = playerState:getCurPhys()
	},
	noticeOtherObject(MapID, RX, RY, PC, SelfMsg),
	ok.

noticeOtherObject(MapID, RX, RY, PC, #pk_GS2U_PlayerRevive{} = PlayerRevive) ->
	%% 复活，通知复活点周围的玩家
	Msg = #pk_GS2U_BroadcastPlayerRevive{
		code = playerState:getPlayerCode(),
		mapId = MapID,
		x = RX,
		y = RY,
		hpPC = PC
	},
	playerMsg:sendMsgToNearPlayer(Msg, false),

	%% 通知自己的队友复活
	TeamMsg = #pk_GS2U_BroadcastTeamRevive{
		roleID = playerState:getRoleID(),
		mapId = MapID,
		x = RX,
		y = RY,
		hpPC = PC
	},
	noticeTeam(RX, RY, TeamMsg),

	%% 通知自己复活的血量
	playerMsg:sendNetMsg(PlayerRevive),
	ok.

%% 玩家死亡
-spec onDead(AttackerCode::uint(), AttackName::string(), IsBattleLearn::boolean()) -> ok.
onDead(AttackerCode, AttackName, IsBattleLearn) ->
	Code = playerState:getPlayerCode(),
	NowTime = time:getSyncTime1970FromDBS(),
	%% 上次死亡时间
	LastTime = playerPropSync:getProp(?SerProp_PlayerDTime),
	%% 设置本次死亡时间
	playerPropSync:setInt64(?SerProp_PlayerDTime, NowTime),

	%% 得到攻击者RoleID和姓名
	AttackRoleID = playerBattle:getAttackRoleID(AttackerCode),

	%% 军团争霸特殊复活时间
	{GuildWarResult, GWTime} = playerGuildWar:playerDead(AttackRoleID),
	%%跨服竞技场复活时间
	CrosArena = playerCrosTeam:getCrosArenaReviveTime(),

	MapSubType = playerScene:getMapSubType(playerState:getMapID()),

	{MoneyStruct, ReveTime} =
		if
			GuildWarResult ->
				{#pk_MoneyInit{moneyType = 0, value = 0}, GWTime};
			IsBattleLearn ->
				Money = #pk_MoneyInit{moneyType = 0, value = 0},
				{Money, 1};
			erlang:is_integer(CrosArena) andalso CrosArena > 0 ->
				Money = #pk_MoneyInit{moneyType = 0, value = 0},
				{Money, CrosArena};
			MapSubType =:= ?MapSubTypeExpCopyMap ->
				Money = #pk_MoneyInit{moneyType = 0, value = 0},
				ExpCopyReviveTime = case getCfg:getCfgByArgs(cfg_globalsetup, expfuben_revivedtime) of
										#globalsetupCfg{setpara = [V]} ->
											V;
										_ ->
											3
									end,
				{Money, ExpCopyReviveTime};
			true ->
				%% 普通复活需要时间与金钱
				{CPhase, NPhase} = getCNPhase(),

				#globalsetupCfg{setpara = TimeList} = getCfg:getCfgPStack(cfg_globalsetup, relive_time),
				#globalsetupCfg{setpara = [Cost|_] = CostList} = getCfg:getCfgPStack(cfg_globalsetup, relive_cost),
				#globalsetupCfg{setpara = [CD]} = getCfg:getCfgPStack(cfg_globalsetup, relive_cd),
				DiffTime = NowTime - LastTime,
				{MoneyType, Money} =
					case CPhase =< 0 of
						true -> Cost;
						_ ->
							case DiffTime > CD of
								true ->
									DecV = DiffTime div CD,
									addCostPhase(-DecV, erlang:length(CostList)),
									getListObj(CostList, CPhase - DecV);
								_ ->
									getListObj(CostList, CPhase)
							end
					end,

				ReviveTime =
					case NowTime - LastTime > CD of
						true ->
							DecV2 = DiffTime div CD,
							addNormalPhase(-DecV2, erlang:length(TimeList)),
							getListObj(TimeList, NPhase - DecV2);
						_ ->
							addNormalPhase(1, erlang:length(TimeList)),
							getListObj(TimeList, NPhase + 1)
					end,
				MoneySt = #pk_MoneyInit{moneyType = MoneyType, value = Money},
				{MoneySt, ReviveTime}
		end,

	%% 设置允许复活的CD时间
	playerPropSync:setInt(?SerProp_PlayerRTime, ReveTime),

	playerGuildExpedition:playerDead(AttackerCode, AttackRoleID),
	{_IsLost, LostMoney1} = playerDarkness:playerDead(AttackerCode, AttackRoleID),

	MoneyStruct1=
		case core:isCross() of
			true ->
				MoneyStruct#pk_MoneyInit{value=0};
			_ ->MoneyStruct
		end,
	%% 通知客户端死亡
	Msg = #pk_GS2U_PlayerDead{
		deadTime = NowTime,
		code = Code,
		normalReviveCDTime = ReveTime,
		reviveCost = MoneyStruct1,
		attackCode = AttackerCode,
		attackName = AttackName,
		lostMoney = LostMoney1
	},
	playerMsg:sendNetMsg(Msg),

	?LOG_OUT("player dead roleID=~p, roleName=~ts, reviveTime=~p, money=~p",
		[playerState:getRoleID(),playerState:getName(),ReveTime,MoneyStruct]),

	ok.

%%通知自己队友死亡或者复活
-spec noticeTeam(X::float(), Y::float(), Msg::tuple()) -> ok.
noticeTeam(X, Y, Msg) ->
	MapPid = playerState:getMapPid(),
	GroupID = playerState:getGroupID(),
	PlayerEts = playerState:getMapPlayerEts(),
	TeamList = teamInterface:getTeamMemberPidListWithRoleID(playerState:getRoleID()),%%playerTeam2:getTeamAllMemberPidList(),
	NearPidList = mapView:getNearPlayerPid(X, Y, MapPid, GroupID, PlayerEts),
	noticeTeam(X, Y, Msg, TeamList, NearPidList).
noticeTeam(_X, _Y, _Msg, [], _) ->
	ok;
noticeTeam(X, Y, Msg, [Pid | TeamList], NearPidList) ->
	case lists:member(Pid, NearPidList) of
		false ->
			%%队伍玩家下线时，pid为0
			case is_pid(Pid) of
				true ->
					psMgr:sendMsg2PS(Pid, broadcast, Msg);
				_ ->
					skip
			end,
			noticeTeam(X, Y, Msg, TeamList, NearPidList);
		_ ->
			noticeTeam(X, Y, Msg, TeamList, NearPidList)
	end.

getCNPhase() ->
	RevivePhase = playerPropSync:getProp(?SerProp_PlayerRevivePhase),
	RevivePhase2 = RevivePhase band 16#FFFF,
	CPhase = RevivePhase2 bsr 8,     % 收费复活阶段
	NPhase = RevivePhase band 16#FF, % 普通复活阶段
	{CPhase, NPhase}.

addCostPhase(Number, Max) ->
	{CPhase, NPhase} = getCNPhase(),
	NCPhase1 = erlang:max(CPhase + Number, 0),
	NCPhase2 = erlang:min(NCPhase1, Max),
	case CPhase /= NCPhase2 of
		true ->
			Value = (NCPhase2 bsl 8) + NPhase,
			playerPropSync:setInt(?SerProp_PlayerRevivePhase, Value);
		_ ->
			skip
	end,
	ok.

addNormalPhase(Number, Max) ->
	{CPhase, NPhase} = getCNPhase(),
	NNPhase1 = erlang:max(NPhase + Number, 0),
	NNPhase2 = erlang:min(NNPhase1, Max),
	case NPhase /= NNPhase2 of
		true ->
			Value = (CPhase bsl 8) + NNPhase2,
			playerPropSync:setInt(?SerProp_PlayerRevivePhase, Value);
		_ ->
			skip
	end,
	ok.

getListObj([Obj|_] = List, Index) ->
	Len = erlang:length(List),
	if
		Index =< 0 -> Obj;
		Index > Len -> lists:last(List);
		true -> lists:nth(Index, List)
	end.

%% 复活后的回调
reviveCallBack(Type) ->
	case Type of
		?Revive_Unconditional ->
			%% 无条件复活，不传送地图
			skip;
		_ ->
			skip
	end,
	ok.