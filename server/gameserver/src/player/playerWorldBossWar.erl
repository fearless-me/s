
%% 首领入侵（又叫世界BOSS）
-module(playerWorldBossWar).
-include("playerPrivate.hrl").
-include("../activity/gameactivity/worldboss/acWorldBossPrivate.hrl").
%%%% ====================================================================
%%%% API functions
%%%% ====================================================================
-export([
	noticeClient/1,
	onLoginRoleCanIn/0,
	tickSecond/0,
	activityFlagSync/1,
	onEnterMap/1
]).
%% 同步tick，只有这里用
-define(WorldBossSyncTick, 5).


onEnterMap(MapID)->
	Phase = activityMgrOtp:getActivityPhase(?ActivityType_GiveIPad),
	case getCfg:getCfgPStack(cfg_mapsetting, MapID) of
		#mapsettingCfg{type = ?MapTypeActivity, subtype = ?MapSubTypeWorldBoss} when Phase =/= ?ActivityPhase_Close ->
			%% 返回场景，添加原层数的鼓舞BUFF
			N1 = playerDaily:getDailyCounter(?DailyType_WorldBossInSpire, ?CoinUseTypeGold),
			N2 = playerDaily:getDailyCounter(?DailyType_WorldBossInSpire, ?CoinUseTypeDiamond),
			case N1 + N2 of
				0 -> skip;
				N ->
					L = lists:seq(1, N),
					[playerBuff:addBuff(?WoldBossInspire, playerState:getLevel()) || _ <- L]
			end,
			skip;
		_ ->
			%% 离开场景删除鼓舞BUFF
			playerBuff:delBuff(?WoldBossInspire)
	end,
	ok.

%%新登录玩家自检
onLoginRoleCanIn() ->
	Flag = openFlag(),
	noticeClient(Flag),
	ok.

activityFlagSync(Flag) ->
	noticeClient(Flag),
	case Flag of
		0 ->
			doTickSecond(true),
			playerBuff:delBuff(?WoldBossInspire);
		_ ->
			skip
	end.

noticeClient(Flag) ->
	noticeClient(playerState:getLevel(), Flag).

%%告诉玩家客户端，可以参加boss战
noticeClient(Level, Flag) when Level >= ?WorldBossNeedMinLevel ->
	Msg = #pk_GS2U_BossBattleState{
		flag = Flag,
		mapID = ?WorldBossMapID
	},
	playerMsg:sendNetMsg(Msg),
	?DEBUG_OUT("noticeClient==Msg=======~w", [Msg]),
	ok;
noticeClient(_Level, _Flag) ->
	skip.

tickSecond() ->
	doTickSecond(false).

doTickSecond(Force) ->
	case playerState:getMapID() of
		?WorldBossMapID ->
			Flag = openFlag(),
			Sync = canSync(Force),
			doSync(Flag, Sync);
		_ ->
			skip
	end.

doSync(Flag, Sync) when Flag =:= 1 orelse Sync ->
	Me = playerState:getRoleID(),
	Damage =
		case myEts:readRecord(?WorldBossDamageEts, Me) of
			#recWorldBossDamage{damage = V} ->
				V;
			_ ->
				0
		end,
	Msg = #pk_UpdataHurtToBoss{
		hurt = Damage
	},
	playerMsg:sendNetMsg(Msg),

	L1 =
		case myEts:readRecord(?WorldBossTopEts, ?WorldBossKey) of
			#recWorldBossDamageTop{list = TL} ->
				TL;
			_ ->
				[]
		end,
	L3 = [#pk_BossRankInfo{name = getName(RoleID), hurt = Damage1} ||
		#recWorldBossDamage{roleID = RoleID, damage = Damage1} <- L1],
	NPos = mePos(Me, L1, 1),
	Msg1 = #pk_GS2U_BossBattleRankResult{curRankNum = NPos, rankList = L3},
	playerMsg:sendNetMsg(Msg1),

	skip;
doSync(_Flag, _Sync) ->
	ok.

canSync(true) ->
	true;
canSync(_) ->
	case get('SyncWBInfo2Me') of
		undefined ->
			put('SyncWBInfo2Me', 1),
			true;
		V ->
			case V + 1 >= ?WorldBossSyncTick of
				true ->
					put('SyncWBInfo2Me', 0),
					true;
				_ ->
					put('SyncWBInfo2Me', V + 1),
					false
			end
	end.


mePos(_Me, [], _N) ->
	0;
mePos(Me, [#recWorldBossDamage{roleID = Me} | _], N) ->
	N;
mePos(Me, [#recWorldBossDamage{} | L], N) ->
	mePos(Me, L, N + 1).

openFlag() ->
	case variant:getGlobalBitVariant(?Setting_GlobalBitVarReadOnly_LeaderBtn) of
		true ->
			case myEts:getCount(?WorldBossEts) > 0 of
				true ->
					1;
				_ ->
					0
			end;
		_ ->
			0
	end.


getName(RoleID) ->
	Me = playerState:getRoleID(),
	case RoleID of
		Me ->
			playerState:getName();
		_ ->
			case core:queryRoleKeyInfoByRoleID(RoleID) of
				#?RoleKeyRec{roleName = Name} ->
					Name;
				_ ->
					"???"
			end
	end.

