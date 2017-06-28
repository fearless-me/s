%%%-------------------------------------------------------------------
%%% @author mwh
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%% 首领入侵
%%% @end
%%% Created : 31. 五月 2017 17:06
%%%-------------------------------------------------------------------
-module(acWorldBossLogic).
-include("../../activityPrivate.hrl").
-include("../activityPhaseDefine.hrl").
-include("acWorldBossPrivate.hrl").
-author("ly").

%% API
-export([
	init/0,
	tick/0,
	kickAll/0,
	nextPhaseGo/0,
	activityMapMsg/2,
	activityChangeCallBack/1
]).
-export([
	isOpen/0
]).

-define(KickAllTime, 30*1000).
-define(NextPhaseTime, 30*1000).

-spec init() -> ok.
init() ->
	ets:new(?WorldBossEts, [protected, named_table, set, {keypos, #recWorldBossInfo.key}, {read_concurrency, true}]),
	ets:new(?WorldBossTopEts, [protected, named_table, set, {keypos, #recWorldBossDamageTop.key}, {read_concurrency, true}]),
	ets:new(?WorldBossDamageEts, [protected, named_table, set, {keypos, #recWorldBossDamage.roleID}, {read_concurrency, true}]),
	resetData(),
	tickMsg(),
	ok.

tickMsg() ->
	erlang:send_after(?WorldBossTick, self(), tick).

isOpen() ->
	variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_LeaderBtn).

%% 活动地图的消息
-spec activityMapMsg(MsgType :: uint(), Data :: term()) -> ok.
activityMapMsg(?ACMapMsg_CreateMap, {_CreateRoleID, MapID, MapPid, PlayerEts, MonsterEts, _CollectEts, _NpcEts}) ->
	?DEBUG_OUT("[ACMapMsg_CreateMap] mapPid = ~p", [MapPid]),
	onCreateMap(MapID, MapPid, PlayerEts, MonsterEts),
	ok;
activityMapMsg(?ACMapMsg_DestoryMap, MapPID) ->
	?DEBUG_OUT("[ACMapMsg_DestoryMap]  mapPid = ~p", [MapPID]),
	onDestroyMap(MapPID),
	ok;
activityMapMsg(?ACMapMsg_PlayerEnter, {_RoleID, _MapPID, #recMapObject{}}) ->
	ok;
activityMapMsg(?ACMapMsg_HurtMonster, {_MapID, _MapPID, RoleID, MonsterCode, MonsterID, DamageValue}) ->
	?DEBUG_OUT("ACMapMsg_HurtMonster  11:~w", [{MonsterID, DamageValue}]),
	case isState(?ActivityType_WorldBoss_2) of
		true when DamageValue > 0 ->
			onHurtMonster(RoleID, MonsterCode, MonsterID, DamageValue);
		_ ->
			skip
	end,
	ok;
activityMapMsg(?ACMapMsg_KillMonster, {MapID, _MapPID, _AttackRoleID, _MonsterCode, MonsterID}) ->
	?DEBUG_OUT("ACMapMsg_KillMonster:~w", [{MapID, MonsterID}]),
	ok;
activityMapMsg(?ACMapMsg_Offline, RoleID) ->
	?DEBUG_OUT("ACMapMsg_Offline:~w", [RoleID]),
	ok;
activityMapMsg(_MsgType, _Data) ->
	ok.

%% 活动管理器回调
-spec activityChangeCallBack(Phase :: uint()) -> ok.
activityChangeCallBack(?ActivityPhase_Close) ->
	?DEBUG_OUT("activityChangeCallBack(ActivityPhase_Close)"),
	acWorldBossState:setState(?ActivityPhase_Close);
activityChangeCallBack(?ActivityType_WorldBoss_1) ->
	?DEBUG_OUT("activityChangeCallBack(ActivityType_WorldBoss_1)"),
	acWorldBossState:setState(?ActivityType_WorldBoss_1),
	resetData(),
	ready();
activityChangeCallBack(?ActivityType_WorldBoss_2) ->
	?DEBUG_OUT("activityChangeCallBack(ActivityType_WorldBoss_2)"),
	acWorldBossState:setState(?ActivityType_WorldBoss_2),
	going();
activityChangeCallBack(?ActivityType_WorldBoss_3) ->
	?DEBUG_OUT("activityChangeCallBack(ActivityType_WorldBoss_3)"),
	acWorldBossState:setState(?ActivityType_WorldBoss_3),
	finish(?FinishReason_Timeout);
activityChangeCallBack(_Phase) ->
	?DEBUG_OUT("activityChangeCallBack(~p)", [_Phase]),
	ok.
%%%-------------------------------------------------------------------
onCreateMap(MapID, MapPID, PlayerEts, MonsterEts) ->
	ML = acWorldBossState:getMapList(),
	case lists:keyfind(MapPID, #recWorldBossMapInfo.mapPID, ML) of
		#recWorldBossMapInfo{} ->
			ok;
		_ ->
			MapInfo = #recWorldBossMapInfo{
				mapID = MapID,
				mapPID = MapPID,
				playerEts = PlayerEts,
				monsterEts = MonsterEts
			},
			acWorldBossState:setMapList([MapInfo | ML]),
			createBossForMap(MapPID)
	end,
	ok.

createBossForMap(MapPid) ->
	case isState(?ActivityType_WorldBoss_2) of
		true ->
			#recWorldBossInfo{dataID = DataID, curHP = CurHp, x = PosX, y = PosY}
				= myEts:readRecord(?WorldBossEts, ?WorldBossKey),
			psMgr:sendMsg2PS(MapPid, createWorldBoss, {DataID, CurHp, PosX, PosY}),
			ok;
		_ ->
			skip
	end.

onDestroyMap(MapPID) ->
	ML1 = acWorldBossState:getMapList(),
	ML2 = lists:keydelete(MapPID, #recWorldBossMapInfo.mapPID, ML1),
	acWorldBossState:setMapList(ML2),
	ok.

%%%-------------------------------------------------------------------
onHurtMonster(RoleID, MonsterCode, MonsterID, DamageValue) ->
	case isWorldBoss(MonsterID) of
		true ->
			case canHurtBoss() of
				{true, CurHp} ->
					doHurtBoss(RoleID, MonsterCode, MonsterID, DamageValue, CurHp);
				_ ->
					skip
			end,
			ok;
		_ ->
			skip
	end,
	ok.


canHurtBoss() ->
	case myEts:readRecord(?WorldBossEts, ?WorldBossKey) of
		#recWorldBossInfo{curHP = CurHp} when CurHp > 0 ->
			{true, CurHp};
		_ ->
			{false, 0}
	end.

doHurtBoss(RoleID, MonsterCode, MonsterID, DamageValue, CurHp) ->

	NewR =
		case myEts:readRecord(?WorldBossDamageEts, RoleID) of
			#recWorldBossDamage{damage = OldDamage} = R ->
				R#recWorldBossDamage{damage = OldDamage + DamageValue};
			_ ->
				#recWorldBossDamage{roleID = RoleID, damage = DamageValue}
		end,
	myEts:insertEts(?WorldBossDamageEts, NewR),

	sortInTime(NewR),

	case DamageValue >= CurHp of
		true ->
			onKilledMonster(RoleID, MonsterCode, MonsterID);
		_ ->
			myEts:updateEts(
				?WorldBossEts,
				?WorldBossKey,
				{#recWorldBossInfo.curHP, CurHp - DamageValue}
			)
	end,
	ok.

%%%-------------------------------------------------------------------
onKilledMonster(AttackRoleID, _MonsterCode, MonsterID) ->
	case isWorldBoss(MonsterID) of
		true ->
			myEts:updateEts(
				?WorldBossEts,
				?WorldBossKey,
				[{#recWorldBossInfo.killer, AttackRoleID}, {#recWorldBossInfo.curHP, 0}]
			),
			finish(?FinishReason_Killed);
		_ ->
			skip
	end,

	ok.

isWorldBoss(ID) ->
	case myEts:readRecord(?WorldBossEts, ?WorldBossKey) of
		#recWorldBossInfo{dataID = ID} ->
			true;
		_ ->
			false
	end.

isState(State) ->
	acWorldBossState:getState() =:= State.

%%%-------------------------------------------------------------------
tick() ->
	tickMsg(),
	State = acWorldBossState:getState(),
	doTick(State).

%%%-------------------------------------------------------------------
doTick(?ActivityType_WorldBoss_2) ->
	tick_going();
doTick(_) ->
	ok.

%%%-------------------------------------------------------------------
resetData() ->
	acWorldBossState:setState(?ActivityPhase_Close),
	acWorldBossState:setBossList([]),
	myEts:deleteAllRecord(?WorldBossTopEts),
	myEts:deleteAllRecord(?WorldBossDamageEts),
	myEts:deleteAllRecord(?WorldBossEts),
	ok.

ready()->
	#worldbossCfg{setpara = L}
		= getCfg:getCfgByKey(cfg_worldboss, worldboss_list),
	refresh(L).



%%%-------------------------------------------------------------------
refresh([])->
	skip;
refresh([{BossID, X, Y} | BL]) ->
	%%初始化世界BOSS
	myEts:deleteAllRecord(?WorldBossTopEts),
	myEts:deleteAllRecord(?WorldBossDamageEts),
	psMgr:sendMsg2PS(?PsNamePlayerMgr, pidMsg2AllOLPlayer, {worldBossState, {1}}),
	#monsterCfg{maxHP = MaxHp} = getCfg:getCfgByKey(cfg_monster, BossID),
	myEts:insertEts(
		?WorldBossEts,
		#recWorldBossInfo{
			key = ?WorldBossKey,
			dataID = BossID,
			x = float(X),
			y = float(Y),
			maxHP = MaxHp,
			curHP = MaxHp,
			killer = 0
		}
	),
	myEts:insertEts(
		?WorldBossTopEts,
		#recWorldBossDamageTop{
			key = ?WorldBossKey,
			list = []
		}
	),
	acWorldBossState:setBossList(BL),
	core:sendBroadcastErrorCode(?ErrorCode_CnText4BossDoingNotice, []),
	ok.

%%%-------------------------------------------------------------------
nextPhaseGo()->
	going().

going() ->
	%%
	ML = acWorldBossState:getMapList(),
	lists:foreach(
		fun(#recWorldBossMapInfo{mapPID = MapPid}) ->
			createBossForMap(MapPid)
		end, ML),
	ok.

%%%-------------------------------------------------------------------
tick_going() ->
	syncHp(),
	ok.


syncHp() ->
	case myEts:readRecord(?WorldBossEts, ?WorldBossKey) of
		#recWorldBossInfo{dataID = DataID, curHP = CurHP} when DataID > 0 ->
			ML = acWorldBossState:getMapList(),
			lists:foreach(
				fun(#recWorldBossMapInfo{mapPID = Pid}) ->
					psMgr:sendMsg2PS(Pid, worldBossSetHp, {DataID, CurHP})
				end, ML);
		_ ->
			skip
	end,
	ok.

%%%-------------------------------------------------------------------
finish(Reason) ->
	?LOG_OUT("worldboss finish [~p],[~w]",
		[Reason, myEts:getAllRecord(?WorldBossEts)]),
	clear(),
	reward(Reason),
	onFinish(Reason),
	ok.


onFinish(?FinishReason_Killed) ->
	L = acWorldBossState:getBossList(),
	reGo(L),
	ok;
onFinish(_Reason) ->
	gameOver(),
	ok.

%%%-------------------------------------------------------------------
gameOver()->
	erlang:send_after(?KickAllTime, self(), resetall),
	psMgr:sendMsg2PS(?PsNamePlayerMgr, pidMsg2AllOLPlayer, {worldBossState, {0}}),
	core:sendBroadcastErrorCode(?ErrorCode_CnText4BossFailEndNotice, []),
	resetData().

%%%-------------------------------------------------------------------
reGo([])->
	gameOver(),
	ok;
reGo(L)->
	acWorldBossState:setState(?ActivityType_WorldBoss_2),
	core:sendBroadcastErrorCode(?ErrorCode_CnText4BossScheduleEndNotice, []),
	refresh(L),
		erlang:send_after(?NextPhaseTime, self(), nextPhaseGo),
	ok.

%%%-------------------------------------------------------------------
kickAll()->
	ML = acWorldBossState:getMapList(),
	lists:foreach(
		fun(#recWorldBossMapInfo{mapPID = MapPid}) ->
			psMgr:sendMsg2PS(MapPid, resetCopyMap, {})
		end, ML),
	ok.

%%%-------------------------------------------------------------------
clear() ->
	acWorldBossState:setState(?ActivityPhase_Close),
	psMgr:sendMsg2PS(?PsNamePlayerMgr, pidMsg2AllOLPlayer, {worldBossState, {0}}),
	case myEts:readRecord(?WorldBossEts, ?WorldBossKey) of
		#recWorldBossInfo{dataID = DataID} when DataID > 0 ->
			ML = acWorldBossState:getMapList(),
			lists:foreach(
				fun(#recWorldBossMapInfo{mapPID = Pid}) ->
					psMgr:sendMsg2PS(Pid, worldBossDie, DataID)
				end, ML);
		_ ->
			skip
	end,
	ok.

%%%-------------------------------------------------------------------
reward(_Reason) ->
	L = sort(),
	N = erlang:length(L),
	#recWorldBossInfo{dataID = BossID} = myEts:readRecord(?WorldBossEts, ?WorldBossKey),
	doReward(L, BossID, 1),

	case N > 0 of
		true ->
			X = misc:rand(1, N),
			#recWorldBossDamage{roleID = RoleID} = lists:nth(X, L),
			doSendReward(RoleID, BossID, bossaward_sp),
			ok;
		_ ->
			skip
	end,
	ok.

doReward([], _BossID, _N) ->
	ok;
doReward([#recWorldBossDamage{roleID = RoleID} | L], BossID, 1) ->
	doSendReward(RoleID, BossID, bossaward1),
	doSendReward(RoleID, BossID, bossaward_normal),
	Txt = stringCfg:getString(cnText4BossTopOneNotice, [getName(RoleID)]),
	core:sendBroadcastNotice({16#ff3030, Txt}),
	doReward(L, BossID, 2);
doReward([#recWorldBossDamage{roleID = RoleID} | L], BossID, N) when N < 11 ->
	doSendReward(RoleID, BossID, bossaward2),
	doSendReward(RoleID, BossID, bossaward_normal),
	doReward(L, BossID, N + 1);
doReward([#recWorldBossDamage{roleID = RoleID} | L], BossID,  N) when N < 21 ->
	doSendReward(RoleID, BossID, bossaward3),
	doSendReward(RoleID, BossID, bossaward_normal),
	doReward(L, BossID, N + 1);
doReward([#recWorldBossDamage{roleID = RoleID} | L], BossID, N) ->
	doSendReward(RoleID, BossID, bossaward_normal),
	doReward(L, BossID, N + 1).

doSendReward(0, _BossID, _Key) ->
	ok;
doSendReward(RoleID, BossID, Key) ->
	case getCfg:getCfgPStack(cfg_worldboss, Key) of
		#worldbossCfg{setpara = L} ->
			case lists:keyfind(BossID, 1, L) of
				{_, ItemID}->
					sendRewardMail(RoleID, ItemID);
				_ ->
					?ERROR_OUT("worldboss[~p] reward[~p] to role[~p] not exist",
						[BossID, Key, RoleID])
			end;
		_ ->
			?ERROR_OUT("worldboss[~p] reward[~p] to role[~p] not exist",
				[BossID, Key, RoleID])
	end,
	ok.

sendRewardMail(PlayerID, PacketID) ->
	?LOG_OUT("worldBossRankAward[~w,~w]", [PlayerID, PacketID]),
	MailContent = stringCfg:getString(worldBossRankAwardMailContent),
	MailTitle = stringCfg:getString(worldBossRankAwardTitle),
	sendMail(PlayerID, MailTitle, MailContent, PacketID, 1, true, ?ItemWorldBossItemEmail),
	ok.

sendMail(ToRoleID, Title, Content, ItemID, ItemNumber, IsBind, Reason) ->
	case playerMail:createMailGoods(ItemID, ItemNumber, IsBind, 0, ToRoleID, Reason) of
		[#recMailItem{} | _] = MailItemList ->
			mail:sendSystemMail(ToRoleID, Title, Content, MailItemList, []);
		_ ->
			?ERROR_OUT("~p, role=~p, item=~p,num=~p, reason=~p",
				[?MODULE, ToRoleID, ItemID, ItemNumber, Reason]),
			skip
	end,
	ok.

%%%-------------------------------------------------------------------
sortInTime(Rec) ->
	NewL =
		case myEts:readRecord(?WorldBossTopEts, ?WorldBossKey) of
			#recWorldBossDamageTop{list = L} ->
				doSort(Rec, L, erlang:length(L));
			_ ->
				[Rec]
		end,
	myEts:insertEts(
		?WorldBossTopEts,
		#recWorldBossDamageTop{key = ?WorldBossKey, list = NewL}
	),
	ok.

doSort(New, [], _N) ->
	[New];
doSort(New, L, N) when N >= ?WorldBossTenLength ->
	[R | L1] = lists:reverse(L),
	case R#recWorldBossDamage.damage >= New#recWorldBossDamage.damage of
		true ->
			L;
		_ ->
			L2 =
				lists:keystore(
					New#recWorldBossDamage.roleID,
					#recWorldBossDamage.roleID,
					L1,
					New
				),
			L3 =
				lists:sort(
					fun(
						#recWorldBossDamage{damage = DA},
						#recWorldBossDamage{damage = DB}
					) ->
						DA > DB
					end, L2),
			lists:sublist(L3, ?WorldBossTenLength)
	end;
doSort(New, L, _N) ->
	L1 =
		lists:keystore(
			New#recWorldBossDamage.roleID,
			#recWorldBossDamage.roleID,
			L,
			New
		),
	lists:sort(
		fun(
			#recWorldBossDamage{damage = DA},
			#recWorldBossDamage{damage = DB}
		) ->
			DA > DB
		end, L1).


sort() ->
	L1 = ets:tab2list(?WorldBossDamageEts),
	lists:sort(
		fun(
			#recWorldBossDamage{damage = DA},
			#recWorldBossDamage{damage = DB}
		) ->
			DA > DB
		end, L1).

getName(RoleID) ->
	case core:queryRoleKeyInfoByRoleID(RoleID) of
		#?RoleKeyRec{roleName = Name} ->
			Name;
		_ ->
			"???"
	end.
