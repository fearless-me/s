%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, 好玩一二三
%%% @doc
%%% 活动逻辑模块
%%% @end
%%% Created : 06. 二月 2015 14:32
%%%-------------------------------------------------------------------
-module(acGuildwarLogic).
-author("tiancheng").

-include("../../activityPrivate.hrl").
-include("../activityPhaseDefine.hrl").
-include("acGuildwarPrivate.hrl").

%% API
-export([
	activityChangeCallBack/1,
	activityMapMsg/2
]).

-export([
	createActivityMapAck/1,
	guildWarTick/0,
	playerDead/1,
	playerEnterMapReal/1,
	guildWarEndKickPlayer/1,
	guildWarGatherSuccess/1,
	initPebbleDataInfo/1
]).

%% 主活动模块进程回调
-spec activityChangeCallBack(Phase::uint()) -> ok.
activityChangeCallBack(?ActivityPhase_Close) ->
	case acGuildwarState:getGuildWarState() of
		true ->
			acGuildwarState:setGuildWarState(false),

			% 决赛发奖，记录产生时间，通知CS保存数据
			guildWarEnd(?GuildWar_JS),

			%% 决赛结束(三分钟后踢人，清理数据)
			erlang:send_after(180000, self(), {guildWarEndKickPlayer, ?GuildWar_JS});
		_ ->
			skip
	end,
	ok;
activityChangeCallBack(?ActivityType_GuildWar_1) ->
	%% 什么也不做
	ok;
activityChangeCallBack(?ActivityType_GuildWar_2) ->
	% 创建比赛地图
	createGuildWarMap(?GuildWar_CS),

	% 设置准备时间
	setWaitTime(?ActivityType_GuildWar_2),

	% 初赛准备公告
	Content = stringCfg:getString(guildWarPrepareStart),
	activityCommon:sendBroadcastNotice(Content),

	acGuildwarState:setGuildWarState(true),

	%% 创建比赛心跳
	erlang:send_after(?GuildWarTick, self(), guildWarTick),
	ok;
activityChangeCallBack(?ActivityType_GuildWar_3) ->
	% 初赛正式开始，设置战斗时间
	setWaitTime(?ActivityType_GuildWar_3),

	% 通知当前地图的玩家，打开空气墙
	guildWarStart(?GuildWar_CS),
	ok;
activityChangeCallBack(?ActivityType_GuildWar_4) ->
	% 初赛发奖，记录产生时间
	guildWarEnd(?GuildWar_CS),

	% 生成决赛对战列表
	createJSBattle(),

	% 设置准备时间
	setWaitTime(?ActivityType_GuildWar_4),

	% 创建决赛地图
	createGuildWarMap(?GuildWar_JS),

	% 初赛结束(三分钟后踢人，同时，提示决赛准备)
	Content = stringCfg:getString(guildWarPrepareStartFinal),
	activityCommon:sendBroadcastNotice(Content),

	erlang:send_after(180000, self(), {guildWarEndKickPlayer, ?GuildWar_CS}),
	ok;
activityChangeCallBack(?ActivityType_GuildWar_5) ->
	%% 设置战斗时间
	setWaitTime(?ActivityType_GuildWar_3),

	% 决赛正式开始
	% 通知当前地图的玩家，打开空气墙
	guildWarStart(?GuildWar_JS),
	ok;
activityChangeCallBack(Phase) ->
	?ERROR_OUT("~p ~p activityChangeCallBack:~p", [?MODULE, self(), Phase]),
	ok.

%% 活动地图的消息
-spec activityMapMsg(MsgType::uint(), Data::term()) -> ok.
activityMapMsg(?ACMapMsg_CreateMap, {_CreateRoleID,_MapID,MapPid,PlayerEts,MonsterEts,CollectEts,_NpcEts} = Data) ->
	L = acGuildwarState:getGuildWarMapList(),
	case lists:keyfind(MapPid, #recGuildWar.mapPid, L) of
		#recGuildWar{} = War ->
			NWar = War#recGuildWar{playerEts = PlayerEts, monsterEts = MonsterEts, collectEts = CollectEts},
			NL = lists:keystore(MapPid, #recGuildWar.mapPid, L, NWar),
			acGuildwarState:setGuildWarMapList(NL);
		_ ->
			acGuildwarState:addMapEtsCache(Data)
	end,
	ok;
activityMapMsg(?ACMapMsg_DestoryMap, MapPid) ->
	L = acGuildwarState:getGuildWarMapList(),
	case lists:keyfind(MapPid, #recGuildWar.mapPid, L) of
		#recGuildWar{isEnd = false} = War ->
			?LOG_OUT("~p ACMapMsg_DestoryMap:~p, ~p", [?MODULE, MapPid, War]),
			guildWarEnd2(War, true),
			ok;
		_ ->
			skip
	end,
	ok;
activityMapMsg(?ACMapMsg_HurtMonster, {_MapID, MapPID, AttackRoleID, MonsterCode, MonsterID, Damage} = Data) ->
%% 	?DEBUG_OUT("~p hurtmonster:~p", [?MODULE, Data]),
	L = acGuildwarState:getGuildWarMapList(),
	case lists:keyfind(MapPID, #recGuildWar.mapPid, L) of
		#recGuildWar{isEnd = false, pebbleState = PS, enterPlayerList = EP, monsterEts = MEts} = War ->
			case lists:keyfind(MonsterID, #recPebble.monsterID, PS) of
				#recPebble{monsterCode = Code, guilds = Guilds} = Pebble ->
					case MonsterCode /= Code of
						true -> ?LOG_OUT("~p hurtmonster change code:~p,~p,~p", [?MODULE, Data, War#recGuildWar.key, PS]);
						_ -> skip
					end,
					Pebble1 = Pebble#recPebble{monsterCode = MonsterCode, deadTime = 0},
					case lists:keyfind(AttackRoleID, #recPlayer.roleID, EP) of
						#recPlayer{guildID = GuildID} ->
							Guild1 =
								case lists:keyfind(GuildID, 1, Guilds) of
									{_, Hu} -> {GuildID, Hu + 1};
									_ -> {GuildID, 1}
								end,
							Guilds1 = lists:keystore(GuildID, 1, Guilds, Guild1),
							Pebble2 =
								case myEts:lookUpEts(MEts, MonsterCode) of
									[#recMapObject{hp = HP, maxHp = MHP}] ->
										?LOG_OUT("~p hurtmonster:monstercode=~p,monsterid=~p,attackid=~p,Damage=~p,curhp=~p,maxhp=~p,pebblestate=~p",
											[?MODULE, MonsterCode, MonsterID, AttackRoleID, Damage, erlang:trunc(HP), erlang:trunc(MHP), PS]),
										Pebble1#recPebble{curHp = erlang:trunc(HP), maxHp = erlang:trunc(MHP), guilds = Guilds1};
									_ ->
										?LOG_OUT("~p hurtmonster not find:monstercode=~p,monsterid=~p,attackid=~p,Damage=~p,pebblestate=~p",
											[?MODULE, MonsterCode, MonsterID, AttackRoleID, Damage, PS]),
										Pebble1#recPebble{guilds = Guilds1}
								end,
							NPS = lists:keystore(MonsterID, #recPebble.monsterID, PS, Pebble2),

							NWar = War#recGuildWar{pebbleState = NPS},
							acGuildwarState:saveGuildWarMap(NWar),
							ok;
						_ ->
							?ERROR_OUT("~p ACMapMsg_HurtMonster:AttackRoleID=~p, EP=~p, War=~p, Data=~p",
								[?MODULE, AttackRoleID, EP, War, Data]),
							skip
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok;
activityMapMsg(?ACMapMsg_KillMonster, {_MapID, MapPID, AttackRoleID, MonsterCode, MonsterID} = Data) ->
%% 	?DEBUG_OUT("~p killmonster:~p", [?MODULE, Data]),
	L = acGuildwarState:getGuildWarMapList(),
	case lists:keyfind(MapPID, #recGuildWar.mapPid, L) of
		#recGuildWar{isEnd = false, pebbleState = PS, enterPlayerList = EP, guilds = Guilds} = War ->
			case lists:keyfind(MonsterID, #recPebble.monsterID, PS) of
				#recPebble{monsterCode = Code, guilds = HurtTimes} = Pebble ->
					case MonsterCode /= Code of
						true -> ?LOG_OUT("~p killmonster:~p,~p,~p", [?MODULE, Data, War#recGuildWar.key, PS]);
						_ -> skip
					end,
					Pebble1 = Pebble#recPebble{monsterCode = MonsterCode},

					NNHList =
						case lists:keyfind(AttackRoleID, #recPlayer.roleID, EP) of
							#recPlayer{guildID = AttackGuildID} ->
								NewHurtTimes =
									case lists:keyfind(AttackGuildID, 1, HurtTimes) of
										{_, Hu} -> {AttackGuildID, Hu + 1};
										_ -> {AttackGuildID, 1}
									end,
								lists:keystore(AttackGuildID, 1, HurtTimes, NewHurtTimes);
							_ ->
								?ERROR_OUT("~p ACMapMsg_KillMonster:AttackRoleID=~p, EP=~p, War=~p, Data=~p",
									[?MODULE, AttackRoleID, EP, War, Data]),
								HurtTimes
						end,

					% 统计哪个军团造成的伤害最大
					FS =
						fun({G1, Hu1}, {G2, Hu2}) ->
							if
								Hu1 > Hu2 -> true;
								Hu1 =:= Hu2 andalso G1 < G2 -> true;
								true -> false
							end
						end,
					[{GID, _HT}|_] = lists:sort(FS, NNHList),

					?LOG_OUT("~p hurtmonster:monstercode=~p,monsterid=~p,attackid=~p,pebblestate=~p,winguild=~p",
						[?MODULE, MonsterCode, MonsterID, AttackRoleID, PS, GID]),

					Guild = #recGuildID{pebbleNumber = PNum} = lists:keyfind(GID, #recGuildID.guildID, Guilds),
					NewGuilds = lists:keystore(GID, #recGuildID.guildID, Guilds, Guild#recGuildID{pebbleNumber = PNum + 1}),

					Pebble2 = Pebble1#recPebble{curHp = 0, guilds = [], deadTime = time:getSyncTime1970FromDBS()},
					NewPS = lists:keystore(MonsterID, #recPebble.monsterID, PS, Pebble2),
					NWar = War#recGuildWar{pebbleState = NewPS, guilds = NewGuilds},
					acGuildwarState:saveGuildWarMap(NWar),
					ok;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok;
activityMapMsg(MsgType, Data) ->
	?DEBUG_OUT("~p unknow:~p,~p", [?MODULE, MsgType, Data]),
	ok.

clearData() ->
	?LOG_OUT("clearData..."),
	acGuildwarState:delGuildWarMapList(),
	acGuildwarState:delMapEtsCache(),
	ets:delete_all_objects(recGuildWarPlayer),
	ok.

guildWarEndKickPlayer(Phase) ->
	L = acGuildwarState:getGuildWarMapListStage(Phase),
	[psMgr:sendMsg2PS(MapPID, resetCopyMap, {}) || #recGuildWar{mapPid = MapPID} <- L],

	case Phase of
		?GuildWar_JS ->
			clearData();
		_ ->
			skip
	end,
	ok.

guildWarGatherSuccess({MapPID, RoleID, NetPID, CannonCode, TargetGuildID}) ->
	L = acGuildwarState:getGuildWarMapList(),
	case lists:keyfind(MapPID, #recGuildWar.mapPid, L) of
		#recGuildWar{isEnd = false, cannonState = CS, enterPlayerList = EP, guilds = Guilds, playerEts = PEts} = War ->
			case lists:keyfind(CannonCode, #recCannon.collectCode, CS) of
				#recCannon{useTime = UTime, useCD = UseCD} = Cannon ->
					NowTime = time:getSyncTime1970FromDBS(),
					case NowTime - UTime >= UseCD of
						true ->
							case lists:keyfind(RoleID, #recPlayer.roleID, EP) of
								#recPlayer{guildID = GuildID, roleName = RoleName} ->
									case lists:keyfind(GuildID, #recGuildID.guildID, Guilds) of
										#recGuildID{cannonNumber = CN} = Guild ->
											case GuildID /= TargetGuildID andalso lists:keymember(TargetGuildID, #recGuildID.guildID, Guilds) of
												true ->
													NewGuilds = lists:keystore(GuildID, #recGuildID.guildID, Guilds, Guild#recGuildID{cannonNumber = CN + 1}),
													NewCS = lists:keystore(CannonCode, #recCannon.collectCode, CS, Cannon#recCannon{useTime = NowTime}),
													NewWar = War#recGuildWar{cannonState = NewCS, guilds = NewGuilds},
													acGuildwarState:saveGuildWarMap(NewWar),

													%% 使用成功
													Content2 = stringCfg:getString(guildWarCollectMonester),
													Msg2 = playerMsg:getErrorCodeMsg(?ErrorCode_GuildWar_UseCannonSuccess, [Content2]),
													gsSendMsg:sendNetMsg(NetPID, Msg2),

													%% 大炮击中
													case filterTargetPlayer(TargetGuildID, PEts) of
														[] ->
															skip;
														TList ->
%%															Len = erlang:length(TList),

															%% 先给攻击者加上杀人数据
															playerDead2({MapPID, 0, RoleID, []}),

															F =
																fun(#recMapObject{pid = Pid, name = Name}, AccName) ->
																	psMgr:sendMsg2PS(Pid, guildWarCannonHit, Content2),
																	case AccName of
																		"" -> Name;
																		_ -> io_lib:format("~ts,~ts", [AccName, Name])
																	end
																end,
															NameStr = lists:foldl(F, "", TList),
															Content3 = stringCfg:getString(guildWarStartDaPao, [RoleName, NameStr]),
															activityCommon:sendBroadcastNotice(Content3),
															ok
													end,

													ok;
												_ ->
													skip
											end;
										_ ->
											skip
									end;
								_ ->
									skip
							end;
						_ ->
							Content1 = stringCfg:getString(guildWarCollectMonester),
							Msg1 = playerMsg:getErrorCodeMsg(?ErrorCode_GuildWar_CannonInCD, [Content1]),
							gsSendMsg:sendNetMsg(NetPID, Msg1)
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

filterTargetPlayer(TargetGuildID, PlayerEts) ->
	MatchSpec = ets:fun2ms(fun(Object) when Object#recMapObject.guild =:= TargetGuildID -> Object end),
	case myEts:selectEts(PlayerEts, MatchSpec) of
		[#recMapObject{}|_] = List ->
			#globalsetupCfg{setpara = [Min, Max]} = getCfg:getCfgPStack(cfg_globalsetup, cannon_kill),
			Number = misc:rand(Min, Max),
			getRankPlayer(Number, List, []);
		_ ->
			[]
	end.
getRankPlayer(0, _List, RetL) -> RetL;
getRankPlayer(_, [], RetL) -> RetL;
getRankPlayer(Number, List, RetL) ->
	Len = erlang:length(List),
	Index = misc:rand(1, Len),
	Player = lists:nth(Index, List),
	getRankPlayer(Number - 1, lists:delete(Player, List), [Player | RetL]).

playerEnterMapReal({MapPID, GuildID, RoleID, RoleName, NetPID}) ->
	L = acGuildwarState:getGuildWarMapList(),
	case lists:keyfind(MapPID, #recGuildWar.mapPid, L) of
		#recGuildWar{guilds = Guilds, enterPlayerList = EP} = War ->
			case lists:keyfind(GuildID, #recGuildID.guildID, Guilds) of
				#recGuildID{} ->
					Player =
						case lists:keyfind(RoleID, #recPlayer.roleID, EP) of
							#recPlayer{} = OldPlayer ->
								OldPlayer;
							_ ->
								#recPlayer{
									guildID = GuildID,
									roleID = RoleID,
									roleName = RoleName
								}
						end,
					NEP = lists:keystore(RoleID, #recPlayer.roleID, EP, Player),
					NWar = War#recGuildWar{enterPlayerList = NEP},
					acGuildwarState:saveGuildWarMap(NWar),
					playerEnterGuildWar(NWar, RoleID, NetPID);
				_ ->
					?ERROR_OUT("playerEnterMapReal:not you guild mapPID=~p, guildID=~p, roleID=~p, Name=~ts, L=~p",
						[MapPID, GuildID, RoleID, RoleName, L])
			end;
		_ ->
			?ERROR_OUT("playerEnterMapReal:mapPID=~p, guildID=~p, roleID=~p, Name=~ts, L=~p",
				[MapPID, GuildID, RoleID, RoleName, L])
	end,
	ok.
playerEnterGuildWar(#recGuildWar{guilds = Guilds, startTime = STime} = War, RoleID, NetPID) ->
	F =
		fun(#recGuildID{guildID = GuildID}) ->
			#pk_GuildIDList{guildID = GuildID, guildName = playerGuildWar:getGuildName(GuildID)}
		end,
	GS = lists:map(F, Guilds),
	gsSendMsg:sendNetMsg(NetPID, #pk_GS2U_GuildIDList{list = GS}),

	Phase = getGuildWarPhase(),
	if
		Phase =:= ?ActivityType_GuildWar_2 orelse Phase =:= ?ActivityType_GuildWar_4 ->
			%% 准备阶段
			NowTime = time:getSyncTime1970FromDBS(),
			CXTime = acGuildwarState:getWaitStartTime(),
			Time = erlang:max(0, CXTime - (NowTime - STime)),
			Msg = #pk_GS2U_GuildWarData{
				ranks = [],
				pebbles = [],
				cannons = [],
				syTime = Time
			},
			gsSendMsg:sendNetMsg(NetPID, Msg),
			ok;
		Phase =:= ?ActivityType_GuildWar_3 orelse Phase =:= ?ActivityType_GuildWar_5 ->
			%% 先打开空气墙
			gsSendMsg:sendNetMsg(NetPID, ?BlockIDMsg),

			%% 同步战斗数据
			Msg2 = getGuildWarTickMsg(War),
			Msg3 = getRealMsg(Msg2, RoleID),
			gsSendMsg:sendNetMsg(NetPID, Msg3),
			ok;
		true ->
			skip
	end,
	ok.

playerDead(Data) ->
	case getGuildWarPhase() of
		?ActivityType_GuildWar_3 -> playerDead2(Data);
		?ActivityType_GuildWar_5 -> playerDead2(Data);
		_ -> skip
	end,
	ok.
playerDead2({MapPID, DeadRoleID, 0, _HateRoleList} = Data) ->
	L = acGuildwarState:getGuildWarMapList(),
	case lists:keyfind(MapPID, #recGuildWar.mapPid, L) of
		#recGuildWar{enterPlayerList = EP} = War ->
			case lists:keyfind(DeadRoleID, #recPlayer.roleID, EP) of
				#recPlayer{lxKill = 0} ->
					skip;
				#recPlayer{} = Player ->
					NEP = lists:keystore(DeadRoleID, #recPlayer.roleID, EP, Player#recPlayer{lxKill = 0}),
					NWar = War#recGuildWar{enterPlayerList = NEP},
					acGuildwarState:saveGuildWarMap(NWar),
					ok;
				_ ->
					?ERROR_OUT("playerDead2:Data:~p, War=~p", [Data, War])
			end;
		_ ->
			skip
	end,
	ok;
playerDead2({MapPID, DeadRoleID, AttackRoleID, HateRoleList} = Data) ->
	L = acGuildwarState:getGuildWarMapList(),
	case lists:keyfind(MapPID, #recGuildWar.mapPid, L) of
		#recGuildWar{enterPlayerList = EP} = War ->
			{IsAttack, War2} =
				case DeadRoleID =:= 0 of
					false ->
						case lists:keyfind(DeadRoleID, #recPlayer.roleID, EP) of
							#recPlayer{lxKill = 0} ->
								{true, War};
							#recPlayer{} = Player ->
								NEP = lists:keystore(DeadRoleID, #recPlayer.roleID, EP, Player#recPlayer{lxKill = 0}),
								NWar = War#recGuildWar{enterPlayerList = NEP},
								acGuildwarState:saveGuildWarMap(NWar),
								{true, NWar};
							_ ->
								?ERROR_OUT("playerDead2:Data:~p, War=~p", [Data, War]),
								{false, War}
						end;
					_ ->
						{true, War}
				end,

			#recGuildWar{enterPlayerList = EP2} = War2,
			case IsAttack of
				true ->
					case lists:keyfind(AttackRoleID, #recPlayer.roleID, EP2) of
						#recPlayer{killPlayer = KP, roleName = Name, lxKill = LK} = Player2 ->
							NLK = LK + 1,
							NEP2 = lists:keystore(AttackRoleID, #recPlayer.roleID, EP2, Player2#recPlayer{lxKill = NLK, killPlayer = KP + 1}),

							%% 处理助攻
							F =
								fun(RoleID, AccEP) ->
									case lists:keyfind(RoleID, #recPlayer.roleID, AccEP) of
										#recPlayer{secondAttack = SA} = P ->
											lists:keystore(RoleID, #recPlayer.roleID, AccEP, P#recPlayer{secondAttack = SA + 1});
										_ ->
											AccEP
									end
								end,
							NewEP = lists:foldl(F, NEP2, HateRoleList),
							NWar2 = War2#recGuildWar{enterPlayerList = NewEP},
							acGuildwarState:saveGuildWarMap(NWar2),

							%% 广播连杀
							broadCastLXKill(NLK, Name, NWar2),
							ok;
						_ ->
							?ERROR_OUT("playerDead2:Data:~p, War=~p, no find attacker", [Data, War])
					end;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

broadCastLXKill(Number, Name, #recGuildWar{}) ->
	#globalsetupCfg{setpara = LXKillList} = getCfg:getCfgPStack(cfg_globalsetup, league_kill),
	CanBro =
		case lists:member(Number, LXKillList) of
			true ->
				true;
			_ ->
				Max = lists:max(LXKillList),
				Number > Max
		end,
	case CanBro of
		true ->
			Content = stringCfg:getString(guildWarKillPlayer30, [Name, Number]),
			activityCommon:sendBroadcastNotice(Content),
			ok;
		_ ->
			skip
	end,
	ok.

guildWarTick() ->
	case acGuildwarState:getGuildWarState() of
		true ->
			%% 继续心跳
			erlang:send_after(?GuildWarTick, self(), guildWarTick),

			ActivityPhase = getGuildWarPhase(),
			ModulePhase =
				case ActivityPhase of
					?ActivityType_GuildWar_2 -> ?GuildWar_CS;
					?ActivityType_GuildWar_3 -> ?GuildWar_CS;
					?ActivityType_GuildWar_4 -> ?GuildWar_JS;
					?ActivityType_GuildWar_5 -> ?GuildWar_JS;
					_ -> 0
				end,
			guildWarTick2(ModulePhase);
		_ ->
			skip
	end,
	ok.
guildWarTick2(0) -> ok;
guildWarTick2(ModulePhase) ->
	L = acGuildwarState:getGuildWarMapListStage(ModulePhase),
	guildWarTick3(L).
guildWarTick3([]) -> ok;
guildWarTick3(#recGuildWar{isEnd = true}) ->
	ok;
guildWarTick3(#recGuildWar{monsterEts = MEts, pebbleState = PebbleState} = War) ->
	%% 先刷新水晶状态
	F =
		fun(#recPebble{monsterID = MonsterID} = Pebble) ->
			MatchSpec = ets:fun2ms(fun(Object) when Object#recMapObject.id =:= MonsterID -> Object end),
			case myEts:selectEts(MEts,MatchSpec) of
				[#recMapObject{code = C, hp = H1, maxHp = H2}|_] ->
					Pebble#recPebble{monsterCode = C, curHp = erlang:trunc(H1), maxHp = erlang:trunc(H2), deadTime = 0};
				_ ->
					Pebble
			end
		end,
	case lists:map(F, PebbleState) of
		PebbleState ->
			skip;
		NewPebbleState ->
			%% 有改变，要保存
			NWar = War#recGuildWar{pebbleState = NewPebbleState},
			acGuildwarState:saveGuildWarMap(NWar),
			ok
	end,

	%% 再广播给客户端
	Msg = getGuildWarTickMsg(War),
	sendMsgToScene(War, Msg),
	ok;
guildWarTick3([#recGuildWar{} = War | Right]) ->
	guildWarTick3(War),
	guildWarTick3(Right).

getGuildWarTickMsg(#recGuildWar{enterPlayerList = EnterL, pebbleState = PS, cannonState = CS, startTime = STime}) ->
	%% 击杀排行榜
	FSort =
		fun(#recPlayer{killPlayer = K1, secondAttack = S1, roleID = R1}, #recPlayer{killPlayer = K2, secondAttack = S2, roleID = R2}) ->
			if
				K1 > K2 -> true;
				K1 =:= K2 andalso S1 > S2 -> true;
				K1 =:= K2 andalso S1 =:= S2 andalso R1 < R2 -> true;
				true -> false
			end
		end,
	EnterL2 = lists:sort(FSort, EnterL),
	F1 =
		fun(#recPlayer{roleID = RID, roleName = RName, killPlayer = KP, secondAttack = SA}, {Rank, Acc}) ->
			R = #pk_GuildWarRank{
				rank = Rank,
				roleID = RID,
				roleName = RName,
				killPlayer = KP,
				secondAttack = SA
			},
			{Rank + 1, [R | Acc]}
		end,
	{_, EnterL4} = lists:foldl(F1, {1, []}, EnterL2),

	%% 水晶状态
	NowTime = time:getSyncTime1970FromDBS(),
	F2 =
		fun(#recPebble{monsterID = MID, curHp = CHp, maxHp = MHp, deadTime = Dead, reviveCD = CD}) ->
			ResetTime =
				case Dead =< 0 of
					true -> 0;
					_ ->
						Diff = NowTime - Dead,
						erlang:max(0, CD - Diff)
				end,
			#pk_PebbleState{
				monsterID = MID,
				curHP = CHp,
				maxHP = erlang:trunc(MHp),
				resetTime = ResetTime
			}
		end,
	PebbleL = lists:map(F2, PS),

	%% 大炮状态
	F3 =
		fun(#recCannon{collectCode = Code, useTime = Use, useCD = CannonCD}) ->
			RstTime = erlang:max(0, CannonCD - (NowTime - Use)),
			#pk_CannonState{
				collectID = Code,
				resetTime = RstTime
			}
		end,
	CannonL = lists:map(F3, CS),

	CXTime = acGuildwarState:getWaitStartTime(),
	Time = erlang:max(0, CXTime - (NowTime - STime)),

	#pk_GS2U_GuildWarData{ranks = lists:reverse(EnterL4), pebbles = PebbleL, cannons = CannonL, syTime = Time}.

getRealMsg(#pk_GS2U_GuildWarData{ranks = Ranks} = Msg, RoleID) ->
	case lists:keyfind(RoleID, #pk_GuildWarRank.roleID, Ranks) of
		#pk_GuildWarRank{rank = Rank} when Rank =< ?KillRankNumber ->
			Msg;
		#pk_GuildWarRank{rank = Rank} = GR when Rank > ?KillRankNumber ->
			L1 = lists:sublist(Ranks, ?KillRankNumber),
			L2 = lists:append(L1, [GR]),
			Msg#pk_GS2U_GuildWarData{ranks = L2};
		_ ->
			L = lists:sublist(Ranks, ?KillRankNumber),
			Msg#pk_GS2U_GuildWarData{ranks = L}
	end;
getRealMsg(Msg, _RoleID) ->
	Msg.

createGuildWarMap(Stage) ->
	L1 = edb:readAllRecord(rec_guild_war),
	L2 = [Rec || Rec = #rec_guild_war{stage = {S, _}} <- L1, S =:= Stage],
	case erlang:length(L2) of
		0 ->
			?LOG_OUT("createGuildWarMap no guild apply:~p", [Stage]),
			skip;
		Len ->
			core:sendMsgToMapMgr(?GuildWarMapID, createActivityMap, {?GuildWarMapID, Len, Stage})
	end,
	ok.

createActivityMapAck({_MapID, MPidList, Stage} = Data) ->
	NowTime = time:getSyncTime1970FromDBS(),
	L1 = edb:readAllRecord(rec_guild_war),
	L2 = [Rec || Rec = #rec_guild_war{stage = {S, _}} <- L1, S =:= Stage],
	case erlang:length(L2) =:= erlang:length(MPidList) of
		true ->
			F =
				fun(Index) ->
					%% 取数据
					#rec_guild_war{stage = {S, G} = ST, group = G, guildID1 = G1, guildID2 = G2, guildID3 = G3} = lists:nth(Index, L2),
					MapPID = lists:nth(Index, MPidList),

					#globalsetupCfg{setpara = BornL} = getCfg:getCfgPStack(cfg_globalsetup, league_reborn),
					FBorn =
						fun(GGGGGG, {AccGL, [{XX, YY} = XY|_] = BL} = ACC) ->
							case GGGGGG > 0 of
								true ->
									{[#recGuildID{guildID = GGGGGG, bornPos = {erlang:float(XX), erlang:float(YY)}} | AccGL], lists:delete(XY, BL)};
								_ ->
									ACC
							end
						end,
					{LG, _} = lists:foldl(FBorn, {[], BornL}, [G1, G2, G3]),

					Rec = #recGuildWar{
						stage = S,
						group = G,
						key = ST,    % key:{stage,group}
						mapPid = MapPID,
						playerEts = undefined,
						monsterEts = undefined,
						collectEts = undefined,
						startTime = NowTime,
						enterPlayerList = [], % [#recPlayer{},...] 进入的玩家列表
						pebbleState = [],    % [#recPebble{},...]   水晶状态
						cannonState = [],  % [#recCannon{},...] 大炮可使用的CD
						guilds = LG    % [#recGuildID{},...]   本地图包含的军团比赛列表
					},

					#globalsetupCfg{setpara = [ReviveCD]} = getCfg:getCfgPStack(cfg_globalsetup, resurrection),
					FE =
						fun(#recGuildID{guildID = GGG, bornPos = BPos}) ->
							R = #recGuildWarPlayer{
								guildID = GGG,
								mapPID = MapPID,
								reviveCD = ReviveCD,
								key = ST,%%{stage,group}
								bornPos = BPos
							},

							?LOG_OUT("createActivityMapAck:~p,~p,~p", [Data, Rec, R]),

							ets:insert(recGuildWarPlayer, R)
						end,
					lists:foreach(FE, LG),

					NRec =
						case acGuildwarState:getMapEtsCache(MapPID) of
							{_, PE, ME, CE, _NE} ->
								acGuildwarState:delMapEtsCache(MapPID),
								Rec#recGuildWar{playerEts = PE, monsterEts = ME, collectEts = CE};
							_ ->
								Rec
						end,
					acGuildwarState:saveGuildWarMap(NRec),

					%% 创建水晶
					#globalsetupCfg{setpara = LL1} = getCfg:getCfgPStack(cfg_globalsetup, crystal_xy),
					LL11 = lists:ukeysort(1, LL1),
					PebbleL = [{MID, 1, MX, MY} || {MID, MX, MY} <- LL11],
					psMgr:sendMsg2PS(MapPID, addMonsterToMap, {0, PebbleL}),

					%% 创建大炮
					#globalsetupCfg{setpara = LL2} = getCfg:getCfgPStack(cfg_globalsetup, cannon_xy),
					CannonL = [{CID, 1, CX, CY} || {CID, CX, CY} <- LL2],
					psMgr:sendMsg2PS(MapPID, addCollectToMap, {0, CannonL}),

					%% 启一个心跳，等这么久，就把初始数据发给客户端
					erlang:send_after(?InitPebbleDataInfo, self(), {initPebbleDataInfo, ST}),
					ok
				end,
			lists:foreach(F, lists:seq(1, erlang:length(MPidList)));
		_ ->
			?ERROR_OUT("createActivityMapAck:~p", [Data])
	end,
	ok.

createJSBattle() ->
	L = acGuildwarState:getGuildWarMapListStage(?GuildWar_CS),
	WinGuildIDList = [GuildID || #recGuildWar{winGuildID = GuildID} <- L],
	Len = erlang:length(WinGuildIDList),
	case Len > 0 andalso Len =< 3 of
		true ->
			GuildWar =
				case WinGuildIDList of
					[G1, G2, G3] -> #rec_guild_war{stage = {2, 1}, group = 1, guildID1 = G1, guildID2 = G2, guildID3 = G3, winguildID = 0};
					[G1, G2] -> #rec_guild_war{stage = {2, 1}, group = 1, guildID1 = G1, guildID2 = G2, guildID3 = 0, winguildID = 0};
					[G1] -> #rec_guild_war{stage = {2, 1}, group = 1, guildID1 = G1, guildID2 = 0, guildID3 = 0, winguildID = 0}
				end,
			edb:writeRecord(GuildWar),
			psMgr:sendMsg2PS(?PsNameGuild, guildWarBattleResult, GuildWar),
			ok;
		_ ->
			?ERROR_OUT("createJSBattle:~p,~p", [Len, L]),
			skip
	end,
	ok.

guildWarEnd(Phase) ->
	L = acGuildwarState:getGuildWarMapListStage(Phase),
	guildWarEnd2(L, false).
guildWarEnd2([], _) -> ok;
guildWarEnd2(#recGuildWar{isEnd = false, key = Key, guilds = Guilds, enterPlayerList = EP, stage = Stage, playerEts = PlayerEts} = War, IsDestoryMap) ->
	?LOG_OUT("guildWarEnd2:~p", [War]),

	%% 先设置结束
	NWar1 = War#recGuildWar{isEnd = true},
	acGuildwarState:saveGuildWarMap(NWar1),

	%% 发送排行榜数据给CS
	F_Rank =
		fun(#recPlayer{roleID = RID, killPlayer = KillPlayer, secondAttack = SecondAttack}) ->
			{RID, KillPlayer, SecondAttack}
		end,
	RankList = lists:map(F_Rank, EP),
	psMgr:sendMsg2PS(?PsNameRank, guildWarRankListResult, RankList),

	%% 当前在地图中的人数列表
	PlayerList =
		try
			case PlayerEts /= undefined andalso IsDestoryMap =:= false of
				true -> ets:tab2list(PlayerEts);
				_ -> []
			end
		catch
			_:Err ->
				?ERROR_OUT("guildWarEnd2 ~p,~p,~p,~p",[Err,War,IsDestoryMap,erlang:get_stacktrace()]),
				[]
		end,

	%% 统计分数，计算胜负
	%% 积分类型:1占领水晶,2争夺炮台,3参战人员,4累积击杀,5累积助攻
	#globalsetupCfg{setpara = [In1, In2, In3, In4, In5]} = getCfg:getCfgPStack(cfg_globalsetup, integral),
	F1 =
		fun(#recPlayer{killPlayer = K, secondAttack = S}, {Acc1, Acc2}) ->
			{K + Acc1, S + Acc2}
		end,
	F2 =
		fun(#recGuildID{guildID = GuildID, pebbleNumber = PNum, cannonNumber = CNum}) ->
			%% 从ETS中删除，玩家不能再进入
			ets:delete(recGuildWarPlayer, GuildID),

			%% 再拼装协议
			GuildName = playerGuildWar:getGuildName(GuildID),

			% 1占领水晶,
			Integer1 = PNum * In1,
			I1 = #pk_GuildWarInfoIntegral{type = 1, number = PNum, integral = In1},

			% 2争夺炮台,
			Integer2 = CNum * In2,
			I2 = #pk_GuildWarInfoIntegral{type = 2, number = CNum, integral = In2},
			% 3参战人员(取当前在地图中的人)

			PlayerList2 = [PlayerObj || PlayerObj = #recMapObject{guild = GGID} <- PlayerList, GGID =:= GuildID],
			Len = erlang:length(PlayerList2),
			Integer3 = Len * In3,
			I3 = #pk_GuildWarInfoIntegral{type = 3, number = Len, integral = In3},

			% 4累积击杀,
			EP2 = [Player || Player = #recPlayer{guildID = GID} <- EP, GID =:= GuildID],
			{AllKill, AllSec} = lists:foldl(F1, {0, 0}, EP2),
			Integer4 = AllKill * In4,
			I4 = #pk_GuildWarInfoIntegral{type = 4, number = AllKill, integral = In4},

			% 5累积助攻
			Integer5 = AllSec * In5,
			I5 = #pk_GuildWarInfoIntegral{type = 5, number = AllSec, integral = In5},
			#pk_GuildWarInfo{guildID = GuildID, guildName = GuildName,
				all_integral = Integer1 + Integer2 + Integer3 + Integer4 + Integer5,
				integrals = [I1, I2, I3, I4, I5]}
		end,
	DataInfos = lists:map(F2, Guilds),
	DataInfos2 = [#pk_GuildWarInfo{guildID = WinGuildID}|_] = lists:reverse(lists:keysort(#pk_GuildWarInfo.all_integral, DataInfos)),
	LoseGuildIDList = [GGID || #recGuildID{guildID = GGID} <- Guilds, GGID /= WinGuildID],
	?LOG_OUT("guildWarEnd2 win:~p, lose:~p, all:~p", [WinGuildID, LoseGuildIDList, Guilds]),

	NWar2 = NWar1#recGuildWar{winGuildID = WinGuildID, isEnd = true},
	acGuildwarState:saveGuildWarMap(NWar2),

	%% 先记录结果，并发给CS保存
	NowTime = time:getSyncTime1970FromDBS(),
	[#rec_guild_war{} = GWar] = edb:readRecord(rec_guild_war, Key),
	NGWar = GWar#rec_guild_war{winguildID = WinGuildID, wartime = NowTime},
	edb:writeRecord(NGWar),
	psMgr:sendMsg2PS(?PsNameGuild, guildWarBattleResult, NGWar),

	%% 普通奖，参加了都有，分初赛决赛以及胜负
	rewardToGuild(Stage, DataInfos2, WinGuildID),

	%% 特殊奖（称号和坐骑），只有决赛胜利军团才有
	case Stage =:= ?GuildWar_JS of
		true -> rewardTitle(WinGuildID);
		_ -> skip
	end,

	%% 通知结果给客户端
	F3 =
		fun(#recPlayer{roleID = RoleID, guildID = GID}) ->
			case core:queryRoleKeyInfoByRoleID(RoleID) of
				#?RoleKeyRec{level = Lvl} ->
					case core:queryNetPidByRoleID(RoleID) of
                        offline ->
							skip;
                        NetPid ->
                            Reward = getReward(Stage, GID =:= WinGuildID, Lvl),
                            Integral =
                                case lists:keyfind(GID, #pk_GuildWarInfo.guildID, DataInfos2) of
                                    #pk_GuildWarInfo{all_integral = In} -> In;
                                    _ -> 0
                                end,
                            {DropItems, DropCoins} = getRewardDetails(Integral, Reward),
                            Msg = #pk_GS2U_GuildWarEnd{infos = DataInfos, items = DropItems, coins = DropCoins},
                            ?DEBUG_OUT("the end:~p,~p", [RoleID, Msg]),
                            gsSendMsg:sendNetMsg(NetPid, Msg)
                    end;
				_ ->
					skip
			end
		end,
	lists:foreach(F3, EP),
	ok;
guildWarEnd2(#recGuildWar{} = War, IsDestoryMap) ->
	?ERROR_OUT("guildWarEnd2:~p,~p,~p", [War, IsDestoryMap, misc:getStackTrace()]),
	ok;
guildWarEnd2([#recGuildWar{} = War | Right], IsDestoryMap) ->
	guildWarEnd2(War, IsDestoryMap),
	guildWarEnd2(Right, IsDestoryMap).

rewardTitle(GuildID) ->
    MS = ets:fun2ms(fun(Guild) when Guild#rec_guild_member.guildID =:= GuildID, Guild#rec_guild_member.power >= ?GuildMemLevel_Admin -> Guild end),
	MemberList = ets:select(rec_guild_member, MS),

	%% 取军团长
	L1 = lists:filter(fun(#rec_guild_member{power = GLvl}) -> GLvl =:= ?GuildMemLevel_Leader end, MemberList),
	%% 副军团长
	L2 = lists:filter(fun(#rec_guild_member{power = GLvl}) -> GLvl =:= ?GuildMemLevel_ViceLeader end, MemberList),
	%% 精英
	L3 = lists:filter(fun(#rec_guild_member{power = GLvl}) -> GLvl =:= ?GuildMemLevel_Admin end, MemberList),

	L11 = [RID || #rec_guild_member{roleID = RID} <- L1],
	L21 = [RID || #rec_guild_member{roleID = RID} <- L2],
	L31 = [RID || #rec_guild_member{roleID = RID} <- L3],

	?LOG_OUT("rewardTitle:guildID=~p,~p,~p,~p", [GuildID, L11, L21, L31]),

	%% 发奖
	rewardToGift(league_gift_1, L11),
	rewardToGift(league_gift_2, L21),
	rewardToGift(league_gift_3, L31),
	ok.

rewardToGift(GlobalSetUpKey, RoleIDList) ->
	%% [{level, title, pet},...]
	#globalsetupCfg{setpara = RewardList} = getCfg:getCfgPStack(cfg_globalsetup, GlobalSetUpKey),
	RewardList2 = lists:keysort(1, RewardList),
	RewardList3 = lists:reverse(RewardList2),
	F =
		fun(RoleID, {TitleAcc, PetAcc} = Acc) ->
			case getRewardGift(RoleID, RewardList3) of
				{TitleID, PetID} ->
					{[{RoleID, TitleID} | TitleAcc], [{RoleID, PetID} | PetAcc]};
				_ ->
					Acc
			end
		end,
	{TitleList, PetList} = lists:foldl(F, {[], []}, RoleIDList),
	case TitleList of
		[] -> skip;
		_ -> psMgr:sendMsg2PS(?PsNamePlayerMgr, addTitle, TitleList)
	end,
	case PetList of
		[] -> skip;
		_ -> psMgr:sendMsg2PS(?PsNamePlayerMgr, addExpressPet, PetList)
	end,
	ok.
getRewardGift(RoleID, RewardList) ->
	%% [{level, title, pet},...]
	Level =
		case core:queryRoleKeyInfoByRoleID(RoleID) of
			#?RoleKeyRec{level = Lvl} -> Lvl;
			_ -> 0
		end,
	case lists:filter(fun({L, _T, _P}) -> Level >= L end, RewardList) of
		[{_, Title, Pet}|_] ->
			{Title, Pet};
		_ ->
			?LOG_OUT("getRewardGift roleID:~p, level:~p, rewardlist=~p", [RoleID, Level, RewardList]),
			false
	end.

rewardToGuild(_Phase, [], _WinGuildID) -> ok;
rewardToGuild(Phase, #pk_GuildWarInfo{guildID = GuildID, all_integral = Integral}, WinGuildID) ->
    MS = ets:fun2ms(fun(Guild) when Guild#rec_guild_member.guildID =:= GuildID, Guild#rec_guild_member.power >= ?GuildMemLevel_Normal -> Guild end),
    MemberList = ets:select(rec_guild_member, MS),

	rewardToGuildMember(Phase, Integral, MemberList, GuildID =:= WinGuildID);
rewardToGuild(Phase, [#pk_GuildWarInfo{} = Guild | Right], WinGuildID) ->
	rewardToGuild(Phase, Guild, WinGuildID),
	rewardToGuild(Phase, Right, WinGuildID).

rewardToGuildMember(_Phase, _Integral, [], _Win) -> ok;
rewardToGuildMember(Phase, Integral, #rec_guild_member{roleID = RoleID, guildID = GID}, Win) ->
	Level = case core:queryRoleKeyInfoByRoleID(RoleID) of
		        #?RoleKeyRec{level = Lvl} -> Lvl;
		        _ -> 0
	        end,
	case getReward(Phase, Win, Level) of
		false ->
			?LOG_OUT("rewardToGuildMember roleID=~p, guildID=~p, Phase=~p, Win=~p, Level=~p, Integral=~p",
				[RoleID, GID, Phase, Win, Level, Integral]),
			skip;
		{_, ItemID, MoneyType, Money} ->
			case playerMail:createMailGoods(ItemID, 1, true, 0, RoleID, ?ItemSourceGuildWar) of
				[#recMailItem{}|_] = MailItemList ->
					Title = stringCfg:getString(guildWarMailTitle),
					Content = stringCfg:getString(guildWarMailgiftContent),
					Moneys = case MoneyType of
								 ?CoinTypeGold ->
									 [#recMailCoin{coinType = MoneyType, coinNum = Money}];
								 _ ->
									 []
					         end,
					mail:sendSystemMail(RoleID, Title, Content, MailItemList ++ Moneys, erlang:integer_to_list(GID));
				_ ->
					?ERROR_OUT("rewardToGuildMember guild=~p, roleid=~p, ItemID:~p, Phase=~p, Win=~p",
						[GID, RoleID, ItemID, Phase, Win])
			end
	end,
	ok;
rewardToGuildMember(Phase, Integral, [#rec_guild_member{} = Member | Right], Win) ->
	rewardToGuildMember(Phase, Integral, Member, Win),
	rewardToGuildMember(Phase, Integral, Right, Win).

getReward(Phase, Win, Level) ->
	RewardKey =
		case Phase of
			?GuildWar_CS ->
				case Win of
					true -> league_win1;
					_ -> league_lost1
				end;
			?GuildWar_JS ->
				case Win of
					true -> league_win2;
					_ -> league_lost2
				end
		end,
	#globalsetupCfg{setpara = RewardList} = getCfg:getCfgPStack(cfg_globalsetup, RewardKey),
	RewardList2 = lists:keysort(1, RewardList),
	RewardList3 = lists:reverse(RewardList2),
	case lists:filter(fun({Lvl, _, _, _}) -> Level >= Lvl end, RewardList3) of
		[Conf|_] -> Conf;
		_ -> false
	end.

getRewardDetails(_Integral, false) ->
	{[], []};
getRewardDetails(_Integral, {_, ItemID, MoneyType, Money}) ->
	ErrorList = [#pk_GuildWarReward_item{isBind = 1, itemID = ItemID, itemNumber = 1}],
	case getCfg:getCfgPStack(cfg_item, ItemID) of
		#itemCfg{itemType = ?ItemTypePackge, useParam1 = DropID} ->
			case getCfg:getKey(cfg_drop,DropID) of
				[_I|_] = IndexList ->
					Fun =
						fun(RowNum, {Items, Coins} = Acc) ->
							case getCfg:getCfgPStack(cfg_drop, RowNum) of
								#dropCfg{dropId = DropID, dataId = ItemID2, dropType = ?Drop_Type_Goods, probability = 10000, min = Num, max = Num, isbind = Bind} ->
									%% 道具掉落
									RI = #pk_GuildWarReward_item{isBind = Bind, itemID = ItemID2, itemNumber = Num},
									{[RI | Items], Coins};
								#dropCfg{dropId = DropID, dataId = CoinType, dropType = ?Drop_Type_Coin, probability = 10000, min = Num, max = Num} ->
									%% 货币掉落掉落
									RC = #pk_GuildWarReward_coin{cointype = CoinType, number = Num},
									{Items, [RC | Coins]};
								_ ->
									Acc
							end
						end,
					{DropItems, DropCoins} = lists:foldl(Fun, {[], []}, IndexList),

					%% 还有额外获得的钱
					Moneys = case MoneyType of
						         ?CoinTypeGold ->
							         [#pk_GuildWarReward_coin{cointype = MoneyType, number = Money}];
						         _ ->
							         []
					         end,
					{DropItems, Moneys ++ DropCoins};
				_ ->
					{ErrorList, []}
			end;
		#itemCfg{} ->
			{ErrorList, []};
		_ ->
			{[], []}
	end.

getGuildWarPhase() ->
	case myEts:lookUpEts(?AcEts, ?ActivityType_GuildWar) of
		[#rec_activity{phase = Phase}] -> Phase;
		_ -> ?ActivityPhase_Close
	end.

%% 初始化水晶数据
initPebbleDataInfo(Key) ->
	L = acGuildwarState:getGuildWarMapList(),
	case lists:keyfind(Key, #recGuildWar.key, L) of
		#recGuildWar{monsterEts = MEts, collectEts = CEts} = War ->
			%% 初始化水晶和大炮数据
			#globalsetupCfg{setpara = LL1} = getCfg:getCfgPStack(cfg_globalsetup, crystal_xy),
			#globalsetupCfg{setpara = LL2} = getCfg:getCfgPStack(cfg_globalsetup, cannon_xy),

			CannonL = getCannonInit(CEts, LL2),
			LL11 = lists:ukeysort(1, LL1),
			PebbleL = getPebbleInit(MEts, LL11),

			NWar = War#recGuildWar{pebbleState = PebbleL, cannonState = CannonL},
			acGuildwarState:saveGuildWarMap(NWar),
			ok;
		_ ->
			skip
	end,
	ok.

%% 正式开始
guildWarStart(Phase) ->
	L = acGuildwarState:getGuildWarMapListStage(Phase),
	NowTime = time:getSyncTime1970FromDBS(),
	F1 =
		fun(#recGuildID{guildID = GuildID}) ->
			case myEts:lookUpEts(recGuildWarPlayer, GuildID) of
				[#recGuildWarPlayer{}] ->
					myEts:updateEts(recGuildWarPlayer, GuildID, {#recGuildWarPlayer.startTime, NowTime});
				_ ->
					skip
			end
		end,

	F2 =
		fun(#recGuildWar{guilds = Guilds} = War) ->
			%% 正式开始，设置正式开始时间
			NWar = War#recGuildWar{startTime = NowTime},
			acGuildwarState:saveGuildWarMap(NWar),

			lists:foreach(F1, Guilds),

			%% 打开阻挡
			sendMsgToScene(NWar, ?BlockIDMsg)
		end,
	lists:foreach(F2, L),
	ok.

getCannonInit(undefined, List) ->
	List;
getCannonInit(CEts, List) ->
	L1 = lists:keysort(1, List),
	LL = ets:tab2list(CEts),
	F =
		fun(#recMapObject{id = ID}) ->
			lists:keymember(ID, 1, List)
		end,
	LL1 = lists:filter(F, LL),
	LL2 = lists:keysort(#recMapObject.id, LL1),
	Len = erlang:length(L1),
	case erlang:length(LL2) >= Len of
		true ->
			#globalsetupCfg{setpara = [UseCD]} = getCfg:getCfgPStack(cfg_globalsetup, cannon_cd),
			Fun =
				fun(Index, AccList) ->
					{CID, _X, _Y} = lists:nth(Index, L1),
					#recMapObject{code = Code} = lists:nth(Index, LL2),
					R = #recCannon{
						collectCode = Code,
						collectID = CID,
						useTime = 0,
						useCD = UseCD
					},
					[R | AccList]
				end,
			lists:foldl(Fun, [], lists:seq(1, Len));
		_ ->
			?ERROR_OUT("getCannonInit:~p,~p", [List, LL1]),
			[]
	end.

getPebbleInit(undefined, List) ->
	List;
getPebbleInit(MEts, List) ->
	F =
		fun({MID, _, _}) ->
			MatchSpec = ets:fun2ms(fun(Object) when Object#recMapObject.id =:= MID -> Object end),
			{Code, CHP, MHP} =
				case myEts:selectEts(MEts,MatchSpec) of
					[#recMapObject{code = C, hp = H1, maxHp = H2}|_] -> {C, H1, erlang:trunc(H2)};
					_ -> {0, 0, 0}
				end,
			ReviveCD =
				case getCfg:getCfgPStack(cfg_monster, MID) of
					#monsterCfg{monsterCd = CD} -> CD div 1000;
					_ -> 0
				end,
			#recPebble{
				monsterCode = Code,
				monsterID = MID,
				deadTime = 0,
				reviveCD = ReviveCD,   % 复活CD
				curHp = CHP,
				maxHp = MHP,
				guilds = []    % [{guildID, hurtTimes},...] 军团成员造成伤害次数
			}
		end,
	lists:map(F, List).

sendMsgToScene(#recGuildWar{playerEts = PlayerEts}, Msg) ->
	case PlayerEts of
		undefined ->
			skip;
		_ ->
			F =
				fun(#recMapObject{netPid = NetPid, id = RoleID, name = _Name}, _) ->
					Msg2 = getRealMsg(Msg, RoleID),
%% 					?DEBUG_OUT("sendMsgToScene:~p,~ts,~p", [RoleID,_Name,Msg2]),
					gsSendMsg:sendNetMsg(NetPid, Msg2)
				end,
			ets:foldl(F, 0, PlayerEts)
	end,
	ok.

setWaitTime(Phase) ->
	#activityCfg{stage = StageList} = getCfg:getCfgPStack(cfg_activity, ?ActivityType_GuildWar),
	case erlang:length(StageList) >= Phase of
		true ->
			PrepareTime = lists:nth(Phase, StageList),
			acGuildwarState:setWaitStartTime(PrepareTime);
		_ ->
			?ERROR_OUT("setWaitTime:~p,~p", [Phase, StageList]),
			acGuildwarState:setWaitStartTime(900)
	end,
	ok.