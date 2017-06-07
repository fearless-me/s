%%
%% @author luowei
%% @doc @todo 玩家宠物PvE


-module(playerPetPvE).
-author(luowei).


-define(MaxPhy,		100).	%%最大体力
-define(RestorePhy,	1).		%%每次恢复体力数量
-define(PurcPhy,	50).	%%每次购买增加体力
-define(OneScore,	1).
-define(TwoScore,	2).
-define(ThreeScore, 3).
-define(SweepNum,	10).		%%副本扫荡最低次数
-include("playerPrivate.hrl").

%% ====================================================================
%% API functions
%% ====================================================================
-export([
	initPetPveSys/0,
	initPetPveList/0,
	initPetPveInfo/0,

	petPveSweep/1,
	petPvePhys/0,
	petPvePos/1,
	petPveReward/0,
	petPveBattle/1,
	petPveOffline/0,
	petPvetickPhys/0,
	petPveEndBattle/4,

	savePetDunInfoAndScore/0
]).

-export([
	gmAddPhys/1,
	gmPassDun/1
]).

%%根据配置表初始化
%%初始化宠物远征系统
-spec initPetPveSys() -> ok.
initPetPveSys() -> 
	DunInfo = #rec_pet_dungeon_info{
		dungeon_ID = 1,
		pet_pos = [0,0,0,0,0],
		pet_phys = ?MaxPhy,
		roleID = playerState:getRoleID()
	},
	savePetDunInfoToMem(DunInfo),
	savePetDunInfoToDb(DunInfo).

%%宠物远征列表
-spec initPetPveList() -> ok.
initPetPveList() ->
	sendPveListToClient(playerState:getPetDunScoreList()).

%%宠物远征信息
-spec initPetPveInfo() -> ok.
initPetPveInfo() ->
	initPetPveInfo(playerState:getPetDunInfo()).
initPetPveInfo(#rec_pet_dungeon_info{
		pet_phys = Phys,
		time = Time,
		pet_pos = Pos,
		pet_reward = Reward
	} = DunInfo) ->
	NewPhys = petPveOfflinePhys(Phys, Time),
	NewDunInfo = DunInfo#rec_pet_dungeon_info{
		pet_phys = NewPhys
	},
	savePetDunInfoToMem(NewDunInfo),
	NewPos = checkPos(NewDunInfo, Pos),
	sendPvePosToClient(NewPos),
	sendPvePhysToClient(NewPhys),
	sendPveRewardToClient(Reward);
initPetPveInfo(_) ->
	initPetPveSys(),
	DunInfo = #rec_pet_dungeon_info{} = playerState:getPetDunInfo(),
	initPetPveInfo(DunInfo).

%%临时校验,
checkPos(DunInfo, Pos) ->
	case length(Pos) > 5 of
		true ->
			NewPos = lists:delete(lists:last(Pos), Pos),
			NewDunInfo = DunInfo#rec_pet_dungeon_info{
													  pet_pos = NewPos
													 },
			savePetDunInfoToDb(NewDunInfo),
			savePetDunInfoToMem(NewDunInfo),
			NewPos;
		_ ->
			Pos
	end.

%%宠物远征tick宠物体力
-spec petPvetickPhys() -> ok.
petPvetickPhys() ->
	DunInfo = playerState:getPetDunInfo(),
	petPveTickPhys(DunInfo).
petPveTickPhys(#rec_pet_dungeon_info{pet_phys = Phys} = DunInfo) when Phys < ?MaxPhy ->
	case (Phys + ?RestorePhy) >= ?MaxPhy of
		true ->
			NewPhy = ?MaxPhy;
		_ ->
			NewPhy = Phys + ?RestorePhy
	end,
	NewDunInfo = DunInfo#rec_pet_dungeon_info{pet_phys = NewPhy},
	savePetDunInfoToDb(NewDunInfo),
	savePetDunInfoToMem(NewDunInfo),
	sendPvePhysToClient(NewPhy);
petPveTickPhys(_) ->
	ok.

%%宠物远征下线保存时间
-spec petPveOffline() -> ok.
petPveOffline() ->
	case playerState:getPetDunInfo() of
		#rec_pet_dungeon_info{} = DunInfo ->
			NewDunInfo = DunInfo#rec_pet_dungeon_info{
				time = time:getUTCNowMS()
			},
			savePetDunInfoToDb(NewDunInfo),
			savePetDunInfoToMem(NewDunInfo);
		_ ->
			skip
	end.

%%宠物远征离线体力
petPveOfflinePhys(Phys, _Time) when Phys >= ?MaxPhy ->
	Phys;
petPveOfflinePhys(Phys, Time) ->
	Num = trunc((time:getUTCNowMS() - Time) / globalCfg:getPetWarTickTime()),
	case (Phys + Num * ?RestorePhy) > ?MaxPhy of
		true ->
			?MaxPhy;
		_ ->
			Phys + Num * ?RestorePhy
	end.

%%宠物远征扫荡
-spec petPveSweep(DunID::uint()) -> ok.
petPveSweep(DunID) ->
	case canSweepDun(DunID) of
		true ->
			#petWarCfg{
				dorpid = DropID,
				exp = Exp,
				cost = Cost,
				money = Money
				} = getCfg:getCfgPStack(cfg_petWar, DunID),
			Fun = fun(Num, Acc) ->
				ItemList = 
					case playerDrop:goodsDrop(DropID, DunID, ?ItemSourcePetPveSweep ) of
						[{_, [#rec_item{}| _]}| _] = DropItemList ->
							[#pk_PveItem{id = ItemID,num = DropNum} ||
								{DropNum,[#rec_item{itemID = ItemID} | _]} <- DropItemList,DropNum>0];
						_ ->
							[]
					end,
				[#pk_PveSweep{
					num = Num,
					exp = Exp,
					coin = Money,
					itemList = ItemList
				} | Acc]
			end,
			L = lists:foldl(Fun, [], lists:seq(1, ?SweepNum)),
			true = playerBase:addExp(Exp * ?SweepNum, ?ExpSourcePetPve, DunID),
			true = playerMoney:addCoin(?CoinTypeGold, Money * ?SweepNum,
						#recPLogTSMoney{
							reason=?CoinSourcePetPveSweep,
							param=DunID,
							target=?PLogTS_PlayerSelf,
							source=?PLogTS_PetPve
						}),
			#rec_pet_dungeon_info{
				pet_phys = Phys
			} = DunInfo = playerState:getPetDunInfo(),
			NewDunInfo = DunInfo#rec_pet_dungeon_info{
				pet_phys = Phys - Cost * ?SweepNum
			},
			Msg = #pk_GS2U_PetPveSweepAck{
				sweepList = L
			},
			savePetDunInfoToDb(NewDunInfo),
			savePetDunInfoToMem(NewDunInfo),
			sendPveBattleSweepToClient(Msg),
			sendPvePhysToClient(Phys - Cost * ?SweepNum);
		Error ->
			playerMsg:sendErrorCodeMsg(Error)
	end.

%%宠物远征卷购买
-spec petPvePhys() -> ok.
petPvePhys() ->
	case checkPurcNum() of
		false ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_PvePet_Not_Purc_Num);
		_ ->
			PurcNumList = globalCfg:getPetWarPurDiamond(),
			CurPurcNum = playerDaily:getDailyCounter(?DailyType_PetPvePurc, 0),	
			NeedDiamond = lists:nth(CurPurcNum + 1, PurcNumList),
			case playerMoney:canUseCoin(?CoinUseTypeDiamond, NeedDiamond) of
				false ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_PvePet_Not_Purc_Diamond);
				_ ->
					playerMoney:useCoin(?CoinUseTypeDiamond, NeedDiamond,
						#recPLogTSMoney{reason=?CoinUsePetPvePhy, param= 0, target=?PLogTS_PetPve,source=?PLogTS_PlayerSelf}),
					#rec_pet_dungeon_info{pet_phys = Phys} = DunInfo = playerState:getPetDunInfo(),
					NewDunInfo = DunInfo#rec_pet_dungeon_info{pet_phys = Phys + ?PurcPhy},
					playerDaily:incDailyCounter(?DailyType_PetPvePurc, 0),
					savePetDunInfoToDb(NewDunInfo),
					savePetDunInfoToMem(NewDunInfo),
					playerMsg:sendErrorCodeMsg(?ErrorCode_PvePet_Purc_Succ),
					sendPvePhysToClient(Phys + ?PurcPhy)
			end
	end.

%%宠物远征位置调整
-spec petPvePos(PosList::list()) -> ok.
petPvePos(PosList) when is_list(PosList) andalso length(PosList) =:= 5 andalso PosList =/= [0,0,0,0,0] ->
	petPvePos(PosList, []);
petPvePos(PosList) when is_list(PosList) andalso length(PosList) =:= 6 ->
	?ERROR_OUT("pet pve pos error:playerID :[~p], posList [~p]", [playerState:getRoleID(), PosList]),
	petPvePos(lists:delete(lists:last(PosList), PosList), []);
petPvePos(PosList) ->
	?ERROR_OUT("pet pve pos error:playerID :[~p], posList [~p]", [playerState:getRoleID(), PosList]).

petPvePos([], PosList) ->
	DunInfo = playerState:getPetDunInfo(),
	NewDunInfo = DunInfo#rec_pet_dungeon_info{
		pet_pos = lists:reverse(PosList)
	},
	savePetDunInfoToDb(NewDunInfo),
	savePetDunInfoToMem(NewDunInfo),
	sendPvePosToClient(lists:reverse(PosList));
petPvePos([PetID | List], Pos) ->
	case checkDunPetIsRepeat(PetID, List ++ Pos) of
		false ->
			case checkDunPetIsExist(PetID) of
				true ->
					petPvePos(List, [PetID | Pos]);
				_ ->
					playerMsg:sendErrorCodeMsg(?ErrorCode_PvePet_Not_Exist)
			end;
		true ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_PvePet_Not_Repeat)
	end.

%%宠物远征战斗
-spec petPveBattle(DunID::uint()) -> ok.
petPveBattle(DunID) ->
	case canDunBattle(DunID) of
		{Pl, Ml, TrunNum} ->
			Lv = playerState:getLevel(),
			PetList = playerState:getPets(),
			EquipList = playerState:getPetEquip(),
			playerState:setTurnBattleData([]),
			playerState:setTurnBattleAck(undefined),
			NewPl = playerTurnBattle:initPetPos(Pl, PetList),
			NewMl = playerTurnBattle:initMonsterPos(Ml),
			Aers = playerTurnBattle:initBattle(?PetBattle, ?AerRole, Lv, EquipList, NewPl),
			Ders = playerTurnBattle:initBattle(?MonsterBattle, ?DerRole, 0, [], NewMl),
			Orders = playerTurnBattle:initBattleOrder(Aers ++ Ders),
			playerTurnBattle:sendInitBattleListToClient(Orders),
			{Res, CurAers, Al, BT, _} = playerTurnBattle:startBattle(?BattlePve, 0, Aers, Ders, Orders, TrunNum),
			BattleAck = #rec_battle_ack{
				dunID = DunID,
				res = Res,
				type = BT,
				oldAers = Aers,
				oldDers = [],
				curAers = CurAers,
				curDers = []
			},
			playerState:setTurnBattleAck(BattleAck),
			playerState:setTurnBattleData(lists:reverse(Al)),
			playerSevenDays:onMissionEvent(?SevenDayMission_Event_2, 1, 0);
		Error ->
			playerMsg:sendErrorCodeMsg(Error)
	end.

%%宠物远征战斗结束
petPveEndBattle(?BattleWin, DunID, Ntl, Tl) ->
	#petWarCfg{
		nextid = NextID,
		exp = Exp,
		cost = Cost,
		money = Money,
		dorpid = DropID
	} = getCfg:getCfgPStack(cfg_petWar, DunID),
	if
		Tl - Ntl =:= 0 ->
			Score = ?ThreeScore;
		Tl - Ntl =:= 1 ->
			Score = ?TwoScore;
		true ->
			Score = ?OneScore
	end,
	DunInfo = playerState:getPetDunInfo(),
	ScoreList = playerState:getPetDunScoreList(),
	NewPhys = DunInfo#rec_pet_dungeon_info.pet_phys - Cost,
	case lists:keyfind(DunID, #rec_pet_dungeon_score.dungeon_ID, ScoreList) of
		false ->
			NewDunInfo = DunInfo#rec_pet_dungeon_info{
				pet_phys = NewPhys,
				dungeon_ID = NextID
			};
		_ ->
			NewDunInfo = DunInfo#rec_pet_dungeon_info{
				pet_phys = NewPhys
			}
	end,
	NewDunScore = #rec_pet_dungeon_score{
		roleID = playerState:getRoleID(),
		dungeon_ID = DunID,
		dungeon_score = Score
	},
	ItemList = 
	case playerDrop:goodsDrop(DropID, DunID, ?ItemSourcePetPveOver ) of
		[{_, [#rec_item{}| _]}| _] = DropItemList ->
			[#pk_PveItem{id = ItemID,num = DropNum} ||
					{DropNum,[#rec_item{itemID = ItemID} | _]} <- DropItemList];
		_ ->
			[]
	end,
	true = playerBase:addExp(Exp, ?ExpSourcePetPve, DunID),
	true = playerMoney:addCoin(?CoinTypeGold, Money,
			#recPLogTSMoney{reason=?CoinSourcePetPveSweep,param=DunID,target=?PLogTS_PlayerSelf,source=?PLogTS_PetPve}),
	ResAck = #pk_GS2U_PVEBattleResult{
		coin = Money,
		exp = Exp,
		itemList = ItemList,
		res = ?BattleWin,
		score = Score
	},
	%%加钱加经验
	savePetDunInfoToDb(NewDunInfo),
	savePetDunInfoToMem(NewDunInfo),
	savePetDunScoreToDb(NewDunScore),
	savePetDunScoreToMem(NewDunScore),
	sendPvePhysToClient(NewPhys),
	sendPveListToClient([NewDunScore]),
	sendPveBattleResToClient(ResAck),
	ok;
petPveEndBattle(_, DunID, _, _) ->
	#petWarCfg{
		cost = Cost
	} = getCfg:getCfgPStack(cfg_petWar, DunID),
	DunInfo = playerState:getPetDunInfo(),
	NewPhys = DunInfo#rec_pet_dungeon_info.pet_phys - Cost,
	NewDunInfo = DunInfo#rec_pet_dungeon_info{
		pet_phys = NewPhys
	},
	ResAck = #pk_GS2U_PVEBattleResult{
		coin = 0,
		exp = 0,
		itemList = [],
		res = ?BattleFailed,
		score = 0
	},
	savePetDunInfoToDb(NewDunInfo),
	savePetDunInfoToMem(NewDunInfo),
	sendPvePhysToClient(NewPhys),
	sendPveBattleResToClient(ResAck).
%% petPveEndBattle(_, _, _, _) ->
%% 	?ERROR_OUT("pve can't battle draw"),
%% 	ok.

%%宠物远征奖励领取
petPveReward() ->
	case checkDunIsReward() of
		false ->
			playerMsg:sendErrorCodeMsg(?ErrorCode_PvePet_Not_Star);
		DiamondNum ->
			playerMoney:addCoin(?CoinTypeBindDiamond, DiamondNum,
				#recPLogTSMoney{reason = ?CoinSourcePetPveStar, param = 0, target = ?PLogTS_PlayerSelf, source = ?PLogTS_PetPve}),
			#rec_pet_dungeon_info{
		 		pet_reward = ID
			} = DunInfo = playerState:getPetDunInfo(),
			NewDunInfo = DunInfo#rec_pet_dungeon_info{pet_reward = ID + 1},
			savePetDunInfoToDb(NewDunInfo),
			savePetDunInfoToMem(NewDunInfo),
			sendPveRewardToClient(ID + 1)
	end,
	ok.

gmAddPhys(Phys) ->
	#rec_pet_dungeon_info{
		pet_phys = OldPhys
	} = DunInfo = playerState:getPetDunInfo(),
	CurPhys = OldPhys + Phys,
	NewDunInfo = DunInfo#rec_pet_dungeon_info{
		pet_phys = OldPhys + Phys
	},
	savePetDunInfoToDb(NewDunInfo),
	savePetDunInfoToMem(NewDunInfo),
	sendPvePhysToClient(CurPhys).

gmPassDun(DunID) ->
	CL = getCfg:getAllCfg(cfg_petWar),
	Fun = fun(#petWarCfg{id = ID}, Acc) ->
		case ID =< DunID of
			true ->
				DunScore = #rec_pet_dungeon_score{
					roleID = playerState:getRoleID(),
					dungeon_ID = ID,
					dungeon_score = 3
				},
				[DunScore | Acc];
			_ ->
				Acc
		end
	end,
	L = lists:foldl(Fun, [], CL),
	playerState:setPetDunScoreList(L),
	Fun1 = fun(#rec_pet_dungeon_score{} = H) ->
		savePetDunScoreToDb(H)
	end,
	lists:foreach(Fun1, L),
	sendPveListToClient(L).
%% ====================================================================
%% Internal functions
%% ====================================================================
%% 统一保存远征信息与积分
-spec savePetDunInfoAndScore() -> ok.
savePetDunInfoAndScore() ->
	case playerState:getIsPlayer() of
		true ->
			case playerState:getPetDunInfo() of
				#rec_pet_dungeon_info{} = DunInfo ->
					playerSave:savePetDunInfo(DunInfo);
				_ ->
					skip
			end,

			L = playerState:getPetDunScoreList(),
%%			[playerSave:savePetDunScore(DunScore) || DunScore <- L],
			playerSave:savePetDunScore(L),
			ok;
		_ ->
			skip
	end,
	ok.

-spec savePetDunInfoToMem(#rec_pet_dungeon_info{}) -> ok.
savePetDunInfoToMem(#rec_pet_dungeon_info{} = Info) -> 
	playerState:setPetDunInfo(Info).

-spec savePetDunInfoToDb(#rec_pet_dungeon_info{}) -> ok.
savePetDunInfoToDb(#rec_pet_dungeon_info{}) ->
%%	playerSave:savePetDunInfo(DunInfo).
	ok.

-spec savePetDunScoreToMem(#rec_pet_dungeon_score{}) -> ok.
savePetDunScoreToMem(#rec_pet_dungeon_score{dungeon_ID = ID} = DunScore) ->
	L = playerState:getPetDunScoreList(),
	NL = lists:keystore(ID, #rec_pet_dungeon_score.dungeon_ID, L, DunScore),
	playerState:setPetDunScoreList(NL).

-spec savePetDunScoreToDb(#rec_pet_dungeon_score{}) -> ok.
savePetDunScoreToDb(#rec_pet_dungeon_score{}) ->
%%	playerSave:savePetDunScore(DunScore).
	ok.

-spec canDunBattle(DunID::uint()) -> {list(), list(), uint()} | uint().
canDunBattle(DunID) ->
	case checkDunIsOpen(DunID) of
		true ->
			case checkDunPetIsBattle() of
				false ->
					?ErrorCode_PvePet_Not_Battle;
				Pl ->
					case checkDunMonsterIsBattle(DunID) of
						false ->
							?ErrorCode_PvePet_Not_BattleMonster;
						{Ml, TurnNum} ->
							case checkDunPhysIsEnough(DunID) of
								false ->
									?ErrorCode_PvePet_Not_Phys;
								true ->
									{Pl, Ml, TurnNum}
							end
					end
			end;
		_ ->
			?ErrorCode_PvePet_Not_Open
	end.

-spec canSweepDun(DunID::uint()) -> uint() | true.
canSweepDun(DunID) ->
	case checkDunSweepIsOver(DunID) of
		#rec_pet_dungeon_score{} = DunScore ->
			case checkDunSweepIsThreeScore(DunScore) of
				false ->
					?ErrorCode_PvePet_Not_Sweep_Score;
				_ ->
					case checkSweepDunPhysIsEnough(DunID) of
						true ->
							case isPackageIdle() of
								true ->
									true;
								_ ->
									?ErrorCode_WarriorTrialBagIsAmostFullGeneral
							end;
						_ ->
							?ErrorCode_PvePet_Not_Phys
					end
			end;
		false ->
			?ErrorCode_PvePet_Not_Sweep_Pass
	end.

-spec isPackageIdle() ->boolean().
isPackageIdle() ->
	playerPackage:getBagIdleSlotNum(?Item_Location_Bag) >= 5 andalso
		playerPackage:getBagIdleSlotNum(?Item_Location_Equip_Bag) >= 5 andalso
		playerPackage:getBagIdleSlotNum(?Item_Location_Gem_Bag) >= 5.

%%获取星星数量
-spec getStarNum() -> uint().
getStarNum() ->
	L = playerState:getPetDunScoreList(),
	Fun = fun(#rec_pet_dungeon_score{
		dungeon_score = Score}, Acc) ->
		Score + Acc
	end,
	lists:foldl(Fun, 0, L).

%%检查宠物是否已经获取
-spec checkDunPetIsExist(PetID::uint()) -> boolean().
checkDunPetIsExist(0) ->
	true;
checkDunPetIsExist(PetID) ->
	Pets = playerState:getPets(),
	case lists:keyfind(PetID, #recPetInfo.pet_id, Pets) of
		false ->
			false;
		_ ->
			true
	end.

%%检查宠物是否重复出战
-spec checkDunPetIsRepeat(PetID::uint(), L::list()) -> boolean().
checkDunPetIsRepeat(0, _) ->
	false;
checkDunPetIsRepeat(ID, L) ->
	lists:member(ID, L).

%%检查章节是否开启,或者已经完成过
-spec checkDunIsOpen(DunID::uint()) -> boolean().
checkDunIsOpen(DunID) ->
	L = playerState:getPetDunScoreList(),
	IsDungeonScore = 
	case lists:keyfind(DunID, #rec_pet_dungeon_score.dungeon_ID, L) of
		false ->
			false;
		_ ->
			true
	end,
	case IsDungeonScore of
		false ->
			PlayerID = playerState:getRoleID(), %%解决A5服务器回档导致数据错乱的问题
			case lists:member(PlayerID, getIDList()) of
				true ->
					true;
				_ ->
					case getMaxDunID(L) + 1 =:= DunID of
						true ->
							true;
						_ ->
							false
					end
%% 					case playerState:getPetDunInfo() of
%% 						#rec_pet_dungeon_info{dungeon_ID = DunID} ->
%% 							true;
%% 						_Error ->
%% 							false
%% 					end
			end;
		_ ->
			true
	end.

getMaxDunID(L) ->
	getMaxDunID(L, 0).

getMaxDunID([], Num) ->
	Num;
getMaxDunID([#rec_pet_dungeon_score{dungeon_ID = ID} | L], Num) when ID > Num ->
	getMaxDunID(L, ID);
getMaxDunID([_ | L], Num) ->
	getMaxDunID(L, Num).


%%检查副本是否有怪物
-spec checkDunMonsterIsBattle(DunID::uint()) -> false | {list(), uint()}.
checkDunMonsterIsBattle(DunID) ->
	#petWarCfg{
			   roundoff = RoundOff,
			   monster = Monster
			  } = getCfg:getCfgPStack(cfg_petWar, DunID),
	case Monster of
		[0,0,0,0,0] ->
			false;
		_ ->
			{Monster,RoundOff}
	end.

%%检查是否有出战宠物
-spec checkDunPetIsBattle() -> false | list().
checkDunPetIsBattle() ->
	case playerState:getPetDunInfo() of
		#rec_pet_dungeon_info{pet_pos = Pos} when Pos =/= [0,0,0,0,0] ->
			Pos;
		_ ->
			false
	end.

%%检查体力值是否足够
-spec checkDunPhysIsEnough(DunID::uint()) -> boolean().
checkDunPhysIsEnough(DunID) ->
	#petWarCfg{
		cost = Cost
	} = getCfg:getCfgPStack(cfg_petWar, DunID),
	#rec_pet_dungeon_info{
		pet_phys = Phys
	} = playerState:getPetDunInfo(),
	case Phys >= Cost of
		true ->
			true;
		_ ->
			false
	end.

-spec checkSweepDunPhysIsEnough(DunID::uint()) -> boolean().
checkSweepDunPhysIsEnough(DunID) ->
	#petWarCfg{
		cost = Cost
	} = getCfg:getCfgPStack(cfg_petWar, DunID),
	#rec_pet_dungeon_info{
		pet_phys = Phys
	} = playerState:getPetDunInfo(),
	case Phys >= Cost * ?SweepNum of
		true ->
			true;
		_ ->
			false
	end.

%%检查购买次数
-spec checkPurcNum() -> boolean().
checkPurcNum() ->
	VipLv = playerState:getVip(),
	VipList = globalCfg:getPetWarAddTimes(),
	CurPurcNum = playerDaily:getDailyCounter(?DailyType_PetPvePurc, 0),
	case lists:keyfind(VipLv, 1, VipList) of
		false ->
			MaxPurc = 0;
		{VipLv, Num} ->
			MaxPurc = Num
	end,
	case CurPurcNum >= MaxPurc of
		true ->
			false;
		_ ->
			true
	end.

%%检查扫荡副本是否通关
-spec checkDunSweepIsOver(DunID::uint()) -> false | #rec_pet_dungeon_score{}.
checkDunSweepIsOver(DunID) -> 
	L = playerState:getPetDunScoreList(),
	case lists:keyfind(DunID, #rec_pet_dungeon_score.dungeon_ID, L) of
		#rec_pet_dungeon_score{} = DunScore ->
			DunScore;
		_ ->
			false
	end.

%%检查扫荡副本是否达到3星
-spec checkDunSweepIsThreeScore(DunScore::#rec_pet_dungeon_score{}) -> boolean().
checkDunSweepIsThreeScore(#rec_pet_dungeon_score{dungeon_score = Score}) when Score =:= ?ThreeScore ->
	true;
checkDunSweepIsThreeScore(_) ->
	false.

%%检查是否可以领奖
-spec checkDunIsReward() -> false | uint().
checkDunIsReward() ->
	#rec_pet_dungeon_info{
		 pet_reward = ID
	} = playerState:getPetDunInfo(),
	RL = globalCfg:getPetWarStarReward(),
	case ID + 1 > length(RL) of
		false ->
			StarNum = getStarNum(),
			{NeedStar, RewardNum} = lists:nth(ID + 1, RL),
			case StarNum>= NeedStar of
				true ->
					RewardNum;
				_ ->
					false
			end;
		_ ->
			false
	end.
	

%%发送章节列表
-spec sendPveListToClient(List::[#rec_pet_dungeon_score{}, ...]) -> ok.
sendPveListToClient(L) ->
	sendPveListToClient(L, []).
sendPveListToClient([], SL) ->
	CL = #pk_GS2U_UpdateCatalogList{
		catalogList = SL
	},
	playerMsg:sendNetMsg(CL);
sendPveListToClient([#rec_pet_dungeon_score{dungeon_ID = ID, dungeon_score = Score} | L], SL) ->
	Node = #pk_CatalogNode{
		id = ID,
		starLevel = Score
	},
	sendPveListToClient(L, [Node | SL]).

%%发送章节
%% -spec sendPveToClient(Score::#rec_pet_dungeon_score{}) -> ok.
%% sendPveToClient(#rec_pet_dungeon_score{dungeon_ID = ID, dungeon_score = Score}) ->
%% 	Node = #pk_CatalogNode{
%% 		id = ID,
%% 		starLevel = Score	   
%% 	},
%% 	L = #pk_GS2U_UpdateCatalogOne{
%% 		catalogOne = Node
%% 	},
%% 	playerMsg:sendNetMsg(L).

%%发送领奖阶段
-spec sendPveRewardToClient(Reward::uint()) -> ok.
sendPveRewardToClient(Reward) ->
	R = #pk_GS2U_AckRewardLevel{
		rewardLevel = Reward
	},
	playerMsg:sendNetMsg(R).

%%发送体力
-spec sendPvePhysToClient(Phys::uint()) -> ok.
sendPvePhysToClient(Phys) ->
	P = #pk_GS2U_UpdatePower{
		power = Phys
	},
	playerMsg:sendNetMsg(P).

%%发送位置
-spec sendPvePosToClient(Pos::list()) -> ok.
sendPvePosToClient(Pos) ->
	P = #pk_GS2U_AckStandSort{
		petList = Pos
	},
	playerMsg:sendNetMsg(P).

%%发送战斗结果
-spec sendPveBattleResToClient(Msg::tuple()) -> ok.
sendPveBattleResToClient(Msg) ->
	playerMsg:sendNetMsg(Msg).

%%发送副本扫荡结果
-spec sendPveBattleSweepToClient(Msg::tuple()) -> ok.
sendPveBattleSweepToClient(Msg) ->
	playerMsg:sendNetMsg(Msg).


getIDList() ->
	[
	145496174680366244,
	145496174680366250,
	145496174680366276,
	145496174680366311,
	145496174680366328,
	149190533749678046,
	149190533749679145,
	149190533749679375,
	149331271238025437,
	149612746214735883,
	149612746214759170,
	149612746214759530,
	149472008726382498
	].

