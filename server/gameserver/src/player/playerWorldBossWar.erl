%%%% @author zhengzhichun
%%%% @doc @todo Add description to BOSS世界战.
%%
%%
-module(playerWorldBossWar).
-include("playerPrivate.hrl").
-include("../activity/gameactivity/worldboss/acWorldBossPrivate.hrl").
%%%% ====================================================================
%%%% API functions
%%%% ====================================================================
-export([
%%	worldBossWaring/0,
	noticeClient/1,
	onLoginRoleCanIn/0,
	tickSecond/0,
	activityFlagSync/1
%%	worldBossDamageRank/1,
%%	loadworldBossDamage/0,
%%	saveMyworldBossDamage/1,
%%	noticeWillToMainCity/0,
%%	onLeaveWorldBossMap/1,
%%	noticeEnd2OtherMapRole/0
]).
%% 同步tick，只有这里用
-define(WorldBossSyncTick, 5).



%%新登录玩家自检
onLoginRoleCanIn() ->
	Flag = openFlag(),
	noticeClient(Flag),
	ok.

activityFlagSync(Flag) ->
	noticeClient(Flag),
	case Flag of
		0 ->
			doTickSecond(true);
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
	case variant:getGlobalBitVariant(?Setting_GlobalBitVar_WorldBossWar_Running) of
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

%%%%玩家离开BOSS战地图
%%-spec onLeaveWorldBossMap(TargetMapID::integer()) ->ok.
%%onLeaveWorldBossMap(TargetMapID) ->
%%	case TargetMapID of
%%		?WorldBossMapID ->
%%			playerState:setCamp(?CampBlueBattle,true);
%%		_ ->
%%			%%玩家重置为玩家阵营
%%			playerState:setCamp(?CampPlayer,true)
%%	end,
%%	ok.
%%
%%%%Now::time:getUTCNowMS()
%%-spec worldBossWarTick(MapID::integer(),Now::integer()) ->ok|skip.
%%worldBossWarTick(?WorldBossMapID,Now) ->
%%	isEnd(),
%%	towMinuteNotice(Now),
%%	broadcastSelfDamage(Now),
%%	ok;
%%worldBossWarTick(_MapID,Now) ->
%%	towMinuteNotice(Now),
%%	broadcastSelfDamage(Now),
%%	skip.
%%
%%-spec isEnd() ->out|skip.
%%isEnd() ->
%%	BossOn = variant:getGlobalBitVariant(?Setting_GlobalBitVar_WorldBossWar_Running),
%%	GroupID = playerState:getGroupID(),
%%	if
%%		GroupID /= 0 andalso BossOn =:= ?WorldBossTurnOff->
%%			playerCopyMap:leaveCopyMap(),
%%			out;
%%		true ->
%%			skip
%%	end,
%%	if
%%		BossOn =:= ?WorldBossTurnOff->
%%			%%回原位置
%%			{TargetMapID, TargetX, TargetY} = playerState:getOldMapPos(),
%%			playerScene:onRequestEnterMap(TargetMapID, TargetX, TargetY);
%%		true ->
%%			skip
%%	end.
%%-spec noticeEnd2OtherMapRole() ->ok.
%%noticeEnd2OtherMapRole() ->
%%	noticeClient(?WorldBossNeedMinLevel,1),%%活动关闭
%%	playerState:cleanWorldBossAddDamage(),
%%	ok.
%%
%%-spec broadcastSelfDamage(Now::integer()) ->ok.
%%broadcastSelfDamage(Now) ->
%%	BossOn = variant:getGlobalBitVariant(?Setting_GlobalBitVar_WorldBossWar_Running),
%%	case playerState:getDamageBroadcastTickTime() of
%%		Val when BossOn =:= true andalso (Val =:= undefined orelse Now >= Val) ->
%%
%%			playerState:setDamageBroadcastTickTime(Now+1000*5),%%5秒后再tick
%%			Msg = #pk_UpdataHurtToBoss{
%%				hurt =playerState:getWorldBossAddDamage()
%%			},
%%			playerMsg:sendNetMsg(Msg);
%%		_ ->
%%			skip
%%	end,
%%	ok.
%%
%%%%boss战启动后，每2分钟对在线玩家广播一次(改成了3分钟)
%%-spec towMinuteNotice(Now::integer()) ->ok|skip.
%%towMinuteNotice(Now) ->
%%	BossOn = variant:getGlobalBitVariant(?Setting_GlobalBitVar_WorldBossWar_Running),
%%	case playerState:getWorldBossTickTime() of
%%		#playerBossTickTime{noticeTick =Time}= LastTick when
%%			BossOn =:=?WorldBossTurnOn andalso Time =< Now ->
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_CnText4BossDoingNotice),
%%			NextTime = Now+1000*60*3,%%3分钟后
%%			playerState:setWorldBossTickTime(LastTick#playerBossTickTime{noticeTick=NextTime}),
%%			ok;
%%		_ ->
%%			skip
%%	end.
%%
%%%%公告给玩家1分钟后切到主城
%%-spec noticeWillToMainCity() ->ok.
%%noticeWillToMainCity() ->
%%	?DEBUG_OUT("noticeWillToMainCity[~w]",[playerState:getMapID()]),
%%	case playerState:getMapID() of
%%		?WorldBossMapID ->
%%			playerMsg:sendErrorCodeMsg(?ErrorCode_CnText4BossEndNotice);
%%		_ ->
%%			skip
%%	end,
%%	%%跳过3分钟公告，新活动要开起
%%	Next = time:getUTCNowMS()+1000*60*6,
%%	playerState:setWorldBossTickTime(#playerBossTickTime{noticeTick=Next}),
%%	ok.
%%
%%%%boss战开启中...(gsCSOtp中调用)
%%%%1：在配置表中加个标志，方便新登录的
%%%%2：广播给正在游戏中的玩家
%%worldBossWaring() ->
%%	core:setGlobalBitVariant(?Setting_GlobalBitVar_WorldBossWar_Running, 1), %% ?WorldBossTurnOn <=> 1
%%	psMgr:sendMsg2PS(?PsNamePlayerMgr, pidMsg2AllOLPlayer, {worldBossWarIng, {} }),
%%
%%	ok.
%%

%%
%%%%请求保存我的伤害值（我要offline了）
%%-spec saveMyworldBossDamage(WorldBossRunningState::boolean()) -> ok.
%%saveMyworldBossDamage(?WorldBossTurnOn) ->
%%	PlayerID = playerState:getRoleID(),
%%	Damage = playerState:getWorldBossAddDamage(),
%%	?LOG_OUT("=======saveDamage~w[~w]",[PlayerID,Damage]),
%%	playerVariant:setPlayerVariant(?Setting_PlayerVarReadOnly_WorldBossDamage, Damage),
%%	playerVariant:setPlayerVariant(?Setting_PlayerVarReadOnly_WorldBossDamage_ExpireDateTime, time:getUTCNowSec()+3600*3),
%%	ok;
%%saveMyworldBossDamage(_WorldBossRunningState) ->
%%	ok.
%%
%%%%boss战伤害值下线后的处理
%%-spec loadworldBossDamage() ->ok.
%%loadworldBossDamage() ->
%%	BossOn = variant:getGlobalBitVariant(?Setting_GlobalBitVar_WorldBossWar_Running),
%%	Damage = variant:getPlayerVariant(playerState:getRoleID(), ?Setting_PlayerVarReadOnly_WorldBossDamage),
%%	Expire = variant:getPlayerVariant(playerState:getRoleID(), ?Setting_PlayerVarReadOnly_WorldBossDamage_ExpireDateTime),
%%	Can = Expire - time:getUTCNowSec(),
%%	if
%%		Can > 0 andalso Damage > 0 andalso BossOn =:= true ->
%%			playerState:addWorldBossAddDamage(Damage),
%%			%%把自己的伤害发给cs窗口进程缓存
%%			psMgr:sendMsg2PS(?PsNameWorldBOss, bossDamageCacheReset,{playerState:getRoleID(), Damage,playerState:getName()});
%%		true ->
%%			playerVariant:setPlayerVariant(?Setting_PlayerVarReadOnly_WorldBossDamage, 0),
%%			playerVariant:setPlayerVariant(?Setting_PlayerVarReadOnly_WorldBossDamage_ExpireDateTime,0),
%%			skip
%%	end,
%%	PlayerID = playerState:getRoleID(),
%%	?LOG_OUT("=====~w--initDamage[~w]canUse[~w]",[PlayerID,Damage,Can]),
%%	ok.
%%
%%
%%%%在玩家进程中计算我是否在榜中
%%-spec worldBossDamageRank([Rank::#recPlayerDamageEts{}]) ->ok.
%%worldBossDamageRank(RankList) ->
%%
%%	PlayerID = playerState:getRoleID(),
%%
%%	{HighRank,LowRank} =
%%		case erlang:length(RankList) of
%%			L when L > 10->
%%				{HighRank1,LowRank1} = lists:split(10, RankList),
%%				{HighRank1,LowRank1};
%%			_ ->
%%				{RankList,undefined}
%%		end,
%%	%%前10排行榜和看自己是不是前10
%%	TopTen =
%%		lists:foldl(fun
%%						(#recPlayerDamageEts{damage=Damage,roleName=RoleName,playerID=FunPlayerID},Acc) ->
%%							calcRankNum(PlayerID,FunPlayerID),
%%							RealRoleName =
%%								if
%%									erlang:is_list(RoleName) ->
%%										RoleName;
%%									true ->
%%										"未知角色名"
%%								end,
%%							[#pk_BossRankInfo{name=RealRoleName, hurt=Damage } |Acc];
%%						(_,Acc) ->
%%							Acc
%%					end, [], HighRank),
%%	DescTopTen = lists:reverse(TopTen),
%%	%%看自己是不是前10，否则看是否是前20
%%	SelfTopNum =
%%		case calcRankNum(PlayerID,undefined) of
%%			{ok,CurrVal} ->
%%				CurrVal;
%%			{no,_CurrVal} when erlang:is_list(LowRank)->
%%				misc:mapList(LowRank, fun
%%										  (#recPlayerDamageEts{playerID=LowFunPlayerID}) when LowFunPlayerID =:= PlayerID->
%%											  calcRankNum(PlayerID,LowFunPlayerID),
%%											  break;
%%										  (_) ->
%%											  skip
%%									  end
%%				),
%%
%%				case calcRankNum(PlayerID,undefined) of
%%					{ok,CurrVal2} ->
%%						CurrVal2;
%%					_ ->
%%						0
%%				end;
%%			_ ->
%%				0
%%		end,
%%	NetPid = playerState:getNetPid(),
%%	case NetPid of
%%		undefined ->
%%			skip;
%%		_ ->
%%			Msg = #pk_GS2U_BossBattleRankResult{curRankNum=SelfTopNum, rankList=DescTopTen },
%%
%%			NetPidAlive = misc:is_process_alive(NetPid),
%%			if
%%				NetPidAlive =:= true ->
%%					playerMsg:sendNetMsg(Msg);
%%				true ->
%%					skip
%%			end
%%	end,
%%	playerState:cleanDictWorldBossDamageRank(),
%%	ok.
%%
%%-spec calcRankNum(MeID,ArgID) ->{ok|no,Num} when MeID::integer(),ArgID::integer()|undefined,Num::integer().
%%calcRankNum(MeID,ArgID) ->
%%	{Stat1,CurrVal} =
%%		case playerState:getDictWorldBossDamageRank() of
%%			undefined ->
%%				{no,0};
%%			{Stat,Val} ->
%%				{Stat,Val}
%%		end,
%%	NowVal =
%%		if
%%			MeID =:= ArgID andalso Stat1 =/= ok->
%%				{ok,CurrVal+1};
%%			MeID =/= ArgID andalso Stat1 =/= ok->
%%				{no,CurrVal+1};
%%			true ->
%%				{ok,CurrVal}
%%		end,
%%	playerState:setDictWorldBossDamageRank(NowVal).
%%%% ====================================================================
%%%% Internal functions
%%%% ====================================================================
%%
%%
