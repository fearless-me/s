%%%-------------------------------------------------------------------
%%% @author tiancheng
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%% 玩家天梯1v1
%%% @end
%%% Created : 01. 六月 2015 10:43
%%%-------------------------------------------------------------------
-module(playerLadder1v1).
-author("tiancheng").

-include("playerPrivate.hrl").

-define(DailySubType_MoBai, 1). % 每日膜拜次数
-define(DailySubType_TiaoZhan_Normal, 2). % 每日普通挑战次数
-define(DailySubType_TiaoZhan_Charge, 3). % 每日收费挑战次数
-define(HoldPlayerBuffID, ?HoldPlayerBuff). % 玩家定身buff
-define(Max_MoBai_Number, 1).   % 每日膜拜最大次数
-define(Max_TiaoZhan_Normal, 5).    % 每日普通挑战最大次数
-define(Max_TiaoZhan_Charge, 5).    % 每日收费挑战最大次数
-define(LadderBattleNotesNumber, 10).    % 全服出色战斗与自己战斗条数

%% 天梯挑战状态保护时间s
-define(LadderMatchStateProtcetTime, 1800).

%% playermsg
-export([
	openLadder1v1/0,
	freshLadderList/0,
	requestPlayerInfo/1,
	requestKingList/0,
	worshipTarget/2,
	requestBattleNotes/0,
	challengeTargetByRank/2,
	challengeTargetByRoleID/1,
	giveUpChallenge/0,
	rankSortRiseAward/2,
	queryMonsterPforce/1
]).

%% API
-export([
	gmAddSelfToLadderList/0,
	enterLadder1v1Map/1,
	onEnterLadder1v1Map/1,
	playerEnterMapReal/1,
	playerOffline/0,
	ladder1v1_player_start_battle/1,
	ladder1v1_rob_start_battle/1,
	setExploitValue/1,
	getArenaExploit/0,
	deleteRole/1,
	ladder1v1_addprop/1,
	clearLadderMatchState/1
]).

-export([
	queryTargetName/1,
	queryRoleLadder/1
]).

%% 角色删除
-spec deleteRole(RoleID :: uint64()) -> boolean().
deleteRole(RoleID) ->
	%% 取最弱的一个机器人
	[{S, E} | _] = lists:reverse(getCfg:getKeyList(cfg_ladder_1v1)),
	#ladder_1v1Cfg{monsterID = [MonsterID|_]} = getCfg:getCfgPStack(cfg_ladder_1v1, S, E),
	psMgr:sendMsg2PS(?PsNameLadder1v1, deleteRole, {RoleID, MonsterID}).

%% 修正属性
ladder1v1_addprop(PropList) ->
%%	BattleProp = playerCalcProp:getBattleProp(),
%%	NewBattleProp1 = battleProp:addBattlePropRateValue(BattleProp, PropList),
%%	playerCalcProp:calcBattleProp(NewBattleProp1, true, true),

	%% 保存修正的属性
	playerPropSync:setString(?SerProp_PlayerLadder1v1Prop, []),
	ok.

%% 还原属性
ladder1v1_decprop() ->
	case playerPropSync:getProp(?SerProp_PlayerLadder1v1Prop) of
		[] ->
			skip;
		PropList ->
			BattleProp = playerCalcProp:getBattleProp(),
			NewBattleProp1 = battleProp:delBattlePropRateValue(BattleProp, PropList),
			playerCalcProp:calcBattleProp(NewBattleProp1, true, true),

			playerPropSync:setString(?SerProp_PlayerLadder1v1Prop, []),
			ok
	end,
	ok.


%% GM设置自己的功勋值
-spec setExploitValue(Value :: uint()) -> boolean().
setExploitValue(Value) when erlang:is_integer(Value) andalso Value >= 0 ->
	RoleID = playerState:getRoleID(),
	?WARN_OUT("GMGMGMGM setExploitValue:roleid=~p,value=~p", [RoleID, Value]),
	psMgr:sendMsg2PS(?PsNameLadder1v1, setExploitValue, {RoleID, Value}),
	true;
setExploitValue(_) -> false.

%% 玩家可以战斗
-spec ladder1v1_player_start_battle({TargetRoleID :: uint64(), Msg :: term()}) -> ok.
ladder1v1_player_start_battle({_TargetRoleID, Msg}) ->
	%% 移除定身buff
	playerBuff:delBuff(?HoldPlayerBuffID),

	%% 清除pk保护
	playerBuff:delBuff(?PkBuff),

	%% 添加杀戮状态
	playerState:setCamp(?CampBlueBattle, true),

	%% Msg = #pk_GS2U_BattleStartSec{}
	playerMsg:sendNetMsg(Msg),
	ok.

%% 机器人开启战斗
-spec ladder1v1_rob_start_battle({TargetRoleID :: uint64(), TargetCode :: uint()}) -> ok.
ladder1v1_rob_start_battle({TargetRoleID, TargetCode}) ->
	case TargetCode > 0 of
		true ->
			%% 先下坐骑
			playerPet:petOffMount(false),

			%% 添加杀戮状态
			playerState:setCamp(?CampRedBattle, true),

			%% 不去强制匹配，因为这里创建者可能都不存在了（下线了）
			case myEts:lookUpEts(playerState:getMapPlayerEts(), TargetCode) of
				[#recMapObject{}] ->
					playerPropSync:setInt64(?SerProp_RobRoleTargetCode, TargetCode);
				_ ->
					?LOG_OUT("ladder1v1_rob_start_battle target:~p,~p not find! self:~p,~p",
						[TargetRoleID, TargetCode, playerState:getRobRoleID(), playerState:getPlayerCode()]),
					skip
			end;
		_ ->
			?ERROR_OUT("ladder1v1_rob_start_battle:self=~p, target=~p", [playerState:getRobRoleID(), TargetRoleID])
	end,
	ok.

-spec playerOffline() -> ok.
playerOffline() ->
	case playerState:getMapID() =:= ?Ladder1v1MapID of
		true ->
			psMgr:sendMsg2PS(?PsNameLadder1v1, playerOffline, playerState:getMapPid());
		_ ->
			skip
	end,
	ok.

%% 可以进入战场地图
-spec enterLadder1v1Map({TMapID :: uint(), TMapPID :: pid(), TX :: float(), TY :: float(), CreateRank :: uint()}) -> ok.
enterLadder1v1Map({TMapID, TMapPID, TX, TY, CreateRank}) ->
	%% 设置自己的状态
	playerPropSync:setInt(?SerProp_PlayerInLadder1v1, CreateRank),

	playerScene:onRequestEnterActivityMap(TMapID, TMapPID, TX, TY),
	ok.

%% 玩家真正进入地图
-spec playerEnterMapReal(MapID :: uint()) -> ok.
playerEnterMapReal(?Ladder1v1MapID) ->
	case playerState:getIsPlayer() of
		true ->
			%% 添加定身buff
			playerPet:petOffMount(false),
			playerBuff:addBuff(?HoldPlayerBuffID, playerState:getLevel()),
			playerAchieve:achieveEvent(?Achieve_First_arena, [1]),

			playerBase:clearSkillCDAndRestoreHp(),
			playerTask:updateTask(?TaskSubType_Active, ?TaskSubType_Active_Sub_JingJiChang),

			psMgr:sendMsg2PS(?PsNameLadder1v1, enterLadder1v1Map, {playerState:getRoleID(), playerState:getMapPid(), playerState:getPlayerCode()});
		_ ->
			skip
	end,
	ok;
playerEnterMapReal(_MapID) ->
	ok.

%% 真正切场景流程
-spec onEnterLadder1v1Map(MapID :: uint()) -> ok.
onEnterLadder1v1Map(?Ladder1v1MapID) ->
	case playerState:getIsPlayer() of
		true ->
			%% 这里不处理了，等玩家真正进入地图再处理
			skip;
		_ ->
			psMgr:sendMsg2PS(?PsNameLadder1v1, robenterLadder1v1Map,
				{playerState:getPlayerCode(), playerState:getRobRoleID(), playerState:getMapPid()})
	end,
	ok;
onEnterLadder1v1Map(_MapID) ->
	%% 进入其它地图
	case playerPropSync:getProp(?SerProp_PlayerInLadder1v1) of
		Rank when erlang:is_integer(Rank) andalso Rank > 0 ->
			RoleID = playerState:getRoleID(),
			case ets:lookup(ets_recLadderMatchState, Rank) of
				[#recLadderMatchState{roleID = RoleID}] ->
					%% 比赛失败
					psMgr:sendMsg2PS(?PsNameLadder1v1, playerleaveLadder1v1Map, {Rank, playerState:getRoleID(), self()});
				_ ->
					skip
			end,

			%% 置空状态
			playerPropSync:setInt(?SerProp_PlayerInLadder1v1, 0);
		_ ->
			skip
	end,

	%% 还原修正属性
	ladder1v1_decprop(),
	ok.

%% 查询玩家竞技场功勋
-spec getArenaExploit() -> uint().
getArenaExploit() ->
	RoleID = playerState:getRoleID(),
	case queryRoleLadder(RoleID) of
		#rec_ladder_1v1{exploit = E} -> E;
		_ ->
			0
	end.

%% 按排名挑战对手
%%-spec challengeTargetByRank(RankSort :: uint()) -> ok.
challengeTargetByRank(RankSort,TargetName) ->
	case ets:lookup(ets_rec_ladder_1v1, RankSort) of
		[#rec_ladder_1v1{roleID = TRID}] ->
			challengeTarget(RankSort, TRID,TargetName);
		_ ->
			skip
	end,
	ok.

%% 按对象反击对手
-spec challengeTargetByRoleID(TargetRoleID :: uint()) -> ok.
challengeTargetByRoleID(TargetRoleID) ->
	case uidMgr:checkUID(?UID_TYPE_Role, TargetRoleID) of
		true ->
			case queryRoleLadder(TargetRoleID) of
				#rec_ladder_1v1{rankSort = Rank} ->
					challengeTarget(Rank, TargetRoleID,<<"">>);
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_MailTargetNouFound),
					skip
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_Ladder1v1_CanntChallengeMonster),
			skip
	end,
	ok.

%% 挑战对手
challengeTarget(TargetRank, TargetRoleID,TargetName) ->
	case playerState:getActionStatus() of
		?CreatureActionStatusChangeMap ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_WarriorTrialFailed),
			skip;
		_ ->
			RoleID = playerState:getRoleID(),
			case TargetRoleID =/= RoleID of
				true ->
					{Already, All, MoneyType, Money} = getChallengeTimesAndMoney(),
					case Already < All of
						true ->
							IsMoneyEnough =
								case MoneyType of
									?CoinTypeGold ->
										playerMoney:canUseCoin(?CoinUseTypeGold, Money);
									?CoinTypeBindDiamond ->
										playerMoney:canUseCoin(?CoinUseTypeDiamond, Money);
									0 -> true;
									_ -> false
								end,
							case IsMoneyEnough of
								true ->
									case queryRoleLadder(RoleID) of
										#rec_ladder_1v1{rankSort = Rank} ->
											%% 先检查是否过期，如果过期，则先删掉
											checkLadderMatchState(Rank),
											checkLadderMatchState(TargetRank),

											case ets:lookup(ets_recLadderMatchState, Rank) of
												[] ->
													case ets:lookup(ets_recLadderMatchState, TargetRank) of
														[] ->
															%% 两个都不在比赛状态
															case challengeTarget(Rank, RoleID, TargetRank, TargetRoleID,TargetName) of
																true ->
																	%% 扣钱，次数累计
																	case MoneyType of
																		?CoinTypeGold ->
																			PLog1 = #recPLogTSMoney{
																				reason = ?CoinUseLadder1v1,
																				param = Rank,
																				target = ?PLogTS_Ladder1v1,
																				source = ?PLogTS_PlayerSelf
																			},
																			true = playerMoney:useCoin(?CoinUseTypeGold, Money, PLog1);
																		?CoinTypeBindDiamond ->
																			PLog2 = #recPLogTSMoney{
																				reason = ?CoinUseLadder1v1,
																				param = Rank,
																				target = ?PLogTS_Ladder1v1,
																				source = ?PLogTS_PlayerSelf
																			},
																			playerMoney:useCoin(?CoinUseTypeDiamond, Money, PLog2);
																		0 -> skip
																	end,

																	%% 更新今日次数
																	updateChallengeTimes(),

																	%% 通知管理进程，创建比赛场景，加载数据
																	psMgr:sendMsg2PS(?PsNameLadder1v1, createLadder1v1Match,
																		{Rank, RoleID, playerState:getNetPid(), TargetRank, TargetRoleID,TargetName}
																	),
																	ok;
																_ ->
																	skip
															end;
														[#recLadderMatchState{}] ->
															playerMsg:sendErrorCodeMsg(?ErrorCode_Ladder1v1_TargetAlreadyChall),
															skip
													end;
												[#recLadderMatchState{}] ->
													playerMsg:sendErrorCodeMsg(?ErrorCode_Ladder1v1_YourAlreadyChall),
													skip
											end;
										_ ->
											?ERROR_OUT("challengeTarget:selfroleid=~p,targetid=~p,targetrank=~p", [RoleID, TargetRoleID, TargetRank]),
											skip
									end;
								_ ->
									case MoneyType of
										?CoinTypeGold ->
											playerMsg:sendErrorCodeMsg(?ErrorCode_TradeGold);
										?CoinTypeBindDiamond ->
											playerMsg:sendErrorCodeMsg(?ErrorCode_TradeDiamond);
										_ ->
											?ERROR_OUT("challengeTarget unknow error:roleid=~p", [RoleID])
									end
							end;
						_ ->
							playerMsg:sendErrorCodeMsg(?ErrorCode_Ladder1v1_NoChallengeTimes)
					end;
				_ ->
					%% 不能挑战自己
					playerMsg:sendErrorCodeMsg(?ErrorCode_Ladder1v1_YourAlreadyChall),
					skip
			end
	end,
	ok.

%%-spec challengeTarget(Rank :: uint(), RoleID :: uint64(), TargetRank :: uint(), TargetRoleID :: uint64()) -> boolean().
challengeTarget(Rank, RoleID, TargetRank, TargetRoleID,TargetName) ->
	case psMgr:call(?PsNameLadder1v1, challengeTarget, {Rank, RoleID, TargetRank, TargetRoleID}, 2000) of
		{challengeTargetAck, true} ->
			NewTargetName = queryTargetName(TargetRoleID,TargetName),
			playerMsg:sendErrorCodeMsg(?ErrorCode_Ladder1v1_ChallengeSuccess, [NewTargetName]),
			true;
		{challengeTargetAck, 1} ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_Ladder1v1_YourAlreadyChall),
			false;
		{challengeTargetAck, 2} ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_Ladder1v1_TargetAlreadyChall),
			false;
		Error ->
			?ERROR_OUT("challengeTarget Error:~p,roleid=~p,targetid=~p", [Error, RoleID, TargetRoleID]),
			false
	end.

%% 放弃挑战
-spec giveUpChallenge() -> ok.
giveUpChallenge() ->
	RoleID = playerState:getRoleID(),
	case queryRoleLadder(RoleID) of
		#rec_ladder_1v1{rankSort = Rank} ->
			case ets:lookup(ets_recLadderMatchState, Rank) of
				[#recLadderMatchState{}] ->
					%% 通知管理进程放弃挑战
					psMgr:sendMsg2PS(?PsNameLadder1v1, giveUpChallenge, {Rank, RoleID}),
					ok;
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

%% 打开天梯1v1界面
-spec openLadder1v1() -> ok.
openLadder1v1() ->
	queryAndInsertLadderList().

%% 刷新天梯1v1对手界面
-spec freshLadderList() -> ok.
freshLadderList() ->
	queryAndInsertLadderList().

%% 请求玩家的模型对象
-spec requestPlayerInfo(RoleID :: uint64()) -> ok.
requestPlayerInfo(RoleID) ->
	playerRank:sendPropList(RoleID),
	ok.

%% 请求王者列表
-spec requestKingList() -> ok.
requestKingList() ->
	L = [5, 4, 3, 2, 1],
	Fun =
		fun(Rank, AccList) ->
			case ets:lookup(ets_rec_ladder_1v1, Rank) of
				[#rec_ladder_1v1{roleID = RID, worship_times = WT} = _TR] ->
					{Name, Career} =
						case uidMgr:checkUID(?UID_TYPE_Role, RID) of
							true ->
								case core:queryRoleKeyInfoByRoleID(RID) of
									#?RoleKeyRec{roleName = N1, career = C1} -> {N1, C1};
									_ -> {"", 0}
								end;
							_ ->
								case getCfg:getCfgPStack(cfg_monster, RID) of
									#monsterCfg{showName = N2} -> {N2, 0};
									_ -> {"", 0}
								end
						end,

					RR = #pk_KingRole{
						roleID = RID,
						ranksort = Rank,
						career = Career,
						roleName = Name,
						worshipTimes = WT
					},
					[RR | AccList];
				_ ->
					AccList
			end
		end,
	NL = lists:foldl(Fun, [], L),
	playerMsg:sendNetMsg(#pk_GS2U_ReturnKingList{kings = NL}),
	ok.

%% 膜拜王者
%% -spec worshipTarget(TargetRoleID :: uint64()) -> ok.
worshipTarget(TargetRoleID,RoleName) ->
	case queryRoleLadder(playerState:getRoleID()) of
		#rec_ladder_1v1{} ->
			Times = playerDaily:getDailyCounter(?DailyType_Ladder1v1, ?DailySubType_MoBai),
			case Times < ?Max_MoBai_Number of
				true ->
					SelfRoleID = playerState:getRoleID(),
					case SelfRoleID /= TargetRoleID of
						true ->
							#globalsetupCfg{setpara = [CoinNumber]} = getCfg:getCfgPStack(cfg_globalsetup, jjc_worship),
							playerMsg:sendErrorCodeMsg(?ErrorCode_Ladder1v1_WorShipSuccess, [RoleName]),

							%% 膜拜成功
							worshipTargetSuccess(TargetRoleID),

							psMgr:sendMsg2PS(?PsNameLadder1v1, worshipTarget, {SelfRoleID, TargetRoleID, 0}),

							Title = stringCfg:getString(arena_Ladder1v1_King_Title),
							Content2 = stringCfg:getString(arena_Ladder1v1_King_Content),
							mail:sendMoneySystemMail(playerState:getRoleID(), Title, Content2,
								?CoinTypeBindDiamond, CoinNumber, []),
							ok;
						_ ->
							%% 不能膜拜自己
							playerMsg:sendErrorCodeMsg(?ErrorCode_Ladder1v1_WorShipFailed_Self)
					end;
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_Ladder1v1_NoWorShipTimes),
					?DEBUG_OUT("worshipTarget:selfroleid=~p, targetroleid=~p", [playerState:getRoleID(), TargetRoleID])
			end;
		_ ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_Ladder1v1_WorShipFailed, [RoleName])
	end,
	ok.

%% 膜拜成功
-spec worshipTargetSuccess(TargetRoleID :: uint64()) -> ok.
worshipTargetSuccess(TargetRoleID) ->
	%% 先增加次数
	playerDaily:incDailyCounter(?DailyType_Ladder1v1, ?DailySubType_MoBai),

	case uidMgr:checkUID(?UID_TYPE_Role, TargetRoleID) of
		true ->
			case core:queryOnLineRoleByRoleID(TargetRoleID) of
				#rec_OnlinePlayer{netPid = NetPID} ->
					Msg = playerMsg:getErrorCodeMsg(?ErrorCode_Ladder1v1_WorShip_To_You, [playerState:getName()]),
					gsSendMsg:sendNetMsg(NetPID, Msg);
				_ -> skip
			end;
		_ ->
			skip
	end,
	ok.

%% 请求对战记录
-spec requestBattleNotes() -> ok.
requestBattleNotes() ->
	RoleID = playerState:getRoleID(),
	FunSort =
		fun(Table1, Table2) ->
			case Table1 of
				#recLadderLS{} ->
					#recLadderLS{time = T1} = Table1,
					#recLadderLS{time = T2} = Table2,
					T1 > T2;
				#recLadderMatchInfo{} ->
					#recLadderMatchInfo{time = T3} = Table1,
					#recLadderMatchInfo{time = T4} = Table2,
					T3 > T4
			end
		end,
	FunFold =
		fun(Table, Acc) ->
			case Table of
				#recLadderLS{roleID = RID, targetID = TID, targetMonsterName = TargetName} ->
					[#pk_LadderLS{
						roleID = RID,
						roleName = queryTargetName(RID,TargetName),
						isTerminator = Table#recLadderLS.isTerminator,
						ls_times = Table#recLadderLS.ls_times,
						targetID = Table#recLadderLS.targetID,
						targetName = queryTargetName(TID,TargetName)
					} | Acc];
				#recLadderMatchInfo{roleID = RID, targetID = TID, targetMonsterName = TargetName} ->
					[#pk_LadderMatchInfo{
						roleID = RID,
						roleName = queryTargetName(RID,TargetName),
						isChallenge = Table#recLadderMatchInfo.isChallenge,
						isWin = Table#recLadderMatchInfo.isWin,
						targetID = TID,
						targetName = queryTargetName(TID,TargetName),
						rank1 = Table#recLadderMatchInfo.rank1,
						rank2 = Table#recLadderMatchInfo.rank2
					} | Acc]
			end
		end,
	LSInfo =
		case ets:tab2list(ets_recLadderLS) of
			[] ->
				[];
			[#recLadderLS{} | _] = L1 ->
				L2 = lists:sort(FunSort, L1),
				L3 = lists:sublist(L2, ?LadderBattleNotesNumber),

				%% 去掉多余数据
				case lists:subtract(L2, L3) of
					[] -> skip;
					LL1 ->
						%% 清除多余数据
						[ets:delete_object(ets_recLadderLS, One) || One <- LL1]
				end,
				lists:foldl(FunFold, [], L3)
		end,
	SelfInfo =
		case ets:lookup(ets_recLadderMatchInfo, RoleID) of
			[] ->
				[];
			[#recLadderMatchInfo{} | _] = L4 ->
				L5 = lists:sort(FunSort, L4),
				L6 = lists:sublist(L5, ?LadderBattleNotesNumber),

				%% 判断个人recLadderMatchInfo数据是否太多，如果太多，则清空一部分
				case lists:subtract(L5, L6) of
					[] -> skip;
					LL2 ->
						%% 清除多余数据
						[ets:delete_object(ets_recLadderMatchInfo, One2) || One2 <- LL2]
				end,
				lists:foldl(FunFold, [], L6)
		end,
	Msg = #pk_GS2U_BattleNotes{lsInfo = LSInfo, selfInfo = SelfInfo},
	playerMsg:sendNetMsg(Msg),
	ok.

%% 把自己添加进天梯列表
-spec gmAddSelfToLadderList() -> boolean().
gmAddSelfToLadderList() ->
	RoleID = playerState:getRoleID(),
	case queryRoleLadder(RoleID) of
		#rec_ladder_1v1{} ->
			true;
		_ ->
			case insertSelfToLadderList() of
				{ok,{<<"tempRecord">>,#rec_ladder_1v1{}}} ->
					true;
				_ ->
					false
			end
	end.

%% 跟据自身查询对象列表，如果自身不在列表中，则先把自己添加进去
queryAndInsertLadderList() ->
	RoleID = playerState:getRoleID(),
	case queryRoleLadder(RoleID) of
		#rec_ladder_1v1{} = R ->
			queryAndInsertLadderList2(R);
		_ ->
			case insertSelfToLadderList() of
				{ok,{<<"tempRecord">>,#rec_ladder_1v1{}=R2}} ->
					queryAndInsertLadderList2(R2);
				R ->
					?ERROR_OUT("queryAndInsertLadderList:~p,~ts,Error:~w~n", [RoleID, playerState:getName(),R])
			end
	end,
	ok.

queryAndInsertLadderList2(#rec_ladder_1v1{rankSort = Rank} = R) ->
	KeyList = getCfg:getKeyList(cfg_ladder_1v1_rand),
	case [Key || {Start, End} = Key <- KeyList, Rank >= Start andalso Rank =< End] of
		[{S, E}] ->
			#ladder_1v1_randCfg{back_1 = B1, front_1 = F1, front_2 = F2}
				= getCfg:getCfgPStack(cfg_ladder_1v1_rand, S, E),
			%% 策划要求往前取两个，往后取一个
			%% 名次在前的，取不够，则在1~10名中随机取
			%% 名将在后的，取不够，则在当前名将往前1~10中取
			V1 = case getCalcRank(Rank, true, B1, []) of
					 0 -> getCalcRank(Rank, undefined, undefined, []);
					 V11 -> V11
				 end,
			V2 = case getCalcRank(Rank, false, F1, [V1]) of
					 0 -> getCalcRank(Rank, undefined, undefined, [V1]);
					 V22 -> V22
				 end,
			V3 = case getCalcRank(Rank, false, F2, [V1, V2]) of
					 0 -> getCalcRank(Rank, undefined, undefined, [V1, V2]);
					 V33 -> V33
				 end,
			queryAndInsertLadderList3(R, [V1, V2, V3]);
		Error ->
			?ERROR_OUT("queryAndInsertLadderList2:~p,error=~p", [R, Error])
	end,
	ok.

queryAndInsertLadderList3(#rec_ladder_1v1{rankSort = RS} = Rec, RankList) ->
	TargetList = getTargetByRankList(RankList),
	TargetList2 = getEnoughTarget(RS, TargetList, RankList),
	TargetList3 = lists:keysort(#pk_LadderTargetInfo.ranksort, TargetList2),
	{T1, T2, MT, M} = getChallengeTimesAndMoney(),
	{Time, Value} = getRewardInfo(RS),
	Self = #pk_SelfBattleInfo{
		ranksort = Rec#rec_ladder_1v1.rankSort,
		fightingCapacity = playerPropSync:getProp(?PriProp_PlayerForce) + playerPropSync:getProp(?PriProp_PetForce),
		exploit = Rec#rec_ladder_1v1.exploit,
		cur_ChallengeTimes = T1,
		max_ChallengeTimes = T2,
		moneyType = MT,
		money = M,
		cur_win = Rec#rec_ladder_1v1.cur_win,
		max_win = Rec#rec_ladder_1v1.max_win,
		win_times = Rec#rec_ladder_1v1.win_times,
		surplusSec = Time,
		exploitValue = Value
	},
	Msg = #pk_GS2U_LadderTargetList{targets = TargetList3, selfInfo = Self},
	playerMsg:sendNetMsg(Msg),
	ok.

getEnoughTarget(_SelfRank, TargetList, RankList) when erlang:length(TargetList) >= erlang:length(RankList) ->
	TargetList;
getEnoughTarget(SelfRank, TargetList, RankList) ->
	DiffLen = erlang:length(RankList) - erlang:length(TargetList),
	ADDList =
		case SelfRank > 10 of
			true ->
				%% 在自身名次前十名中取足够的人数
				L1 = lists:seq(SelfRank - 10, SelfRank - 1),
				L2 = L1 -- RankList,
				Fun1 =
					fun(_, {AccL1, AddL1}) ->
						%% 随机取
						V1 = lists:nth(misc:rand(1, erlang:length(AccL1)), AccL1),
						{lists:delete(V1, AccL1), [V1 | AddL1]}
					end,
				{_, AddR1} = lists:foldl(Fun1, {L2, []}, lists:seq(1, DiffLen)),
				AddR1;
			_ ->
				%% 在自身名次前，依次取足够的人数
				Fun2 =
					fun(_, {Rank, AccL2}) ->
						case Rank > 1 andalso erlang:length(AccL2) < DiffLen of
							true ->
								NowRank = Rank - 1,
								%% 判断是否重复
								case lists:member(NowRank, RankList) of
									false ->
										{NowRank, [NowRank | AccL2]};
									_ ->
										%% 重复了，继续往前取
										{NowRank, AccL2}
								end;
							_ ->
								%% 没有取够已经用完(这种可能性不存在) 或者 已经取够了
								{0, AccL2}
						end
					end,
				{_, AddR2} = lists:foldl(Fun2, {SelfRank, []}, lists:seq(1, 10)),
				AddR2
		end,
	TargetList2 = getTargetByRankList(ADDList),
	TargetList ++ TargetList2.

getTargetByRankList(RankList) ->
	Fun =
		fun(Rank, AccList) ->
			case ets:lookup(ets_rec_ladder_1v1, Rank) of
				[#rec_ladder_1v1{roleID = RID} = TR] ->
					%%小于100w的认为是怪物id
					{IsDel, Name, Lvl, PForce, Career} =
						if
							RID > 1000000 ->
								case core:queryRoleKeyInfoByRoleID(RID) of
									#?RoleKeyRec{level = Lvl1, roleName = N1, playerForce = PF, petForce = PetF, career = Ca} ->
										{false, N1, Lvl1, PF + PetF, Ca};
									_ ->
										{true, "", 0, 0, 0}
								end;
							true ->
								Pfor = queryMonsterPforce(RID),
								case getCfg:getCfgPStack(cfg_monster, RID) of
									#monsterCfg{showName = N2, level = Lvl2} -> {false, N2, Lvl2, Pfor, 0};
									_ -> {true, "", 0, Pfor, 0}
								end
						end,
					case IsDel of
						false ->
							[#rec_base_role{race =Race,sex = Sex}] = ets:lookup(ets_rec_base_role, playerState:getRoleID()),
							RR = #pk_LadderTargetInfo{
								roleID = RID,
								name = Name,
								level = Lvl,
								career = Career,
								ranksort = Rank,
								fightingCapacity = PForce,
								race = Race,
								sex=Sex
							},
							[RR | AccList];
						_ ->
							?ERROR_OUT("getTargetByRankList target not exist:~p", [TR]),
							AccList
					end;
				_ ->
					AccList
			end
		end,
	lists:foldl(Fun, [], RankList).

getChallengeTimesAndMoney() ->
	%% 挑战次数每日免费5次，之后收铜币3次（2W、3W、5W），最后收钻石2次（5钻、10钻），总10次
	Normal = playerDaily:getDailyCounter(?DailyType_Ladder1v1, ?DailySubType_TiaoZhan_Normal),
	Charge = playerDaily:getDailyCounter(?DailyType_Ladder1v1, ?DailySubType_TiaoZhan_Charge),

	%% 这是额外的竞技场次数
	Extras = playerVipInter:getExtraLadderNumber(),

	%% 总次数
	FreeTimeLimit = getFreeTiaoZhanTime(),
	ChargeTimeLimit = getChargetTiaoZhanTime(),
	AllTimes = FreeTimeLimit + ChargeTimeLimit + Extras,
	case Normal < FreeTimeLimit of
		true ->
			{Normal, AllTimes, 0, 0};
		_ ->
			#globalsetupCfg{setpara = MoneyList} = getCfg:getCfgPStack(cfg_globalsetup, jjc_money),
			Charge2 = Charge + 1,
			{MoneyType, Money} =
				case erlang:length(MoneyList) >= Charge2 of
					true ->
						lists:nth(Charge2, MoneyList);
					_ ->
						[Tail | _] = lists:reverse(MoneyList),
						Tail
				end,
			{Normal + Charge, AllTimes, MoneyType, Money}
	end.

updateChallengeTimes() ->
	Normal = playerDaily:getDailyCounter(?DailyType_Ladder1v1, ?DailySubType_TiaoZhan_Normal),

	case Normal < getFreeTiaoZhanTime() of
		true ->
			playerDaily:incDailyCounter(?DailyType_Ladder1v1, ?DailySubType_TiaoZhan_Normal);
		_ ->
			playerDaily:incDailyCounter(?DailyType_Ladder1v1, ?DailySubType_TiaoZhan_Charge)
	end,
	ok.

getRewardInfo(Rank) ->
	NowTime = time:getSyncTime1970FromDBS(),
	{{_Year, _Month, _Day}, {_Hour, Minute, Second}} = time:convertSec2DateTime(NowTime),
	Time = 3600 - Minute * 60 - Second,
	KeyList = getCfg:getKeyList(cfg_ladder_1v1_reward),
	case [Key || {Start, End} = Key <- KeyList, Rank >= Start andalso Rank =< End] of
		[{S, E}] ->
			#ladder_1v1_rewardCfg{normal = Normal} = getCfg:getCfgPStack(cfg_ladder_1v1_reward, S, E),
			{Time, Normal};
		Error ->
			?ERROR_OUT("getRewardInfo:rank=~p,roleid=~p,error=~p", [Rank, playerState:getRoleID(), Error]),
			{Time, 0}
	end.

getCalcRank(Rank, IsAdd, [RandStart, RandEnd], _TakeOutList) ->
	%% 这种不去重
	Rand = misc:rand(RandStart, RandEnd),
	Ret =
		case IsAdd of
			true -> Rank + Rand;
			_ -> Rank - Rand
		end,
	erlang:max(Ret, 0);
getCalcRank(Rank, _IsAdd, _, TakeOutList) ->
	L1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] -- TakeOutList,
	L2 = L1 -- [Rank],
	Len = erlang:length(L2),
	Rand = misc:rand(1, Len),
	lists:nth(Rand, L2).

-spec insertSelfToLadderList() -> #rec_ladder_1v1{} | false.
insertSelfToLadderList() ->
	#globalsetupCfg{setpara = [LvlLimit]} = getCfg:getCfgPStack(cfg_globalsetup, jjc_open),
	case playerState:getLevel() >= LvlLimit of
		true ->
			RoleID = playerState:getRoleID(),
			F =
				fun(#rec_ladder_1v1{rankSort = R}, Max) ->
					case R > Max of
						true -> R;
						_ -> Max
					end
				end,
			New = ets:foldl(F, 0, ets_rec_ladder_1v1) + 1,
			psMgr:sendMsg2PS(?PsNameLadder1v1, insertSelfToLadderList, RoleID),
			playerSevenDayAim:updateCondition(?SevenDayAim_Ranking, [New]),
			{ok,{<<"tempRecord">>,#rec_ladder_1v1{roleID = RoleID, rankSort = New, rankMin = New }}};
		_ ->
			false
	end.

-spec queryRoleLadder(RoleID :: uint64()) -> false | #rec_ladder_1v1{}.
queryRoleLadder(RoleID) ->
	Q = ets:fun2ms(
		fun(#rec_ladder_1v1{} = Ladder) when Ladder#rec_ladder_1v1.roleID =:= RoleID ->
			Ladder
		end
	),
	case ets:select(ets_rec_ladder_1v1, Q) of
		[#rec_ladder_1v1{} = Rec] -> Rec;
		_ -> false
	end.
queryMonsterPforce(MonsterID) ->
	KeyList = getCfg:getKeyList(cfg_ladder_1v1),
	queryMonsterPforce(MonsterID, KeyList).
queryMonsterPforce(_, []) ->
	0;
queryMonsterPforce(MonsterID, [{S, E} | KeyList]) ->
	case getCfg:getCfgPStack(cfg_ladder_1v1, S, E) of
		#ladder_1v1Cfg{monsterID = MonsterIDList, fc_value = [MinValue, MaxValue]} ->
			case lists:member(MonsterID, MonsterIDList) of
				true ->
					misc:rand(MinValue, MaxValue);
				_ ->
					queryMonsterPforce(MonsterID, KeyList)
			end;
		_ ->
			queryMonsterPforce(MonsterID, KeyList)
	end.

queryTargetName(RoleID)->
	queryTargetName(RoleID,<<"">>).
queryTargetName(RoleID,TargetName) ->
	case uidMgr:checkUID(?UID_TYPE_Role, RoleID) of
		true ->
			playerNameUID:getPlayerNameByUID(RoleID);
		_ ->
			TargetName
	end.

%% 检查状态和合法性
checkLadderMatchState(Rank) ->
	case ets:lookup(ets_recLadderMatchState, Rank) of
		[#recLadderMatchState{time = StartTime} = State] ->
			NowTime = time:getSyncTime1970FromDBS(),
			case NowTime - StartTime >= ?LadderMatchStateProtcetTime of
				true ->
					?ERROR_OUT("checkLadderMatchState:~p", [State]),
					ets:delete(ets_recLadderMatchState, Rank);
				_ ->
					skip
			end;
		_ ->
			skip
	end,
	ok.

clearLadderMatchState(TargetRoleID) ->
	?ERROR_OUT("clearLadderMatchState:~p,~p", [playerState:getRoleID(), TargetRoleID]),
	psMgr:sendMsg2PS(?PsNameLadder1v1, clearLadderMatchState, {TargetRoleID, ?LadderMatchStateProtcetTime}),
	ok.

%%发放排名上升奖励
rankSortRiseAward(0, NewRankSort) ->
	playerPropSync:setInt64(?SerProp_Ladder1v1BestScort, NewRankSort),
	Title = stringCfg:getString(ladder1v1_better_score_title),
	Content = stringCfg:getString(ladder1v1_better_score_context, [NewRankSort]),
	[TempCoinType, TempCoinValue] = globalCfg:getGlobalCfgList(ladder1v1FistBattleAward),
	MailCoinRecList = [#recMailCoin{coinType = TempCoinType, coinNum = TempCoinValue}],
	RoleID = playerState:getRoleID(),
	mail:sendSystemMail(RoleID, Title, Content, MailCoinRecList, 0);
rankSortRiseAward(HistoryBestRankSort, NewRankSort) when HistoryBestRankSort =< NewRankSort ->
	ok;
rankSortRiseAward(HistoryBestRankSort, NewRankSort) ->
	playerPropSync:setInt64(?SerProp_Ladder1v1BestScort, NewRankSort),
	KeyList = lists:keysort(1, getCfg:getKeyList(cfg_ladder_1v1_reward)),
	[{OldStart, OldEnd}] = [Key || {Start, End} = Key <- KeyList, (HistoryBestRankSort >= Start), (HistoryBestRankSort =< End)],
	[{NewStart, NewEnd}] = [Key || {Start, End} = Key <- KeyList, (NewRankSort >= Start), (NewRankSort =< End)],
	{_, MatchKeys1} = lists:splitwith(fun(E) -> E =/= {NewStart, NewEnd} end, KeyList),
	{MatchKeys2, _} = lists:splitwith(fun(E) -> E =/= {OldStart, OldEnd} end, MatchKeys1),
	MatchKeys3 = lists:append(MatchKeys2, [{OldStart, OldEnd}]),
	GetAwardCoin =
		fun(ValueBegin, ValueEnd, #ladder_1v1_rewardCfg{coin = [Step, ConiType, CoinValue]}, Acc) ->
%%            AwardPionts = (ValueEnd - ValueBegin) div Step,
			AwardPionts = (ValueEnd  div Step) - (ValueBegin  div Step),
			?DEBUG_OUT("---rank space-------~p~n",[{ValueEnd,ValueBegin,Step,AwardPionts , CoinValue}]),
			case lists:keyfind(ConiType, 1, Acc) of
				false ->
					[{ConiType, AwardPionts * CoinValue} | Acc];
				{ConiType, AwardCoin} ->
					lists:keystore(ConiType, 1, Acc, {ConiType, AwardCoin + AwardPionts * CoinValue})
			end
		end,
	AwardCoins = lists:foldl(
		fun({Start, End}, Acc) ->
			Ladder1V1Cfg = getCfg:getCfgByArgs(cfg_ladder_1v1_reward, Start, End),
			if
				(Start =< NewRankSort) and (HistoryBestRankSort =< End) ->%%名次提升之后在同一个奖励区间
					GetAwardCoin(NewRankSort, HistoryBestRankSort, Ladder1V1Cfg, Acc);
				(Start =< HistoryBestRankSort) and (HistoryBestRankSort =< End) ->%%名次提升已不在同一个奖励区间
					GetAwardCoin(Start,HistoryBestRankSort, Ladder1V1Cfg, Acc);
				(Start =< NewRankSort) and (NewRankSort =< End) ->%%名次提升已不在同一个奖励区间
					GetAwardCoin(NewRankSort,End, Ladder1V1Cfg, Acc);
				true ->%%名次提升已不在同一个奖励区间，中间区间奖励
					GetAwardCoin(Start, End, Ladder1V1Cfg, Acc)
			end
		end, [], MatchKeys3),
	Title = stringCfg:getString(ladder1v1_better_score_title),
	Content = stringCfg:getString(ladder1v1_better_score_context, [NewRankSort]),
	MailCoinRecList = [#recMailCoin{coinType = TempCoinType, coinNum = TempCoinValue} || {TempCoinType, TempCoinValue} <- AwardCoins,TempCoinValue>0],
	RoleID = playerState:getRoleID(),
	if
		length(MailCoinRecList) > 0 ->
			mail:sendSystemMail(RoleID, Title, Content, MailCoinRecList, 0);
		true ->
			skip
	end.


getFreeTiaoZhanTime()->
	case getCfg:getCfgByArgs(cfg_globalsetup, jjc_1v1_freetimes) of
		#globalsetupCfg{setpara = [V]} -> V;
		_ -> ?Max_TiaoZhan_Normal
	end.



getChargetTiaoZhanTime()->
	case getCfg:getCfgByArgs(cfg_globalsetup, jjc_money) of
		#globalsetupCfg{setpara = V} -> length(V);
		_ -> ?Max_TiaoZhan_Charge
	end.